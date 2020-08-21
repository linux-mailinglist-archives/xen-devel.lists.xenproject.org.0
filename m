Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A111624D1A5
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 11:42:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k93Y5-00042p-AH; Fri, 21 Aug 2020 09:41:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1G8h=B7=leiner.me=simon@srs-us1.protection.inumbo.net>)
 id 1k93Y3-00042k-6W
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 09:41:23 +0000
X-Inumbo-ID: d71e7f82-d47b-4413-b0fb-b92491a99288
Received: from mx2.mailbox.org (unknown [2001:67c:2050:104:0:2:25:2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d71e7f82-d47b-4413-b0fb-b92491a99288;
 Fri, 21 Aug 2020 09:41:21 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id C8FEBA11C8;
 Fri, 21 Aug 2020 11:41:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id lIqRlQeF1nqh; Fri, 21 Aug 2020 11:41:16 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [Linux] [ARM] Granting memory obtained from the DMA API
From: Simon Leiner <simon@leiner.me>
In-Reply-To: <alpine.DEB.2.21.2008201120260.6005@sstabellini-ThinkPad-T480s>
Date: Fri, 21 Aug 2020 11:41:15 +0200
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <025BF4BE-5932-4589-8083-874AE9B1F112@leiner.me>
References: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
 <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
 <alpine.DEB.2.21.2008201120260.6005@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -2.71 / 15.00 / 15.00
X-Rspamd-Queue-Id: 39A7468C
X-Rspamd-UID: 124109
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.08.20 20:35, Stefano Stabellini wrote:
> Thank for the well-written analysis of the problem. The following=20
should
> work to translate the virtual address properly in xenbus_grant_ring:
>=20
> 	if (is_vmalloc_addr(vaddr))
> 		page =3D vmalloc_to_page(vaddr);
> 	else
> 		page =3D virt_to_page(vaddr);

Great idea, thanks! I modified it lightly (see below) and it did indeed=20=

work! I'm wondering though whether the check for vmalloc'd addresses=20
should be included directly in the ARM implementation of virt_to_gfn.=20
As far as I see, this should not break anything, but might impose a=20
small performance overhead in cases where it is known for sure that we=20=

are dealing with directly mapped memory. What do you think?

diff --git a/drivers/xen/xenbus/xenbus_client.c =
b/drivers/xen/xenbus/xenbus_client.c
index e17ca8156171..d7a97f946f2f 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -344,6 +344,21 @@ static void xenbus_switch_fatal(struct =
xenbus_device *dev, int depth, int err,
        __xenbus_switch_state(dev, XenbusStateClosing, 1);
 }
=20
+/**
+ * vaddr_to_gfn
+ * @vaddr: any virtual address
+ *=20
+ * Returns the guest frame number (GFN) corresponding to vaddr.
+ */
+static inline unsigned long vaddr_to_gfn(void *vaddr)
+{
+   if (is_vmalloc_addr(vaddr)) {
+       return pfn_to_gfn(vmalloc_to_pfn(vaddr));
+   } else {
+       return virt_to_gfn(vaddr);
+   }
+}
+
 /**
  * xenbus_grant_ring
  * @dev: xenbus device
@@ -364,7 +379,7 @@ int xenbus_grant_ring(struct xenbus_device *dev, =
void *vaddr,
=20
    for (i =3D 0; i < nr_pages; i++) {
        err =3D gnttab_grant_foreign_access(dev->otherend_id,
-                         virt_to_gfn(vaddr), 0);
+                         vaddr_to_gfn(vaddr), 0);
        if (err < 0) {
            xenbus_dev_fatal(dev, err,
                     "granting access to ring page");=


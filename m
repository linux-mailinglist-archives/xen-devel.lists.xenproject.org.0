Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3440D82E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 13:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188384.337530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQpJN-0005s8-E8; Thu, 16 Sep 2021 11:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188384.337530; Thu, 16 Sep 2021 11:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQpJN-0005qL-Ai; Thu, 16 Sep 2021 11:12:13 +0000
Received: by outflank-mailman (input) for mailman id 188384;
 Thu, 16 Sep 2021 11:12:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=20iF=OG=yandex.ru=isaikin-dmitry@srs-us1.protection.inumbo.net>)
 id 1mQpJL-0005qF-Ix
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 11:12:11 +0000
Received: from forward106p.mail.yandex.net (unknown
 [2a02:6b8:0:1472:2741:0:8b7:109])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffb8fef8-b56c-440d-bcee-389cc3e980f1;
 Thu, 16 Sep 2021 11:12:08 +0000 (UTC)
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
 by forward106p.mail.yandex.net (Yandex) with ESMTP id 48A712FC32D3;
 Thu, 16 Sep 2021 14:10:38 +0300 (MSK)
Received: from vla1-8702476f8304.qloud-c.yandex.net
 (vla1-8702476f8304.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:39a2:0:640:8702:476f])
 by forward102q.mail.yandex.net (Yandex) with ESMTP id 45A36BF0000A;
 Thu, 16 Sep 2021 14:10:38 +0300 (MSK)
Received: from vla5-445dc1c4c112.qloud-c.yandex.net
 (vla5-445dc1c4c112.qloud-c.yandex.net [2a02:6b8:c18:3609:0:640:445d:c1c4])
 by vla1-8702476f8304.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 shEebEo6nI-AbDGmBu5; Thu, 16 Sep 2021 14:10:38 +0300
Received: by vla5-445dc1c4c112.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id sXIilujlv4-AZWiLChk; Thu, 16 Sep 2021 14:10:36 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ffb8fef8-b56c-440d-bcee-389cc3e980f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1631790638;
	bh=/ZV8AJQIrX7okcF2tddbAPz58I7WXDgYFEPO9SunjtQ=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=l9N/aDMdyJTI+rplM3AxPzMQ068qAgD8ghwfTr3fdQBsPe7jaGi2uwh8Sb+I+mkBl
	 G96e/gxvDvi1xBEe2+hruDIRQHAC8cpTxphHsGOML2lcWhAWzRCO7sUXjhfYpxQZJ1
	 iTgXEO2knWkt6OfDiQIhapbEHi1ZxWoFoA+hAHgE=
Authentication-Results: vla1-8702476f8304.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
To: xen-devel@lists.xenproject.org
Cc: Dmitry Isaykin <isaikin-dmitry@yandex.ru>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] domctl: hold domctl lock while domain is destroyed
Date: Thu, 16 Sep 2021 14:10:03 +0300
Message-Id: <2e7044de3cd8a6768a20250e61fe262f3a018724.1631790362.git.isaikin-dmitry@yandex.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>

This significantly speeds up concurrent destruction of multiple domains on x86.

I identify the place taking the most time:

    do_domctl(case XEN_DOMCTL_destroydomain)
      -> domain_kill()
           -> domain_relinquish_resources()
                -> relinquish_memory(d, &d->page_list, PGT_l4_page_table)

My reference setup: Intel(R) Xeon(R) CPU E5-2680 v4 @ 2.40GHz, Xen 4.14.

I use this command for test:

    for i in $(seq 1 5) ; do xl destroy test-vm-${i} & done

Without holding the lock all calls of `relinquish_memory(d, &d->page_list, PGT_l4_page_table)`
took on my setup (for HVM with 2GB of memory) about 3 seconds for each destroying domain.

With holding the lock it took only 100 ms.

Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
---
 xen/common/domctl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 12d6144d28..b9a50d3e5d 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -497,14 +497,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 
     case XEN_DOMCTL_destroydomain:
-        domctl_lock_release();
         domain_lock(d);
         ret = domain_kill(d);
         domain_unlock(d);
         if ( ret == -ERESTART )
             ret = hypercall_create_continuation(
                 __HYPERVISOR_domctl, "h", u_domctl);
-        goto domctl_out_unlock_domonly;
+        break;
 
     case XEN_DOMCTL_setnodeaffinity:
     {
-- 
2.33.0



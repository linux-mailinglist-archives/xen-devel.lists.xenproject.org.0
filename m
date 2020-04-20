Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F95E1B047C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 10:33:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQRrG-00076P-ID; Mon, 20 Apr 2020 08:32:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7yY/=6E=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jQRrE-00076K-UC
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 08:32:48 +0000
X-Inumbo-ID: 82c47a3f-82e1-11ea-903c-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 82c47a3f-82e1-11ea-903c-12813bfff9fa;
 Mon, 20 Apr 2020 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587371566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H67yUlCy/y0Sl74oiSkcXseZ2y18ZG7uO1JqanC1+vk=;
 b=G6b2u27ztP2MUdqPaTkLbc5pVKOU/Equ0z3FyA2U6ttGnvFfOZ1KxLD45AykMlhJVzLNnl
 Q+rJSf7kmmM0RLj8oBDpniFzWfS8pE5lSzut7fNCeoZvQP2aEc/Wit40vUIsEOHNZdacRm
 zVBzmV2Fl4i4iyPQKS0anFSKUCO8WHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-KlhUBDb3NCekAEnO42wDZw-1; Mon, 20 Apr 2020 04:32:41 -0400
X-MC-Unique: KlhUBDb3NCekAEnO42wDZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26D918017F3;
 Mon, 20 Apr 2020 08:32:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C89412B479;
 Mon, 20 Apr 2020 08:32:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BB20811358C5; Mon, 20 Apr 2020 10:32:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] xen/pt: Fix flawed conversion to realize()
Date: Mon, 20 Apr 2020 10:32:34 +0200
Message-Id: <20200420083236.19309-10-armbru@redhat.com>
In-Reply-To: <20200420083236.19309-1-armbru@redhat.com>
References: <20200420083236.19309-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The conversion of xen_pt_initfn() to xen_pt_realize() blindly replaced
XEN_PT_ERR() by error_setg().  Several error conditions that did not
fail xen_pt_initfn() now fail xen_pt_realize().  Unsurprisingly, the
cleanup on these errors looks highly suspicious.

Revert the inappropriate replacements.

Fixes: 5a11d0f7549e24a10e178a9dc8ff5e698031d9a6
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/xen/xen_pt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index b91082cb8b..81d5ad8da7 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -858,8 +858,8 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
=20
     rc =3D xc_physdev_map_pirq(xen_xc, xen_domid, machine_irq, &pirq);
     if (rc < 0) {
-        error_setg_errno(errp, errno, "Mapping machine irq %u to"
-                         " pirq %i failed", machine_irq, pirq);
+        XEN_PT_ERR(d, "Mapping machine irq %u to pirq %i failed, (err: %d)=
\n",
+                   machine_irq, pirq, errno);
=20
         /* Disable PCI intx assertion (turn on bit10 of devctl) */
         cmd |=3D PCI_COMMAND_INTX_DISABLE;
@@ -880,8 +880,8 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
                                        PCI_SLOT(d->devfn),
                                        e_intx);
         if (rc < 0) {
-            error_setg_errno(errp, errno, "Binding of interrupt %u failed"=
,
-                             e_intx);
+            XEN_PT_ERR(d, "Binding of interrupt %i failed! (err: %d)\n",
+                       e_intx, errno);
=20
             /* Disable PCI intx assertion (turn on bit10 of devctl) */
             cmd |=3D PCI_COMMAND_INTX_DISABLE;
@@ -889,8 +889,8 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
=20
             if (xen_pt_mapped_machine_irq[machine_irq] =3D=3D 0) {
                 if (xc_physdev_unmap_pirq(xen_xc, xen_domid, machine_irq))=
 {
-                    error_setg_errno(errp, errno, "Unmapping of machine"
-                            " interrupt %u failed", machine_irq);
+                    XEN_PT_ERR(d, "Unmapping of machine interrupt %i faile=
d!"
+                               " (err: %d)\n", machine_irq, errno);
                 }
             }
             s->machine_irq =3D 0;
--=20
2.21.1



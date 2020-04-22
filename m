Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FEA1B45DD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 15:08:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRF68-0001fl-Ro; Wed, 22 Apr 2020 13:07:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/xVI=6G=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jRF67-0001fg-G8
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 13:07:27 +0000
X-Inumbo-ID: 36d9eb3a-849a-11ea-b58d-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 36d9eb3a-849a-11ea-b58d-bc764e2007e4;
 Wed, 22 Apr 2020 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587560846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4HJTMDpzbAUUU2nrkN9nZ+ekSAeo3tJy8O/pNLEoIcU=;
 b=enBEuahPp8P+QpX0ayMOyg3S/o6FP7TRvbi9+t/gqZwQxlqD4zwLxe5w9cAFoeAaluPlzP
 db9/BZQ5UIiNS93ckDo0sCf7anPzi1rOBKKgaZ9ZFhv5qGEqZ2uSetuCg6gto7t9pNK/ys
 5c8HiPqVSEEOSCOUAMNl0xjjsEO2SAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-qrfxHadDMEiHhCJ7_Dd9lA-1; Wed, 22 Apr 2020 09:07:24 -0400
X-MC-Unique: qrfxHadDMEiHhCJ7_Dd9lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7303A8EB022;
 Wed, 22 Apr 2020 13:07:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2395960C99;
 Wed, 22 Apr 2020 13:07:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1D92311358C5; Wed, 22 Apr 2020 15:07:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/14] xen/pt: Fix flawed conversion to realize()
Date: Wed, 22 Apr 2020 15:07:14 +0200
Message-Id: <20200422130719.28225-10-armbru@redhat.com>
In-Reply-To: <20200422130719.28225-1-armbru@redhat.com>
References: <20200422130719.28225-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Reviewed-by: Paul Durrant <paul@xen.org>
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



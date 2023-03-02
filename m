Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507EC6A8543
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505058.777671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxT-0003gB-6G; Thu, 02 Mar 2023 15:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505058.777671; Thu, 02 Mar 2023 15:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxS-0003Nk-0m; Thu, 02 Mar 2023 15:35:02 +0000
Received: by outflank-mailman (input) for mailman id 505058;
 Thu, 02 Mar 2023 15:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxN-0001Jv-5e
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:57 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2d1fed5-b90f-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx5-00FL3s-0L; Thu, 02 Mar 2023 15:34:42 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzq-38; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c2d1fed5-b90f-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7gK7dvxz5pclX0MnciBP6zR++gp8k+vbHhIgn8vIfXk=; b=S4wCJdfuWRVgYPx9kKLk0xA+ko
	e7ZB09+Rs2KKJZoF7A2nmmbx4uXvWmZO8R/FlyeezVVODqEnTf3UGYROuP6Ln2PAMwseYTN+2ylze
	WIfvuHbVTq++w7YQm5Vbz/zeKfYK1n4sx2f5k04ZVAHmCRLfGQwoOYxPP1YEA3GydmIPPuBaH8GNB
	fGb6PBC9kgdipKoQRH374/cqIfbNOBYuXtA8yjW1vqiPTLpcrzZiC75A0JNifqzBbPAFr9ljsFUdh
	KEDDSRCDfn/eyuwne1D+npgC4VoXBRwdD1DixUj1yJ7RIQ1iNcFzRd/3NfjLSX4lq+9xdEeh/ExL5
	gpA4JCLQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 23/25] hw/xen: Map guest XENSTORE_PFN grant in emulated Xenstore
Date: Thu,  2 Mar 2023 15:34:33 +0000
Message-Id: <20230302153435.1170111-24-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 028f80499e..f9b7387024 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -21,6 +21,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
+#include "hw/xen/xen_backend_ops.h"
 #include "xen_overlay.h"
 #include "xen_evtchn.h"
 #include "xen_xenstore.h"
@@ -34,6 +35,7 @@
 
 #include "hw/xen/interface/io/xs_wire.h"
 #include "hw/xen/interface/event_channel.h"
+#include "hw/xen/interface/grant_table.h"
 
 #define TYPE_XEN_XENSTORE "xen-xenstore"
 OBJECT_DECLARE_SIMPLE_TYPE(XenXenstoreState, XEN_XENSTORE)
@@ -66,6 +68,9 @@ struct XenXenstoreState {
 
     uint8_t *impl_state;
     uint32_t impl_state_size;
+
+    struct xengntdev_handle *gt;
+    void *granted_xs;
 };
 
 struct XenXenstoreState *xen_xenstore_singleton;
@@ -1452,6 +1457,17 @@ int xen_xenstore_reset(void)
     }
     s->be_port = err;
 
+    /*
+     * We don't actually access the guest's page through the grant, because
+     * this isn't real Xen, and we can just use the page we gave it in the
+     * first place. Map the grant anyway, mostly for cosmetic purposes so
+     * it *looks* like it's in use in the guest-visible grant table.
+     */
+    s->gt = qemu_xen_gnttab_open();
+    uint32_t xs_gntref = GNTTAB_RESERVED_XENSTORE;
+    s->granted_xs = qemu_xen_gnttab_map_refs(s->gt, 1, xen_domid, &xs_gntref,
+                                             PROT_READ | PROT_WRITE);
+
     return 0;
 }
 
-- 
2.39.0



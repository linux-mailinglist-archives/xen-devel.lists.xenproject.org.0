Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDF6AE8B7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 18:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507655.781505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZax0-0002NE-K0; Tue, 07 Mar 2023 17:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507655.781505; Tue, 07 Mar 2023 17:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZax0-00026u-5l; Tue, 07 Mar 2023 17:18:10 +0000
Received: by outflank-mailman (input) for mailman id 507655;
 Tue, 07 Mar 2023 17:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yYpO=67=casper.srs.infradead.org=BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZawx-0000bA-AF
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 17:18:07 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03c56814-bd0c-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 18:18:02 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZawk-006ayB-Kf; Tue, 07 Mar 2023 17:17:55 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZawk-009ci9-24; Tue, 07 Mar 2023 17:17:54 +0000
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
X-Inumbo-ID: 03c56814-bd0c-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sITHLK7IN7D/Ke5/pulzgo4hxU3UNITjLOK0n4RQKaE=; b=bEe0RiT72oZQRlTpXZ5I6UDLdp
	rReuFL+E3+REG7gNLUVp91C/JlhSs3MJ2QfwyRcP29BwvLQMqTvthRYqb2dthi5bxoW/DtXMxpUY6
	yJbCDNYYiY3bEJMeEGyjZ1LVrK+4LAEsZB1B/A/2XTRhN0CZ3gBx8i5r+jTwea0OqZrxD3mpfagoJ
	+8yv8VTwhSCCWFHWdCCCl0kfUDf7YxQ4wZXGRTkKcdWFKzze4791sJ/mBk4VGWLkzkj0mFukpwITH
	z/89HD31QNVbKA5OLTuriygYSX5W175c+hsBlHRxr5+Od54HUGY28OdENK4I6+ZIfG4+ZEIwPWgEf
	afoEJSwQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 24/27] hw/xen: Implement soft reset for emulated gnttab
Date: Tue,  7 Mar 2023 17:17:47 +0000
Message-Id: <20230307171750.2293175-25-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307171750.2293175-1-dwmw2@infradead.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This is only part of it; we will also need to get the PV back end drivers
to tear down their own mappings (or do it for them, but they kind of need
to stop using the pointers too).

Some more work on the actual PV back ends and xen-bus code is going to be
needed to really make soft reset and migration fully functional, and this
part is the basis for that.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_gnttab.c  | 26 ++++++++++++++++++++++++--
 hw/i386/kvm/xen_gnttab.h  |  1 +
 target/i386/kvm/xen-emu.c |  5 +++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index 2bf91d36c0..21c30e3659 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -72,13 +72,11 @@ static void xen_gnttab_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Xen grant table support is for Xen emulation");
         return;
     }
-    s->nr_frames = 0;
     s->max_frames = kvm_xen_get_gnttab_max_frames();
     memory_region_init_ram(&s->gnt_frames, OBJECT(dev), "xen:grant_table",
                            XEN_PAGE_SIZE * s->max_frames, &error_abort);
     memory_region_set_enabled(&s->gnt_frames, true);
     s->entries.v1 = memory_region_get_ram_ptr(&s->gnt_frames);
-    memset(s->entries.v1, 0, XEN_PAGE_SIZE * s->max_frames);
 
     /* Create individual page-sizes aliases for overlays */
     s->gnt_aliases = (void *)g_new0(MemoryRegion, s->max_frames);
@@ -90,8 +88,11 @@ static void xen_gnttab_realize(DeviceState *dev, Error **errp)
         s->gnt_frame_gpas[i] = INVALID_GPA;
     }
 
+    s->nr_frames = 0;
+    memset(s->entries.v1, 0, XEN_PAGE_SIZE * s->max_frames);
     s->entries.v1[GNTTAB_RESERVED_XENSTORE].flags = GTF_permit_access;
     s->entries.v1[GNTTAB_RESERVED_XENSTORE].frame = XEN_SPECIAL_PFN(XENSTORE);
+
     qemu_mutex_init(&s->gnt_lock);
 
     xen_gnttab_singleton = s;
@@ -523,3 +524,24 @@ static struct gnttab_backend_ops emu_gnttab_backend_ops = {
     .unmap = xen_be_gnttab_unmap,
 };
 
+int xen_gnttab_reset(void)
+{
+    XenGnttabState *s = xen_gnttab_singleton;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    QEMU_LOCK_GUARD(&s->gnt_lock);
+
+    s->nr_frames = 0;
+
+    memset(s->entries.v1, 0, XEN_PAGE_SIZE * s->max_frames);
+
+    s->entries.v1[GNTTAB_RESERVED_XENSTORE].flags = GTF_permit_access;
+    s->entries.v1[GNTTAB_RESERVED_XENSTORE].frame = XEN_SPECIAL_PFN(XENSTORE);
+
+    memset(s->map_track, 0, s->max_frames * ENTRIES_PER_FRAME_V1);
+
+    return 0;
+}
diff --git a/hw/i386/kvm/xen_gnttab.h b/hw/i386/kvm/xen_gnttab.h
index 3bdbe96191..ee215239b0 100644
--- a/hw/i386/kvm/xen_gnttab.h
+++ b/hw/i386/kvm/xen_gnttab.h
@@ -13,6 +13,7 @@
 #define QEMU_XEN_GNTTAB_H
 
 void xen_gnttab_create(void);
+int xen_gnttab_reset(void);
 int xen_gnttab_map_page(uint64_t idx, uint64_t gfn);
 
 struct gnttab_set_version;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index bad3131d08..0bb6c601c9 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1406,6 +1406,11 @@ int kvm_xen_soft_reset(void)
         return err;
     }
 
+    err = xen_gnttab_reset();
+    if (err) {
+        return err;
+    }
+
     err = xen_xenstore_reset();
     if (err) {
         return err;
-- 
2.39.0



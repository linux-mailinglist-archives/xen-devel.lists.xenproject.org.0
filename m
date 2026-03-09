Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLxFFpJsrml3EAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE5234589
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249077.1546622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUMM-0006ZB-Cy; Mon, 09 Mar 2026 06:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249077.1546622; Mon, 09 Mar 2026 06:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUMM-0006X6-9v; Mon, 09 Mar 2026 06:44:58 +0000
Received: by outflank-mailman (input) for mailman id 1249077;
 Mon, 09 Mar 2026 06:44:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UF23=BJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vzUMK-0005KI-Ot
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 06:44:56 +0000
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [2607:f8b0:4864:20::a2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bbb3518-1b83-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 07:44:56 +0100 (CET)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-56b17c0223bso628832e0c.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Mar 2026 23:44:56 -0700 (PDT)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56b0f889ed2sm7456276e0c.13.2026.03.08.23.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 23:44:54 -0700 (PDT)
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
X-Inumbo-ID: 7bbb3518-1b83-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773038695; x=1773643495; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcNC0yip2XrDmFo80yDxRtX2oleYkrUeo7InlE7zv9I=;
        b=LOU2YxLCDKLnQ2zAkCvHD/pWl1L/yiN5wh/KZrOhuosRRV6Dlk06GcFyFuKxi9uY4G
         BtEd4+CCF/iCRgqR6//5255EdBWolK3+U+JefJ2xd+z1u5qAlt7kBE4BLTxzNWaXf1UR
         +aCVzd7YKJTb4dxSG0ELron77q58brXjkThM1/c6z1p7zKvlIGbjI1LP/cF8IwuZ8u1Y
         VNiFzwuYLY/MBLMjDi3SKMBoqMj17EsTVr2grb/v02t0yHOItL1NmHwHgu9tzngk/mOj
         ZaQ1mcxFxJ64rNRRPteW6vNs9igfsagsYHr6hXYhb+TEc8l6wggexPJwLzGDz04UhXAm
         LhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038695; x=1773643495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OcNC0yip2XrDmFo80yDxRtX2oleYkrUeo7InlE7zv9I=;
        b=lFycrzStSpHtu6QESel7ijcs69+6UobIFBI9FRRMrGDKIkO/2tafy/e/QqPmd4yOEA
         2KAV8okzNuZkz01SnYIdEe2xOENADMcy2EBaSIc12WSsbz5NR8HzS1Y2mrDCGnjoeNht
         0FAw3RSVenQd3gGj+HveYxM9shNDZ974bJn5W4So+aqYQ1ctntFVYG0bZEHeckhbA8aM
         TkybhhOUOn2EaHTMvt9w1kh78RVh1BRTx0PrS+OLgqhFvnNEnOmjvVUBSxOUi65FkAZD
         dddyvjNt9NOGt63Xa2PHjJxmDyQUHfbLIBmZyWpytnPJdij4E+PpHxMkedMD1eAWBGuF
         AHhA==
X-Forwarded-Encrypted: i=1; AJvYcCV5tqO9ECmP7BG5DFNlRKMP7Ewg9W9nz9kQflEVfNom8DvqjPFtDjW7sb8NkYg7ng6y7saOzbamtX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+GwncYEgp9VPlIxwkm10wTTP8Nz0Zn9RVaUF0sBDGje4lzcsi
	ZHt37xGSjicPiff7AjrrmKD8qJcDMyVwjNPWSxe+UOzbAQCk9cGiQtnhv63/akyJ
X-Gm-Gg: ATEYQzxZmSMI3j8BrIi3r6zbT77SuvXDGuF+teBXjYj8Pf/33t9gBQqkiiPUQ5jOuei
	omrGDh/EaLxLc3WkKYI0m8gJhyRi3MSWUIRPyjKuX4uur4zOSObeJbo+fPyGWUSRY72p4pAW9mV
	SX2jKsY/5TSU2br6d+MhjB++IIaWwYwsOlSHaXzfRl3pFzcTE2a2fbXDH+orbZ0PSAzhYCQ+KC5
	BpnYttgCBP2+3B7mk/JpMkzVcLhZzw/eGeBkV01bjLH2wmv4f/r7LwrUzl0JTRbcD4DwmCqMd0b
	ADMg4Z+o03hsUdrs1gWdma/GvWrPrhds0w7UdyAIxalExCKoWPY0R8Akft+Xz8chbIPHmHHsH6M
	rBFyqgnUHQ7Vj7CmZmQiEPnJbqsyOD8F3V8QDhApkhlVpbHL0LF2VTyHb5DJey3G96NVynVNbHO
	5BZnecX9UnvG9afU3pmIv+gq5/0iXxt/s4ixOemZVa2yyz6FUHyxPcdQrLTw==
X-Received: by 2002:a05:6122:1c0a:b0:567:4722:66a3 with SMTP id 71dfb90a1353d-56b07da5535mr3763057e0c.8.1773038695019;
        Sun, 08 Mar 2026 23:44:55 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 5/5] hw/xen: xenpvh: Add prop to enable/disable the mapcache
Date: Mon,  9 Mar 2026 07:44:35 +0100
Message-ID: <20260309064436.51860-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309064436.51860-1-edgar.iglesias@gmail.com>
References: <20260309064436.51860-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 04AE5234589
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nongnu.org,kernel.org,xenproject.org,gmail.com];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a machine property to enable/disable the mapcache.
Default it to enabled for backwards compatibility.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-pvh-common.c         | 133 +++++++++++++++++++++++++++++---
 include/hw/xen/xen-pvh-common.h |   2 +
 2 files changed, 124 insertions(+), 11 deletions(-)

diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 4fade017bb..cca37202ff 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -29,6 +29,69 @@ static const MemoryListener xen_memory_listener = {
     .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
 };
 
+/*
+ * Map foreign RAM in bounded chunks so we don't build a PFN array for the
+ * entire guest size (which can be huge for large guests). We reserve a VA
+ * range once and then MAP_FIXED each chunk into place.
+ */
+#define XEN_PVH_MAP_CHUNK_PAGES 65535
+
+static void *xen_map_guest_ram(XenPVHMachineState *s,
+                               uint64_t addr, uint64_t size)
+{
+    size_t total_pages = size >> XC_PAGE_SHIFT;
+    size_t chunk_pages = MIN(XEN_PVH_MAP_CHUNK_PAGES, total_pages);
+    g_autofree xen_pfn_t *pfns = NULL;
+    void *base = NULL;
+    size_t offset;
+
+    if (!total_pages) {
+        goto done;
+    }
+
+    base = mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (base == MAP_FAILED) {
+        base = NULL;
+        goto done;
+    }
+
+    pfns = g_new0(xen_pfn_t, chunk_pages);
+    if (!pfns) {
+        munmap(base, size);
+        base = NULL;
+        goto done;
+    }
+
+    for (offset = 0; offset < total_pages; offset += chunk_pages) {
+        size_t num_pages = MIN(chunk_pages, total_pages - offset);
+        void *mapped;
+        size_t i;
+
+        for (i = 0; i < num_pages; i++) {
+            pfns[i] = (addr >> XC_PAGE_SHIFT) + offset + i;
+        }
+
+        mapped = xenforeignmemory_map2(
+            xen_fmem, xen_domid,
+            (uint8_t *)base + (offset << XC_PAGE_SHIFT),
+            PROT_READ | PROT_WRITE, MAP_FIXED,
+            num_pages, pfns, NULL);
+        if (!mapped) {
+            munmap(base, size);
+            base = NULL;
+            goto done;
+        }
+    }
+done:
+    if (!base) {
+        /* We can't recover from this.  */
+        error_report("FATAL: Failed to foreign-map %" PRIx64 " - %" PRIx64,
+                     addr, addr + size);
+        exit(EXIT_FAILURE);
+    }
+    return base;
+}
+
 static void xen_pvh_init_ram(XenPVHMachineState *s,
                              MemoryRegion *sysmem)
 {
@@ -45,22 +108,42 @@ static void xen_pvh_init_ram(XenPVHMachineState *s,
         block_len = s->cfg.ram_high.base + ram_size[1];
     }
 
-    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
-                           &error_fatal);
+    if (s->cfg.mapcache) {
+        memory_region_init_ram(&xen_memory, NULL, "xen.ram",
+                               block_len, &error_fatal);
+        memory_region_init_alias(&s->ram.low, NULL, "xen.ram.lo", &xen_memory,
+                                 s->cfg.ram_low.base, ram_size[0]);
+        if (ram_size[1] > 0) {
+            memory_region_init_alias(&s->ram.high, NULL, "xen.ram.hi",
+                                     &xen_memory,
+                                     s->cfg.ram_high.base, ram_size[1]);
+        }
+    } else {
+        void *p;
+
+        p = xen_map_guest_ram(s, s->cfg.ram_low.base, ram_size[0]);
+        memory_region_init_ram_ptr(&s->ram.low, NULL, "xen.ram.lo",
+                                   ram_size[0], p);
+        if (ram_size[1] > 0) {
+            p = xen_map_guest_ram(s, s->cfg.ram_high.base, ram_size[1]);
+            memory_region_init_ram_ptr(&s->ram.high, NULL, "xen.ram.hi",
+                                       ram_size[1], p);
+        }
+    }
 
-    memory_region_init_alias(&s->ram.low, NULL, "xen.ram.lo", &xen_memory,
-                             s->cfg.ram_low.base, ram_size[0]);
+    /* Map them onto QEMU's address-space.  */
     memory_region_add_subregion(sysmem, s->cfg.ram_low.base, &s->ram.low);
     if (ram_size[1] > 0) {
-        memory_region_init_alias(&s->ram.high, NULL, "xen.ram.hi", &xen_memory,
-                                 s->cfg.ram_high.base, ram_size[1]);
         memory_region_add_subregion(sysmem, s->cfg.ram_high.base, &s->ram.high);
     }
 
-    /* Setup support for grants.  */
-    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
-                           &error_fatal);
-    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
+    /* Grants are only supported when the mapcache is on.  */
+    if (s->cfg.mapcache) {
+        /* Setup support for grants.  */
+        memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
+                &error_fatal);
+        memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
+    }
 }
 
 static void xen_set_irq(void *opaque, int irq, int level)
@@ -203,7 +286,7 @@ static void xen_pvh_init(MachineState *ms)
     xen_register_ioreq(&s->ioreq, ms->smp.max_cpus,
                        xpc->handle_bufioreq,
                        &xen_memory_listener,
-                       true);
+                       s->cfg.mapcache);
 
     if (s->cfg.virtio_mmio_num) {
         xen_create_virtio_mmio_devices(s);
@@ -285,6 +368,20 @@ XEN_PVH_PROP_MEMMAP(pci_ecam)
 XEN_PVH_PROP_MEMMAP(pci_mmio)
 XEN_PVH_PROP_MEMMAP(pci_mmio_high)
 
+static void xen_pvh_set_mapcache(Object *obj, bool value, Error **errp)
+{
+    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);
+
+    xp->cfg.mapcache = value;
+}
+
+static bool xen_pvh_get_mapcache(Object *obj, Error **errp)
+{
+    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);
+
+    return xp->cfg.mapcache;
+}
+
 static void xen_pvh_set_pci_intx_irq_base(Object *obj, Visitor *v,
                                           const char *name, void *opaque,
                                           Error **errp)
@@ -338,6 +435,12 @@ do {                                                                      \
         OC_MEMMAP_PROP_SIZE(c, prop_name, name);                          \
 } while (0)
 
+    object_class_property_add_bool(oc, "mapcache", xen_pvh_get_mapcache,
+                                   xen_pvh_set_mapcache);
+    object_class_property_set_description(oc, "mapcache",
+                                      "Set on/off to enable/disable the "
+                                      "mapcache");
+
     /*
      * We provide memmap properties to allow Xen to move things to other
      * addresses for example when users need to accomodate the memory-map
@@ -377,6 +480,13 @@ do {                                                                      \
 #endif
 }
 
+static void xen_pvh_instance_init(Object *obj)
+{
+    XenPVHMachineState *xp = XEN_PVH_MACHINE(obj);
+
+    xp->cfg.mapcache = true;
+}
+
 static void xen_pvh_class_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -395,6 +505,7 @@ static const TypeInfo xen_pvh_info = {
     .parent = TYPE_MACHINE,
     .abstract = true,
     .instance_size = sizeof(XenPVHMachineState),
+    .instance_init = xen_pvh_instance_init,
     .class_size = sizeof(XenPVHMachineClass),
     .class_init = xen_pvh_class_init,
 };
diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
index 0ed07c5694..0209b798f3 100644
--- a/include/hw/xen/xen-pvh-common.h
+++ b/include/hw/xen/xen-pvh-common.h
@@ -84,6 +84,8 @@ struct XenPVHMachineState {
         /* PCI */
         MemMapEntry pci_ecam, pci_mmio, pci_mmio_high;
         uint32_t pci_intx_irq_base;
+
+        bool mapcache;
     } cfg;
 };
 
-- 
2.43.0



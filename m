Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9S16GIOQp2lqiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 02:53:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B41F9B4B
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 02:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245078.1544484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPn-0007Rz-GK; Wed, 04 Mar 2026 01:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245078.1544484; Wed, 04 Mar 2026 01:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPn-0007O6-BB; Wed, 04 Mar 2026 01:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1245078;
 Wed, 04 Mar 2026 01:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0T8J=BE=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vxbPl-0006Zx-Ks
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 01:52:41 +0000
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [2607:f8b0:4864:20::a2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d32c1eae-176c-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 02:52:39 +0100 (CET)
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-567543b8989so2639712e0c.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 17:52:39 -0800 (PST)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56ae7a29c2esm466482e0c.7.2026.03.03.17.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 17:52:37 -0800 (PST)
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
X-Inumbo-ID: d32c1eae-176c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772589159; x=1773193959; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJHpqZ1+MwG7a9L0vy9H75K3KJbsmHXRI7gW76g6PSg=;
        b=mAYm6R8oWjRsnuWOl4DBP7sOPudwDWUMllJejwXFDBR/Q3ibHyA/eLP+XQqOciQV5T
         exjjsg+Sp6EJf7ccf0EmA6IUh1zaedmx3zqw6prfk5mJJdCXXIeG1p/I54P7gTmlB7gr
         lAeDm4W/7489uVX9c2jXDuz/Jq/C4CBQ7TiG/JhYimEc9uVFdOPXYpIpn5aFero4GSn6
         p9uNP0CSPe+SeI294jdX+5KwnD+ZmO7pvpaeuHVn6QeYpcjFXmid1WzosCV+sjKykBW9
         WTX+7S69bAY9nWhPSHOGbYwHdxyrQxGOSa1ZhTM89TY7Mr90l1krP8zXOGe2vEL0nZzY
         43lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772589159; x=1773193959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EJHpqZ1+MwG7a9L0vy9H75K3KJbsmHXRI7gW76g6PSg=;
        b=qGoQ6Rzt9WG/BrT64FV4VPtaK0JF1mj1KELo9LpNTnKjwAuzhgFOIhgEiD3SqTrBwf
         HUcWgXCh544TuQVtyI91LZy6ebePkOh9rD5vNPibwnZTCZvuPlZrarURzBcmdPOjfDU+
         zOxLn5DTet6lTXCQv8w1SXo0strWIur50YlXXckbEIKxHtMxcP6KbCS83PP6G2PMpy/F
         Mjf0RnbHWYO36e/zXKBLHGNFX82CO7jnHiR67g11uFrMYBIqKqHtXH90JclOp0k3GbiQ
         Z8G4D5z8zAxhuH2sXRDqLMue+GEajSr/r6iFk8rGoy6maWQR3/POwlWDSLqlImcXytV/
         NzCg==
X-Forwarded-Encrypted: i=1; AJvYcCWxhc1pf65F2dId+gclMwMXmpzMYPZTnvtC3Al6Aezd1GO8WIbqU1uO1q4xh+TSo6VLipyys3RlS5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsmrDe5O1vPvXRBO+Ve8cQVd08mNUf5EOP1yJi6sl7a9SNgPoX
	cTDjDRrq1Q/3ZJ8E5u4ti+6Hy4QMHQitohig9L+1KLlyWQG95jYdrBKy
X-Gm-Gg: ATEYQzwg3aD9HPcgocmcgLFCMWd0EVktUTJvhuio5c3ldVg4Qceml4/6kUQSH8Enz8p
	cm3ig/4i5adrTzPJKRSGxgnK3VXE06Pm8+v3OhNjkYPyiRmbYvwco+X1EhP8qC0XkD/GBLaSjNA
	RI/plYwPQwQwTdAnBGQ+qPdh3n2+KbOT9r3kR+GFSbwjhHTN1j/f623d1DjYQ1K2bhk1Z7QxaV8
	dJ5fI9FEyCo9U4qghnYACgzMcJksewl+Mb1FarXRVb689Rv5LlGLXWko1t8VM8Ta3bYE4ASM/FB
	e/yYI92TKltXO9mzIHrzlWjcVwpTbWfP/qerEBD9N9VKZMifgBZePG6StjVjycz/JTmmnzR32wv
	BRk8gr9gWeW1cn7fChNT2HjLAdcMWGlX3nTCDBNbFrij2mtOIOgcdxp59YbqkxD6x0vP+tb/16e
	b4afYegtQZZSSTuNtqeBFEOMyWi/LHqlNV2tbODCbIT7nnjdib5+VixOdTJcf2SVwK60w+
X-Received: by 2002:a05:6122:2a43:b0:55b:305b:4e47 with SMTP id 71dfb90a1353d-56ae78214b9mr229902e0c.19.1772589158517;
        Tue, 03 Mar 2026 17:52:38 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 5/5] hw/xen: xenpvh: Add prop to enable/disable the mapcache
Date: Wed,  4 Mar 2026 02:52:21 +0100
Message-ID: <20260304015222.979224-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304015222.979224-1-edgar.iglesias@gmail.com>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 014B41F9B4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nongnu.org,kernel.org,xenproject.org,xen.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:paul@xen.org,m:edgar.iglesias@gmail.com,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a machine property to enable/disable the mapcache.
Default it to enabled for backwards compatibility.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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



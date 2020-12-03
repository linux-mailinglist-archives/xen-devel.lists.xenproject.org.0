Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DEA2CD5A9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 13:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43408.78047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknw1-0005zf-8f; Thu, 03 Dec 2020 12:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43408.78047; Thu, 03 Dec 2020 12:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknw1-0005yN-0U; Thu, 03 Dec 2020 12:42:09 +0000
Received: by outflank-mailman (input) for mailman id 43408;
 Thu, 03 Dec 2020 12:42:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kknvz-0005xT-Qp
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 12:42:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kknvy-00046E-NK; Thu, 03 Dec 2020 12:42:06 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kknvy-00015A-FT; Thu, 03 Dec 2020 12:42:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=yJbK+YZtuE0HTqrQU4QFK2ag5uh4t73qAq6ThSOAdyw=; b=eKUdkgqtJyfjtmonjYjyorCeu3
	ABafYeN9MyRFS86S/K/zCCiqsIOQHiW6P/sAbg9E8Ovb0INx+5rtUK53pwHL41yo1/a57jsil11lL
	GDMQxLmvXId8JpTBXBGj+p9nglTAedkLaKTk5ha/KP2dr/O3CnwMLgLXpoNkFRdfWy9k=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 3/4] libxl: introduce a 'libxl_xen_abi_features' enumeration...
Date: Thu,  3 Dec 2020 12:41:58 +0000
Message-Id: <20201203124159.3688-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203124159.3688-1-paul@xen.org>
References: <20201203124159.3688-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... and bitmaps to enable or disable fetaures.

This patch adds a new 'libxl_xen_abi_features' enumeration into the IDL which
specifies features of the Xen ABI which may be optionally enabled or disabled
via new 'feature_enable' and 'feature_disable' bitaps added into
'libxl_domain_build_info'.

The initially defined features are enabled by default (for relevant
architectures) and so the corresponding flags in
'struct xen_domctl_createdomain' are set if they are missing from
'disable_features' rather than if they are present in 'enable_features'.
Checks are, however, added to make sure that features are not specifically
enabled in cases where they are not supported.

NOTE: A subsequent patch will add an option into xl.cfg(5) to control whether
      Xen ABI features are enabled or disabled.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v5:
 - New in v5
---
 tools/include/libxl.h            | 10 ++++++++++
 tools/libs/light/libxl_arm.c     | 22 +++++++++++++++-------
 tools/libs/light/libxl_create.c  | 32 +++++++++++++++++++++++++++++++-
 tools/libs/light/libxl_types.idl |  7 +++++++
 tools/libs/light/libxl_x86.c     | 14 ++++++++++++--
 5 files changed, 75 insertions(+), 10 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index eaffccb30f37..b328a5621e6f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -451,6 +451,16 @@
  */
 #define LIBXL_HAVE_VIRIDIAN_EX_PROCESSOR_MASKS 1
 
+/*
+ * LIBXL_HAVE_BUILDINFO_XEN_ABI_FEATURE indicates that the
+ * libxl_xen_abi_feature enumeration is defined and that
+ * libxl_domain_build_info has feature_enable and _disable bitmaps
+ * of the specified width. These bitmaps are used to enable or disable
+ * features of the Xen ABI (enumerated by the new type) for a domain.
+ */
+#define LIBXL_HAVE_BUILDINFO_XEN_ABI_FEATURE 1
+#define LIBXL_BUILDINFO_FEATURE_ENABLE_DISABLE_WIDTH 64
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 66e8a065fe67..69676340a661 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -28,19 +28,27 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     unsigned int i;
     uint32_t vuart_irq;
     bool vuart_enabled = false;
+    libxl_domain_build_info *b_info = &d_config->b_info;
+    libxl_xen_abi_feature f = LIBXL_XEN_ABI_FEATURE_EVTCHN_UPCALL;
+
+    if (libxl_bitmap_test(&b_info->feature_enable, f)) {
+        LOG(ERROR, "unsupported Xen ABI feature '%s'",
+            libxl_xen_abi_feature_to_string(f));
+        return ERROR_FAIL;
+    }
 
     /*
      * If pl011 vuart is enabled then increment the nr_spis to allow allocation
      * of SPI VIRQ for pl011.
      */
-    if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
+    if (b_info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
         nr_spis += (GUEST_VPL011_SPI - 32) + 1;
         vuart_irq = GUEST_VPL011_SPI;
         vuart_enabled = true;
     }
 
-    for (i = 0; i < d_config->b_info.num_irqs; i++) {
-        uint32_t irq = d_config->b_info.irqs[i];
+    for (i = 0; i < b_info->num_irqs; i++) {
+        uint32_t irq = b_info->irqs[i];
         uint32_t spi;
 
         /*
@@ -72,7 +80,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     config->arch.nr_spis = nr_spis;
     LOG(DEBUG, " - Allocate %u SPIs", nr_spis);
 
-    switch (d_config->b_info.arch_arm.gic_version) {
+    switch (b_info->arch_arm.gic_version) {
     case LIBXL_GIC_VERSION_DEFAULT:
         config->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
         break;
@@ -84,11 +92,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         break;
     default:
         LOG(ERROR, "Unknown GIC version %d",
-            d_config->b_info.arch_arm.gic_version);
+            b_info->arch_arm.gic_version);
         return ERROR_FAIL;
     }
 
-    switch (d_config->b_info.tee) {
+    switch (b_info->tee) {
     case LIBXL_TEE_TYPE_NONE:
         config->arch.tee_type = XEN_DOMCTL_CONFIG_TEE_NONE;
         break;
@@ -97,7 +105,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         break;
     default:
         LOG(ERROR, "Unknown TEE type %d",
-            d_config->b_info.tee);
+            b_info->tee);
         return ERROR_FAIL;
     }
 
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 3ca9f00d6d83..8cf7fd5f6d1b 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -587,6 +587,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
     struct xs_permissions noperm[1];
     xs_transaction_t t = 0;
     libxl_vminfo *vm_list;
+    libxl_xen_abi_feature f;
 
     /* convenience aliases */
     libxl_domain_create_info *info = &d_config->c_info;
@@ -607,9 +608,38 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
-            .flags = XEN_DOMCTL_CDF_evtchn_fifo,
         };
 
+        libxl_for_each_set_bit(f, b_info->feature_enable) {
+            if (!libxl_xen_abi_feature_to_string(f)) { /* check validity */
+                LOGED(ERROR, *domid, "unknown Xen ABI feature enabled");
+                rc = ERROR_FAIL;
+                goto out;
+            }
+            if (libxl_bitmap_test(&b_info->feature_disable, f)) {
+                LOGED(ERROR, *domid, "Xen ABI feature '%s' both enabled and disabled",
+                      libxl_xen_abi_feature_to_string(f));
+                rc = ERROR_FAIL;
+                goto out;
+            }
+            LOGD(DETAIL, *domid, "enable feature: '%s'",
+                 libxl_xen_abi_feature_to_string(f));
+        }
+
+        libxl_for_each_set_bit(f, b_info->feature_disable) {
+            if (!libxl_xen_abi_feature_to_string(f)) { /* check validity */
+                LOGED(ERROR, *domid, "unknown Xen ABI feature disabled");
+                rc = ERROR_FAIL;
+                goto out;
+            }
+            LOGD(DETAIL, *domid, "disable feature: '%s'",
+                 libxl_xen_abi_feature_to_string(f));
+        }
+
+        if (!libxl_bitmap_test(&b_info->feature_disable,
+                               LIBXL_XEN_ABI_FEATURE_EVTCHN_FIFO))
+            create.flags |= XEN_DOMCTL_CDF_evtchn_fifo;
+
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
             create.flags |= XEN_DOMCTL_CDF_hvm;
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 05324736b744..3c50724b64cd 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -477,6 +477,11 @@ libxl_tee_type = Enumeration("tee_type", [
     (1, "optee")
     ], init_val = "LIBXL_TEE_TYPE_NONE")
 
+libxl_xen_abi_feature = Enumeration("xen_abi_feature", [
+    (0, "evtchn_fifo"),
+    (1, "evtchn_upcall")
+    ])
+
 libxl_rdm_reserve = Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -559,6 +564,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
     ("tee",              libxl_tee_type),
+    ("feature_enable",   libxl_bitmap),
+    ("feature_disable",  libxl_bitmap),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
                                        ("bios",             libxl_bios_type),
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index f7217b422404..39a9d3cbf9f8 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -6,9 +6,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       struct xen_domctl_createdomain *config)
 {
     libxl_domain_create_info *info = &d_config->c_info;
+    libxl_domain_build_info *b_info = &d_config->b_info;
+    libxl_xen_abi_feature f = LIBXL_XEN_ABI_FEATURE_EVTCHN_UPCALL;
 
-    if (info->type == LIBXL_DOMAIN_TYPE_HVM)
-        config->flags |= XEN_DOMCTL_CDF_evtchn_upcall;
+    if (info->type != LIBXL_DOMAIN_TYPE_HVM &&
+        libxl_bitmap_test(&b_info->feature_enable, f)) {
+        LOG(ERROR, "unsupported Xen ABI feature '%s'",
+            libxl_xen_abi_feature_to_string(f));
+        return ERROR_FAIL;
+    }
+
+    if (info->type == LIBXL_DOMAIN_TYPE_HVM &&
+        !libxl_bitmap_test(&b_info->feature_disable, f))
+            config->flags |= XEN_DOMCTL_CDF_evtchn_upcall;
 
     switch(info->type) {
     case LIBXL_DOMAIN_TYPE_HVM:
-- 
2.20.1



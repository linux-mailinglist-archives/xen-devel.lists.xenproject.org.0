Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E119CDDD0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837164.1253084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuso-0005Vu-Ep; Fri, 15 Nov 2024 11:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837164.1253084; Fri, 15 Nov 2024 11:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuso-0005UQ-Bu; Fri, 15 Nov 2024 11:53:02 +0000
Received: by outflank-mailman (input) for mailman id 837164;
 Fri, 15 Nov 2024 11:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusn-0005U9-0E
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:01 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 274ee777-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:52:56 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99f646ff1bso239968266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:52:56 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:52:55 -0800 (PST)
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
X-Inumbo-ID: 274ee777-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI3NGVlNzc3LWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTc2LjYyOTE4NSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671576; x=1732276376; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mrVRgD97fk4oiduu+jg3TvIRmLCwcya2NVl3bfxaNk=;
        b=XYI4ZYQrV9Gv/IREjD+hqYJBmV7AWvcUACeXBp9yKlQWTu1ikP0RouMuJtKcDfPOL1
         /4kOZO7FyUF4iqTTMwtCYVx4KItQOByW5pfQ5X3Pgd5nIngwvQKbfBzwfSGZNaa7PVHd
         DyZOCsUJp/4vFmN9ua6gIW5GmXdHVjArPQlc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671576; x=1732276376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mrVRgD97fk4oiduu+jg3TvIRmLCwcya2NVl3bfxaNk=;
        b=CEKIhv8oWZzYuQ9dHfEakqiibabPV8TpVrUyDy4In/IuazuYmODGTw93ub1w0N8dwr
         yYMo+9rJWlKh6BFiJLTJrja16HvMvnF8QPU9q9LEMpUGpUlb5w3voGIdpRa/9FmQh7r0
         OtP5P8VhLDiKlbiGM787d3SrW/EFlpNhuIktHwKcyZc8bln3kU0Ie7MDV9FUY1WYsD2e
         IhMJ3oeT8JtPSXwwvrsM3aDpndI/QlksDZRAL9gvS/GtexUgxr6q6U4ojGSj042xZTYY
         j5IzOOBtvtEBBkggvu22Mboar2i4s2XfaZLlGhIKMLDwu9KNNFxqx3/gvuIYo25bOLax
         k2AA==
X-Gm-Message-State: AOJu0YxrpA9OWkx1j3muI44uCC3kB8mmoeY511WVmH00A4IYVx1eNSnr
	OtbSnUCAOEwIvH4P0XYipDubLj7LCrhahmQeiMDreHfKKHu62TwiQrNEacfMElAmXFACMnCrQiw
	g
X-Google-Smtp-Source: AGHT+IHgSlFouleWW4NhastRrTRfcV9mIE59JpQXE0ASPTZ/NyZSqm4wzfRTNQm7vXFvCwhhIVF96g==
X-Received: by 2002:a17:907:1b2a:b0:a9a:d4aa:95bd with SMTP id a640c23a62f3a-aa48354e32emr231728266b.54.1731671575641;
        Fri, 15 Nov 2024 03:52:55 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 01/25] xen/domctl: Refine grant_opts into max_grant_version
Date: Fri, 15 Nov 2024 11:51:30 +0000
Message-ID: <20241115115200.2824-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

grant_opts is overoptimizing for space packing in a hypercall that
doesn't warrant the effort. Tweak the ABI without breaking it in order
to remove the bitfield by extending it to 8 bits.

Xen only supports little-endian systems, so the transformation from
uint32_t to uint8_t followed by 3 octets worth of padding is not an ABI
breakage.

No functional change

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/helpers/init-xenstore-domain.c             |  2 +-
 tools/libs/light/libxl_create.c                  |  6 +-----
 tools/ocaml/libs/xc/xenctrl_stubs.c              |  3 +--
 tools/python/xen/lowlevel/xc/xc.c                |  2 +-
 tools/tests/paging-mempool/test-paging-mempool.c |  2 +-
 tools/tests/resource/test-resource.c             |  6 +++---
 tools/tests/tsx/test-tsx.c                       |  4 ++--
 xen/arch/arm/dom0less-build.c                    |  4 ++--
 xen/arch/arm/domain_build.c                      |  2 +-
 xen/arch/x86/setup.c                             |  2 +-
 xen/common/domain.c                              |  6 +++---
 xen/common/grant_table.c                         |  3 +--
 xen/include/public/domctl.h                      | 15 +++++++++++----
 xen/include/xen/grant_table.h                    |  6 +++---
 14 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 01ca667d25d1..a9f2f9859df6 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -96,7 +96,7 @@ static int build(xc_interface *xch)
          */
         .max_grant_frames = 4,
         .max_maptrack_frames = 128,
-        .grant_opts = XEN_DOMCTL_GRANT_version(1),
+        .max_grant_version = 1,
     };
 
     xs_fd = open("/dev/xen/xenbus_backend", O_RDWR);
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index edeadd57ef5a..87594809abc8 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -476,10 +476,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         else
             /* No grant table support reported */
             b_info->max_grant_version = 0;
-    } else if (b_info->max_grant_version & ~XEN_DOMCTL_GRANT_version_mask) {
-        LOG(ERROR, "max grant version %d out of range",
-            b_info->max_grant_version);
-        return -ERROR_INVAL;
     }
 
     /* Assume that providing a bootloader user implies enabling restrict. */
@@ -646,7 +642,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
-            .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
+            .max_grant_version = b_info->max_grant_version,
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
             .cpupool_id = info->poolid,
         };
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index c78191f95abc..67a690308f1a 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -223,8 +223,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
-		.grant_opts =
-		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
+		.max_grant_version = Int_val(VAL_MAX_GRANT_VERSION),
 		.altp2m_opts = Int32_val(VAL_ALTP2M_OPTS),
 		.vmtrace_size = vmtrace_size,
 		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 9feb12ae2b16..ba6a61217f9f 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -167,7 +167,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
 #else
 #error Architecture not supported
 #endif
-    config.grant_opts = XEN_DOMCTL_GRANT_version(max_grant_version);
+    config.max_grant_version = max_grant_version;
 
     if ( (ret = xc_domain_create(self->xc_handle, &dom, &config)) < 0 )
         return pyxc_error_to_exception(self->xc_handle);
diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index 1ebc13455ac2..512c42803c0e 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -24,7 +24,7 @@ static struct xen_domctl_createdomain create = {
     .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
     .max_vcpus = 1,
     .max_grant_frames = 1,
-    .grant_opts = XEN_DOMCTL_GRANT_version(1),
+    .max_grant_version = 1,
 
     .arch = {
 #if defined(__x86_64__) || defined(__i386__)
diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 1b10be16a6b4..b0a9f5f1e8b6 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -137,7 +137,7 @@ static void test_domain_configurations(void)
             .create = {
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
-                .grant_opts = XEN_DOMCTL_GRANT_version(1),
+                .max_grant_version = 1,
             },
         },
         {
@@ -146,7 +146,7 @@ static void test_domain_configurations(void)
                 .flags = XEN_DOMCTL_CDF_hvm,
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
-                .grant_opts = XEN_DOMCTL_GRANT_version(1),
+                .max_grant_version = 1,
                 .arch = {
                     .emulation_flags = XEN_X86_EMU_LAPIC,
                 },
@@ -159,7 +159,7 @@ static void test_domain_configurations(void)
                 .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
-                .grant_opts = XEN_DOMCTL_GRANT_version(1),
+                .max_grant_version = 1,
             },
         },
 #endif
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index 5af04953f340..324bcf67153a 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -457,7 +457,7 @@ static void test_guests(void)
         struct xen_domctl_createdomain c = {
             .max_vcpus = 1,
             .max_grant_frames = 1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(1),
+            .max_grant_version = 1,
         };
 
         printf("Testing PV guest\n");
@@ -470,7 +470,7 @@ static void test_guests(void)
             .flags = XEN_DOMCTL_CDF_hvm,
             .max_vcpus = 1,
             .max_grant_frames = 1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(1),
+            .max_grant_version = 1,
             .arch = {
                 .emulation_flags = XEN_X86_EMU_LAPIC,
             },
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index f328a044e9d3..1c6219c7cc82 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -877,7 +877,7 @@ void __init create_domUs(void)
             .max_evtchn_port = 1023,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+            .max_grant_version = opt_gnttab_max_version,
         };
         unsigned int flags = 0U;
         uint32_t val;
@@ -959,7 +959,7 @@ void __init create_domUs(void)
         }
 
         if ( dt_property_read_u32(node, "max_grant_version", &val) )
-            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
+            d_cfg.max_grant_version = val;
 
         if ( dt_property_read_u32(node, "max_grant_frames", &val) )
         {
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2c30792de88b..773412ba2acb 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2194,7 +2194,7 @@ void __init create_dom0(void)
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
-        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+        .max_grant_version = opt_gnttab_max_version,
     };
     int rc;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 5da1c6a34519..0443555d9bb8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -964,7 +964,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
-        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+        .max_grant_version = opt_gnttab_max_version,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92263a4fbdc5..86f0e99e0d4a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -579,9 +579,9 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->grant_opts & ~XEN_DOMCTL_GRANT_version_mask )
+    if ( config->rsvd0[0] | config->rsvd0[1] | config->rsvd0[2] )
     {
-        dprintk(XENLOG_INFO, "Unknown grant options %#x\n", config->grant_opts);
+        dprintk(XENLOG_INFO, "Rubble in rsvd0 padding\n");
         return -EINVAL;
     }
 
@@ -788,7 +788,7 @@ struct domain *domain_create(domid_t domid,
 
     if ( (err = grant_table_init(d, config->max_grant_frames,
                                  config->max_maptrack_frames,
-                                 config->grant_opts)) != 0 )
+                                 config->max_grant_version)) != 0 )
         goto fail;
     init_status |= INIT_gnttab;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 6c77867f8cdd..51a3f72a9601 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1963,10 +1963,9 @@ active_alloc_failed:
 }
 
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames, unsigned int options)
+                     int max_maptrack_frames, uint8_t max_grant_version)
 {
     struct grant_table *gt;
-    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
     int ret = -ENOMEM;
 
     if ( !max_grant_version )
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 353f831e402e..e37d4337dcf9 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -90,11 +90,18 @@ struct xen_domctl_createdomain {
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
 
-/* Grant version, use low 4 bits. */
-#define XEN_DOMCTL_GRANT_version_mask    0xf
-#define XEN_DOMCTL_GRANT_version(v)      ((v) & XEN_DOMCTL_GRANT_version_mask)
+    /*
+     * Maximum grant table version the domain can be configured with.
+     *
+     * Domains always start with v1 (if CONFIG_GRANT_TABLE) and can be bumped
+     * to use up to `max_grant_version` via GNTTABOP_set_version.
+     *
+     * Must be zero iff !CONFIG_GRANT_TABLE.
+     */
+    uint8_t max_grant_version;
 
-    uint32_t grant_opts;
+    /* Unused. Reserved to zero. */
+    uint8_t rsvd0[3];
 
 /*
  * Enable altp2m mixed mode.
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 50edfecfb62f..a483d5a216a4 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -40,7 +40,7 @@ extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames, unsigned int options);
+                     int max_maptrack_frames, uint8_t max_grant_version);
 void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
@@ -73,9 +73,9 @@ int gnttab_acquire_resource(
 static inline int grant_table_init(struct domain *d,
                                    int max_grant_frames,
                                    int max_maptrack_frames,
-                                   unsigned int options)
+                                   uint8_t max_grant_version)
 {
-    if ( options )
+    if ( max_grant_version )
         return -EINVAL;
 
     return 0;
-- 
2.47.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABC39CDDD3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837183.1253228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut5-0001Bt-II; Fri, 15 Nov 2024 11:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837183.1253228; Fri, 15 Nov 2024 11:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut4-0000xm-NL; Fri, 15 Nov 2024 11:53:18 +0000
Received: by outflank-mailman (input) for mailman id 837183;
 Fri, 15 Nov 2024 11:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBut1-0005UF-8P
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:15 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fe136ee-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:10 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so2408723a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:10 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:09 -0800 (PST)
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
X-Inumbo-ID: 2fe136ee-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJmZTEzNmVlLWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTkxLjAxNjU3Niwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671590; x=1732276390; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rE1VyD3E57vOSpzTtqjmMt2x6hf09RI8sZ6fi//89E=;
        b=FqfVi9STgeP0izdPg3fN7cnsozxkHlwJqZm7cTk4GbtEvtyFImwKUv75PBHRZ4ryOW
         eYB4uYSR8ny5ECeDK8geZZK3Ik9D+P/k8y9azu116mKyyn756LSADRVTsBr1twEOVsa6
         5dhIheA8pWtbiu/uFfL76iAQnFDYT/ZMHZ3lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671590; x=1732276390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rE1VyD3E57vOSpzTtqjmMt2x6hf09RI8sZ6fi//89E=;
        b=PTusEy5zvdAlyT4aRntoA9hdoDorbdzsjiXRAQ51wI7RPIJ6tqcrCAD0Tm4zRSwypp
         wvI2SHGbQNzg2dmVN4NMf2TJZ8kKSygg/B+GpUK6PK9wEJdGADruyXBWyeRcvT1LObm9
         bpPwhrdhSoubjNN/7rkbwwwTrW2JQjkKOu7th1YQhqKDvc78UzLIPt3MzOE2hycT6mfl
         WruMtSGCQ4TkbuP6RIJ3BB0p9YFLxtHDyK1iPSGerFcN9H0IXPrrCwmXg8tz9gjqW1z6
         rFvv/vISqC3t3S/mE5QKJVLkIp87Lz0Xev7XmZpbA67ojgU2/4UXkjp7kk0eAsNtg1a8
         6faw==
X-Gm-Message-State: AOJu0YwGS/+ugbLfY7Re4c9Okqr/vXDa4YBxqBPpsJzmvTfRkz4BY6Ce
	r8jok0CACxPvCPL87DZlQMm6EBc/bKF/EhhZ0QAL1MWjed2XqOZMKwtZ+zR7A34TttQw/cw0qoG
	7
X-Google-Smtp-Source: AGHT+IEDY0K0AAGiSnjgrcf0bfnRY/vNG5r7/IRULMB5XGUWNKgKilEXyQPOXdFkiFI2g9bSWgs9ZQ==
X-Received: by 2002:a17:907:7b86:b0:a99:d6cf:a1df with SMTP id a640c23a62f3a-aa483525e0bmr175996766b.46.1731671589858;
        Fri, 15 Nov 2024 03:53:09 -0800 (PST)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [RFC PATCH 14/25] xen: Replace common bitmaps in domctl.createdomain with autogenerated versions
Date: Fri, 15 Nov 2024 11:51:43 +0000
Message-ID: <20241115115200.2824-15-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/helpers/init-xenstore-domain.c          |  4 +-
 tools/libs/light/libxl_create.c               | 14 ++---
 tools/ocaml/libs/xc/xenctrl.ml                |  4 +-
 tools/ocaml/libs/xc/xenctrl.mli               |  4 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           |  8 +--
 tools/python/xen/lowlevel/xc/xc.c             |  4 +-
 .../xenbindgen/extra/domctl/createdomain.toml | 59 +++++++++++++++++++
 .../paging-mempool/test-paging-mempool.c      |  2 +-
 tools/tests/resource/test-resource.c          |  8 +--
 tools/tests/tsx/test-tsx.c                    |  4 +-
 xen/arch/arm/dom0less-build.c                 |  4 +-
 xen/arch/arm/domain.c                         |  6 +-
 xen/arch/arm/domain_build.c                   |  4 +-
 xen/arch/x86/domain.c                         | 12 ++--
 xen/arch/x86/include/asm/hvm/nestedhvm.h      |  2 +-
 xen/arch/x86/mm/shadow/common.c               |  4 +-
 xen/arch/x86/setup.c                          |  8 +--
 xen/arch/x86/tboot.c                          |  2 +-
 xen/common/domain.c                           | 18 +++---
 xen/drivers/passthrough/iommu.c               |  4 +-
 xen/include/public/autogen/domctl.h           | 28 +++++++++
 xen/include/public/domctl.h                   | 34 +----------
 xen/include/xen/sched.h                       | 10 ++--
 23 files changed, 152 insertions(+), 95 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index a9f2f9859df6..315aa8b8aec9 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -84,7 +84,7 @@ static int build(xc_interface *xch)
     struct e820entry e820[3];
     struct xen_domctl_createdomain config = {
         .ssidref = SECINITSID_DOMU,
-        .flags = XEN_DOMCTL_CDF_xs_domain,
+        .flags = XEN_DOMCTL_CDF_XS_DOMAIN,
         .max_vcpus = 1,
         .max_evtchn_port = -1, /* No limit. */
 
@@ -176,7 +176,7 @@ static int build(xc_interface *xch)
 
     if ( dom->container_type == XC_DOM_HVM_CONTAINER )
     {
-        config.flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
+        config.flags |= XEN_DOMCTL_CDF_HVM | XEN_DOMCTL_CDF_HAP;
         config.arch.emulation_flags = XEN_X86_EMU_LAPIC;
         dom->target_pages = mem_size >> XC_PAGE_SHIFT;
         dom->mmio_size = GB(4) - LAPIC_BASE_ADDRESS;
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 791b0fac0601..042d01191528 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -648,30 +648,30 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         };
 
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
-            create.flags |= XEN_DOMCTL_CDF_hvm;
+            create.flags |= XEN_DOMCTL_CDF_HVM;
 
             if ( libxl_defbool_val(info->hap) )
-                create.flags |= XEN_DOMCTL_CDF_hap;
+                create.flags |= XEN_DOMCTL_CDF_HAP;
 
             if ( !libxl_defbool_val(info->oos) )
-                create.flags |= XEN_DOMCTL_CDF_oos_off;
+                create.flags |= XEN_DOMCTL_CDF_OOS_OFF;
 
             if ( libxl_defbool_val(b_info->nested_hvm) )
-                create.flags |= XEN_DOMCTL_CDF_nested_virt;
+                create.flags |= XEN_DOMCTL_CDF_NESTED_VIRT;
         }
 
         if (libxl_defbool_val(b_info->vpmu))
-            create.flags |= XEN_DOMCTL_CDF_vpmu;
+            create.flags |= XEN_DOMCTL_CDF_VPMU;
 
         assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
         LOG(DETAIL, "passthrough: %s",
             libxl_passthrough_to_string(info->passthrough));
 
         if (info->passthrough != LIBXL_PASSTHROUGH_DISABLED)
-            create.flags |= XEN_DOMCTL_CDF_iommu;
+            create.flags |= XEN_DOMCTL_CDF_IOMMU;
 
         if (info->passthrough == LIBXL_PASSTHROUGH_SYNC_PT)
-            create.iommu_opts |= XEN_DOMCTL_IOMMU_no_sharept;
+            create.iommu_opts |= XEN_DOMCTL_IOMMU_OPTS_NO_SHAREPT;
 
         LOG(DETAIL, "altp2m: %s", libxl_altp2m_mode_to_string(b_info->altp2m));
         switch(b_info->altp2m) {
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 3c4c95d48319..17c2228704f2 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -49,7 +49,7 @@ type x86_arch_emulation_flags =
   | X86_EMU_VPCI
 
 type x86_arch_misc_flags =
-  | X86_MSR_RELAXED
+  | X86_MISC_MSR_RELAXED
 
 type xen_x86_arch_domainconfig =
   {
@@ -72,7 +72,7 @@ type domain_create_flag =
   | CDF_VPMU
 
 type domain_create_iommu_opts =
-  | IOMMU_NO_SHAREPT
+  | IOMMU_OPTS_NO_SHAREPT
 
 type domctl_create_config =
   {
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 74919a14bec4..0d351ec2e557 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -43,7 +43,7 @@ type x86_arch_emulation_flags =
   | X86_EMU_VPCI
 
 type x86_arch_misc_flags =
-  | X86_MSR_RELAXED
+  | X86_MISC_MSR_RELAXED
 
 type xen_x86_arch_domainconfig = {
   emulation_flags: x86_arch_emulation_flags list;
@@ -65,7 +65,7 @@ type domain_create_flag =
   | CDF_VPMU
 
 type domain_create_iommu_opts =
-  | IOMMU_NO_SHAREPT
+  | IOMMU_OPTS_NO_SHAREPT
 
 type domctl_create_config = {
   ssidref: int32;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index b701f45daa8d..1f2cf41a9cc7 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -232,13 +232,13 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 	domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
 
 	cfg.flags = ocaml_list_to_c_bitmap
-		/* ! domain_create_flag CDF_ lc */
-		/* ! XEN_DOMCTL_CDF_ XEN_DOMCTL_CDF_MAX max */
+		/* ! domain_create_flag CDF_ none */
+		/* ! XEN_DOMCTL_CDF_ XEN_DOMCTL_CDF__ALL all */
 		(VAL_FLAGS);
 
 	cfg.iommu_opts = ocaml_list_to_c_bitmap
-		/* ! domain_create_iommu_opts IOMMU_ lc */
-		/* ! XEN_DOMCTL_IOMMU_ XEN_DOMCTL_IOMMU_MAX max */
+		/* ! domain_create_iommu_opts IOMMU_ none */
+		/* ! XEN_DOMCTL_IOMMU_ XEN_DOMCTL_IOMMU_OPTS__ALL all */
 		(VAL_IOMMU_OPTS);
 
 	arch_domconfig = Field(VAL_ARCH, 0);
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index ba6a61217f9f..d98f18ccc87a 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -158,8 +158,8 @@ static PyObject *pyxc_domain_create(XcObject *self,
     }
 
 #if defined (__i386) || defined(__x86_64__)
-    if ( config.flags & XEN_DOMCTL_CDF_hvm )
-        config.arch.emulation_flags = XEN_X86_EMU_ALL &
+    if ( config.flags & XEN_DOMCTL_CDF_HVM )
+        config.arch.emulation_flags = XEN_X86_EMU__ALL &
                                       ~(XEN_X86_EMU_VPCI |
                                         XEN_X86_EMU_USE_PIRQ);
 #elif defined (__arm__) || defined(__aarch64__)
diff --git a/tools/rust/xenbindgen/extra/domctl/createdomain.toml b/tools/rust/xenbindgen/extra/domctl/createdomain.toml
index 097dc202f352..02f65d134b55 100644
--- a/tools/rust/xenbindgen/extra/domctl/createdomain.toml
+++ b/tools/rust/xenbindgen/extra/domctl/createdomain.toml
@@ -22,3 +22,62 @@ value = 2
 name = "limited"
 description = "Use limited mode for the altp2m."
 value = 3
+
+################################################################################
+
+[[bitmaps]]
+name = "xen_domctl_cdf"
+description = "Content of the `flags` field of the domain creation hypercall."
+typ = { tag = "u32" }
+
+[[bitmaps.bits]]
+name = "hvm"
+description = "Set if this is an HVM guest. Cleared if it's PV."
+shift = 0
+
+[[bitmaps.bits]]
+name = "hap"
+description = "Use hardware-assisted paging if available"
+shift = 1
+
+[[bitmaps.bits]]
+name = "s3_integrity"
+description = "Set if domain memory integrity is to be verified by tboot during Sx."
+shift = 2
+
+[[bitmaps.bits]]
+name = "oos_off"
+description = "Set if Out-of-Sync shadow page tables are to be disabled"
+shift = 3
+
+[[bitmaps.bits]]
+name = "xs_domain"
+description = "Set if this is a xenstore domain"
+shift = 4
+
+[[bitmaps.bits]]
+name = "iommu"
+description = "Set if this is domain can make use of the IOMMU"
+shift = 5
+
+[[bitmaps.bits]]
+name = "nested_virt"
+description = "Set for the domain to have nested virtualization enabled."
+shift = 6
+
+[[bitmaps.bits]]
+name = "vpmu"
+description = "Set to expose a vPMU to this domain."
+shift = 7
+
+################################################################################
+
+[[bitmaps]]
+name = "xen_domctl_iommu_opts"
+description = "Content of the `iommu_opts` field of the domain creation hypercall."
+typ = { tag = "u32" }
+
+[[bitmaps.bits]]
+name = "no_sharept"
+description = "Set to _NOT_ share page tables between the CPU and the IOMMU when it would be possible to do so."
+shift = 0
diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index 512c42803c0e..511c4a710e1f 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -21,7 +21,7 @@ static xc_interface *xch;
 static uint32_t domid;
 
 static struct xen_domctl_createdomain create = {
-    .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+    .flags = XEN_DOMCTL_CDF_HVM | XEN_DOMCTL_CDF_HAP,
     .max_vcpus = 1,
     .max_grant_frames = 1,
     .max_grant_version = 1,
diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index b0a9f5f1e8b6..f541044036d9 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -143,7 +143,7 @@ static void test_domain_configurations(void)
         {
             .name = "x86 PVH",
             .create = {
-                .flags = XEN_DOMCTL_CDF_hvm,
+                .flags = XEN_DOMCTL_CDF_HVM,
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
                 .max_grant_version = 1,
@@ -156,7 +156,7 @@ static void test_domain_configurations(void)
         {
             .name = "ARM",
             .create = {
-                .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+                .flags = XEN_DOMCTL_CDF_HVM | XEN_DOMCTL_CDF_HAP,
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
                 .max_grant_version = 1,
@@ -175,7 +175,7 @@ static void test_domain_configurations(void)
         printf("Test %s\n", t->name);
 
 #if defined(__x86_64__) || defined(__i386__)
-        if ( t->create.flags & XEN_DOMCTL_CDF_hvm )
+        if ( t->create.flags & XEN_DOMCTL_CDF_HVM )
         {
             if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hvm) )
             {
@@ -188,7 +188,7 @@ static void test_domain_configurations(void)
              * SHADOW is available.
              */
             if ( physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap )
-                t->create.flags |= XEN_DOMCTL_CDF_hap;
+                t->create.flags |= XEN_DOMCTL_CDF_HAP;
             else if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_shadow) )
             {
                 printf("  Skip: Neither HAP or SHADOW available\n");
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index 324bcf67153a..a3097515b280 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -467,7 +467,7 @@ static void test_guests(void)
     if ( xen_has_hvm )
     {
         struct xen_domctl_createdomain c = {
-            .flags = XEN_DOMCTL_CDF_hvm,
+            .flags = XEN_DOMCTL_CDF_HVM,
             .max_vcpus = 1,
             .max_grant_frames = 1,
             .max_grant_version = 1,
@@ -477,7 +477,7 @@ static void test_guests(void)
         };
 
         if ( physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hap )
-            c.flags |= XEN_DOMCTL_CDF_hap;
+            c.flags |= XEN_DOMCTL_CDF_HAP;
         else if ( !(physinfo.capabilities & XEN_SYSCTL_PHYSCAP_shadow) )
             return fail("  HVM available, but neither HAP nor Shadow\n");
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 1c6219c7cc82..cd8e59aa762a 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -867,7 +867,7 @@ void __init create_domUs(void)
         struct domain *d;
         struct xen_domctl_createdomain d_cfg = {
             .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
-            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+            .flags = XEN_DOMCTL_CDF_HVM | XEN_DOMCTL_CDF_HAP,
             /*
              * The default of 1023 should be sufficient for guests because
              * on ARM we don't bind physical interrupts to event channels.
@@ -912,7 +912,7 @@ void __init create_domUs(void)
         if ( iommu_enabled &&
              (iommu || dt_find_compatible_node(node, NULL,
                                                "multiboot,device-tree")) )
-            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+            d_cfg.flags |= XEN_DOMCTL_CDF_IOMMU;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index c6c5a0d1af23..54e849b02f9e 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -567,7 +567,7 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.hcr_el2 = get_default_hcr_flags();
 
     v->arch.mdcr_el2 = HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
-    if ( !(v->domain->options & XEN_DOMCTL_CDF_vpmu) )
+    if ( !(v->domain->options & XEN_DOMCTL_CDF_VPMU) )
         v->arch.mdcr_el2 |= HDCR_TPM | HDCR_TPMCR;
 
     if ( (rc = vcpu_vgic_init(v)) != 0 )
@@ -607,8 +607,8 @@ void vcpu_switch_to_aarch64_mode(struct vcpu *v)
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
-    unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
-    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
+    unsigned int flags_required = (XEN_DOMCTL_CDF_HVM | XEN_DOMCTL_CDF_HAP);
+    unsigned int flags_optional = (XEN_DOMCTL_CDF_IOMMU | XEN_DOMCTL_CDF_VPMU);
     unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
     if ( (config->flags & ~flags_optional) != flags_required )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 773412ba2acb..08b251617bae 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2190,7 +2190,7 @@ void __init create_dom0(void)
 {
     struct domain *dom0;
     struct xen_domctl_createdomain dom0_cfg = {
-        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+        .flags = XEN_DOMCTL_CDF_HVM | XEN_DOMCTL_CDF_HAP,
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
@@ -2211,7 +2211,7 @@ void __init create_dom0(void)
     dom0_cfg.max_vcpus = dom0_max_vcpus();
 
     if ( iommu_enabled )
-        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+        dom0_cfg.flags |= XEN_DOMCTL_CDF_IOMMU;
 
     if ( opt_dom0_sve )
     {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1ef095f349f7..63a52a8ae23d 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -633,9 +633,9 @@ void arch_vcpu_destroy(struct vcpu *v)
 
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
-    bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
-    bool hap = config->flags & XEN_DOMCTL_CDF_hap;
-    bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
+    bool hvm = config->flags & XEN_DOMCTL_CDF_HVM;
+    bool hap = config->flags & XEN_DOMCTL_CDF_HAP;
+    bool nested_virt = config->flags & XEN_DOMCTL_CDF_NESTED_VIRT;
     unsigned int max_vcpus;
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -654,7 +654,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     }
 
     if ( !IS_ENABLED(CONFIG_TBOOT) &&
-         (config->flags & XEN_DOMCTL_CDF_s3_integrity) )
+         (config->flags & XEN_DOMCTL_CDF_S3_INTEGRITY) )
     {
         dprintk(XENLOG_INFO, "S3 integrity check not valid without CONFIG_TBOOT\n");
         return -EINVAL;
@@ -668,10 +668,10 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
     if ( !hvm )
         /*
-         * It is only meaningful for XEN_DOMCTL_CDF_oos_off to be clear
+         * It is only meaningful for XEN_DOMCTL_CDF_OOS_OFF to be clear
          * for HVM guests.
          */
-        config->flags |= XEN_DOMCTL_CDF_oos_off;
+        config->flags |= XEN_DOMCTL_CDF_OOS_OFF;
 
     if ( nested_virt && !hvm_nested_virt_supported() )
     {
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index ea2c1bc328c7..64e9e18a8cfd 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -25,7 +25,7 @@ enum nestedhvm_vmexits {
 /* Nested HVM on/off per domain */
 static inline bool nestedhvm_enabled(const struct domain *d)
 {
-    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
+    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_NESTED_VIRT);
 }
 
 /* Nested VCPU */
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 0176e33bc9c7..f103f19e9220 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2344,7 +2344,7 @@ static void sh_update_paging_modes(struct vcpu *v)
 #endif /* (SHADOW_OPTIMIZATIONS & SHOPT_VIRTUAL_TLB) */
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
-    if ( !(d->options & XEN_DOMCTL_CDF_oos_off) &&
+    if ( !(d->options & XEN_DOMCTL_CDF_OOS_OFF) &&
          mfn_eq(v->arch.paging.shadow.oos_snapshot[0], INVALID_MFN) )
     {
         int i;
@@ -2491,7 +2491,7 @@ static void sh_update_paging_modes(struct vcpu *v)
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
     /* We need to check that all the vcpus have paging enabled to
      * unsync PTs. */
-    if ( !(d->options & XEN_DOMCTL_CDF_oos_off) )
+    if ( !(d->options & XEN_DOMCTL_CDF_OOS_OFF) )
     {
         int pe = 1;
         struct vcpu *vptr;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0443555d9bb8..65ea3fc86beb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -960,7 +960,7 @@ static struct domain *__init create_dom0(const module_t *image,
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
 
     struct xen_domctl_createdomain dom0_cfg = {
-        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
+        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_S3_INTEGRITY : 0,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
@@ -975,16 +975,16 @@ static struct domain *__init create_dom0(const module_t *image,
 
     if ( opt_dom0_pvh )
     {
-        dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
+        dom0_cfg.flags |= (XEN_DOMCTL_CDF_HVM |
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
-                            XEN_DOMCTL_CDF_hap : 0));
+                            XEN_DOMCTL_CDF_HAP : 0));
 
         dom0_cfg.arch.emulation_flags |=
             XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
     }
 
     if ( iommu_enabled )
-        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+        dom0_cfg.flags |= XEN_DOMCTL_CDF_IOMMU;
 
     /* Create initial domain.  Not d0 for pvshim. */
     domid = get_initial_domain_id();
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index d5db60d335e3..648a5269bb8a 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -203,7 +203,7 @@ static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
     vmac_set_key((uint8_t *)key, &ctx);
     for_each_domain( d )
     {
-        if ( !(d->options & XEN_DOMCTL_CDF_s3_integrity) )
+        if ( !(d->options & XEN_DOMCTL_CDF_S3_INTEGRITY) )
             continue;
         printk("MACing Domain %u\n", d->domain_id);
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index ad19ff1cef23..799f76bf042d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -564,16 +564,16 @@ static void _domain_destroy(struct domain *d)
 
 static int sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
-    bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
-    bool hap = config->flags & XEN_DOMCTL_CDF_hap;
-    bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
-    bool vpmu = config->flags & XEN_DOMCTL_CDF_vpmu;
+    bool hvm = config->flags & XEN_DOMCTL_CDF_HVM;
+    bool hap = config->flags & XEN_DOMCTL_CDF_HAP;
+    bool iommu = config->flags & XEN_DOMCTL_CDF_IOMMU;
+    bool vpmu = config->flags & XEN_DOMCTL_CDF_VPMU;
 
     if ( config->flags &
-         ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
-           XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
-           XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
+         ~(XEN_DOMCTL_CDF_HVM | XEN_DOMCTL_CDF_HAP |
+           XEN_DOMCTL_CDF_S3_INTEGRITY | XEN_DOMCTL_CDF_OOS_OFF |
+           XEN_DOMCTL_CDF_XS_DOMAIN | XEN_DOMCTL_CDF_IOMMU |
+           XEN_DOMCTL_CDF_NESTED_VIRT | XEN_DOMCTL_CDF_VPMU) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
@@ -600,7 +600,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
 
     if ( iommu )
     {
-        if ( config->iommu_opts & ~XEN_DOMCTL_IOMMU_no_sharept )
+        if ( config->iommu_opts & ~XEN_DOMCTL_IOMMU_OPTS_NO_SHAREPT )
         {
             dprintk(XENLOG_INFO, "Unknown IOMMU options %#x\n",
                     config->iommu_opts);
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 9e74a1fc72fa..1d133e56c0bb 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -224,7 +224,7 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
      * be enabled.
      */
     hd->hap_pt_share = hap_enabled(d) && iommu_hap_pt_share &&
-        !(opts & XEN_DOMCTL_IOMMU_no_sharept);
+        !(opts & XEN_DOMCTL_IOMMU_OPTS_NO_SHAREPT);
 
     /*
      * NB: 'relaxed' h/w domains don't need the IOMMU mappings to be kept
@@ -542,7 +542,7 @@ int iommu_quarantine_dev_init(device_t *dev)
 
 static int __init iommu_quarantine_init(void)
 {
-    dom_io->options |= XEN_DOMCTL_CDF_iommu;
+    dom_io->options |= XEN_DOMCTL_CDF_IOMMU;
 
     return iommu_domain_init(dom_io, 0);
 }
diff --git a/xen/include/public/autogen/domctl.h b/xen/include/public/autogen/domctl.h
index 00202f5e65b9..bd1f4bedc727 100644
--- a/xen/include/public/autogen/domctl.h
+++ b/xen/include/public/autogen/domctl.h
@@ -18,5 +18,33 @@ enum xen_domctl_altp2m_mode {
     XEN_DOMCTL_ALTP2M_MODE_LIMITED = 3,
 };
 
+/* Content of the `flags` field of the domain creation hypercall. */
+struct xen_domctl_cdf {}; /* GREP FODDER */
+/* Set if this is an HVM guest. Cleared if it's PV. */
+#define XEN_DOMCTL_CDF_HVM (1U << 0)
+/* Use hardware-assisted paging if available */
+#define XEN_DOMCTL_CDF_HAP (1U << 1)
+/* Set if domain memory integrity is to be verified by tboot during Sx. */
+#define XEN_DOMCTL_CDF_S3_INTEGRITY (1U << 2)
+/* Set if Out-of-Sync shadow page tables are to be disabled */
+#define XEN_DOMCTL_CDF_OOS_OFF (1U << 3)
+/* Set if this is a xenstore domain */
+#define XEN_DOMCTL_CDF_XS_DOMAIN (1U << 4)
+/* Set if this is domain can make use of the IOMMU */
+#define XEN_DOMCTL_CDF_IOMMU (1U << 5)
+/* Set for the domain to have nested virtualization enabled. */
+#define XEN_DOMCTL_CDF_NESTED_VIRT (1U << 6)
+/* Set to expose a vPMU to this domain. */
+#define XEN_DOMCTL_CDF_VPMU (1U << 7)
+/* Mask covering all defined bits */
+#define XEN_DOMCTL_CDF__ALL (0xFFU)
+
+/* Content of the `iommu_opts` field of the domain creation hypercall. */
+struct xen_domctl_iommu_opts {}; /* GREP FODDER */
+/* Set to _NOT_ share page tables between the CPU and the IOMMU when it would be possible to do so. */
+#define XEN_DOMCTL_IOMMU_OPTS_NO_SHAREPT (1U << 0)
+/* Mask covering all defined bits */
+#define XEN_DOMCTL_IOMMU_OPTS__ALL (0x1U)
+
 #endif /* __XEN_AUTOGEN_DOMCTL_H */
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 95d62c859302..2d1423f6fd91 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -45,40 +45,10 @@ struct xen_domctl_createdomain {
     /* IN parameters */
     uint32_t ssidref;
     xen_domain_handle_t handle;
- /* Is this an HVM guest (as opposed to a PV guest)? */
-#define _XEN_DOMCTL_CDF_hvm           0
-#define XEN_DOMCTL_CDF_hvm            (1U<<_XEN_DOMCTL_CDF_hvm)
- /* Use hardware-assisted paging if available? */
-#define _XEN_DOMCTL_CDF_hap           1
-#define XEN_DOMCTL_CDF_hap            (1U<<_XEN_DOMCTL_CDF_hap)
- /* Should domain memory integrity be verifed by tboot during Sx? */
-#define _XEN_DOMCTL_CDF_s3_integrity  2
-#define XEN_DOMCTL_CDF_s3_integrity   (1U<<_XEN_DOMCTL_CDF_s3_integrity)
- /* Disable out-of-sync shadow page tables? */
-#define _XEN_DOMCTL_CDF_oos_off       3
-#define XEN_DOMCTL_CDF_oos_off        (1U<<_XEN_DOMCTL_CDF_oos_off)
- /* Is this a xenstore domain? */
-#define _XEN_DOMCTL_CDF_xs_domain     4
-#define XEN_DOMCTL_CDF_xs_domain      (1U<<_XEN_DOMCTL_CDF_xs_domain)
- /* Should this domain be permitted to use the IOMMU? */
-#define _XEN_DOMCTL_CDF_iommu         5
-#define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
-#define _XEN_DOMCTL_CDF_nested_virt   6
-#define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
-/* Should we expose the vPMU to the guest? */
-#define XEN_DOMCTL_CDF_vpmu           (1U << 7)
-
-/* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
 
+    /* See xen_domctl_cdf */
     uint32_t flags;
-
-#define _XEN_DOMCTL_IOMMU_no_sharept  0
-#define XEN_DOMCTL_IOMMU_no_sharept   (1U << _XEN_DOMCTL_IOMMU_no_sharept)
-
-/* Max XEN_DOMCTL_IOMMU_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_IOMMU_MAX XEN_DOMCTL_IOMMU_no_sharept
-
+    /* See xen_domctl_iommu_opts */
     uint32_t iommu_opts;
 
     /*
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 90666576c2f8..1b75277e5dea 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1125,7 +1125,7 @@ static always_inline bool is_control_domain(const struct domain *d)
 static always_inline bool is_pv_domain(const struct domain *d)
 {
     return IS_ENABLED(CONFIG_PV) &&
-        evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
+        evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_HVM));
 }
 
 static always_inline bool is_pv_vcpu(const struct vcpu *v)
@@ -1167,7 +1167,7 @@ static always_inline bool is_pv_64bit_vcpu(const struct vcpu *v)
 static always_inline bool is_hvm_domain(const struct domain *d)
 {
     return IS_ENABLED(CONFIG_HVM) &&
-        evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm);
+        evaluate_nospec(d->options & XEN_DOMCTL_CDF_HVM);
 }
 
 static always_inline bool is_hvm_vcpu(const struct vcpu *v)
@@ -1179,7 +1179,7 @@ static always_inline bool hap_enabled(const struct domain *d)
 {
     /* sanitise_domain_config() rejects HAP && !HVM */
     return IS_ENABLED(CONFIG_HVM) &&
-        evaluate_nospec(d->options & XEN_DOMCTL_CDF_hap);
+        evaluate_nospec(d->options & XEN_DOMCTL_CDF_HAP);
 }
 
 static inline bool is_hwdom_pinned_vcpu(const struct vcpu *v)
@@ -1195,12 +1195,12 @@ static inline bool is_vcpu_online(const struct vcpu *v)
 
 static inline bool is_xenstore_domain(const struct domain *d)
 {
-    return d->options & XEN_DOMCTL_CDF_xs_domain;
+    return d->options & XEN_DOMCTL_CDF_XS_DOMAIN;
 }
 
 static always_inline bool is_iommu_enabled(const struct domain *d)
 {
-    return evaluate_nospec(d->options & XEN_DOMCTL_CDF_iommu);
+    return evaluate_nospec(d->options & XEN_DOMCTL_CDF_IOMMU);
 }
 
 extern bool sched_smt_power_savings;
-- 
2.47.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930379CDDC6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837167.1253110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusq-0005vw-EJ; Fri, 15 Nov 2024 11:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837167.1253110; Fri, 15 Nov 2024 11:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusq-0005nH-44; Fri, 15 Nov 2024 11:53:04 +0000
Received: by outflank-mailman (input) for mailman id 837167;
 Fri, 15 Nov 2024 11:53:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBuso-0005U9-Mb
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:02 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27f23757-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:52:57 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9ef275b980so110462066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:52:57 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:52:56 -0800 (PST)
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
X-Inumbo-ID: 27f23757-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI3ZjIzNzU3LWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTc3LjY3OTk5Mywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671577; x=1732276377; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnUruHtiBjMQURAk6r67+S2KIYkG9l4j/nhhDyE0lxU=;
        b=TQdxwcj0vfl8Z4r76UuGQgAvehXgC7zclcKZhTgx93f4xIIhNC6dKLmrLwN44d5iWO
         0Ep75AvsyIbhaTQxo3ba3PWHbJfwW/dazYgTy2na272LvVdfWdi5PoYCmiwTtGqeCwh9
         EuxjyprT/1LgyHNm53kDb2Ljl6/+vK070j/RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671577; x=1732276377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnUruHtiBjMQURAk6r67+S2KIYkG9l4j/nhhDyE0lxU=;
        b=pEcukVvN8/BB/6Bz5R84RadI8B8T/GzOpcya8Yf1JUVFnfINezD49GvSsWqS1jFayK
         vI8Lwecb9y/BvN7VvcfFDopfrnyAKOx0gg5gDVrnFw8anDvCkKeeK+Ij4qFDZ9hxyJXj
         xmJupQhPhQuRWjI9HcmBuY55QamWoOEi4tP64yao3e0SaQw54nRXOxSeYOwJBa3wGOFZ
         jMjWTl9ItW8G4Hrpmiygg7f3xK0sIp9e0EVSbJJt06wNrNWnrc5b3+80SBgLzf/0ocbS
         acRIddaIIkYSX+VZbwNjGTnH1aOgd8gByj+FyP6iBXFFHw0vAc1sCbKEY1Fbv9eu6qr1
         Meqg==
X-Gm-Message-State: AOJu0YyK+KN47UOjVr94YKoJq7h9FB9kzovylPReTwhH5MmTSPapFEng
	uyU3xoqTBpD00F/z03fUhJFYeHG4chhYLfcoQncTLAYt1+KrSv8zUbIhiPJmWIbaYs/QTLx3Ze4
	n
X-Google-Smtp-Source: AGHT+IGILk9OK5J7KLLfKUoMnXFsNUvPeAvKjx9rCUT4nS0cebUMT0Ne3Hliiw7Pvamek+LfNvJilg==
X-Received: by 2002:a17:906:dac7:b0:aa4:777d:739a with SMTP id a640c23a62f3a-aa4833e9fcbmr205498566b.8.1731671576796;
        Fri, 15 Nov 2024 03:52:56 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 02/25] xen/domctl: Replace altp2m_opts with altp2m_mode
Date: Fri, 15 Nov 2024 11:51:31 +0000
Message-ID: <20241115115200.2824-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change, in the same direction as the previous grant_opts
to max_grant_version.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/light/libxl_create.c     | 11 ++++-------
 tools/ocaml/libs/xc/xenctrl.ml      |  2 +-
 tools/ocaml/libs/xc/xenctrl.mli     |  2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c |  6 +++---
 xen/arch/arm/domain.c               |  2 +-
 xen/arch/x86/domain.c               | 13 ++-----------
 xen/arch/x86/hvm/hvm.c              |  6 +++++-
 xen/common/domain.c                 |  3 ++-
 xen/include/public/domctl.h         | 12 +++++++-----
 9 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 87594809abc8..3ae922e8931b 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -676,22 +676,19 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         LOG(DETAIL, "altp2m: %s", libxl_altp2m_mode_to_string(b_info->altp2m));
         switch(b_info->altp2m) {
         case LIBXL_ALTP2M_MODE_MIXED:
-            create.altp2m_opts |=
-                XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_mixed);
+            create.altp2m_mode = XEN_DOMCTL_ALTP2M_mixed;
             break;
 
         case LIBXL_ALTP2M_MODE_EXTERNAL:
-            create.altp2m_opts |=
-                XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_external);
+            create.altp2m_mode = XEN_DOMCTL_ALTP2M_external;
             break;
 
         case LIBXL_ALTP2M_MODE_LIMITED:
-            create.altp2m_opts |=
-                XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_limited);
+            create.altp2m_mode = XEN_DOMCTL_ALTP2M_limited;
             break;
 
         case LIBXL_ALTP2M_MODE_DISABLED:
-            /* Nothing to do - altp2m disabled is signaled as mode == 0. */
+            create.altp2m_mode = XEN_DOMCTL_ALTP2M_disabled;
             break;
         }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2690f9a92316..3c4c95d48319 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -85,7 +85,7 @@ type domctl_create_config =
     max_grant_frames: int;
     max_maptrack_frames: int;
     max_grant_version: int;
-    altp2m_opts: int32;
+    altp2m_mode: int32;
     vmtrace_buf_kb: int32;
     cpupool_id: int32;
     arch: arch_domainconfig;
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index febbe1f6ae3f..74919a14bec4 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -77,7 +77,7 @@ type domctl_create_config = {
   max_grant_frames: int;
   max_maptrack_frames: int;
   max_grant_version: int;
-  altp2m_opts: int32;
+  altp2m_mode: int32;
   vmtrace_buf_kb: int32;
   cpupool_id: int32;
   arch: arch_domainconfig;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 67a690308f1a..b701f45daa8d 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -204,7 +204,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
 #define VAL_MAX_GRANT_VERSION   Field(config, 8)
-#define VAL_ALTP2M_OPTS         Field(config, 9)
+#define VAL_ALTP2M_MODE         Field(config, 9)
 #define VAL_VMTRACE_BUF_KB      Field(config, 10)
 #define VAL_CPUPOOL_ID          Field(config, 11)
 #define VAL_ARCH                Field(config, 12)
@@ -224,7 +224,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
 		.max_grant_version = Int_val(VAL_MAX_GRANT_VERSION),
-		.altp2m_opts = Int32_val(VAL_ALTP2M_OPTS),
+		.altp2m_mode = Int32_val(VAL_ALTP2M_MODE),
 		.vmtrace_size = vmtrace_size,
 		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
 	};
@@ -283,7 +283,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #undef VAL_ARCH
 #undef VAL_CPUPOOL_ID
 #undef VAL_VMTRACE_BUF_KB
-#undef VAL_ALTP2M_OPTS
+#undef VAL_ALTP2M_MODE
 #undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 3ba959f86633..c6c5a0d1af23 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -688,7 +688,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->altp2m_opts )
+    if ( config->altp2m_mode )
     {
         dprintk(XENLOG_INFO, "Altp2m not supported\n");
         return -EINVAL;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812c9..1ef095f349f7 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -637,8 +637,6 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
     unsigned int max_vcpus;
-    unsigned int altp2m_mode = MASK_EXTR(config->altp2m_opts,
-                                         XEN_DOMCTL_ALTP2M_mode_mask);
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
     {
@@ -717,21 +715,14 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->altp2m_opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
-    {
-        dprintk(XENLOG_INFO, "Invalid altp2m options selected: %#x\n",
-                config->flags);
-        return -EINVAL;
-    }
-
-    if ( altp2m_mode && nested_virt )
+    if ( config->altp2m_mode && nested_virt )
     {
         dprintk(XENLOG_INFO,
                 "Nested virt and altp2m are not supported together\n");
         return -EINVAL;
     }
 
-    if ( altp2m_mode && !hap )
+    if ( config->altp2m_mode && !hap )
     {
         dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
         return -EINVAL;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 74e58c653e6f..e30c3026479e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -659,7 +659,7 @@ int hvm_domain_initialise(struct domain *d,
     d->arch.hvm.params[HVM_PARAM_TRIPLE_FAULT_REASON] = SHUTDOWN_reboot;
 
     /* Set altp2m based on domctl flags. */
-    switch ( MASK_EXTR(config->altp2m_opts, XEN_DOMCTL_ALTP2M_mode_mask) )
+    switch ( config->altp2m_mode )
     {
     case XEN_DOMCTL_ALTP2M_mixed:
         d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_mixed;
@@ -672,6 +672,10 @@ int hvm_domain_initialise(struct domain *d,
     case XEN_DOMCTL_ALTP2M_limited:
         d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_limited;
         break;
+
+    case XEN_DOMCTL_ALTP2M_disabled:
+        d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_disabled;
+        break;
     }
 
     vpic_init(d);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 86f0e99e0d4a..ad19ff1cef23 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -579,7 +579,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->rsvd0[0] | config->rsvd0[1] | config->rsvd0[2] )
+    if ( config->rsvd0_a[0] | config->rsvd0_a[1] | config->rsvd0_a[2] |
+         config->rsvd0_b[0] | config->rsvd0_b[1] | config->rsvd0_b[2] )
     {
         dprintk(XENLOG_INFO, "Rubble in rsvd0 padding\n");
         return -EINVAL;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index e37d4337dcf9..95a3b6769f7f 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -101,8 +101,10 @@ struct xen_domctl_createdomain {
     uint8_t max_grant_version;
 
     /* Unused. Reserved to zero. */
-    uint8_t rsvd0[3];
+    uint8_t rsvd0_a[3];
 
+/* Keep altp2m disabled */
+#define XEN_DOMCTL_ALTP2M_disabled   (0U)
 /*
  * Enable altp2m mixed mode.
  *
@@ -116,10 +118,10 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_ALTP2M_external   (2U)
 /* Enable altp2m limited mode. */
 #define XEN_DOMCTL_ALTP2M_limited    (3U)
-/* Altp2m mode signaling uses bits [0, 1]. */
-#define XEN_DOMCTL_ALTP2M_mode_mask  (0x3U)
-#define XEN_DOMCTL_ALTP2M_mode(m)    ((m) & XEN_DOMCTL_ALTP2M_mode_mask)
-    uint32_t altp2m_opts;
+    uint8_t altp2m_mode;
+
+    /* Unused. Reserved to zero. */
+    uint8_t rsvd0_b[3];
 
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
-- 
2.47.0



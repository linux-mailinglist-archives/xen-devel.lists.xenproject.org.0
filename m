Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3EAB04AFF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043176.1413297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyq-0004Ox-Ey; Mon, 14 Jul 2025 22:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043176.1413297; Mon, 14 Jul 2025 22:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyq-0004Lf-Ao; Mon, 14 Jul 2025 22:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1043176;
 Mon, 14 Jul 2025 22:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRyo-00040h-T6
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:02 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbf09e7f-6104-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 00:49:01 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4f64cdc2dso695760f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:49:01 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd18ffsm13288903f8f.9.2025.07.14.15.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:48:59 -0700 (PDT)
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
X-Inumbo-ID: bbf09e7f-6104-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533340; x=1753138140; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7PeFG4j0+6wg/8x4w0BGJXrwiGp05DFafVuw1va9HQ=;
        b=HCNClcgDpCElMafVOCroI8gklpeVDR8wuBn44JSvT1+f9I2HMQUPsADtx9ZdDs+W38
         eV5JUYhfBpBxff15C57jvSBfXG/MWM9t2mbD4RRrGE+wEo6mSpG0rvlVX0zh1sNBnHk4
         t0z+djHWZGmydu8z9K+YWEFXzipP/xl+bncQkGlkLq7ACBvOQUxN/8TycPeLRdQGZUUs
         4ziZxtX1wjoVuQ72aa2OeFsMe7VOOjVG84lNzbF5/KNTq4t/eYknX7HmNzj8/zt95hIz
         r9atqNw4ItQKlAiTWMpzOONWCZKj1AG09PHa2cxJXOaVKDvtSB837k3Oz6y2KwHQMl0+
         GCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533340; x=1753138140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7PeFG4j0+6wg/8x4w0BGJXrwiGp05DFafVuw1va9HQ=;
        b=b1jZXHIwEyYSU/IZ2VWeE0b/dMkJyVlreULLrQhnvImYguVoYK62d0R8IJaqtgiQYJ
         a9YdUdzTEaHpmf2Wxbolc2Hht75ORmoX8CBOI9MTuGCEtlbKruyFN9x5YucniL639DPe
         g1zYap7T2gcN/BdMlkBGSejPGE1silhbj/tRDM6Eg1EDb/P5mwfSVUnzZzWCSQ6npkHJ
         gVYdBES0TTQdqmLx7NCI5/jBhAxc1MMuz+SIFyAkxiz1ceLpByVzRI1uf9OhA4tiSCya
         uiM5ytJmhWKS41OqbntIYlc4oV3DrZkOAEVJn08JfCreqLtfrxyH29eIfV/owfCRSrFA
         4yuQ==
X-Gm-Message-State: AOJu0Yz9+zEhhDcjLaBiFwIRq1NTrQh0RAd3QU2IkrBq92Nl5gJJ75Ns
	5gy8NXJDxFn8GEzi+4zOCdxgun/vBprHUFr3izswdNu4yD3o2UHDVvKYjQOsoA==
X-Gm-Gg: ASbGnctTToiu3/ExgkRPocNYYL9Oj3gYJe4S31AXZzxFUDXk78HCuJAHM4slNq5b1Yu
	JoDPwFYIuswpJTAbLFUhQGTTKOqdAVQW1Z6ZcEVj0iSToLizU1dLtelq1Oj97PVnUbrSrxNa76V
	RK9G+2lYvrFeL4yehZfg8lAfFJm4BIeNWjR38Nk/BbzUaVUo3OToVf1/vWMdbIsIKwb1LoA+7iK
	z+pPXt08yye2CFIE/xSfVkPxSOmy7DyrEvv8GoPKFMH3cEnh3CiRgKKKXxtLzb7dVVwI3Tg+roB
	CmCLOuA9MdgPBVOdNd4pzPJKVzJchOym1nNXpm+awIW3PX0iMzJFH0PJX+Pfu1KKFn3/mQyiDk/
	ku9iy0hbtPwm+XTPXHUXkalU74r22aEuxeDRUy0giTNZ/Vg4cabI7UJXt22VATJhNu/lz+taZ9O
	3m/JPDGtRBzvAhpElWJ9Brkg==
X-Google-Smtp-Source: AGHT+IEq1c3ozI1xTvwm7eOIJ9g+ASHaw5Ngv2QUus83unSuu4Z/ZANkRIUMcuqvYPKy8lsTfs0i0g==
X-Received: by 2002:a05:6000:2388:b0:3a3:6e85:a550 with SMTP id ffacd0b85a97d-3b5f185a966mr4950180f8f.5.1752533340066;
        Mon, 14 Jul 2025 15:49:00 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Christian Lindig <christian.lindig@cloud.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 1/7] xen: Refactor altp2m options into a structured format
Date: Mon, 14 Jul 2025 22:48:48 +0000
Message-Id: <b15a2ae82d79e6cded837733725384b9ecd07a85.1752531797.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752531797.git.w1benny@gmail.com>
References: <cover.1752531797.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Encapsulate the altp2m options within a struct. This change is preparatory
and sets the groundwork for introducing additional parameter in subsequent
commit.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
Acked-by: Julien Grall <jgrall@amazon.com> # arm
Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
---
 tools/libs/light/libxl_create.c     | 6 +++---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 4 +++-
 xen/arch/arm/domain.c               | 2 +-
 xen/arch/x86/domain.c               | 4 ++--
 xen/arch/x86/hvm/hvm.c              | 2 +-
 xen/include/public/domctl.h         | 4 +++-
 6 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 9525d22312..8a85fba1cf 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -622,17 +622,17 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         LOG(DETAIL, "altp2m: %s", libxl_altp2m_mode_to_string(b_info->altp2m));
         switch(b_info->altp2m) {
         case LIBXL_ALTP2M_MODE_MIXED:
-            create.altp2m_opts |=
+            create.altp2m.opts |=
                 XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_mixed);
             break;
 
         case LIBXL_ALTP2M_MODE_EXTERNAL:
-            create.altp2m_opts |=
+            create.altp2m.opts |=
                 XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_external);
             break;
 
         case LIBXL_ALTP2M_MODE_LIMITED:
-            create.altp2m_opts |=
+            create.altp2m.opts |=
                 XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_limited);
             break;
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 863ab3c778..b51fd66788 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -225,7 +225,9 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
 		.grant_opts =
 		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
-		.altp2m_opts = Int32_val(VAL_ALTP2M_OPTS),
+		.altp2m = {
+			.opts = Int32_val(VAL_ALTP2M_OPTS),
+		},
 		.vmtrace_size = vmtrace_size,
 		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
 	};
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index be58a23dd7..79a144e61b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -693,7 +693,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->altp2m_opts )
+    if ( config->altp2m.opts )
     {
         dprintk(XENLOG_INFO, "Altp2m not supported\n");
         return -EINVAL;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b67342797f..56c3816187 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -622,7 +622,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
     unsigned int max_vcpus;
-    unsigned int altp2m_mode = MASK_EXTR(config->altp2m_opts,
+    unsigned int altp2m_mode = MASK_EXTR(config->altp2m.opts,
                                          XEN_DOMCTL_ALTP2M_mode_mask);
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -709,7 +709,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->altp2m_opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
+    if ( config->altp2m.opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
     {
         dprintk(XENLOG_INFO, "Invalid altp2m options selected: %#x\n",
                 config->flags);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 056360d5fe..56c7de3977 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -665,7 +665,7 @@ int hvm_domain_initialise(struct domain *d,
     d->arch.hvm.params[HVM_PARAM_TRIPLE_FAULT_REASON] = SHUTDOWN_reboot;
 
     /* Set altp2m based on domctl flags. */
-    switch ( MASK_EXTR(config->altp2m_opts, XEN_DOMCTL_ALTP2M_mode_mask) )
+    switch ( MASK_EXTR(config->altp2m.opts, XEN_DOMCTL_ALTP2M_mode_mask) )
     {
     case XEN_DOMCTL_ALTP2M_mixed:
         d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_mixed;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index be19ab5e26..a69dd96084 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -99,6 +99,7 @@ struct xen_domctl_createdomain {
 
     uint32_t grant_opts;
 
+    struct {
 /*
  * Enable altp2m mixed mode.
  *
@@ -115,7 +116,8 @@ struct xen_domctl_createdomain {
 /* Altp2m mode signaling uses bits [0, 1]. */
 #define XEN_DOMCTL_ALTP2M_mode_mask  (0x3U)
 #define XEN_DOMCTL_ALTP2M_mode(m)    ((m) & XEN_DOMCTL_ALTP2M_mode_mask)
-    uint32_t altp2m_opts;
+        uint32_t opts;
+    } altp2m;
 
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
-- 
2.34.1



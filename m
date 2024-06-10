Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D78D902786
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 19:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737468.1143802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXq-000113-SF; Mon, 10 Jun 2024 17:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737468.1143802; Mon, 10 Jun 2024 17:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXq-0000zX-Oq; Mon, 10 Jun 2024 17:10:58 +0000
Received: by outflank-mailman (input) for mailman id 737468;
 Mon, 10 Jun 2024 17:10:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGiXo-0000kp-H8
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 17:10:56 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66438e4c-274c-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 19:10:56 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe63a96so6034347a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 10:10:56 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c76740d6asm3233169a12.7.2024.06.10.10.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:10:54 -0700 (PDT)
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
X-Inumbo-ID: 66438e4c-274c-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718039455; x=1718644255; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0bBFO5q1RXhnEhFZi3YywzgmIW8ZFC/EvRHCN4/klw=;
        b=iwt/fm6Er4vVeB3dnZnO2tWRoaadhMQzz6Gz87MFKKWzdjDnNCyetdkzR87aEC80It
         wUK9/wq/ywqhK8GP3njxkwOPKhfe6m5kWKtD2HlVgkPdPWObnP4IxW6896T6ancIYmxh
         UT6CzAzE36sizTBOU/f95sMHmo1ge1oIZjz6JtTBbHE/HjZs6KaU2FzD30xaSlXvQnBy
         LvrLFyBORnWfrWlMSgZedFWBSmWAQc18G1N8ChqiWvyV4y7WV7LCbY2hG4oUJofhUMgI
         8rp0iBgqSoVMoMIqZNKkIfeeV7UbTqQHil2ZpMzJ9rDwS+nPax2FQL2ZGTh6Trbp68um
         AgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718039455; x=1718644255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0bBFO5q1RXhnEhFZi3YywzgmIW8ZFC/EvRHCN4/klw=;
        b=BUFlvLaegYdtMG1ul3dDblKQGnQpl3lLaZBBoNouNQ2bFoae2UAG/UwzV9HRBIpVZo
         pTfhsixjqwi8tD+k0ZLSJ+jmchf9lWIaa8qLuv42kZu5r6P3weNMp038tqtiqdHoCCge
         XJ4zO4Nj82xtFwP2PNsibnQ0ts1bXO4ZLNEAnLGxTVI0h9P/jQH8AIREe8awQkrqMhwA
         3MmYKo1ZKyA+GtdRxsd/9grPoBWWlPvy4eNZEZAijod2U/wohD6oEaWDRzRT82S7a39v
         RWK2WpgfPHk8fq2mJm/7yHYMtJB7ywwnISbbDi7Z2YlxehcqB4Ue/TvrAlQbXh/l5p1S
         Az8A==
X-Gm-Message-State: AOJu0YzY02By7zneSErMFCHHD1dSVkrQ2dw+6AepWAR+v5y01/30qglL
	NEoIfnM7ZCOrYPJtqbTM0HFRKn0vrV/jFXpLpyqSdNHQRlSG0vz4tXQvAIx4
X-Google-Smtp-Source: AGHT+IHfPN5/U6D0d1riqJfkCo9zHTyJhnBxn6b4dy6ex7KulMrSOCKuuET5dGM//7BuI5dw3Ls7cA==
X-Received: by 2002:a50:ab04:0:b0:57c:6248:62b7 with SMTP id 4fb4d7f45d1cf-57c62486320mr4930825a12.13.1718039454906;
        Mon, 10 Jun 2024 10:10:54 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH for-4.19? v6 3/9] xen: Refactor altp2m options into a structured format
Date: Mon, 10 Jun 2024 17:10:41 +0000
Message-Id: <dcf08c40e37072e18e5e878df8778ce459897bdc.1718038855.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718038855.git.w1benny@gmail.com>
References: <cover.1718038855.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Encapsulate the altp2m options within a struct. This change is preparatory
and sets the groundwork for introducing additional parameter in subsequent
commit.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
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
index edeadd57ef..569e3d21ed 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -680,17 +680,17 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
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
index a529080129..e6c977521f 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -231,7 +231,9 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
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
index 8bde2f730d..5234b627d0 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -688,7 +688,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }

-    if ( config->altp2m_opts )
+    if ( config->altp2m.opts )
     {
         dprintk(XENLOG_INFO, "Altp2m not supported\n");
         return -EINVAL;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ccadfe0c9e..a4f2e7bad1 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -637,7 +637,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
     unsigned int max_vcpus;
-    unsigned int altp2m_mode = MASK_EXTR(config->altp2m_opts,
+    unsigned int altp2m_mode = MASK_EXTR(config->altp2m.opts,
                                          XEN_DOMCTL_ALTP2M_mode_mask);

     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -717,7 +717,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }

-    if ( config->altp2m_opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
+    if ( config->altp2m.opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
     {
         dprintk(XENLOG_INFO, "Invalid altp2m options selected: %#x\n",
                 config->flags);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 8334ab1711..a66ebaaceb 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -659,7 +659,7 @@ int hvm_domain_initialise(struct domain *d,
     d->arch.hvm.params[HVM_PARAM_TRIPLE_FAULT_REASON] = SHUTDOWN_reboot;

     /* Set altp2m based on domctl flags. */
-    switch ( MASK_EXTR(config->altp2m_opts, XEN_DOMCTL_ALTP2M_mode_mask) )
+    switch ( MASK_EXTR(config->altp2m.opts, XEN_DOMCTL_ALTP2M_mode_mask) )
     {
     case XEN_DOMCTL_ALTP2M_mixed:
         d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_mixed;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 2a49fe46ce..dea399aa8e 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -86,6 +86,7 @@ struct xen_domctl_createdomain {

     uint32_t grant_opts;

+    struct {
 /*
  * Enable altp2m mixed mode.
  *
@@ -102,7 +103,8 @@ struct xen_domctl_createdomain {
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



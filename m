Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263B28D77B1
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 22:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734556.1140670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRW-0008WO-BQ; Sun, 02 Jun 2024 20:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734556.1140670; Sun, 02 Jun 2024 20:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRW-0008Ug-6d; Sun, 02 Jun 2024 20:04:38 +0000
Received: by outflank-mailman (input) for mailman id 734556;
 Sun, 02 Jun 2024 20:04:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nKxc=NE=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sDrRU-00084Y-52
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2024 20:04:36 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 545a8b67-211b-11ef-b4bb-af5377834399;
 Sun, 02 Jun 2024 22:04:33 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-35dbfe31905so3715971f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 13:04:33 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bb21sm6879280f8f.102.2024.06.02.13.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:04:32 -0700 (PDT)
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
X-Inumbo-ID: 545a8b67-211b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717358673; x=1717963473; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srnMunaIVMSNKwZKkgAK+um7rawMxCtrAJXIPwRvR+M=;
        b=kCiy1dDrhiQ0GQh1ujBRyF8kZ+DarHa2622aU+ylXXUeyc5HqOIsjGYDkJr6zidKFq
         DgpLa5Xsfq6uSTaYMiu7dXzHQVSe+2mpd6W78esrVIbesyYj7zH9gCCrxU+OnRRaozWK
         mc3qR+O4BZADE6kSpPjrYh7kS0yO1scxDBDXW85cdcQv/i114DWQV34HvnOxJCNOs0qS
         mH8Npsz8E1SnqI+DHKsz5wXFD2sJv7+9J20LvFGOgh9+ze1fVvGQgKeO0lpYCxRZ22uT
         RPj++8diyRMEPKebaY06RrqFOrP7Dpj/ZU5+tbbLWDO3WYA/u3J4ByP1g84hHzW+cwi6
         PFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717358673; x=1717963473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srnMunaIVMSNKwZKkgAK+um7rawMxCtrAJXIPwRvR+M=;
        b=qAZ7Zx+H6swU49QUMewopU+swZUu58MSC3r3Gu3wnd1jXxMTe6w/Zj5r7H+lsNZFe/
         HuOZDe2yXd5RfZvolTxQqmvuKicw2Cy1oHgnPjbzjsD9AouGDpK2GNhEsMIxF2WoKJ1+
         3cRcslksIL0RsKZaneRYbMIeruaEZxhCtv2IxNB4DkIkK6Li30eFZz6T2py8iMfKnW/2
         0OF95SffydjHsQ2TXOch9Qi+Ar5KUxj2sa+S0FyfY0Z9lBTd1pAAscjVimDAu3fI0Ko6
         Xfx8Bastd1idh3OOaYr6rq1KKg17i3JvsL+qRDM5V+Eky8K9gM93lmnx2WHX157slodE
         B/6Q==
X-Gm-Message-State: AOJu0Yy/asl1gbUbZkwdM1pUrHHjUEVO7GYRmB4XhwGQnmkt34oxv3l6
	nH9Vm/tn66MWI4UvxHA87nnNSY4doiuPXjJKO5vJz1jaWEtc4GCslPXyYsh4
X-Google-Smtp-Source: AGHT+IHfZB6JtVKlc1r30NQBE/aH5henjAJM4LuXPRiH4t4jLmq5/lbGABQEBkm1Z8KP/KaK/EvG+A==
X-Received: by 2002:a05:6000:90:b0:354:df59:c9a4 with SMTP id ffacd0b85a97d-35e0f259bacmr5053050f8f.9.1717358672817;
        Sun, 02 Jun 2024 13:04:32 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.19? v5 03/10] xen: Refactor altp2m options into a structured format
Date: Sun,  2 Jun 2024 20:04:16 +0000
Message-Id: <5dc1d0375206bd982b91f4db4bd237769a889f48.1717356829.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717356829.git.w1benny@gmail.com>
References: <cover.1717356829.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Encapsulate the altp2m options within a struct. This change is preparatory
and sets the groundwork for introducing additional parameter in subsequent
commit.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
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
index 536542841e..bb5ba8fc1e 100644
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



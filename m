Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C37E8B14CE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 22:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711655.1111822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRe-0005QT-LG; Wed, 24 Apr 2024 20:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711655.1111822; Wed, 24 Apr 2024 20:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRe-0005Jq-Dk; Wed, 24 Apr 2024 20:42:22 +0000
Received: by outflank-mailman (input) for mailman id 711655;
 Wed, 24 Apr 2024 20:42:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q5fc=L5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rzjRc-0004Gx-PB
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 20:42:20 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24a80008-027b-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 22:42:19 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5176f217b7bso478571e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 13:42:19 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm8740067ejb.35.2024.04.24.13.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 13:42:17 -0700 (PDT)
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
X-Inumbo-ID: 24a80008-027b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713991338; x=1714596138; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBfj+N3t2vst9UyJVN7uxPweKAIqyhS3H5x3l711fQA=;
        b=FaQmwM4dEoP/C/LsjQC3XSB8pioFJGsZbYeyfkUxcZTIgw9Fo9a+w571AhvGDYYgnE
         dpgUTzxrFPhVIfdpYu7w0+Z9/uyxTdJeArITGG7g57/bHCVN4v69jXJ/z7lojVpHRWZ8
         buslYq6Azr8w/EBbv1CEPYulwn02NxHN0AnRCGLwWZHAHn2XsN68Hnh0+rC49v3r2l36
         CJgPfuOXP+i2QJ3PnR5hE/RLQzC73QoyYUv8kKipM9LJUqyz+HWkV/hsEfI1GDQSs+im
         0CBXlRGJIpb4YsY2BumeFs/V5dM57e7K7trQuQqmNj4sk5AIPjscOoRd53gYNagMbMX4
         iVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713991338; x=1714596138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBfj+N3t2vst9UyJVN7uxPweKAIqyhS3H5x3l711fQA=;
        b=CwITv0IxUF5rpq0u/If6q1rxAGJ81BfsV9LiwS3Nc8Ye2z9SKFhSq2yz/u0rEhnpLK
         IJz3Iiy5RMr7D4k4V2q6hXw1MdDc9EBM33+bzVbbHkKyOEybbooTmAK5uSKvICiLjuZk
         /injfihX0fyix/i0RmsfVwHxedIKM+ibcxzfju57juhoSs4MQCo3eX2WiG+J1NyqHUvM
         24tBKgrhGuTxY0mSer7AUmZ4IDtbSEANwrpFk7BtCJQIp5+nTmCnztJ9s4ePFp5RVltW
         rGsme1/Poyzw1yseUa+uoGnwJAWVLOQOeHNBpF50iEWiuiubl/jo+mCjjOVENeFWLCQ9
         jJbg==
X-Gm-Message-State: AOJu0Yy1JEqCaytKHAPJkeMiJH1ReLY+GEyGG2sBPZyMB3gIKMir3d9H
	ufIKS3YS3nQfQS+XsvkhZ+xFLIqxW61x/S/I+zK6LLV8ZqIBjjouMul+kL3q
X-Google-Smtp-Source: AGHT+IGl5czEozgynTrUnsTEFba8tXwOaOGTAjiGH8fJprif433sUaL3kFhMwC+ZGaHuYI3+LEqBgg==
X-Received: by 2002:a19:f813:0:b0:518:c82a:bdf9 with SMTP id a19-20020a19f813000000b00518c82abdf9mr2997959lff.44.1713991338189;
        Wed, 24 Apr 2024 13:42:18 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 4/7] tools/ocaml: Add max_altp2m parameter
Date: Wed, 24 Apr 2024 20:42:02 +0000
Message-Id: <9e9be821c2fe0ac4a7b66d652c10b2edbf5e42be.1713990376.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713990376.git.w1benny@gmail.com>
References: <cover.1713990376.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Allow developers using the OCaml bindings to set the max_altp2m parameter.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      |  1 +
 tools/ocaml/libs/xc/xenctrl.mli     |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c | 17 ++++++++++-------
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 55923857ec..ed851bb071 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -82,6 +82,7 @@ type domctl_create_config =
     iommu_opts: domain_create_iommu_opts list;
     max_vcpus: int;
     max_evtchn_port: int;
+    max_altp2m: int;
     max_grant_frames: int;
     max_maptrack_frames: int;
     max_grant_version: int;
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 9b4b45db3a..971b269d85 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -74,6 +74,7 @@ type domctl_create_config = {
   iommu_opts: domain_create_iommu_opts list;
   max_vcpus: int;
   max_evtchn_port: int;
+  max_altp2m: int;
   max_grant_frames: int;
   max_maptrack_frames: int;
   max_grant_version: int;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 2b6d3c09df..0b70cc9b08 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -207,12 +207,13 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #define VAL_IOMMU_OPTS          Field(config, 3)
 #define VAL_MAX_VCPUS           Field(config, 4)
 #define VAL_MAX_EVTCHN_PORT     Field(config, 5)
-#define VAL_MAX_GRANT_FRAMES    Field(config, 6)
-#define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
-#define VAL_MAX_GRANT_VERSION   Field(config, 8)
-#define VAL_VMTRACE_BUF_KB      Field(config, 9)
-#define VAL_CPUPOOL_ID          Field(config, 10)
-#define VAL_ARCH                Field(config, 11)
+#define VAL_MAX_ALTP2M          Field(config, 6)
+#define VAL_MAX_GRANT_FRAMES    Field(config, 7)
+#define VAL_MAX_MAPTRACK_FRAMES Field(config, 8)
+#define VAL_MAX_GRANT_VERSION   Field(config, 9)
+#define VAL_VMTRACE_BUF_KB      Field(config, 10)
+#define VAL_CPUPOOL_ID          Field(config, 11)
+#define VAL_ARCH                Field(config, 12)
 
 	uint32_t domid = Int_val(wanted_domid);
 	uint64_t vmtrace_size = Int32_val(VAL_VMTRACE_BUF_KB);
@@ -226,6 +227,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		.ssidref = Int32_val(VAL_SSIDREF),
 		.max_vcpus = Int_val(VAL_MAX_VCPUS),
 		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
+		.max_altp2m = Int_val(VAL_MAX_ALTP2M),
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
 		.grant_opts =
@@ -257,7 +259,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #if defined(__i386__) || defined(__x86_64__)
 
 		/* Quick & dirty check for ABI changes. */
-		BUILD_BUG_ON(sizeof(cfg) != 64);
+		BUILD_BUG_ON(sizeof(cfg) != 68);
 
         /* Mnemonics for the named fields inside xen_x86_arch_domainconfig */
 #define VAL_EMUL_FLAGS          Field(arch_domconfig, 0)
@@ -291,6 +293,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
+#undef VAL_MAX_ALTP2M
 #undef VAL_MAX_EVTCHN_PORT
 #undef VAL_MAX_VCPUS
 #undef VAL_IOMMU_OPTS
-- 
2.34.1



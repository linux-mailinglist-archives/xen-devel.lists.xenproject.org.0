Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30988B4CE4
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 18:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713708.1114638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lq-0007Gh-UW; Sun, 28 Apr 2024 16:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713708.1114638; Sun, 28 Apr 2024 16:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lq-00078Q-KE; Sun, 28 Apr 2024 16:52:58 +0000
Received: by outflank-mailman (input) for mailman id 713708;
 Sun, 28 Apr 2024 16:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a4SJ=MB=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s17ln-0006DB-Hy
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2024 16:52:55 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c210c00a-057f-11ef-909a-e314d9c70b13;
 Sun, 28 Apr 2024 18:52:54 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41c011bb920so3226105e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 09:52:54 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm27850921wri.84.2024.04.28.09.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 09:52:53 -0700 (PDT)
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
X-Inumbo-ID: c210c00a-057f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714323174; x=1714927974; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAwmfpqE/egFzfCs4yP798ggKDGpEceOhDUHTa8HbXM=;
        b=JZfY3dZADAEY/bhbmEYVlyInpCjsF7UpM+OgZr3ebzUZuT1QvWfCDlx3s/D6WJclst
         d8yRYj8cvYxRJ2VKVTyCRBfvCu2jZlQaYY9bp7clwVLuLKortV2iIKQeZixrXwSj8LDm
         kLu3lG0cts0imwtKxjwq5GDOoLMc8lLS+m3qO0cGPCZAneUnhxxC4jbLAWnBR91PaKwj
         hGmBay3lNkuxPWaLtuplaemX9Qi5psIrkQOTowIViBLJ6j3FqCh5mFTMjMyD4dW6BeIs
         qz57xsyF/rSY0pOI+8vfUYDdLb4CRIIB4CPwu2j7Uz4hrDswSFFPPxFeCGA1QEYG4cDL
         +THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714323174; x=1714927974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAwmfpqE/egFzfCs4yP798ggKDGpEceOhDUHTa8HbXM=;
        b=BDnZHywUzqm/nWebTt8BL3HW9rwlOEOqTZ4nV/In7FWlzwJ17E5SK0egFfevHVgaKR
         mqEaoskRsMCkZQMNK/2aR+heP3eDHDZzc3YA5PHsgG+3hGCOWt+9ag7CgRIUk2lDYVE+
         SlrDuLwFQVPdQ1QjJa8kZAn1JlqCZJe3kz9vOCTszeSb0/8SkS21IVsP3THmj548RKok
         01QJ6K5muCkjfoeez6nvgw0WUSmoRNZR8LsaR8thrzZ+mT+aBTrS9kQQSsedKmPl8xVo
         bcNSH+Pp/ekY26+ggD+P57hvmBqOiuk1LRtojnGBC2MHozDO2mqV+zraJuiwGY74zbL4
         Bynw==
X-Gm-Message-State: AOJu0YzwHNvWONx13a03mgrSbogzdCSy2lYlCKeSBP4eTT5d7dohpEt6
	u1O2hPnNaLuJx5v5INzpaOdYjXYEqKgAba27d/050RO8lNkOVewjT01BCqvG
X-Google-Smtp-Source: AGHT+IGq0+nmVUU5KPNzGw0CrBY4sV1Zukh+Mb6LdwpqptkXPO/nzbXcviIP2k2Hokvv74TanC8H+g==
X-Received: by 2002:a05:600c:4e8a:b0:418:9d4a:1ba5 with SMTP id f10-20020a05600c4e8a00b004189d4a1ba5mr4547338wmq.6.1714323174191;
        Sun, 28 Apr 2024 09:52:54 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v2 6/7] tools/ocaml: Add max_altp2m parameter
Date: Sun, 28 Apr 2024 16:52:41 +0000
Message-Id: <32c3c312635e943c76329d52efb8ff71f5ee740f.1714322424.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714322424.git.w1benny@gmail.com>
References: <cover.1714322424.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Allow developers using the OCaml bindings to set the max_altp2m parameter.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
Changed since v1:
  * Moved this commit AFTER Xen changes (where xen_domctl_createdomain::max_altp2m field
    is introduced) to avoid breaking the build

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



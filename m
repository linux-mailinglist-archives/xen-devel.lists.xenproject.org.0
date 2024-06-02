Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2B68D77B5
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 22:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734555.1140659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRV-0008Hp-2R; Sun, 02 Jun 2024 20:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734555.1140659; Sun, 02 Jun 2024 20:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRU-0008Fj-VB; Sun, 02 Jun 2024 20:04:36 +0000
Received: by outflank-mailman (input) for mailman id 734555;
 Sun, 02 Jun 2024 20:04:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nKxc=NE=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sDrRT-0007mz-59
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2024 20:04:35 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53c68629-211b-11ef-90a1-e314d9c70b13;
 Sun, 02 Jun 2024 22:04:32 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-35dc1d8867eso3032945f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 13:04:32 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bb21sm6879280f8f.102.2024.06.02.13.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:04:31 -0700 (PDT)
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
X-Inumbo-ID: 53c68629-211b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717358672; x=1717963472; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBV36ZOSMPLFcAtuqEy9oKcOs0+DBw6xGfnoGAP2P0o=;
        b=ZHhA2bG9Z48ylIlEAvipg+fy4x5aGxH52BLytfEzr2fDID4FiGFiFA/LBstuIyzEju
         +Hzpf6SRajIFen7XISqfhcT0HUCTK3+3AaGK9d5A0gp4xqbl/Kmcoq6hu/xz1CPCvsFX
         PS6vM9ZMWOWyVpAVxwmdgleMC07I6hNOWaTY9+Ui1pfhWY+lx6BYpoN6vuy2VjXB4OS8
         zgoQorAUace4/wb9hIKQxfzknM/OHSRX/0MDCNyMtEbVLcsN8aIGfNvm/8NgSbzMCy71
         +5aUHvSBkeyWMI31WEv0I54kSilGlU89Cy91G/ND9JSGbUjNVm2meetMHbmUBkRKkulQ
         ov2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717358672; x=1717963472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBV36ZOSMPLFcAtuqEy9oKcOs0+DBw6xGfnoGAP2P0o=;
        b=DftpX4/8ebEzsTRXlcM5k9sDY2q5/+IlNErviHq8FCiryRT9KNH0/5Yvaa3mn7X0BE
         W4U4Y+lG4POYFTVQk3IUeto1sBU+OXkg9zfRLs2TNmzfJNX1UVLAYXklifnNzndWjfpa
         KojrkGO/+KGqinGCkEVvKauH4pFKhnZh0XbkzPrg6iyvgkIMCEbCgbd8ghnCWYFUkvF8
         Vef3BNeESUDah64qPRoM8sILOJI1ejV82GlWQh0J77Uytt9pFT/oa+Qe8pXjCREZ/UC7
         fRliJcOYi1Pz+JOFtFWNZiZPVQRgBIGZmFRs/mfypROPHfTIYneSkVeGQTGhTTegtcgd
         WWxw==
X-Gm-Message-State: AOJu0Yys+S1vVk2mie1chvF8YW276CQ3LNXBmWTp7a4j8E2cVFAAXEsM
	msBym7N8RCfmv4gmYJNp9gbCGdqGnQEAWP+VlvtacnA2tRto2f7XZfV31g==
X-Google-Smtp-Source: AGHT+IFnawVfqRSURUafZl8mA3xgcxuztZ6SJjTvV0fXeOTIvRpt9DF9hCQnHAVSeJqLoDyTctdgEw==
X-Received: by 2002:adf:ef4d:0:b0:354:db85:3039 with SMTP id ffacd0b85a97d-35e0f34e789mr5289898f8f.44.1717358671689;
        Sun, 02 Jun 2024 13:04:31 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH for-4.19? v5 02/10] tools/ocaml: Add missing ocaml bindings for altp2m_opts
Date: Sun,  2 Jun 2024 20:04:15 +0000
Message-Id: <2fcb6972bfaa59ec1184929cceeab70da709dfc0.1717356829.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717356829.git.w1benny@gmail.com>
References: <cover.1717356829.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Fixes: 0291089f6ea8 ("xen: enable altp2m at create domain domctl")

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      | 1 +
 tools/ocaml/libs/xc/xenctrl.mli     | 1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c | 9 ++++++---
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 55923857ec..2690f9a923 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -85,6 +85,7 @@ type domctl_create_config =
     max_grant_frames: int;
     max_maptrack_frames: int;
     max_grant_version: int;
+    altp2m_opts: int32;
     vmtrace_buf_kb: int32;
     cpupool_id: int32;
     arch: arch_domainconfig;
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 9b4b45db3a..febbe1f6ae 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -77,6 +77,7 @@ type domctl_create_config = {
   max_grant_frames: int;
   max_maptrack_frames: int;
   max_grant_version: int;
+  altp2m_opts: int32;
   vmtrace_buf_kb: int32;
   cpupool_id: int32;
   arch: arch_domainconfig;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index e86c455802..a529080129 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -210,9 +210,10 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
 #define VAL_MAX_GRANT_VERSION   Field(config, 8)
-#define VAL_VMTRACE_BUF_KB      Field(config, 9)
-#define VAL_CPUPOOL_ID          Field(config, 10)
-#define VAL_ARCH                Field(config, 11)
+#define VAL_ALTP2M_OPTS         Field(config, 9)
+#define VAL_VMTRACE_BUF_KB      Field(config, 10)
+#define VAL_CPUPOOL_ID          Field(config, 11)
+#define VAL_ARCH                Field(config, 12)

 	uint32_t domid = Int_val(wanted_domid);
 	uint64_t vmtrace_size = Int32_val(VAL_VMTRACE_BUF_KB);
@@ -230,6 +231,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
 		.grant_opts =
 		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
+		.altp2m_opts = Int32_val(VAL_ALTP2M_OPTS),
 		.vmtrace_size = vmtrace_size,
 		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
 	};
@@ -288,6 +290,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #undef VAL_ARCH
 #undef VAL_CPUPOOL_ID
 #undef VAL_VMTRACE_BUF_KB
+#undef VAL_ALTP2M_OPTS
 #undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
--
2.34.1



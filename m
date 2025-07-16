Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC11B07EAA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045632.1415849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xs-0005pV-Mg; Wed, 16 Jul 2025 20:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045632.1415849; Wed, 16 Jul 2025 20:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xs-0005gW-F4; Wed, 16 Jul 2025 20:16:04 +0000
Received: by outflank-mailman (input) for mailman id 1045632;
 Wed, 16 Jul 2025 20:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WS3=Z5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uc8Xq-0003uY-Nc
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:16:02 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0cd02d2-6281-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:16:00 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b60565d5f4so21603f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 13:16:00 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e8csm30504145e9.5.2025.07.16.13.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 13:15:59 -0700 (PDT)
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
X-Inumbo-ID: b0cd02d2-6281-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696960; x=1753301760; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=BunTHacQkHNvbg79bt9ZNGzoViavlNH8o5zdgAgwEVPtVEC3GaM7Cs6YJAzBj/k3xg
         vQWbyoitSDLzeHH53OhdItj9Cu9tH2Pv7H/adBxLQM0Thw03IeoSyS33RDwdwk+4J+FV
         0jCpAzswBfkG5SEl4FZDiVduUBZov0fEm8xtFZornPktFoSrVG5z5KfYx38srV9e9Ukv
         j+LdqfkPeMBTyNEQTesHjZEpN0+HzL7G/iYzkQ2zH5H5RmqGblyForQCcv5csAgqsBpg
         3VsxM8kNMu4DGM6s4D2i1Giv9FTaaWIbI9Lk4JKBS1fp4nQ4b7PU2kyhjEzDLJAQIX+d
         JCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696960; x=1753301760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=a2pXdoUvkCL3qBFPdGVpQpkQuNd/KH4PVeg/WiKw3Pmbpu6ymcflLDpMICkvVuij2u
         vYh6fsQ/Ys6m4tggJsnESCSLM2X98xexDrnvXKCLRUEE4OXvgC+ilDN+XjAxnHnoeiAw
         Jl9T8FsfYCf6q0gM8pml2MVHOKoifMgdZbquxxibLC3WNV34B1gY3q+chdidGk+3MMFz
         LG27e59rlGCF0tyJpWohzwrlJFpW3ucgZ15GMx+AVzJFdQXzLwiGNjleYjENh68VsRaM
         G19LdwP1GCEaxRnqIUfGZWnMXEWO0wjer4Z1KeA1cadA6W6HLaBz0e2vK+tN3QlNrKMy
         2P0A==
X-Gm-Message-State: AOJu0Ywq+IiipomjgCE+PW7FI4Gr1d85S5ZRaW0bKdJ7VhGwjJuMTHVn
	QhSax+eGOrSg67Y2+SNsg2mZKZ4dpHAlGhqOPF+Lyt+nRHhcWYzBMwxwpcbkGA==
X-Gm-Gg: ASbGnctQhDUvRgSEBK1jHQocyrpSAcQYPKAJ5o6SRyP7N7iJMFeKhm8SP7hlJ+hdGGp
	RDuGPTQtnDFy5dCQ6/QiSB3PBhK/f1B/VVbhGECs4pVagBxEBKASxv4CjPjy2s8+0Yu07Lk49kK
	MkWxESXLTJmzDpTZY2FgdBpGMwu9MN/a/cm7yYb7bm1PcX2E1wEUiOjU3YIfBJKQ26qlq3YM6zl
	Uh1DyNwtKo6q19QbnSk91Ih4GyibE440nUCblLb+St7GmH5/1kcX+44YSV+yOCElnorEqF+W0I2
	IuJd6tdkWxuRY/d0yMo2DIw/in5Pof3lmPl8JG0phejhMu7Sc6pNrTkOu+ZmAofynrQIaSFvd6v
	EHaC9pnKWhj6leASvnQ8XDcc9isrxQUr2yNF9x2e9wq+LgaspnEpPuruGexG+cSI7xFOagYkW5n
	mfDIO2moeiWwdllRk9Vx8ntQ==
X-Google-Smtp-Source: AGHT+IF5xzxZHGT15VC4mX8p6TolF+9HdTpdorS1QFcvjZqWeXsUxfPZeGpsYfbmoDurhIJKjFtR9g==
X-Received: by 2002:a05:600c:4f0c:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-4562dff98b5mr19594225e9.1.1752696959624;
        Wed, 16 Jul 2025 13:15:59 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v10 9/9] tools/ocaml: Add altp2m_count parameter
Date: Wed, 16 Jul 2025 20:15:39 +0000
Message-Id: <bf46cd21ce574fff03552941c5482d63e7fa197b.1752691429.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752691429.git.w1benny@gmail.com>
References: <cover.1752691429.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Allow developers using the OCaml bindings to set the altp2m_count parameter.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      |  1 +
 tools/ocaml/libs/xc/xenctrl.mli     |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c | 19 +++++++++++++++----
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 7e1aabad6c..97108b9d86 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -87,6 +87,7 @@ type domctl_create_config =
     max_maptrack_frames: int;
     max_grant_version: int;
     altp2m_opts: int32;
+    altp2m_count: int32;
     vmtrace_buf_kb: int32;
     cpupool_id: int32;
     arch: arch_domainconfig;
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index f44dba61ae..9fccb2c2c2 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -79,6 +79,7 @@ type domctl_create_config = {
   max_maptrack_frames: int;
   max_grant_version: int;
   altp2m_opts: int32;
+  altp2m_count: int32;
   vmtrace_buf_kb: int32;
   cpupool_id: int32;
   arch: arch_domainconfig;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index b51fd66788..ac2a7537d6 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -205,13 +205,22 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
 #define VAL_MAX_GRANT_VERSION   Field(config, 8)
 #define VAL_ALTP2M_OPTS         Field(config, 9)
-#define VAL_VMTRACE_BUF_KB      Field(config, 10)
-#define VAL_CPUPOOL_ID          Field(config, 11)
-#define VAL_ARCH                Field(config, 12)
+#define VAL_ALTP2M_COUNT        Field(config, 10)
+#define VAL_VMTRACE_BUF_KB      Field(config, 11)
+#define VAL_CPUPOOL_ID          Field(config, 12)
+#define VAL_ARCH                Field(config, 13)
 
 	uint32_t domid = Int_val(wanted_domid);
+	uint32_t altp2m_opts = Int32_val(VAL_ALTP2M_OPTS);
+	uint32_t altp2m_nr = Int32_val(VAL_ALTP2M_COUNT);
 	uint64_t vmtrace_size = Int32_val(VAL_VMTRACE_BUF_KB);
 
+	if ( altp2m_opts != (uint16_t)altp2m_opts )
+		caml_invalid_argument("altp2m_opts");
+
+	if ( altp2m_nr != (uint16_t)altp2m_nr )
+		caml_invalid_argument("altp2m_count");
+
 	vmtrace_size = ROUNDUP(vmtrace_size << 10, XC_PAGE_SHIFT);
 	if ( vmtrace_size != (uint32_t)vmtrace_size )
 		caml_invalid_argument("vmtrace_buf_kb");
@@ -226,7 +235,8 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		.grant_opts =
 		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
 		.altp2m = {
-			.opts = Int32_val(VAL_ALTP2M_OPTS),
+			.opts = altp2m_opts,
+			.nr = altp2m_nr,
 		},
 		.vmtrace_size = vmtrace_size,
 		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
@@ -286,6 +296,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #undef VAL_ARCH
 #undef VAL_CPUPOOL_ID
 #undef VAL_VMTRACE_BUF_KB
+#undef VAL_ALTP2M_COUNT
 #undef VAL_ALTP2M_OPTS
 #undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
-- 
2.34.1



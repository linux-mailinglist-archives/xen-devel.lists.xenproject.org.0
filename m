Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E2B15E5A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063732.1429506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4DF-00010I-9t; Wed, 30 Jul 2025 10:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063732.1429506; Wed, 30 Jul 2025 10:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4DF-0000wg-5K; Wed, 30 Jul 2025 10:39:09 +0000
Received: by outflank-mailman (input) for mailman id 1063732;
 Wed, 30 Jul 2025 10:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06yH=2L=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uh4DD-0007vS-39
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:39:07 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a0ab624-6d31-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 12:39:05 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-615877015daso146585a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 03:39:05 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af8f1b17364sm183230166b.66.2025.07.30.03.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 03:39:03 -0700 (PDT)
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
X-Inumbo-ID: 6a0ab624-6d31-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753871944; x=1754476744; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=dznoFTT96gFE6oEuro4w9mWy5e/y3Tc/FFfpP3nC3KKtID+igrbPcotij/Ws8P5BwG
         gTuUJQEpsrVCL3wt1CDVEs/LKWxDxAYu+/4JaQtMVyyKY3qYM7aQn4WyuTFlfxqNF488
         wQEUm81IjBmE4Fge4ntU02Q+1pzrXe/oUum6QS40+j4UlpN+i6I0drpQ0YAq/WPPQoD2
         ZZFMPWpakIuRQR2/F+9fBUM2jJxUew8/oDgYzU18y2uOj8Gl60+yjpaT4xSzfT7rY1r9
         pcA06PPLPLPKo1Pm9N4CrfZTJMFKPPXOklSAhiAV/T2OGiDlq3WJ6FfBk7oV5FXvojAR
         nybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753871944; x=1754476744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=iw94h7WbXuTpdMb+E9FAAQKD/3t9aufeD/52W3H99oIq0MpohSkOGqN/epJbBNj8Lo
         rFgBW/Wmopbqffw8A/ywizNbAgfCdWq2SmU973li6NymPVETuS3Z+umrwqOTkNoN3JbR
         2r8pFHswmqlvv617GMtNDmxlIMuqQ5sM/6EDjpYgCii3W1paKEnWEZxEJ9lErEXONXho
         /HKF/7mvO7sfUpuo19/+zhjWd0y7aydyGEyFfVNVpzqGGT78B0zNrBdCqyVCx1YVHms6
         UzsXS72UR+jZ+qu4u1YITa9vl5p8RvLX+jss6MLhgMkIeg/iRl8i8LlKWQz550zMp9w9
         VlfA==
X-Gm-Message-State: AOJu0YxLMP2XsrAMyBsqtPSSG6A1nL4Cp+7okC0vxyVFvmdvU0Y9vKt3
	irZFllMq585ze6lKCYJjBNQNIE1VTlM2z2BvawPILai7+zihCXu6FW6In9li0zBYkSw=
X-Gm-Gg: ASbGncuvrR+UirOqvIYR8zNhIDljLU3taXQhT6HwdNODiH5mhei06QyTfg42OG9Jr0i
	VCN01plTBJFx9BmAiVOMFfJ6Gkqpw0DiAf3cyk4qc0OB6b5MNwJA5oP88Dqrtg2h6cvlZhF/y2r
	8Lh9mhAQ9awuti35E6TMWvb1+jCIBSJeii0d8X6XgauLsSF2YbY58xHqcyS3G7r5t3pl9h9sw2D
	e17WNM7h3lqVjnTtQZcxYmwInjsqIo/1YDiLUDxC8hFTut2Bfpsxt/zQ1Bk+DWx10dSTkDc1Icz
	gF2B9g67qNCVlpNuQEzKoXNclkNy23XHaOnpNEj8ZubO3r4riTtjGQbUrhlpzla7GEHIqu+FWkh
	Crm+Pp1F/5OJUQ+tM5ENJQ0I3I4qd1g0IzjfQ0H1oBX4liRWPJZU2rCBIH6DFzStHDlKoa0vxkH
	ZHiCyifZQwyI4wF3/qHeH7ug==
X-Google-Smtp-Source: AGHT+IGVcZV8dA9V5fnuk47cxhs62A8AFweUYqCbRblaIhawsrNcQuuuwv/fAna5qUgKC1GOynrtaA==
X-Received: by 2002:a17:907:7ba2:b0:ae3:63fd:c3b4 with SMTP id a640c23a62f3a-af8fd73bb97mr123224966b.5.1753871944015;
        Wed, 30 Jul 2025 03:39:04 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v11 6/6] tools/ocaml: Add altp2m_count parameter
Date: Wed, 30 Jul 2025 10:38:50 +0000
Message-Id: <39d3e8bca948b485040a7189135c388a5b70f9fa.1753871755.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753871755.git.w1benny@gmail.com>
References: <cover.1753871755.git.w1benny@gmail.com>
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA1AF0430
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 21:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029949.1403714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh45-0001lM-Cl; Tue, 01 Jul 2025 19:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029949.1403714; Tue, 01 Jul 2025 19:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh45-0001i9-8Y; Tue, 01 Jul 2025 19:54:49 +0000
Received: by outflank-mailman (input) for mailman id 1029949;
 Tue, 01 Jul 2025 19:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWh42-0000D0-Tj
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 19:54:46 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c29b215-56b5-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 21:54:44 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-450ddb35583so7750875e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 12:54:44 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e9d1csm14291644f8f.13.2025.07.01.12.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 12:54:43 -0700 (PDT)
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
X-Inumbo-ID: 3c29b215-56b5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751399684; x=1752004484; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=WXsb3JkxKh1iranZ8bRReHLUmtLSE5qnZRxWhKvD+0cJqWxLZhSjrxhcrCa/pwRkWl
         GhTgtmwqvHlzoH8ngGQjbbhcblkxYAp0r38bI1i6j/aHjr582QiHu2N97BVyp+IKGn9O
         Ecm4COXZCMhr3BJNQieyw+z0S95rU6mU5bFsEiKQyP8ji1rM/ezte2aN55AnRVtPuTRO
         bJ9/QcrbUo2svlhe3wR3tFfoR4Bdaj6uXKtEG2loEiIZxHIpeLkoSHpp8nVanpNgooCp
         S4sEWuzgIHb3auqAc2WQQQkwV5WLEshXIaxKVd5RQH8ZljIZ5MEpM6iiIJM146tnnBQo
         a+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751399684; x=1752004484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=eGyQyQabRuUzIn24O1O9dBz0bMNOHJb439CYDRwucgtgvEQ8cvRE9gdLMcb4cUihFA
         JM8ezDAdmAXMlrvqkIbgF1IbPZSyxMGK8HUCm1YzE9aN+EnI4nAbNkbkMnlidHcJcqxp
         umGl6Blz7lscBQR8GlMXZ5wSB0f2+zzMMvwunYSBu5prJ9Rmv7qj9U4h9xha6xdR7HVf
         SCllzs0HI9iQbLSeu4wl7fv2ygOcBauNN1HZQ3mQ01jp0pDoyKbzcDEnqj3xiOL/VQHD
         +QvoI3x1DChjqLMNAaFskpIXGqSyBJJYZTQdZjIb+lrPmXxS9ZadhHoMA3ifpNKuONWL
         AquA==
X-Gm-Message-State: AOJu0YzZzchQk9ULqExfLtIk4rabC+X/vE8pwpr3il7aLE1D8qsGkvOw
	UXVaW/es98atSEotf5FqSAWzXeHlVG4Cr8dvHZI8wwx+MOWPMGPFpzX5Tqq/Gw==
X-Gm-Gg: ASbGnct3+ZXN6Kk6LB4iIJba0Ai5l+40M9CHQbyvFDpMJiFtv5ynrMINnRlB9RiMUJs
	uqcQ5NYVxtWA4jv6g2lTZhIUW5BucVN2V+OJuh/dVMZpPRlwailSjznL7keSbLgSyuw0oG6o9t6
	w20IVJzBBBUNOs338qnohTclcSU5Kh+Ss5UZyp1gdvz0xmNpzVbkj8m4K+dvzw9JkccvnolcGw3
	rFTy2/oxUNjPOjnYk4EAHRFJ0+HPw4Neh87nD+JoOh6dUu5F+ACV3IZwIuKfEvh/bKASVJ7t2ZS
	J3WSZEkx/0kgX1Vkz0y3q2mIWJylNlv8jM4C7FZCJ2h2RQrXKS3AleN1Bq0aZRQExAH2XivbuaE
	mxm7co5t0GzkwoJ1IMl6anR8/vtLoz+ZhLm+S7uROvyGo02pSfnhR4pK0mzlv0w==
X-Google-Smtp-Source: AGHT+IElo4rx5fETCCYMKriRcSRwJ8MBAScTFnecMLMIF3afaDKYQV5Sx781IyEjT92/D+2lnI0VRA==
X-Received: by 2002:a05:6000:2406:b0:3a5:7991:fee with SMTP id ffacd0b85a97d-3af26ddfda7mr1832481f8f.14.1751399683711;
        Tue, 01 Jul 2025 12:54:43 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v7 7/7] tools/ocaml: Add altp2m_count parameter
Date: Tue,  1 Jul 2025 19:54:29 +0000
Message-Id: <0a386a56ff67d854d827cbb672ecd54f703632b3.1751397919.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751397919.git.w1benny@gmail.com>
References: <cover.1751397919.git.w1benny@gmail.com>
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



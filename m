Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E489B04B04
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043182.1413347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyx-0005ev-F0; Mon, 14 Jul 2025 22:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043182.1413347; Mon, 14 Jul 2025 22:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyx-0005VF-7K; Mon, 14 Jul 2025 22:49:11 +0000
Received: by outflank-mailman (input) for mailman id 1043182;
 Mon, 14 Jul 2025 22:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRyv-00047A-BD
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:09 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0948476-6104-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 00:49:08 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-456127b9958so2052035e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:49:08 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd18ffsm13288903f8f.9.2025.07.14.15.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:49:07 -0700 (PDT)
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
X-Inumbo-ID: c0948476-6104-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533348; x=1753138148; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=KAH5XJiUOS2m+hhQnfEbecb18ixsLk4zirKBSoTOBMcI3mdid1lit4HL6EdM8NFevH
         nk3PPYBtZOEKTNcaFpaqbw3jxRoffNlN0HgoxdkRV65msqfFgXm5TPQmlHyI5HEZMeTj
         dT+WaqALG+SDLhE8hqHnRdrCbQhTToIVIFLKKyplB3AzCt9BoQuhfa9DtAEc/beoSxZ1
         K+/JOt5/m6WFfiz9nFbqRj+X+pmGJo18oQHHMPjCB73/cBHgW+Pf6570/iq8MiaFeiS3
         /a4s1SSIh/ssOYfQNDGSxqJ02KtD3wiQuMIDRwQEGMQNlTx2V6LFUZ0En8i0EVQM82Dz
         oI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533348; x=1753138148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=D65F3ohq+JxkxDwmKqlVA8lyAiAY+EoZEEJjVb8+W9GJ90BPV8alK8LcnjtwtX3Ew7
         x++NE+4Y6QADL/rjiL3auPkNgDU7Zwo7zp9/Hjjd9/JBIpq7gWH24Pymzfi2KZqp16pq
         daz25KAU+PUlEcpvElipprJ0E20tcW2plm+cd8/97nT/rbqGUy0XrAXxI6m4th/rvboX
         +0VCyaGNgSFi42UMhbd+nT1oWTwG7kOaf/gGu4JGCbstnGUQI6Q0yRh8gwD3f9BMB2M1
         P68xZ+CmRybzwM3NSsBI1SpcNHOn49xVedglGnfKdaXUSD6dFqz6AAV9ARxoqORnw20a
         6ZAw==
X-Gm-Message-State: AOJu0YxWKgyTEvIm/9ekAYtO45MsIJOb89AoHihyLZGZhDtBoAGJFPQB
	ZQ0UtCUZojWHnqZlGFjADtWXNYTAR/yqBg08cEe01iWQxriofauAJ0V3wq82NQ==
X-Gm-Gg: ASbGncsPy5R7bkyk75MA5F0RGhAzH6t7YTEyeysayJHQ/dLEt5o4wW1+sjJJYERxNNX
	2K3f6rKwz1WQuZ8PR7yBAXFmaU5uMbCsw8tlQMfzJda6yYtojTVv9xi3aSrlupm0NDQ0ehsa/3E
	mUVkM/4Ah+j2Emuu8gs1whA8tJKjTjsEKhNeQ7OaiZ2lUtf+Xe1/q9B/aIRpwhi/19axcyIgcjY
	h2Q2BO1pLy31aQj4zreoNud/NhFFdF02S59Ws7RZkleYhX+XouqNDT24aM8ELchWZ3OTpokqbsb
	IGet9Fy3FblwTecBFDV5QkrGr8vpjiGodLRyVw6cILcjJlE2mW62biCsK8GypFqa5CDexRvyJMG
	sQenWrKWKutcJQWgJyr8HDcIkHjodMHo0sR5hIKD702ZurFO8q2CLCsYX8KJb3XSJhRYvN1fUR3
	nT3fu+sy1idv2NYNry7K2pyQ==
X-Google-Smtp-Source: AGHT+IHpDe3FwxEXdNxozTuNftQFcweEjIQ3h3y/go7BeUg7Dya7iNxrhwZ+e/DzbwrPgQjzLKTiog==
X-Received: by 2002:a05:6000:1ac6:b0:3a4:e193:e6e7 with SMTP id ffacd0b85a97d-3b5f2df1b4amr4175538f8f.5.1752533347621;
        Mon, 14 Jul 2025 15:49:07 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v8 7/7] tools/ocaml: Add altp2m_count parameter
Date: Mon, 14 Jul 2025 22:48:54 +0000
Message-Id: <d62abd4cee5585e39fdb1d1e0c369c1f1b19db7a.1752531797.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752531797.git.w1benny@gmail.com>
References: <cover.1752531797.git.w1benny@gmail.com>
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



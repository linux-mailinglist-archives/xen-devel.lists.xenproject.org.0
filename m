Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2972B054EB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043771.1413841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4Q-0006XA-P7; Tue, 15 Jul 2025 08:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043771.1413841; Tue, 15 Jul 2025 08:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4Q-0006Q3-De; Tue, 15 Jul 2025 08:31:26 +0000
Received: by outflank-mailman (input) for mailman id 1043771;
 Tue, 15 Jul 2025 08:31:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V4bE=Z4=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubb4O-0005rV-Vi
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:31:24 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17dc3b13-6156-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 10:31:24 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a577ab8c34so509198f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 01:31:24 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560f22cd14sm84787075e9.30.2025.07.15.01.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 01:31:22 -0700 (PDT)
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
X-Inumbo-ID: 17dc3b13-6156-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752568284; x=1753173084; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=h91Cf89fZNyFUlE8TeV0KRogj6PD6pkKhP/QvjYa+q3VjHO7l/lTSlT7ORYRu0E3B5
         XiouOuXOcDgg+YMT/JWKope1ftsvzndo1L/2P68RYHSFYVk2hHO8OJuPI4cGaixf2bN4
         GE9fS0wtGjiQHl2vh0OKmO4yMBtZzabYA1E2v02qKsPqW8a+aPNM1ahbUyozA6nyICaR
         bTznsmpdD1btUiV2875P4z16GF5jwyeNHseHD9ED/KWzsF5KahgT2lUyQmX19vxjXkv7
         MjXLdZPQR87GNf8rCzp0QmY70O/u8M9Ff5I3WHV3af6cJXyqh7mNW7xtkET3midxe5kd
         fX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752568284; x=1753173084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=st/FZxppaVFe0Jh5+nifeDNQfUVJM5gQpnMhz6B15NwaIbi/st7ixShJtMLDGYqi6h
         F3nPCoVH8QJgs7+WsKGGDzrYZiZ3Yt1RYYUVTOFAhwZQ//BrSHZL1HgvSG/BcDMsfn01
         H4NbgxxC1LPrhxtNGEo75uNuANbwBwNjzUZVnDG+0TvgP0gzLCcucjWn99JJdwb99wcT
         B79bd85s+jLx1waDuEsBycVqNZ0hxWvjvUhSciH+/iHnkfZbREG4cRugrwoIwylbmxgV
         0+Gtk2Yp142gdegxeTAu7goq4dw4yb/vTDYPNNTO56cCUYszK81EhWQ22TrzYSP5h5S7
         jNig==
X-Gm-Message-State: AOJu0YyuB3l6lqPN49nr0pvB06YOre3cIqexQvCukHwsYjhmGbTLfinW
	Q3Rz5VVPU7fwUvEEwkF6+RVR5WRNu8ERkMKege5l9Nz+sfp7IOE0RZ/hwDc/2A==
X-Gm-Gg: ASbGncvoMCGV4Eiso4XR63qQmYGZPx419z8UmJUWqQPhS6LxpgU49co6ll3BPKk8zGs
	HmldBh6mwKb/X7r0VbZzIuMx4VHjHkHwuNg0DUFs4RC0RoNV0hTDpSyXABGubjAX4hYRD5wl90C
	nXDX/3n5+YuBC6NPx6KUJ28AC73ey0vX9TfHQpaNRgXJ5KhUnVjaEQAp5gE61W0ze8Y5n0i2Xhv
	FUmYCAFdggQWrZUPaH4oEEX5LPJD3Ni7YQbetWTEEmKV2xHR31MPt/Pgw6xJwe6L54Slnc3ABHf
	qCf2IADp0A9l9ffgAHGrf9bRgG5p6SwUwgCEMlH/LACQc4POvSwIiw/Bewg0At4XWwiLxyi5pQY
	tXmJ5EvdIx7brfDVffBRSFpC/fPP05NGIMlXxbeC3MR7t4JtXb+VDaUhOkF32jO8BcyElWO2fHu
	5HjO5PhVKXyYK8yUjkRi0WmA0we/5PzLR5
X-Google-Smtp-Source: AGHT+IEteSoPVb5FybQO9igZ7ANSC94IK0hejjShrbVVn36XYTsNXVszxOFP0JqXIGR9F+wqoi9H7Q==
X-Received: by 2002:a5d:5846:0:b0:3a3:71fb:7903 with SMTP id ffacd0b85a97d-3b60b3a3960mr254171f8f.10.1752568283455;
        Tue, 15 Jul 2025 01:31:23 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v9 6/6] tools/ocaml: Add altp2m_count parameter
Date: Tue, 15 Jul 2025 08:31:14 +0000
Message-Id: <13d5b5a152f03b5bb5ac0144079c04bdd6f3cbb4.1752568020.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752568020.git.w1benny@gmail.com>
References: <cover.1752568020.git.w1benny@gmail.com>
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A182B16EA0
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:28:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065155.1430552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPaE-0001lT-9D; Thu, 31 Jul 2025 09:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065155.1430552; Thu, 31 Jul 2025 09:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPaE-0001fy-40; Thu, 31 Jul 2025 09:28:18 +0000
Received: by outflank-mailman (input) for mailman id 1065155;
 Thu, 31 Jul 2025 09:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X87O=2M=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uhPaB-0000Jb-UO
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:28:15 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aee76141-6df0-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:28:14 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4562421501fso382625e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:28:14 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfcc1sm60905485e9.17.2025.07.31.02.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 02:28:13 -0700 (PDT)
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
X-Inumbo-ID: aee76141-6df0-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753954093; x=1754558893; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=ANw27iK/hTI2fp5jZSS9v5CRFUlK/ASDSZNmrR27F94k22d4f/D+9XlQ2wsg6qGi1q
         12CdSq2GJgxzjh3oqlTR0J/tye74GdQBvYrOwDmyGuWeF69+sZvVV/EIIMc0JpSs0Fq8
         JCJ3HMSjpXeG8KzHjcn7MC0CG59XsvQroDPapukqndFVAnp5utO2hr72zdrXXqFmTBt/
         4RZxYYhvrZAgb66L7tmE0mbuN/ng/X4NS0weE0PiODSJwnozNs2IpRAEIqlMBWOTkRh6
         F4ILnRXkJkEm60SdC7gtWCW5neyfnG5DpofnHy5qgK28Tfus03HoeTIRfl+vWu/PiqYj
         v0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954093; x=1754558893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6MHrYUDy32kDYPpsu7hQKmN53Ci3Cb0G+3ghuqtWGg=;
        b=uu5ZpLcOYg7TBzXMnOfNdlJMwF3GuO5e4yWXfXXSnygYWnRV1XEtVDtNEpbaIJL4VU
         j6faAkrwxt+2TVwbK+tC1/JDksMEluq3nNY0VvoyjysM31R8k/OdkTFtpsRCfycGwuvN
         fUf2Ehb8oAucqzcZgl+hkbQm4JgmbiF2XuurB5WHT+C8x13MROBmIinbOUboXd2bPfTL
         OI95nXTnMVqMjuz9xnvbFrZkfdEhaxXQ9ql70+N/L4Rz4kw/fRXCxR+evvc/+1ZWErsX
         fHCQpHL6y2kbkEEFOtzM3N9KbQ7SgN7lv+8ucqKQ+nP2Rtq1KtceqO++6YRCH0CH1M7B
         Li/A==
X-Gm-Message-State: AOJu0YzM3xicyzGSHktXJ0qJxYXZIhYyT2pDZSMjoIxkVtTwbfKINWO1
	vWnp1hPEgVkSQ8fQyy8+gu17bnsSiUdf3/s5MQEuDFYDzPNTYU0PKCCY94jDVPGe
X-Gm-Gg: ASbGncuzaD0pVmry/t+x96kP2B4STQVi3d+s3tLVcj4qRiBRqZqiner2Oa/IjP0hyJs
	mzxK1lygGIIlbeleSoVpGWGhdQkDmnmHsqMiKpFD/4Y+3hfESVf/Co81LZQh4rLz+BCEB76nLJa
	hg2NYSuQi0iTkiuh6kwXpHR37iH7XEQeQko66PJjvVNFptZb3Lj8Nbq/YwW4RwlOsxcMrPc27XZ
	vIjgTUCtR11lV83WKplzecaKN5PG0jYtniO/wCu8xj5AEB6ZQX6G7yPRzckV2oecisJcPj4f6e0
	ZSbahOhvFqwTy5b9w2/XfTO8N5WgRptgUB3+I8IbXTWQTPiSzBc3cWjZoKf4TvGx6MDQNuKSy4r
	FvyMkd60FY0q4U7dXh0lNB1NfGph183h+Ntcvu7PiJIqUyiTCwBXai2NoAiq4h0r9DrkW2JPSMO
	T9J1ZubSHBQEWXZwgmMvkTZQ==
X-Google-Smtp-Source: AGHT+IHDauYM3bbENvt9keKItW18IVWr4ESxR7aDibVq+DmxUOjeSZ0ItRWgM3AyJBNrPkDHTe+hwA==
X-Received: by 2002:a05:600c:64c7:b0:453:7011:fcdb with SMTP id 5b1f17b1804b1-45892bbf504mr26785165e9.1.1753954093453;
        Thu, 31 Jul 2025 02:28:13 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v12 6/6] tools/ocaml: Add altp2m_count parameter
Date: Thu, 31 Jul 2025 09:28:01 +0000
Message-Id: <29eb9248618eb61c41c304a4b50bdd5250094200.1753953832.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753953832.git.w1benny@gmail.com>
References: <cover.1753953832.git.w1benny@gmail.com>
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



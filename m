Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39621902780
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 19:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737467.1143792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXp-0000ms-Kk; Mon, 10 Jun 2024 17:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737467.1143792; Mon, 10 Jun 2024 17:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXp-0000lB-Hk; Mon, 10 Jun 2024 17:10:57 +0000
Received: by outflank-mailman (input) for mailman id 737467;
 Mon, 10 Jun 2024 17:10:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGiXn-0000kp-Rt
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 17:10:55 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65775015-274c-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 19:10:54 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57c83100bd6so1606917a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 10:10:54 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c76740d6asm3233169a12.7.2024.06.10.10.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:10:53 -0700 (PDT)
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
X-Inumbo-ID: 65775015-274c-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718039454; x=1718644254; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhcL0W6YpzAV4zN8oTvV+rbaKSalw9aj5zl6oIKR4Zo=;
        b=lHPrIbAnF4xaFyS/UWVjzrI9ukhvDEQ1TDaF2ThyYcoGLCd5ycfEVeLW2uVsfip0c9
         /11Fz6aFMPWstv68qCLn5f4Z/nmSMoQg4Sh9kobcmFdPLTBXfL7zZFX7k5ciuriWyJwy
         1O73iSXN+9cZNpJCtgKHSqX+sd7j8q0PCkvdNewybczmRGIxn9KRRcPkRX40DtYJ+Gpt
         R9hPibjgXm7HMktPpxGjxcqmcv6gwyiEdKWgknaIPsEOdBXUxYe2+GyIrqGcpqNua2gS
         OkAP04nEiAFIWHJSr3hp3IW549tT68u6cbWMHvihtUiGiaQK9Q4DF1Vj271QyVIHmmph
         gcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718039454; x=1718644254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhcL0W6YpzAV4zN8oTvV+rbaKSalw9aj5zl6oIKR4Zo=;
        b=mP4bmrYUeVmF3IleAx/HBH5BmztFP3AbHMXbE4tjeh3elnH0W8y00ZlF10Kp9EX9l7
         Y0CGWkXViyy1U0WSfy9YLu5kNeU2FfCvdCTbz5nu48k+7JZ204ABUDFGEdWw+AyZSlKx
         2zAawkpuUsvV+WnCuGzMWcL6CQGXLhLOJNQ1r1Cmwa6Dp+mbACItdSa2bn6Popw/PcLk
         DSb6RuVYRDHbGOgDM1nozbTfQMbN+H2cgCF/Thss+ZDTWZ6A+/nJd1wxBl62zlo9f8v9
         IEb7RjBDq9Fr7+KMZlC+vHVAIPnGwonTgOZXfV50iewXKuql0C/ps7XKtfFAJrvBq/Gf
         VmMw==
X-Gm-Message-State: AOJu0YwszEZrKxVHx7qofk5pxx8dn6s4lE4TPQYfKM79T9VDasxV1cf1
	kszgp7Rdo/VPzAVtomZs2OLfsUKsnP8KntQiqTrVAroyj36tupQbOeHcRw==
X-Google-Smtp-Source: AGHT+IF/9drnPWbHUMULOPE6fQwj4LAi0XjphFGkLlfpN5YKzynad25966nxv2gDHdzMT+xQ8bOqCA==
X-Received: by 2002:a50:9eef:0:b0:57a:3273:e648 with SMTP id 4fb4d7f45d1cf-57c508ffe2cmr6658644a12.18.1718039453777;
        Mon, 10 Jun 2024 10:10:53 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH for-4.19? v6 2/9] tools/ocaml: Add missing ocaml bindings for altp2m_opts
Date: Mon, 10 Jun 2024 17:10:40 +0000
Message-Id: <f824c69128c85b1cab9c9554d94f7030e89d5e56.1718038855.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718038855.git.w1benny@gmail.com>
References: <cover.1718038855.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Fixes: 0291089f6ea8 ("xen: enable altp2m at create domain domctl")

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
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



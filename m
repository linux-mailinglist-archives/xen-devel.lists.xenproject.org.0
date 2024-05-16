Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227178C753C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723181.1127840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHj-0008EK-CK; Thu, 16 May 2024 11:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723181.1127840; Thu, 16 May 2024 11:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHj-0008B7-8n; Thu, 16 May 2024 11:28:31 +0000
Received: by outflank-mailman (input) for mailman id 723181;
 Thu, 16 May 2024 11:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S52g=MT=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s7ZHh-0006b7-LA
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:28:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a7b8689-1377-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 13:28:28 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-572a93890d1so3445325a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:28:28 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcede889sm7083043a12.92.2024.05.16.04.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:28:27 -0700 (PDT)
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
X-Inumbo-ID: 6a7b8689-1377-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858907; x=1716463707; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZx7e4I8f24AmBOZ73vCNLclq5iufdJNqbBIJFjDxwY=;
        b=Sc+mGZyYiWezTycnwzIkred2qGbRW+6rpfIGtNqySYtcrSrpBgrs2p/ku0YoqdLwvb
         Tdx2bJkN6eCAQbnlVkptbdxrpg5YYHIuYQR1OEZeBNScLuqYIZ7ugdRFy4NFjKlMyCoI
         4MeRaJy03JgtdJ9Kk/Ol551OB2wyZMEAVqN+zCjn7xmObnitvGXRfLgPyeNmXRJV9JvZ
         1vyEj0l4h4geTuhJQkGa1M3lUp+3zX6OZdeeoMIzKQwes6W/+gEzWX+k3IKW9FD2/dv5
         sB47X6tLcizzLiNGoVvob1ewIvDg2FQGiEJ5+nECFq3IKqwJwivPkJzN8cf8O+fsBFDM
         ZrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858907; x=1716463707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZx7e4I8f24AmBOZ73vCNLclq5iufdJNqbBIJFjDxwY=;
        b=iIJXLTJMcQOloRgan+VZJI+2Ym3hokvgT1WFn8QydS5vW1FoPsuhn9ls+Kx8+zABAU
         EuEjJEJJsK98zeHwD+qS1VlCbva3YppnvM9sAshy2dVjKEOICONEDc9EqNw0eaB1Ws1N
         TtXBQEcjVoJ/7WHjJh0yi5+rIGCIMDQfYDgiApKzMTNroR341kjC83J/p+cM7s6ORqEO
         sVHi8gyBTt6YU7shdG/EuSJSz25j+PfTP7ACzL3Bhu2OjU88UGpRuU/oh3dre9uUhcc4
         TGMlFNl25GWctkaAff+9ultl39coGEGyFKgkbwv6rUDw9use0b6LgnbHM7yF43VMwff5
         jlmA==
X-Gm-Message-State: AOJu0YzLtRB9VNNm1goczEVocIKBoOUkt+Bj8Ci0UDgdyqXhUlGwKajg
	tE8MkH+o+0D6V2pzxJM4wK8xMd00C2gZkPFMWu+44Y8309gXHpbnCVNB/xOh
X-Google-Smtp-Source: AGHT+IF340ISLMPoj07I1Jt9JQ5Xug7pRVHWxjYlGkF/DFVxJW3+Izogh9HGDdXfmKU9eVffMT049g==
X-Received: by 2002:a50:bb0f:0:b0:56f:e7b9:e67d with SMTP id 4fb4d7f45d1cf-5734d5cec3bmr19668133a12.12.1715858907443;
        Thu, 16 May 2024 04:28:27 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH for-4.19? v3 6/6] tools/ocaml: Add altp2m_count parameter
Date: Thu, 16 May 2024 11:28:13 +0000
Message-Id: <8537c5deeb409580868ec8d88171146dc7138662.1715858136.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715858136.git.w1benny@gmail.com>
References: <cover.1715858136.git.w1benny@gmail.com>
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
 tools/ocaml/libs/xc/xenctrl_stubs.c | 11 +++++++----
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 55923857ec..dfb3d331c9 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -85,6 +85,7 @@ type domctl_create_config =
     max_grant_frames: int;
     max_maptrack_frames: int;
     max_grant_version: int;
+    altp2m_count: int;
     vmtrace_buf_kb: int32;
     cpupool_id: int32;
     arch: arch_domainconfig;
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 9b4b45db3a..ff0e309c56 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -77,6 +77,7 @@ type domctl_create_config = {
   max_grant_frames: int;
   max_maptrack_frames: int;
   max_grant_version: int;
+  altp2m_count: int;
   vmtrace_buf_kb: int32;
   cpupool_id: int32;
   arch: arch_domainconfig;
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 2b6d3c09df..1f544cd2e4 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -210,9 +210,10 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
 #define VAL_MAX_GRANT_VERSION   Field(config, 8)
-#define VAL_VMTRACE_BUF_KB      Field(config, 9)
-#define VAL_CPUPOOL_ID          Field(config, 10)
-#define VAL_ARCH                Field(config, 11)
+#define VAL_ALTP2M_COUNT        Field(config, 9)
+#define VAL_VMTRACE_BUF_KB      Field(config, 10)
+#define VAL_CPUPOOL_ID          Field(config, 11)
+#define VAL_ARCH                Field(config, 12)

 	uint32_t domid = Int_val(wanted_domid);
 	uint64_t vmtrace_size = Int32_val(VAL_VMTRACE_BUF_KB);
@@ -230,6 +231,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
 		.grant_opts =
 		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
+		.nr_altp2m = Int_val(VAL_ALTP2M_COUNT),
 		.vmtrace_size = vmtrace_size,
 		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
 	};
@@ -257,7 +259,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #if defined(__i386__) || defined(__x86_64__)

 		/* Quick & dirty check for ABI changes. */
-		BUILD_BUG_ON(sizeof(cfg) != 64);
+		BUILD_BUG_ON(sizeof(cfg) != 68);

         /* Mnemonics for the named fields inside xen_x86_arch_domainconfig */
 #define VAL_EMUL_FLAGS          Field(arch_domconfig, 0)
@@ -288,6 +290,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #undef VAL_ARCH
 #undef VAL_CPUPOOL_ID
 #undef VAL_VMTRACE_BUF_KB
+#undef VAL_ALTP2M_COUNT
 #undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
--
2.34.1



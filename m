Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4498C907C
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 13:02:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724750.1129951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpl-0007NM-NF; Sat, 18 May 2024 11:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724750.1129951; Sat, 18 May 2024 11:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpl-0007Ha-I4; Sat, 18 May 2024 11:02:37 +0000
Received: by outflank-mailman (input) for mailman id 724750;
 Sat, 18 May 2024 11:02:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3Z6=MV=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s8Hpj-0006PW-SN
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 11:02:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2123da9d-1506-11ef-b4bb-af5377834399;
 Sat, 18 May 2024 13:02:34 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-420104e5336so5201145e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2024 04:02:34 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8969fbsm23777282f8f.37.2024.05.18.04.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 04:02:33 -0700 (PDT)
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
X-Inumbo-ID: 2123da9d-1506-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716030153; x=1716634953; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZx7e4I8f24AmBOZ73vCNLclq5iufdJNqbBIJFjDxwY=;
        b=MpZ2gj2nWq0O6DAu4jX0D5Y2ONcuKIHJdvbOoT7OAR1FtOgqJt1rYjzi4B3Xqc1yB6
         ayubHyvZbJUdFQQPzTw/sR63pwdz5S1tpSycvgknGIxgw6rCAOZnOy6PTyAbCEQKFiOn
         RvRIpzI0D+kJc8dkgphYfHnNDCr+q3fh0ss7xfFFrIHsJOY1AUXwQdF2V0wRebyg1Bdw
         E4CQANVArrsgkXGAEFKrnU/E4W7DuwmkpovyydON0PlN9QIrLqi2e2ktOlMvvMuaY3M4
         q0FKQ3Xq7uMGjr2fAsreOGP5HIEQZmUToHmbxCRVVh577rY9zN1VSd1u3dJ203opbUgH
         Z3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716030153; x=1716634953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZx7e4I8f24AmBOZ73vCNLclq5iufdJNqbBIJFjDxwY=;
        b=PiW1AkU29a61ho/LQ9a5mH/hC7oS3o5k24vTM9LoE4HWVGZmUMC0Ld8JfVA0TYi8Hp
         G9iDGZJncF74fvaiZqwaa4lCWbS8FIDqENvs5eEnYk0Bhiozc5ZKf3u0MlYemcgt5hfJ
         LhtvOgKbYdGAa/3PiBplHLWy48Kw/gMeQCY0kUw9ln/QvN7ju1Wm76gJMCaC3Js2dAq/
         +iSpEjVuKguruy3XhToEGUhN30QiUp/9b/T1eFA8QYA4njuNQxuCclyQhk/ZiLFfbP4G
         n/da1g6BuWpeIzOsExw/3hldI6zHipUbXYxjRJ8YmjR0BBb6sVxYcz4V30FAFmBA8tm5
         xWpA==
X-Gm-Message-State: AOJu0Yx1FUbQKrlPt60U0/qi9KXLwvyrvu8NkWtpEXiuEQP8NiJas2tf
	EhQ/BdwOBaYIdPMPOqXFMTTaHDLt+zZ/FZGkAKMHqU37F41pgzR+5n8Hfw==
X-Google-Smtp-Source: AGHT+IHsRTfJKAJsoyxs2Lhvbc+XDn+/W7DQC6ZXTI8u/8PQVwkGsEuGgUjdy6Bw0awD8RmAgnXg6w==
X-Received: by 2002:a05:600c:1c16:b0:418:bdcd:e59b with SMTP id 5b1f17b1804b1-420e19d5fa3mr13856515e9.7.1716030153510;
        Sat, 18 May 2024 04:02:33 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH for-4.19? v4 6/6] tools/ocaml: Add altp2m_count parameter
Date: Sat, 18 May 2024 11:02:17 +0000
Message-Id: <9ae1893beea2bb043413c014bd4adf6cbdab0aa7.1716029860.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716029860.git.w1benny@gmail.com>
References: <cover.1716029860.git.w1benny@gmail.com>
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



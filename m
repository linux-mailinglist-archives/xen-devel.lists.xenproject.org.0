Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65909A2871
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 18:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820763.1234376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TF4-0005U8-3i; Thu, 17 Oct 2024 16:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820763.1234376; Thu, 17 Oct 2024 16:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TF4-0005Re-0a; Thu, 17 Oct 2024 16:20:50 +0000
Received: by outflank-mailman (input) for mailman id 820763;
 Thu, 17 Oct 2024 16:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFta=RN=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t1TF2-0004vC-3B
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 16:20:48 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c45a0a80-8ca3-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 18:20:47 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a99fa009adcso58626766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 09:20:47 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d77995esm2922739a12.65.2024.10.17.09.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 09:20:46 -0700 (PDT)
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
X-Inumbo-ID: c45a0a80-8ca3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729182047; x=1729786847; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgnhx5agu8oUcqb9qagvcSva4nEzimHG4s1giyUXOgs=;
        b=DoxzSI2tFJ1jDiYPjcQ+I6PTOyZz3genmfTBvKgINuTb5soggOqQpzk1kbx6nSpR7d
         ab33TJelsGc0T5yHxITxS5TcSPlGG9Pkx2hjrGXq1ivFvW0AYw9LElRB8yVsRZXqRzDq
         3D1YrpSF5gL1zzwhcjOXCTIWzcetZVQCCY5zI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729182047; x=1729786847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgnhx5agu8oUcqb9qagvcSva4nEzimHG4s1giyUXOgs=;
        b=f3qlJ6ruI6H5QFGqbPRkrx8EyhkOnrUGPrUmsAV5DMLMwLW1+KQDet2vIhizGTsDai
         OH+ja73d9PNICQJpaQFu2w241zF9O41GDYGFfgmkUJdtLht5OolCOxZeV0QLzr29gPcl
         5svFi+3i60idHAOOb6jd8YEqVz2k5s7BiTu03W1s9RmK4GTeLx6+YH0bIYpGFw/2I9oY
         5+depgMQxuDC2ZVnJOQSfI1QfA6UEb5jVLb3Ky151NW2XEhvmzJlWr3BPx/Pe41UfMLv
         c3gR6sA/21wiIMkpBnLWjQADTtVbjDeKxeBDCx01KxbtLsjue2SuqT/5XDc2NtURa3/U
         DGBA==
X-Gm-Message-State: AOJu0Yy3aFmnFdrA2duiYYB5jA9JJqCepuXvIL4fbfxQ/22YMGUaGl+6
	zXljrM2Q0ZvcmBGVQRXOjUlCdIp8LJlxuRnpdBYN05PYeF2RJFbmHF1Yl6c6sp7plah9ERCPBJH
	Nfwk=
X-Google-Smtp-Source: AGHT+IGi48jW39nfLzkZ0jShufFEA0sV9ND93jydXIr0b+hTtD4pgFjW5DI8ncZwdeIP/YBXSsiSbA==
X-Received: by 2002:a05:6402:5c9:b0:5c9:5745:de9a with SMTP id 4fb4d7f45d1cf-5c95ac15776mr22549115a12.9.1729182046684;
        Thu, 17 Oct 2024 09:20:46 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andrii.sultanov@cloud.com>
Subject: [XEN PATCH v1 2/3] ocaml/libs: Fill build failure due to unused variable in ocaml macro
Date: Thu, 17 Oct 2024 17:20:20 +0100
Message-ID: <d6b98ca75017bf4aa72a69468321705263e66f30.1729170005.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1729170005.git.javi.merino@cloud.com>
References: <cover.1729170005.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fedora 40, the build fails with:

    gcc -m64 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -Werror -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP -MF .domain_getinfo_stubs_v1.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -fPIC -I/usr/lib64/ocaml -I /build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../libs -I /build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../libs/xsd_glue -I/build/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/../../../../../tools/include -D__XEN_TOOLS__ -I/build/tools/ocaml/libs\/xsd_glue/domain_getinfo_plugin_v1/../../../../../tools/include  -c -o domain_getinfo_stubs_v1.o domain_getinfo_stubs_v1.c
    In file included from domain_getinfo_stubs_v1.c:10:
    domain_getinfo_stubs_v1.c: In function 'xsd_glue_failwith':
    /usr/lib64/ocaml/caml/memory.h:275:29: error: unused variable 'caml__frame' [-Werror=unused-variable]
      275 |   struct caml__roots_block *caml__frame = *caml_local_roots_ptr
          |                             ^~~~~~~~~~~
    domain_getinfo_stubs_v1.c:48:9: note: in expansion of macro 'CAMLparam0'
      48 |         CAMLparam0();
         |         ^~~~~~~~~~
    cc1: all warnings being treated as errors

The CAMLparam0 macro is defined in /usr/lib64/ocaml/caml/memory.h:255 as:

    #define CAMLparam0()                                                    \
      struct caml__roots_block** caml_local_roots_ptr =                     \
        (DO_CHECK_CAML_STATE ? Caml_check_caml_state() : (void)0,           \
         &CAML_LOCAL_ROOTS);                                                \
      struct caml__roots_block *caml__frame = *caml_local_roots_ptr

We can't modify the macro.  Mark the xsd_glue_failwith() function with
ignore "-Wunused-variable" to prevent gcc from failing the build due
to the unused variable.

Fixes: a6576011a4d2 ("ocaml/libs: Implement a dynamically-loaded plugin for Xenctrl.domain_getinfo")
Signed-off-by: Javi Merino <javi.merino@cloud.com>
---

While it is not ideal, this is the most effective option I have found
that avoids treating warnings as errors.  I can add a comment above
the pragma explaining why if we decide that this is the way forward.

 .../domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
index 7be386f4d4c2..df2b3c74c727 100644
--- a/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
+++ b/tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
@@ -42,6 +42,8 @@ static struct custom_operations xsd_glue_xenctrl_ops = {
 	.compare_ext = custom_compare_ext_default, /* Can't compare     */
 };
 
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wunused-variable"
 static void Noreturn xsd_glue_failwith(
 	xc_interface *xch, const char *func, unsigned int line)
 {
@@ -70,6 +72,7 @@ static void Noreturn xsd_glue_failwith(
 
 	caml_raise_with_arg(*caml_named_value("xsg.error_v1"), msg);
 }
+#pragma GCC diagnostic pop
 #define xsd_glue_failwith(xch) xsd_glue_failwith(xch, __func__, __LINE__)
 
 CAMLprim value stub_xsd_glue_xc_interface_open(value unit)
-- 
2.46.1



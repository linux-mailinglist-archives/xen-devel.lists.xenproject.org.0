Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314CF9AE5F3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825237.1239439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xn7-0004p9-Ih; Thu, 24 Oct 2024 13:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825237.1239439; Thu, 24 Oct 2024 13:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xn7-0004me-FD; Thu, 24 Oct 2024 13:22:17 +0000
Received: by outflank-mailman (input) for mailman id 825237;
 Thu, 24 Oct 2024 13:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3xn6-0004K5-1y
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:22:16 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc598d78-920a-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 15:22:15 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a26a5d6bfso116892066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:22:15 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee592sm618574766b.79.2024.10.24.06.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 06:22:13 -0700 (PDT)
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
X-Inumbo-ID: fc598d78-920a-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729776134; x=1730380934; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEK8lPkq2pM0BIHJkdhJ3DO8laaRlVDZkwJP1Ftbg9E=;
        b=o4KPqv5Fn5t/pYZmo/MWrtbkcsoifJMy2fPde2f3O7me/TsYV13iIXcmkn4ALS8NZD
         kE3nkla79mkqGTwffRSoE0CJcAdCuL9LB9AYWPWl9k+FPaZEW7gdxBPTyKJ7zu/HHGSs
         dS+9mo9JOEGKf+QrP0ZOMXeCDGbZTfY7+a6FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776134; x=1730380934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEK8lPkq2pM0BIHJkdhJ3DO8laaRlVDZkwJP1Ftbg9E=;
        b=Y5efT7blj0P3Ig9iPLvNKyNvEJYQUMNONdIepv5Z5d8fhgWhIWCuQJ7Ne2h4NveRGf
         Bmu3QFVJ+4efqq9ynUv7V6VY31735ItGpYuvLa8/zhhDXMOSHwLwLtSHWoHWnuP4wtoE
         8ZEb+B+HUDlYN0yowTeHGNIOfKbE36YJZY5F/CIiu21I4iXVU8jF3Fyqdp5Jcbs9JtY7
         IeYU+b+yzthiPu7E8gCHcwcqhD2jM97+bnXt8l3pC2YTtwFuq3NEVANxk4ALnet/D95r
         9ebc6VTafLuipXODByTuyGYFJynYMyEaN2uFUt7uNHUIJmMDopPLcQKoRJvCZ6xSSDyh
         LerA==
X-Gm-Message-State: AOJu0YxicycdizUkyPO09hSpOC0OoudTfXGEmgBmkc1SjgKR6zqWlBQK
	11lBChRXb547nRvx91GQlJdrVMYhUXdE6ownFzZpsJ1FmHBV8ZaG1cHHbeF32TqZc6cgzZzQjlj
	u
X-Google-Smtp-Source: AGHT+IFGHdvyoTwoaTjUB6lqWKhS3LAmydk5HgOI4qdq1YnBqpDv7EOvvHeclwZXEUaaSPgOAUHlIw==
X-Received: by 2002:a17:907:3fa6:b0:a99:c0be:a8ac with SMTP id a640c23a62f3a-a9abf8b233amr554772866b.37.1729776134279;
        Thu, 24 Oct 2024 06:22:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/5] x86/ucode: Rename the cpu_request_microcode() hook to parse()
Date: Thu, 24 Oct 2024 14:22:03 +0100
Message-Id: <20241024132205.987042-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024132205.987042-1-andrew.cooper3@citrix.com>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_request_microcode() was never a good name, and the microcode suffix is
redundant.  Rename it to simply parse().

Introduce ucode_parse() and ucode_parse_dup() wrappers around the parse()
hook, also abstracting away the make_copy parameter and associated
const-correctness.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c     |  4 ++--
 xen/arch/x86/cpu/microcode/core.c    | 22 ++++++++++++++++------
 xen/arch/x86/cpu/microcode/intel.c   |  4 ++--
 xen/arch/x86/cpu/microcode/private.h |  2 +-
 4 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 0fe869eff119..3f147c10ca67 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -311,7 +311,7 @@ static int scan_equiv_cpu_table(const struct container_equiv_table *et)
     return -ESRCH;
 }
 
-static struct microcode_patch *cf_check cpu_request_microcode(
+static struct microcode_patch *cf_check amd_ucode_parse(
     const void *buf, size_t size, bool make_copy)
 {
     const struct microcode_patch *saved = NULL;
@@ -444,7 +444,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
 }
 
 static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
+    .parse                            = amd_ucode_parse,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
     .compare_patch                    = compare_patch,
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index cad38d859eee..29655a44ae62 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -217,6 +217,18 @@ static void __init microcode_grab_module(struct boot_info *bi)
 
 static struct microcode_ops __ro_after_init ucode_ops;
 
+/* Parse a ucode blob.  Returns a pointer to a heap-allocated copy, or PTR_ERR. */
+static struct microcode_patch *ucode_parse_dup(const char *buf, size_t len)
+{
+    return alternative_call(ucode_ops.parse, buf, len, true);
+}
+
+/* Parse a ucode blob.  Returns a pointer into @buf, or PTR_ERR. */
+static const struct microcode_patch *ucode_parse(const char *buf, size_t len)
+{
+    return alternative_call(ucode_ops.parse, buf, len, false);
+}
+
 static DEFINE_SPINLOCK(microcode_mutex);
 
 DEFINE_PER_CPU(struct cpu_signature, cpu_sig);
@@ -604,9 +616,7 @@ static long cf_check ucode_update_hcall_cont(void *data)
     }
 
     alternative_vcall(ucode_ops.collect_cpu_info);
-    patch_with_flags.patch = alternative_call(ucode_ops.cpu_request_microcode,
-                                              (const void *)buffer->buffer,
-                                              buffer->len, true);
+    patch_with_flags.patch = ucode_parse_dup(buffer->buffer, buffer->len);
     patch_with_flags.flags = buffer->flags;
     xfree(buffer);
     if ( IS_ERR(patch_with_flags.patch) )
@@ -788,7 +798,7 @@ static int __init early_update_cache(const void *data, size_t len)
         return -ENOMEM;
 
     alternative_vcall(ucode_ops.collect_cpu_info);
-    patch = alternative_call(ucode_ops.cpu_request_microcode, data, len, true);
+    patch = ucode_parse_dup(data, len);
     if ( IS_ERR(patch) )
     {
         printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
@@ -832,7 +842,7 @@ static int __init early_microcode_update_cpu(void)
 {
     const void *data = NULL;
     size_t len;
-    struct microcode_patch *patch;
+    const struct microcode_patch *patch;
 
     if ( ucode_blob.size )
     {
@@ -848,7 +858,7 @@ static int __init early_microcode_update_cpu(void)
     if ( !data )
         return -ENOMEM;
 
-    patch = ucode_ops.cpu_request_microcode(data, len, false);
+    patch = ucode_parse(data, len);
     if ( IS_ERR(patch) )
     {
         printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index bad51f64724a..3d3f7e57db80 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -334,7 +334,7 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
     return 0;
 }
 
-static struct microcode_patch *cf_check cpu_request_microcode(
+static struct microcode_patch *cf_check intel_ucode_parse(
     const void *buf, size_t size, bool make_copy)
 {
     int error = 0;
@@ -406,7 +406,7 @@ static bool __init can_load_microcode(void)
 }
 
 static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
+    .parse                            = intel_ucode_parse,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
     .compare_patch                    = compare_patch,
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index c72f060ac394..e30acee1536b 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -37,7 +37,7 @@ struct microcode_ops {
      * If one is not found, (nothing matches the current CPU), return NULL.
      * Also may return ERR_PTR(-err), e.g. bad container, out of memory.
      */
-    struct microcode_patch *(*cpu_request_microcode)(
+    struct microcode_patch *(*parse)(
         const void *buf, size_t size, bool make_copy);
 
     /*
-- 
2.39.5



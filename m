Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A759AE5F9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825239.1239459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xnA-0005Jr-Ai; Thu, 24 Oct 2024 13:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825239.1239459; Thu, 24 Oct 2024 13:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xnA-0005Hz-60; Thu, 24 Oct 2024 13:22:20 +0000
Received: by outflank-mailman (input) for mailman id 825239;
 Thu, 24 Oct 2024 13:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3xn8-0004K5-8i
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:22:18 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd91717d-920a-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 15:22:17 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c948c41edeso1032331a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:22:17 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee592sm618574766b.79.2024.10.24.06.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 06:22:14 -0700 (PDT)
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
X-Inumbo-ID: fd91717d-920a-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729776136; x=1730380936; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df5ZhRz35AbRcfDDCuCuW3JIPnNenLDg73Ag7Qq+uQc=;
        b=OBeX4gqY7QspMNt5M42vV28J4pvcj6MR52E3TeXyZUTNShUxo4b7lMBvlJvCkb3jvT
         wOtrudYRifqjYnH7pcYb6LedYkjoud/ijKiC+cKywtzs2+4SlDJFSjUtj2TyQMkOHLuh
         s0EWG8HLWsE/ZQtBkwVsmEyvXPvyi5lJLVs2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776136; x=1730380936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df5ZhRz35AbRcfDDCuCuW3JIPnNenLDg73Ag7Qq+uQc=;
        b=ms56cUH04Fq9FY7W+HG6FL4xdDowi9HNiteoj2e5G064lL5caT1HB5In+9o2WjxpZW
         iSl+lCBJUK61Mcn6Ax5ffSKQngM/hlhM9oTEK4xh9yGlFe9rVH4EuSa6voFOktTaDE3F
         RtdP+nGEFlLP6/1rdHAS/yn4CG+dN4ddGL+YnmwRVGG6dR1jylxMGVHnkcJjfYf4lZlM
         M527m+OOsFYwFNCGHBVctwZrZ8tHvGjAbxnGKVhQag9tC4Z36erobfFqdDfMdg7sOVJ+
         8jdc5Eokym/4yKbeUp6RUVXLj01WN58n6oV/USONoRlY2JV44D5uENAN2jY1i5WuLBxE
         KrBQ==
X-Gm-Message-State: AOJu0YxG5ppIQ6DZBbCvCtGUQZe6Ne/c1oXef1ffVoYOeYhA1bLG4dAB
	mf9ajC0giO5pmDosXf6rZJN41KbvxTz2oJUs/bUoAXNNOyP5ccf5Lely2qx+OLRQaYZj4jN+8XG
	8
X-Google-Smtp-Source: AGHT+IHTUnP+Aq6o8B4fU0w9na2iXanTiNixUKKg99rw6/LW1fGByVVfMqw13Yi4nOF6XBc/BuDTgw==
X-Received: by 2002:a17:906:7309:b0:a99:dde6:9f42 with SMTP id a640c23a62f3a-a9abf96ce04mr630900766b.47.1729776135978;
        Thu, 24 Oct 2024 06:22:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 4/5] x86/ucode: Rename the apply_microcode() hook to load()
Date: Thu, 24 Oct 2024 14:22:04 +0100
Message-Id: <20241024132205.987042-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024132205.987042-1-andrew.cooper3@citrix.com>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The microcode suffix is redundant, and "microcode loading" is the more common
term
---
 xen/arch/x86/cpu/microcode/amd.c     |  6 +++---
 xen/arch/x86/cpu/microcode/core.c    | 27 ++++++++++++++++-----------
 xen/arch/x86/cpu/microcode/intel.c   |  8 ++++----
 xen/arch/x86/cpu/microcode/private.h |  7 +++----
 4 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 3f147c10ca67..1845f51ba330 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -214,8 +214,8 @@ static enum microcode_match_result cf_check compare_patch(
     return compare_header(new, old);
 }
 
-static int cf_check apply_microcode(const struct microcode_patch *patch,
-                                    unsigned int flags)
+static int cf_check amd_ucode_load(const struct microcode_patch *patch,
+                                   unsigned int flags)
 {
     int hw_err;
     unsigned int cpu = smp_processor_id();
@@ -446,7 +446,7 @@ static struct microcode_patch *cf_check amd_ucode_parse(
 static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
     .parse                            = amd_ucode_parse,
     .collect_cpu_info                 = collect_cpu_info,
-    .apply_microcode                  = apply_microcode,
+    .load                             = amd_ucode_load,
     .compare_patch                    = compare_patch,
 };
 
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 29655a44ae62..f320ea87c1dc 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -229,6 +229,12 @@ static const struct microcode_patch *ucode_parse(const char *buf, size_t len)
     return alternative_call(ucode_ops.parse, buf, len, false);
 }
 
+/* Load a ucode blob.  Returns -errno. */
+static int ucode_load(const struct microcode_patch *patch, unsigned int flags)
+{
+    return alternative_call(ucode_ops.load, patch, flags);
+}
+
 static DEFINE_SPINLOCK(microcode_mutex);
 
 DEFINE_PER_CPU(struct cpu_signature, cpu_sig);
@@ -333,11 +339,10 @@ static int microcode_update_cpu(const struct microcode_patch *patch,
 
     spin_lock(&microcode_mutex);
     if ( patch )
-        err = alternative_call(ucode_ops.apply_microcode, patch, flags);
+        err = ucode_load(patch, flags);
     else if ( microcode_cache )
     {
-        err = alternative_call(ucode_ops.apply_microcode, microcode_cache,
-                               flags);
+        err = ucode_load(microcode_cache, flags);
         if ( err == -EIO )
         {
             microcode_free_patch(microcode_cache);
@@ -388,7 +393,7 @@ static int primary_thread_work(const struct microcode_patch *patch,
     if ( !wait_for_state(LOADING_ENTER) )
         return -EBUSY;
 
-    ret = alternative_call(ucode_ops.apply_microcode, patch, flags);
+    ret = ucode_load(patch, flags);
     if ( !ret )
         atomic_inc(&cpu_updated);
     atomic_inc(&cpu_out);
@@ -502,7 +507,7 @@ static int control_thread_fn(const struct microcode_patch *patch,
         goto out;
 
     /* Control thread loads ucode first while others are in NMI handler. */
-    ret = alternative_call(ucode_ops.apply_microcode, patch, flags);
+    ret = ucode_load(patch, flags);
     if ( !ret )
         atomic_inc(&cpu_updated);
     atomic_inc(&cpu_out);
@@ -731,7 +736,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
     if ( flags & ~XENPF_UCODE_FORCE )
         return -EINVAL;
 
-    if ( !ucode_ops.apply_microcode )
+    if ( !ucode_ops.load )
         return -EINVAL;
 
     buffer = xmalloc_flex_struct(struct ucode_buf, buffer, len);
@@ -783,7 +788,7 @@ int microcode_update_one(void)
     if ( ucode_ops.collect_cpu_info )
         alternative_vcall(ucode_ops.collect_cpu_info);
 
-    if ( !ucode_ops.apply_microcode )
+    if ( !ucode_ops.load )
         return -EOPNOTSUPP;
 
     return microcode_update_cpu(NULL, 0);
@@ -821,7 +826,7 @@ int __init microcode_init_cache(struct boot_info *bi)
 {
     int rc = 0;
 
-    if ( !ucode_ops.apply_microcode )
+    if ( !ucode_ops.load )
         return -ENODEV;
 
     if ( ucode_scan )
@@ -907,11 +912,11 @@ int __init early_microcode_init(struct boot_info *bi)
      *
      * Take the hint in either case and ignore the microcode interface.
      */
-    if ( !ucode_ops.apply_microcode || this_cpu(cpu_sig).rev == ~0 )
+    if ( !ucode_ops.load || this_cpu(cpu_sig).rev == ~0 )
     {
         printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
-               ucode_ops.apply_microcode ? "rev = ~0" : "HW toggle");
-        ucode_ops.apply_microcode = NULL;
+               ucode_ops.load ? "rev = ~0" : "HW toggle");
+        ucode_ops.load = NULL;
         return -ENODEV;
     }
 
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 3d3f7e57db80..5e6863fd8c9f 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -287,8 +287,8 @@ static enum microcode_match_result cf_check compare_patch(
     return compare_revisions(old->rev, new->rev);
 }
 
-static int cf_check apply_microcode(const struct microcode_patch *patch,
-                                    unsigned int flags)
+static int cf_check intel_ucode_load(const struct microcode_patch *patch,
+                                     unsigned int flags)
 {
     uint64_t msr_content;
     unsigned int cpu = smp_processor_id();
@@ -408,7 +408,7 @@ static bool __init can_load_microcode(void)
 static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
     .parse                            = intel_ucode_parse,
     .collect_cpu_info                 = collect_cpu_info,
-    .apply_microcode                  = apply_microcode,
+    .load                             = intel_ucode_load,
     .compare_patch                    = compare_patch,
 };
 
@@ -417,5 +417,5 @@ void __init ucode_probe_intel(struct microcode_ops *ops)
     *ops = intel_ucode_ops;
 
     if ( !can_load_microcode() )
-        ops->apply_microcode = NULL;
+        ops->load = NULL;
 }
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index e30acee1536b..9611efaa979c 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -50,8 +50,7 @@ struct microcode_ops {
      * Attempt to load the provided patch into the CPU.  Returns an error if
      * anything didn't go as expected.
      */
-    int (*apply_microcode)(const struct microcode_patch *patch,
-                           unsigned int flags);
+    int (*load)(const struct microcode_patch *patch, unsigned int flags);
 
     /*
      * Given two patches, are they both applicable to the current CPU, and is
@@ -68,8 +67,8 @@ struct microcode_ops {
  *   - Loading available
  *
  * These are encoded by (not) filling in ops->collect_cpu_info (i.e. no
- * support available) and (not) ops->apply_microcode (i.e. read only).
- * Otherwise, all hooks must be filled in.
+ * support available) and (not) ops->load (i.e. read only).  Otherwise, all
+ * hooks must be filled in.
  */
 #ifdef CONFIG_AMD
 void ucode_probe_amd(struct microcode_ops *ops);
-- 
2.39.5



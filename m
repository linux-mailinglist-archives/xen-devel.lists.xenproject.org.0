Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AF593BDEF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 10:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764819.1175403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtpN-0007Wf-2Y; Thu, 25 Jul 2024 08:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764819.1175403; Thu, 25 Jul 2024 08:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtpM-0007Q0-TI; Thu, 25 Jul 2024 08:27:56 +0000
Received: by outflank-mailman (input) for mailman id 764819;
 Thu, 25 Jul 2024 08:27:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D+J6=OZ=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sWtpL-0006fy-1U
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 08:27:55 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c98fceed-4a5f-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 10:27:53 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5a3458bf858so775061a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 01:27:53 -0700 (PDT)
Received: from fhilly.. ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63590e7esm558590a12.36.2024.07.25.01.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:27:52 -0700 (PDT)
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
X-Inumbo-ID: c98fceed-4a5f-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721896073; x=1722500873; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVOe/t8VUEI4RbQ7J8nQRfJ3cqYvw3XGeBz8W3XqdYQ=;
        b=bc9NLOZqY8akKdVl6epvNFAIRbhXk37XuqogVZYvHCD0CfcZLQcXrWX1RyuO6QR8fm
         6jTsaw3Wb2m9Cbt+GwD8RKQkbIIw4L8fGTlZ1yBqPFu/tAUwRMyfHka1VMfunAWkKWTL
         qeYJcHFQgvi/n5+Yio6780R1x8OI2yQWZbDpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721896073; x=1722500873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVOe/t8VUEI4RbQ7J8nQRfJ3cqYvw3XGeBz8W3XqdYQ=;
        b=m8tPmJP5acrqNOFpLaVCWEM/EGXH9GVviiVVARrMArM28FuCr9FWY6WhUFZTWqdP0a
         ujnRyAlKcdinkAFwzNT50FFi+zFDQncxf4tNn6eGzz2raUsmAqUUJF8pcCnnhgoAjJts
         CIiGxLtpqf4qI6iXAfzwO2DrbBX9KouZOzYm9U4MIUBl9ztW45h9zxW6kUHKNpmqByc4
         31mJJFbkoXOHMi9M0vRCTnry7vvjUdgeSfBKkiVUjGxseDBOIfYauB1PZH8HUdNida/b
         3nzzM+jks2oiJ257zF3tN2poKkaP3DAP9TZNX8SVsa1ItC0eiCCGbHHoAfQvdgoaz7+q
         g1qQ==
X-Gm-Message-State: AOJu0YyBD7wSEF8wksHNYRBuunZ5YyUm+xO5cf6Xz14xvFMYsABaop9A
	+AnIJ/yegB9a/zn9SOYHny6vvgvDNWS4HAMyTkl4ZdbW6oFEuLkXys2EinBdyUAwOmWVCIErLQs
	z
X-Google-Smtp-Source: AGHT+IHqduZ9jVdHIHCAMWvCZqNZx+lg5p4II0Cave3jH/z3mA1k0t7L04M1v0i9O+J7YkYuM9Katw==
X-Received: by 2002:a50:870b:0:b0:58b:9561:650b with SMTP id 4fb4d7f45d1cf-5ac63c50f88mr962304a12.25.1721896072638;
        Thu, 25 Jul 2024 01:27:52 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 4/4] x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same
Date: Thu, 25 Jul 2024 09:27:25 +0100
Message-ID: <20240725082725.2685481-5-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240725082725.2685481-1-fouad.hilly@cloud.com>
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass xen-ucode flags to do low level checks on micorocde version and
utilize it to allow for microcode downgrade or reapply the same version of the
microcode.
ucode_force is required to be passed to a low level Intel and AMD for version
checks to be done.
While adding ucode_force, opt_ucode_allow_same was removed.
Remove opt_ucode_allow_same from documentation.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
[v6]
1- Removed struct microcode_nmi_patch_with_flags.
2- removed const from control_thread_fn() and primary_thread_fn().
3- Fixed "flags" checks.
[v5]
1- Update commit message.
2- Introduce structs microcode_patch_with_flags and microcode_nmi_patch_with_flags.
3- pass flags to Intel and AMD low level through apply_microcode().
[4]
1- As opt_ucode_allow_same is not required anymore, it has been removed while introducing ucode_force.
2- Apply the changes for both AMD and Intel.
3- Remove the mention of opt_ucode_allow_same from documentation.
---
 docs/misc/xen-command-line.pandoc    |  7 +--
 xen/arch/x86/cpu/microcode/amd.c     |  8 ++-
 xen/arch/x86/cpu/microcode/core.c    | 88 +++++++++++++++++-----------
 xen/arch/x86/cpu/microcode/intel.c   |  9 ++-
 xen/arch/x86/cpu/microcode/private.h |  5 +-
 5 files changed, 68 insertions(+), 49 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 98a45211556b..2a8d47bbc664 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2650,7 +2650,7 @@ performance.
    Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
 
 ### ucode
-> `= List of [ <integer> | scan=<bool>, nmi=<bool>, allow-same=<bool> ]`
+> `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
 
     Applicability: x86
     Default: `nmi`
@@ -2682,11 +2682,6 @@ precedence over `scan`.
 stop_machine context. In NMI handler, even NMIs are blocked, which is
 considered safer. The default value is `true`.
 
-'allow-same' alters the default acceptance policy for new microcode to permit
-trying to reload the same version.  Many CPUs will actually reload microcode
-of the same version, and this allows for easy testing of the late microcode
-loading path.
-
 ### unrestricted_guest (Intel)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index f76a563c8b84..80ff6335d64a 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -22,6 +22,8 @@
 
 #include "private.h"
 
+#include "public/platform.h"
+
 #define pr_debug(x...) ((void)0)
 
 struct equiv_cpu_entry {
@@ -214,13 +216,15 @@ static enum microcode_match_result cf_check compare_patch(
     return compare_header(new, old);
 }
 
-static int cf_check apply_microcode(const struct microcode_patch *patch)
+static int cf_check apply_microcode(const struct microcode_patch *patch,
+                                    unsigned int flags)
 {
     int hw_err;
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
     uint32_t rev, old_rev = sig->rev;
     enum microcode_match_result result = microcode_fits(patch);
+    bool ucode_force = flags & XENPF_UCODE_FORCE;
 
     if ( result == MIS_UCODE )
         return -EINVAL;
@@ -229,7 +233,7 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
      * Allow application of the same revision to pick up SMT-specific changes
      * even if the revision of the other SMT thread is already up-to-date.
      */
-    if ( result == OLD_UCODE )
+    if ( !ucode_force && (result == SAME_UCODE || result == OLD_UCODE) )
         return -EEXIST;
 
     if ( check_final_patch_levels(sig) )
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 8a9e744489b9..a0106a987e33 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -90,6 +90,11 @@ struct ucode_mod_blob {
     size_t size;
 };
 
+struct patch_with_flags {
+    unsigned int flags;
+    struct microcode_patch *patch;
+};
+
 static struct ucode_mod_blob __initdata ucode_blob;
 /*
  * By default we will NOT parse the multiboot modules to see if there is
@@ -100,8 +105,6 @@ static bool __initdata ucode_scan;
 /* By default, ucode loading is done in NMI handler */
 static bool ucode_in_nmi = true;
 
-bool __read_mostly opt_ucode_allow_same;
-
 /* Protected by microcode_mutex */
 static struct microcode_patch *microcode_cache;
 
@@ -128,8 +131,6 @@ static int __init cf_check parse_ucode(const char *s)
 
         if ( (val = parse_boolean("nmi", s, ss)) >= 0 )
             ucode_in_nmi = val;
-        else if ( (val = parse_boolean("allow-same", s, ss)) >= 0 )
-            opt_ucode_allow_same = val;
         else if ( !ucode_mod_forced ) /* Not forced by EFI */
         {
             if ( (val = parse_boolean("scan", s, ss)) >= 0 )
@@ -237,7 +238,11 @@ static DEFINE_PER_CPU(int, loading_err);
  */
 static cpumask_t cpu_callin_map;
 static atomic_t cpu_out, cpu_updated;
-static const struct microcode_patch *nmi_patch = ZERO_BLOCK_PTR;
+static struct patch_with_flags nmi_patch_with_flags =
+{
+    .flags  = 0,
+    .patch  = ZERO_BLOCK_PTR,
+};
 
 /*
  * Return a patch that covers current CPU. If there are multiple patches,
@@ -327,7 +332,8 @@ static bool cf_check wait_cpu_callout(unsigned int nr)
  * If no patch is provided, the cached patch will be loaded. Microcode update
  * during APs bringup and CPU resuming falls into this case.
  */
-static int microcode_update_cpu(const struct microcode_patch *patch)
+static int microcode_update_cpu(const struct microcode_patch *patch,
+                                unsigned int flags)
 {
     int err;
 
@@ -335,10 +341,11 @@ static int microcode_update_cpu(const struct microcode_patch *patch)
 
     spin_lock(&microcode_mutex);
     if ( patch )
-        err = alternative_call(ucode_ops.apply_microcode, patch);
+        err = alternative_call(ucode_ops.apply_microcode, patch, flags);
     else if ( microcode_cache )
     {
-        err = alternative_call(ucode_ops.apply_microcode, microcode_cache);
+        err = alternative_call(ucode_ops.apply_microcode, microcode_cache,
+                               flags);
         if ( err == -EIO )
         {
             microcode_free_patch(microcode_cache);
@@ -379,7 +386,8 @@ static int secondary_nmi_work(void)
     return wait_for_state(LOADING_EXIT) ? 0 : -EBUSY;
 }
 
-static int primary_thread_work(const struct microcode_patch *patch)
+static int primary_thread_work(struct microcode_patch *patch,
+                               unsigned int flags)
 {
     int ret;
 
@@ -388,7 +396,7 @@ static int primary_thread_work(const struct microcode_patch *patch)
     if ( !wait_for_state(LOADING_ENTER) )
         return -EBUSY;
 
-    ret = alternative_call(ucode_ops.apply_microcode, patch);
+    ret = alternative_call(ucode_ops.apply_microcode, patch, flags);
     if ( !ret )
         atomic_inc(&cpu_updated);
     atomic_inc(&cpu_out);
@@ -416,7 +424,8 @@ static int cf_check microcode_nmi_callback(
         return 0;
 
     if ( primary_cpu )
-        ret = primary_thread_work(nmi_patch);
+        ret = primary_thread_work(nmi_patch_with_flags.patch,
+                                  nmi_patch_with_flags.flags);
     else
         ret = secondary_nmi_work();
     this_cpu(loading_err) = ret;
@@ -446,7 +455,8 @@ static int secondary_thread_fn(void)
     return this_cpu(loading_err);
 }
 
-static int primary_thread_fn(const struct microcode_patch *patch)
+static int primary_thread_fn(struct microcode_patch *patch,
+                             unsigned int flags)
 {
     if ( !wait_for_state(LOADING_CALLIN) )
         return -EBUSY;
@@ -466,10 +476,11 @@ static int primary_thread_fn(const struct microcode_patch *patch)
         return this_cpu(loading_err);
     }
 
-    return primary_thread_work(patch);
+    return primary_thread_work(patch, flags);
 }
 
-static int control_thread_fn(const struct microcode_patch *patch)
+static int control_thread_fn(struct microcode_patch *patch,
+                             unsigned int flags)
 {
     unsigned int cpu = smp_processor_id(), done;
     unsigned long tick;
@@ -482,7 +493,8 @@ static int control_thread_fn(const struct microcode_patch *patch)
      */
     watchdog_disable();
 
-    nmi_patch = patch;
+    nmi_patch_with_flags.patch = patch;
+    nmi_patch_with_flags.flags = flags;
     smp_wmb();
     saved_nmi_callback = set_nmi_callback(microcode_nmi_callback);
 
@@ -498,7 +510,7 @@ static int control_thread_fn(const struct microcode_patch *patch)
         goto out;
 
     /* Control thread loads ucode first while others are in NMI handler. */
-    ret = alternative_call(ucode_ops.apply_microcode, patch);
+    ret = alternative_call(ucode_ops.apply_microcode, patch, flags);
     if ( !ret )
         atomic_inc(&cpu_updated);
     atomic_inc(&cpu_out);
@@ -544,17 +556,19 @@ static int control_thread_fn(const struct microcode_patch *patch)
 
     set_nmi_callback(saved_nmi_callback);
     smp_wmb();
-    nmi_patch = ZERO_BLOCK_PTR;
+    nmi_patch_with_flags.patch = ZERO_BLOCK_PTR;
+    nmi_patch_with_flags.flags = 0;
 
     watchdog_enable();
 
     return ret;
 }
 
-static int cf_check do_microcode_update(void *patch)
+static int cf_check do_microcode_update(void *_patch_with_flags)
 {
     unsigned int cpu = smp_processor_id();
     int ret;
+    struct patch_with_flags *patch_with_flags = _patch_with_flags;
 
     /*
      * The control thread set state to coordinate ucode loading. Primary
@@ -562,9 +576,11 @@ static int cf_check do_microcode_update(void *patch)
      * the completion of the ucode loading process.
      */
     if ( cpu == cpumask_first(&cpu_online_map) )
-        ret = control_thread_fn(patch);
+        ret = control_thread_fn(patch_with_flags->patch,
+                                patch_with_flags->flags);
     else if ( is_cpu_primary(cpu) )
-        ret = primary_thread_fn(patch);
+        ret = primary_thread_fn(patch_with_flags->patch,
+                                patch_with_flags->flags);
     else
         ret = secondary_thread_fn();
 
@@ -582,7 +598,8 @@ static long cf_check microcode_update_helper(void *data)
     int ret;
     struct ucode_buf *buffer = data;
     unsigned int cpu, updated;
-    struct microcode_patch *patch;
+    struct patch_with_flags patch_with_flags;
+    bool ucode_force = buffer->flags & XENPF_UCODE_FORCE;
 
     /* cpu_online_map must not change during update */
     if ( !get_cpu_maps() )
@@ -606,16 +623,17 @@ static long cf_check microcode_update_helper(void *data)
         goto put;
     }
 
-    patch = parse_blob(buffer->buffer, buffer->len);
+    patch_with_flags.patch = parse_blob(buffer->buffer, buffer->len);
+    patch_with_flags.flags = buffer->flags;
     xfree(buffer);
-    if ( IS_ERR(patch) )
+    if ( IS_ERR(patch_with_flags.patch) )
     {
-        ret = PTR_ERR(patch);
+        ret = PTR_ERR(patch_with_flags.patch);
         printk(XENLOG_WARNING "Parsing microcode blob error %d\n", ret);
         goto put;
     }
 
-    if ( !patch )
+    if ( !patch_with_flags.patch )
     {
         printk(XENLOG_WARNING "microcode: couldn't find any matching ucode in "
                               "the provided blob!\n");
@@ -632,17 +650,17 @@ static long cf_check microcode_update_helper(void *data)
     {
         enum microcode_match_result result;
 
-        result = alternative_call(ucode_ops.compare_patch, patch,
-                                  microcode_cache);
+        result = alternative_call(ucode_ops.compare_patch,
+                                  patch_with_flags.patch, microcode_cache);
 
         if ( result != NEW_UCODE &&
-             !(opt_ucode_allow_same && result == SAME_UCODE) )
+             !(ucode_force && (result == OLD_UCODE || result == SAME_UCODE)) )
         {
             spin_unlock(&microcode_mutex);
             printk(XENLOG_WARNING
                    "microcode: couldn't find any newer%s revision in the provided blob!\n",
-                   opt_ucode_allow_same ? " (or the same)" : "");
-            microcode_free_patch(patch);
+                   ucode_force? " (or a valid)" : "");
+            microcode_free_patch(patch_with_flags.patch);
             ret = -EEXIST;
 
             goto put;
@@ -674,13 +692,13 @@ static long cf_check microcode_update_helper(void *data)
      *   this requirement can be relaxed in the future. Right now, this is
      *   conservative and good.
      */
-    ret = stop_machine_run(do_microcode_update, patch, NR_CPUS);
+    ret = stop_machine_run(do_microcode_update, &patch_with_flags, NR_CPUS);
 
     updated = atomic_read(&cpu_updated);
     if ( updated > 0 )
     {
         spin_lock(&microcode_mutex);
-        microcode_update_cache(patch);
+        microcode_update_cache(patch_with_flags.patch);
         spin_unlock(&microcode_mutex);
 
         /*
@@ -697,7 +715,7 @@ static long cf_check microcode_update_helper(void *data)
             alternative_vcall(ctxt_switch_masking, current);
     }
     else
-        microcode_free_patch(patch);
+        microcode_free_patch(patch_with_flags.patch);
 
     if ( updated && updated != nr_cores )
         printk(XENLOG_ERR "ERROR: Updating microcode succeeded on %u cores and failed\n"
@@ -775,7 +793,7 @@ int microcode_update_one(void)
     if ( !ucode_ops.apply_microcode )
         return -EOPNOTSUPP;
 
-    return microcode_update_cpu(NULL);
+    return microcode_update_cpu(NULL, 0);
 }
 
 static int __init early_update_cache(const void *data, size_t len)
@@ -858,7 +876,7 @@ static int __init early_microcode_update_cpu(void)
     if ( !patch )
         return -ENOENT;
 
-    return microcode_update_cpu(patch);
+    return microcode_update_cpu(patch, 0);
 }
 
 int __init early_microcode_init(unsigned long *module_map,
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f505aa1b7888..fc80f17d2376 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -29,6 +29,8 @@
 
 #include "private.h"
 
+#include "public/platform.h"
+
 #define pr_debug(x...) ((void)0)
 
 struct microcode_patch {
@@ -284,21 +286,22 @@ static enum microcode_match_result cf_check compare_patch(
     return compare_revisions(old->rev, new->rev);
 }
 
-static int cf_check apply_microcode(const struct microcode_patch *patch)
+static int cf_check apply_microcode(const struct microcode_patch *patch,
+                                    unsigned int flags)
 {
     uint64_t msr_content;
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &this_cpu(cpu_sig);
     uint32_t rev, old_rev = sig->rev;
     enum microcode_match_result result;
+    bool ucode_force = flags & XENPF_UCODE_FORCE;
 
     result = microcode_update_match(patch);
 
     if ( result == MIS_UCODE )
         return -EINVAL;
 
-    if ( result == OLD_UCODE ||
-         (result == SAME_UCODE && !opt_ucode_allow_same) )
+    if ( !ucode_force && (result == SAME_UCODE || result == OLD_UCODE) )
         return -EEXIST;
 
     wbinvd();
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index da556fe5060a..017889e1b58d 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -3,8 +3,6 @@
 
 #include <asm/microcode.h>
 
-extern bool opt_ucode_allow_same;
-
 enum microcode_match_result {
     OLD_UCODE, /* signature matched, but revision id is older */
     SAME_UCODE, /* signature matched, but revision id is the same */
@@ -50,7 +48,8 @@ struct microcode_ops {
      * Attempt to load the provided patch into the CPU.  Returns an error if
      * anything didn't go as expected.
      */
-    int (*apply_microcode)(const struct microcode_patch *patch);
+    int (*apply_microcode)(const struct microcode_patch *patch,
+                           unsigned int flags);
 
     /*
      * Given two patches, are they both applicable to the current CPU, and is
-- 
2.42.0



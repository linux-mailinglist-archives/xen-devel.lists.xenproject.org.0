Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073D192FADF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 15:08:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758028.1167273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSG0U-0006FK-Ek; Fri, 12 Jul 2024 13:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758028.1167273; Fri, 12 Jul 2024 13:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSG0U-0006Cl-73; Fri, 12 Jul 2024 13:08:14 +0000
Received: by outflank-mailman (input) for mailman id 758028;
 Fri, 12 Jul 2024 13:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/nkX=OM=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sSG0S-0005Dy-BY
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 13:08:12 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9a1a27b-404f-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 15:08:10 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77e85cb9b4so269121066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 06:08:10 -0700 (PDT)
Received: from fhilly.. ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a87204esm343023466b.222.2024.07.12.06.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 06:08:08 -0700 (PDT)
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
X-Inumbo-ID: c9a1a27b-404f-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720789689; x=1721394489; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whToGD1DSrObOBTapTvNuH8JLCI/G4TaeHuUCU4s/+Y=;
        b=XcYnKqy/EASk6PAFbsUI2PZW2RldYg66HF6djGazC+tqEiVbqJBhM2hFz0SNgVg/XL
         GRg7uP+AnWftKI4lLu4e8TMbd2o3QAt26fK3uV7iysrEXdWNgFTBgZWnQ4XszaUe3H91
         g+P+nHYdyhYL0V34k8sJ+/cvX2GFio7ZGsHPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720789689; x=1721394489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whToGD1DSrObOBTapTvNuH8JLCI/G4TaeHuUCU4s/+Y=;
        b=YidYpK3SNVDTZ8yVmT00O1rN4A8Knv5CkCwFAY5MN3OATWGkqjTAranByMFCo12ia1
         XImw23pkBtskrZhb9FqyjxIn58fyBmRem8hQBg8F+5KOYGcqscKsMC1KbGTJcJ9GSNhP
         fUsPEPMfdQIBov3tLB4NNwU2XezCKsGouZpI0Kowk+YjS96BgpsQFwhhTLBOMgPzmoYv
         Q08LowT4fS22mUszn+1UsHL/4jLaiXX+Fha4dLfCFReDDISraAd+JXtpcQyjmvpXHqGF
         vznGtIKw9TKh7zBgKtCjRJgsihkDmfJnam/DKlyGzKzyuF0eR0aSZnhX48MWMx6EyvCb
         E6Ow==
X-Gm-Message-State: AOJu0YzTqpicixnZKgnJvrDETXG+IuQscFGr/uo5gK9RNqBY/c4wfVSO
	dMG2HKTODV/NHjZ3+4hmKohSnzbBq8WJve6ZDfM85aeGbAl25fM83qgfh0+E3uePVk1FRBXHoRn
	E
X-Google-Smtp-Source: AGHT+IEdA9Cz83EZJSxAH1Fuqkpusyqqzjn/AqTYK7EiRWSKEsbzDbP8vq5akLT8oTFOPmzIL9ROzg==
X-Received: by 2002:a17:906:aacd:b0:a77:db97:f4fd with SMTP id a640c23a62f3a-a780b6ff016mr700949266b.34.1720789689018;
        Fri, 12 Jul 2024 06:08:09 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 4/4] x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same
Date: Fri, 12 Jul 2024 14:07:49 +0100
Message-ID: <20240712130749.1272741-5-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240712130749.1272741-1-fouad.hilly@cloud.com>
References: <20240712130749.1272741-1-fouad.hilly@cloud.com>
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
 xen/arch/x86/cpu/microcode/core.c    | 93 +++++++++++++++++-----------
 xen/arch/x86/cpu/microcode/intel.c   |  9 ++-
 xen/arch/x86/cpu/microcode/private.h |  5 +-
 5 files changed, 73 insertions(+), 49 deletions(-)

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
index f76a563c8b84..8ec19441cfcd 100644
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
+    bool ucode_force = flags == XENPF_UCODE_FORCE;
 
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
index 8a9e744489b9..2e3923152367 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -90,6 +90,16 @@ struct ucode_mod_blob {
     size_t size;
 };
 
+struct microcode_patch_with_flags {
+    unsigned int flags;
+    struct microcode_patch *patch;
+};
+
+struct microcode_nmi_patch_with_flags {
+    unsigned int flags;
+    const struct microcode_patch *patch;
+};
+
 static struct ucode_mod_blob __initdata ucode_blob;
 /*
  * By default we will NOT parse the multiboot modules to see if there is
@@ -100,8 +110,6 @@ static bool __initdata ucode_scan;
 /* By default, ucode loading is done in NMI handler */
 static bool ucode_in_nmi = true;
 
-bool __read_mostly opt_ucode_allow_same;
-
 /* Protected by microcode_mutex */
 static struct microcode_patch *microcode_cache;
 
@@ -128,8 +136,6 @@ static int __init cf_check parse_ucode(const char *s)
 
         if ( (val = parse_boolean("nmi", s, ss)) >= 0 )
             ucode_in_nmi = val;
-        else if ( (val = parse_boolean("allow-same", s, ss)) >= 0 )
-            opt_ucode_allow_same = val;
         else if ( !ucode_mod_forced ) /* Not forced by EFI */
         {
             if ( (val = parse_boolean("scan", s, ss)) >= 0 )
@@ -237,7 +243,11 @@ static DEFINE_PER_CPU(int, loading_err);
  */
 static cpumask_t cpu_callin_map;
 static atomic_t cpu_out, cpu_updated;
-static const struct microcode_patch *nmi_patch = ZERO_BLOCK_PTR;
+static struct microcode_nmi_patch_with_flags nmi_patch_with_flags =
+{
+    .flags  = 0,
+    .patch  = ZERO_BLOCK_PTR,
+};
 
 /*
  * Return a patch that covers current CPU. If there are multiple patches,
@@ -327,7 +337,8 @@ static bool cf_check wait_cpu_callout(unsigned int nr)
  * If no patch is provided, the cached patch will be loaded. Microcode update
  * during APs bringup and CPU resuming falls into this case.
  */
-static int microcode_update_cpu(const struct microcode_patch *patch)
+static int microcode_update_cpu(const struct microcode_patch *patch,
+                                unsigned int flags)
 {
     int err;
 
@@ -335,10 +346,11 @@ static int microcode_update_cpu(const struct microcode_patch *patch)
 
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
@@ -379,7 +391,8 @@ static int secondary_nmi_work(void)
     return wait_for_state(LOADING_EXIT) ? 0 : -EBUSY;
 }
 
-static int primary_thread_work(const struct microcode_patch *patch)
+static int primary_thread_work(const struct microcode_patch *patch,
+                               unsigned int flags)
 {
     int ret;
 
@@ -388,7 +401,7 @@ static int primary_thread_work(const struct microcode_patch *patch)
     if ( !wait_for_state(LOADING_ENTER) )
         return -EBUSY;
 
-    ret = alternative_call(ucode_ops.apply_microcode, patch);
+    ret = alternative_call(ucode_ops.apply_microcode, patch, flags);
     if ( !ret )
         atomic_inc(&cpu_updated);
     atomic_inc(&cpu_out);
@@ -416,7 +429,8 @@ static int cf_check microcode_nmi_callback(
         return 0;
 
     if ( primary_cpu )
-        ret = primary_thread_work(nmi_patch);
+        ret = primary_thread_work(nmi_patch_with_flags.patch,
+                                  nmi_patch_with_flags.flags);
     else
         ret = secondary_nmi_work();
     this_cpu(loading_err) = ret;
@@ -446,7 +460,8 @@ static int secondary_thread_fn(void)
     return this_cpu(loading_err);
 }
 
-static int primary_thread_fn(const struct microcode_patch *patch)
+static int primary_thread_fn(const struct microcode_patch *patch,
+                             unsigned int flags)
 {
     if ( !wait_for_state(LOADING_CALLIN) )
         return -EBUSY;
@@ -466,10 +481,11 @@ static int primary_thread_fn(const struct microcode_patch *patch)
         return this_cpu(loading_err);
     }
 
-    return primary_thread_work(patch);
+    return primary_thread_work(patch, flags);
 }
 
-static int control_thread_fn(const struct microcode_patch *patch)
+static int control_thread_fn(const struct microcode_patch *patch,
+                             unsigned int flags)
 {
     unsigned int cpu = smp_processor_id(), done;
     unsigned long tick;
@@ -482,7 +498,8 @@ static int control_thread_fn(const struct microcode_patch *patch)
      */
     watchdog_disable();
 
-    nmi_patch = patch;
+    nmi_patch_with_flags.patch = patch;
+    nmi_patch_with_flags.flags = flags;
     smp_wmb();
     saved_nmi_callback = set_nmi_callback(microcode_nmi_callback);
 
@@ -498,7 +515,7 @@ static int control_thread_fn(const struct microcode_patch *patch)
         goto out;
 
     /* Control thread loads ucode first while others are in NMI handler. */
-    ret = alternative_call(ucode_ops.apply_microcode, patch);
+    ret = alternative_call(ucode_ops.apply_microcode, patch, flags);
     if ( !ret )
         atomic_inc(&cpu_updated);
     atomic_inc(&cpu_out);
@@ -544,17 +561,19 @@ static int control_thread_fn(const struct microcode_patch *patch)
 
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
+    struct microcode_patch_with_flags * patch_with_flags = _patch_with_flags;
 
     /*
      * The control thread set state to coordinate ucode loading. Primary
@@ -562,9 +581,11 @@ static int cf_check do_microcode_update(void *patch)
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
 
@@ -582,7 +603,8 @@ static long cf_check microcode_update_helper(void *data)
     int ret;
     struct ucode_buf *buffer = data;
     unsigned int cpu, updated;
-    struct microcode_patch *patch;
+    struct microcode_patch_with_flags patch_with_flags;
+    bool ucode_force = buffer->flags == XENPF_UCODE_FORCE;
 
     /* cpu_online_map must not change during update */
     if ( !get_cpu_maps() )
@@ -606,16 +628,17 @@ static long cf_check microcode_update_helper(void *data)
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
@@ -632,17 +655,17 @@ static long cf_check microcode_update_helper(void *data)
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
@@ -674,13 +697,13 @@ static long cf_check microcode_update_helper(void *data)
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
@@ -697,7 +720,7 @@ static long cf_check microcode_update_helper(void *data)
             alternative_vcall(ctxt_switch_masking, current);
     }
     else
-        microcode_free_patch(patch);
+        microcode_free_patch(patch_with_flags.patch);
 
     if ( updated && updated != nr_cores )
         printk(XENLOG_ERR "ERROR: Updating microcode succeeded on %u cores and failed\n"
@@ -775,7 +798,7 @@ int microcode_update_one(void)
     if ( !ucode_ops.apply_microcode )
         return -EOPNOTSUPP;
 
-    return microcode_update_cpu(NULL);
+    return microcode_update_cpu(NULL, 0);
 }
 
 static int __init early_update_cache(const void *data, size_t len)
@@ -858,7 +881,7 @@ static int __init early_microcode_update_cpu(void)
     if ( !patch )
         return -ENOENT;
 
-    return microcode_update_cpu(patch);
+    return microcode_update_cpu(patch, 0);
 }
 
 int __init early_microcode_init(unsigned long *module_map,
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f505aa1b7888..cb6e906481a4 100644
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
+    bool ucode_force = flags == XENPF_UCODE_FORCE;
 
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F9E9C1F86
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 15:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832620.1247923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QCX-0004hx-Qp; Fri, 08 Nov 2024 14:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832620.1247923; Fri, 08 Nov 2024 14:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QCX-0004a3-LN; Fri, 08 Nov 2024 14:43:05 +0000
Received: by outflank-mailman (input) for mailman id 832620;
 Fri, 08 Nov 2024 14:43:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9QCV-0004Ee-Vn
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 14:43:03 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c007c9dc-9ddf-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 15:42:59 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso3405888e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 06:42:59 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a1769asm242652866b.1.2024.11.08.06.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 06:42:58 -0800 (PST)
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
X-Inumbo-ID: c007c9dc-9ddf-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMwMDdjOWRjLTlkZGYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDc2OTc5Ljc1MDI0Niwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731076979; x=1731681779; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAYyhUk3NiNBRpvH7yor3qXtJxAbrlhbvjZAvpbioVA=;
        b=KJeSDo5Y5/WyGjExdFR8TK/i5F1QnzOQ30Ma6/Jc3ZKxzbZhBlHAviIUkAk9pGOJwr
         uUpOa7vtO4jk64wWN1j5bW+LKBN+odENUQIKlrqIncvCZFOOdVZ0OylVrMaZo42ljuax
         XVT8v3qvyf9VNHsT6pGUXl41FpQxEMBEyBjRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731076979; x=1731681779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAYyhUk3NiNBRpvH7yor3qXtJxAbrlhbvjZAvpbioVA=;
        b=MJtMHVXgDHVX6RqT5p0ip55q86063DrKmJBOdCfYIJ5IhlE9d+t2ovlAJ9xESpdP+Z
         ciM7gKNd+R642LW0UTul2VTxw3s1iGQkIyMxZqWjywmHDzaTBQml+JyG7faI1YaavdFD
         gmkps2/gDPXxgycrnvu7qu5ZGw74JPOHVrH0qHWUdUX5TalvGibV8ITnUpW9UIx70TJn
         jrccd+pMS84auaX2d5WuwCpkdl7GUqJ06+bPMCKvEHiGP+I0i8B9A3gYX6PZTKMdA/EN
         5kf8mDDFFY8uN5a7Vb3Fj458mM9jeY6GeW6c/4OdIjG0hMt8KiGR50aOaoCIlbRu52ol
         vitw==
X-Gm-Message-State: AOJu0Yy+73gvmkBl9AG8LD94T2ogGs1irbSqQtoSUAYn/umlODu7VTA4
	MaD8GGnxVlh0dfSQoia/lR4UFSL1TkTqzH6GUTuLtDTES2cYOVqDSYGFnE89/pDUOWbC7cr9TwK
	C
X-Google-Smtp-Source: AGHT+IGnPqf8jybKj6TO83BLp1vxdYvmZx+c0I1+Ak4JN/eWFn0gbiR4NvaiWXKrze/JnFqBp02Irg==
X-Received: by 2002:a05:6512:2348:b0:53b:1fd1:df34 with SMTP id 2adb3069b0e04-53d862ee36bmr2606893e87.45.1731076978612;
        Fri, 08 Nov 2024 06:42:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/ucode: Drop MIS_UCODE and microcode_match_result
Date: Fri,  8 Nov 2024 14:42:52 +0000
Message-Id: <20241108144252.315604-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108144252.315604-1-andrew.cooper3@citrix.com>
References: <20241108144252.315604-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All uses of MIS_UCODE, have been removed, leaving only a simple ordering
relation, and microcode_match_result being a stale name.

Drop the enum entirely, and use a simple int -1/0/1 scheme like other standard
ordering primitives in C.

Swap the order or parameters to compare_patch(), to reduce cognitive
complexity; all other logic operates the other way around.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I don't particular like keeping "result" as a variable name, but nothing
better comes to mind.
---
 xen/arch/x86/cpu/microcode/amd.c     | 10 ++++------
 xen/arch/x86/cpu/microcode/core.c    |  5 ++---
 xen/arch/x86/cpu/microcode/intel.c   |  9 ++++-----
 xen/arch/x86/cpu/microcode/private.h | 21 ++++++++++-----------
 4 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 3861fec6565a..366c8c59e93a 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -170,8 +170,7 @@ static bool check_final_patch_levels(const struct cpu_signature *sig)
     return false;
 }
 
-static enum microcode_match_result compare_revisions(
-    uint32_t old_rev, uint32_t new_rev)
+static int compare_revisions(uint32_t old_rev, uint32_t new_rev)
 {
     if ( new_rev > old_rev )
         return NEW_UCODE;
@@ -199,8 +198,8 @@ static bool microcode_fits_cpu(const struct microcode_patch *patch)
     return equiv.id == patch->processor_rev_id;
 }
 
-static enum microcode_match_result cf_check compare_patch(
-    const struct microcode_patch *new, const struct microcode_patch *old)
+static int cf_check compare_patch(
+    const struct microcode_patch *old, const struct microcode_patch *new)
 {
     /* Both patches to compare are supposed to be applicable to local CPU. */
     ASSERT(microcode_fits_cpu(new));
@@ -212,11 +211,10 @@ static enum microcode_match_result cf_check compare_patch(
 static int cf_check apply_microcode(const struct microcode_patch *patch,
                                     unsigned int flags)
 {
-    int hw_err;
+    int hw_err, result;
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
     uint32_t rev, old_rev = sig->rev;
-    enum microcode_match_result result;
     bool ucode_force = flags & XENPF_UCODE_FORCE;
 
     if ( !microcode_fits_cpu(patch) )
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 0cc5daa251e2..05d0d68d8158 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -470,8 +470,7 @@ struct ucode_buf {
 static long cf_check microcode_update_helper(void *data)
 {
     struct microcode_patch *patch = NULL;
-    enum microcode_match_result result;
-    int ret;
+    int ret, result;
     struct ucode_buf *buffer = data;
     unsigned int cpu, updated;
     struct patch_with_flags patch_with_flags;
@@ -527,7 +526,7 @@ static long cf_check microcode_update_helper(void *data)
     spin_lock(&microcode_mutex);
     if ( microcode_cache )
     {
-        result = alternative_call(ucode_ops.compare_patch, patch, microcode_cache);
+        result = alternative_call(ucode_ops.compare_patch, microcode_cache, patch);
 
         if ( result != NEW_UCODE &&
              !(ucode_force && (result == OLD_UCODE || result == SAME_UCODE)) )
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 3f37792ab4b5..9616a5e9db4b 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -229,8 +229,7 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
  * Production microcode has a positive revision.  Pre-production microcode has
  * a negative revision.
  */
-static enum microcode_match_result compare_revisions(
-    int32_t old_rev, int32_t new_rev)
+static int compare_revisions(int32_t old_rev, int32_t new_rev)
 {
     if ( new_rev > old_rev )
         return NEW_UCODE;
@@ -270,8 +269,8 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
     return false;
 }
 
-static enum microcode_match_result cf_check compare_patch(
-    const struct microcode_patch *new, const struct microcode_patch *old)
+static int cf_check compare_patch(
+    const struct microcode_patch *old, const struct microcode_patch *new)
 {
     /*
      * Both patches to compare are supposed to be applicable to local CPU.
@@ -290,7 +289,7 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &this_cpu(cpu_sig);
     uint32_t rev, old_rev = sig->rev;
-    enum microcode_match_result result;
+    int result;
     bool ucode_force = flags & XENPF_UCODE_FORCE;
 
     if ( !microcode_fits_cpu(patch) )
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index c9dd8ba066f9..957d4d4293d0 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -5,13 +5,6 @@
 
 #include <asm/microcode.h>
 
-enum microcode_match_result {
-    OLD_UCODE, /* signature matched, but revision id is older */
-    SAME_UCODE, /* signature matched, but revision id is the same */
-    NEW_UCODE, /* signature matched, but revision id is newer */
-    MIS_UCODE, /* signature mismatched */
-};
-
 /* Opaque.  Internals are vendor-specific. */
 struct microcode_patch;
 
@@ -54,11 +47,17 @@ struct microcode_ops {
                            unsigned int flags);
 
     /*
-     * Given two patches, are they both applicable to the current CPU, and is
-     * new a higher revision than old?
+     * Given a current patch, and a proposed new patch, order them based on revision.
+     *
+     * This operation is not necessarily symmetrical.  In some cases, a debug
+     * "new" patch will always considered to be newer, on the expectation that
+     * whomever is using debug patches knows exactly what they're doing.
      */
-    enum microcode_match_result (*compare_patch)(
-        const struct microcode_patch *new, const struct microcode_patch *old);
+#define OLD_UCODE  -1
+#define SAME_UCODE  0
+#define NEW_UCODE   1
+    int (*compare_patch)(const struct microcode_patch *old,
+                         const struct microcode_patch *new);
 
     /*
      * For Linux inird microcode compatibliity.
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469A3697FA1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496080.766625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJsD-00028o-6c; Wed, 15 Feb 2023 15:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496080.766625; Wed, 15 Feb 2023 15:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJsD-000272-3Z; Wed, 15 Feb 2023 15:39:09 +0000
Received: by outflank-mailman (input) for mailman id 496080;
 Wed, 15 Feb 2023 15:39:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v50p=6L=tibco.com=sdyasli@srs-se1.protection.inumbo.net>)
 id 1pSJsC-00026q-5q
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:39:08 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1ee0303-ad46-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 16:39:06 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so2590207wmp.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 07:39:06 -0800 (PST)
Received: from localhost.localdomain ([185.25.65.68])
 by smtp.gmail.com with ESMTPSA id
 t39-20020a05600c32a700b003e1e8d794e1sm2320560wmp.13.2023.02.15.07.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 07:39:06 -0800 (PST)
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
X-Inumbo-ID: e1ee0303-ad46-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1676475546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCF7YQ2rzFnOkJ+6hEIhSfR1jz8bWsd0xTeyV2qti9Q=;
        b=Jitw+ycIKvBXCxMs+qV8TmQ5/Wol7x/hUUTq/vBnXDqPiGWJHKGxH+c+6aE2mMFggj
         z75Yl6BOv9whIx1KHTcLO6dEIset4Tnh+hGISvZ+bs+ONzahd1EenTzH6WEuxyBx5vC+
         9Pohk3etwZXeU1gQgSOoJ5jBK+Jd3/GiW5XFM2q9/UVps9zXOFFsO/hq4iTggARw/Nuz
         8olLTwx69la7UKXjuVj9QvzNvQrJyiti8843rAgAVn5Dl6pPT/xSZHmjt0BI3AAPj/CG
         TQ66RKc2NXgZ/tsyZqm9E8KyUWiLkPyVwxOZ3JDb1C5tNEPe201pYG+KqK3PsuC6dwhm
         ERPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1676475546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCF7YQ2rzFnOkJ+6hEIhSfR1jz8bWsd0xTeyV2qti9Q=;
        b=ZK9BikwKL063GguHEASmfg6eioANLQqlmhVUpKCr12uwVFWLONfeDU6yIuNUXJXaZY
         viyiqZMePyQfp32ALHB5CTkuAIuZst4QcTPQAuh15lNe6gcJbM8bDILIkDYAX1Ibj4Td
         1XyQmFcrdJaQV3PlFKDf2Tckhg1YGghR5Dl+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676475546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cCF7YQ2rzFnOkJ+6hEIhSfR1jz8bWsd0xTeyV2qti9Q=;
        b=2mdF/aFyeHLTaUZeEF7HIdO4Ee3+ELqA4peC4wAuzeJ2hP0QdhcFtllcqau+P7YuNF
         PLUOxyQhkczyQSITo/IbSN6Ruu3f8d5HQH53T4age9Ab25sf4YxfCLbLN/U4vlKkUCXV
         3K0gDhpoaJ5E5G2Md+SGF/9lmFA3HD9kKNRrjoJILxFQwb2JiOgFI18fFKmb5FD+SYuD
         JFbZxRZGiHFw0nFCY9Lxi9iiwlJ9WfkUS0ByYWdIRDuIOBpiIdw/Wa47WsviQmiu2UcZ
         +ZtIDKdMYfvWORCptPiXvaolOKElRceV5dnMseKuA4azXTIagRwuDzIvIM2NzjMOC2Rz
         QVTQ==
X-Gm-Message-State: AO0yUKWtvORiGnt2IfKBSIqo+Df1miFuq6VI2WHOJDJKLZdLukRoRhUD
	KDekpKpQxuTl8X3SDhNb9Y1fzDBEONddkYJIgjcvbw==
X-Google-Smtp-Source: AK7set+QEJMz0NEDyJKcQbkfALFzaG6uV458vt43uQDK6dHRwepimf14GLSbXxyOBTYNJdXtRu5YtQ==
X-Received: by 2002:a05:600c:3c96:b0:3df:f7ba:14f8 with SMTP id bg22-20020a05600c3c9600b003dff7ba14f8mr2576500wmb.1.1676475546287;
        Wed, 15 Feb 2023 07:39:06 -0800 (PST)
Sender: Sergey Dyasli <sdyasli@tibco.com>
From: Sergey Dyasli <sergey.dyasli@cloud.com>
X-Google-Original-From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v4 1/2] x86/ucode/AMD: apply the patch early on every logical thread
Date: Wed, 15 Feb 2023 15:38:45 +0000
Message-Id: <20230215153846.18582-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230215153846.18582-1-sergey.dyasli@citrix.com>
References: <20230215153846.18582-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original issue has been reported on AMD Bulldozer-based CPUs where
ucode loading loses the LWP feature bit in order to gain the IBPB bit.
LWP disabling is per-SMT/CMT core modification and needs to happen on
each sibling thread despite the shared microcode engine. Otherwise,
logical CPUs will end up with different cpuid capabilities.
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216211

Guests running under Xen happen to be not affected because of levelling
logic for the feature masking/override MSRs which causes the LWP bit to
fall out and hides the issue. The latest recommendation from AMD, after
discussing this bug, is to load ucode on every logical CPU.

In Linux kernel this issue has been addressed by e7ad18d1169c
("x86/microcode/AMD: Apply the patch early on every logical thread").
Follow the same approach in Xen.

Introduce SAME_UCODE match result and use it for early AMD ucode
loading. Take this opportunity and move opt_ucode_allow_same out of
compare_revisions() to the relevant callers and also modify the warning
message based on it. Intel's side of things is modified for consistency
but provides no functional change.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v3 --> v4:
- Coding style fixes
- Removed goto
- Removed the paragraph about late loading in the commit message

v2 --> v3:
- Moved opt_ucode_allow_same out of compare_revisions() and updated
  the commit message
- Adjusted the warning message

v1 --> v2:
- Expanded the commit message with the levelling section
- Adjusted comment for OLD_UCODE
---
 xen/arch/x86/cpu/microcode/amd.c     | 11 ++++++++---
 xen/arch/x86/cpu/microcode/core.c    | 26 +++++++++++++++++---------
 xen/arch/x86/cpu/microcode/intel.c   | 10 +++++++---
 xen/arch/x86/cpu/microcode/private.h |  3 ++-
 4 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 4b097187a0..a9a5557835 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -176,8 +176,8 @@ static enum microcode_match_result compare_revisions(
     if ( new_rev > old_rev )
         return NEW_UCODE;
 
-    if ( opt_ucode_allow_same && new_rev == old_rev )
-        return NEW_UCODE;
+    if ( new_rev == old_rev )
+        return SAME_UCODE;
 
     return OLD_UCODE;
 }
@@ -220,8 +220,13 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
     uint32_t rev, old_rev = sig->rev;
+    enum microcode_match_result result = microcode_fits(patch);
 
-    if ( microcode_fits(patch) != NEW_UCODE )
+    /*
+     * Allow application of the same revision to pick up SMT-specific changes
+     * even if the revision of the other SMT thread is already up-to-date.
+     */
+    if ( result != NEW_UCODE && result != SAME_UCODE )
         return -EINVAL;
 
     if ( check_final_patch_levels(sig) )
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index d14754e222..ba6e7b42c6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -612,17 +612,25 @@ static long cf_check microcode_update_helper(void *data)
      * that ucode revision.
      */
     spin_lock(&microcode_mutex);
-    if ( microcode_cache &&
-         alternative_call(ucode_ops.compare_patch,
-                          patch, microcode_cache) != NEW_UCODE )
+    if ( microcode_cache )
     {
-        spin_unlock(&microcode_mutex);
-        printk(XENLOG_WARNING "microcode: couldn't find any newer revision "
-                              "in the provided blob!\n");
-        microcode_free_patch(patch);
-        ret = -ENOENT;
+        enum microcode_match_result result;
 
-        goto put;
+        result = alternative_call(ucode_ops.compare_patch, patch,
+                                  microcode_cache);
+
+        if ( result != NEW_UCODE &&
+             !(opt_ucode_allow_same && result == SAME_UCODE) )
+        {
+            spin_unlock(&microcode_mutex);
+            printk(XENLOG_WARNING
+                   "microcode: couldn't find any newer%s revision in the provided blob!\n",
+                   opt_ucode_allow_same ? " (or the same)" : "");
+            microcode_free_patch(patch);
+            ret = -ENOENT;
+
+            goto put;
+        }
     }
     spin_unlock(&microcode_mutex);
 
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f7fec4b4ed..8d4d6574aa 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -232,8 +232,8 @@ static enum microcode_match_result compare_revisions(
     if ( new_rev > old_rev )
         return NEW_UCODE;
 
-    if ( opt_ucode_allow_same && new_rev == old_rev )
-        return NEW_UCODE;
+    if ( new_rev == old_rev )
+        return SAME_UCODE;
 
     /*
      * Treat pre-production as always applicable - anyone using pre-production
@@ -290,8 +290,12 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &this_cpu(cpu_sig);
     uint32_t rev, old_rev = sig->rev;
+    enum microcode_match_result result;
+
+    result = microcode_update_match(patch);
 
-    if ( microcode_update_match(patch) != NEW_UCODE )
+    if ( result != NEW_UCODE &&
+         !(opt_ucode_allow_same && result == SAME_UCODE) )
         return -EINVAL;
 
     wbinvd();
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index 73b095d5bf..626aeb4d08 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -6,7 +6,8 @@
 extern bool opt_ucode_allow_same;
 
 enum microcode_match_result {
-    OLD_UCODE, /* signature matched, but revision id is older or equal */
+    OLD_UCODE, /* signature matched, but revision id is older */
+    SAME_UCODE, /* signature matched, but revision id is the same */
     NEW_UCODE, /* signature matched, but revision id is newer */
     MIS_UCODE, /* signature mismatched */
 };
-- 
2.31.1



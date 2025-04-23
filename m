Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43CFA97BF5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 03:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963784.1354785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVu-0002rN-SH; Wed, 23 Apr 2025 01:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963784.1354785; Wed, 23 Apr 2025 01:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVu-0002oc-LW; Wed, 23 Apr 2025 01:02:58 +0000
Received: by outflank-mailman (input) for mailman id 963784;
 Wed, 23 Apr 2025 01:02:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7OVs-0000o7-Rt
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 01:02:56 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b003983b-1fde-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 03:02:54 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso27507465e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 18:02:55 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2326dsm6707635e9.15.2025.04.22.18.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 18:02:53 -0700 (PDT)
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
X-Inumbo-ID: b003983b-1fde-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745370174; x=1745974974; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM99xQkfEqKEfaoeOHiMOk1AMVGIEVl2DOVVorR/k20=;
        b=VppJHc+7D/gKKgSwwvk+7RDIx46S06vNNcBcAuaTFHFmm0EdFrD8CtqpxHNDWpYD89
         E4AnyiRonMlcp9qGlFOlMlm3GUp4ZLCaLnf4MwYgquYPQeVIgE3wQh/lhSl0NpMrejNi
         TBrgD9HMKSrFgFzNVLFjK0LaKucs4l7ZXKYjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745370174; x=1745974974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WM99xQkfEqKEfaoeOHiMOk1AMVGIEVl2DOVVorR/k20=;
        b=aqPB7su9SuuOwIlDu0nNAazsTcrIYQUkqIeittdvrAdXBhsvoc8ScxIA9+v6AIn7Uh
         9cMXnibpFFP4Pzg2PlkIthmhqfPZyPyHwZlyO0TjOyoDnmJL4PTnRz4m0o7cJQP3tpN2
         EnxGaKEjfiNqbfXbRkdtkvpQnCCtkm6JSWOlLXXp+lAdjP7zSzgt/eJkX+qM0iF56Hk4
         hLqypc+2Frsg7p4U1B0Lz1rbnqZL44AQtZ9cxLtVUe9Z5O9i0r5ogn23Wpks6RUmvt1a
         ahyQT0Rx7jf684n94hO4D8D2q8kTj+uUaIiuWEY0vbHLCVd1UUR5jeuNiZHDLBzwhaNP
         5Hug==
X-Gm-Message-State: AOJu0YxqXJOXd2Ey3OCBC/22oqozdpYU/bPEuUbJxD1/BRKUTza5CQdY
	/jZvFFmaBBzlJKCol9bNcNjRBX+ADcPftiohs25RCSq4m1bCJVKdBdHHo/MEXVSnoIINgYb5ssh
	R
X-Gm-Gg: ASbGncufDOUeZgobZ7NfLmyzc77nDjd0WASrtCp3ZoOvwk9ZTz2LywQH53Ny253exVW
	X3dU9TQ7kwRaSmH0Ht2CjNdCKozym9ADqekRmOieJdRmBhjfMAPgGrez1XQsf69pQSwmFjUq77q
	tYlytmNXvPo527snM/QCpdLfF+EqGgX8Pq24LrQAxEN2anXhaWDAvZFuGSE4Qh7ro/OM2MWwSkZ
	6fGjxSpVpkj8Q4gvHVVFRkxK7i9tQ8qPukCgt2MTQc7KBMSzCmGlKMBHPxNuWGi4kJ8PXK5IKv7
	5kOvznwVl5EgsCAlo98XGirT6ygdcHoECAPTRgVeUSAHCU42Y4+1q9DvJHo8oA==
X-Google-Smtp-Source: AGHT+IFn46uQ6sYjyAjEfhBOcPUByRdj/eRnE8QJcm+B9LeRRzCCKUSJ9COZ57h4R/MfMJ4dQ+GmlA==
X-Received: by 2002:a05:600c:a13:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-4408ab25c8amr54880075e9.12.1745370174407;
        Tue, 22 Apr 2025 18:02:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 8/8] x86/alternatives: Simplify _apply_alternatives() now altcall is separate
Date: Wed, 23 Apr 2025 02:02:37 +0100
Message-Id: <20250423010237.1528582-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With altcall handled separately, the special case in _apply_alternatives() is
unused and can be dropped.  The force parameter (used to signify the seal
pass) can be removed too.

In turn, nmi_apply_alternatives() no longer needs to call
_apply_alternatives() on the second pass.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 94 ++++----------------------------------
 1 file changed, 10 insertions(+), 84 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 047bfc6e424b..43b009888c02 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -206,14 +206,9 @@ static void __init seal_endbr64(void)
  * self modifying code. This implies that asymmetric systems where
  * APs have less capabilities than the boot processor are not handled.
  * Tough. Make sure you disable such features by hand.
- *
- * The caller will set the "force" argument to true for the final
- * invocation, such that no CALLs/JMPs to NULL pointers will be left
- * around. See also the further comment below.
  */
 static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
-                                                 struct alt_instr *end,
-                                                 bool force)
+                                                 struct alt_instr *end)
 {
     struct alt_instr *a, *base;
 
@@ -274,10 +269,7 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         /* Skip patch sites already handled during the first pass. */
         if ( a->priv )
-        {
-            ASSERT(force);
             continue;
-        }
 
         /* If there is no replacement to make, see about optimising the nops. */
         if ( !boot_cpu_has(a->cpuid) )
@@ -301,76 +293,7 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         /* 0xe8/0xe9 are relative branches; fix the offset. */
         if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
-        {
-            /*
-             * Detect the special case of indirect-to-direct branch patching:
-             * - replacement is a direct CALL/JMP (opcodes 0xE8/0xE9; already
-             *   checked above),
-             * - replacement's displacement is -5 (pointing back at the very
-             *   insn, which makes no sense in a real replacement insn),
-             * - original is an indirect CALL/JMP (opcodes 0xFF/2 or 0xFF/4)
-             *   using RIP-relative addressing.
-             * Some branch destinations may still be NULL when we come here
-             * the first time. Defer patching of those until the post-presmp-
-             * initcalls re-invocation (with force set to true). If at that
-             * point the branch destination is still NULL, insert "UD2; UD0"
-             * (for ease of recognition) instead of CALL/JMP.
-             */
-            if ( a->cpuid == X86_FEATURE_ALWAYS &&
-                 *(int32_t *)(buf + 1) == -5 &&
-                 a->orig_len >= 6 &&
-                 orig[0] == 0xff &&
-                 orig[1] == (*buf & 1 ? 0x25 : 0x15) )
-            {
-                long disp = *(int32_t *)(orig + 2);
-                const uint8_t *dest = *(void **)(orig + 6 + disp);
-
-                if ( dest )
-                {
-                    /*
-                     * When building for CET-IBT, all function pointer targets
-                     * should have an endbr64 instruction.
-                     *
-                     * If this is not the case, leave a warning because
-                     * something is probably wrong with the build.  A CET-IBT
-                     * enabled system might have exploded already.
-                     *
-                     * Otherwise, skip the endbr64 instruction.  This is a
-                     * marginal perf improvement which saves on instruction
-                     * decode bandwidth.
-                     */
-                    if ( IS_ENABLED(CONFIG_XEN_IBT) )
-                    {
-                        if ( is_endbr64(dest) )
-                            dest += ENDBR64_LEN;
-                        else
-                            printk(XENLOG_WARNING
-                                   "altcall %ps dest %ps has no endbr64\n",
-                                   orig, dest);
-                    }
-
-                    disp = dest - (orig + 5);
-                    ASSERT(disp == (int32_t)disp);
-                    *(int32_t *)(buf + 1) = disp;
-                }
-                else if ( force )
-                {
-                    buf[0] = 0x0f;
-                    buf[1] = 0x0b;
-                    buf[2] = 0x0f;
-                    buf[3] = 0xff;
-                    buf[4] = 0xff;
-                }
-                else
-                    continue;
-            }
-            else if ( force && system_state < SYS_STATE_active )
-                ASSERT_UNREACHABLE();
-            else
-                *(int32_t *)(buf + 1) += repl - orig;
-        }
-        else if ( force && system_state < SYS_STATE_active  )
-            ASSERT_UNREACHABLE();
+            *(int32_t *)(buf + 1) += repl - orig;
 
         a->priv = 1;
 
@@ -470,7 +393,7 @@ static int init_or_livepatch apply_alt_calls(
 #ifdef CONFIG_LIVEPATCH
 int apply_alternatives(struct alt_instr *start, struct alt_instr *end)
 {
-    return _apply_alternatives(start, end, true);
+    return _apply_alternatives(start, end);
 }
 
 int livepatch_apply_alt_calls(const struct alt_call *start,
@@ -516,10 +439,13 @@ static int __init cf_check nmi_apply_alternatives(
                                  PAGE_HYPERVISOR_RWX);
         flush_local(FLUSH_TLB_GLOBAL);
 
-        rc = _apply_alternatives(__alt_instructions, __alt_instructions_end,
-                                 alt_todo == ALT_CALLS);
-        if ( rc )
-            panic("Unable to apply alternatives: %d\n", rc);
+        if ( alt_todo & ALT_INSNS )
+        {
+            rc = _apply_alternatives(__alt_instructions,
+                                     __alt_instructions_end);
+            if ( rc )
+                panic("Unable to apply alternatives: %d\n", rc);
+        }
 
         if ( alt_todo & ALT_CALLS )
         {
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31C7162D8
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 15:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541188.843673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zsN-00042a-7V; Tue, 30 May 2023 13:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541188.843673; Tue, 30 May 2023 13:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zsN-0003vB-2w; Tue, 30 May 2023 13:59:03 +0000
Received: by outflank-mailman (input) for mailman id 541188;
 Tue, 30 May 2023 13:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ox2=BT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q3zsL-0003cy-I1
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 13:59:01 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2089a5e4-fef2-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 15:59:00 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30ae61354fbso1945172f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 06:59:00 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h4-20020adfe984000000b002fe96f0b3acsm3442008wrm.63.2023.05.30.06.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:58:59 -0700 (PDT)
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
X-Inumbo-ID: 2089a5e4-fef2-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685455139; x=1688047139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=np5kDlh2y0ObvKEUmXbLb6p7vYDYelZ0XKIPKrONjXY=;
        b=ceD4bG2AVhDx9T77fVfaup8UPYlkCZtwOTU+5lg7QCiUwO1cHoYnKXlZvitfV5FsSU
         zcFWbQ0jAPkhbRSSBcKj3XFaLXlyQ6u/b3YZG5eepASYTe7g8NWnA06mqeyzsy7ReXwI
         R2TJWtrmGLW6Cysy78MziGZbMP+jp+gY4POZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455139; x=1688047139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=np5kDlh2y0ObvKEUmXbLb6p7vYDYelZ0XKIPKrONjXY=;
        b=RTyab0RH1h79f9XafYutb5k4B1f9i+2FssDs2VmDbFTE5PNUQD6fU9Oba6+X15xn7X
         eHZF7wTrjgjth099stNBZpYSarwp5lz68JiM9P5Uf0yvYmhzelXftiGyXe7RTEtHHH4w
         5J3tBgLPkVDLuwQLIbeUIKbSmclPH/LYJ8hTA6JNCZJz+Ixgisi/qNva49qyF9hrvIxr
         JbvTOeOR8uJgxCXrozlEX5xFNNCj1/Z7zTs0s9A/v6FV2VKlb12AKt4hHEW0R5D68Hbi
         HAdPTGt1ZvCaW1WENyElIAmGtYxEmDSSf/a+eZc2JRgt2CHxyjL5znD+kD8c35nBXKlE
         hxnw==
X-Gm-Message-State: AC+VfDwV4283SuFAFPkUvfbOxte7xG7dF917MR5fkHuNTSZLOj4wW74T
	jl4u2i/KkNgBVP8sHuYaJCxbqWJO3yGmrJDa2Oc=
X-Google-Smtp-Source: ACHHUZ4GSwSns8NpfQqD2z6m8zVduqEQmAS+Sj6JmbS68rLRWiHF6PLU4LRp8pmAvlACwvAtaiUusw==
X-Received: by 2002:a5d:5551:0:b0:306:3731:f73b with SMTP id g17-20020a5d5551000000b003063731f73bmr1748394wrw.43.1685455139554;
        Tue, 30 May 2023 06:58:59 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/3] x86: Add support for AMD's Automatic IBRS
Date: Tue, 30 May 2023 14:58:54 +0100
Message-Id: <20230530135854.1517-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
References: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cases where AutoIBRS is supported by the host:

* Prefer AutoIBRS to retpolines as BTI mitigation in heuristics
  calculations.
* Always enable AutoIBRS if IBRS is chosen as a BTI mitigation.
* Avoid stuffing the RAS/RSB on VMEXIT if AutoIBRS is enabled.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Gated CPUID read to e21a by the presence the leaf
  * Add auto-ibrs to trampoline_efer if chosen
  * Remove smpboot.c modifications, as they are not needed after
    trampoline_efer is modified
  * Avoid the AutoIBRS delay as it doesn't provide any benefit.
---
 xen/arch/x86/spec_ctrl.c | 45 ++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 50d467f74c..36231e65fb 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -390,7 +390,7 @@ custom_param("pv-l1tf", parse_pv_l1tf);
 
 static void __init print_details(enum ind_thunk thunk)
 {
-    unsigned int _7d0 = 0, _7d2 = 0, e8b = 0, max = 0, tmp;
+    unsigned int _7d0 = 0, _7d2 = 0, e8b = 0, e21a = 0, max = 0, tmp;
     uint64_t caps = 0;
 
     /* Collect diagnostics about available mitigations. */
@@ -400,6 +400,8 @@ static void __init print_details(enum ind_thunk thunk)
         cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
     if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
         cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
+    if ( boot_cpu_data.extended_cpuid_level >= 0x80000021 )
+        cpuid(0x80000021, &e21a, &tmp, &tmp, &tmp);
     if ( cpu_has_arch_caps )
         rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
@@ -430,11 +432,12 @@ static void __init print_details(enum ind_thunk thunk)
            (e8b  & cpufeat_mask(X86_FEATURE_IBPB_RET))       ? " IBPB_RET"       : "");
 
     /* Hardware features which need driving to mitigate issues. */
-    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
            (e8b  & cpufeat_mask(X86_FEATURE_IBPB)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBPB"           : "",
            (e8b  & cpufeat_mask(X86_FEATURE_IBRS)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBRS"           : "",
+           (e21a & cpufeat_mask(X86_FEATURE_AUTO_IBRS))      ? " AUTO_IBRS"      : "",
            (e8b  & cpufeat_mask(X86_FEATURE_AMD_STIBP)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_STIBP))          ? " STIBP"          : "",
            (e8b  & cpufeat_mask(X86_FEATURE_AMD_SSBD)) ||
@@ -468,7 +471,9 @@ static void __init print_details(enum ind_thunk thunk)
            thunk == THUNK_JMP       ? "JMP" : "?",
            (!boot_cpu_has(X86_FEATURE_IBRSB) &&
             !boot_cpu_has(X86_FEATURE_IBRS))         ? "No" :
-           (default_xen_spec_ctrl & SPEC_CTRL_IBRS)  ? "IBRS+" :  "IBRS-",
+           (cpu_has_auto_ibrs &&
+            (default_xen_spec_ctrl & SPEC_CTRL_IBRS)) ? "AUTO_IBRS+" :
+            (default_xen_spec_ctrl & SPEC_CTRL_IBRS)  ? "IBRS+" : "IBRS-",
            (!boot_cpu_has(X86_FEATURE_STIBP) &&
             !boot_cpu_has(X86_FEATURE_AMD_STIBP))    ? "" :
            (default_xen_spec_ctrl & SPEC_CTRL_STIBP) ? " STIBP+" : " STIBP-",
@@ -1150,15 +1155,20 @@ void __init init_speculation_mitigations(void)
     }
     else
     {
-        /*
-         * Evaluate the safest Branch Target Injection mitigations to use.
-         * First, begin with compiler-aided mitigations.
-         */
-        if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) )
+        /* Evaluate the safest BTI mitigations with lowest overhead */
+        if ( cpu_has_auto_ibrs )
+        {
+            /*
+             * We'd rather use Automatic IBRS if present. It helps in order
+             * to avoid stuffing the RSB manually on every VMEXIT.
+             */
+            ibrs = true;
+        }
+        else if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) )
         {
             /*
-             * On all hardware, we'd like to use retpoline in preference to
-             * IBRS, but only if it is safe on this hardware.
+             * Otherwise, we'd like to use retpoline in preference to
+             * plain IBRS, but only if it is safe on this hardware.
              */
             if ( retpoline_safe() )
                 thunk = THUNK_RETPOLINE;
@@ -1357,7 +1367,9 @@ void __init init_speculation_mitigations(void)
      */
     if ( opt_rsb_hvm )
     {
-        setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
+        /* Automatic IBRS wipes the RSB for us on VMEXIT */
+        if ( !(ibrs && cpu_has_auto_ibrs) )
+            setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
 
         /*
          * For SVM, Xen's RSB safety actions are performed before STGI, so
@@ -1594,6 +1606,17 @@ void __init init_speculation_mitigations(void)
             barrier();
         }
 
+        /*
+         * If we're to use AutoIBRS, then set it now for the BSP and mark
+         * it in trampoline_efer so it's picked up by the wakeup code. It
+         * will be used while starting up the APs and during S3 wakeups.
+         */
+        if ( ibrs && cpu_has_auto_ibrs )
+        {
+            write_efer(read_efer() | EFER_AIBRSE);
+            bootsym(trampoline_efer) |= EFER_AIBRSE;
+        }
+
         val = bsp_delay_spec_ctrl ? 0 : default_xen_spec_ctrl;
 
         wrmsrl(MSR_SPEC_CTRL, val);
-- 
2.34.1



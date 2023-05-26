Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0799671290A
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 17:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540129.841650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Yw0-0001Az-GS; Fri, 26 May 2023 15:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540129.841650; Fri, 26 May 2023 15:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Yw0-00013G-CP; Fri, 26 May 2023 15:00:52 +0000
Received: by outflank-mailman (input) for mailman id 540129;
 Fri, 26 May 2023 15:00:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EF2/=BP=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q2Yvz-0000zw-51
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 15:00:51 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19fb77f0-fbd6-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 17:00:49 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3094910b150so767740f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 May 2023 08:00:49 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y9-20020a5d4709000000b00307d58b3da9sm5360033wrq.25.2023.05.26.08.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 08:00:48 -0700 (PDT)
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
X-Inumbo-ID: 19fb77f0-fbd6-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685113249; x=1687705249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq+skqTQH86wc6+81w7SMNTxMqLNXZC2DHkkGE1IzhI=;
        b=T6BO4cqPCbGEhZ5PCjpe91ginA4nXrAzyQmSbfVLZOAvp4Zj7rvlROJFprRc/Vn0nf
         JQy0rEWso4koi/6FhMLhhDTRNPJsuaL0qguFMWUgOD+Wrx9WPODK66DK+iOUGU/MFe+o
         jX4+3FGfT93UqOM5G7XvXR/0SH7HaHE5Rr6Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685113249; x=1687705249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aq+skqTQH86wc6+81w7SMNTxMqLNXZC2DHkkGE1IzhI=;
        b=cnItFWs/GSiNG6I5uSKA0gMxRyFc/+PV1Qi9rVwJzaCojU7kXIMgTZmgPZJXsermHB
         1DE5CBTa1h1iY3LEEXH7u+SmakVbKt2pFWSBAOql1ck7DdfehHpUZZ1sG/ABmK9kIJlw
         vOBtEX3c7fB1pUnu3cTLYpwzBs6LBcHzj2KJ8VZURSrvzsCQb3i6rgj7AzZ+bRqeQOeC
         cyatyW4XHDmckcp8Ppq7Rn0HzQPeUojE3jNUFKcEmSvSH6WCXI+kBNJ9DWafgD795PVu
         rbF58LCZ8uuch9pIa6iI0fRpEU1hz2ZhaeofhwcqI702qiNkV3V/253/8x5zQb/rNdfL
         nJcA==
X-Gm-Message-State: AC+VfDw68pMlP3kM4G+NJT7xWNATL5wyOhkmlV8dJm0jJKCXsB4GTYmh
	BMDonACzCTZIBkR1HwHFbCUeg+OgJk6N8ZaJ+zY=
X-Google-Smtp-Source: ACHHUZ4/xo+8Sgu4DB3lQdQ43O8WX7nB0TnQXrZXtMOVBIJsH6U4WYusZnccaPILzgVa7xZoMHTUPw==
X-Received: by 2002:a5d:5750:0:b0:307:8800:bbdb with SMTP id q16-20020a5d5750000000b003078800bbdbmr1427885wrw.58.1685113249085;
        Fri, 26 May 2023 08:00:49 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86: Add support for AMD's Automatic IBRS
Date: Fri, 26 May 2023 16:00:43 +0100
Message-Id: <20230526150044.31553-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cases where AutoIBRS is supported by the host:

* Prefer AutoIBRS to retpolines as BTI mitigation in heuristics
  calculations.
* Always enable AutoIBRS if IBRS is chosen as a BTI mitigation.
* Avoid stuffing the RAS/RSB on VMEXIT if AutoIBRS is enabled.
* Delay setting AutoIBRS until after dom0 is set up, just like setting
  SPEC_CTRL.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/setup.c     |  3 +++
 xen/arch/x86/smpboot.c   |  3 +++
 xen/arch/x86/spec_ctrl.c | 52 ++++++++++++++++++++++++++++------------
 3 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 74e3915a4d..09cfef2676 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2036,6 +2036,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         barrier();
         wrmsrl(MSR_SPEC_CTRL, default_xen_spec_ctrl);
         info->last_spec_ctrl = default_xen_spec_ctrl;
+
+        if ( cpu_has_auto_ibrs && (default_xen_spec_ctrl & SPEC_CTRL_IBRS) )
+            write_efer(read_efer() | EFER_AIBRSE);
     }
 
     /* Copy the cpu info block, and move onto the BSP stack. */
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index cf9bb220f9..1d52c1dd0a 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -376,6 +376,9 @@ void start_secondary(void *unused)
     {
         wrmsrl(MSR_SPEC_CTRL, default_xen_spec_ctrl);
         info->last_spec_ctrl = default_xen_spec_ctrl;
+
+        if ( cpu_has_auto_ibrs && (default_xen_spec_ctrl & SPEC_CTRL_IBRS) )
+            write_efer(read_efer() | EFER_AIBRSE);
     }
     update_mcu_opt_ctrl();
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 50d467f74c..c887fc3df9 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -390,7 +390,7 @@ custom_param("pv-l1tf", parse_pv_l1tf);
 
 static void __init print_details(enum ind_thunk thunk)
 {
-    unsigned int _7d0 = 0, _7d2 = 0, e8b = 0, max = 0, tmp;
+    unsigned int _7d0 = 0, _7d2 = 0, e8b = 0, e21a = 0, max = 0, tmp;
     uint64_t caps = 0;
 
     /* Collect diagnostics about available mitigations. */
@@ -399,7 +399,10 @@ static void __init print_details(enum ind_thunk thunk)
     if ( max >= 2 )
         cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
     if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
+    {
         cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
+        cpuid(0x80000021, &e21a, &tmp, &tmp, &tmp);
+    }
     if ( cpu_has_arch_caps )
         rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
@@ -430,11 +433,12 @@ static void __init print_details(enum ind_thunk thunk)
            (e8b  & cpufeat_mask(X86_FEATURE_IBPB_RET))       ? " IBPB_RET"       : "");
 
     /* Hardware features which need driving to mitigate issues. */
-    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
            (e8b  & cpufeat_mask(X86_FEATURE_IBPB)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBPB"           : "",
            (e8b  & cpufeat_mask(X86_FEATURE_IBRS)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBRS"           : "",
+           (e21a & cpufeat_mask(X86_FEATURE_AUTOMATIC_IBRS)) ? " AUTO_IBRS"      : "",
            (e8b  & cpufeat_mask(X86_FEATURE_AMD_STIBP)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_STIBP))          ? " STIBP"          : "",
            (e8b  & cpufeat_mask(X86_FEATURE_AMD_SSBD)) ||
@@ -468,7 +472,9 @@ static void __init print_details(enum ind_thunk thunk)
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
@@ -1150,15 +1156,20 @@ void __init init_speculation_mitigations(void)
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
@@ -1357,7 +1368,9 @@ void __init init_speculation_mitigations(void)
      */
     if ( opt_rsb_hvm )
     {
-        setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
+        /* Automatic IBRS wipes the RSB for us on VMEXIT */
+        if ( !(ibrs && cpu_has_auto_ibrs) )
+            setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
 
         /*
          * For SVM, Xen's RSB safety actions are performed before STGI, so
@@ -1582,17 +1595,26 @@ void __init init_speculation_mitigations(void)
 
         bsp_delay_spec_ctrl = !cpu_has_hypervisor && default_xen_spec_ctrl;
 
-        /*
-         * If delaying MSR_SPEC_CTRL setup, use the same mechanism as
-         * spec_ctrl_enter_idle(), by using a shadow value of zero.
-         */
         if ( bsp_delay_spec_ctrl )
         {
+            /*
+             * If delaying MSR_SPEC_CTRL setup, use the same mechanism as
+             * spec_ctrl_enter_idle(), by using a shadow value of zero.
+             */
             info->shadow_spec_ctrl = 0;
             barrier();
             info->spec_ctrl_flags |= SCF_use_shadow;
             barrier();
         }
+        else if ( ibrs && cpu_has_auto_ibrs )
+        {
+            /*
+             * If we're not delaying setting SPEC_CTRL there's no need to
+             * delay setting Automatic IBRS either. Flip the toggle if
+             * supported and IBRS is expected.
+             */
+            write_efer(read_efer() | EFER_AIBRSE);
+        }
 
         val = bsp_delay_spec_ctrl ? 0 : default_xen_spec_ctrl;
 
-- 
2.34.1



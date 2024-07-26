Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7052293D62C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765531.1176230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMvG-0003xt-LD; Fri, 26 Jul 2024 15:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765531.1176230; Fri, 26 Jul 2024 15:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMvG-0003ti-Bf; Fri, 26 Jul 2024 15:31:58 +0000
Received: by outflank-mailman (input) for mailman id 765531;
 Fri, 26 Jul 2024 15:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvE-00084T-T5
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:56 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fd9cbbd-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:31:55 +0200 (CEST)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-703ba2477bdso609366a34.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:55 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fac6b6csm17414816d6.116.2024.07.26.08.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:52 -0700 (PDT)
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
X-Inumbo-ID: 2fd9cbbd-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007913; x=1722612713; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwqVraHAOEdS2c3l2+7Y1e8iYSimDDq5AdSITnK40sk=;
        b=eXq5YPJ8JeORhYxt8v4nZy1hZ3nSNsdw03RhttIB3usq7Z6UAQ14XGc4f8AJh10syD
         vrxI0Dig0nA/P2zwIbGDQRDF+ojuz5dnoMoQlJ+0VYS17k0BQU9Y+iUOem3zVEvKL5QY
         JT0SkrDF8gUbiKK8DQn8snBi7Zr3PktkPXFl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007913; x=1722612713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwqVraHAOEdS2c3l2+7Y1e8iYSimDDq5AdSITnK40sk=;
        b=MvtSz+AypS/P+JaFC04qFtb/hgneqXurNBPWQ82eG0CH+Njc8u7+HTRq16G7U2xKqX
         kHSC6eiJLqsCU6N0ngn0gi3Fvn/F0xkLdOYS2AKdGJdnaDQGxbRf22yu5iBAOdr5dKsQ
         djPAHPGRll12+8V4tV2ww6jC1VcaXIV3gy8oUbcPx84rEb8FqdyAZvbFxKKJFgh/UCr6
         e6mYci8uvHGXPF09Ny1KJBJH1dXCMM25G8dPl7Ncry0+74Rovo+fxhZI3UJgcgWppEzJ
         cNN4Bge0zKcJLPLVCZVF87GruQjhncWhbJqMI+zWIobaipAWCcLJBfnUO/ZexljPDqFf
         f04A==
X-Gm-Message-State: AOJu0YxISWJWguPRkE7cQO2FsKJQkln8LmPEPWc9gb5J3RX/bCl7QE/J
	cs19Mn89+uMipMdkLsXEs9p0DPkZ0cfuaIk3StbrRZOQ4w2QtmQT0ukrOnQgd5OaCagYs1mTEzM
	q
X-Google-Smtp-Source: AGHT+IEqRPmgIWN8QNqdUP8A5AuXysm1C0BZEZj9FBfcL0gwTK9jQh8X0JnqL2bI0Bd/lrn6iSOH3g==
X-Received: by 2002:a05:6830:658e:b0:703:5ab1:64d4 with SMTP id 46e09a7af769-7093251b313mr5066647a34.29.1722007912714;
        Fri, 26 Jul 2024 08:31:52 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 12/22] x86/spec-ctrl: introduce Address Space Isolation command line option
Date: Fri, 26 Jul 2024 17:21:56 +0200
Message-ID: <20240726152206.28411-13-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change, as the option is not used.

Introduced new so newly added functionality is keyed on the option being
enabled, even if the feature is non-functional.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc    | 15 ++++--
 xen/arch/x86/include/asm/domain.h    |  3 ++
 xen/arch/x86/include/asm/spec_ctrl.h |  2 +
 xen/arch/x86/spec_ctrl.c             | 74 +++++++++++++++++++++++++---
 4 files changed, 81 insertions(+), 13 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 98a45211556b..0ddc330428d9 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2387,7 +2387,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 
 ### spec-ctrl (x86)
 > `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
->              {msr-sc,rsb,verw,{ibpb,bhb}-entry}=<bool>|{pv,hvm}=<bool>,
+>              {msr-sc,rsb,verw,{ibpb,bhb}-entry,asi}=<bool>|{pv,hvm}=<bool>,
 >              bti-thunk=retpoline|lfence|jmp,bhb-seq=short|tsx|long,
 >              {ibrs,ibpb,ssbd,psfd,
 >              eager-fpu,l1d-flush,branch-harden,srb-lock,
@@ -2414,10 +2414,10 @@ in place for guests to use.
 
 Use of a positive boolean value for either of these options is invalid.
 
-The `pv=`, `hvm=`, `msr-sc=`, `rsb=`, `verw=`, `ibpb-entry=` and `bhb-entry=`
-options offer fine grained control over the primitives by Xen.  These impact
-Xen's ability to protect itself, and/or Xen's ability to virtualise support
-for guests to use.
+The `pv=`, `hvm=`, `msr-sc=`, `rsb=`, `verw=`, `ibpb-entry=`, `bhb-entry=` and
+`asi=` options offer fine grained control over the primitives by Xen.  These
+impact Xen's ability to protect itself, and/or Xen's ability to virtualise
+support for guests to use.
 
 * `pv=` and `hvm=` offer control over all suboptions for PV and HVM guests
   respectively.
@@ -2449,6 +2449,11 @@ for guests to use.
   is not available (see `bhi-dis-s`).  The choice of scrubbing sequence can be
   selected using the `bhb-seq=` option.  If it is necessary to protect dom0
   too, boot with `spec-ctrl=bhb-entry`.
+* `asi=` offers control over whether the hypervisor will engage in Address
+  Space Isolation, by not having sensitive information mapped in the VMM
+  page-tables.  Not having sensitive information on the page-tables avoids
+  having to perform some mitigations for speculative attacks when
+  context-switching to the hypervisor.
 
 If Xen was compiled with `CONFIG_INDIRECT_THUNK` support, `bti-thunk=` can be
 used to select which of the thunks gets patched into the
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 9dd2e047f4de..8c366be8c75f 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -458,6 +458,9 @@ struct arch_domain
     /* Don't unconditionally inject #GP for unhandled MSRs. */
     bool msr_relaxed;
 
+    /* Run the guest without sensitive information in the VMM page-tables. */
+    bool asi;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 72347ef2b959..39963c004312 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -88,6 +88,8 @@ extern uint8_t default_scf;
 
 extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
+extern int8_t opt_asi_pv, opt_asi_hwdom, opt_asi_hvm;
+
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 5dc7a17b9354..2e403aad791c 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -84,6 +84,11 @@ static bool __ro_after_init opt_verw_mmio;
 static int8_t __initdata opt_gds_mit = -1;
 static int8_t __initdata opt_div_scrub = -1;
 
+/* Address Space Isolation for PV/HVM. */
+int8_t __ro_after_init opt_asi_pv = -1;
+int8_t __ro_after_init opt_asi_hwdom = -1;
+int8_t __ro_after_init opt_asi_hvm = -1;
+
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
     const char *ss;
@@ -143,6 +148,10 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_unpriv_mmio = false;
             opt_gds_mit = 0;
             opt_div_scrub = 0;
+
+            opt_asi_pv = 0;
+            opt_asi_hwdom = 0;
+            opt_asi_hvm = 0;
         }
         else if ( val > 0 )
             rc = -EINVAL;
@@ -162,6 +171,7 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_verw_pv = val;
             opt_ibpb_entry_pv = val;
             opt_bhb_entry_pv = val;
+            opt_asi_pv = val;
         }
         else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
         {
@@ -170,6 +180,7 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_verw_hvm = val;
             opt_ibpb_entry_hvm = val;
             opt_bhb_entry_hvm = val;
+            opt_asi_hvm = val;
         }
         else if ( (val = parse_boolean("msr-sc", s, ss)) != -1 )
         {
@@ -279,6 +290,27 @@ static int __init cf_check parse_spec_ctrl(const char *s)
                 break;
             }
         }
+        else if ( (val = parse_boolean("asi", s, ss)) != -1 )
+        {
+            switch ( val )
+            {
+            case 0:
+            case 1:
+                opt_asi_pv = opt_asi_hwdom = opt_asi_hvm = val;
+                break;
+
+            case -2:
+                s += strlen("asi=");
+                if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                    opt_asi_pv = val;
+                else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                    opt_asi_hvm = val;
+                else
+            default:
+                    rc = -EINVAL;
+                break;
+            }
+        }
 
         /* Xen's speculative sidechannel mitigation settings. */
         else if ( !strncmp(s, "bti-thunk=", 10) )
@@ -378,6 +410,13 @@ int8_t __ro_after_init opt_xpti_domu = -1;
 
 static __init void xpti_init_default(void)
 {
+    ASSERT(opt_asi_pv >= 0 && opt_asi_hwdom >= 0);
+    if ( (opt_xpti_hwdom == 1 || opt_xpti_domu == 1) && opt_asi_pv == 1 )
+    {
+        printk(XENLOG_ERR
+               "XPTI is incompatible with Address Space Isolation - disabling ASI\n");
+        opt_asi_pv = 0;
+    }
     if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
          cpu_has_rdcl_no )
     {
@@ -389,9 +428,9 @@ static __init void xpti_init_default(void)
     else
     {
         if ( opt_xpti_hwdom < 0 )
-            opt_xpti_hwdom = 1;
+            opt_xpti_hwdom = !opt_asi_hwdom;
         if ( opt_xpti_domu < 0 )
-            opt_xpti_domu = 1;
+            opt_xpti_domu = !opt_asi_pv;
     }
 }
 
@@ -630,12 +669,13 @@ static void __init print_details(enum ind_thunk thunk)
      * mitigation support for guests.
      */
 #ifdef CONFIG_HVM
-    printk("  Support for HVM VMs:%s%s%s%s%s%s%s%s\n",
+    printk("  Support for HVM VMs:%s%s%s%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
             opt_bhb_entry_hvm || amd_virt_spec_ctrl ||
-            opt_eager_fpu || opt_verw_hvm)           ? ""               : " None",
+            opt_eager_fpu || opt_verw_hvm ||
+            opt_asi_hvm)                             ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             amd_virt_spec_ctrl)                      ? " MSR_VIRT_SPEC_CTRL" : "",
@@ -643,22 +683,24 @@ static void __init print_details(enum ind_thunk thunk)
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_verw_hvm                              ? " VERW"          : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
-           opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
+           opt_bhb_entry_hvm                         ? " BHB-entry"     : "",
+           opt_asi_hvm                               ? " ASI"           : "");
 
 #endif
 #ifdef CONFIG_PV
-    printk("  Support for PV VMs:%s%s%s%s%s%s%s\n",
+    printk("  Support for PV VMs:%s%s%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
-            opt_bhb_entry_pv ||
+            opt_bhb_entry_pv || opt_asi_pv ||
             opt_eager_fpu || opt_verw_pv)            ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_verw_pv                               ? " VERW"          : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
-           opt_bhb_entry_pv                          ? " BHB-entry"     : "");
+           opt_bhb_entry_pv                          ? " BHB-entry"     : "",
+           opt_asi_pv                                ? " ASI"           : "");
 
     printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
            opt_xpti_hwdom ? "enabled" : "disabled",
@@ -1773,6 +1815,9 @@ void spec_ctrl_init_domain(struct domain *d)
     if ( pv )
         d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom
                                                 : opt_xpti_domu;
+
+    d->arch.asi = is_hardware_domain(d) ? opt_asi_hwdom
+                                        : pv ? opt_asi_pv : opt_asi_hvm;
 }
 
 void __init init_speculation_mitigations(void)
@@ -2069,6 +2114,19 @@ void __init init_speculation_mitigations(void)
          hw_smt_enabled && default_xen_spec_ctrl )
         setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
 
+    /* Disable ASI by default until feature is finished. */
+    if ( opt_asi_pv == -1 )
+        opt_asi_pv = 0;
+    if ( opt_asi_hwdom == -1 )
+        opt_asi_hwdom = 0;
+    if ( opt_asi_hvm == -1 )
+        opt_asi_hvm = 0;
+
+    if ( opt_asi_pv || opt_asi_hvm )
+        warning_add(
+            "Address Space Isolation is not functional, this option is\n"
+            "intended to be used only for development purposes.\n");
+
     xpti_init_default();
 
     l1tf_calculations();
-- 
2.45.2



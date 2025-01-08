Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6231A05F20
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867408.1278951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXHQ-0007Ux-MJ; Wed, 08 Jan 2025 14:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867408.1278951; Wed, 08 Jan 2025 14:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXHQ-0007RY-Ik; Wed, 08 Jan 2025 14:43:32 +0000
Received: by outflank-mailman (input) for mailman id 867408;
 Wed, 08 Jan 2025 14:43:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4z-0005q4-AA
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:41 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 216c9d2a-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:38 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so176181966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:38 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f06deb8sm2476322266b.190.2025.01.08.06.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:36 -0800 (PST)
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
X-Inumbo-ID: 216c9d2a-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346637; x=1736951437; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64UhML0RWOsr//hCManVNWudvxbMgrGePKLAgvzwrso=;
        b=YcugltHiEInC9JtMlReKqHvYYwlyquSaZr4ZHtedJCKh/HKPjITL1XbBYKBkmym18W
         +VEZTddvJ+EoviZRPyy/YbIyj5EE0UY5TSfNYSXAorBydSiagDxH5r3xr6BBx3f8umhG
         7TCD24rrQc2SNSr98neTJb8/I4z02FeC0BwyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346637; x=1736951437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64UhML0RWOsr//hCManVNWudvxbMgrGePKLAgvzwrso=;
        b=E2O7wmSKxSMTf7gJ/oFEPr8QFr2EaajFvgVCcz40y03y3XNDPz6if7f00RanU4knll
         rljb6dO2aLZNRvnJSW59irRoPYFYzz9N6onCI3IaJTyjnEgcIQpFJgULy10c/9LiCARk
         7gZoyYuf+Nq8Qcac2IAB3ZiS/cH+K4OlK04eLIctsH1KgLc7k5nligEuJlaQlT0TzznR
         dwFQaRRl+hpa4PUqqk9glsk2XnkTXRlgXUCCVpLc3O+qH3xwRpjhHRiuUg9vb8iCLKqO
         u+8R/tJVqqfn9gy2/XZGcPGxD55G72+dvvzL5qdFa1AhJB6wwNfA2FibiDUF/x+z/KyM
         3FeA==
X-Gm-Message-State: AOJu0Yzq492fzlGF1dgzLU6HwM3inRdO7wLNy/Bg8yVXCYgIhbdg+VoF
	TCa8tMCPc8lGs0dETw9uXqrg1rzSvERriBMkfV3DbmdWeTMkOS1WvSDp+Z2GO7NOxTz+hXMRWVu
	g
X-Gm-Gg: ASbGncvo+U1VKdEfCE8NevmanrJeLb4lgF9WMmYbSwv3OSNiCSQBOscvhfJCVp1ta88
	ZokNNGt2/BTFvo0LsNGmSbfc2g6V3x9fQHlesuyt1D6fld2UG1Dvyyat0EY6piU6KAQhZOmmLX4
	ZKvgE+5g09oH4vy2Koift+iwqAKRMnaGJSbdyEjA/cR9k7m03eGt+Aplncmr6Lroqg7hfK6/NxY
	YOWomT0SqURcW4pJLWqL7gooxELQmwuqcd7qdxRoNahiUd6HMxr7ma9X1QAIqaoslk=
X-Google-Smtp-Source: AGHT+IEq+KY2LZkz/gnj/jxJL+yjPIdvzmJsHhNv2K4GFW4sBjXt+uj2Uerfd4lNiG4OAscLmf4jpQ==
X-Received: by 2002:a17:907:3d8f:b0:aae:83c7:6ce7 with SMTP id a640c23a62f3a-ab28d07ba93mr706906266b.0.1736346637140;
        Wed, 08 Jan 2025 06:30:37 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 13/18] x86/spec-ctrl: introduce Address Space Isolation command line option
Date: Wed,  8 Jan 2025 15:26:53 +0100
Message-ID: <20250108142659.99490-14-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change, as the option is not used.

Introduced new so newly added functionality is keyed on the option being
enabled, even if the feature is non-functional.

When ASI is enabled for PV domains, printing the usage of XPTI might be
omitted if it must be uniformly disabled given the usage of ASI.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Improve comments and documentation about what ASI provides.
 - Do not print the XPTI information if ASI is used for pv domUs and dom0 is
   PVH, or if ASI is used for both domU and dom0.

FWIW, I would print the state of XPTI uniformly, as otherwise I find the output
might be confusing for user expecting to assert the state of XPTI.
---
 docs/misc/xen-command-line.pandoc    |  19 +++++
 xen/arch/x86/include/asm/domain.h    |   3 +
 xen/arch/x86/include/asm/spec_ctrl.h |   2 +
 xen/arch/x86/spec_ctrl.c             | 115 +++++++++++++++++++++++++--
 4 files changed, 133 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 08b0053f9ced..3c1ad7b5fe7d 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -202,6 +202,25 @@ to appropriate auditing by Xen.  Argo is disabled by default.
     This option is disabled by default, to protect domains from a DoS by a
     buggy or malicious other domain spamming the ring.
 
+### asi (x86)
+> `= List of [ <bool>, {pv,hvm}=<bool>,
+               {vcpu-pt}=<bool>|{pv,hvm}=<bool> ]`
+
+Offers control over whether the hypervisor will engage in Address Space
+Isolation, by not having potentially sensitive information permanently mapped
+in the VMM page-tables.  Using this option might avoid the need to apply
+mitigations for certain speculative related attacks, at the cost of mapping
+sensitive information on-demand.
+
+* `pv=` and `hvm=` sub-options allow enabling for specific guest types.
+
+**WARNING: manual de-selection of enabled options will invalidate any
+protection offered by the feature.  The fine grained options provided below are
+meant to be used for debugging purposes only.**
+
+* `vcpu-pt` ensure each vCPU uses a unique top-level page-table and setup a
+  virtual address space region to map memory on a per-vCPU basis.
+
 ### asid (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 5af414fa64ac..fb92a10bf3b7 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -456,6 +456,9 @@ struct arch_domain
     /* Don't unconditionally inject #GP for unhandled MSRs. */
     bool msr_relaxed;
 
+    /* Use a per-vCPU root pt, and switch per-domain slot to per-vCPU. */
+    bool vcpu_pt;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 077225418956..c58afbaab671 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -88,6 +88,8 @@ extern uint8_t default_scf;
 
 extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
+extern int8_t opt_vcpu_pt_pv, opt_vcpu_pt_hwdom, opt_vcpu_pt_hvm;
+
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
 extern bool opt_bp_spec_reduce;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index ced84750015c..9463a8624701 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -85,6 +85,11 @@ static int8_t __initdata opt_gds_mit = -1;
 static int8_t __initdata opt_div_scrub = -1;
 bool __ro_after_init opt_bp_spec_reduce = true;
 
+/* Use a per-vCPU root page-table and switch the per-domain slot to per-vCPU. */
+int8_t __ro_after_init opt_vcpu_pt_hvm = -1;
+int8_t __ro_after_init opt_vcpu_pt_hwdom = -1;
+int8_t __ro_after_init opt_vcpu_pt_pv = -1;
+
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
     const char *ss;
@@ -384,6 +389,13 @@ int8_t __ro_after_init opt_xpti_domu = -1;
 
 static __init void xpti_init_default(void)
 {
+    ASSERT(opt_vcpu_pt_pv >= 0 && opt_vcpu_pt_hwdom >= 0);
+    if ( (opt_xpti_hwdom == 1 || opt_xpti_domu == 1) && opt_vcpu_pt_pv == 1 )
+    {
+        printk(XENLOG_ERR
+               "XPTI incompatible with per-vCPU page-tables, disabling ASI\n");
+        opt_vcpu_pt_pv = 0;
+    }
     if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
          cpu_has_rdcl_no )
     {
@@ -395,9 +407,9 @@ static __init void xpti_init_default(void)
     else
     {
         if ( opt_xpti_hwdom < 0 )
-            opt_xpti_hwdom = 1;
+            opt_xpti_hwdom = !opt_vcpu_pt_hwdom;
         if ( opt_xpti_domu < 0 )
-            opt_xpti_domu = 1;
+            opt_xpti_domu = !opt_vcpu_pt_pv;
     }
 }
 
@@ -488,6 +500,66 @@ static int __init cf_check parse_pv_l1tf(const char *s)
 }
 custom_param("pv-l1tf", parse_pv_l1tf);
 
+static int __init cf_check parse_asi(const char *s)
+{
+    const char *ss;
+    int val, rc = 0;
+
+    /* Interpret 'asi' alone in its positive boolean form. */
+    if ( *s == '\0' )
+        opt_vcpu_pt_pv = opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = 1;
+
+    do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        val = parse_bool(s, ss);
+        switch ( val )
+        {
+        case 0:
+        case 1:
+            opt_vcpu_pt_pv = opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
+            break;
+
+        default:
+            if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                opt_vcpu_pt_pv = val;
+            else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                opt_vcpu_pt_hvm = val;
+            else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
+            {
+                switch ( val )
+                {
+                case 1:
+                case 0:
+                    opt_vcpu_pt_pv = opt_vcpu_pt_hvm = opt_vcpu_pt_hwdom = val;
+                    break;
+
+                case -2:
+                    s += strlen("vcpu-pt=");
+                    if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                        opt_vcpu_pt_pv = val;
+                    else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                        opt_vcpu_pt_hvm = val;
+                    else
+                default:
+                        rc = -EINVAL;
+                    break;
+                }
+            }
+            else if ( *s )
+                rc = -EINVAL;
+            break;
+        }
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("asi", parse_asi);
+
 static void __init print_details(enum ind_thunk thunk)
 {
     unsigned int _7d0 = 0, _7d2 = 0, e8b = 0, e21a = 0, max = 0, tmp;
@@ -668,15 +740,29 @@ static void __init print_details(enum ind_thunk thunk)
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
            opt_bhb_entry_pv                          ? " BHB-entry"     : "");
 
-    printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
-           opt_xpti_hwdom ? "enabled" : "disabled",
-           opt_xpti_domu  ? "enabled" : "disabled",
-           xpti_pcid_enabled() ? "" : "out");
+    if ( !opt_vcpu_pt_pv || (!opt_dom0_pvh && !opt_vcpu_pt_hwdom) )
+        printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
+               opt_xpti_hwdom ? "enabled" : "disabled",
+               opt_xpti_domu  ? "enabled" : "disabled",
+               xpti_pcid_enabled() ? "" : "out");
 
     printk("  PV L1TF shadowing: Dom0 %s, DomU %s\n",
            opt_pv_l1tf_hwdom ? "enabled"  : "disabled",
            opt_pv_l1tf_domu  ? "enabled"  : "disabled");
 #endif
+
+#ifdef CONFIG_HVM
+    printk("  ASI features for HVM VMs:%s%s\n",
+           opt_vcpu_pt_hvm                           ? ""               : " None",
+           opt_vcpu_pt_hvm                           ? " vCPU-PT"       : "");
+
+#endif
+#ifdef CONFIG_PV
+    printk("  ASI features for PV VMs:%s%s\n",
+           opt_vcpu_pt_pv                            ? ""               : " None",
+           opt_vcpu_pt_pv                            ? " vCPU-PT"       : "");
+
+#endif
 }
 
 static bool __init check_smt_enabled(void)
@@ -1779,6 +1865,10 @@ void spec_ctrl_init_domain(struct domain *d)
     if ( pv )
         d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom
                                                 : opt_xpti_domu;
+
+    d->arch.vcpu_pt = is_hardware_domain(d) ? opt_vcpu_pt_hwdom
+                                            : pv ? opt_vcpu_pt_pv
+                                                 : opt_vcpu_pt_hvm;
 }
 
 void __init init_speculation_mitigations(void)
@@ -2075,6 +2165,19 @@ void __init init_speculation_mitigations(void)
          hw_smt_enabled && default_xen_spec_ctrl )
         setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
 
+    /* Disable all ASI options by default until feature is finished. */
+    if ( opt_vcpu_pt_pv == -1 )
+        opt_vcpu_pt_pv = 0;
+    if ( opt_vcpu_pt_hwdom == -1 )
+        opt_vcpu_pt_hwdom = 0;
+    if ( opt_vcpu_pt_hvm == -1 )
+        opt_vcpu_pt_hvm = 0;
+
+    if ( opt_vcpu_pt_pv || opt_vcpu_pt_hvm )
+        warning_add(
+            "Address Space Isolation is not functional, this option is\n"
+            "intended to be used only for development purposes.\n");
+
     xpti_init_default();
 
     l1tf_calculations();
-- 
2.46.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C0384AB7E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 02:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676583.1052803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA90-0000Sf-Lb; Tue, 06 Feb 2024 01:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676583.1052803; Tue, 06 Feb 2024 01:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA90-0000OY-Fu; Tue, 06 Feb 2024 01:21:02 +0000
Received: by outflank-mailman (input) for mailman id 676583;
 Tue, 06 Feb 2024 01:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4KK=JP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXA8y-0007Lc-Ka
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 01:21:00 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc567744-c48d-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 02:20:59 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so673260466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 17:20:59 -0800 (PST)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a3726a5e5fdsm486803ejd.95.2024.02.05.17.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 17:20:57 -0800 (PST)
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
X-Inumbo-ID: fc567744-c48d-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707182459; x=1707787259; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pM0fbVdhQKXAGnV8MgqEAxKe6Vv2X0dLKmpVPSvjpw=;
        b=LwaqsOU10jyaNlqLRkN4Hli1zqcwp68kwJSYHNhDLxak210u9Bhw8t62tghU6kABmj
         PvtzeKSBZ26zkuAJHDknjoINcjXTz97Jy9EQkeZZGPT984afg+gEVoMgaJTqoboDBUrn
         HzODJJEPPY01vBeR+7ik6FWJWkDDKegi8Fvx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707182459; x=1707787259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pM0fbVdhQKXAGnV8MgqEAxKe6Vv2X0dLKmpVPSvjpw=;
        b=cmICTA/tLXP2Gu2Kww0lEkyxucncIt9IE0DMbHzvhXZDEJj6yyzlifYpQ1ugMzLqnk
         ej8ezi9T7BF/tr8XB6dzplLkO+YC+pcsBRHz2pjBjBedwxg9zoG3OM5CKAnsrqapywC9
         25mNMqwRJ3pcgMTr9Jq2IY6Tg+ueDpPGoDqKsLJUciqYL2KjesAyytbVnlF4my1A84i/
         26P/AnMOFUYxrvzWzo8D1LkwMfNG+MiYOZy1ZATLiWisr10veJpcSTmeR7j9rn4jjwTm
         ifbYJD6zevI9nUO6xM3g3XHgAFghRpwZLpQXajpPDid4CY+x9QenvKrQItqLKT3py58x
         hyXw==
X-Gm-Message-State: AOJu0YxxzallZ5vn6wSBLCG12R9hl2Iu8cfsrlg/6qcgv+Yb31bzadGK
	6I6kVpWFz7SsMRgYre/nh0nKWrPpYeekqQJtzmPFuLr8fFaPuTVvmpxoWcmvM+vD70KBTnOJEhe
	Er+E=
X-Google-Smtp-Source: AGHT+IH2cOu+Wp9hhWPN0ENYOLxHKZWM4fH3SAD3uRu30XVaQsueubP9ferpWl940F1nAwW/E2ZzYA==
X-Received: by 2002:a17:906:6711:b0:a35:d634:ed71 with SMTP id a17-20020a170906671100b00a35d634ed71mr408368ejp.23.1707182458745;
        Mon, 05 Feb 2024 17:20:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX9XwTTAZaIAdCAi/HjSjsAx57kB++2feCoFTQuGBsw2R4RJY5t9gw2L1ZdwW2gEP4miMASqd6CRLVRSFKsOoGP6085iRQ3LHhEur5aFe4DcuS+ax9cw7Y+46MokRR+cLLdJ4y6VV7ZcgwUvqrJD5dyQQ9mj9wBM0ya/ANHYm4654S5qlBP/tstx65hgovQsLmeSgcqE7m64iTtmi93XejmBETN0HFbbzRGjb+4KeEPdMAME+HR4Y9ymg0lZbI+KapGR/EnW34R/YJlTwgHGn7E3M5de/j6N/aCmbK1CNIF8Ct3tOYjk0EoMETHXy4H
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 6/6] svm/nestedvm: Introduce nested capabilities bit
Date: Tue,  6 Feb 2024 01:20:51 +0000
Message-Id: <20240206012051.3564035-7-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240206012051.3564035-1-george.dunlap@cloud.com>
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to make implementation and testing tractable, we will require
specific host functionality.  Add a nested_virt bit to hvm_funcs.caps,
and return an error if a domain is created with nested virt and this
bit isn't set.

For VMX, start with always enabling it if HAP is present; this
shouldn't change current behvior.

For SVM, require some basic functionality, adding a document
explaining the rationale.

NB that only SVM CPUID bits 0-7 have been considered.  Bits 10-16 may
be considered in a follow-up patch.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 docs/designs/nested-svm-cpu-features.md | 110 ++++++++++++++++++++++++
 xen/arch/x86/domain.c                   |   6 ++
 xen/arch/x86/hvm/svm/nestedhvm.h        |   1 +
 xen/arch/x86/hvm/svm/nestedsvm.c        |  14 +++
 xen/arch/x86/hvm/svm/svm.c              |   2 +
 xen/arch/x86/hvm/vmx/vmx.c              |   3 +
 xen/arch/x86/include/asm/hvm/hvm.h      |  11 ++-
 7 files changed, 146 insertions(+), 1 deletion(-)

diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
new file mode 100644
index 0000000000..7ffb8daefd
--- /dev/null
+++ b/docs/designs/nested-svm-cpu-features.md
@@ -0,0 +1,110 @@
+# Nested SVM (AMD) CPUID requirements
+
+The first step in making nested SVM production-ready is to make sure
+that all features are implemented and well-tested.  To make this
+tractable, we will initially be limiting the "supported" range of
+nested virt to a specific subset of host and guest features.  This
+document describes the criteria for deciding on features, and the
+rationale behind each feature.
+
+For AMD, all virtualization-related features can be found in CPUID
+leaf 8000000A:edx
+
+# Criteria
+
+- Processor support: At a minimum we want to support processors from
+  the last 5 years.  All things being equal, older processors are
+  better.  Bits 0:7 were available in the very earliest processors;
+  and even through bit 15 we should be pretty good support-wise.
+
+- Faithfulness to hardware: We need the behavior of the "virtual cpu"
+  from the L1 hypervisor's perspective to be as close as possible to
+  the original hardware.  In particular, the behavior of the hardware
+  on error paths 1) is not easy to understand or test, 2) can be the
+  source of surprising vulnerabiliies.  (See XSA-7 for an example of a
+  case where subtle error-handling differences can open up a privilege
+  escalation.)  We should avoid emulating any bit of the hardware with
+  complex error paths if we can at all help it.
+
+- Cost of implementation: We want to minimize the cost of
+  implementation (where this includes bringing an existing sub-par
+  implementation up to speed).  All things being equal, we'll favor a
+  configuration which does not require any new implementation.
+
+- Performance: All things being equal, we'd prefer to choose a set of
+  L0 / L1 CPUID bits that are faster than slower.
+
+
+# Bits
+
+- 0 `NP` *Nested Paging*: Required both for L0 and L1.
+
+  Based primarily on faithfulness and performance, as well as
+  potential cost of implementation.  Available on earliest hardware,
+  so no compatibility issues.
+
+- 1 `LbrVirt` *LBR / debugging virtualization*: Require for L0 and L1.
+
+  For L0 this is required for performance: There's no way to tell the
+  guests not to use the LBR-related registers; and if the guest does,
+  then you have to save and restore all LBR-related registers on
+  context switch, which is prohibitive.  Furthermore, the additional
+  emulation risks a security-relevant difference to come up.
+
+  Providing it to L1 when we have it in L0 is basically free, and
+  already implemented.
+
+  Just require it and provide it.
+
+- 2 `SVML` *SVM Lock*: Not required for L0, not provided to L1
+
+  Seems to be aboult enabling an operating system to prevent "blue
+  pill" attacks against itself.
+
+  Xen doesn't use it, nor provide it; so it would need to be
+  implementend.  The best way to protect a guest OS is to leave nested
+  virt disabled in the tools.
+
+- 3 `NRIPS` NRIP Save: Require for both L0 and L1
+
+  If NRIPS is not present, the software interrupt injection
+  functionality can't be used; and Xen has to emulate it.  That's
+  another source of potential security issues.  If hardware supports
+  it, then providing it to guest is basically free.
+
+- 4 `TscRateMsr`: Not required by L0, not provided to L1
+
+  The main putative use for this would be trying to maintain an
+  invariant TSC across cores with different clock speeds, or after a
+  migrate.  Unlike others, this doesn't have an error path to worry
+  about compatibility-wise; and according to tests done when nestedSVM
+  was first implemented, it's actually faster to emliate TscRateMSR in
+  the L0 hypervisor than for L1 to attempt to emulate it itself.
+
+  However, using this properly in L0 will take some implementation
+  effort; and composing it properly with L1 will take even more
+  effort.  Just leave it off for now.
+
+ - 5 `VmcbClean`: VMCB Clean Bits: Not required by L0, provide to L1
+
+  This is a pure optimization, both on the side of the L0 and L1.  The
+  implementaiton for L1 is entirely Xen-side, so can be provided even
+  on hardware that doesn't provide it.  And it's purely an
+  optimization, so could be "implemented" by ignoring the bits
+  entirely.
+
+  As such, we don't need to require it for L0; and as it's already
+  implemented, no reason not to provide it to L1.  Before this feature
+  was available those bits were marked SBZ ("should be zero"); setting
+  them was already advertised to cause unpredictable behavior.
+
+- 6 `FlushByAsid`: Require for L0, provide to L1
+
+  This is cheap and easy to use for L0 and to provide to the L1;
+  there's no reson not to just pass it through.
+
+- 7 `DecodeAssists`: Require for L0, provide to L1
+
+  Using it in L0 reduces the chance that we'll make some sort of error
+  in the decode path.  And if hardware supports it, it's easy enough
+  to provide to the L1.
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index bda853e3c9..a25f498265 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -673,6 +673,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
          */
         config->flags |= XEN_DOMCTL_CDF_oos_off;
 
+    if ( nested_virt && !hvm_nested_virt_supported() )
+    {
+        dprintk(XENLOG_INFO, "Nested virt requested but not available\n");
+        return -EINVAL;        
+    }
+
     if ( nested_virt && !hap )
     {
         dprintk(XENLOG_INFO, "Nested virt not supported without HAP\n");
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 43245e13de..31cf2af8e4 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -35,6 +35,7 @@ enum nestedhvm_vmexits
 nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
     uint64_t exitcode);
 void svm_nested_features_on_efer_update(struct vcpu *v);
+void __init start_nested_svm(struct hvm_function_table *svm_function_table);
 
 /* Interface methods */
 void cf_check nsvm_vcpu_destroy(struct vcpu *v);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a5319ab729..92b063daa5 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1666,3 +1666,17 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
         }
     }
 }
+
+void __init start_nested_svm(struct hvm_function_table *svm_function_table)
+{
+    /* 
+     * Required host functionality to support nested virt.  See
+     * docs/designs/nested-svm-cpu-features.md for rationale.
+     */
+    svm_function_table->caps.nested_virt =
+        cpu_has_svm_nrips &&
+        cpu_has_svm_lbrv &&
+        cpu_has_svm_nrips &&
+        cpu_has_svm_flushbyasid &&
+        cpu_has_svm_decode;
+}
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 34b9f603bc..5c2e171777 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2527,6 +2527,8 @@ const struct hvm_function_table * __init start_svm(void)
     svm_function_table.caps.hap_superpage_2mb = true;
     svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
 
+    start_nested_svm(&svm_function_table);
+
     return &svm_function_table;
 }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4bcf436d2c..6b5ad4a509 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3021,6 +3021,9 @@ const struct hvm_function_table * __init start_vmx(void)
     if ( cpu_has_vmx_tsc_scaling )
         vmx_function_table.tsc_scaling.ratio_frac_bits = 48;
 
+    /* TODO: Require hardware support before enabling nested virt */
+    vmx_function_table.caps.nested_virt = vmx_function_table.caps.hap;
+
     model_specific_lbr = get_model_specific_lbr();
     lbr_tsx_fixup_check();
     ler_to_fixup_check();
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index bbd83a8275..8a3df0eca7 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -97,7 +97,10 @@ struct hvm_function_table {
             singlestep:1,
             
             /* Hardware virtual interrupt delivery enable? */
-            virtual_intr_delivery;
+            virtual_intr_delivery,
+
+            /* Nested virt capabilities */
+            nested_virt:1;
 
     } caps;
 
@@ -655,6 +658,12 @@ static inline bool hvm_altp2m_supported(void)
     return hvm_funcs.caps.altp2m;
 }
 
+/* Returns true if we have the minimum hardware requirements for nested virt */
+static inline bool hvm_nested_virt_supported(void)
+{
+    return hvm_funcs.caps.nested_virt;
+}
+
 /* updates the current hardware p2m */
 static inline void altp2m_vcpu_update_p2m(struct vcpu *v)
 {
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A587A78D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 13:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692405.1079522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNiq-0006bA-87; Wed, 13 Mar 2024 12:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692405.1079522; Wed, 13 Mar 2024 12:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNiq-0006Xm-52; Wed, 13 Mar 2024 12:28:40 +0000
Received: by outflank-mailman (input) for mailman id 692405;
 Wed, 13 Mar 2024 12:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AcA=KT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rkNip-0005zY-33
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 12:28:39 +0000
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [2607:f8b0:4864:20::e30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36e6b213-e135-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 13:28:37 +0100 (CET)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-4726c259cc9so202522137.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 05:28:37 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 ne7-20020a056214424700b00690dbc390dcsm2283874qvb.89.2024.03.13.05.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 05:28:34 -0700 (PDT)
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
X-Inumbo-ID: 36e6b213-e135-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710332916; x=1710937716; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhL6carBpJAEJcZDaFIRwTP2onUiQlD3W4fFGQ9k40Q=;
        b=dVL7WNClQmrDcfAxtyI++4r5yeaLaZwINuGIy4KawlKNo4x7feTK7l8gf/2hOHhsuB
         KwdNBPOeu0bIfVBKSx/gvahNVbP6nY4fCeM5/Mym7darsfb1qanzIa9clf2lFSubskoH
         lUMVJevvqVATb4wrbPzqTw6zF0Nf2o4KlS6kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710332916; x=1710937716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhL6carBpJAEJcZDaFIRwTP2onUiQlD3W4fFGQ9k40Q=;
        b=gB5xk5wCc+xQxvZr4Ake+cBPqQDoAv5B0wl2e1oWh23LqsIppK6k8MhISavnG+6+p7
         R9XSoPYoQta0enreol7yxz91p+Kumfg7ZYqVQcvYrLNWsP9YgMX7duZ7j7NYAn/hnb0g
         ilD7NIH89FRLaanBR41UUU+yGfP/r/2RBFrQ2PRMHhBm6QCBKo5fk/NvJ4SbES+Oqa8k
         Y93/DWkToTfN65wTUnKIjuB9irXeGEeErp1oAdHpLyCZisWPuH0T0ZWEWCDEeeER4+V6
         IbpiCZa+c7thiU/2QBev39oHNMKWY3FiWaRXHJFcp5AtmfFQYE9p6xNx6n/UaQ000/BJ
         zvkw==
X-Gm-Message-State: AOJu0Yzw4VMbkZxoeSGVH/PdgkHbm4nM5C6QHN7v8DEH0yAOUj+tWIkP
	apULcm2G2gJdQl6iTefzqWuG45C3YUmmJ0kaBiKD6cEcmM5IgV/vJFzIf4TkltJXSmmXrLwtYsU
	l
X-Google-Smtp-Source: AGHT+IFFv7kFFTxdBKMJcSkfT8J6KHRXut4JimbWmQW5uk6S+fSYjizgtJgRKE7DIltJJDUa9uQdtQ==
X-Received: by 2002:a05:6102:11ed:b0:473:4d73:5e1c with SMTP id e13-20020a05610211ed00b004734d735e1cmr3528715vsg.9.1710332914410;
        Wed, 13 Mar 2024 05:28:34 -0700 (PDT)
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
Subject: [PATCH v2 3/3] svm/nestedsvm: Introduce nested capabilities bit
Date: Wed, 13 Mar 2024 12:24:54 +0000
Message-Id: <20240313122454.965566-4-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313122454.965566-1-george.dunlap@cloud.com>
References: <20240313122454.965566-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to make implementation and testing tractable, we will require
specific host functionality.  Add a nested_virt bit to hvm_funcs.caps,
and return an error if a domain is created with nested virt and this
bit isn't set.  Create VMX and SVM callbacks to be executed from
start_nested_svm(), which is guaranteed to execute after all
command-line options have been procesed.

For VMX, start with always enabling it if HAP is present; this
shouldn't change current behvior.

For SVM, require some basic functionality, adding a document
explaining the rationale.

NB that only SVM CPUID bits 0-7 have been considered.  Bits 10-16 may
be considered in a follow-up patch.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
v2:
 - Fixed typo in title
 - Added hvm_nested_virt_supported() def for !CONFIG_HVM
 - Rebased over previous changes
 - Tweak some wording in document
 - Require npt rather than nrips twice
 - Remove stray __init from header
 - Set caps.nested_virt from callback from nestedhvm_setup()

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
 docs/designs/nested-svm-cpu-features.md  | 111 +++++++++++++++++++++++
 xen/arch/x86/domain.c                    |   6 ++
 xen/arch/x86/hvm/nestedhvm.c             |  10 ++
 xen/arch/x86/hvm/svm/nestedsvm.c         |  14 +++
 xen/arch/x86/hvm/vmx/vvmx.c              |   8 ++
 xen/arch/x86/include/asm/hvm/hvm.h       |  16 +++-
 xen/arch/x86/include/asm/hvm/nestedhvm.h |   4 +
 7 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
new file mode 100644
index 0000000000..837a96df05
--- /dev/null
+++ b/docs/designs/nested-svm-cpu-features.md
@@ -0,0 +1,111 @@
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
+  the last 5 years.  All things being equal, we'd prefer to cover
+  older processors than not.  Bits 0:7 were available in the very
+  earliest processors; and even through bit 15 we should be pretty
+  good support-wise.
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
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index 12bf7172b8..451c4da6d4 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -150,6 +150,16 @@ static int __init cf_check nestedhvm_setup(void)
     __clear_bit(0x80, shadow_io_bitmap[0]);
     __clear_bit(0xed, shadow_io_bitmap[1]);
 
+    /* 
+     * NB this must be called after all command-line processing has been
+     * done, so that if (for example) HAP is disabled, nested virt is
+     * disabled as well.
+     */
+    if ( cpu_has_vmx )
+        start_nested_vmx(&hvm_funcs);
+    else if ( cpu_has_svm )
+        start_nested_svm(&hvm_funcs);
+
     return 0;
 }
 __initcall(nestedhvm_setup);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a5319ab729..ad2e9f5c35 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1666,3 +1666,17 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
         }
     }
 }
+
+void __init start_nested_svm(struct hvm_function_table *hvm_function_table)
+{
+    /* 
+     * Required host functionality to support nested virt.  See
+     * docs/designs/nested-svm-cpu-features.md for rationale.
+     */
+    hvm_function_table->caps.nested_virt =
+        hvm_function_table->caps.hap && 
+        cpu_has_svm_lbrv &&
+        cpu_has_svm_nrips &&
+        cpu_has_svm_flushbyasid &&
+        cpu_has_svm_decode;
+}
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index ece0aa243a..ed058d9d2b 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2816,6 +2816,14 @@ void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr)
     __vmwrite(read_shadow_field, v->arch.hvm.nvcpu.guest_cr[cr]);
 }
 
+void __init start_nested_vmx(struct hvm_function_table *hvm_function_table)
+{
+    /* TODO: Require hardware support before enabling nested virt */
+    hvm_function_table->caps.nested_virt =
+        hvm_function_table->caps.hap;
+}
+
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 87a6935d97..e6f937fed7 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -97,7 +97,10 @@ struct hvm_function_table {
              singlestep:1,
             
              /* Hardware virtual interrupt delivery enable? */
-             virtual_intr_delivery:1;
+             virtual_intr_delivery:1,
+
+             /* Nested virt capabilities */
+             nested_virt:1;
     } caps;
 
     /*
@@ -654,6 +657,12 @@ static inline bool hvm_altp2m_supported(void)
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
@@ -797,6 +806,11 @@ static inline bool hvm_hap_supported(void)
     return false;
 }
 
+static inline bool hvm_nested_virt_supported(void)
+{
+    return false;
+}
+
 static inline bool nhvm_vmcx_hap_enabled(const struct vcpu *v)
 {
     ASSERT_UNREACHABLE();
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index 56a2019e1b..0568acb25f 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -82,4 +82,8 @@ static inline bool vvmcx_valid(const struct vcpu *v)
     return vcpu_nestedhvm(v).nv_vvmcxaddr != INVALID_PADDR;
 }
 
+
+void start_nested_svm(struct hvm_function_table *);
+void start_nested_vmx(struct hvm_function_table *);
+
 #endif /* _HVM_NESTEDHVM_H */
-- 
2.25.1



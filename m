Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D85D21780E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:40:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstSG-0007b4-6U; Tue, 07 Jul 2020 19:40:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHg+=AS=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jstSE-0007at-FX
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:40:34 +0000
X-Inumbo-ID: b7bf1741-c089-11ea-8de3-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7bf1741-c089-11ea-8de3-12813bfff9fa;
 Tue, 07 Jul 2020 19:40:32 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5FCBEA268B;
 Tue,  7 Jul 2020 21:40:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5882EA264E;
 Tue,  7 Jul 2020 21:40:30 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5VbTMOSLIUg9; Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B98B3A2660;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id g6H3xNpPY_Yw; Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7A071A265E;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6232222477;
 Tue,  7 Jul 2020 21:39:59 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HGbXudXT8yoR; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9964922427;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
X-Quarantine-ID: <gZ2uXSNp0qxh>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gZ2uXSNp0qxh; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 510622236E;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 03/11] x86/vmx: add IPT cpu feature
Date: Tue,  7 Jul 2020 21:39:42 +0200
Message-Id: <4d6eac657d082efaa0e7d141b5c9a07791b31f94.1594150543.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, luwei.kang@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 tamas.lengyel@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Check if Intel Processor Trace feature is supported by current
processor. Define vmtrace_supported global variable.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/hvm/vmx/vmcs.c                 | 15 ++++++++++++++-
 xen/common/domain.c                         |  2 ++
 xen/include/asm-x86/cpufeature.h            |  1 +
 xen/include/asm-x86/hvm/vmx/vmcs.h          |  1 +
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 xen/include/xen/domain.h                    |  2 ++
 6 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index ca94c2bedc..3a53553f10 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -291,6 +291,20 @@ static int vmx_init_vmcs_config(void)
         _vmx_cpu_based_exec_control &=
             ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
 
+    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
+
+    /* Check whether IPT is supported in VMX operation. */
+    if ( !smp_processor_id() )
+        vmtrace_supported = cpu_has_ipt &&
+                            (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
+    else if ( vmtrace_supported &&
+              !(_vmx_misc_cap & VMX_MISC_PROC_TRACE) )
+    {
+        printk("VMX: IPT capabilities fatally differ between CPU%u and CPU0\n",
+               smp_processor_id());
+        return -EINVAL;
+    }
+
     if ( _vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
     {
         min = 0;
@@ -305,7 +319,6 @@ static int vmx_init_vmcs_config(void)
                SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
                SECONDARY_EXEC_XSAVES |
                SECONDARY_EXEC_TSC_SCALING);
-        rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
         if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
             opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
         if ( opt_vpid_enabled )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 7cc9526139..a45cf023f7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -82,6 +82,8 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
 
 vcpu_info_t dummy_vcpu_info;
 
+bool vmtrace_supported __read_mostly;
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index f790d5c1f8..555f696a26 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -104,6 +104,7 @@
 #define cpu_has_clwb            boot_cpu_has(X86_FEATURE_CLWB)
 #define cpu_has_avx512er        boot_cpu_has(X86_FEATURE_AVX512ER)
 #define cpu_has_avx512cd        boot_cpu_has(X86_FEATURE_AVX512CD)
+#define cpu_has_ipt             boot_cpu_has(X86_FEATURE_PROC_TRACE)
 #define cpu_has_sha             boot_cpu_has(X86_FEATURE_SHA)
 #define cpu_has_avx512bw        boot_cpu_has(X86_FEATURE_AVX512BW)
 #define cpu_has_avx512vl        boot_cpu_has(X86_FEATURE_AVX512VL)
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 906810592f..6153ba6769 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -283,6 +283,7 @@ extern u32 vmx_secondary_exec_control;
 #define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 0x80000000000ULL
 extern u64 vmx_ept_vpid_cap;
 
+#define VMX_MISC_PROC_TRACE                     0x00004000
 #define VMX_MISC_CR3_TARGET                     0x01ff0000
 #define VMX_MISC_VMWRITE_ALL                    0x20000000
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index fe7492a225..2c91862f2d 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -217,6 +217,7 @@ XEN_CPUFEATURE(SMAP,          5*32+20) /*S  Supervisor Mode Access Prevention */
 XEN_CPUFEATURE(AVX512_IFMA,   5*32+21) /*A  AVX-512 Integer Fused Multiply Add */
 XEN_CPUFEATURE(CLFLUSHOPT,    5*32+23) /*A  CLFLUSHOPT instruction */
 XEN_CPUFEATURE(CLWB,          5*32+24) /*A  CLWB instruction */
+XEN_CPUFEATURE(PROC_TRACE,    5*32+25) /*   Processor Tracing feature */
 XEN_CPUFEATURE(AVX512PF,      5*32+26) /*A  AVX-512 Prefetch Instructions */
 XEN_CPUFEATURE(AVX512ER,      5*32+27) /*A  AVX-512 Exponent & Reciprocal Instrs */
 XEN_CPUFEATURE(AVX512CD,      5*32+28) /*A  AVX-512 Conflict Detection Instrs */
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 7e51d361de..61ebc6c24d 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -130,4 +130,6 @@ struct vnuma_info {
 
 void vnuma_destroy(struct vnuma_info *vnuma);
 
+extern bool vmtrace_supported;
+
 #endif /* __XEN_DOMAIN_H__ */
-- 
2.17.1



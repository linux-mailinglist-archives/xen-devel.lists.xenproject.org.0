Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D3B664742
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 18:19:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474880.736347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH8-00057U-Jy; Tue, 10 Jan 2023 17:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474880.736347; Tue, 10 Jan 2023 17:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH8-00054T-C6; Tue, 10 Jan 2023 17:19:02 +0000
Received: by outflank-mailman (input) for mailman id 474880;
 Tue, 10 Jan 2023 17:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFIH5-0003S0-QM
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 17:18:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc27791f-910a-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 18:18:56 +0100 (CET)
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
X-Inumbo-ID: dc27791f-910a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673371136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nq9rxCSKOSFBwm6aWpKwYZFwQDRPg+/dlW9R5ZTrDnU=;
  b=f3zU8CdTxfe1VDbWjgv1M/n1ISXt4fe0NTFDgM9gE5MStm3U/n75NAwu
   uYYujmpeJKHSQpshSWyrRt1PFYzxKFj0CRZdUlsoOzJf6dIdqm8OWsFlP
   ydJwQF+39MnP+dkfs3U7e+cqLulfWC5VDhEYVDmJ9QZMTzzcqMc3hUDBc
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90908188
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:58OJS6qHUup8gnBYIg57y4Gp9bdeBmIxZRIvgKrLsJaIsI4StFCzt
 garIBmHOK2LNjDxc4wkYNm2oB8Dv8CGzYIxTAc5/HsxES4Qp5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHziFNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADoqVkCypc3s+72Ed7FGqdocF9S0EapK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw9
 zqXpzSgUkFy2Nq3kDmB0H+jmLD2hirZBN09C562yuJRjwjGroAUIEJPDgbqyRWjsWahX/pPJ
 kpS/TAhxYAx+VKqSJ/hXhS+iH+CohMYHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRNmrCITXOW9p+PsCi/fyMSKAc/iTQsFFVfpYO5+cdq00yJHo0L/LOJYsPdExbIk
 wGog3IFiIou1eQkyZqA4A/qqmf5znTWdTId6gLSV2Ojywp2Yo+5eoClgWTmAeZ8wJWxFQfY4
 iVd8ySKxKVXVMzWynTRKAkYNOvxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOxFCHxBUOUS9jrYyjP8UQHPYqNaxwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChFUv43nWLpGrpEi9fHIxzSI0uJHfgXKDz+j9KjiIO9E+9ZYDNikMhlhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidBAG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X3iGbeFTbNy09M9sCn/9X9BoGAMDlBn7ws1BLXGplxPl3m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:ZLPzHar/LmCAuSlV/CUVsGkaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="90908188"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Date: Tue, 10 Jan 2023 17:18:42 +0000
Message-ID: <20230110171845.20542-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230110171845.20542-1-andrew.cooper3@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Under PKS, MSR_PKRS is available and based on the CPUID policy alone, and
usable independently of CR4.PKS.  See the large comment in prot-key.h for
details of the context switching arrangement.

Use WRMSRNS right away, as we don't care about serialsing properties for
context switching this MSR.

Sanitise MSR_PKRS on boot.  In anticipation of wanting to use PKS for Xen in
the future, arrange for the sanitisation to occur prior to potentially setting
CR4.PKS; if PKEY0.{AD,WD} leak in from a previous context, we will triple
fault immediately on setting CR4.PKS.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Kevin Tian <kevin.tian@intel.com>

v2:
 * Use WRMSRNS
 * Sanitise MSR_PKS on boot.
---
 xen/arch/x86/cpu/common.c           |  2 ++
 xen/arch/x86/hvm/vmx/vmx.c          |  9 +++++++
 xen/arch/x86/include/asm/msr.h      |  9 +++++++
 xen/arch/x86/include/asm/prot-key.h | 54 +++++++++++++++++++++++++++++++++++++
 xen/arch/x86/setup.c                |  4 +++
 xen/arch/x86/smpboot.c              |  4 +++
 6 files changed, 82 insertions(+)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 2bcdd08b2fb5..f44c907e8a43 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -58,6 +58,8 @@ static unsigned int forced_caps[NCAPINTS];
 
 DEFINE_PER_CPU(bool, full_gdt_loaded);
 
+DEFINE_PER_CPU(uint32_t, pkrs);
+
 void __init setup_clear_cpu_cap(unsigned int cap)
 {
 	const uint32_t *dfs;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 43a4865d1c76..b1f493f009fd 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -58,6 +58,7 @@
 #include <asm/event.h>
 #include <asm/mce.h>
 #include <asm/monitor.h>
+#include <asm/prot-key.h>
 #include <public/arch-x86/cpuid.h>
 
 static bool_t __initdata opt_force_ept;
@@ -536,6 +537,7 @@ static void vmx_restore_host_msrs(void)
 
 static void vmx_save_guest_msrs(struct vcpu *v)
 {
+    const struct cpuid_policy *cp = v->domain->arch.cpuid;
     struct vcpu_msrs *msrs = v->arch.msrs;
 
     /*
@@ -549,10 +551,14 @@ static void vmx_save_guest_msrs(struct vcpu *v)
         rdmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
         rdmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
     }
+
+    if ( cp->feat.pks )
+        msrs->pkrs = rdpkrs_and_cache();
 }
 
 static void vmx_restore_guest_msrs(struct vcpu *v)
 {
+    const struct cpuid_policy *cp = v->domain->arch.cpuid;
     const struct vcpu_msrs *msrs = v->arch.msrs;
 
     write_gs_shadow(v->arch.hvm.vmx.shadow_gs);
@@ -569,6 +575,9 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
         wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
         wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
     }
+
+    if ( cp->feat.pks )
+        wrpkrs(msrs->pkrs);
 }
 
 void vmx_update_cpu_exec_control(struct vcpu *v)
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 191e54068856..7946b6b24c11 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -373,6 +373,15 @@ struct vcpu_msrs
         };
     } rtit;
 
+    /*
+     * 0x000006e1 - MSR_PKRS - Protection Key Supervisor.
+     *
+     * Exposed R/W to guests.  Xen doesn't use PKS yet, so only context
+     * switched per vcpu.  When in current context, live value is in hardware,
+     * and this value is stale.
+     */
+    uint32_t pkrs;
+
     /* 0x00000da0 - MSR_IA32_XSS */
     struct {
         uint64_t raw;
diff --git a/xen/arch/x86/include/asm/prot-key.h b/xen/arch/x86/include/asm/prot-key.h
index 63a2e22f3fa0..0dcd31b7ea68 100644
--- a/xen/arch/x86/include/asm/prot-key.h
+++ b/xen/arch/x86/include/asm/prot-key.h
@@ -5,8 +5,11 @@
 #ifndef ASM_PROT_KEY_H
 #define ASM_PROT_KEY_H
 
+#include <xen/percpu.h>
 #include <xen/types.h>
 
+#include <asm/msr.h>
+
 #define PKEY_AD 1 /* Access Disable */
 #define PKEY_WD 2 /* Write Disable */
 
@@ -28,4 +31,55 @@ static inline void wrpkru(uint32_t pkru)
                    :: "a" (pkru), "d" (0), "c" (0) );
 }
 
+/*
+ * Xen does not use PKS.
+ *
+ * Guest kernel use is expected to be one default key, except for tiny windows
+ * with a double write to switch to a non-default key in a permitted critical
+ * section.
+ *
+ * As such, we want MSR_PKRS un-intercepted.  Furthermore, as we only need it
+ * in Xen for emulation or migration purposes (i.e. possibly never in a
+ * domain's lifetime), we don't want to re-sync the hardware value on every
+ * vmexit.
+ *
+ * Therefore, we read and cache the guest value in ctxt_switch_from(), in the
+ * expectation that we can short-circuit the write in ctxt_switch_to().
+ * During regular operations in current context, the guest value is in
+ * hardware and the per-cpu cache is stale.
+ */
+DECLARE_PER_CPU(uint32_t, pkrs);
+
+static inline uint32_t rdpkrs(void)
+{
+    uint32_t pkrs, tmp;
+
+    rdmsr(MSR_PKRS, pkrs, tmp);
+
+    return pkrs;
+}
+
+static inline uint32_t rdpkrs_and_cache(void)
+{
+    return this_cpu(pkrs) = rdpkrs();
+}
+
+static inline void wrpkrs(uint32_t pkrs)
+{
+    uint32_t *this_pkrs = &this_cpu(pkrs);
+
+    if ( *this_pkrs != pkrs )
+    {
+        *this_pkrs = pkrs;
+
+        wrmsr_ns(MSR_PKRS, pkrs, 0);
+    }
+}
+
+static inline void wrpkrs_and_cache(uint32_t pkrs)
+{
+    this_cpu(pkrs) = pkrs;
+    wrmsr_ns(MSR_PKRS, pkrs, 0);
+}
+
 #endif /* ASM_PROT_KEY_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6deadcf74763..567a0a42ac50 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -54,6 +54,7 @@
 #include <asm/spec_ctrl.h>
 #include <asm/guest.h>
 #include <asm/microcode.h>
+#include <asm/prot-key.h>
 #include <asm/pv/domain.h>
 
 /* opt_nosmp: If true, secondary processors are ignored. */
@@ -1804,6 +1805,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     if ( opt_invpcid && cpu_has_invpcid )
         use_invpcid = true;
 
+    if ( cpu_has_pks )
+        wrpkrs_and_cache(0); /* Must be before setting CR4.PKS */
+
     init_speculation_mitigations();
 
     init_idle_domain();
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 52beed9d8d6d..b26758c2c89f 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -42,6 +42,7 @@
 #include <asm/microcode.h>
 #include <asm/msr.h>
 #include <asm/mtrr.h>
+#include <asm/prot-key.h>
 #include <asm/setup.h>
 #include <asm/spec_ctrl.h>
 #include <asm/time.h>
@@ -364,6 +365,9 @@ void start_secondary(void *unused)
 
     /* Full exception support from here on in. */
 
+    if ( cpu_has_pks )
+        wrpkrs_and_cache(0); /* Must be before setting CR4.PKS */
+
     /* Safe to enable feature such as CR4.MCE with the IDT set up now. */
     write_cr4(mmu_cr4_features);
 
-- 
2.11.0



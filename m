Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA968476E5B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 10:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247797.427342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTN-00065Y-Lp; Thu, 16 Dec 2021 09:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247797.427342; Thu, 16 Dec 2021 09:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTN-00062k-Fr; Thu, 16 Dec 2021 09:54:49 +0000
Received: by outflank-mailman (input) for mailman id 247797;
 Thu, 16 Dec 2021 09:54:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCpR=RB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxnTJ-0004jJ-PA
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 09:54:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31040c06-5e56-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 10:54:44 +0100 (CET)
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
X-Inumbo-ID: 31040c06-5e56-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639648483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v9bw6OTYe4GMK9r+ci/619JzYrUtHb0Orn0SUhf+1FU=;
  b=MridvwzDq9A4Syj+4pxI06L4DOjmlPSaDXdeUJWlwha2gVYYUcuOrTu2
   8ZNraDKSKXAmUUu3hxWEGNgY4IZJAYWihmuYuG6dpfzHO9GrDystvnYwy
   wbi1OpRbYlXnhZMyf7m0Vnn65HTIZUbzdMAOd+z4T9nFACtrN5Sua6Y8u
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: C4+7FJeYr4zePLeQRlSaazB/lvsCFpm+foHbA2xrM+AIlHCh1mUUbEx0AN9MxdsD7bVMQEgSnt
 x6831LE3SJtYJmoxXmmoiYG2koTMGKtku+o88WXt/FGS9kiGZsdLeE1LKFnk9KgrVJaO0uRxy6
 0IMLQpLDcKi2pj03rhr+0Fd44S/SFfLBIObo+cVdVR1635qX7576hW4kpWSOyO+nD+yyrMcCdz
 SZWk8z/qzex2eAu0EMbBFU5/uH+C8gof15WtAS+DujlEKHJSr1m7aLMXrjMX8o+Bh2zEpIvUVD
 EPaf+baT0JiMaBlxGnsWl9P0
X-SBRS: 5.1
X-MesageID: 62240014
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MpXo06kaIxkJOppWx7QvUBLo5gxaIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaDWuPPPfeajPxfo9yOt7n9h9Sv5OGzoBnTQNl+Co2ESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbdg2Nc22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NJH9puIY1lyBJP3od5adhpELBpGB5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6yEO
 5JBMGYHgBLoR0JhZ30GAq8Hv8DxtHXUfDtolgiQqv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z6Dw8bMpqDyDOD2nOqmuLL2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIMh6Uv8E2gTvHmQga15nWDu3Yht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIOs8V1QgQAi
 ASzoejQP3tKs6Gqckqnz+LBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Qmf22rEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUcHleM+lGrxl8FSVCxCtame0bblHRcZJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEsMt/gUJt6kPK4TrwJs8w4iPIUOPCdkyfdo0lTibO4hTixwCDAb4lhU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI6Qjx8UKGInut6E2Gn9owM/tr1E
 riGchcw4DLCabfvcm1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:lTYAJq6hEAuCDw6D0gPXwPLXdLJyesId70hD6qhwISY1TiX+rb
 HXoB17726MtN9/YgBCpTntAsa9qDbnhPpICOoqTNGftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkENDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="62240014"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH 3/6] x86/hvm: Context switch MSR_PKRS
Date: Thu, 16 Dec 2021 09:54:18 +0000
Message-ID: <20211216095421.12871-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211216095421.12871-1-andrew.cooper3@citrix.com>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Under PKS, MSR_PKRS is available and based on the CPUID policy alone, and
usable independently of CR4.PKS.  See the large comment in prot-key.h for
details of the context switching arrangement.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Kevin Tian <kevin.tian@intel.com>

At a guess, we're likely to see PKS on AMD eventually, hence not putting the
DEFINE_PER_CPU() in vmx.c, but I'm at a total loss to find anywhere better to
put it than hvm.c.  Suggestions welcome.
---
 xen/arch/x86/hvm/hvm.c              |  3 +++
 xen/arch/x86/hvm/vmx/vmx.c          |  9 +++++++
 xen/arch/x86/include/asm/msr.h      |  8 +++++++
 xen/arch/x86/include/asm/prot-key.h | 48 +++++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 350dc396e37c..63eaa3c5a66b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -69,6 +69,7 @@
 #include <asm/hvm/vm_event.h>
 #include <asm/altp2m.h>
 #include <asm/mtrr.h>
+#include <asm/prot-key.h>
 #include <asm/apic.h>
 #include <asm/vm_event.h>
 #include <public/sched.h>
@@ -117,6 +118,8 @@ static const char __initconst warning_hvm_fep[] =
 static bool_t __initdata opt_altp2m_enabled = 0;
 boolean_param("altp2m", opt_altp2m_enabled);
 
+DEFINE_PER_CPU(uint32_t, pkrs);
+
 static int cpu_callback(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a7a0d662342a..2e6af1e1c033 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -58,6 +58,7 @@
 #include <asm/event.h>
 #include <asm/mce.h>
 #include <asm/monitor.h>
+#include <asm/prot-key.h>
 #include <public/arch-x86/cpuid.h>
 
 static bool_t __initdata opt_force_ept;
@@ -525,6 +526,7 @@ static void vmx_restore_host_msrs(void)
 
 static void vmx_save_guest_msrs(struct vcpu *v)
 {
+    const struct cpuid_policy *cp = v->domain->arch.cpuid;
     struct vcpu_msrs *msrs = v->arch.msrs;
 
     /*
@@ -538,10 +540,14 @@ static void vmx_save_guest_msrs(struct vcpu *v)
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
@@ -558,6 +564,9 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
         wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
         wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
     }
+
+    if ( cp->feat.pks )
+        wrpkrs(msrs->pkrs);
 }
 
 void vmx_update_cpu_exec_control(struct vcpu *v)
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 1d3eca9063a2..2ee0b68100c9 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -338,6 +338,14 @@ struct vcpu_msrs
         };
     } rtit;
 
+    /*
+     * 0x000006e1 - MSR_PKRS - Protection Key Supervisor.
+     *
+     * Exposed R/W to guests.  Xen doesn't use PKS yet, so only context
+     * switched per vcpu.  When in current context, live value is in hardware.
+     */
+    uint32_t pkrs;
+
     /* 0x00000da0 - MSR_IA32_XSS */
     struct {
         uint64_t raw;
diff --git a/xen/arch/x86/include/asm/prot-key.h b/xen/arch/x86/include/asm/prot-key.h
index 084b248d81a5..4387c27b7ec5 100644
--- a/xen/arch/x86/include/asm/prot-key.h
+++ b/xen/arch/x86/include/asm/prot-key.h
@@ -19,8 +19,11 @@
 #ifndef ASM_PROT_KEY_H
 #define ASM_PROT_KEY_H
 
+#include <xen/percpu.h>
 #include <xen/types.h>
 
+#include <asm/msr.h>
+
 #define PKEY_AD 1 /* Access Disable */
 #define PKEY_WD 2 /* Write Disable */
 
@@ -42,4 +45,49 @@ static inline void wrpkru(uint32_t pkru)
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
+        wrmsr(MSR_PKRS, pkrs, 0);
+    }
+}
+
 #endif /* ASM_PROT_KEY_H */
-- 
2.11.0



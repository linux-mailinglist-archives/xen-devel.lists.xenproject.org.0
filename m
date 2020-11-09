Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000542AC28F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 18:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22776.49193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcB7w-0006lq-58; Mon, 09 Nov 2020 17:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22776.49193; Mon, 09 Nov 2020 17:38:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcB7w-0006lR-1X; Mon, 09 Nov 2020 17:38:48 +0000
Received: by outflank-mailman (input) for mailman id 22776;
 Mon, 09 Nov 2020 17:38:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NS2=EP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kcB7u-0006lM-5s
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 17:38:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe5324bc-429e-413a-8850-5a522ac91c23;
 Mon, 09 Nov 2020 17:38:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2NS2=EP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kcB7u-0006lM-5s
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 17:38:46 +0000
X-Inumbo-ID: fe5324bc-429e-413a-8850-5a522ac91c23
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fe5324bc-429e-413a-8850-5a522ac91c23;
	Mon, 09 Nov 2020 17:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604943525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xi+YP2gii5z/qrVuc/xwb4NhqKRSsN0i+5+j9bZiYH4=;
  b=g3gr0F2/G0gvNU4JiJpLR6L8U568W/Bmu7uuUgk3cdEQzvHf6aP7nNlA
   U9LeN8T3PM+M0HNWKcX94OYiHHDMzyEqI5zBO1IqDYoJ+AcCS7qLpbpRv
   87IBQk1JM3sPLuAk7P1udFG7Nocr8zLi9aKRpPJOkbPBVtRS3sAqn7mkZ
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4Oz/y88grkHPEUvsMUtbkrMf/0c9qbhY5dNSvopmyQh50I3iPcfbl/lwoLSHd/vXTOvnFBWHpN
 IBBBbxFLyIDVGTuVVhKSHckX4KKaiOI+Qlrw8v8IVS7cfbXWT/apuIaImIlbTzUh2/AZjDv9i/
 mLZdoxqUuke8IQmweMxYYuuVFzl+gVdbSaVjKUX8Oh9HQpnAxwCZsRYp+vQ/DL7h+bplwCfiAy
 KxkJIxD2bMvfdqwokkFgO1AhofyvelwJM6CL9xi8fqGea4DoV4PZvU5DxvCZ0dTJcR5r/Ak3M3
 1+U=
X-SBRS: None
X-MesageID: 30781346
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,463,1596513600"; 
   d="scan'208";a="30781346"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
Date: Mon, 9 Nov 2020 17:38:19 +0000
Message-ID: <20201109173819.7817-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

Currently a PV hardware domain can also be given control over the CPU
frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.
However since commit 322ec7c89f6 the default behavior has been changed
to reject accesses to not explicitly handled MSRs, preventing PV
guests that manage CPU frequency from reading
MSR_IA32_PERF_{STATUS/CTL}.

Additionally some HVM guests (Windows at least) will attempt to read
MSR_IA32_PERF_CTL and will panic if given back a #GP fault:

  vmx.c:3035:d8v0 RDMSR 0x00000199 unimplemented
  d8v0 VIRIDIAN CRASH: 3b c0000096 fffff806871c1651 ffffda0253683720 0

Move the handling of MSR_IA32_PERF_{STATUS/CTL} to the common MSR
handling shared between HVM and PV guests, and add an explicit case
for reads to MSR_IA32_PERF_{STATUS/CTL}.

Restore previous behavior and allow PV guests with the required
permissions to read the contents of the mentioned MSRs. Non privileged
guests will get 0 when trying to read those registers, as writes to
MSR_IA32_PERF_CTL by such guest will already be silently dropped.

Fixes: 322ec7c89f6 ('x86/pv: disallow access to unknown MSRs')
Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * fix is_cpufreq_controller() to exclude PVH dom0, and collapse to nothing in
   !CONFIG_PV builds
 * Drop the cross-vendor checks.  It isn't possible to configure dom0 as
   cross-vendor, and anyone using is_cpufreq_controller() without an exact
   model match has far bigger problems.
 * At least Centaur implements these MSRs.  Add access.
---
 xen/arch/x86/msr.c             | 34 ++++++++++++++++++++++++++++++++++
 xen/arch/x86/pv/emul-priv-op.c | 14 --------------
 xen/include/xen/sched.h        | 17 +++++++++++++++++
 3 files changed, 51 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 9c69ef8792..0a8ae4d22c 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -242,6 +242,25 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
             goto gp_fault;
         break;
 
+        /*
+         * These MSRs are not enumerated in CPUID.  They have been around
+         * since the Pentium 4, and implemented by other vendors.
+         *
+         * Some versions of Windows try reading these before setting up a #GP
+         * handler, and Linux has several unguarded reads as well.  Provide
+         * RAZ semantics, in general, but permit a cpufreq controller dom0 to
+         * have full access.
+         */
+    case MSR_IA32_PERF_STATUS:
+    case MSR_IA32_PERF_CTL:
+        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
+            goto gp_fault;
+
+        *val = 0;
+        if ( likely(!is_cpufreq_controller(d)) || rdmsr_safe(msr, *val) == 0 )
+            break;
+        goto gp_fault;
+
     case MSR_IA32_THERM_STATUS:
         if ( cp->x86_vendor != X86_VENDOR_INTEL )
             goto gp_fault;
@@ -448,6 +467,21 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             goto gp_fault;
         break;
 
+        /*
+         * This MSR are not enumerated in CPUID.  It has been around since the
+         * Pentium 4, and implemented by other vendors.
+         *
+         * To match the RAZ semantics, implement as write-discard, except for
+         * a cpufreq controller dom0 which has full access.
+         */
+    case MSR_IA32_PERF_CTL:
+        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
+            goto gp_fault;
+
+        if ( likely(!is_cpufreq_controller(d)) || wrmsr_safe(msr, val) == 0 )
+            break;
+        goto gp_fault;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 7cc16d6eda..dbceed8a05 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -849,12 +849,6 @@ static inline uint64_t guest_misc_enable(uint64_t val)
     return val;
 }
 
-static inline bool is_cpufreq_controller(const struct domain *d)
-{
-    return ((cpufreq_controller == FREQCTL_dom0_kernel) &&
-            is_hardware_domain(d));
-}
-
 static uint64_t guest_efer(const struct domain *d)
 {
     uint64_t val;
@@ -1121,14 +1115,6 @@ static int write_msr(unsigned int reg, uint64_t val,
             return X86EMUL_OKAY;
         break;
 
-    case MSR_IA32_PERF_CTL:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
-            break;
-        if ( likely(!is_cpufreq_controller(currd)) ||
-             wrmsr_safe(reg, val) == 0 )
-            return X86EMUL_OKAY;
-        break;
-
     case MSR_IA32_THERM_CONTROL:
     case MSR_IA32_ENERGY_PERF_BIAS:
         if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL )
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index d8ed83f869..b4d3e53310 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1069,6 +1069,23 @@ extern enum cpufreq_controller {
     FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
 } cpufreq_controller;
 
+static always_inline bool is_cpufreq_controller(const struct domain *d)
+{
+    /*
+     * A PV dom0 can be nominated as the cpufreq controller, instead of using
+     * Xen's cpufreq driver, at which point dom0 gets direct access to certain
+     * MSRs.
+     *
+     * This interface only works when dom0 is identity pinned and has the same
+     * number of vCPUs as pCPUs on the system.
+     *
+     * It would be far better to paravirtualise the interface.
+     */
+    return (IS_ENABLED(CONFIG_PV) &&
+            (cpufreq_controller == FREQCTL_dom0_kernel) &&
+            is_pv_domain(d) && is_hardware_domain(d));
+}
+
 int cpupool_move_domain(struct domain *d, struct cpupool *c);
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
 int cpupool_get_id(const struct domain *d);
-- 
2.11.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACC1284FCE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Oct 2020 18:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3283.9511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPpnO-0003Co-GS; Tue, 06 Oct 2020 16:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3283.9511; Tue, 06 Oct 2020 16:26:34 +0000
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
	id 1kPpnO-0003CP-D0; Tue, 06 Oct 2020 16:26:34 +0000
Received: by outflank-mailman (input) for mailman id 3283;
 Tue, 06 Oct 2020 16:26:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZSAu=DN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kPpnM-0003CK-49
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 16:26:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e313a6df-be03-4653-a797-cec8643e2d98;
 Tue, 06 Oct 2020 16:26:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZSAu=DN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kPpnM-0003CK-49
	for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 16:26:32 +0000
X-Inumbo-ID: e313a6df-be03-4653-a797-cec8643e2d98
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e313a6df-be03-4653-a797-cec8643e2d98;
	Tue, 06 Oct 2020 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602001588;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+MnaDUf14ywwIvsahBfXD3XH69/cHlmD0ijO1Ty9M3I=;
  b=VKxBn0HyvwYxAfFAelhslHDezLz7IZFO8PBBKfY2v4Dmd/VxBduyeEVc
   KL0M2Kp00HrmR4j2Mv+CbiI5HgxB69aWCJnUpi5G7ZM2MgZ7Qxs+27Chm
   GL8MNpLjtJQreMhii3J9A+CnufrGKSFhrf4ArRxcgbaTzE9Ue0uezgmje
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JYjHCyOE/FjAz3rFkiEHHlkloO1nD65ta8NIAFQyPxoHeebi8JpJr/V5yq10MwT42oobtljxAa
 QIm1HiH4ad+BFydxzkgZj1ZcyAc/WER/4MTKtUdZe7g0/o+gBWFO36uNwFTKgRecoNQhqg5Ocf
 LUY2Q7JH8KrNkt1d1DwHFUIBKjfAw+Ts02UQttyZ+BRGfkxC1WnzjM+lORRxnZtnE8SaFwWnt+
 7QEyYpxYTZf42f9Cp4mgAXNMWE39KOweYAAT8Kl9cohRuo3gDxI5NghgeI4UDLbkHSCGaZQu3F
 SKY=
X-SBRS: None
X-MesageID: 28409371
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,343,1596513600"; 
   d="scan'208";a="28409371"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
Date: Tue, 6 Oct 2020 18:23:27 +0200
Message-ID: <20201006162327.93055-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

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
---
 xen/arch/x86/msr.c             | 20 ++++++++++++++++++++
 xen/arch/x86/pv/emul-priv-op.c | 14 --------------
 xen/include/xen/sched.h        |  6 ++++++
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 81b34fb212..e4c4fa6127 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -242,6 +242,17 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
             goto gp_fault;
         break;
 
+    case MSR_IA32_PERF_STATUS:
+    case MSR_IA32_PERF_CTL:
+        if ( cp->x86_vendor != X86_VENDOR_INTEL )
+            goto gp_fault;
+        *val = 0;
+        if ( likely(!is_cpufreq_controller(d)) ||
+             boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+             rdmsr_safe(msr, *val) == 0 )
+            break;
+        goto gp_fault;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
@@ -442,6 +453,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             goto gp_fault;
         break;
 
+    case MSR_IA32_PERF_CTL:
+        if ( cp->x86_vendor != X86_VENDOR_INTEL )
+            goto gp_fault;
+        if ( likely(!is_cpufreq_controller(d)) ||
+             boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+             wrmsr_safe(msr, val) == 0 )
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
index d8ed83f869..41baa3b7a1 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1069,6 +1069,12 @@ extern enum cpufreq_controller {
     FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
 } cpufreq_controller;
 
+static inline bool is_cpufreq_controller(const struct domain *d)
+{
+    return ((cpufreq_controller == FREQCTL_dom0_kernel) &&
+            is_hardware_domain(d));
+}
+
 int cpupool_move_domain(struct domain *d, struct cpupool *c);
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
 int cpupool_get_id(const struct domain *d);
-- 
2.28.0



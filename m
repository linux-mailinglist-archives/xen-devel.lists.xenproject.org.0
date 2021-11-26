Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846D645EEB2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232838.403968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawz-0003IY-9U; Fri, 26 Nov 2021 13:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232838.403968; Fri, 26 Nov 2021 13:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawy-0002rv-A6; Fri, 26 Nov 2021 13:07:36 +0000
Received: by outflank-mailman (input) for mailman id 232838;
 Fri, 26 Nov 2021 13:07:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauZ-0003W9-UN
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7872a09d-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:05 +0100 (CET)
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
X-Inumbo-ID: 7872a09d-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ndytZ7gB54U/vWJSnFX0QALHgIGbo3Y13sh++2zkJpQ=;
  b=cSma2VuquqPHfWDUy5W4n7/xnwOVpc/nDFOk+Djvlhw4iDgqr4npkmOu
   5RaVDEYGtTXkH3sCKSLnyeDhchp8UlVhj5+n3NHAz7h0BP814wZVOK5Qn
   HVg7X9VyJXimtb2yMnz+AmMosK2LPMHFv31vSvhj9S24GvFnil6eEvFlP
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HiosesprsiVx5lIiXoEOUIsyCv4arXWswZpFIaqMvjRtGBjMDeN5IMZcfcfReQ9QyWXTXY2pnI
 JZJHbk+UaZC9qjwGYWnrhUgWpQrU0dVFZunMtriVsRSQiz/5DZs75/ghVj1ew8uJGeFs4pJloh
 OSpb+EaHISUsR3dv9A6XfCePACgm6vyL2lBeGKkv8kc8zftOjMG0Q6bcPAnr61weuDGOn5i4FE
 BDMU5lNWgr4ZxpWs6BZ19OuVgPH4fm9AYnmZzpxVveewKSfH65l2LE5VTsT1XvMgFL9p41WpD/
 q2ECgkQv6jt+BX/LkKKINONE
X-SBRS: 5.1
X-MesageID: 58695952
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:b5BszqtN3lXiCMI2BkEYbHvjHefnVJtZMUV32f8akzHdYApBsoF/q
 tZmKW7QPvmLNDPzKIskOtzl80hTusTRzoNiSVM/rS1gHi1B+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljN+1UFx0Op33vu1NaAVfAjBMfolKweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5RINGsyNnwsZTVGNXYKV8ovod6nn1jCLRB5in+Yoo84tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO9R57RjWl67k2CCQVlMYSS9QWp8CuPZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSEhRqjBNzAJrVkg
 JTis5PFhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlUJ2K2M
 RON5Vg5CHpv0J2CNvQfj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9YNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:BtwGnaF2Zh2Bj/dnpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58695952"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 38/65] x86/hvmsave: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:19 +0000
Message-ID: <20211126123446.32324-39-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/mcheck/vmce.c       |  4 ++--
 xen/arch/x86/emul-i8254.c            |  4 ++--
 xen/arch/x86/hvm/hpet.c              |  4 ++--
 xen/arch/x86/hvm/hvm.c               | 18 ++++++++++--------
 xen/arch/x86/hvm/irq.c               | 12 ++++++------
 xen/arch/x86/hvm/mtrr.c              |  4 ++--
 xen/arch/x86/hvm/pmtimer.c           |  4 ++--
 xen/arch/x86/hvm/rtc.c               |  4 ++--
 xen/arch/x86/hvm/vioapic.c           |  4 ++--
 xen/arch/x86/hvm/viridian/viridian.c | 15 ++++++++-------
 xen/arch/x86/hvm/vlapic.c            |  8 ++++----
 xen/arch/x86/hvm/vpic.c              |  4 ++--
 12 files changed, 44 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index eb6434a3ba20..458120f9ad8d 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -353,7 +353,7 @@ int vmce_wrmsr(uint32_t msr, uint64_t val)
 }
 
 #if CONFIG_HVM
-static int vmce_save_vcpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check vmce_save_vcpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct hvm_vmce_vcpu ctxt = {
         .caps = v->arch.vmce.mcg_cap,
@@ -365,7 +365,7 @@ static int vmce_save_vcpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     return hvm_save_entry(VMCE_VCPU, v->vcpu_id, h, &ctxt);
 }
 
-static int vmce_load_vcpu_ctxt(struct domain *d, hvm_domain_context_t *h)
+static int cf_check vmce_load_vcpu_ctxt(struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 0e09a173187f..d170f464d966 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -391,7 +391,7 @@ void pit_stop_channel0_irq(PITState *pit)
     spin_unlock(&pit->lock);
 }
 
-static int pit_save(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check pit_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct domain *d = v->domain;
     PITState *pit = domain_vpit(d);
@@ -409,7 +409,7 @@ static int pit_save(struct vcpu *v, hvm_domain_context_t *h)
     return rc;
 }
 
-static int pit_load(struct domain *d, hvm_domain_context_t *h)
+static int cf_check pit_load(struct domain *d, hvm_domain_context_t *h)
 {
     PITState *pit = domain_vpit(d);
     int i, rc = 0;
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index 7bdb51cfa1c4..ed512fa65b63 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -582,7 +582,7 @@ static const struct hvm_mmio_ops hpet_mmio_ops = {
 };
 
 
-static int hpet_save(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check hpet_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d = v->domain;
     HPETState *hp = domain_vhpet(d);
@@ -645,7 +645,7 @@ static int hpet_save(struct vcpu *v, hvm_domain_context_t *h)
     return rc;
 }
 
-static int hpet_load(struct domain *d, hvm_domain_context_t *h)
+static int cf_check hpet_load(struct domain *d, hvm_domain_context_t *h)
 {
     HPETState *hp = domain_vhpet(d);
     struct hvm_hw_hpet *rec;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index fdc0b86bf091..d5ca7a1ce636 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -789,7 +789,7 @@ void hvm_domain_destroy(struct domain *d)
     destroy_vpci_mmcfg(d);
 }
 
-static int hvm_save_tsc_adjust(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check hvm_save_tsc_adjust(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct hvm_tsc_adjust ctxt = {
         .tsc_adjust = v->arch.hvm.msr_tsc_adjust,
@@ -798,7 +798,7 @@ static int hvm_save_tsc_adjust(struct vcpu *v, hvm_domain_context_t *h)
     return hvm_save_entry(TSC_ADJUST, v->vcpu_id, h, &ctxt);
 }
 
-static int hvm_load_tsc_adjust(struct domain *d, hvm_domain_context_t *h)
+static int cf_check hvm_load_tsc_adjust(struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
@@ -821,7 +821,7 @@ static int hvm_load_tsc_adjust(struct domain *d, hvm_domain_context_t *h)
 HVM_REGISTER_SAVE_RESTORE(TSC_ADJUST, hvm_save_tsc_adjust,
                           hvm_load_tsc_adjust, 1, HVMSR_PER_VCPU);
 
-static int hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct segment_register seg;
     struct hvm_hw_cpu ctxt = {
@@ -1004,7 +1004,7 @@ unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
             (cet              ? X86_CR4_CET               : 0));
 }
 
-static int hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
+static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
@@ -1205,7 +1205,8 @@ HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, hvm_load_cpu_ctxt, 1,
                                            save_area) + \
                                   xstate_ctxt_size(xcr0))
 
-static int hvm_save_cpu_xsave_states(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check hvm_save_cpu_xsave_states(
+    struct vcpu *v, hvm_domain_context_t *h)
 {
     struct hvm_hw_cpu_xsave *ctxt;
     unsigned int size = HVM_CPU_XSAVE_SIZE(v->arch.xcr0_accum);
@@ -1243,7 +1244,8 @@ CHECK_FIELD_(struct, xsave_hdr, reserved);
 #undef compat_xsave_hdr
 #undef xen_xsave_hdr
 
-static int hvm_load_cpu_xsave_states(struct domain *d, hvm_domain_context_t *h)
+static int cf_check hvm_load_cpu_xsave_states(
+    struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid, size;
     int err;
@@ -1371,7 +1373,7 @@ static const uint32_t msrs_to_send[] = {
     MSR_AMD64_DR3_ADDRESS_MASK,
 };
 
-static int hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct hvm_save_descriptor *desc = _p(&h->data[h->cur]);
     struct hvm_msr *ctxt;
@@ -1430,7 +1432,7 @@ static int hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
     return 0;
 }
 
-static int hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
+static int cf_check hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int i, vcpuid = hvm_load_instance(h);
     struct vcpu *v;
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index a7f8991a7b84..5a7f39b54ff4 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -657,7 +657,7 @@ static int __init cf_check dump_irq_info_key_init(void)
 }
 __initcall(dump_irq_info_key_init);
 
-static int irq_save_pci(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check irq_save_pci(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct domain *d = v->domain;
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
@@ -690,7 +690,7 @@ static int irq_save_pci(struct vcpu *v, hvm_domain_context_t *h)
     return rc;
 }
 
-static int irq_save_isa(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check irq_save_isa(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d = v->domain;
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
@@ -699,7 +699,7 @@ static int irq_save_isa(struct vcpu *v, hvm_domain_context_t *h)
     return hvm_save_entry(ISA_IRQ, 0, h, &hvm_irq->isa_irq);
 }
 
-static int irq_save_link(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check irq_save_link(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d = v->domain;
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
@@ -708,7 +708,7 @@ static int irq_save_link(struct vcpu *v, hvm_domain_context_t *h)
     return hvm_save_entry(PCI_LINK, 0, h, &hvm_irq->pci_link);
 }
 
-static int irq_load_pci(struct domain *d, hvm_domain_context_t *h)
+static int cf_check irq_load_pci(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
     int link, dev, intx, gsi;
@@ -741,7 +741,7 @@ static int irq_load_pci(struct domain *d, hvm_domain_context_t *h)
     return 0;
 }
 
-static int irq_load_isa(struct domain *d, hvm_domain_context_t *h)
+static int cf_check irq_load_isa(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
     int irq;
@@ -760,7 +760,7 @@ static int irq_load_isa(struct domain *d, hvm_domain_context_t *h)
 }
 
 
-static int irq_load_link(struct domain *d, hvm_domain_context_t *h)
+static int cf_check irq_load_link(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
     int link, gsi;
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 42f3d8319296..4d2aa6def86d 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -687,7 +687,7 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
     return 0;
 }
 
-static int hvm_save_mtrr_msr(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check hvm_save_mtrr_msr(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct mtrr_state *mtrr_state = &v->arch.hvm.mtrr;
     struct hvm_hw_mtrr hw_mtrr = {
@@ -725,7 +725,7 @@ static int hvm_save_mtrr_msr(struct vcpu *v, hvm_domain_context_t *h)
     return hvm_save_entry(MTRR, v->vcpu_id, h, &hw_mtrr);
 }
 
-static int hvm_load_mtrr_msr(struct domain *d, hvm_domain_context_t *h)
+static int cf_check hvm_load_mtrr_msr(struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid, i;
     struct vcpu *v;
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 60e3c8de4c6b..2a89bbdfa5b8 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -249,7 +249,7 @@ static int cf_check handle_pmt_io(
     return X86EMUL_OKAY;
 }
 
-static int acpi_save(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check acpi_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct domain *d = v->domain;
     struct hvm_hw_acpi *acpi = &d->arch.hvm.acpi;
@@ -281,7 +281,7 @@ static int acpi_save(struct vcpu *v, hvm_domain_context_t *h)
     return rc;
 }
 
-static int acpi_load(struct domain *d, hvm_domain_context_t *h)
+static int cf_check acpi_load(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_hw_acpi *acpi = &d->arch.hvm.acpi;
     PMTState *s = &d->arch.hvm.pl_time->vpmt;
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index bdc647e433e9..ed397276faa3 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -738,7 +738,7 @@ void rtc_migrate_timers(struct vcpu *v)
 }
 
 /* Save RTC hardware state */
-static int rtc_save(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check rtc_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d = v->domain;
     RTCState *s = domain_vrtc(d);
@@ -756,7 +756,7 @@ static int rtc_save(struct vcpu *v, hvm_domain_context_t *h)
 }
 
 /* Reload the hardware state from a saved domain */
-static int rtc_load(struct domain *d, hvm_domain_context_t *h)
+static int cf_check rtc_load(struct domain *d, hvm_domain_context_t *h)
 {
     RTCState *s = domain_vrtc(d);
 
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index b56549aa22d1..d5d5b02421e9 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -590,7 +590,7 @@ int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi)
     return vioapic->redirtbl[pin].fields.trig_mode;
 }
 
-static int ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d = v->domain;
     struct hvm_vioapic *s;
@@ -607,7 +607,7 @@ static int ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
     return hvm_save_entry(IOAPIC, 0, h, &s->domU);
 }
 
-static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
+static int cf_check ioapic_load(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_vioapic *s;
 
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index ad32b09725d5..69a3497709a8 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1125,8 +1125,8 @@ void viridian_unmap_guest_page(struct viridian_page *vp)
     put_page_and_type(page);
 }
 
-static int viridian_save_domain_ctxt(struct vcpu *v,
-                                     hvm_domain_context_t *h)
+static int cf_check viridian_save_domain_ctxt(
+    struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d = v->domain;
     const struct viridian_domain *vd = d->arch.hvm.viridian;
@@ -1144,8 +1144,8 @@ static int viridian_save_domain_ctxt(struct vcpu *v,
     return (hvm_save_entry(VIRIDIAN_DOMAIN, 0, h, &ctxt) != 0);
 }
 
-static int viridian_load_domain_ctxt(struct domain *d,
-                                     hvm_domain_context_t *h)
+static int cf_check viridian_load_domain_ctxt(
+    struct domain *d, hvm_domain_context_t *h)
 {
     struct viridian_domain *vd = d->arch.hvm.viridian;
     struct hvm_viridian_domain_context ctxt;
@@ -1165,7 +1165,8 @@ static int viridian_load_domain_ctxt(struct domain *d,
 HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_DOMAIN, viridian_save_domain_ctxt,
                           viridian_load_domain_ctxt, 1, HVMSR_PER_DOM);
 
-static int viridian_save_vcpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check viridian_save_vcpu_ctxt(
+    struct vcpu *v, hvm_domain_context_t *h)
 {
     struct hvm_viridian_vcpu_context ctxt = {};
 
@@ -1178,8 +1179,8 @@ static int viridian_save_vcpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     return hvm_save_entry(VIRIDIAN_VCPU, v->vcpu_id, h, &ctxt);
 }
 
-static int viridian_load_vcpu_ctxt(struct domain *d,
-                                   hvm_domain_context_t *h)
+static int cf_check viridian_load_vcpu_ctxt(
+    struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 652e3cb87f12..d4e29ef1ff1d 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1482,7 +1482,7 @@ static void lapic_rearm(struct vlapic *s)
     s->timer_last_update = s->pt.last_plt_gtime;
 }
 
-static int lapic_save_hidden(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check lapic_save_hidden(struct vcpu *v, hvm_domain_context_t *h)
 {
     if ( !has_vlapic(v->domain) )
         return 0;
@@ -1490,7 +1490,7 @@ static int lapic_save_hidden(struct vcpu *v, hvm_domain_context_t *h)
     return hvm_save_entry(LAPIC, v->vcpu_id, h, &vcpu_vlapic(v)->hw);
 }
 
-static int lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
 {
     if ( !has_vlapic(v->domain) )
         return 0;
@@ -1529,7 +1529,7 @@ static void lapic_load_fixup(struct vlapic *vlapic)
     }
 }
 
-static int lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
+static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
@@ -1563,7 +1563,7 @@ static int lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
     return 0;
 }
 
-static int lapic_load_regs(struct domain *d, hvm_domain_context_t *h)
+static int cf_check lapic_load_regs(struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 5d8ef259b710..b3cafaab8fad 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -400,7 +400,7 @@ static int cf_check vpic_intercept_elcr_io(
     return X86EMUL_OKAY;
 }
 
-static int vpic_save(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check vpic_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct domain *d = v->domain;
     struct hvm_hw_vpic *s;
@@ -420,7 +420,7 @@ static int vpic_save(struct vcpu *v, hvm_domain_context_t *h)
     return 0;
 }
 
-static int vpic_load(struct domain *d, hvm_domain_context_t *h)
+static int cf_check vpic_load(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_hw_vpic *s;
     unsigned int inst = hvm_load_instance(h);
-- 
2.11.0



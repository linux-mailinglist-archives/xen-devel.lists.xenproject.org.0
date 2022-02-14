Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9374F4B5157
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271913.466667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDK-00023g-Qn; Mon, 14 Feb 2022 13:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271913.466667; Mon, 14 Feb 2022 13:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDK-0001zy-NC; Mon, 14 Feb 2022 13:16:22 +0000
Received: by outflank-mailman (input) for mailman id 271913;
 Mon, 14 Feb 2022 13:16:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3W-0008IH-A5
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e168e7d9-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:06:12 +0100 (CET)
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
X-Inumbo-ID: e168e7d9-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ZeH6O9XaSCM4nWzskGu9oWidhKAGbDFLn89nxDUkjLk=;
  b=QJZzM5oaZhi2xA2Zi89Y2xHTTFb08J+5kg3g51lyURuTTfHkyTqM+ldN
   MB40FNTexah9W2SHlfj2hz5FQ6TS0uRn0xUQO5vgrDCxP50MvMtW+OuS7
   4lJ+O9797EniZa0U9k+Z8Df2KId/udjvvMWVDK1cBmU0X2CUIi/D6X6h4
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PgHkDbHah6iAFNUMu4uw1QH6AB+iOophm8YewS0rfzJp6aePwkzcxFz0t/hmEoM/+Jxxvzck7g
 LpNjFD83Q+8hHJlHJYJ8B+Nu3K+69PlUeh6vXnWQRIp9QUBHU4uCqbI54QitbuTDHNPqyDgkC9
 FWmMWo8uBygGhhpFuEJdBZ4CkJ3NHWNkvyBEQ8enZGdyXRHTpWAxDozFO0SkviYmbzk7QVa59H
 BcYk8w4f0JwsRK4J7oIr2eejvIa76ZG4PozqUAZGM6+tuNGHx470pUjbsnzie62WHwzNKgxUXL
 jY2T/Ti6Fh9CKX5IGGjgoT78
X-SBRS: 5.1
X-MesageID: 64149870
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7+b3VK6m1Bog8IjFj4AnKQxRtCfAchMFZxGqfqrLsTDasY5as4F+v
 mVOD2qAaK2OYjH3Lox1bom39h4CvcXVnNE2HAI+/yBjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Iw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 I0SrbWAYwsSHrTv2/oHSidcHTNvMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQa+CN
 ppGMVKDajzRODpOYAkPV6sP37iupXn2dDpit1ua8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvGtJk6TePisKQw2RvKmzJVWEZ+uUaHTeeRhhbhQ/tvA
 UAv2jMN7rYo7XKvQMvsUEjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblQ5oi59hM8O75FvG2Fzv
 rOdt5awXGE07uXJIZ6I3urM9VuP1T4pwXjujMPuZS8M+JHdrY46lXojpf4zQffu3rUZ9dwdq
 g1mTRTSZZ1O16bnNI3hpDgrZg5AQbCTEGYICv3/BD7N0++ATNfNi3aUwVba9+1cC42SU0OMu
 nMJ8+DHsrxSUsHdyXHVGb5XdF1M2xpiGGeC6WOD4rF7r2j9k5JdVdw4DM5CyLdBbZ9fJG6Bj
 L77sgJN/p5DVEZGnocsC79d//8ClPC6ffy8D6i8RoMXPvBZKV/WlAkzNBX49z28zyARfVQXZ
 M7znTCEVi1BV8yKDVOeGo8g7FPc7n5imz2DH82np/lluJLHDEOopX4+GAPmRogEAGms+W05K
 v5TaJmHzQtxSur7bnWF+IIfNwlSf3M6GYr3u4pccevaelhqH2QoCvnwx7I9etM6w/QJx7mQp
 nztCFVFzFffhGHcLVnYYH5Ud76yD410qmg2PHJwMA/wiWQje4um8IwWa4AzIes87OVmwPMtF
 6sFdsyMD+5hUDPC/zhBP5DxoJY7LEaghB6UPjrjaz86JsYySwvM897iXw3u6ChRUXbn6Zpg+
 +Wtj1qJT4ACSgJuCNftRMiul17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK2J89WpHu95EhYIFmXX9+/rZyzT/27lyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPJs/cbrqp9b0h9gTSfCYFmcA799JmWLgJtUvapXy74F4Qa7V
 ypjIDWB1Wll7C89LGMsGQ==
IronPort-HdrOrdr: A9a23:6e+jBa8GOLnaHDB8X45uk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149870"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 42/70] x86/hvmsave: CFI hardening
Date: Mon, 14 Feb 2022 12:50:59 +0000
Message-ID: <20220214125127.17985-43-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index e87e809a945d..4cf313a0ad0a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -756,7 +756,7 @@ void hvm_domain_destroy(struct domain *d)
     destroy_vpci_mmcfg(d);
 }
 
-static int hvm_save_tsc_adjust(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check hvm_save_tsc_adjust(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct hvm_tsc_adjust ctxt = {
         .tsc_adjust = v->arch.hvm.msr_tsc_adjust,
@@ -765,7 +765,7 @@ static int hvm_save_tsc_adjust(struct vcpu *v, hvm_domain_context_t *h)
     return hvm_save_entry(TSC_ADJUST, v->vcpu_id, h, &ctxt);
 }
 
-static int hvm_load_tsc_adjust(struct domain *d, hvm_domain_context_t *h)
+static int cf_check hvm_load_tsc_adjust(struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
@@ -788,7 +788,7 @@ static int hvm_load_tsc_adjust(struct domain *d, hvm_domain_context_t *h)
 HVM_REGISTER_SAVE_RESTORE(TSC_ADJUST, hvm_save_tsc_adjust,
                           hvm_load_tsc_adjust, 1, HVMSR_PER_VCPU);
 
-static int hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct segment_register seg;
     struct hvm_hw_cpu ctxt = {
@@ -971,7 +971,7 @@ unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
             (cet              ? X86_CR4_CET               : 0));
 }
 
-static int hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
+static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
@@ -1172,7 +1172,8 @@ HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, hvm_load_cpu_ctxt, 1,
                                            save_area) + \
                                   xstate_ctxt_size(xcr0))
 
-static int hvm_save_cpu_xsave_states(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check hvm_save_cpu_xsave_states(
+    struct vcpu *v, hvm_domain_context_t *h)
 {
     struct hvm_hw_cpu_xsave *ctxt;
     unsigned int size = HVM_CPU_XSAVE_SIZE(v->arch.xcr0_accum);
@@ -1210,7 +1211,8 @@ CHECK_FIELD_(struct, xsave_hdr, reserved);
 #undef compat_xsave_hdr
 #undef xen_xsave_hdr
 
-static int hvm_load_cpu_xsave_states(struct domain *d, hvm_domain_context_t *h)
+static int cf_check hvm_load_cpu_xsave_states(
+    struct domain *d, hvm_domain_context_t *h)
 {
     unsigned int vcpuid, size;
     int err;
@@ -1338,7 +1340,7 @@ static const uint32_t msrs_to_send[] = {
     MSR_AMD64_DR3_ADDRESS_MASK,
 };
 
-static int hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d = v->domain;
     struct hvm_save_descriptor *desc = _p(&h->data[h->cur]);
@@ -1418,7 +1420,7 @@ static int hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
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
index 7ebcaa1c899f..25dca93e8b71 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1104,8 +1104,8 @@ void viridian_unmap_guest_page(struct viridian_page *vp)
     put_page_and_type(page);
 }
 
-static int viridian_save_domain_ctxt(struct vcpu *v,
-                                     hvm_domain_context_t *h)
+static int cf_check viridian_save_domain_ctxt(
+    struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d = v->domain;
     const struct viridian_domain *vd = d->arch.hvm.viridian;
@@ -1123,8 +1123,8 @@ static int viridian_save_domain_ctxt(struct vcpu *v,
     return (hvm_save_entry(VIRIDIAN_DOMAIN, 0, h, &ctxt) != 0);
 }
 
-static int viridian_load_domain_ctxt(struct domain *d,
-                                     hvm_domain_context_t *h)
+static int cf_check viridian_load_domain_ctxt(
+    struct domain *d, hvm_domain_context_t *h)
 {
     struct viridian_domain *vd = d->arch.hvm.viridian;
     struct hvm_viridian_domain_context ctxt;
@@ -1144,7 +1144,8 @@ static int viridian_load_domain_ctxt(struct domain *d,
 HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_DOMAIN, viridian_save_domain_ctxt,
                           viridian_load_domain_ctxt, 1, HVMSR_PER_DOM);
 
-static int viridian_save_vcpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
+static int cf_check viridian_save_vcpu_ctxt(
+    struct vcpu *v, hvm_domain_context_t *h)
 {
     struct hvm_viridian_vcpu_context ctxt = {};
 
@@ -1157,8 +1158,8 @@ static int viridian_save_vcpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29A66F8593
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 17:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530413.826011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxGM-00085f-UF; Fri, 05 May 2023 15:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530413.826011; Fri, 05 May 2023 15:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxGM-0007yS-OE; Fri, 05 May 2023 15:22:26 +0000
Received: by outflank-mailman (input) for mailman id 530413;
 Fri, 05 May 2023 15:22:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C6Wy=A2=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1puxFw-0007pX-AD
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 15:22:00 +0000
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch
 [185.125.25.15]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 932ffb88-eb58-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 17:21:58 +0200 (CEST)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QCZD54cDqzMqZgk;
 Fri,  5 May 2023 17:21:57 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QCZD330PNz1j3; Fri,  5 May 2023 17:21:55 +0200 (CEST)
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
X-Inumbo-ID: 932ffb88-eb58-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1683300117;
	bh=Sck5/KPfNUhl8VtyERkRdjhXvgnFmYNWT4AHdC4aHDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xy2uQqu3d6UyYIRq1FHdiksjhJdSOrSuJr5w83oL1hRdMuCXet7azQy+AgpzQUfui
	 mWmlvk+7HFvNzEiU9UANLTHxNmTdUoA1IlKd2pKbr/FKAIab/IQO57y70uUQT1Y0RN
	 NjhO3YHPUfCPweoKfcyI2ayyvi0vzx4JsaOeBc24=
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Alexander Graf <graf@amazon.com>,
	Forrest Yuan Yu <yuanyu@google.com>,
	James Morris <jamorris@linux.microsoft.com>,
	John Andersen <john.s.andersen@intel.com>,
	Liran Alon <liran.alon@oracle.com>,
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
	Marian Rotariu <marian.c.rotariu@gmail.com>,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
	=?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Thara Gopinath <tgopinath@microsoft.com>,
	Will Deacon <will@kernel.org>,
	Zahra Tarkhani <ztarkhani@microsoft.com>,
	=?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
	dev@lists.cloudhypervisor.org,
	kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 1/9] KVM: x86: Add kvm_x86_ops.fault_gva()
Date: Fri,  5 May 2023 17:20:38 +0200
Message-Id: <20230505152046.6575-2-mic@digikod.net>
In-Reply-To: <20230505152046.6575-1-mic@digikod.net>
References: <20230505152046.6575-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

This function is needed for kvm_mmu_page_fault() to create synthetic
page faults.

Code originally written by Mihai Donțu and Nicușor Cîțu:
https://lore.kernel.org/r/20211006173113.26445-18-alazar@bitdefender.com
Renamed fault_gla() to fault_gva() and use the new
EPT_VIOLATION_GVA_IS_VALID.

Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Wanpeng Li <wanpengli@tencent.com>
Co-developed-by: Mihai Donțu <mdontu@bitdefender.com>
Signed-off-by: Mihai Donțu <mdontu@bitdefender.com>
Co-developed-by: Nicușor Cîțu <nicu.citu@icloud.com>
Signed-off-by: Nicușor Cîțu <nicu.citu@icloud.com>
Signed-off-by: Mickaël Salaün <mic@digikod.net>
Link: https://lore.kernel.org/r/20230505152046.6575-2-mic@digikod.net
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  2 ++
 arch/x86/kvm/svm/svm.c             |  9 +++++++++
 arch/x86/kvm/vmx/vmx.c             | 10 ++++++++++
 4 files changed, 22 insertions(+)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index abccd51dcfca..b761182a9444 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -131,6 +131,7 @@ KVM_X86_OP(msr_filter_changed)
 KVM_X86_OP(complete_emulated_msr)
 KVM_X86_OP(vcpu_deliver_sipi_vector)
 KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
+KVM_X86_OP(fault_gva)
 
 #undef KVM_X86_OP
 #undef KVM_X86_OP_OPTIONAL
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 6aaae18f1854..f319bcdeb8bd 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1706,6 +1706,8 @@ struct kvm_x86_ops {
 	 * Returns vCPU specific APICv inhibit reasons
 	 */
 	unsigned long (*vcpu_get_apicv_inhibit_reasons)(struct kvm_vcpu *vcpu);
+
+	u64 (*fault_gva)(struct kvm_vcpu *vcpu);
 };
 
 struct kvm_x86_nested_ops {
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 9a194aa1a75a..8b47b38aaf7f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4700,6 +4700,13 @@ static int svm_vm_init(struct kvm *kvm)
 	return 0;
 }
 
+static u64 svm_fault_gva(struct kvm_vcpu *vcpu)
+{
+	const struct vcpu_svm *svm = to_svm(vcpu);
+
+	return svm->vcpu.arch.cr2 ? svm->vcpu.arch.cr2 : ~0ull;
+}
+
 static struct kvm_x86_ops svm_x86_ops __initdata = {
 	.name = "kvm_amd",
 
@@ -4826,6 +4833,8 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 
 	.vcpu_deliver_sipi_vector = svm_vcpu_deliver_sipi_vector,
 	.vcpu_get_apicv_inhibit_reasons = avic_vcpu_get_apicv_inhibit_reasons,
+
+	.fault_gva = svm_fault_gva,
 };
 
 /*
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 7eec0226d56a..9870db887a62 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8067,6 +8067,14 @@ static void vmx_vm_destroy(struct kvm *kvm)
 	free_pages((unsigned long)kvm_vmx->pid_table, vmx_get_pid_table_order(kvm));
 }
 
+static u64 vmx_fault_gva(struct kvm_vcpu *vcpu)
+{
+	if (vcpu->arch.exit_qualification & EPT_VIOLATION_GVA_IS_VALID)
+		return vmcs_readl(GUEST_LINEAR_ADDRESS);
+
+	return ~0ull;
+}
+
 static struct kvm_x86_ops vmx_x86_ops __initdata = {
 	.name = "kvm_intel",
 
@@ -8204,6 +8212,8 @@ static struct kvm_x86_ops vmx_x86_ops __initdata = {
 	.complete_emulated_msr = kvm_complete_insn_gp,
 
 	.vcpu_deliver_sipi_vector = kvm_vcpu_deliver_sipi_vector,
+
+	.fault_gva = vmx_fault_gva,
 };
 
 static unsigned int vmx_handle_intel_pt_intr(void)
-- 
2.40.1



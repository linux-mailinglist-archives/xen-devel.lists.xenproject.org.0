Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E265FF05
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 11:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472422.732640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDk5Q-000530-D3; Fri, 06 Jan 2023 10:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472422.732640; Fri, 06 Jan 2023 10:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDk5Q-00050W-A5; Fri, 06 Jan 2023 10:36:32 +0000
Received: by outflank-mailman (input) for mailman id 472422;
 Fri, 06 Jan 2023 10:36:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pdurrant@amazon.com>) id 1pDk5P-000500-5n
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 10:36:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pdurrant@amazon.com>)
 id 1pDk5K-0003o2-SY; Fri, 06 Jan 2023 10:36:26 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=debian.cbg12.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pdurrant@amazon.com>)
 id 1pDk5K-0001wX-Ir; Fri, 06 Jan 2023 10:36:26 +0000
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
From: Paul Durrant <pdurrant@amazon.com>
To: x86@kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v7 1/2] KVM: x86/cpuid: generalize kvm_update_kvm_cpuid_base() and also capture limit
Date: Fri,  6 Jan 2023 10:35:59 +0000
Message-Id: <20230106103600.528-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230106103600.528-1-pdurrant@amazon.com>
References: <20230106103600.528-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A subsequent patch will need to acquire the CPUID leaf range for emulated
Xen so explicitly pass the signature of the hypervisor we're interested in
to the new function. Also introduce a new kvm_hypervisor_cpuid structure
so we can neatly store both the base and limit leaf indices.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>

v7:
 - Morph kvm_update_hypervisor_cpuid() into kvm_get_hypervisor_cpuid()
 - Place the definition of struct kvm_hypervisor_cpuid to avoid churn
   in patch #2.

v6:
 - New in this version
---
 arch/x86/include/asm/kvm_host.h |  7 ++++++-
 arch/x86/kvm/cpuid.c            | 24 +++++++++++++-----------
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c70690b2c82d..85cbe4571ac9 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -678,6 +678,11 @@ struct kvm_vcpu_hv {
 	} nested;
 };
 
+struct kvm_hypervisor_cpuid {
+	u32 base;
+	u32 limit;
+};
+
 /* Xen HVM per vcpu emulation context */
 struct kvm_vcpu_xen {
 	u64 hypercall_rip;
@@ -826,7 +831,7 @@ struct kvm_vcpu_arch {
 
 	int cpuid_nent;
 	struct kvm_cpuid_entry2 *cpuid_entries;
-	u32 kvm_cpuid_base;
+	struct kvm_hypervisor_cpuid kvm_cpuid;
 
 	u64 reserved_gpa_bits;
 	int maxphyaddr;
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 69768e4d53a6..db5a4d38fcd0 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -180,15 +180,15 @@ static int kvm_cpuid_check_equal(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2
 	return 0;
 }
 
-static void kvm_update_kvm_cpuid_base(struct kvm_vcpu *vcpu)
+static struct kvm_hypervisor_cpuid kvm_get_hypervisor_cpuid(struct kvm_vcpu *vcpu,
+							    const char *sig)
 {
-	u32 function;
+	struct kvm_hypervisor_cpuid cpuid = {};
 	struct kvm_cpuid_entry2 *entry;
+	u32 base;
 
-	vcpu->arch.kvm_cpuid_base = 0;
-
-	for_each_possible_hypervisor_cpuid_base(function) {
-		entry = kvm_find_cpuid_entry(vcpu, function);
+	for_each_possible_hypervisor_cpuid_base(base) {
+		entry = kvm_find_cpuid_entry(vcpu, base);
 
 		if (entry) {
 			u32 signature[3];
@@ -197,19 +197,21 @@ static void kvm_update_kvm_cpuid_base(struct kvm_vcpu *vcpu)
 			signature[1] = entry->ecx;
 			signature[2] = entry->edx;
 
-			BUILD_BUG_ON(sizeof(signature) > sizeof(KVM_SIGNATURE));
-			if (!memcmp(signature, KVM_SIGNATURE, sizeof(signature))) {
-				vcpu->arch.kvm_cpuid_base = function;
+			if (!memcmp(signature, sig, sizeof(signature))) {
+				cpuid.base = base;
+				cpuid.limit = entry->eax;
 				break;
 			}
 		}
 	}
+
+	return cpuid;
 }
 
 static struct kvm_cpuid_entry2 *__kvm_find_kvm_cpuid_features(struct kvm_vcpu *vcpu,
 					      struct kvm_cpuid_entry2 *entries, int nent)
 {
-	u32 base = vcpu->arch.kvm_cpuid_base;
+	u32 base = vcpu->arch.kvm_cpuid.base;
 
 	if (!base)
 		return NULL;
@@ -439,7 +441,7 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 	vcpu->arch.cpuid_entries = e2;
 	vcpu->arch.cpuid_nent = nent;
 
-	kvm_update_kvm_cpuid_base(vcpu);
+	vcpu->arch.kvm_cpuid = kvm_get_hypervisor_cpuid(vcpu, KVM_SIGNATURE);
 	kvm_vcpu_after_set_cpuid(vcpu);
 
 	return 0;
-- 
2.20.1



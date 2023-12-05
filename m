Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E738052D7
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647615.1011052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATbV-0000re-Lm; Tue, 05 Dec 2023 11:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647615.1011052; Tue, 05 Dec 2023 11:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATbV-0000pi-IM; Tue, 05 Dec 2023 11:28:41 +0000
Received: by outflank-mailman (input) for mailman id 647615;
 Tue, 05 Dec 2023 11:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGQ0=HQ=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1rATUs-0003dP-Vc
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:21:50 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74fddc09-9360-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:21:38 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:21:27 -0800
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:21:26 -0800
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
X-Inumbo-ID: 74fddc09-9360-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701775299; x=1733311299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SQLskgfezeMmMUQK7hRm+in8U5EG93C8+IUmjWFkZJ4=;
  b=e6dqYL2826IKDf354zom8O6hrtYqB09fZZhDZIqkWFX1rlYbJVrlwiti
   iFkpfDFIJDDx/a8dgAEsOyVGmQuwDU8/D+ZTIvW3ZGA0gpXiKZGzb1zAf
   Y3JoQfkni4RefPsaA9KlrAz+TMABWNDR80dQZAwdk0E9c+pxeOX8AQuWj
   4o7MkVMiK8nf9BKhZqs7zG/FtH+ZWyZZP4SiaR8ghxE5/qdqfy0aIMF6b
   3C1BojI+Cqq1oW4wwZv7GU91ZVfr6tfj7H9t8KpNCJNlDczMTtRdJIOKd
   9/qv7LMcXHbRDCnNXDKU8T0AtCenDZjv3bwqSjV9SWl4S9mrJX4ty5KZM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942695"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942695"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018193012"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018193012"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	peterz@infradead.org,
	jgross@suse.com,
	ravi.v.shankar@intel.com,
	mhiramat@kernel.org,
	andrew.cooper3@citrix.com,
	jiangshanlai@gmail.com,
	nik.borisov@suse.com,
	shan.kang@intel.com
Subject: [PATCH v13 32/35] KVM: VMX: Call fred_entry_from_kvm() for IRQ/NMI handling
Date: Tue,  5 Dec 2023 02:50:21 -0800
Message-ID: <20231205105030.8698-33-xin3.li@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105030.8698-1-xin3.li@intel.com>
References: <20231205105030.8698-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When FRED is enabled, call fred_entry_from_kvm() to handle IRQ/NMI in
IRQ/NMI induced VM exits.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/vmx/vmx.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index be20a60047b1..ba5cd26137e0 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -38,6 +38,7 @@
 #include <asm/desc.h>
 #include <asm/fpu/api.h>
 #include <asm/fpu/xstate.h>
+#include <asm/fred.h>
 #include <asm/idtentry.h>
 #include <asm/io.h>
 #include <asm/irq_remapping.h>
@@ -6962,14 +6963,16 @@ static void handle_external_interrupt_irqoff(struct kvm_vcpu *vcpu)
 {
 	u32 intr_info = vmx_get_intr_info(vcpu);
 	unsigned int vector = intr_info & INTR_INFO_VECTOR_MASK;
-	gate_desc *desc = (gate_desc *)host_idt_base + vector;
 
 	if (KVM_BUG(!is_external_intr(intr_info), vcpu->kvm,
 	    "unexpected VM-Exit interrupt info: 0x%x", intr_info))
 		return;
 
 	kvm_before_interrupt(vcpu, KVM_HANDLING_IRQ);
-	vmx_do_interrupt_irqoff(gate_offset(desc));
+	if (cpu_feature_enabled(X86_FEATURE_FRED))
+		fred_entry_from_kvm(EVENT_TYPE_EXTINT, vector);
+	else
+		vmx_do_interrupt_irqoff(gate_offset((gate_desc *)host_idt_base + vector));
 	kvm_after_interrupt(vcpu);
 
 	vcpu->arch.at_instruction_boundary = true;
@@ -7262,7 +7265,10 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	if ((u16)vmx->exit_reason.basic == EXIT_REASON_EXCEPTION_NMI &&
 	    is_nmi(vmx_get_intr_info(vcpu))) {
 		kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
-		vmx_do_nmi_irqoff();
+		if (cpu_feature_enabled(X86_FEATURE_FRED))
+			fred_entry_from_kvm(EVENT_TYPE_NMI, NMI_VECTOR);
+		else
+			vmx_do_nmi_irqoff();
 		kvm_after_interrupt(vcpu);
 	}
 
-- 
2.43.0



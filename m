Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B310279FACD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 07:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601824.938150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgerd-0005Jh-MV; Thu, 14 Sep 2023 05:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601824.938150; Thu, 14 Sep 2023 05:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgerd-0005Ge-JY; Thu, 14 Sep 2023 05:26:05 +0000
Received: by outflank-mailman (input) for mailman id 601824;
 Thu, 14 Sep 2023 05:26:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZLI=E6=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qgelR-0001XI-2a
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 05:19:41 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c4c8559-52be-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 07:19:37 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:17:47 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 22:17:46 -0700
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
X-Inumbo-ID: 4c4c8559-52be-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694668777; x=1726204777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T0jTyejyJ8JvDYansScu0V1dL1MHLI4ucPruSc2ZVaA=;
  b=VOhzHfuQc7YkNLPqVod0zBTvi+oHAMG6ZMi58YjPTCJOlzg/PAGnpd6I
   a67xy4uCC2Fd98lOV+dtUVlzZqrHE0y1n8JZLz54pTbE8KRbQMT1XvUxU
   NdN6Zpkzol0P7IO8r8wyMkkcO3gVhXxT+E65V9PPVkxp3B9W3fAxoZ9Fj
   Hd/aX4HvSuCPHNZps7xTpbL6pRU6xribg6UvZ8MAU7rGxk2KlV5HuTt8e
   QZ0eukx2i+ip1nIcWJDl8XybmHDaQk+JBY8VBDAZz3vfNVev7o5sUGvKR
   xqP6pBRE3k9yaCXuKmMnz26eWuOY7J+DzfPx3TYDZa1z2cD+ltTa78xgf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382661511"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="382661511"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779488841"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779488841"
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
	jiangshanlai@gmail.com
Subject: [PATCH v10 34/38] KVM: VMX: Call fred_entry_from_kvm() for IRQ/NMI handling
Date: Wed, 13 Sep 2023 21:48:01 -0700
Message-Id: <20230914044805.301390-35-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914044805.301390-1-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When FRED is enabled, call fred_entry_from_kvm() to handle IRQ/NMI in
IRQ/NMI induced VM exits.

Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/kvm/vmx/vmx.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 72e3943f3693..db55b8418fa3 100644
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
2.34.1



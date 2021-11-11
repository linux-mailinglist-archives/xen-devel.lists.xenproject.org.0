Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7A644CFAF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 03:08:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224517.387931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzVU-0007Vz-FQ; Thu, 11 Nov 2021 02:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224517.387931; Thu, 11 Nov 2021 02:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzVU-0007PX-4f; Thu, 11 Nov 2021 02:08:04 +0000
Received: by outflank-mailman (input) for mailman id 224517;
 Thu, 11 Nov 2021 02:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KjPY=P6=flex--seanjc.bounces.google.com=3_nqMYQYKCTknZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@srs-se1.protection.inumbo.net>)
 id 1mkzVR-0006EI-OZ
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 02:08:01 +0000
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [2607:f8b0:4864:20::449])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3195174c-4294-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 03:08:01 +0100 (CET)
Received: by mail-pf1-x449.google.com with SMTP id
 y124-20020a623282000000b0047a09271e49so3018593pfy.16
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 18:08:00 -0800 (PST)
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
X-Inumbo-ID: 3195174c-4294-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=BFR/1q5iLt3yf5kWLtXoY89YerPRd53Fbf8elisWPU4=;
        b=EyJdNG55YlgiJw0AhwmBWiBKFN2bqclVs6tFme/MMuM8bhcjKJQBF0OcoJBKQN4Yga
         axZl4D8H01llZcE+B1lMipS7te9ff2VOp7tm63SOZ0bYgRPgOvv7dz7am2CWgxpg0t7P
         MNRfZq3ijQaVJG2uCad7xkxWh1HPBFRFulQ+NTiiERVK6s/+qvvEEXRWQscxLcYr8ons
         RAPjBHbZ9nw0KZopTSMI8rlJItEVAXh71vLtMjT3aiL6FIEsbFQlPdO+7CY5ZUb3d8zc
         4THP+pE5BT9GJwVdJXE8nIpJ82zKI4sbu9siyG5CLHKeyWKTSNq0cqo3I766dA0RjB8y
         OjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=BFR/1q5iLt3yf5kWLtXoY89YerPRd53Fbf8elisWPU4=;
        b=Ui+hDy6+QubLSDufoxtsnIRBxjO+FlrUWpAtYTi4hgYE7QNfT/3Hn1l17I5NwTpIwA
         gVkhK1+c9EPZIaYIukpFoZ4H1o30ZJZoTWN4p4SchM1YrWsqHmxLszvof1m1Jua7fy6s
         /VUBI1iW0zwFe8MG4v7bogG2GLEx/FRxbRWZliNj6Tu1oYaDy9RYmtaYJ1ExRLMGsRdN
         UO93QHUm3aIQykuGsjd86SzL2MTt775zv7wk+CKw9oHQES1o9xeu9nH5cLhEKBY2KryT
         0SFPCgaXxYMRLi5TL4GNoH8/fGDoLvxRntoUQOv+T4K5ppQUlvn7BaF6YMjzune19nM3
         r2Uw==
X-Gm-Message-State: AOAM533bZbFASSpgGzhK0svyDC9ScPiMlHtfzo+eJbSY11RQ5vNs12R7
	+6k/DOkojO183V9KjyOOikuZm49ZsUQ=
X-Google-Smtp-Source: ABdhPJzd8hxvmP15QQtACiUYvwIBDjhv9tE00/OdnnHyX3h6LjesiRmUGTAqyb2RSiJlII09jv6jyEbG1Qo=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c403:: with SMTP id
 i3mr23027931pjt.203.1636596478856; Wed, 10 Nov 2021 18:07:58 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 11 Nov 2021 02:07:32 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-12-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 11/17] KVM: x86: More precisely identify NMI from guest
 when handling PMI
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Artem Kashkanov <artem.kashkanov@intel.com>, 
	Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Differentiate between IRQ and NMI for KVM's PMC overflow callback, which
was originally invoked in response to an NMI that arrived while the guest
was running, but was inadvertantly changed to fire on IRQs as well when
support for perf without PMU/NMI was added to KVM.  In practice, this
should be a nop as the PMC overflow callback shouldn't be reached, but
it's a cheap and easy fix that also better documents the situation.

Note, this also doesn't completely prevent false positives if perf
somehow ends up calling into KVM, e.g. an NMI can arrive in host after
KVM sets its flag.

Fixes: dd60d217062f ("KVM: x86: Fix perf timer mode IP reporting")
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c |  2 +-
 arch/x86/kvm/vmx/vmx.c |  4 +++-
 arch/x86/kvm/x86.c     |  2 +-
 arch/x86/kvm/x86.h     | 13 ++++++++++---
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index b36ca4e476c2..df6a3e0bdcde 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3936,7 +3936,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu)
 	}
 
 	if (unlikely(svm->vmcb->control.exit_code == SVM_EXIT_NMI))
-		kvm_before_interrupt(vcpu);
+		kvm_before_interrupt(vcpu, KVM_HANDLING_NMI);
 
 	kvm_load_host_xsave_state(vcpu);
 	stgi();
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 0927d07b2efb..36098eb9a7f9 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6371,7 +6371,9 @@ void vmx_do_interrupt_nmi_irqoff(unsigned long entry);
 static void handle_interrupt_nmi_irqoff(struct kvm_vcpu *vcpu,
 					unsigned long entry)
 {
-	kvm_before_interrupt(vcpu);
+	bool is_nmi = entry == (unsigned long)asm_exc_nmi_noist;
+
+	kvm_before_interrupt(vcpu, is_nmi ? KVM_HANDLING_NMI : KVM_HANDLING_IRQ);
 	vmx_do_interrupt_nmi_irqoff(entry);
 	kvm_after_interrupt(vcpu);
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c8ef49385c99..e9e1a4bb1d00 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9837,7 +9837,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	 * interrupts on processors that implement an interrupt shadow, the
 	 * stat.exits increment will do nicely.
 	 */
-	kvm_before_interrupt(vcpu);
+	kvm_before_interrupt(vcpu, KVM_HANDLING_IRQ);
 	local_irq_enable();
 	++vcpu->stat.exits;
 	local_irq_disable();
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index d070043fd2e8..f8d2c58feadc 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -385,9 +385,16 @@ static inline bool kvm_cstate_in_guest(struct kvm *kvm)
 	return kvm->arch.cstate_in_guest;
 }
 
-static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu)
+enum kvm_intr_type {
+	/* Values are arbitrary, but must be non-zero. */
+	KVM_HANDLING_IRQ = 1,
+	KVM_HANDLING_NMI,
+};
+
+static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu,
+					enum kvm_intr_type intr)
 {
-	WRITE_ONCE(vcpu->arch.handling_intr_from_guest, 1);
+	WRITE_ONCE(vcpu->arch.handling_intr_from_guest, (u8)intr);
 }
 
 static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
@@ -397,7 +404,7 @@ static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
 
 static inline bool kvm_handling_nmi_from_guest(struct kvm_vcpu *vcpu)
 {
-	return !!vcpu->arch.handling_intr_from_guest;
+	return vcpu->arch.handling_intr_from_guest == KVM_HANDLING_NMI;
 }
 
 static inline bool kvm_pat_valid(u64 data)
-- 
2.34.0.rc0.344.g81b53c2807-goog



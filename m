Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DDB3F917B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 02:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173262.316205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCk-00032Z-O8; Fri, 27 Aug 2021 00:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173262.316205; Fri, 27 Aug 2021 00:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCk-0002nj-8j; Fri, 27 Aug 2021 00:58:46 +0000
Received: by outflank-mailman (input) for mailman id 173262;
 Fri, 27 Aug 2021 00:58:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcrI=NS=flex--seanjc.bounces.google.com=3iTgoYQYKCaocOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@srs-us1.protection.inumbo.net>)
 id 1mJQC6-0001Ok-H6
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:58:06 +0000
Received: from mail-qv1-xf4a.google.com (unknown [2607:f8b0:4864:20::f4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14154ef7-1d3a-4db0-981c-468b70b902b7;
 Fri, 27 Aug 2021 00:57:45 +0000 (UTC)
Received: by mail-qv1-xf4a.google.com with SMTP id
 y1-20020a0cec01000000b00375e130950fso2824753qvo.14
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:45 -0700 (PDT)
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
X-Inumbo-ID: 14154ef7-1d3a-4db0-981c-468b70b902b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=ruUdABYeGOxk9Wbic5Hd5odsewNKbNWoYU61ZxyE/gg=;
        b=vndU5Ssx1OSDPC9rhyF45w6Pl7KtF0HVdGcu07QMxr8hS7zmZr27FOwtaxJ1tTTkEv
         TjbpCl/yYOXwwbt+SfzpzW3C6DQ9IlXFMA5KyM2L5I/ODQXruJ5mMmlo2GULJ15xapc7
         DFo1XzvZHNjyXnPyzThDoBjBnUJ1S5bL2Zix9AnTvvwdLOZpELvTqnih27/JdGkMAZoP
         quXkeM9af9v2IYqphIzmnDdaHD0J50WGHw7/sBwRcQXuQNUtKrPYoGQP0EI8s8Bwn6H5
         0rtanzqf7O/zwFamcAeVErwzbLq+HxNe55hWM4yl7reqNOj5UMfQohDiN9UF2ESzt0l+
         hATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=ruUdABYeGOxk9Wbic5Hd5odsewNKbNWoYU61ZxyE/gg=;
        b=t1oMi5fgbCmoq80Fwwee6FfRrsvgL+OZIyOEQQt/8NSYAw5JqN1PQUvnLDd+JLg67r
         2rGLTIZyAH1iCxskhSIKPAiMJIA+YEeuRH/wb4GMX4zzxwztVIBXg6DJroJBnU1gHx/s
         IufuUEFfuMKGEfMx+paH5TeLdvxY2DwsB/SKnpJEfZ6FPDaIGzabRgONp2FtT38mF8yC
         BJ7Z8KzzFNVi8O58sC+3b4RxSSUkDCPkg+zRUZAFSABrVtJjtLnaKi/58+vnQ5vn4R+u
         /RXHONQEurCxkP4cz2TYw6NTTw/LrVaN3kv4eWRRwvQ0oaGvOM5q3CIxGGJIhUN6YUmP
         layw==
X-Gm-Message-State: AOAM530e51NyY93R9tU5w21PF+KSWiH3tnmPfbnzJg1sFk9IGQMXvAWz
	f7oYMuXSSGLQUz+hEwJ1lPgR9coZWDQ=
X-Google-Smtp-Source: ABdhPJxmVIKT1CgaTJnI3PKNih3UzXPOYiYk1l24a+ud0Vw4EBZOBMMmsnAtkB7iXZi5aG3MALLptO9xIv4=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a05:6214:14f2:: with SMTP id
 k18mr7332294qvw.19.1630025865337; Thu, 26 Aug 2021 17:57:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:10 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-8-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 07/15] KVM: Use dedicated flag to track if KVM is handling an
 NMI from guest
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, 
	Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
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
	Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add a dedicated flag to detect the case where KVM's PMC overflow
callback was originally invoked in response to an NMI that arrived while
the guest was running.  Using current_vcpu is less precise as IRQs also
set current_vcpu (though presumably KVM's callback should not be reached
in that case), and more importantly, this will allow dropping
current_vcpu as the perf callbacks can switch to kvm_running_vcpu now
that the perf callbacks are precisely registered, i.e. kvm_running_vcpu
doesn't need to be used to detect if a PMI arrived in the guest.

Fixes: dd60d217062f ("KVM: x86: Fix perf timer mode IP reporting")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 3 +--
 arch/x86/kvm/pmu.c              | 2 +-
 arch/x86/kvm/svm/svm.c          | 2 +-
 arch/x86/kvm/vmx/vmx.c          | 2 +-
 arch/x86/kvm/x86.c              | 4 ++--
 arch/x86/kvm/x86.h              | 4 +++-
 6 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 1ea4943a73d7..465b35736d9b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -763,6 +763,7 @@ struct kvm_vcpu_arch {
 	unsigned nmi_pending; /* NMI queued after currently running handler */
 	bool nmi_injected;    /* Trying to inject an NMI this entry */
 	bool smi_pending;    /* SMI queued after currently running handler */
+	bool handling_nmi_from_guest;
 
 	struct kvm_mtrr mtrr_state;
 	u64 pat;
@@ -1874,8 +1875,6 @@ int kvm_skip_emulated_instruction(struct kvm_vcpu *vcpu);
 int kvm_complete_insn_gp(struct kvm_vcpu *vcpu, int err);
 void __kvm_request_immediate_exit(struct kvm_vcpu *vcpu);
 
-int kvm_is_in_guest(void);
-
 void __user *__x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 				     u32 size);
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 0772bad9165c..2b8934b452ea 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -87,7 +87,7 @@ static void kvm_perf_overflow_intr(struct perf_event *perf_event,
 		 * woken up. So we should wake it, but this is impossible from
 		 * NMI context. Do it from irq work instead.
 		 */
-		if (!kvm_is_in_guest())
+		if (!pmc->vcpu->arch.handling_nmi_from_guest)
 			irq_work_queue(&pmc_to_pmu(pmc)->irq_work);
 		else
 			kvm_make_request(KVM_REQ_PMI, pmc->vcpu);
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 1a70e11f0487..3fc6767e5fd8 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3843,7 +3843,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu)
 	}
 
 	if (unlikely(svm->vmcb->control.exit_code == SVM_EXIT_NMI))
-		kvm_before_interrupt(vcpu);
+		kvm_before_interrupt(vcpu, true);
 
 	kvm_load_host_xsave_state(vcpu);
 	stgi();
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f19d72136f77..f08980ef7c44 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6344,7 +6344,7 @@ void vmx_do_interrupt_nmi_irqoff(unsigned long entry);
 static void handle_interrupt_nmi_irqoff(struct kvm_vcpu *vcpu,
 					unsigned long entry)
 {
-	kvm_before_interrupt(vcpu);
+	kvm_before_interrupt(vcpu, entry == (unsigned long)asm_exc_nmi_noist);
 	vmx_do_interrupt_nmi_irqoff(entry);
 	kvm_after_interrupt(vcpu);
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index bc4ee6ea7752..d4d91944fde7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8267,7 +8267,7 @@ static void kvm_timer_init(void)
 DEFINE_PER_CPU(struct kvm_vcpu *, current_vcpu);
 EXPORT_PER_CPU_SYMBOL_GPL(current_vcpu);
 
-int kvm_is_in_guest(void)
+static int kvm_is_in_guest(void)
 {
 	return __this_cpu_read(current_vcpu) != NULL;
 }
@@ -9678,7 +9678,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	 * interrupts on processors that implement an interrupt shadow, the
 	 * stat.exits increment will do nicely.
 	 */
-	kvm_before_interrupt(vcpu);
+	kvm_before_interrupt(vcpu, false);
 	local_irq_enable();
 	++vcpu->stat.exits;
 	local_irq_disable();
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 5cedc0e8a5d5..4c5ba4128b38 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -395,9 +395,10 @@ static inline void kvm_unregister_perf_callbacks(void)
 
 DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
 
-static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu)
+static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu, bool is_nmi)
 {
 	__this_cpu_write(current_vcpu, vcpu);
+	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, is_nmi);
 
 	kvm_register_perf_callbacks();
 }
@@ -406,6 +407,7 @@ static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
 {
 	kvm_unregister_perf_callbacks();
 
+	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, false);
 	__this_cpu_write(current_vcpu, NULL);
 }
 
-- 
2.33.0.259.gc128427fd7-goog



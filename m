Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF983F9191
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 03:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173314.316254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQEx-00062Y-NL; Fri, 27 Aug 2021 01:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173314.316254; Fri, 27 Aug 2021 01:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQEx-0005xH-K9; Fri, 27 Aug 2021 01:01:03 +0000
Received: by outflank-mailman (input) for mailman id 173314;
 Fri, 27 Aug 2021 01:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s0h2=NS=flex--seanjc.bounces.google.com=3kTgoYQYKCbIkWSfbUYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@srs-us1.protection.inumbo.net>)
 id 1mJQCQ-0001Ok-I0
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:58:26 +0000
Received: from mail-qv1-xf49.google.com (unknown [2607:f8b0:4864:20::f49])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb7ccd9f-e272-45bf-bada-bddca76b6680;
 Fri, 27 Aug 2021 00:57:54 +0000 (UTC)
Received: by mail-qv1-xf49.google.com with SMTP id
 q2-20020ad45ca2000000b00374fa0dbedfso1776856qvh.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:54 -0700 (PDT)
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
X-Inumbo-ID: cb7ccd9f-e272-45bf-bada-bddca76b6680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=OS7MVkT771frXb6OZKHkckOWNoVo4LUEGjOz8sBcugE=;
        b=OVx3FLznsGaUkZj9+ODRTi7whGbzE/8kn7Gal8CUtZIaL/dYJc2rmQ1qkPOZL3Jkfh
         8LrJ1TSXuykV5OnsMsKzeh/lnCTo7ULEJtk/Ma+pEhnmcr7eVxSmsrJbyuf0LZfHK3mC
         5cTNBxdLyQmksw12D/CFGAYGi8YZhA+2t1yMTfPnInjGwKU/m4C6BX/DXEkZZQHXEg9c
         FER1Z6XZJ/+zGzGlv/1Hbj3FXGvMNEUSscvb2WcAhhf/HSakavpwMxtthLnpWQGFfmMn
         TA2CoC7TInFFLn+Y2y/FwxaHi5RRS6sJJCd4Q8o94I87M30cSUgn5q03sEpbFayyiZ4I
         iPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=OS7MVkT771frXb6OZKHkckOWNoVo4LUEGjOz8sBcugE=;
        b=GzjIOPr4RhPVgPZ/cw8mQrO3awr7jWQRpIK5LDSQSadl9GwBCAAiMqrE6DqSWM5gqO
         r1rHj9Lcek1PPE8qPbe3SrvchRpF61FS76AnaKEcuMyGt4D3KYC85VofwIdTV3jh6c6+
         5gR04JqCNBvtjzN36k6wEhJ3E8NwyCvYNNRvmp20Y/4n1b232XGSZM761UpWXIru+N+i
         mvFyCJeIwt11/eG9RbKp7G1IXeXyDxULwCgeEfjIG5JYNmMlO5tf4PikvBA867aSUgI4
         kM3Vcqgw4B6oR5w598DEQ61K/flYaF2gd9x2Nzq9elJz3VG8Vm3/UxoQKxdMRfNwt22Z
         FPIA==
X-Gm-Message-State: AOAM5300hY7cHv6Tq2bXLd65g0x+FcEbTaF4RnAVUoLBPlrHELDHBrgF
	36s7cZDoFEHozqkw54kiFeA8dYZTQDg=
X-Google-Smtp-Source: ABdhPJyQjCRgdbSS93/ZAW+G0XqSUQSjYqI1rf3Efd9pEAO4+ceiCBacRxi/URQ0QYmIDPRPY3Rt4DKN9BU=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a05:6214:c3:: with SMTP id
 f3mr7297288qvs.1.1630025873996; Thu, 26 Aug 2021 17:57:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:14 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-12-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 11/15] KVM: x86: Move Intel Processor Trace interrupt handler
 to vmx.c
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

Now that all state needed for VMX's PT interrupt handler is exposed to
vmx.c (specifically the currently running vCPU), move the handler into
vmx.c where it belongs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 -
 arch/x86/kvm/vmx/vmx.c          | 24 +++++++++++++++++++++---
 arch/x86/kvm/x86.c              | 17 -----------------
 virt/kvm/kvm_main.c             |  1 +
 4 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 63553a1f43ee..daa33147650a 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1496,7 +1496,6 @@ struct kvm_x86_init_ops {
 	int (*disabled_by_bios)(void);
 	int (*check_processor_compatibility)(void);
 	int (*hardware_setup)(void);
-	bool (*intel_pt_intr_in_guest)(void);
 
 	struct kvm_x86_ops *runtime_ops;
 };
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f08980ef7c44..4665a272249a 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7535,6 +7535,8 @@ static void vmx_migrate_timers(struct kvm_vcpu *vcpu)
 
 static void hardware_unsetup(void)
 {
+	kvm_set_intel_pt_intr_handler(NULL);
+
 	if (nested)
 		nested_vmx_hardware_unsetup();
 
@@ -7685,6 +7687,18 @@ static struct kvm_x86_ops vmx_x86_ops __initdata = {
 	.vcpu_deliver_sipi_vector = kvm_vcpu_deliver_sipi_vector,
 };
 
+static void vmx_handle_intel_pt_intr(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (WARN_ON_ONCE(!vcpu))
+		return;
+
+	kvm_make_request(KVM_REQ_PMI, vcpu);
+	__set_bit(MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT,
+			(unsigned long *)&vcpu->arch.pmu.global_status);
+}
+
 static __init void vmx_setup_user_return_msrs(void)
 {
 
@@ -7886,9 +7900,14 @@ static __init int hardware_setup(void)
 	vmx_set_cpu_caps();
 
 	r = alloc_kvm_area();
-	if (r)
+	if (r) {
 		nested_vmx_hardware_unsetup();
-	return r;
+		return r;
+	}
+
+	if (pt_mode == PT_MODE_HOST_GUEST)
+		kvm_set_intel_pt_intr_handler(vmx_handle_intel_pt_intr);
+	return 0;
 }
 
 static struct kvm_x86_init_ops vmx_init_ops __initdata = {
@@ -7896,7 +7915,6 @@ static struct kvm_x86_init_ops vmx_init_ops __initdata = {
 	.disabled_by_bios = vmx_disabled_by_bios,
 	.check_processor_compatibility = vmx_check_processor_compat,
 	.hardware_setup = hardware_setup,
-	.intel_pt_intr_in_guest = vmx_pt_mode_is_host_guest,
 
 	.runtime_ops = &vmx_x86_ops,
 };
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7cb0f04e24ee..11c7a02f839c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8264,18 +8264,6 @@ static void kvm_timer_init(void)
 			  kvmclock_cpu_online, kvmclock_cpu_down_prep);
 }
 
-static void kvm_handle_intel_pt_intr(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return;
-
-	kvm_make_request(KVM_REQ_PMI, vcpu);
-	__set_bit(MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT,
-			(unsigned long *)&vcpu->arch.pmu.global_status);
-}
-
 #ifdef CONFIG_X86_64
 static void pvclock_gtod_update_fn(struct work_struct *work)
 {
@@ -11029,9 +11017,6 @@ int kvm_arch_hardware_setup(void *opaque)
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
-	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
-		kvm_set_intel_pt_intr_handler(kvm_handle_intel_pt_intr);
-
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
 
@@ -11059,8 +11044,6 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
-	kvm_set_intel_pt_intr_handler(NULL);
-
 	static_call(kvm_x86_hardware_unsetup)();
 }
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 13c4f58a75e5..e0b1c9386926 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5498,6 +5498,7 @@ void kvm_set_intel_pt_intr_handler(void (*handler)(void))
 {
 	kvm_guest_cbs.handle_intel_pt_intr = handler;
 }
+EXPORT_SYMBOL_GPL(kvm_set_intel_pt_intr_handler);
 
 void kvm_register_perf_callbacks(void)
 {
-- 
2.33.0.259.gc128427fd7-goog



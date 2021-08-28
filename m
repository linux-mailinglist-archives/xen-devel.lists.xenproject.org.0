Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B73FA287
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 02:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174096.317631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmQH-0003Ua-RS; Sat, 28 Aug 2021 00:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174096.317631; Sat, 28 Aug 2021 00:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmQH-0003Qx-N3; Sat, 28 Aug 2021 00:42:13 +0000
Received: by outflank-mailman (input) for mailman id 174096;
 Sat, 28 Aug 2021 00:42:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iA/M=NT=flex--seanjc.bounces.google.com=3JIUpYQYKCeMXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@srs-us1.protection.inumbo.net>)
 id 1mJmLe-0003pb-H4
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 00:37:26 +0000
Received: from mail-yb1-xb4a.google.com (unknown [2607:f8b0:4864:20::b4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fed5100a-de36-4351-8bf8-458efe6b8c0a;
 Sat, 28 Aug 2021 00:36:52 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 a62-20020a254d410000b0290592f360b0ccso8242489ybb.14
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 17:36:52 -0700 (PDT)
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
X-Inumbo-ID: fed5100a-de36-4351-8bf8-458efe6b8c0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=8sgYBBoPv+2JwgnSGYhHNhVlG76cGIWAxgCtg/V/coQ=;
        b=H5N4ryA5hWTUAeyuBk5XizZ7N0trA7JIKj0csm/SnRrBSvZI4fvOfdylQj2HI9uGWb
         FlgA7RqivFC20QT3Fgdghq9BURCUg84MC8EYToh6OEPEn485kgBO2eBqSmuI+BgUif0L
         X0t7BSgnBR2SJjDLf8mzg4n0cr87GdYxedcIPWDQMs1CgXbr3dAKzNI+Ec51COkbfFee
         M/XLorZxISoZWBr6d43w4+OCYBUTM9KVOhPDBEHcmSrOb67+e2vyyj7m1qI8rapB1/sj
         sUKaaIlY0oFXPavLrApCVJnrUrYLouBq/sRrV1srDbUivxaMXuuYz/XSg705ezUGG1EI
         utYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=8sgYBBoPv+2JwgnSGYhHNhVlG76cGIWAxgCtg/V/coQ=;
        b=TSkM/M2jyCVtqkjrMqiD/duDyJW0yLtI0K4PYtJdsKYott4jwtUv3OVezn6UjpFkf7
         XCyFLdNRAu7l8NJtRRltHpk76L7pB6yxAtZf3t0SFD2fDJypm3lzB9HXWgj7GOgf7ewE
         bqhcoIqaVPVxcPqQD7Q+bc9jenriAj7DtScEmUFIgwej7YPsVsbplBbMqzDRkWNSKt83
         qjNDItFmTuN7eXjuzvV1VHgXSu2IjmAiwsNEjUZmgeBSIgZqzBuFPQusPLMyLpB/c/GJ
         Ynx5HlD7iejCI9VEG53XZUPStQ8ej0dYNkM9kiouh9Gi2R6QseX+vSd+VL1v2Bu7UxT0
         0qjw==
X-Gm-Message-State: AOAM533XKg937OnuVz8CEo1rqc0zRGgwKPx0/yyEamXgblE/LCDoffBM
	zAB9ssJmi2uhuNAbgGd34q/hrl5r9o8=
X-Google-Smtp-Source: ABdhPJzymXWQza3vAsItF0sAPdCE8iLSMVzwPpM+LtdWMA9TXI8otz549S9ZetrsOJXPExeTt/x3hD0mXJY=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:f66c:b851:7e79:7ed4])
 (user=seanjc job=sendgmr) by 2002:a25:bb48:: with SMTP id b8mr7895492ybk.275.1630111012286;
 Fri, 27 Aug 2021 17:36:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Aug 2021 17:35:57 -0700
In-Reply-To: <20210828003558.713983-1-seanjc@google.com>
Message-Id: <20210828003558.713983-13-seanjc@google.com>
Mime-Version: 1.0
References: <20210828003558.713983-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH v2 12/13] KVM: arm64: Convert to the generic perf callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
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
	Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop arm64's version of the callbacks in favor of the callbacks provided
by generic KVM, which are semantically identical.  Implement the "get ip"
hook as needed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 12 +++++++++++
 arch/arm64/kvm/arm.c              |  5 +++++
 arch/arm64/kvm/perf.c             | 34 ++-----------------------------
 3 files changed, 19 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ed940aec89e0..73dc402ded1f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -673,6 +673,18 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 void kvm_perf_init(void);
 void kvm_perf_teardown(void);
 
+#ifdef CONFIG_PERF_EVENTS
+#define __KVM_WANT_PERF_CALLBACKS
+static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
+{
+	/* Any callback while a vCPU is loaded is considered to be in guest. */
+	return !!vcpu;
+}
+#else
+static inline void kvm_register_perf_callbacks(void) {}
+static inline void kvm_unregister_perf_callbacks(void) {}
+#endif
+
 long kvm_hypercall_pv_features(struct kvm_vcpu *vcpu);
 gpa_t kvm_init_stolen_time(struct kvm_vcpu *vcpu);
 void kvm_update_stolen_time(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index e9a2b8f27792..2b542fdc237e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -500,6 +500,11 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	return vcpu_mode_priv(vcpu);
 }
 
+unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
+{
+	return *vcpu_pc(vcpu);
+}
+
 /* Just ensure a guest exit from a particular CPU */
 static void exit_vm_noop(void *info)
 {
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 893de1a51fea..0b902e0d5b5d 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -13,45 +13,15 @@
 
 DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
 
-static unsigned int kvm_guest_state(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-	unsigned int state;
-
-	if (!vcpu)
-		return 0;
-
-	state = PERF_GUEST_ACTIVE;
-	if (!vcpu_mode_priv(vcpu))
-		state |= PERF_GUEST_USER;
-
-	return state;
-}
-
-static unsigned long kvm_get_guest_ip(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return 0;
-
-	return *vcpu_pc(vcpu);
-}
-
-static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.state		= kvm_guest_state,
-	.get_ip		= kvm_get_guest_ip,
-};
-
 void kvm_perf_init(void)
 {
 	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
 		static_branch_enable(&kvm_arm_pmu_available);
 
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
+	kvm_register_perf_callbacks(NULL);
 }
 
 void kvm_perf_teardown(void)
 {
-	perf_unregister_guest_info_callbacks();
+	kvm_unregister_perf_callbacks();
 }
-- 
2.33.0.259.gc128427fd7-goog



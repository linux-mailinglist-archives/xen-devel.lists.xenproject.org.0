Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6573FA244
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 02:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174041.317532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmKx-0004rh-8i; Sat, 28 Aug 2021 00:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174041.317532; Sat, 28 Aug 2021 00:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmKx-0004nm-3m; Sat, 28 Aug 2021 00:36:43 +0000
Received: by outflank-mailman (input) for mailman id 174041;
 Sat, 28 Aug 2021 00:36:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFq1=NT=flex--seanjc.bounces.google.com=3EIUpYQYKCc8Dzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@srs-us1.protection.inumbo.net>)
 id 1mJmKv-0003pb-Fe
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 00:36:41 +0000
Received: from mail-yb1-xb4a.google.com (unknown [2607:f8b0:4864:20::b4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb25d110-a0ca-4e69-b539-2fe94379a571;
 Sat, 28 Aug 2021 00:36:32 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 83-20020a251956000000b0059948f541cbso87386ybz.7
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 17:36:32 -0700 (PDT)
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
X-Inumbo-ID: eb25d110-a0ca-4e69-b539-2fe94379a571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=oqmEir0ICv/3G92ai+heTZuDyr/2G3d8WRYAGw86atk=;
        b=PcPAOihT8OlOhhUR4O32+YWwPzAPmLXJ1HEV+moJpFC1Qy84KcVrj+ajHpTlQK+a3F
         iyxUIoBJmALw6qqcNEgkIBWBH6GlQPAe+u7xlbyeAychGYyySNpy/bvcaaDuenDkzBb1
         Tjlhu6cHuXug1LfrtevGrfztVaOuMtHQ1BbUdWdKfT8tes9/0JNecwDm/BWfVrT79Qhh
         U/SjMl4oOYlt5v38Pnm8Mc6W1SnA5LO9EWqHnie5e5sXhbuMbSanMYmcJC2M9uljBuiN
         FTc3AiajdilK67F7Z2gaOx4+/6EEfK+b8GQmcjFFKC29NzjAngrdpD9yW51Odds/BoDr
         blsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=oqmEir0ICv/3G92ai+heTZuDyr/2G3d8WRYAGw86atk=;
        b=MxJT6z/0E1i9b4Kcfo08TKEXyxsWKQi1NryNsHPilJeMLJgZx/j51BefBEPxX+eBPh
         YCiROTJ0tWZYIUmyNYDpVBWKGy0YGBdVSTBI0uf+a/+h6UZhRHCTQlsPTgxjwHcqcNJQ
         QSlN7P6I85U8UOvl85rrpD6iyydUXcQdzTJemvXiHeb+SzkPxaJTW71XlQVaZOHJk3ss
         +hiwtU56inUfZonth5itjFXQUZZuSk2Qwr8J0uvJ1n1xSZYP1gr4nBxhP/HnmjBkq8Dm
         JQ+KI4I/ZGah32rAgK66EihJzJateeBCOK5G339Qi/r4AX5ylQkJ1kjiDk8YLOam8H1w
         jXjA==
X-Gm-Message-State: AOAM531Px1aAjQrSpEENJWV9DCnfVM9tR1HFYE/yWWiyx3kCRJYOBv/v
	PzJss0C9f3gdrtm0q86wSRhBcYamm9c=
X-Google-Smtp-Source: ABdhPJyTmAQoKJ2tjPvfJaPWBN34/RS1O5zwXSkZLsm9h521rPpR1j//umIRZ/UqerB16AfCO1AGIAPsHvE=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:f66c:b851:7e79:7ed4])
 (user=seanjc job=sendgmr) by 2002:a25:4545:: with SMTP id s66mr8318615yba.191.1630110992229;
 Fri, 27 Aug 2021 17:36:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Aug 2021 17:35:48 -0700
In-Reply-To: <20210828003558.713983-1-seanjc@google.com>
Message-Id: <20210828003558.713983-4-seanjc@google.com>
Mime-Version: 1.0
References: <20210828003558.713983-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH v2 03/13] KVM: x86: Register Processor Trace interrupt hook
 iff PT enabled in guest
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

Override the Processor Trace (PT) interrupt handler for guest mode if and
only if PT is configured for host+guest mode, i.e. is being used
independently by both host and guest.  If PT is configured for system
mode, the host fully controls PT and must handle all events.

Fixes: 8479e04e7d6b ("KVM: x86: Inject PMI for KVM guest")
Cc: stable@vger.kernel.org
Cc: Like Xu <like.xu.linux@gmail.com>
Reported-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Reported-by: Artem Kashkanov <artem.kashkanov@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 1 +
 arch/x86/kvm/vmx/vmx.c          | 1 +
 arch/x86/kvm/x86.c              | 5 ++++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 09b256db394a..1ea4943a73d7 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1494,6 +1494,7 @@ struct kvm_x86_init_ops {
 	int (*disabled_by_bios)(void);
 	int (*check_processor_compatibility)(void);
 	int (*hardware_setup)(void);
+	bool (*intel_pt_intr_in_guest)(void);
 
 	struct kvm_x86_ops *runtime_ops;
 };
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index fada1055f325..f19d72136f77 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7896,6 +7896,7 @@ static struct kvm_x86_init_ops vmx_init_ops __initdata = {
 	.disabled_by_bios = vmx_disabled_by_bios,
 	.check_processor_compatibility = vmx_check_processor_compat,
 	.hardware_setup = hardware_setup,
+	.intel_pt_intr_in_guest = vmx_pt_mode_is_host_guest,
 
 	.runtime_ops = &vmx_x86_ops,
 };
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index fb6015f97f9e..ffc6c2d73508 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8305,7 +8305,7 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.is_in_guest		= kvm_is_in_guest,
 	.is_user_mode		= kvm_is_user_mode,
 	.get_guest_ip		= kvm_get_guest_ip,
-	.handle_intel_pt_intr	= kvm_handle_intel_pt_intr,
+	.handle_intel_pt_intr	= NULL,
 };
 
 #ifdef CONFIG_X86_64
@@ -11061,6 +11061,8 @@ int kvm_arch_hardware_setup(void *opaque)
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
+	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
+		kvm_guest_cbs.handle_intel_pt_intr = kvm_handle_intel_pt_intr;
 	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
@@ -11091,6 +11093,7 @@ int kvm_arch_hardware_setup(void *opaque)
 void kvm_arch_hardware_unsetup(void)
 {
 	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	kvm_guest_cbs.handle_intel_pt_intr = NULL;
 
 	static_call(kvm_x86_hardware_unsetup)();
 }
-- 
2.33.0.259.gc128427fd7-goog



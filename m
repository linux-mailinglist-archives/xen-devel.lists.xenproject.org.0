Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2693F3FA24B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 02:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174040.317519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmKr-0004Sq-SI; Sat, 28 Aug 2021 00:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174040.317519; Sat, 28 Aug 2021 00:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmKr-0004PT-PI; Sat, 28 Aug 2021 00:36:37 +0000
Received: by outflank-mailman (input) for mailman id 174040;
 Sat, 28 Aug 2021 00:36:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2oCF=NT=flex--seanjc.bounces.google.com=3DoUpYQYKCc0Bxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@srs-us1.protection.inumbo.net>)
 id 1mJmKq-0003pb-FX
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 00:36:36 +0000
Received: from mail-yb1-xb4a.google.com (unknown [2607:f8b0:4864:20::b4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88b6df9a-5482-49d4-a7b3-998421a30b87;
 Sat, 28 Aug 2021 00:36:30 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 m66-20020a257145000000b00598282d96ceso8297289ybc.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 17:36:30 -0700 (PDT)
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
X-Inumbo-ID: 88b6df9a-5482-49d4-a7b3-998421a30b87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=J1gV9tKuEUW347bCpCRKYVIA3sPFQNKnByLeTysAe1c=;
        b=QQC9kCQqRwL40ouGUsJ6vhRZON2TPobzHX8Wq8NP7Mf7/RKw30MhddUWUdztQM8ka7
         Ewe++e/HjV2jGw30ZO9LaCG2WpwNsAvCft0FNwp9j2VxNuY0jXVJogAA4hui8IIZ1qr9
         T7Ay+2a4aRkadNU1ca0JCC87XvjH4ea9fD4ReM/qOgy67MxneR4EHRBEt1lUd0VOX2+/
         aMIald+U354j6b4DBU7OSxpd/vJmRGaMfQXYZFeXtKK7qkfMyGqETcknapO+6PjS0TvX
         f2FLBBpeqGMiBMtBIznPS2E0O9iUn3iZeMA1csLuIwLQaPaZSBmpT2biwVLtTLrwW9db
         1vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=J1gV9tKuEUW347bCpCRKYVIA3sPFQNKnByLeTysAe1c=;
        b=k8D9yTt93DPqiJMZCwqLNtCqg/ofvhUT3WwB9pYK83JzXkg8xZ1fD85FZEHbTYL0GB
         TbDx02V2ixZ/XtwN3geatjINpDN87FDGbQuVE0x5z3dVnEkOfje6jmCw5TosH9d7KVnW
         SebNvQ4BhAD4Dad6CmM2BwSnK/WfOELBHwTd3gEerNl66RlfCO5TqobcQe94H1NHuLBE
         ZiY4ROhKRY1VYZLZ9XF+Fr00GOxfVnwEoUpY2REE1yqteqJZx0MVWHrSzAAImSeiPJm2
         PP72gM60jD+OIixa/hjYrE8L/6uSK4vwmBoNq/ZSgZOUD7saDw5DQ0vNi5QadhWk0TeQ
         l6pg==
X-Gm-Message-State: AOAM532P7dy/LoR5xJHRo4G3R+1RU9JTJb6yDmgA/LiUdqoofT5yatvu
	YwqXOCI6E06egwuCQWID0WsY1CEh8Ng=
X-Google-Smtp-Source: ABdhPJycwxh1le3BAg4292rl1ZqiFoDJidbv03xd08RKtKGj0W0JQHpqPcTgq5axIHXDILJ1EM67ZM2iLac=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:f66c:b851:7e79:7ed4])
 (user=seanjc job=sendgmr) by 2002:a25:d307:: with SMTP id e7mr8478177ybf.119.1630110990084;
 Fri, 27 Aug 2021 17:36:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Aug 2021 17:35:47 -0700
In-Reply-To: <20210828003558.713983-1-seanjc@google.com>
Message-Id: <20210828003558.713983-3-seanjc@google.com>
Mime-Version: 1.0
References: <20210828003558.713983-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH v2 02/13] KVM: x86: Register perf callbacks after calling
 vendor's hardware_setup()
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

Wait to register perf callbacks until after doing vendor hardaware setup.
VMX's hardware_setup() configures Intel Processor Trace (PT) mode, and a
future fix to register the Intel PT guest interrupt hook if and only if
Intel PT is exposed to the guest will consume the configured PT mode.

Delaying registration to hardware setup is effectively a nop as KVM's perf
hooks all pivot on the per-CPU current_vcpu, which is non-NULL only when
KVM is handling an IRQ/NMI in a VM-Exit path.  I.e. current_vcpu will be
NULL throughout both kvm_arch_init() and kvm_arch_hardware_setup().

Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Artem Kashkanov <artem.kashkanov@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 86539c1686fa..fb6015f97f9e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8426,8 +8426,6 @@ int kvm_arch_init(void *opaque)
 
 	kvm_timer_init();
 
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
-
 	if (boot_cpu_has(X86_FEATURE_XSAVE)) {
 		host_xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
 		supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
@@ -8461,7 +8459,6 @@ void kvm_arch_exit(void)
 		clear_hv_tscchange_cb();
 #endif
 	kvm_lapic_exit();
-	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
 
 	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
 		cpufreq_unregister_notifier(&kvmclock_cpufreq_notifier_block,
@@ -11064,6 +11061,8 @@ int kvm_arch_hardware_setup(void *opaque)
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
+	perf_register_guest_info_callbacks(&kvm_guest_cbs);
+
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
 
@@ -11091,6 +11090,8 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
+	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+
 	static_call(kvm_x86_hardware_unsetup)();
 }
 
-- 
2.33.0.259.gc128427fd7-goog



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA9A44CFB2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 03:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224508.387836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzVE-0004Zf-BW; Thu, 11 Nov 2021 02:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224508.387836; Thu, 11 Nov 2021 02:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzVE-0004Wq-7K; Thu, 11 Nov 2021 02:07:48 +0000
Received: by outflank-mailman (input) for mailman id 224508;
 Thu, 11 Nov 2021 02:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gswl=P6=flex--seanjc.bounces.google.com=38HqMYQYKCSsZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@srs-se1.protection.inumbo.net>)
 id 1mkzVC-0004E5-Nz
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 02:07:46 +0000
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [2607:f8b0:4864:20::449])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28f337b1-4294-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 03:07:46 +0100 (CET)
Received: by mail-pf1-x449.google.com with SMTP id
 z187-20020a6233c4000000b0047c2090f1abso2998379pfz.23
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 18:07:45 -0800 (PST)
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
X-Inumbo-ID: 28f337b1-4294-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=hK/bb2+8SYaruhoQBxjUMD9dzEtjE9dODoHgmaxXM04=;
        b=ioMgfZT9xO/74nIuEa5s079HZzqYDthukPpMRSdF0C3awDBWthDsWqAFo50b69aUgk
         Nhl7hmTYeB+KSKGuShd9pnZgSHEJ4YdF59a3n2gw+3Am+iHw8BnPD9PQEuIObPEX1zet
         XT5oCTwKFkgZjUeOaAP52YI/QxstVIlhlvJS+3cp25s9mkhbYvGe1eTarbKtvSx415JI
         ECVQms8ylbLIS/A+wF3YHJcodbwqtGvWDNxp9OhyCccF49POD6LZ1YDg80r7wc3jC1/x
         2UeOF3HXehBTuQGieAJ2PQ8fh4iSC2ZmT1gzNp9Gsi+Io2TQjCObkIi6pMuDLYQvs7JU
         qJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=hK/bb2+8SYaruhoQBxjUMD9dzEtjE9dODoHgmaxXM04=;
        b=Khl5ghCR0GJbaGA/0hkqQO1pk+cOl5Jw/OSWEqCdhi8qn5hPLhMOmKNC246ANZPuiC
         u2LNTNaAur9zvGGwiXLH62y7GMVtC6aHLBZHh80pH4YncQ/hb5/1bJyJaH1IDo1T2cPT
         fpfEuy7HRZ1BCrR11txlB+xDO2+4CzUsxRybOhbFiEeLBmJi/M3jPaJL6mFKXflOAuTt
         3kEnA0GSikln4F17dQqcXL6Hsq/ZHNeJ36MNZYqt8rlSv/dPLHytprhiOGiganvnzEJL
         QqX03HUjx77UV2rSZyOgjmF+xMmD8bAtZAjFQ9LU5+N9/gySF3fiq38SRTK+TnMSMBWt
         f/sQ==
X-Gm-Message-State: AOAM532YJKmfDWNQYvq0wHE7uarP+Pz5UayReiU8Tkv7eIPlN92r12Y+
	RieZIRmDGf05v4mgTRQmHISpYVNyQR4=
X-Google-Smtp-Source: ABdhPJyQu0wj6xnqaOSUJnCa9iYYs/0X0i20LUCAU5FW0hNQJqyaWntSFAsP1Erw+w1uVAuo6SyrzLgxEvw=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1822:b0:49f:c55b:6235 with SMTP id
 y34-20020a056a00182200b0049fc55b6235mr3668521pfa.66.1636596464117; Wed, 10
 Nov 2021 18:07:44 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 11 Nov 2021 02:07:23 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-3-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 02/17] KVM: x86: Register perf callbacks after calling
 vendor's hardware_setup()
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
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c1c4e2b05a63..021b2c1ac9f0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8567,8 +8567,6 @@ int kvm_arch_init(void *opaque)
 
 	kvm_timer_init();
 
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
-
 	if (boot_cpu_has(X86_FEATURE_XSAVE)) {
 		host_xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
 		supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
@@ -8600,7 +8598,6 @@ void kvm_arch_exit(void)
 		clear_hv_tscchange_cb();
 #endif
 	kvm_lapic_exit();
-	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
 
 	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
 		cpufreq_unregister_notifier(&kvmclock_cpufreq_notifier_block,
@@ -11149,6 +11146,8 @@ int kvm_arch_hardware_setup(void *opaque)
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
+	perf_register_guest_info_callbacks(&kvm_guest_cbs);
+
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
 
@@ -11176,6 +11175,8 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
+	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+
 	static_call(kvm_x86_hardware_unsetup)();
 }
 
-- 
2.34.0.rc0.344.g81b53c2807-goog



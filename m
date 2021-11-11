Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABCE44CFAE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 03:08:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224509.387853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzVF-00053b-Rb; Thu, 11 Nov 2021 02:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224509.387853; Thu, 11 Nov 2021 02:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzVF-0004zz-Nt; Thu, 11 Nov 2021 02:07:49 +0000
Received: by outflank-mailman (input) for mailman id 224509;
 Thu, 11 Nov 2021 02:07:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfl+=P6=flex--seanjc.bounces.google.com=38nqMYQYKCS0bNJWSLPXXPUN.LXVgNW-MNeNUURbcb.gNWYaXSNLc.XaP@srs-se1.protection.inumbo.net>)
 id 1mkzVE-0004E5-BS
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 02:07:48 +0000
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [2607:f8b0:4864:20::44a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29dda875-4294-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 03:07:47 +0100 (CET)
Received: by mail-pf1-x44a.google.com with SMTP id
 f206-20020a6238d7000000b004a02dd7156bso1477735pfa.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 18:07:47 -0800 (PST)
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
X-Inumbo-ID: 29dda875-4294-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=tzJkfgYHxl8Hqcg8u/5VLHhx3ygcDPf8C0WC2uGyae4=;
        b=sjwIGmNp+e7ADiI1VXuubIUgu7aakWxokn5rB+ZXv/1RKcxJo0o+ayoDqiv1vnmU2t
         y2g+ZGXPL98vD4HTszBT5NRpN6L6QYFfwaOz8SsRcU24JWfcj+LuqRS8WgvoHC3za9ex
         /WUdT0ZunZhSDYaVW9smKXDN8o/rDjmZw2Zm/endCBONkKIwSw23ApNwOZ+5pgK8N8KV
         6QBkHEV8MfWgf59bzLEJ5lyULrdtdjpxQCmIJ8B33Y3VIDQ9nqa1x+eCFwljaNkGWYLU
         jZBt32p8QqA2UeEWF+MxoGjTtfhFzLLo/q8TUyg2rzIUbCtuHlm4371DX81vuqZl9UQ1
         DFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=tzJkfgYHxl8Hqcg8u/5VLHhx3ygcDPf8C0WC2uGyae4=;
        b=P04Yt9RwrxdOW+WBx5UB3DnX7FvtQpPS8M9L2jBW91y36vLacENPnMK4nbHogYut5A
         GqpZbMdx90/23eq3U1bF6FcVR/zN+i8Viex3kHdrao1txU5CtGFz/cCC9dDFr5HL2vKr
         Qo2eQwH2Ma3eaLwtZ1PmwcHSKeOTdj2ZkfPXfHa4yNda3tBzDWZYhCh+uviOMWjsqLg8
         vzzboA3tKxB9ndFrrRCLaVupOQJSijF7NDyq3q3v+OfTW5zpx6w96vbcNaxSoFeGN7GX
         b46VnzB5lZ66J/V7l+59A7j2xmHUA6nPgYV7l3QL+0DwtJuxsWETtLGiJhLLycCmb+Aq
         spOQ==
X-Gm-Message-State: AOAM5332SBv5pVdved8UBzA8Stam/0wg90YNFn8irL+pDAmDzssSZT8f
	FSCoLfV/Ainz3Ntl5OQED2awva3Xuus=
X-Google-Smtp-Source: ABdhPJyeqxRmsuvvw74Iqn1NTFV8lezNbZne36vOAMPd5Dm0FM3Hs8a4MEZrVV1SljCNALtWfHjY5EGOjlQ=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:6acb:b0:142:76c3:d35f with SMTP id
 i11-20020a1709026acb00b0014276c3d35fmr4088456plt.89.1636596466113; Wed, 10
 Nov 2021 18:07:46 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 11 Nov 2021 02:07:24 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-4-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 03/17] KVM: x86: Register Processor Trace interrupt hook
 iff PT enabled in guest
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

Override the Processor Trace (PT) interrupt handler for guest mode if and
only if PT is configured for host+guest mode, i.e. is being used
independently by both host and guest.  If PT is configured for system
mode, the host fully controls PT and must handle all events.

Fixes: 8479e04e7d6b ("KVM: x86: Inject PMI for KVM guest")
Cc: stable@vger.kernel.org
Cc: Like Xu <like.xu.linux@gmail.com>
Reported-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Reported-by: Artem Kashkanov <artem.kashkanov@intel.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 1 +
 arch/x86/kvm/vmx/vmx.c          | 1 +
 arch/x86/kvm/x86.c              | 5 ++++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 2acf37cc1991..bf0a9ce53750 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1514,6 +1514,7 @@ struct kvm_x86_init_ops {
 	int (*disabled_by_bios)(void);
 	int (*check_processor_compatibility)(void);
 	int (*hardware_setup)(void);
+	bool (*intel_pt_intr_in_guest)(void);
 
 	struct kvm_x86_ops *runtime_ops;
 };
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 76861b66bbcf..0927d07b2efb 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7918,6 +7918,7 @@ static struct kvm_x86_init_ops vmx_init_ops __initdata = {
 	.disabled_by_bios = vmx_disabled_by_bios,
 	.check_processor_compatibility = vmx_check_processor_compat,
 	.hardware_setup = hardware_setup,
+	.intel_pt_intr_in_guest = vmx_pt_mode_is_host_guest,
 
 	.runtime_ops = &vmx_x86_ops,
 };
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 021b2c1ac9f0..021d3f5364b2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8451,7 +8451,7 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.is_in_guest		= kvm_is_in_guest,
 	.is_user_mode		= kvm_is_user_mode,
 	.get_guest_ip		= kvm_get_guest_ip,
-	.handle_intel_pt_intr	= kvm_handle_intel_pt_intr,
+	.handle_intel_pt_intr	= NULL,
 };
 
 #ifdef CONFIG_X86_64
@@ -11146,6 +11146,8 @@ int kvm_arch_hardware_setup(void *opaque)
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
+	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
+		kvm_guest_cbs.handle_intel_pt_intr = kvm_handle_intel_pt_intr;
 	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
@@ -11176,6 +11178,7 @@ int kvm_arch_hardware_setup(void *opaque)
 void kvm_arch_hardware_unsetup(void)
 {
 	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	kvm_guest_cbs.handle_intel_pt_intr = NULL;
 
 	static_call(kvm_x86_hardware_unsetup)();
 }
-- 
2.34.0.rc0.344.g81b53c2807-goog



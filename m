Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0832A97001
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962812.1353993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FFl-0004pX-RW; Tue, 22 Apr 2025 15:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962812.1353993; Tue, 22 Apr 2025 15:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FFl-0004mP-OJ; Tue, 22 Apr 2025 15:09:41 +0000
Received: by outflank-mailman (input) for mailman id 962812;
 Tue, 22 Apr 2025 15:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmJA=XI=flex--seanjc.bounces.google.com=3MLEHaAYKCfcrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@srs-se1.protection.inumbo.net>)
 id 1u7FFk-0004m0-0S
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:09:40 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce8d05e7-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:09:38 +0200 (CEST)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-3085f5855c4so4816312a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:09:38 -0700 (PDT)
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
X-Inumbo-ID: ce8d05e7-1f8b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745334576; x=1745939376; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRXArVhux4Bsw70YvwQ+lh5zlccYMqH0xPXNTi9FZ8g=;
        b=uchJLT83A1P/9DSgC2lZQTvyUFPUPUuGTWXf/wB4cpTHDDUs36gBUrrlvDViFddkj2
         lXv4lV8K/zRwXm5/71oFCep55jUdVa5SpAlOQc4B8mE9lzl7mMGPKB+fbFzSWRMvf8i5
         oNQ1KGZJb4HybJvozoEH06GhprDc2mTel1kM78mBWJlUdVyp23fGiKWEDK4xHTY+nlfv
         qsV4rEW6HhLCQUtLuizwt/OMl44hjJ/e+IEPcjalE1emtnEx3NG5ZneT8n+Ms/q0pRxQ
         RqJsPJIqh7RMXGcaARVXD+BRz50CItr6AbxxrwQrMlRopKKyLONXJGHv+wKbka237d4J
         XVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745334576; x=1745939376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRXArVhux4Bsw70YvwQ+lh5zlccYMqH0xPXNTi9FZ8g=;
        b=Cg7I2k8oyeylyVJtwCySPMwJjhg3S1YeVRHsx1Ibv+i8Pvc5Jp7VLSQAPZTnBX/neU
         XC6vwpHI7BPRRexEupthay+IZwWCUqiJgbjDV6SX0VL98x1m/PFz14nrXLdq1pr6v95l
         ljwytCj8DC3IJjspbGu4AwSD+USIA/zye9e2mrpGbr+QJ8cDqE0Q8LwQy0Y9N4m1KoKc
         Eo29fU0zhhaIhxZyzIM3ovk+z7VWgx2Gc/QKwZBTxg77wwaECrxta0gSr6x720dSPhrV
         x/WC3MAllA+30NSOkcDzAHoQyXlZrzg+SlXK+IVKFLTaWhRR7WgYbxu3UApV1xUfpkBo
         PqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuo+Ekd50NQLBRRM1srZNQ1/NYHxqo+I0sAGdsvnw1KuLpgoUTneI9F3G5fLpnYWbsSBX1b+0NfWU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqifirEu9/c+JRLsU82pcZXEAnc98VGj1PTwuxT2B/pdnxHAZA
	cCTPkBU0aPIxvRyBA3HsZLMhXjw9Gm2l3J4WKjdFA20PG/ggWZcf1dPTwzBRfAwimmovapcko4t
	HVw==
X-Google-Smtp-Source: AGHT+IHGR6YFubcBkAQrqhkjsdDwq21aLEhFyH8uteoXFGo84CYqI3Y4PMerNLsX7Qx/XFlRMipUTrfnrN0=
X-Received: from pjbrr7.prod.google.com ([2002:a17:90b:2b47:b0:2fc:2c9c:880])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ecf:b0:2ff:692b:b15
 with SMTP id 98e67ed59e1d1-3087bbca3b0mr26039866a91.33.1745334576501; Tue, 22
 Apr 2025 08:09:36 -0700 (PDT)
Date: Tue, 22 Apr 2025 08:09:34 -0700
In-Reply-To: <20250422082216.1954310-11-xin@zytor.com>
Mime-Version: 1.0
References: <20250422082216.1954310-1-xin@zytor.com> <20250422082216.1954310-11-xin@zytor.com>
Message-ID: <aAexLqjhKncFyw2V@google.com>
Subject: Re: [RFC PATCH v2 10/34] x86/msr: Convert __rdmsr() uses to
 native_rdmsrq() uses
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org, 
	jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com, 
	pbonzini@redhat.com, vkuznets@redhat.com, luto@kernel.org, 
	boris.ostrovsky@oracle.com, kys@microsoft.com, haiyangz@microsoft.com, 
	decui@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 22, 2025, Xin Li (Intel) wrote:
> __rdmsr() is the lowest level primitive MSR read API, and its direct
> use is NOT preferred.

Doesn't mean it's wrong.

> Use its wrapper function native_rdmsrq() instead.

...

> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 1547bfacd40f..e73c1d5ba6c4 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -380,7 +380,7 @@ static __always_inline void vmx_disable_fb_clear(struct vcpu_vmx *vmx)
>  	if (!vmx->disable_fb_clear)
>  		return;
>  
> -	msr = __rdmsr(MSR_IA32_MCU_OPT_CTRL);
> +	msr = native_rdmsrq(MSR_IA32_MCU_OPT_CTRL);
>  	msr |= FB_CLEAR_DIS;
>  	native_wrmsrq(MSR_IA32_MCU_OPT_CTRL, msr);
>  	/* Cache the MSR value to avoid reading it later */
> @@ -7307,7 +7307,7 @@ void noinstr vmx_spec_ctrl_restore_host(struct vcpu_vmx *vmx,
>  		return;
>  
>  	if (flags & VMX_RUN_SAVE_SPEC_CTRL)
> -		vmx->spec_ctrl = __rdmsr(MSR_IA32_SPEC_CTRL);
> +		vmx->spec_ctrl = native_rdmsrq(MSR_IA32_SPEC_CTRL);

And what guarantees that native_rdmsrq() won't have tracing?  Ugh, a later patch
renames native_rdmsrq() => native_rdmsrq_no_trace().

I really don't like this.  It makes simple and obvious code:

	vmx->spec_ctrl = __rdmsr(MSR_IA32_SPEC_CTRL);

so much harder to read:

	vmx->spec_ctrl = native_rdmsrq_no_trace(MSR_IA32_SPEC_CTRL);

and does so in a way that is difficult to review, e.g. I have to peek ahead to
understand that this is even ok.

I strongly prefer that we find a way to not require such verbose APIs, especially
if KVM ends up using native variants throughout.  Xen PV is supposed to be the
odd one out, yet native code is what suffers.  Blech.


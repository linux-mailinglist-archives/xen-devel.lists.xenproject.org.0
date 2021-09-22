Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD64141AC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 08:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192119.342390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvfS-0006ns-MQ; Wed, 22 Sep 2021 06:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192119.342390; Wed, 22 Sep 2021 06:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvfS-0006lD-JA; Wed, 22 Sep 2021 06:23:42 +0000
Received: by outflank-mailman (input) for mailman id 192119;
 Wed, 22 Sep 2021 06:23:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybNQ=OM=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mSvfR-0006l7-LR
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 06:23:41 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a054d97e-1b6d-11ec-b95f-12813bfff9fa;
 Wed, 22 Sep 2021 06:23:39 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-PjkRE_TgM9aZoLw9b0os3g-1; Wed, 22 Sep 2021 02:23:36 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 i4-20020a5d5224000000b0015b14db14deso1090097wra.23
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 23:23:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o1sm1112414wru.91.2021.09.21.23.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:23:34 -0700 (PDT)
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
X-Inumbo-ID: a054d97e-1b6d-11ec-b95f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632291819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zooka9gAajsg8DCKduDSvz7LupNnOu3u1TFHi7y68Yc=;
	b=ShF0BzKOCSqi/IdPbHkO8BChArWbOFIrCNMnt2/Y2nEpCQgEBO/K+qoW5xOb+/4M/CWemu
	2huUb5qYhTmjHJEyNPrgxQJaSI7ntL//fPEkPhmvYbJYGGdNVyl7rcj6qCRqw5ZrJMbL4+
	Fo02AOquiagsE4jQDX/9YU2OVonblJM=
X-MC-Unique: PjkRE_TgM9aZoLw9b0os3g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zooka9gAajsg8DCKduDSvz7LupNnOu3u1TFHi7y68Yc=;
        b=oWCis/M/ghIIcAwVdyPmnIbO9InGV1uNRJuxGSgyPAA1nsD64jS4iDolY4iJxqMil+
         7gK7r6d0GM/XVGxHaBu9+lFcsog8/ofsh1T0wgIs5NReyUbOFP2j/2rn28C+/OwNYTlW
         J29sQkSOIORsPujqApgXGQLkhsD3l6niL99u4FSwG5oqUEiXROOOwCMse3v9d5HDU5cL
         Bos4K27Q99ZSV+OjS7nKgMzEq9MNsenjxTasSJ5LbwG6z7yefMVkzyW0rpApBn1Ys451
         QLdOqMd6vnhQnvvhdW5rb8IYCUsKE++zV8Ja/wlmyBBaoNcQTarIZOS3+RiFnI7/Frp3
         jAwA==
X-Gm-Message-State: AOAM533AjnSEhecxaRfqqJR+fzUBDCCPrMikwd+wARaWWc6XjZRCJ8T2
	3Ii0XDmdfYUnYPqPvyK+pbaLx9wIZJ3S8I4uWPqeRZc4jpKtUWqATANto0a0DyDbxJvLzjCwBk3
	7MW2uA/6QS/iFIhUDJH9gFvl8ApQ=
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr8423440wmj.68.1632291814966;
        Tue, 21 Sep 2021 23:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4Cxl6B3FvPynsb4jNEGdd2w6uOOFopYtreXbLymB/TUbaoz5flccfGAb2LTh0HveeWZIomg==
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr8423394wmj.68.1632291814600;
        Tue, 21 Sep 2021 23:23:34 -0700 (PDT)
Subject: Re: [PATCH v3 02/16] KVM: x86: Register perf callbacks after calling
 vendor's hardware_setup()
To: Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-3-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6e31f767-ae3d-ec87-9880-5a8ebc381192@redhat.com>
Date: Wed, 22 Sep 2021 08:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-3-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/09/21 02:05, Sean Christopherson wrote:
> Wait to register perf callbacks until after doing vendor hardaware setup.
> VMX's hardware_setup() configures Intel Processor Trace (PT) mode, and a
> future fix to register the Intel PT guest interrupt hook if and only if
> Intel PT is exposed to the guest will consume the configured PT mode.
> 
> Delaying registration to hardware setup is effectively a nop as KVM's perf
> hooks all pivot on the per-CPU current_vcpu, which is non-NULL only when
> KVM is handling an IRQ/NMI in a VM-Exit path.  I.e. current_vcpu will be
> NULL throughout both kvm_arch_init() and kvm_arch_hardware_setup().
> 
> Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> Cc: Artem Kashkanov <artem.kashkanov@intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/x86.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 86539c1686fa..fb6015f97f9e 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -8426,8 +8426,6 @@ int kvm_arch_init(void *opaque)
>   
>   	kvm_timer_init();
>   
> -	perf_register_guest_info_callbacks(&kvm_guest_cbs);
> -
>   	if (boot_cpu_has(X86_FEATURE_XSAVE)) {
>   		host_xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
>   		supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
> @@ -8461,7 +8459,6 @@ void kvm_arch_exit(void)
>   		clear_hv_tscchange_cb();
>   #endif
>   	kvm_lapic_exit();
> -	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
>   
>   	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
>   		cpufreq_unregister_notifier(&kvmclock_cpufreq_notifier_block,
> @@ -11064,6 +11061,8 @@ int kvm_arch_hardware_setup(void *opaque)
>   	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
>   	kvm_ops_static_call_update();
>   
> +	perf_register_guest_info_callbacks(&kvm_guest_cbs);
> +
>   	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
>   		supported_xss = 0;
>   
> @@ -11091,6 +11090,8 @@ int kvm_arch_hardware_setup(void *opaque)
>   
>   void kvm_arch_hardware_unsetup(void)
>   {
> +	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
> +
>   	static_call(kvm_x86_hardware_unsetup)();
>   }
>   
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>



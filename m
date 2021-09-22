Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C1A4141B9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 08:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192131.342412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvhc-0007yJ-BS; Wed, 22 Sep 2021 06:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192131.342412; Wed, 22 Sep 2021 06:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSvhc-0007vl-8A; Wed, 22 Sep 2021 06:25:56 +0000
Received: by outflank-mailman (input) for mailman id 192131;
 Wed, 22 Sep 2021 06:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybNQ=OM=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mSvha-0007vX-C2
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 06:25:54 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d59ba1fd-18d6-4068-af71-f413c35fec71;
 Wed, 22 Sep 2021 06:25:53 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-vJgMAaylMuWdhdjrEGpvKA-1; Wed, 22 Sep 2021 02:25:50 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 u10-20020adfae4a000000b0016022cb0d2bso1108753wrd.19
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 23:25:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 25sm5710788wmo.9.2021.09.21.23.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 23:25:47 -0700 (PDT)
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
X-Inumbo-ID: d59ba1fd-18d6-4068-af71-f413c35fec71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632291953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdG5hvixHxpBF3qV2Nc1iurvw1d5rRrVn0cpW/kHHXU=;
	b=S7IqHfFFMo3fmhh0WXJADOV91hRXYxrSVRSsTgBWmU5uKny4aSMEDeoSho4E/tkwaPqReL
	vMzSmCQPMUtHqXI2FnwTYTCJoI6vVOA4UebkT8I6nJ+y5bJtB4skjb17Km3U0M7bH6iB2y
	uHvDF7d84CnnOuefeI+7bp8/InxMCr0=
X-MC-Unique: vJgMAaylMuWdhdjrEGpvKA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gdG5hvixHxpBF3qV2Nc1iurvw1d5rRrVn0cpW/kHHXU=;
        b=XoOvx3SaWOT098iULu4aP8E0jO8WaGMoK9AkFdspmEiVjJfJPAs5yIjNBYQWmiqJBN
         WZHFRnaXjYrMea0EOuXYyN5IBFcP52RqkQ2NW3C8H62/cHgeg4+ErIoFFtH+JiN6lhW+
         ZCFHdesMmRiULQchGE0NH3b0xFwNt9tmPd2+udbXgijLbDDdopLf/7Vh8CPdkiWO9vS6
         O8oMPj6Lhr2vwCXVM/Lz+ZM8/zDva2Vmnby+SDDUsP2lgre5QlwQMzO/AtNjXGmEZkaW
         rH+sA22rsV4usz59VFLGwN9NYUV11cNgSOA3TCqS9yZSB39xQ6WPqo4qjmE1l5aZoI0q
         xwJA==
X-Gm-Message-State: AOAM531YGo7eu2otzF67qqDKgQ052ThcGJbpBEBmYQTfKfYfWwDmJDUy
	sHN5TJcLfvSuLj8p9r1hsj+/x06JMQoCHzvhsuthD0IlownDT62WNHcPYP2oKg1x64oq5YZfl4a
	4gp5VLtyG8r9iNd3ZKXga19vMMGg=
X-Received: by 2002:a1c:f302:: with SMTP id q2mr8427304wmq.56.1632291948895;
        Tue, 21 Sep 2021 23:25:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzItVKh/AhZh5/Igm3bcU7YShmtTIldU49veASOpN+187Ot1E0vGGn3OxfbqcgagpWMesDpA==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr8427271wmq.56.1632291948590;
        Tue, 21 Sep 2021 23:25:48 -0700 (PDT)
Subject: Re: [PATCH v3 04/16] perf: Stop pretending that perf can handle
 multiple guest callbacks
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
 <20210922000533.713300-5-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <37afc465-c12f-01b9-f3b6-c2573e112d76@redhat.com>
Date: Wed, 22 Sep 2021 08:25:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922000533.713300-5-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/09/21 02:05, Sean Christopherson wrote:
> Drop the 'int' return value from the perf (un)register callbacks helpers
> and stop pretending perf can support multiple callbacks.  The 'int'
> returns are not future proofing anything as none of the callers take
> action on an error.  It's also not obvious that there will ever be
> co-tenant hypervisors, and if there are, that allowing multiple callbacks
> to be registered is desirable or even correct.
> 
> Opportunistically rename callbacks=>cbs in the affected declarations to
> match their definitions.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  4 ++--
>   arch/arm64/kvm/perf.c             |  8 ++++----
>   include/linux/perf_event.h        | 12 ++++++------
>   kernel/events/core.c              | 16 ++++------------
>   4 files changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 41911585ae0c..ed940aec89e0 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -670,8 +670,8 @@ unsigned long kvm_mmio_read_buf(const void *buf, unsigned int len);
>   int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
>   int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
>   
> -int kvm_perf_init(void);
> -int kvm_perf_teardown(void);
> +void kvm_perf_init(void);
> +void kvm_perf_teardown(void);
>   
>   long kvm_hypercall_pv_features(struct kvm_vcpu *vcpu);
>   gpa_t kvm_init_stolen_time(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
> index 151c31fb9860..c37c0cf1bfe9 100644
> --- a/arch/arm64/kvm/perf.c
> +++ b/arch/arm64/kvm/perf.c
> @@ -48,15 +48,15 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
>   	.get_guest_ip	= kvm_get_guest_ip,
>   };
>   
> -int kvm_perf_init(void)
> +void kvm_perf_init(void)
>   {
>   	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
>   		static_branch_enable(&kvm_arm_pmu_available);
>   
> -	return perf_register_guest_info_callbacks(&kvm_guest_cbs);
> +	perf_register_guest_info_callbacks(&kvm_guest_cbs);
>   }
>   
> -int kvm_perf_teardown(void)
> +void kvm_perf_teardown(void)
>   {
> -	return perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
> +	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
>   }
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 6b0405e578c1..317d4658afe9 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1245,8 +1245,8 @@ static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
>   	/* Prevent reloading between a !NULL check and dereferences. */
>   	return READ_ONCE(perf_guest_cbs);
>   }
> -extern int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
> -extern int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
> +extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
> +extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
>   
>   extern void perf_event_exec(void);
>   extern void perf_event_comm(struct task_struct *tsk, bool exec);
> @@ -1489,10 +1489,10 @@ perf_sw_event(u32 event_id, u64 nr, struct pt_regs *regs, u64 addr)	{ }
>   static inline void
>   perf_bp_event(struct perf_event *event, void *data)			{ }
>   
> -static inline int perf_register_guest_info_callbacks
> -(struct perf_guest_info_callbacks *callbacks)				{ return 0; }
> -static inline int perf_unregister_guest_info_callbacks
> -(struct perf_guest_info_callbacks *callbacks)				{ return 0; }
> +static inline void perf_register_guest_info_callbacks
> +(struct perf_guest_info_callbacks *cbs)					{ }
> +static inline void perf_unregister_guest_info_callbacks
> +(struct perf_guest_info_callbacks *cbs)					{ }
>   
>   static inline void perf_event_mmap(struct vm_area_struct *vma)		{ }
>   
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 80ff050a7b55..d90a43572400 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6482,31 +6482,23 @@ static void perf_pending_event(struct irq_work *entry)
>   		perf_swevent_put_recursion_context(rctx);
>   }
>   
> -/*
> - * We assume there is only KVM supporting the callbacks.
> - * Later on, we might change it to a list if there is
> - * another virtualization implementation supporting the callbacks.
> - */
>   struct perf_guest_info_callbacks *perf_guest_cbs;
> -
> -int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> +void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>   {
>   	if (WARN_ON_ONCE(perf_guest_cbs))
> -		return -EBUSY;
> +		return;
>   
>   	WRITE_ONCE(perf_guest_cbs, cbs);

Maybe you want a smp_store_release or rcu_assign_pointer here?

> -	return 0;
>   }
>   EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
>   
> -int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> +void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>   {
>   	if (WARN_ON_ONCE(perf_guest_cbs != cbs))
> -		return -EINVAL;
> +		return;
>   
>   	WRITE_ONCE(perf_guest_cbs, NULL);
>   	synchronize_rcu();
> -	return 0;
>   }
>   EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
>   
> 

Apart from the above,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>



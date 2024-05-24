Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC11E8CE492
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 12:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729337.1134469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASdL-0008V8-LT; Fri, 24 May 2024 10:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729337.1134469; Fri, 24 May 2024 10:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASdL-0008TR-IU; Fri, 24 May 2024 10:58:47 +0000
Received: by outflank-mailman (input) for mailman id 729337;
 Fri, 24 May 2024 10:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=di0w=M3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sASdK-0008TJ-RB
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 10:58:46 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 975ee6b1-19bc-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 12:58:45 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2e95a883101so8655681fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 03:58:45 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421088f9d3csm17891275e9.0.2024.05.24.03.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 03:58:44 -0700 (PDT)
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
X-Inumbo-ID: 975ee6b1-19bc-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716548325; x=1717153125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wq0y+5gnfEroqCGPQ7L/DPisiCcV/vib+/kZuqGJw4w=;
        b=Vf4FZdSnI8tBDYlp4K4XHYiM6voXfXwt8b/zaPcMkqAiwos02QjUmw0h2vqbryIe8y
         lbq72aCzr4KYcVwI9L7NJjuF7Bbq1q2USZkL4/CKYj9/Yt3p/zO/dQT5Q5N9D0k//NeK
         0xgp8RdRnaM4c3NFD9dTCU3EffZFRNIA6tpQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716548325; x=1717153125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wq0y+5gnfEroqCGPQ7L/DPisiCcV/vib+/kZuqGJw4w=;
        b=L2fZ4jMVMHuHtXmTR51S+jVBMG7Dn3zkIw33BFP9cGltM57sWkBuWZkKa0Zru43Zcn
         BPpMzjQfs25uWZnnFEd7N9N6/BJBh/J+vFuSkgBBvfTfLpjVVG3tMCsPrkFPp9Ng0HUy
         GQR6y76zljGcOg40KvIdo330OpDmRSrXOZJNk+fe+UGKi3qMK8/YD1leOX0qjy2i0v2D
         oWqpJ0EbM/2vMIr/75UNc/4jTa0izg/WT6+hdPHqsMdMGMt32PmFid5oo2TGqbVV+WDX
         EmFgJ74E5dcNbXWDTUoqwZ5HzyD6JhDtPdG/d9AOliRgglBD1ON8TjZnVOkV5/lCwZwc
         oiFA==
X-Gm-Message-State: AOJu0YzFXZwcv5ozLRIFZTH+BP0r2FDzw0nPVgUBImqx7rZ2wP72vhqA
	BqvgLwj0hGBknjaoIFGGXRMCtMOvlUHqDDaD5ZpNABWu/m2M2CRW92Jr/nfbzgg=
X-Google-Smtp-Source: AGHT+IEQixrthMolI9Bj5IhdBnaNVYfD2O91JfHMl4b9Rvkfiml7hhOOYy6HZPzKis9exdlzVSm93g==
X-Received: by 2002:a2e:7c14:0:b0:2e0:ffea:4298 with SMTP id 38308e7fff4ca-2e95b261b93mr12646101fa.34.1716548325034;
        Fri, 24 May 2024 03:58:45 -0700 (PDT)
Message-ID: <dbd87d6b-c19a-48cc-8838-32b958da980d@cloud.com>
Date: Fri, 24 May 2024 11:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <4095f31a88589ced2b620e8ebbb84cdc2fae8914.1715102098.git.alejandro.vallejo@cloud.com>
 <Zk9TZhe-WSNrnlPD@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <Zk9TZhe-WSNrnlPD@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 15:32, Roger Pau Monné wrote:
>>      case 0xb:
>> -        /*
>> -         * In principle, this leaf is Intel-only.  In practice, it is tightly
>> -         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
>> -         * to guests on AMD hardware as well.
>> -         *
>> -         * TODO: Rework topology logic.
>> -         */
>> -        if ( p->basic.x2apic )
>> +        /* Don't expose topology information to PV guests */
> 
> Not sure whether we want to keep part of the comment about exposing
> x2APIC to guests even when x2APIC is not present in the host.  I think
> this code has changed and the comment is kind of stale now.

The comment is definitely stale. Nowadays x2APIC is fully supported by
AMD, as is leaf 0xb. The fact we emulate the x2APIC seems hardly
relevant in a CPUID leaf about topology. I could keep a note showing...

    /* Exposed alongside x2apic, as it's tightly coupled with it */

... although that's directly implied by the conditional.

>> +void vlapic_cpu_policy_changed(struct vcpu *v)
>> +{
>> +    struct vlapic *vlapic = vcpu_vlapic(v);
>> +    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
>> +
>> +    /*
>> +     * Don't override the initial x2APIC ID if we have migrated it or
>> +     * if the domain doesn't have vLAPIC at all.
>> +     */
>> +    if ( !has_vlapic(v->domain) || vlapic->loaded.hw )
>> +        return;
>> +
>> +    vlapic->hw.x2apic_id = x86_x2apic_id_from_vcpu_id(cp, v->vcpu_id);
>> +    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
> 
> Nit: in case we decide to start APICs in x2APIC mode, might be good to
> take this into account here and use vlapic_x2apic_mode(vlapic) to
> select whether SET_xAPIC_ID() needs to be used or not:>
>     vlapic_set_reg(vlapic, APIC_ID,
>         vlapic_x2apic_mode(vlapic) ? vlapic->hw.x2apic_id
> 	                           : SET_xAPIC_ID(vlapic->hw.x2apic_id));
> 
> Or similar.
> 

I like it. Sure.

>> +}
>> +
>>  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
>>  {
>>      const struct cpu_policy *cp = v->domain->arch.cpu_policy;
>> @@ -1449,7 +1465,7 @@ void vlapic_reset(struct vlapic *vlapic)
>>      if ( v->vcpu_id == 0 )
>>          vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
>>  
>> -    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
>> +    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
>>      vlapic_do_init(vlapic);
>>  }
>>  
>> @@ -1514,6 +1530,16 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>>      const struct vcpu *v = vlapic_vcpu(vlapic);
>>      uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>>  
>> +    /*
>> +     * Loading record without hw.x2apic_id in the save stream, calculate using
>> +     * the traditional "vcpu_id * 2" relation. There's an implicit assumption
>> +     * that vCPU0 always has x2APIC0, which is true for the old relation, and
>> +     * still holds under the new x2APIC generation algorithm. While that case
>> +     * goes through the conditional it's benign because it still maps to zero.
>> +     */
>> +    if ( !vlapic->hw.x2apic_id )
>> +        vlapic->hw.x2apic_id = v->vcpu_id * 2;
>> +
>>      /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
>>      if ( !vlapic_x2apic_mode(vlapic) ||
>>           (vlapic->loaded.ldr == good_ldr) )
>> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
>> index 0c9e6f15645d..e1f0585d75a9 100644
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -448,6 +448,7 @@ static inline void hvm_update_guest_efer(struct vcpu *v)
>>  static inline void hvm_cpuid_policy_changed(struct vcpu *v)
>>  {
>>      alternative_vcall(hvm_funcs.cpuid_policy_changed, v);
>> +    vlapic_cpu_policy_changed(v);
> 
> Note sure whether this call would better be placed in
> cpu_policy_updated() inside the is_hvm_vcpu() conditional branch.
> 
> hvm_cpuid_policy_changed() &c are just wrappers around the hvm_funcs
> hooks, pulling vlapic functions in there is likely to complicate the
> header dependencies in the long term.
> 

That's how it was in v1 and I moved it in v2 answering one of Jan's
feedback points.

I don't mind either way.

>>  }
>>  
>>  static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset,
>> diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
>> index 88ef94524339..e8d41313abd3 100644
>> --- a/xen/arch/x86/include/asm/hvm/vlapic.h
>> +++ b/xen/arch/x86/include/asm/hvm/vlapic.h
>> @@ -44,6 +44,7 @@
>>  #define vlapic_xapic_mode(vlapic)                               \
>>      (!vlapic_hw_disabled(vlapic) && \
>>       !((vlapic)->hw.apic_base_msr & APIC_BASE_EXTD))
>> +#define vlapic_x2apic_id(vlapic) ((vlapic)->hw.x2apic_id)
>>  
>>  /*
>>   * Generic APIC bitmap vector update & search routines.
>> @@ -107,6 +108,7 @@ int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack);
>>  
>>  int  vlapic_init(struct vcpu *v);
>>  void vlapic_destroy(struct vcpu *v);
>> +void vlapic_cpu_policy_changed(struct vcpu *v);
>>  
>>  void vlapic_reset(struct vlapic *vlapic);
>>  
>> diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
>> index 7ecacadde165..1c2ec669ffc9 100644
>> --- a/xen/include/public/arch-x86/hvm/save.h
>> +++ b/xen/include/public/arch-x86/hvm/save.h
>> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
>>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
>>      uint32_t             timer_divisor;
>>      uint64_t             tdt_msr;
>> +    uint32_t             x2apic_id;
>> +    uint32_t             rsvd_zero;
> 
> I think Jan requested for this field to be checked to be 0 for
> incoming migrations, yet I don't see such check added.
> 

It's on the next patch, when the checks are moved into the check hook.
Doing it all as part of the same patch seemed dirty. I guess I can
invert them.

>>  };
>>  
>>  DECLARE_HVM_SAVE_TYPE(LAPIC, 5, struct hvm_hw_lapic);
>> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
>> index d5e447e9dc06..392320b9adbe 100644
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -542,6 +542,15 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>>                                      const struct cpu_policy *guest,
>>                                      struct cpu_policy_errors *err);
>>  
>> +/**
>> + * Calculates the x2APIC ID of a vCPU given a CPU policy
>> + *
>> + * @param p          CPU policy of the domain.
>> + * @param id         vCPU ID of the vCPU.
>> + * @returns x2APIC ID of the vCPU.
>> + */
>> +uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id);
>> +
>>  #endif /* !XEN_LIB_X86_POLICIES_H */
>>  
>>  /*
>> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
>> index f033d22785be..4cef658feeb8 100644
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -2,6 +2,17 @@
>>  
>>  #include <xen/lib/x86/cpu-policy.h>
>>  
>> +uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
>> +{
>> +    /*
>> +     * TODO: Derive x2APIC ID from the topology information inside `p`
>> +     *       rather than from vCPU ID. This bodge is a temporary measure
>> +     *       until all infra is in place to retrieve or derive the initial
>> +     *       x2APIC ID from migrated domains.
>> +     */
>> +    return vcpu_id * 2;
> 
> I don't think this builds?
> 
> Note the parameter is plain 'id' not 'vcpu_id'.
> 
> Thanks, Roger.

Bah. mid-patches after v1 don't get much attention. Ack.

Cheers,
Alejandro


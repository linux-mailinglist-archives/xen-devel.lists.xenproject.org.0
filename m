Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA8588A755
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 16:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697800.1088937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romVM-0001Xn-1G; Mon, 25 Mar 2024 15:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697800.1088937; Mon, 25 Mar 2024 15:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romVL-0001VU-U1; Mon, 25 Mar 2024 15:44:55 +0000
Received: by outflank-mailman (input) for mailman id 697800;
 Mon, 25 Mar 2024 15:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O34W=K7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1romVK-0001VO-11
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 15:44:54 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e93f526-eabe-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 16:44:52 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56bb22ff7baso5279404a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 08:44:52 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t25-20020a056402241900b0056bd13ce50esm3066658eda.44.2024.03.25.08.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 08:44:50 -0700 (PDT)
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
X-Inumbo-ID: 9e93f526-eabe-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711381491; x=1711986291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pif++eEEYvvEp58HeT4WvtkGCSD1np+rt0TaXbTQYqw=;
        b=HHkaIvOqnCVz7ZLtGqi+VPd1OuPO8eaTx2z7pxBDgHoGSTPcfVDXNeHKkg3e86rKgH
         mDoDRl2yQh3qeI4FuLB1vf8EG27fzOxoHxnkcNbkGPmGSCkShLBq07a+QLvI564XA5Fo
         b27OkLla/gykzAom3Bkui+4xXjnOi9HO8VsZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711381491; x=1711986291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pif++eEEYvvEp58HeT4WvtkGCSD1np+rt0TaXbTQYqw=;
        b=LdgboVwpzU2c7pWMY7cZdx6M1EXsKoD7ecF99FK2gHXj0JLUgWM0sdkzgG1WkeLt10
         8nBG0SN3eUUdDEcmt0iskDRBdznw26F+dpGyY5reMpoXglzvi/aOzYy26PgcBDeJsp2S
         q+OZI5S8slGyLhFrEAcsHpdED3nOBVYdTVlUth8lcG6WxkjVi2pzDOBrErjh6QpVsEyT
         /G+KCIp6BCrNX6rXWc3up6N83VpDL9hxS/YDH9U1l7jjOXbL8HTIdgm0ziL+Dbf01P0Y
         TOeu5jEgAh5ipM/Z0sNrXhrwEbfq+9fTzn+7B0hqeVKPETozweF64SQh81G+CgsBwKDq
         nPlw==
X-Gm-Message-State: AOJu0Yws5/R/t9cPRlMOU0qCRrQs2qLbFf/xVrbCmgWJ7FF+DHksUI1E
	baFRGAclvD558O4E7SCBMd+pZR3Z3ubUBotrLfoMnV5TdMdfg9khWks2yGKmFoQ=
X-Google-Smtp-Source: AGHT+IGFk/cyBAn+F511ANUmWb04LwZszBbBkWsY9Sjwyu/Xlr3YG2819EtI0fl2hGavl4vHYIK+vg==
X-Received: by 2002:a50:ab51:0:b0:56b:eb90:f3a2 with SMTP id t17-20020a50ab51000000b0056beb90f3a2mr4278952edc.16.1711381491339;
        Mon, 25 Mar 2024 08:44:51 -0700 (PDT)
Message-ID: <0d0b0174-48dd-4b26-8b54-6eefefac33f6@cloud.com>
Date: Mon, 25 Mar 2024 15:44:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC save
 area
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-2-alejandro.vallejo@cloud.com>
 <Zfm7U7XMzbR6D1qN@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <Zfm7U7XMzbR6D1qN@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I'll answer the policy-related feedback in the next email, as you
corrected yourself for that.

On 19/03/2024 16:20, Roger Pau Monné wrote:
> On Tue, Jan 09, 2024 at 03:38:29PM +0000, Alejandro Vallejo wrote:
>> This allows the initial x2APIC ID to be sent on the migration stream. The
>> hardcoded mapping x2apic_id=2*vcpu_id is maintained for the time being.
>> Given the vlapic data is zero-extended on restore, fix up migrations from
>> hosts without the field by setting it to the old convention if zero.
>>
>> x2APIC IDs are calculated from the CPU policy where the guest topology is
>> defined. For the time being, the function simply returns the old
>> relationship, but will eventually return results consistent with the
>> topology.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>>  xen/arch/x86/cpuid.c                   | 20 ++++---------------
>>  xen/arch/x86/domain.c                  |  3 +++
>>  xen/arch/x86/hvm/vlapic.c              | 27 ++++++++++++++++++++++++--
>>  xen/arch/x86/include/asm/hvm/vlapic.h  |  2 ++
>>  xen/include/public/arch-x86/hvm/save.h |  2 ++
>>  xen/include/xen/lib/x86/cpu-policy.h   |  9 +++++++++
>>  xen/lib/x86/policy.c                   | 11 +++++++++++
>>  7 files changed, 56 insertions(+), 18 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
>> index 7290a979c6..6e259785d0 100644
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -139,10 +139,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>>          const struct cpu_user_regs *regs;
>>  
>>      case 0x1:
>> -        /* TODO: Rework topology logic. */
>>          res->b &= 0x00ffffffu;
>>          if ( is_hvm_domain(d) )
>> -            res->b |= (v->vcpu_id * 2) << 24;
>> +            res->b |= SET_xAPIC_ID(vlapic_x2apic_id(vcpu_vlapic(v)));
> 
> SET_xAPIC_ID() was intended to be used with the APIC_ID register,
> which also shifts the ID.  Not sure it's logically correct to use
> here, even if functionally equivalent (as is shifts left by 24).
Ack.

> 
>>  
>>          /* TODO: Rework vPMU control in terms of toolstack choices. */
>>          if ( vpmu_available(v) &&
>> @@ -311,20 +310,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>>          break;
>>  
>>      case 0xb:
>> -        /*
>> -         * In principle, this leaf is Intel-only.  In practice, it is tightly
>> -         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
>> -         * to guests on AMD hardware as well.
>> -         *
>> -         * TODO: Rework topology logic.
>> -         */
>> -        if ( p->basic.x2apic )
>> -        {
>> -            *(uint8_t *)&res->c = subleaf;
>> -
>> -            /* Fix the x2APIC identifier. */
>> -            res->d = v->vcpu_id * 2;
>> -        }
>> +        /* ecx != 0 if the subleaf is implemented */
>> +        if ( res->c && p->basic.x2apic )
>> +            res->d = vlapic_x2apic_id(vcpu_vlapic(v));
> 
> This needs to be protected so it's reachable by HVM guests only,
> otherwise you will dereference v->arch.hvm.vlapic on a PV vCPU if it
> happens to have p->basic.x2apic set.
Very true. Ack.

> 
> Why not just return the x2apic_id field from the cpu_policy object?
> (topo.subleaf[X].x2apic_id)
> 
> Also, I'm not sure I get why the setting of res->d is gated on res->c
> != 0, won't res->c be 0 when the guest %ecx is 0, yet %edx must be
> valid for all %ecx inputs, the SDM states:
> 
> "The EDX output of leaf 0BH is always valid and does not vary with
> input value in ECX."
> 
> I think you need to keep the previous logic that doesn't gate setting
> ->d on anything other than p->basic.x2apic.
> 

Ack.

Real HW says you're right. Oddly enough that quote is (AFAICS) for leaf
1FH, but it appears to also hold for 0BH.


>>          break;
>>  
>>      case XSTATE_CPUID:
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index 8a31d18f69..e0c7ed8d5d 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -288,7 +288,10 @@ void update_guest_memory_policy(struct vcpu *v,
>>  static void cpu_policy_updated(struct vcpu *v)
>>  {
>>      if ( is_hvm_vcpu(v) )
>> +    {
>>          hvm_cpuid_policy_changed(v);
>> +        vlapic_cpu_policy_changed(v);
>> +    }
>>  }
>>  
>>  void domain_cpu_policy_changed(struct domain *d)
>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>> index cdb69d9742..f500d66543 100644
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -1069,7 +1069,7 @@ static uint32_t x2apic_ldr_from_id(uint32_t id)
>>  static void set_x2apic_id(struct vlapic *vlapic)
>>  {
>>      const struct vcpu *v = vlapic_vcpu(vlapic);
>> -    uint32_t apic_id = v->vcpu_id * 2;
>> +    uint32_t apic_id = vlapic->hw.x2apic_id;
>>      uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
>>  
>>      /*
>> @@ -1083,6 +1083,22 @@ static void set_x2apic_id(struct vlapic *vlapic)
>>      vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
>>  }
>>  
>> +void vlapic_cpu_policy_changed(struct vcpu *v)
>> +{
>> +    struct vlapic *vlapic = vcpu_vlapic(v);
>> +    struct cpu_policy *cp = v->domain->arch.cpu_policy;
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
>> @@ -1514,6 +1530,13 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>>      const struct vcpu *v = vlapic_vcpu(vlapic);
>>      uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>>  
>> +    /*
>> +     * Guest with hardcoded assumptions about x2apic_id <-> vcpu_id
>> +     * mappings. Recreate the mapping it used to have in old host.
> 
> Wouldn't it be more appropriate to state "Loading record without
> hw.x2apic_id in the save stream, calculate using the vcpu_id * 2
> relation" or some such.>
> Current comment makes it looks like the guest has some kind of
> restriction with this relation, but that's just an internal Xen
> limitation.

Sure.

> 
>> +     */
>> +    if ( !vlapic->hw.x2apic_id )
>> +        vlapic->hw.x2apic_id = v->vcpu_id * 2;
>> +
>>      /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
>>      if ( !vlapic_x2apic_mode(vlapic) ||
>>           (vlapic->loaded.ldr == good_ldr) )
>> diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
>> index 88ef945243..e8d41313ab 100644
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
>> index 7ecacadde1..1c2ec669ff 100644
>> --- a/xen/include/public/arch-x86/hvm/save.h
>> +++ b/xen/include/public/arch-x86/hvm/save.h
>> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
>>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
>>      uint32_t             timer_divisor;
>>      uint64_t             tdt_msr;
>> +    uint32_t             x2apic_id;
>> +    uint32_t             rsvd_zero;
> 
> Do we really to add a new field, couldn't we get the lapic IDs from
> the cpu_policy>
>>  };
>>  
>>  DECLARE_HVM_SAVE_TYPE(LAPIC, 5, struct hvm_hw_lapic);
>> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
>> index d5e447e9dc..14724cedff 100644
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
>> + * @param vcpu_id    vCPU ID of the vCPU.
>> + * @returns x2APIC ID of the vCPU.
>> + */
>> +uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id);
>> +
>>  #endif /* !XEN_LIB_X86_POLICIES_H */
>>  
>>  /*
>> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
>> index f033d22785..a3b24e6879 100644
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -2,6 +2,17 @@
>>  
>>  #include <xen/lib/x86/cpu-policy.h>
>>  
>> +uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id)
>> +{
>> +    /*
>> +     * TODO: Derive x2APIC ID from the topology information inside `p`
>> +     *       rather than from vCPU ID. This bodge is a temporary measure
>> +     *       until all infra is in place to retrieve or derive the initial
>> +     *       x2APIC ID from migrated domains.
>> +     */
>> +    return vcpu_id * 2;
> 
> As noted above, won't a suitable initial step would be to populate the
> apic_id and x2apic_id fields in struct cpu_policy with this relation
> (x{,2}apic_id == vcpu_id * 2), and avoid this extra handler?
> 
> Thanks, Roger.

Cheers,
Alejandro



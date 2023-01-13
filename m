Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C65668F42
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 08:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476800.739159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGEW6-0000iO-7a; Fri, 13 Jan 2023 07:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476800.739159; Fri, 13 Jan 2023 07:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGEW6-0000g0-4P; Fri, 13 Jan 2023 07:30:22 +0000
Received: by outflank-mailman (input) for mailman id 476800;
 Fri, 13 Jan 2023 07:30:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3K7w=5K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pGEW4-0000fs-6f
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 07:30:20 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fb243a0-9314-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 08:30:17 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id az20so31211390ejc.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jan 2023 23:30:16 -0800 (PST)
Received: from [192.168.1.93] (adsl-67.109.242.138.tellas.gr. [109.242.138.67])
 by smtp.gmail.com with ESMTPSA id
 15-20020a170906310f00b00738795e7d9bsm8137799ejx.2.2023.01.12.23.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 23:30:15 -0800 (PST)
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
X-Inumbo-ID: 1fb243a0-9314-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dn+bnoVvZ/UNa2MNEKNx9JDAsWdqmdui9lxIIlE1MoI=;
        b=ERYoLubf+XYSFgtjTsuNsN78yVI5OR7hy9Rhy5f9SNbUS9RrwMSxadHxbg+IcEbT6f
         Qttx/TIVC3u3ubL1hLSd3Dc593o+ZN+xxx+ETmd4j0I8/zZdV5HF5qbLQo3EOzAgmgEb
         cKrc6cJaW17xvKf5jhhwfJTo+lyG+wJzAlq4ZHIcBSNYsmSHLFetzZJy60UEpw3HWjtw
         nJiZ5iHg7TFlXUBcPvZPlPJP4Esu3k9NHBc7wN94cb6gh9P0L4sk5FY6aWfoZHuHu+nZ
         ouC1ndJdJ7wOSrJ+F/0975aBxDjGnWOab89RyIHB/jpoLAQS3qi15EfkYvfxtdqEIq7a
         cHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dn+bnoVvZ/UNa2MNEKNx9JDAsWdqmdui9lxIIlE1MoI=;
        b=LX4M5TWCAwDhjdv9fSsc2sppQsX7Vu5uXjSxzEk1YlnPNOxlTLrrsdclCEn1yAPfJm
         E2vgZWdET9zG6SvvUPSOaKaJEeKSoPMNSkJlkPWacGRDyyQgQQyVdoXJjIJn4LBqgY77
         lGjk6eFMRP8ItthS8FUJ/D2MVGuwiJzuC/pY2/lIrh1Su1liYCHqnMo9X2uR8I8px23o
         OEeKvitvmfDT+I7DcA6TALDZBHnRM/aL2wWFTHlvVHu4vqbb+ydmaeRJTG636fZmdXEU
         zpvN/blKRBN9/yx1A707b/i7oSjvNljTSveNMHYVG+Rb9Z41QzH0vo7vvGAa0WwhwhBo
         q3zQ==
X-Gm-Message-State: AFqh2kpFaGx5Yb06N/w/0UPCmPcu4wTYRU9GhjHIY2DdcVOkEa/ztsR4
	mnbPgnaAfYYkY4GB82RFNsk=
X-Google-Smtp-Source: AMrXdXurQr12GQ4mPcB+mw5MYVR4QBl1VK3fQ0CGEhbv0alr4vZjdHUQ0FdJw+2Od22YIV7/yowTDA==
X-Received: by 2002:a17:906:6a05:b0:7c1:28a7:f7a0 with SMTP id qw5-20020a1709066a0500b007c128a7f7a0mr98645100ejc.31.1673595015958;
        Thu, 12 Jan 2023 23:30:15 -0800 (PST)
Message-ID: <04e5b744-bb61-b3d1-7d60-97bb710f7584@gmail.com>
Date: Fri, 13 Jan 2023 09:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 6/8] x86/iommu: call pi_update_irte through an
 hvm_function callback
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-7-burzalodowa@gmail.com>
 <aa20eb4d-7b18-9bbf-718f-2fe5fa896713@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <aa20eb4d-7b18-9bbf-718f-2fe5fa896713@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/12/23 14:16, Jan Beulich wrote:
> On 04.01.2023 09:45, Xenia Ragiadakou wrote:
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2143,6 +2143,14 @@ static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
>>       return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
>>   }
>>   
>> +static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>> +                                       const struct pirq *pirq, uint8_t gvec)
>> +{
>> +    const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
>> +
>> +    return pi_update_irte(pi_desc, pirq, gvec);
>> +}
> 
> This being the only caller of pi_update_irte(), I don't see the point in
> having the extra wrapper. Adjust pi_update_irte() such that it can be
> used as the intended hook directly. Plus perhaps prefix it with vtd_.

Ok I will remove the extra wrapper.

> 
>> @@ -2591,6 +2599,8 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>>       .tsc_scaling = {
>>           .max_ratio = VMX_TSC_MULTIPLIER_MAX,
>>       },
>> +
>> +    .pi_update_irte = vmx_pi_update_irte,
> 
> You want to install this hook only when iommu_intpost (i.e. the only case
> when it can actually be called, and only when INTEL_IOMMU=y (avoiding the
> need for an inline stub of pi_update_irte() or whatever its final name is
> going to be.

Ok will do.

> 
>> @@ -250,6 +252,9 @@ struct hvm_function_table {
>>           /* Architecture function to setup TSC scaling ratio */
>>           void (*setup)(struct vcpu *v);
>>       } tsc_scaling;
>> +
>> +    int (*pi_update_irte)(const struct vcpu *v,
>> +                          const struct pirq *pirq, uint8_t gvec);
>>   };
> 
> Please can this be moved higher up, e.g. next to .

Right after handle_eoi would be ok? or higher up?

> 
>> @@ -774,6 +779,16 @@ static inline void hvm_set_nonreg_state(struct vcpu *v,
>>           alternative_vcall(hvm_funcs.set_nonreg_state, v, nrs);
>>   }
>>   
>> +static inline int hvm_pi_update_irte(const struct vcpu *v,
>> +                                     const struct pirq *pirq, uint8_t gvec)
>> +{
>> +    if ( hvm_funcs.pi_update_irte )
>> +        return alternative_call(hvm_funcs.pi_update_irte, v, pirq, gvec);
>> +
>> +    return -EOPNOTSUPP;
> 
> I don't think the conditional is needed, at least not with the other
> suggested adjustments. Plus the way alternative patching works, a NULL
> hook will be converted to some equivalent of BUG() anyway, so
> ASSERT_UNREACHABLE() should also be unnecessary.

Ok will remove it.

> 
>> +}
>> +
>> +
>>   #else  /* CONFIG_HVM */
> 
> Please don't add double blank lines.

Ok will fix.

> 
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> @@ -146,6 +146,17 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
>>       clear_bit(POSTED_INTR_SN, &pi_desc->control);
>>   }
>>   
>> +#ifdef CONFIG_INTEL_IOMMU
>> +int pi_update_irte(const struct pi_desc *pi_desc,
>> +                   const struct pirq *pirq, const uint8_t gvec);
>> +#else
>> +static inline int pi_update_irte(const struct pi_desc *pi_desc,
>> +                                 const struct pirq *pirq, const uint8_t gvec)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +#endif
> 
> This still is a VT-d function, so I think its declaration would better
> remain in asm/iommu.h.
> 
> Jan

-- 
Xenia


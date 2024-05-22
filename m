Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE20A8CC235
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727666.1132258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9m70-0008Az-Uy; Wed, 22 May 2024 13:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727666.1132258; Wed, 22 May 2024 13:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9m70-00088N-SE; Wed, 22 May 2024 13:34:34 +0000
Received: by outflank-mailman (input) for mailman id 727666;
 Wed, 22 May 2024 13:34:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9m6z-00088H-2J
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:34:33 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04b5b287-1840-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:34:30 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-571ba432477so11578263a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:34:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfde7sm18385336a12.48.2024.05.22.06.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:34:30 -0700 (PDT)
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
X-Inumbo-ID: 04b5b287-1840-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716384870; x=1716989670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cf9soWzvYdTy8NjbCQLAIORudY8WanUALOqCMgKvsfw=;
        b=dXq0OY5o6ToVd/MQi4LJmvTzfyVHSorDQycLFMev2C88yWGGWABkpnBgGWmFZNKu5T
         uGwQnF5vB6YemESCTVJKE+9ANziSWGW/+rqpuYRYGrLqCjM0DLSoVL0b2Az96F3Iv63A
         KabEJQLXjexwdZmo3vJH6oUABMLqcLKaMHtxyleYcY6BEYjjuqN9VmhfMSehNzkxu78/
         Xtj5NmyV7ymfP6CAdwtozjpxvo35AOf9prdS5UxiNoByQaNwR9mmJUQJAhQEEQ9bklUO
         Kb6hkZGRqkjeAs1GmkVA9tBxXanZtFAcyaHwVnGCB4J0cGR7lcVhIIT2SWLaJUtum0JX
         jF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716384870; x=1716989670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cf9soWzvYdTy8NjbCQLAIORudY8WanUALOqCMgKvsfw=;
        b=Lpry4xg+gjVDpdNUQdx6molR0I3cHuz0XAh+Bq+RbtaoFyVHndUJAm7J7YoBVo7e3E
         +6Sb8sNmUIMg0GJJoxG2MIb30BqeEkarvelh7rlK0fMx1+eLWe67zwKJgn4Dr1lBCqi4
         r7SZt0Qj/peN9KDTdhPmCJyf7ZJVDOkSaHurWoNRi32hi+xD1owoGvMuA6le0NqIDbo/
         IJXp6vCT4McPTgFwM/qKq58dUPjjVtUTttt/z8rOwHl21uDUtpB63aoL4XR7xKvKnPfS
         Sgt2Qec9HLLjFGMK+bBz66twi5O7PfOOMPdjuz1pQn4B8ZbW3acjBTFisob3KwtzhZC8
         DcRA==
X-Forwarded-Encrypted: i=1; AJvYcCUbHlQclTTBzRRcm9lsRtHvv3bVtqkn12F88FayGQm5+5rf3/OUhWBwKr4bJwM32E881hoheFI3+ThJo0gDyAMbfmoXqNCS7g1+Qp7as3Y=
X-Gm-Message-State: AOJu0YzN5luOsXESoWsUa3or5TiPm79jHJj6liMZ6okF+VC4f3rUBWSd
	oEASM/KYyVt8MjdfnTIa87D9/oUtlBwrrBolexQOm0pJT5S71MPNNs79Itkxrg==
X-Google-Smtp-Source: AGHT+IGMlS5esugqUatklBs0q8eioDDVcGA7Cmj8xEvRAHh7Y6iHpTCBS9GnM5QzijmRcNopQqUCdw==
X-Received: by 2002:a50:954e:0:b0:56e:2bf4:fe0a with SMTP id 4fb4d7f45d1cf-57832c06250mr1636496a12.35.1716384870426;
        Wed, 22 May 2024 06:34:30 -0700 (PDT)
Message-ID: <5484aab7-b15d-46c5-9ff1-9a5b54640acc@suse.com>
Date: Wed, 22 May 2024 15:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v3 2/3] xen: enable altp2m at create domain
 domctl
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20240517133352.94347-1-roger.pau@citrix.com>
 <20240517133352.94347-3-roger.pau@citrix.com>
 <cd1bf7b0-4a0a-4a38-9129-53822cb8e037@suse.com> <Zk3wMevPye8Rfjm4@macbook>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <Zk3wMevPye8Rfjm4@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2024 15:16, Roger Pau Monné wrote:
> On Tue, May 21, 2024 at 12:30:32PM +0200, Jan Beulich wrote:
>> On 17.05.2024 15:33, Roger Pau Monne wrote:
>>> Enabling it using an HVM param is fragile, and complicates the logic when
>>> deciding whether options that interact with altp2m can also be enabled.
>>>
>>> Leave the HVM param value for consumption by the guest, but prevent it from
>>> being set.  Enabling is now done using and additional altp2m specific field in
>>> xen_domctl_createdomain.
>>>
>>> Note that albeit only currently implemented in x86, altp2m could be implemented
>>> in other architectures, hence why the field is added to xen_domctl_createdomain
>>> instead of xen_arch_domainconfig.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
>> albeit with one question:
>>
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -637,6 +637,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>      bool hap = config->flags & XEN_DOMCTL_CDF_hap;
>>>      bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
>>>      unsigned int max_vcpus;
>>> +    unsigned int altp2m_mode = MASK_EXTR(config->altp2m_opts,
>>> +                                         XEN_DOMCTL_ALTP2M_mode_mask);
>>>  
>>>      if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
>>>      {
>>> @@ -715,6 +717,26 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>          return -EINVAL;
>>>      }
>>>  
>>> +    if ( config->altp2m_opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "Invalid altp2m options selected: %#x\n",
>>> +                config->flags);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if ( altp2m_mode && nested_virt )
>>> +    {
>>> +        dprintk(XENLOG_INFO,
>>> +                "Nested virt and altp2m are not supported together\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if ( altp2m_mode && !hap )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
>>> +        return -EINVAL;
>>> +    }
>>
>> Should this last one perhaps be further extended to permit altp2m with EPT
>> only?
> 
> Hm, yes, that would be more accurate as:
> 
> if ( altp2m_mode && (!hap || !hvm_altp2m_supported()) )

Wouldn't

   if ( altp2m_mode && !hvm_altp2m_supported() )

suffice? hvm_funcs.caps.altp2m is not supposed to be set when no HAP,
as long as HAP continues to be a pre-condition?

> Would you be fine adjusting at commit, or would you prefer me to send
> an updated version?

I'd be happy to fold in whatever we settle on.

Jan



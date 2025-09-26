Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C33BA2F35
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 10:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131338.1470470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23qI-00068B-Re; Fri, 26 Sep 2025 08:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131338.1470470; Fri, 26 Sep 2025 08:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23qI-000665-Oy; Fri, 26 Sep 2025 08:30:14 +0000
Received: by outflank-mailman (input) for mailman id 1131338;
 Fri, 26 Sep 2025 08:30:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v23qI-00065z-1V
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 08:30:14 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0469e81b-9ab3-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 10:30:11 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b29ebf9478bso251886466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 01:30:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5cfa56sm321229466b.20.2025.09.26.01.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 01:30:10 -0700 (PDT)
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
X-Inumbo-ID: 0469e81b-9ab3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758875411; x=1759480211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uF2r96MkuC9TA/BXA2HtEMzQkNste8ou7jkvQUOVgPU=;
        b=VNTus8+1AU1u2MIl3rywmK4UaG+mbgl1+OBGRRyKHdTmYXueqRyfzo3kSEQZywPugu
         FRv0EJF+HWXzHqgsQY4T6KnZYTswl8R4TrTCX1KT6gBbUh9UsdLIN19F5Mo3k3lIpWY8
         SFXr2dbwk+uEdTLrA4HZ0iyr/xeQRpZBOBjpT+WFj5Xpcpp4RsBh7TqxCrBoEGmBNM8N
         +tWDmJTzIKAaUNA/AfHJyPVgJZevTFKWDc45vFpGFsWzaFhewMJPcUGJU6EvxKm6um8H
         6FXgj40y3f8/cR9DHdl3PT9VqtzXagZoWoh8aE8J3EXswnpPXFWPaVCVT5vT7sOXsSlf
         iVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758875411; x=1759480211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uF2r96MkuC9TA/BXA2HtEMzQkNste8ou7jkvQUOVgPU=;
        b=vAB0rjCiiNO0DEaKGWtmMTCLPHgIe2w51T9024XTI9S1HNgwv0UUpUx4R5/+osQAX4
         qenPg+g9wy3B2iDnXaX70mNDCb7qygomlGxw2+cCziaLKBsusTAbC0a0syPh/AYMXxKr
         kBXAFiu5/6jKPnFm+gXXy9Uwp6qNRPrRoGaCZ4V7TahZsPDZ+XBBJsyppT2mP/iZqncz
         S/Pe3tMfGuR1Vlkd251GRyfELvVOM1bm9YK1dbWnQMbI1CXGqpEozQ2EIBWuX5R5HkE7
         /XFBQADRko9M+SM2mnoGiswWP3Y4BxVJbw9M+HDt009ytdj+Oe5eS8MtrWfGeiEXsODM
         WXxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIY1LVZ7zQpG1gec3NKtaFa84++60bHsWCatAbId54WaoGVORBfJmqlOG85pQCkob3Z0fPbESLaR4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0kboioV8AWELwGvfkEG2Acp37stOAyE7alfezkXn3i1oG7dsv
	rYh00dSK3OQ4/5fmL8u3wX7F9utmuBIOZRQJARvF74EWBkzCAk8z2W5U8Hd7jg4GqQ==
X-Gm-Gg: ASbGncuNBZMBepIK3VN99LTZ0+ZXasaByArs7rJJy/QuakST8DN1DJRQ99kbAwedkGj
	0VcPpIcGI4KSODibUALUIDIRbywnMQsG+gLMJvRiFBMZg7/BmW4m+dqfC+ytGfGJhb9TzPvJFWb
	9HquIirTLV8IVS3Yg5Zs7lyuEJRe5pxv8Rt1GhixRQVR5++LGSt/tKmTqoN2iNMQrrOUolygWo0
	g/tptQcq0kFuOb4ASu3rOrEdnOK/VStf0KNK3xcL7VAhI9Ft3wkKZdgOru4tj9hYQEPwcbYBm0E
	lKksmiYjN5hj6iPP3Ix5kN8h3Rn3EBulUXtgjnjE2+9rk6qFmwYWaD37JEyyJC6Hu34io9Tw0F0
	o+PFOxVF+fwFf4pC2kusofuual5XEu8J2QmH7YfW0iwjEtUczt7gUAldfaeAq5chpIJdSzuCVyi
	vizV+HyMU=
X-Google-Smtp-Source: AGHT+IFH0U7Id5YCeVpkA1g2SFVwPLKOQ8JbamVFa/WH5+B3uz/I3xoqZcEqpMTAZxQaDUimFCh2xg==
X-Received: by 2002:a17:907:86ab:b0:b04:6cf7:75d4 with SMTP id a640c23a62f3a-b34bcd5959amr655797666b.49.1758875410631;
        Fri, 26 Sep 2025 01:30:10 -0700 (PDT)
Message-ID: <bdf1b73c-b0fa-4076-928d-87a3d1e00855@suse.com>
Date: Fri, 26 Sep 2025 10:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-19-Penny.Zheng@amd.com>
 <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
 <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <66b43c3b-c74f-4c18-b91a-bd7b56a62eff@suse.com>
 <DM4PR12MB84518B65027B6A355ED4D246E11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <af57c032-541d-4956-85de-269066c50cd3@suse.com>
 <IA1PR12MB8467188458BA8FAF348AC538E11EA@IA1PR12MB8467.namprd12.prod.outlook.com>
 <a5224376-f89d-4a2f-8a74-e5256352f754@suse.com>
 <DM4PR12MB845154E8F43D440FEADFF59BE11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
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
In-Reply-To: <DM4PR12MB845154E8F43D440FEADFF59BE11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.09.2025 10:22, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, September 26, 2025 3:14 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Daniel P. Smith
>> <dpsmith@apertussolutions.com>; xen-devel@lists.xenproject.org; Andryuk, Jason
>> <Jason.Andryuk@amd.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Anthony
>> PERARD <anthony.perard@vates.tech>; Orzel, Michal <Michal.Orzel@amd.com>;
>> Roger Pau Monné <roger.pau@citrix.com>; Oleksii Kurochko
>> <oleksii.kurochko@gmail.com>
>> Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
>> CONFIG_MGMT_HYPERCALLS
>>
>> On 26.09.2025 08:57, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Friday, September 26, 2025 2:53 PM
>>>>
>>>> On 26.09.2025 06:41, Penny, Zheng wrote:
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: Thursday, September 25, 2025 10:29 PM
>>>>>>
>>>>>> On 25.09.2025 11:41, Penny, Zheng wrote:
>>>>>>>> -----Original Message-----
>>>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>>>> Sent: Thursday, September 11, 2025 9:30 PM
>>>>>>>>
>>>>>>>> On 10.09.2025 09:38, Penny Zheng wrote:
>>>>>>>>> --- a/xen/include/xsm/xsm.h
>>>>>>>>> +++ b/xen/include/xsm/xsm.h
>>>>>>>>> @@ -55,8 +55,8 @@ struct xsm_ops {
>>>>>>>>>      void (*security_domaininfo)(struct domain *d,
>>>>>>>>>                                  struct xen_domctl_getdomaininfo *info);
>>>>>>>>>      int (*domain_create)(struct domain *d, uint32_t ssidref);
>>>>>>>>> -    int (*getdomaininfo)(struct domain *d);
>>>>>>>>>  #ifdef CONFIG_MGMT_HYPERCALLS
>>>>>>>>> +    int (*getdomaininfo)(struct domain *d);
>>>>>>>>>      int (*domctl_scheduler_op)(struct domain *d, int op);
>>>>>>>>>      int (*sysctl_scheduler_op)(int op);
>>>>>>>>>      int (*set_target)(struct domain *d, struct domain *e); @@
>>>>>>>>> -234,7
>>>>>>>>> +234,11 @@ static inline int xsm_domain_create(
>>>>>>>>>
>>>>>>>>>  static inline int xsm_getdomaininfo(xsm_default_t def, struct
>>>>>>>>> domain
>>>>>>>>> *d)  {
>>>>>>>>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>>>>>>>>      return alternative_call(xsm_ops.getdomaininfo, d);
>>>>>>>>> +#else
>>>>>>>>> +    return -EOPNOTSUPP;
>>>>>>>>> +#endif
>>>>>>>>>  }
>>>>>>>>
>>>>>>>> This is in use by a Xenstore sysctl and a Xenstore domctl. The
>>>>>>>> sysctl is hence already broken with the earlier series. Now the
>>>>>>>> domctl is also being screwed up. I don't think MGMT_HYPERCALLS
>>>>>>>> really ought to extend to any operations available to other than
>>>>>>>> the core
>>>> toolstack.
>>>>>>>> That's the Xenstore ones here, but also the ones used by qemu
>>>>>>>> (whether run in
>>>>>> Dom0 or a stubdom).
>>>>>>>
>>>>>>> Maybe not only limited to the core toolstack. In
>>>>>>> dom0less/hyperlaunched
>>>>>> scenarios, hypercalls are strictly limited. QEMU is also limited to
>>>>>> pvh machine type and with very restricted functionality(, only
>>>>>> acting as a few virtio-pci devices backend). @Andryuk, Jason
>>>>>> @Stabellini, Stefano Am I understanding correctly and thoroughly
>>>>>> about our scenario here for
>>>> upstream?
>>>>>>> Tracking the codes, if Xenstore is created as a stub domain, it
>>>>>>> requires
>>>>>> getdomaininfo-domctl to acquire related info.  Sorry, I haven't
>>>>>> found how it was called in QEMU...
>>>>>>
>>>>>> It's not "it"; it's different ones. First and foremost I was
>>>>>> thinking of
>>>>>>  * XEN_DOMCTL_ioport_mapping
>>>>>>  * XEN_DOMCTL_memory_mapping
>>>>>>  * XEN_DOMCTL_bind_pt_irq
>>>>>>  * XEN_DOMCTL_unbind_pt_irq
>>>>>> but there may be others (albeit per the dummy xsm_domctl() this is
>>>>>> the full set). As a general criteria, anything using XSM_DM_PRIV
>>>>>> checking can in principle be called by qemu.
>>>>>>
>>>>>
>>>>> Understood.
>>>>> I assume that they are all for device passthrough. We are not
>>>>> accepting device
>>>> passthrough via core toolstack in dom0less/hyperlaunch-ed scenarios.
>>>> Jason has developed device passthrough through device tree to only
>>>> accept "static configured" passthrough in dom0less/hyperlaunch-ed
>>>> scenario, while it is still internal , it may be the only accept way
>>>> to do device passthrough in dom0less/hyperlaunch-ed scenario.
>>>>
>>>> Right, but no matter what your goals, the upstream contributions need
>>>> to be self- consistent. I.e. not (risk to) break other functionality.
>>>> (Really the four domctl-s mentioned above might better have been put
>>>> elsewhere, e.g. as dm-ops. Moving them may be an option here.)
>>>
>>> Understood.
>>> I'll move them all to the dm-ops
>>
>> Before you do so, please consider the consequences, though (I said "may" for a
>> reason). Also please allow others to chime in. (In this context I notice that several
>> REST maintainers weren't even Cc-ed here, and hence may not have seen the
>> earlier discussion.)
>>
> 
> Sorry, what I really mean is that I'm going to investigate the actual work required for moving these four hypercalls to dm-ops. Then I could go back to the discussion to have a clearer view. To be clear, you are suggesting ABI change, like XEN_DOMCTL_ioport_mapping to XEN_DMOP_ioport_mapping, or new ABI added?

Well, merely adding new ABIs wouldn't address the problem, would it? You'd
need to make sure the old ABIs aren't used anymore by up-to-date code, at
which point the old domctl sub-ops could as well go away. A follow-on
question then would be whether retaining the wrappers in libxc is
appropriate; aiui dm-ops are rather intended to be dealt with in
libxendevicemodel. Yet moving things between libraries can (will?) break
consumers of the libraries.

Jan


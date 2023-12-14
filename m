Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F89812C59
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 10:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654379.1021234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDiUA-0007Sf-G2; Thu, 14 Dec 2023 09:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654379.1021234; Thu, 14 Dec 2023 09:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDiUA-0007Py-Ch; Thu, 14 Dec 2023 09:58:30 +0000
Received: by outflank-mailman (input) for mailman id 654379;
 Thu, 14 Dec 2023 09:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDiU8-0007Ps-Rf
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 09:58:28 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52f55fec-9a67-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 10:58:26 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54f4f7e88feso8683204a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 01:58:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cq27-20020a056402221b00b00551e7858f79sm1770432edb.15.2023.12.14.01.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 01:58:25 -0800 (PST)
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
X-Inumbo-ID: 52f55fec-9a67-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702547905; x=1703152705; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/APPL2CK1gXpzmHmxrhqhtZqCeWUIKKJ9tKJwZKEx4=;
        b=ZFYKtXfoSUGtTa4b9gTkhGOMCh10VyqvvHb1IEioBr/u9iM7Nb0uKiWyLsuynpCDhF
         kCZ/HiLmFT3DcLGNui0kLdCjB+Fsz44CR3AhsveC2wYcGyCQetzhUNt17WJVJDAksP6N
         oAuNs3VkfwehcEuNgQO+9LzfCPEttDjEetGOxtdu4pJqgGAqZ8Tm6r8IoIL+XZaY3B+T
         dpKsdXtwiUpTeg0AozRM07gmWKhEsMd0aljAKUMmko0qV+/8c9OzphAsf9cOF6HJaYlJ
         l7Bii17eyYQagS1V9pNMPl3O5WZ9qt12Sp5pIArlxFCfmDGI5J8A9qSaKGpdRZfAbQ2E
         8J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702547905; x=1703152705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/APPL2CK1gXpzmHmxrhqhtZqCeWUIKKJ9tKJwZKEx4=;
        b=sCqTqMbFtD1nYZJrE+udemyAO96lPy7PM+IvZ0luXPZsnHqe2DCbojST4gMlI9XJJr
         XhrSImruol+SEzTNVNE2rUsIh8Al8HBLaGqt9mRjVzI7tNbziYsIMF0YSnc3ga2l2cUN
         hJDtngDQmlNVlmfG7fsOt7sfNcZMR+DVcchAHqNCTRzXvYfGO4l+C4W3sfuD74LYUGkw
         XpoWdltWdlbRD+fkzx0YCC2w648nEFr1iTGmQSDQS4fB7e0ToY5QUP7fATAobGzEA53U
         qJie1SewLr89O4BBgDBpQQhNgF4h5rzz6BawiwmTSYxPlYsqL1UhIGwujWTofeuViCr0
         LNhQ==
X-Gm-Message-State: AOJu0YyNBXO/L6TKBVc8LQHLXm1Xau9yIkWK4qTWbXoNtacV4U2LHWUX
	oe8kRoY10+Ytj40kjyNeWjGG
X-Google-Smtp-Source: AGHT+IGFqm9baaA+4ynlHT5id9JoljE6OF7is745z64duoJA8jB8N0jKj2MXbyx6CEGdFhkiYqKspw==
X-Received: by 2002:a50:ab1c:0:b0:54c:4837:a642 with SMTP id s28-20020a50ab1c000000b0054c4837a642mr5184035edc.47.1702547905543;
        Thu, 14 Dec 2023 01:58:25 -0800 (PST)
Message-ID: <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com>
Date: Thu, 14 Dec 2023 10:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com> <ZXcrX44ceUjzjtDh@macbook>
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXrRG8oc25Do0Dnv@macbook>
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
In-Reply-To: <ZXrRG8oc25Do0Dnv@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.12.2023 10:55, Roger Pau Monné wrote:
> On Thu, Dec 14, 2023 at 08:55:45AM +0000, Chen, Jiqian wrote:
>> On 2023/12/13 15:03, Jan Beulich wrote:
>>> On 13.12.2023 03:47, Chen, Jiqian wrote:
>>>> On 2023/12/12 17:30, Jan Beulich wrote:
>>>>> On 12.12.2023 07:49, Chen, Jiqian wrote:
>>>>>> On 2023/12/11 23:31, Roger Pau Monné wrote:
>>>>>>> On Mon, Dec 11, 2023 at 12:40:08AM +0800, Jiqian Chen wrote:
>>>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
>>>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>>>>>>> @@ -72,8 +72,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>>>  
>>>>>>>>      switch ( cmd )
>>>>>>>>      {
>>>>>>>> +    case PHYSDEVOP_setup_gsi:
>>>>>>>
>>>>>>> I think given the new approach on the Linux side patches, where
>>>>>>> pciback will configure the interrupt, there's no need to expose
>>>>>>> setup_gsi anymore?
>>>>>> The latest patch(the second patch of v3 on kernel side) does setup_gsi and map_pirq for passthrough device in pciback, so we need this and below.
>>>>>>
>>>>>>>
>>>>>>>>      case PHYSDEVOP_map_pirq:
>>>>>>>>      case PHYSDEVOP_unmap_pirq:
>>>>>>>> +        if ( is_hardware_domain(currd) )
>>>>>>>> +            break;
>>>>>>>
>>>>>>> Also Jan already pointed this out in v2: this hypercall needs to be
>>>>>>> limited so a PVH dom0 cannot execute it against itself.  IOW: refuse
>>>>>>> the hypercall if DOMID_SELF or the passed domid matches the current
>>>>>>> domain domid.
>>>>>> Yes, I remember Jan's suggestion, but since the latest patch(the second patch of v3 on kernel side) has change the implementation, it does setup_gsi and map_pirq for dom0 itself, so I didn't add the DOMID_SELF check.
>>>>>
>>>>> And why exactly would it do specifically the map_pirq? (Even the setup_gsi
>>>>> looks questionable to me, but there might be reasons there.)
>>>> Map_pirq is to solve the check failure problem. (pci_add_dm_done-> xc_domain_irq_permission-> XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0)
>>>> Setup_gsi is because the gsi is never be unmasked, so the gsi is never be registered( vioapic_hwdom_map_gsi-> mp_register_gsi is never be called).
>>>
>>> And it was previously made pretty clear by Roger, I think, that doing a "map"
>>> just for the purpose of granting permission is, well, at best a temporary
>>> workaround in the early development phase. If there's presently no hypercall
>>> to _only_ grant permission to IRQ, we need to add one.
>> Could you please describe it in detail? Do you mean to add a new hypercall to grant irq access for dom0 or domU?
>> It seems XEN_DOMCTL_irq_permission is the hypercall to grant irq access from dom0 to domU(see XEN_DOMCTL_irq_permission-> irq_permit_access). There is no need to add hypercall to grant irq access.
>> We failed here (XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0) is because the PVH dom0 didn't use PIRQ, so we can't get irq from pirq if "current" is PVH dom0.
> 
> One way to bodge this would be to detect whether the caller of
> XEN_DOMCTL_irq_permission is a PV or an HVM domain, and in case of HVM
> assume the pirq field is a GSI.  I'm unsure however how that will work
> with non-x86 architectures.
> 
> It would  be better to introduce a new XEN_DOMCTL_gsi_permission, or
> maybe XEN_DOMCTL_intr_permission that can take a struct we can use to
> accommodate GSIs and other arch specific interrupt identifiers.

How would you see MSI being handled then?

Jan


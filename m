Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2EE942961
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 10:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768358.1179132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4uh-0003Gf-CF; Wed, 31 Jul 2024 08:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768358.1179132; Wed, 31 Jul 2024 08:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4uh-0003EC-8c; Wed, 31 Jul 2024 08:42:27 +0000
Received: by outflank-mailman (input) for mailman id 768358;
 Wed, 31 Jul 2024 08:42:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ4ug-0003E6-8l
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 08:42:26 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cee095a1-4f18-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 10:42:24 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7ac449a0e6so432702366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 01:42:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad92cd7sm751377066b.179.2024.07.31.01.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 01:42:23 -0700 (PDT)
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
X-Inumbo-ID: cee095a1-4f18-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722415344; x=1723020144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VQ4db3DPtRbnbT66oPVaHUGVueoF1qyqImupOtp+U7s=;
        b=HNcdfbQWyVxpk+5MjehWI3kGsKOPb1QB1zx/zqjWIcYG6NJndPIBdnrI32hE0UApST
         ry007EBhUPejiXE7jMDuFjBPQgqcos/xK+M7vM/0JB59ulp0jWhukcpoNfhhm+T4n6UL
         C7F7Q4p0o/6VaAtKFWXh0wS62DW6MkKVtrMTKRdxowi2MRiErMcpDpFcspAy4unbVzTv
         fUzHZoyQefLAKObyC5iZ+i7ojqLBdQvJtYUN6TITVGDsvVmu/5YpYhynpTktDaionY9W
         9L07aS28W3A6YMreq8AjhEx8oOIzjy/od3q5IHmEXYvgXC4QADIEF4s9GqFkVS87lzAl
         Mf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722415344; x=1723020144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQ4db3DPtRbnbT66oPVaHUGVueoF1qyqImupOtp+U7s=;
        b=M6gSYYWTDjldF0/znDCykiC7H/oKLcDOMsOwPyxCVh2KFyGe3pxcXo6MsEsgz4A+Es
         CUDdJnUS1aJd482oy74V4z59PsK601XjUbDZhlTs1UABycE4wzpoN8wWGTkZJgqxTjx9
         pfcC/nb7FpQBTD08MQVd92Cu0zKn1vXMgPBJCBmxb6Bt825+frvYX8IkNxxXDpj68ZPS
         8pzBJnabQvcfCQ+mNzbmy5F//Q8/tcbQVgLLrGTvlT2RPa060KITlZDhtT1R8Oj17Yz1
         Gc4ERKtNfX8HwWbnyhMeaKaw+O0mdMRuP1invE8QalTP7mUwC6Q2qqjtUE8mITEiMTDk
         hIGA==
X-Gm-Message-State: AOJu0YyZCBR8TQcCjujjtXNHVl4+ucV+6P7KF4BlbvB8iYh0ZLpGmehl
	m2oei+XLzwOEbVFV7p6LjbwHrKa+M0Kmz+gujVlrY5QBjztw6naF8jBRuuWeOw==
X-Google-Smtp-Source: AGHT+IFWP5G163EGfjSDIl+FfE0bi8BJnVghsI/q5Vhm3J5F9tpmtTzNJH+Uvm+3gZ89twWWPQW2eQ==
X-Received: by 2002:a17:907:c00f:b0:a77:c827:2cb2 with SMTP id a640c23a62f3a-a7d40138f7emr604305966b.44.1722415343434;
        Wed, 31 Jul 2024 01:42:23 -0700 (PDT)
Message-ID: <e0ef652b-3651-4b25-a6b0-debb7fc3604a@suse.com>
Date: Wed, 31 Jul 2024 10:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com>
 <d08179b1-a114-4ae9-a6da-e907f2c027c3@citrix.com>
 <BL1PR12MB584905C225BE759A633DEAAEE7B12@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584905C225BE759A633DEAAEE7B12@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 10:31, Chen, Jiqian wrote:
> On 2024/7/30 21:09, Andrew Cooper wrote:
>> On 08/07/2024 12:41 pm, Jiqian Chen wrote:
>>> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
>>> a passthrough device by using gsi, see qemu code
>>> xen_pt_realize->xc_physdev_map_pirq and libxl code
>>> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
>>> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
>>> is not allowed because currd is PVH dom0 and PVH has no
>>> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
>>>
>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
>>> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
>>> And add a new check to prevent (un)map when the subject domain
>>> doesn't have a notion of PIRQ.
>>>
>>> So that the interrupt of a passthrough device can be
>>> successfully mapped to pirq for domU with a notion of PIRQ
>>> when dom0 is PVH
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> ---
>>>  xen/arch/x86/hvm/hypercall.c |  6 ++++++
>>>  xen/arch/x86/physdev.c       | 12 ++++++++++--
>>>  2 files changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
>>> index 0fab670a4871..03ada3c880bd 100644
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -71,8 +71,14 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>  
>>>      switch ( cmd )
>>>      {
>>> +        /*
>>> +        * Only being permitted for management of other domains.
>>> +        * Further restrictions are enforced in do_physdev_op.
>>> +        */
>>>      case PHYSDEVOP_map_pirq:
>>>      case PHYSDEVOP_unmap_pirq:
>>> +        break;
>>> +
>>>      case PHYSDEVOP_eoi:
>>>      case PHYSDEVOP_irq_status_query:
>>>      case PHYSDEVOP_get_free_pirq:
>>> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
>>> index d6dd622952a9..9f30a8c63a06 100644
>>> --- a/xen/arch/x86/physdev.c
>>> +++ b/xen/arch/x86/physdev.c
>>> @@ -323,7 +323,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          if ( !d )
>>>              break;
>>>  
>>> -        ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
>>> +        /* Only mapping when the subject domain has a notion of PIRQ */
>>> +        if ( !is_hvm_domain(d) || has_pirq(d) )
>>> +            ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
>>> +        else
>>> +            ret = -EOPNOTSUPP;
>>>  
>>>          rcu_unlock_domain(d);
>>>  
>>> @@ -346,7 +350,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          if ( !d )
>>>              break;
>>>  
>>> -        ret = physdev_unmap_pirq(d, unmap.pirq);
>>> +        /* Only unmapping when the subject domain has a notion of PIRQ */
>>> +        if ( !is_hvm_domain(d) || has_pirq(d) )
>>> +            ret = physdev_unmap_pirq(d, unmap.pirq);
>>> +        else
>>> +            ret = -EOPNOTSUPP;
>>>  
>>>          rcu_unlock_domain(d);
>>>  
>>
>> Gitlab is displeased with your offering.
>>
>> https://gitlab.com/xen-project/xen/-/pipelines/1393459622
>>
>> This breaks both {adl,zen3p}-pci-hvm-x86-64-gcc-debug, and given the:
>>
>> (XEN) [    8.150305] HVM restore d1: CPU 0
>> libxl: error: libxl_pci.c:1491:pci_add_dm_done: Domain
>> 1:xc_physdev_map_pirq irq=18 (error=-1): Not supported
>> libxl: error: libxl_pci.c:1809:device_pci_add_done: Domain
>> 1:libxl__device_pci_add failed for PCI device 0:3:0.0 (rc -3)
>> libxl: error: libxl_create.c:1962:domcreate_attach_devices: Domain
>> 1:unable to add pci devices
>> libxl: error: libxl_xshelp.c:206:libxl__xs_read_mandatory: xenstore read
>> failed: `/libxl/1/type': No such file or directory
>> libxl: warning: libxl_dom.c:49:libxl__domain_type: unable to get domain
>> type for domid=1, assuming HVM
>> libxl: error: libxl_domain.c:1616:domain_destroy_domid_cb: Domain
>> 1:xc_domain_destroy failed: No such process
> 
> Sorry to forget to validate the scenario of "hvm_pirq=0" for HVM guest since V10->V11(remove the self-check "d == currd").
> 
> V10 version:
> +        /* Prevent self-map when currd has no X86_EMU_USE_PIRQ flag */
> +        if ( is_hvm_domain(d) && !has_pirq(d) && d == currd )
> +        {
> +            rcu_unlock_domain(d);
> +            return -EOPNOTSUPP;
> +        }
> 
> V11 version:
> +        /* Prevent mapping when the subject domain has no X86_EMU_USE_PIRQ */
> +        if ( is_hvm_domain(d) && !has_pirq(d) )
> +        {
> +            rcu_unlock_domain(d);
> +            return -EOPNOTSUPP;
> +        }
> 
> V10 is fine for when hvm_pirq is enable or disable. 
> This issue is from V11, the cause is that when pass "hvm_pirq=0" to HVM guest, then has_pirq() is false, but it still uses the pirq to route the interrupt of passthrough devices.
> So, it still does xc_physdev_(un)map_pirq, then fails at the has_pirq() check.
> 
> Hi Jan,
> Should I need to change to V10 to only prevent the self-mapping when the subject domain has no PIRQ?
> So that it can allow PHYSDEVOP_map_pirq for foreign mapping, no matter the dom0 or the domU has PIRQ or not?

No, my position there hasn't changed. I continue to view it as wrong to
have any d == currd checks here.

Jan


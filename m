Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F0910193
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 12:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744400.1151442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKFB2-0003oZ-9D; Thu, 20 Jun 2024 10:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744400.1151442; Thu, 20 Jun 2024 10:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKFB2-0003mZ-6b; Thu, 20 Jun 2024 10:38:00 +0000
Received: by outflank-mailman (input) for mailman id 744400;
 Thu, 20 Jun 2024 10:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKFAz-0003mS-Q8
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 10:37:57 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2785b7cf-2ef1-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 12:37:56 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cdbso6705721fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 03:37:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc9257e0sm12078749b3a.29.2024.06.20.03.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 03:37:54 -0700 (PDT)
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
X-Inumbo-ID: 2785b7cf-2ef1-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718879875; x=1719484675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2aHqXuO00w7ji2jtcKC8/O8t1tpR10+HdA38yi/DVN4=;
        b=dWwpQps69tcx5NzHDDZaPXkYJvqoD1q/iGSlUh89j0dlXo97ZznbwI/yDG3ezFUJd9
         OoQYTe8eTkJEsUoyTm3mabQdFoY+C7OiJnrxh1XbUUMdC3qAZlztcRPgK5+khfJCGYnA
         rTvEBBaqDipkAJ9aID4ORJx3LkTWAxqXCF+O2EeH/iglqkZtwj/M4dAJ/5vnCWf5yJQZ
         +XcvvztFuRyy0zIwShjtLYZcPVW/nGgQFd+eqXA2heSyvytwclF4rncrSwvbre7BGE9l
         O16XaLRNYiW0ggaEP+Fz4pysngRLVN3fFp34jLmaZCryKQO23Uez6Fpu8+biPAHYkPKj
         RBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718879875; x=1719484675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aHqXuO00w7ji2jtcKC8/O8t1tpR10+HdA38yi/DVN4=;
        b=iAHIDj1p6XF7CV1vdE10bf6RoaklS63AWryYGmuqp7zb95P4sbQIf6ghp30rIHrwNQ
         Y4XYzhaiKPgIUVCHawz901px5/cf79M1Xe4yPkZp/HwQPcjIImQpy3moJf9ngImXVO35
         Zw+9yf679O5wGY6QsxPEmn2j65UZHgHK11J/6jYej/fT4Zjqw8NpHxUbyGZ8MbO0rJgN
         Z3FYnEsYk8qX269O6QFzYVeJCKbRC8E0K83or4dSDjfASpavayJnwkBlwhx5mz1pw3Ol
         NRY8i7gBb1LA2dI9vHqxlUzQhJb4pJROJ+GdRNpeN1wfGp6VJMquiqF8sBNHa4LyMPlN
         0Y2g==
X-Forwarded-Encrypted: i=1; AJvYcCVSMQ3HZu6QtV6rpFKcqzpD5GvbvDYItgwgragSy7md9/0tpfZ/hRFwINLsRlaMiNQZh7rHrkuPjwDVEKmCFrOXKMWtvgC3I8vK/YIPA3o=
X-Gm-Message-State: AOJu0YyBJAF5LKoOsG0Z29DsWtioJf4GEuDdgndaHw+sx/t17ZKsTQFl
	PP2iMIWN0zNbSJy3rdxUPh2kcGPGJES7+1Y4a7mA+tx+eDx0ERMo5JNF2jPO2w==
X-Google-Smtp-Source: AGHT+IGltburmZWyUjsaqo4pb6m/mWOQpg4dJtTge6jZyX55qnjRHnF4R/9GWWhLqFlAX+w1useOOQ==
X-Received: by 2002:a2e:9604:0:b0:2ec:3cdf:6401 with SMTP id 38308e7fff4ca-2ec3ceb7ceamr33950031fa.17.1718879875239;
        Thu, 20 Jun 2024 03:37:55 -0700 (PDT)
Message-ID: <3352736b-e7bc-40d0-ac1f-e58de188c93c@suse.com>
Date: Thu, 20 Jun 2024 12:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 4/5] tools: Add new function to get gsi from dev
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-5-Jiqian.Chen@amd.com>
 <49563a31-d50e-4015-88ee-e0dab9193cd1@suse.com>
 <BL1PR12MB584910D242D9D8B4BA8B15C1E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ab99b766-7bec-4046-beb2-f77a2591a911@suse.com>
 <BL1PR12MB5849ABD858B72505D83678F9E7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <099beaac-ed1f-459b-8c2b-42b325f8e4a4@suse.com>
 <BL1PR12MB5849366A442BE6C4C192ABB0E7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849366A442BE6C4C192ABB0E7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2024 12:23, Chen, Jiqian wrote:
> On 2024/6/20 15:43, Jan Beulich wrote:
>> On 20.06.2024 09:03, Chen, Jiqian wrote:
>>> On 2024/6/18 17:13, Jan Beulich wrote:
>>>> On 18.06.2024 10:10, Chen, Jiqian wrote:
>>>>> On 2024/6/17 23:10, Jan Beulich wrote:
>>>>>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>>>>>> --- a/tools/libs/light/libxl_pci.c
>>>>>>> +++ b/tools/libs/light/libxl_pci.c
>>>>>>> @@ -1406,6 +1406,12 @@ static bool pci_supp_legacy_irq(void)
>>>>>>>  #endif
>>>>>>>  }
>>>>>>>  
>>>>>>> +#define PCI_DEVID(bus, devfn)\
>>>>>>> +            ((((uint16_t)(bus)) << 8) | ((devfn) & 0xff))
>>>>>>> +
>>>>>>> +#define PCI_SBDF(seg, bus, devfn) \
>>>>>>> +            ((((uint32_t)(seg)) << 16) | (PCI_DEVID(bus, devfn)))
>>>>>>
>>>>>> I'm not a maintainer of this file; if I were, I'd ask that for readability's
>>>>>> sake all excess parentheses be dropped from these.
>>>>> Isn't it a coding requirement to enclose each element in parentheses in the macro definition?
>>>>> It seems other files also do this. See tools/libs/light/libxl_internal.h
>>>>
>>>> As said, I'm not a maintainer of this code. Yet while I'm aware that libxl
>>>> has its own CODING_STYLE, I can't spot anything towards excessive use of
>>>> parentheses there.
>>> So, which parentheses do you think are excessive use?
>>
>> #define PCI_DEVID(bus, devfn)\
>>             (((uint16_t)(bus) << 8) | ((devfn) & 0xff))
>>
>> #define PCI_SBDF(seg, bus, devfn) \
>>             (((uint32_t)(seg) << 16) | PCI_DEVID(bus, devfn))
> Thanks, will change in next version.
> 
>>
>>>>>>> @@ -1486,6 +1496,18 @@ static void pci_add_dm_done(libxl__egc *egc,
>>>>>>>          goto out_no_irq;
>>>>>>>      }
>>>>>>>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
>>>>>>> +#ifdef CONFIG_X86
>>>>>>> +        sbdf = PCI_SBDF(pci->domain, pci->bus,
>>>>>>> +                        (PCI_DEVFN(pci->dev, pci->func)));
>>>>>>> +        gsi = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
>>>>>>> +        /*
>>>>>>> +         * Old kernel version may not support this function,
>>>>>>
>>>>>> Just kernel?
>>>>> Yes, xc_physdev_gsi_from_dev depends on the function implemented on linux kernel side.
>>>>
>>>> Okay, and when the kernel supports it but the underlying hypervisor doesn't
>>>> support what the kernel wants to use in order to fulfill the request, all
>>> I don't know what things you mentioned hypervisor doesn't support are,
>>> because xc_physdev_gsi_from_dev is to get the gsi of pcidev through sbdf information,
>>> that relationship can be got only in dom0 instead of Xen hypervisor.
>>>
>>>> is fine? (See also below for what may be needed in the hypervisor, even if
>>> You mean xc_physdev_map_pirq needs gsi?
>>
>> I'd put it slightly differently: You arrange for that function to now take a
>> GSI when the caller is PVH. But yes, the function, when used with
>> MAP_PIRQ_TYPE_GSI, clearly expects a GSI as input (see also below).
>>
>>>> this IOCTL would be satisfied by the kernel without needing to interact with
>>>> the hypervisor.)
>>>>
>>>>>>> +         * so if fail, keep using irq; if success, use gsi
>>>>>>> +         */
>>>>>>> +        if (gsi > 0) {
>>>>>>> +            irq = gsi;
>>>>>>
>>>>>> I'm still puzzled by this, when by now I think we've sufficiently clarified
>>>>>> that IRQs and GSIs use two distinct numbering spaces.
>>>>>>
>>>>>> Also, as previously indicated, you call this for PV Dom0 as well. Aiui on
>>>>>> the assumption that it'll fail. What if we decide to make the functionality
>>>>>> available there, too (if only for informational purposes, or for
>>>>>> consistency)? Suddenly you're fallback logic wouldn't work anymore, and
>>>>>> you'd call ...
>>>>>>
>>>>>>> +        }
>>>>>>> +#endif
>>>>>>>          r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
>>>>>>
>>>>>> ... the function with a GSI when a pIRQ is meant. Imo, as suggested before,
>>>>>> you strictly want to avoid the call on PV Dom0.
>>>>>>
>>>>>> Also for PVH Dom0: I don't think I've seen changes to the hypercall
>>>>>> handling, yet. How can that be when GSI and IRQ aren't the same, and hence
>>>>>> incoming GSI would need translating to IRQ somewhere? I can once again only
>>>>>> assume all your testing was done with IRQs whose numbers happened to match
>>>>>> their GSI numbers. (The difference, imo, would also need calling out in the
>>>>>> public header, where the respective interface struct(s) is/are defined.)
>>>>> I feel like you missed out on many of the previous discussions.
>>>>> Without my changes, the original codes use irq (read from file /sys/bus/pci/devices/<sbdf>/irq) to do xc_physdev_map_pirq,
>>>>> but xc_physdev_map_pirq require passing into gsi instead of irq, so we need to use gsi whether dom0 is PV or PVH, so for the original codes, they are wrong.
>>>>> Just because by chance, the irq value in the Linux kernel of pv dom0 is equal to the gsi value, so there was no problem with the original pv passthrough.
>>>>> But not when using PVH, so passthrough failed.
>>>>> With my changes, I got gsi through function xc_physdev_gsi_from_dev firstly, and to be compatible with old kernel versions(if the ioctl
>>>>> IOCTL_PRIVCMD_GSI_FROM_DEV is not implemented), I still need to use the irq number, so I need to check the result
>>>>> of gsi, if gsi > 0 means IOCTL_PRIVCMD_GSI_FROM_DEV is implemented I can use the right one gsi, otherwise keep using wrong one irq. 
>>>>
>>>> I understand all of this, to a (I think) sufficient degree at least. Yet what
>>>> you're effectively proposing (without explicitly saying so) is that e.g.
>>>> struct physdev_map_pirq's pirq field suddenly may no longer hold a pIRQ
>>>> number, but (when the caller is PVH) a GSI. This may be a necessary adjustment
>>>> to make (simply because the caller may have no way to express things in pIRQ
>>>> terms), but then suitable adjustments to the handling of PHYSDEVOP_map_pirq
>>>> would be necessary. In fact that field is presently marked as "IN or OUT";
>>>> when re-purposed to take a GSI on input, it may end up being necessary to pass
>>>> back the pIRQ (in the subject domain's numbering space). Or alternatively it
>>>> may be necessary to add yet another sub-function so the GSI can be translated
>>>> to the corresponding pIRQ for the domain that's going to use the IRQ, for that
>>>> then to be passed into PHYSDEVOP_map_pirq.
>>> If I understood correctly, your concerns about this patch are two:
>>> First, when dom0 is PV, I should not use xc_physdev_gsi_from_dev to get gsi to do xc_physdev_map_pirq, I should keep the original code that use irq.
>>
>> Yes.
> OK, I can change to do this.
> But I still have a concern:
> Although without my changes, passthrough can work now when dom0 is PV.
> And you also agree that: for xc_physdev_map_pirq, when use with MAP_PIRQ_TYPE_GSI, it expects a GSI as input.
> Isn't it a wrong for PV dom0 to pass irq in? Why don't we use gsi as it should be used, since we have a function to get gsi now?

Indeed this and ...

>>> Second, when dom0 is PVH, I get the gsi, but I should not pass gsi as the fourth parameter of xc_physdev_map_pirq, I should create a new local parameter pirq=-1, and pass it in.
>>
>> I think so, yes. You also may need to record the output value, so you can later
>> use it for unmap. xc_physdev_map_pirq() may also need adjusting, as right now
>> it wouldn't put a negative incoming *pirq into the .pirq field. 
> xc_physdev_map_pirq's logic is if we pass a negative in, it sets *pirq to index(gsi).
> Is its logic right? If not how do we change it?

... this matches ...

>> I actually wonder if that's even correct right now, i.e. independent of your change.

... the remark here.

> Even without my changes, passthrough can work for PV dom0, not for PVH dom0.

In the common case. I fear no-one ever tried for a device with an IRQ that
has a source override specified in ACPI.

> According to the logic of hypercall PHYSDEVOP_map_pirq,
> if pirq is -1, it calls physdev_map_pirq-> allocate_and_map_gsi_pirq-> allocate_pirq -> get_free_pirq to get pirq.
> If pirq is set to positive before calling hypercall, it set pirq to its own value in allocate_pirq.

Which is what looks wrong to me. Question is what it was done this way in the
first place.

Jan


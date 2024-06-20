Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E290FDF6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 09:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744253.1151267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKCSP-0005Ag-AE; Thu, 20 Jun 2024 07:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744253.1151267; Thu, 20 Jun 2024 07:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKCSP-00057q-75; Thu, 20 Jun 2024 07:43:45 +0000
Received: by outflank-mailman (input) for mailman id 744253;
 Thu, 20 Jun 2024 07:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKCSO-00057k-9g
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 07:43:44 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b7f630-2ed8-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 09:43:42 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec10324791so5661731fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 00:43:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f99b6df01esm43503375ad.133.2024.06.20.00.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 00:43:41 -0700 (PDT)
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
X-Inumbo-ID: d0b7f630-2ed8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718869422; x=1719474222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7dvSAn3iBf7jRe+Q/nc4m+cZp/UtaRuQEsw3R+WWsA4=;
        b=ETStEoRBU7Tx31ZGHYAuGi5Zfq3ODtbkOxdw13Ap4FwUXPjguzKRlHzc+Cv5s+7jj/
         AEvi+0mPb9v5oMZBhAUpcUGnSXd37iiYgH87dSDjGGMKCKtk4qqeyLsBRaj9pg4b8NVn
         aI8IuhrjP7hkpGyFrZQaqvTIiq5apSwEW9pfVWoW8nDuo2Jc2Mc//zRE2PACjIHRZXz9
         hDxEE/ah6DwKPApNxhFQQ6Ck2UXQ+F2/g33tg/xhc77JdgaLtOewa6f+RTqhT0D7FfJr
         0biQAQt6sHnaljx6d607eT0Cxp2w10VOj4jEf8/0X1g2j/ZTEftgUO3azt9T5SDtPOc8
         IlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718869422; x=1719474222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dvSAn3iBf7jRe+Q/nc4m+cZp/UtaRuQEsw3R+WWsA4=;
        b=EM1LIeRLTt9foOyt9do2xcLzKE9tg/hi7JEOPeZ7heykMkJevAEW3G0dU40ezkT7FX
         fLjCY9QSQYrxYzOftMvH24jYV/o6HR/n0IW1GsPIIJAS1JQW82J2u69Ppm1cwNnm2JRC
         G9qw7KlKO2MGU7K54kpcblvuUeZ9uNRihFeTF4A/2Oo2REXLrODr4WgceBI1pePPF7qU
         esfAc09IABk/E67r7f0dAOg+UWHwTKCgozwyxkVfSnSmu4bJDMAUI1zwGFQ52Azygtpy
         WYMpAZQ7AzzRvMBnL8Btldo7dkpuE2G/chANfCzWFGE7GAB4E3i7hqrMJZrRVC3EqYwr
         YKRg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Tn3n5sHcH+hY7P6S5fgb31+BZcn3dwA6QHhYI7fQ5Mu3IbsWr9k4zFRW+Ed2MsmMj00kHuZFI4YizsFKdrmJDjFhwuma9PGZ6oXn9pU=
X-Gm-Message-State: AOJu0Yzkbep69Yt9U9KmNWWrriu946t8NA1+nuZlJs5cISibx6n8O/J7
	8Xj0EKM3d8+WTP4Axy9z2UsK826Cy7uY2TvDVHmU+Ff9r9lJLk0+0FRPvKekiA==
X-Google-Smtp-Source: AGHT+IEcnJreC3QRsmTo1R+OWRR1diBxxAcBE0NZqV2mvTL8po4mtdD2mLgXrPuJHRlgdkp7oYK4zA==
X-Received: by 2002:a05:651c:91:b0:2ec:22c0:66e6 with SMTP id 38308e7fff4ca-2ec3ce9b78cmr31604891fa.7.1718869421607;
        Thu, 20 Jun 2024 00:43:41 -0700 (PDT)
Message-ID: <099beaac-ed1f-459b-8c2b-42b325f8e4a4@suse.com>
Date: Thu, 20 Jun 2024 09:43:30 +0200
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
In-Reply-To: <BL1PR12MB5849ABD858B72505D83678F9E7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2024 09:03, Chen, Jiqian wrote:
> On 2024/6/18 17:13, Jan Beulich wrote:
>> On 18.06.2024 10:10, Chen, Jiqian wrote:
>>> On 2024/6/17 23:10, Jan Beulich wrote:
>>>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>>>> --- a/tools/libs/light/libxl_pci.c
>>>>> +++ b/tools/libs/light/libxl_pci.c
>>>>> @@ -1406,6 +1406,12 @@ static bool pci_supp_legacy_irq(void)
>>>>>  #endif
>>>>>  }
>>>>>  
>>>>> +#define PCI_DEVID(bus, devfn)\
>>>>> +            ((((uint16_t)(bus)) << 8) | ((devfn) & 0xff))
>>>>> +
>>>>> +#define PCI_SBDF(seg, bus, devfn) \
>>>>> +            ((((uint32_t)(seg)) << 16) | (PCI_DEVID(bus, devfn)))
>>>>
>>>> I'm not a maintainer of this file; if I were, I'd ask that for readability's
>>>> sake all excess parentheses be dropped from these.
>>> Isn't it a coding requirement to enclose each element in parentheses in the macro definition?
>>> It seems other files also do this. See tools/libs/light/libxl_internal.h
>>
>> As said, I'm not a maintainer of this code. Yet while I'm aware that libxl
>> has its own CODING_STYLE, I can't spot anything towards excessive use of
>> parentheses there.
> So, which parentheses do you think are excessive use?

#define PCI_DEVID(bus, devfn)\
            (((uint16_t)(bus) << 8) | ((devfn) & 0xff))

#define PCI_SBDF(seg, bus, devfn) \
            (((uint32_t)(seg) << 16) | PCI_DEVID(bus, devfn))

>>>>> @@ -1486,6 +1496,18 @@ static void pci_add_dm_done(libxl__egc *egc,
>>>>>          goto out_no_irq;
>>>>>      }
>>>>>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
>>>>> +#ifdef CONFIG_X86
>>>>> +        sbdf = PCI_SBDF(pci->domain, pci->bus,
>>>>> +                        (PCI_DEVFN(pci->dev, pci->func)));
>>>>> +        gsi = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
>>>>> +        /*
>>>>> +         * Old kernel version may not support this function,
>>>>
>>>> Just kernel?
>>> Yes, xc_physdev_gsi_from_dev depends on the function implemented on linux kernel side.
>>
>> Okay, and when the kernel supports it but the underlying hypervisor doesn't
>> support what the kernel wants to use in order to fulfill the request, all
> I don't know what things you mentioned hypervisor doesn't support are,
> because xc_physdev_gsi_from_dev is to get the gsi of pcidev through sbdf information,
> that relationship can be got only in dom0 instead of Xen hypervisor.
> 
>> is fine? (See also below for what may be needed in the hypervisor, even if
> You mean xc_physdev_map_pirq needs gsi?

I'd put it slightly differently: You arrange for that function to now take a
GSI when the caller is PVH. But yes, the function, when used with
MAP_PIRQ_TYPE_GSI, clearly expects a GSI as input (see also below).

>> this IOCTL would be satisfied by the kernel without needing to interact with
>> the hypervisor.)
>>
>>>>> +         * so if fail, keep using irq; if success, use gsi
>>>>> +         */
>>>>> +        if (gsi > 0) {
>>>>> +            irq = gsi;
>>>>
>>>> I'm still puzzled by this, when by now I think we've sufficiently clarified
>>>> that IRQs and GSIs use two distinct numbering spaces.
>>>>
>>>> Also, as previously indicated, you call this for PV Dom0 as well. Aiui on
>>>> the assumption that it'll fail. What if we decide to make the functionality
>>>> available there, too (if only for informational purposes, or for
>>>> consistency)? Suddenly you're fallback logic wouldn't work anymore, and
>>>> you'd call ...
>>>>
>>>>> +        }
>>>>> +#endif
>>>>>          r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
>>>>
>>>> ... the function with a GSI when a pIRQ is meant. Imo, as suggested before,
>>>> you strictly want to avoid the call on PV Dom0.
>>>>
>>>> Also for PVH Dom0: I don't think I've seen changes to the hypercall
>>>> handling, yet. How can that be when GSI and IRQ aren't the same, and hence
>>>> incoming GSI would need translating to IRQ somewhere? I can once again only
>>>> assume all your testing was done with IRQs whose numbers happened to match
>>>> their GSI numbers. (The difference, imo, would also need calling out in the
>>>> public header, where the respective interface struct(s) is/are defined.)
>>> I feel like you missed out on many of the previous discussions.
>>> Without my changes, the original codes use irq (read from file /sys/bus/pci/devices/<sbdf>/irq) to do xc_physdev_map_pirq,
>>> but xc_physdev_map_pirq require passing into gsi instead of irq, so we need to use gsi whether dom0 is PV or PVH, so for the original codes, they are wrong.
>>> Just because by chance, the irq value in the Linux kernel of pv dom0 is equal to the gsi value, so there was no problem with the original pv passthrough.
>>> But not when using PVH, so passthrough failed.
>>> With my changes, I got gsi through function xc_physdev_gsi_from_dev firstly, and to be compatible with old kernel versions(if the ioctl
>>> IOCTL_PRIVCMD_GSI_FROM_DEV is not implemented), I still need to use the irq number, so I need to check the result
>>> of gsi, if gsi > 0 means IOCTL_PRIVCMD_GSI_FROM_DEV is implemented I can use the right one gsi, otherwise keep using wrong one irq. 
>>
>> I understand all of this, to a (I think) sufficient degree at least. Yet what
>> you're effectively proposing (without explicitly saying so) is that e.g.
>> struct physdev_map_pirq's pirq field suddenly may no longer hold a pIRQ
>> number, but (when the caller is PVH) a GSI. This may be a necessary adjustment
>> to make (simply because the caller may have no way to express things in pIRQ
>> terms), but then suitable adjustments to the handling of PHYSDEVOP_map_pirq
>> would be necessary. In fact that field is presently marked as "IN or OUT";
>> when re-purposed to take a GSI on input, it may end up being necessary to pass
>> back the pIRQ (in the subject domain's numbering space). Or alternatively it
>> may be necessary to add yet another sub-function so the GSI can be translated
>> to the corresponding pIRQ for the domain that's going to use the IRQ, for that
>> then to be passed into PHYSDEVOP_map_pirq.
> If I understood correctly, your concerns about this patch are two:
> First, when dom0 is PV, I should not use xc_physdev_gsi_from_dev to get gsi to do xc_physdev_map_pirq, I should keep the original code that use irq.

Yes.

> Second, when dom0 is PVH, I get the gsi, but I should not pass gsi as the fourth parameter of xc_physdev_map_pirq, I should create a new local parameter pirq=-1, and pass it in.

I think so, yes. You also may need to record the output value, so you can later
use it for unmap. xc_physdev_map_pirq() may also need adjusting, as right now
it wouldn't put a negative incoming *pirq into the .pirq field. I actually
wonder if that's even correct right now, i.e. independent of your change.

Jan


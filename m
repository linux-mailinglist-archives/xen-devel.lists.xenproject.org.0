Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F362B225B6
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 13:19:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078716.1439773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uln23-0001P3-E8; Tue, 12 Aug 2025 11:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078716.1439773; Tue, 12 Aug 2025 11:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uln23-0001Md-AW; Tue, 12 Aug 2025 11:19:07 +0000
Received: by outflank-mailman (input) for mailman id 1078716;
 Tue, 12 Aug 2025 11:19:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uln21-0001MX-FK
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 11:19:05 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26da3661-776e-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 13:19:03 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6153a19dddfso7985502a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 04:19:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f26cc6sm20259380a12.23.2025.08.12.04.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 04:19:02 -0700 (PDT)
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
X-Inumbo-ID: 26da3661-776e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754997542; x=1755602342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uU80gNACUDmfnw0pRqCk6zUjHTfTG4dJeNPVlHZ7qGA=;
        b=dEFiS5odBmWgrnabuJpbEcmup2vb7LOsRXftwXE6AdvPuQ50Inh9SFDwyu1n1aBjUj
         EU1REFVN/GszU2hDC+FHqbJcZPw0uO3wz86lHfxUARQtaEf5w38bm2vdqNZqb3OvB4Du
         YWI0h+TDzX91HWt3xedeH1inNaQZcHcuyBF1BAMojtCNUOqguvOqgMLSO6yCyMPViylL
         eEG9/agFEm7z9DPhes4FStLiuGirNMITJ/nb02UmEdjiMrWHQpcMWBMk3QejTJ3yVWqZ
         48v4jT6cAwnWM7IERC4OaWYZS0hmhvaZAdhmp9qlJ9ONA7TOjbPZlc4N4ZhCCyof9Eud
         zCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754997542; x=1755602342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU80gNACUDmfnw0pRqCk6zUjHTfTG4dJeNPVlHZ7qGA=;
        b=ozOnoUU7WAckYgb3HmCh331cFLOPrMQYDaaAftEXrw9YzWXCL3sQ0bKO1iodr4ivGk
         /30N2w98lm+vocSBkC+kEWQbBpeRLwpAMIHkL2J356a31MA/DwnK7twRF5qmOx+k1M+x
         4XitAxYjRR/ufwCvoD1YszOlA7JRSyEPn0IKezzOAh2yIMqiEcoE+ONrQylVB5zxiVEi
         im3VCOM4JQ3YH2VEX+Jz5K3rrBoPUGm0S0ZxUmtWBkJIgCJVpICoIPLxBR+3qQ0Ia77k
         b8ynh4mRhoKeQ5RnsJvY3IKZq3+kQazy5Csh4R38WanrrePDNimQUgpiCnyoVkyHZ/qs
         2R0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWL4qbZ7rB01nJnQHzAylkeaE5NUjBCLniVdiHUZgWXTrJHJK2w990cwq+bfk4wUwgmITAzf24W4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMwLQG3MC1RHed+7h197S9ZbGZpOIQskYuIoR2KHcoyy/9bJED
	C4U3fS+nz19+7hp5V7fFCtb2YirNqlTq7GJSwAYFLiEC2gPC9j1Jd34pv6axIlaZQA==
X-Gm-Gg: ASbGncuU3HK9y6VSqehB+kJ0rxlmYuqzcgXnUFF7dIzk2FZ82+/DhmxsqkQ+CmIHHBF
	5/KeObjpoNHaAhE0MxBbxTGM5HZB+HMGaYLNvBTlJS3ZXl7XCZtAhQe+DsH5XcH3gUGdQ2Os0Fv
	AZLzXs3+2VLz0R5+SA5mONY0HkbMMKBglGRVCRwoppofrjL5DBf5xbCRLZBPa7amCfwaNutQUWq
	Hp7vbvfyRbhkpso81bEhzUjuF2JaPrKrtb+zX9rCMm1z6sFENkNj9Mkz76JidvktwUTH98F1UKT
	DoyBoA779sVlDG37QK0es3TAfoTUMoUNkHioLEFRojb6YMdZtKWAj3MK1z6QbF3uW+RdNY1twmP
	/DBy3p1mztR+EbTnd7aLMm2fNeshj/6V1/tPO/aoV6z3sla6pRemQT6YFgylmJw1fikdmzfALhE
	V8ruDt5bQwpYtOBELhqA==
X-Google-Smtp-Source: AGHT+IGhEYImBGoqIsOrl+zALTYiQSUEjWprSloXX6wfAzRHhLdbgXauCmHljQcgQGcpNl5UUs5WTA==
X-Received: by 2002:a05:6402:27d0:b0:617:b516:287c with SMTP id 4fb4d7f45d1cf-6184ec73171mr2465640a12.18.1754997542551;
        Tue, 12 Aug 2025 04:19:02 -0700 (PDT)
Message-ID: <d13f0a15-42c7-45f9-9c6c-fe19fafd85a2@suse.com>
Date: Tue, 12 Aug 2025 13:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/pci: add discovered PCI device at boot
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753968306.git.mykyta_poturai@epam.com>
 <5097b76acf0a5c64cc78522f6af6233370c948e6.1753968306.git.mykyta_poturai@epam.com>
 <123626b4-3234-40e5-b1cf-bd5c2b19cbc8@suse.com>
 <2a324f7a-6b25-4f30-a3a1-9c115aadbfae@epam.com>
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
In-Reply-To: <2a324f7a-6b25-4f30-a3a1-9c115aadbfae@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2025 13:09, Mykyta Poturai wrote:
> On 04.08.25 11:35, Jan Beulich wrote:
>> On 01.08.2025 11:22, Mykyta Poturai wrote:
>>> Create add_discovered_pci_devices function that calls pci_device_add
>>> on every PCI device discovered.
>>> The devices will be added to dom_io so that they can be assigned
>>> later to other domains.
>>
>> And why's the intermediate step necessary? IOW can't they be assigned to their
>> target domains right away, and only whatever's left would go to DOM_IO?
> 
> For Dom0less case, guest domains are not yet created at this point.

I understand that, but this doesn't answer my question. Once the guest domains
are there, can't you directly assign their devices to them?

>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -1180,6 +1180,34 @@ int __init scan_pci_devices(void)
>>>       return ret;
>>>   }
>>>   
>>> +static int __init _add_discovered_pci_devices(struct pci_seg *pseg, void *arg)
>>> +{
>>> +    struct pci_dev *pdev;
>>> +    int ret = 0;
>>> +
>>> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>>> +    {
>>> +        ret = pci_add_device(dom_io, pdev->seg, pdev->bus, pdev->devfn, NULL,
>>> +                             NUMA_NO_NODE);
>>> +        if ( ret < 0 )
>>> +        {
>>> +            printk(XENLOG_ERR
>>> +                   "%pp: Failure adding the discovered pci device (Error %d)\n",
>>> +                   &pdev->sbdf, ret);
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +void __init add_discovered_pci_devices(void)
>>> +{
>>> +    pcidevs_lock();
>>> +    pci_segments_iterate(_add_discovered_pci_devices, NULL);
>>> +    pcidevs_unlock();
>>> +}
>>
>> This looks to merely be a specialized form of what ...
>>
>>>   struct setup_hwdom {
>>>       struct domain *d;
>>>       int (*handler)(uint8_t devfn, struct pci_dev *pdev);
>>
>> ... follows below here. By generalizing what we have (perhaps from the top, i.e.
>> iommu_hwdom_init()), you'd also avoid violating Misra rule 2.1 on x86, as you add
>> unreachable code there.
> 
> Can you please elaborate a little further on how you see this 
> generalization? With routines you mentioned being specifically for 
> hwdom, which may not exist,

That's precisely the generalization I'm having in mind. What's hwdom-only
now ought to be possible to be made usable in wider manner.

> and the different approaches to PCI 
> initialization on Arm/x86 (as far as I understand on x86 all of the PCI 
> related stuff is initialized from iommu helpers, while Arm has a 
> dedicated init step)

This, too, may want harmonizing.

> I am afraid I can't find a nice point of contact to 
> generalize this, but I can be missing somthing due to unfamiliarity with 
> x86 code.
> 
> Another way of addressing possible MISRA violation I can see is moving 
> the add_discovered_pci_devices to xen/arch/arm/pci/pci.c so it will only 
> be compiled when used.

And pose a problem when e.g. RISC-V also wants the same.

Jan


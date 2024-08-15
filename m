Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142C3952AAF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 10:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777887.1187945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seVyb-0006Jl-6Z; Thu, 15 Aug 2024 08:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777887.1187945; Thu, 15 Aug 2024 08:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seVyb-0006HY-2q; Thu, 15 Aug 2024 08:36:57 +0000
Received: by outflank-mailman (input) for mailman id 777887;
 Thu, 15 Aug 2024 08:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seVyZ-0006HS-Hk
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 08:36:55 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85e9a88a-5ae1-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 10:36:53 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a94aa5080so86700166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 01:36:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c66e2sm66790566b.3.2024.08.15.01.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 01:36:52 -0700 (PDT)
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
X-Inumbo-ID: 85e9a88a-5ae1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723711013; x=1724315813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bk8zEpm1lmyf8bdGBPSlDNf3UdBO3B2Frzfb44sdbPw=;
        b=MGHh5/I1ErqBW5vHvVpDqXbD/tdPRd8qraFpm/O+ExPP+4gRKwMzGpdXruQARgdGHC
         mY6HYhhzmPi1aMZV3X4keSUz/8Rv/Ocnvz0qZF9y43xiD4F+Mxa9ol9zYoaNFgnCk63H
         MPwJlEgRoIfvFruOb/HzlPHBFJTVGyqg/WlkzPpgxRJ6tVc8iUOtB/bH93+aLP9WEB1w
         PK3JiGgPnBZ/Z+iCNOUjAbhDxKt/sz+iJ+CPRHajj/6Kwzi02K7DhaB4anS+C61l/Y4q
         7EMqWwYxZzk7lSVxRMJz+GgX8+vePzjSyE0GOORlnmwm12DAtEwfaqZGTEE2siAhqEWS
         qMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723711013; x=1724315813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bk8zEpm1lmyf8bdGBPSlDNf3UdBO3B2Frzfb44sdbPw=;
        b=mQmp3HYv4EXfPNETSZgWcrdlNZ0bGJZCrA+NJEM8TXf3su31E82tj2ADPccn6brdy6
         BgS5SO3ymcdxEFIV55QbCtsNGDyaSSoJEndKxNHt7FjUyFa8ymkIaTsTzCulUewd1t2f
         Ag6dEJjjbPQUpTbUDEP/oMDMsTROHVASqHtYShNjnWtv/DoLVOTRUnqteJDNLqixktX2
         Xt5wXhK3xfzBFdx85GispRxJ/kdDMmCz2WHIZHVTfT/ilkw9F1mflP95RqWKdtkL/aJp
         +3/yeeunALMIHeanOC7XE9r+O4BR2/5aAd1U7qL1Mrr6gnt2R1Nq5A16rIL5oSTEazVO
         eg0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZqUuILL1FzUxoU2iH8GtUj905xZVYVyqk0e6rsVMXQpjva2ZaA3HLksjYEy4W3CM6WR4zn4ffFV4fjqgsaVl+FOkO8XmHp/FHUp33J9k=
X-Gm-Message-State: AOJu0Yyvp7S7CsJKQ/b6YNXe3BG71Luvt+ag304cq5Z3apu7vwM5dtH9
	jpjp60bBG4GGZdUriKQWX7kc31ilF/U7SR37q3TfYl+X44qJxMhrZC+rX6fLow==
X-Google-Smtp-Source: AGHT+IEpLY2uWUJUtjt0JXrjRlOfiljfZHuC6Bod/bcsR7vfACArXKpW6n9k4p7C5Ykd7+qgtXVFLA==
X-Received: by 2002:a17:907:c891:b0:a7a:bb54:c858 with SMTP id a640c23a62f3a-a8366d39467mr360479066b.26.1723711012652;
        Thu, 15 Aug 2024 01:36:52 -0700 (PDT)
Message-ID: <8c0d428f-5122-4ec7-ab3b-3f61f6322211@suse.com>
Date: Thu, 15 Aug 2024 10:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/msi: fix locking for SR-IOV devices
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20240812203938.981588-1-stewart.hildebrand@amd.com>
 <74f88a45-a632-4ca6-9cee-95f52370b397@suse.com>
 <c05c9312-e729-48fb-942f-fbb378cd097a@amd.com>
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
In-Reply-To: <c05c9312-e729-48fb-942f-fbb378cd097a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2024 03:28, Stewart Hildebrand wrote:
> On 8/13/24 10:01, Jan Beulich wrote:
>> On 12.08.2024 22:39, Stewart Hildebrand wrote:
>>> In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
>>> structure") a lock moved from allocate_and_map_msi_pirq() to the caller
>>> and changed from pcidevs_lock() to read_lock(&d->pci_lock). However, one
>>> call path wasn't updated to reflect the change, leading to a failed
>>> assertion observed under the following conditions:
>>>
>>> * PV dom0
>>> * Debug build (debug=y) of Xen
>>> * There is an SR-IOV device in the system with one or more VFs enabled
>>> * Dom0 has loaded the driver for the VF and enabled MSI-X
>>>
>>> (XEN) Assertion 'd || pcidevs_locked()' failed at drivers/passthrough/pci.c:535
>>> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
>>> ...
>>> (XEN) Xen call trace:
>>> (XEN)    [<ffff82d040284da8>] R pci_get_pdev+0x4c/0xab
>>> (XEN)    [<ffff82d040344f5c>] F arch/x86/msi.c#read_pci_mem_bar+0x58/0x272
>>> (XEN)    [<ffff82d04034530e>] F arch/x86/msi.c#msix_capability_init+0x198/0x755
>>> (XEN)    [<ffff82d040345dad>] F arch/x86/msi.c#__pci_enable_msix+0x82/0xe8
>>> (XEN)    [<ffff82d0403463e5>] F pci_enable_msi+0x3f/0x78
>>> (XEN)    [<ffff82d04034be2b>] F map_domain_pirq+0x2a4/0x6dc
>>> (XEN)    [<ffff82d04034d4d5>] F allocate_and_map_msi_pirq+0x103/0x262
>>> (XEN)    [<ffff82d04035da5d>] F physdev_map_pirq+0x210/0x259
>>> (XEN)    [<ffff82d04035e798>] F do_physdev_op+0x9c3/0x1454
>>> (XEN)    [<ffff82d040329475>] F pv_hypercall+0x5ac/0x6af
>>> (XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150
>>>
>>> In read_pci_mem_bar(), the VF obtains the struct pci_dev pointer for its
>>> associated PF to access the vf_rlen array. This array is initialized in
>>> pci_add_device() and is only populated in the associated PF's struct
>>> pci_dev.
>>>
>>> Add a link from the VF's struct pci_dev to the associated PF struct
>>> pci_dev, ensuring the PF's struct doesn't get deallocated until all its
>>> VFs have gone away. Access the vf_rlen array via the new link to the PF,
>>> and remove the troublesome call to pci_get_pdev().
>>>
>>> Add a call to pci_get_pdev() inside the pcidevs_lock()-locked section of
>>> pci_add_device() to set up the link from VF to PF. In case the new
>>> pci_add_device() invocation fails to find the associated PF (returning
>>> NULL), we are no worse off than before: read_pci_mem_bar() will still
>>> return 0 in that case.
>>>
>>> Note that currently the only way for Xen to know if a device is a VF is
>>> if the toolstack tells Xen about it. Using PHYSDEVOP_manage_pci_add for
>>> a VF is not a case that Xen handles.
>>
>> How does the toolstack come into play here? It's still the Dom0 kernel to
>> tell Xen, via PHYSDEVOP_pci_device_add (preferred) or
>> PHYSDEVOP_manage_pci_add_ext (kind of deprecated; PHYSDEVOP_manage_pci_add
>> is even more kind of deprecated).
> 
> I guess I meant to say Dom0 kernel, not toolstack. I'm actually
> questioning how much value this last portion of the commit description
> is really adding. Maybe it would be better to just remove this bit.

+1

>>> @@ -446,7 +448,27 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>>>  
>>>      list_del(&pdev->alldevs_list);
>>>      pdev_msi_deinit(pdev);
>>> -    xfree(pdev);
>>> +
>>> +    if ( pdev->info.is_virtfn )
>>> +    {
>>> +        struct pci_dev *pf_pdev = pdev->virtfn.pf_pdev;
>>> +
>>> +        if ( pf_pdev )
>>> +        {
>>> +            list_del(&pdev->virtfn.next);
>>> +            if ( pf_pdev->physfn.dealloc_pending &&
>>> +                 list_empty(&pf_pdev->physfn.vf_list) )
>>> +                xfree(pf_pdev);
>>> +        }
>>> +        xfree(pdev);
>>> +    }
>>> +    else
>>> +    {
>>> +        if ( list_empty(&pdev->physfn.vf_list) )
>>> +            xfree(pdev);
>>> +        else
>>> +            pdev->physfn.dealloc_pending = true;
>>> +    }
>>
>> Could I talk you into un-indenting the last if/else by a level, by making
>> the earlier else and "else if()"?
>>
>> One aspect I didn't properly consider when making the suggestion: What if,
>> without all VFs having gone away, the PF is re-added? In that case we
>> would better recycle the existing structure. That's getting a little
>> complicated, so maybe a better approach is to refuse the request (in
>> pci_remove_device()) when the list isn't empty?
> 
> Hm. Right. The growing complexity of maintaining these PF<->VF links
> (introduced on a hunch that they may be useful in the future) is making
> me favor the previous approach from v2 of simply copying the vf_len
> array. So unless there are any objections I'll go back to that approach
> for v4.

I continue to consider the earlier approach at least undesirable. The
vf_len[] array shouldn't be copied around, risking for it to be / go
stale. There should be one central place for every bit of information,
unless there are very good reasons to duplicate something.

Jan


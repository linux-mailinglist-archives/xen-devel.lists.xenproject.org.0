Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B1812B79
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 10:17:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654368.1021204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhqN-0006JQ-0c; Thu, 14 Dec 2023 09:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654368.1021204; Thu, 14 Dec 2023 09:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhqM-0006Gw-TV; Thu, 14 Dec 2023 09:17:22 +0000
Received: by outflank-mailman (input) for mailman id 654368;
 Thu, 14 Dec 2023 09:17:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDhqL-0006Gq-Ft
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 09:17:21 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9540c667-9a61-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 10:17:20 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a1d2f89ddabso946621366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 01:17:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vt5-20020a170907a60500b00a1d38589c67sm9160182ejc.98.2023.12.14.01.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 01:17:19 -0800 (PST)
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
X-Inumbo-ID: 9540c667-9a61-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702545440; x=1703150240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5wC+y2Q4cyNHZq/XlCdwk7f9LNzOjsAz34l19OvXNM=;
        b=MiCVtRTox9VBE74Ubbu8tXC/b7rIbZw1VX3ztUZ/x45BBeN2sZikUOo2gj//3dOnIK
         Jp/+gmhQYsS2CFP8v9V7LVSihSPJq2wQNFnbBYyBTeezBQefqlGanLc8spgLzYmpNk+i
         R1yVnjTbcSKltt/CpMM6C9e1sT42lAF+9DHS3+kdr1lbCovmxvWMm3qlaP5Su8es3bqB
         Fd2K/jB+zZK+L0SQeiZ9vMowJ+UFyOQ8LZ1h5H4rt8JSh/zCXzwDTIpruRacq/jfZpCA
         VTl4D692S0KtX4edEfze4ZSBKUakINSCAFx/tEnM4pb20105T9p1F1tjic1V/SvUQdXP
         5AGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545440; x=1703150240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5wC+y2Q4cyNHZq/XlCdwk7f9LNzOjsAz34l19OvXNM=;
        b=X9l1G7YwRkALhDH7153Z3efWR3ly+eFzhANT2XsYF0tZhpQZKVJgdHjdMwhud5yRSi
         qDmsxpX1RS20jjUTl9bEV6TIjrIFBwbvWTXSEWedCCPT+7NLtnIbyRIOeqiOAp5kbSNn
         OVqC4I8+6nf4ee736jNsK8UhvEZZBpmuT/mCNeIQ4ugXFuYKEojIKhbDkMGz0105R54H
         C+6KJ2pntSVwURNOXSgRjZWeT0Jy9q6NuPC2jyP1s+7jRrF6oMlvQBdNkNa+z7EANXSe
         h0oUrB8P3w3DuqjRHMWfvNERsHxSvkfop5aaiz3xiRsLYxo65vlmBtMWq73B/Tl8oME/
         6i4g==
X-Gm-Message-State: AOJu0YzwbmbB4Q5DX3NfsHLySAjgJxTTHyBvdWh0RuG83CrhpmS2K0Uv
	Lzy3tvv/b7IkwgHOTkHHIVSo
X-Google-Smtp-Source: AGHT+IF0tTBkKlJF68bz43/s119oI8RokxjV41tvnOBBoqwSE9d0cpTdXYda6jrMR48sU/4Rzc17sw==
X-Received: by 2002:a17:907:bcf:b0:a19:a19b:789f with SMTP id ez15-20020a1709070bcf00b00a19a19b789fmr4127500ejc.98.1702545439641;
        Thu, 14 Dec 2023 01:17:19 -0800 (PST)
Message-ID: <089cdcc8-c895-496d-8b59-bcea9b7065ef@suse.com>
Date: Thu, 14 Dec 2023 10:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com> <ZXcrX44ceUjzjtDh@macbook>
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.12.2023 09:55, Chen, Jiqian wrote:
> On 2023/12/13 15:03, Jan Beulich wrote:
>> On 13.12.2023 03:47, Chen, Jiqian wrote:
>>> On 2023/12/12 17:30, Jan Beulich wrote:
>>>> On 12.12.2023 07:49, Chen, Jiqian wrote:
>>>>> On 2023/12/11 23:31, Roger Pau Monné wrote:
>>>>>> On Mon, Dec 11, 2023 at 12:40:08AM +0800, Jiqian Chen wrote:
>>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
>>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>>>>>> @@ -72,8 +72,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>>  
>>>>>>>      switch ( cmd )
>>>>>>>      {
>>>>>>> +    case PHYSDEVOP_setup_gsi:
>>>>>>
>>>>>> I think given the new approach on the Linux side patches, where
>>>>>> pciback will configure the interrupt, there's no need to expose
>>>>>> setup_gsi anymore?
>>>>> The latest patch(the second patch of v3 on kernel side) does setup_gsi and map_pirq for passthrough device in pciback, so we need this and below.
>>>>>
>>>>>>
>>>>>>>      case PHYSDEVOP_map_pirq:
>>>>>>>      case PHYSDEVOP_unmap_pirq:
>>>>>>> +        if ( is_hardware_domain(currd) )
>>>>>>> +            break;
>>>>>>
>>>>>> Also Jan already pointed this out in v2: this hypercall needs to be
>>>>>> limited so a PVH dom0 cannot execute it against itself.  IOW: refuse
>>>>>> the hypercall if DOMID_SELF or the passed domid matches the current
>>>>>> domain domid.
>>>>> Yes, I remember Jan's suggestion, but since the latest patch(the second patch of v3 on kernel side) has change the implementation, it does setup_gsi and map_pirq for dom0 itself, so I didn't add the DOMID_SELF check.
>>>>
>>>> And why exactly would it do specifically the map_pirq? (Even the setup_gsi
>>>> looks questionable to me, but there might be reasons there.)
>>> Map_pirq is to solve the check failure problem. (pci_add_dm_done-> xc_domain_irq_permission-> XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0)
>>> Setup_gsi is because the gsi is never be unmasked, so the gsi is never be registered( vioapic_hwdom_map_gsi-> mp_register_gsi is never be called).
>>
>> And it was previously made pretty clear by Roger, I think, that doing a "map"
>> just for the purpose of granting permission is, well, at best a temporary
>> workaround in the early development phase. If there's presently no hypercall
>> to _only_ grant permission to IRQ, we need to add one.
> Could you please describe it in detail? Do you mean to add a new hypercall to grant irq access for dom0 or domU?
> It seems XEN_DOMCTL_irq_permission is the hypercall to grant irq access from dom0 to domU(see XEN_DOMCTL_irq_permission-> irq_permit_access). There is no need to add hypercall to grant irq access.

Hmm, yes and no. May I turn your attention to
https://lists.xen.org/archives/html/xen-devel/2023-07/msg02056.html
and its earlier version
https://lists.xen.org/archives/html/xen-devel/2023-05/msg00301.html
(it's imo a shame that this series continues to be stuck)?

Both make pretty clear that without pIRQ, this domctl cannot be used in
its present shape anyway, for ...

> We failed here (XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0) is because the PVH dom0 didn't use PIRQ, so we can't get irq from pirq if "current" is PVH dom0.

... this very reason. Addressing this one way or another is a necessary
part of making passthrough work with PVH Dom0. So _effectively_ there is
no hypercall allowing PVH Dom0 to grant IRQ permission.

> So, it seems the logic of XEN_DOMCTL_irq_permission is not suitable when PVH dom0?

That's my view, yes.

> Maybe it directly needs to get irq from the caller(domU) instead of "current" if the "current" has no PIRQ flag?

I don't think the IRQ mapping in the DomU is necessary to be known here.
What we want to grant is access to a host resource. That host resource is
therefore all that should need specifying for the operation to be carried
out. It just so happens that a PV Dom0 would specify the host IRQ by way
of supplying its own equivalent pIRQ.

Things are more "interesting" for MSI, though: The (Xen) IRQ may not be
known early enough. There wants to be a way of indicating that when such
an IRQ is created, permission should be granted to the domain that is
going to use that IRQ (by way of being assigned the respective device).
(This aspect may be part of why "map" presently also grants permission,
yet I continue to think that was wrong from the start. The more that
access there is [likely needlessly] granted to the domain requesting the
mapping, just for it to then further grant access to the DomU.)

Jan


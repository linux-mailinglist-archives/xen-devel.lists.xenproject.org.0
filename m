Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5463F905074
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739148.1146096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLJC-0001Qe-70; Wed, 12 Jun 2024 10:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739148.1146096; Wed, 12 Jun 2024 10:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLJC-0001OH-3q; Wed, 12 Jun 2024 10:34:26 +0000
Received: by outflank-mailman (input) for mailman id 739148;
 Wed, 12 Jun 2024 10:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHLJA-0001OB-QA
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:34:24 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55748f1b-28a7-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 12:34:23 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57c76497cefso4801131a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:34:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57ca82877b7sm1133692a12.48.2024.06.12.03.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 03:34:22 -0700 (PDT)
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
X-Inumbo-ID: 55748f1b-28a7-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718188462; x=1718793262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uKjO2lbOacLKbkepJHdnURZOX2A8rIBxV0nZa0iKZ4k=;
        b=K6SKP5jFUZeBvv5+ZHMtlpm05ODj7JJ++OS5CQjpXYQGzfkfy63Ah/+RyvhnDsgJ/h
         Syq+8rHmUEDHRVABmHhSMEgsu4W/qtb60POtKX9pGfwLaaU2pKy+ZPI/XD7OecxO64On
         zZss+VFFX+MKKH+SrZ85A/Lbi5QKKrz9pKVfD3VJnsyK9ntAIWTPSAISO4gOMM9eASVV
         O/5+u4fE6NfS/aPVKi11mxS1vnOFYdWaowxD3qtzGNc+lsmW2+Q2ERD86pk2Aj9w/c6g
         52o0QF88VFM+C4c5+FC7C4bQ9cbe0yIuh4ye1toJ2R/5v9EwEPYJzD0YEhDFamYr4Gui
         jrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718188462; x=1718793262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKjO2lbOacLKbkepJHdnURZOX2A8rIBxV0nZa0iKZ4k=;
        b=rfQcuWtMgtor/9nQ81J2gXapBc+AZa7PNlfeN7SIdnHBRj+/LTDTueSJxAQMDNulV9
         cJXavm+yll5ZjaHTPJTUSWjNFhuiiz59VKtARhl5WOyU/dUsGN6TtPrFW0yev6mjh5V3
         RK40oapYPfYd0Wit7wChplMDhbCl3cm/XZww0k4dNys2QEJT9xkYtJAjExoPopG4N/oC
         +9C/aIF96A3cv7XLprATOADM+oP7qHsI8suc3gkPSLA36THkC/yTMbOCvyF1tXsYBrzX
         PgUo9HfXlh4KO2mre4pt9LEZhwmDBOXocH0bwS71i/poJj8/ATnnbu5XPobbeskIBivy
         HWzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs6sLZ96q40obzZ3yoLhMm7X7ehsmj8t8EnoLUqXc/jW9cPSO2qWrQ5437qGiNGhtRQW1JU96TtD2a0XZ2+WxgpbLxWeqTlEErwqzUbaI=
X-Gm-Message-State: AOJu0YwmSxFmmwgN8tHmHIpg9gc0SGN01YGmGsmA9SMdBQyRqZJK/A7U
	felc1QqBvPrMnJXQBmTH+fS1z/nMeUNW+BlScKIBLkiZ7tcmpZm/PYmiG01cRQ==
X-Google-Smtp-Source: AGHT+IEclVmKgX0GCWA7DQsqIaF7OXVSF4LDq3ufQ+QDn+5v4Hf5yp2bDguG6LnATnT+kLvyHyKgyQ==
X-Received: by 2002:a50:9e24:0:b0:578:57b7:9f32 with SMTP id 4fb4d7f45d1cf-57caaabf033mr1058344a12.35.1718188462574;
        Wed, 12 Jun 2024 03:34:22 -0700 (PDT)
Message-ID: <c2a5b9cd-2a85-4e01-8b8b-31b85726dbd4@suse.com>
Date: Wed, 12 Jun 2024 12:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-6-Jiqian.Chen@amd.com>
 <987f5d21-bbb5-4cdb-975b-91949e802921@suse.com>
 <BL1PR12MB5849FF595AEED1112622A98DE7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849FF595AEED1112622A98DE7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2024 12:12, Chen, Jiqian wrote:
> On 2024/6/11 22:39, Jan Beulich wrote:
>> On 07.06.2024 10:11, Jiqian Chen wrote:
>>> Some type of domain don't have PIRQ, like PVH, it do not do
>>> PHYSDEVOP_map_pirq for each gsi. When passthrough a device
>>> to guest on PVH dom0, callstack
>>> pci_add_dm_done->XEN_DOMCTL_irq_permission will failed at
>>> domain_pirq_to_irq, because PVH has no mapping of gsi, pirq
>>> and irq on Xen side.
>>
>> All of this is, to me at least, in pretty sharp contradiction to what
>> patch 2 says and does. IOW: Do we want the concept of pIRQ in PVH, or
>> do we want to keep that to PV?
> It's not contradictory.
> What I did is not to add the concept of PIRQs for PVH.

After your further explanations on patch 2 - yes, I see now. But in particular
there it needs making more clear what case it is that is being enabled by the
changes.

>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>
>> A problem throughout the series as it seems: Who's the author of these
>> patches? There's no From: saying it's not you, but your S-o-b also
>> isn't first.
> So I need to change to:
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com> means I am the author.
> Signed-off-by: Huang Rui <ray.huang@amd.com> means Rui sent them to upstream firstly.
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com> means I take continue to upstream.

I guess so, yes.

>>> --- a/tools/libs/light/libxl_pci.c
>>> +++ b/tools/libs/light/libxl_pci.c
>>> @@ -1412,6 +1412,37 @@ static bool pci_supp_legacy_irq(void)
>>>  #define PCI_SBDF(seg, bus, devfn) \
>>>              ((((uint32_t)(seg)) << 16) | (PCI_DEVID(bus, devfn)))
>>>  
>>> +static int pci_device_set_gsi(libxl_ctx *ctx,
>>> +                              libxl_domid domid,
>>> +                              libxl_device_pci *pci,
>>> +                              bool map,
>>> +                              int *gsi_back)
>>> +{
>>> +    int r, gsi, pirq;
>>> +    uint32_t sbdf;
>>> +
>>> +    sbdf = PCI_SBDF(pci->domain, pci->bus, (PCI_DEVFN(pci->dev, pci->func)));
>>> +    r = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
>>> +    *gsi_back = r;
>>> +    if (r < 0)
>>> +        return r;
>>> +
>>> +    gsi = r;
>>> +    pirq = r;
>>
>> r is a GSI as per above; why would you store such in a variable named pirq?
>> And how can ...
>>
>>> +    if (map)
>>> +        r = xc_physdev_map_pirq(ctx->xch, domid, gsi, &pirq);
>>> +    else
>>> +        r = xc_physdev_unmap_pirq(ctx->xch, domid, pirq);
>>
>> ... that value be the correct one to pass into here? In fact, the pIRQ number
>> you obtain above in the "map" case isn't handed to the caller, i.e. it is
>> effectively lost. Yet that's what would need passing into such an unmap call.
> Yes r is GSI and I know pirq will be replaced by xc_physdev_map_pirq.
> What I do "pirq = r" is for xc_physdev_unmap_pirq, unmap need passing in pirq,
> and the number of pirq is always equal to gsi.

Why would that be? pIRQ is purely a software construct (of Xen's), I
don't think there's any guarantee whatsoever on the numbering. And even
if there was (for e.g. non-MSI ones), it would be pIRQ == IRQ. And recall
that elsewhere I think I meanwhile succeeded in explaining to you that
IRQ != GSI (in the common case, even if in most cases they match).

>>> +    if (r)
>>> +        return r;
>>> +
>>> +    r = xc_domain_gsi_permission(ctx->xch, domid, gsi, map);
>>
>> Looking at the hypervisor side, this will fail for PV Dom0. In which case imo
>> you better would avoid making the call in the first place.
> Yes, for PV dom0, the errno is EOPNOTSUPP, then it will do below xc_domain_irq_permission.

Hence why call xc_domain_gsi_permission() at all on a PV Dom0?

>>> +    if (r && errno == EOPNOTSUPP)
>>
>> Before here you don't really need the pIRQ number; if all it really is needed
>> for is ...
>>
>>> +        r = xc_domain_irq_permission(ctx->xch, domid, pirq, map);
>>
>> ... this, then it probably also should only be obtained when it's needed. Yet
>> overall the intentions here aren't quite clear to me.
> Adding the function pci_device_set_gsi is for PVH dom0, while also ensuring compatibility with PV dom0.
> When PVH dom0, it does xc_physdev_map_pirq and xc_domain_gsi_permission(new hypercall for PVH dom0)
> When PV dom0, it keeps the same actions as before codes, it does xc_physdev_map_pirq and xc_domain_irq_permission.

And why does PVH Dom0 need to call xc_physdev_map_pirq(), when in that case
the pIRQ isn't used?

Jan


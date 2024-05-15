Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353218C650C
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 12:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722144.1126039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7C5t-0007XG-El; Wed, 15 May 2024 10:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722144.1126039; Wed, 15 May 2024 10:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7C5t-0007UR-Bd; Wed, 15 May 2024 10:42:45 +0000
Received: by outflank-mailman (input) for mailman id 722144;
 Wed, 15 May 2024 10:42:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7C5s-0007UL-G4
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 10:42:44 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db5fee4d-12a7-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 12:42:42 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e428242a38so95670931fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 03:42:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17922159sm845269766b.97.2024.05.15.03.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 03:42:41 -0700 (PDT)
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
X-Inumbo-ID: db5fee4d-12a7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715769761; x=1716374561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+gi4XzWWe4SUgS2l4ABdUI2Bf6HqL4MIDOC3y3/WBfA=;
        b=KPapCHZq1lqk4KvJif1qI9oN5H+BpP2QXLikKm8WO0f0PrG+aNPin4pg/VMAfwn/F8
         zi+urhcRuHSFdDeRjMcUGTFAefw0f9pot95pmDhi5GuRSVTnB3IJyrHksX6R0EH14DIr
         wNO4PQS9JCmeJ0dxkghg6MSUUyXluKpMRoOnddJrVgZtT8GkqxvHACI6rw4PqaPvuoPf
         oBUC+ts2eL0pu8ys3JgQ9PSYSUKvUpUvBVLOAcVQ8DVysJ99zbWVLNG8CmW5lOI+2mIa
         ffkdZXpsbYSkFpZea/Mn9ZhQJlP5h1TqePAtzbooEa+sXGG97YqFxf72Oo/i1kxEmgMN
         u2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715769761; x=1716374561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gi4XzWWe4SUgS2l4ABdUI2Bf6HqL4MIDOC3y3/WBfA=;
        b=imtEy45zwNcn3i4gUt7kAEh+3f4SRomA1/TitL7pwPJELDQzsrvpHrOb7wkw8WNkxD
         jzMGqRHGgL4dJncQyAOzOSn3vgV8jZOzclS9WY1/Ct26WLHAxRSG6QCDOs87LWJXJqlE
         6QLBekphk/Fvi7Jn8ynx9IGOh0WYt1hz7Hwyfu1WmOWzdFBkgcNeuRtc/99oOQ4XG0lK
         MgjW8A4kzn/QsirM14hSt9PEPCM7eaGv1eY5h/6tXCCLT4JCKMe9DhH8sRYsSF2cAAfW
         9FodrRFZmXRRdK8NksrvzXdve9ZSfzgh+7hnfZ63JnA6LAFSLayf3WnyJx6g/FnCQv4m
         nTJA==
X-Gm-Message-State: AOJu0YzwSvq743voDeuMNj7kknJzvJdJXf+zNAFgtA6VGnJRusyZzl46
	ie2meEgJDlRmoJHFv0pcRqrUx3/9FOqR/EKaQh+Thi5OgunBqv9Fen2Ur+U/bw==
X-Google-Smtp-Source: AGHT+IFvB+EZRM3CIOi6UXZ8dyGIkezBPeRMGtDwz6aOPTCltQuw67uT/VutOWhMMlsKEjDcqcW++g==
X-Received: by 2002:a2e:9dc6:0:b0:2e6:f602:a02f with SMTP id 38308e7fff4ca-2e6f602a208mr13095381fa.52.1715769761468;
        Wed, 15 May 2024 03:42:41 -0700 (PDT)
Message-ID: <e9281523-a807-4889-80f0-a13804188af9@suse.com>
Date: Wed, 15 May 2024 12:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] VT-d: respect ACPI SATC's ATC_REQUIRED flag
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <e98daa41-c6b6-4f4e-b41d-84006011068d@suse.com> <ZjjdZRPluS0YIazc@macbook>
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
In-Reply-To: <ZjjdZRPluS0YIazc@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 15:38, Roger Pau Monné wrote:
> On Thu, Feb 15, 2024 at 11:16:11AM +0100, Jan Beulich wrote:
>> When the flag is set, permit Dom0 to control the device (no worse than
>> what we had before and in line with other "best effort" behavior we use
>> when it comes to Dom0),
> 
> I think we should somehow be able to signal dom0 that this device
> might not operate as expected, otherwise dom0 might use it and the
> device could silently malfunction due to ATS not being enabled.

Whatever signaling we invented, no Dom0 would be required to respect it,
and for (perhaps quite) some time no Dom0 kernel would even exist to query
that property.

> Otherwise we should just hide the device from dom0.

This would feel wrong to me, almost like a regression from what we had
before.

> I assume setting the IOMMU context entry to passthrough mode would
> also be fine for such devices that require ATS?

I'm afraid I'm lacking the connection of the question to what is being
done here. Can you perhaps provide some more context? To provide some
context from my side: Using pass-through mode would be excluded when Dom0
is PVH. Hence why I'm not getting why we would want to even just consider
doing so.

Yet, looking at the spec, in pass-through mode translation requests are
treated as UR. So maybe your question was towards there needing to be
handling (whichever way) for the case where pass-through mode was
requested for PV Dom0? The only half-way sensible thing to do in that case
that I can think of right now would be to ignore that command line option,
just like we do when Dom0 is PVH. Yet that would equally apply to use of
"ats" on the command line, i.e. would likely first require yet another
separate patch. Except that in the "ats" case it may be reasonable to
instead panic(), for there being conflicting requests on the command line
(and it being unclear which one would be better to ignore).

>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -2364,6 +2364,26 @@ static int cf_check intel_iommu_add_devi
>>      if ( ret )
>>          dprintk(XENLOG_ERR VTDPREFIX, "%pd: context mapping failed\n",
>>                  pdev->domain);
>> +    else if ( !pdev->broken )
>> +    {
>> +        const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
>> +        const struct acpi_satc_unit *satc = acpi_find_matched_satc_unit(pdev);
>> +
>> +        /*
>> +         * Prevent the device from getting assigned to an unprivileged domain
>> +         * when firmware indicates ATS is required, but ATS could not be enabled
>> +         * or was not explicitly enabled via command line option.
>> +         */
>> +        if ( satc && satc->atc_required &&
>> +             (!drhd || ats_device(pdev, drhd) <= 0 ||
>> +              !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) ||
>> +              opt_ats < 0) )
> 
> Do you need the opt_ats check here?
> 
> I don't think it's possible for pci_ats_enabled() to return true if
> opt_ats is <= 0, and hence the opt_ats < 0 check can be dropped from
> the conditional?

In the present tristate mode of opt_ats a device can have ATS enabled when
opt_ats is -1 (i.e. no command line override): For devices with ATC_REQUIRED
set.

>> @@ -2375,12 +2395,26 @@ static int cf_check intel_iommu_enable_d
>>  
>>      pci_vtd_quirk(pdev);
>>  
>> -    if ( ret <= 0 )
>> -        return ret;
>> +    if ( ret <= 0 ||
>> +         (ret = enable_ats_device(pdev, &drhd->iommu->ats_devices)) < 0 ||
>> +         opt_ats < 0 )
> 
> Shouldn't this be opt_ats <= 0?

No, again not as long as this variable is a tristate one.

>> --- a/xen/drivers/passthrough/vtd/x86/ats.c
>> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
>> @@ -45,8 +45,9 @@ int ats_device(const struct pci_dev *pde
>>  {
>>      struct acpi_drhd_unit *ats_drhd;
>>      unsigned int pos, expfl = 0;
>> +    const struct acpi_satc_unit *satc;
>>  
>> -    if ( opt_ats <= 0 || !iommu_qinval )
>> +    if ( !opt_ats || !iommu_qinval )
>>          return 0;
> 
> FWIW, I find this change confusing, hence my request earlier that
> opt_ats must be set to 0 or 1 by the point it gets used.

Right, but as said in particular on the subthread of patch 5, for now it has
to remain a full tristate. Whereas if the spec was changed, I expect the
variable could be switched to bool, and hence no overriding from -1 to 0/1
would be needed anymore at all.

Jan


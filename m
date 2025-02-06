Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8422A2A86C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 13:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882796.1292882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg0uB-0001Zk-Sv; Thu, 06 Feb 2025 12:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882796.1292882; Thu, 06 Feb 2025 12:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg0uB-0001Xn-Q7; Thu, 06 Feb 2025 12:22:51 +0000
Received: by outflank-mailman (input) for mailman id 882796;
 Thu, 06 Feb 2025 12:22:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tg0uA-0001Xf-OO
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 12:22:50 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1448c0a5-e485-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 13:22:49 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5dcedee4f84so1498498a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 04:22:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b739edsm806135a12.3.2025.02.06.04.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 04:22:48 -0800 (PST)
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
X-Inumbo-ID: 1448c0a5-e485-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738844569; x=1739449369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ntn1tImow2tXD5t0WSXQXvrwoImUedjpx6VHngBT3dI=;
        b=Hf5KdVZ82KCOTUcFLpICzOYYQMg/1pp1f5PKd7ocmydKT29oB9uGlac/k10vkzb46U
         vHZge3motfO1GEYoTSY8ZsLrJuYL/vbO89xVMifNY2X6vB5EDM4gaXGHJrz36p45JKny
         pzHNmkOPIAsT7G+VLjaEJslPnVEhOm4AVC2WmoJFBJVEdEE6sWj9nqwArM3psrNNRUKB
         lVHeYbs59j4E3iw6anFBAE9HrSMgccRRqN/NdNYkn7ZN0J3n08e+hA5AFLkng6HGCFt0
         CoBn4SrdE+NM+z0KRxBv0jcwkd/mHcB5dvLLopIyt8CA8c03FKV58KHW9tqKY7+kpFJK
         FR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844569; x=1739449369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ntn1tImow2tXD5t0WSXQXvrwoImUedjpx6VHngBT3dI=;
        b=D/WwpQVAxFdLdP/5QuMkuyP6avwqjiusQexnIhvhe0VYNw32d+yMpv/AuN4s3+oVdX
         vfptfbaDQmrON5UGphZ2BApmUMDtRcLoGSiEuQwANvggmWC75xM0Tcn4tkvzarjkBr2n
         L6Gvnbn1adZ+BX0THjEhorIZmryd8fIAoN7DWtb0YHjwkBFfJ1srQhlRAtZ1axam7CYV
         +g+Qem4IH0Qrg1sKvGO2aRert0xNZ0Rm/oX20WORX3bQeXKjr2hiUJpct+jyGAuADzel
         tX1hDEABGxPb5I8FQVa4DAjtWz+4nbBaE+yOgEQ+wziL/RQrBGLH2dXxKBmSex+hmVTy
         wSdA==
X-Forwarded-Encrypted: i=1; AJvYcCUR1qVf/PkIWRpUnTshop8E1h4t6CzyqGffvkE2qH9fr0lvXMaRmMGtj9SiNU298LIrvNv8YLlBjqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6Z8p6ryWoZ1u77fFPie0ELDard+kFImzyeKu//XLBFN16lqMP
	M6NTuLCSBRZEcBhSCDl9TMuyYJXQ1lDrqPoWK2xfmorsQyswn0x2Ir8tmepkmA==
X-Gm-Gg: ASbGncsj8n92mOyH7M1RaLbQPOEP5Hm/vmhkM5GdmV0eRl84KL580uEKUs0G4GKwlTV
	OJPLhdJaF1ZwqwJk7VlHMdxcWIL9fUbPtn98cu5IgFbQw6jcF0QpbexhYm2KpY6fwN5557cjQwl
	KxqJfvhExewamhKX+LaLEp00cJHS25YSHMhnjdaeK6WAKlYOdS+l2V7K9r/lTXJ/sF1uTwyb9gc
	yZjuC0JX5ATlz6sBhVuN98+wKzWnS2gotUOsHbhwQkwOlbuai5iSeOv5Qqd0c0GCrSXyEIcgj2B
	sj88MPB6HFxIWM0LbSJkC+uXxzcWzt/btV8MRznF/ELaEgds9yAJeDtBFp966rbUoyOYAwuOLMT
	d
X-Google-Smtp-Source: AGHT+IGexyMP1j53fhpxVndOvO6ibX6OTTiIomzoQiBrAj/pKZysVnulJ4vzss1PUgFg2S61y5HtdA==
X-Received: by 2002:a05:6402:270a:b0:5d9:6633:8eb1 with SMTP id 4fb4d7f45d1cf-5dcecd343e7mr3388787a12.14.1738844568835;
        Thu, 06 Feb 2025 04:22:48 -0800 (PST)
Message-ID: <0fd27f2a-b46f-460d-aa79-2f8cc5420f1a@suse.com>
Date: Thu, 6 Feb 2025 13:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] iommu/amd: Remove redundant values redefinitions
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <bb95c2ffee689905293f73b6b71e8f5a5e666ec0.1738838825.git.teddy.astie@vates.tech>
 <1d1e8d22-bdf3-4f2d-93be-2afc70c63654@vates.tech>
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
In-Reply-To: <1d1e8d22-bdf3-4f2d-93be-2afc70c63654@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.02.2025 12:04, Teddy Astie wrote:
> Le 06/02/2025 à 11:49, Teddy Astie a écrit :
>> In amd_iommu_setup_domain_device, we redefine req_id and ivrs_dev
>> without using it the first time we read it. This is effectively dead
>> logic that we can refactor.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>>   xen/drivers/passthrough/amd/pci_amd_iommu.c | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> index f96f59440b..1511a2a099 100644
>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -147,17 +147,14 @@ static int __must_check amd_iommu_setup_domain_device(
>>       if ( rc )
>>           return rc;
>>   
>> -    req_id = get_dma_requestor_id(iommu->seg, pdev->sbdf.bdf);
>> -    ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
>> -    sr_flags = (iommu_hwdom_passthrough && is_hardware_domain(domain)
>> -                ? 0 : SET_ROOT_VALID)
>> -               | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
>> -
>> -    /* get device-table entry */
>>       req_id = get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
>>       table = iommu->dev_table.buffer;
>> +    /* get device-table entry */
>>       dte = &table[req_id];
>>       ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
>> +    sr_flags = (iommu_hwdom_passthrough && is_hardware_domain(domain)
>> +                ? 0 : SET_ROOT_VALID)
>> +               | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
>>   
>>       if ( domain != dom_io )
>>       {
> 
> Looks like there is a subtle issue with this change when mapping a 
> phantom device.
> In this case, we have bus,devfn not matching pdev->sbdf, but we want to 
> know if there are unity regions for the actual device (not its phantom bdf).

Which is the whole reason why req_id and ivrs_dev are calculated twice.
Note how the fix for XSA-400 deliberately added this 2nd instance.

Jan


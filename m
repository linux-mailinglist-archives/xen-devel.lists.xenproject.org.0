Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A162B84F0A2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 08:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678546.1055922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYKxl-0003iq-CP; Fri, 09 Feb 2024 07:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678546.1055922; Fri, 09 Feb 2024 07:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYKxl-0003gM-9e; Fri, 09 Feb 2024 07:06:17 +0000
Received: by outflank-mailman (input) for mailman id 678546;
 Fri, 09 Feb 2024 07:06:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rYKxk-0003gG-FO
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 07:06:16 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3672801-c719-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 08:06:09 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3392b12dd21so306093f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 23:06:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s12-20020a5d424c000000b0033b483d1abcsm1037602wrr.53.2024.02.08.23.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 23:06:08 -0800 (PST)
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
X-Inumbo-ID: b3672801-c719-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707462369; x=1708067169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rs0tHOlYbH5N6L2VIKAqxprdhJjVsv1pRMDgrzx+qgA=;
        b=fhFCmvTfnmxetMPOwC5VW6WTpy9h16yLSjNU2qFMueqxVamtkHIk620BnJlRdy2SO0
         Jqlr3bs0m54+XBAVfhJELwEeZETYZ8RxUkrSuH+Fg4cUoztUHETtzTuBzCjb+MCwVD1Y
         9YevwOZpRY7xoSIyBfdNUt2/JWv4BWT8gV/65Dithi+AQAxmJXCwUMGbYwwqZEzaxuHy
         r8pEfbcaSBr78cFNsZ7gDb8JeDdODfimpUCTvUkwRG9htAlqnF8bD7rV1GKDXFxQDBd1
         jT9aojzXaKfkRjKbth3XRWgRpkLsH0f7zjdHTDGP+MY5T8Xt9ZM1PKcQ3NURKJnBEPyV
         D2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707462369; x=1708067169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rs0tHOlYbH5N6L2VIKAqxprdhJjVsv1pRMDgrzx+qgA=;
        b=ZUKEt9qsjDh3WBN6vDHf2qHPL1hr67QSzGJqnCepENK/YVoIC19xUR7Vr9mDr8OgFV
         JjtVrhtEFNg6ubzZhcdN9lFJYzx1SxZ5UryCQPlIKUgOD5IKWtqBlOl7i6zFZqG/34ny
         jkIZoAq0R2tBwQxBdG883B/o46tUy20o+SNnHCO3ZOuAsJUqiCPoONorJmp805ob19r2
         UBllLBj/OY9+8+oFoxq00GFRkH9DOWkDHIbJ4f/aujNkg8NWCYiJQe8RyjF/WrQ9iWDp
         bBBjyUl9zJeem2kxdRmQ2J4n07lPnkFpCfRYGoANIBPAIbu8vROBrvmLNGC8qn7A5FhI
         vcHQ==
X-Gm-Message-State: AOJu0YyCRJuj9w9byDjDemg7+CQCfHrZ6r2F8SOqRdo5j8yCaT/mjjv9
	Hh+/X5uN8++zwpsI5aAFBCXa9ccqetQkpxNj/q9STX1GuPjieLFhXR9Km1BGVw==
X-Google-Smtp-Source: AGHT+IH9eZqV3GlPXIDzSOMOOX+g4NdGp8sSIz7PGh8adEvRMOC2Qwzqy+k25JZCOGAzOYLc7ieG0Q==
X-Received: by 2002:adf:f5c4:0:b0:33a:e8be:51bd with SMTP id k4-20020adff5c4000000b0033ae8be51bdmr408892wrp.51.1707462368925;
        Thu, 08 Feb 2024 23:06:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV659TepQ9KsiAIu5CG0PsuaG6t21m1PVIC8+VdKCg5eZkN5t74n6soJyDyPuawVH7eIflmafU2FkyRJdHqHPnSiFBtfUCg4DKy1nW2sxBzhiPD
Message-ID: <ee53bbdd-4d57-4470-9ff4-1ff6b9eec63c@suse.com>
Date: Fri, 9 Feb 2024 08:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] VT-d: replace find_ats_dev_drhd()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <a75bef32-8bbb-4471-b26b-981b06173cd5@suse.com> <ZcUP-t5gFx2v31at@macbook>
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
In-Reply-To: <ZcUP-t5gFx2v31at@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.02.2024 18:31, Roger Pau Monné wrote:
> On Mon, Feb 05, 2024 at 02:56:36PM +0100, Jan Beulich wrote:
>> All callers only care about boolean outcome. For this there's no point
>> in allocating a duplicate of the respective DRHD structure; a simple
>> boolean suffices (which eventually may wantg to become a count, such
>                                          ^ want
>> that the "any ATS devices assigned state" can also clear again). With
>> that boolean, remove respective parameters from internal helper
>> functions right away, as those have access to the flag through another
>> parameter.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> AFAICT the intention is that this is a non-functional change?

No functional effect intended, yes. Added such a sentence.

>> --- a/xen/drivers/passthrough/vtd/extern.h
>> +++ b/xen/drivers/passthrough/vtd/extern.h
>> @@ -65,8 +65,6 @@ struct acpi_drhd_unit *ioapic_to_drhd(un
>>  struct acpi_drhd_unit *hpet_to_drhd(unsigned int hpet_id);
>>  struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd);
>>  
>> -struct acpi_drhd_unit *find_ats_dev_drhd(struct vtd_iommu *iommu);
>> -
>>  int ats_device(const struct pci_dev *, const struct acpi_drhd_unit *);
>>  
>>  int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -624,8 +624,7 @@ int cf_check vtd_flush_iotlb_reg(
>>  }
>>  
>>  static int __must_check iommu_flush_iotlb_global(struct vtd_iommu *iommu,
>> -                                                 bool flush_non_present_entry,
>> -                                                 bool flush_dev_iotlb)
>> +                                                 bool flush_non_present_entry)
>>  {
>>      int status;
>>  
>> @@ -633,7 +632,7 @@ static int __must_check iommu_flush_iotl
>>      vtd_ops_preamble_quirk(iommu);
>>  
>>      status = iommu->flush.iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH,
>> -                                flush_non_present_entry, flush_dev_iotlb);
>> +                                flush_non_present_entry, iommu->flush_dev_iotlb);
> 
> Any reason to not also remove the parameter from here also?  As the handler
> gets iommu passed as the first parameter anyway.

Indeed, yet then the patch would have grown quite a bit. I think I
meant to have a respective post-commit-message remark, but then
forgot to actually put one there. Once (if) this change has gone in,
a follow-on patch could further tidy tings. (The "right away" in the
description was kind of meant to indicate that.)

Jan


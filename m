Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EA1AFC3F9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 09:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036238.1408506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2jX-0005uD-KK; Tue, 08 Jul 2025 07:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036238.1408506; Tue, 08 Jul 2025 07:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2jX-0005se-HT; Tue, 08 Jul 2025 07:27:19 +0000
Received: by outflank-mailman (input) for mailman id 1036238;
 Tue, 08 Jul 2025 07:27:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ2jV-0005sW-NQ
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 07:27:17 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9115f7f-5bcc-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 09:27:16 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so2394956f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 00:27:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee62f8bdsm10748093a12.57.2025.07.08.00.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 00:27:14 -0700 (PDT)
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
X-Inumbo-ID: f9115f7f-5bcc-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751959635; x=1752564435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LoBwdBtduZYkrsM7plBjtWdvfhIkwwOFWZscaCritNU=;
        b=fvMc/TXlSmcYuwo84cBeXz9btqYtkdC6nCBZyDv+EHNr+8PJJFxz1zVRhEX2fCmCXF
         Jxg74rQFOz4yHy2rPBhBZIab7U6UZHL5omhGejP7SQ3AA242VgxCtFTaMPUknW7tILsZ
         0gEZVzNwekY0RslfSXbTiv2QdMrSCR4zWMhb340CswMysJTIspjfuVz9OHWNw6/fokWO
         s2KAW9CBuyNYZNroYKCZYdkf8IR1KTVy9lt0bC5mbpia0QVHmZC0V5thgzFeuIJ6icIc
         TwH6MqOhk9vPAOe9x19gjObADM+kXe1G8N5V+2voTR40Irisq0R0FgkJjO7x8jIrIoUg
         as7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751959635; x=1752564435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoBwdBtduZYkrsM7plBjtWdvfhIkwwOFWZscaCritNU=;
        b=YE8Od3PfKGeYw4AAmgRfnv/iuDJifWlFjkQEAbAYShk7jTI0cCIFmGPyhHaXu30xs7
         td88dwrcDHYfoViIe+fBjLkUUAuS0AE/e/IvmSIrx53AocSp4OZjY0zzqL22dsf/dhgG
         Po0bc0FIV4NISzSWXkTJyvopIGGoV4GS1HiJRy7eLfDb9dd9019DWA/qSGTLbmHhwZ5L
         lAS4Zb5FckMhQ+QgFThUAJMoczUDTzmQWdsa2r9GPAiAyhC+MHDcaXVAO/7nrb6ec7Vp
         x1LPd+9EK56OVJ45CHEgAzDH404BdxKlNloWUTzRCnYp9ngV+10xwh5ngneMCXm2JZR8
         8KMg==
X-Forwarded-Encrypted: i=1; AJvYcCXpmaOTMtVQDJ58P1kgf5BkC+VA+3RhGTtaFBeowpbHlyn/8TQwnnQT4Q7Cn+EXO7JVpwf5rG9Oujc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQyhMIsAVW3hA/oGYkD4FeW8MUQzRe91K8egpJow0pxthavnGZ
	uq4gcfFI2Fby7ZPSX+rjpI91QsKodwcR97mIcRJbsdeqHG7SC4mCgNPfX13E7iygUcj4K3lRuPu
	mY3Y=
X-Gm-Gg: ASbGncvuOdmOHVQHe9oh2ruSdmOAqIARSmgxF8gkVVKpManlUGH9uqJ+4XsbR8ycokg
	WH2yS+4JqUarbeuijVYksqNg62fLZ/CrmA5H4Y7qoqUehg6HL9rmZUOA4saIYC1xQ4jgjRpbaah
	LRWBGeJObGONCViNYF2iWhYJ1tRkdMzBURdQ9E9qur3F2DfBIM+gMY+Jg0lmQu5m4Xdtq9u4/KW
	b3zyrkDUkKwS6ToUgg5T0cVoKN11d98MTZoCpRL5iCLB2cM03uSf6MAiSSdqyiS9rfNdsMi6AMs
	zAGH4CWWcdlh8daWX9OpuyRmOlEs0aMTE7Z46jKrrufq6BW93FZUoZP/9iiZWoR+vltUU6fuXy9
	YSc6y02d9K0Y1/cYLBF5W58syGKzt8vbAK5Y/DPFQXKRIuvw=
X-Google-Smtp-Source: AGHT+IGHFxjC8IgCz/yVmIdXQPERlOTt0PIQPJzXSDjTyyjPFY/2iHxgLCtRgXBSIu76CkEfGYN42Q==
X-Received: by 2002:a05:6000:40df:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3b4964ee23emr13152857f8f.57.1751959635268;
        Tue, 08 Jul 2025 00:27:15 -0700 (PDT)
Message-ID: <a42eefd8-c37d-4ceb-95a7-e1962229a548@suse.com>
Date: Tue, 8 Jul 2025 09:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/5] iommu: address violation of MISRA C Rule 5.5
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
 <29ba418db4a7a193fe07fa9927b4ab75e0355fcb.1751659393.git.dmytro_prokopchuk1@epam.com>
 <12566d37-cd33-4350-bdb5-aa1359c1b176@suse.com>
 <alpine.DEB.2.22.394.2507071416480.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507071416480.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 23:21, Stefano Stabellini wrote:
> On Mon, 7 Jul 2025, Jan Beulich wrote:
>> On 04.07.2025 22:39, Dmytro Prokopchuk1 wrote:
>>> Address a violation of MISRA C:2012 Rule 5.5:
>>> "Identifiers shall be distinct from macro names".
>>>
>>> Reports for service MC3A2.R5.5:
>>> xen/include/xen/iommu.h: non-compliant struct 'page_list_head'
>>> xen/include/xen/mm.h: non-compliant macro 'page_list_head'
>>
>> What is this about? There's no code change that I could see which would
>> alter the situation here.
>>
>>> xen/drivers/passthrough/iommu.c: non-compliant macro 'iommu_quarantine'
>>> xen/include/xen/iommu.h: non-compliant variable 'iommu_quarantine'
>>>
>>> These external variables ('iommu_pt_cleanup_lock'
>>> and 'iommu_pt_cleanup_list') are no longer used
>>> in the codebase. Removing them eliminates dead
>>> code and ensures compliance with coding standards.
>>> Fixes: b5622eb627 (iommu: remove unused iommu_ops method and tasklet, 2020-09-22)
>>
>> That's a different Misra rule, so may better be put in a separate patch?
>> Otherwise please at least mention the rule number as well.
>>
>>> The variable 'iommu_quarantine' makes sence to use
>>> only if 'CONFIG_HAS_PCI=y', so place it inside '#ifdef'.
>>
>> Hmm, yes - not nice, but what do you do. I question "makes sense" though:
>> Quarantining is possible also without PCI, aiui. Just we don't that right
>> now.
> 
> As far as I can tell the change to #ifdef iommu_quarantine is necessary
> to resolve a R5.5 violation here:
> 
> #ifdef CONFIG_HAS_PCI
> uint8_t __read_mostly iommu_quarantine =
> # if defined(CONFIG_IOMMU_QUARANTINE_NONE)
>     IOMMU_quarantine_none;
> # elif defined(CONFIG_IOMMU_QUARANTINE_BASIC)
>     IOMMU_quarantine_basic;
> # elif defined(CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE)
>     IOMMU_quarantine_scratch_page;
> # endif
> #else
> # define iommu_quarantine IOMMU_quarantine_none       <<< violation
> #endif /* CONFIG_HAS_PCI */

Yes. And I expressed that I accept the need to this change. I merely
questioned the wording used in the description.

What I can't derive is why page_list_head is mentioned in the
description, but then there's no related code change.

> As you can see from the patch series, often it is not nice to find a
> resoltution for these R5.5 violations. This is the reason why I
> originally suggested to deviate R5.5 entirely.
> 
> https://lore.kernel.org/xen-devel/139aa595-8b41-44e7-b205-415443c8c357@suse.com/](https://lore.kernel.org/xen-devel/139aa595-8b41-44e7-b205-415443c8c357@suse.com/
> 
> That said, this patch is one of the nicer changes in this series, I
> think it is OK.

With some adjustment(s) to the description, perhaps.

Jan


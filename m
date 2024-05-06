Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C548BCEDE
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 15:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717641.1120049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yGn-0007DE-EJ; Mon, 06 May 2024 13:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717641.1120049; Mon, 06 May 2024 13:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3yGn-0007Al-BX; Mon, 06 May 2024 13:20:41 +0000
Received: by outflank-mailman (input) for mailman id 717641;
 Mon, 06 May 2024 13:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3yGl-0007Af-Vv
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 13:20:39 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e0d09c1-0bab-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 15:20:38 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51f57713684so2345161e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 06:20:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bi15-20020a05600c3d8f00b0041c24321934sm19905853wmb.41.2024.05.06.06.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 06:20:37 -0700 (PDT)
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
X-Inumbo-ID: 6e0d09c1-0bab-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715001638; x=1715606438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6tpCpntxm/g/0s9FtaKk969D+NT36dYnCjWS35vjXoE=;
        b=VlWBHkLSVjlbVxOUao7uxKNgTP9qcNBTWCMmZDJnDaDdPvxkhoz1tqfEF2MkdKwDau
         mEfzmTz66PM5LQi18gCluxgup5ld+KsIEtvHVcnZC0kOzuLA80tn7JLDIEX0mTJiURkJ
         Y2fv2FbFVxVasuynkVVORDLPZFpF2jVK9YU53S4aEzEG+buTvLdlRAyJDtPGpxs4Gik+
         mWEOlMugIPpNcXiej9nDvc2C/3LsknhdT+NYbLbWnsfXZZzQmjh2pHpDDcqQdSxZWYUD
         xPwqAGBNnmVu8VwRT/bz/HBkBYRErHmkbrDbut/3YZ37jXjMzscjd8D0iNad48CpNgZv
         N7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715001638; x=1715606438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tpCpntxm/g/0s9FtaKk969D+NT36dYnCjWS35vjXoE=;
        b=O498RPNTLBn7u/qtd3iALdG1mMhrnnsw9xTRbD21GfqF5DliUu4AnEw7Rypo8lMU76
         Wzaw4jItObtJp6hbwPTJ49/B37f83R1SxxuY+wiJN8h+8ycjDkJOEaIf2XhoiMLSmqCd
         1RLpxXpJ7ULiAFFhz4YJss+XWQ4EqArDFaeLyhtUPWzKgiYtoVtrSVHrYL7wCpw39mBo
         MmGY0txCX8ExogHALlzW9T6Z2Q0QN2WifB59lqe1S2bfyoXzKxypBbp+631B9bEB68nW
         3BrC+xeCQ61jVRFTqQBmrMyV0h7EenO83RONK4pGJ9gb/GjHjgHIKct3eJauMJiU+vQr
         bJDQ==
X-Gm-Message-State: AOJu0YyX8gxuUO5QnqexH1Ak7A/JPRaSL32FHcMzyNH2TW4lm5C27++f
	ylNxS1CuPeYsizOM1470++l9DxKqV65IQP+MT+mHfSewz7liNY1STZCN5JanPg==
X-Google-Smtp-Source: AGHT+IFmObMCg8x9w17HSxTXZDj5JgpRBtQeNbZ2omns0SU6j0I0wbdOXN21W8UEtj9kj6+R3rB9Ww==
X-Received: by 2002:a19:644b:0:b0:51c:cd8d:2865 with SMTP id b11-20020a19644b000000b0051ccd8d2865mr6496432lfj.44.1715001638018;
        Mon, 06 May 2024 06:20:38 -0700 (PDT)
Message-ID: <24d52bbb-1329-4f8a-81be-505a35969875@suse.com>
Date: Mon, 6 May 2024 15:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] IOMMU: rename and re-type ats_enabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <7f11ca06-9bed-443b-9c79-0e62b71a1f96@suse.com> <ZjjQIaxEwS6b-swj@macbook>
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
In-Reply-To: <ZjjQIaxEwS6b-swj@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 14:42, Roger Pau Monné wrote:
> On Thu, Feb 15, 2024 at 11:15:39AM +0100, Jan Beulich wrote:
>> Make the variable a tristate, with (as done elsewhere) a negative value
>> meaning "default". Since all use sites need looking at, also rename it
>> to match our usual "opt_*" pattern. While touching it, also move it to
>> .data.ro_after_init.
> 
> I guess I need to look at further patches, as given the feedback on
> the past version I think we agreed we want to set ATS unconditionally
> disabled by default, and hence I'm not sure I see the point of the
> tri-state if enabling ATS will require an explicit opt-in on the
> command line (ats=1).

With the present wording in the VT-d spec (which we've now had vague
indication that it may not be meant that way) there needs to be
tristate behavior:
- With "ats=0" ATS won't be used.
- With "ats=1" ATS will be used for all ATS-capable devices.
- Without either option ATS will be used for devices where firmware
  mandates its use.
If the alternative reading was confirmed (and preferably the text also
adjusted), we should be able to get away with a simple boolean again.
At which point this patch may end up being purely renaming, and hence
could then as well be left out.

>> The only place it retains boolean nature is pci_ats_device(), for now.
>>
>> In AMD code re-order conditionals to have the config space accesses
>> after (cheaper) flag checks.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In domain_context_mapping_one() I'm a little puzzled that translation
>> type is selected based on only IOMMU and global properties, i.e. not
>> taking the device itself into account.
> 
> Is it maybe fine do set DEV_IOTLB unconditionally as long as the IOMMU
> supports it, and then let the device decide whether it wants to issue
> translated or non-translated requests depending on whether it supports
> (and enables) ATS?

This might be the reason why it is what it is now.

> I think it would be best to limit this strictly to devices that have
> ATS enabled.

And this was the reason for me putting the remark here.

>> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
>> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
>> @@ -282,7 +282,7 @@ void amd_iommu_flush_iotlb(u8 devfn, con
>>      struct amd_iommu *iommu;
>>      unsigned int req_id, queueid, maxpend;
>>  
>> -    if ( !ats_enabled )
>> +    if ( opt_ats <= 0 )
> 
> If having a tri-state is required, won't it be best to decide on a
> binary value at init time, so that runtime functions can handle
> opt_ats as a boolean?

As per above, unlike for other options we can't consolidate into a
boolean, as runtime behavior wants to be different with all three
possible settings.

> Otherwise we are open coding the default expectation of what -1
> implies (disabled) in all use sites.

That's pretty much unavoidable with the different meaning of 1 and -1.

>> @@ -196,7 +196,7 @@ static int __must_check amd_iommu_setup_
>>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
>>  
>>          if ( use_ats(pdev, iommu, ivrs_dev) )
>> -            dte->i = ats_enabled;
>> +            dte->i = true;
> 
> Might be easier to just use:
> 
> dte->i = use_ats(pdev, iommu, ivrs_dev);

I'm hesitant here, as in principle we might be overwriting a "true" by
"false" then.

>> @@ -257,7 +257,7 @@ static int __must_check amd_iommu_setup_
>>                                           ACPI_IVHD_SYSTEM_MGMT));
>>  
>>          if ( use_ats(pdev, iommu, ivrs_dev) )
>> -            ASSERT(dte->i == ats_enabled);
>> +            ASSERT(dte->i);
> 
> ASSERT(dte->i == use_ats(pdev, iommu, ivrs_dev));

I'm okay switching here, but better to the precise logical equivalent of
the earlier code:

ASSERT(dte->i || !use_ats(pdev, iommu, ivrs_dev));

>> @@ -43,7 +43,7 @@ static inline int pci_ats_enabled(int se
>>  
>>  static inline int pci_ats_device(int seg, int bus, int devfn)
>>  {
>> -    if ( !ats_enabled )
>> +    if ( !opt_ats )
>>          return 0;
> 
> Can't you remove that check altogether now, since you are adding an
> opt_ats check to use_ats()?

Two reasons why not: For one this isn't AMD-specific code, and hence
shouldn't be tied to the AMD-specific use_ats(). In principle VT-d
code should be okay to call here, too. And then
amd_iommu_disable_domain_device() doesn't use use_ats(), but does call
here.

Jan


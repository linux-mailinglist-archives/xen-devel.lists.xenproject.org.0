Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC4DA72D13
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:58:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928878.1331522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txk0K-0002Fq-4G; Thu, 27 Mar 2025 09:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928878.1331522; Thu, 27 Mar 2025 09:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txk0K-0002Cx-0V; Thu, 27 Mar 2025 09:58:28 +0000
Received: by outflank-mailman (input) for mailman id 928878;
 Thu, 27 Mar 2025 09:58:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txk0I-0002Cp-IX
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:58:26 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0674467a-0af2-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 10:58:25 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so4327115e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:58:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ac67970a2sm9193221f8f.16.2025.03.27.02.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 02:58:24 -0700 (PDT)
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
X-Inumbo-ID: 0674467a-0af2-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743069505; x=1743674305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CTwKjLGjQQudE74WfWowNahvCBksgLNun8cfuE9d/RM=;
        b=QMeKcTuMSF0Xd9hwfo67Z5mAjq3McQn47ovu04EcvS7g/zlvPNfoO+DKhOLmYlyuMq
         DuyNzXjpvw1zTmw4p0KeWssFVyWk3UE78c1NFcKLIQXb9m1C9pwOCWKZWapFfvArKfuI
         xEOCJxdLgZxCqP1+xhrQ0/obrW4HamXu2J01WhCGmGDBrOGde76gSREh80J3hFPqxnxy
         0H8oCnwNdGZ/3DyiZ23QX6mXutw4Hs3YGvr5LXuvILFWlrv33Y8UyrVHT5bq4nrSeca6
         9OP7079L1GHTcmwgPz606muHjthaAvUjHbq1LHuP/+cwAx0wjW3axzBqxXpcf/HvhXXK
         a4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069505; x=1743674305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTwKjLGjQQudE74WfWowNahvCBksgLNun8cfuE9d/RM=;
        b=BzS0+HUDgmfoO1r27HhYamHmgvt9wgr/vnAoZ5+ChuJUxaAeVAkh7fyephHyE8BqCX
         n9Hrk1eCpByGxo5pua2F32FwCITUW7RV2YFVWBjlJc2Y4peHs0p+8xfmHAPHBHfimWeV
         Qz5NZdtTVWVncQE+dRGq2EybRE7/QCHvf9CFDwh9EfqYqbhdCGIGFTE5qQ37F0PB2nO/
         5793QAPZpAI38T2gvjInlJHLwP5W590OnW46RK9syJ04ucjCyy1MQVBrk7q9ELEDE/VZ
         qapgH0HXR2wJa0GkpzLg3GqCgEvGtG8SaYuq+IuHFd9CS4kxA04aAh1sCB+lGcf7Ls1X
         3lYw==
X-Forwarded-Encrypted: i=1; AJvYcCX44Jf45GcPYse7Ki6frgkbHpa7KzJnhBetpZxPB6wZzhe3J4l6k1azY5sMrObHLvm8+TU3F+okTRw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5fZ7jM/eVUa9Jcc+Bc0x/jEtbcpKpb5gEaIQEbbeJmJpwBsHa
	Dk8YgdLdkiGugrhuGDXUe/Y2ZpJoYL1ijzADtXSdVBK/ZKgZS9F+RPrKfyVS7XGfdqhiTAh34WE
	=
X-Gm-Gg: ASbGncu79gSQdDFTUbkIhWALAQ2fuBT9rVMiY6wVlZR4Jicwq+HPY/5N7Gr6xC9z81m
	lVHOSuYRk7sYQa8MjHgeAwknLMKDKJ015r8H7nOF6OMG1JySsexRoWepi3ubwKcsYPkkpQILoCb
	fPugmzDEBqU4HrJ2p4iL1ePI8HeMvByDyiLpVg6LHPaVS39S3KdYqwXxWz6oi4V55mnv8AAtGPq
	vRBGytHHGEx0OlB49LhhsEW/mwDfIQFwD942CiLG/o0OFrCweO4dwHpbS4EzC84lDMzWiIJvW7N
	5Ru1ple8aq8bqAlYpJ1H+vcLmnTpawdBN25ouRoQ4uxgKWkahk27OjWlY4rThlD+cIuFy2e5cKn
	4WUF5IM3P+AFS2CxYWFTESEVeRADDJQ==
X-Google-Smtp-Source: AGHT+IFh78ufyfSSFxSErr4DGIGmpBwRO2iRL8eZOfYeyIuYGxvYMJYeP81UY63C5HJgGqMmExXPhA==
X-Received: by 2002:a05:600c:3c9a:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-43d84f8b86dmr30159885e9.11.1743069504989;
        Thu, 27 Mar 2025 02:58:24 -0700 (PDT)
Message-ID: <45e7368b-9aef-4e72-934c-3fa8846a8d5f@suse.com>
Date: Thu, 27 Mar 2025 10:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/19] xen/sysctl: wrap around XEN_SYSCTL_physinfo
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Penny Zheng <Penny.Zheng@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-16-Penny.Zheng@amd.com>
 <87fe5ebc-4bbd-4941-814b-5447be06a201@gmail.com>
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
In-Reply-To: <87fe5ebc-4bbd-4941-814b-5447be06a201@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 10:35, Oleksii Kurochko wrote:
> 
> On 3/26/25 6:50 AM, Penny Zheng wrote:
>> The following functions are only used to deal with XEN_SYSCTL_physinfo,
>> then they shall be wrapped:
>> - arch_do_physinfo
>> - get_outstanding_claims
>>
>> Signed-off-by: Penny Zheng<Penny.Zheng@amd.com>
>> ---
>> v1 -> v2:
>> - no need to wrap declaration
>> - add transient #ifdef in sysctl.c for correct compilation
>> ---
>>   xen/arch/arm/sysctl.c   | 2 ++
>>   xen/arch/riscv/stubs.c  | 2 ++
>>   xen/arch/x86/sysctl.c   | 2 ++
>>   xen/common/page_alloc.c | 2 ++
>>   xen/common/sysctl.c     | 2 +-
>>   5 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
>> index 32cab4feff..2d350b700a 100644
>> --- a/xen/arch/arm/sysctl.c
>> +++ b/xen/arch/arm/sysctl.c
>> @@ -15,6 +15,7 @@
>>   #include <asm/arm64/sve.h>
>>   #include <public/sysctl.h>
>>   
>> +#ifdef CONFIG_SYSCTL
>>   void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>   {
>>       pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
>> @@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>       pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>>                                          XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>>   }
>> +#endif
>>   
>>   long arch_do_sysctl(struct xen_sysctl *sysctl,
>>                       XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
>> index 5951b0ce91..7b3f748886 100644
>> --- a/xen/arch/riscv/stubs.c
>> +++ b/xen/arch/riscv/stubs.c
>> @@ -328,10 +328,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
>>       BUG_ON("unimplemented");
>>   }
>>   
>> +#ifdef CONFIG_SYSCTL
>>   void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>   {
>>       BUG_ON("unimplemented");
>>   }
>> +#endif /* CONFIG_SYSCTL */
> 
> Considering that now we will have CONFIG_SYSCTL, I think it would be better just to drop
> definition of arch_do_physinfo() from riscv/stubs.c as it was added to make common code build
> for RISC-V happy.

Wouldn't that require SYSCTL=n then for RISC-V, which better wouldn't be done
(as it would need undoing later on)?

Jan


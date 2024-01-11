Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E061082AB60
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 10:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666082.1036525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNrmH-0001qk-Ue; Thu, 11 Jan 2024 09:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666082.1036525; Thu, 11 Jan 2024 09:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNrmH-0001oU-S4; Thu, 11 Jan 2024 09:55:09 +0000
Received: by outflank-mailman (input) for mailman id 666082;
 Thu, 11 Jan 2024 09:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNrmH-0001oN-1R
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 09:55:09 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f69927e-b067-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 10:55:06 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e60e137aaso2663325e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 01:55:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c3b8f00b0040d5a5c523csm5200169wms.1.2024.01.11.01.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 01:55:05 -0800 (PST)
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
X-Inumbo-ID: 7f69927e-b067-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704966905; x=1705571705; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XrpN/KAHB0R41KfIeM7omrL2AebN1wVsvQ0/RgFsVoc=;
        b=ZngWCgmKuiu7OArfd1NXATZ0EKrZXILMmBmc5cbFHKBBwOggjjiCkcsF0PdHEmxDGA
         oGmnSk2lEVkbDsi2Xl/FDZgpamAm4JCb1MdJvxFwrMHJAXM1XZtQ1KSV+ju/HRDw8LW5
         t9xewx3eVUgUsaSQu69i67x67BK7b1QFGVxROvqQiOBREzFvMYAr5R/fTMjmKcxpBQKz
         mlK7OkUeo4KkClKAxHymgPh6HXORyRWFBri33VZPnAdEBfpGZKsKZvnARIkz/c5ag3BO
         lozYoTtDPvGgh/GdLjtl/PAxgpuNQqOMOdEWZD9Np95zpIVOl6IouQIJoe9Jvj9SDfZQ
         M3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704966905; x=1705571705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrpN/KAHB0R41KfIeM7omrL2AebN1wVsvQ0/RgFsVoc=;
        b=jYENK4uA1cWsfJqf+5S50Ilp8/YC6IGWf1UCzPVyG2XByMPoAFmD3n1suY4xIm+vDr
         HXrU7uUIMyhcMKKsKqjgCszh5qIwVNOXUFEc0/jTh1oxm6P5MTsmfqubJp9DRsWq+HGj
         BroIrbezVnDlhzPMlNk+b5F1KdPZqoeSkcgSE/bqhKYtZftAWFwNemOrJh/3ze8Vye3A
         yFPen1YYmQ8iN8FBI6byP3y78h4P0+1z8QuwxE/20408+xCQDwAnmjeVrUyAL5oYefn3
         PGmKq6OAngUfm/s1lJ7rxL06Bhx0gcw0jmKqPaaGQbIqLlEGBH3MKFjrnIci2bQWpLoM
         QuWA==
X-Gm-Message-State: AOJu0YzSJbKFVdPCVtSk9lNTM74Wmu6wa5K8+Qibgw4ILkIEj2+J8w2R
	VwDMtUOleSh75w6MuwbLwg3+DFz+OLMI
X-Google-Smtp-Source: AGHT+IGkpRUmgdwQ6Sxj36iJ4Wq0/JF5MvEdLXWnzl2TCoDqbcdr4YccLp1HDPWHg8374fKAAvmtsg==
X-Received: by 2002:a7b:cb90:0:b0:40e:5d36:8bb9 with SMTP id m16-20020a7bcb90000000b0040e5d368bb9mr212983wmi.32.1704966905697;
        Thu, 11 Jan 2024 01:55:05 -0800 (PST)
Message-ID: <7b66d740-f0cf-447c-9024-843f128b93f9@suse.com>
Date: Thu, 11 Jan 2024 10:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] limit passing around of cpu_user_regs
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <1ed510cd-d542-47c4-abac-45f395760c13@amd.com>
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
In-Reply-To: <1ed510cd-d542-47c4-abac-45f395760c13@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.01.2024 10:52, Michal Orzel wrote:
> On 11/01/2024 08:31, Jan Beulich wrote:
>> Unlike (synchronous) exception handlers, interrupt handlers don't normally
>> have a need to know the outer context's register state. Similarly, the vast
>> majority of key handlers has no need for such.
>>
>> 1: keyhandler: don't pass cpu_user_regs around
>> 2: IRQ: generalize [gs]et_irq_regs()
>> 3: serial: drop serial_rx_fn's regs parameter
>> 4: PV-shim: drop pv_console_rx()'s regs parameter
>> 5: serial: drop serial_[rt]x_interrupt()'s regs parameter
>> 6: IRQ: drop regs parameter from handler functions
> FYI, I did a build test on Arm and there were 2 build errors. Fix below:

Thanks for spotting. First of all I'll want to figure out why I didn't
notice these; I certainly did do several Arm text builds.

Jan

> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index b5c84c51a20a..da011413c5c0 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -642,7 +642,7 @@ static void ipmmu_domain_irq(struct ipmmu_vmsa_domain *domain)
>                          domain->d, status, iova);
>  }
>  
> -static void ipmmu_irq(int irq, void *dev, struct cpu_user_regs *regs)
> +static void ipmmu_irq(int irq, void *dev)
>  {
>      struct ipmmu_vmsa_device *mmu = dev;
>      unsigned int i;
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index f820c5500e08..c3ac6d17d1c8 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -929,7 +929,7 @@ static void arm_smmu_combined_irq_handler(int irq, void *dev)
>  {
>  	struct arm_smmu_device *smmu = dev;
>  
> -	arm_smmu_gerror_handler(irq, dev, regs);
> +	arm_smmu_gerror_handler(irq, dev);
>  
>  	tasklet_schedule(&(smmu->combined_irq_tasklet));
>  }
> 
> 
>> 7: x86/vPMU: drop regs parameter from interrupt functions
>> 8: x86/APIC: drop regs parameter from direct vector handler functions
>>
>> Jan
>>
> 
> ~Michal



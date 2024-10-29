Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F115B9B43CF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827082.1241562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hHQ-0008BC-2l; Tue, 29 Oct 2024 08:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827082.1241562; Tue, 29 Oct 2024 08:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hHP-00088g-Uf; Tue, 29 Oct 2024 08:08:43 +0000
Received: by outflank-mailman (input) for mailman id 827082;
 Tue, 29 Oct 2024 08:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5hHO-00088X-El
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:08:42 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01ba922d-95cd-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 09:08:40 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso50139755e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:08:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b8c394sm11729981f8f.90.2024.10.29.01.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:08:39 -0700 (PDT)
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
X-Inumbo-ID: 01ba922d-95cd-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730189320; x=1730794120; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E27NsgBAY436u66YFzB03YW2X8wdN0AZFfZvlkF14UA=;
        b=e8//Mn/mt2zWwpRCx3io39R+Kd3hozkpqqqHAHP8lUZfFIEUw+80yYXmC7muqAR3Z9
         leZdbjOYvqripQjucnAcCpWUdvwVf1er53hOzOQRkor09epAsg0EqsVRZI9jySxAz7vO
         BfAz7xtdR14LbnZeVnqFJl5DN2IaC0PjIvZUHHcsTubP7rpuLBax+4yVF0d0BtZkOECa
         2Jxjzbi3dpRfR22i9mfYcWUzYyQubyIYL/yXG9S97ZPUa6P9+Mb+pmE/rk+DJIB6slEs
         GlRLaz23Lg/PHsVqSLqiq2UbSSvfc7I+wmXCwVxMtUVNvCLiieb4ftvRJuEcyCLywcB1
         JH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189320; x=1730794120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E27NsgBAY436u66YFzB03YW2X8wdN0AZFfZvlkF14UA=;
        b=Ekrr82pVba8SBdJ0qGOmxA1ruFaGHZRnDpW11vLuDKUJ29d45w0PFQHLJMVY4iuRuJ
         phT3hbK/wcNEjf0gIaDnEbSDIgYwEZaC66cvy3d5+4SxqPcreD2TYHIRisSw43+eKHNC
         CFCnqUdD8kEAGnjRX/cyUTM69a3AhrtJ+I3Fcv89ZSCAwCTghuHdpazfJG7zE7OmYQaa
         aS1rBk8hFNWn1UTpYDEOUY6PG+GaUViIKsoebkBvRFJrUNx/g8v7DM8PbnyCq3E2C2Cg
         6jYdsVoy0IWpeyclxlJwU/wQiB1CpyD5v2bHdbC0DrHwZHUsxslrDHYbhxy6OK47iT+l
         RsAg==
X-Forwarded-Encrypted: i=1; AJvYcCUaPkbuQbdqO2RPAsHtLBGEOIDlfVkgiRp+bZodOI/dMjIacqlvDhmURaC6pGY13QpGNxf5ODAX0gA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCzGE9661Cgv219HXA7SMsqoQSCvdgFhfDJharU8irqBx55SUM
	DpxRRrhkbo5TAQHlAxo3rl7AN5xDZUXRQLkfQZdZYPvIq3M1YdMsEc6IZ1V6Qg==
X-Google-Smtp-Source: AGHT+IGfta+Jvx33HyvdweAEJwMYBXtq/eJe27y/vgXE0SzAFay2qwAEyLddvrFN78BITYFjruqZnQ==
X-Received: by 2002:a05:600c:3b14:b0:426:8884:2c58 with SMTP id 5b1f17b1804b1-4319ac6fb0amr86621375e9.4.1730189319727;
        Tue, 29 Oct 2024 01:08:39 -0700 (PDT)
Message-ID: <5fb1ac28-395c-4065-8a70-4bac809c7f50@suse.com>
Date: Tue, 29 Oct 2024 09:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-7-ayan.kumar.halder@amd.com>
 <27be8d00-8260-460e-948d-81418b93662a@suse.com>
 <8fa530cb-4d70-4300-8d4e-1e7208f7c045@amd.com>
 <55728fdc-6247-4810-8696-a999713f4a7c@suse.com>
 <3231cc7b-4c2e-4939-a623-a7b9960d1641@amd.com>
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
In-Reply-To: <3231cc7b-4c2e-4939-a623-a7b9960d1641@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 18:38, Ayan Kumar Halder wrote:
> On 28/10/2024 15:01, Jan Beulich wrote:
>> On 28.10.2024 15:39, Ayan Kumar Halder wrote:
>>> On 28/10/2024 12:55, Jan Beulich wrote:
>>>> On 28.10.2024 13:45, Ayan Kumar Halder wrote:
>>>>> --- a/xen/arch/Kconfig
>>>>> +++ b/xen/arch/Kconfig
>>>>> @@ -6,11 +6,13 @@ config PHYS_ADDR_T_32
>>>>>    
>>>>>    config NR_CPUS
>>>>>    	int "Maximum number of CPUs"
>>>>> +	range 1 1 if ARM && MPU
>>>>>    	range 1 16383
>>>>>    	default "256" if X86
>>>>>    	default "8" if ARM && RCAR3
>>>>>    	default "4" if ARM && QEMU
>>>>>    	default "4" if ARM && MPSOC
>>>>> +	default "1" if ARM && MPU
>>>>>    	default "128" if ARM
>>>>>    	help
>>>>>    	  Controls the build-time size of various arrays and bitmaps
>>>> I'm afraid I can't easily tell whether MPU can be used together with any of
>>>> RCAR3, QEMU, or MPSOC. If it can, the new default line would need to move
>>>> up, as it's the first one that has a match on its condition which is being
>>>> used.
>>> MPU cannot be used with any of the existing platforms.
>> That is - qemu can't emulate such an environment, i.e. even QEMU and MPU
>> don't go together?
> 
> Qemu has support for Aarch32 MPU at EL2 and EL1 (ie R52). As far as I am 
> aware, there is no support for Aarch64 MPU in Qemu (ie R82).
> 
> Even for R52, I could not get the upstream Qemu working (emulating some 
> Arm reference platform).
> 
> I could get the Xilinx fork of Qemu (https://github.com/Xilinx/qemu) 
> working which emulates AMD's SoC using R52.
> 
> However, this should not impact the current patch. There is no Qemu in 
> xen/arch/arm/platforms/*.

Aiui that's not relevant. There is a QEMU item in xen/arch/arm/platforms/Kconfig.
I continue to fail to see why that couldn't be selected together with MPU. Yet if
it can be, you'd end up with a default of 4, not 1, if it actually _is_ selected.
Alternatively QEMU (and maybe also RCAR3 and MPSOC) need to be mutually exclusive
with MPU. Hmm, looks like that's already the case, by patch 2 suppressing the
"Platform Support" prompt. While that looks fragile to me, I'm sorry for the
noise then.

Jan


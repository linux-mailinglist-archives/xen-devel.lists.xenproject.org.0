Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F7AD75D8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 17:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013248.1391759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjn0-0004M6-UZ; Thu, 12 Jun 2025 15:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013248.1391759; Thu, 12 Jun 2025 15:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjn0-0004JW-Qs; Thu, 12 Jun 2025 15:24:26 +0000
Received: by outflank-mailman (input) for mailman id 1013248;
 Thu, 12 Jun 2025 15:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPjmz-0004JO-HS
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 15:24:25 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5220231c-47a1-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 17:24:24 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso1025302f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 08:24:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748809ebb34sm1570589b3a.123.2025.06.12.08.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 08:24:22 -0700 (PDT)
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
X-Inumbo-ID: 5220231c-47a1-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749741864; x=1750346664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R+7+5fXQw914bqzYhIjU1RBPjs056c2PsR4iTnYCuhw=;
        b=frSvESWdLIP405h0XhfsnE8Hz1WnKyXc0ISLBtpqF/9DnpplrjbxpBbY58NZDgON4E
         7195QPbl4JmDcb8rCiU2lUW+8nMfcwW3abER0soz8QZN51vIrh2WIqNOyVa5Bo5Ajqis
         jZXviEQWaVjjWrC2SMs+4Wl+72Xe5yqpiyfhGidFiETkp8JBRpZ/VQPnnoRCW0PbnqGU
         631MjZDfReVmaQCYuRp5SCgnBAY9zI3PqmgE6mo6PJzuntbXG8hqR420pW3GLWhSxzfg
         Fi51sfA8xbtK8vrT1Q/re4ytOJFqmjA+YyqYwrPw0AIgX+YetcMdVpZGH4FUeFRNJ8BF
         MzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749741864; x=1750346664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+7+5fXQw914bqzYhIjU1RBPjs056c2PsR4iTnYCuhw=;
        b=K+ha8JWvN4pHTR0yjU8Zt/LnmtTTSzjCl7bBFgyUgqbg9RT2hcX0edM0IkY8qbANqP
         un/f0kbEVaqKH0fdEFlEu1SFfLNjjijDCRRldhHDY+mwrXV+4cJ2+ss/+TIQBA9b7Bbr
         0NT68e3zYnoIvg88kY1cQBkcGh+gUCqO3kWjGZSqIHIYCLtnIdhGdHJjfD9a7Xeb3eoz
         sEWoNjwcH9ENO5egHDyQ3crLd1SzHz/Me41DomWGX4lRczT/r0t1Vvr5hedAAuFDF5TE
         RQLK/awQ7OTamCQaDQwCZg8risu2c0veQmk1Qk59lrh+B1C0oD/f3VGE1Ao7vk86SDEa
         /3bg==
X-Forwarded-Encrypted: i=1; AJvYcCV0KOCeV8fcU+0RvSwu4ym6lw5NS1lcSksR3FFINQODRI7R1FBeEdZx+Ld+EU1W40yY78kP8uTRmPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEKW035/4JUTYaWd+6cC6RU+ueawZ2bgAzH9rBicgcIHzSaHUY
	RW0+MFtJe/kkTBrCJkUo/7dnb8IEHHA4Waf/Jr4qS1+WilRHiyk7aHgDJjfPmFG5tg==
X-Gm-Gg: ASbGnctfPdLaZN+pjBAd5BcJuuWYMl2W8SsPqIZ/iuoX7knMrAxFKMAduZb3Zim0cU3
	5oCsuP3YbBSmesNCC4EuwZpw9IHgwwod8h4mUIjFEqwancpYQp0kbB1LTnGPu5Ai2nOSiU5uL95
	Jmx5B40/rci6zGXOpv2wWYR1GK8fNvdouZIqldoX2Sclm2b4ToCKsaxdh59lt5gqfxjsvVHZle0
	jng6cSUUEuADT1RQ6AuKV3/Xl3m4WYir0cp9UUs1IQybjOGu9DvfnrZXNG686ybzKKVMTsuA5CF
	JabPwniz7NwX5aePbmS7muoCSJQkPbiy7x9NNatT/naxOjdqyiCDdG6RMpAubW8iNv1OiSsw2Zf
	awqt/KbsyE+ySj3E8YSxmnwmCHL6ZdnUz6p8nmJhRJbGjZ+8=
X-Google-Smtp-Source: AGHT+IE0giuHl921aCiPBemprpP1I4LgU5oYSBi0zRhAHq2HOn3jZ2uQ8B/x9t+DvfvZEG1kporWUA==
X-Received: by 2002:a5d:588d:0:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3a5607c9b78mr3446793f8f.32.1749741863621;
        Thu, 12 Jun 2025 08:24:23 -0700 (PDT)
Message-ID: <aa377030-de69-4441-82c1-aecfed9319ab@suse.com>
Date: Thu, 12 Jun 2025 17:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250610174635.203439-1-stewart.hildebrand@amd.com>
 <6ac8ffbc-5bd3-4bea-9ade-f31710747291@suse.com>
 <3a203b96-94e3-47c3-92b6-b68141ea3794@amd.com>
 <fb7ce573-f827-49d8-9cb4-31439db46564@suse.com>
 <2150be73-e23a-4caa-91a7-8f7c139e4e87@amd.com>
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
In-Reply-To: <2150be73-e23a-4caa-91a7-8f7c139e4e87@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 17:18, Stewart Hildebrand wrote:
> On 6/12/25 10:58, Jan Beulich wrote:
>> On 12.06.2025 15:39, Stewart Hildebrand wrote:
>>> On 6/11/25 01:23, Jan Beulich wrote:
>>>> On 10.06.2025 19:46, Stewart Hildebrand wrote:
>>>>> --- a/xen/arch/arm/Kconfig
>>>>> +++ b/xen/arch/arm/Kconfig
>>>>> @@ -258,6 +258,16 @@ config PARTIAL_EMULATION
>>>>>  
>>>>>  source "arch/arm/firmware/Kconfig"
>>>>>  
>>>>> +config PCI_PASSTHROUGH
>>>>> +	bool "PCI passthrough" if EXPERT
>>>>> +	depends on ARM_64
>>>>> +	select HAS_PCI
>>>>> +	select HAS_VPCI
>>>>> +	select HAS_VPCI_GUEST_SUPPORT
>>>>
>>>> What about HAS_PASSTHROUGH? Seeing that being selected by MMU, what about
>>>> that connection here?
>>>
>>> Hm, yes. I'm not sure if depends or select would be better?
>>>
>>> 	depends on ARM_64 && HAS_PASSTHROUGH
>>>
>>> or
>>>
>>> 	select HAS_PASSTHROUGH
>>
>> Actually, thinking of it: HAS_* shouldn't be selected based on user choices,
>> imo. Perhaps unless the HAS_* is a sub-feature of the dependent (as in e.g.
>> "select HAS_VPCI if HVM" as we have it for x86). In which case all the
>> select-s here might be wrong to use.
> 
> How about something like this:
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 3f25da3ca5fd..95a2cd3d006d 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -8,6 +8,8 @@ config ARM_64
>  	depends on !ARM_32
>  	select 64BIT
>  	select HAS_FAST_MULTIPLY
> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH

This one may be okay, subject to the Arm maintainers' views.

> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH

At the first glance this one instead should be ...

> @@ -258,6 +260,12 @@ config PARTIAL_EMULATION
>  
>  source "arch/arm/firmware/Kconfig"
>  
> +config PCI_PASSTHROUGH
> +	bool "PCI passthrough" if EXPERT
> +	depends on ARM_64
> +	help
> +	  This option enables PCI device passthrough

... a "depends on" here, imo. Yet that would go against your intentions,
I think, so doing it the way you have it may be okay, subject to how you
justify it.

> --- a/xen/drivers/Kconfig
> +++ b/xen/drivers/Kconfig
> @@ -13,6 +13,7 @@ source "drivers/pci/Kconfig"
>  source "drivers/video/Kconfig"
>  
>  config HAS_VPCI
> +	select HAS_PCI
>  	bool

Please can the "bool" remain first?

Jan


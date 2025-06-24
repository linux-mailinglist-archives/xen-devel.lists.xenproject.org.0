Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE8EAE61CF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 12:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023525.1399516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0a1-0002WW-5I; Tue, 24 Jun 2025 10:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023525.1399516; Tue, 24 Jun 2025 10:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0a1-0002To-1j; Tue, 24 Jun 2025 10:08:41 +0000
Received: by outflank-mailman (input) for mailman id 1023525;
 Tue, 24 Jun 2025 10:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU0Zz-0002Ti-6t
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 10:08:39 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31b41cb5-50e3-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 12:08:37 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso4109190f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 03:08:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c8872246sm1415719b3a.159.2025.06.24.03.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 03:08:36 -0700 (PDT)
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
X-Inumbo-ID: 31b41cb5-50e3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750759716; x=1751364516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KuTeWOTob/8p3ejM+znIczIbcgWK9s6JZ1TvFUIjBHs=;
        b=S02HilvNM0n7W5wxYGTpef+3kwZXFdPwGgZ4TqXJ23k7gscToEDDgnBm25nKvvHc0f
         LrRTCvGDzMWdtbBTQQXTJ+cmXLNSl5cYTvEB3BOjROfvZ6N1oVlDbs0LvMhEOenuAcsd
         I9lAdnAC/O5YDiUYQazPv0G4Tp6VVME5IYrmMpNFo58Gf+uGHEw+M9Yd78vCAPEQqKLY
         u55yLrWfeFrVygwe6a6dvOnatxf+N8x+0hcDj6lrhvlB3i8/C9MHr8Af0d5KL9DYsEaM
         tlsIfD2deXQoGnsObWQ3ldKd+IYARNndUDoZVGCyB8F1KbZHG78uIKQytoGKNolXJW21
         i1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759716; x=1751364516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuTeWOTob/8p3ejM+znIczIbcgWK9s6JZ1TvFUIjBHs=;
        b=TLOcDEUCZ+qBDk33JfEP6HdTxSEiXAI+ArNdi/4kR3bLhRbHbCxtscT2IGY58An8zB
         O7Sfe4CWhUhWxXNM6r5t8Ww45tRnKBTLV9R32M78EPGkQd1bYft8eP9XqqbhazJt4wGD
         OiAR8ZtfFXCSIrQSfLYOLiquzGZKUA2DOjAqwjdQj2anGbINT9gE59mfNtL5Q17Uahuh
         5hceG0Y14muJt3rGjGNGROAenk6MChDv19v5IMRQM4g/vdbXJz1CyH9kKPpGxXSffDJR
         QHtv7DI0FNAPLkgrCOV0SZw4I2MN0VMFBBTNsFUlZdyzxeFvMchux612qbiVd/0/yLsx
         cutQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp0qCS2MbK/LQKok4LQHvO1X9ZR0wHfwn8sffrczBCNbHBMQxStPARroUS4gFZRp21FXpBgRyt1Eg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyf8zhVUd6bfo1lDcRqAzhHfvuiKdbVTrIW5qhJSRfZtDOVTFtS
	sPALVApq+lrdjUhOzqErFtzwENbzJcMkpZXypH/0ZRckacQYkWAK+qNAqOLpLLm4FA==
X-Gm-Gg: ASbGncvRLRbuLrGWry4/LjigD6H7/XnU7jNv7zPapKHGJZXgXMJZL7mICLx/JR/o57t
	QkGUybBYlyJ6dTVGnN3KuvCkYY2U40JEwif7H+aF2PzIY6Bjq/0XcasSqriN5u8P82cRpxKAixn
	eKzH2dftcDCovYkvWtubL7eQELUDEz9XpuizdVfACXbteOx8mGwbQlPn8vKX7U9Q3FrCERtUBbI
	bxPmTiFEat3IzVoxquSmoavMMkfyoTuQ+xvbvJjEAOQaUaBdaFcW/ikE7e/f/3gcqbbLPhuxGlT
	/q8hLoLljSwBy8NL4n/tTR4/grZsGJRyghQjreP0Xoa+8x1IPjtmWA1jjkfs9FCvXPIse4Y5cYj
	Xuz8lVQUejgPNuKzQsmBqxWc008vV6ws/GE/lh2lqDJGPNMQ=
X-Google-Smtp-Source: AGHT+IF3v6jQluVJNX6LxM5IWU2CLfQRdMa1sX3BlbVw+di3trGOf0G9dXZzc43nRRuJFABGakZqwA==
X-Received: by 2002:a05:6000:2d05:b0:3a5:3517:de3e with SMTP id ffacd0b85a97d-3a6d1317833mr10665071f8f.35.1750759716516;
        Tue, 24 Jun 2025 03:08:36 -0700 (PDT)
Message-ID: <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
Date: Tue, 24 Jun 2025 12:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 11:29, Chen, Jiqian wrote:
> On 2025/6/24 16:05, Jan Beulich wrote:
>> On 24.06.2025 10:02, Chen, Jiqian wrote:
>>> On 2025/6/20 14:38, Jan Beulich wrote:
>>>> On 19.06.2025 08:39, Chen, Jiqian wrote:
>>>>> On 2025/6/18 22:05, Jan Beulich wrote:
>>>>>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>>>>>> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>>>>>>   */
>>>>>>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>>>>>>  
>>>>>>> -#define REGISTER_VPCI_INIT(x, p)                \
>>>>>>> -  static vpci_register_init_t *const x##_entry  \
>>>>>>> -               __used_section(".data.vpci." p) = (x)
>>>>>>> +#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>>>>>> +    static const vpci_capability_t finit##_t = { \
>>>>>>> +        .id = (cap), \
>>>>>>> +        .init = (finit), \
>>>>>>> +        .cleanup = (fclean), \
>>>>>>> +        .is_ext = (ext), \
>>>>>>> +    }; \
>>>>>>> +    static const vpci_capability_t *const finit##_entry  \
>>>>>>> +        __used_section(".data.rel.ro.vpci") = &finit##_t
>>>>>>
>>>>>> Could you remind me why the extra level of indirection is necessary here?
>>>>>> That is, why can't .data.rel.ro.vpci be an array of vpci_capability_t?
>>>>> You mean I should change to be:
>>>>> #define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>>>>     static const vpci_capability_t finit##_t \
>>>>>         __used_section(".data.rel.ro.vpci") = { \
>>>>>         .id = (cap), \
>>>>>         .init = (finit), \
>>>>>         .cleanup = (fclean), \
>>>>>         .is_ext = (ext), \
>>>>>     }
>>>>>
>>>>> Right?
>>>>
>>>> Yes, subject to the earlier comments on the identifier choice.
>>> Got it.
>>> One more question, if change to be that, then how should I modify the definition of VPCI_ARRAY?
>>> Is POINTER_ALIGN still right?
>>
>> Yes. The struct doesn't require bigger alignment afaics. (In fact in principle
>> no alignment should need specifying there, except that this would require
>> keeping the section separate in the final image. Which I don't think we want.)
>>
>>> Since I encountered errors that the values of __start_vpci_array are not right when I use them in vpci_init_capabilities().
>>
>> Details please.
> After changing __start_vpci_array to be vpci_capability_t array, codes will be (maybe I modified wrong somewhere):
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index c51bbb8abb19..9f2f438b4fdd 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -36,8 +36,8 @@ struct vpci_register {
>  };
> 
>  #ifdef __XEN__
> -extern const vpci_capability_t *const __start_vpci_array[];
> -extern const vpci_capability_t *const __end_vpci_array[];
> +extern vpci_capability_t __start_vpci_array[];
> +extern vpci_capability_t __end_vpci_array[];

Just fyi: You lost const here.

> @@ -255,7 +255,7 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
>  {
>      for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
>      {
> -        const vpci_capability_t *capability = __start_vpci_array[i];
> +        const vpci_capability_t *capability = &__start_vpci_array[i];
>          const unsigned int cap = capability->id;
>          const bool is_ext = capability->is_ext;
>          int rc;
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index f4ec1c25922d..77750dd4131a 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -31,14 +31,13 @@ typedef struct {
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
> 
>  #define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
> -    static const vpci_capability_t finit##_t = { \
> +    static vpci_capability_t finit##_entry \
> +        __used_section(".data.rel.ro.vpci") = { \
>          .id = (cap), \
>          .init = (finit), \
>          .cleanup = (fclean), \
>          .is_ext = (ext), \
> -    }; \
> -    static const vpci_capability_t *const finit##_entry  \
> -        __used_section(".data.rel.ro.vpci") = &finit##_t
> +    }
> 
>  #define REGISTER_VPCI_CAP(cap, finit, fclean) \
>      REGISTER_VPCI_CAPABILITY(cap, finit, fclean, false)
> 
> I print the value of NUM_VPCI_INIT, it is a strange number (6148914691236517209).

What are the addresses of the two symbols __start_vpci_array and __end_vpci_array?
At the first glance the changes above are what I would have expected.

Jan


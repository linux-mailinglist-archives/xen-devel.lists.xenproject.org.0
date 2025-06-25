Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6258AE7A69
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 10:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024474.1400331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uULd0-0000SI-Rs; Wed, 25 Jun 2025 08:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024474.1400331; Wed, 25 Jun 2025 08:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uULd0-0000QX-Oi; Wed, 25 Jun 2025 08:37:10 +0000
Received: by outflank-mailman (input) for mailman id 1024474;
 Wed, 25 Jun 2025 08:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uULcz-0000QR-Q2
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 08:37:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 948b4884-519f-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 10:37:08 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45310223677so46897795e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 01:37:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e08cf0sm4017191b3a.10.2025.06.25.01.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 01:37:07 -0700 (PDT)
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
X-Inumbo-ID: 948b4884-519f-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750840628; x=1751445428; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xeX8n97CPUt5vrF9ItN+TfIeKQ/k9YGoD5U2k7iUU/M=;
        b=bZzk1YBNEvygv5iE7CCI8Qjg/uIzxSUBF+G3SN/Vm3dTNA73VKO23s0/1EGpctnsSU
         H+/YFPImjvYPPVp1xQ1VrtkZ78Bwq9XyO1kzxqpsclXiXIZc+KJaYgGNDo+yTYYY2lI4
         wBzlcYBQf8soTMGXdWPg1wERzXcE3SJ/Jtse6NTjyUG4klrqfJOhZADa1f2lXaGhGfs8
         gptHwY4g8Rr395121EdPl0WYdwoAmY+OV7dMExzpv9NngzV5lQXvm/CrEFdW8uxKE4q3
         UIVA1HxZ5+V7iUwGhgAPp7F4+j3VJOxr3+oqUOnwjIfdrjUOoMBK6TTbd+fkWgIioNSc
         8CVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750840628; x=1751445428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeX8n97CPUt5vrF9ItN+TfIeKQ/k9YGoD5U2k7iUU/M=;
        b=FSC6CbGj0Nwzw36llQnzq8WVIwIOULWG7ECJh7wcP/vgnfrQZipZpaW3NhgRRVeMBN
         Z2p6dPWpevDlRE0Tj0n1WrTKDPE6AwlxjoBGf681ratU4UUa6WmU9jdj16rFiZrhXYcd
         0HIg1IpbQlyDt6wRcf9lQce/vd+69mlHb9E0d9L38neCCglAQtvR+dlyJORDRikyEuqR
         sHdJ9ro5VEsxci69itnVB0E6Cry//twF9gKWSZ18DfmS4xT5zlnaUdQcw6gDSXb3Uv5A
         2T8kb8WwCLRcCijifSChCI/yY7U+qqEHBgH2fOAnlPmikfkPEqin4m3JCxAbZ4umG3AQ
         3DCw==
X-Forwarded-Encrypted: i=1; AJvYcCVRFN27y5097GfWytkCVHaKixSlkP5TYIgszJ2vb+yd/5BHTNBN7HJPP4oKW7sMhDJKRG97JFbilwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf98wQECXMx8hxE2BMyCX3jSGudSsaUg2t8OTlNYmEuH9I5RO0
	MEpGL0lP4xJqY6AWowdFtHacMrh2GZbG+nLzZ0A0jBc8vduD2NCAewBh5jYAgOaFcA==
X-Gm-Gg: ASbGncuIcZHKmOX8vj7LcI4NSjXWFW7XZK+H6BCgtEfrPNk3O34vVaF3gMPEHhQMheL
	9E28YGM+nmnj2F58plYivMn75S4iyutJV1mDT8mmRwvL2QLsjv8ZTHjcVCuQHTHIt1LJlgpAc3K
	idLo35OP5O740753AHvx67fvaMDvCeAf9X0RYC2ZsVmPf3jS1A0XK+0Agqk+l7i0evHDKE/k0s4
	eKJKoHtSJblyYQvuIxC1rHbmvO+CiUwFtMcb3JoZKK3K5siAZ/fZbqDbdrBvuAkXT7vyCxa5baG
	w1z0PlFcSx8N4sKvccArqQgBZxlbuHPmT40KlqxzOLXwEd49PW52owD+7K6brSGc/fgqyqqBeG/
	VRrSUJ8CNrCDlHqZAsMGbV88KIjq4pRUiJuvqAcP92+r462w=
X-Google-Smtp-Source: AGHT+IEXl5H/wnrk0C1dqbuus5cIxWhUlhi5CnTUgR1KB/5TyHmY7KAcgEjaoA+/aD1be8ELl4tfXQ==
X-Received: by 2002:a05:6000:2410:b0:3a5:2ddf:c934 with SMTP id ffacd0b85a97d-3a6ed644198mr1281188f8f.30.1750840627584;
        Wed, 25 Jun 2025 01:37:07 -0700 (PDT)
Message-ID: <3638e73c-2a83-4164-9a84-839245245727@suse.com>
Date: Wed, 25 Jun 2025 10:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
 <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 08:51, Chen, Jiqian wrote:
> On 2025/6/24 18:08, Jan Beulich wrote:
>> On 24.06.2025 11:29, Chen, Jiqian wrote:
>>> On 2025/6/24 16:05, Jan Beulich wrote:
>>>> On 24.06.2025 10:02, Chen, Jiqian wrote:
>>>>> On 2025/6/20 14:38, Jan Beulich wrote:
>>>>>> On 19.06.2025 08:39, Chen, Jiqian wrote:
>>>>>>> On 2025/6/18 22:05, Jan Beulich wrote:
>>>>>>>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>>>>>>>> @@ -29,9 +30,22 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>>>>>>>>   */
>>>>>>>>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>>>>>>>>  
>>>>>>>>> -#define REGISTER_VPCI_INIT(x, p)                \
>>>>>>>>> -  static vpci_register_init_t *const x##_entry  \
>>>>>>>>> -               __used_section(".data.vpci." p) = (x)
>>>>>>>>> +#define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>>>>>>>> +    static const vpci_capability_t finit##_t = { \
>>>>>>>>> +        .id = (cap), \
>>>>>>>>> +        .init = (finit), \
>>>>>>>>> +        .cleanup = (fclean), \
>>>>>>>>> +        .is_ext = (ext), \
>>>>>>>>> +    }; \
>>>>>>>>> +    static const vpci_capability_t *const finit##_entry  \
>>>>>>>>> +        __used_section(".data.rel.ro.vpci") = &finit##_t
>>>>>>>>
>>>>>>>> Could you remind me why the extra level of indirection is necessary here?
>>>>>>>> That is, why can't .data.rel.ro.vpci be an array of vpci_capability_t?
>>>>>>> You mean I should change to be:
>>>>>>> #define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>>>>>>     static const vpci_capability_t finit##_t \
>>>>>>>         __used_section(".data.rel.ro.vpci") = { \
>>>>>>>         .id = (cap), \
>>>>>>>         .init = (finit), \
>>>>>>>         .cleanup = (fclean), \
>>>>>>>         .is_ext = (ext), \
>>>>>>>     }
>>>>>>>
>>>>>>> Right?
>>>>>>
>>>>>> Yes, subject to the earlier comments on the identifier choice.
>>>>> Got it.
>>>>> One more question, if change to be that, then how should I modify the definition of VPCI_ARRAY?
>>>>> Is POINTER_ALIGN still right?
>>>>
>>>> Yes. The struct doesn't require bigger alignment afaics. (In fact in principle
>>>> no alignment should need specifying there, except that this would require
>>>> keeping the section separate in the final image. Which I don't think we want.)
>>>>
>>>>> Since I encountered errors that the values of __start_vpci_array are not right when I use them in vpci_init_capabilities().
>>>>
>>>> Details please.
>>> After changing __start_vpci_array to be vpci_capability_t array, codes will be (maybe I modified wrong somewhere):
>>>
>>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>>> index c51bbb8abb19..9f2f438b4fdd 100644
>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -36,8 +36,8 @@ struct vpci_register {
>>>  };
>>>
>>>  #ifdef __XEN__
>>> -extern const vpci_capability_t *const __start_vpci_array[];
>>> -extern const vpci_capability_t *const __end_vpci_array[];
>>> +extern vpci_capability_t __start_vpci_array[];
>>> +extern vpci_capability_t __end_vpci_array[];
>>
>> Just fyi: You lost const here.
>>
>>> @@ -255,7 +255,7 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
>>>  {
>>>      for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
>>>      {
>>> -        const vpci_capability_t *capability = __start_vpci_array[i];
>>> +        const vpci_capability_t *capability = &__start_vpci_array[i];
>>>          const unsigned int cap = capability->id;
>>>          const bool is_ext = capability->is_ext;
>>>          int rc;
>>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>>> index f4ec1c25922d..77750dd4131a 100644
>>> --- a/xen/include/xen/vpci.h
>>> +++ b/xen/include/xen/vpci.h
>>> @@ -31,14 +31,13 @@ typedef struct {
>>>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>>>
>>>  #define REGISTER_VPCI_CAPABILITY(cap, finit, fclean, ext) \
>>> -    static const vpci_capability_t finit##_t = { \
>>> +    static vpci_capability_t finit##_entry \
>>> +        __used_section(".data.rel.ro.vpci") = { \
>>>          .id = (cap), \
>>>          .init = (finit), \
>>>          .cleanup = (fclean), \
>>>          .is_ext = (ext), \
>>> -    }; \
>>> -    static const vpci_capability_t *const finit##_entry  \
>>> -        __used_section(".data.rel.ro.vpci") = &finit##_t
>>> +    }
>>>
>>>  #define REGISTER_VPCI_CAP(cap, finit, fclean) \
>>>      REGISTER_VPCI_CAPABILITY(cap, finit, fclean, false)
>>>
>>> I print the value of NUM_VPCI_INIT, it is a strange number (6148914691236517209).
>>
>> What are the addresses of the two symbols __start_vpci_array and __end_vpci_array?
> __end_vpci_array is 0xffff82d0404251b8
> __start_vpci_array is 0xffff82d040425160
> NUM_VPCI_INIT is 0x5555555555555559
> sizeof(vpci_capability_t) is 0x18

Oh, of course - there's a psABI peculiarity that you run into here: Aggregates
larger than 8 bytes are required to have 16-byte alignment. Hence while
sizeof() == 0x18 and __alignof() == 8, the section contributions still are
accompanied by ".align 16", and thus respective padding is inserted by
assembler and linker. IOW you end up with two 32-byte entries and a trailing
24-byte one. The easiest (and least problematic going forward) approach to
deal with that is probably going to be to add __aligned(16) to the struct
decl. (Whether to limit this to just x86 I'm not sure: While other psABI-s may
be different in this regard, we may want to be on the safe side.)

However, there looks to be another (gcc) anomaly: By default, half-way recent
gcc aligns this kind of object even to 32-byte boundaries, due to defaulting
to -malign-data=compat. We will want to consider to use -malign-data=abi
instead (supported by gcc5 and newer). I'm in the process of preparing a patch
to propose this more formally.

Jan


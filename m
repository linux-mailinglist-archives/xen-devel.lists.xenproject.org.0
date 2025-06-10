Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81800AD2E54
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 09:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010522.1388638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOt5d-0002Ju-M3; Tue, 10 Jun 2025 07:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010522.1388638; Tue, 10 Jun 2025 07:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOt5d-0002HJ-IY; Tue, 10 Jun 2025 07:08:09 +0000
Received: by outflank-mailman (input) for mailman id 1010522;
 Tue, 10 Jun 2025 07:08:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOt5c-0002HD-13
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 07:08:08 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a60c5e40-45c9-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 09:08:02 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so39086765e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 00:08:02 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5323b33c3sm11559901f8f.34.2025.06.10.00.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:08:01 -0700 (PDT)
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
X-Inumbo-ID: a60c5e40-45c9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749539282; x=1750144082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7OIufhB56DSUHISwapg5RX9lWzyFlOwrJcEowX+vfyQ=;
        b=cM+BfOQPbB9coTRvXK9VRCNfhxdou17KYe7zbm+fJYBHZ9c8XDHX2BJ/zUxahgP3hA
         FD5ncHm+w+AeD48lGZ/i7d6uDqurHcrXzzarNGAX42QVsT3fkd+50yIhMSWgGJKvzoLJ
         UGwZUzuHzBAA0XgL84EzEAYcScfYcylv/mwxLtvK6eZWAFdduZ39NlwBKUz2NN9HL5MI
         FxSCS0eV4RVBtlORMYIAQSFvHHDM31sVCsb9K4lnXV6y7OnbgNmHbOrTQdJX2htX3cNY
         Yvf+OYHUlJqFEutUrhAPDc+3f4JgX7LSX0iUaQcQdtuDUxoccWCzqcp83Tx+Eoyi9I8v
         HBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749539282; x=1750144082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OIufhB56DSUHISwapg5RX9lWzyFlOwrJcEowX+vfyQ=;
        b=h2rx5dT4huAaZAkl1xVkDfLyCRBME+tynII08gv6iv78pF6LfyUXBQ3pxxFDt/FA3C
         +KUxElMORmFqibseUAIH9v7w9R+SyLXlvVoonYj83QUYUacGN+LUW66n1DCwnJymN5v8
         y8Sv1Dq3GlCHOJIAb1GlJTTc6uDEzQVzjEZ+AgWe2n8dQ4APGnvEiJ0zWb9ARAwyaUdx
         xjE/+Y0IzlE27PYor4n5LpVYQzj6YANgRzm/9/QKVP2z54/JjsL7QJa6chSakOtqC+OT
         E9ZbK3NrxEpRLS9mppc4y51rQuN66Y9ZY1/JOJaVNCplimH7oZqBxDqxF+6nmRb4MXZN
         vh9A==
X-Gm-Message-State: AOJu0YwN2dEFjIu+AjDn5fVmiaL03YIabKgIqptM8CsxIptuUR4nn6lW
	HY+f0IVC7D7Wk7TFC0erGxwCqofLmiUnBJ1nopv7EgaUWThM3F4SP5tG87jpriQgvw==
X-Gm-Gg: ASbGnct4xF/Dig4vlGuhR/2QT3Z6iZgK3e4PLlNhQSW8yGV71YHAZTxfZBMXdne8J/H
	T1Ng8Ci6VchLC246r9OKXUaO5SnXp0bqi1VHD1FoQOpxBfX+XhkGtLK9wbWrgebq/ewDFvcAvJV
	/heT9i3MVCfe3rBCHxL2d4x0APJT0YJiTFPrT/4k0hXvGviNwXIRL6auoyGV+4gsKkF4f4kr+s1
	vE+ZreJoyrtJNNZnU1T4Fgjp7cyD1UzY1wE2wPa8f4yN6sTkIjiVyf3RsP5+CMhxdZRS0ARZQxg
	PgRsYen2i9Rd7DhE5FG4/MbHtoUak9q0V8Dp+So7C5ibGbnEZ6Epyex5gV3MCu+W+H20YtqJr7a
	Z+T1dHTS50Yssn7dfr7wSDTp30sysqXPQOcV75KVL0bKaraj3pRj0rL0zPsXr9MQ4jCitb/8xsw
	+AKp2LcFi1heyNSgaKPsyy
X-Google-Smtp-Source: AGHT+IGFHpwHP632fG6AuLr4Iw5WYTdABjxm7wzoJBz9rRgqaEW7nQrqP6Gz7sO5dhUxzogg0KSYiw==
X-Received: by 2002:a05:600c:5303:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4531cffa4bemr20889975e9.13.1749539282080;
        Tue, 10 Jun 2025 00:08:02 -0700 (PDT)
Message-ID: <6a7a1ab8-aabb-465b-bd22-a2bc1597b83b@suse.com>
Date: Tue, 10 Jun 2025 09:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
 <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>
 <aEKxWLdDDyzmNvGF@macbook.local>
 <BL1PR12MB5849CA0CBDAE1E49DE54BD03E76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aEapjHyBxHkkylkh@macbook.local>
 <BL1PR12MB5849102F05BD316C0BC20F9FE76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aEa6JsVwyWchp04u@macbook.local>
 <PH7PR12MB5854FC2E82CD17483B6B6BCFE76AA@PH7PR12MB5854.namprd12.prod.outlook.com>
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
In-Reply-To: <PH7PR12MB5854FC2E82CD17483B6B6BCFE76AA@PH7PR12MB5854.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2025 05:52, Chen, Jiqian wrote:
> On 2025/6/9 18:40, Roger Pau Monné wrote:
>> On Mon, Jun 09, 2025 at 10:18:42AM +0000, Chen, Jiqian wrote:
>>> On 2025/6/9 17:29, Roger Pau Monné wrote:
>>>> On Mon, Jun 09, 2025 at 07:50:21AM +0000, Chen, Jiqian wrote:
>>>>> On 2025/6/6 17:14, Roger Pau Monné wrote:
>>>>>> On Fri, Jun 06, 2025 at 09:05:48AM +0200, Jan Beulich wrote:
>>>>>>> On 06.06.2025 08:29, Chen, Jiqian wrote:
>>>>>>>> On 2025/6/5 20:50, Roger Pau Monné wrote:
>>>>>>>>> On Mon, May 26, 2025 at 05:45:53PM +0800, Jiqian Chen wrote: 
>>>>>>>>>> +  }; \
>>>>>>>>>> +  static vpci_capability_t *const finit##_entry  \
>>>>>>>>>> +               __used_section(".data.vpci") = &finit##_t
>>>>>>>>>
>>>>>>>>> IMO this should better use .rodata instead of .data. 
>>>>>>>> Is below change correct?
>>>>>>>>
>>>>>>>> +    static const vpci_capability_t *const finit##_entry  \
>>>>>>>> +        __used_section(".rodata") = &finit##_t
>>>>>>>
>>>>>>> No, specifically because ...
>>>>>>>
>>>>>>>>> Not that it matters much in practice, as we place it in .rodata anyway.  Note
>>>>>>>>> however you will have to move the placement of the VPCI_ARRAY in the
>>>>>>>>> linker script ahead of *(.rodata.*), otherwise that section match will
>>>>>>>>> consume the vPCI data.
>>>>>>>> I am sorry, how to move it ahead of *(.rodata.*) ?
>>>>>>>> Is below change correct?
>>>>>>>>
>>>>>>>> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
>>>>>>>> index 793d0e11450c..3817642135aa 100644
>>>>>>>> --- a/xen/include/xen/xen.lds.h
>>>>>>>> +++ b/xen/include/xen/xen.lds.h
>>>>>>>> @@ -188,7 +188,7 @@
>>>>>>>>  #define VPCI_ARRAY               \
>>>>>>>>         . = ALIGN(POINTER_ALIGN); \
>>>>>>>>         __start_vpci_array = .;   \
>>>>>>>> -       *(SORT(.data.vpci.*))     \
>>>>>>>> +       *(.rodata)             \
>>>>>>>
>>>>>>> ... this isn't - you'd move _all_ of .rodata into here, which definitely
>>>>>>> isn't what you want. What I understand Roger meant was a .rodata-like
>>>>>>> section, e.g. .rodata.vpci.* (much like it was .data.vpci.* before).
>>>>>>
>>>>>> Indeed, my suggestion was merely to use .rodata instead of .data, as
>>>>>> that's more accurate IMO.  I think it should be *(.rodata.vpci) (and
>>>>>> same section change for the __used_section() attribute.
>>>>>
>>>>> If I understand correctly, the next version will be:
>>>>>
>>>>> +    static const vpci_capability_t *const finit##_entry  \
>>>>> +        __used_section(".rodata.vpci") = &finit##_t
>>>>> +
>>>>>
>>>>> and
>>>>>
>>>>>  #define VPCI_ARRAY               \
>>>>>         . = ALIGN(POINTER_ALIGN); \
>>>>>         __start_vpci_array = .;   \
>>>>> -       *(SORT(.data.vpci.*))     \
>>>>> +       *(.rodata.vpci)           \
>>>>>         __end_vpci_array = .;
>>>>
>>>> Did you also move the instances of VPCI_ARRAY in the linker scripts so
>>>> it's before the catch-all *(.rodata.*)?
>>>>
>>>>>
>>>>> But, that encountered an warning when compiling.
>>>>> " {standard input}: Assembler messages:
>>>>> {standard input}:1160: Warning: setting incorrect section attributes for .rodata.vpci
>>>>> {standard input}: Assembler messages:
>>>>> {standard input}:3034: Warning: setting incorrect section attributes for .rodata.vpci
>>>>> {standard input}: Assembler messages:
>>>>> {standard input}:6686: Warning: setting incorrect section attributes for .rodata.vpci "
>>>>
>>>> What are the attributes for .rodata.vpci in the object files?  You can
>>>> get those using objdump or readelf, for example:
>>>>
>>>> $ objdump -h xen/drivers/vpci/msi.o
>>>> [...]
>>>>  17 .data.vpci.9  00000008  0000000000000000  0000000000000000  00000a50  2**3
>>>>                   CONTENTS, ALLOC, LOAD, RELOC, DATA
>>>>
>>>> It should be READONLY, otherwise you will get those messages.
>>>>
>>>>> And, during booting Xen, all value of __start_vpci_array is incorrect.
>>>>> Do I miss anything?
>>>>
>>>> I think that's likely because you haven't moved the instance of
>>>> VPCI_ARRAY in the linker script?
>>> Oh, right. Sorry, I forgot to move it.
>>> After changing this, it works now.
>>>
>>> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
>>> index bf956b6c5fc0..c88fd62f4f0d 100644
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -134,6 +134,7 @@ SECTIONS
>>>         BUGFRAMES
>>>
>>>         *(.rodata)
>>> +       VPCI_ARRAY
>>>         *(.rodata.*)
>>>         *(.data.rel.ro)
>>>         *(.data.rel.ro.*)
>>> @@ -148,7 +149,6 @@ SECTIONS
>>>         *(.note.gnu.build-id)
>>>         __note_gnu_build_id_end = .;
>>>  #endif
>>> -       VPCI_ARRAY
>>>    } PHDR(text)
>>
>> FWIW, I would put it ahead of *(.rodata).  Remember to also modify the
>> linker script for all the other arches, not just x86.
> 
> Whether before *(.rodata.*) or before *(.rodata), there still is the warning " Warning: setting incorrect section attributes for .rodata.vpci "
> And the objdump shows "rodata.vpci" has no "readonly" word.

Did you check what gcc emits? It may be requesting "aw" instead of the
wanted "a" in the section attributes. Since there are relocations here,
".rodata." may not be the correct prefix to use; it may instead need to
be ".data.rel.ro.".

Jan


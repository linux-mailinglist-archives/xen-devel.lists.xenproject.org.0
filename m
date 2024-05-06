Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004238BC983
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717305.1119374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tdu-0000DA-UU; Mon, 06 May 2024 08:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717305.1119374; Mon, 06 May 2024 08:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tdu-0000Aj-RD; Mon, 06 May 2024 08:24:14 +0000
Received: by outflank-mailman (input) for mailman id 717305;
 Mon, 06 May 2024 08:24:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3tdt-0000Ad-CP
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:24:13 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04990f20-0b82-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 10:24:12 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51ae2e37a87so2159826e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 01:24:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d5404000000b0034ca136f0e9sm10078398wrv.88.2024.05.06.01.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 01:24:11 -0700 (PDT)
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
X-Inumbo-ID: 04990f20-0b82-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714983852; x=1715588652; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3RnKgDBuRQFq9ioB+Ph2oGOdUSZAJ31Q/yo5SWdrVVQ=;
        b=UwJbX/adTFzsKrCxZ+D3tyabCZv6ZM/NdjfMsSvrmsPcZ+NwGG1fSEDX11aThrWIVI
         bXg2eKkkMyMcnl75NtVaTMfAEt4q53HasUlwpqKgC7n1OUFPLkL+TkShDPqFU89GENOb
         i0E6ee2zUfYHSH55OujK1E+No8/8KXaL6sSA0K9jdK9r8aUBUIJA0FvtMsHRbyt07YTR
         MKXrAPzCReA9+K82C8dyvVl3VzAyqK31d2KuJArGuZVudSiOJ8MVinCo3E818MR9NouG
         V242wlVkD5SaazKTjapZDMfY/bKcqyN0sVEAA/XYKrJtkTJss3QHv1pA8M/Ht7MhbI/k
         2NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714983852; x=1715588652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3RnKgDBuRQFq9ioB+Ph2oGOdUSZAJ31Q/yo5SWdrVVQ=;
        b=SFFJAaGU9nNYSOZnC6DiFqFwEbelYjiKgsVqPHjUrz7b/6Lh/h/XJKadYXhbA8OrIp
         9kNPDG2Frl0J4jaUcc4fKpFLGF8FADE7d0oFHZZUsIaKWbkYYzFGvBSmAOZUQymBKJSA
         bmqohLIrcdPGxqNfUdfoW+EixCOe3PurGIIu0nwOWk7NkmW8t2mc/kmhMIkzLGM5P/wj
         zjqvD9zhIIBGaVjoCxGxfu5XHGzhXRL3/S62CNlsA5cw0ugYmAS8DMisAn4hjE2oK1V0
         6CMGgn2k+8URaEyiUHC4B0yugpop6R3lBOJajOlpHJb7Sz5C5teaMaw1FzP70H1pZQoj
         Brhg==
X-Forwarded-Encrypted: i=1; AJvYcCU6hQylR4ENPbI6ENWGRvRnrSCRWTT1Tq/k0nMUlOErtvjlHYfyG2HdydM6sV3lEXYz635M33+h8VffOwcn8Pr4v3F53t8wzKkQp8CwGts=
X-Gm-Message-State: AOJu0YxyS4yY6IqiFitZD5EGHOiJaEqL9SODkZYPaXSFM6fP8YXg+Nc3
	V7DxCOPzcBzsQjcYGqEWSqiIpZIXDC2zj8b4UcXrSe+AVpR8byHgNMIrTu/1DA==
X-Google-Smtp-Source: AGHT+IFRaAv70T/zkgmRKpffOfiooMo4XeSxJdaVqlPvZkjHzcghW0dd5LQf3AGCdz9tE/OgbDbEZw==
X-Received: by 2002:ac2:46d4:0:b0:51e:f8ae:db35 with SMTP id p20-20020ac246d4000000b0051ef8aedb35mr5782212lfo.43.1714983851870;
        Mon, 06 May 2024 01:24:11 -0700 (PDT)
Message-ID: <7f2eb0fb-3ed1-4248-90bd-2bc3551a97f1@suse.com>
Date: Mon, 6 May 2024 10:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/17] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <1a0977e3cf5a2de9f760ca5ec89a0d096894a9e3.1713347222.git.oleksii.kurochko@gmail.com>
 <3827c11c-6d47-411d-a356-871def4e5b30@suse.com>
 <940f11ee23b43ada1dba50bc0236c4764eb13d71.camel@gmail.com>
 <93eeb1d8-d41f-40e8-8ca2-e6828877b53d@suse.com>
 <2d81e4700075b55f1885a4b1c7ee44ad046b35f2.camel@gmail.com>
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
In-Reply-To: <2d81e4700075b55f1885a4b1c7ee44ad046b35f2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2024 10:16, Oleksii wrote:
> On Mon, 2024-05-06 at 08:33 +0200, Jan Beulich wrote:
>> On 03.05.2024 19:15, Oleksii wrote:
>>> On Thu, 2024-04-25 at 17:35 +0200, Jan Beulich wrote:
>>>>>   #include <asm/bitops.h>
>>>>>   
>>>>> +#ifndef arch_check_bitop_size
>>>>> +#define arch_check_bitop_size(addr)
>>>>
>>>> Can this really do nothing? Passing the address of an object
>>>> smaller
>>>> than
>>>> bitop_uint_t will read past the object in the generic__*_bit()
>>>> functions.
>>> It seems RISC-V isn' happy with the following generic definition:
>>>    extern void __bitop_bad_size(void);
>>>    
>>>    /* --------------------- Please tidy above here ----------------
>>> ----
>>>    - */
>>>    
>>>    #include <asm/bitops.h>
>>>    
>>>    #ifndef arch_check_bitop_size
>>>    
>>>    #define bitop_bad_size(addr) sizeof(*(addr)) <
>>> sizeof(bitop_uint_t)
>>>    
>>>    #define arch_check_bitop_size(addr) \
>>>        if ( bitop_bad_size(addr) ) __bitop_bad_size();
>>>    
>>>    #endif /* arch_check_bitop_size */
>>
>> I'm afraid you've re-discovered something that was also found during
>> the
>> original Arm porting effort. As nice and logical as it would (seem
>> to) be
>> to have bitop_uint_t match machine word size, there are places ...
>>
>>> The following errors occurs. bitop_uint_t for RISC-V is defined as
>>> unsigned long for now:
>>
>> ... where we assume such operations can be done on 32-bit quantities.
> Based on RISC-V spec machine word is 32-bit, so then I can just drop
> re-definition of bitop_uint_t in riscv/asm/types.h and use the
> definition of bitop_uint_t in xen/types.h.
> Also it will be needed to update __AMO() macros in <riscv>/asm/bitops.h
> in the following way:
>    #if BITOP_BITS_PER_WORD == 64
>    #define __AMO(op)   "amo" #op ".d"
>    #elif BITOP_BITS_PER_WORD == 32
>    #define __AMO(op)   "amo" #op ".w"
>    #else
>    #error "Unexpected BITS_PER_LONG"
>    #endif
> Note: BITS_PER_LONG was changed to BITOP_BITS_PER_WORD !
> 
> Only one question remains for me. Given that there are some operations whichcan be performed on 32-bit quantities, it seems to me that bitop_uint_t
> can only be uint32_t.
> Am I correct? If yes, do we need to have ability to redefine
> bitop_uint_t and BITOP_BITS_PER_WORD in xen/types.h:
>    #ifndef BITOP_TYPE
>    #define BITOP_BITS_PER_WORD 32
>    
>    typedef uint32_t bitop_uint_t;
>    #endif

Probably not, right now. Hence me having said "As nice and logical as it
would (seem to) be" in the earlier reply.

Jan


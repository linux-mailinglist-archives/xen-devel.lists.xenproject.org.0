Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A05F8AC6EA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 10:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709797.1108791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryozf-0003hu-7a; Mon, 22 Apr 2024 08:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709797.1108791; Mon, 22 Apr 2024 08:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryozf-0003fU-4m; Mon, 22 Apr 2024 08:25:43 +0000
Received: by outflank-mailman (input) for mailman id 709797;
 Mon, 22 Apr 2024 08:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ryozd-0003fN-H5
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 08:25:41 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6a5019b-0081-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 10:25:39 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51abf1a9332so3696420e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 01:25:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b00418a6d62ad0sm19535447wmq.34.2024.04.22.01.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 01:25:38 -0700 (PDT)
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
X-Inumbo-ID: e6a5019b-0081-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713774338; x=1714379138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z09yrUEqNxkibujxU/JhmYSCkYyUN4eIyi4tJ1hIXYk=;
        b=DAbFvzDgtQy41lRN+MuB0Y/zyGGYBl2yaTdR+UMXPr6kYKQoGL+ncxaSanuE6RFD5F
         qiJloDHLmwlreeskJ0Z4OueeKumqvfhu0hzpD/qIikolKHm10PBFBh+IYqQJwG71Jnd/
         F6VMNfJMKvxVeL2EhEdFQ3Ic1Sd1Aus2jhL5ldaYkyxm7qHXGniYXDzMAmOfr/DOcsCp
         VfzBcXPws/zfYNKrF92SCvYYZKyD+p8Gs8o1VyiiT8USjmeZFlaG9nz9YbZqaOPHFwza
         iuYmVmf/x15ckxFswWdZ59CkelUby5LKVagCxNZlO1G0MuYPRjQ4fGOnUsO+SRLfqU98
         4WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713774338; x=1714379138;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z09yrUEqNxkibujxU/JhmYSCkYyUN4eIyi4tJ1hIXYk=;
        b=XZ3aQLf8Akxxnor7hhbbk46sV4eNs7aMed1HIX9EtqxMH5iqI491y1DisqFcjAQJQK
         lB3Ri8bSvMQrPDIgcRmzikkOWjV6FU0jEE6HLW3Vs7/zN/szy9dPukUT3x5kJYC/6DUp
         HXEvkuFtTPXKaE9D+PS0LXG3OR5eYVbvJon923KAwpvkht2851iEHblLpCQ0wMObXB6P
         RdVaKp2v+LzQEqv7piZrRosj3hhDndOCOBalTVTT1vYFRxK6tqOEH2JGhDfjUSKGF88f
         Tn6cH2Mw3tqQtZX2XBPtfYUJ7BM1T87TIuYiZ1b+rle0q7iOyC/4MIayBaHy1UH1xwbE
         ewHw==
X-Forwarded-Encrypted: i=1; AJvYcCUAclDjnXa0jVbvbzjB0mHqqKWRju92Ri9jpe/497/krU+veptgT3dZZL7cGAC6XBowDzJR3jPXhZMQEi97nkHPOqyDI9bGmTJwr7smnx4=
X-Gm-Message-State: AOJu0YwAx56FYLvVGMR4LGdUhh2LThzYcolXqp4BoxYH8uyGSSXyVXUt
	eoCMYl6smewE13I6hBtAiUf45BLxrZDM5i3DJz58wJXfdt4eUm4VOKpLFfVJef4rWqVpFapyWQY
	=
X-Google-Smtp-Source: AGHT+IFO6H2Qktv5INGTu34at6TTwrWNAYlMoMhTnTcuBE6898qoDiNVafBTUZTex4RAXTV2/gj+3g==
X-Received: by 2002:a2e:740f:0:b0:2da:38f:b09c with SMTP id p15-20020a2e740f000000b002da038fb09cmr5263915ljc.18.1713774338577;
        Mon, 22 Apr 2024 01:25:38 -0700 (PDT)
Message-ID: <f00e0b8b-0e45-45b1-9151-6c16c5a70d76@suse.com>
Date: Mon, 22 Apr 2024 10:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] livepatch: refuse to resolve symbols that belong
 to init sections
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-3-roger.pau@citrix.com>
 <85f86849-dd85-4e7a-b7f4-3d7b41793717@suse.com> <ZiJMj00By3X8FskL@macbook>
 <002fac06-d867-46cc-89c4-9ebe2d68eaf2@suse.com> <ZiYXtJcefv-iMpAj@macbook>
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
In-Reply-To: <ZiYXtJcefv-iMpAj@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.04.2024 09:54, Roger Pau Monné wrote:
> On Fri, Apr 19, 2024 at 04:34:41PM +0200, Jan Beulich wrote:
>> On 19.04.2024 12:50, Roger Pau Monné wrote:
>>> On Fri, Apr 19, 2024 at 12:15:19PM +0200, Jan Beulich wrote:
>>>> On 19.04.2024 12:02, Roger Pau Monne wrote:
>>>>> Livepatch payloads containing symbols that belong to init sections can only
>>>>> lead to page faults later on, as by the time the livepatch is loaded init
>>>>> sections have already been freed.
>>>>>
>>>>> Refuse to resolve such symbols and return an error instead.
>>>>>
>>>>> Note such resolutions are only relevant for symbols that point to undefined
>>>>> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
>>>>> and hence must either be a Xen or a different livepatch payload symbol.
>>>>>
>>>>> Do not allow to resolve symbols that point to __init_begin, as that address is
>>>>> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
>>>>> resolutions against it.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>> Changes since v1:
>>>>>  - Fix off-by-one in range checking.
>>>>
>>>> Which means you addressed Andrew's comment while at the same time extending
>>>> the scope of ...
>>>>
>>>>> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>>>>>                      break;
>>>>>                  }
>>>>>              }
>>>>> +
>>>>> +            /*
>>>>> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
>>>>> +             * livepatch payloads don't have init sections or equivalent.
>>>>> +             */
>>>>> +            else if ( st_value >= (uintptr_t)&__init_begin &&
>>>>> +                      st_value < (uintptr_t)&__init_end )
>>>>> +            {
>>>>> +                printk(XENLOG_ERR LIVEPATCH
>>>>> +                       "%s: symbol %s is in init section, not resolving\n",
>>>>> +                       elf->name, elf->sym[i].name);
>>>>
>>>> ... what I raised concern about (and I had not seen any verbal reply to that,
>>>> I don't think).
>>>
>>> I've extended the commit message to explicitly mention the handling of
>>> bounds for __init_{begin,end} checks.  Let me know if you are not fine
>>> with it (or maybe you expected something else?).
>>
>> Well, you mention the two symbols you care about, but you don't mention
>> at all that these two may alias other symbols which might be legal to
>> reference from a livepatch.
> 
> I'm having a hard time understanding why a livepatch would want to
> reference those, or any symbol in the .init sections for that matter.
> __init_{begin,end} are exclusively used to unmap the init region after
> boot.  What's the point in livepatch referencing data that's no
> longer there?  The only application I would think of is to calculate
> some kind of offsets, but that would better be done using other
> symbols instead.
> 
> Please bear with me, it would be easier for me to understand if you
> could provide a concrete example.

The issue is that you do comparison by address, not by name. Let's assume
that .rodata ends exactly where .init.* starts. Then &__init_begin ==
&_erodata == &__2M_rodata_end. Access to the latter two symbols wants to
be permitted; only __init_begin and whatever ends up being the very first
symbol in .init.* ought to not be referenced.

Worse (but contrived) would be cases of "constructed" symbols derived from
ones ahead of __init_begin, with an offset large enough to actually point
into .init.*. Such are _still_ valid to be used in calculations, as long
as no deref occurs for anything at or past __init_begin.

Jan


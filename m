Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D20E78AB0D2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 16:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709135.1108405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxpKC-0008NE-6p; Fri, 19 Apr 2024 14:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709135.1108405; Fri, 19 Apr 2024 14:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxpKC-0008K2-4G; Fri, 19 Apr 2024 14:34:48 +0000
Received: by outflank-mailman (input) for mailman id 709135;
 Fri, 19 Apr 2024 14:34:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxpKA-0008IN-CB
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 14:34:46 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f648055a-fe59-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 16:34:43 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3465921600dso1828337f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 07:34:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a12-20020adfed0c000000b0034635bd6ba5sm4563978wro.92.2024.04.19.07.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 07:34:42 -0700 (PDT)
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
X-Inumbo-ID: f648055a-fe59-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713537283; x=1714142083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQZaEUHIt2S7m4vUwNGw16PJ5VE7Grf34nCAwsiQ45A=;
        b=E2pmcYautOUvh7un31pIJtOVn087g/V7AJf6zHYU5ZIL8u+N90CS8MvKsKifthEHH1
         aL/yOInXTbJguciWMnBWAkW4R9WbYUUrukvEVEL5KMcjO6QFBknzGJVxSgFqyVIgCBrL
         DPc04WAoyh8JvLlE65u+CTK09DLEPxpTGyrkB2aq5FRoapnHBJAL9yyxpodHvX17yOhb
         HEmTmMHvdGe6B3CIO76ufZwxNpIPSK9hhaaPF224M8IJ68E1FvxnsRiKwjR0RfJi/ZSs
         BAKsxTiXu958/4ZeTsGMUIqx/yp6VcBpDVZ/zR+vNxWNeL1ec7R0x/mzUd2FNWIl//En
         bouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713537283; x=1714142083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQZaEUHIt2S7m4vUwNGw16PJ5VE7Grf34nCAwsiQ45A=;
        b=eh5NyMzPSYXhmabE18XPDejLfL+O6CRxcCOpZGibFaYytpfFQvGZGYDVC41ayLmhLF
         J8pAXeUXxeeQirgPtu/VkT16q6d639pGuy4CxklGoWMGCqhtaeaHTZT/a017zdTtUDK5
         A/BEsLNptm4fqrEvpNIyqACyZzTZiRSzITZBOjPupnj70T4flTbuj+gStz+B7PM2TIbH
         W6Si9b5+SgAyL/WmSwtPMF+r9ZTBDj+JnAArdTJlDfsPjpmSWVQNmkE9v6aCq6xh0hzo
         +8CHQx0UWbQ5Vi6Y9gBzIoHMS2kiyFxaJEMi8hzcTAk2WhpcbBg7vgywQNyGBVpnrW4Z
         68wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrX0tzJIm3ppGyv1Rcfu7FRoAgIXlO+bzbj6Rb4lheEadzTR70JhIv7w2Ad6K99ZuDDbN1Z1JxQF4MyGflZTwALL7IAIoNz5QWT+6jOM4=
X-Gm-Message-State: AOJu0YyjRmckz9qIg9bqXJ3kC7LY2H2R1H60fkXw/SAasdDW08zIsO/8
	UhqT43K5+9hleRSH1aYvoCcVrBASdOAIammrmj6tJHPPEWACTQlBlAGmfDKIVg==
X-Google-Smtp-Source: AGHT+IGvL0wjqIJiL0ubYahADZ8VzwZP2FC31nwhjCf2gkcgUv87ymflxowbbAR/4fMzV4PqZU8o2w==
X-Received: by 2002:a5d:5742:0:b0:343:f335:58b with SMTP id q2-20020a5d5742000000b00343f335058bmr1525531wrw.62.1713537282836;
        Fri, 19 Apr 2024 07:34:42 -0700 (PDT)
Message-ID: <002fac06-d867-46cc-89c4-9ebe2d68eaf2@suse.com>
Date: Fri, 19 Apr 2024 16:34:41 +0200
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
In-Reply-To: <ZiJMj00By3X8FskL@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.04.2024 12:50, Roger Pau Monné wrote:
> On Fri, Apr 19, 2024 at 12:15:19PM +0200, Jan Beulich wrote:
>> On 19.04.2024 12:02, Roger Pau Monne wrote:
>>> Livepatch payloads containing symbols that belong to init sections can only
>>> lead to page faults later on, as by the time the livepatch is loaded init
>>> sections have already been freed.
>>>
>>> Refuse to resolve such symbols and return an error instead.
>>>
>>> Note such resolutions are only relevant for symbols that point to undefined
>>> sections (SHN_UNDEF), as that implies the symbol is not in the current payload
>>> and hence must either be a Xen or a different livepatch payload symbol.
>>>
>>> Do not allow to resolve symbols that point to __init_begin, as that address is
>>> also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
>>> resolutions against it.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Changes since v1:
>>>  - Fix off-by-one in range checking.
>>
>> Which means you addressed Andrew's comment while at the same time extending
>> the scope of ...
>>
>>> @@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>>>                      break;
>>>                  }
>>>              }
>>> +
>>> +            /*
>>> +             * Ensure not an init symbol.  Only applicable to Xen symbols, as
>>> +             * livepatch payloads don't have init sections or equivalent.
>>> +             */
>>> +            else if ( st_value >= (uintptr_t)&__init_begin &&
>>> +                      st_value < (uintptr_t)&__init_end )
>>> +            {
>>> +                printk(XENLOG_ERR LIVEPATCH
>>> +                       "%s: symbol %s is in init section, not resolving\n",
>>> +                       elf->name, elf->sym[i].name);
>>
>> ... what I raised concern about (and I had not seen any verbal reply to that,
>> I don't think).
> 
> I've extended the commit message to explicitly mention the handling of
> bounds for __init_{begin,end} checks.  Let me know if you are not fine
> with it (or maybe you expected something else?).

Well, you mention the two symbols you care about, but you don't mention
at all that these two may alias other symbols which might be legal to
reference from a livepatch.

Jan


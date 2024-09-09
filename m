Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CEC971A2F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 14:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794446.1203386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sndyQ-0006bE-Q0; Mon, 09 Sep 2024 12:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794446.1203386; Mon, 09 Sep 2024 12:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sndyQ-0006YN-Mj; Mon, 09 Sep 2024 12:58:30 +0000
Received: by outflank-mailman (input) for mailman id 794446;
 Mon, 09 Sep 2024 12:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sndyO-0006YH-BK
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 12:58:28 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 347d488a-6eab-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 14:58:27 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c25f01879fso5353512a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 05:58:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8cef8sm3026909a12.89.2024.09.09.05.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 05:58:26 -0700 (PDT)
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
X-Inumbo-ID: 347d488a-6eab-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725886707; x=1726491507; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/AOh1eFkqxcw8P1i9EM+20RZi90zuVOlbL4StimO1Rk=;
        b=Pe+rs4mxh7HdeYxBfCPILgVfv/4TSzOb5Th8XUAlUbjx9POXb/ujpMvaE1RjncVwGq
         8N6Y9wwwfuSN8PRj0qOcgA01va+7peEiynRHsSzjHky6FV5OT41T5qQvTBSb6az5mB1Y
         92csusarCDq3ef3AGvYz6wmP5ZSrFnHfDh3KmtHET6C3dgtYil+/gwIbN8pyi4OVwJ14
         Nom9AJdaiUQgJw8CIr6A1TNlnMCFAE/qg57HxOr8MTVo8h1AyD6p1n/C767Sozy5mqu2
         h1y6CAM9StN/tvSNo0hPDrDpwo5EMiAqnGG7UYEOV7aW3vVJ8ZqBhjCXTI65tp/BgwyN
         zelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886707; x=1726491507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AOh1eFkqxcw8P1i9EM+20RZi90zuVOlbL4StimO1Rk=;
        b=qmU6B1jUgVRfc3IZIggpJhkPP9B6GBOS0Q+ntlMJA80YTVITf+QJItHCUgPlP8SzuW
         0NHqvqkZQClb37gHreSILLx2UgojMnnJzrdH3S/AA4EsD26lUebeiJbT94doc8W8dQae
         PODTg0OZGATZEFT8qVEdBy/ZxSmIjTKuadtslkNIbfSkb7ajrv2SlMEpaw2x1tuZ9Eg1
         qQJF6KfEj3P0cbSdWHVM3EP1zlRaXMkdokMSodtVX8mcMwb6O7GFRgs/Vn/JBRqPLI+i
         PnOVKiVBS/gJSA2ag2fh6ddXc9KZW/vENN/vNKtjl9QLlXRGS7GSQFCmd9eEF2UW1Rlj
         Pwfg==
X-Forwarded-Encrypted: i=1; AJvYcCV4gsGM9BQB8Lpo+HUQxcQwhe3KlTu0uKUBuScOIo0Nj53IxpwNjMkyXVZKXYIlcCzty/NYm1z0CFE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHyftkB4Sp/Fi9rOJk4RZPwqzwhuiOMcbrVKhKsW5yqQHh+KeI
	C83ssrtVkOIM3WHHN93ooEZTzqQjAdt0SqxFalheKhdcHMxD7rSPhBF9Bms9iA==
X-Google-Smtp-Source: AGHT+IF87lYuNcQqw7MkZDYrgrVsSG1deJWAILYWQaarv3qzzHPHyh8z/MT1osqOrlhw6kAdqKQorw==
X-Received: by 2002:a05:6402:40d2:b0:5c2:7727:6109 with SMTP id 4fb4d7f45d1cf-5c3dc7c6f21mr7912453a12.30.1725886706574;
        Mon, 09 Sep 2024 05:58:26 -0700 (PDT)
Message-ID: <7114754a-116e-479b-8771-62278b8db6f0@suse.com>
Date: Mon, 9 Sep 2024 14:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Reuse PRI_gfn macro instead of manual specify the
 format
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20240909100806.47280-1-frediano.ziglio@cloud.com>
 <20240909100806.47280-2-frediano.ziglio@cloud.com>
 <8730bb00-35a5-473b-9af0-92ce2a436330@suse.com>
 <CACHz=ZgCCo2t4EJXOT44D8jvmLxgvoQd3E3CwCUgDLNdWDCr0g@mail.gmail.com>
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
In-Reply-To: <CACHz=ZgCCo2t4EJXOT44D8jvmLxgvoQd3E3CwCUgDLNdWDCr0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2024 14:53, Frediano Ziglio wrote:
> On Mon, Sep 9, 2024 at 11:45 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 09.09.2024 12:08, Frediano Ziglio wrote:
>>> Macros are defined to avoid type mismatch in format strings
>>> but also to unify format amongst code.
>>
>> I'm certainly fine with this part.
>>
>>> In the meantime expands to 9 hexadecimal digits.
>>
>> What makes 9 special? What will the extra padding zeroes buy us?
>>
>>
> I think either we want kind of fixed size or dynamic. 9 == (48 - 12) / 4,
> although possibly you would prefer 13 == (64 - 12) / 4.

64 is too much for x86; it would want to be 52 there. The way it is right
now this is (imo deliberately) not arch-specific, though.

>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -1848,7 +1848,7 @@ gnttab_unpopulate_status_frames(struct domain *d,
>> struct grant_table *gt)
>>>              if ( rc )
>>>              {
>>>                  gprintk(XENLOG_ERR,
>>> -                        "Could not remove status frame %u (GFN %#lx)
>> from P2M\n",
>>> +                        "Could not remove status frame %u (GFN
>> %"PRI_gfn") from P2M\n",
>>
>> The lost # means the number won't identify itself as hex anymore. Rather
>> than ...
>>
>>> @@ -3981,7 +3981,7 @@ void grant_table_warn_active_grants(struct domain
>> *d)
>>>          if ( nr_active <= WARN_GRANT_MAX )
>>>              printk(XENLOG_G_DEBUG "d%d has active grant %x ("
>>>  #ifndef NDEBUG
>>> -                   "GFN %lx, "
>>> +                   "GFN %"PRI_gfn", "
>>>  #endif
>>>                     "MFN: %#"PRI_mfn")\n",
>>
>> (note this for below)
>>
>>> --- a/xen/include/xen/mm-frame.h
>>> +++ b/xen/include/xen/mm-frame.h
>>> @@ -5,7 +5,7 @@
>>>  #include <xen/typesafe.h>
>>>
>>>  TYPE_SAFE(unsigned long, mfn);
>>> -#define PRI_mfn          "05lx"
>>> +#define PRI_mfn          "09lx"
>>>  #define INVALID_MFN_RAW  (~0UL)
>>>  #define INVALID_MFN      _mfn(INVALID_MFN_RAW)
>>>  /*
>>> @@ -41,7 +41,7 @@ static inline bool mfn_eq(mfn_t x, mfn_t y)
>>>  }
>>>
>>>  TYPE_SAFE(unsigned long, gfn);
>>> -#define PRI_gfn          "05lx"
>>> +#define PRI_gfn          "09lx"
>>
>> ... moving to 09 (twice) here, how about we move to #? Requiring, of
>> course,
>> to drop already-questionable hashes like the one pointed out in the middle.
>>
> I suppose you are suggesting getting rid of the padding entirely and move
> to prefix, like "%#lx".

Yes, i.e.

#define PRI_mfn          "#lx"

Then again I don't really know why "05lx" was chosen originally.

Jan


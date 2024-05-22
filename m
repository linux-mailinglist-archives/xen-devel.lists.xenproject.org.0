Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7A8CC273
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727704.1132339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mMu-0007BJ-2a; Wed, 22 May 2024 13:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727704.1132339; Wed, 22 May 2024 13:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9mMt-00079l-VO; Wed, 22 May 2024 13:50:59 +0000
Received: by outflank-mailman (input) for mailman id 727704;
 Wed, 22 May 2024 13:50:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9mMs-00072Y-Ph
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:50:58 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 512b9aa3-1842-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:50:58 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51f174e316eso6024873e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:50:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57509d459desm8637328a12.61.2024.05.22.06.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:50:57 -0700 (PDT)
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
X-Inumbo-ID: 512b9aa3-1842-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716385857; x=1716990657; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKgX9Mpo9DjdhPN7OV82GrHh7vZqzpG+Te61T+wmyLM=;
        b=atw3XIiu55n6rtVfR4HCX1qD39Gdy7tw95CtSOmomcCYAf4v26VAFnFgElGdql3GPC
         j7irfIeSArKsy3bwPZnXNYOQb7x3W62nqyKHKrfduNmFe1Z21u5cRHVUUpuR7gd3/KAA
         2mewrAt5Z80+K7WcIPB/qLFyE67T8b60K1RQ8ggbxLWW4u+3aIpteK/DrhVxyrOvAl9A
         4HXML+Fov/Mw9S5PM522Tpmh0MwY8JTvB5IWnnQjdcZq/36yhRoGZzwDoDkWPFZh/M4z
         +U0wvw1elxMPx0soWHvRW15wilKNX3iuhnMnG1xivy/n51ont4zMZlHYeXw2WmjCY4kU
         jr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716385857; x=1716990657;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKgX9Mpo9DjdhPN7OV82GrHh7vZqzpG+Te61T+wmyLM=;
        b=kayVld6sQq/FSYF7n/6kXy9iVW1BaKV6YkLpdL91v2gSePeCLtdJJywzq1yCBk2cMJ
         KO8sHjRxsqj8E1/wX9bDfcVBiitqjlDAeJK2H80HPsXIt1bwJ9G1cWHpM4BL74cMwksU
         SGbQ9wg5/HqsoSdvoKjR8YF/CMPSrvA9o2RQCNOfdnFjivYM7g6SGNzqUXRuXMTOtpqg
         qRecGZZrL9u9G3yIR2JYpsDuIVTny8mGtJ4f1UXGhtxS3CunkXFz2ZUs0xAl1TKW4tAE
         scb1v9NI3hy21WpKT13MM3qmQbmewTCrnK/FOkd3ofC9jOC6si7d7p4VUKykDNilgzKi
         o89A==
X-Forwarded-Encrypted: i=1; AJvYcCVZP3c2nQenzIwspDlgVNVM+mVvMzxbNUJkE0ZKBjb+GqJF+FHnXGELouGG2DUvqg6LfyeLM72c4VwPIBgzpNlaD85oQXlaDPxTDm33WHs=
X-Gm-Message-State: AOJu0YwFYf4CTkaaLzEfSvjbkCcfbKhogFyqj4qPOtZSsALkb3tFfvvA
	VtVTHClL11rksAJMa96DrbmjziToWyOMmMkuGVa2V+sHJHCL0+guE2+QamOviA==
X-Google-Smtp-Source: AGHT+IGKGDp1At1YEWITjU3d257z4ELkQl5xU5bWEz5rEEUXUmZiVgJPGhOScljpSzMgsWDYUVDEtQ==
X-Received: by 2002:ac2:4c8a:0:b0:523:8c7a:5f7 with SMTP id 2adb3069b0e04-526bebb452amr1221525e87.6.1716385857636;
        Wed, 22 May 2024 06:50:57 -0700 (PDT)
Message-ID: <cdff3b27-a10c-4579-9128-a9a4c8bd96a1@suse.com>
Date: Wed, 22 May 2024 15:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/shadow: Rework trace_shadow_gen() into
 sh_trace_va()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240522131703.30839-1-andrew.cooper3@citrix.com>
 <20240522131703.30839-2-andrew.cooper3@citrix.com>
 <1140d40f-2f5c-402d-a0fc-1c6598a7a424@suse.com>
 <b3b4f2d0-fb42-44be-bb24-a22c8c237f13@citrix.com>
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
In-Reply-To: <b3b4f2d0-fb42-44be-bb24-a22c8c237f13@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2024 15:47, Andrew Cooper wrote:
> On 22/05/2024 2:40 pm, Jan Beulich wrote:
>> On 22.05.2024 15:17, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>> @@ -1974,13 +1974,17 @@ typedef u32 guest_va_t;
>>>  typedef u32 guest_pa_t;
>>>  #endif
>>>  
>>> -static inline void trace_shadow_gen(u32 event, guest_va_t va)
>>> +/* Shadow trace event with GUEST_PAGING_LEVELS folded into the event field. */
>>> +static void sh_trace(uint32_t event, unsigned int extra, const void *extra_data)
>>> +{
>>> +    trace(event | ((GUEST_PAGING_LEVELS - 2) << 8), extra, extra_data);
>>> +}
>>> +
>>> +/* Shadow trace event with the guest's linear address. */
>>> +static void sh_trace_va(uint32_t event, guest_va_t va)
>>>  {
>>>      if ( tb_init_done )
>>> -    {
>>> -        event |= (GUEST_PAGING_LEVELS-2)<<8;
>>> -        trace(event, sizeof(va), &va);
>>> -    }
>>> +        sh_trace(event, sizeof(va), &va);
>>>  }
>> If any tb_init_done check, then perhaps rather in sh_trace()? With that
>> (and provided you agree)
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Sadly not.  That leads to double reads of tb_init_done when tracing is
> compiled in.

Not here, but I can see how that could happen in principle, when ...

> When GCC can't fully inline the structure initialisation, it can't prove
> that a function call modified tb_init_done.  This is why I arranged all
> the trace cleanup in this way.

... inlining indeed doesn't happen. Patch 2 fits the one here in this regard
(no function calls); I have yet to look at patch 3, though.

But anyway, the present placement, while likely a little redundant, is not
the end of the world, so my R-b holds either way.

Jan


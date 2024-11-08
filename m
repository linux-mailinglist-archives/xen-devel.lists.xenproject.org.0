Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B99C197A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 10:46:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832383.1247700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9LYm-0004OZ-JM; Fri, 08 Nov 2024 09:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832383.1247700; Fri, 08 Nov 2024 09:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9LYm-0004N4-GE; Fri, 08 Nov 2024 09:45:44 +0000
Received: by outflank-mailman (input) for mailman id 832383;
 Fri, 08 Nov 2024 09:45:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t9LYl-0004My-F0
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 09:45:43 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 370ee653-9db6-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 10:45:40 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53c779ef19cso2187028e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 01:45:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177de0872sm26513965ad.110.2024.11.08.01.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 01:45:39 -0800 (PST)
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
X-Inumbo-ID: 370ee653-9db6-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1sZjEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM3MGVlNjUzLTlkYjYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDU5MTQwLjU4NTM1Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731059140; x=1731663940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6UOsmGoWA1bG59+bj2O0Dulqy5+lu4/Q0P7Mnt9xzGA=;
        b=EIvocoK8gdqakhwrOT253tbOvAvDhP6+JMar35wZ+NB93jnbZ+8za8ddF3NvVGWcqj
         L7IRpRJPWnNF1qxF9c8reoOya7O+xHt87e7yuaZqMktDBJ/DI7uFieSEar6CXzuARE5r
         pz4dfdTDo3aiAHUH4tPXn5wel5J2p1uJQYV9+hLCETPpl0Z4JUXuRj7RL1kHuvoSpCmz
         0gBU2O+jWKa8KaYvP+J4BZtPJ7l3gPu18NVshzIBu6JV+2dZ5Y/NUzNK8NTmxZLqRTHm
         ErXGpAUy9S9IRH8NbVSiRNwj8vLRTHbKQu62OydXQGq5DjDBxj/i76aOqpdFcE17ZCrV
         Eayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731059140; x=1731663940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UOsmGoWA1bG59+bj2O0Dulqy5+lu4/Q0P7Mnt9xzGA=;
        b=Hk+ZCJeyCzb8fuMeKfOS5dQ8COvKiqi1ETdh4l84Q5fMTpz7SyLzvSZ75YB3+rbxUk
         BrHkLRdLa1RGmEyfZ5/+0mI+uprgQ2+syTOvGtj30FregIqm+anIAySF1IpUc1fN9xu0
         Qu+rRyAddOMUNXFHkVy+5MEP4umZ4blnV/GxqoUKZypy/lvXViDcZs7N4l3ayzSLAuSg
         Wy0YFO/7Nej4b/vz6Ckmu+xAdl7uk34kne7S5KCrIA+8cTGrfSaXGNbleqdlVl/Nv7IH
         +bZbxzVwlpKYahCLwFimwsiHZc4iEAzQP4qggaFQRhsgiqU1aHi00XycMkzlKzO/k19O
         S2DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoFzkRCb+WqahMzvG9VusNenWXQZ6kXHn+GGxfIdOSB80gqt+Z5ejsGvLvMqT10Om5RLZBaQ35eZQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7IZQOR5bduXoO19HY3sA6MWLECIAbS2zStKa9J86fUZN9/SBM
	fXV69FZEXbLWm1L+O/VD7DXKdad9S0uFdbvIHlBqVVheuSQjSfRt9F5KQfTj1Q==
X-Google-Smtp-Source: AGHT+IHYq0XbwkFzkzT4m/SsdhhoZHnMsvDZhOpnsGkjUReB1GnND9VSoFk6b7ZV5GnmtRCZag5ySw==
X-Received: by 2002:a05:6512:3e01:b0:539:9720:99d4 with SMTP id 2adb3069b0e04-53d86296bb0mr902250e87.28.1731059139963;
        Fri, 08 Nov 2024 01:45:39 -0800 (PST)
Message-ID: <aa739c74-bbad-4cf4-b0a3-f86a2fa88a21@suse.com>
Date: Fri, 8 Nov 2024 10:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/setup: remove bootstrap_map_addr() usage of
 destroy_xen_mappings()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-4-roger.pau@citrix.com>
 <ac948cdc-8ae6-41f1-b7dd-35820e9c2193@citrix.com>
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
In-Reply-To: <ac948cdc-8ae6-41f1-b7dd-35820e9c2193@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.11.2024 10:41, Andrew Cooper wrote:
> On 06/11/2024 12:29 pm, Roger Pau Monne wrote:
>> bootstrap_map_addr() top level comment states that it doesn't indented to
>> remove the L2 tables, as the same L2 will be re-used to create further 2MB
>> mappings.  It's incorrect for the function to use destroy_xen_mappings() which
>> will free empty L2 tables.
>>
>> Fix this by using map_pages_to_xen(), which does zap the page-table entries,
>> but does not free page-table structures even when empty.
>>
>> Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')
>> Signed-off-by: Roger Pau Monné <roger.pau@ctrix.com>
>> ---
>> The fixes tag reflects the fact that if 4376c05c3113 freed the L2 correctly
>> when empty, it would have become obvious that bootstrap_map_addr() shouldn't be
>> using it if it wants to keep the L2.  4376c05c3113 should have switched
>> bootstrap_map_addr() to not use destroy_xen_mappings().
>> ---
>>  xen/arch/x86/setup.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 177f4024abca..815b8651ba79 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -456,7 +456,9 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
>>  
>>      if ( !end )
>>      {
>> -        destroy_xen_mappings(BOOTSTRAP_MAP_BASE, BOOTSTRAP_MAP_LIMIT);
>> +        map_pages_to_xen(BOOTSTRAP_MAP_BASE, INVALID_MFN,
>> +                         PFN_DOWN(map_cur - BOOTSTRAP_MAP_BASE),
>> +                         _PAGE_NONE);
>>          map_cur = BOOTSTRAP_MAP_BASE;
> 
> One option to consider is this.
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index eac8488c4ca5..b317a4d12f55 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -461,8 +461,13 @@ static void *__init bootstrap_map_addr(paddr_t
> start, paddr_t end)
>  
>      if ( !end )
>      {
> -        destroy_xen_mappings(BOOTSTRAP_MAP_BASE, BOOTSTRAP_MAP_LIMIT);
> -        map_cur = BOOTSTRAP_MAP_BASE;
> +        if ( map_cur > BOOTSTRAP_MAP_BASE )
> +        {
> +            memset(&l2_bootmap[l2_table_offset(BOOTSTRAP_MAP_BASE)],
> +                   0, (map_cur - BOOTSTRAP_MAP_BASE) >>
> L2_PAGETABLE_SHIFT);
> +            flush_tlb_local();
> +            map_cur = BOOTSTRAP_MAP_BASE;
> +        }
>          return NULL;
>      }
>  
> We know for certain there's nothing to free, and and this far less logic
> than either destroy_xen_mappings() or map_pages_to_xen().

Yet then such open-coding can badly bite us at other times.

Jan


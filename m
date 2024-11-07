Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0391B9C0197
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 10:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831610.1246944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8zDm-0004iV-Am; Thu, 07 Nov 2024 09:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831610.1246944; Thu, 07 Nov 2024 09:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8zDm-0004fu-7V; Thu, 07 Nov 2024 09:54:34 +0000
Received: by outflank-mailman (input) for mailman id 831610;
 Thu, 07 Nov 2024 09:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8zDk-0004fl-8g
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 09:54:32 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ee1998-9cee-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 10:54:27 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fb57f97d75so7697431fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 01:54:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa737c86sm56159315e9.38.2024.11.07.01.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 01:54:26 -0800 (PST)
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
X-Inumbo-ID: 46ee1998-9cee-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmYiLCJoZWxvIjoibWFpbC1sajEteDIyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ2ZWUxOTk4LTljZWUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTczMjY3Ljg3NjY0Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730973267; x=1731578067; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UB4xixjLoDQZljxh9xQWG+MH6w8lvKu1WiuWNlaTOXQ=;
        b=VJhXlwV3olSM2sdYmJWz3IkScIf87xs2LM44nOd8CtqhaDTToflnd1snEAoHZOaRXb
         xwsi+iBCbY3G2Fabnlc69LhQGSi31ikfX4P5qZUluBLm+13FnK1d84TXmsZj/GspUqBM
         zgPvF1bkFz//F9isH5blyTn1N/7LHler93CGL9zCCo52/FZ2uJ/dnlT7bQIZCCffbkJ2
         X/UdAU1DVZ3u9aFWqW74t8VB5xp1hzp8W5aoIx8Xgbs8k9NGkZ8eltY7T2TGVp4Hjjy2
         HDt5Lfd82CSOMaNZkosH0dOT68S5Of1SoY98CMSbCIz/5Vfj/VpwPVg0bVA639BQ4fOi
         n77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730973267; x=1731578067;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB4xixjLoDQZljxh9xQWG+MH6w8lvKu1WiuWNlaTOXQ=;
        b=kLZqMDJ/h02kJWIBsdTYA939AKDhKVAZNS2l7znpFri7CBFVe343QjXgAD+mnvDLrr
         /qgim7WY4D28fQNKDfCgklBE45V8Md9EhHN1FlH93EqKhaJjVAeKSabqz0AVApXrPl2V
         uKhQ7NIc4DmG2JFJ8knx06MLlyl/dzhBfQjASiT+v11iPtRcEuueexGSw7o6XcSHoV8i
         eb6fePpzGNq3PHWzyDDmXnDPeAQ73I7jCQF/Dfp1Zf3ZeL8M2hVKO2Jro098ylbHJZm/
         QfX1e4V2AdkNn073x2QHlkOQKCVObV9m4VXpYYlSOikomhf1+UuYM8hB/+P6rx5YJzSQ
         Kgsg==
X-Forwarded-Encrypted: i=1; AJvYcCX4mTJJNoiVAhiUXhjfsCS9+sfRq/dksNPla440M593GzVYIrPNi2yfTER/2cKkFBXxZJuJu2cDwRo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymnMDCmS38MFxnR8UoLDtZAJkeCQ5V/54ZlBr+TCeFIGPfuwUy
	PoTTfqceHTjyWUZcK7nBOHARAJC43gvqZX34pIHhx4HMDLT8R0ICqJODcqs45sIEoZOEitfsTZs
	=
X-Google-Smtp-Source: AGHT+IFyQFqYAs3CO4e2zbd5qOXWQ/mkg+kmepBnfCufrE+SJ8LGzLxsoFqkAivwejQHvhe24JwG6Q==
X-Received: by 2002:a2e:5109:0:b0:2fb:4428:e0fa with SMTP id 38308e7fff4ca-2fcbe04f435mr162406031fa.36.1730973267256;
        Thu, 07 Nov 2024 01:54:27 -0800 (PST)
Message-ID: <6f296504-1c71-4817-a3e8-f7e365ceef38@suse.com>
Date: Thu, 7 Nov 2024 10:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86/boot: eliminate module_map
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-3-dpsmith@apertussolutions.com>
 <2faf07d6-35a2-46c8-92db-8cf26a304800@citrix.com>
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
In-Reply-To: <2faf07d6-35a2-46c8-92db-8cf26a304800@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 15:34, Andrew Cooper wrote:
> On 02/11/2024 5:25 pm, Daniel P. Smith wrote:
>> With all boot modules now labeled by type, it is no longer necessary to
>> track whether a boot module was identified via the module_map bitmap.
>>
>> Introduce a set of helpers to search the list of boot modules based on type and
>> the reference type, pointer or array index, desired. Then drop all uses of
>> setting a bit in module_map and replace its use for looping with the helpers.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v7:
>> - collapse the three module_map patches into one,
>>   - x86/boot: remove module_map usage from microcode loading
>>   - x86/boot: remove module_map usage from xsm policy loading
>>   - x86/boot: remove module_map usage by ramdisk loading
> 
> Definitely nicer for having been collapsed together.
> 
>> ---
>>  xen/arch/x86/cpu/microcode/core.c   | 12 ++++-----
>>  xen/arch/x86/include/asm/bootinfo.h | 42 ++++++++++++++++++++++++++++-
>>  xen/arch/x86/setup.c                | 28 +++++++++++--------
>>  xen/xsm/xsm_policy.c                | 19 +++++--------
>>  4 files changed, 70 insertions(+), 31 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>> index f46464241557..b09cf83249f6 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -790,15 +790,13 @@ static int __init early_microcode_load(struct boot_info *bi)
>>  
>>      if ( opt_scan ) /* Scan for a CPIO archive */
>>      {
>> -        for ( idx = 1; idx < bi->nr_modules; ++idx )
>> +        for_each_boot_module_by_type(idx, bi, BOOTMOD_UNKNOWN)
> 
> Minor, but we treat for_each_* as if they were for loops, so this either
> wants to be
> 
> for_each_boot_module_by_type ( idx, bi, BOOTMOD_UNKNOWN )
> 
> or
> 
> for_each_boot_module_by_type (idx, bi, BOOTMOD_UNKNOWN)
> 
> spacing wise.  There's no agreement between maintainers on the extra
> spaces inside brackets or not.

Just to clarify - no, the latter form you suggest is not okay to use.
Daniel's form is, as is the first one you suggest. The choice is between
"like a for() loop" (your 1st form) and "just another macro invocation"
(Daniel's form).

Jan


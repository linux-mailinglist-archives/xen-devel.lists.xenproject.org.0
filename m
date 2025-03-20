Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3852A6A422
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921780.1325529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDUu-0001d8-Bh; Thu, 20 Mar 2025 10:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921780.1325529; Thu, 20 Mar 2025 10:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDUu-0001aM-7r; Thu, 20 Mar 2025 10:51:36 +0000
Received: by outflank-mailman (input) for mailman id 921780;
 Thu, 20 Mar 2025 10:51:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvDUt-0001aG-1Z
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:51:35 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49ea56d7-0579-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 11:51:33 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so4993315e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 03:51:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f58ab6sm44660535e9.23.2025.03.20.03.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:51:32 -0700 (PDT)
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
X-Inumbo-ID: 49ea56d7-0579-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742467893; x=1743072693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vTgN8E6xLIWOQIfWh1DME/7h3i1jy3cLDqLmBTXiONA=;
        b=Pa2ZWmjsy5ZrukT+WtCi6wuHJmLh5OxluXWcEdZPiQDxHhS5wzHHatWyUfQDsrK0i0
         Zb2GZ+4tuUSxm6In4Ha1GHClc8/NPmZv3NKLSlIdsDkvdYqa9DtbvcsoGx0n5l5aRygU
         kg64ghXPXxN405GmizBzcCyuqhsL/h/hhDbiFYquT+zXzhbb8mYNBY/l8zApGHphWm25
         sl6pABuOzbBEqmD1W1RAJ+BM1wGvg9DZazcCLEkI9zLFwc15ZZwDxnSKEmEWmVnbY2PZ
         Qw2coFymxQlRzMkIu2gtjhmSu2p8Q5C0eCBORWLUYwN9h8WMh7FfxasEg0Cl8HU+3iXW
         /O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742467893; x=1743072693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTgN8E6xLIWOQIfWh1DME/7h3i1jy3cLDqLmBTXiONA=;
        b=Bt8T73vQAjOAQ1nvbHvc9QYIO0yaw358hsoDrcWNZOgJ+E7hv21BOz80oyN/lEPlBq
         I/JeiVo/MShUi1APQ8is4I2MJSHFWcFwA3/0222R22NcbPkaHwTo+9Fva3hwfTERtLkZ
         7w+C0MyKae479r0Cazq+fZD6HA324r8ftIJPd0uTqt4cDbQ7RZE2rfX3yxEnBafjNa3K
         Bmvsqvwg4Z2nusFSEBGY49OXL3Fx9fU+ZG5EzUVG8zZ26BmRO5l9gjYWn1ZkFUNAL9va
         LvwYfNxyssvyLPmN39DEsgquXX3wHAKnd1B6ZBivob8xzNHrw4/uWTjc53BY9CCo1GK4
         r+Sw==
X-Forwarded-Encrypted: i=1; AJvYcCX79Gdmk7MZvBYzjV0h89RAPUg01unVUBseqpc2ps3uqFzbGS4c60czA1Uh+HTdJAlo6H8xvFHl0Oo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqdDFoiIMLBec0m9JNce41e7eKJrk7Ql+ofp5djqwJK/3JsFLx
	nFy6L31cF78O27xm9VsCAApKtjLcFS59IUyD8ocLoV9trLXLzDDcW9vLBRwvsE6UnwCVHJtDK1w
	=
X-Gm-Gg: ASbGnctG8zBqboIqNBUtf422K3la277WkwM4wcJm4TCmbKsgIT4N+POSLYr0QZ/6j25
	WyUT1eiLhzbsyDQepNotGpfjF1Bsy4MP8NP2iQiftGG7F1bYgGa+Dx3Tq3AZj1Lq/5S3bj6Pi/2
	iyW8H3tnDS7JstXHQ2JjPCfem0NOQwxOUH47OCN2EZYAiLJzBZOxCw+nuiZdAQEjbMFMWywaIkV
	WbtnIC6QSWTZr2HOr8A5K3Lywg7Uit7NX1CmNXApVZvv+N6mOZIBwPJjIDXNKOAYhT+EWJuFfjw
	ZMOxZXgl1tO8bho8Cq8HnjRd4iJARaZC0qsSEhmSQuLjHmT97l7k02Fv6KhswHED+FQEm/VnCdk
	JtK7pRoPal+Ez8GJjuCBXrg/7LeL7YpUzYWfF9WnC
X-Google-Smtp-Source: AGHT+IFYiN6urXPCGJjuGlGBapaemV0niAhWSx4Wlvz19UE4pWRZIzXpPbXZ6dNi7CTTfbrSi1/uow==
X-Received: by 2002:a05:600c:1e07:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-43d4950e6b4mr23921115e9.6.1742467893153;
        Thu, 20 Mar 2025 03:51:33 -0700 (PDT)
Message-ID: <9f583e6d-2487-4c07-afa4-a8485915468b@suse.com>
Date: Thu, 20 Mar 2025 11:51:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/PVH: account for module command line length
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <577ddc98-fdbb-48af-9c7e-1a411383516b@suse.com>
 <9bdc10ba-8572-46b3-a39e-e011e97d1e85@suse.com>
 <545dcd10-2cff-4f31-be7d-004ad36eeb34@citrix.com>
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
In-Reply-To: <545dcd10-2cff-4f31-be7d-004ad36eeb34@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 11:39, Andrew Cooper wrote:
> On 20/03/2025 9:28 am, Jan Beulich wrote:
>> As per observation in practice, initrd->cmdline_pa is not normally zero.
>> Hence so far we always appended at least one byte. That alone may
>> already render insufficient the "allocation" made by find_memory().
>> Things would be worse when there's actually a (perhaps long) command
>> line.
>>
>> Skip setup when the command line is empty. Amend the "allocation" size
>> by padding and actual size of module command line. Along these lines
>> also skip initrd setup when the initrd is zero size.
>>
>> Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Use elf_round_up(). Introduce initrd_cmdline local. Re-base.
>>
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -652,9 +652,10 @@ static int __init pvh_load_kernel(
>>      unsigned long image_len = image->size;
>>      unsigned long initrd_len = initrd ? initrd->size : 0;
>>      const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
>> +    const char *initrd_cmdline = NULL;
>>      struct elf_binary elf;
>>      struct elf_dom_parms parms;
>> -    size_t extra_space;
>> +    size_t extra_space = 0;
>>      paddr_t last_addr;
>>      struct hvm_start_info start_info = { 0 };
>>      struct hvm_modlist_entry mod = { 0 };
>> @@ -712,10 +713,23 @@ static int __init pvh_load_kernel(
>>       * split into smaller allocations, done as a single region in order to
>>       * simplify it.
>>       */
>> -    extra_space = sizeof(start_info);
>> +    if ( initrd_len )
>> +    {
>> +        extra_space = elf_round_up(&elf, initrd_len);
>> +
>> +        if ( initrd->cmdline_pa )
>> +        {
>> +            initrd_cmdline = __va(initrd->cmdline_pa);
>> +            if ( !*initrd_cmdline )
>> +                initrd_cmdline = NULL;
>> +        }
>> +        if ( initrd_cmdline )
>> +            extra_space += strlen(initrd_cmdline) + 1;
>> +
>> +        extra_space = ROUNDUP(extra_space, PAGE_SIZE) + sizeof(mod);
>> +    }
>>  
>> -    if ( initrd )
>> -        extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
>> +    extra_space += sizeof(start_info);
>>  
> 
> This is rather ugly.  I could rearrange the original patch, but the main
> issue is "extra_space = elf_round_up(&elf, initrd_len);" and that trick
> works exactly once in the function, seeing as it clobbers the running total.

My expectation was that quite likely we won't need that "trick" a 2nd time
here.

> IMO it would be better to have a local initrd_space variable, with an
> "extra_space += ROUNDUP(initrd_space ...)", at which point the logic
> (and therefore the diff) becomes rather more simple.

If you really think we need this, I can do so, but I would prefer to avoid
it.

> There is a change in behaviour.  You mention empty initrds in the commit
> message, but it is possible to have an empty initrd with a non-empty
> cmdline.  Previously we would have passed that on, whereas now we dont.

Hmm, yes, I can take care of that (at the expense of yet more churn).

Jan

> I suspect we probably don't care.  cmdlines on secondary modules are
> rare to begin with, but I just want to make sure we've considered the
> possibility.
> 
> ~Andrew



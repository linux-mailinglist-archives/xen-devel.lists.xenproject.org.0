Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D536E9B29B8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 09:05:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826273.1240467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5KjP-00047J-SK; Mon, 28 Oct 2024 08:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826273.1240467; Mon, 28 Oct 2024 08:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5KjP-00045Q-PX; Mon, 28 Oct 2024 08:04:07 +0000
Received: by outflank-mailman (input) for mailman id 826273;
 Mon, 28 Oct 2024 08:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5KjO-000454-E5
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 08:04:06 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3215ecd8-9503-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 09:04:03 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9aa8895facso648090166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 01:04:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f02952asm354253566b.73.2024.10.28.01.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 01:04:01 -0700 (PDT)
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
X-Inumbo-ID: 3215ecd8-9503-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730102642; x=1730707442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rqd3GbJqohcxdEZNl0IJuqhBX8PPwVkgpzaGyglYHzk=;
        b=gJOQNriOeYxgpa1jmXp9Ygd2GtO4SZG7rLoGVkWnqRWzSf9xZ6NCav+iR1tP8keNYy
         g1MnV2Le3dh6pzsQbJzubQX7V4Imt2NPWa2E/oqFRRUiRFrPto50u02zN+5FXmmudE5V
         eCMi6Yt/S6HvixbTPbJ8oWcl6a5Dd+L5d2gjY9M4NguOaa6vmQuGjtyCjZQk14PCw8Aj
         1A7e/q4kXXvrJHGllA9KP1Cr/+VnmptH6cbDrTUOiU0RNfRJsFiWiNT/XlmdRovnSP33
         SUL05n77Kc7G/9034Fwveio/SedqYUk2fS19BwfFfHtmxigusLhERTWWYpO/Hhfs/ALu
         37Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730102642; x=1730707442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rqd3GbJqohcxdEZNl0IJuqhBX8PPwVkgpzaGyglYHzk=;
        b=jPTBOSu1OSk6L7RXigtjbUPDoee8MimFugamOA3DCwAGH5HGgQt4D+IoyB2OVA8k8a
         rS63kHEljvf71b/9ZYePhyL+9fq7gMo3f+xkhQslrF69f1jME4h5XuVr9uSmnr4wBXqt
         MJNOc9ZWiJ04O8t4lLK1T+9idyJaaxBCdYiIqTYv8FfTm8CbDeWPQ0BBspq75fzaE8nF
         t3jxRFVZQ9GclOf2zJGCJUWe8TOp30vpvzCM3rgQBB9hhTplPZvUpJCMUUd15yJr+jGP
         VVXvG1GotGj/qLKDFjfhQGSFTjJwdr8zlFqXyiahmi8CbSD7Ev1+LetnZbNT07zpc/5X
         9u5w==
X-Forwarded-Encrypted: i=1; AJvYcCUwN6kyAEh/8E2MGje2FnMl0kakf98xC6/GAOykPWx2ganndWJlLQs1LDgxYEDUCCEYGZeK+cfaipw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/QuDRGx5Yo9PCiaG9Heb6YC2R+vTSZU/4ZC4BPXiOFWq6NgYC
	7ZOkY8Wnxm7/7jlt1sVo6LVs2+7s+QtUZ12SO+5xEPJ3Cha3U40f721beJM2hw==
X-Google-Smtp-Source: AGHT+IEk4iTokJOXG7Dp+jW8e8Oqt1/zuiGZ3/SAqLrLK1M9rsYvCwskG1dIry3S8nXo+S51Psx5iA==
X-Received: by 2002:a17:907:7215:b0:a9a:8028:45d8 with SMTP id a640c23a62f3a-a9de5d6f953mr736272166b.7.1730102642472;
        Mon, 28 Oct 2024 01:04:02 -0700 (PDT)
Message-ID: <78b2b0e0-880a-410c-91fc-777299417383@suse.com>
Date: Mon, 28 Oct 2024 09:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] xen/riscv: add stub for
 share_xen_page_with_guest()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <3dfd4bdf6584e73ecdbff5a66fdbaec68e31cc3c.1729068334.git.oleksii.kurochko@gmail.com>
 <b8de7161-5d71-4ed7-a3cf-611f4a860926@suse.com>
 <df635c41cf530d08898d021adf92eb141624d07d.camel@gmail.com>
 <3f87a19f-c249-438a-ac1d-be9b8fd80c8e@suse.com>
 <6f1d21c3eb10edf9206f45b6c0c6afaa7bb58ef3.camel@gmail.com>
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
In-Reply-To: <6f1d21c3eb10edf9206f45b6c0c6afaa7bb58ef3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.10.2024 17:57, oleksii.kurochko@gmail.com wrote:
> On Fri, 2024-10-18 at 15:27 +0200, Jan Beulich wrote:
>> On 18.10.2024 15:10, oleksii.kurochko@gmail.com wrote:
>>> On Thu, 2024-10-17 at 16:51 +0200, Jan Beulich wrote:
>>>> On 16.10.2024 11:15, Oleksii Kurochko wrote:
>>>>> To avoid the following linkage fail the stub for
>>>>> share_xen_page_with_guest()
>>>>> is introduced:
>>>>
>>>> What do you intend to express with "is introduced"? Is there a
>>>> problem now?
>>>> Would there be a problem with subsequent changes? I'm entirely
>>>> fine
>>>> with
>>>> adding that stub, but the description should make clear why /when
>>>> exactly
>>>> it's needed.
>>> I mentioned that in the cover letter:
>>> ```
>>>    Also, after patch 3 ("xen/riscv: introduce setup_mm()") of this
>>>    patch series,
>>>    the linkage error mentioned in patch 1 ("xen/riscv: add stub for
>>>    share_xen_page_with_guest()") began to occur, so patch 1
>>> addresses
>>>    this issue.
>>> ```
>>> I thought it would be the better then just mention in the commit
>>> message that.
>>
>> Mentioning in the cover letter is fine, but each patch needs to also
>> be self-contained.
>>
>>> Will it be fine to mention instead:
>>> ```
>>>    Introduction of setup memory management function will require
>>>    share_xen_page_with_guest() defined, at least, as a stub
>>> otherwise
>>>    the following linkage error will occur...
>>> ```
>>
>> Quoting the linker error is imo of limited use. What such an
>> explanation
>> wants to say is why, all of the sudden, such an error occurs. After
>> all
>> you don't change anything directly related to common/trace.c.
> if maddr_to_virt() is defined as:
>     static inline void *maddr_to_virt(paddr_t ma)
>    {
>        BUG_ON("unimplemented");
>        return NULL;
>        // /* Offset in the direct map, accounting for pdx compression */
>        // unsigned long va_offset = maddr_to_directmapoff(ma);
>    
>        // ASSERT(va_offset < DIRECTMAP_SIZE);
>    
>        // return (void *)(DIRECTMAP_VIRT_START + va_offset);
>    }
> Then no stub for share_xen_page_with_privileged_guests() is needed but
> it isn't clear at all why the definition of maddr_to_virt() affects
> linkage of share_xen_page_with_privileged_guests().
> 
> I tried to look what is the difference after preprocessing stage for
> common/trace.o and the only difference is in how maddr_to_virt() is
> implemented:
>    7574a7575,7577
>    >     do { if (__builtin_expect(!!("unimplemented"),0)) do { do { ({
>    _Static_assert(!((30) >> ((31 - 24) + (31 - 24))), "!(" "(30) >>
>    (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH)" ")"); }); ({
>    _Static_assert(!((2) >= 4), "!(" "(2) >= BUGFRAME_NR" ")"); }); asm
>    volatile ( ".Lbug%=:""unimp""\n" "   .pushsection
>    .bug_frames.%""""[bf_type], \"a\", %%progbits\n" "   .p2align 2\n"
>    ".Lfrm%=:\n" "   .long (.Lbug%= - .Lfrm%=) + %""""[bf_line_hi]\n" "
>    .long (%""""[bf_ptr] - .Lfrm%=) + %""""[bf_line_lo]\n" "   .if " "0"
>    "\n" "   .long 0, %""""[bf_msg] - .Lfrm%=\n" "   .endif\n" "  
>    .popsection\n" :: [bf_type] "i" (2), [bf_ptr] "i"
>    ("./arch/riscv/include/asm/mm.h"), [bf_msg] "i" (((void*)0)),
>    [bf_line_lo] "i" (((30) & ((1 << (31 - 24)) - 1)) << 24),
>    [bf_line_hi] "i" (((30) >> (31 - 24)) << 24) ); } while ( 0 );
>    __builtin_unreachable(); } while ( 0 ); } while (0);
>    >     return ((void*)0);
>    > 
>    7578d7580
>    <     unsigned long va_offset = (ma);
>    7580d7581
>    <     do { if ( __builtin_expect(!!(!(va_offset < ((((vaddr_t)(509))
>    << ((3 - 1) * (9) + 12)) - (((vaddr_t)(200)) << ((3 - 1) * (9) +
>    12))))),0) ) do { do { ({ _Static_assert(!((35) >> ((31 - 24) + (31
>    - 24))), "!(" "(35) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH)"
>    ")"); }); ({ _Static_assert(!((3) >= 4), "!(" "(3) >= BUGFRAME_NR"
>    ")"); }); asm volatile ( ".Lbug%=:""unimp""\n" "   .pushsection
>    .bug_frames.%""""[bf_type], \"a\", %%progbits\n" "   .p2align 2\n"
>    ".Lfrm%=:\n" "   .long (.Lbug%= - .Lfrm%=) + %""""[bf_line_hi]\n" "
>    .long (%""""[bf_ptr] - .Lfrm%=) + %""""[bf_line_lo]\n" "   .if " "1"
>    "\n" "   .long 0, %""""[bf_msg] - .Lfrm%=\n" "   .endif\n" "  
>    .popsection\n" :: [bf_type] "i" (3), [bf_ptr] "i"
>    ("./arch/riscv/include/asm/mm.h"), [bf_msg] "i" ("va_offset <
>    DIRECTMAP_SIZE"), [bf_line_lo] "i" (((35) & ((1 << (31 - 24)) - 1))
>    << 24), [bf_line_hi] "i" (((35) >> (31 - 24)) << 24) ); } while ( 0
>    ); __builtin_unreachable(); } while ( 0 ); } while (0);
>    7582d7582
>    <     return (void *)((((vaddr_t)(200)) << ((3 - 1) * (9) + 12)) +
>    va_offset);
> 
> Could it be that DCE likely happen when maddr_to_virt() is defined as
> stub and so code which call share_xen_page_with_privileged_guests() is
> just eliminated? ( but I am not sure that I know fast way to check that
> , do you have any pointers? )

Yes, I think DCE is the explanation here. And that's what (imo) wants saying
in the description.

Jan


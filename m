Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39230A68F2F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 15:34:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920815.1324869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuUY-000526-3M; Wed, 19 Mar 2025 14:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920815.1324869; Wed, 19 Mar 2025 14:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuuUY-0004zU-0S; Wed, 19 Mar 2025 14:33:58 +0000
Received: by outflank-mailman (input) for mailman id 920815;
 Wed, 19 Mar 2025 14:33:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuuUW-0004zO-Tz
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 14:33:56 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f66969a-04cf-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 15:33:55 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4394a823036so43055755e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 07:33:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f589b4sm20575295e9.24.2025.03.19.07.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 07:33:54 -0700 (PDT)
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
X-Inumbo-ID: 2f66969a-04cf-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742394834; x=1742999634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9Fj+zsRSflNfB3lxQp2yi5/QCP46Z+dsr2aFjp7JwgM=;
        b=JsZSAEWXbVwG3TmohjrbYrqJYXqCdyEHjc+uRtzW+h2t2l0Bu0T/z54Rq95Q4b7VCw
         9J/0JLJ0+3XtsfRj8ozDnjpurim8ysGGp/CSEjAMLONFziLmV8f/SY5dmhs/Ejazzmnh
         pqoYwt7zc9OG2WpGvs4s4xO+9w40xYgzkCXP41bSiclxf6LnxjgxP0GLpLcynqkvHKfw
         o4O1woiYGrmwN2In0hgGVLgYvRN+iomfqO7Lpg9Sz8yMtH0VzKvwwivyng6WwewbuhAw
         LIygwjrOZ1zQDJ2dyI2H4GA0VRpOR3PW2TfzAvGyzNj4SSYSZ0CyDiqYU/Ma0ObgqzE+
         mt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742394834; x=1742999634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Fj+zsRSflNfB3lxQp2yi5/QCP46Z+dsr2aFjp7JwgM=;
        b=Af2hJtejv/1H1iPFQ1xgNYYm32NlA3A4OKZ0Rg32La57ApfqIiq4rschRthhsYm71w
         qW174faUrlXbHTgI6ci74pFsbEfrosLULsREENq5LQXWvFtQ/SAupuwg0RRaoiCaM4aa
         Ioz1MpHYX4yF+4aj/1aPCnKZ01fiwnq28KVPrCM+K3mvtvoGJ6CduGAiR9PH/Vw6XRi4
         NLQlo+T+on8Toka14L8IE1KAV+fbWTWxgyjHxes4Nlh79EZFKwjn4ThcxJm9NM2ARfte
         w+qE37tg7Cf5b3hXgAGiTza8E2dn0FgcVyzV8E0SLjipKrmFGtNB2fJZdorS4TRGbs8U
         rnZA==
X-Forwarded-Encrypted: i=1; AJvYcCXM915BHOUsQHrM/7fmJEsJ8ufhKMJkfVNcdGiR2IVVFcjftM1xCZJ3C/wUebgc0qMM7/AjW1c6aJ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg0Dj3fmCfC2e3LGtLMI7IGxRfUTVP5ICulAXMgR5kjQt/6vWI
	cS9+8WcRvk0oqiuiraI2ng8E7S/BaYeWFjh4ppnH1iGMsh4acvxGqoWhrv12JQ==
X-Gm-Gg: ASbGncvL4zLjh0RJ3ON7JEL8GAZJcjr5OnyCFl2ERMwje2d6/r+gj4duOPxxc/RRJMs
	qA4awRXmrgVY8P3QwzB05w+UbrEWMDq/Hv6j0JMggpmOzGUDiIMa59tCCwxUugtGsTxuiYC17KV
	G/AS+kOHBB5hPZuZ1p0jogtoG6fC08iwcspecxcvvkXyRENNB6NCd9+A4yS7j4iKnPuOu1C5qZp
	qAWF6bicpou8oxfUQn6s924QHgkZ2sLaHJc94cv+EyOMqM2n8x/C7dUsGiJLG273cC7jjqsVg29
	5zA/Golv04NDY5Kyph7YDlH2IzMxpu6Y/+3awSIdeiupAwo57SOWRFFsjWseMxlX9BCHzVZkfcR
	9pnAELBAZxsJGGHXYNBqOEJeDDGCPmQ==
X-Google-Smtp-Source: AGHT+IGVzUtJp6noH96nahBRdxNtpYxnSv58pW2umQhYmDgn2ONkTgWEpyBj2ZCMrIrmnJl7h6DIeg==
X-Received: by 2002:a05:600c:1e0f:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43d43794f86mr35083195e9.11.1742394834303;
        Wed, 19 Mar 2025 07:33:54 -0700 (PDT)
Message-ID: <df927391-352c-464d-88d0-7ba72fdd5cdf@suse.com>
Date: Wed, 19 Mar 2025 15:33:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/mkelf32: account for offset when detecting note
 segment placement
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-3-roger.pau@citrix.com>
 <1dce6993-09d7-4f04-8ccc-908a0a4cc10f@suse.com>
 <Z9rRzRQnHLtUOpQs@macbook.local>
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
In-Reply-To: <Z9rRzRQnHLtUOpQs@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 15:16, Roger Pau Monné wrote:
> On Wed, Mar 19, 2025 at 11:07:33AM +0100, Jan Beulich wrote:
>> On 18.03.2025 18:35, Roger Pau Monne wrote:
>>> mkelf32 attempt to check that the program header defined NOTE segment falls
>>> inside of the LOAD segment, as the build-id should be loaded for Xen at
>>> runtime to check.
>>>
>>> However the current code doesn't take into account the LOAD program header
>>> segment offset when calculating overlap with the NOTE segment.  This
>>> results in incorrect detection, and the following build error:
>>>
>>> arch/x86/boot/mkelf32 --notes xen-syms ./.xen.elf32 0x200000 \
>>>                `nm xen-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$/0x\1/p'`
>>> Expected .note section within .text section!
>>> Offset 4244776 not within 2910364!
>>
>> Not your fault, but: Such printing of decimal numbers is of course very
>> unhelpful when ...
>>
>>> When xen-syms has the following program headers:
>>>
>>> Program Header:
>>>     LOAD off    0x0000000000200000 vaddr 0xffff82d040200000 paddr 0x0000000000200000 align 2**21
>>>          filesz 0x00000000002c689c memsz 0x00000000003f7e20 flags rwx
>>>     NOTE off    0x000000000040c528 vaddr 0xffff82d04040c528 paddr 0x000000000040c528 align 2**2
>>>          filesz 0x0000000000000024 memsz 0x0000000000000024 flags r--
>>
>> ... any half-way sane tool prints such values in hex.
>>
>>> --- a/xen/arch/x86/boot/mkelf32.c
>>> +++ b/xen/arch/x86/boot/mkelf32.c
>>> @@ -358,7 +358,8 @@ int main(int argc, char **argv)
>>>          note_sz = in64_phdr.p_memsz;
>>>          note_base = in64_phdr.p_vaddr - note_base;
>>>  
>>> -        if ( in64_phdr.p_offset > dat_siz || offset > in64_phdr.p_offset )
>>> +        if ( in64_phdr.p_offset > (offset + dat_siz) ||
>>> +             offset > in64_phdr.p_offset )
>>
>> This is an improvement, so fine to go in with Andrew's ack, but it still
>> doesn't match what the error message suggests is wanted: This checks only
>> whether .note starts after .text or ends before .text. A partial overlap,
>> which isn't okay either aiui, would go through fine.
>>
>> Oh, and - even in your change there's an off-by-1: You mean >= in the lhs
>> of the ||.
> 
> Hm, I see, it would be better as:
> 
> diff --git a/xen/arch/x86/boot/mkelf32.c b/xen/arch/x86/boot/mkelf32.c
> index 5f9e7e440e84..f0f406687cea 100644
> --- a/xen/arch/x86/boot/mkelf32.c
> +++ b/xen/arch/x86/boot/mkelf32.c
> @@ -358,11 +358,13 @@ int main(int argc, char **argv)
>          note_sz = in64_phdr.p_memsz;
>          note_base = in64_phdr.p_vaddr - note_base;
>  
> -        if ( in64_phdr.p_offset > dat_siz || offset > in64_phdr.p_offset )
> +        if ( in64_phdr.p_offset < offset ||
> +             in64_phdr.p_offset + in64_phdr.p_filesz > offset + dat_siz )
>          {
>              fprintf(stderr, "Expected .note section within .text section!\n" \
> -                    "Offset %"PRId64" not within %d!\n",
> -                    in64_phdr.p_offset, dat_siz);
> +                    ".note: [%"PRIx64", %"PRIx64") .text: [%x, %x)\n",
> +                    in64_phdr.p_offset, in64_phdr.p_offset + in64_phdr.p_filesz,
> +                    offset, offset + dat_siz);
>              return 1;
>          }
>          /* Gets us the absolute offset within the .text section. */

Reviewed-by: Jan Beulich <jbeulich@suse.com>


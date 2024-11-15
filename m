Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1413E9CDAFC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 09:56:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836960.1252874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBs7Q-0002g5-4K; Fri, 15 Nov 2024 08:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836960.1252874; Fri, 15 Nov 2024 08:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBs7Q-0002dL-1Q; Fri, 15 Nov 2024 08:55:56 +0000
Received: by outflank-mailman (input) for mailman id 836960;
 Fri, 15 Nov 2024 08:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBs7P-0002dF-0c
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 08:55:55 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69fce322-a32f-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 09:55:51 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-382219ceaacso688776f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 00:55:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae2f651sm3920493f8f.87.2024.11.15.00.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 00:55:50 -0800 (PST)
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
X-Inumbo-ID: 69fce322-a32f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzIiLCJoZWxvIjoibWFpbC13cjEteDQzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY5ZmNlMzIyLWEzMmYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjYwOTUxLjE1MDYzMiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731660950; x=1732265750; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ddfu+zNBaIeLM2TccbewDtmJtPpVM8dtHl5OATwltMc=;
        b=GtKG3UwuS50+IGzqTAbl6VuSbyetXQRD/J3j4DhBkLpYijjZnFIZZNUCb+Trrn8hMa
         NY+PfqJg+8DIxYMWnD5dlSRBp1Weab2ktGsyG+HWeDvxxkeSto+pPWyz0PrU8C9XSRBP
         wcwhD6/vtDaE6YfxJ102rRMyLKoIgMh3SGuawuvLQOC0bfaYks8ciTkvDOBPCSelnnG3
         DjquBsZVqbB5mc4cm/r5NszuJfu2ONMNYroaMMZ/UnrLfBQGeBbBbkjev1AoATICoVyl
         WH86YF1UM7QF0XW406bmMTekzqDeopCygb1H9/+WoUYD5kSgk7OJEQei7/n/ysj+JHmm
         U0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731660950; x=1732265750;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ddfu+zNBaIeLM2TccbewDtmJtPpVM8dtHl5OATwltMc=;
        b=t/3vz6op0lsbYiYVc+mzu+e62/5OilaJkvast1wJKk9PiHt1nO0zO6JCnJ4OP/HGnF
         x/htux0i9SIyQt3/vgA9Z8wLgSC3P1H+24a5Ic+EhpQjQ5Dn0wjt2tLGbG4nc7PCrNko
         auJciJKTjLvijCJ31TaJmMsqT/g3n/8B/ZY3vl3b0pG2ct5k9XyYUKyS3tQ6BCDJoTzW
         BkUYV1djp0HGUC5U4dlrXieBLtte78jUFBxtYIF9MqP1jnWbK/TU+2xMBbYXh7uvz4WT
         BzkSyvil5azLfnL15+H49ftD6bXLOPvUSjeKSE4oZsNOX4R+vMyNaXhznpK0O6GIup9x
         TKKg==
X-Gm-Message-State: AOJu0YzcrxsE4AUksCedk/T9CC5Bcz52j5bAM5KS89XWSyiPgyMhKway
	FDuTK5L8ljPJ9fK8dn7zsE0+Lq2KBxloifwdYF6JN37qAzdS4rI8ic8j2VcLrw==
X-Google-Smtp-Source: AGHT+IFXNPa45ejdJpp/e+CPNH1y4P/kjRrYLeIG8xD5UVhnHq0o+8A4Sm8W3XyfAKfNjdLXSDfg7g==
X-Received: by 2002:a05:6000:402b:b0:382:1e55:d3ca with SMTP id ffacd0b85a97d-38225a8a5cdmr1423853f8f.43.1731660950394;
        Fri, 15 Nov 2024 00:55:50 -0800 (PST)
Message-ID: <a04b5a17-6b30-4e81-bff4-5bfb748281bd@suse.com>
Date: Fri, 15 Nov 2024 09:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] x86/mm: miscellaneous fixes
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20241114145715.59777-1-roger.pau@citrix.com>
 <0f575e16-3e83-4d8e-b5ce-7fd9c962c3ee@citrix.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <0f575e16-3e83-4d8e-b5ce-7fd9c962c3ee@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.11.2024 01:55, Andrew Cooper wrote:
> On 14/11/2024 2:57 pm, Roger Pau Monne wrote:
>> Hello,
>>
>> The attempt to fix destroy_xen_mappings() so that L2 tables are
>> consistently freed uncovered some errors in the memory management code.
>> The following series attempts to fix them.
>>
>> All patches except for 4/4 are new in v2, and 4/4 has no change from v1,
>> hence kept Jan's Reviewed-by tag in 4/4.
>>
>> Thanks, Roger.
>>
>> Roger Pau Monne (4):
>>   x86/mm: introduce helpers to detect super page alignment
>>   x86/mm: skip super-page alignment checks for non-present entries
>>   x86/setup: remove bootstrap_map_addr() usage of destroy_xen_mappings()
>>   x86/mm: ensure L2 is always freed if empty
> 
> Still broken.  This happened to be a Cascade Lake:
> 
> (XEN) 3... 2... 1...
> (XEN) Xen is relinquishing VGA console.
> (XEN) ----[ Xen-4.20.0-4-d  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d04022cdc8>]
> common/page_alloc.c#free_heap_pages+0x52/0x753
> <snip>
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04022cdc8>] R
> common/page_alloc.c#free_heap_pages+0x52/0x753
> (XEN)    [<ffff82d04022e98f>] F free_domheap_pages+0x445/0x447
> (XEN)    [<ffff82d040320f88>] F free_xen_pagetable+0x2f/0x31
> (XEN)    [<ffff82d04032193d>] F map_pages_to_xen+0x5df/0x1028
> (XEN)    [<ffff82d040238ab1>] F vunmap+0x27/0xde
> (XEN)    [<ffff82d040624b61>] F vesa_endboot+0x86/0xb3
> (XEN)    [<ffff82d0406244c1>] F video_endboot+0x93/0x261
> (XEN)    [<ffff82d040616e3d>] F console_endboot+0x92/0x120
> (XEN)    [<ffff82d0406407e2>] F __start_xen+0x2139/0x2307
> (XEN)    [<ffff82d0402033ae>] F __high_start+0x8e/0x90
> (XEN)
> (XEN) Pagetable walk from ffff82c000205001:
> (XEN)  L4[0x105] = 0000000060431063 ffffffffffffffff
> (XEN)  L3[0x100] = 000000006fffd063 ffffffffffffffff
> (XEN)  L2[0x001] = fffffffffffff000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=0000]
> (XEN) Faulting linear address: ffff82c000205001
> (XEN) ****************************************
> 
> Note the definitely bogus L2e, which I'm guessing is an issue with the
> use of INVALID_MFN.

Why bogus? That's precisely what vunmap() requests:

    map_pages_to_xen(addr, INVALID_MFN, pages, _PAGE_NONE);

What I agree with is that INVALID_MFN better wouldn't spill into the
upper non-address part of the PTE, but that doesn't look to be important
here.

I can't, however, explain why free_heap_pages() would access VMAP space.
It's all page / MFN based and shouldn't even have a notion of the VA
space underlying vmap(). Is that address in CR2 inside the range that
was mapping the frame buffer (i.e. part of what vunmap() is in the
process of removing)?

What I also don't understand: How did this pass CI then? Are all tests
there perhaps done without vga= designating a VESA mode to use?

Jan


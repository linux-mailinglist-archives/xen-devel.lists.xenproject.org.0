Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB915A60FE1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 12:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914429.1320192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt38a-0007UR-40; Fri, 14 Mar 2025 11:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914429.1320192; Fri, 14 Mar 2025 11:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt38a-0007RY-0k; Fri, 14 Mar 2025 11:23:36 +0000
Received: by outflank-mailman (input) for mailman id 914429;
 Fri, 14 Mar 2025 11:23:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt38Y-0007RS-NA
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 11:23:34 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3b092a8-00c6-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 12:23:33 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso1268988f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 04:23:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40fa30sm5272516f8f.68.2025.03.14.04.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 04:23:32 -0700 (PDT)
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
X-Inumbo-ID: c3b092a8-00c6-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741951413; x=1742556213; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HMKzEV68r+ZLW9HlJ5st7WfvfZUaxcx1dbQ8PEANzQ0=;
        b=LnfyY//UM0OD+BAGV41FLhI7r1DVf4y01Rw7EvPXugXuKyjU2RTBz+yfWIrm++RRzv
         1wPsdWazNhYOuCFFU5WBA5aaoznfV7obtdx3nJQ/qj0pSsBxgA4uw0lTqBr7aV2m2wWC
         RSDHAhi3ilORiCzfSlqRxN+u7fyWSzuGoYYejHPhltntpamSlTjWCuAjrlePdHbcVc2H
         scn8fhtfjFoXI/YNxly2pboOmZcdWz0f5j5YgMKEJSU9ibpAPBZ7O7bWIIETYlmFAzci
         iO7NbAZSgVzysTJlfoRF0FbaQKbQACl4t5rhjuqD8tEy7pTidvsk4AWlhn6uzjyMleUc
         cQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951413; x=1742556213;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMKzEV68r+ZLW9HlJ5st7WfvfZUaxcx1dbQ8PEANzQ0=;
        b=CeQ4lsPQEk6gS7puZHPkutoHv8nBr44WUkEt2ATlpkfZRo/ywTkKIE7AHRUYD9YBvI
         ntubmV3apxSd4tWd0vVMdlPTs169zRI7XqYMVekF5II/08bD1FHRWDYiGWs81qQ9bI0W
         mXgFBejzmUdcCKZUwof6dfULdgoEvznCqSy0p+C+pGWX6M2vbqM1ifTauJbC4L/E+Gid
         7X36khmhmfgmhlI9ZpDEwHoek1hsr/CnFgqT0Hdhgzbgtl4uU4JeSIbeNRzBT6a02Aig
         YvB/CKwz4wsLgVOiR6kkL1uObzBnM8u+wQvAyKbd5EdT7rMxJEakM1eOU/m9WDcU3nVl
         ODWw==
X-Gm-Message-State: AOJu0Yzb2XTmAt/qmVvw6Tr9ScLx5FrORdqDYHxP30nI4q+eh3GX2hEg
	yg5y+3CoKPCAEztz21aKAfDdmebtiJiDSydV7TmjBu74rWj0C/aJEqph/B4Fqg==
X-Gm-Gg: ASbGncsjr8YiPUwazw1rbGSRTx0UqJy9jTdvMDQXcfWKnRaTkyPUwqJILK1lulatYOk
	K1/6u7wsdD53hkm9GiXM1wZhgJUiUlUL7JiG22eYdE7RVZ9z6gGx8k7DZsay+MQoIoIm8VzvG6k
	nwwY6vo7cDyqUN1K4sepRN3TKo0idcNNZl9Y4w5PZL8+iAPd4DNQcSWJTN9nMl6EmW3z37Etdv0
	CBkD+LonRmSTVZQOHPXPSMvEfXRMvCfpFAzaDKwxfjpr3U4JfZLXbWnemvHKpHQGt5t0AP7c6IY
	NvsLecOAQAht+a5hH2ZyaAnvwIelT59+ipgFENulDo/wk/KiD+vj9X9MK2ll16LjIZG+6vDkXJa
	aEEqhqUS9XH8SnmhplDCaLtirmydOOw==
X-Google-Smtp-Source: AGHT+IE9QJhvLbEhLbK1XcAu4u5pGZoLIJLyaZ5fVwSQ+5b5xGTfrAz2pBBsWnPnoedJAnKOBshWLQ==
X-Received: by 2002:a5d:598b:0:b0:391:3b70:2dab with SMTP id ffacd0b85a97d-3971d51fce9mr2017803f8f.17.1741951413227;
        Fri, 14 Mar 2025 04:23:33 -0700 (PDT)
Message-ID: <16149a89-4b77-4498-84a7-66810e6f0815@suse.com>
Date: Fri, 14 Mar 2025 12:23:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] x86/vga: fix mapping of the VGA text buffer
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-7-roger.pau@citrix.com>
 <8ce7caae-8bf6-4ba2-8705-399129a411b6@citrix.com>
 <Z9QHU-KozrXR95sL@macbook.local>
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
In-Reply-To: <Z9QHU-KozrXR95sL@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2025 11:39, Roger Pau Monné wrote:
> (resending because I seem to have inadvertently corrupted the Cc field)
> 
> On Thu, Mar 13, 2025 at 07:39:58PM +0000, Andrew Cooper wrote:
>> On 13/03/2025 3:30 pm, Roger Pau Monne wrote:
>>> The call to ioremap_wc() in video_init() will always fail, because
>>> video_init() is called ahead of vm_init_type(), and so the underlying
>>> __vmap() call will fail to allocate the linear address space.
>>>
>>> Fix by reverting to the previous behavior and using the directmap entries
>>> in the low 1MB.  Note the VGA text buffer directmap entries are also
>>> adjusted to map the VGA text buffer as WC instead of UC-.
>>>
>>> Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/boot/x86_64.S        | 10 +++++++---
>>>  xen/arch/x86/include/asm/config.h |  5 +++++
>>>  xen/drivers/video/vga.c           | 11 ++++++++---
>>>  3 files changed, 20 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
>>> index 26b9d1c2df9a..07f4bdf46e31 100644
>>> --- a/xen/arch/x86/boot/x86_64.S
>>> +++ b/xen/arch/x86/boot/x86_64.S
>>> @@ -84,15 +84,19 @@ ENTRY(__high_start)
>>>  /*
>>>   * Mapping of first 2 megabytes of memory. This is mapped with 4kB mappings
>>>   * to avoid type conflicts with fixed-range MTRRs covering the lowest megabyte
>>> - * of physical memory. In any case the VGA hole should be mapped with type UC.
>>> + * of physical memory. VGA hole should be mapped with type UC, with the
>>> + * exception of the text buffer that uses WC.
>>>   * Uses 1x 4k page.
>>>   */
>>>  l1_directmap:
>>>          pfn = 0
>>>          .rept L1_PAGETABLE_ENTRIES
>>> -        /* VGA hole (0xa0000-0xc0000) should be mapped UC-. */
>>> -        .if pfn >= 0xa0 && pfn < 0xc0
>>> +        /* VGA hole (0xa0000-0xb8000) should be mapped UC-. */
>>> +        .if pfn >= 0xa0 && pfn < 0xb8
>>>          .quad (pfn << PAGE_SHIFT) | __PAGE_HYPERVISOR_UCMINUS | _PAGE_GLOBAL | MAP_SMALL_PAGES
>>> +        /* VGA text buffer (0xb80000-0xc0000) should be mapped WC. */
>>> +        .elseif pfn >= 0xb8 && pfn < 0xc0
>>> +        .quad (pfn << PAGE_SHIFT) | __PAGE_HYPERVISOR_WC | _PAGE_GLOBAL | MAP_SMALL_PAGES
>>>          .else
>>>          .quad (pfn << PAGE_SHIFT) | PAGE_HYPERVISOR_RWX | MAP_SMALL_PAGES
>>>          .endif
>>
>> We have to be careful doing this.
>>
>> It probably is safe to use WC in the pagetables.  We don't start using
>> the pagetables until after we're sure we're on a 64bit CPU, which means
>> WC is available.
>>
>> However, doing so now means that we need explicit SFENCE's when using
>> this, even in places like early_error.  The IN/OUT instructions do flush
>> WC buffers, but the UART is written to before the screen, so there's a
>> chance that you'll lose the final character of the message on the screen.
> 
> I don't think early_error will ever use this mapping.
> 
> `vga_text_buffer` contains the address 0xb8000, and AFAICT it's
> exclusively used with paging disabled (as the multiboot2 efi path
> explicitly sets vga_text_buffer = 0).  The WC mapping created above is
> on the directmap, so va > DIRECTMAP_VIRT_START.
> 
> vga_text_puts() might need such SFENCE, but arguably that should be a
> different patch IMO.  Might be best to ask Jan whether this is on
> purpose?

I think that was wrongly omitted before already.

> My hypothesis is that the SFENCE might only be needed in
> video_endboot() and before reboot if Xen crashed ahead of
> relinquishing the VGA console.

This might suffice for being able to see the final picture, but it may
result in display artifacts earlier on.

Question is whether simply undoing the ioremap_wc() (for not functioning
correctly) isn't going to be good enough. Prior to the change to use that,
we had been using UC- quite okay (even if a bit slow). An option may be
to make a WC mapping a little later, when __vmap() is usable.

Jan


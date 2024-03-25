Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED6D88931A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 08:20:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697581.1088449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roecN-0007tC-R5; Mon, 25 Mar 2024 07:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697581.1088449; Mon, 25 Mar 2024 07:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1roecN-0007r0-ND; Mon, 25 Mar 2024 07:19:39 +0000
Received: by outflank-mailman (input) for mailman id 697581;
 Mon, 25 Mar 2024 07:19:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1roecM-0007qu-Jr
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 07:19:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07de3e36-ea78-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 08:19:34 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a466fc8fcccso522224466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 00:19:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y4-20020a1709060a8400b00a46bec6da9fsm2719970ejf.203.2024.03.25.00.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 00:19:33 -0700 (PDT)
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
X-Inumbo-ID: 07de3e36-ea78-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711351174; x=1711955974; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mm1gw2ECZDbis5ZwKJcUwi50GULtM/d805mZIANAhvU=;
        b=OREVHkzUOzmSEPDO/5vwMcXqrd2IbpkWJfLUkYIDC+YvFgTsNybeOfqvMzF81FXHLF
         iDVwGYqMCEZ6wyqb8OXpmWu8ADVRZ0cVHiBIzTg63u//eZG6YkhqXbOqnm+HmknERzam
         ii56rH9wQsQGmyqb0ZVOVcieu/AH2vG9VVnsevTY9VeZPQAWJMwwC8MLiKoNZaKGB4vY
         +zb+pExx6DK+fEBMpcD0Xeh83zhcAEZ0bARDVJjZY4YwQJhTI1Gjsbja94d8hH/BUeVx
         4HuAJg3i09S2eU0sZ0Wq3+pnmnff2svIzuDm/FogB0nO7jqfo9wmJN9xNhmSvdBvoTKM
         GA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711351174; x=1711955974;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mm1gw2ECZDbis5ZwKJcUwi50GULtM/d805mZIANAhvU=;
        b=d8MlL1nMKKKwgnI1aT1hY8+Vqw9ZTAyrGZn2V7VCMM0aFvPB9VhPxN9fx2B+rYs6Rt
         DTyDh107YXg/SCyS7vS3z9k64emDI1AhqJnHSh2kci694WnFuTVtWQ2MppuFluODgpM2
         SV8sQsJVzgxoE+9HdF033k3HOrmnY/+hANQdpisoYsa4iRKWShzeA+v40lEFgy3OHtWc
         M3nnP5Ygxx24m2qzQ+Vet1EbF3ZSxq43b0PX6SO4Vd3vHrKDxN7M9O6xoO/u2fx4Fc3Y
         NiWjd+/ANGIUHrDtM3SnyqCGsEdEKmpG/812QXffggkSHGeY8Z9CsUjKB0sQ3cPOUxCw
         p1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8OMO3k7WmrecsNhsCzU3sDKxQmukiYu1j831Yavy8BhfCtA13uagxnFOoWPFWPFwfaHbSoiN/1+BcwnbHCs+dHxuDtMtGt5mvhuvmVN0=
X-Gm-Message-State: AOJu0YxPdcPkzzH7RgSnv52JNSrp/ASHZpDCsD8cdWVoOdT2VvonjcmT
	nvA/g6CF12IwEdrRsrPids7MFZ926KjTExXWUaZQnZ8k1d3UeDdCXAveZYRIxQ==
X-Google-Smtp-Source: AGHT+IHjZJsf1abORytkCGlcCovBSEc8rsfBM+s+GeMZ6yy8XsiVbvFNrzALo5G3s14X8Gs4KaADDA==
X-Received: by 2002:a17:906:408f:b0:a47:2036:dbc4 with SMTP id u15-20020a170906408f00b00a472036dbc4mr3591164ejj.25.1711351174158;
        Mon, 25 Mar 2024 00:19:34 -0700 (PDT)
Message-ID: <3427132d-9458-4447-b667-d2ef3c1f0569@suse.com>
Date: Mon, 25 Mar 2024 08:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/14] xen/page_alloc: introduce preserved page flags
 macro
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-9-carlo.nonato@minervasys.tech>
 <3f615066-a792-493f-ba33-7667a6557c23@xen.org>
 <9e0f7ff3-5457-41e4-a1e4-bf75804fb900@xen.org>
 <255be735-f9fe-4e39-a24e-2f6aff91acc5@suse.com>
 <CAG+AhRWMh2quv3SNPJQ61au=e6gtdXUO7j-XVYV6chDmktqkvA@mail.gmail.com>
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
In-Reply-To: <CAG+AhRWMh2quv3SNPJQ61au=e6gtdXUO7j-XVYV6chDmktqkvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.03.2024 16:07, Carlo Nonato wrote:
> Hi guys,
> 
> On Thu, Mar 21, 2024 at 5:23 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 21.03.2024 17:10, Julien Grall wrote:
>>> On 21/03/2024 16:07, Julien Grall wrote:
>>>> On 15/03/2024 10:58, Carlo Nonato wrote:
>>>>> PGC_static and PGC_extra needs to be preserved when assigning a page.
>>>>> Define a new macro that groups those flags and use it instead of or'ing
>>>>> every time.
>>>>>
>>>>> To make preserved flags even more meaningful, they are kept also when
>>>>> switching state in mark_page_free().
>>>>>
>>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>>>
>>>> This patch is introducing a regression in OSStest (and possibly gitlab?):
>>>>
>>>> Mar 21 12:00:29.533676 (XEN) pg[0] MFN 2211c5 c=0x2c00000000000000 o=0
>>>> v=0xe40000010007ffff t=0x24
>>>> Mar 21 12:00:42.829785 (XEN) Xen BUG at common/page_alloc.c:1033
>>>> Mar 21 12:00:42.829829 (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y
>>>> Not tainted ]----
>>>> Mar 21 12:00:42.829857 (XEN) CPU:    12
>>>> Mar 21 12:00:42.841571 (XEN) RIP:    e008:[<ffff82d04022fe1f>]
>>>> common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2
>>>> Mar 21 12:00:42.841609 (XEN) RFLAGS: 0000000000010282   CONTEXT:
>>>> hypervisor (d0v8)
>>>> Mar 21 12:00:42.853654 (XEN) rax: ffff83023e3ed06c   rbx:
>>>> 000000000007ffff   rcx: 0000000000000028
>>>> Mar 21 12:00:42.853689 (XEN) rdx: ffff83047bec7fff   rsi:
>>>> ffff83023e3ea3e8   rdi: ffff83023e3ea3e0
>>>> Mar 21 12:00:42.865657 (XEN) rbp: ffff83047bec7c10   rsp:
>>>> ffff83047bec7b98   r8:  0000000000000000
>>>> Mar 21 12:00:42.877647 (XEN) r9:  0000000000000001   r10:
>>>> 000000000000000c   r11: 0000000000000010
>>>> Mar 21 12:00:42.877682 (XEN) r12: 0000000000000001   r13:
>>>> 0000000000000000   r14: ffff82e0044238a0
>>>> Mar 21 12:00:42.889652 (XEN) r15: 0000000000000000   cr0:
>>>> 0000000080050033   cr4: 0000000000372660
>>>> Mar 21 12:00:42.901651 (XEN) cr3: 000000046fe34000   cr2: 00007fb72757610b
>>>> Mar 21 12:00:42.901685 (XEN) fsb: 00007fb726def380   gsb:
>>>> ffff88801f200000   gss: 0000000000000000
>>>> Mar 21 12:00:42.913646 (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000
>>>> ss: e010   cs: e008
>>>> Mar 21 12:00:42.913680 (XEN) Xen code around <ffff82d04022fe1f>
>>>> (common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2):
>>>> Mar 21 12:00:42.925645 (XEN)  d1 1c 00 e8 ad dd 02 00 <0f> 0b 48 85 c9
>>>> 79 36 0f 0b 41 89 cd 48 c7 47 f0
>>>> Mar 21 12:00:42.937649 (XEN) Xen stack trace from rsp=ffff83047bec7b98:
>>>> Mar 21 12:00:42.937683 (XEN)    0000000000000024 000000007bec7c20
>>>> 0000000000000001 ffff83046ccda000
>>>> Mar 21 12:00:42.949653 (XEN)    ffff82e000000021 0000000000000016
>>>> 0000000000000000 0000000000000000
>>>> Mar 21 12:00:42.949687 (XEN)    0000000000000000 0000000000000000
>>>> 0000000000000028 0000000000000021
>>>> Mar 21 12:00:42.961652 (XEN)    ffff83046ccda000 0000000000000000
>>>> 00007d2000000000 ffff83047bec7c48
>>>> Mar 21 12:00:42.961687 (XEN)    ffff82d0402302ff ffff83046ccda000
>>>> 0000000000000100 0000000000000000
>>>> Mar 21 12:00:42.973655 (XEN)    ffff82d0405f0080 00007d2000000000
>>>> ffff83047bec7c80 ffff82d0402f626c
>>>> Mar 21 12:00:42.985656 (XEN)    ffff83046ccda000 ffff83046ccda640
>>>> 0000000000000000 0000000000000000
>>>> Mar 21 12:00:42.985690 (XEN)    ffff83046ccda220 ffff83047bec7cb0
>>>> ffff82d0402f65a0 ffff83046ccda000
>>>> Mar 21 12:00:42.997662 (XEN)    0000000000000000 0000000000000000
>>>> 0000000000000000 ffff83047bec7cc0
>>>> Mar 21 12:00:43.009660 (XEN)    ffff82d040311f8a ffff83047bec7ce0
>>>> ffff82d0402bd543 ffff83046ccda000
>>>> Mar 21 12:00:43.009695 (XEN)    ffff83047bec7dc8 ffff83047bec7d08
>>>> ffff82d04032c524 ffff83046ccda000
>>>> Mar 21 12:00:43.021653 (XEN)    ffff83047bec7dc8 0000000000000002
>>>> ffff83047bec7d58 ffff82d040206750
>>>> Mar 21 12:00:43.033642 (XEN)    0000000000000000 ffff82d040233fe5
>>>> ffff83047bec7d48 0000000000000000
>>>> Mar 21 12:00:43.033678 (XEN)    0000000000000002 00007fb72767f010
>>>> ffff82d0405e9120 0000000000000001
>>>> Mar 21 12:00:43.045654 (XEN)    ffff83047bec7e70 ffff82d040240728
>>>> 0000000000000007 ffff83023e3b3000
>>>> Mar 21 12:00:43.045690 (XEN)    0000000000000246 ffff83023e2efa90
>>>> ffff83023e38e000 ffff83023e2efb40
>>>> Mar 21 12:00:43.057609 (XEN)    0000000000000007 ffff83023e3afb80
>>>> 0000000000000206 ffff83047bec7dc0
>>>> Mar 21 12:00:43.069662 (XEN)    0000001600000001 000000000000ffff
>>>> e75aaa8d0000000c ac0d6d864e487f62
>>>> Mar 21 12:00:43.069697 (XEN)    000000037fa48d76 0000000200000000
>>>> ffffffff000003ff 00000002ffffffff
>>>> Mar 21 12:00:43.081647 (XEN)    0000000000000000 00000000000001ff
>>>> 0000000000000000 0000000000000000
>>>> Mar 21 12:00:43.093646 (XEN) Xen call trace:
>>>> Mar 21 12:00:43.093677 (XEN)    [<ffff82d04022fe1f>] R
>>>> common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2
>>>> Mar 21 12:00:43.093705 (XEN)    [<ffff82d0402302ff>] F
>>>> alloc_domheap_pages+0x17d/0x1e4
>>>> Mar 21 12:00:43.105652 (XEN)    [<ffff82d0402f626c>] F
>>>> hap_set_allocation+0x73/0x23c
>>>> Mar 21 12:00:43.105685 (XEN)    [<ffff82d0402f65a0>] F
>>>> hap_enable+0x138/0x33c
>>>> Mar 21 12:00:43.117646 (XEN)    [<ffff82d040311f8a>] F
>>>> paging_enable+0x2d/0x45
>>>> Mar 21 12:00:43.117679 (XEN)    [<ffff82d0402bd543>] F
>>>> hvm_domain_initialise+0x185/0x428
>>>> Mar 21 12:00:43.129652 (XEN)    [<ffff82d04032c524>] F
>>>> arch_domain_create+0x3e7/0x4c1
>>>> Mar 21 12:00:43.129687 (XEN)    [<ffff82d040206750>] F
>>>> domain_create+0x4cc/0x7e2
>>>> Mar 21 12:00:43.141665 (XEN)    [<ffff82d040240728>] F
>>>> do_domctl+0x1850/0x192d
>>>> Mar 21 12:00:43.141699 (XEN)    [<ffff82d04031a96a>] F
>>>> pv_hypercall+0x617/0x6b5
>>>> Mar 21 12:00:43.153656 (XEN)    [<ffff82d0402012ca>] F
>>>> lstar_enter+0x13a/0x140
>>>> Mar 21 12:00:43.153689 (XEN)
>>>> Mar 21 12:00:43.153711 (XEN)
>>>> Mar 21 12:00:43.153731 (XEN) ****************************************
>>>> Mar 21 12:00:43.165647 (XEN) Panic on CPU 12:
>>>> Mar 21 12:00:43.165678 (XEN) Xen BUG at common/page_alloc.c:1033
>>>> Mar 21 12:00:43.165703 (XEN) ****************************************
>>>> Mar 21 12:00:43.177633 (XEN)
>>>> Mar 21 12:00:43.177662 (XEN) Manual reset required ('noreboot' specified)
>>>>
>>>> The code around the BUG is:
>>>>
>>>>          /* Reference count must continuously be zero for free pages. */
>>>>          if ( (pg[i].count_info & ~PGC_need_scrub) != PGC_state_free )
>>>>          {
>>>>              printk(XENLOG_ERR
>>>>                     "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
>>>>                     i, mfn_x(page_to_mfn(pg + i)),
>>>>                     pg[i].count_info, pg[i].v.free.order,
>>>>                     pg[i].u.free.val, pg[i].tlbflush_timestamp);
>>>>              BUG();
>>>>          }
>>>>
>>>> Now that you are preserving some flags, you also want to modify the
>>>> condition. I haven't checked the rest of the code, so there might be
>>>> some adjustments necessary.
>>>
>>> Actually maybe the condition should not be adjusted. I think it would be
>>> wrong if a free pages has the flag PGC_extra set. Any thoughts?
>>
>> I agree, yet I'm inclined to say PGC_extra should have been cleared
>> before trying to free the page.
> 
> So what to do now? Should I drop this commit?

No, we need to get to the root of the issue. Since osstest has hit it quite
easily as it seems, I'm somewhat surprised you didn't hit it in your testing.
In any event, as per my earlier reply, my present guess is that your change
has merely uncovered a previously latent issue elsewhere.

Jan


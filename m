Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D95A9C325
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 11:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967577.1357351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8FDR-0007pn-ND; Fri, 25 Apr 2025 09:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967577.1357351; Fri, 25 Apr 2025 09:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8FDR-0007n8-Js; Fri, 25 Apr 2025 09:19:25 +0000
Received: by outflank-mailman (input) for mailman id 967577;
 Fri, 25 Apr 2025 09:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8FDQ-0007n2-5x
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 09:19:24 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 601daf61-21b6-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 11:19:23 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so1425606f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 02:19:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8c7a4sm1838939f8f.14.2025.04.25.02.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 02:19:22 -0700 (PDT)
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
X-Inumbo-ID: 601daf61-21b6-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745572762; x=1746177562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+RDerG6jNULfaA4YUvRDnnpy9iI0YZWbPJff+ejUuJQ=;
        b=Xs21uKsVA5CMrLNvN/DGu7G31tUlT2aj5aFaxb6kUxQGdmO2uOnlt21yPtrQts2JIn
         /h1X4MB4yt8u/F8q4JbHdV6AqXfD+WQ/xli4XuuPjSNP92Aoqc+jC/Sr/W/ADVhsk2aX
         fXO6Jq7hhD3BKi57F7jw5HODEq6n5P5LnjYZ5wMd3+eBSVJPZ0sRFjIXURA78XFsfI8x
         Ak61zBDsTe59hWxGDW66rn8EiDF2pqEE8GCxM+L4jkKkE8Sfv5TrM1r+P+WjLZLrhYuP
         6yAdcYaR5la1lWf0/h5PMl6zpWp1w4lBj9579Eq3F+1J7oyCOy4dLD0SGa0G6hJ4Rk9W
         RPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572762; x=1746177562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RDerG6jNULfaA4YUvRDnnpy9iI0YZWbPJff+ejUuJQ=;
        b=tGHi6tlRw39zbJ4J75qJUTgvvNbOwD8OEb6LG3RlvpqN4aDQ1nZGufcKuCDrDPShyf
         JCvl/hDEF8WI34pzUXBYyd/9Tbez1ijO+QWQPO72ERuJTIk9idMFQ5ugC0nxXIFidVUt
         TFgzfLKGLxacVxdufRuBNgC03UNsmX91AgS0EzR9H9CCxbCoZEtbTOiCJ75I9EgyA78q
         RA8dSJghSIqF/H7TfKQg5DE6f/j+s3RnV8tqd5WXWKPZN4UT7aKzCMtcQrjYPhHGZMN/
         +kBogEjrqUBpVJKGqGIRAeEVUq8yzhIIihscSuggHQ99p9ySGCZwa0EJplHwkL30dTvT
         0jeA==
X-Forwarded-Encrypted: i=1; AJvYcCVqdH8I5sXOGBgXtkm1GnNn5X4PwHjl7dLFR5GFXBm+skwgzM51TEYWy+o3sz1Y8Ku8++8AfKwOd0U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFFTIviIPOOfH2C/ZDqa7FnRWn8npmdsAeSaqZhrDqIbJ1K6jG
	2QwoLKQuqy9yHqk0vOpvZyAdgR+8vskWmBQNQvbG10J58W+qcM+Mrt5x/mq4QrIUgYGP8yv5gYk
	=
X-Gm-Gg: ASbGncu4x+NDFLGBhivRjA3kAd1adSao/m3YWT/jkZfaR920MzTnwWNv29qZcIMBzx7
	3Tml2QbqAKChbvGOZ12l6qxwN0CBDC1dNOTzDKtB6UcRERZgoL5PoO6k1FaPjgWyjQYwetVBipK
	QyQmY0AXi9Ywxm7WTsq4M54Uon7bd/SWnVD2qQaprCPI1KAmPfm/nG3Yo5iRaJgjzd6cyQbS2Od
	XZhF3E+/DvCvSPHPpTCyNbxjYqHlXe0a5SqVEUrF7MyPMDJkTi3u2gjok9h5szrnAGqlYbaYZTj
	cCVQeyA1XTg1+ewwx2q+vSdyNRrEz/SbWuTq1smzDtmwxrYTOHy5MiedQDQXo8pmDYPP+rucX3y
	munkt2AW/3rPMmJxwSSI07UZYgA==
X-Google-Smtp-Source: AGHT+IFvG8gujqfBiGFxzGotrg/BtaUAf1/Ehm8uMVqba3i5/pGrdlORkjMQsp2/zrhC5qWitnQ8Sw==
X-Received: by 2002:a5d:598d:0:b0:391:487f:282a with SMTP id ffacd0b85a97d-3a074f492f2mr1200260f8f.50.1745572762384;
        Fri, 25 Apr 2025 02:19:22 -0700 (PDT)
Message-ID: <2acad9ba-564a-4d18-9b09-dcabe8f7b025@suse.com>
Date: Fri, 25 Apr 2025 11:19:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Lira, Victor M" <VictorM.Lira@amd.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
 Alejandro.GarciaVallejo@amd.com
References: <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
 <Z_jFSb2-efexUNlL@macbook.lan> <9ed89e50-c645-407d-80b4-5b78cb6e36fa@amd.com>
 <Z_zGdE91KwlYxu_A@macbook.lan> <ce06ec74-1a73-4a02-87fc-3e829399cc77@amd.com>
 <aAnvRMgJxAskbCtE@macbook.lan> <aAoPNTsLjMMfsHvJ@mail-itl>
 <aAoW-kvpsWuPJwrC@macbook.lan> <775d3ac0-8f43-415a-a32d-14377092b96b@amd.com>
 <554026de-bbb4-488f-95c4-8e2f034d6d0e@amd.com> <aAtPpOq2Kc_N6hBy@macbook.lan>
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
In-Reply-To: <aAtPpOq2Kc_N6hBy@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.04.2025 11:02, Roger Pau Monné wrote:
> On Thu, Apr 24, 2025 at 02:38:29PM -0700, Lira, Victor M wrote:
>> Hello all,
>>
>> Here is the output from Roger's patch.
>> This is the section of interest:
>>
>>> (XEN) [ 7.547326] d0 has maximum 3328PIRQs
>>> (XEN) [ 7.555644] *** Building a PVH Dom0 ***
>>> (XEN) [ 7.567780] d0: identity mappings for IOMMU:
>>> (XEN) [ 7.577312]  [00000000a0, 00000000ff] RW
>>> (XEN) [ 7.586153]  [0000009bff, 0000009fff] RW
>>> (XEN) [ 7.594992]  [00000cabc9, 00000cc14c] RW
>>> (XEN) [ 7.603866]  [00000cc389, 00000cc389] RW
>>> (XEN) [ 7.612707]  [00000cc70a, 00000cd1fe] RW
>>> (XEN) [ 7.621896]  [00000ce000, 00000cffff] RW
>>> (XEN) [ 7.630731]  [00000fd000, 00000fd2ff] RW
>>> (XEN) [ 7.639573]  [00000fd304, 00000febff] RW
>>> (XEN) [ 7.648414] gfn 0xfe800mfn 0xfe800type 5order 9
>>> (XEN) [ 7.658985] Xen WARNat arch/x86/mm/p2m-pt.c:599
>>> (XEN) [ 7.669215] ----[ Xen-4.21-unstable x86_64  debug=y  Tainted:   C
>>>    ]----
>>> ...
>>> (XEN) [ 8.227521] Xen call trace:
>>> (XEN) [ 8.234107]    [<ffff82d040309bd6>] R
>>> arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0xc1/0x961
>>> (XEN) [ 8.250925]    [<ffff82d0402fbf0d>] F p2m_set_entry+0xb5/0x13c
>>> (XEN) [ 8.263579]    [<ffff82d0402fc091>] F
>>> arch/x86/mm/p2m.c#set_typed_p2m_entry+0xfd/0x6f0
>>> (XEN) [ 8.280388]    [<ffff82d0402fdcd4>] F set_mmio_p2m_entry+0x62/0x6b
>>> (XEN) [ 8.293735]    [<ffff82d0402ff9cf>] F map_mmio_regions+0x77/0xcf
>>> (XEN) [ 8.306734]    [<ffff82d04042fc1b>] F
>>> drivers/passthrough/x86/iommu.c#identity_map+0x7e/0x196
>>> (XEN) [ 8.324761]    [<ffff82d040232935>] F
>>> rangeset_report_ranges+0x10a/0x159
>>> (XEN) [ 8.339149]    [<ffff82d0404301e6>] F
>>> arch_iommu_hwdom_init+0x27f/0x316
>>> (XEN) [ 8.353361]    [<ffff82d04042cffa>] F
>>> drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xa9/0xc1
>>> (XEN) [ 8.373988]    [<ffff82d040430846>] F iommu_hwdom_init+0x26/0x2e
>>> (XEN) [ 8.386989]    [<ffff82d040441a30>] F
>>> dom0_construct_pvh+0x265/0x1141
>>> (XEN) [ 8.400860]    [<ffff82d040457f7c>] F construct_dom0+0x47/0x93
>>> (XEN) [ 8.413511]    [<ffff82d0404504e0>] F __start_xen+0x21fc/0x2425
>>> (XEN) [ 8.426340]    [<ffff82d0402043be>] F __high_start+0x8e/0x90
>>> (XEN) [ 8.438646]
>>> (XEN) [ 8.442632]  [00000fec02, 00000fedff] RW
>>> (XEN) [ 8.451599]  [00000fee01, 00000fffff] RW
>>> (XEN) [ 8.460571]  [000080f340, 00008501ff] RW
>>> (XEN) [ 8.470205] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid
>>> position
>>> (XEN) [ 8.484769] 0000:03:00.0: not mapping BAR [fe900, fe90f] invalid
>>> position
>>> (XEN) [ 8.499330] 0000:03:00.0: not mapping BAR [fe910, fe913] invalid
>>> position
>>> (XEN) [ 8.513890] gfn 0xfe910mfn 0xfffffffffffffffftype 1order 0
>>> (XEN) [ 8.526370] Xen WARNat arch/x86/mm/p2m-pt.c:599
>>> ...
>>> (XEN) [ 9.094902] Xen call trace:
>>> (XEN) [ 9.101491]    [<ffff82d040309bd6>] R
>>> arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0xc1/0x961
>>> (XEN) [ 9.118306]    [<ffff82d0402fbf0d>] F p2m_set_entry+0xb5/0x13c
>>> (XEN) [ 9.130957]    [<ffff82d0402fe1fb>] F
>>> p2m_remove_identity_entry+0x26f/0x2ca
>>> (XEN) [ 9.145865]    [<ffff82d040268a4a>] F
>>> vpci_make_msix_hole+0x11a/0x27a
>>> (XEN) [ 9.159734]    [<ffff82d0402654c4>] F
>>> drivers/vpci/header.c#modify_decoding+0x4e/0x1b3
>>> (XEN) [ 9.176547]    [<ffff82d040265c89>] F
>>> drivers/vpci/header.c#modify_bars+0x660/0x6c4
>>> (XEN) [ 9.192838]    [<ffff82d040266427>] F
>>> drivers/vpci/header.c#init_header+0x5e7/0x86f
>>> (XEN) [ 9.209129]    [<ffff82d04026449c>] F vpci_assign_device+0xd3/0x115
>>> (XEN) [ 9.222648]    [<ffff82d040430de4>] F
>>> drivers/passthrough/pci.c#setup_one_hwdom_device+0x92/0x15b
>>> (XEN) [ 9.241368]    [<ffff82d04043112a>] F
>>> drivers/passthrough/pci.c#_setup_hwdom_pci_devices+0x158/0x241
>>> (XEN) [ 9.260612]    [<ffff82d04027aad7>] F
>>> drivers/passthrough/pci.c#pci_segments_iterate+0x43/0x69
>>> (XEN) [ 9.278814]    [<ffff82d040431513>] F
>>> setup_hwdom_pci_devices+0x28/0x2f
>>> (XEN) [ 9.293026]    [<ffff82d04042d009>] F
>>> drivers/passthrough/amd/pci_amd_iommu.c#amd_iommu_hwdom_init+0xb8/0xc1
>>> (XEN) [ 9.313649]    [<ffff82d040430846>] F iommu_hwdom_init+0x26/0x2e
>>> (XEN) [ 9.326652]    [<ffff82d040441a30>] F
>>> dom0_construct_pvh+0x265/0x1141
>>> (XEN) [ 9.340516]    [<ffff82d040457f7c>] F construct_dom0+0x47/0x93
>>> (XEN) [ 9.353172]    [<ffff82d0404504e0>] F __start_xen+0x21fc/0x2425
>>> (XEN) [ 9.365999]    [<ffff82d0402043be>] F __high_start+0x8e/0x90
>>> (XEN) [ 9.378305]
>>> (XEN) [ 9.382289] 0000:04:00.0: not mapping BAR [fe700, fe77f] invalid
>>> position
>>> (XEN) [ 9.396850] 0000:04:00.3: not mapping BAR [fe500, fe5ff] invalid
>>> position
>>> (XEN) [ 9.411412] 0000:04:00.4: not mapping BAR [fe400, fe4ff] invalid
>>> position
>>> (XEN) [ 9.425972] 0000:05:00.0: not mapping BAR [fe801, fe801] invalid
>>> position
>>> (XEN) [ 9.440531] 0000:05:00.1: not mapping BAR [fe800, fe800] invalid
>>> position
>>
>> So vpci_make_msix_hole is where it's getting removed.
> 
> Oh, the output is very mangled when displaying the email on my MUA,
> but I see.  I think I now get what's happening.
> 
> Since the BAR falls into a reserved region, the `enabled` bit for it is
> never set, and thus the handling in msix_accept() never triggers,
> leaving those accesses unhandled and terminated by the null handler.
> 
> I think the patch below should fix it, let me know how it goes.

Just to mention - "fix" isn't quite the right term here, is it? BARs may
not live in E820_RESERVED areas. And while we make those up from the EFI
memory map we're handed, ...

> There's also a further known issue with vpci_make_msix_hole(): if the
> BARs are repositioned the holes are not restored to their previous
> values, but I don't think you are hitting that issue (yet).

... the memory map we're seeing here will go stale once the OS (any; not
just Xen or Linux) decides to move those BARs. Imo firmware simply may
not request runtime mappings of BARs.

Jan


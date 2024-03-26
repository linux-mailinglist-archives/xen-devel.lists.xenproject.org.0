Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B988CA29
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 18:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698182.1089616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpAEO-0002Uj-OJ; Tue, 26 Mar 2024 17:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698182.1089616; Tue, 26 Mar 2024 17:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpAEO-0002S3-Kx; Tue, 26 Mar 2024 17:05:00 +0000
Received: by outflank-mailman (input) for mailman id 698182;
 Tue, 26 Mar 2024 17:04:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpAEN-0002RU-TU
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 17:04:59 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa31d948-eb92-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 18:04:59 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a4702457ccbso742881566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 10:04:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jy12-20020a170907762c00b00a46ab3adea5sm4421333ejc.113.2024.03.26.10.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 10:04:57 -0700 (PDT)
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
X-Inumbo-ID: fa31d948-eb92-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711472698; x=1712077498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uuzKZXxFf1+GQZFr7QU0Vuyclxmq77t6KiD8r093TN4=;
        b=SR4JQMVvKmCAwb05ZwD/gPJzSHEcU3b1f9bPNYnv6s1zo+uWatVVpMdkQFjmx8UEsY
         EpuyTtAjz2tNWpzObCTgCT19UjfWpD9knj+q0atmApgliQ8wjKh/svx79unB187ePZ7Z
         qYpDyTwYENLFvnLo4DGtA4GwDRvfHwrw8vUIOPeSsTw2GhvOfpR2YWLV4CLNm2sgzazU
         c8MnP4+kcR5QIn98RpBpzmqPfy3hRb2frcVW5CEF48FR3VxhXC8JpWdf4AGeBVG7DxIO
         OLK0Uy3ctEtfLDitnEVbgQeQisAc2lsFuzcz+ozMVMttKkh0/Z5FiqYuRI9ove8fDuhy
         Bwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711472698; x=1712077498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uuzKZXxFf1+GQZFr7QU0Vuyclxmq77t6KiD8r093TN4=;
        b=TL92eqMQN/Wn9LFravgqEKZ2AyJaLv6sx5EFV1fL25V/xfmfNX3jUcMmlxKMhVQ38e
         KMN3bS1Hdo0MfCLnCoMm/VvdAOFZh1krTrMXlkQVUg6hseaP9KRGW29ACvZwpskAVGc/
         smbYoozuzfVHdFrImekpuFH5YtlrgOIzq5y8p7Ee8kQaYgUEs88g40eLTRVt2IWdybBj
         4/5nthNcbhSO3Y60lTSngyNKB1z6R7f+HupWmcuc+GIcoMi4alsIMpxcXmftH/BcD+J6
         PmBvGD2vjyzjXc53ixUOubrKF5XjsLQoksOqlKbTU20baVSCrvOPXHO8zZ+9L16sbL65
         Ackw==
X-Forwarded-Encrypted: i=1; AJvYcCUw7oqttyxv/Bn/7x/WKC2z0O3yzbdQXJlc1631MXqJ83vHfYfbzftf3C7EHyAd0s9JVPAk8H3qigtbqtqDbQIeGPVyG0M458v6XduNKNU=
X-Gm-Message-State: AOJu0YxdKNaRvJhWLZO/ZGY37Yv3/o4jBb+4o8sxDbMt2ohCGLPdIpAY
	FsN+CacYqoexNLbWhdUf8LQtuQ7Ej3PeeosstQPaqNV4HxJWtHXAnoKLQNenMw==
X-Google-Smtp-Source: AGHT+IGxAwXxM6QM9qn1kaONeqAZchDBFk6O9UGjcc767t+hOvMBcOI7ZzpyA9mHLiFosWU3mjmKnQ==
X-Received: by 2002:a17:906:b243:b0:a47:1d01:bb8f with SMTP id ce3-20020a170906b24300b00a471d01bb8fmr6011171ejb.31.1711472698161;
        Tue, 26 Mar 2024 10:04:58 -0700 (PDT)
Message-ID: <f7bde6a7-1e48-4074-b8f5-094fa0d6a593@suse.com>
Date: Tue, 26 Mar 2024 18:04:57 +0100
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
 <3427132d-9458-4447-b667-d2ef3c1f0569@suse.com>
 <CAG+AhRXE7cMNnDNxZeF=o7wBXKUtwvMj6Y5oRy-UrpDyAfM5Cw@mail.gmail.com>
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
In-Reply-To: <CAG+AhRXE7cMNnDNxZeF=o7wBXKUtwvMj6Y5oRy-UrpDyAfM5Cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2024 17:39, Carlo Nonato wrote:
> On Mon, Mar 25, 2024 at 8:19 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 22.03.2024 16:07, Carlo Nonato wrote:
>>> On Thu, Mar 21, 2024 at 5:23 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 21.03.2024 17:10, Julien Grall wrote:
>>>>> On 21/03/2024 16:07, Julien Grall wrote:
>>>>>> On 15/03/2024 10:58, Carlo Nonato wrote:
>>>>>>> PGC_static and PGC_extra needs to be preserved when assigning a page.
>>>>>>> Define a new macro that groups those flags and use it instead of or'ing
>>>>>>> every time.
>>>>>>>
>>>>>>> To make preserved flags even more meaningful, they are kept also when
>>>>>>> switching state in mark_page_free().
>>>>>>>
>>>>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>>>>>
>>>>>> This patch is introducing a regression in OSStest (and possibly gitlab?):
>>>>>>
>>>>>> Mar 21 12:00:29.533676 (XEN) pg[0] MFN 2211c5 c=0x2c00000000000000 o=0
>>>>>> v=0xe40000010007ffff t=0x24
>>>>>> Mar 21 12:00:42.829785 (XEN) Xen BUG at common/page_alloc.c:1033
>>>>>> Mar 21 12:00:42.829829 (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y
>>>>>> Not tainted ]----
>>>>>> Mar 21 12:00:42.829857 (XEN) CPU:    12
>>>>>> Mar 21 12:00:42.841571 (XEN) RIP:    e008:[<ffff82d04022fe1f>]
>>>>>> common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2
>>>>>> Mar 21 12:00:42.841609 (XEN) RFLAGS: 0000000000010282   CONTEXT:
>>>>>> hypervisor (d0v8)
>>>>>> Mar 21 12:00:42.853654 (XEN) rax: ffff83023e3ed06c   rbx:
>>>>>> 000000000007ffff   rcx: 0000000000000028
>>>>>> Mar 21 12:00:42.853689 (XEN) rdx: ffff83047bec7fff   rsi:
>>>>>> ffff83023e3ea3e8   rdi: ffff83023e3ea3e0
>>>>>> Mar 21 12:00:42.865657 (XEN) rbp: ffff83047bec7c10   rsp:
>>>>>> ffff83047bec7b98   r8:  0000000000000000
>>>>>> Mar 21 12:00:42.877647 (XEN) r9:  0000000000000001   r10:
>>>>>> 000000000000000c   r11: 0000000000000010
>>>>>> Mar 21 12:00:42.877682 (XEN) r12: 0000000000000001   r13:
>>>>>> 0000000000000000   r14: ffff82e0044238a0
>>>>>> Mar 21 12:00:42.889652 (XEN) r15: 0000000000000000   cr0:
>>>>>> 0000000080050033   cr4: 0000000000372660
>>>>>> Mar 21 12:00:42.901651 (XEN) cr3: 000000046fe34000   cr2: 00007fb72757610b
>>>>>> Mar 21 12:00:42.901685 (XEN) fsb: 00007fb726def380   gsb:
>>>>>> ffff88801f200000   gss: 0000000000000000
>>>>>> Mar 21 12:00:42.913646 (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000
>>>>>> ss: e010   cs: e008
>>>>>> Mar 21 12:00:42.913680 (XEN) Xen code around <ffff82d04022fe1f>
>>>>>> (common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2):
>>>>>> Mar 21 12:00:42.925645 (XEN)  d1 1c 00 e8 ad dd 02 00 <0f> 0b 48 85 c9
>>>>>> 79 36 0f 0b 41 89 cd 48 c7 47 f0
>>>>>> Mar 21 12:00:42.937649 (XEN) Xen stack trace from rsp=ffff83047bec7b98:
>>>>>> Mar 21 12:00:42.937683 (XEN)    0000000000000024 000000007bec7c20
>>>>>> 0000000000000001 ffff83046ccda000
>>>>>> Mar 21 12:00:42.949653 (XEN)    ffff82e000000021 0000000000000016
>>>>>> 0000000000000000 0000000000000000
>>>>>> Mar 21 12:00:42.949687 (XEN)    0000000000000000 0000000000000000
>>>>>> 0000000000000028 0000000000000021
>>>>>> Mar 21 12:00:42.961652 (XEN)    ffff83046ccda000 0000000000000000
>>>>>> 00007d2000000000 ffff83047bec7c48
>>>>>> Mar 21 12:00:42.961687 (XEN)    ffff82d0402302ff ffff83046ccda000
>>>>>> 0000000000000100 0000000000000000
>>>>>> Mar 21 12:00:42.973655 (XEN)    ffff82d0405f0080 00007d2000000000
>>>>>> ffff83047bec7c80 ffff82d0402f626c
>>>>>> Mar 21 12:00:42.985656 (XEN)    ffff83046ccda000 ffff83046ccda640
>>>>>> 0000000000000000 0000000000000000
>>>>>> Mar 21 12:00:42.985690 (XEN)    ffff83046ccda220 ffff83047bec7cb0
>>>>>> ffff82d0402f65a0 ffff83046ccda000
>>>>>> Mar 21 12:00:42.997662 (XEN)    0000000000000000 0000000000000000
>>>>>> 0000000000000000 ffff83047bec7cc0
>>>>>> Mar 21 12:00:43.009660 (XEN)    ffff82d040311f8a ffff83047bec7ce0
>>>>>> ffff82d0402bd543 ffff83046ccda000
>>>>>> Mar 21 12:00:43.009695 (XEN)    ffff83047bec7dc8 ffff83047bec7d08
>>>>>> ffff82d04032c524 ffff83046ccda000
>>>>>> Mar 21 12:00:43.021653 (XEN)    ffff83047bec7dc8 0000000000000002
>>>>>> ffff83047bec7d58 ffff82d040206750
>>>>>> Mar 21 12:00:43.033642 (XEN)    0000000000000000 ffff82d040233fe5
>>>>>> ffff83047bec7d48 0000000000000000
>>>>>> Mar 21 12:00:43.033678 (XEN)    0000000000000002 00007fb72767f010
>>>>>> ffff82d0405e9120 0000000000000001
>>>>>> Mar 21 12:00:43.045654 (XEN)    ffff83047bec7e70 ffff82d040240728
>>>>>> 0000000000000007 ffff83023e3b3000
>>>>>> Mar 21 12:00:43.045690 (XEN)    0000000000000246 ffff83023e2efa90
>>>>>> ffff83023e38e000 ffff83023e2efb40
>>>>>> Mar 21 12:00:43.057609 (XEN)    0000000000000007 ffff83023e3afb80
>>>>>> 0000000000000206 ffff83047bec7dc0
>>>>>> Mar 21 12:00:43.069662 (XEN)    0000001600000001 000000000000ffff
>>>>>> e75aaa8d0000000c ac0d6d864e487f62
>>>>>> Mar 21 12:00:43.069697 (XEN)    000000037fa48d76 0000000200000000
>>>>>> ffffffff000003ff 00000002ffffffff
>>>>>> Mar 21 12:00:43.081647 (XEN)    0000000000000000 00000000000001ff
>>>>>> 0000000000000000 0000000000000000
>>>>>> Mar 21 12:00:43.093646 (XEN) Xen call trace:
>>>>>> Mar 21 12:00:43.093677 (XEN)    [<ffff82d04022fe1f>] R
>>>>>> common/page_alloc.c#alloc_heap_pages+0x37f/0x6e2
>>>>>> Mar 21 12:00:43.093705 (XEN)    [<ffff82d0402302ff>] F
>>>>>> alloc_domheap_pages+0x17d/0x1e4
>>>>>> Mar 21 12:00:43.105652 (XEN)    [<ffff82d0402f626c>] F
>>>>>> hap_set_allocation+0x73/0x23c
>>>>>> Mar 21 12:00:43.105685 (XEN)    [<ffff82d0402f65a0>] F
>>>>>> hap_enable+0x138/0x33c
>>>>>> Mar 21 12:00:43.117646 (XEN)    [<ffff82d040311f8a>] F
>>>>>> paging_enable+0x2d/0x45
>>>>>> Mar 21 12:00:43.117679 (XEN)    [<ffff82d0402bd543>] F
>>>>>> hvm_domain_initialise+0x185/0x428
>>>>>> Mar 21 12:00:43.129652 (XEN)    [<ffff82d04032c524>] F
>>>>>> arch_domain_create+0x3e7/0x4c1
>>>>>> Mar 21 12:00:43.129687 (XEN)    [<ffff82d040206750>] F
>>>>>> domain_create+0x4cc/0x7e2
>>>>>> Mar 21 12:00:43.141665 (XEN)    [<ffff82d040240728>] F
>>>>>> do_domctl+0x1850/0x192d
>>>>>> Mar 21 12:00:43.141699 (XEN)    [<ffff82d04031a96a>] F
>>>>>> pv_hypercall+0x617/0x6b5
>>>>>> Mar 21 12:00:43.153656 (XEN)    [<ffff82d0402012ca>] F
>>>>>> lstar_enter+0x13a/0x140
>>>>>> Mar 21 12:00:43.153689 (XEN)
>>>>>> Mar 21 12:00:43.153711 (XEN)
>>>>>> Mar 21 12:00:43.153731 (XEN) ****************************************
>>>>>> Mar 21 12:00:43.165647 (XEN) Panic on CPU 12:
>>>>>> Mar 21 12:00:43.165678 (XEN) Xen BUG at common/page_alloc.c:1033
>>>>>> Mar 21 12:00:43.165703 (XEN) ****************************************
>>>>>> Mar 21 12:00:43.177633 (XEN)
>>>>>> Mar 21 12:00:43.177662 (XEN) Manual reset required ('noreboot' specified)
>>>>>>
>>>>>> The code around the BUG is:
>>>>>>
>>>>>>          /* Reference count must continuously be zero for free pages. */
>>>>>>          if ( (pg[i].count_info & ~PGC_need_scrub) != PGC_state_free )
>>>>>>          {
>>>>>>              printk(XENLOG_ERR
>>>>>>                     "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
>>>>>>                     i, mfn_x(page_to_mfn(pg + i)),
>>>>>>                     pg[i].count_info, pg[i].v.free.order,
>>>>>>                     pg[i].u.free.val, pg[i].tlbflush_timestamp);
>>>>>>              BUG();
>>>>>>          }
>>>>>>
>>>>>> Now that you are preserving some flags, you also want to modify the
>>>>>> condition. I haven't checked the rest of the code, so there might be
>>>>>> some adjustments necessary.
>>>>>
>>>>> Actually maybe the condition should not be adjusted. I think it would be
>>>>> wrong if a free pages has the flag PGC_extra set. Any thoughts?
>>>>
>>>> I agree, yet I'm inclined to say PGC_extra should have been cleared
>>>> before trying to free the page.
>>>
>>> So what to do now? Should I drop this commit?
>>
>> No, we need to get to the root of the issue. Since osstest has hit it quite
>> easily as it seems, I'm somewhat surprised you didn't hit it in your testing.
>> In any event, as per my earlier reply, my present guess is that your change
>> has merely uncovered a previously latent issue elsewhere.
> 
> Ok, what about removing PGC_extra in free_heap_pages() before the
> mark_page_free() call?

Question is: How would you justify such a change? IOW I'm not convinced
(yet) this wants doing there.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8363A10C15
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 17:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871529.1282512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXjeE-00010O-Jp; Tue, 14 Jan 2025 16:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871529.1282512; Tue, 14 Jan 2025 16:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXjeE-0000xv-Gu; Tue, 14 Jan 2025 16:20:10 +0000
Received: by outflank-mailman (input) for mailman id 871529;
 Tue, 14 Jan 2025 16:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXjeD-0000xZ-0q
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 16:20:09 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ae88e69-d293-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 17:20:06 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so41018585e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 08:20:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66d9sm218053575e9.1.2025.01.14.08.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 08:20:05 -0800 (PST)
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
X-Inumbo-ID: 6ae88e69-d293-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736871606; x=1737476406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Twn88yhZHElt+klK+h9O0Ttpc2hs3GRfZNqbUhuX5DE=;
        b=C8IX7uxPSprklmJFWmNWe1rbnhEEnKHpGIs+XaVTqSv09phR8pgmuW26KK7heBDSpS
         YAYrNoPgaJGOpHdIe705yBNmTUBJI/r/m0F7SAFdf4HdQg6lSVwAKzXVjP9PMqP1iHHq
         2t79d8gkfsrMzhJQezVumcUBePSq9Imund6Aa0akVI/s8AuPXrBrmPIfzlSXXZNMo28K
         G7Ii6UkiT/u1Tno77Br/zB6FNVWxiNSJHgdPRGLjIGL+MDd2XE8Xkbcq8JoqZD0yAsvN
         35GHBbAFnKCpAZ82cXcPpHO21YB3KJQTMjZklQqHWRkpxtVCkr5WumUya4ApctEXB0K4
         WafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736871606; x=1737476406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Twn88yhZHElt+klK+h9O0Ttpc2hs3GRfZNqbUhuX5DE=;
        b=X8sN9NK4bq+nRXisxkPABHNK61l3gMH5lsvRKQV7O2bCnQPsvvVBftH2FwA0HjqBgs
         d6Pk9CmpuVVaqILn92CyKlV3fhW9zlAUjUI1lwUT4kViyeOvfhLOwr8Z4uHC0gV33nRF
         LNxdZJi+GL0GC205WnNDKxQDYHWI8qhGyvroy98W/6puWPRUml/1iyKrh94KH4FuM5r4
         vmwnIbt5tM3XNAvFaQdcEceFO4tiSHYiXmzgjx/t15rpCdpIvETFipAX5Zw745rISQ1j
         Y/Dp+EwEIKByJ2orDKrtRtUU1/by2dIgFvDiqclROb0qbm9YdHfxJLE2IJ8Yn8Q8m7Vc
         wezA==
X-Forwarded-Encrypted: i=1; AJvYcCVB8EB9H8ODyV3nndSMHCTg+nJwJir1eDIiQhbpMiL/Jj/loUcD7hTTiR0p0vQTscOAgEsV3TQs5kc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJb6hLpkB+5dNC0NUMgzc0/3CSYkzRDNyHkkI7Ot0ReOJHGcIK
	tSUhUtOJEASZb+a5zkXvSHULglxQ3ysFka68/ze5xEioxB/BYrLYkav2Yx+mYw==
X-Gm-Gg: ASbGncu9ptiXRJy8DasV1DRmmSYbHcF3XnFfDJquhI1gT01ezp0Hf0100I7vpiQjjDc
	pgsvhWm2ZaotQNmJ9e+Gdk7LWcmRi7pIF3VvmCy7+L9fm+NCxuFI8boogcZ5Y70D2T3WGf2DP4H
	XB5IWxcs5IMt3o0lJh0EkgF1gCExB5p3tcSS1caSAp/VZZoleho0CIGOgYA6HRmRhItojHvzAzG
	oCzHLoCxAzFRR5Mrfhze4LQsUi4PclQXQW+U4Fb0WrbtxdxVOnr+oTKwI8mQGiOl5ziqJkRVFCV
	ELVUqsXXeQKOP3KFSNST3hPNdJPPqpoMWLbpceomlQ==
X-Google-Smtp-Source: AGHT+IFd9fa6cj6AvrcIVRf8blnbam9aEbg+KF75J/1rKjObvoJG07sfJdfGML4knS1Z2Nc6zxl08g==
X-Received: by 2002:a5d:59af:0:b0:385:f677:859b with SMTP id ffacd0b85a97d-38a872f7fbdmr24891945f8f.10.1736871606248;
        Tue, 14 Jan 2025 08:20:06 -0800 (PST)
Message-ID: <8064a526-3525-4c48-8926-6ea99a8312a6@suse.com>
Date: Tue, 14 Jan 2025 17:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] x86: adventures in Address Space Isolation
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20250108142659.99490-1-roger.pau@citrix.com>
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
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 15:26, Roger Pau Monne wrote:
> Hello,
> 
> The aim of this series is to introduce the functionality required to
> create linear mappings visible to a single pCPU.
> 
> Doing so requires having a per-vCPU root page-table (L4), and hence
> requires shadowing the guest selected L4 on PV guests.  As follow ups
> (and partially to ensure the per-CPU mappings work fine) the CPU stacks
> are switched to use per-CPU mappings, so that remote stack contents are
> not by default mapped on all page-tables (note: for this to be true the
> directmap entries for the stack pages would need to be removed also).
> 
> There's one known shortcoming with the presented code: migration of PV
> guests using per-vCPU root page-tables is not working.  I need to
> introduce extra logic to deal with PV shadow mode when using unique root
> page-tables.  I don't think this should block the series however, such
> missing functionality can always be added as follow up work.
> paging_domctl() is adjusted to reflect this restriction.
> 
> The main differences compared to v1 are the usage of per-vCPU root page
> tables (as opposed to per-pCPU), and the usage of the existing perdomain
> family of functions to manage the mappings in the per-domain slot, that
> now becomes per-vCPU.
> 
> All patches until 17 are mostly preparatory, I think there's a nice
> cleanup and generalization of the creation and managing of per-domain
> mappings, by no longer storing references to L1 page-tables in the vCPU
> or domain struct.

Since you referred me to the cover letter, I've looked back here after
making some more progress with the series. Along with my earlier comment
towards the need or ultimate goal, ...

> Patch 13 introduces the command line option, and would need discussion
> and integration with the sparse direct map series.  IMO we should get
> consensus on how we want the command line to look ASAP, so that we can
> basic parsing logic in place to be used by both the work here and the
> direct map removal series.
> 
> As part of this series the map_domain_page() helpers are also switched
> to create per-vCPU mappings (see patch 15), which converts an existing
> interface into creating per-vCPU mappings.  Such interface can be used
> to hide (map per-vCPU) further data that we don't want to be part of the
> direct map, or even shared between vCPUs of the same domain.  Also all
> existing users of the interface will already create per-vCPU mappings
> without needing additional changes.
> 
> Note that none of the logic introduced in the series removes entries for
> the directmap, so even when creating the per-CPU mappings the underlying
> physical addresses are fully accessible when using it's direct map
> entries.
> 
> I also haven't done any benchmarking.  Doesn't seem to cripple
> performance up to the point that XenRT jobs would timeout before
> finishing, that the only objective reference I can provide at the
> moment.
> 
> The series has been extensively tested on XenRT, but that doesn't cover
> all possible use-cases, so it's likely to still have some rough edges,
> handle with care.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (18):
>   x86/mm: purge unneeded destroy_perdomain_mapping()
>   x86/domain: limit window where curr_vcpu != current on context switch
>   x86/mm: introduce helper to detect per-domain L1 entries that need
>     freeing
>   x86/pv: introduce function to populate perdomain area and use it to
>     map Xen GDT
>   x86/mm: switch destroy_perdomain_mapping() parameter from domain to
>     vCPU
>   x86/pv: set/clear guest GDT mappings using
>     {populate,destroy}_perdomain_mapping()
>   x86/pv: update guest LDT mappings using the linear entries
>   x86/pv: remove stashing of GDT/LDT L1 page-tables
>   x86/mm: simplify create_perdomain_mapping() interface
>   x86/mm: switch {create,destroy}_perdomain_mapping() domain parameter
>     to vCPU
>   x86/pv: untie issuing FLUSH_ROOT_PGTBL from XPTI
>   x86/mm: move FLUSH_ROOT_PGTBL handling before TLB flush
>   x86/spec-ctrl: introduce Address Space Isolation command line option
>   x86/mm: introduce per-vCPU L3 page-table
>   x86/mm: introduce a per-vCPU mapcache when using ASI
>   x86/pv: allow using a unique per-pCPU root page table (L4)
>   x86/mm: switch to a per-CPU mapped stack when using ASI
>   x86/mm: zero stack on context switch
> 
>  docs/misc/xen-command-line.pandoc    |  24 +++
>  xen/arch/x86/cpu/mcheck/mce.c        |   4 +
>  xen/arch/x86/domain.c                | 157 +++++++++++----
>  xen/arch/x86/domain_page.c           | 105 ++++++----
>  xen/arch/x86/flushtlb.c              |  28 ++-
>  xen/arch/x86/hvm/hvm.c               |   6 -
>  xen/arch/x86/include/asm/config.h    |  16 +-
>  xen/arch/x86/include/asm/current.h   |  58 +++++-
>  xen/arch/x86/include/asm/desc.h      |   6 +-
>  xen/arch/x86/include/asm/domain.h    |  50 +++--
>  xen/arch/x86/include/asm/flushtlb.h  |   2 +-
>  xen/arch/x86/include/asm/mm.h        |  15 +-
>  xen/arch/x86/include/asm/processor.h |   5 +
>  xen/arch/x86/include/asm/pv/mm.h     |   5 +
>  xen/arch/x86/include/asm/smp.h       |  12 ++
>  xen/arch/x86/include/asm/spec_ctrl.h |   4 +
>  xen/arch/x86/mm.c                    | 291 +++++++++++++++++++++------
>  xen/arch/x86/mm/hap/hap.c            |   2 +-
>  xen/arch/x86/mm/paging.c             |   6 +
>  xen/arch/x86/mm/shadow/hvm.c         |   2 +-
>  xen/arch/x86/mm/shadow/multi.c       |   2 +-
>  xen/arch/x86/pv/descriptor-tables.c  |  47 ++---
>  xen/arch/x86/pv/dom0_build.c         |  12 +-
>  xen/arch/x86/pv/domain.c             |  57 ++++--
>  xen/arch/x86/pv/mm.c                 |  43 +++-
>  xen/arch/x86/setup.c                 |  32 ++-
>  xen/arch/x86/smp.c                   |  39 ++++
>  xen/arch/x86/smpboot.c               |  26 ++-
>  xen/arch/x86/spec_ctrl.c             | 205 ++++++++++++++++++-
>  xen/arch/x86/traps.c                 |  25 ++-
>  xen/arch/x86/x86_64/mm.c             |   7 +-
>  xen/common/smp.c                     |  10 +
>  xen/common/stop_machine.c            |  10 +
>  xen/include/xen/smp.h                |   8 +
>  34 files changed, 1052 insertions(+), 269 deletions(-)

... this diffstat (even after subtracting out the contribution of the last two
patches in the series) doesn't really look like a cleanup / simplification.
Things becoming slightly slower (because of the L1 no longer directly available
to modify) may, otoh, not be a significant issue, if we assume that GDT/LDT
manipulation isn't normally a very frequent operation.

IOW my earlier request stands: Can you please try to make more clear (in the
patch descriptions) what exactly the motivation for these changes is? Just
doing things differently with more code overall can't be it, I don't think.

Jan


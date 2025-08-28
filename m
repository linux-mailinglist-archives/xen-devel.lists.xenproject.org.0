Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A6B39E02
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098749.1452725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcH7-0005y4-Vs; Thu, 28 Aug 2025 13:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098749.1452725; Thu, 28 Aug 2025 13:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcH7-0005vX-TF; Thu, 28 Aug 2025 13:02:45 +0000
Received: by outflank-mailman (input) for mailman id 1098749;
 Thu, 28 Aug 2025 13:02:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urcH7-0005vR-B7
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:02:45 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 495b7dc3-840f-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 15:02:44 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7a8dd3dso58999366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 06:02:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afebac31532sm443771766b.86.2025.08.28.06.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 06:02:42 -0700 (PDT)
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
X-Inumbo-ID: 495b7dc3-840f-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386163; x=1756990963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2MHhUN7PYKt8aq7ePrzbS2Dv7+ER5OqQwu3bW3pKF1U=;
        b=SEb/3FPg1kOQRegMdszFe3NtssV20OsntkLeRxZC9bvkDPEJoICcp5rtZQe5Xb5i6Y
         SH8p96s2+95V7MNWBpu3pSsMltN0FVJ8FOedFAWmxD7Q9FAZ7aOdomrAPnI/zQhgAS2y
         8QQpNdvI+6Yy0WoFGjpH0XVQaH/uodIZYuyUz/1KwFF0/3VckJ7tcRRpvQ3QtGiw+i1C
         lX7mZtqV72yhELDfM7k0/0t2moezhSzCe3hrWH8i3iCof31i5MY1Fwimgbc0TVbhoVdD
         6If1nhE0XeNOsio1S4F/wgY1nfuT0njy/LuvEIH9uX87jDGjMjbfWy8als/gmb4MFPqw
         2ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386163; x=1756990963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MHhUN7PYKt8aq7ePrzbS2Dv7+ER5OqQwu3bW3pKF1U=;
        b=gsqJtXn6uL5k7FGna+jTauzC/hqIyUqt4FFLOqn5bcJDP7o3zUvSmjcy8kFP5SNLCx
         iGkPgDAkjnmVwLwtTS/tvYmNaDkk1Uu0kzhedkNb8ZO5nKenveA7fSX4FvIs05yPv9Dj
         dnJyPGf/lwE9o789c1uvz/liYj6sPDVgQofQFR/ZlQKa+qs38A0PelxQM5E+WJy+FqS0
         ZlCzmp1uWGDw0oEJjEK/2IkP9TT8pUPZhpgRuFOGjt9DVVZObfM4ypU9yoSDMDkQzOfj
         JvHhskf90ODIo1OQeUzh496zY9knhPRnFFiLCWnZyEYj4MlKZuHRwFpMpClekVq0NtHv
         xcIg==
X-Forwarded-Encrypted: i=1; AJvYcCV92NEX+6czq/diDo/mi17NOqpBO3G7dRmZkkRcD6XShEMs+PlR8BH8QrXafGUJ8W1/4qYC1sNXCqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjncmQ8sh0s0HDfssXV/trcnCS4LxnmiuUTEM4bKJXU5WzADB8
	Tw//urU2wuRrt2Rjip/QGAZfT8v7eqfZMOOU81/qpRZaUq2pqysKx5UA48/x4l9VxA==
X-Gm-Gg: ASbGncuq644sQtoddYqEg6E9l3F/zjoH37qkAowc6IAgOLmA7tRKWPZcgXqVpp/Ipkk
	xwOagY1xBxVZz5ci5wh9qp7eDzmxb86TT3XO5LlPUZofP+4eLa7arsVU5IMKq/UNPghlptf1c7L
	/6vhWaqvo+6ULvAUcbfwIvcGNxd13QU7BwANYMAAlGk66xj6jD/n3jXfGk9i3dgEzo19jvRBan7
	uzGI4sv4W8EWN8woKwLLJyZg5ieKet7D5yOOh3URcG5gPWV+/wIxMcLn+jDUoE0dZ3kK0lDG/hh
	1imRAxYTaiPdIlWFgczHkYtcncl6Bu60f2wmZ83Jdynpy9L/C6tV0C/NnyKM8m3h6ChHOSocG34
	GK+RB70OK7EmcFMjp6oLbW/ro2WcAUSk50MjsfBZh7wUdhUXsUbGhEuMQeQce3Z4DfzeFUYgk2p
	COvHSk+qE=
X-Google-Smtp-Source: AGHT+IEpH9Zi8nsBgYONSHDUBQKf8jMM3Ga5LTyKP5sEyiChGi80bxc/rE4lz6HTkk4o6ESxVUU4fg==
X-Received: by 2002:a17:907:1c28:b0:afe:d0c9:8f50 with SMTP id a640c23a62f3a-afed0c99961mr380213566b.44.1756386163251;
        Thu, 28 Aug 2025 06:02:43 -0700 (PDT)
Message-ID: <7d9fd72a-39b7-43b0-875f-859a7a45c4fb@suse.com>
Date: Thu, 28 Aug 2025 15:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 3/3] x86/hvm: Introduce Xen-wide ASID allocator
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Vaishali Thakkar <vaishali.thakkar@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1750770621.git.teddy.astie@vates.tech>
 <81169a40fdc8c124b1656e451ac2e81f4e8edd2d.1750770621.git.teddy.astie@vates.tech>
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
In-Reply-To: <81169a40fdc8c124b1656e451ac2e81f4e8edd2d.1750770621.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2025 16:01, Teddy Astie wrote:
> From: Vaishali Thakkar <vaishali.thakkar@suse.com> (formely vates.tech)
> 
> Currently ASID generation and management is done per-PCPU. This
> scheme is incompatible with SEV technologies as SEV VMs need to
> have a fixed ASID associated with all vcpus of the VM throughout
> it's lifetime.
> 
> This commit introduces a Xen-wide allocator which initializes
> the asids at the start of xen and allows to have a fixed asids
> throughout the lifecycle of all domains. Having a fixed asid
> for non-SEV domains also presents us with the opportunity to
> further take use of AMD instructions like TLBSYNC and INVLPGB
> for broadcasting the TLB invalidations.
> 
> Introduce vcpu->needs_tlb_flush attribute to schedule a guest TLB
> flush for the next VMRUN/VMENTER. This will be later be done using
> either TLB_CONTROL field (AMD) or INVEPT (Intel). This flush method
> is used in place of the current ASID swapping logic.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@suse.com> (formely vates.tech)

Not sure whether you may legitimately alter pre-existing S-o-b. In
any event the two S-o-b looks to be in the wrong order; like most
other tags they want to be sorted chronologically.

> ---
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Should the ASID/VPID/VMID management logic code being shared accross
> x86/ARM/RISC-V ?

If all present and future architectures agree on how exactly they want
to use these IDs. Which I'm unsure of. RISC-V is now vaguely following
the original x86 model.

> Is it possible to have multiples vCPUs of a same domain simultaneously
> scheduled on top of a single pCPU ? If so, it would need a special
> consideration for this corner case, such as we don't miss a TLB flush
> in such cases.

No, how would two entities be able to run on a single pCPU at any single
point in time?

> I get various stability when testing shadow paging in these patches, unsure
> what's the exact root case. HAP works perfectly fine though.
> 
> TODO:
> - Intel: Don't assign the VPID at each VMENTER, though we need
>   to rethink how we manage VMCS with nested virtualization / altp2m
>   for changing this behavior.
> - AMD: Consider hot-plug of CPU with ERRATA_170. (is it possible ?)
> - Consider cases where we don't have enough ASIDs (e.g Xen as nested guest)
> - Nested virtualization ASID management

For these last two points - maybe we really need a mixed model?

> ---
>  xen/arch/x86/flushtlb.c                |  31 +++---
>  xen/arch/x86/hvm/asid.c                | 148 +++++++++----------------
>  xen/arch/x86/hvm/emulate.c             |   2 +-
>  xen/arch/x86/hvm/hvm.c                 |  14 ++-
>  xen/arch/x86/hvm/nestedhvm.c           |   6 +-
>  xen/arch/x86/hvm/svm/asid.c            |  77 ++++++++-----
>  xen/arch/x86/hvm/svm/nestedsvm.c       |   1 -
>  xen/arch/x86/hvm/svm/svm.c             |  36 +++---
>  xen/arch/x86/hvm/svm/svm.h             |   4 -
>  xen/arch/x86/hvm/vmx/vmcs.c            |   5 +-
>  xen/arch/x86/hvm/vmx/vmx.c             |  68 ++++++------
>  xen/arch/x86/hvm/vmx/vvmx.c            |   5 +-
>  xen/arch/x86/include/asm/flushtlb.h    |   7 --
>  xen/arch/x86/include/asm/hvm/asid.h    |  25 ++---
>  xen/arch/x86/include/asm/hvm/domain.h  |   1 +
>  xen/arch/x86/include/asm/hvm/hvm.h     |  15 +--
>  xen/arch/x86/include/asm/hvm/svm/svm.h |   5 +
>  xen/arch/x86/include/asm/hvm/vcpu.h    |  10 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h |   4 +-
>  xen/arch/x86/mm/hap/hap.c              |   6 +-
>  xen/arch/x86/mm/p2m.c                  |   7 +-
>  xen/arch/x86/mm/paging.c               |   2 +-
>  xen/arch/x86/mm/shadow/hvm.c           |   1 +
>  xen/arch/x86/mm/shadow/multi.c         |  12 +-
>  xen/include/xen/sched.h                |   2 +
>  25 files changed, 227 insertions(+), 267 deletions(-)

I think I said this to Vaishali already: This really wants splitting up some,
to become halfway reviewable.

Jan


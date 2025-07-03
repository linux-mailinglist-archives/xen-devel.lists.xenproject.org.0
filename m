Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F32AF6E04
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 11:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031852.1405599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFp0-0005eM-Mh; Thu, 03 Jul 2025 09:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031852.1405599; Thu, 03 Jul 2025 09:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFp0-0005cO-Jw; Thu, 03 Jul 2025 09:01:34 +0000
Received: by outflank-mailman (input) for mailman id 1031852;
 Thu, 03 Jul 2025 09:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXFoy-0005cI-DA
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 09:01:32 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aaa6366-57ec-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 11:01:22 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so5418200f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 02:01:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74b53cc1939sm3924657b3a.50.2025.07.03.02.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 02:01:21 -0700 (PDT)
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
X-Inumbo-ID: 4aaa6366-57ec-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751533282; x=1752138082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DKdiEvQSe7JT8LVfrVGAVJi4Nqyz0rT5cd7vd+/k820=;
        b=a4TLLzvsVbm0qiBsOMPOMpdEwPXKa4O/yNnZ8EtGKZp+S1hK2lMhg5AjukyvGlwTo+
         qZlciAvyDi4KoQNL7qOCflUdpTm2uYbGWbw5UBXMmnxrpFipahfvnWfzOItgavcaWa+V
         31JSo8vbh6M3TlRehcyJghso0Nu3EopY3mIofyQNN5V1ZgqOlMhlMc9Wi8PWPHsyXU25
         3YWzwDDuJk/nJyuRuFCks8aq+Gr3FTO8JiK8JKw/DjPuU5nEs+TeP9sUTf4Whotx64cX
         8NoY/dGzLKwTASPWl/8+xq7uSvnSlxEJdJaGwVOibfTS/+1Tsbx0U6qOG37wo0xy31qR
         h7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751533282; x=1752138082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKdiEvQSe7JT8LVfrVGAVJi4Nqyz0rT5cd7vd+/k820=;
        b=c2NyDjJhawBTOvQOCl5+I6oGCPcyFS1l9tpTHSFLvm78ZvFe/9Mhlzo4zVlrtOBCaX
         AsOVLuo6P6V5f4R4erYLEuKbtxoPx4uGF+BUwTnAFxTIToAv5aIid96CxqcTitIFQrDi
         Yw36Ntz2bU7l5kVHTuxQLf/2VbC4yKmGNh2EH7JjHtOg6zLpDbPfaDV/x2rWagIo5IHB
         tgyqzsbAbacjncaF64gr6wkP7jITIWsTVWsC7CzgWxWrLxDiR2271ZBpmd9xVF5Ba0iG
         Lh1xnOQo2N2JTAh/RGR5iLnBW1XGcI2lDTyAQjTAMAic1MYPKixPyyF0U83jLRz4kSyO
         VCrg==
X-Forwarded-Encrypted: i=1; AJvYcCW/5w8Xy2QdqkE3zOem+zqWGtLaRwF0AZGw1kGIv+3yk3HusaZIBvcGS03htOGDVj1SGMu+uqXl5Js=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYZLouesqhuN0HdLTDxqHOlh42K28DliLR5LRwqB4lFKihtnwN
	TphKBUrPaexH+jekBh4pw9JMqXisXkbx5H17qzZw6J5BJ/mnr0O8BcGdsmE8kO7SMQ==
X-Gm-Gg: ASbGncvz1e1gyw3FEPQBPZ4F40Lc9+DTzEmXoBu8N94Ponxjg4kHmCvx8+doUmo3Ib/
	kLGFzPgUPQiOjkuzY6PVlea66WYlUcj5CwlqZWjl4tRT2XtA0+za7jqwjIZAoiUm8We1Q3wovwm
	445HQ2cE4L25YC3fapKLT6U6TGa4OgEnAzbQfcnJAsgBkxB2DM5KHKrG0j/cwGXzrXvAMat6fxN
	UOLSPvPJ8tAD7Px5JqUuRFwWxaK1kji8TgGPN5JKmCKmiOs3CjxKvOfjO5WeJZ9Ua5BuhOIayPe
	VN+fGaqY9DeFWUwNq2fcshG3nPWk5o5VuxaZSIINWEZOaOG3SKHS//IEftGaQ+X20mELHqMAaxz
	zYx9wIeiRSc//7GddzqMMQLLzaaqolVk91SrfCljRFM/Wpbo=
X-Google-Smtp-Source: AGHT+IFBhmzVN6Z4eO5/EXotciSfAOZZQUYrTk4sxyKmXWEAat3W2wD/LOgWnm+/WdJx5JDnjdJ+Fw==
X-Received: by 2002:a05:6000:490a:b0:3b1:8db7:d1fc with SMTP id ffacd0b85a97d-3b1fe5c07d4mr4865300f8f.21.1751533281745;
        Thu, 03 Jul 2025 02:01:21 -0700 (PDT)
Message-ID: <0309f4d6-fa2a-4be3-a313-d6b4ebe362a2@suse.com>
Date: Thu, 3 Jul 2025 11:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250702144121.1096448-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.07.2025 16:41, Andrew Cooper wrote:
> In order elide IPIs, we must be able to identify whether a target CPU is in
> MWAIT at the point it is woken up.  i.e. the store to wake it up must also
> identify the state.
> 
> Create a new in_mwait variable beside __softirq_pending, so we can use a
> CMPXCHG to set the softirq while also observing the status safely.  Implement
> an x86 version of arch_pend_softirq() which does this.
> 
> In mwait_idle_with_hints(), advertise in_mwait, with an explanation of
> precisely what it means.  X86_BUG_MONITOR can be accounted for simply by not
> advertising in_mwait.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> This is modelled after Linux's TIF_NEED_RESCHED (single bit equivelent of all
> of __softirq_pending), and TIF_POLLING_NRFLAG (arch-neutral "in_mwait").
> 
> In Linux, they're both in the same flags field, which adds complexity.  In
> Xen, __softirq_pending is already unsigned long for everything other than x86,
> so adding an arch-neutral "in_mwait" would need wider changes.

Why would the flag need to be arch-neutral? A pretty straightforward way to
achieve what you want would seem to be to define an x86-only MWAIT_SOFTIRQ,
which we'd never raise or open, but which instead we'd advertise to common
code as an always-ignore mask (to be OR-ed in by __do_softirq()). However,
setting and clearing such a bit would of course require LOCK-ed insns,
which clearly is less desirable than the simple MOVB you're using.

> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -439,7 +439,21 @@ __initcall(cpu_idle_key_init);
>  void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>  {
>      unsigned int cpu = smp_processor_id();
> -    const unsigned int *this_softirq_pending = &softirq_pending(cpu);
> +    irq_cpustat_t *stat = &irq_stat[cpu];
> +    const unsigned int *this_softirq_pending = &stat->__softirq_pending;
> +
> +    /*
> +     * By setting in_mwait, we promise to other CPUs that we'll notice changes
> +     * to __softirq_pending without being sent an IPI.  We achieve this by
> +     * either not going to sleep, or by having hardware notice on our behalf.
> +     *
> +     * Some errata exist where MONITOR doesn't work properly, and the
> +     * workaround is to force the use of an IPI.  Cause this to happen by
> +     * simply not advertising outselves as being in_mwait.

Nit: ourselves

> +     */
> +    alternative_io("movb $1, %[in_mwait]",
> +                   "", X86_BUG_MONITOR,
> +                   [in_mwait] "=m" (stat->in_mwait));
>  
>      monitor(this_softirq_pending, 0, 0);
>      smp_mb();

Unlike alternative(), alternative_io() has no memory clobber. To the compiler
the two resulting asm() therefore have no dependency operand-wise[1]. The
sole ordering criteria then is that they're both volatile asm()-s. It not
being explicitly said (anywhere that I could find) that volatile guarantees
such ordering, I wonder if we wouldn't better have an operand-based
dependency between the two. Otoh it may well be that we rely on such ordering
elsewhere already, in which case having one more instance probably would be
okay(ish).

[1] It's actually worse than that, I think: monitor() also doesn't specify
the location as a (memory) input.

> @@ -452,6 +466,10 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>          mwait(eax, ecx);
>          spec_ctrl_exit_idle(info);
>      }
> +
> +    alternative_io("movb $0, %[in_mwait]",
> +                   "", X86_BUG_MONITOR,
> +                   [in_mwait] "=m" (stat->in_mwait));

This doesn't strictly need to be an alternative, does it? We can save a
memory write in the buggy case, but that likely makes at most a marginal
difference.

> --- a/xen/arch/x86/include/asm/hardirq.h
> +++ b/xen/arch/x86/include/asm/hardirq.h
> @@ -5,7 +5,19 @@
>  #include <xen/types.h>
>  
>  typedef struct {
> -    unsigned int __softirq_pending;
> +    /*
> +     * The layout is important.  Any CPU can set bits in __softirq_pending,
> +     * but in_mwait is a status bit owned by the CPU.  softirq_mwait_raw must
> +     * cover both, and must be in a single cacheline.
> +     */
> +    union {
> +        struct {
> +            unsigned int __softirq_pending;
> +            bool in_mwait;
> +        };
> +        uint64_t softirq_mwait_raw;
> +    };

To guard against someone changing e.g. __softirq_pending to unsigned long
while ignoring the comment, how about adding a BUILD_BUG_ON() checking both
parts of the union are the same size (which of course would require naming
either the union field within the containing struct or its struct member)?

> @@ -9,4 +11,36 @@
>  #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
>  #define NR_ARCH_SOFTIRQS       5
>  
> +/*
> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
> + * skipped, false if the IPI cannot be skipped.
> + *
> + * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
> + * set softirq @nr while also observing in_mwait in a race-free way.
> + */
> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
> +{
> +    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
> +    uint64_t old, new;
> +    unsigned int softirq = 1U << nr;
> +
> +    old = ACCESS_ONCE(*ptr);
> +
> +    do {
> +        if ( old & softirq )
> +            /* Softirq already pending, nothing to do. */
> +            return true;
> +
> +        new = old | softirq;
> +
> +    } while ( (old = cmpxchg(ptr, old, new)) != new );

Don't you mean

    } while ( (new = cmpxchg(ptr, old, new)) != old );

here (with new latched ahead of the loop and old set from new inside it),
like we have it elsewhere when we avoid the use of yet another variable,
e.g. in inc_linear_{entries,uses}()?

> +    /*
> +     * We have caused the softirq to become pending.  If in_mwait was set, the
> +     * target CPU will notice the modification and act on it.
> +     */
> +    return new & (1UL << 32);

Hmm, this requires the layout to allow for even less re-arrangement than the
comment ahead of the union says: You strictly require in_mwait to follow
__softirq_pending immediately, and the (assembly) write to strictly write 1
into the field. Could I talk you into at least

    return new & (1UL << (offsetof(..., in_mwait) * 8));

? This way the field being inspected would also be mentioned in the access
itself (i.e. become grep-able beyond the mentioning in the comment). And I
sincerely dislike hard-coded literal numbers when they (relatively) easily
can be expressed another way.

Jan


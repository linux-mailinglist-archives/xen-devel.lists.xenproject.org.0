Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26D0AF7317
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 13:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032090.1405850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXIb9-0002PO-Ce; Thu, 03 Jul 2025 11:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032090.1405850; Thu, 03 Jul 2025 11:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXIb9-0002MO-9H; Thu, 03 Jul 2025 11:59:27 +0000
Received: by outflank-mailman (input) for mailman id 1032090;
 Thu, 03 Jul 2025 11:59:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJsU=ZQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXIb7-0002MI-T4
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 11:59:25 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2994a3e9-5805-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 13:59:24 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so53943665e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 04:59:24 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52c8esm18657457f8f.55.2025.07.03.04.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 04:59:23 -0700 (PDT)
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
X-Inumbo-ID: 2994a3e9-5805-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751543964; x=1752148764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fK87uvjwxF9BMyYhHXfWZLUx1QcI5a/bmiBi9i1+MY4=;
        b=De+os/bateViFjQ9UEg79dix46Mup/YvCC8AK6HUiCuVuOkivc7kNUZh5nctaC7hYm
         udu+IktuGPQV6Kuhvl8mDeVF6r0VtkfOfgAUjc9aHVKegTpMXa5NnyZ4R1pBHJi7+r+U
         LHPqYMuUi7ckOWYcZK/zHEPXrxbmsF0kb9qx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751543964; x=1752148764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fK87uvjwxF9BMyYhHXfWZLUx1QcI5a/bmiBi9i1+MY4=;
        b=u7O3r4wYN4RoGDEImCBEauhrCp6NRv3lhnltroXdqYGzDNsuoGb/ZiDt0zrQmjfpmK
         4etAzVeSB/C2LnP6t13mVnuqfZMIQo42cJU1s8T02DaPuVzAF892ijajtZzr2AQrow5P
         Jh73CxF5rfeK7QxY5LEhivw5OMwqxn8jOlqecCXvrAF3dGujBTQ91JBTPqCBoGjjCP74
         RRWlFmm0pJpf4BIalMevls2lCgsF5Hnk261xNdJV8cMXu8e9gH5L0m2TmuFQj94+3yL/
         Ke6j6MBcfxAMZ+iWxalFk6TBkthNcRB/pmK67ksQBzCalBN+mB4A1tscKX5Uix5P3JRM
         yyCg==
X-Forwarded-Encrypted: i=1; AJvYcCUqQBEaIRQw57RQAV+s/s+LJKMeZNz9D1e7zpRIyUKasORAW0P580PpFGzqUWp+2HAcTRHRq2Y1YPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymokpjurY0GFk7Ntp+gVrbHBw2djLr8OEuikNF4BArHMt2gKBP
	c6vHySqnFx5h0VEBx381YNWYVBenje5R3QGLxmvoOH4oYuoV/Z0zLOEWRHKNuknZCE4=
X-Gm-Gg: ASbGnctnKqbPI16pv5lA0uxN29lb7EfK/9EVyl9gwwT/Lk8LExzkDtmo47U/DVwf1Yb
	XL3J8tPrdexrUymvson26EbSVd3Uv4Ml68w7f5M2xGyuBTOnXT+zkPfgau3SiDDl1SJw2egCi55
	Ev6OmfQ+PIg6oA+AJwHYyJwV+E1R/hNq/q87Md6nzrGbCUhKW1UbyQZ78TK3vEBK9J3xHDVIGXp
	P7ppgNox3/3VwiV439qQ6LAhth0mEO49JfUYQjLE5WUE401CJDVDlQrWIqs99V8Hz6I7bJYzyvI
	bTnrJhFTYfD2VHu71oo1+9D283CUWVF1UU+XcBvSHOOeZbRo0LzkOfBEKJ8LMVjoWDNkGRCIfoM
	WjXoa09wOwX5lJLM3mAHK1UpUTNA=
X-Google-Smtp-Source: AGHT+IFj35/z5IEIn4KRqBY3AH2jut9MZyyFpoWrA3NXxNQ4jsVPAwrMcw7ss72bev2skkIR4SPYdQ==
X-Received: by 2002:adf:b64d:0:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3b32ca3f422mr1840464f8f.13.1751543963765;
        Thu, 03 Jul 2025 04:59:23 -0700 (PDT)
Message-ID: <947761f1-d474-421b-ac39-6926d8fdde56@citrix.com>
Date: Thu, 3 Jul 2025 12:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-5-andrew.cooper3@citrix.com>
 <0309f4d6-fa2a-4be3-a313-d6b4ebe362a2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0309f4d6-fa2a-4be3-a313-d6b4ebe362a2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 10:01 am, Jan Beulich wrote:
> On 02.07.2025 16:41, Andrew Cooper wrote:
>> In order elide IPIs, we must be able to identify whether a target CPU is in
>> MWAIT at the point it is woken up.  i.e. the store to wake it up must also
>> identify the state.
>>
>> Create a new in_mwait variable beside __softirq_pending, so we can use a
>> CMPXCHG to set the softirq while also observing the status safely.  Implement
>> an x86 version of arch_pend_softirq() which does this.
>>
>> In mwait_idle_with_hints(), advertise in_mwait, with an explanation of
>> precisely what it means.  X86_BUG_MONITOR can be accounted for simply by not
>> advertising in_mwait.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>
>> This is modelled after Linux's TIF_NEED_RESCHED (single bit equivelent of all
>> of __softirq_pending), and TIF_POLLING_NRFLAG (arch-neutral "in_mwait").
>>
>> In Linux, they're both in the same flags field, which adds complexity.  In
>> Xen, __softirq_pending is already unsigned long for everything other than x86,
>> so adding an arch-neutral "in_mwait" would need wider changes.
> Why would the flag need to be arch-neutral?

Because it's not about mwait; it's about the ability to notice the
rising edge of TIF_NEED_RESCHED, and is implemented by more than just
x86 in Linux.

>> +     */
>> +    alternative_io("movb $1, %[in_mwait]",
>> +                   "", X86_BUG_MONITOR,
>> +                   [in_mwait] "=m" (stat->in_mwait));
>>  
>>      monitor(this_softirq_pending, 0, 0);
>>      smp_mb();
> Unlike alternative(), alternative_io() has no memory clobber. To the compiler
> the two resulting asm() therefore have no dependency operand-wise[1]. The
> sole ordering criteria then is that they're both volatile asm()-s. It not
> being explicitly said (anywhere that I could find) that volatile guarantees
> such ordering, I wonder if we wouldn't better have an operand-based
> dependency between the two. Otoh it may well be that we rely on such ordering
> elsewhere already, in which case having one more instance probably would be
> okay(ish).
>
> [1] It's actually worse than that, I think: monitor() also doesn't specify
> the location as a (memory) input.

The GCC bugzilla has plenty of statements that volatiles (which have
survived optimisation passes) can't be reordered.

>
>> @@ -452,6 +466,10 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>>          mwait(eax, ecx);
>>          spec_ctrl_exit_idle(info);
>>      }
>> +
>> +    alternative_io("movb $0, %[in_mwait]",
>> +                   "", X86_BUG_MONITOR,
>> +                   [in_mwait] "=m" (stat->in_mwait));
> This doesn't strictly need to be an alternative, does it? We can save a
> memory write in the buggy case, but that likely makes at most a marginal
> difference.

It doesn't *need* to be an alternative.  It could be:

if ( !cpu_bug_monitor )
    ACCESS_ONCE(stat->in_mwait) = true;

but getting rid of the branch is an advantage too.
>> --- a/xen/arch/x86/include/asm/hardirq.h
>> +++ b/xen/arch/x86/include/asm/hardirq.h
>> @@ -5,7 +5,19 @@
>>  #include <xen/types.h>
>>  
>>  typedef struct {
>> -    unsigned int __softirq_pending;
>> +    /*
>> +     * The layout is important.  Any CPU can set bits in __softirq_pending,
>> +     * but in_mwait is a status bit owned by the CPU.  softirq_mwait_raw must
>> +     * cover both, and must be in a single cacheline.
>> +     */
>> +    union {
>> +        struct {
>> +            unsigned int __softirq_pending;
>> +            bool in_mwait;
>> +        };
>> +        uint64_t softirq_mwait_raw;
>> +    };
> To guard against someone changing e.g. __softirq_pending to unsigned long
> while ignoring the comment, how about adding a BUILD_BUG_ON() checking both
> parts of the union are the same size (which of course would require naming
> either the union field within the containing struct or its struct member)?

That turns out to be very hard because of the definition of
softirq_pending() being common.  More below.


>
>> @@ -9,4 +11,36 @@
>>  #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
>>  #define NR_ARCH_SOFTIRQS       5
>>  
>> +/*
>> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
>> + * skipped, false if the IPI cannot be skipped.
>> + *
>> + * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
>> + * set softirq @nr while also observing in_mwait in a race-free way.
>> + */
>> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
>> +{
>> +    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
>> +    uint64_t old, new;
>> +    unsigned int softirq = 1U << nr;
>> +
>> +    old = ACCESS_ONCE(*ptr);
>> +
>> +    do {
>> +        if ( old & softirq )
>> +            /* Softirq already pending, nothing to do. */
>> +            return true;
>> +
>> +        new = old | softirq;
>> +
>> +    } while ( (old = cmpxchg(ptr, old, new)) != new );
> Don't you mean
>
>     } while ( (new = cmpxchg(ptr, old, new)) != old );
>
> here

No. I'm pretty sure I don't.

> (with new latched ahead of the loop and old set from new inside it),
> like we have it elsewhere when we avoid the use of yet another variable,
> e.g. in inc_linear_{entries,uses}()?

Eww, no.  Having new and old backwards like that is borderline
obfucation, and is unnecessary cognitive complexity for the reader.


>
>> +    /*
>> +     * We have caused the softirq to become pending.  If in_mwait was set, the
>> +     * target CPU will notice the modification and act on it.
>> +     */
>> +    return new & (1UL << 32);
> Hmm, this requires the layout to allow for even less re-arrangement than the
> comment ahead of the union says: You strictly require in_mwait to follow
> __softirq_pending immediately, and the (assembly) write to strictly write 1
> into the field. Could I talk you into at least
>
>     return new & (1UL << (offsetof(..., in_mwait) * 8));
>
> ? This way the field being inspected would also be mentioned in the access
> itself (i.e. become grep-able beyond the mentioning in the comment). And I
> sincerely dislike hard-coded literal numbers when they (relatively) easily
> can be expressed another way.

The nice way to do this would be a named union and a proper field, but
that doesn't work because of how softirq_pending() is declared.

I suppose I can use an offsetof() expression.

~Andrew


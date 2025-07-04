Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFDCAF97A2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 18:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033502.1406848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXj2g-0001cB-6u; Fri, 04 Jul 2025 16:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033502.1406848; Fri, 04 Jul 2025 16:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXj2g-0001aj-39; Fri, 04 Jul 2025 16:13:38 +0000
Received: by outflank-mailman (input) for mailman id 1033502;
 Fri, 04 Jul 2025 16:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCR=ZR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXj2d-0001ac-Vw
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 16:13:35 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4a4be0c-58f1-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 18:13:32 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so787653f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 09:13:32 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285c903sm2883324f8f.90.2025.07.04.09.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 09:13:31 -0700 (PDT)
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
X-Inumbo-ID: d4a4be0c-58f1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751645612; x=1752250412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XHi+xSjzKKOxYeAo7CW51o/GktjWlBLPZ+FMBQ23JU8=;
        b=uXtVSglW/yYQPTXbZ8J5w2mwPxSMhhnAHkXq+gs3n0qde+GzoeV9K/CvEUi+3sLdeD
         BtOvB/+GU2a6ObUhSO3Shv5ttKdLwzeEW9Rx8DjuQX3YYCMf96FENqAIMtCSnOT4gE3c
         b7c6PvjqstPimn6rfE/5OKj2ojLV/LLduX3GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645612; x=1752250412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHi+xSjzKKOxYeAo7CW51o/GktjWlBLPZ+FMBQ23JU8=;
        b=lIRkUirU7bfoWv++fTrJdesRrHrAK2xEGWLZjDzFVAlIy/ZPwbwSxweuL7fztEPrZU
         f/5RsqUe+srklIbYYQqQ4eADXaBsqIhX2/2ohAAmW64sxvQvKioD4v41CSloSJHpxowF
         OhmVRR0DhfX7qtNw3MH67jwW/5mXK6UhRhppws/+wF1In7OOJRcGFajh3wEogAjUCcmy
         HYALovOJC1lqtH26kxsvVBT60NiZIajaFYUwwGnYHqYkgEYTEpJ+iED2sqlKx6kAlwUf
         V+rOZrrAZ63mgGUEFYqK7K6ASVFoNYmMgKfbJmksnuyUdmDhTR/tiMdtElqXdOpTTOLi
         kQYA==
X-Gm-Message-State: AOJu0YyVfJ1YinWuzDD2lLQmidmVWag9xKVmz+AKItpFiy1fx8RFXSRD
	HpZIj1Z1IFHbWLrw2exagqPzLaapUBQ/hIEsCKIRr1JR83fYA6RblCJlkE55k5SFVc8=
X-Gm-Gg: ASbGncvnzyiY/NQ1PmBvdBO+la74FosuB8ILTdtCKKfJ+PUZ7j6QZp6vNJnh3bfFi/v
	DqB7n55Wj7uNQGWlFZtrEFkohZdcM+91pUlU29gJDQDFVcnCSI+PvxTkojmyEVmH0EI2b7h5JC1
	1oEk8/MaqAEdh+QXI0ocgUTRxD8aukJedJ+RNjTL1kRlXQXQgnPfpv6YMGXP2NuLVxpX3u8lwxY
	wBKQixxwjyPI/HL+HPVkY/3NoWOf+fxv45D3UK3xe+TQ/JANCAt1sd5gjE+3O1KVFyIZF+vl+fF
	87jjnI/v/IPOFHBb4SDFvmSKCuDGCf4FajG/IYl5QxPAqTUqP/Ek6fw0c8xUtQu38O8Ky41yVyA
	E/2FGEvSYz82zpIRvkIC8slZlj7k=
X-Google-Smtp-Source: AGHT+IFxWkbRQ8wGo8fEadFJxEiW9vf8ohzZME0k6Hbh0UZVtT0HavgrMv6X2ZvF5S8zJdBlE9ksVQ==
X-Received: by 2002:a05:6000:4911:b0:3a5:2915:ed68 with SMTP id ffacd0b85a97d-3b495ccbb9emr2884812f8f.28.1751645612116;
        Fri, 04 Jul 2025 09:13:32 -0700 (PDT)
Message-ID: <db1705b8-b110-4450-97a3-f286a81c12ac@citrix.com>
Date: Fri, 4 Jul 2025 17:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-5-andrew.cooper3@citrix.com>
 <aGaxeQanRmfJg8nF@macbook.local>
 <7d51879c-87c8-4e36-a7d7-66ba02ef2886@citrix.com>
 <aGeBlmi7-KX8gF7X@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aGeBlmi7-KX8gF7X@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/07/2025 8:24 am, Roger Pau Monné wrote:
> On Thu, Jul 03, 2025 at 06:48:23PM +0100, Andrew Cooper wrote:
>> On 03/07/2025 5:36 pm, Roger Pau Monné wrote:
>>> On Wed, Jul 02, 2025 at 03:41:19PM +0100, Andrew Cooper wrote:
>>>> In order elide IPIs, we must be able to identify whether a target CPU is in
>>>> MWAIT at the point it is woken up.  i.e. the store to wake it up must also
>>>> identify the state.
>>>>
>>>> Create a new in_mwait variable beside __softirq_pending, so we can use a
>>>> CMPXCHG to set the softirq while also observing the status safely.  Implement
>>>> an x86 version of arch_pend_softirq() which does this.
>>>>
>>>> In mwait_idle_with_hints(), advertise in_mwait, with an explanation of
>>>> precisely what it means.  X86_BUG_MONITOR can be accounted for simply by not
>>>> advertising in_mwait.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>> CC: Julien Grall <julien@xen.org>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>>
>>>> This is modelled after Linux's TIF_NEED_RESCHED (single bit equivelent of all
>>>> of __softirq_pending), and TIF_POLLING_NRFLAG (arch-neutral "in_mwait").
>>>>
>>>> In Linux, they're both in the same flags field, which adds complexity.  In
>>>> Xen, __softirq_pending is already unsigned long for everything other than x86,
>>>> so adding an arch-neutral "in_mwait" would need wider changes.
>>>> ---
>>>>  xen/arch/x86/acpi/cpu_idle.c       | 20 +++++++++++++++++-
>>>>  xen/arch/x86/include/asm/hardirq.h | 14 +++++++++++-
>>>>  xen/arch/x86/include/asm/softirq.h | 34 ++++++++++++++++++++++++++++++
>>>>  3 files changed, 66 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
>>>> index caa0fef0b3b1..13040ef467a0 100644
>>>> --- a/xen/arch/x86/acpi/cpu_idle.c
>>>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>>>> @@ -439,7 +439,21 @@ __initcall(cpu_idle_key_init);
>>>>  void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>>>>  {
>>>>      unsigned int cpu = smp_processor_id();
>>>> -    const unsigned int *this_softirq_pending = &softirq_pending(cpu);
>>>> +    irq_cpustat_t *stat = &irq_stat[cpu];
>>>> +    const unsigned int *this_softirq_pending = &stat->__softirq_pending;
>>>> +
>>>> +    /*
>>>> +     * By setting in_mwait, we promise to other CPUs that we'll notice changes
>>>> +     * to __softirq_pending without being sent an IPI.  We achieve this by
>>>> +     * either not going to sleep, or by having hardware notice on our behalf.
>>>> +     *
>>>> +     * Some errata exist where MONITOR doesn't work properly, and the
>>>> +     * workaround is to force the use of an IPI.  Cause this to happen by
>>>> +     * simply not advertising outselves as being in_mwait.
>>>> +     */
>>>> +    alternative_io("movb $1, %[in_mwait]",
>>>> +                   "", X86_BUG_MONITOR,
>>>> +                   [in_mwait] "=m" (stat->in_mwait));
>>>>  
>>>>      monitor(this_softirq_pending, 0, 0);
>>>>      smp_mb();
>>>> @@ -452,6 +466,10 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>>>>          mwait(eax, ecx);
>>>>          spec_ctrl_exit_idle(info);
>>>>      }
>>>> +
>>>> +    alternative_io("movb $0, %[in_mwait]",
>>>> +                   "", X86_BUG_MONITOR,
>>>> +                   [in_mwait] "=m" (stat->in_mwait));
>>> Isn't it a bit overkill to use alternatives here when you could have a
>>> conditional based on a global variable to decide whether to set/clear
>>> in_mwait?
>> I view it differently.  Why should the common case suffer overhead
>> (extra memory read and conditional branch) to work around 3 buggy pieces
>> of hardware in a common path?
> TBH I don't think the extra read and conditional would make any
> difference in this specific path performance wise.  Either the CPU is
> going to sleep and has nothing to do, or the cost of getting back from
> idle will shadow the overhead of an extra read and conditional.
>
> It's all a question of taste I guess.  If it was me I would set/clear
> stat->in_mwait unconditionally in mwait_idle_with_hints(), and then in
> arch_pend_softirq() I would return:
>
> return new & (1UL << 32) || force_mwait_ipi_wakeup;
>
> Or AFAICT you could possibly skip the cmpxchg() in the
> force_mwait_ipi_wakeup case in arch_pend_softirq(), and just do:
>
> if ( force_mwait_ipi_wakeup )
>     return test_and_set_bit(nr, &softirq_pending(cpu));
>
> Because in that case Xen doesn't care about the in_mwait status.  It
> would be an optimization for the buggy hardware that already has to
> deal with the extra cost of always sending an IPI.

These will both function, but they're both poor options.

They're in a loop over a cpumask, and because of the full barriers in
the atomic options, the read cannot be hoisted or the loop split,
because the compiler has been told "the value may change on each loop
iteration".


This was a code-gen/perf note I had on your original errata fix, which I
said "lets fix later".  Later is now.

The other part of the fix is arch_pend_softirq() is static inline, and
not out-of-line in a separate TU.
>>>> +        };
>>>> +        uint64_t softirq_mwait_raw;
>>>> +    };
>>> This could be a named union type ...
>>>
>>>> +
>>>>      unsigned int __local_irq_count;
>>>>      unsigned int nmi_count;
>>>>      unsigned int mce_count;
>>>> diff --git a/xen/arch/x86/include/asm/softirq.h b/xen/arch/x86/include/asm/softirq.h
>>>> index e4b194f069fb..069e5716a68d 100644
>>>> --- a/xen/arch/x86/include/asm/softirq.h
>>>> +++ b/xen/arch/x86/include/asm/softirq.h
>>>> @@ -1,6 +1,8 @@
>>>>  #ifndef __ASM_SOFTIRQ_H__
>>>>  #define __ASM_SOFTIRQ_H__
>>>>  
>>>> +#include <asm/system.h>
>>>> +
>>>>  #define NMI_SOFTIRQ            (NR_COMMON_SOFTIRQS + 0)
>>>>  #define TIME_CALIBRATE_SOFTIRQ (NR_COMMON_SOFTIRQS + 1)
>>>>  #define VCPU_KICK_SOFTIRQ      (NR_COMMON_SOFTIRQS + 2)
>>>> @@ -9,4 +11,36 @@
>>>>  #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
>>>>  #define NR_ARCH_SOFTIRQS       5
>>>>  
>>>> +/*
>>>> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
>>>> + * skipped, false if the IPI cannot be skipped.
>>>> + *
>>>> + * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
>>>> + * set softirq @nr while also observing in_mwait in a race-free way.
>>>> + */
>>>> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
>>>> +{
>>>> +    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
>>>> +    uint64_t old, new;
>>> ... so that you also use it here?
>> No, it cant.  The of softirq_pending() in common code requires no
>> intermediate field names, and I'm not untangling that mess in a series
>> wanting backporting.
> Oh, I see.  Never mind then, something for a later cleanup if
> anything.

Yeah, I've got further cleanup pending, although I don't have a good fix
for this specifically.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91C4AF8932
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032896.1406317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXamM-0003hO-GO; Fri, 04 Jul 2025 07:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032896.1406317; Fri, 04 Jul 2025 07:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXamM-0003ft-D4; Fri, 04 Jul 2025 07:24:14 +0000
Received: by outflank-mailman (input) for mailman id 1032896;
 Fri, 04 Jul 2025 07:24:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9FN=ZR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uXamL-0003MK-Lz
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:24:13 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfc08c03-58a7-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 09:24:08 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso295785f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 00:24:08 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-454a9bced0esm47250045e9.22.2025.07.04.00.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 00:24:07 -0700 (PDT)
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
X-Inumbo-ID: dfc08c03-58a7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751613848; x=1752218648; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fNhFYdRGgqAezfitmJTBc7npDQaLqk4q1yqEepDzOwY=;
        b=n9f7dr4Z47nxK+0YzK54s0NYqC69CZFcYT82grE2lFhe1zmM96+PQ4eIi3nMGyXHjV
         5AHxG/iUl5GW1Q1cZVh0PG8g2zDl4aqmcgxzbT4YVH+X46jneYGjQTqOr3fPbA3PeSyM
         ZbfuA9dvboD2aNsN0QVBCCaSp4fnrKvSK87bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613848; x=1752218648;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNhFYdRGgqAezfitmJTBc7npDQaLqk4q1yqEepDzOwY=;
        b=p1QyWk7zCljHZCPPM5Kd+qkPSICSW0Ob19MpCtaQ+gQ7QyyIHvUv82jMvxZ66gB3hA
         03keLdPjeDNE+IF7WMiXkhfW0qXphE6DLr5S7itz7LT+lVKquHiYiKVrALg0yADi4l0c
         Bn4KZw9NTdiyYn8RatP15xJpk86VidMi35GKZCQWxj02cyGVulHr6oMfzxVMNY53AwQ9
         73IbQ7v8Rm3FTvt778cSHF+3ZET1d7H8RDZa51I6KkGUMU8hZ82bXEYpXRqsdrVkmGSB
         LlXFxMkwVVPDxpY2i1DB4W3gOG2gsEyFglLuSxqky4w9Q3toqsAHLOeBkgxH5IxBQ3iX
         IQrA==
X-Gm-Message-State: AOJu0Yw2+VE5mPbf7QAxc5LtCTqjguIA34g3JboT0TFui10Y5YdABQTh
	FBW/AS5Y9rkOfWPbTPKGokyLHaVHSMDsCKDuPNXr1fCHPT3p7Lcf9ix+kmatIhs7StI=
X-Gm-Gg: ASbGnctCQA1aNg2GlMg18wAh+WkXj2La2SGVKYEbMoMoNTt2GOB8LYDCqS7F6Hsbjqw
	qrT3CNMRbfaBdVmLnrZPnlKOjJhOlyVoW8ff1jF+uStuPofJ72Sx6L4SrPCj7He66YjDuN3wyP7
	ZoUyPhLO55b6T5GICRoIojUuKtxcUvZrGsg+b8TLWmLRE3Vuw5TF5DJJBtswwqTA+L6O0sCQWK1
	fj7/22WVEqdR0tfms3uMNdoz2nCUjzaJrdZw0ByMhSuwblNKTYMDyciR3TCLiTgwAeCqwJS2adw
	YTxD1oiM98JjD5N5JRz1AXHbeG04Kh8AU5lwUPgUctesFS31uZ7tTtm3a2K8vvzF0O1TqdP4WTr
	7y4rkOcoznvZKbLrKdw7CTiGXkQD3ag==
X-Google-Smtp-Source: AGHT+IFqk/2D3rImQ1TbfH5XPQ8ZJlLxvWHsjx6XWU1Q7zrt0lEKrcYMTxzht+DlRbpJ8c7KIU7Tyw==
X-Received: by 2002:a05:6000:3106:b0:3a5:2cf3:d6af with SMTP id ffacd0b85a97d-3b4964f7b11mr1043217f8f.45.1751613847813;
        Fri, 04 Jul 2025 00:24:07 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:24:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
Message-ID: <aGeBlmi7-KX8gF7X@macbook.local>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-5-andrew.cooper3@citrix.com>
 <aGaxeQanRmfJg8nF@macbook.local>
 <7d51879c-87c8-4e36-a7d7-66ba02ef2886@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d51879c-87c8-4e36-a7d7-66ba02ef2886@citrix.com>

On Thu, Jul 03, 2025 at 06:48:23PM +0100, Andrew Cooper wrote:
> On 03/07/2025 5:36 pm, Roger Pau Monné wrote:
> > On Wed, Jul 02, 2025 at 03:41:19PM +0100, Andrew Cooper wrote:
> >> In order elide IPIs, we must be able to identify whether a target CPU is in
> >> MWAIT at the point it is woken up.  i.e. the store to wake it up must also
> >> identify the state.
> >>
> >> Create a new in_mwait variable beside __softirq_pending, so we can use a
> >> CMPXCHG to set the softirq while also observing the status safely.  Implement
> >> an x86 version of arch_pend_softirq() which does this.
> >>
> >> In mwait_idle_with_hints(), advertise in_mwait, with an explanation of
> >> precisely what it means.  X86_BUG_MONITOR can be accounted for simply by not
> >> advertising in_mwait.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Anthony PERARD <anthony.perard@vates.tech>
> >> CC: Michal Orzel <michal.orzel@amd.com>
> >> CC: Julien Grall <julien@xen.org>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >>
> >> This is modelled after Linux's TIF_NEED_RESCHED (single bit equivelent of all
> >> of __softirq_pending), and TIF_POLLING_NRFLAG (arch-neutral "in_mwait").
> >>
> >> In Linux, they're both in the same flags field, which adds complexity.  In
> >> Xen, __softirq_pending is already unsigned long for everything other than x86,
> >> so adding an arch-neutral "in_mwait" would need wider changes.
> >> ---
> >>  xen/arch/x86/acpi/cpu_idle.c       | 20 +++++++++++++++++-
> >>  xen/arch/x86/include/asm/hardirq.h | 14 +++++++++++-
> >>  xen/arch/x86/include/asm/softirq.h | 34 ++++++++++++++++++++++++++++++
> >>  3 files changed, 66 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> >> index caa0fef0b3b1..13040ef467a0 100644
> >> --- a/xen/arch/x86/acpi/cpu_idle.c
> >> +++ b/xen/arch/x86/acpi/cpu_idle.c
> >> @@ -439,7 +439,21 @@ __initcall(cpu_idle_key_init);
> >>  void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
> >>  {
> >>      unsigned int cpu = smp_processor_id();
> >> -    const unsigned int *this_softirq_pending = &softirq_pending(cpu);
> >> +    irq_cpustat_t *stat = &irq_stat[cpu];
> >> +    const unsigned int *this_softirq_pending = &stat->__softirq_pending;
> >> +
> >> +    /*
> >> +     * By setting in_mwait, we promise to other CPUs that we'll notice changes
> >> +     * to __softirq_pending without being sent an IPI.  We achieve this by
> >> +     * either not going to sleep, or by having hardware notice on our behalf.
> >> +     *
> >> +     * Some errata exist where MONITOR doesn't work properly, and the
> >> +     * workaround is to force the use of an IPI.  Cause this to happen by
> >> +     * simply not advertising outselves as being in_mwait.
> >> +     */
> >> +    alternative_io("movb $1, %[in_mwait]",
> >> +                   "", X86_BUG_MONITOR,
> >> +                   [in_mwait] "=m" (stat->in_mwait));
> >>  
> >>      monitor(this_softirq_pending, 0, 0);
> >>      smp_mb();
> >> @@ -452,6 +466,10 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
> >>          mwait(eax, ecx);
> >>          spec_ctrl_exit_idle(info);
> >>      }
> >> +
> >> +    alternative_io("movb $0, %[in_mwait]",
> >> +                   "", X86_BUG_MONITOR,
> >> +                   [in_mwait] "=m" (stat->in_mwait));
> > Isn't it a bit overkill to use alternatives here when you could have a
> > conditional based on a global variable to decide whether to set/clear
> > in_mwait?
> 
> I view it differently.  Why should the common case suffer overhead
> (extra memory read and conditional branch) to work around 3 buggy pieces
> of hardware in a common path?

TBH I don't think the extra read and conditional would make any
difference in this specific path performance wise.  Either the CPU is
going to sleep and has nothing to do, or the cost of getting back from
idle will shadow the overhead of an extra read and conditional.

It's all a question of taste I guess.  If it was me I would set/clear
stat->in_mwait unconditionally in mwait_idle_with_hints(), and then in
arch_pend_softirq() I would return:

return new & (1UL << 32) || force_mwait_ipi_wakeup;

Or AFAICT you could possibly skip the cmpxchg() in the
force_mwait_ipi_wakeup case in arch_pend_softirq(), and just do:

if ( force_mwait_ipi_wakeup )
    return test_and_set_bit(nr, &softirq_pending(cpu));

Because in that case Xen doesn't care about the in_mwait status.  It
would be an optimization for the buggy hardware that already has to
deal with the extra cost of always sending an IPI.

> >> +        };
> >> +        uint64_t softirq_mwait_raw;
> >> +    };
> > This could be a named union type ...
> >
> >> +
> >>      unsigned int __local_irq_count;
> >>      unsigned int nmi_count;
> >>      unsigned int mce_count;
> >> diff --git a/xen/arch/x86/include/asm/softirq.h b/xen/arch/x86/include/asm/softirq.h
> >> index e4b194f069fb..069e5716a68d 100644
> >> --- a/xen/arch/x86/include/asm/softirq.h
> >> +++ b/xen/arch/x86/include/asm/softirq.h
> >> @@ -1,6 +1,8 @@
> >>  #ifndef __ASM_SOFTIRQ_H__
> >>  #define __ASM_SOFTIRQ_H__
> >>  
> >> +#include <asm/system.h>
> >> +
> >>  #define NMI_SOFTIRQ            (NR_COMMON_SOFTIRQS + 0)
> >>  #define TIME_CALIBRATE_SOFTIRQ (NR_COMMON_SOFTIRQS + 1)
> >>  #define VCPU_KICK_SOFTIRQ      (NR_COMMON_SOFTIRQS + 2)
> >> @@ -9,4 +11,36 @@
> >>  #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
> >>  #define NR_ARCH_SOFTIRQS       5
> >>  
> >> +/*
> >> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
> >> + * skipped, false if the IPI cannot be skipped.
> >> + *
> >> + * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
> >> + * set softirq @nr while also observing in_mwait in a race-free way.
> >> + */
> >> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
> >> +{
> >> +    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
> >> +    uint64_t old, new;
> > ... so that you also use it here?
> 
> No, it cant.  The of softirq_pending() in common code requires no
> intermediate field names, and I'm not untangling that mess in a series
> wanting backporting.

Oh, I see.  Never mind then, something for a later cleanup if
anything.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527E1D129CB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 13:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200203.1516204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfHMU-0001zw-SY; Mon, 12 Jan 2026 12:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200203.1516204; Mon, 12 Jan 2026 12:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfHMU-0001wt-NG; Mon, 12 Jan 2026 12:49:34 +0000
Received: by outflank-mailman (input) for mailman id 1200203;
 Mon, 12 Jan 2026 12:49:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvYd=7R=gmail.com=akmarkov45@srs-se1.protection.inumbo.net>)
 id 1vfHMS-0001i6-NF
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 12:49:32 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2216c733-efb5-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 13:49:29 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-34f2a0c4574so4918506a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 04:49:29 -0800 (PST)
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
X-Inumbo-ID: 2216c733-efb5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768222168; x=1768826968; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4OuE4gLYnwfBXsvLGWtR4uU8s4Prde5wsYcTBvDjBzo=;
        b=calBBLOVI8eupJxY1fPWN3zQyi/9YfZxCvYq2GgV1OULarqNaGYxNO27YX6E7U/839
         lm5umQDy+7RLpnDQ7D+oUF2gZ6uaIBG3gnetm0NkgyyQta9TV9T8WPe0d1yv77IbfYRj
         Ze/9bsBVN1Fx1bpYk4SY/9Eelr0HCGakITm26Ua6cw0ntx8B1mjR3BwzNVgQAo407mEm
         tOZFgL1D1TuaZvI3GJABpSJ8yTUM14bG+BzM9VwrPghS6Vc7v6LXjEwmo4OODt0HwDom
         VF2u5a4jrfi3MCTDfTfNXRoejwDKLs8vAul7CVtVTVzWFBMjh5+Cxeiuy9G+714E01ib
         DyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222168; x=1768826968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OuE4gLYnwfBXsvLGWtR4uU8s4Prde5wsYcTBvDjBzo=;
        b=hBhzApo/gfkSHo7rkdYKQK9zKDvE8OGGOCLazBsouMgeNjMQZUuThdVplvbthlT/dG
         tmdTKfmwZcwWn42iBW6ctzvYJV3kLq7s/PfB/SmU4eGmqZ9ascYinF3Aym0LjCWcITGp
         Li1lQOJqrT783VeopiupYC7gc6Lyo6jCuIwCmWx0IkXyefFucrPbPSecm70jB4V184n9
         pqssMZY+IFS0bcFXrUPiPV6Zlw5UxTWUg1rg0obdIU/cvMp3jQLMqQhdY23zPqfPLWAr
         B7+VbgI1Gkjnk94Y8NejVlaUyOnxoTRYPHu8aN6fLqK6z96vQd8VTG9C51zqlHXaWr1R
         ZJvw==
X-Forwarded-Encrypted: i=1; AJvYcCUFi7LPos3HKMK/44I+BeR1qOOQ2FbBPh02/FgBwehKpOZaYr13CzLWvrMNed1mJcB+ItUT5h2/e3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSPqkURjkaWmLAWAscwt2wS6+eBsD6W2R/jq1LH4u6SyCjnwMM
	2zfR3+Y+bXMk0tJIrKi7HW4qtwpeNOhCcjxNMLvzrgBjqmU5Xy0MpiLZZz+NPDu48/NKQHoRcBW
	V/uAsZLvQtfejt0Nc1ICUXyYLf1kf8p4=
X-Gm-Gg: AY/fxX54fuTaTfF7hJ9xKBswYy/sh9Rpn9slT9XvxIp3CgeWv3GTdrHOUxVtCby4cTz
	i2ZKj2PYHGEr9lsRAWESfKOWi9Js0wtz99/I3EIXHZ39vQwEAQYg3zmf3VV25rZN+2RIfxcw+lr
	KJJJl1kWf35Qn70xLOsuI3YZVOvhWAyClnfSkhjB4MEpkRfCN+KwzO26KoV3LjjUehBc2f1O88M
	3dexFhrenJJ10ktlGFIcFZTZsQ1Sx7vmptM2Tw1CBbFrY5RF4ptW/C3H85BIlCVldPpYoGg
X-Google-Smtp-Source: AGHT+IFfRLJVaTNc81g1dnaKL8Ft+AbtVGjwJirVENjf2LIZ3y31NgOXlAlG7qZthXFabJIY7kwA6VfMgXIW6MXgyDc=
X-Received: by 2002:a17:90b:2b8f:b0:33b:b020:597a with SMTP id
 98e67ed59e1d1-34f68a73087mr14784863a91.0.1768222168049; Mon, 12 Jan 2026
 04:49:28 -0800 (PST)
MIME-Version: 1.0
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com> <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
 <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com> <CACQYvN-fiATs2dtdboYxCreF8kF5RsgoH-zgWtQ59iVNOT_wVg@mail.gmail.com>
 <CACQYvN_JbPs9TAs4GYO3myVbehwU9Zz_BhQqj1jVT2Sfg30qUQ@mail.gmail.com> <4b03cf36-d2d8-420c-82df-55d6a9ac9d68@suse.com>
In-Reply-To: <4b03cf36-d2d8-420c-82df-55d6a9ac9d68@suse.com>
From: Anton Markov <akmarkov45@gmail.com>
Date: Mon, 12 Jan 2026 15:49:17 +0300
X-Gm-Features: AZwV_QhjKwbyF1nQXXBzLkOuqSS0nHfHtSQblLG2KdQkJhgvHZykhM-heiejtI4
Message-ID: <CACQYvN9cLwXy=rtYgEyTUsqxCYvP0-qFsEW=y8B3Fo9mauNx-g@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in get_s_time_fixed()
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000035eda40648304e7a"

--00000000000035eda40648304e7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Btw, your prior response was too hard to properly read, due to excess bla=
nk
> lines with at the same time squashed leading blanks. Together with your
> apparent inability to avoid top-posting, I think you really want to adjus=
t
> your mail program's configuration.

I suggest we skip the discussion of formatting and the number of spaces in
messages and instead focus on the topic of the thread. I have a very
difficult time troubleshooting difficult-to-reproduce bugs, and the fact
that their descriptions are difficult to read due to the number of spaces
is probably the least of the difficulties.

That invocation of get_s_time_fixed() reduces to scale_delta() (without
> further rdtsc_ordered()), as non-zero at_tsc is passed in all cases. IOW
> it's not quite clear to me what change you are suggesting (that would
> actually make a functional difference).

Replacing get_s_time_fixed with scale_delta will remove the calculation
dependency on the previous local_stime value, which accumulates lag between
cores. This is because: rdtsc_ordered is not called synchronously on the
cores, but by the difference offset by the ipi speed. Therefore, we get:

core0: current_rdtsc;
core1: current_rdtsc + ipi speed;
coreN: current_rdtsc + ipi speed * N;

Since ipi values are sent alternately in a loop to core0, in the version
with get_s_time_fixed, we get the following local_stime calculation format.

coreN: local_stime =3D local_stime + scale_delta((current_rdtsc + (ipi_spee=
d
* N)) =E2=80=93 local_rdtsc);

This means the time on each core will differ by ipi_speed * N. And since
we're using the values of the previous local_stime, the difference will
accumulate because the previous local_stime was also offset. In the version
with scale_delta, we get:

coreN: local_stime =3D scale_delta(current_rdtsc + (ipi_speed * N));

This means there will still be a difference, but it won't accumulate, and
the offsets will remain within normal limits.

If it's still unclear: If your local_stime in get_s_time_fixed is offset
relative to other cores, then the fact that rdtsc_ordered and local_tsc are
not offset doesn't change anything, since you're using the delta relative
to local_stime.

core0_local_stime + (rdtsc_ordered() - local_tsc) !=3D core1_local_stime +
(rdtsc_ordered() - local_tsc); // Even if rdtsc_ordered() and local_tsc are
equal across cores.

On 96-core configurations, up to a millisecond of latency can accumulate in
local_stime over a week of operation, and this is a significant
difference. This
is due to the fact that I use cpufreq=3Dxen:performance max_cstate=3D1 ,
meaning that in my configuration, local_stime is never overwritten by
master_stime.

Thanks.

On Mon, Jan 12, 2026 at 2:45=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 12.01.2026 11:31, Anton Markov wrote:
> > Bit rounding isn't the main issue; the difference in ipi delivery to th=
e
> > cores accumulates due to the ordering. Replacing get_s_time_fixed with
> > scale_delta in time_calibration_rendezvous_tail should be sufficient.
> This
> > configuration won't accumulate errors, but bit rounding can still cause=
 a
> > significant difference from calibration to calibration, but it's not as
> > significant.
>
> That invocation of get_s_time_fixed() reduces to scale_delta() (without
> further rdtsc_ordered()), as non-zero at_tsc is passed in all cases. IOW
> it's not quite clear to me what change you are suggesting (that would
> actually make a functional difference).
>
> Btw, your prior response was too hard to properly read, due to excess bla=
nk
> lines with at the same time squashed leading blanks. Together with your
> apparent inability to avoid top-posting, I think you really want to adjus=
t
> your mail program's configuration.
>
> Jan
>
> > On Fri, Jan 9, 2026 at 7:11=E2=80=AFPM Anton Markov <akmarkov45@gmail.c=
om>
> wrote:
> >
> >> You're right. These aren't interrupts in get_s_time_fixed, but rather =
a
> >> cumulative error in the sequence due to integer rounding. I added
> logging
> >> of the current local_stime to local_time_calibration and noticed that
> the
> >> timestamp between cores is gradually increasing. If the server has bee=
n
> >> running for weeks, this could be a very large value.
> >>
> >>
> >> ```
> >>
> >> @@ -1732,6 +1753,8 @@ static void cf_check local_time_calibration(void=
)
> >>
> >> if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) )
> >>
> >> {
> >>
> >> /* Atomically read cpu_calibration struct and write cpu_time struct. *=
/
> >>
> >> + printk("update stime on time calibrate %d, %lu -> %lu (%lu, %lu)\n",
> >> smp_processor_id(), t->stamp.local_stime, c->local_stime,
> >>
> >> + t->last_seen_ns, t->last_seen_tsc);
> >>
> >> local_irq_disable();
> >>
> >> t->stamp =3D *c;
> >>
> >> local_irq_enable();
> >>
> >> ```
> >>
> >>
> >> 2 hours of work:
> >>
> >>
> >> ```
> >>
> >> (XEN) update stime on time calibrate 0, 8564145820102 -> 8565145861597
> >> (8565145862216, 0)
> >>
> >> (XEN) update stime on time calibrate 1, 8564145820129 -> 8565145861609
> >> (8565145863957, 0)
> >>
> >> (XEN) update stime on time calibrate 3, 8564145819996 -> 8565145861491
> >> (8565145864800, 0)
> >>
> >> (XEN) update stime on time calibrate 2, 8564145820099 -> 8565145861609
> >> (8565145865372, 0)
> >>
> >>
> >> 8565145861609 - 8565145861491 =3D 115 * 3 (3.00 GHz) =3D 345 lag
> >>
> >> ```
> >>
> >>
> >> 6 hours of work:
> >>
> >> ```
> >>
> >> (XEN) update stime on time calibrate 0, 22914730829200 -> 229157308699=
93
> >> (22915730870665, 0)
> >>
> >> (XEN) update stime on time calibrate 1, 22914730829073 -> 229157308698=
89
> >> (22915730870693, 0)
> >>
> >> (XEN) update stime on time calibrate 2, 22914730829052 -> 229157308698=
41
> >> (22915730872231, 0)
> >>
> >> (XEN) update stime on time calibrate 3, 22914730828892 -> 229157308696=
96
> >> (22915730872096, 0)
> >>
> >>
> >> 22915730869993 - 22915730869696 =3D 297 * 3 (3.00 GHz) =3D 891 lag
> >>
> >> ```
> >>
> >>
> >> Clarification, according to my xen settings:
> >>
> >> ```
> >>
> >> ucode=3Dscan dom0_mem=3D53923M,max:53923M dom0_max_vcpus=3D4-96
> dom0_vcpus_pin=3D0
> >> force-ept=3D1 ept=3Dno-ad,no-pml hap_1gb=3D0 hap_2mb=3D0 altp2m=3D1
> >> hpet=3Dlegacy-replacement smt=3D1 spec-ctrl=3Dno gnttab_max_frames=3D5=
12
> >> cpufreq=3Dxen:performance max_cstate=3D1 sched=3Dcredit sched-gran=3Dc=
pu apicv=3D0
> >> sched_credit_tslice_ms=3D5 sched_ratelimit_us=3D500
> >>
> >> ```
> >>
> >>
> >> Processors I tested on:
> >>
> >>
> >> ```
> >>
> >> Intel(R) Core(TM) i5-3330 CPU @ 3.00GHz
> >>
> >>
> >> Flags: fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush acpi m=
mx
> >> fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nopl
> >> nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 cx16
> >> sse4_1 sse4_2 popcnt aes xsave avx f16c hypervisor lahf_lm cpuid_fault
> >> fsgsbase erms xsaveopt arch_capabilities
> >>
> >> ```
> >>
> >> ```
> >>
> >> Intel(R) Xeon(R) Gold 5318Y CPU @ 2.10GHz x2 (NUMA)
> >>
> >>
> >> Flags: fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush acpi m=
mx
> >> fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nopl
> >> nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 fma
> cx16
> >> sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_l=
m
> abm
> >> 3dnowprefetch cpuid_fault ibpb fsgsbase bmi1 avx2 bmi2 erms rtm avx512=
f
> >> avx512dq rdseed adx avx512ifma clflushopt clwb avx512cd sha_ni avx512b=
w
> >> avx512vl xsaveopt xsavec xgetbv1 avx512vbmi avx512_vbmi2 gfni vaes
> >> vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid fsrm
> md_clear
> >> arch_capabilities
> >>
> >> ```
> >>
> >>
> >> Next I moved the code to r3 to speed up playback:
> >>
> >>
> >> ```
> >>
> >> #include <stdint.h>
> >>
> >> #include <stdio.h>
> >>
> >>
> >> static __inline__ unsigned long long rdtsc(void)
> >>
> >> {
> >>
> >> unsigned hi, lo;
> >>
> >> __asm__ __volatile__ ("rdtsc" : "=3Da"(lo), "=3Dd"(hi));
> >>
> >> return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
> >>
> >> }
> >>
> >>
> >> #define MILLISECS(_ms) ((int64_t)((_ms) * 1000000ULL))
> >>
> >>
> >> struct cpu_time_stamp {
> >>
> >> uint64_t local_tsc;
> >>
> >> int64_t local_stime;
> >>
> >> int64_t master_stime;
> >>
> >> };
> >>
> >>
> >> struct time_scale {
> >>
> >> int shift;
> >>
> >> uint32_t mul_frac;
> >>
> >> };
> >>
> >>
> >>
> >> static inline uint32_t div_frac(uint32_t dividend, uint32_t divisor)
> >>
> >> {
> >>
> >> uint32_t quotient, remainder;
> >>
> >> asm (
> >>
> >> "divl %4"
> >>
> >> : "=3Da" (quotient), "=3Dd" (remainder)
> >>
> >> : "0" (0), "1" (dividend), "r" (divisor) );
> >>
> >> return quotient;
> >>
> >> }
> >>
> >>
> >>
> >> void set_time_scale(struct time_scale *ts, uint64_t ticks_per_sec)
> >>
> >> {
> >>
> >> uint64_t tps64 =3D ticks_per_sec;
> >>
> >> uint32_t tps32;
> >>
> >> int shift =3D 0;
> >>
> >>
> >> while ( tps64 > (MILLISECS(1000)*2) )
> >>
> >> {
> >>
> >> tps64 >>=3D 1;
> >>
> >> shift--;
> >>
> >> }
> >>
> >>
> >> tps32 =3D (uint32_t)tps64;
> >>
> >> while ( tps32 <=3D (uint32_t)MILLISECS(1000) )
> >>
> >> {
> >>
> >> tps32 <<=3D 1;
> >>
> >> shift++;
> >>
> >> }
> >>
> >>
> >> ts->mul_frac =3D div_frac(MILLISECS(1000), tps32);
> >>
> >> ts->shift =3D shift;
> >>
> >> }
> >>
> >>
> >>
> >> uint64_t scale_delta(uint64_t delta, const struct time_scale *scale)
> >>
> >> {
> >>
> >> uint64_t product;
> >>
> >>
> >> if ( scale->shift < 0 )
> >>
> >> delta >>=3D -scale->shift;
> >>
> >> else
> >>
> >> delta <<=3D scale->shift;
> >>
> >>
> >> asm (
> >>
> >> "mulq %2 ; shrd $32,%1,%0"
> >>
> >> : "=3Da" (product), "=3Dd" (delta)
> >>
> >> : "rm" (delta), "0" ((uint64_t)scale->mul_frac) );
> >>
> >>
> >> return product;
> >>
> >> }
> >>
> >>
> >> #define _TS_MUL_FRAC_IDENTITY 0x80000000UL
> >>
> >>
> >> static inline struct time_scale scale_reciprocal(struct time_scale
> scale)
> >>
> >> {
> >>
> >> struct time_scale reciprocal;
> >>
> >> uint32_t dividend;
> >>
> >>
> >> dividend =3D _TS_MUL_FRAC_IDENTITY;
> >>
> >> reciprocal.shift =3D 1 - scale.shift;
> >>
> >> while ( dividend >=3D scale.mul_frac )
> >>
> >> {
> >>
> >> dividend >>=3D 1;
> >>
> >> reciprocal.shift++;
> >>
> >> }
> >>
> >>
> >> asm (
> >>
> >> "divl %4"
> >>
> >> : "=3Da" (reciprocal.mul_frac), "=3Dd" (dividend)
> >>
> >> : "0" (0), "1" (dividend), "r" (scale.mul_frac) );
> >>
> >>
> >> return reciprocal;
> >>
> >> }
> >>
> >>
> >>
> >> int64_t get_s_time_fixed(const struct cpu_time_stamp *t, const struct
> >> time_scale *ts, uint64_t at_tsc)
> >>
> >> {
> >>
> >> uint64_t tsc, delta;
> >>
> >>
> >> if ( at_tsc )
> >>
> >> tsc =3D at_tsc;
> >>
> >> else
> >>
> >> tsc =3D rdtsc();
> >>
> >> delta =3D tsc - t->local_tsc;
> >>
> >> return t->local_stime + scale_delta(delta, ts);
> >>
> >> }
> >>
> >>
> >> int main() {
> >>
> >>
> >> struct cpu_time_stamp ct;
> >>
> >> struct time_scale ts;
> >>
> >> struct time_scale back;
> >>
> >>
> >> uint64_t start =3D rdtsc();
> >>
> >>
> >> set_time_scale(&ts, 3000000000);
> >>
> >> back =3D scale_reciprocal(ts);
> >>
> >>
> >> ct.local_tsc =3D start;
> >>
> >> ct.local_stime =3D scale_delta(start, &ts);
> >>
> >>
> >> while (1) {
> >>
> >> uint64_t new_tsc =3D rdtsc();
> >>
> >> ct.local_stime =3D get_s_time_fixed(&ct, &ts, new_tsc);
> >>
> >> ct.local_tsc =3D new_tsc;
> >>
> >>
> >> uint64_t tmp_tsc =3D rdtsc();
> >>
> >> printf("%lu %lu\n", tmp_tsc, scale_delta(get_s_time_fixed(&ct, &ts,
> >> tmp_tsc), &back));
> >>
> >> }
> >>
> >>
> >> return 0;
> >>
> >> }
> >>
> >> ```
> >>
> >>
> >> It's enough to run the loop for 10-20 seconds to see the problem.
> >> scale_delta rounds the least significant bits during calculation, whic=
h
> >> causes the error to accumulate, at different rates on different cores,
> >> depending on the least significant bits at the time of calibration.
> >>
> >>
> >> Now let's talk about why dwm reacts this way. When a snapshot is
> reversed,
> >> last_guest_time in hvm_get_guest_time_fixed is set to 0, which doesn't
> >> prevent time from flowing backwards. This means that cache_tsc_offset =
in
> >> hvm_get_guest_tsc_fixed may be configured correctly on one physical
> core,
> >> but due to shedding on a physical core with a lagging tsc, the guest m=
ay
> >> occasionally see a tsc value lower than it saw before the snapshot was
> >> reversed. If this happens to the dwm code, it terminates with an error=
.
> >>
> >>
> >> A quick solution to this problem might be to save the last_seen_tsc
> >> parameter in a snapshot for each core, followed by validation.
> >>
> >>
> >> The correct solution is to remove the rounding of the least significan=
t
> >> bits from the sequence.
> >>
> >> On Wed, Jan 7, 2026 at 11:02=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>
> >>> On 06.01.2026 21:10, =D0=90=D0=BD=D1=82=D0=BE=D0=BD =D0=9C=D0=B0=D1=
=80=D0=BA=D0=BE=D0=B2 wrote:
> >>>> Hi, I'm not sure about the other places. In hvm_load_cpu_ctxt
> >>>> (xen/arch/x86/hvm/hvm.c ), it was easy to catch because
> >>>> process_pending_softirqs is frequently called there, which in turn
> >>>> processes softirqs from the timer (where the timestamp is updated).
> >>>> After I fixed sync_tsc in hvm_load_cpu_ctxt, the problem stopped
> >>>> reproducing under no load. However, when the number of vCPUs is 4
> times
> >>>> greater than the number of CPUs (under heavy load), the problem rare=
ly
> >>>> reoccurs (mostly during snapshot restores during
> >>>> process_pending_softirqs calls), and this is no longer a simple case=
.
> >>> If
> >>>> get_s_time_fixed can indeed be interrupted during execution after
> >>>> rdtsc_ordered, then the current fix is insufficient. It's necessary =
to
> >>>> atomically copy "t->stamp" to the stack using local_irq_disable and
> >>>> local_irq_enable (as in local_time_calibration), and then work with
> the
> >>>> copy, confident in its lifetime and immutability. But until
> >>>> get_s_time_fixed is proven to be interruptible, this is premature, s=
o
> >>>> your fix is sufficient. I think I need more information and testing =
to
> >>>> say more.
> >>>
> >>> While the cpu_calibration per-CPU variable is updated from IRQ contex=
t,
> >>> the cpu_time one isn't. Hence t->stamp's contents cannot change behin=
d
> >>> the back of get_s_time_fixed(). I wonder whether ...
> >>>
> >>>> Regarding the other scale_delta calls, if they include values
> >>>> calculated from externally saved tsc values that could have become
> >>>> stale during the process_pending_softirqs call, this definitely need=
s
> >>> to
> >>>> be fixed.
> >>>
> >>> ... another similar issue (possibly one not included in the set of
> >>> remarks I have in the patch, as none of those look related to what yo=
u
> >>> describe) might be causing the remaining, more rare problems you say
> you
> >>> see. That set of remarks is actually a result of me going over all
> other
> >>> scale_delta() calls, but of course I may have got the analysis wrong.
> >>>
> >>> As to using 4 times as many vCPU-s as there are pCPU-s (and then heav=
y
> >>> load) - while I don't think we have a support statement for such
> upstream
> >>> (when probably we should), iirc for our (SUSE's) products we would
> >>> consider that unsupported. Just fyi.
> >>>
> >>> Also, btw, please don't top-post.
> >>>
> >>> Jan
> >>>
> >>
> >
>
>

--00000000000035eda40648304e7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Btw, your prior response was too hard to properly read, due to e=
xcess blank<br>lines with at the same time squashed leading blanks. Togethe=
r with your<br>apparent inability to avoid top-posting, I think you really =
want to adjust<br>your mail program&#39;s configuration.</blockquote><div><=
span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">I sugg=
est we skip the discussion of formatting and the number of spaces in messag=
es and instead focus on the topic of the thread.</span></span> <span class=
=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">I have a very di=
fficult time troubleshooting difficult-to-reproduce bugs, and the fact that=
 their descriptions are difficult to read due to the number of spaces is pr=
obably the least of the difficulties.</span></span></div><div><span class=
=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span></spa=
n></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">That invocation o=
f get_s_time_fixed() reduces to scale_delta() (without<br>further rdtsc_ord=
ered()), as non-zero at_tsc is passed in all cases. IOW<br>it&#39;s not qui=
te clear to me what change you are suggesting (that would<br>actually make =
a functional difference).</blockquote><div><span class=3D"gmail-jCAhz gmail=
-ChMk0b"><span class=3D"gmail-ryNqvb">Replacing get_s_time_fixed with scale=
_delta will remove the calculation dependency on the previous local_stime v=
alue, which accumulates lag between cores.</span></span> <span class=3D"gma=
il-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">This is because:

rdtsc_ordered is not called synchronously on the cores, but by the differen=
ce offset by the ipi speed. Therefore, we get:</span></span></div><div><spa=
n class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></spa=
n></span></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D=
"gmail-ryNqvb">core0: current_rdtsc;</span></span></div><div><span class=3D=
"gmail-jCAhz"><span class=3D"gmail-ryNqvb">core1: current_rdtsc + ipi speed=
;</span></span></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span cl=
ass=3D"gmail-ryNqvb">coreN: current_rdtsc + ipi speed * N;</span></span></d=
iv><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqv=
b"><br></span></span></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><s=
pan class=3D"gmail-ryNqvb">Since ipi values are sent alternately in a loop =
to core0, in the version with get_s_time_fixed, we get the following local_=
stime calculation format.</span></span></div><div><span class=3D"gmail-jCAh=
z gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span></span></div><div><=
span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">coreN:=
 local_stime =3D local_stime + scale_delta((current_rdtsc + (ipi_speed * N)=
) =E2=80=93 local_rdtsc);</span></span></div><div><span class=3D"gmail-jCAh=
z gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span></span></div><div><=
span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">This m=
eans the time on each core will differ by ipi_speed * N. And since we&#39;r=
e using the values of the previous local_stime, the difference will accumul=
ate because the previous local_stime was also offset.</span></span> <span c=
lass=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">In the versi=
on with scale_delta, we get:</span></span></div><div><span class=3D"gmail-j=
CAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb"><br></span></span></div><di=
v><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">cor=
eN: local_stime =3D scale_delta(current_rdtsc + (ipi_speed * N));</span></s=
pan></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmai=
l-ryNqvb"><br></span></span></div><div><span class=3D"gmail-jCAhz gmail-ChM=
k0b"><span class=3D"gmail-ryNqvb">This means there will still be a differen=
ce, but it won&#39;t accumulate, and the offsets will remain within normal =
limits.</span></span></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><s=
pan class=3D"gmail-ryNqvb"><br></span></span></div><div><span class=3D"gmai=
l-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">If it&#39;s still unclea=
r: If your local_stime in get_s_time_fixed is offset relative to other core=
s, then the fact that rdtsc_ordered and local_tsc are not offset doesn&#39;=
t change anything, since you&#39;re using the delta relative to local_stime=
.</span></span></div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span cl=
ass=3D"gmail-ryNqvb"><br></span></span></div><div><span class=3D"gmail-jCAh=
z gmail-ChMk0b"><span class=3D"gmail-ryNqvb">core0_local_stime + (rdtsc_ord=
ered() - local_tsc) !=3D core1_local_stime + (rdtsc_ordered() - local_tsc);=
 //=C2=A0</span></span>Even if rdtsc_ordered() and local_tsc are equal acro=
ss cores.</div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D=
"gmail-ryNqvb"><br></span></span></div><div><span class=3D"gmail-jCAhz gmai=
l-ChMk0b"><span class=3D"gmail-ryNqvb">On 96-core configurations, up to a m=
illisecond of latency can accumulate in local_stime over a week of operatio=
n, and this is a significant difference.</span></span> <span class=3D"gmail=
-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">This is due to the fact t=
hat I use cpufreq=3Dxen:performance max_cstate=3D1 , meaning that in my con=
figuration, local_stime is never overwritten by master_stime.</span></span>=
</div><div><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ry=
Nqvb"><br></span></span></div><div><span class=3D"gmail-jCAhz"><span class=
=3D"gmail-ryNqvb">Thanks.</span></span>=C2=A0</div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Jan 12, 2026 at 2:45=E2=80=AFPM Jan Beulich &lt;<a href=3D"mailto:jbe=
ulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 12.01.2026 11:31, Anton Markov wrote:<b=
r>
&gt; Bit rounding isn&#39;t the main issue; the difference in ipi delivery =
to the<br>
&gt; cores accumulates due to the ordering. Replacing get_s_time_fixed with=
<br>
&gt; scale_delta in time_calibration_rendezvous_tail should be sufficient. =
This<br>
&gt; configuration won&#39;t accumulate errors, but bit rounding can still =
cause a<br>
&gt; significant difference from calibration to calibration, but it&#39;s n=
ot as<br>
&gt; significant.<br>
<br>
That invocation of get_s_time_fixed() reduces to scale_delta() (without<br>
further rdtsc_ordered()), as non-zero at_tsc is passed in all cases. IOW<br=
>
it&#39;s not quite clear to me what change you are suggesting (that would<b=
r>
actually make a functional difference).<br>
<br>
Btw, your prior response was too hard to properly read, due to excess blank=
<br>
lines with at the same time squashed leading blanks. Together with your<br>
apparent inability to avoid top-posting, I think you really want to adjust<=
br>
your mail program&#39;s configuration.<br>
<br>
Jan<br>
<br>
&gt; On Fri, Jan 9, 2026 at 7:11=E2=80=AFPM Anton Markov &lt;<a href=3D"mai=
lto:akmarkov45@gmail.com" target=3D"_blank">akmarkov45@gmail.com</a>&gt; wr=
ote:<br>
&gt; <br>
&gt;&gt; You&#39;re right. These aren&#39;t interrupts in get_s_time_fixed,=
 but rather a<br>
&gt;&gt; cumulative error in the sequence due to integer rounding. I added =
logging<br>
&gt;&gt; of the current local_stime to local_time_calibration and noticed t=
hat the<br>
&gt;&gt; timestamp between cores is gradually increasing. If the server has=
 been<br>
&gt;&gt; running for weeks, this could be a very large value.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt; @@ -1732,6 +1753,8 @@ static void cf_check local_time_calibration(=
void)<br>
&gt;&gt;<br>
&gt;&gt; if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) )<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt; /* Atomically read cpu_calibration struct and write cpu_time struc=
t. */<br>
&gt;&gt;<br>
&gt;&gt; + printk(&quot;update stime on time calibrate %d, %lu -&gt; %lu (%=
lu, %lu)\n&quot;,<br>
&gt;&gt; smp_processor_id(), t-&gt;stamp.local_stime, c-&gt;local_stime,<br=
>
&gt;&gt;<br>
&gt;&gt; + t-&gt;last_seen_ns, t-&gt;last_seen_tsc);<br>
&gt;&gt;<br>
&gt;&gt; local_irq_disable();<br>
&gt;&gt;<br>
&gt;&gt; t-&gt;stamp =3D *c;<br>
&gt;&gt;<br>
&gt;&gt; local_irq_enable();<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; 2 hours of work:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt; (XEN) update stime on time calibrate 0, 8564145820102 -&gt; 856514=
5861597<br>
&gt;&gt; (8565145862216, 0)<br>
&gt;&gt;<br>
&gt;&gt; (XEN) update stime on time calibrate 1, 8564145820129 -&gt; 856514=
5861609<br>
&gt;&gt; (8565145863957, 0)<br>
&gt;&gt;<br>
&gt;&gt; (XEN) update stime on time calibrate 3, 8564145819996 -&gt; 856514=
5861491<br>
&gt;&gt; (8565145864800, 0)<br>
&gt;&gt;<br>
&gt;&gt; (XEN) update stime on time calibrate 2, 8564145820099 -&gt; 856514=
5861609<br>
&gt;&gt; (8565145865372, 0)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; 8565145861609 - 8565145861491 =3D 115 * 3 (3.00 GHz) =3D 345 lag<b=
r>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; 6 hours of work:<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt; (XEN) update stime on time calibrate 0, 22914730829200 -&gt; 22915=
730869993<br>
&gt;&gt; (22915730870665, 0)<br>
&gt;&gt;<br>
&gt;&gt; (XEN) update stime on time calibrate 1, 22914730829073 -&gt; 22915=
730869889<br>
&gt;&gt; (22915730870693, 0)<br>
&gt;&gt;<br>
&gt;&gt; (XEN) update stime on time calibrate 2, 22914730829052 -&gt; 22915=
730869841<br>
&gt;&gt; (22915730872231, 0)<br>
&gt;&gt;<br>
&gt;&gt; (XEN) update stime on time calibrate 3, 22914730828892 -&gt; 22915=
730869696<br>
&gt;&gt; (22915730872096, 0)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; 22915730869993 - 22915730869696 =3D 297 * 3 (3.00 GHz) =3D 891 lag=
<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Clarification, according to my xen settings:<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt; ucode=3Dscan dom0_mem=3D53923M,max:53923M dom0_max_vcpus=3D4-96 do=
m0_vcpus_pin=3D0<br>
&gt;&gt; force-ept=3D1 ept=3Dno-ad,no-pml hap_1gb=3D0 hap_2mb=3D0 altp2m=3D=
1<br>
&gt;&gt; hpet=3Dlegacy-replacement smt=3D1 spec-ctrl=3Dno gnttab_max_frames=
=3D512<br>
&gt;&gt; cpufreq=3Dxen:performance max_cstate=3D1 sched=3Dcredit sched-gran=
=3Dcpu apicv=3D0<br>
&gt;&gt; sched_credit_tslice_ms=3D5 sched_ratelimit_us=3D500<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Processors I tested on:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt; Intel(R) Core(TM) i5-3330 CPU @ 3.00GHz<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Flags: fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush ac=
pi mmx<br>
&gt;&gt; fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nop=
l<br>
&gt;&gt; nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 c=
x16<br>
&gt;&gt; sse4_1 sse4_2 popcnt aes xsave avx f16c hypervisor lahf_lm cpuid_f=
ault<br>
&gt;&gt; fsgsbase erms xsaveopt arch_capabilities<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt; Intel(R) Xeon(R) Gold 5318Y CPU @ 2.10GHz x2 (NUMA)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Flags: fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush ac=
pi mmx<br>
&gt;&gt; fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nop=
l<br>
&gt;&gt; nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 f=
ma cx16<br>
&gt;&gt; sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor la=
hf_lm abm<br>
&gt;&gt; 3dnowprefetch cpuid_fault ibpb fsgsbase bmi1 avx2 bmi2 erms rtm av=
x512f<br>
&gt;&gt; avx512dq rdseed adx avx512ifma clflushopt clwb avx512cd sha_ni avx=
512bw<br>
&gt;&gt; avx512vl xsaveopt xsavec xgetbv1 avx512vbmi avx512_vbmi2 gfni vaes=
<br>
&gt;&gt; vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid fsrm m=
d_clear<br>
&gt;&gt; arch_capabilities<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Next I moved the code to r3 to speed up playback:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt; #include &lt;stdint.h&gt;<br>
&gt;&gt;<br>
&gt;&gt; #include &lt;stdio.h&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; static __inline__ unsigned long long rdtsc(void)<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt; unsigned hi, lo;<br>
&gt;&gt;<br>
&gt;&gt; __asm__ __volatile__ (&quot;rdtsc&quot; : &quot;=3Da&quot;(lo), &q=
uot;=3Dd&quot;(hi));<br>
&gt;&gt;<br>
&gt;&gt; return ( (unsigned long long)lo)|( ((unsigned long long)hi)&lt;&lt=
;32 );<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; #define MILLISECS(_ms) ((int64_t)((_ms) * 1000000ULL))<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; struct cpu_time_stamp {<br>
&gt;&gt;<br>
&gt;&gt; uint64_t local_tsc;<br>
&gt;&gt;<br>
&gt;&gt; int64_t local_stime;<br>
&gt;&gt;<br>
&gt;&gt; int64_t master_stime;<br>
&gt;&gt;<br>
&gt;&gt; };<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; struct time_scale {<br>
&gt;&gt;<br>
&gt;&gt; int shift;<br>
&gt;&gt;<br>
&gt;&gt; uint32_t mul_frac;<br>
&gt;&gt;<br>
&gt;&gt; };<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; static inline uint32_t div_frac(uint32_t dividend, uint32_t diviso=
r)<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt; uint32_t quotient, remainder;<br>
&gt;&gt;<br>
&gt;&gt; asm (<br>
&gt;&gt;<br>
&gt;&gt; &quot;divl %4&quot;<br>
&gt;&gt;<br>
&gt;&gt; : &quot;=3Da&quot; (quotient), &quot;=3Dd&quot; (remainder)<br>
&gt;&gt;<br>
&gt;&gt; : &quot;0&quot; (0), &quot;1&quot; (dividend), &quot;r&quot; (divi=
sor) );<br>
&gt;&gt;<br>
&gt;&gt; return quotient;<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; void set_time_scale(struct time_scale *ts, uint64_t ticks_per_sec)=
<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt; uint64_t tps64 =3D ticks_per_sec;<br>
&gt;&gt;<br>
&gt;&gt; uint32_t tps32;<br>
&gt;&gt;<br>
&gt;&gt; int shift =3D 0;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; while ( tps64 &gt; (MILLISECS(1000)*2) )<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt; tps64 &gt;&gt;=3D 1;<br>
&gt;&gt;<br>
&gt;&gt; shift--;<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; tps32 =3D (uint32_t)tps64;<br>
&gt;&gt;<br>
&gt;&gt; while ( tps32 &lt;=3D (uint32_t)MILLISECS(1000) )<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt; tps32 &lt;&lt;=3D 1;<br>
&gt;&gt;<br>
&gt;&gt; shift++;<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ts-&gt;mul_frac =3D div_frac(MILLISECS(1000), tps32);<br>
&gt;&gt;<br>
&gt;&gt; ts-&gt;shift =3D shift;<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; uint64_t scale_delta(uint64_t delta, const struct time_scale *scal=
e)<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt; uint64_t product;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; if ( scale-&gt;shift &lt; 0 )<br>
&gt;&gt;<br>
&gt;&gt; delta &gt;&gt;=3D -scale-&gt;shift;<br>
&gt;&gt;<br>
&gt;&gt; else<br>
&gt;&gt;<br>
&gt;&gt; delta &lt;&lt;=3D scale-&gt;shift;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; asm (<br>
&gt;&gt;<br>
&gt;&gt; &quot;mulq %2 ; shrd $32,%1,%0&quot;<br>
&gt;&gt;<br>
&gt;&gt; : &quot;=3Da&quot; (product), &quot;=3Dd&quot; (delta)<br>
&gt;&gt;<br>
&gt;&gt; : &quot;rm&quot; (delta), &quot;0&quot; ((uint64_t)scale-&gt;mul_f=
rac) );<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; return product;<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; #define _TS_MUL_FRAC_IDENTITY 0x80000000UL<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; static inline struct time_scale scale_reciprocal(struct time_scale=
 scale)<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt; struct time_scale reciprocal;<br>
&gt;&gt;<br>
&gt;&gt; uint32_t dividend;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; dividend =3D _TS_MUL_FRAC_IDENTITY;<br>
&gt;&gt;<br>
&gt;&gt; reciprocal.shift =3D 1 - scale.shift;<br>
&gt;&gt;<br>
&gt;&gt; while ( dividend &gt;=3D scale.mul_frac )<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt; dividend &gt;&gt;=3D 1;<br>
&gt;&gt;<br>
&gt;&gt; reciprocal.shift++;<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; asm (<br>
&gt;&gt;<br>
&gt;&gt; &quot;divl %4&quot;<br>
&gt;&gt;<br>
&gt;&gt; : &quot;=3Da&quot; (reciprocal.mul_frac), &quot;=3Dd&quot; (divide=
nd)<br>
&gt;&gt;<br>
&gt;&gt; : &quot;0&quot; (0), &quot;1&quot; (dividend), &quot;r&quot; (scal=
e.mul_frac) );<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; return reciprocal;<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; int64_t get_s_time_fixed(const struct cpu_time_stamp *t, const str=
uct<br>
&gt;&gt; time_scale *ts, uint64_t at_tsc)<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt; uint64_t tsc, delta;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; if ( at_tsc )<br>
&gt;&gt;<br>
&gt;&gt; tsc =3D at_tsc;<br>
&gt;&gt;<br>
&gt;&gt; else<br>
&gt;&gt;<br>
&gt;&gt; tsc =3D rdtsc();<br>
&gt;&gt;<br>
&gt;&gt; delta =3D tsc - t-&gt;local_tsc;<br>
&gt;&gt;<br>
&gt;&gt; return t-&gt;local_stime + scale_delta(delta, ts);<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; int main() {<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; struct cpu_time_stamp ct;<br>
&gt;&gt;<br>
&gt;&gt; struct time_scale ts;<br>
&gt;&gt;<br>
&gt;&gt; struct time_scale back;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; uint64_t start =3D rdtsc();<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; set_time_scale(&amp;ts, 3000000000);<br>
&gt;&gt;<br>
&gt;&gt; back =3D scale_reciprocal(ts);<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ct.local_tsc =3D start;<br>
&gt;&gt;<br>
&gt;&gt; ct.local_stime =3D scale_delta(start, &amp;ts);<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; while (1) {<br>
&gt;&gt;<br>
&gt;&gt; uint64_t new_tsc =3D rdtsc();<br>
&gt;&gt;<br>
&gt;&gt; ct.local_stime =3D get_s_time_fixed(&amp;ct, &amp;ts, new_tsc);<br=
>
&gt;&gt;<br>
&gt;&gt; ct.local_tsc =3D new_tsc;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; uint64_t tmp_tsc =3D rdtsc();<br>
&gt;&gt;<br>
&gt;&gt; printf(&quot;%lu %lu\n&quot;, tmp_tsc, scale_delta(get_s_time_fixe=
d(&amp;ct, &amp;ts,<br>
&gt;&gt; tmp_tsc), &amp;back));<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; return 0;<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s enough to run the loop for 10-20 seconds to see the probl=
em.<br>
&gt;&gt; scale_delta rounds the least significant bits during calculation, =
which<br>
&gt;&gt; causes the error to accumulate, at different rates on different co=
res,<br>
&gt;&gt; depending on the least significant bits at the time of calibration=
.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Now let&#39;s talk about why dwm reacts this way. When a snapshot =
is reversed,<br>
&gt;&gt; last_guest_time in hvm_get_guest_time_fixed is set to 0, which doe=
sn&#39;t<br>
&gt;&gt; prevent time from flowing backwards. This means that cache_tsc_off=
set in<br>
&gt;&gt; hvm_get_guest_tsc_fixed may be configured correctly on one physica=
l core,<br>
&gt;&gt; but due to shedding on a physical core with a lagging tsc, the gue=
st may<br>
&gt;&gt; occasionally see a tsc value lower than it saw before the snapshot=
 was<br>
&gt;&gt; reversed. If this happens to the dwm code, it terminates with an e=
rror.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; A quick solution to this problem might be to save the last_seen_ts=
c<br>
&gt;&gt; parameter in a snapshot for each core, followed by validation.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; The correct solution is to remove the rounding of the least signif=
icant<br>
&gt;&gt; bits from the sequence.<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Jan 7, 2026 at 11:02=E2=80=AFAM Jan Beulich &lt;<a href=3D=
"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrot=
e:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On 06.01.2026 21:10, =D0=90=D0=BD=D1=82=D0=BE=D0=BD =D0=9C=D0=
=B0=D1=80=D0=BA=D0=BE=D0=B2 wrote:<br>
&gt;&gt;&gt;&gt; Hi, I&#39;m not sure about the other places. In hvm_load_c=
pu_ctxt<br>
&gt;&gt;&gt;&gt; (xen/arch/x86/hvm/hvm.c ), it was easy to catch because<br=
>
&gt;&gt;&gt;&gt; process_pending_softirqs is frequently called there, which=
 in turn<br>
&gt;&gt;&gt;&gt; processes softirqs from the timer (where the timestamp is =
updated).<br>
&gt;&gt;&gt;&gt; After I fixed sync_tsc in hvm_load_cpu_ctxt, the problem s=
topped<br>
&gt;&gt;&gt;&gt; reproducing under no load. However, when the number of vCP=
Us is 4 times<br>
&gt;&gt;&gt;&gt; greater than the number of CPUs (under heavy load), the pr=
oblem rarely<br>
&gt;&gt;&gt;&gt; reoccurs (mostly during snapshot restores during<br>
&gt;&gt;&gt;&gt; process_pending_softirqs calls), and this is no longer a s=
imple case.<br>
&gt;&gt;&gt; If<br>
&gt;&gt;&gt;&gt; get_s_time_fixed can indeed be interrupted during executio=
n after<br>
&gt;&gt;&gt;&gt; rdtsc_ordered, then the current fix is insufficient. It&#3=
9;s necessary to<br>
&gt;&gt;&gt;&gt; atomically copy &quot;t-&gt;stamp&quot; to the stack using=
 local_irq_disable and<br>
&gt;&gt;&gt;&gt; local_irq_enable (as in local_time_calibration), and then =
work with the<br>
&gt;&gt;&gt;&gt; copy, confident in its lifetime and immutability. But unti=
l<br>
&gt;&gt;&gt;&gt; get_s_time_fixed is proven to be interruptible, this is pr=
emature, so<br>
&gt;&gt;&gt;&gt; your fix is sufficient. I think I need more information an=
d testing to<br>
&gt;&gt;&gt;&gt; say more.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; While the cpu_calibration per-CPU variable is updated from IRQ=
 context,<br>
&gt;&gt;&gt; the cpu_time one isn&#39;t. Hence t-&gt;stamp&#39;s contents c=
annot change behind<br>
&gt;&gt;&gt; the back of get_s_time_fixed(). I wonder whether ...<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regarding the other scale_delta calls, if they include val=
ues<br>
&gt;&gt;&gt;&gt; calculated from externally saved tsc values that could hav=
e become<br>
&gt;&gt;&gt;&gt; stale during the process_pending_softirqs call, this defin=
itely needs<br>
&gt;&gt;&gt; to<br>
&gt;&gt;&gt;&gt; be fixed.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ... another similar issue (possibly one not included in the se=
t of<br>
&gt;&gt;&gt; remarks I have in the patch, as none of those look related to =
what you<br>
&gt;&gt;&gt; describe) might be causing the remaining, more rare problems y=
ou say you<br>
&gt;&gt;&gt; see. That set of remarks is actually a result of me going over=
 all other<br>
&gt;&gt;&gt; scale_delta() calls, but of course I may have got the analysis=
 wrong.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; As to using 4 times as many vCPU-s as there are pCPU-s (and th=
en heavy<br>
&gt;&gt;&gt; load) - while I don&#39;t think we have a support statement fo=
r such upstream<br>
&gt;&gt;&gt; (when probably we should), iirc for our (SUSE&#39;s) products =
we would<br>
&gt;&gt;&gt; consider that unsupported. Just fyi.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Also, btw, please don&#39;t top-post.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Jan<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000035eda40648304e7a--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF490D0B24C
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 17:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198998.1515760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veF5g-0003Lp-5V; Fri, 09 Jan 2026 16:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198998.1515760; Fri, 09 Jan 2026 16:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veF5g-0003Jr-2O; Fri, 09 Jan 2026 16:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1198998;
 Fri, 09 Jan 2026 16:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HUsm=7O=gmail.com=akmarkov45@srs-se1.protection.inumbo.net>)
 id 1veF5e-0003Jl-Bf
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 16:11:54 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e78b91dd-ed75-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 17:11:51 +0100 (CET)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-34c2f335681so2668978a91.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 08:11:50 -0800 (PST)
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
X-Inumbo-ID: e78b91dd-ed75-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767975109; x=1768579909; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gEH9Q0bFt+Qq2mQMmJFh6QASYza1Bi55SwhtogIKItk=;
        b=APMrJDxfpqv67D8OJu2TbmZxllOuuWOfAc2QqHnOe4Tz86zYb1ch8h8kUOuD1NjDhc
         GT87sEj7saFbxNFUqEaEWmt5A0SyVxlvfsi5FldautvoKeaAAJl95ZQzZoXoIRuv4O82
         WenaDpyzQH68Yf0GYGh5BOrOijaJFgXdL4/hnS6I3UlCxs6zsZca8Tu/8SK5TSpb+UyB
         tkJAenIUJDGXWSlMaDtEXeq2KyOx7ZKr05oKnbnitkMZl7GxexECUqUTzp3sg8U7DYJO
         JrJ2Na9CUSp4T18Q0UUR1D5bz8hbXhgf928cQNWC6ioCU9nIff0ZfbheDKVDP2hMe6Xd
         XQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767975109; x=1768579909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEH9Q0bFt+Qq2mQMmJFh6QASYza1Bi55SwhtogIKItk=;
        b=RCaiXoOBiQQXygqfQkXry3tV76BApKtLHHEyhVo3BrJHnoUAONkz1F1e6wmbZG/963
         1Klb3/6VyKhNnFFkNl4QSo22oRh6HfhqutkUtdR1WNr59qJX0MIkWl2oG8blIUzdOoiX
         2ClUg1X9E7qmAi6YO+p1W8Yy4nyGs5bWa5iJI7sYIC99CPlJBjY1t63N3qCX/aJR+Ecm
         J3OPcsJnXyRmk8At9PyQ8d0gGA6UgmFHHP4TjGP6OAtWK0vmCEbrCk+cTCt4mdSVDAxU
         rOnVt+Sb99yc2su+JBSWwFgPhD90HLEUKPqGAQ7h3GlUigBdLgcchM665E81FugHJIyc
         UzOg==
X-Forwarded-Encrypted: i=1; AJvYcCUfhlbnn+8Jp9wcA2ddNb1PRz4YfiD8WhKnWk5P0dgLIsQD5USv78A2p0cISN5Z/fOmpx/Rk9gGObY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzzan6hBZ0o4aQZH0EVXquq2F0SuNmrAVUquLOLpNSun5kluyzz
	cc2Di2uUr7np7EItpQ3FbCNYIi8CjkIKXGHjgymNYgspy+EHRDJ1WSoHdQoNv7BBh/kQKTrIPm7
	Iazurwr1JcFeRRHCwHvs8Y2Q+vnMzd+8=
X-Gm-Gg: AY/fxX4Eobd17sirPli/mDGaqHJGGVT/UZbC9YSdwkJAiMiJMHkZGSZqiiAIlCMEI+F
	NWJ+P/z2Yb49ap2rywlZCYJSSP1Tz+s6wPMLXpjBQXym0Ey33c31W1r+d5ldIJ/AkqlXLSj81h3
	N6lBU0R3upG0eC/ShSOTpX41feYriixEHnp8WAK/9sg5zoI/xL6tYIkOQHBRndLgv+4XfqUZWce
	DPPxDgOlQwsLxIFSfCquCkj6nAkKHr4g/uLR7TSqVLCDuU59sTwLTmYXzfjOtzs3q43BgfH
X-Google-Smtp-Source: AGHT+IH2wb+FwZvJbgNRmwy0W13B7yvAacE0Iz1I8KRT5um0OT/N47DnZApdMIeTjWmfSVe8qjZ+L0Ms2IHiJ8Ld6cQ=
X-Received: by 2002:a17:90b:5708:b0:34a:b459:bd10 with SMTP id
 98e67ed59e1d1-34f68cc2ab3mr10225709a91.24.1767975107789; Fri, 09 Jan 2026
 08:11:47 -0800 (PST)
MIME-Version: 1.0
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com> <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
 <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com>
In-Reply-To: <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com>
From: Anton Markov <akmarkov45@gmail.com>
Date: Fri, 9 Jan 2026 19:11:35 +0300
X-Gm-Features: AQt7F2oJu1fyDisoxNbS6cyfB0pi5gA3GNhJxlYcG2-cDlx-qLWdlmth3nCNQOw
Message-ID: <CACQYvN-fiATs2dtdboYxCreF8kF5RsgoH-zgWtQ59iVNOT_wVg@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in get_s_time_fixed()
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004592620647f6c838"

--0000000000004592620647f6c838
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right. These aren't interrupts in get_s_time_fixed, but rather a
cumulative error in the sequence due to integer rounding. I added logging
of the current local_stime to local_time_calibration and noticed that the
timestamp between cores is gradually increasing. If the server has been
running for weeks, this could be a very large value.


```

@@ -1732,6 +1753,8 @@ static void cf_check local_time_calibration(void)

if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) )

{

/* Atomically read cpu_calibration struct and write cpu_time struct. */

+ printk("update stime on time calibrate %d, %lu -> %lu (%lu, %lu)\n",
smp_processor_id(), t->stamp.local_stime, c->local_stime,

+ t->last_seen_ns, t->last_seen_tsc);

local_irq_disable();

t->stamp =3D *c;

local_irq_enable();

```


2 hours of work:


```

(XEN) update stime on time calibrate 0, 8564145820102 -> 8565145861597
(8565145862216, 0)

(XEN) update stime on time calibrate 1, 8564145820129 -> 8565145861609
(8565145863957, 0)

(XEN) update stime on time calibrate 3, 8564145819996 -> 8565145861491
(8565145864800, 0)

(XEN) update stime on time calibrate 2, 8564145820099 -> 8565145861609
(8565145865372, 0)


8565145861609 - 8565145861491 =3D 115 * 3 (3.00 GHz) =3D 345 lag

```


6 hours of work:

```

(XEN) update stime on time calibrate 0, 22914730829200 -> 22915730869993
(22915730870665, 0)

(XEN) update stime on time calibrate 1, 22914730829073 -> 22915730869889
(22915730870693, 0)

(XEN) update stime on time calibrate 2, 22914730829052 -> 22915730869841
(22915730872231, 0)

(XEN) update stime on time calibrate 3, 22914730828892 -> 22915730869696
(22915730872096, 0)


22915730869993 - 22915730869696 =3D 297 * 3 (3.00 GHz) =3D 891 lag

```


Clarification, according to my xen settings:

```

ucode=3Dscan dom0_mem=3D53923M,max:53923M dom0_max_vcpus=3D4-96 dom0_vcpus_=
pin=3D0
force-ept=3D1 ept=3Dno-ad,no-pml hap_1gb=3D0 hap_2mb=3D0 altp2m=3D1
hpet=3Dlegacy-replacement smt=3D1 spec-ctrl=3Dno gnttab_max_frames=3D512
cpufreq=3Dxen:performance max_cstate=3D1 sched=3Dcredit sched-gran=3Dcpu ap=
icv=3D0
sched_credit_tslice_ms=3D5 sched_ratelimit_us=3D500

```


Processors I tested on:


```

Intel(R) Core(TM) i5-3330 CPU @ 3.00GHz


Flags: fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush acpi mmx
fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nopl
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 cx16
sse4_1 sse4_2 popcnt aes xsave avx f16c hypervisor lahf_lm cpuid_fault
fsgsbase erms xsaveopt arch_capabilities

```

```

Intel(R) Xeon(R) Gold 5318Y CPU @ 2.10GHz x2 (NUMA)


Flags: fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush acpi mmx
fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nopl
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 fma cx16
sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm
3dnowprefetch cpuid_fault ibpb fsgsbase bmi1 avx2 bmi2 erms rtm avx512f
avx512dq rdseed adx avx512ifma clflushopt clwb avx512cd sha_ni avx512bw
avx512vl xsaveopt xsavec xgetbv1 avx512vbmi avx512_vbmi2 gfni vaes
vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid fsrm md_clear
arch_capabilities

```


Next I moved the code to r3 to speed up playback:


```

#include <stdint.h>

#include <stdio.h>


static __inline__ unsigned long long rdtsc(void)

{

unsigned hi, lo;

__asm__ __volatile__ ("rdtsc" : "=3Da"(lo), "=3Dd"(hi));

return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );

}


#define MILLISECS(_ms) ((int64_t)((_ms) * 1000000ULL))


struct cpu_time_stamp {

uint64_t local_tsc;

int64_t local_stime;

int64_t master_stime;

};


struct time_scale {

int shift;

uint32_t mul_frac;

};



static inline uint32_t div_frac(uint32_t dividend, uint32_t divisor)

{

uint32_t quotient, remainder;

asm (

"divl %4"

: "=3Da" (quotient), "=3Dd" (remainder)

: "0" (0), "1" (dividend), "r" (divisor) );

return quotient;

}



void set_time_scale(struct time_scale *ts, uint64_t ticks_per_sec)

{

uint64_t tps64 =3D ticks_per_sec;

uint32_t tps32;

int shift =3D 0;


while ( tps64 > (MILLISECS(1000)*2) )

{

tps64 >>=3D 1;

shift--;

}


tps32 =3D (uint32_t)tps64;

while ( tps32 <=3D (uint32_t)MILLISECS(1000) )

{

tps32 <<=3D 1;

shift++;

}


ts->mul_frac =3D div_frac(MILLISECS(1000), tps32);

ts->shift =3D shift;

}



uint64_t scale_delta(uint64_t delta, const struct time_scale *scale)

{

uint64_t product;


if ( scale->shift < 0 )

delta >>=3D -scale->shift;

else

delta <<=3D scale->shift;


asm (

"mulq %2 ; shrd $32,%1,%0"

: "=3Da" (product), "=3Dd" (delta)

: "rm" (delta), "0" ((uint64_t)scale->mul_frac) );


return product;

}


#define _TS_MUL_FRAC_IDENTITY 0x80000000UL


static inline struct time_scale scale_reciprocal(struct time_scale scale)

{

struct time_scale reciprocal;

uint32_t dividend;


dividend =3D _TS_MUL_FRAC_IDENTITY;

reciprocal.shift =3D 1 - scale.shift;

while ( dividend >=3D scale.mul_frac )

{

dividend >>=3D 1;

reciprocal.shift++;

}


asm (

"divl %4"

: "=3Da" (reciprocal.mul_frac), "=3Dd" (dividend)

: "0" (0), "1" (dividend), "r" (scale.mul_frac) );


return reciprocal;

}



int64_t get_s_time_fixed(const struct cpu_time_stamp *t, const struct
time_scale *ts, uint64_t at_tsc)

{

uint64_t tsc, delta;


if ( at_tsc )

tsc =3D at_tsc;

else

tsc =3D rdtsc();

delta =3D tsc - t->local_tsc;

return t->local_stime + scale_delta(delta, ts);

}


int main() {


struct cpu_time_stamp ct;

struct time_scale ts;

struct time_scale back;


uint64_t start =3D rdtsc();


set_time_scale(&ts, 3000000000);

back =3D scale_reciprocal(ts);


ct.local_tsc =3D start;

ct.local_stime =3D scale_delta(start, &ts);


while (1) {

uint64_t new_tsc =3D rdtsc();

ct.local_stime =3D get_s_time_fixed(&ct, &ts, new_tsc);

ct.local_tsc =3D new_tsc;


uint64_t tmp_tsc =3D rdtsc();

printf("%lu %lu\n", tmp_tsc, scale_delta(get_s_time_fixed(&ct, &ts,
tmp_tsc), &back));

}


return 0;

}

```


It's enough to run the loop for 10-20 seconds to see the problem.
scale_delta rounds the least significant bits during calculation, which
causes the error to accumulate, at different rates on different cores,
depending on the least significant bits at the time of calibration.


Now let's talk about why dwm reacts this way. When a snapshot is reversed,
last_guest_time in hvm_get_guest_time_fixed is set to 0, which doesn't
prevent time from flowing backwards. This means that cache_tsc_offset in
hvm_get_guest_tsc_fixed may be configured correctly on one physical core,
but due to shedding on a physical core with a lagging tsc, the guest may
occasionally see a tsc value lower than it saw before the snapshot was
reversed. If this happens to the dwm code, it terminates with an error.


A quick solution to this problem might be to save the last_seen_tsc
parameter in a snapshot for each core, followed by validation.


The correct solution is to remove the rounding of the least significant
bits from the sequence.

On Wed, Jan 7, 2026 at 11:02=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 06.01.2026 21:10, =D0=90=D0=BD=D1=82=D0=BE=D0=BD =D0=9C=D0=B0=D1=80=D0=
=BA=D0=BE=D0=B2 wrote:
> > Hi, I'm not sure about the other places. In hvm_load_cpu_ctxt
> > (xen/arch/x86/hvm/hvm.c ), it was easy to catch because
> > process_pending_softirqs is frequently called there, which in turn
> > processes softirqs from the timer (where the timestamp is updated).
> > After I fixed sync_tsc in hvm_load_cpu_ctxt, the problem stopped
> > reproducing under no load. However, when the number of vCPUs is 4 times
> > greater than the number of CPUs (under heavy load), the problem rarely
> > reoccurs (mostly during snapshot restores during
> > process_pending_softirqs calls), and this is no longer a simple case. I=
f
> > get_s_time_fixed can indeed be interrupted during execution after
> > rdtsc_ordered, then the current fix is =E2=80=8B=E2=80=8Binsufficient. =
It's necessary to
> > atomically copy "t->stamp" to the stack using local_irq_disable and
> > local_irq_enable (as in local_time_calibration), and then work with the
> > copy, confident in its lifetime and immutability. But until
> > get_s_time_fixed is proven to be interruptible, this is premature, so
> > your fix is =E2=80=8B=E2=80=8Bsufficient. I think I need more informati=
on and testing to
> > say more.
>
> While the cpu_calibration per-CPU variable is updated from IRQ context,
> the cpu_time one isn't. Hence t->stamp's contents cannot change behind
> the back of get_s_time_fixed(). I wonder whether ...
>
> > Regarding the other scale_delta calls, if they include values
> =E2=80=8B=E2=80=8B> calculated from externally saved tsc values =E2=80=8B=
=E2=80=8Bthat could have become
> > stale during the process_pending_softirqs call, this definitely needs t=
o
> > be fixed.
>
> ... another similar issue (possibly one not included in the set of
> remarks I have in the patch, as none of those look related to what you
> describe) might be causing the remaining, more rare problems you say you
> see. That set of remarks is actually a result of me going over all other
> scale_delta() calls, but of course I may have got the analysis wrong.
>
> As to using 4 times as many vCPU-s as there are pCPU-s (and then heavy
> load) - while I don't think we have a support statement for such upstream
> (when probably we should), iirc for our (SUSE's) products we would
> consider that unsupported. Just fyi.
>
> Also, btw, please don't top-post.
>
> Jan
>

--0000000000004592620647f6c838
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">


=09
	<span></span>
=09
=09

<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">
<code style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font fac=
e=3D"Liberation Serif, serif">You&#39;re right. These aren&#39;t
interrupts in get_s_time_fixed, but rather a cumulative error in the
sequence due to integer rounding. I added logging of the current
local_stime to local_time_calibration and noticed that the timestamp
between cores is gradually increasing. If the server has been running
for weeks, this could be a very large value.</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=3D=
"Liberation Serif, serif">@@
-1732,6 +1753,8 @@ static void cf_check local_time_calibration(void)</font>=
</code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">     <font fa=
ce=3D"Liberation Serif, serif">if
( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) )</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">     <font fa=
ce=3D"Liberation Serif, serif">{</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">         <fon=
t face=3D"Liberation Serif, serif">/*
Atomically read cpu_calibration struct and write cpu_time struct. */</font>=
</code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=3D=
"Liberation Serif, serif">+
       printk(&quot;update stime on time calibrate %d, %lu -&gt; %lu
(%lu, %lu)\n&quot;, smp_processor_id(), t-&gt;stamp.local_stime,
c-&gt;local_stime,</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=3D=
"Liberation Serif, serif">+
               t-&gt;last_seen_ns, t-&gt;last_seen_tsc);</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">       =20
<font face=3D"Liberation Serif, serif">local_irq_disable();</font></code></=
p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">       =20
<font face=3D"Liberation Serif, serif">t-&gt;stamp =3D *c;</font></code></p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace">       =20
<font face=3D"Liberation Serif, serif">local_irq_enable();</font></code></p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=3D=
"Liberation Serif, serif">```</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=3D=
"Liberation Serif, serif">2
hours of work:</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=3D=
"Liberation Serif, serif">```</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">(XEN=
) update stime
on time calibrate 0, 8564145820102 -&gt; 8565145861597
(8565145862216, 0)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">(XEN=
) update stime
on time calibrate 1, 8564145820129 -&gt; 8565145861609
(8565145863957, 0)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">(XEN=
) update stime
on time calibrate 3, 8564145819996 -&gt; 8565145861491
(8565145864800, 0)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">(XEN=
) update stime
on time calibrate 2, 8564145820099 -&gt; 8565145861609
(8565145865372, 0)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">8565=
145861609 -=20
8565145861491 =3D 115 * 3 (3.00 GHz) =3D 345 lag</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">6 <c=
ode style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=
=3D"Liberation Serif, serif">hours
of work</font></code>:</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">(XEN=
) update stime
on time calibrate 0, 22914730829200 -&gt; 22915730869993
(22915730870665, 0)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">(XEN=
) update stime
on time calibrate 1, 22914730829073 -&gt; 22915730869889
(22915730870693, 0)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">(XEN=
) update stime
on time calibrate 2, 22914730829052 -&gt; 22915730869841
(22915730872231, 0)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">(XEN=
) update stime
on time calibrate 3, 22914730828892 -&gt; 22915730869696
(22915730872096, 0)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">2291=
5730869993 -=20
22915730869696 =3D 297 * 3 (3.00 GHz) =3D 891 lag</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=3D=
"Liberation Serif, serif">Clarification,
according to my xen settings:</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><cod=
e style=3D"font-family:&quot;Liberation Mono&quot;,monospace"><font face=3D=
"Liberation Serif, serif">```</font></code></p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">ucod=
e=3Dscan
dom0_mem=3D53923M,max:53923M dom0_max_vcpus=3D4-96 dom0_vcpus_pin=3D0
force-ept=3D1 ept=3Dno-ad,no-pml hap_1gb=3D0 hap_2mb=3D0 altp2m=3D1
hpet=3Dlegacy-replacement smt=3D1 spec-ctrl=3Dno gnttab_max_frames=3D512
cpufreq=3Dxen:performance max_cstate=3D1 sched=3Dcredit sched-gran=3Dcpu
apicv=3D0  sched_credit_tslice_ms=3D5 sched_ratelimit_us=3D500</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">Proc=
essors I tested
on:</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">Inte=
l(R) Core(TM)
i5-3330 CPU @ 3.00GHz</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">Flag=
s:             =20
fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush acpi mmx
fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nopl
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 cx16
sse4_1 sse4_2 popcnt aes xsave avx f16c hypervisor lahf_lm
cpuid_fault fsgsbase erms xsaveopt arch_capabilities</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">Inte=
l(R) Xeon(R)
Gold 5318Y CPU @ 2.10GHz x2 (NUMA)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">Flag=
s:             =20
    fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush acpi mmx
fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nopl
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 fma
cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor
lahf_lm abm 3dnowprefetch cpuid_fault ibpb fsgsbase bmi1 avx2 bmi2
erms rtm avx512f avx512dq rdseed adx avx512ifma clflushopt clwb
avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1 avx512vbmi
avx512_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg
avx512_vpopcntdq rdpid fsrm md_clear arch_capabilities</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">Next=
 I moved the
code to r3 to speed up playback:</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">#inc=
lude &lt;stdint.h&gt;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">#inc=
lude &lt;stdio.h&gt;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">stat=
ic __inline__
unsigned long long rdtsc(void)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">{</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
unsigned hi, lo;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
__asm__
__volatile__ (&quot;rdtsc&quot; : &quot;=3Da&quot;(lo), &quot;=3Dd&quot;(hi=
));</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
return (
(unsigned long long)lo)|( ((unsigned long long)hi)&lt;&lt;32 );</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">}</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">#def=
ine
MILLISECS(_ms)  ((int64_t)((_ms) * 1000000ULL))</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">stru=
ct
cpu_time_stamp {</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
uint64_t
local_tsc;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
int64_t
local_stime;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
int64_t
master_stime;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">};</=
p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">stru=
ct time_scale {</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
int shift;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
uint32_t
mul_frac;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">};</=
p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">stat=
ic inline
uint32_t div_frac(uint32_t dividend, uint32_t divisor)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">{</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
uint32_t
quotient, remainder;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
asm (</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    &quot;divl
%4&quot;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    : &quot;=3Da&quot;
(quotient), &quot;=3Dd&quot; (remainder)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    : &quot;0&quot;
(0), &quot;1&quot; (dividend), &quot;r&quot; (divisor) );</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
return quotient;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">}</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">void
set_time_scale(struct time_scale *ts, uint64_t ticks_per_sec)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">{</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
uint64_t tps64 =3D
ticks_per_sec;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
uint32_t tps32;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
int shift =3D 0;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
while ( tps64 &gt;
(MILLISECS(1000)*2) )</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
{</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    tps64 &gt;&gt;=3D
1;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    shift--;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
}</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
tps32 =3D
(uint32_t)tps64;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
while ( tps32 &lt;=3D
(uint32_t)MILLISECS(1000) )</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
{</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    tps32 &lt;&lt;=3D
1;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    shift++;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
}</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
ts-&gt;mul_frac
=3D div_frac(MILLISECS(1000), tps32);</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
ts-&gt;shift  =20
=3D shift;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">}</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">uint=
64_t
scale_delta(uint64_t delta, const struct time_scale *scale)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">{</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
uint64_t
product;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
if (
scale-&gt;shift &lt; 0 )</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    delta &gt;&gt;=3D
-scale-&gt;shift;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
else</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    delta &lt;&lt;=3D
scale-&gt;shift;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
asm (</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    &quot;mulq
%2 ; shrd $32,%1,%0&quot;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    : &quot;=3Da&quot;
(product), &quot;=3Dd&quot; (delta)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    : &quot;rm&quot;
(delta), &quot;0&quot; ((uint64_t)scale-&gt;mul_frac) );</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
return product;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">}</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">#def=
ine
_TS_MUL_FRAC_IDENTITY 0x80000000UL</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">stat=
ic inline struct
time_scale scale_reciprocal(struct time_scale scale)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">{</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
struct
time_scale reciprocal;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
uint32_t
dividend;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
dividend =3D
_TS_MUL_FRAC_IDENTITY;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
reciprocal.shift
=3D 1 - scale.shift;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
while ( dividend
&gt;=3D scale.mul_frac )</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
{</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    dividend &gt;&gt;=3D
1;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
  =20
reciprocal.shift++;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
}</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
asm (</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    &quot;divl
%4&quot;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    : &quot;=3Da&quot;
(reciprocal.mul_frac), &quot;=3Dd&quot; (dividend)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    : &quot;0&quot;
(0), &quot;1&quot; (dividend), &quot;r&quot; (scale.mul_frac) );</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
return
reciprocal;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">}</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">int6=
4_t
get_s_time_fixed(const struct cpu_time_stamp *t, const struct
time_scale *ts, uint64_t at_tsc)</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">{</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
uint64_t tsc,
delta;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
if ( at_tsc )</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    tsc =3D
at_tsc;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
else</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    tsc =3D
rdtsc();</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
delta =3D tsc -
t-&gt;local_tsc;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
return
t-&gt;local_stime + scale_delta(delta, ts);</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">}</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">int =
main() {</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
struct
cpu_time_stamp ct;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
struct
time_scale ts;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
struct
time_scale back;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
uint64_t start =3D
rdtsc();</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">  =
=20
set_time_scale(&amp;ts, 3000000000);</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
back =3D
scale_reciprocal(ts);</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
ct.local_tsc =3D
start;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
ct.local_stime =3D
scale_delta(start, &amp;ts);</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
while (1) {</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    uint64_t
new_tsc =3D rdtsc();</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
  =20
ct.local_stime =3D get_s_time_fixed(&amp;ct, &amp;ts, new_tsc);</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    ct.local_tsc
=3D new_tsc;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    uint64_t
tmp_tsc =3D rdtsc();</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
    printf(&quot;%lu
%lu\n&quot;, tmp_tsc, scale_delta(get_s_time_fixed(&amp;ct, &amp;ts,
tmp_tsc), &amp;back));</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
}</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">    =
return 0;</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">}</p=
>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">```<=
/p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">It&#=
39;s enough to run
the loop for 10-20 seconds to see the problem. scale_delta rounds the
least significant bits during calculation, which causes the error to
accumulate, at different rates on different cores, depending on the
least significant bits at the time of calibration.</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">Now =
let&#39;s talk about
why dwm reacts this way. When a snapshot is reversed, last_guest_time
in hvm_get_guest_time_fixed is set to 0, which doesn&#39;t prevent time
from flowing backwards. This means that cache_tsc_offset in
hvm_get_guest_tsc_fixed may be configured correctly on one physical
core, but due to shedding on a physical core with a lagging tsc, the
guest may occasionally see a tsc value lower than it saw before the
snapshot was reversed. If this happens to the dwm code, it terminates
with an error.=20
</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">A qu=
ick solution to
this problem might be to save the last_seen_tsc parameter in a
snapshot for each core, followed by validation.</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style=3D"line-height:100%;margin-bottom:0cm;background:transparent">The =
correct solution
is to remove the rounding of the least significant bits from the
sequence.</p>

</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Jan 7, 2026 at 11:02=E2=80=AFAM Jan Beulich &=
lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On 06.01.2026 21:1=
0, =D0=90=D0=BD=D1=82=D0=BE=D0=BD =D0=9C=D0=B0=D1=80=D0=BA=D0=BE=D0=B2 wrot=
e:<br>
&gt; Hi, I&#39;m not sure about the other places. In hvm_load_cpu_ctxt <br>
&gt; (xen/arch/x86/hvm/hvm.c ), it was easy to catch because <br>
&gt; process_pending_softirqs is frequently called there, which in turn <br=
>
&gt; processes softirqs from the timer (where the timestamp is updated). <b=
r>
&gt; After I fixed sync_tsc in hvm_load_cpu_ctxt, the problem stopped <br>
&gt; reproducing under no load. However, when the number of vCPUs is 4 time=
s <br>
&gt; greater than the number of CPUs (under heavy load), the problem rarely=
 <br>
&gt; reoccurs (mostly during snapshot restores during <br>
&gt; process_pending_softirqs calls), and this is no longer a simple case. =
If <br>
&gt; get_s_time_fixed can indeed be interrupted during execution after <br>
&gt; rdtsc_ordered, then the current fix is =E2=80=8B=E2=80=8Binsufficient.=
 It&#39;s necessary to <br>
&gt; atomically copy &quot;t-&gt;stamp&quot; to the stack using local_irq_d=
isable and <br>
&gt; local_irq_enable (as in local_time_calibration), and then work with th=
e <br>
&gt; copy, confident in its lifetime and immutability. But until <br>
&gt; get_s_time_fixed is proven to be interruptible, this is premature, so =
<br>
&gt; your fix is =E2=80=8B=E2=80=8Bsufficient. I think I need more informat=
ion and testing to <br>
&gt; say more.<br>
<br>
While the cpu_calibration per-CPU variable is updated from IRQ context,<br>
the cpu_time one isn&#39;t. Hence t-&gt;stamp&#39;s contents cannot change =
behind<br>
the back of get_s_time_fixed(). I wonder whether ...<br>
<br>
&gt; Regarding the other scale_delta calls, if they include values <br>
=E2=80=8B=E2=80=8B&gt; calculated from externally saved tsc values =E2=80=
=8B=E2=80=8Bthat could have become <br>
&gt; stale during the process_pending_softirqs call, this definitely needs =
to <br>
&gt; be fixed.<br>
<br>
... another similar issue (possibly one not included in the set of<br>
remarks I have in the patch, as none of those look related to what you<br>
describe) might be causing the remaining, more rare problems you say you<br=
>
see. That set of remarks is actually a result of me going over all other<br=
>
scale_delta() calls, but of course I may have got the analysis wrong.<br>
<br>
As to using 4 times as many vCPU-s as there are pCPU-s (and then heavy<br>
load) - while I don&#39;t think we have a support statement for such upstre=
am<br>
(when probably we should), iirc for our (SUSE&#39;s) products we would<br>
consider that unsupported. Just fyi.<br>
<br>
Also, btw, please don&#39;t top-post.<br>
<br>
Jan<br>
</blockquote></div>

--0000000000004592620647f6c838--


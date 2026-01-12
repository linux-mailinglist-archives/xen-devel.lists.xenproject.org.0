Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F773D125D7
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 12:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200136.1516134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfGMK-00085D-0J; Mon, 12 Jan 2026 11:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200136.1516134; Mon, 12 Jan 2026 11:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfGMJ-00082f-U1; Mon, 12 Jan 2026 11:45:19 +0000
Received: by outflank-mailman (input) for mailman id 1200136;
 Mon, 12 Jan 2026 11:45:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfGMH-00082Z-UK
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 11:45:18 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 296f8990-efac-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 12:45:16 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so3158429f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 03:45:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dadcfsm37687906f8f.3.2026.01.12.03.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:45:14 -0800 (PST)
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
X-Inumbo-ID: 296f8990-efac-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768218315; x=1768823115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DP/rj83J9h2HGMzSIS2/JNlabRM3uvkqd3D0lsJPkOM=;
        b=fQzLYYI+g61ripbEUnaqSO91pWYzGaXXSwA2T3xexB9PKbL3ko8AWTbaxMw3F3NwFp
         LVX0hRbok1rUufyVMKu0SLOX0ojH0H5beyaNUxQdi+aVPDhIAOCXIl+U2LkALuIUSUiQ
         3GULi6J6uSxykKHvnIlIWnGS8bwKGF7uf+xKy/5mZsS6nMcgQTCG4Q6q6BXCucZAzmge
         mHiuxjpJZNXSpGv5eyMULdZgmvfv0aPTetXDcQXR+40ZdV0GIT9DJK1XObfgCZWhuo2z
         P9pa4st9WxaV4EWPAGCQhhwXACukM4ilGkeRgaHc95JzSnojEx1w2/+AlrLCAYV0yHot
         mdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218315; x=1768823115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP/rj83J9h2HGMzSIS2/JNlabRM3uvkqd3D0lsJPkOM=;
        b=fEbv+KfNtOihYFkcNp+W+TgssOEH4WUjUOwver5RRr0/j7LicUOYJygjm5awcMOYf6
         wQjUBH78cGUvcczphpRFIFVr6XzLyYkg0688ivG1WAzbiU97VCm0O5X+iRrkF4hlMMam
         M8+iFtWJCYVZzvhS7KNRscY86HWHao7e0I0MU7vaVd7+1I8c562vV2vZyAiMD+A8BVPG
         Aww+7zokCjUp0Fhgj14CYClwZ1pvrDaJGTkbuMgMDlVrK1qrV/0BAOen9xc05G/by22D
         Wg/NY/9v/AAsbjcQu/WFz9tDbxbUMgnjyErzmsnst1PgqgSqsFX6ArhSMuXqTwpbgvOz
         GEDg==
X-Forwarded-Encrypted: i=1; AJvYcCUD5EIzfrmcktrnJkeETLxsWSxlTG3UACuxsK4xRgDFBj9WcML/E91HhRkoRLeS+6T5OZsRbSBVsyw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYq9QA/gNCq0neyPqxNbP+5gJa0xspRmfi8uL5m+VvGVB4OY8c
	omh46P/9OpmmXFZBLPCa8wscBicTr1ADuEFH9btNwLFnaLReAXVjF0BVDEk/I2uvOQ==
X-Gm-Gg: AY/fxX7GrjvcFmoS4zSOAr7WzxDeWhQLSbGCnDeMNsVXxn8Njgdw+jsf4lUFQGSxUWr
	JRfXQYWt5uEhqPTRHCACDhJHnoBIDmC/1Zm9XUUfnGaknRV1WtHSQKlVQ63wP7K3lmRxr+4Is6p
	0MaPqlyK+vOutVtpmy74Cp6caJO0gXdmE9sQCp7F5SEHc0hh3qAUFDlKMDECaKWx6T2sQ0xURSF
	hRr3TTkQr0OtUcSpJvLSZZeMSXqSRAuHCQgT9d7x5zpt2NR5zI+Hj26w0xNUmywX2cLgu8kwzQO
	2gZ8UTp5EeXwm6JcRCGfnQF/JRCnhQwOMTqYlEBC0FiEorQdnOoyUvMbD171nGbeCkD65s3kW4H
	NNNMDxLDiXXGtb0YUM6klKI6Vs1/J1/oWBFyPX3BUtLOE/l4/lHK4qJqhb1gYcj1ZTf6s6Wdx2v
	ZvDRarov71rYGjcYnxwdzkigegUTEUnIljtxUjCfOWncGLlusKQgCBwc5/uLerCoNspD8BVUiVz
	3eSwV8z0i1zZg==
X-Google-Smtp-Source: AGHT+IGAoUaHw0ZQUpxudaCqdGTnx81wymlEijFVngf0f7NPihpWhmduuNh3HpkvGip/WwJfIxcQWA==
X-Received: by 2002:a5d:64e7:0:b0:432:5c43:53 with SMTP id ffacd0b85a97d-432c374f248mr17967581f8f.36.1768218315092;
        Mon, 12 Jan 2026 03:45:15 -0800 (PST)
Message-ID: <4b03cf36-d2d8-420c-82df-55d6a9ac9d68@suse.com>
Date: Mon, 12 Jan 2026 12:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
To: Anton Markov <akmarkov45@gmail.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
 <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
 <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com>
 <CACQYvN-fiATs2dtdboYxCreF8kF5RsgoH-zgWtQ59iVNOT_wVg@mail.gmail.com>
 <CACQYvN_JbPs9TAs4GYO3myVbehwU9Zz_BhQqj1jVT2Sfg30qUQ@mail.gmail.com>
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
In-Reply-To: <CACQYvN_JbPs9TAs4GYO3myVbehwU9Zz_BhQqj1jVT2Sfg30qUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 11:31, Anton Markov wrote:
> Bit rounding isn't the main issue; the difference in ipi delivery to the
> cores accumulates due to the ordering. Replacing get_s_time_fixed with
> scale_delta in time_calibration_rendezvous_tail should be sufficient. This
> configuration won't accumulate errors, but bit rounding can still cause a
> significant difference from calibration to calibration, but it's not as
> significant.

That invocation of get_s_time_fixed() reduces to scale_delta() (without
further rdtsc_ordered()), as non-zero at_tsc is passed in all cases. IOW
it's not quite clear to me what change you are suggesting (that would
actually make a functional difference).

Btw, your prior response was too hard to properly read, due to excess blank
lines with at the same time squashed leading blanks. Together with your
apparent inability to avoid top-posting, I think you really want to adjust
your mail program's configuration.

Jan

> On Fri, Jan 9, 2026 at 7:11 PM Anton Markov <akmarkov45@gmail.com> wrote:
> 
>> You're right. These aren't interrupts in get_s_time_fixed, but rather a
>> cumulative error in the sequence due to integer rounding. I added logging
>> of the current local_stime to local_time_calibration and noticed that the
>> timestamp between cores is gradually increasing. If the server has been
>> running for weeks, this could be a very large value.
>>
>>
>> ```
>>
>> @@ -1732,6 +1753,8 @@ static void cf_check local_time_calibration(void)
>>
>> if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) )
>>
>> {
>>
>> /* Atomically read cpu_calibration struct and write cpu_time struct. */
>>
>> + printk("update stime on time calibrate %d, %lu -> %lu (%lu, %lu)\n",
>> smp_processor_id(), t->stamp.local_stime, c->local_stime,
>>
>> + t->last_seen_ns, t->last_seen_tsc);
>>
>> local_irq_disable();
>>
>> t->stamp = *c;
>>
>> local_irq_enable();
>>
>> ```
>>
>>
>> 2 hours of work:
>>
>>
>> ```
>>
>> (XEN) update stime on time calibrate 0, 8564145820102 -> 8565145861597
>> (8565145862216, 0)
>>
>> (XEN) update stime on time calibrate 1, 8564145820129 -> 8565145861609
>> (8565145863957, 0)
>>
>> (XEN) update stime on time calibrate 3, 8564145819996 -> 8565145861491
>> (8565145864800, 0)
>>
>> (XEN) update stime on time calibrate 2, 8564145820099 -> 8565145861609
>> (8565145865372, 0)
>>
>>
>> 8565145861609 - 8565145861491 = 115 * 3 (3.00 GHz) = 345 lag
>>
>> ```
>>
>>
>> 6 hours of work:
>>
>> ```
>>
>> (XEN) update stime on time calibrate 0, 22914730829200 -> 22915730869993
>> (22915730870665, 0)
>>
>> (XEN) update stime on time calibrate 1, 22914730829073 -> 22915730869889
>> (22915730870693, 0)
>>
>> (XEN) update stime on time calibrate 2, 22914730829052 -> 22915730869841
>> (22915730872231, 0)
>>
>> (XEN) update stime on time calibrate 3, 22914730828892 -> 22915730869696
>> (22915730872096, 0)
>>
>>
>> 22915730869993 - 22915730869696 = 297 * 3 (3.00 GHz) = 891 lag
>>
>> ```
>>
>>
>> Clarification, according to my xen settings:
>>
>> ```
>>
>> ucode=scan dom0_mem=53923M,max:53923M dom0_max_vcpus=4-96 dom0_vcpus_pin=0
>> force-ept=1 ept=no-ad,no-pml hap_1gb=0 hap_2mb=0 altp2m=1
>> hpet=legacy-replacement smt=1 spec-ctrl=no gnttab_max_frames=512
>> cpufreq=xen:performance max_cstate=1 sched=credit sched-gran=cpu apicv=0
>> sched_credit_tslice_ms=5 sched_ratelimit_us=500
>>
>> ```
>>
>>
>> Processors I tested on:
>>
>>
>> ```
>>
>> Intel(R) Core(TM) i5-3330 CPU @ 3.00GHz
>>
>>
>> Flags: fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush acpi mmx
>> fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nopl
>> nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 cx16
>> sse4_1 sse4_2 popcnt aes xsave avx f16c hypervisor lahf_lm cpuid_fault
>> fsgsbase erms xsaveopt arch_capabilities
>>
>> ```
>>
>> ```
>>
>> Intel(R) Xeon(R) Gold 5318Y CPU @ 2.10GHz x2 (NUMA)
>>
>>
>> Flags: fpu de tsc msr pae mce cx8 apic sep mca cmov pat clflush acpi mmx
>> fxsr sse sse2 ss ht syscall nx rdtscp lm constant_tsc rep_good nopl
>> nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor est ssse3 fma cx16
>> sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm
>> 3dnowprefetch cpuid_fault ibpb fsgsbase bmi1 avx2 bmi2 erms rtm avx512f
>> avx512dq rdseed adx avx512ifma clflushopt clwb avx512cd sha_ni avx512bw
>> avx512vl xsaveopt xsavec xgetbv1 avx512vbmi avx512_vbmi2 gfni vaes
>> vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid fsrm md_clear
>> arch_capabilities
>>
>> ```
>>
>>
>> Next I moved the code to r3 to speed up playback:
>>
>>
>> ```
>>
>> #include <stdint.h>
>>
>> #include <stdio.h>
>>
>>
>> static __inline__ unsigned long long rdtsc(void)
>>
>> {
>>
>> unsigned hi, lo;
>>
>> __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
>>
>> return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
>>
>> }
>>
>>
>> #define MILLISECS(_ms) ((int64_t)((_ms) * 1000000ULL))
>>
>>
>> struct cpu_time_stamp {
>>
>> uint64_t local_tsc;
>>
>> int64_t local_stime;
>>
>> int64_t master_stime;
>>
>> };
>>
>>
>> struct time_scale {
>>
>> int shift;
>>
>> uint32_t mul_frac;
>>
>> };
>>
>>
>>
>> static inline uint32_t div_frac(uint32_t dividend, uint32_t divisor)
>>
>> {
>>
>> uint32_t quotient, remainder;
>>
>> asm (
>>
>> "divl %4"
>>
>> : "=a" (quotient), "=d" (remainder)
>>
>> : "0" (0), "1" (dividend), "r" (divisor) );
>>
>> return quotient;
>>
>> }
>>
>>
>>
>> void set_time_scale(struct time_scale *ts, uint64_t ticks_per_sec)
>>
>> {
>>
>> uint64_t tps64 = ticks_per_sec;
>>
>> uint32_t tps32;
>>
>> int shift = 0;
>>
>>
>> while ( tps64 > (MILLISECS(1000)*2) )
>>
>> {
>>
>> tps64 >>= 1;
>>
>> shift--;
>>
>> }
>>
>>
>> tps32 = (uint32_t)tps64;
>>
>> while ( tps32 <= (uint32_t)MILLISECS(1000) )
>>
>> {
>>
>> tps32 <<= 1;
>>
>> shift++;
>>
>> }
>>
>>
>> ts->mul_frac = div_frac(MILLISECS(1000), tps32);
>>
>> ts->shift = shift;
>>
>> }
>>
>>
>>
>> uint64_t scale_delta(uint64_t delta, const struct time_scale *scale)
>>
>> {
>>
>> uint64_t product;
>>
>>
>> if ( scale->shift < 0 )
>>
>> delta >>= -scale->shift;
>>
>> else
>>
>> delta <<= scale->shift;
>>
>>
>> asm (
>>
>> "mulq %2 ; shrd $32,%1,%0"
>>
>> : "=a" (product), "=d" (delta)
>>
>> : "rm" (delta), "0" ((uint64_t)scale->mul_frac) );
>>
>>
>> return product;
>>
>> }
>>
>>
>> #define _TS_MUL_FRAC_IDENTITY 0x80000000UL
>>
>>
>> static inline struct time_scale scale_reciprocal(struct time_scale scale)
>>
>> {
>>
>> struct time_scale reciprocal;
>>
>> uint32_t dividend;
>>
>>
>> dividend = _TS_MUL_FRAC_IDENTITY;
>>
>> reciprocal.shift = 1 - scale.shift;
>>
>> while ( dividend >= scale.mul_frac )
>>
>> {
>>
>> dividend >>= 1;
>>
>> reciprocal.shift++;
>>
>> }
>>
>>
>> asm (
>>
>> "divl %4"
>>
>> : "=a" (reciprocal.mul_frac), "=d" (dividend)
>>
>> : "0" (0), "1" (dividend), "r" (scale.mul_frac) );
>>
>>
>> return reciprocal;
>>
>> }
>>
>>
>>
>> int64_t get_s_time_fixed(const struct cpu_time_stamp *t, const struct
>> time_scale *ts, uint64_t at_tsc)
>>
>> {
>>
>> uint64_t tsc, delta;
>>
>>
>> if ( at_tsc )
>>
>> tsc = at_tsc;
>>
>> else
>>
>> tsc = rdtsc();
>>
>> delta = tsc - t->local_tsc;
>>
>> return t->local_stime + scale_delta(delta, ts);
>>
>> }
>>
>>
>> int main() {
>>
>>
>> struct cpu_time_stamp ct;
>>
>> struct time_scale ts;
>>
>> struct time_scale back;
>>
>>
>> uint64_t start = rdtsc();
>>
>>
>> set_time_scale(&ts, 3000000000);
>>
>> back = scale_reciprocal(ts);
>>
>>
>> ct.local_tsc = start;
>>
>> ct.local_stime = scale_delta(start, &ts);
>>
>>
>> while (1) {
>>
>> uint64_t new_tsc = rdtsc();
>>
>> ct.local_stime = get_s_time_fixed(&ct, &ts, new_tsc);
>>
>> ct.local_tsc = new_tsc;
>>
>>
>> uint64_t tmp_tsc = rdtsc();
>>
>> printf("%lu %lu\n", tmp_tsc, scale_delta(get_s_time_fixed(&ct, &ts,
>> tmp_tsc), &back));
>>
>> }
>>
>>
>> return 0;
>>
>> }
>>
>> ```
>>
>>
>> It's enough to run the loop for 10-20 seconds to see the problem.
>> scale_delta rounds the least significant bits during calculation, which
>> causes the error to accumulate, at different rates on different cores,
>> depending on the least significant bits at the time of calibration.
>>
>>
>> Now let's talk about why dwm reacts this way. When a snapshot is reversed,
>> last_guest_time in hvm_get_guest_time_fixed is set to 0, which doesn't
>> prevent time from flowing backwards. This means that cache_tsc_offset in
>> hvm_get_guest_tsc_fixed may be configured correctly on one physical core,
>> but due to shedding on a physical core with a lagging tsc, the guest may
>> occasionally see a tsc value lower than it saw before the snapshot was
>> reversed. If this happens to the dwm code, it terminates with an error.
>>
>>
>> A quick solution to this problem might be to save the last_seen_tsc
>> parameter in a snapshot for each core, followed by validation.
>>
>>
>> The correct solution is to remove the rounding of the least significant
>> bits from the sequence.
>>
>> On Wed, Jan 7, 2026 at 11:02 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>>> On 06.01.2026 21:10, Антон Марков wrote:
>>>> Hi, I'm not sure about the other places. In hvm_load_cpu_ctxt
>>>> (xen/arch/x86/hvm/hvm.c ), it was easy to catch because
>>>> process_pending_softirqs is frequently called there, which in turn
>>>> processes softirqs from the timer (where the timestamp is updated).
>>>> After I fixed sync_tsc in hvm_load_cpu_ctxt, the problem stopped
>>>> reproducing under no load. However, when the number of vCPUs is 4 times
>>>> greater than the number of CPUs (under heavy load), the problem rarely
>>>> reoccurs (mostly during snapshot restores during
>>>> process_pending_softirqs calls), and this is no longer a simple case.
>>> If
>>>> get_s_time_fixed can indeed be interrupted during execution after
>>>> rdtsc_ordered, then the current fix is insufficient. It's necessary to
>>>> atomically copy "t->stamp" to the stack using local_irq_disable and
>>>> local_irq_enable (as in local_time_calibration), and then work with the
>>>> copy, confident in its lifetime and immutability. But until
>>>> get_s_time_fixed is proven to be interruptible, this is premature, so
>>>> your fix is sufficient. I think I need more information and testing to
>>>> say more.
>>>
>>> While the cpu_calibration per-CPU variable is updated from IRQ context,
>>> the cpu_time one isn't. Hence t->stamp's contents cannot change behind
>>> the back of get_s_time_fixed(). I wonder whether ...
>>>
>>>> Regarding the other scale_delta calls, if they include values
>>>> calculated from externally saved tsc values that could have become
>>>> stale during the process_pending_softirqs call, this definitely needs
>>> to
>>>> be fixed.
>>>
>>> ... another similar issue (possibly one not included in the set of
>>> remarks I have in the patch, as none of those look related to what you
>>> describe) might be causing the remaining, more rare problems you say you
>>> see. That set of remarks is actually a result of me going over all other
>>> scale_delta() calls, but of course I may have got the analysis wrong.
>>>
>>> As to using 4 times as many vCPU-s as there are pCPU-s (and then heavy
>>> load) - while I don't think we have a support statement for such upstream
>>> (when probably we should), iirc for our (SUSE's) products we would
>>> consider that unsupported. Just fyi.
>>>
>>> Also, btw, please don't top-post.
>>>
>>> Jan
>>>
>>
> 



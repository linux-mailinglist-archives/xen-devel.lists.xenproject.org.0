Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6395A1D3177
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 15:38:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZE4C-0003WB-1d; Thu, 14 May 2020 13:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZE4A-0003W6-J2
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 13:38:26 +0000
X-Inumbo-ID: 2f32398c-95e8-11ea-a48d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f32398c-95e8-11ea-a48d-12813bfff9fa;
 Thu, 14 May 2020 13:38:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B07A0ABCE;
 Thu, 14 May 2020 13:38:26 +0000 (UTC)
Subject: Re: [PATCH] x86: retrieve and log CPU frequency information
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1fd091d2-30e2-0691-0485-3f5142bd457f@suse.com>
 <20200514131021.GB54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e9c7c05-e42c-52d4-f48c-9ecc8b14a1a7@suse.com>
Date: Thu, 14 May 2020 15:38:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514131021.GB54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 15:10, Roger Pau Monné wrote:
> On Wed, Apr 15, 2020 at 01:55:24PM +0200, Jan Beulich wrote:
>> While from just a single Skylake system it is already clear that we
>> can't base any of our logic on CPUID leaf 15 [1] (leaf 16 is
>> documented to be used for display purposes only anyway), logging this
>> information may still give us some reference in case of problems as well
>> as for future work. Additionally on the AMD side it is unclear whether
>> the deviation between reported and measured frequencies is because of us
>> not doing well, or because of nominal and actual frequencies being quite
>> far apart.
> 
> Can you add some reference to the AMD implementation? I've looked at
> the PMs and haven't been able to find a description of some of the
> MSRs, like 0xC0010064.

Take a look at

https://developer.amd.com/resources/developer-guides-manuals/

I'm unconvinced a reference needs adding here.

>> --- a/xen/arch/x86/cpu/intel.c
>> +++ b/xen/arch/x86/cpu/intel.c
>> @@ -378,6 +378,72 @@ static void init_intel(struct cpuinfo_x8
>>  	     ( c->cpuid_level >= 0x00000006 ) &&
>>  	     ( cpuid_eax(0x00000006) & (1u<<2) ) )
>>  		__set_bit(X86_FEATURE_ARAT, c->x86_capability);
>> +
> 
> I would split this into a separate helper, ie: intel_log_freq. That
> will allow you to exit early and reduce some of the indentation IMO.

Can do; splitting this for AMD/Hygon however was merely to
facilitate using it for both vendors, though.

>> +    if ( (opt_cpu_info && !(c->apicid & (c->x86_num_siblings - 1))) ||
>> +         c == &boot_cpu_data )
>> +    {
>> +        unsigned int eax, ebx, ecx, edx;
>> +        uint64_t msrval;
>> +
>> +        if ( c->cpuid_level >= 0x15 )
>> +        {
>> +            cpuid(0x15, &eax, &ebx, &ecx, &edx);
>> +            if ( ecx && ebx && eax )
>> +            {
>> +                unsigned long long val = ecx;
>> +
>> +                val *= ebx;
>> +                do_div(val, eax);
>> +                printk("CPU%u: TSC: %uMHz * %u / %u = %LuMHz\n",
>> +                       smp_processor_id(), ecx, ebx, eax, val);
>> +            }
>> +            else if ( ecx | eax | ebx )
>> +            {
>> +                printk("CPU%u: TSC:", smp_processor_id());
>> +                if ( ecx )
>> +                    printk(" core: %uMHz", ecx);
>> +                if ( ebx && eax )
>> +                    printk(" ratio: %u / %u", ebx, eax);
>> +                printk("\n");
>> +            }
>> +        }
>> +
>> +        if ( c->cpuid_level >= 0x16 )
>> +        {
>> +            cpuid(0x16, &eax, &ebx, &ecx, &edx);
>> +            if ( ecx | eax | ebx )
>> +            {
>> +                printk("CPU%u:", smp_processor_id());
>> +                if ( ecx )
>> +                    printk(" bus: %uMHz", ecx);
>> +                if ( eax )
>> +                    printk(" base: %uMHz", eax);
>> +                if ( ebx )
>> +                    printk(" max: %uMHz", ebx);
>> +                printk("\n");
>> +            }
>> +        }
>> +
>> +        if ( !rdmsr_safe(MSR_INTEL_PLATFORM_INFO, msrval) &&
>> +             (uint8_t)(msrval >> 8) )
> 
> I would introduce a mask for it would be cleaner, since you use it
> here and below (and would avoid the casting to uint8_t.

To avoid the casts (also below) I could introduce local variables.
I specifically wanted to avoid MASK_EXTR() such that the rest of the
calculations in

            if ( (uint8_t)(msrval >> 40) )
                printk("%u..", (factor * (uint8_t)(msrval >> 40) + 50) / 100);
            printk("%u MHz\n", (factor * (uint8_t)(msrval >> 8) + 50) / 100);

can be done as 32-bit arithmetic.

>> +        {
>> +            unsigned int factor = 10000;
>> +
>> +            if ( c->x86 == 6 )
>> +                switch ( c->x86_model )
>> +                {
>> +                case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
>> +                case 0x25: case 0x2c: case 0x2f: /* Westmere */
>> +                    factor = 13333;
> 
> The SDM lists ratio * 100MHz without any notes, why are those models
> different, is this some errata?

Did you go through the MSR lists for the various models? It's there
where I found this anomaly, not in any spec updates.

>> +                    break;
>> +                }
>> +
>> +            printk("CPU%u: ", smp_processor_id());
>> +            if ( (uint8_t)(msrval >> 40) )
>> +                printk("%u..", (factor * (uint8_t)(msrval >> 40) + 50) / 100);
>> +            printk("%u MHz\n", (factor * (uint8_t)(msrval >> 8) + 50) / 100);
> 
> Since you are calculating using Hz, should you use an unsigned long
> factor to prevent capping at 4GHz?

Hmm, the calculation looks to be in units of 10kHz, until the division
by 100. I don't think we'd cap at 4GHz this way.

>> --- a/xen/include/asm-x86/msr.h
>> +++ b/xen/include/asm-x86/msr.h
>> @@ -40,8 +40,8 @@ static inline void wrmsrl(unsigned int m
>>  
>>  /* rdmsr with exception handling */
>>  #define rdmsr_safe(msr,val) ({\
>> -    int _rc; \
>> -    uint32_t lo, hi; \
>> +    int rc_; \
>> +    uint32_t lo_, hi_; \
>>      __asm__ __volatile__( \
>>          "1: rdmsr\n2:\n" \
>>          ".section .fixup,\"ax\"\n" \
>> @@ -49,15 +49,15 @@ static inline void wrmsrl(unsigned int m
>>          "   movl %5,%2\n; jmp 2b\n" \
>>          ".previous\n" \
>>          _ASM_EXTABLE(1b, 3b) \
>> -        : "=a" (lo), "=d" (hi), "=&r" (_rc) \
>> +        : "=a" (lo_), "=d" (hi_), "=&r" (rc_) \
>>          : "c" (msr), "2" (0), "i" (-EFAULT)); \
>> -    val = lo | ((uint64_t)hi << 32); \
>> -    _rc; })
>> +    val = lo_ | ((uint64_t)hi_ << 32); \
>> +    rc_; })
> 
> Since you are changing the local variable names, I would just switch
> rdmsr_safe to a static inline, and drop the underlines. I don't see a
> reason this has to stay as a macro.

Well, all callers would need to be changed to pass the address of
the variable to store the value read into. That's quite a bit of
code churn, and hence nothing I'd want to do in this patch.

>>  /* wrmsr with exception handling */
>>  static inline int wrmsr_safe(unsigned int msr, uint64_t val)
>>  {
>> -    int _rc;
>> +    int rc;
>>      uint32_t lo, hi;
>>      lo = (uint32_t)val;
>>      hi = (uint32_t)(val >> 32);
> 
> Since you are already playing with this, could you initialize lo and
> hi at definition time?

If I was touching any of the three lines anyway - yes. But the way
it is it looks like an unrelated change to me.

Jan


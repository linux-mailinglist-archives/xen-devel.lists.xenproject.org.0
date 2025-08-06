Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4ADB1C4F7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 13:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071651.1435072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcOo-00050Q-Kq; Wed, 06 Aug 2025 11:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071651.1435072; Wed, 06 Aug 2025 11:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcOo-0004yG-Hl; Wed, 06 Aug 2025 11:33:38 +0000
Received: by outflank-mailman (input) for mailman id 1071651;
 Wed, 06 Aug 2025 11:33:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctQb=2S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ujcOm-0004y9-MI
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 11:33:36 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2faf35e9-72b9-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 13:33:34 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af925cbd73aso1104812466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 04:33:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a076724sm1077100666b.23.2025.08.06.04.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 04:33:32 -0700 (PDT)
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
X-Inumbo-ID: 2faf35e9-72b9-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754480014; x=1755084814; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpKmtO37QvU/L3UzQlNzQGh6yfR58CMadahh9bQOu1k=;
        b=ZSQLejLWnwq7XBuJGwtT78wrRQG/6l7KvVSi2qYgvadkpdQ5xAufN9pLmiPlLevq9C
         4yBdDLQP3TyJnbpDjwlaW3dAaNnHE/qCBONhIuPv7ZJEj3Ih5bOFNVZdbt1vtj2mSjax
         7GCzYd8ajhJz2sC0YyWoIs4Wi/i18ZfusQST3A7zGD9M3XYcydCRC5+8d4yxXrCYvvP6
         gQo3LVlKByBZHleqrx/4HTGSHlSPt3xhNrPl6pCVNRdmC+uIs/JvwhIFZHIcBO64prZk
         SfiDIiRCVrC0IbuEUyvX6dJXnaRNhJZveyfoYEceB2DpcLKhohaoGp+VDvROGxAeGcsu
         smJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754480014; x=1755084814;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tpKmtO37QvU/L3UzQlNzQGh6yfR58CMadahh9bQOu1k=;
        b=K0+z9HVZGl2+4Zd3skHDQ4HSXvA5PoFRufUZ4lgRicEWMWlyPnulMTRj/l1FS/eQPU
         L2ioWQL6cjXoT9NiWJoeHdaWZMeZoHoADvtz5UgT1CPSoT52hQLuEoq8gmNq7HGybjGh
         gY02OTrekHzffTTpnz5AX6r0dwqPm0WeJNiVMqEvbw4norTYZzAEi0xW3BCyV8ujBJxq
         VYuc3nExcILYNiHrryUP31CtBDaxlUvif7Ngsf1hXpnXn8WIqJIbAxGJZ59l/6CGioOj
         3wwRldj8rvjUQvMxKdThzlDAi/mk1+WaIfEq4lIA9hrfIdrwXtc8wIa0YIKHgJVEkl6p
         rJIw==
X-Forwarded-Encrypted: i=1; AJvYcCWkpseYthG0tFhYRvEwAa7e+a43QB9oWyhX5AnOkmkyS94wzfx+w2haZ8HV37KknFY5u6tRMYC5vgg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGkU+f+IWUwKeizXlMm2B1AjX0BlsdCophhfg0hIi7snQx8JQT
	+KWR1c5S5Ap8Z+nNywFqwORoAAjdxf1Qy82p6g/hUCCuMaCX9h9D83sL
X-Gm-Gg: ASbGncv8Zicpd34nW3uwZwgTcjAMOyjyY5kMvhsInPIoPvhKKZiBgqZJ+7Wx5Cv5dk2
	peW0RbvEvRczPydYVgKLpKgfKqpjWbHqobF7xadGo9Wzc2NonTIUzxId9FUS9ZD4fL0dDLUPPO8
	A8KPQE8UWBcg/qFU0aI3FqFMWACvVWr2Cm0bIRwy1clk9BD4kPzYqMuOlEWN5GpbNkFbzwLaygf
	WB/pnquyvLqrT5sr0kDyunoecycRF5UaAC1OPYKCililaB8YJZg824qt2a7KHH7YJWGyzKFTHM7
	bYxFYTvauLuiZgwGmrw/hC4lZXCxlDZpv/WvhbOLLo1KV8U5AJGvr+Yn+UQxw99cftMHyKNXSiP
	3mT1QfG0UUq6XrBU2v2bgfiavbWLnz1JzIiS4sHhoRXN06LunBqQB42GohnnAzIctRKM0TJ4=
X-Google-Smtp-Source: AGHT+IGDI4dMSIlJ8AQNPXsHQYHZhxHcMiiIvfng7+FT1BsHCGErKu+LywLW5npAgiFTQOvnqHtLeg==
X-Received: by 2002:a17:907:e989:b0:ae3:8c9b:bd61 with SMTP id a640c23a62f3a-af99010dd9bmr211662166b.12.1754480013390;
        Wed, 06 Aug 2025 04:33:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------AK7SuHGjOpmcvQDZfEVxjVSd"
Message-ID: <bcf4c3aa-5c09-4171-a4f5-85110d6e634f@gmail.com>
Date: Wed, 6 Aug 2025 13:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 03/20] xen/riscv: introduce VMID allocation and
 manegement
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <d61f5f831ac8045055a1775ee710d4f2fe8dcc26.1753973161.git.oleksii.kurochko@gmail.com>
 <cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com>
Content-Language: en-US
In-Reply-To: <cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com>

This is a multi-part message in MIME format.
--------------AK7SuHGjOpmcvQDZfEVxjVSd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/4/25 5:19 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> Current implementation is based on x86's way to allocate VMIDs:
>>    VMIDs partition the physical TLB. In the current implementation VMIDs are
>>    introduced to reduce the number of TLB flushes.  Each time the guest's
>>    virtual address space changes,
> virtual?

I assumed that originally it meant that from Xen point of view it could be
called guest's virtual as guest doesn't really work with real physical address,
but it seems like it would be more clear to use guest-physical as you suggested
below.

>> instead of flushing the TLB, a new VMID is
>>    assigned.  This reduces the number of TLB flushes to at most 1/#VMIDs.
>>    The biggest advantage is that hot parts of the hypervisor's code and data
>>    retain in the TLB.
>>
>>    VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
>>    VMIDs are assigned in a round-robin scheme.  To minimize the overhead of
>>    VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
>>    64-bit generation. Only on a generation overflow the code needs to
>>    invalidate all VMID information stored at the VCPUs with are run on the
>>    specific physical processor.  This overflow appears after about 2^80
>>    host processor cycles,
> Where's this number coming from? (If you provide numbers, I think they will
> want to be "reproducible" by the reader. Which I fear isn't the case here.)

The 2^80 cycles (based on x86-related numbers) result from:
   1. And VM-Entry/-Exit cycle takes at least 1800 cycles (approximated by 2^10)
   2. We have 64 ASIDs (2^6)
   3. 2^64 generations.
I removed this part of the comment earlier because I assumed that the first
item is quite CPU-dependent, even for x86, let alone for other architectures,
which may have a different number (?).
However, this part of the comment was reintroduced during one of the merges.

>> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>   
>>       console_init_postirq();
>>   
>> +    vmid_init();
> This lives here only temporarily, I assume? Every hart will need to execute
> it, and hence (like we have it on x86) this may want to be a central place
> elsewhere.

I haven’t checked how it is done on x86; I probably should.

I planned to call it for each hart separately during secondary hart bring-up,
since accessing the|hgatp| register of a hart is required to detect|VMIDLEN|.
Therefore,|vmid_init()| should be called for secondary harts when their
initialization code starts executing.

>> --- /dev/null
>> +++ b/xen/arch/riscv/vmid.c
>> @@ -0,0 +1,165 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/domain.h>
>> +#include <xen/init.h>
>> +#include <xen/sections.h>
>> +#include <xen/lib.h>
>> +#include <xen/param.h>
>> +#include <xen/percpu.h>
>> +
>> +#include <asm/atomic.h>
>> +#include <asm/csr.h>
>> +#include <asm/flushtlb.h>
>> +
>> +/* Xen command-line option to enable VMIDs */
>> +static bool __read_mostly opt_vmid_enabled = true;
> __ro_after_init ?

Agree, __ro_afer_init would be better.

>> +boolean_param("vmid", opt_vmid_enabled);
>> +
>> +/*
>> + * VMIDs partition the physical TLB. In the current implementation VMIDs are
>> + * introduced to reduce the number of TLB flushes.  Each time the guest's
>> + * virtual address space changes, instead of flushing the TLB, a new VMID is
> The same odd "virtual" again? All the code here is about guest-physical, isn't
> it?

Answered above.

>> + * assigned. This reduces the number of TLB flushes to at most 1/#VMIDs.
>> + * The biggest advantage is that hot parts of the hypervisor's code and data
>> + * retain in the TLB.
>> + *
>> + * Sketch of the Implementation:
>> + *
>> + * VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
>> + * VMIDs are assigned in a round-robin scheme.  To minimize the overhead of
>> + * VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
>> + * 64-bit generation. Only on a generation overflow the code needs to
>> + * invalidate all VMID information stored at the VCPUs with are run on the
>> + * specific physical processor.  This overflow appears after about 2^80
> And the same interesting number again.

Answered above.

>> + * host processor cycles, so we do not optimize this case, but simply disable
>> + * VMID useage to retain correctness.
>> + */
>> +
>> +/* Per-Hart VMID management. */
>> +struct vmid_data {
>> +   uint64_t hart_vmid_generation;
> Any reason not to simply use "generation"?

No specific reason for that, it could be renamed to "generation".

>> +   uint16_t next_vmid;
>> +   uint16_t max_vmid;
>> +   bool disabled;
>> +};
>> +
>> +static DEFINE_PER_CPU(struct vmid_data, vmid_data);
>> +
>> +static unsigned long vmidlen_detect(void)
> __init ? Or wait, are you (deliberately) permitting different VMIDLEN
> across harts?

All what I was able in RISC-V spec is that:
   The number of VMID bits is UNSPECIFIED and may be zero. The number of
   implemented VMID bits, termed VMIDLEN, may be determined by writing one
   to every bit position in the VMID field, then reading back the value in
   hgatp to see which bit positions in the VMID field hold a one. The least-
   significant bits of VMID are implemented first: that is, if VMIDLEN > 0,
   VMID[VMIDLEN-1:0] is writable. The maximal value of VMIDLEN, termed
   VMIDMAX, is 7 for Sv32x4 or 14 for Sv39x4, Sv48x4, and Sv57x4..
And I couldn't find explicitly that VMIDLEN will be the same across harts.

Therefore, IMO, while the specification doesn't guarantee VMID will be
different, the "unspecified" nature and the per-hart discovery mechanism
of VMIDLEN in the hgatp CSR allows for VMIDLEN to be different on
different harts in an implementation without violating the
RISC-V privileged specification.



>
>> +{
>> +    unsigned long vmid_bits;
> Why "long" (also for the function return type)?

Because csr_read() returns unsigned long as HGATP register has
'unsigned long' length.

But it could be done in this way:
     csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
     vmid_bits =  MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
     vmid_bits = ffs_g(vmid_bits);
     csr_write(CSR_HGATP, old);
And then use uint16_t for vmid_bits and use uin16_t as a return type.

>
>> +    unsigned long old;
>> +
>> +    /* Figure-out number of VMID bits in HW */
>> +    old = csr_read(CSR_HGATP);
>> +
>> +    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>> +    vmid_bits = csr_read(CSR_HGATP);
>> +    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
> Nit: Stray blank.
>
>> +    vmid_bits = flsl(vmid_bits);
>> +    csr_write(CSR_HGATP, old);
>> +
>> +    /*
>> +     * We polluted local TLB so flush all guest TLB as
>> +     * a speculative access can happen at any time.
>> +     */
>> +    local_hfence_gvma_all();
> There's no guest running. If you wrote hgat.MODE as zero, as per my
> understanding now new TLB entries could even purely theoretically appear.

It could be an issue (or, at least, it is recommended) when hgatp.MODE is
changed:
  If hgatp.MODE is changed for a given VMID, an HFENCE.GVMA with rs1=x0
  (and rs2 set to either x0 or the VMID) must be executed to order subsequent
  guest translations with the MODE change—even if the old MODE or new MODE
  is Bare.
On other hand it is guaranteed that, at least, on Reset (and so I assume
for power on) that:
  If the hypervisor extension is implemented, the hgatp.MODE and vsatp.MODE
  fields are reset to 0.

So it seems like if no guest is ran then there is no need even to write
hgatp.MODE as zero, but it might be sense to do that explicitly just to
be sure.

I thought it was possible to have a running guest and perform a CPU hotplug.
In that case, I expect that during the hotplug,|vmidlen_detect()| will be
called and return the|vmid_bits| value, which is used as the active VMID.
At that moment, the local TLB could be speculatively polluted, I think.
Likely, it makes sense to call vmidlen_detect() only once for each hart
during initial bringup.


> In fact, with no guest running (yet) I'm having a hard time seeing why
> you shouldn't be able to simply write the register with just
> HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
> whether "old" needs restoring; writing plain zero afterwards ought to
> suffice. You're in charcge of the register, after all.

It make sense (but I don't know if it is a possible case) to be sure that
HGATP.MODE remains the same, so there is no need to have TLB flush. If
HGATP.MODE is changed then it will be needed to do TLB flush as I mentioned
above.

If we agreed to keep local_hfence_gvma_all() then I think it isn't really
any sense to restore 'old' or OR-ing it with HGATP_VMID_MASK.

Generally if 'old' is guaranteed to be zero (and, probably, it makes sense
to check that in vmidlen_detect() and panic if it isn't zero) and if
vmidlen_detect() function will be called before any guest domain(s) will
be ran then I could agree that we don't need local_hfence_gvma_all() here.

As an option we can do local_hfence_gvma_all() only if 'old' value wasn't
set to zero.

Does it make sense?

>
>> +    return vmid_bits;
>> +}
>> +
>> +void vmid_init(void)
>> +{
>> +    static bool g_disabled = false;
>> +    unsigned long vmid_len = vmidlen_detect();
>> +    struct vmid_data *data = &this_cpu(vmid_data);
>> +    unsigned long max_availalbe_bits = sizeof(data->max_vmid) << 3;
> Nit: Typo in "available". Also now that we have it, better use
> BITS_PER_BYTE here?

Sure, I will use BITS_PER_BYTE.

>
>> +    if ( vmid_len > max_availalbe_bits )
>> +        panic("%s: VMIDLEN is bigger then a type which represent VMID: %lu(%lu)\n",
>> +              __func__, vmid_len, max_availalbe_bits);
> This shouldn't be a runtime check imo. What you want to check (at build
> time) is that the bits set in HGATP_VMID_MASK can be held in ->max_vmid.

Oh, I just noticed that this check isn't even really correct because of
data->max_vmid is inited after this check.

Anyway, build time check would be better.

>
>> +    data->max_vmid = BIT(vmid_len, U) - 1;
>> +    data->disabled = !opt_vmid_enabled || (vmid_len <= 1);
> Actually, what exactly does it mean that "VMIDs are disabled"? There's
> no enable bit that I could find anywhere. Isn't it rather that in this
> case you need to arrange to flush always on VM entry (or always after a
> P2M change, depending how the TLB is split between guest and host use)?

"VMIDs are disabled" here means that TLB flush will happen each time p2m
is changed.

> If you look at vmx_vmenter_helper(), its flipping of
> SECONDARY_EXEC_ENABLE_VPID tweaks CPU behavior, such that the flush
> would be implicit (when the bit is off). I don't expect RISC-V has any
> such "implicit" flushing behavior?

RISC-V relies on explicit software-managed fence instructions for TLB
flushing.

It seems like vmid_handle_vmenter() should be updated then to return
true if VMIDs are disabled:
   bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
   {
       struct vmid_data *data = &this_cpu(vmid_data);
   
   ...
   
       /*
        * When we assign VMID 1, flush all TLB entries as we are starting a new
        * generation, and all old VMID allocations are now stale.
        */
       return (vmid->vmid == 1);
   
    disabled:
       vmid->vmid = 0;
-      return 0;
+      return true;
   }

>
>> +    if ( g_disabled != data->disabled )
>> +    {
>> +        printk("%s: VMIDs %sabled.\n", __func__,
>> +               data->disabled ? "dis" : "en");
>> +        if ( !g_disabled )
>> +            g_disabled = data->disabled;
> This doesn't match x86 code. g_disabled is a tristate there, which only
> the boot CPU would ever write to.

Why g_disabled is written only by boot CPU? Does x86 have only two options
or VMIDs are enabled for all CPUs or it is disabled for all of them?

For RISC-V as I mentioned above it is needed to check all harts as the spec.
doesn't explicitly mention that VMIDLEN is equal for all harts...

>
> A clear shortcoming of the x86 code (that you copied) is that the log
> message doesn't identify the CPU in question. A sequence of "disabled"
> and "enabled" could thus result, without the last one (or in fact any
> one) making clear what the overall state is. I think you want to avoid
> this from the beginning.

... Thereby it seems like declaration of g_disabled should be moved outside
vmid_init() function and add a new function which will return g_disabled
value (or just make g_disabled not static and rename to something like
g_vmids_disabled).

And the print message once after all harts will be initialized, somewhere
in setup.c in start_xen() after:
  
for_each_present_cpu ( i )
{
if( (num_online_cpus()< nr_cpu_ids)&& !cpu_online(i))
{
intret = cpu_up(i);
if( ret != 0)
printk("Failed to bring up CPU %u (error %d)\n", i, ret);
}
}
(RISC-V doesn't have such code at the moment)

~ Oleksii

--------------AK7SuHGjOpmcvQDZfEVxjVSd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/4/25 5:19 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Current implementation is based on x86's way to allocate VMIDs:
  VMIDs partition the physical TLB. In the current implementation VMIDs are
  introduced to reduce the number of TLB flushes.  Each time the guest's
  virtual address space changes,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">virtual?</pre>
    </blockquote>
    <pre>I assumed that originally it meant that from Xen point of view it could be
called guest's virtual as guest doesn't really work with real physical address,
but it seems like it would be more clear to use guest-physical as you suggested
below.
</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">instead of flushing the TLB, a new VMID is
  assigned.  This reduces the number of TLB flushes to at most 1/#VMIDs.
  The biggest advantage is that hot parts of the hypervisor's code and data
  retain in the TLB.

  VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
  VMIDs are assigned in a round-robin scheme.  To minimize the overhead of
  VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
  64-bit generation. Only on a generation overflow the code needs to
  invalidate all VMID information stored at the VCPUs with are run on the
  specific physical processor.  This overflow appears after about 2^80
  host processor cycles,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Where's this number coming from? (If you provide numbers, I think they will
want to be "reproducible" by the reader. Which I fear isn't the case here.)</pre>
    </blockquote>
    <pre>The 2^80 cycles (based on x86-related numbers) result from:
  1. And VM-Entry/-Exit cycle takes at least 1800 cycles (approximated by 2^10)
  2. We have 64 ASIDs (2^6)
  3. 2^64 generations.
I removed this part of the comment earlier because I assumed that the first
item is quite CPU-dependent, even for x86, let alone for other architectures,
which may have a different number (?).
However, this part of the comment was reintroduced during one of the merges.

</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     console_init_postirq();
 
+    vmid_init();
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This lives here only temporarily, I assume? Every hart will need to execute
it, and hence (like we have it on x86) this may want to be a central place
elsewhere.</pre>
    </blockquote>
    <pre data-start="51" data-end="112">I haven’t checked how it is done on x86; I probably should.</pre>
    <pre data-start="114" data-end="382">I planned to call it for each hart separately during secondary hart bring-up,
since accessing the <code data-start="212" data-end="219">hgatp</code> register of a hart is required to detect <code
    data-start="261" data-end="270">VMIDLEN</code>.
Therefore, <code data-start="283" data-end="296">vmid_init()</code> should be called for secondary harts when their
initialization code starts executing.

</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/vmid.c
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include &lt;xen/domain.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/sections.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/param.h&gt;
+#include &lt;xen/percpu.h&gt;
+
+#include &lt;asm/atomic.h&gt;
+#include &lt;asm/csr.h&gt;
+#include &lt;asm/flushtlb.h&gt;
+
+/* Xen command-line option to enable VMIDs */
+static bool __read_mostly opt_vmid_enabled = true;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">__ro_after_init ?</pre>
    </blockquote>
    <pre>Agree, __ro_afer_init would be better.
</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+boolean_param("vmid", opt_vmid_enabled);
+
+/*
+ * VMIDs partition the physical TLB. In the current implementation VMIDs are
+ * introduced to reduce the number of TLB flushes.  Each time the guest's
+ * virtual address space changes, instead of flushing the TLB, a new VMID is
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">The same odd "virtual" again? All the code here is about guest-physical, isn't
it?</pre>
    </blockquote>
    <pre>Answered above.</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * assigned. This reduces the number of TLB flushes to at most 1/#VMIDs.
+ * The biggest advantage is that hot parts of the hypervisor's code and data
+ * retain in the TLB.
+ *
+ * Sketch of the Implementation:
+ *
+ * VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
+ * VMIDs are assigned in a round-robin scheme.  To minimize the overhead of
+ * VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
+ * 64-bit generation. Only on a generation overflow the code needs to
+ * invalidate all VMID information stored at the VCPUs with are run on the
+ * specific physical processor.  This overflow appears after about 2^80
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">And the same interesting number again.</pre>
    </blockquote>
    <pre>Answered above.
</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * host processor cycles, so we do not optimize this case, but simply disable
+ * VMID useage to retain correctness.
+ */
+
+/* Per-Hart VMID management. */
+struct vmid_data {
+   uint64_t hart_vmid_generation;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Any reason not to simply use "generation"?</pre>
    </blockquote>
    <pre>No specific reason for that, it could be renamed to "generation".

</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+   uint16_t next_vmid;
+   uint16_t max_vmid;
+   bool disabled;
+};
+
+static DEFINE_PER_CPU(struct vmid_data, vmid_data);
+
+static unsigned long vmidlen_detect(void)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">__init ? Or wait, are you (deliberately) permitting different VMIDLEN
across harts?</pre>
    </blockquote>
    <pre>All what I was able in RISC-V spec is that:
  The number of VMID bits is UNSPECIFIED and may be zero. The number of
  implemented VMID bits, termed VMIDLEN, may be determined by writing one
  to every bit position in the VMID field, then reading back the value in
  hgatp to see which bit positions in the VMID field hold a one. The least-
  significant bits of VMID are implemented first: that is, if VMIDLEN &gt; 0,
  VMID[VMIDLEN-1:0] is writable. The maximal value of VMIDLEN, termed
  VMIDMAX, is 7 for Sv32x4 or 14 for Sv39x4, Sv48x4, and Sv57x4..
And I couldn't find explicitly that VMIDLEN will be the same across harts.

Therefore, IMO, while the specification doesn't guarantee VMID will be
different, the "unspecified" nature and the per-hart discovery mechanism
of VMIDLEN in the hgatp CSR allows for VMIDLEN to be different on
different harts in an implementation without violating the
RISC-V privileged specification.



</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    unsigned long vmid_bits;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why "long" (also for the function return type)?</pre>
    </blockquote>
    <pre>Because csr_read() returns unsigned long as HGATP register has
'unsigned long' length.

But it could be done in this way:
    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
    vmid_bits =  MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
    vmid_bits = ffs_g(vmid_bits);
    csr_write(CSR_HGATP, old);
And then use uint16_t for vmid_bits and use uin16_t as a return type.

</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    unsigned long old;
+
+    /* Figure-out number of VMID bits in HW */
+    old = csr_read(CSR_HGATP);
+
+    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
+    vmid_bits = csr_read(CSR_HGATP);
+    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: Stray blank.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    vmid_bits = flsl(vmid_bits);
+    csr_write(CSR_HGATP, old);
+
+    /*
+     * We polluted local TLB so flush all guest TLB as
+     * a speculative access can happen at any time.
+     */
+    local_hfence_gvma_all();
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">There's no guest running. If you wrote hgat.MODE as zero, as per my
understanding now new TLB entries could even purely theoretically appear.</pre>
    </blockquote>
    <pre>It could be an issue (or, at least, it is recommended) when hgatp.MODE is
changed:
 If hgatp.MODE is changed for a given VMID, an HFENCE.GVMA with rs1=x0
 (and rs2 set to either x0 or the VMID) must be executed to order subsequent
 guest translations with the MODE change—even if the old MODE or new MODE
 is Bare.
On other hand it is guaranteed that, at least, on Reset (and so I assume
for power on) that:
 If the hypervisor extension is implemented, the hgatp.MODE and vsatp.MODE
 fields are reset to 0.

So it seems like if no guest is ran then there is no need even to write
hgatp.MODE as zero, but it might be sense to do that explicitly just to
be sure.

I thought it was possible to have a running guest and perform a CPU hotplug.
In that case, I expect that during the hotplug, <code data-start="178"
    data-end="196">vmidlen_detect()</code> will be
called and return the <code data-start="227" data-end="238">vmid_bits</code> value, which is used as the active VMID.
At that moment, the local TLB could be speculatively polluted, I think.
Likely, it makes sense to call vmidlen_detect() only once for each hart
during initial bringup.
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <pre wrap="" class="moz-quote-pre">
In fact, with no guest running (yet) I'm having a hard time seeing why
you shouldn't be able to simply write the register with just
HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
whether "old" needs restoring; writing plain zero afterwards ought to
suffice. You're in charcge of the register, after all.</pre>
    </blockquote>
    <pre>It make sense (but I don't know if it is a possible case) to be sure that
HGATP.MODE remains the same, so there is no need to have TLB flush. If
HGATP.MODE is changed then it will be needed to do TLB flush as I mentioned
above.

If we agreed to keep local_hfence_gvma_all() then I think it isn't really
any sense to restore 'old' or OR-ing it with HGATP_VMID_MASK.

Generally if 'old' is guaranteed to be zero (and, probably, it makes sense
to check that in vmidlen_detect() and panic if it isn't zero) and if
vmidlen_detect() function will be called before any guest domain(s) will
be ran then I could agree that we don't need local_hfence_gvma_all() here.

As an option we can do local_hfence_gvma_all() only if 'old' value wasn't
set to zero.

Does it make sense?
</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    return vmid_bits;
+}
+
+void vmid_init(void)
+{
+    static bool g_disabled = false;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    unsigned long vmid_len = vmidlen_detect();
+    struct vmid_data *data = &amp;this_cpu(vmid_data);
+    unsigned long max_availalbe_bits = sizeof(data-&gt;max_vmid) &lt;&lt; 3;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: Typo in "available". Also now that we have it, better use
BITS_PER_BYTE here?</pre>
    </blockquote>
    <pre>Sure, I will use BITS_PER_BYTE.

</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( vmid_len &gt; max_availalbe_bits )
+        panic("%s: VMIDLEN is bigger then a type which represent VMID: %lu(%lu)\n",
+              __func__, vmid_len, max_availalbe_bits);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This shouldn't be a runtime check imo. What you want to check (at build
time) is that the bits set in HGATP_VMID_MASK can be held in -&gt;max_vmid.</pre>
    </blockquote>
    <pre>Oh, I just noticed that this check isn't even really correct because of
data-&gt;max_vmid is inited after this check.

Anyway, build time check would be better.

</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    data-&gt;max_vmid = BIT(vmid_len, U) - 1;
+    data-&gt;disabled = !opt_vmid_enabled || (vmid_len &lt;= 1);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Actually, what exactly does it mean that "VMIDs are disabled"? There's
no enable bit that I could find anywhere. Isn't it rather that in this
case you need to arrange to flush always on VM entry (or always after a
P2M change, depending how the TLB is split between guest and host use)?</pre>
    </blockquote>
    <pre>"VMIDs are disabled" here means that TLB flush will happen each time p2m
is changed.
</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <pre wrap="" class="moz-quote-pre">
If you look at vmx_vmenter_helper(), its flipping of
SECONDARY_EXEC_ENABLE_VPID tweaks CPU behavior, such that the flush
would be implicit (when the bit is off). I don't expect RISC-V has any
such "implicit" flushing behavior?</pre>
    </blockquote>
    <pre>RISC-V relies on explicit software-managed fence instructions for TLB
flushing.

It seems like vmid_handle_vmenter() should be updated then to return
true if VMIDs are disabled:
  bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
  {
      struct vmid_data *data = &amp;this_cpu(vmid_data);
  
  ...
  
      /*
       * When we assign VMID 1, flush all TLB entries as we are starting a new
       * generation, and all old VMID allocations are now stale.
       */
      return (vmid-&gt;vmid == 1);
  
   disabled:
      vmid-&gt;vmid = 0;
-      return 0;
+      return true;
  }

</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( g_disabled != data-&gt;disabled )
+    {
+        printk("%s: VMIDs %sabled.\n", __func__,
+               data-&gt;disabled ? "dis" : "en");
+        if ( !g_disabled )
+            g_disabled = data-&gt;disabled;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This doesn't match x86 code. g_disabled is a tristate there, which only
the boot CPU would ever write to.</pre>
    </blockquote>
    <pre>Why g_disabled is written only by boot CPU? Does x86 have only two options
or VMIDs are enabled for all CPUs or it is disabled for all of them?

For RISC-V as I mentioned above it is needed to check all harts as the spec.
doesn't explicitly mention that VMIDLEN is equal for all harts...

</pre>
    <blockquote type="cite"
      cite="mid:cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com">
      <pre wrap="" class="moz-quote-pre">

A clear shortcoming of the x86 code (that you copied) is that the log
message doesn't identify the CPU in question. A sequence of "disabled"
and "enabled" could thus result, without the last one (or in fact any
one) making clear what the overall state is. I think you want to avoid
this from the beginning.</pre>
    </blockquote>
    <pre>... Thereby it seems like declaration of g_disabled should be moved outside
vmid_init() function and add a new function which will return g_disabled
value (or just make g_disabled not static and rename to something like
g_vmids_disabled).

And the print message once after all harts will be initialized, somewhere
in setup.c in start_xen() after:
 
<span><span class="">    for_each_present_cpu </span><span class="">( i )</span></span>
<span><span class="">    {</span></span>
<span><span class="">        </span><span class="hljs-keyword">if</span><span
    class=""> </span><span class="">( </span><span class="">(num_online_cpus</span><span
    class="">()</span><span class=""> &lt; nr_cpu_ids)</span><span
    class=""> &amp;&amp; !cpu_online</span><span class="">(i)</span><span
    class=""> )</span></span>
<span><span class="">        {</span></span>
<span><span class="">            </span><span class="hljs-type">int</span><span
    class=""> ret </span><span class="">= cpu_up</span><span class="">(i)</span><span
    class="">;</span></span>
<span><span class="">            </span><span class="hljs-keyword">if</span><span
    class=""> </span><span class="">( ret != </span><span
    class="hljs-number">0</span><span class=""> )</span></span>
<span><span class="">                printk</span><span class="">(</span><span
    class="hljs-string"><span class="hljs-string">"Failed to bring up CPU %u (error %d)</span><span
    class="hljs-string">\n</span><span class="hljs-string">"</span></span><span
    class="">, i, ret)</span><span class="">;</span></span>
<span><span class="">        }</span></span>
<span><span class="">    }</span></span>
(RISC-V doesn't have such code at the moment)

~ Oleksii</pre>
  </body>
</html>

--------------AK7SuHGjOpmcvQDZfEVxjVSd--


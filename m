Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83626B1C9B6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 18:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071991.1435316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujgvx-0003gk-4A; Wed, 06 Aug 2025 16:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071991.1435316; Wed, 06 Aug 2025 16:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujgvx-0003ed-02; Wed, 06 Aug 2025 16:24:09 +0000
Received: by outflank-mailman (input) for mailman id 1071991;
 Wed, 06 Aug 2025 16:24:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctQb=2S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ujgvv-0003eX-3L
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 16:24:07 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4a052b9-72e1-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 18:24:04 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6156a162537so80813a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 09:24:04 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm1123223666b.59.2025.08.06.09.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 09:24:02 -0700 (PDT)
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
X-Inumbo-ID: c4a052b9-72e1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754497444; x=1755102244; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ybvpIqwuF3ePcDmzIsNZ3US31Obwf8zrNOm6OAeNzk=;
        b=AhOMeUhcmuxRrWbssZato4NxwMDHeIkaWareNig9a1ggYoiDqp6pKUD+rsAg0jzj64
         bLrEAjTSplBtYaQ5jhvGX+DdDU6Ug7qeWsPjYruv4lPa6c0tRIGoSNYr1hOhc1FcOrQ2
         OmGrA+tUj/s5318qglysmmMlDE9nU/8gZPWOHw4cnQC9X9kJJ6ft0ykRzbCO1pgPq1OP
         NBqBvi/lolHp0CT7FBD9l380lF9OGQkHUtj6WO1LzrokGp8k/HC56bXQ0jgyqTxJK33c
         9NRh5WrD7TdJ7zIDFFwSaBGnge6BXXedtybkjBqDJl88C/0aUn4CNB7k4fh1MnEmjbRP
         SkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754497444; x=1755102244;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ybvpIqwuF3ePcDmzIsNZ3US31Obwf8zrNOm6OAeNzk=;
        b=UUoygKtPefMNZNV7Pd8epfURnpr22b2kjJIrY/3sNbNI6OffwOcm3jLB8joX30gds6
         iYRzxf/vwwSIN+nZymvPe67XyrMQa60bLhmeqDfU7MJhHcunaaK0GN8kQvji9BKErfb2
         rQSO83BXA0nNs1Y+2/4Fegx6FI+6U7Vtj/xlbXyQXBX4lD4qmbeCuF5ns0DVzrJ3Dp67
         1bFSicAZy6jolUvKfhxPvAOJGeOHexs8HJYJgQm9EClEGb6gAeTB+B3vQxufvHTCdVlU
         hIToXMaLy4LqgmqsRXn7dL5bMcrqnzb188mx7lSecydRRQSJEnm7e0BlDYhNk6XQGWSU
         I/8A==
X-Forwarded-Encrypted: i=1; AJvYcCXgbY1Kj/8JcLo4GUa/nhg2K/rRp7VZQmEzSHlNC6fCSBKIIRPcGJ8wtiy4T0KzZauxZhNtJM2m1mE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFZNjXp5C1dcCUkA65wBEPUqc3d9ZXgBbXj8XxWPMUr+WlV+ua
	SoKt0+J3iIO67oxCqCqF00hlN9fecsSCq3KSk+EO3rAEY5eA9rRmNU+U
X-Gm-Gg: ASbGncuLXgIwqEllTP0U8Vy1mqH233hxYNr+BdmgLywXBH569aMokZBOohAX7uRjUNS
	y9OWGQMaAJFk9KPwKHBT/YEWW1hOpeNIUbkcIuYpIrphcCzXV0bqk/PUbenDqY/s0ancq1NYaL4
	v6XrZz/hrTLKBL/TUTpCe/BlRWwVJ6/PEqTssIf2VG2wSaRZFfiaaZvDFIUgPAj7hlTr8b/4Uom
	ronSAq4A+nGKl/VvypHXpvxN2pQL4yOE3f/NRpOIbayuSnQXQq+Ar3gp11IH2yKRpuaEGrcCQkm
	amuUyPKa9PiA+Ec+vO5Z5x2h9QeWEe9CoEOHRwDKeGFWh2Qxu+7gApktvyiSEBk7E44hskafxpQ
	mK7Z4LKFcRC4wM1gX5NZk2Df4/OpyGsYPg7F70FAMN4FytfzacchnRg1DmNeV0KOZl88wxDA=
X-Google-Smtp-Source: AGHT+IGqoDhrgVbtGfJKw3tz4Q4Z6R5ChG85hv7yLSdlZ+L6Chss+MTBJpYeXOjJXtgUHAzLABmSFQ==
X-Received: by 2002:a17:907:9623:b0:af9:34a0:1b20 with SMTP id a640c23a62f3a-af992a60ee5mr270036566b.5.1754497443287;
        Wed, 06 Aug 2025 09:24:03 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------iqbAeYP49t7P0mDsFTqvVc3X"
Message-ID: <cc6bb8a7-ed22-4d3e-a352-fa305f0ea56a@gmail.com>
Date: Wed, 6 Aug 2025 18:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <bcf4c3aa-5c09-4171-a4f5-85110d6e634f@gmail.com>
 <6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com>

This is a multi-part message in MIME format.
--------------iqbAeYP49t7P0mDsFTqvVc3X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/6/25 2:05 PM, Jan Beulich wrote:
> On 06.08.2025 13:33, Oleksii Kurochko wrote:
>> On 8/4/25 5:19 PM, Jan Beulich wrote:
>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>>> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>>    
>>>>        console_init_postirq();
>>>>    
>>>> +    vmid_init();
>>> This lives here only temporarily, I assume? Every hart will need to execute
>>> it, and hence (like we have it on x86) this may want to be a central place
>>> elsewhere.
>> I haven’t checked how it is done on x86; I probably should.
>>
>> I planned to call it for each hart separately during secondary hart bring-up,
>> since accessing the|hgatp| register of a hart is required to detect|VMIDLEN|.
>> Therefore,|vmid_init()| should be called for secondary harts when their
>> initialization code starts executing.
> But is this going to be the only per-hart thing that will need doing? Otherwise
> the same larger "container" function may want calling instead.

Yes, it is going to be the only per-hart operation.

There is|__cpu_up()| (not yet upstreamed [1]), which calls
|sbi_hsm_hart_start(hartid, boot_addr, hsm_data)| to start a hart, and I planned
to place|vmid_init()| somewhere in the code executed at|boot_addr|.

[1]https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/smpboot.c#L40

>>>> +{
>>>> +    unsigned long vmid_bits;
>>> Why "long" (also for the function return type)?
>> Because csr_read() returns unsigned long as HGATP register has
>> 'unsigned long' length.
> Oh, right, I should have commented on the function return type only.
> Yet then I also can't resist stating that this kind of use of a variable,
> which initially is assigned a value that doesn't really fit its name, is
> easily misleading towards giving such comments.
>
>> But it could be done in this way:
>>       csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>>       vmid_bits =  MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
>>       vmid_bits = ffs_g(vmid_bits);
>>       csr_write(CSR_HGATP, old);
>> And then use uint16_t for vmid_bits and use uin16_t as a return type.
> Please check ./CODING_STYLE again as to the use of fixed-width types.

I meant unsigned short, uint16_t was just short to write. I'll try to be
more specific.

>
>>>> +    unsigned long old;
>>>> +
>>>> +    /* Figure-out number of VMID bits in HW */
>>>> +    old = csr_read(CSR_HGATP);
>>>> +
>>>> +    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>>>> +    vmid_bits = csr_read(CSR_HGATP);
>>>> +    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
>>> Nit: Stray blank.
>>>
>>>> +    vmid_bits = flsl(vmid_bits);
>>>> +    csr_write(CSR_HGATP, old);
>>>> +
>>>> +    /*
>>>> +     * We polluted local TLB so flush all guest TLB as
>>>> +     * a speculative access can happen at any time.
>>>> +     */
>>>> +    local_hfence_gvma_all();
>>> There's no guest running. If you wrote hgat.MODE as zero, as per my
>>> understanding now new TLB entries could even purely theoretically appear.
>> It could be an issue (or, at least, it is recommended) when hgatp.MODE is
>> changed:
>>    If hgatp.MODE is changed for a given VMID, an HFENCE.GVMA with rs1=x0
>>    (and rs2 set to either x0 or the VMID) must be executed to order subsequent
>>    guest translations with the MODE change—even if the old MODE or new MODE
>>    is Bare.
>> On other hand it is guaranteed that, at least, on Reset (and so I assume
>> for power on) that:
>>    If the hypervisor extension is implemented, the hgatp.MODE and vsatp.MODE
>>    fields are reset to 0.
>>
>> So it seems like if no guest is ran then there is no need even to write
>> hgatp.MODE as zero, but it might be sense to do that explicitly just to
>> be sure.
>>
>> I thought it was possible to have a running guest and perform a CPU hotplug.
> But that guest will run on another hart.
>
>> In that case, I expect that during the hotplug,|vmidlen_detect()| will be
>> called and return the|vmid_bits| value, which is used as the active VMID.
>> At that moment, the local TLB could be speculatively polluted, I think.
>> Likely, it makes sense to call vmidlen_detect() only once for each hart
>> during initial bringup.
> That may bring you more problems than it solves. You'd need to stash away
> the value originally read somewhere. And that somewhere isn't per-CPU data.
>
>>> In fact, with no guest running (yet) I'm having a hard time seeing why
>>> you shouldn't be able to simply write the register with just
>>> HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
>>> whether "old" needs restoring; writing plain zero afterwards ought to
>>> suffice. You're in charcge of the register, after all.
>> It make sense (but I don't know if it is a possible case) to be sure that
>> HGATP.MODE remains the same, so there is no need to have TLB flush. If
>> HGATP.MODE is changed then it will be needed to do TLB flush as I mentioned
>> above.
>>
>> If we agreed to keep local_hfence_gvma_all() then I think it isn't really
>> any sense to restore 'old' or OR-ing it with HGATP_VMID_MASK.
>>
>> Generally if 'old' is guaranteed to be zero (and, probably, it makes sense
>> to check that in vmidlen_detect() and panic if it isn't zero) and if
>> vmidlen_detect() function will be called before any guest domain(s) will
>> be ran then I could agree that we don't need local_hfence_gvma_all() here.
>>
>> As an option we can do local_hfence_gvma_all() only if 'old' value wasn't
>> set to zero.
>>
>> Does it make sense?
> Well - I'd like the pre-conditions to be understood better. For example, can
> a hart really speculate into guest mode, when the hart is only in the
> process of being brought up?

I couldn't explicit words that a hart can't speculate into guest mode
either on bring up or during its work.

But there are some moments in the spec which tells:
   Implementations with virtual memory are permitted to perform address
   translations speculatively and earlier than required by an explicit
   memory access, and are permitted to cache them in address translation
   cache structures—including possibly caching the identity mappings from
   effective address to physical address used in Bare translation modes and
   M-mode.
And here:
   Implementations may also execute the address-translation algorithm
   speculatively at any time, for any virtual address, as long as satp is
   active (as defined in Section 10.1.11). Such speculative executions have
   the effect of pre-populating the address-translation cache.
Where it is explicitly mentioned that speculation can happen in *any time*.
And at the same time:
   Speculative executions of the address-translation algorithm behave as
   non-speculative executions of the algorithm do, except that they must
   not set the dirty bit for a PTE, they must not trigger an exception,
   and they must not create address-translation cache entries if those
   entries would have been invalidated by any SFENCE.VMA instruction
   executed by the hart since the speculative execution of the algorithm began.
What I read as if TLB was empty before it will stay empty.

Also, despite of the fact here it is mentioned that when V=0 two-stage address
translation is inactivated:
   The current virtualization mode, denoted V, indicates whether the hart is
   currently executing in a guest. When V=1, the hart is either in virtual
   S-mode (VS-mode), or in virtual U-mode (VU-mode) atop a guest OS running
   in VS-mode. When V=0, the hart is either in M-mode, in HS-mode, or in
   U-mode atop an OS running in HS-mode. The virtualization mode also
   indicates whether two-stage address translation is active (V=1) or
   inactive (V=0).
But on the same side, writing to hgatp register activates it:
   The hgatp register is considered active for the purposes of
   the address-translation algorithm unless the effective privilege mode
   is U and hstatus.HU=0.
And if so + considering that speculation could happen at any time, and
we are in HS-mode, not it U mode then I would say that it could really
speculate into guest mode.


>
>>>> +    data->max_vmid = BIT(vmid_len, U) - 1;
>>>> +    data->disabled = !opt_vmid_enabled || (vmid_len <= 1);
>>> Actually, what exactly does it mean that "VMIDs are disabled"? There's
>>> no enable bit that I could find anywhere. Isn't it rather that in this
>>> case you need to arrange to flush always on VM entry (or always after a
>>> P2M change, depending how the TLB is split between guest and host use)?
>> "VMIDs are disabled" here means that TLB flush will happen each time p2m
>> is changed.
> That's better described as "VMIDs aren't used" then?

It sounds a little bit just like an opposite to "disabled" (i.e. means
basically the same), but I am okay to use "used" instead.

>
>>>> +    if ( g_disabled != data->disabled )
>>>> +    {
>>>> +        printk("%s: VMIDs %sabled.\n", __func__,
>>>> +               data->disabled ? "dis" : "en");
>>>> +        if ( !g_disabled )
>>>> +            g_disabled = data->disabled;
>>> This doesn't match x86 code. g_disabled is a tristate there, which only
>>> the boot CPU would ever write to.
>> Why g_disabled is written only by boot CPU? Does x86 have only two options
>> or VMIDs are enabled for all CPUs or it is disabled for all of them?
> Did you look at the x86 code again, or the patch that I sent for it?
>
>> For RISC-V as I mentioned above it is needed to check all harts as the spec.
>> doesn't explicitly mention that VMIDLEN is equal for all harts...
> Even if in practice x86 systems are symmetric in this regard, you will
> have seen that we support varying values there as well. Up to and
> including ASIDs being in use on some CPUs, but not on others. So that
> code can serve as a reference for you, I think.
>
>>> A clear shortcoming of the x86 code (that you copied) is that the log
>>> message doesn't identify the CPU in question. A sequence of "disabled"
>>> and "enabled" could thus result, without the last one (or in fact any
>>> one) making clear what the overall state is. I think you want to avoid
>>> this from the beginning.
>> ... Thereby it seems like declaration of g_disabled should be moved outside
>> vmid_init() function and add a new function which will return g_disabled
>> value (or just make g_disabled not static and rename to something like
>> g_vmids_disabled).
> No, why? While I didn't Cc you on my patch submission, I specifically
> replied to it with you (alone) on the To: list, just so you can look
> there first before suggesting (sorry) odd things.

I haven't received this e-mail, but I was able to find it on lore.kernel.org.
Thanks.

~ Oleksii


--------------iqbAeYP49t7P0mDsFTqvVc3X
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
    <div class="moz-cite-prefix">On 8/6/25 2:05 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.08.2025 13:33, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 8/4/25 5:19 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
  
      console_init_postirq();
  
+    vmid_init();
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This lives here only temporarily, I assume? Every hart will need to execute
it, and hence (like we have it on x86) this may want to be a central place
elsewhere.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I haven’t checked how it is done on x86; I probably should.

I planned to call it for each hart separately during secondary hart bring-up,
since accessing the|hgatp| register of a hart is required to detect|VMIDLEN|.
Therefore,|vmid_init()| should be called for secondary harts when their
initialization code starts executing.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But is this going to be the only per-hart thing that will need doing? Otherwise
the same larger "container" function may want calling instead.</pre>
    </blockquote>
    <pre data-start="51" data-end="104">Yes, it is going to be the only per-hart operation.

</pre>
    <pre data-start="106" data-end="320">There is <code data-start="115"
    data-end="127">__cpu_up()</code> (not yet upstreamed [1]), which calls
<code data-start="168" data-end="217">sbi_hsm_hart_start(hartid, boot_addr, hsm_data)</code> to start a hart, and I planned
to place <code data-start="258" data-end="271">vmid_init()</code> somewhere in the code executed at <code
    data-start="306" data-end="317">boot_addr</code>.

[1] <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/smpboot.c#L40">https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/smpboot.c#L40</a>
</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+{
+    unsigned long vmid_bits;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Why "long" (also for the function return type)?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Because csr_read() returns unsigned long as HGATP register has
'unsigned long' length.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Oh, right, I should have commented on the function return type only.
Yet then I also can't resist stating that this kind of use of a variable,
which initially is assigned a value that doesn't really fit its name, is
easily misleading towards giving such comments.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">But it could be done in this way:
     csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
     vmid_bits =  MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
     vmid_bits = ffs_g(vmid_bits);
     csr_write(CSR_HGATP, old);
And then use uint16_t for vmid_bits and use uin16_t as a return type.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please check ./CODING_STYLE again as to the use of fixed-width types.</pre>
    </blockquote>
    <pre>I meant unsigned short, uint16_t was just short to write. I'll try to be
more specific.

</pre>
    <blockquote type="cite"
      cite="mid:6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
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
understanding now new TLB entries could even purely theoretically appear.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But that guest will run on another hart.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">In that case, I expect that during the hotplug,|vmidlen_detect()| will be
called and return the|vmid_bits| value, which is used as the active VMID.
At that moment, the local TLB could be speculatively polluted, I think.
Likely, it makes sense to call vmidlen_detect() only once for each hart
during initial bringup.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That may bring you more problems than it solves. You'd need to stash away
the value originally read somewhere. And that somewhere isn't per-CPU data.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">In fact, with no guest running (yet) I'm having a hard time seeing why
you shouldn't be able to simply write the register with just
HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
whether "old" needs restoring; writing plain zero afterwards ought to
suffice. You're in charcge of the register, after all.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well - I'd like the pre-conditions to be understood better. For example, can
a hart really speculate into guest mode, when the hart is only in the
process of being brought up?</pre>
    </blockquote>
    <pre>I couldn't explicit words that a hart can't speculate into guest mode
either on bring up or during its work.

But there are some moments in the spec which tells:
  Implementations with virtual memory are permitted to perform address
  translations speculatively and earlier than required by an explicit
  memory access, and are permitted to cache them in address translation
  cache structures—including possibly caching the identity mappings from
  effective address to physical address used in Bare translation modes and
  M-mode.
And here:
  Implementations may also execute the address-translation algorithm
  speculatively at any time, for any virtual address, as long as satp is
  active (as defined in Section 10.1.11). Such speculative executions have
  the effect of pre-populating the address-translation cache.
Where it is explicitly mentioned that speculation can happen in *any time*.
And at the same time:
  Speculative executions of the address-translation algorithm behave as
  non-speculative executions of the algorithm do, except that they must
  not set the dirty bit for a PTE, they must not trigger an exception,
  and they must not create address-translation cache entries if those
  entries would have been invalidated by any SFENCE.VMA instruction
  executed by the hart since the speculative execution of the algorithm began.
What I read as if TLB was empty before it will stay empty.

Also, despite of the fact here it is mentioned that when V=0 two-stage address
translation is inactivated:
  The current virtualization mode, denoted V, indicates whether the hart is
  currently executing in a guest. When V=1, the hart is either in virtual
  S-mode (VS-mode), or in virtual U-mode (VU-mode) atop a guest OS running
  in VS-mode. When V=0, the hart is either in M-mode, in HS-mode, or in
  U-mode atop an OS running in HS-mode. The virtualization mode also
  indicates whether two-stage address translation is active (V=1) or
  inactive (V=0).
But on the same side, writing to hgatp register activates it:
  The hgatp register is considered active for the purposes of
  the address-translation algorithm unless the effective privilege mode
  is U and hstatus.HU=0.
And if so + considering that speculation could happen at any time, and
we are in HS-mode, not it U mode then I would say that it could really
speculate into guest mode.
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    data-&gt;max_vmid = BIT(vmid_len, U) - 1;
+    data-&gt;disabled = !opt_vmid_enabled || (vmid_len &lt;= 1);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Actually, what exactly does it mean that "VMIDs are disabled"? There's
no enable bit that I could find anywhere. Isn't it rather that in this
case you need to arrange to flush always on VM entry (or always after a
P2M change, depending how the TLB is split between guest and host use)?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
"VMIDs are disabled" here means that TLB flush will happen each time p2m
is changed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's better described as "VMIDs aren't used" then?</pre>
    </blockquote>
    <pre>It sounds a little bit just like an opposite to "disabled" (i.e. means
basically the same), but I am okay to use "used" instead.

</pre>
    <blockquote type="cite"
      cite="mid:6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
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
the boot CPU would ever write to.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Why g_disabled is written only by boot CPU? Does x86 have only two options
or VMIDs are enabled for all CPUs or it is disabled for all of them?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Did you look at the x86 code again, or the patch that I sent for it?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">For RISC-V as I mentioned above it is needed to check all harts as the spec.
doesn't explicitly mention that VMIDLEN is equal for all harts...
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Even if in practice x86 systems are symmetric in this regard, you will
have seen that we support varying values there as well. Up to and
including ASIDs being in use on some CPUs, but not on others. So that
code can serve as a reference for you, I think.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">A clear shortcoming of the x86 code (that you copied) is that the log
message doesn't identify the CPU in question. A sequence of "disabled"
and "enabled" could thus result, without the last one (or in fact any
one) making clear what the overall state is. I think you want to avoid
this from the beginning.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
... Thereby it seems like declaration of g_disabled should be moved outside
vmid_init() function and add a new function which will return g_disabled
value (or just make g_disabled not static and rename to something like
g_vmids_disabled).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No, why? While I didn't Cc you on my patch submission, I specifically
replied to it with you (alone) on the To: list, just so you can look
there first before suggesting (sorry) odd things.</pre>
    </blockquote>
    <pre>I haven't received this e-mail, but I was able to find it on lore.kernel.org.
Thanks.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------iqbAeYP49t7P0mDsFTqvVc3X--


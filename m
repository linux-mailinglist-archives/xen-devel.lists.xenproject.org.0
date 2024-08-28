Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F2E962EFE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 19:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785048.1194461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjMo4-00015h-Fh; Wed, 28 Aug 2024 17:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785048.1194461; Wed, 28 Aug 2024 17:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjMo4-00013b-CV; Wed, 28 Aug 2024 17:50:08 +0000
Received: by outflank-mailman (input) for mailman id 785048;
 Wed, 28 Aug 2024 17:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjMo3-000121-K1
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 17:50:07 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5fbb02e-6565-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 19:50:06 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f4f5dbd93bso55128991fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 10:50:06 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1e2685sm2496372a12.29.2024.08.28.10.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 10:50:04 -0700 (PDT)
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
X-Inumbo-ID: f5fbb02e-6565-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724867406; x=1725472206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M2Aiq12ZCG5INqRw99VCRkNGF9BmrbJGR2rtuVFqgKU=;
        b=STFryB1KQ/wgtnPjHlrPFU2vGU9+UMOOVZ75ULCggo+SsZUsXwNpARJw0RC+72Nlkl
         oRfag2XB8YxwZ/8E1ZRgpQOZ2f3ssZ0QMQPHdouKiOayQRP3j141UgshypyaCqk/2BxX
         54YYdkrmXmr2tO8Jd0bbmqcS4U79/tkZ9IfRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724867406; x=1725472206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2Aiq12ZCG5INqRw99VCRkNGF9BmrbJGR2rtuVFqgKU=;
        b=gJB5xhBY5zhVV/Z1ngnK36bfT51MzbAAL+o07WNuzLQXskBe35WwtZscFuuY5wmAXP
         B1tT+WfbLJAEg2IlrBOqXjX+b4Kh0QncmRrWv5IrKFskgcXOe9zP7HzemTyN7vBi0Fam
         HXXTfFGPFZ30m4lNdL/kTZDdl32jyeMmztxJn+hJ0AfFKS0z7M9eVrh5T/8sVrsd2QYl
         dyS+ygnXBMx1YDh/MLTOjL56nNp5h2CzLQBZUbw3neZsPn+XhWnLkqyPZ1coojlaa6oW
         A0f+p98y/gp/75rPTIzOjDFpkEvEEzfkfgmg3DcA7JXZZ6bbak9q1uue0TLC5kBo46ZQ
         jy4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW78SQi+VW3w6gYpC7KSA79uVQD/Fupj2VlIFYN6QTmNtKmLwScfNe6qSrrYzFTZdVqxwpuwRVj25Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUiG/mlDgCBwL6gf+pIUYvFGXQDu6fLZYxu2Dwh96fqHdbBV83
	zW5fSCRy+FONh49CnaM4WC+I475HvLcCr0W0prDy5v2buMbjUxppvO7poKs6vCM=
X-Google-Smtp-Source: AGHT+IH3geemmY6Q6xrSqr3j5nDJmMJFxGxVmrxBinbexLaUmwQAxGAINz61Cd8FEqD391jl1hYs1A==
X-Received: by 2002:a2e:4a1a:0:b0:2f3:b234:980b with SMTP id 38308e7fff4ca-2f6103c87cemr3379941fa.28.1724867405452;
        Wed, 28 Aug 2024 10:50:05 -0700 (PDT)
Message-ID: <7b7b1434-e615-4189-ab52-3cce2932fb4b@citrix.com>
Date: Wed, 28 Aug 2024 18:50:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/hvm: Rework hpet_write() for improved code
 generation
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-4-andrew.cooper3@citrix.com>
 <2316ca39-50d4-4311-aeff-30be588245d9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2316ca39-50d4-4311-aeff-30be588245d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 9:13 am, Jan Beulich wrote:
> On 27.08.2024 15:57, Andrew Cooper wrote:
>> In the HPET_STATUS handling, the use of __clear_bit(i, &new_val) is the only
>> thing causing it to be spilled to the stack.  Furthemore we only care about
>> the bottom 3 bits, so rewrite it to be a plain for loop.
>>
>> For the {start,stop}_timer variables, these are spilled to the stack despite
>> the __{set,clear}_bit() calls.
> That's an observation from what the compiler happens to do? I don't see any
> other reason why they would need spilling; I expect it's merely a matter of
> registers better be used for other variables.

It is a consequence of how our helpers are written.  I do expect it to
improve when I get around to reworking them.

For example, the Linux helpers have enough constant folding capabilities
to allow the compiler to turn:

{
    int foo = 0;
    ...
    __set_bit(1, &foo);

into:

{
    int foo = 1;


as well as being able to emit LOCK AND/OR/XOR in place of LOCK BT{C,S,R}
for a constant bit position.

One thing I want to do, which I haven't figured out how to do yet, is to
allow the arch form to emit BT?Q forms.

Right now, code generation for PGC_* and PGT_* suffers quite a lot.  We
mix between reg/imm logic, then spill to the stack because top bits
aren't within range for the "I" constraint on 32-bit instructions, issue
a BT?L reg/mem (which has much higher latency than any other form), then
pick it back off the stack to do more reg/imm logic.

I was wondering if, because of the always_inline, I could do something
like __builtin_constant_p(bit) && __builtin_object_size(addr, 0) >= 8
and emitting long-granular logic, which will be able to pick the imm/reg
form rather than turning into reg/mem.

But, I've not had time to experiment here, and I doubt I'll get around
to it soon.

Another optimisation we're lacking vs Linux is that our test_bit() has a
volatile pointer where Linux's is non-volatile.  This makes a massive
difference for the ability to optimise looking at multiple bits.


>  If we ever meant to build Xen
> with APX fully in use, that might change. IOW may I at least ask for
> s/are/happen to be/? I'm also a little irritated by "despite", but you're
> the native speaker. It would have seemed to me that e.g. "irrespective of"
> would better express what (I think) is meant.

"despite" isn't really the right term, but I also wouldn't have said it
was something to be irritated over.

What I was trying to say was "they're spilled to the stack even with the
__set_bit() calls removed".  Which makes sense; they're values held for
almost the full duration of the function, that are not used in ~every
step of logic.

Interestingly, given that they're spilled to the stack, the __set_bit()
form is more efficient than the plain C "|= (1u << i);", but I'd still
like an implementation which could make that determination itself.

>
>>  Again we only care about the bottom 3 bits, so
>> shrink the variables from long to int.  Use for_each_set_bit() rather than
>> opencoding it at the end which amongst other things means the loop predicate
>> is no longer forced to the stack by the loop body.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> All in all, it's modest according to bloat-o-meter:
>>
>>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-29 (-29)
>>   Function                                     old     new   delta
>>   hpet_write                                  2225    2196     -29
>>
>> but we have shrunk the stack frame by 8 bytes; 0x28 as opposed to 0x30 before.
> However, on the negative side all the first of the loops you touch now always
> takes 3 iterations, when previously we may have got away with as little as
> none. Is there a reason not to use
>
>     for_each_set_bit ( i, new_val & ((1U << HPET_TIMER_NUM) - 1) )
>
> there (with the masking of the low bit possibly pulled out)?

There are multiple angles here.

First, I got an unexpected surprise on ARM with an expression, and while
this one won't pick up pointer const-ness, I can never remember what
MISRA's view on this is.

Second, this is the odd-loop-out compared to rest of the function, which
are all of the form "for ( i = 0; i < HPET_TIMER_NUM ;".

But perhaps most importantly, OSes don't touch this register.  Xen not
at all, and Linux only in _hpet_print_config().  Neither bother
preserving/clearing it on suspend/resume, even when running the HPET in
legacy replacement mode.

I haven't checked windows behaviour, but I don't expect it to differ
here.  This register simply isn't interesting for the preferred type of
interrupts (edge), and also isn't useful for an ISR handling a line
interrupt.

So my choice was based on which produced the smallest code, because it's
an dead-in-practice codepath.

>
>> @@ -533,19 +528,11 @@ static int cf_check hpet_write(
>>      }
>>  
>>      /* stop/start timers whos state was changed by this write. */
>> -    while (stop_timers)
>> -    {
>> -        i = ffsl(stop_timers) - 1;
>> -        __clear_bit(i, &stop_timers);
>> +    for_each_set_bit ( i, stop_timers )
>>          hpet_stop_timer(h, i, guest_time);
>> -    }
>>  
>> -    while (start_timers)
>> -    {
>> -        i = ffsl(start_timers) - 1;
>> -        __clear_bit(i, &start_timers);
>> +    for_each_set_bit ( i, start_timers )
>>          hpet_set_timer(h, i, guest_time);
>> -    }
> To avoid variable shadowing, I think you don't want to use i in these two
> loops. Alternatively the function scope i would need constraining to the
> individual loops.

Yeah, I was bitten by that on one of the ARM patches.  I'll adjust.

~Andrew


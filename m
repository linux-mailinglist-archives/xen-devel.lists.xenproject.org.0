Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D727874CF0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:04:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689766.1075050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBXl-0006An-1l; Thu, 07 Mar 2024 11:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689766.1075050; Thu, 07 Mar 2024 11:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBXk-00068E-V7; Thu, 07 Mar 2024 11:04:08 +0000
Received: by outflank-mailman (input) for mailman id 689766;
 Thu, 07 Mar 2024 11:04:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riBXj-0005sH-IJ
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:04:07 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69d0564c-dc72-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 12:04:05 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41312cf36a8so1714105e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:04:05 -0800 (PST)
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b00412f2136793sm2395336wmq.44.2024.03.07.03.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 03:04:04 -0800 (PST)
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
X-Inumbo-ID: 69d0564c-dc72-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709809445; x=1710414245; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y/YHYrBcAuwAYsvgxQDkgi/+/ASQ6Z2Ja+hha7xSnoM=;
        b=EzVpK5W+x0ahezxLQ3I8G2ywMsv5ju/8y+QPFORfmSHDR5LWfTN0P6t/ASqRl3DdUb
         2OqwoUN+soefbvxFtPd1/PftTwnk+oqUXbSBRVrBb6doYVT0wreJaWouLq62eGc79Ezj
         OUhsDvCwl4WlR6vBLYwzof6+DhqV8gEGJhRJqY4I/iNlm9/qLtkGs9muwh2pslLYcFwe
         qDFB5dHmGcdnOKpBBEPuZgx3VWfCxBlct9Af2Xu4qd4pa0+91ZZJeGZEUFMYQcxkwZND
         98tZHzZJ7TGGqhAaEObgVddXO+Wnbjgc0eM9/1dWuDqkR/NaY9u9ItFkKEIzSL47Flkf
         dhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709809445; x=1710414245;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/YHYrBcAuwAYsvgxQDkgi/+/ASQ6Z2Ja+hha7xSnoM=;
        b=n34cAv25WXI5riHFmGvV29/+7wS8FoxbMusJgYzZT9ZMctf2L56Ea7Od3Y5RDDLdCi
         Afm2qNKmtUKtrBrdIdptKVKCqnsi+Wu0hvRogkH35dZJigDPHRu2GaF6nU6kUNOgt0uk
         hN5LUu1KL4gmxLtrYx5bLozW2Sf/HwO/LV9YRTD3hK8NAKHbuLNHjgCeNXmgFqx3GFy9
         OEXnzhctM117D+ZFYJ/g6imwpc0lve2WH+xa1gfHVNc6RNVMOPNI4AAUmyALrlwQkU0s
         R2t/4Rc7yPDVRg2Uo2/qWvvl2zbdiSqDlfdpaqFl6JA/q9djH9ogz991DuZU135jUel9
         ZIGw==
X-Forwarded-Encrypted: i=1; AJvYcCVCL9SaLRz3z2ZELYRw1nCd1lIBnede4a+bm+BHdkbtyMcMP49F0IcFLhdcoJt0IfXxQwiK58MxHN7y/WT3Y3zq0YHbNpoyL9GvwsOk9UI=
X-Gm-Message-State: AOJu0YwDUTm8qN2NawOV0AYC+YKzB0m1nWhOxB22LsQT+3vOU/GRMVe2
	nYBFGUAEkRBXJMk5BQ/X0EHgaYTXrSqiwaIx+T9oa13fZ8xiOdHzaoemTTfnS/s=
X-Google-Smtp-Source: AGHT+IHaAws1XqkU4NwrR+6W6/kfS49fq/4B1VyIX6VkNndanIKiC48FMk2IagcIM592qtws8DKWKA==
X-Received: by 2002:a05:600c:1d03:b0:412:c7b2:5636 with SMTP id l3-20020a05600c1d0300b00412c7b25636mr13372940wms.23.1709809444882;
        Thu, 07 Mar 2024 03:04:04 -0800 (PST)
Date: Thu, 07 Mar 2024 12:46:02 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>
Cc: julien@xen.org, sstabellini@kernel.org, bertrand.marquis@arm.com
Subject: Re: [RFC PATCH v2] xen/arm: improve handling of load/store instruction decoding
User-Agent: meli 0.8.5-rc.3
References: <20240306165621.3819343-1-alex.bennee@linaro.org> <3cb1b056-59a7-4ffe-856d-e45aac1936a9@amd.com> <9z3mh.tiey2z2itr9a@linaro.org> <5eaf5a24-d9b6-4045-8b90-61897464d7a2@amd.com>
In-Reply-To: <5eaf5a24-d9b6-4045-8b90-61897464d7a2@amd.com>
Message-ID: <9z5eq.tgi8mkv6tysq@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Thu, 07 Mar 2024 12:43, Michal Orzel <michal.orzel@amd.com> wrote:
>
>
>On 07/03/2024 11:02, Manos Pitsidianakis wrote:
>> 
>> 
>> Hi Michal, Alex,
>> 
>> I'm responding to Michel but also giving my own review comments here.
>> 
>> On Thu, 07 Mar 2024 10:40, Michal Orzel <michal.orzel@amd.com> wrote:
>>> Hi Alex,
>>>
>>> NIT: RFC tag is no longer needed.
>>>
>>> On 06/03/2024 17:56, Alex Bennée wrote:
>>>>
>>>>
>>>> While debugging VirtIO on Arm we ran into a warning due to memory
>>>> being memcpy'd across MMIO space. While the bug was in the mappings
>>>> the warning was a little confusing:
>>>>
>>>>   (XEN) d47v2 Rn should not be equal to Rt except for r31
>>>>   (XEN) d47v2 unhandled Arm instruction 0x3d800000
>>>>   (XEN) d47v2 Unable to decode instruction
>>>>
>>>> The Rn == Rt warning is only applicable to single register load/stores
>>>> so add some verification steps before to weed out unexpected accesses.
>>>>
>>>> While at it update the Arm ARM references to the latest version of the
>>>> documentation.
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>> Move the CC line after --- so that it's not included in the final commit msg.
>>>
>>>>
>>>> ---
>>>> v2
>>>>   - use single line comments where applicable
>>>>   - update Arm ARM references
>>>>   - use #defines for magic numbers
>>>> ---
>>>>  xen/arch/arm/decode.c | 35 ++++++++++++++++++++------
>>>>  xen/arch/arm/decode.h | 57 ++++++++++++++++++++++++++++++++++++++-----
>>>>  2 files changed, 79 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>>>> index 2537dbebc1..73a88e4701 100644
>>>> --- a/xen/arch/arm/decode.c
>>>> +++ b/xen/arch/arm/decode.c
>>>> @@ -87,15 +87,36 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
>>>>          return 1;
>>>>      }
>>>>
>>>> +    /* Check this is a load/store of some sort */
>>>> +    if ( (opcode.top_level.op1 & TL_LDST_OP1_MASK) != TL_LDST_OP1_VALUE )
>>>> +    {
>>>> +        gprintk(XENLOG_ERR, "Not a load/store instruction op1=%u\n",
>>>> +                opcode.top_level.op1);
>>>> +        goto bad_loadstore;
>>>> +    }
>>>> +
>>>> +    /* We are only expecting single register load/stores */
>>>> +    if ( (opcode.ld_st.op0 & LS_SREG_OP0_MASK) != LS_SREG_OP0_VALUE )
>>>> +    {
>>>> +        gprintk(XENLOG_ERR, "Not single register load/store op0=%u\n",
>>> NIT: missing 'a' between Not and single
>>>
>>>> +                opcode.ld_st.op0);
>>>> +        goto bad_loadstore;
>>>> +    }
>>>> +
>>>>      /*
>>>> -     * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
>>>> -     * "Shared decode for all encodings" (under ldr immediate)
>>>> -     * If n == t && n != 31, then the return value is implementation defined
>>>> -     * (can be WBSUPPRESS, UNKNOWN, UNDEFINED or NOP). Thus, we do not support
>>>> -     * this. This holds true for ldrb/ldrh immediate as well.
>>>> +     * Refer Arm v8 ARM DDI 0487J.a, Page - K1-12586
>>>> +     *
>>>> +     * STR (immediate) CONSTRAINED UNPREDICTABLE behaviour
>>>> +     *
>>>> +     * "If the instruction encoding specifies pre-indexed addressing or
>>>> +     * post-indexed addressing, and n == t && n != 31, then one of the
>>>> +     * following behaviors must occur:" UNDEFINED, NOP or UNKNOWN
>>>> +     *
>>>> +     * Execution @ EL0/EL1 when HCR_EL2.TIDCP is 1 traps to EL2 with
>>>> +     * EC = 0.
>>>>       *
>>>> -     * Also refer, Page - C6-1384, the above described behaviour is same for
>>>> -     * str immediate. This holds true for strb/strh immediate as well
>>>> +     * This also hold true for LDR (immediate), Page K1-12581 and
>>>> +     * the RB/RH variants of both.
>>>>       */
>>>>      if ( (opcode.ldr_str.rn == opcode.ldr_str.rt) && (opcode.ldr_str.rn != 31) )
>>>>      {
>>>> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
>>>> index 13db8ac968..188114a71e 100644
>>>> --- a/xen/arch/arm/decode.h
>>>> +++ b/xen/arch/arm/decode.h
>>>> @@ -24,17 +24,54 @@
>>>>  #include <asm/processor.h>
>>>>
>>>>  /*
>>>> - * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
>>>> - * Page 318 specifies the following bit pattern for
>>>> - * "load/store register (immediate post-indexed)".
>>>> + * Refer to the ARMv8 ARM (DDI 0487J.a)
>>>>   *
>>>> - * 31 30 29  27 26 25  23   21 20              11   9         4       0
>>>> + * Section C A64 Instruct Set Encoding
>>> This line is not needed
>> 
>> I think it is needed for context (it answers the question "what is
>> C4.1?" in the following line.
>> 
>>>> + *
>>>> + * C4.1 A64 instruction set encoding:
>>> NIT: I would put a comma after section number i.e. C4.1, A64 ...
>>> The same would apply in other places.
>> 
>> Style manuals use either space (like here), a period (.) or colon (:),
>> never a comma.
>Since it's a NIT, I'm not going to object. I just care about readability, we do not
>need to adhere to any "style manuals".

I agree about readability :) the manuals mention was not an appeal to 
authority, just a sign of what is more common out there hence readable 
for more people. It is a nitpicking and subjective of course, so I'm not 
arguing for/against it, just sharing my 2 cents.

>
>> 
>>>
>>>> + *
>>>> + *   31  30  29 28  25 24                                             0
>>>>   * ___________________________________________________________________
>>>> - * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
>>>> - * |____|______|__|____|____|__|_______________|____|_________|_______|
>>>> + * |op0 | x  x |  op1 |                                               |
>>>> + * |____|______|______|_______________________________________________|
>>>> + *
>>>> + * op0 = 0 is reserved
>>> I'm not sure how to read it. It is reserved provided op1 is also 0.
>> 
>> Yes, it should say something like:
>> 
>>> Decode field values op0 = 0, op1 = 0 are reserved.
>>> Values op0 = 1, op1 = x1x0 correspond to Loads and Stores
>> 
>>>> + * op1 = x1x0 for Loads and Stores
>>>> + *
>>>> + * Section C4.1.88 Loads and Stores
>>> Missing colon at the end?
>> 
>> It's a heading so a colon would not be appropriate.
>In this case why was it added before in:
>"C4.1 A64 instruction set encoding:"

It should be removed from that, good point. Or at least put a colon here 
and in all headers for consistency.

>
>> 
>>>
>>>> + *
>>>> + *  31    28 27   26   25  24 23 22 21      16 15  12 11 10 9        0
>>>> + * ___________________________________________________________________
>>>> + * |  op0   | 1 | op1 | 0 | op2 |  |    op3   |      | op4 |          |
>>>> + * |________|___|_____|___|_____|__|__________|______|_____|__________|
>>>> + *
>> 
>> Maybe we should add the op{0,1,2,3,4} values for consistency?
>> 
>>> Values op0=xx11, op1=0, op2=0x, op3=0xxxxx, op4=01 correspond to
>>> Load/store register (immediate post-indexed)
>I think this should stay neutral in case we add a new emulation in a future.

Do you mean for future Arm versions? decode.{c,h} should definitely be 
more future-proof... I think it's okay in this case only because the 
comment block starts with the source's name "ARMv8 ARM (DDI 0487J.a)". I 
don't object however to what you're saying, either is fine for me!


>
>> 
>>>> + * Page C4-653 Load/store register (immediate post-indexed)
>>>> + *
>>>> + * 31 30 29  27 26 25 24 23 22 21 20           12 11 10 9    5 4     0
>>>> + * ___________________________________________________________________
>>>> + * |size|1 1 1 |V | 0 0 | opc |0 |      imm9     | 0 1 |  Rn  |  Rt   |
>>>> + * |____|______|__|_____|_____|__|_______________|_____|______|_______|
>>>>   */
>>>>  union instr {
>>>>      uint32_t value;
>>>> +    struct {
>>>> +        unsigned int ign2:25;
>>> Here, your numeration of ignore fields is in descending order (starting from lsb) but ..,
>>>
>>>> +        unsigned int op1:4;     /* instruction class */
>>>> +        unsigned int ign1:2;
>>>> +        unsigned int op0:1;     /* value = 1b */
>>> Why op0 = 0b1 ? This structure represents the generic bit layout (the emulation deals with single ldr/str).
>>> I would drop this comment.
>> 
>> It is a reserved bit which can never be 0.
>Where did you take this information from?

>As I wrote above, I don't think we should bind this union to a single 
>use case we currently have.
>The struct top_level should represent the generic encoding of A64 instruction.

C4.1, page C4-400. op0 is only zero in the reserved (unallocated) case, 
for the generic encoding.

>
>~Michal


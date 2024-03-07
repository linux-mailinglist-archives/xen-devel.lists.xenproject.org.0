Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44A874C59
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 11:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689741.1074981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riAwS-0004JC-MC; Thu, 07 Mar 2024 10:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689741.1074981; Thu, 07 Mar 2024 10:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riAwS-0004Hf-JZ; Thu, 07 Mar 2024 10:25:36 +0000
Received: by outflank-mailman (input) for mailman id 689741;
 Thu, 07 Mar 2024 10:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPn=KN=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1riAwQ-0004HW-RL
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 10:25:34 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 070d1a2f-dc6d-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 11:25:32 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51326436876so839521e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 02:25:32 -0800 (PST)
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a05600c21c600b00412c8117a34sm2090971wmj.47.2024.03.07.02.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 02:25:31 -0800 (PST)
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
X-Inumbo-ID: 070d1a2f-dc6d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709807132; x=1710411932; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3K1GWJ1f0C4GCSxHKRkz5e3Ng8FTh6FRyaS1BmQg2fk=;
        b=QMgDLwbdPthdsqdfEBlsD93JObxk4uLTowQ4RA3mQsfMctP0zscodifa87qLgPzLsh
         DAK9CLv1zQQIKfW9+uQy5MJRlsMq9GKky/E5+lz5hitS5b5Z29C8ndACUKd8o7Lr9piQ
         MTLtp9IoJcDrncppHcazQd2oGwSpd0N6tQHxpuZSG0pOjeBCmexTNY+N19yXflUKaEDL
         c35nfZLUOMNyosGOSgMe4U9v45NVgQ4NNMtrQg0Cl1HxlqfXEwaoGV+k09dvTtOCACSN
         xmNJjbm/AEGuLSUw9hG/kjTDmVtNtsfK/jvOBw1SYZgg5Jrl9LtppXfAdWCELcz9mq1g
         78pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709807132; x=1710411932;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3K1GWJ1f0C4GCSxHKRkz5e3Ng8FTh6FRyaS1BmQg2fk=;
        b=ODr/tYC1hY4isOdzRYkdDtQ7yNAiZow7R+bskUmRbGSh64HNOop13+w1xNAgONBshT
         HPGTEj8g7W+Svi79qdbZn8clqEz/UOwEZSS8TJXsVDBFhwsAHU3Jv+wZBpUj2yTSC008
         DJA0x0ZOotbR7++KlyNc4sOKmGhmOx7pQwviGJX4Zx3wZivAA3AZcqMzSEhc8keXDrIm
         wVWwXhpYWcPY7x17VJAFS+BiREYkZe3V11TwXmlMHOxbbsLMxhVYe2JLsru9WGWjvpuW
         4mZmxjlolfrDj40naSO2KsksBSBwCV2fd/BK/L+05Yp1DFr/tmEv5zl+Nh/q/D87Xywg
         qzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfVXq51HLRpHSPGs2GTpqVItbisJUho5cG9u/v7v404k9iKuPpJdmOPqrG46uwbhWthMImVvdAjqSp+WXd/VW49eN9kVgw4OKr3mtYJWs=
X-Gm-Message-State: AOJu0YztHrlbRZo+wlHKUXZkgHVYPEv6aYDWni4ots2q5SHMF2JjKOMj
	PDV4ay2jb8KfCOm2nMOFeaGSTSPiQGJqXKX+IRzNvBBYT5w0TXxZ4ulyVFcTsAI=
X-Google-Smtp-Source: AGHT+IEmwrna4+cJhHDAMTIscvykcCfu1Un1dNR4XkxhSSths4P8Hel+r/a7Gc/jMbe39MargcPFtw==
X-Received: by 2002:ac2:4e8d:0:b0:513:80cd:e807 with SMTP id o13-20020ac24e8d000000b0051380cde807mr723350lfr.20.1709807131774;
        Thu, 07 Mar 2024 02:25:31 -0800 (PST)
Date: Thu, 07 Mar 2024 12:02:25 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Michal Orzel <michal.orzel@amd.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org
Cc: julien@xen.org, sstabellini@kernel.org, bertrand.marquis@arm.com, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [RFC PATCH v2] xen/arm: improve handling of load/store instruction decoding
User-Agent: meli 0.8.5-rc.3
References: <20240306165621.3819343-1-alex.bennee@linaro.org> <3cb1b056-59a7-4ffe-856d-e45aac1936a9@amd.com>
In-Reply-To: <3cb1b056-59a7-4ffe-856d-e45aac1936a9@amd.com>
Message-ID: <9z3mh.tiey2z2itr9a@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed


Hi Michal, Alex,

I'm responding to Michel but also giving my own review comments here.

On Thu, 07 Mar 2024 10:40, Michal Orzel <michal.orzel@amd.com> wrote:
>Hi Alex,
>
>NIT: RFC tag is no longer needed.
>
>On 06/03/2024 17:56, Alex Bennée wrote:
>> 
>> 
>> While debugging VirtIO on Arm we ran into a warning due to memory
>> being memcpy'd across MMIO space. While the bug was in the mappings
>> the warning was a little confusing:
>> 
>>   (XEN) d47v2 Rn should not be equal to Rt except for r31
>>   (XEN) d47v2 unhandled Arm instruction 0x3d800000
>>   (XEN) d47v2 Unable to decode instruction
>> 
>> The Rn == Rt warning is only applicable to single register load/stores
>> so add some verification steps before to weed out unexpected accesses.
>> 
>> While at it update the Arm ARM references to the latest version of the
>> documentation.
>> 
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>Move the CC line after --- so that it's not included in the final commit msg.
>
>> 
>> ---
>> v2
>>   - use single line comments where applicable
>>   - update Arm ARM references
>>   - use #defines for magic numbers
>> ---
>>  xen/arch/arm/decode.c | 35 ++++++++++++++++++++------
>>  xen/arch/arm/decode.h | 57 ++++++++++++++++++++++++++++++++++++++-----
>>  2 files changed, 79 insertions(+), 13 deletions(-)
>> 
>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>> index 2537dbebc1..73a88e4701 100644
>> --- a/xen/arch/arm/decode.c
>> +++ b/xen/arch/arm/decode.c
>> @@ -87,15 +87,36 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
>>          return 1;
>>      }
>> 
>> +    /* Check this is a load/store of some sort */
>> +    if ( (opcode.top_level.op1 & TL_LDST_OP1_MASK) != TL_LDST_OP1_VALUE )
>> +    {
>> +        gprintk(XENLOG_ERR, "Not a load/store instruction op1=%u\n",
>> +                opcode.top_level.op1);
>> +        goto bad_loadstore;
>> +    }
>> +
>> +    /* We are only expecting single register load/stores */
>> +    if ( (opcode.ld_st.op0 & LS_SREG_OP0_MASK) != LS_SREG_OP0_VALUE )
>> +    {
>> +        gprintk(XENLOG_ERR, "Not single register load/store op0=%u\n",
>NIT: missing 'a' between Not and single
>
>> +                opcode.ld_st.op0);
>> +        goto bad_loadstore;
>> +    }
>> +
>>      /*
>> -     * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
>> -     * "Shared decode for all encodings" (under ldr immediate)
>> -     * If n == t && n != 31, then the return value is implementation defined
>> -     * (can be WBSUPPRESS, UNKNOWN, UNDEFINED or NOP). Thus, we do not support
>> -     * this. This holds true for ldrb/ldrh immediate as well.
>> +     * Refer Arm v8 ARM DDI 0487J.a, Page - K1-12586
>> +     *
>> +     * STR (immediate) CONSTRAINED UNPREDICTABLE behaviour
>> +     *
>> +     * "If the instruction encoding specifies pre-indexed addressing or
>> +     * post-indexed addressing, and n == t && n != 31, then one of the
>> +     * following behaviors must occur:" UNDEFINED, NOP or UNKNOWN
>> +     *
>> +     * Execution @ EL0/EL1 when HCR_EL2.TIDCP is 1 traps to EL2 with
>> +     * EC = 0.
>>       *
>> -     * Also refer, Page - C6-1384, the above described behaviour is same for
>> -     * str immediate. This holds true for strb/strh immediate as well
>> +     * This also hold true for LDR (immediate), Page K1-12581 and
>> +     * the RB/RH variants of both.
>>       */
>>      if ( (opcode.ldr_str.rn == opcode.ldr_str.rt) && (opcode.ldr_str.rn != 31) )
>>      {
>> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
>> index 13db8ac968..188114a71e 100644
>> --- a/xen/arch/arm/decode.h
>> +++ b/xen/arch/arm/decode.h
>> @@ -24,17 +24,54 @@
>>  #include <asm/processor.h>
>> 
>>  /*
>> - * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
>> - * Page 318 specifies the following bit pattern for
>> - * "load/store register (immediate post-indexed)".
>> + * Refer to the ARMv8 ARM (DDI 0487J.a)
>>   *
>> - * 31 30 29  27 26 25  23   21 20              11   9         4       0
>> + * Section C A64 Instruct Set Encoding
>This line is not needed

I think it is needed for context (it answers the question "what is 
C4.1?" in the following line.

>> + *
>> + * C4.1 A64 instruction set encoding:
>NIT: I would put a comma after section number i.e. C4.1, A64 ...
>The same would apply in other places.

Style manuals use either space (like here), a period (.) or colon (:), 
never a comma.

>
>> + *
>> + *   31  30  29 28  25 24                                             0
>>   * ___________________________________________________________________
>> - * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
>> - * |____|______|__|____|____|__|_______________|____|_________|_______|
>> + * |op0 | x  x |  op1 |                                               |
>> + * |____|______|______|_______________________________________________|
>> + *
>> + * op0 = 0 is reserved
>I'm not sure how to read it. It is reserved provided op1 is also 0.

Yes, it should say something like:

> Decode field values op0 = 0, op1 = 0 are reserved.
> Values op0 = 1, op1 = x1x0 correspond to Loads and Stores

>> + * op1 = x1x0 for Loads and Stores
>> + *
>> + * Section C4.1.88 Loads and Stores
>Missing colon at the end?

It's a heading so a colon would not be appropriate.

>
>> + *
>> + *  31    28 27   26   25  24 23 22 21      16 15  12 11 10 9        0
>> + * ___________________________________________________________________
>> + * |  op0   | 1 | op1 | 0 | op2 |  |    op3   |      | op4 |          |
>> + * |________|___|_____|___|_____|__|__________|______|_____|__________|
>> + *

Maybe we should add the op{0,1,2,3,4} values for consistency?

> Values op0=xx11, op1=0, op2=0x, op3=0xxxxx, op4=01 correspond to 
> Load/store register (immediate post-indexed)

>> + * Page C4-653 Load/store register (immediate post-indexed)
>> + *
>> + * 31 30 29  27 26 25 24 23 22 21 20           12 11 10 9    5 4     0
>> + * ___________________________________________________________________
>> + * |size|1 1 1 |V | 0 0 | opc |0 |      imm9     | 0 1 |  Rn  |  Rt   |
>> + * |____|______|__|_____|_____|__|_______________|_____|______|_______|
>>   */
>>  union instr {
>>      uint32_t value;
>> +    struct {
>> +        unsigned int ign2:25;
>Here, your numeration of ignore fields is in descending order (starting from lsb) but ..,
>
>> +        unsigned int op1:4;     /* instruction class */
>> +        unsigned int ign1:2;
>> +        unsigned int op0:1;     /* value = 1b */
>Why op0 = 0b1 ? This structure represents the generic bit layout (the emulation deals with single ldr/str).
>I would drop this comment.

It is a reserved bit which can never be 0.
>
>> +    } top_level;
>> +    struct {
>> +        unsigned int ign1:10;
>here in ascending. Let's be consistent (fixed fields are in ascending order). 

Agreed, otherwise names like ign2, fixed1 are not helpful.

>> +        unsigned int op4:2;
>> +        unsigned int ign2:4;
>> +        unsigned int op3:6;
>> +        unsigned int ign3:1;
>> +        unsigned int op2:2;
>> +        unsigned int fixed1:1; /* value = 0b */
>> +        unsigned int op1:1;
>> +        unsigned int fixed2:1; /* value = 1b */
>> +        unsigned int op0:4;
>> +    } ld_st;
>>      struct {
>>          unsigned int rt:5;     /* Rt register */
>>          unsigned int rn:5;     /* Rn register */
>> @@ -49,6 +86,14 @@ union instr {
>>      } ldr_str;
>>  };
>> 
>> +/* Top level load/store encoding */
>> +#define TL_LDST_OP1_MASK        0b0101
>> +#define TL_LDST_OP1_VALUE       0b0100
>> +
>> +/* Load/store single reg encoding */
>> +#define LS_SREG_OP0_MASK        0b0011
>> +#define LS_SREG_OP0_VALUE       0b0011
>> +
>>  #define POST_INDEX_FIXED_MASK   0x3B200C00
>>  #define POST_INDEX_FIXED_VALUE  0x38000400
>> 
>> --
>> 2.39.2
>> 
>> 
>



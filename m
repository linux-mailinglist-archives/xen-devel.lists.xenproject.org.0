Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE58498A9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 12:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675957.1051666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWx0Q-0003tv-7g; Mon, 05 Feb 2024 11:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675957.1051666; Mon, 05 Feb 2024 11:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWx0Q-0003rC-3Z; Mon, 05 Feb 2024 11:19:18 +0000
Received: by outflank-mailman (input) for mailman id 675957;
 Mon, 05 Feb 2024 11:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KzPa=JO=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rWx0P-0003qF-0y
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 11:19:17 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6589e0fa-c418-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 12:19:15 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40fc549ab9bso26334535e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 03:19:15 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0040fbad272f6sm8302365wmq.46.2024.02.05.03.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 03:19:14 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 60D695F888;
 Mon,  5 Feb 2024 11:19:14 +0000 (GMT)
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
X-Inumbo-ID: 6589e0fa-c418-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707131955; x=1707736755; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHPLepVUxVSyG653+rgbNocVyEKTkP/abvuOnlRA7oU=;
        b=ppj5VYJBklSRzUkeohOwJaJMFHgdOjs29K1I+jeF8y1a/fSvIJD5auZE1NgAoqp5FL
         kyxnIProKBBJ5oE9eGWIgflbvDhI+MaACXfAUxrvdyr8HyzPdHzjUoGaFs4112bYhvfr
         KvoJGJeGEcO1CCh7aLdGjNmqrpmwIEB0YgQnR0O8RYT6sHpoR3NCybs6I8y7YSLw2aHd
         MiKCiBQsKNdEvw4CDXIOM+CraNMVDU9Q8Uia2klxsIhPT/cYzRwwinK1nL5AL0RYTEfd
         QltTfGSaLIFcKzJPRo73bsfrZRp7I5fnfT/Ny50tD19GpWs1Ml4mIPPS2iktr7sT/4gc
         TU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707131955; x=1707736755;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gHPLepVUxVSyG653+rgbNocVyEKTkP/abvuOnlRA7oU=;
        b=gAOWNz5CPnh5KHB2I2nu9t1Mj/Jka+gWW8hypvkvcJArQzWEIxLOBRB6CSpZDUX/8Z
         u4Xh17xN+GDb3bKUYKX/AsbB7yG6TMvVSRwjZN1faFB5bSnTSsBN7Xiu/f6S5fpzVmku
         geWang3eM/3v03zykUxK8+5TYl1m2fdxhXTZZIwng6eTKiZK9+HvW+2lffhEDTWIEg6x
         e6SZCHV38rEh1cGKFKXlYWJtxgV+EEcpPbMhw6AHxgov92IxLDl6Jpc2akTJN8bYtFj+
         /DQidlvqSb1oADVkn+xTo6W/5I/iloiNVwVEPIwXw8ZwmfBb1XeJKFQD6k/EWrXVAKzM
         665A==
X-Gm-Message-State: AOJu0Yy0FPlNIztwKGS9kPDoZnCtAmS14aAJ10vqnuyFKFTXeROw4ToZ
	PbuunIGZOeCzrsIsZy8ymRw1jBw0m01mvfWwt0mJMFxBgcHEV0cC5uwPI1l6ApA=
X-Google-Smtp-Source: AGHT+IEAlXKZT/TgeewMv8dB2GCLBQpedlyp5xgWJymg+H/r//ldB7MV2bz/YpJjY8Bc8QHLvOwMCg==
X-Received: by 2002:a1c:4c04:0:b0:40e:e6ce:71ff with SMTP id z4-20020a1c4c04000000b0040ee6ce71ffmr4478002wmf.41.1707131955229;
        Mon, 05 Feb 2024 03:19:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUHhuDGptbhLvabzYfqKG2vMvSVkG6wFj5G6YtJkOQyRx2TINnOqgLJKwmrMOrTYh0sVB/kyo9dFQOnM1iEdd7nCIjYsXXGVn16rEQnXpQVld24eaH+74BgB2WHuoOtycD4dyLVFFtEbAmnX+8hTy5vPRR/iL0vu2tuML+jDw6ulA==
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,  sstabellini@kernel.org,
  bertrand.marquis@arm.com,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>
Subject: Re: [RFC PATCH] xen/arm: improve handling of load/store instruction
 decoding
In-Reply-To: <e82e5a15-88e8-4d24-b872-548b608cebbc@xen.org> (Julien Grall's
	message of "Mon, 5 Feb 2024 10:42:10 +0000")
References: <20240131175043.1488886-1-alex.bennee@linaro.org>
	<e82e5a15-88e8-4d24-b872-548b608cebbc@xen.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Mon, 05 Feb 2024 11:19:14 +0000
Message-ID: <87r0hrf9al.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Julien Grall <julien@xen.org> writes:

> Hi Alex,
>
> On 31/01/2024 17:50, Alex Benn=C3=A9e wrote:
>> While debugging VirtIO on Arm we ran into a warning due to memory
>> being memcpy'd across MMIO space. While the bug was in the mappings
>> the warning was a little confusing:
>>    (XEN) d47v2 Rn should not be equal to Rt except for r31
>>    (XEN) d47v2 unhandled Arm instruction 0x3d800000
>>    (XEN) d47v2 Unable to decode instruction
>> The Rn =3D=3D Rt warning is only applicable to single register
>> load/stores
>> so add some verification steps before to weed out unexpected accesses.
>> I updated the Arm ARM reference to the online instruction decoding
>> table which will hopefully be more stable than the Arm ARM section
>> numbers.
>
> I am not sure if the links to the Arm websites are stable. But from
> past, experience, URL tends to disappear after a while. This is why we
> went with the section + the Arm spec.

Depends if you can get the older spec. The section numbers unfortunately
change between versions. We have the same problem in our TCG aarch64
backend unfortunately when we named the encoders after section numbers.
>
> This also has the advantage that we can check any differences between
> version. So my preference is to stick the Arm ARM reference. Bertrand,
> Michal, Stefano, any opinions?
>
> Anyway, the idea looks fine to me. I left mostly some style comments.
>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> ---
>>   xen/arch/arm/decode.c | 20 ++++++++++++++++++++
>>   xen/arch/arm/decode.h | 38 +++++++++++++++++++++++++++++++++++---
>>   2 files changed, 55 insertions(+), 3 deletions(-)
>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>> index 2537dbebc1..824025c24c 100644
>> --- a/xen/arch/arm/decode.c
>> +++ b/xen/arch/arm/decode.c
>> @@ -87,6 +87,26 @@ static int decode_arm64(register_t pc, mmio_info_t *i=
nfo)
>>           return 1;
>>       }
>>   +    /*
>> +     * Check this is a load/store of some sort
>> +     */
>
> Coding style: This is a single line comment, so the preferred format is:
>
> /* .... */
>
>> +    if ( (opcode.top_level.op1 & 0b0101) !=3D 0b0100 )
>
> NIT: We are trying to avoid opcoding value in Xen. Can you add some  defi=
ne?
>
>> +    {
>> +        gprintk(XENLOG_ERR, "Not a load/store instruction op1=3D%d",
>
> Does the value need to be signed?
>
>> +                opcode.top_level.op1);
>> +        goto bad_loadstore;
>> +    }
>> +
>> +    /*
>> +     * We are only expecting single register load/stores
>> +     */
>
> Same here.
>
>> +    if ( (opcode.ld_st.op0 & 0b0011) !=3D 0b0011 )
>> +    {
>> +        gprintk(XENLOG_ERR, "Not single register load/store op0=3D%d",
>
> Same remark as above.
>
>> +                opcode.ld_st.op0);
>> +        goto bad_loadstore;
>> +    }
>> +
>>       /*
>>        * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
>>        * "Shared decode for all encodings" (under ldr immediate)
>> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
>> index 13db8ac968..b1580178eb 100644
>> --- a/xen/arch/arm/decode.h
>> +++ b/xen/arch/arm/decode.h
>> @@ -24,9 +24,27 @@
>>   #include <asm/processor.h>
>>     /*
>> - * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
>> - * Page 318 specifies the following bit pattern for
>> - * "load/store register (immediate post-indexed)".
>> + * From:
>> + * https://developer.arm.com/documentation/ddi0602/2023-12/Index-by-Enc=
oding
>> + *
>> + * Top level encoding:
>> + *
>> + *   31  30  29 28  25 24                                             0
>> + * ___________________________________________________________________
>> + * |op0 | x  x |  op1 |                                               |
>> + * |____|______|______|_______________________________________________|
>> + *
>> + * op0 =3D 0 is reserved
>> + * op1 =3D x1x0 for Loads and Stores
>> + *
>> + * Loads and Stores
>> + *
>> + *  31    28 27   26   25  24             9 8                        0
>> + * ___________________________________________________________________
>> + * |  op0   | 1 | op1 | 0 |       op2      |                          |
>> + * |________|___|_____|___|________________|__________________________|
>> + *
>> + * Load/store register (immediate post-indexed)
>>    *
>>    * 31 30 29  27 26 25  23   21 20              11   9         4       0
>>    * ___________________________________________________________________
>> @@ -35,6 +53,20 @@
>>    */
>>   union instr {
>>       uint32_t value;
>> +    struct {
>> +        unsigned int ign2:25;
>> +        unsigned int op1:4;     /* instruction class */
>> +        unsigned int ign1:2;
>> +        unsigned int op0:1;     /* value =3D 1b */
>> +    } top_level;
>> +    struct {
>> +        unsigned int ign1:9;
>> +        unsigned int op2:15;
>> +        unsigned int fixed1:1; /* value =3D 0b */
>> +        unsigned int op1:1;
>> +        unsigned int fixed2:1; /* value =3D 1b */
>> +        unsigned int op0:4;
>> +    } ld_st;
>>       struct {
>>           unsigned int rt:5;     /* Rt register */
>>           unsigned int rn:5;     /* Rn register */
>
> Cheers,

Will fix up the comments and repost.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


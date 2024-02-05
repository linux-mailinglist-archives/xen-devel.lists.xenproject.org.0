Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA758497F2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675768.1051216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwQY-0005yB-CK; Mon, 05 Feb 2024 10:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675768.1051216; Mon, 05 Feb 2024 10:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwQY-0005vN-8o; Mon, 05 Feb 2024 10:42:14 +0000
Received: by outflank-mailman (input) for mailman id 675768;
 Mon, 05 Feb 2024 10:42:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rWwQW-0005vH-TA
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:42:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rWwQW-0002iD-Ng; Mon, 05 Feb 2024 10:42:12 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rWwQW-0005u3-HE; Mon, 05 Feb 2024 10:42:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=HRvNL3oNBnTz6X7s0C07QdIHNQBkiOBTkUsJs7Sizb0=; b=dSwOTD4QdLxTgQTMUr1ZmmYjj4
	CxfWfgo4SzpJed4h7mCRb+pibcezhmDH8KKHO9nFMk8qZ6xpDlo8qgq8tZntuDzRUTO49ckwGpL5u
	2hVwxghri1WBKpvowIpa1mFTLoTQvcXbJOo00SL103KW1Cke1sw7mkA10hXWOqJILPWc=;
Message-ID: <e82e5a15-88e8-4d24-b872-548b608cebbc@xen.org>
Date: Mon, 5 Feb 2024 10:42:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: improve handling of load/store instruction
 decoding
Content-Language: en-GB
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20240131175043.1488886-1-alex.bennee@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240131175043.1488886-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alex,

On 31/01/2024 17:50, Alex Bennée wrote:
> While debugging VirtIO on Arm we ran into a warning due to memory
> being memcpy'd across MMIO space. While the bug was in the mappings
> the warning was a little confusing:
> 
>    (XEN) d47v2 Rn should not be equal to Rt except for r31
>    (XEN) d47v2 unhandled Arm instruction 0x3d800000
>    (XEN) d47v2 Unable to decode instruction
> 
> The Rn == Rt warning is only applicable to single register load/stores
> so add some verification steps before to weed out unexpected accesses.
> 
> I updated the Arm ARM reference to the online instruction decoding
> table which will hopefully be more stable than the Arm ARM section
> numbers.

I am not sure if the links to the Arm websites are stable. But from 
past, experience, URL tends to disappear after a while. This is why we 
went with the section + the Arm spec.

This also has the advantage that we can check any differences between 
version. So my preference is to stick the Arm ARM reference. Bertrand, 
Michal, Stefano, any opinions?

Anyway, the idea looks fine to me. I left mostly some style comments.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   xen/arch/arm/decode.c | 20 ++++++++++++++++++++
>   xen/arch/arm/decode.h | 38 +++++++++++++++++++++++++++++++++++---
>   2 files changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 2537dbebc1..824025c24c 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -87,6 +87,26 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
>           return 1;
>       }
>   
> +    /*
> +     * Check this is a load/store of some sort
> +     */

Coding style: This is a single line comment, so the preferred format is:

/* .... */

> +    if ( (opcode.top_level.op1 & 0b0101) != 0b0100 )

NIT: We are trying to avoid opcoding value in Xen. Can you add some  define?

> +    {
> +        gprintk(XENLOG_ERR, "Not a load/store instruction op1=%d",

Does the value need to be signed?

> +                opcode.top_level.op1);
> +        goto bad_loadstore;
> +    }
> +
> +    /*
> +     * We are only expecting single register load/stores
> +     */

Same here.

> +    if ( (opcode.ld_st.op0 & 0b0011) != 0b0011 )
> +    {
> +        gprintk(XENLOG_ERR, "Not single register load/store op0=%d",

Same remark as above.

> +                opcode.ld_st.op0);
> +        goto bad_loadstore;
> +    }
> +
>       /*
>        * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
>        * "Shared decode for all encodings" (under ldr immediate)
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index 13db8ac968..b1580178eb 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -24,9 +24,27 @@
>   #include <asm/processor.h>
>   
>   /*
> - * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
> - * Page 318 specifies the following bit pattern for
> - * "load/store register (immediate post-indexed)".
> + * From:
> + * https://developer.arm.com/documentation/ddi0602/2023-12/Index-by-Encoding
> + *
> + * Top level encoding:
> + *
> + *   31  30  29 28  25 24                                             0
> + * ___________________________________________________________________
> + * |op0 | x  x |  op1 |                                               |
> + * |____|______|______|_______________________________________________|
> + *
> + * op0 = 0 is reserved
> + * op1 = x1x0 for Loads and Stores
> + *
> + * Loads and Stores
> + *
> + *  31    28 27   26   25  24             9 8                        0
> + * ___________________________________________________________________
> + * |  op0   | 1 | op1 | 0 |       op2      |                          |
> + * |________|___|_____|___|________________|__________________________|
> + *
> + * Load/store register (immediate post-indexed)
>    *
>    * 31 30 29  27 26 25  23   21 20              11   9         4       0
>    * ___________________________________________________________________
> @@ -35,6 +53,20 @@
>    */
>   union instr {
>       uint32_t value;
> +    struct {
> +        unsigned int ign2:25;
> +        unsigned int op1:4;     /* instruction class */
> +        unsigned int ign1:2;
> +        unsigned int op0:1;     /* value = 1b */
> +    } top_level;
> +    struct {
> +        unsigned int ign1:9;
> +        unsigned int op2:15;
> +        unsigned int fixed1:1; /* value = 0b */
> +        unsigned int op1:1;
> +        unsigned int fixed2:1; /* value = 1b */
> +        unsigned int op0:4;
> +    } ld_st;
>       struct {
>           unsigned int rt:5;     /* Rt register */
>           unsigned int rn:5;     /* Rn register */

Cheers,

-- 
Julien Grall


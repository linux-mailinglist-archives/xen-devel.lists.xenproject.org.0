Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4902C9282
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 00:28:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41522.74727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjsaL-0006oq-Qg; Mon, 30 Nov 2020 23:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41522.74727; Mon, 30 Nov 2020 23:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjsaL-0006oR-NP; Mon, 30 Nov 2020 23:27:57 +0000
Received: by outflank-mailman (input) for mailman id 41522;
 Mon, 30 Nov 2020 23:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjsaJ-0006oM-Nt
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 23:27:55 +0000
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 884c9a1d-8b19-42d0-bfb1-7ab34675d380;
 Mon, 30 Nov 2020 23:27:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t4so18625592wrr.12
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 15:27:54 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id c2sm30888854wrf.68.2020.11.30.15.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 15:27:52 -0800 (PST)
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
X-Inumbo-ID: 884c9a1d-8b19-42d0-bfb1-7ab34675d380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+oKm/Ah3AvG9Xr+iFRMsTLDsP/59Ag9EL+r+oaOfy8c=;
        b=fenkOp0FOx/NUI2txBM85a3ElWiUBpFWSNXeZdZpHu+aRY8Xs8/WC9I+VrU5p1rih6
         PgrXie2ockUjfI0MkWZmhVnyk1Cpin8xD3LHry6EAe2K3HWxViavpTMqK+phqqm2ZpiC
         kre8yOfrHrgiw5ABSzs+wGiOgtuVp8wOyZIBUnSqJFJuKslNa8qu0YF0Atf3jV+PVCdY
         VCmy5ro4btrBt7zT18HvW2/klsA6o0HibLSlRhFy/z6Zctq5+xwdD0wkgi8xD92nalSM
         oQJF2MAS0AKSDHxF/vZEsXzeas51AHAGMJustGgwPCv9pk4yfY9kNuvWe/fhBlKFU+Qf
         ZhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+oKm/Ah3AvG9Xr+iFRMsTLDsP/59Ag9EL+r+oaOfy8c=;
        b=Y9E1t4Divem7wQ47PA74Vy8QKSU6E2SDQjn5pSpqUFjg5udUrw9nFUGz+fvUy8jbYf
         26+p2ZHfBVP/CwoHJrecmKN20OrFJSAuUrt0ojF/qRQ5vCOOtmprrpM/BmN5DLmqapNZ
         BfVkuyQUEi652HZcWCAkeiOWjJm4hIowMKE1nCOEmdO/WajxDOUI6sqI7L1c58lq6VFa
         S2Ir2wcat9CH9LDyL4+PJj0DUrHi23fHwLjQ7bjE9MYIUoATebfjlmx/vIlUDaCCNJsF
         Wx4Jf1vLJQssQEj8rRBsY3TFKsF7ojAjuLoEz0fYMDPgTx2dLOf+rxbfFJEP8IXCNlU1
         YgGg==
X-Gm-Message-State: AOAM533Vu4d+L2c6qHLPE3hhYjWbZsE3sGgD2BufGAL8GdCf6j9SiC7O
	3NiLVXAECqoCnSd3jYA01ws=
X-Google-Smtp-Source: ABdhPJx4jv+RfJVlXGSo4V/zucNwMx4vQWo4EKNChfWH9mW82KsCz/mIcyipWtCa/EaIPmGFokuJ/A==
X-Received: by 2002:adf:9144:: with SMTP id j62mr30951851wrj.419.1606778872847;
        Mon, 30 Nov 2020 15:27:52 -0800 (PST)
Subject: Re: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
 <878sai7e1a.fsf@epam.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <cad0d7fe-3a9f-3992-9d89-8e9bb438dfbe@gmail.com>
Date: Tue, 1 Dec 2020 01:27:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <878sai7e1a.fsf@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 30.11.20 23:03, Volodymyr Babchuk wrote:
> Hi,

Hi Volodymyr


>
> Oleksandr Tyshchenko writes:
>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> In order to avoid code duplication (both handle_read() and
>> handle_ioserv() contain the same code for the sign-extension)
>> put this code to a common helper to be used for both.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes V1 -> V2:
>>     - new patch
>>
>> Changes V2 -> V3:
>>     - no changes
>> ---
>> ---
>>   xen/arch/arm/io.c           | 18 ++----------------
>>   xen/arch/arm/ioreq.c        | 17 +----------------
>>   xen/include/asm-arm/traps.h | 24 ++++++++++++++++++++++++
>>   3 files changed, 27 insertions(+), 32 deletions(-)
>>
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index f44cfd4..8d6ec6c 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -23,6 +23,7 @@
>>   #include <asm/cpuerrata.h>
>>   #include <asm/current.h>
>>   #include <asm/mmio.h>
>> +#include <asm/traps.h>
>>   #include <asm/hvm/ioreq.h>
>>   
>>   #include "decode.h"
>> @@ -39,26 +40,11 @@ static enum io_state handle_read(const struct mmio_handler *handler,
>>        * setting r).
>>        */
>>       register_t r = 0;
>> -    uint8_t size = (1 << dabt.size) * 8;
>>   
>>       if ( !handler->ops->read(v, info, &r, handler->priv) )
>>           return IO_ABORT;
>>   
>> -    /*
>> -     * Sign extend if required.
>> -     * Note that we expect the read handler to have zeroed the bits
>> -     * outside the requested access size.
>> -     */
>> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
>> -    {
>> -        /*
>> -         * We are relying on register_t using the same as
>> -         * an unsigned long in order to keep the 32-bit assembly
>> -         * code smaller.
>> -         */
>> -        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>> -        r |= (~0UL) << size;
>> -    }
>> +    r = sign_extend(dabt, r);
>>   
>>       set_user_reg(regs, dabt.reg, r);
>>   
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> index f08190c..2f39289 100644
>> --- a/xen/arch/arm/ioreq.c
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -28,7 +28,6 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>>       const union hsr hsr = { .bits = regs->hsr };
>>       const struct hsr_dabt dabt = hsr.dabt;
>>       /* Code is similar to handle_read */
>> -    uint8_t size = (1 << dabt.size) * 8;
>>       register_t r = v->io.req.data;
>>   
>>       /* We are done with the IO */
>> @@ -37,21 +36,7 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>>       if ( dabt.write )
>>           return IO_HANDLED;
>>   
>> -    /*
>> -     * Sign extend if required.
>> -     * Note that we expect the read handler to have zeroed the bits
>> -     * outside the requested access size.
>> -     */
>> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
>> -    {
>> -        /*
>> -         * We are relying on register_t using the same as
>> -         * an unsigned long in order to keep the 32-bit assembly
>> -         * code smaller.
>> -         */
>> -        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>> -        r |= (~0UL) << size;
>> -    }
>> +    r = sign_extend(dabt, r);
>>   
>>       set_user_reg(regs, dabt.reg, r);
>>   
>> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
>> index 997c378..e301c44 100644
>> --- a/xen/include/asm-arm/traps.h
>> +++ b/xen/include/asm-arm/traps.h
>> @@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const struct cpu_user_regs *regs)
>>           (unsigned long)abort_guest_exit_end == regs->pc;
>>   }
>>   
>> +/* Check whether the sign extension is required and perform it */
>> +static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
>> +{
>> +    uint8_t size = (1 << dabt.size) * 8;
>> +
>> +    /*
>> +     * Sign extend if required.
>> +     * Note that we expect the read handler to have zeroed the bits
>> +     * outside the requested access size.
>> +     */
>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>> +    {
>> +        /*
>> +         * We are relying on register_t using the same as
>> +         * an unsigned long in order to keep the 32-bit assembly
>> +         * code smaller.
>> +         */
>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>> +        r |= (~0UL) << size;
> If `size` is 64, you will get undefined behavior there.
I think, we don't need to worry about undefined behavior here. Having 
size=64 would be possible with doubleword (dabt.size=3). But if "r" 
adjustment gets called (I mean Syndrome Sign Extend bit is set) then
we deal with byte, halfword or word operations (dabt.size<3). Or I 
missed something?


-- 
Regards,

Oleksandr Tyshchenko



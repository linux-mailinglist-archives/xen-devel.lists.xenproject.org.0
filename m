Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21F62C9F13
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 11:24:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41807.75265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk2or-0002Cx-J8; Tue, 01 Dec 2020 10:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41807.75265; Tue, 01 Dec 2020 10:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk2or-0002CY-FL; Tue, 01 Dec 2020 10:23:37 +0000
Received: by outflank-mailman (input) for mailman id 41807;
 Tue, 01 Dec 2020 10:23:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kk2op-0002CT-Qr
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 10:23:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kk2oo-0000dq-5O; Tue, 01 Dec 2020 10:23:34 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kk2on-0006Nj-Ok; Tue, 01 Dec 2020 10:23:34 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Wv1H4jfX8yg2Bf63sq8U5hxCS4N0pJHUxdaTsf8FBGM=; b=5c8pDQFQi7sQ0kfi9fOB87g23u
	Vdz4kBG3dCYjf62L2qmXrXZb3oHZyeYVScadjamjDh18vFaORZDQ74Pa1EEKLBpTzS1Y6VBtDl3D9
	CwLHWQUjpi2wzDidJEmy/+RPp9CJomvI9VVW678o0H9jZy/DETt7xXJOhO9Q430c/ufc=;
Subject: Re: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
To: Oleksandr <olekstysh@gmail.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
 <878sai7e1a.fsf@epam.com> <cad0d7fe-3a9f-3992-9d89-8e9bb438dfbe@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <25057245-5885-5b11-753d-91f501eb070a@xen.org>
Date: Tue, 1 Dec 2020 10:23:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <cad0d7fe-3a9f-3992-9d89-8e9bb438dfbe@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 30/11/2020 23:27, Oleksandr wrote:
> 
> On 30.11.20 23:03, Volodymyr Babchuk wrote:
>> Hi,
> 
> Hi Volodymyr
> 
> 
>>
>> Oleksandr Tyshchenko writes:
>>
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> In order to avoid code duplication (both handle_read() and
>>> handle_ioserv() contain the same code for the sign-extension)
>>> put this code to a common helper to be used for both.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> CC: Julien Grall <julien.grall@arm.com>
>>>
>>> ---
>>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>>> "Add support for Guest IO forwarding to a device emulator"
>>>
>>> Changes V1 -> V2:
>>>     - new patch
>>>
>>> Changes V2 -> V3:
>>>     - no changes
>>> ---
>>> ---
>>>   xen/arch/arm/io.c           | 18 ++----------------
>>>   xen/arch/arm/ioreq.c        | 17 +----------------
>>>   xen/include/asm-arm/traps.h | 24 ++++++++++++++++++++++++
>>>   3 files changed, 27 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>> index f44cfd4..8d6ec6c 100644
>>> --- a/xen/arch/arm/io.c
>>> +++ b/xen/arch/arm/io.c
>>> @@ -23,6 +23,7 @@
>>>   #include <asm/cpuerrata.h>
>>>   #include <asm/current.h>
>>>   #include <asm/mmio.h>
>>> +#include <asm/traps.h>
>>>   #include <asm/hvm/ioreq.h>
>>>   #include "decode.h"
>>> @@ -39,26 +40,11 @@ static enum io_state handle_read(const struct 
>>> mmio_handler *handler,
>>>        * setting r).
>>>        */
>>>       register_t r = 0;
>>> -    uint8_t size = (1 << dabt.size) * 8;
>>>       if ( !handler->ops->read(v, info, &r, handler->priv) )
>>>           return IO_ABORT;
>>> -    /*
>>> -     * Sign extend if required.
>>> -     * Note that we expect the read handler to have zeroed the bits
>>> -     * outside the requested access size.
>>> -     */
>>> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
>>> -    {
>>> -        /*
>>> -         * We are relying on register_t using the same as
>>> -         * an unsigned long in order to keep the 32-bit assembly
>>> -         * code smaller.
>>> -         */
>>> -        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>>> -        r |= (~0UL) << size;
>>> -    }
>>> +    r = sign_extend(dabt, r);
>>>       set_user_reg(regs, dabt.reg, r);
>>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>>> index f08190c..2f39289 100644
>>> --- a/xen/arch/arm/ioreq.c
>>> +++ b/xen/arch/arm/ioreq.c
>>> @@ -28,7 +28,6 @@ enum io_state handle_ioserv(struct cpu_user_regs 
>>> *regs, struct vcpu *v)
>>>       const union hsr hsr = { .bits = regs->hsr };
>>>       const struct hsr_dabt dabt = hsr.dabt;
>>>       /* Code is similar to handle_read */
>>> -    uint8_t size = (1 << dabt.size) * 8;
>>>       register_t r = v->io.req.data;
>>>       /* We are done with the IO */
>>> @@ -37,21 +36,7 @@ enum io_state handle_ioserv(struct cpu_user_regs 
>>> *regs, struct vcpu *v)
>>>       if ( dabt.write )
>>>           return IO_HANDLED;
>>> -    /*
>>> -     * Sign extend if required.
>>> -     * Note that we expect the read handler to have zeroed the bits
>>> -     * outside the requested access size.
>>> -     */
>>> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
>>> -    {
>>> -        /*
>>> -         * We are relying on register_t using the same as
>>> -         * an unsigned long in order to keep the 32-bit assembly
>>> -         * code smaller.
>>> -         */
>>> -        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>>> -        r |= (~0UL) << size;
>>> -    }
>>> +    r = sign_extend(dabt, r);
>>>       set_user_reg(regs, dabt.reg, r);
>>> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
>>> index 997c378..e301c44 100644
>>> --- a/xen/include/asm-arm/traps.h
>>> +++ b/xen/include/asm-arm/traps.h
>>> @@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const 
>>> struct cpu_user_regs *regs)
>>>           (unsigned long)abort_guest_exit_end == regs->pc;
>>>   }
>>> +/* Check whether the sign extension is required and perform it */
>>> +static inline register_t sign_extend(const struct hsr_dabt dabt, 
>>> register_t r)
>>> +{
>>> +    uint8_t size = (1 << dabt.size) * 8;
>>> +
>>> +    /*
>>> +     * Sign extend if required.
>>> +     * Note that we expect the read handler to have zeroed the bits
>>> +     * outside the requested access size.
>>> +     */
>>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>>> +    {
>>> +        /*
>>> +         * We are relying on register_t using the same as
>>> +         * an unsigned long in order to keep the 32-bit assembly
>>> +         * code smaller.
>>> +         */
>>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>>> +        r |= (~0UL) << size;
>> If `size` is 64, you will get undefined behavior there.
> I think, we don't need to worry about undefined behavior here. Having 
> size=64 would be possible with doubleword (dabt.size=3). But if "r" 
> adjustment gets called (I mean Syndrome Sign Extend bit is set) then
> we deal with byte, halfword or word operations (dabt.size<3). Or I 
> missed something?

This is known and was pointed out in the commit message introducing the 
sign-extension:

"Note that the bit can only be set for access size smaller than the 
register size (i.e byte/half-word for aarch32, byte/half-word/word for 
aarch32). So we don't have to worry about undefined C behavior."

Cheers,

-- 
Julien Grall


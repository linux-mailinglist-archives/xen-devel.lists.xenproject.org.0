Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277502F9463
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jan 2021 19:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69305.123998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1CT1-0001lP-Po; Sun, 17 Jan 2021 18:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69305.123998; Sun, 17 Jan 2021 18:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1CT1-0001l0-MS; Sun, 17 Jan 2021 18:07:59 +0000
Received: by outflank-mailman (input) for mailman id 69305;
 Sun, 17 Jan 2021 18:07:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l1CT0-0001kv-4k
 for xen-devel@lists.xenproject.org; Sun, 17 Jan 2021 18:07:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l1CSx-0007oy-T6; Sun, 17 Jan 2021 18:07:55 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l1CSx-0003JA-DO; Sun, 17 Jan 2021 18:07:55 +0000
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
	bh=JMet1zZ5nnBXKEyWILfwvgQID+odrmIWANawO1Wtq44=; b=k8Bbd2ITmNBGUVK37BXE0yXh4o
	QBKp2ODWjPjER/YNappqLxmtGNpwClBFnyJ1XmQqRhEUVp5k/C84vDy0mBxBFlyuuGtEiDYt/mclq
	7gH0TKBCFDWbQGwhqE+mqYNZtHqU8ItZczYsiLzws58ITht+A3Zt270IkPEozujPjh8I=;
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
Date: Sun, 17 Jan 2021 18:07:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 17/01/2021 17:11, Oleksandr wrote:
> 
> On 15.01.21 22:26, Julien Grall wrote:
> 
> Hi Julien

Hi Oleksandr,

>>
>>> +
>>>       PROGRESS(xen):
>>>           ret = relinquish_memory(d, &d->xenpage_list);
>>>           if ( ret )
>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>> index ae7ef96..9814481 100644
>>> --- a/xen/arch/arm/io.c
>>> +++ b/xen/arch/arm/io.c
>>> @@ -16,6 +16,7 @@
>>>    * GNU General Public License for more details.
>>>    */
>>>   +#include <xen/ioreq.h>
>>>   #include <xen/lib.h>
>>>   #include <xen/spinlock.h>
>>>   #include <xen/sched.h>
>>> @@ -23,6 +24,7 @@
>>>   #include <asm/cpuerrata.h>
>>>   #include <asm/current.h>
>>>   #include <asm/mmio.h>
>>> +#include <asm/hvm/ioreq.h>
>>
>> Shouldn't this have been included by "xen/ioreq.h"?
> Well, for V1 asm/hvm/ioreq.h was included by xen/ioreq.h. But, it turned 
> out that there was nothing inside common header required arch one to be 
> included and
> I was asked to include arch header where it was indeed needed (several 
> *.c files).

Fair enough.

[...]

>>
>> If you return IO_HANDLED here, then it means the we will take care of 
>> previous I/O but the current one is going to be ignored. 
> Which current one? As I understand, if try_fwd_ioserv() gets called with 
> vio->req.state == STATE_IORESP_READY then this is a second round after 
> emulator completes the emulation (the first round was when
> we returned IO_RETRY down the function and claimed that we would need a 
> completion), so we are still dealing with previous I/O.
> vcpu_ioreq_handle_completion() -> arch_ioreq_complete_mmio() -> 
> try_handle_mmio() -> try_fwd_ioserv() -> handle_ioserv()
> And after we return IO_HANDLED here, handle_ioserv() will be called to 
> complete the handling of this previous I/O emulation.
> Or I really missed something?

Hmmm... I somehow thought try_fw_ioserv() would only be called the first 
time. Do you have a branch with your code applied? This would help to 
follow the different paths.

>>>   diff --git a/xen/include/asm-arm/domain.h 
>>> b/xen/include/asm-arm/domain.h
>>> index 6819a3b..c235e5b 100644
>>> --- a/xen/include/asm-arm/domain.h
>>> +++ b/xen/include/asm-arm/domain.h
>>> @@ -10,6 +10,7 @@
>>>   #include <asm/gic.h>
>>>   #include <asm/vgic.h>
>>>   #include <asm/vpl011.h>
>>> +#include <public/hvm/dm_op.h>
>>
>> May I ask, why do you need to include dm_op.h here?
> I needed to include that header to make some bits visible 
> (XEN_DMOP_IO_RANGE_PCI, struct xen_dm_op_buf, etc). Why here - is a 
> really good question.
> I don't remember exactly, probably I followed x86's domain.h which also 
> included it.
> So, trying to remove the inclusion here, I get several build failures on 
> Arm which could be fixed if I include that header from dm.h and ioreq.h:
> 
> Shall I do this way?

If the failure are indeded because ioreq.h and dm.h use definition from 
public/hvm/dm_op.h, then yes. Can you post the errors?

[...]

>>>   #include <public/hvm/params.h>
>>>     struct hvm_domain
>>> @@ -262,6 +263,8 @@ static inline void arch_vcpu_block(struct vcpu 
>>> *v) {}
>>>     #define arch_vm_assist_valid_mask(d) (1UL << 
>>> VMASST_TYPE_runstate_update_flag)
>>>   +#define has_vpci(d)    ({ (void)(d); false; })
>>> +
>>>   #endif /* __ASM_DOMAIN_H__ */
>>>     /*
>>> diff --git a/xen/include/asm-arm/hvm/ioreq.h 
>>> b/xen/include/asm-arm/hvm/ioreq.h
>>> new file mode 100644
>>> index 0000000..19e1247
>>> --- /dev/null
>>> +++ b/xen/include/asm-arm/hvm/ioreq.h
>>
>> Shouldn't this directly be under asm-arm/ rather than asm-arm/hvm/ as 
>> the IOREQ is now meant to be agnostic?
> Good question... The _common_ IOREQ code is indeed arch-agnostic. But, 
> can the _arch_ IOREQ code be treated as really subarch-agnostic?
> I think, on Arm it can and it is most likely ok to keep it in 
> "asm-arm/", but how it would be correlated with x86's IOREQ code which 
> is HVM specific and located
> in "hvm" subdir?

Sorry, I don't understand your answer/questions. So let me ask the 
question differently, is asm-arm/hvm/ioreq.h going to be included from 
common code?

If the answer is no, then I see no reason to follow the x86 here.
If the answer is yes, then I am quite confused why half of the series 
tried to remove "hvm" from the function name but we still include 
"asm/hvm/ioreq.h".

Cheers,

-- 
Julien Grall


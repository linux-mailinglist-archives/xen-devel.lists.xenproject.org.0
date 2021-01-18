Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B42F9CFB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69569.124610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1S17-0006PF-8U; Mon, 18 Jan 2021 10:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69569.124610; Mon, 18 Jan 2021 10:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1S17-0006Oq-52; Mon, 18 Jan 2021 10:44:13 +0000
Received: by outflank-mailman (input) for mailman id 69569;
 Mon, 18 Jan 2021 10:44:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1S15-0006Ol-JJ
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:44:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3641266-ce00-4ffb-883d-79731d4fdc89;
 Mon, 18 Jan 2021 10:44:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57042AB7A;
 Mon, 18 Jan 2021 10:44:05 +0000 (UTC)
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
X-Inumbo-ID: e3641266-ce00-4ffb-883d-79731d4fdc89
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610966645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJ38crIPbYLm3QraZKPx8/DunsRMNVIBCPcZkDAuWG4=;
	b=GPild3aUOi2U1StiG8n/LdOZ3vtFqnf1380l4HLtmaj2dmwsUJhgP3L4TRwjQ2c6zZDljj
	wzdKnyoy2F8uJQ+wlBFNSOYGKYBRFjp7RxgnX8Rx+uNCqBdPSE4etL3Ev3Mik8+HSb/fbd
	01HmvZVuksmC31CLQQWhJuW2p3mZboE=
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9904062b-cc59-c80e-50fa-ea932c8a9bd5@suse.com>
Date: Mon, 18 Jan 2021 11:44:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.01.2021 18:11, Oleksandr wrote:
> On 15.01.21 22:26, Julien Grall wrote:
>> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
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

I guess the general usage model of the two headers needs to be
established first: If the per-arch header declares only stuff
needed by the soon common/ioreq.c, then indeed it should be
only that file and the producer(s) of the arch_*() functions
which include that header; it should then in particular not be
included by xen/ioreq.h.

However, with the change request on patch 1 I think that usage
model goes away at least for now, at which point the question
is what exactly the per-arch header still declares, and based
on that it would need to be decided whether xen/ioreq.h
should include it.

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

The general rule ought to be that header include what they need,
but not more. Header dependencies are quite problematic already,
so every dependency we can avoid (or eliminate) will help. This
goes as far as only forward declaring structure where possible.

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

I think for Arm's sake this should be used as asm/ioreq.h, where
x86 would gain a new header consisting of just

#include <asm/hvm/ioreq.h>

as there the functionality is needed for HVM only.

Jan


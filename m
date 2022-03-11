Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3C4D6469
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 16:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289143.490556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSh3C-0004qV-N2; Fri, 11 Mar 2022 15:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289143.490556; Fri, 11 Mar 2022 15:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSh3C-0004oJ-JL; Fri, 11 Mar 2022 15:19:30 +0000
Received: by outflank-mailman (input) for mailman id 289143;
 Fri, 11 Mar 2022 15:19:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSh3A-0004oD-RY
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 15:19:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSh36-00031n-U5; Fri, 11 Mar 2022 15:19:24 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.95.172.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSh36-0004ev-NH; Fri, 11 Mar 2022 15:19:24 +0000
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
	bh=RWUxNyPrRvO8H6IBuIUIOdLlraMxNaXzOn/Emb4xGX4=; b=ootR8xZzzbtVUimLCow9Ru8WHa
	opPyWj4QePnYvijXRL307nZU+pFHUugdZnWdhtnlTR+vZy4LqHqQFHVCFsiSQy9J8SY/BZzaJrgH4
	lC0OCB6KjUfzPY3bM9MNHO/Q4ajNuxAU/LZCfBPQxfJO4j04CG7Use0oBnIHXzGKsaZs=;
Message-ID: <5cedf43b-3903-9668-69a0-01b8ba339ba7@xen.org>
Date: Fri, 11 Mar 2022 15:19:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
 <7acb2915-5a9d-c1f1-4b7b-2bc6c2055ea3@suse.com>
 <YioddbNor6w/U9ed@Air-de-Roger>
 <53361d65-2bd8-c07b-938c-91b95f2d68ad@suse.com>
 <Yiojgxgd4amSjHog@Air-de-Roger>
 <3055b4a5-2d55-9cf1-1069-8c57208bf0af@xen.org> <YiopXU65pAlnNVNI@mail-itl>
 <d2c63630-6ab3-b4dd-128e-72f871fb9e08@xen.org> <Yisp0Q/cNGbgsO/7@mail-itl>
 <2a5c59ad-2fa5-b668-8bce-0d55e89a4afd@xen.org>
 <Yitk68wpP8HV4od9@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Yitk68wpP8HV4od9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 11/03/2022 15:04, Roger Pau Monné wrote:
> On Fri, Mar 11, 2022 at 11:15:13AM +0000, Julien Grall wrote:
>> Hi,
>>
>> On 11/03/2022 10:52, Marek Marczykowski-Górecki wrote:
>>> On Fri, Mar 11, 2022 at 10:23:03AM +0000, Julien Grall wrote:
>>>> Hi Marek,
>>>>
>>>> On 10/03/2022 16:37, Marek Marczykowski-Górecki wrote:
>>>>> On Thu, Mar 10, 2022 at 04:21:50PM +0000, Julien Grall wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 10/03/2022 16:12, Roger Pau Monné wrote:
>>>>>>> On Thu, Mar 10, 2022 at 05:08:07PM +0100, Jan Beulich wrote:
>>>>>>>> On 10.03.2022 16:47, Roger Pau Monné wrote:
>>>>>>>>> On Thu, Mar 10, 2022 at 04:23:00PM +0100, Jan Beulich wrote:
>>>>>>>>>> On 10.03.2022 15:34, Marek Marczykowski-Górecki wrote:
>>>>>>>>>>> --- a/xen/drivers/char/ns16550.c
>>>>>>>>>>> +++ b/xen/drivers/char/ns16550.c
>>>>>>>>>>> @@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>>>>>>>>>>                                  pci_conf_read8(PCI_SBDF(0, b, d, f),
>>>>>>>>>>>                                                 PCI_INTERRUPT_LINE) : 0;
>>>>>>>>>>> +                if (uart->irq >= nr_irqs)
>>>>>>>>>>> +                    uart->irq = 0;
>>>>>>>>>>
>>>>>>>>>> Don't you mean nr_irqs_gsi here? Also (nit) please add the missing blanks
>>>>>>>>>> immediately inside the parentheses.
>>>>>>>>>
>>>>>>>>> If we use nr_irqs_gsi we will need to make the check x86 only AFAICT.
>>>>>>>>
>>>>>>>> Down the road (when Arm wants to select HAS_PCI) - yes. Not necessarily
>>>>>>>> right away. After all Arm wants to have an equivalent check here then,
>>>>>>>> not merely checking against nr_irqs instead. So putting a conditional
>>>>>>>> here right away would hide the need for putting in place an Arm-specific
>>>>>>>> alternative.
>>>>>>>
>>>>>>> Oh, I always forget Arm doesn't have CONFIG_HAS_PCI enabled just yet.
>>>>>> The PCI code in ns16550.c is gated by CONFIG_HAS_PCI and CONFIG_X86. I am
>>>>>> not sure we will ever see a support for PCI UART card in Xen on Arm.
>>>>>>
>>>>>> However, if it evers happens then neither nr_irqs or nr_irqs_gsi would help
>>>>>> here because from the interrupt controller PoV 0xff may be a valid (GICv2
>>>>>> supports up to 1024 interrupts).
>>>>>>
>>>>>> Is there any reason we can't explicitely check 0xff?
>>>>>
>>>>> That's what my v0.1 did, but Roger suggested nr_irqs. And I agree,
>>>>> because the value is later used (on x86) to access irq_desc array (via
>>>>> irq_to_desc), which has nr_irqs size.
>>>>
>>>> I think it would be better if that check is closer to who access the
>>>> irq_desc. This would be helpful for other users (I am sure this is not the
>>>> only potential place where the IRQ may be wrong). So how about moving it in
>>>> setup_irq()?
>>>
>>> I don't like it, it's rather fragile approach (at least in the current
>>> code base, without some refactor). There are a bunch of places using
>>> uart->irq (even if just checking if its -1 or 0) before setup_irq()
>>> call. This includes smp_intr_init(), which is what was the first thing
>>> crashing with 0xff set there.
>>
>> Even if the code is gated with !CONFIG_X86, it sounds wrong to me to have
>> such check in an UART driver. It only prevents us to do an out-of-bound
>> access. There are no guarantee the interrupt will be usable (on Arm 256 is a
>> valid interrupt).
> 
> It's a sanity check of a value we get from the hardware, I don't think
> it's that strange.

I think it is strange because the behavior would be different between 
the architectures. On x86, we would reject the interrupt and poll. On 
Arm, we would accept the interrupt and the UART would be unusable.

> It's mostly similar to doing sanity checks of input
> values we get from users.
I am a bit concerned that we are using an unrelated check (see above
why) to catch the "misconfiguration".

I think it would be good to understand why the interrupt line is 0xff 
and properly fix it. Is it a misconfiguration?  Is it intended to 
indicate "no IRQ"? Can we actually trust the value for the Intel LPSS?

Cheers,

-- 
Julien Grall


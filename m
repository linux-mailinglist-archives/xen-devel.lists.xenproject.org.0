Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A570A2FFEF1
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72597.130753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sVj-00023r-C6; Fri, 22 Jan 2021 09:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72597.130753; Fri, 22 Jan 2021 09:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sVj-00023S-8E; Fri, 22 Jan 2021 09:13:43 +0000
Received: by outflank-mailman (input) for mailman id 72597;
 Fri, 22 Jan 2021 09:13:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2sVi-00023N-K3
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:13:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3672e50-149b-4e25-92a1-9abadd8d9cf2;
 Fri, 22 Jan 2021 09:13:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C6E2AF4C;
 Fri, 22 Jan 2021 09:13:40 +0000 (UTC)
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
X-Inumbo-ID: d3672e50-149b-4e25-92a1-9abadd8d9cf2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611306820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=meK4dmRYiQlVUno88Gj8AJVnzc4F+f7wOh9Ft4m7JFg=;
	b=DqmAn8i9gq6xkLwcI3W3h3wnI8/UVGbNPmq1AwdVepKJI8F2gaWbtguL3c6g3q+NmcXkbi
	UEWrb1HtXG2mmu6tkgvhBQVRWiTYKgOOzVQ0GvjnrUdW5cJjMl68zmcKWUu8CuJ+EagAPt
	gildhl4MzBx6ExzBRAT5ph42SWuKrqs=
Subject: Re: [PATCH v2 2/4] x86/vioapic: issue EOI to dpci when switching pin
 to edge trigger mode
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210115142820.35224-1-roger.pau@citrix.com>
 <20210115142820.35224-3-roger.pau@citrix.com>
 <3e6652f4-693c-cb03-a5f1-bf90e0f83253@suse.com>
 <20210121174554.emmefqoykw3brozr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9800eab9-af65-bcaa-ec18-b349d51d0be0@suse.com>
Date: Fri, 22 Jan 2021 10:13:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121174554.emmefqoykw3brozr@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.01.2021 18:45, Roger Pau Monné wrote:
> On Thu, Jan 21, 2021 at 05:23:04PM +0100, Jan Beulich wrote:
>> On 15.01.2021 15:28, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/vioapic.c
>>> +++ b/xen/arch/x86/hvm/vioapic.c
>>> @@ -268,6 +268,17 @@ static void vioapic_write_redirent(
>>>  
>>>      spin_unlock(&d->arch.hvm.irq_lock);
>>>  
>>> +    if ( ent.fields.trig_mode == VIOAPIC_EDGE_TRIG &&
>>> +         ent.fields.remote_irr && is_iommu_enabled(d) )
>>> +            /*
>>> +             * Since IRR has been cleared and further interrupts can be
>>> +             * injected also attempt to deassert any virtual line of passed
>>> +             * through devices using this pin. Switching a pin from level to
>>> +             * trigger mode can be used as a way to EOI an interrupt at the
>>> +             * IO-APIC level.
>>> +             */
>>> +            hvm_dpci_eoi(d, gsi);
>>> +
>>>      if ( is_hardware_domain(d) && unmasked )
>>>      {
>>>          /*
>>
>> I assume in the comment you mean "... from level to edge
>> mode ...".
> 
> Yes, that's right, I completely missed it, sorry.
> 
>> But this isn't reflected in the if() you add -
>> you do the same also when the mode doesn't change. Or do
>> you build on the assumption that ent.fields.remote_irr can
>> only be set if the prior mode was "level" (in which case
>> an assertion may be warranted, as I don't think this is
>> overly obvious)?
> 
> Yes, IRR is only set for level triggered interrupts, so it's indeed
> build on the assumption that a pin can only have had IRR set when in
> edge mode when it's being switched from level to edge.
> 
> I can add an assertion.
> 
>> Also, looking at this code, is it correct to trigger an IRQ
>> upon the guest writing the upper half of an unmasked RTE
>> with remote_irr clear? I'd assume this needs to be strictly
>> limited to a 1->0 transition of the mask bit. If other code
>> indeed guarantees this in all cases, perhaps another place
>> where an assertion would be warranted?
> 
> Indeed. I don't think it should be possible for a write to the upper
> half to trigger the injection of an interrupt, as having
> gsi_assert_count > 0 would imply that either IRR is already set, or
> that the pin is masked when processing an upper write.
> 
> I can add that a pre-patch if you agree.

I do, yes.

> In fact we could almost short-circuit the logic after the *pent = ent;
> line for upper writes if it wasn't for the call to
> vlapic_adjust_i8259_target, the rest of the code there shouldn't
> matter for upper writes. And the i8259 target logic that we have is
> very dodgy I would say. I have plans to fix it at some point, but
> that requires fixing the virtual periodic timers logic first, which I
> didn't get around to re-posting.

True. Looking forward to it.

Jan


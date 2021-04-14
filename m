Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFF935F5C5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 16:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110675.211261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWg8y-0007cw-S7; Wed, 14 Apr 2021 14:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110675.211261; Wed, 14 Apr 2021 14:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWg8y-0007ca-Oz; Wed, 14 Apr 2021 14:05:24 +0000
Received: by outflank-mailman (input) for mailman id 110675;
 Wed, 14 Apr 2021 14:05:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWg8w-0007cV-Ms
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 14:05:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 364c1599-b3b0-4fbd-8721-12da8339a453;
 Wed, 14 Apr 2021 14:05:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7F07AFC1;
 Wed, 14 Apr 2021 14:05:20 +0000 (UTC)
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
X-Inumbo-ID: 364c1599-b3b0-4fbd-8721-12da8339a453
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618409120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ueHHhtxP+TRnM85mm1rkJ25UyEPRi4fXY2kVSgrdGss=;
	b=oqaKGVWAjz+Ga0fN8LIzyYRu1rPObkfss30zCC0JWgBqJ9YeUquGzPmYsQsDbiS4cKN6af
	xXCmFxGch4FX2R0aI4xDrpX/gFwr5PHlM9p1WVk7Kk1UIVQGQi+bTgP/2WAfrS5QU6RW7e
	hEfOHxw78NS7qWb9dI7m9ZgZo3CREfM=
Subject: Re: [PATCH v3 09/11] x86/vpt: switch interrupt injection model
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-10-roger.pau@citrix.com>
 <3cb01098-887b-c952-1f93-e89c443ba471@suse.com>
 <YHbwII1L1O7AjJhl@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c65efcf-28fa-147d-8c82-7498cad19aeb@suse.com>
Date: Wed, 14 Apr 2021 16:05:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHbwII1L1O7AjJhl@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.04.2021 15:37, Roger Pau Monné wrote:
> On Wed, Apr 14, 2021 at 12:28:43PM +0200, Jan Beulich wrote:
>> On 31.03.2021 12:33, Roger Pau Monne wrote:
>>> ---
>>>  xen/arch/x86/hvm/svm/intr.c   |   3 -
>>>  xen/arch/x86/hvm/vmx/intr.c   |  59 ------
>>>  xen/arch/x86/hvm/vpt.c        | 334 ++++++++++++++--------------------
>>>  xen/include/asm-x86/hvm/vpt.h |   5 +-
>>>  4 files changed, 143 insertions(+), 258 deletions(-)
>>
>> Nice.
>>
>>> @@ -285,189 +238,144 @@ static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
>>>              list_del(&pt->list);
>>>          pt->on_list = false;
>>>          pt->pending_intr_nr = 0;
>>> +
>>> +        return;
>>>      }
>>> -    else if ( mode_is(v->domain, one_missed_tick_pending) ||
>>> -              mode_is(v->domain, no_missed_ticks_pending) )
>>> +
>>> +    if ( mode_is(v->domain, one_missed_tick_pending) ||
>>> +         mode_is(v->domain, no_missed_ticks_pending) )
>>>      {
>>> -        pt->last_plt_gtime = hvm_get_guest_time(v);
>>>          pt_process_missed_ticks(pt);
>>>          pt->pending_intr_nr = 0; /* 'collapse' all missed ticks */
>>> +    }
>>> +    else if ( !pt->pending_intr_nr )
>>> +        pt_process_missed_ticks(pt);
>>
>> Did you lose a -- here? I.e. does the condition mean to match ...
>>
>>> +    if ( !pt->pending_intr_nr )
>>>          set_timer(&pt->timer, pt->scheduled);
>>> +}
>>> +
>>> +static void pt_timer_fn(void *data)
>>> +{
>>> +    struct periodic_time *pt = data;
>>> +    struct vcpu *v;
>>> +    time_cb *cb = NULL;
>>> +    void *cb_priv;
>>> +    unsigned int irq;
>>> +
>>> +    pt_lock(pt);
>>> +
>>> +    v = pt->vcpu;
>>> +    irq = pt->irq;
>>> +
>>> +    if ( inject_interrupt(pt) )
>>> +    {
>>> +        pt->scheduled += pt->period;
>>> +        pt->do_not_freeze = 0;
>>> +        cb = pt->cb;
>>> +        cb_priv = pt->priv;
>>>      }
>>>      else
>>>      {
>>> -        pt->last_plt_gtime += pt->period;
>>> -        if ( --pt->pending_intr_nr == 0 )
>>
>> ... this original code? Otherwise I can't see why the condition
>> guards a pt_process_missed_ticks() invocation.
> 
> I think the logic here changed enough to not match anymore. Certainly
> pending_intr_nr shouldn't be decreased there, as pt_irq_fired is
> invoked after an EOI in this patch, instead of being invoked when a
> vpt related interrupt was injected. I think I should better rename
> pt_irq_fired to pt_irq_eoi and that would make it clearer.

But pt_process_missed_ticks() should be called only when a tick was
missed, shouldn't it? Or actually, looking at the function, I guess
I'm confused. Does your patch change the meaning of the field?

> FWIW, decreasing pending_intr_nr should only be done after an
> inject_interrupt call.

Then this line (which you leave in place)

         pt->pending_intr_nr = 0; /* 'collapse' all missed ticks */

is contradicting the (new) model.

Jan


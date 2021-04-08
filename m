Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E90357CA1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 08:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107058.204641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUOFe-0003Sn-H3; Thu, 08 Apr 2021 06:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107058.204641; Thu, 08 Apr 2021 06:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUOFe-0003SN-Cd; Thu, 08 Apr 2021 06:34:50 +0000
Received: by outflank-mailman (input) for mailman id 107058;
 Thu, 08 Apr 2021 06:34:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUOFc-0003SI-Sz
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 06:34:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27c5cfa3-6d0e-44d5-aabd-c97cfeb1a925;
 Thu, 08 Apr 2021 06:34:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4795AFF0;
 Thu,  8 Apr 2021 06:34:46 +0000 (UTC)
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
X-Inumbo-ID: 27c5cfa3-6d0e-44d5-aabd-c97cfeb1a925
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617863687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KoUIvLOfvNrykFIBuyDXFZG0FOvWgNiAZRFCjRfpXyg=;
	b=hWauGpSueEOD/RMbpRwBtSPYMR8VqcvWC+qNcygNBfOK9QMElqbtoQh9GPOMJz1SiqLE/p
	SdP39wqCeNkkwa+G1oXmVuvrlMbGPvnebQckX/ehU17nkvOQnT5apS0ORciemZTqXZeiDD
	sa4JiRXjHhnUEOVayAYmr/GGWxcSQNU=
Subject: Re: [PATCH v3 06/11] x86/hvm: allowing registering EOI callbacks for
 GSIs
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-7-roger.pau@citrix.com>
 <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
 <YG3m9nW6xPeL7MPr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <06192f36-dae3-9626-3fe5-98722d2753f5@suse.com>
Date: Thu, 8 Apr 2021 08:34:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG3m9nW6xPeL7MPr@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.04.2021 19:08, Roger Pau Monné wrote:
> On Wed, Apr 07, 2021 at 05:51:14PM +0200, Jan Beulich wrote:
>> On 31.03.2021 12:32, Roger Pau Monne wrote:
>>> +bool hvm_gsi_has_callbacks(const struct domain *d, unsigned int gsi)
>>> +{
>>> +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
>>> +    bool has_callbacks;
>>> +
>>> +    read_lock(&hvm_irq->gsi_callbacks_lock);
>>> +    has_callbacks = !list_empty(&hvm_irq->gsi_callbacks[gsi]);
>>> +    read_unlock(&hvm_irq->gsi_callbacks_lock);
>>> +
>>> +    return has_callbacks;
>>> +}
>>
>> What use is this function? Its result is stale by the time the
>> caller can look at it, as you've dropped the lock.
> 
> Right, that function is only used to decide whether the vIOAPIC needs
> to register an EOI callback when injecting a vector to the vlapic. The
> workflow is to first register a callback with the vIOAPIC and
> afterwards inject an interrupt which will trigger the callback
> logic.
> 
> Playing with the callback registration while interrupts can be
> injected will likely result in a malfunction of the device that relies
> on those callbacks, but that's to be expected anyway when playing such
> games.
> 
> That said multiple users sharing a vIOAPIC pin should be fine as long
> as they follow the logic above: always register a callback before
> attempting to inject an interrupt.

May I ask that you add a comment ahead of this function pointing out
the restriction?

>>> @@ -443,7 +457,8 @@ static void ioapic_inj_irq(
>>>      struct vlapic *target,
>>>      uint8_t vector,
>>>      uint8_t trig_mode,
>>> -    uint8_t delivery_mode)
>>> +    uint8_t delivery_mode,
>>> +    bool callback)
>>>  {
>>>      HVM_DBG_LOG(DBG_LEVEL_IOAPIC, "irq %d trig %d deliv %d",
>>>                  vector, trig_mode, delivery_mode);
>>> @@ -452,7 +467,7 @@ static void ioapic_inj_irq(
>>>             (delivery_mode == dest_LowestPrio));
>>>  
>>>      vlapic_set_irq_callback(target, vector, trig_mode,
>>> -                            trig_mode ? eoi_callback : NULL, NULL);
>>> +                            callback ? eoi_callback : NULL, NULL);
>>
>> I think you'd better use trig_mode || callback here and ...
>>
>>> @@ -466,6 +481,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>>>      struct vlapic *target;
>>>      struct vcpu *v;
>>>      unsigned int irq = vioapic->base_gsi + pin;
>>> +    bool callback = trig_mode || hvm_gsi_has_callbacks(d, irq);
>>>  
>>>      ASSERT(spin_is_locked(&d->arch.hvm.irq_lock));
>>>  
>>> @@ -492,7 +508,8 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>>>              target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
>>>          if ( target != NULL )
>>>          {
>>> -            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode);
>>> +            ioapic_inj_irq(vioapic, target, vector, trig_mode, delivery_mode,
>>> +                           callback);
>>
>> ... invoke hvm_gsi_has_callbacks() right here and ...
>>
>>> @@ -507,7 +524,7 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>>>          for_each_vcpu ( d, v )
>>>              if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode) )
>>>                  ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector, trig_mode,
>>> -                               delivery_mode);
>>> +                               delivery_mode, callback);
>>
>> ... here, avoiding to call the function when you don't need the
>> result.
> 
> I think there's a slim chance of not needing to use the callback local
> variable, and hence didn't consider limiting it. I can do, but I'm
> unsure this will bring any real benefit while making the code more
> complex IMO.

Really the variable remaining unused in a minor set of cases was only
a secondary observation. What I first stumbled over is the moving of
the decision whether a callback is wanted from ioapic_inj_irq() to its
caller. Since the function clearly is intended as a helper of
vioapic_deliver(), I guess in the end it's fine the way you have it.

Jan


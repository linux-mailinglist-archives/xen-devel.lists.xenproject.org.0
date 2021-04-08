Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1180A357C99
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 08:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107053.204629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUO8I-0002V5-OS; Thu, 08 Apr 2021 06:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107053.204629; Thu, 08 Apr 2021 06:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUO8I-0002Ug-LA; Thu, 08 Apr 2021 06:27:14 +0000
Received: by outflank-mailman (input) for mailman id 107053;
 Thu, 08 Apr 2021 06:27:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUO8H-0002Ub-Na
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 06:27:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 742b8be5-8363-4553-9d93-daa2e6587f3b;
 Thu, 08 Apr 2021 06:27:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0611AE56;
 Thu,  8 Apr 2021 06:27:11 +0000 (UTC)
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
X-Inumbo-ID: 742b8be5-8363-4553-9d93-daa2e6587f3b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617863231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6l8hq1adUQ4Z/WphXMblfUysCcBR3UoIJr/4Gc+IYdU=;
	b=MCGwpIGPiGj2+eewA3oxTPa+ndwqaGv6L8JUCVDsqsX3c2FJeGVmJYQHsd1mcLBjAA0at3
	03LSmECueB9oS4kdT73OnBt3j1t8x1blxkI8hPZVAfXhkKRzvgGU71sd34tEuFxWj+0g/w
	PSHCM81ZjQHRxYYaW+5xuFURbcLn63g=
Subject: Re: [PATCH v3 05/11] x86/vioapic: switch to use the EOI callback
 mechanism
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-6-roger.pau@citrix.com>
 <f8d9c37f-8896-36af-712a-ac0765567409@suse.com>
 <YG3iAeFFA/ZJh5es@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <402bba57-4998-fa9c-2767-235e602a06bf@suse.com>
Date: Thu, 8 Apr 2021 08:27:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG3iAeFFA/ZJh5es@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.04.2021 18:46, Roger Pau Monné wrote:
> On Wed, Apr 07, 2021 at 05:19:06PM +0200, Jan Beulich wrote:
>> On 31.03.2021 12:32, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/vioapic.c
>>> +++ b/xen/arch/x86/hvm/vioapic.c
>>> @@ -621,7 +624,43 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
>>>           d->arch.hvm.nr_vioapics != 1 )
>>>          return -EOPNOTSUPP;
>>>  
>>> -    return hvm_load_entry(IOAPIC, h, &s->domU);
>>> +    rc = hvm_load_entry(IOAPIC, h, &s->domU);
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    for ( i = 0; i < ARRAY_SIZE(s->domU.redirtbl); i++ )
>>> +    {
>>> +        const union vioapic_redir_entry *ent = &s->domU.redirtbl[i];
>>> +        unsigned int vector = ent->fields.vector;
>>> +        unsigned int delivery_mode = ent->fields.delivery_mode;
>>> +        struct vcpu *v;
>>> +
>>> +        /*
>>> +         * Add a callback for each possible vector injected by a redirection
>>> +         * entry.
>>> +         */
>>> +        if ( vector < 16 || !ent->fields.remote_irr ||
>>> +             (delivery_mode != dest_LowestPrio && delivery_mode != dest_Fixed) )
>>> +            continue;
>>> +
>>> +        for_each_vcpu ( d, v )
>>> +        {
>>> +            struct vlapic *vlapic = vcpu_vlapic(v);
>>> +
>>> +            /*
>>> +             * NB: if the vlapic registers were restored before the vio-apic
>>> +             * ones we could test whether the vector is set in the vlapic IRR
>>> +             * or ISR registers before unconditionally setting the callback.
>>> +             * This is harmless as eoi_callback is capable of dealing with
>>> +             * spurious callbacks.
>>> +             */
>>> +            if ( vlapic_match_dest(vlapic, NULL, 0, ent->fields.dest_id,
>>> +                                   ent->fields.dest_mode) )
>>> +                vlapic_set_callback(vlapic, vector, eoi_callback, NULL);
>>
>> eoi_callback()'s behavior is only one of the aspects to consider here.
>> The other is vlapic_set_callback()'s complaining if it finds a
>> callback already set. What guarantees that a mistakenly set callback
>> here won't get in conflict with some future use of the same vector by
>> the guest?
> 
> Such conflict would only manifest as a warning message, but won't
> cause any malfunction, as the later callback would override the
> current one.
> 
> This model I'm proposing doesn't support lapic vector sharing with
> different devices that require EOI callbacks, I think we already
> discussed this on a previous series and agreed it was fine.

The problem with such false positive warning messages is that
they'll cause cautious people to investigate, i.e. spend perhaps
a sizable amount of time in understanding what was actually a non-
issue. I view this as a problem, even if the code's functioning is
fine the way it is. I'm not even sure explicitly mentioning the
situation in the comment is going to help, as one may not stumble
across that comment while investigating.

>>> --- a/xen/arch/x86/hvm/vlapic.c
>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>> @@ -192,7 +192,13 @@ void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
>>>  
>>>      if ( hvm_funcs.update_eoi_exit_bitmap )
>>>          alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
>>> -                          trig || callback);
>>> +                          /*
>>> +                           * NB: need to explicitly convert to boolean to avoid
>>> +                           * truncation wrongly result in false begin reported
>>> +                           * for example when the pointer sits on a page
>>> +                           * boundary.
>>> +                           */
>>> +                          !!callback);
>>
>> I've had quite a bit of difficulty with the comment. Once I realized
>> that you likely mean "being" instead of "begin" it got a bit better.
>> I'd like to suggest also s/result/resulting/, a comma after "reported",
>> and maybe then s/being reported/getting passed/.
>>
>> As to explicitly converting to bool, wouldn't a cast to bool do? That's
>> more explicitly an "explicit conversion" than using !!.
> 
> I've always used !! in the past for such cases because it's shorter, I
> can explicitly cast if you prefer that instead.

I agree with the "shorter" aspect. What I'm afraid of is that someone may,
despite the comment, think the !! is a stray leftover from the bool_t
days. I'd therefore prefer to keep the !! pattern for just the legacy
uses, and see casts used in cases like the one here. However, if both you
and Andrew think otherwise, so be it.

Jan


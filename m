Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D435812B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 12:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107162.204839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUSGg-0003NU-1Y; Thu, 08 Apr 2021 10:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107162.204839; Thu, 08 Apr 2021 10:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUSGf-0003N5-UK; Thu, 08 Apr 2021 10:52:09 +0000
Received: by outflank-mailman (input) for mailman id 107162;
 Thu, 08 Apr 2021 10:52:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUSGe-0003N0-WC
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 10:52:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd2ccb42-6407-4150-9cdf-d271d48e18d4;
 Thu, 08 Apr 2021 10:52:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A0A1AFCC;
 Thu,  8 Apr 2021 10:52:07 +0000 (UTC)
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
X-Inumbo-ID: cd2ccb42-6407-4150-9cdf-d271d48e18d4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617879127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLaz+s1Hj0xZxx9tmyUGGcDwImJsDaUfO9hi3M2BJXE=;
	b=GIsYeYwkRPHtdn4SK1K1Xa33MpEgsoWDI9XQMvmIYaY7b5/3k+eYjzqNPYvDqM+7bIOdTf
	JnBeyzuHhLZtxwgThW2ez+ts2qpPwh/QPRzmRkEHWN0jgh0wBHnTNoyno9lZXj/OGNej5D
	sQkdVXm2kvSEcA4FFL3hWHf8fiRBCPs=
Subject: Re: [PATCH v3 05/11] x86/vioapic: switch to use the EOI callback
 mechanism
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-6-roger.pau@citrix.com>
 <f8d9c37f-8896-36af-712a-ac0765567409@suse.com>
 <YG3iAeFFA/ZJh5es@Air-de-Roger>
 <402bba57-4998-fa9c-2767-235e602a06bf@suse.com>
 <YG7F9afvuvtqgSIS@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bcbc817-9120-fd1f-27fd-ed440d4a12eb@suse.com>
Date: Thu, 8 Apr 2021 12:52:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG7F9afvuvtqgSIS@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.04.2021 10:59, Roger Pau Monné wrote:
> On Thu, Apr 08, 2021 at 08:27:10AM +0200, Jan Beulich wrote:
>> On 07.04.2021 18:46, Roger Pau Monné wrote:
>>> On Wed, Apr 07, 2021 at 05:19:06PM +0200, Jan Beulich wrote:
>>>> On 31.03.2021 12:32, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/hvm/vioapic.c
>>>>> +++ b/xen/arch/x86/hvm/vioapic.c
>>>>> @@ -621,7 +624,43 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
>>>>>           d->arch.hvm.nr_vioapics != 1 )
>>>>>          return -EOPNOTSUPP;
>>>>>  
>>>>> -    return hvm_load_entry(IOAPIC, h, &s->domU);
>>>>> +    rc = hvm_load_entry(IOAPIC, h, &s->domU);
>>>>> +    if ( rc )
>>>>> +        return rc;
>>>>> +
>>>>> +    for ( i = 0; i < ARRAY_SIZE(s->domU.redirtbl); i++ )
>>>>> +    {
>>>>> +        const union vioapic_redir_entry *ent = &s->domU.redirtbl[i];
>>>>> +        unsigned int vector = ent->fields.vector;
>>>>> +        unsigned int delivery_mode = ent->fields.delivery_mode;
>>>>> +        struct vcpu *v;
>>>>> +
>>>>> +        /*
>>>>> +         * Add a callback for each possible vector injected by a redirection
>>>>> +         * entry.
>>>>> +         */
>>>>> +        if ( vector < 16 || !ent->fields.remote_irr ||
>>>>> +             (delivery_mode != dest_LowestPrio && delivery_mode != dest_Fixed) )
>>>>> +            continue;
>>>>> +
>>>>> +        for_each_vcpu ( d, v )
>>>>> +        {
>>>>> +            struct vlapic *vlapic = vcpu_vlapic(v);
>>>>> +
>>>>> +            /*
>>>>> +             * NB: if the vlapic registers were restored before the vio-apic
>>>>> +             * ones we could test whether the vector is set in the vlapic IRR
>>>>> +             * or ISR registers before unconditionally setting the callback.
>>>>> +             * This is harmless as eoi_callback is capable of dealing with
>>>>> +             * spurious callbacks.
>>>>> +             */
>>>>> +            if ( vlapic_match_dest(vlapic, NULL, 0, ent->fields.dest_id,
>>>>> +                                   ent->fields.dest_mode) )
>>>>> +                vlapic_set_callback(vlapic, vector, eoi_callback, NULL);
>>>>
>>>> eoi_callback()'s behavior is only one of the aspects to consider here.
>>>> The other is vlapic_set_callback()'s complaining if it finds a
>>>> callback already set. What guarantees that a mistakenly set callback
>>>> here won't get in conflict with some future use of the same vector by
>>>> the guest?
>>>
>>> Such conflict would only manifest as a warning message, but won't
>>> cause any malfunction, as the later callback would override the
>>> current one.
>>>
>>> This model I'm proposing doesn't support lapic vector sharing with
>>> different devices that require EOI callbacks, I think we already
>>> discussed this on a previous series and agreed it was fine.
>>
>> The problem with such false positive warning messages is that
>> they'll cause cautious people to investigate, i.e. spend perhaps
>> a sizable amount of time in understanding what was actually a non-
>> issue. I view this as a problem, even if the code's functioning is
>> fine the way it is. I'm not even sure explicitly mentioning the
>> situation in the comment is going to help, as one may not stumble
>> across that comment while investigating.
> 
> What about making the warning message in case of override in
> vlapic_set_callback conditional to there being a vector pending in IRR
> or ISR?
> 
> Without having such vector pending the callback is just useless, as
> it's not going to be executed, so overriding it in that situation is
> perfectly fine. That should prevent the restoring here triggering the
> message unless there's indeed a troublesome sharing of a vector.

Ah yes, since the callbacks are self-clearing, this gating looks quite
reasonable to me.

Jan


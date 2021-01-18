Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD52FA587
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 17:04:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69845.125146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1X0w-0007yh-9J; Mon, 18 Jan 2021 16:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69845.125146; Mon, 18 Jan 2021 16:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1X0w-0007yM-6A; Mon, 18 Jan 2021 16:04:22 +0000
Received: by outflank-mailman (input) for mailman id 69845;
 Mon, 18 Jan 2021 16:04:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1X0v-0007yH-60
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:04:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ea6f781-30e4-4789-869e-4e7fb3b0bc2b;
 Mon, 18 Jan 2021 16:04:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86DDAAF9A;
 Mon, 18 Jan 2021 16:04:19 +0000 (UTC)
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
X-Inumbo-ID: 9ea6f781-30e4-4789-869e-4e7fb3b0bc2b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610985859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EP+V3rFQsY5jbULi4FsTgCWy2uh3ptDsCE4cOm8ZO5U=;
	b=VDI0e3vnnURUvBrvZZo5Q8LJnvIU2ub+vGt4s3e3KBapFZzqO0+5mQZYxj+xVxG4hJkqf6
	zmXHSQ/xpYXGDcSigIBVxDwOXCaisRinWRcNABHFf5Kuc4w4pcF90KYyncPRPN9yFzwO7q
	tqt7efkhmm6JYSF+jL48r9aHnOzbJX4=
Subject: Re: [PATCH] x86/CPUID: unconditionally set
 XEN_HVM_CPUID_IOMMU_MAPPINGS
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210115150138.36087-1-roger.pau@citrix.com>
 <7535c962-bb3b-6bca-977a-9e8a3332a0f5@suse.com>
 <20210118155426.tnzw7kiceqyytqwa@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7b3c154-7557-ce1a-c8d8-560709f6cabc@suse.com>
Date: Mon, 18 Jan 2021 17:04:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118155426.tnzw7kiceqyytqwa@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.01.2021 16:54, Roger Pau Monné wrote:
> On Mon, Jan 18, 2021 at 12:05:12PM +0100, Jan Beulich wrote:
>> On 15.01.2021 16:01, Roger Pau Monne wrote:
>>> This is a revert of f5cfa0985673 plus a rework of the comment that
>>> accompanies the setting of the flag so we don't forget why it needs to
>>> be unconditionally set: it's indicating whether the version of Xen has
>>> the original issue fixed and IOMMU entries are created for
>>> grant/foreign maps.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Despite my earlier ack I came to think that the description and
>> comment still don't make it quite clear what was actually wrong
>> with the prior change, and hence they also don't really guard
>> against the same getting done again (perhaps even by me). May I
>> ask that you add a paragraph above and ...
> 
> What about adding:
> 
> "If the flag is only exposed when the IOMMU is enabled the guest could
> resort to use bounce buffers when running backends as it would assume
> the underlying Xen version still has the bug present and thus
> grant/foreign maps cannot be used with devices."
> 
> To the commit log?

SGTM.

>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -1049,11 +1049,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>>>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
>>>  
>>>          /*
>>> -         * Indicate that memory mapped from other domains (either grants or
>>> -         * foreign pages) has valid IOMMU entries.
>>> +         * Unconditionally set the flag to indicate this version of Xen has
>>> +         * been fixed to create IOMMU mappings for grant/foreign maps.
>>>           */
>>> -        if ( is_iommu_enabled(d) )
>>> -            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
>>> +        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
>>
>> ... try to clarify the "Unconditionally" here?
> 
> I guess Unconditionally doesn't make much sense, so would be better to
> start the sentence with 'Set ...' instead?

Hmm, this would further move us away from the goal of the comment
making sufficiently clear that a conditional shouldn't be (re-)
introduced here, I would think. Since I can't seem to think of a
good way to express this more briefly than in the description,
and if maybe you can't either, perhaps there's no choice then to
leave it as is, hoping that people would look at the commit before
proposing a further change here.

Jan


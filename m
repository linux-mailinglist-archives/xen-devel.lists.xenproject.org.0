Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E09D2305654
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75838.136660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gg1-0001qZ-1J; Wed, 27 Jan 2021 08:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75838.136660; Wed, 27 Jan 2021 08:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gg0-0001qA-UR; Wed, 27 Jan 2021 08:59:48 +0000
Received: by outflank-mailman (input) for mailman id 75838;
 Wed, 27 Jan 2021 08:59:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4gfz-0001q5-C4
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 08:59:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46090357-415a-4359-9f27-db7610921a8a;
 Wed, 27 Jan 2021 08:59:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7054FAD57;
 Wed, 27 Jan 2021 08:59:45 +0000 (UTC)
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
X-Inumbo-ID: 46090357-415a-4359-9f27-db7610921a8a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611737985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yrcxmr+uUmB7RHC9E2WHoxzb4Ot2eQO4QPzOSogoOBo=;
	b=rjZ3eFHxpcY4HAmKrZVgzkiht5Wx+SpdFNdzRvKhA9jmtJ6q3fdn4t6c1WXIWxJiuCX0FN
	uDOUoPMol6xdcdliEdrqunrcoPins6BI/6xNxlxEAGWTWxfHCzd2T/om42QV7yNg4mzcoa
	789faxipfX75hSRP1rhJMMYsPDaKJ1M=
Subject: Re: [PATCH 2/3] x86/irq: don't disable domain MSI IRQ on force unbind
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126110606.21741-1-roger.pau@citrix.com>
 <20210126110606.21741-3-roger.pau@citrix.com>
 <7633ddb0-922b-0165-7e8c-d265786ef4aa@suse.com>
 <20210126162157.3hr7yk6o2rbtrero@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b4e74cb-09cb-8c88-e0e2-1939fbed7fef@suse.com>
Date: Wed, 27 Jan 2021 09:59:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126162157.3hr7yk6o2rbtrero@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 17:21, Roger Pau Monné wrote:
> On Tue, Jan 26, 2021 at 03:52:54PM +0100, Jan Beulich wrote:
>> On 26.01.2021 12:06, Roger Pau Monne wrote:
>>> When force unbinding a MSI the used IRQ would get added to the domain
>>> irq-pirq tree as -irq -pirq,
>>
>> I think it's -pirq at index irq, i.e. I don't think IRQ gets
>> negated as far as the radix tree goes. info->arch.irq gets a
>> negative value stored, yes.
> 
> Right, and this then prevents the IRQ to be used at all by the domain.
> Doiong a domain_irq_to_pirq with that IRQ will get -pirq, but that
> seems pretty arbitrary for MSI IRQs, that get allocated on demand.
> 
> At the end of unmap_domain_pirq the IRQ will get freed if it was
> assigned to an MSI source,

This is a good point, but ...

> and hence it seem pointless to add irq ->
> -pirq to the domain irq tree.

... without this I think ...

>>> thus preventing the same IRQ to be used by the domain.
>>
>> Iirc this (answering your post-commit-message question here)
>> is for cleaning up _after_ the domain, i.e. there's no goal
>> to allow re-use of this IRQ. The comment ahead of
>> unmap_domain_pirq() validly says "The pirq should have been
>> unbound before this call." The only time we can't make
>> ourselves dependent upon this is when the guest is being
>> cleaned up. During normal operation I think we actually
>> _want_ to enforce correct behavior of the guest here.
> 
> OK, so that might be fine for legacy PCI IRQs, that are fixed, but
> quite pointless for allocated on demand MSI IRQs that can change
> between allocations.
> 
>>> It's not clear to me why we add the irq as -irq -pirq to the irq-pirq
>>> domain tree on forced unbind, as allowing to bind the irq again should
>>> just work regardless of whether it has been previously forcefully
>>> unbound?
>>
>> To continue from the above, see pirq_guest_unbind() where
>> we have
>>
>>     if ( desc == NULL )
>>     {
>>         irq = -pirq->arch.irq;
>>         BUG_ON(irq <= 0);

... this would then trigger (or other badness result) if the
guest does unmap and unbind in the wrong order.

>>         desc = irq_to_desc(irq);
>>         spin_lock_irq(&desc->lock);
>>         clear_domain_irq_pirq(d, irq, pirq);
>>     }
>>
>> as the alternative to going the normal path through
>> __pirq_guest_unbind(). Again iirc that's to cover for the
>> unbind request arriving after the unmap one (i.e. having
>> caused the unmap to force-unbind the IRQ).
> 
> Oh, so that's the point. Do you think you could add some comments to
> explain the indented behaviour? I think I get it now, but it's hard to
> follow without some pointers.

Let's first settle on what exactly to do here, because this
may then affect what exactly those comments would want to
say. (If the patch here ended up touching at least one of
the two involved pieces of code, perhaps such comments
could also get added while altering that code.)

Jan


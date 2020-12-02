Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6962CB60E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 09:00:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42472.76383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkN40-0003cK-UR; Wed, 02 Dec 2020 08:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42472.76383; Wed, 02 Dec 2020 08:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkN40-0003bv-Qs; Wed, 02 Dec 2020 08:00:36 +0000
Received: by outflank-mailman (input) for mailman id 42472;
 Wed, 02 Dec 2020 08:00:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkN3z-0003bq-AI
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 08:00:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e60884d-8b66-4a16-9af0-d577dcd50c5d;
 Wed, 02 Dec 2020 08:00:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 622F2AC2D;
 Wed,  2 Dec 2020 08:00:33 +0000 (UTC)
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
X-Inumbo-ID: 8e60884d-8b66-4a16-9af0-d577dcd50c5d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606896033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6FYMsGWpX8KoLJIZ4SxdHBjh5HKNe1VFSZksiQciHU=;
	b=TgdOqlZCy72ckynxbg33GXrVdLZ+6wPcKZ+pJo2D/k4tYjLqBzIxHmWb/wp7QXABb3Ud0D
	bpEtnY2oDzWRjmGDGr3DYjzu+yvUJvPZuw7hoodtFZEvbPkPMFohZXn8w1bWwB1NldsSco
	u6kuDx+diToy7BvMAjgThrIDRmtE6c8=
Subject: Re: [PATCH V3 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
 <87eek9u6tj.fsf@linaro.org> <cd2e064e-896b-3a28-5d37-93ddaba1c13e@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <802c49d5-00bb-9e10-70d7-2629913b08c9@suse.com>
Date: Wed, 2 Dec 2020 09:00:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <cd2e064e-896b-3a28-5d37-93ddaba1c13e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.12.2020 19:53, Oleksandr wrote:
> On 01.12.20 13:03, Alex Bennée wrote:
>> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
>>> @@ -1112,19 +1155,11 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
>>>       if ( s->emulator != current->domain )
>>>           goto out;
>>>   
>>> -    rc = p2m_set_ioreq_server(d, flags, s);
>>> +    rc = arch_ioreq_server_map_mem_type(d, s, flags);
>>>   
>>>    out:
>>>       spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>>>   
>>> -    if ( rc == 0 && flags == 0 )
>>> -    {
>>> -        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> -
>>> -        if ( read_atomic(&p2m->ioreq.entry_count) )
>>> -            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
>>> -    }
>>> -
>> It should be noted that p2m holds it's own lock but I'm unfamiliar with
>> Xen's locking architecture. Is there anything that prevents another vCPU
>> accessing a page that is also being used my ioreq on the first vCPU?
> I am not sure that I would be able to provide reasonable explanations here.
> All what I understand is that p2m_change_entry_type_global() x86 
> specific (we don't have p2m_ioreq_server concept on Arm) and should 
> remain as such (not exposed to the common code).
> IIRC, I raised a question during V2 review whether we could have ioreq 
> server lock around the call to p2m_change_entry_type_global() and didn't 
> get objections.

Not getting objections doesn't mean much. Personally I don't recall
such a question, but this doesn't mean much. The important thing
here is that you properly justify this change in the description (I
didn't look at this version of the patch as a whole yet, so quite
likely you actually do). This is because you need to guarantee that
you don't introduce any lock order violations by this. There also
should be an attempt to avoid future introduction of issues, by
adding lock nesting related comments in suitable places. Again,
quite likely you actually do so, and I will notice it once looking
at the patch as a whole.

All of this said, I think it should be tried hard to avoid
introducing this extra lock nesting, if there aren't other places
already where the same nesting of locks is in effect.

> I may mistake, but looks like the lock being used
> in p2m_change_entry_type_global() is yet another lock for protecting 
> page table operations, so unlikely we could get into the trouble calling 
> this function with the ioreq server lock held.

I'm afraid I don't understand the "yet another" here: The ioreq
server lock clearly serves an entirely different purpose.

Jan


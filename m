Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF52E1C96
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 14:36:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58360.102534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4Jr-0006N6-I7; Wed, 23 Dec 2020 13:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58360.102534; Wed, 23 Dec 2020 13:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4Jr-0006Mh-Ei; Wed, 23 Dec 2020 13:36:47 +0000
Received: by outflank-mailman (input) for mailman id 58360;
 Wed, 23 Dec 2020 13:36:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks4Jp-0006Mc-N2
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 13:36:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df52edab-390b-4c30-a12d-bbabe2663f2f;
 Wed, 23 Dec 2020 13:36:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2FDC1ACF1;
 Wed, 23 Dec 2020 13:36:42 +0000 (UTC)
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
X-Inumbo-ID: df52edab-390b-4c30-a12d-bbabe2663f2f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608730602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fzAQALtbXHWWto4J3M1V4rToZAfSJS8999UCv0kqgE=;
	b=J/dKniey+COQucY50tJnS7ED+smE2K9Z88nJ8mEHLoGv5kH1guKa67rJXYz3dn3n/3MRjk
	LnPJG+I2wnkKcNxyUn7a/OMHJKk1OOremgG/WVfdm/l4hdj9hO2Wa8aeRUDtjEVkQAadhI
	fIVwyBg44IrCK47vFYLb6odaCSSKX3w=
Subject: Re: [PATCH v3 4/5] evtchn: convert domain event lock to an r/w one
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <a333387e-f9e5-7051-569a-1a9a37da53ca@suse.com>
 <074be931-54b0-1b0f-72d8-5bd577884814@xen.org>
 <6e34fd25-14a2-f655-b019-aca94ce086c8@suse.com>
 <55dc24b4-88c6-1b22-411e-267231632377@xen.org>
 <cf3faa68-ba4a-b864-66e0-f379a24a48ce@suse.com>
 <1f3571eb-5aec-e76e-0b61-2602356fb436@xen.org>
 <099b99bc-c544-0aa8-c3b4-4871ef618e4a@suse.com>
 <aa169dc2-77f2-b3e9-80f4-d5f4d6ea54f1@xen.org>
 <d0b3079b-ae83-a14e-1fc6-ea76bdc7db79@suse.com>
 <25585b2a-7dcd-1b46-b360-9a9e9d54b191@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7176b02-7aa7-9f0f-81ff-bef1757ed4f3@suse.com>
Date: Wed, 23 Dec 2020 14:36:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <25585b2a-7dcd-1b46-b360-9a9e9d54b191@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 14:19, Julien Grall wrote:
> On 23/12/2020 12:57, Jan Beulich wrote:
>> On 23.12.2020 12:22, Julien Grall wrote:
>>>> 1) Neither evtchn_status() nor domain_dump_evtchn_info() appear to
>>>> have a real need to acquire the per-domain lock. They could as well
>>>> acquire the per-channel ones. (In the latter case this will then
>>>> also allow inserting the so far missing process_pending_softirqs()
>>>> call; it shouldn't be made with a lock held.)
>>> I agree that evtchn_status() doesn't need to acquire the per-domain
>>> lock. I am not entirely sure about domain_dump_evtchn_info() because
>>> AFAICT the PIRQ tree (used by domain_pirq_to_irq()) is protected with
>>> d->event_lock.
>>
>> It is, but calling it without the lock just to display the IRQ
>> is not a problem afaict.
> 
> How so? Is the radix tree lookup safe against concurrent radix tree 
> insertion/deletion?

Hmm, looks like I was misguided by pirq_field() tolerating NULL
coming back from radix_tree_lookup(). Indeed, if the tree
structure changed, there would be a problem. But this can't be
solved by holding the lock across the entire loop - as said
earlier, the loop body needs to gain a
process_pending_softirqs() invocation, and that needs to happen
with no locks held. The only way I can see us achieving this is
to drop the per-channel lock prior to calling
domain_pirq_to_irq().

Jan


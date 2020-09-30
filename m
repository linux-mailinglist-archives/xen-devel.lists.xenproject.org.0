Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834727E0F3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 08:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427.1289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNVTQ-0007Ew-MO; Wed, 30 Sep 2020 06:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427.1289; Wed, 30 Sep 2020 06:20:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNVTQ-0007EX-JB; Wed, 30 Sep 2020 06:20:20 +0000
Received: by outflank-mailman (input) for mailman id 427;
 Wed, 30 Sep 2020 06:20:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNVTP-0007ES-GG
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:20:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9ac3cf3-6526-4644-a108-3f67644b9e2a;
 Wed, 30 Sep 2020 06:20:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A179AC3C;
 Wed, 30 Sep 2020 06:20:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNVTP-0007ES-GG
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:20:19 +0000
X-Inumbo-ID: a9ac3cf3-6526-4644-a108-3f67644b9e2a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a9ac3cf3-6526-4644-a108-3f67644b9e2a;
	Wed, 30 Sep 2020 06:20:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601446816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oCxC0kiEHovonzdgMGSEJ604U3novCmFW9pa5xiCq4=;
	b=oxqVmUZmyVQZob3bPVBr6wKcsuB8aHGpReXkIhZxp+LRgvzifMlWryOy9QzsyLIAP//4Sn
	23ZqViYKKu0jBQUOY2/EBt86oIxR85wShpT8Tk2oouV2gilQk4489YajQrDhLhdeDSreAa
	2TXINssjo+1L8H9FtQPjJ1MCojZvgDg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7A179AC3C;
	Wed, 30 Sep 2020 06:20:16 +0000 (UTC)
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
 <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
 <3ad0529d-ad55-8864-1df2-193eaf104c1f@xen.org>
 <6d6d7550-8847-267e-49f2-0ca098ef97ad@suse.com>
 <2a62f5e4-9915-bcd7-05b3-77663c995a13@xen.org>
 <9adeac3b-2b0f-6e9d-aa82-fd966e984fa0@suse.com>
 <52dba8e8-5976-48a2-7a74-ddf877880c6e@xen.org>
 <CAKf6xpv2ZoOV-VhhtkocvzppFX=ch0XfC7e_Y4sjuwb3T+rtww@mail.gmail.com>
 <9947f7b0-2ca6-4016-6a80-1cec383efcbb@suse.com>
 <CAKf6xptyh3BWwuG4qdfVFomu0H6+5tS+N32bAfHLkoEYmUqiTQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a89f69c-ec67-4749-8f55-46b3e00e4989@suse.com>
Date: Wed, 30 Sep 2020 08:20:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xptyh3BWwuG4qdfVFomu0H6+5tS+N32bAfHLkoEYmUqiTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 19:20, Jason Andryuk wrote:
> On Mon, Sep 28, 2020 at 3:49 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.09.2020 20:08, Jason Andryuk wrote:
>>>  Also, a domain label can transition (change) at runtime.
>>> Dropping the send check would latch the permission at bind time which
>>> would not necessarily be valid for the security policy.
>>
>> I did realize this as a possibility too, but there the immediate
>> question is: Why for interdomain channels, but then not also for
>> vIRQ-s, for example? In fact, unless I'm overlooking something,
>> for this specific case there's not even any check in the binding
>> logic, not even for global vIRQ-s. (After all there are two
>> aspects in the permissions here: One is to be eligible to send,
>> which ought to not matter when the sender is Xen, while the
>> other is permission to learn / know of certain events, i.e. in
>> particular global vIRQ-s.)
> 
> I'm not familiar with vIRQ-s, but I did a little bit of review.  A
> vIRQ source is always Xen and its destination is a domain, correct?
> They don't allow a data flow between domains,

Yes and yes.

> so maybe that is why they weren't hooked originally?

Not so much, I assume. Looking a little more closely I find that ...

> Hmmm, even for non-XSM, there is no restriction on binding the "dom0"
> vIRQ-s?

... while binding is allowed, an event would never be received unless
the domain was designated as the receiver via
XEN_DOMCTL_set_virq_handler.

>> The fundamental issue here is that the sending path should be
>> fast and hence lightweight. This means (to me) that in
>> particular no memory allocations should occur, and (more
>> generally) no global or domain wide locks should be taken (for
>> rw ones: no write locks).
> 
> Yes, that all seems good and reasonable.  With XSM/Flask you also need
> the AVC entry for send to be lightweight.
> 
> It wouldn't help with the domain transition case, but you could run
> the xsm send hooks at bind time to pre-populate the cache.

Question is for how long such an entry would remain in the cache,
i.e. whether pre-filling is useful at all. After all pre-filling
has the downside of potentially masking real issues when testing
(as opposed to running in the wild).

>  That would
> still require avc code to bypass the memory allocation when holding a
> lock in case the entry isn't found.  Your preallocation idea could be
> generalized to have avc maintain a reserve of nodes for use when it
> cannot allocate.  When it can allocate, it would refill the reserve in
> addition to whatever regular allocation it would perform.  But if it's
> only evtchn_send that needs special handling, then the complexity may
> not be worth adding.

It was this last aspect which made me not introduce a general
mechanism.

Jan


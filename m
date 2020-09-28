Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2A327A904
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 09:50:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMnuQ-0001gP-Ks; Mon, 28 Sep 2020 07:49:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMnuP-0001gK-T1
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 07:49:17 +0000
X-Inumbo-ID: a28c399b-d060-4f22-bced-94bcb2348782
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a28c399b-d060-4f22-bced-94bcb2348782;
 Mon, 28 Sep 2020 07:49:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601279355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OK94HlkU0JGDD/R9HDpbHBJsD6b2T3PZm6rn4tiLJXY=;
 b=Wqd/0a3pBj77FMYzNw20woXqjkX08lavOOAoTU6XuFNSCgCa8e4pXIZ313Yq71NgHFnlHD
 R2DZzQanGWm6M7nd73Ak2dxTirulciGX/sqTJ/2Xy00AMAO6KDZqEhXdikhXPPqcW4JGkG
 6SO2aO9spN2rX3cO80sTH+vK/ubcmJE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3CB0AD0B;
 Mon, 28 Sep 2020 07:49:15 +0000 (UTC)
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9947f7b0-2ca6-4016-6a80-1cec383efcbb@suse.com>
Date: Mon, 28 Sep 2020 09:49:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpv2ZoOV-VhhtkocvzppFX=ch0XfC7e_Y4sjuwb3T+rtww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.09.2020 20:08, Jason Andryuk wrote:
> On Fri, Sep 25, 2020 at 12:02 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Jan,
>>
>> On 25/09/2020 16:36, Jan Beulich wrote:
>>> On 25.09.2020 16:33, Julien Grall wrote:
>>>> On 25/09/2020 14:58, Jan Beulich wrote:
>>>>> On 25.09.2020 15:16, Julien Grall wrote:
>>>>>> Fair enough. I would still like to consider a way where we could avoid
>>>>>> to hack xsm_* because we have the interrupts disabled.
>>>>>
>>>>> Well, from a conceptual pov it's at least questionable for XSM to
>>>>> need any memory allocations at all when merely being asked for
>>>>> permission. And indeed the need for it arises solely from its
>>>>> desire to cache the result, for the sake of subsequent lookups.
>>>>>
>>>>> I also find it odd that there's an XSM check on the send path in
>>>>> the first place. This isn't just because it would seem to me that
>>>>> it should be decided at binding time whether sending is permitted
>>>>> - I may easily be missing something in the conceptual model here.
>>>>> It's also because __domain_finalise_shutdown() too uses
>>>>> evtchn_send(), and I didn't think this one should be subject to
>>>>> any XSM check (just like send_guest_*() aren't).
>>>>
>>>> Maybe this is the first question we need to answer?
>>>
>>> Indeed that was the question I asked myself before putting together
>>> the patch. Yet I have no idea who could answer it, with Daniel
>>> having gone silent for quite long a time now. Hence I didn't even
>>> put up the question, but instead tried to find a halfway reasonable
>>> solution.
>>
>> IIRC, XSM is used by OpenXT and QubeOS. So I have CCed them to get some
>> input.
> 
> I think the send hook exists because send is its own distinct
> operation.  While most common usage could be handled by just checking
> at bind time, the send hoor provides more flexibility.  For instance,
> the send hook can be used to restrict signalling to only one
> direction.

I did realize this is a special case, but it could still be dealt
with at binding time, via a boolean in struct evtchn.

>  Also, a domain label can transition (change) at runtime.
> Dropping the send check would latch the permission at bind time which
> would not necessarily be valid for the security policy.

I did realize this as a possibility too, but there the immediate
question is: Why for interdomain channels, but then not also for
vIRQ-s, for example? In fact, unless I'm overlooking something,
for this specific case there's not even any check in the binding
logic, not even for global vIRQ-s. (After all there are two
aspects in the permissions here: One is to be eligible to send,
which ought to not matter when the sender is Xen, while the
other is permission to learn / know of certain events, i.e. in
particular global vIRQ-s.)

The fundamental issue here is that the sending path should be
fast and hence lightweight. This means (to me) that in
particular no memory allocations should occur, and (more
generally) no global or domain wide locks should be taken (for
rw ones: no write locks).

> Am I correct that the assertion mentioned in the patch description
> would only be seen in debug builds?

Yes. Release builds would instead have deadlock potential, which
may get realized at any time (or never, if you're really lucky).
Catching such cases early, and in an easy to recognize manner,
is - after all - what the extra checking in debug builds is for.

Jan


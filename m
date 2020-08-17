Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40209246BF2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 18:05:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hcv-0000dp-E2; Mon, 17 Aug 2020 16:04:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7hct-0000dk-Uz
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 16:04:47 +0000
X-Inumbo-ID: ba934d44-8411-4680-81e8-4fbbf39ed1eb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba934d44-8411-4680-81e8-4fbbf39ed1eb;
 Mon, 17 Aug 2020 16:04:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C354AD46;
 Mon, 17 Aug 2020 16:05:10 +0000 (UTC)
Subject: Re: [PATCH 3/4] build: also check for empty .bss.* in .o -> .init.o
 conversion
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <c99cf808-0710-51b1-c07c-07bf237e22a3@suse.com>
 <5b2bbc31-0095-c3e2-9e34-20453ea2aa5f@citrix.com>
 <61481966-3052-ebf2-e23b-aac292cd09a1@suse.com>
 <9a3cd872-bc6c-3113-fdf9-2f80ad8fabce@citrix.com>
 <039916f1-c9f2-710f-8f46-3ff9d91a9109@suse.com>
 <ec93160a-82f5-4a32-78ae-96eb941f1d48@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9be0a02c-2192-3c6f-1c99-0e0c51a2f1d0@suse.com>
Date: Mon, 17 Aug 2020 18:04:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ec93160a-82f5-4a32-78ae-96eb941f1d48@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 10.08.2020 19:51, Andrew Cooper wrote:
> On 07/08/2020 16:40, Jan Beulich wrote:
>> On 07.08.2020 17:12, Andrew Cooper wrote:
>>> On 07/08/2020 11:56, Jan Beulich wrote:
>>>> On 06.08.2020 18:16, Andrew Cooper wrote:
>>>>> On 06/08/2020 10:05, Jan Beulich wrote:
>>>>> Can't we remove all of this by having CONFIG_XEN_PE expressed/selectable
>>>>> properly in Kconfig, and gathering all the objects normally, rather than
>>>>> bodging all of common/efi/ through arch/efi/ ?
>>>> _If_ we settle on Kconfig to be allowed to check compiler (and linker)
>>>> features, then yes. This continues to be a pending topic though, so
>>>> the switch can't be made like this at this point in time. (It could be
>>>> made a Kconfig item now - which, when enabled, implies the assertion
>>>> that a capable tool chain is in use.)
>>> I am still of the opinion that nothing needs discussing, but you are
>>> obviously not.
>>>
>>> Please raise this as a topic and lets discuss it, because it has a
>>> meaningful impacting on a large number of pending series.
>> Preferably I would have put this on this month's community meeting
>> agenda, but I'll be ooo next week, so that's not going to help, I'm
>> afraid. I guess I should put it up in email form when I'm back,
>> albeit I wasn't thinking it should need to be me to start the
>> discussion. Instead my view was that such a discussion should (have
>> been, now after-the-fact) be started by whoever wants to introduce
>> a new feature.
> 
> It would have been better to raise a concern/objectection before you
> committed the feature.

I did, and I committed the whole lot because of not wanting to block
the many improvements over this one aspect I disagree with. Recall
me asking what happens if the compiler (or any part of the tool chain)
gets upgraded (or, possibly worse, downgraded) between two
(incremental) builds?

> It was a very clear intent of upgrading Kconfig and switching to Kbuild,
> to clean up the total and chronic mess we call a build system.  It has
> been discussed multiple times in person, and on xen-devel, without
> apparent objection at the time.

The change to Kbuild was discussed. The use (and, depending on how one
views it, abuse) of Kconfig to determine tool chain capabilities wasn't,
iirc. At least not in a way that it would have been noticeable to me.

> The state of 4.14 and later is that we have the feature, and it is
> already in use, with a lot more use expected to continue fixing the
> build system.

If I'm not mistaken I did make my ack on the first use of the new
behavior (in your CET series) dependent upon a subsequent discussion
(that should have occurred up front), again in an attempt to get
certain things taken care of for 4.14. This was, again iirc, in turn
referring to the earlier ack on Anthony's series, which was given in
a similarly conditional manner. (But I may be mis-remembering.)
Therefore ...

> You are currently blocking work to fix aspects of the build system based
> on a dislike of this feature, *and* expecting someone else to justify
> why using this feature as intended is ok in the first place.

... I'm pretty puzzled: Am I now being told that I shouldn't have
made the compromises, and rather should have blocked things earlier
on? I.e. is my attempt to show reasonable behavior now being turned
back into an argument against me? If so, I can certainly draw the
obvious conclusions from that, for the future.

> I do not consider that a reasonable expectation of how to proceed.
> 
> If you wish to undo what was a deliberate intention of the
> Kconfig/Kbuild work, then it is you who must start the conversation on
> why we should revert the improvements.

If I hadn't voiced my reservations long before, this _may_ indeed be
a valid position to take. But given all that had been said already
before any of this went in, I don't think it is. Anyway - despite me
not thinking it should be me (and hence it not having happened so
far), I intend (as said) to start a discussion. To be honest, I'll
be curious to see how it'll go, both in terms of number of
responses received and in terms of everyone honoring the fact that
it should _not_ matter that the logic in question was already
committed.

Jan


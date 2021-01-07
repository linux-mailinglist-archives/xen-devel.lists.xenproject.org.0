Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A68A2ED040
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 13:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62878.111523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxUpp-0003dy-G0; Thu, 07 Jan 2021 12:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62878.111523; Thu, 07 Jan 2021 12:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxUpp-0003dZ-Ce; Thu, 07 Jan 2021 12:56:13 +0000
Received: by outflank-mailman (input) for mailman id 62878;
 Thu, 07 Jan 2021 12:56:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3gRj=GK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxUpo-0003dU-D6
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 12:56:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e1e0bbe-b4b3-4c8d-a6ab-be9224b90ac7;
 Thu, 07 Jan 2021 12:56:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C91AEAD18;
 Thu,  7 Jan 2021 12:56:08 +0000 (UTC)
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
X-Inumbo-ID: 3e1e0bbe-b4b3-4c8d-a6ab-be9224b90ac7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610024168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8yYPmC8En6lDPmA7JkABAu+9anMfgL7pgfW3yc6s+ig=;
	b=diOyT/mzmngOokGSxtREqoC9+paVz/8VCtxHbNwbiAN4Ijly9SqFBStb0ZmNytJAKH0a4S
	WVXd7iXuyRNGsK4JA33g5ZTxikpjsslLdFpRoxPc6dOoVs/c4WrMehf7sqdLTO6YQvwBxX
	rKM+aCgbnIob6RxuCBnL8AyC+YNwb5w=
Subject: Re: [PATCH 2/2] x86/hap: Resolve mm-lock order violations when
 forking VMs with nested p2m
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
 <19aab6220bf191a31902488ed38c51d239572269.1609781242.git.tamas.lengyel@intel.com>
 <158cf7ca-17cf-c886-20e8-b53519bec1b5@suse.com>
 <CABfawhn3OBbpHW9e1Dd9n4UCOe_KaymBS0QwnJC2tLr-oAnBmg@mail.gmail.com>
 <a3f12f54-926e-9810-f78f-534f057449de@suse.com>
 <CABfawh=+nd+Lm59Ofy31yDVvcQ9fYXNbm_NBNvu8xsnxti+8sQ@mail.gmail.com>
 <ba51a8bf-a2cb-0572-8f8d-4c4246580b59@suse.com>
 <CABfawhk6NPYeCbiXZ00gy+iyESrXu5ciWg0bvsUeCUL9q0k1Qg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0657049-bb1b-7397-45b4-aeaf8e8c15e8@suse.com>
Date: Thu, 7 Jan 2021 13:56:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CABfawhk6NPYeCbiXZ00gy+iyESrXu5ciWg0bvsUeCUL9q0k1Qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.01.2021 13:43, Tamas K Lengyel wrote:
> On Thu, Jan 7, 2021 at 7:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.01.2021 17:26, Tamas K Lengyel wrote:
>>> On Wed, Jan 6, 2021 at 11:11 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 06.01.2021 16:29, Tamas K Lengyel wrote:
>>>>> On Wed, Jan 6, 2021 at 7:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 04.01.2021 18:41, Tamas K Lengyel wrote:
>>>>>>> --- a/xen/arch/x86/mm/p2m.c
>>>>>>> +++ b/xen/arch/x86/mm/p2m.c
>>>>>>> @@ -1598,8 +1598,17 @@ void
>>>>>>>  p2m_flush_nestedp2m(struct domain *d)
>>>>>>>  {
>>>>>>>      int i;
>>>>>>> +    struct p2m_domain *p2m;
>>>>>>> +
>>>>>>>      for ( i = 0; i < MAX_NESTEDP2M; i++ )
>>>>>>> -        p2m_flush_table(d->arch.nested_p2m[i]);
>>>>>>> +    {
>>>>>>> +        p2m = d->arch.nested_p2m[i];
>>>>>>
>>>>>> Please move the declaration here, making this the variable's
>>>>>> initializer (unless line length constraints make the latter
>>>>>> undesirable).
>>>>>
>>>>> I really don't get what difference this would make.
>>>>
>>>> Both choice of (generally) inappropriate types (further up)
>>>> and placement of declarations (here) (and of course also
>>>> other style violations) can set bad precedents even if in a
>>>> specific case it may not matter much. So yes, it may be
>>>> good enough here, but it would violate our desire to
>>>> - use unsigned types when a variable will hold only non-
>>>>   negative values (which in the general case may improve
>>>>   generated code in particular on x86-64),
>>>> - limit the scopes of variables as much as possible, to
>>>>   more easily spot inappropriate uses (like bypassing
>>>>   initialization).
>>>>
>>>> This code here actually demonstrates such a bad precedent,
>>>> using plain int for the loop induction variable. While I
>>>> can't be any way near sure, there's a certain chance you
>>>> actually took it and copied it to
>>>> __mem_sharing_unshare_page(). The chance of such happening
>>>> is what we'd like to reduce over time.
>>>
>>> Yes, I copied it from p2m.c. All I meant was that such minor changes
>>> are generally speaking not worth a round-trip of sending new patches.
>>> I obviously don't care whether this is signed or unsigned. Minor stuff
>>> like that could be changed on commit and is not even worth having a
>>> discussion about.
>>
>> I'm sorry, but no. Committing ought to be a purely mechanical
>> thing. It is a _courtesy_ of the committer if they offer to
>> make adjustments. If us offering this regularly gets taken as
>> "expected behavior", I'm afraid I personally would stop making
>> such an offer, and instead insist on further round trips.
> 
> So you requested changes I consider purely cosmetic, no objections to
> any of them. It would be faster if you just made those changes -
> literally 2 seconds - instead of insisting on this back and forth. I
> really have no idea under what metric this saves *you* time. Now you
> have to write emails to point out the issues and review the patch
> twice, including the lag time of when the sender has time to do the
> changes and resend the patches.

For one, I didn't talk about either process saving time, I don't
think. Then I had comments beyond these purely cosmetic ones.
Therefore I didn't think it was justified to offer making the
mechanical adjustments at commit time. Making such an offer will
please remain subject to the individual's judgement, without
having to justify _at all_ when not making such an offer.

As to time savings - even if I had offered making these changes,
I'd still have to give the respective comments. Both for your
awareness (after all I'd be changing your patch, and you might
not like me doing so), and to hopefully have the effect that in
future submissions you'd take care of such aspects yourself
right away (plus same for any possible observers of the thread).

> I think this process is just bad for
> everyone involved. And now you are saying out of principle you would
> be insisting on more of this just to prove a point? Yea, that would
> certainly solve the problem of commit lag and backlog of reviewing
> patches. But it's your call, I really don't care enough to argue any
> more about it.

I have to admit that I find this odd: If there's disagreement,
wouldn't it generally be better to get it resolved?

Jan


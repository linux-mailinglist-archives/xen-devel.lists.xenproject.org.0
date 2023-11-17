Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310457EEF59
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 10:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634982.990647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vZQ-0002ND-JJ; Fri, 17 Nov 2023 09:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634982.990647; Fri, 17 Nov 2023 09:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vZQ-0002L2-Gi; Fri, 17 Nov 2023 09:55:28 +0000
Received: by outflank-mailman (input) for mailman id 634982;
 Fri, 17 Nov 2023 09:55:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+Qn=G6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r3vZP-0002Kw-9C
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 09:55:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e6151db-852f-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 10:55:26 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5646D4EE0744;
 Fri, 17 Nov 2023 10:55:25 +0100 (CET)
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
X-Inumbo-ID: 6e6151db-852f-11ee-98dc-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 17 Nov 2023 10:55:25 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
In-Reply-To: <b5277391-71bb-42b6-82e4-635dd1361ad3@suse.com>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
 <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
 <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
 <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com>
 <817fab34432c854ce585aba80db77f7c@bugseng.com>
 <8b4e0da82930375b2a95387a9031c73f@bugseng.com>
 <1178b79c-d6a3-a46c-5556-3fb5964dc051@suse.com>
 <392566d1-109b-413c-b904-0e4cb4007263@suse.com>
 <6b6f051130b724ee6a813235e049354c@bugseng.com>
 <7cbf6f0f-d5b1-44e2-9a0e-a9d7d353eb6b@suse.com>
 <alpine.DEB.2.22.394.2311161635200.773207@ubuntu-linux-20-04-desktop>
 <b5277391-71bb-42b6-82e4-635dd1361ad3@suse.com>
Message-ID: <8a1313b3ab5ba6dd556cf37409e3b703@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

>>>>> While I've committed this patch (hoping that I got the necessary
>>>>> context
>>>>> adjustment right for the
>>>>> automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> change), I'd like to come back to this before going further with 
>>>>> users
>>>>> of
>>>>> the new macro: I still think we ought to try to get to the single
>>>>> evaluation wherever possible. The macro would then be used only in
>>>>> cases
>>>>> where the alternative construct (perhaps an isolate_lsb() macro, 
>>>>> living
>>>>> perhaps in xen/bitops.h) cannot be used. ISOLATE_LSB() would then 
>>>>> want
>>>>> to
>>>>> gain a comment directing people to the "better" sibling. Thoughts?
>>>> 
>>>> Having the users in place would help me estimate the remaining work 
>>>> that
>>>> needs to be done on this rule and see if my local counts match up 
>>>> with
>>>> the counts in staging.
>>> 
>>> By "having the users in place", you mean you want other patches in 
>>> this
>>> and the dependent series to be committed as-is (except for the name
>>> change)? That's what I'd like to avoid, as it would mean touching all
>>> those use sites again where the proposed isolate_lsb() could be used
>>> instead. I'd rather see all use sites be put into their final shape
>>> right away.
>> 
>> This request is coming a bit late and also after all the patches have
>> been reviewed already. I for one am not looking forward to review them
>> again.
>> 
>> That said, if you could be more specified maybe it could become
>> actionable:
>> 
>> - do you have a pseudo code implementation of the "better" macro you
>>   would like to propose?
> 
> May I remind you that I made this request (including a draft 
> implementation)
> before already, and Nicola then merely found that the evaluate-once 
> form
> simply cannot be used everywhere? Anybody could have thought of the 
> option
> of "splitting" the macro. After all I hope that there is no 
> disagreement on
> macro arguments better being evaluated just once, whenever possible.
> 
>> - do you have an list of call sites you would like to be changed to 
>> use
>>   the "better" macro?
> 
> No, I don't have a list. But the pattern is pretty clear: The "better" 
> form
> ought to be used wherever it actually can be used.
> 
>> Also, you might remember past discussions about time spent making
>> changes yourself vs. others doing the same. This is one of those cases
>> that it would be faster for you to make the change and send a patch 
>> than
>> explaining someone else how to do it, then review the result (and
>> review it again as it probably won't be exactly as you asked the first
>> time.)
>> 
>> If you don't want the call sites to be changes twice, may I suggest 
>> you
>> provide a patch on top of Nicola's series, I review and ack your 
>> patch,
>> and Nicola or I rebase & resend the series so that the call sites are
>> only changes once as you would like? I think that's going to be way
>> faster.
> 
> I'll see if I can find time to do so. I don't normally work on top of
> other people's uncommitted patches, though ... So I may also choose to 
> go
> a slightly different route. (You realize though that all still pending
> patches using the new macro need touching again anyway, don't you?)
> 
> Jan

Then perhaps it's best if I give it a try at doing the single evaluation 
macro, so that I can make a series modifying the call sites only once on 
top of that and send everything in one go. Before doing that, though, 
I'll make a thread where various aspects that are not so clear yet can 
be discussed, so that we can devise a robust solution (also to dig this 
out of this deep thread).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)


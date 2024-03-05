Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21348723EF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 17:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688860.1073550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhXTW-0007aK-VD; Tue, 05 Mar 2024 16:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688860.1073550; Tue, 05 Mar 2024 16:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhXTW-0007Xy-Sj; Tue, 05 Mar 2024 16:17:06 +0000
Received: by outflank-mailman (input) for mailman id 688860;
 Tue, 05 Mar 2024 16:17:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ATxC=KL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rhXTV-0007Xs-Sf
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 16:17:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc48debd-db0b-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 17:17:01 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id F13D74EE0737;
 Tue,  5 Mar 2024 17:17:00 +0100 (CET)
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
X-Inumbo-ID: cc48debd-db0b-11ee-a1ee-f123f15fe8a2
MIME-Version: 1.0
Date: Tue, 05 Mar 2024 17:17:00 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 04/10] xen/public: address violations of MISRA C Rule
 20.7
In-Reply-To: <ce926fd9-15b7-4c81-9581-b6e904963a24@suse.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <0cdc4dc2fcad699a2274277b32de3ee0207d5a2d.1709219010.git.nicola.vetrini@bugseng.com>
 <bd95193c-522a-4c74-98e0-68fa088a5b49@suse.com>
 <82940f688e5a5eee274fa579991ebd15@bugseng.com>
 <alpine.DEB.2.22.394.2402291447590.853156@ubuntu-linux-20-04-desktop>
 <0e131a6795c9d28583e5e8c248843e67@bugseng.com>
 <ce926fd9-15b7-4c81-9581-b6e904963a24@suse.com>
Message-ID: <388f684d9f161815c13d57ea76c656ac@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-05 11:26, Jan Beulich wrote:
> On 05.03.2024 11:21, Nicola Vetrini wrote:
>> On 2024-02-29 23:49, Stefano Stabellini wrote:
>>> On Thu, 29 Feb 2024, Nicola Vetrini wrote:
>>>> On 2024-02-29 17:40, Jan Beulich wrote:
>>>>> On 29.02.2024 16:27, Nicola Vetrini wrote:
>>>>>> --- a/xen/include/public/xen.h
>>>>>> +++ b/xen/include/public/xen.h
>>>>>> @@ -988,7 +988,7 @@ typedef struct {
>>>>>>        ((b) >>  8) & 0xFF, ((b) >>  0) & 0xFF,                     
>>>>>>       \
>>>>>>        ((c) >>  8) & 0xFF, ((c) >>  0) & 0xFF,                     
>>>>>>       \
>>>>>>        ((d) >>  8) & 0xFF, ((d) >>  0) & 0xFF,                     
>>>>>>       \
>>>>>> -                e1, e2, e3, e4, e5, e6}}
>>>>>> +                (e1), (e2), (e3), (e4), (e5), (e6)}}
>>>>> 
>>>>> Why? Wasn't it agreed already that long macro arguments passed on
>>>>> (no matter whether to a function, a macro, or like used here) don't
>>>>> need parenthesizing?
>>>>> 
>>>> 
>>>> That applies to all outermost macro invocations, but not to the
>>>> innermost one.
>>> 
>>> I don't understand what you mean. Maybe a couple of trivial examples
>>> would help.
>>> 
>>> 
>>>> If you want also aggregate initalizers to be deviated, that could be
>>>> done
>>>> (provided that the macro arg is not included in some expression, 
>>>> such
>>>> as
>>>> "{..., e1 + 1, ...}"
>>> 
>> 
>> Sorry for the late reply. This is the current state:
>> 
>> #define N(x) somestruct var = {..., x, ...}; // <- not deviated,
>> violation here
>> #define M(x) N(x) // <- deviated, no violation here
>> 
>> ...
>> 
>> M(0xff);
>> 
>> The violation is resolved by {..., (x), ...} or by saying that when 
>> "x"
>> is a whole expression in its fully expanded form, then we allow it not
>> to be needlessly parenthesized, as Jan requested (unless I 
>> misunderstood
>> his reply).
> 
> Well, the thing I continue to have trouble with is "fully expanded 
> form".
> That's not the criteria I'd like to see applied. To me all depends on 
> how
> the macro is written, not what uses of the macro expand to.
> 

Sure.

>> In that case, the only this that would still give a
>> violation in the above setting is questionable patterns such as
>> 
>> #define Q(x) x, x
> 
> Right.
> 
> #define Q(x) (x, x)
> 
> ought to be okay though, rule-wise, no matter that it's questionable 
> too.
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)


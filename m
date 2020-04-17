Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633E11AD676
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 08:53:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPKrD-0000YK-35; Fri, 17 Apr 2020 06:52:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPKrB-0000YB-DD
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 06:52:09 +0000
X-Inumbo-ID: f3944602-8077-11ea-8c7d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3944602-8077-11ea-8c7d-12813bfff9fa;
 Fri, 17 Apr 2020 06:52:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 27229AAC7;
 Fri, 17 Apr 2020 06:52:05 +0000 (UTC)
Subject: Re: [PATCH v2] Introduce a description of a new optional tag for
 Backports
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200410164942.9747-1-sstabellini@kernel.org>
 <50c8b3be-eadf-dd39-3ce0-05658faa3a4a@suse.com>
 <alpine.DEB.2.21.2004140953450.4953@sstabellini-ThinkPad-T480s>
 <707a1448-be1d-0aa8-6b11-a33eb247304f@suse.com>
 <04881FC6-A816-44AB-8F25-54E5A265707E@citrix.com>
 <49c732e6-d30d-0892-0bd7-65c082da0429@xen.org>
 <10D98CF7-E38E-44C3-AF24-C93088F6682D@citrix.com>
 <454b13b1-2901-d864-6fc8-bc4f338a14d6@suse.com>
 <alpine.DEB.2.21.2004161252180.8316@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <695f394c-4708-19e3-531c-91e983ac6010@suse.com>
Date: Fri, 17 Apr 2020 08:51:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004161252180.8316@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.04.2020 23:14, Stefano Stabellini wrote:
> On Wed, 15 Apr 2020, Jan Beulich wrote:
>> On 15.04.2020 11:56, George Dunlap wrote:
>>>
>>>
>>>> On Apr 15, 2020, at 10:49 AM, Julien Grall <julien@xen.org> wrote:
>>>>
>>>>
>>>>
>>>> On 15/04/2020 10:43, George Dunlap wrote:
>>>>>> On Apr 15, 2020, at 7:23 AM, Jan Beulich <JBeulich@suse.com> wrote:
>>>>>>
>>>>>> On 14.04.2020 18:54, Stefano Stabellini wrote:
>>>>>>> On Tue, 14 Apr 2020, Jan Beulich wrote:
>>>>>>>> On 10.04.2020 18:49, Stefano Stabellini wrote:
>>>>>>>
>>>>> [snip]
>>>>>>>>> +    Backport: all
>>>>>>>>> +
>>>>>>>>> +It marks a commit for being a candidate for backports to all relevant
>>>>>>>>> +trees.
>>>>>>>>
>>>>>>>> I'm unconvinced of the utility of this form - what "all" resolves to
>>>>>>>> changes over time. There's almost always a first version where a
>>>>>>>> particular issue was introduced. If we want this to be generally
>>>>>>>> useful, imo we shouldn't limit the scope of the tag to the upstream
>>>>>>>> maintained stable trees.
>>>>>>>
>>>>>>> The reason why I suggested also to have a "wildcard" version of this
>>>>>>> tag, is that the person adding the tag (could be the contributor trying
>>>>>>> to be helpful) might not know exactly to which stable trees the patch
>>>>>>> should be backported to.
>>>>>>>
>>>>>>> Writing this sentence, I realize that I really meant "any" rather than
>>>>>>> "all". Would you prefer if I used "any"? Or we could even suggest to leave
>>>>>>> it black like this:
>>>>>>>
>>>>>>>  Backport:
>>>>>>>
>>>>>>> But it looks a bit weird.
>>>>>>
>>>>>> Indeed. Instead of "all" or "any", how about "yes", "unspecified", or
>>>>>> "unknown"? Nevertheless, I still think people asking for a backport
>>>>>> should be nudged towards determining the applicable range; them not
>>>>>> doing so effectively pushes the burden to the general maintainers or
>>>>>> the stable tree ones, both of which scales less well. Omitting the
>>>>>> tag if they don't want to invest the time would to me then seem to
>>>>>> be the cleanest alternative. Albeit I'm sure views here will vary.
>>>>> FWIW asking people adding the tag to do the work of figuring out which versions to backport to makes sense to me.
>>>>
>>>> If you ask the contributor to do the work then you need to give guidance on the "older" version you can specify in Backport.
>>>>
>>>> For instance, let say the bug was introduced in Xen 4.2. Are we allowing the user to specify Backport: 4.2+ or should it be 4.11+?
>>>>
>>>> I would favor the former as this helps for downstream user which haven't yet moved to the supported stable tree.
>>>
>>> I agree that specifying the oldest revision possible would be helpful.
>>>
>>> However, I don’t think finding the absolute oldest revision should be *required* — imagine a bug that was introduced between 3.2 and 3.3.  It’s also perfectly fine if you go all the way back to 4.2 and stop because you get bored, not because you found out that 4.1 didn’t need it.
> 
> I dropped the definition of "Backport: all", and adopted George's
> suggested wording:
> 
>   The backport requester is expected to specify which currently supported
>   releases need the backport; but encouraged to specify a release as far
>   back as possible which applies.
> 
> 
>> In which case I'd like there to be a (canonical?) way of expressing
>> this, like in XSAs we say "at least back to" in such a case.
> 
> I couldn't think of anything better than:
> 
>   Backport: 4.9+ # maybe older
> 
> We probably don't need to codify something like that in this document.

The suggestion looks fine to me, and people using slightly varying
wording wouldn't be a problem either.

> As an alternative we could perhaps reuse the "Backport: all" idea in a
> different light for this new purpose.
> 
> I expect that in these cases where we don't know the oldest affected
> tree, all the currently maintained stable trees will have to get the
> backport. So maybe we could use one of the following:
> 
>   Backport: all
>   Backport: oldest
>   Backport: oldest-unknown
> 
> To express that the fix needs to be backported to *all* the currently
> maintained stable trees, but there might be also other older
> unmaintained trees that could be affected; we don't know for sure how
> far back it should go.

My prior objection to "all" remains - it changes over time what
"currently means", rendering the tag stale quite quickly. I think
that without even providing a suggested means to create such a tag
without an explicit version specified we underline the need to
figure out a baseline from where to apply the backport.

One more thing comes to mind that may want mentioning here: If
people request a backport, I think this should take as an
implication their willingness to actually be involved in doing
the actual backporting work. Typically it's pretty simple, but
every now and then quite a bit of effort is needed. It would be
nice if the stable tree maintainers could push over some of this
burden without the requester being caught by surprise.

Jan


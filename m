Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926CD1A932D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 08:23:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jObS7-00049C-KJ; Wed, 15 Apr 2020 06:23:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jObS5-000497-O9
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 06:23:13 +0000
X-Inumbo-ID: 935d6d1e-7ee1-11ea-8a07-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 935d6d1e-7ee1-11ea-8a07-12813bfff9fa;
 Wed, 15 Apr 2020 06:23:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC739AC6D;
 Wed, 15 Apr 2020 06:23:07 +0000 (UTC)
Subject: Re: [PATCH v2] Introduce a description of a new optional tag for
 Backports
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200410164942.9747-1-sstabellini@kernel.org>
 <50c8b3be-eadf-dd39-3ce0-05658faa3a4a@suse.com>
 <alpine.DEB.2.21.2004140953450.4953@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <707a1448-be1d-0aa8-6b11-a33eb247304f@suse.com>
Date: Wed, 15 Apr 2020 08:23:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004140953450.4953@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: lars.kurth@citrix.com, julien@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.04.2020 18:54, Stefano Stabellini wrote:
> On Tue, 14 Apr 2020, Jan Beulich wrote:
>> On 10.04.2020 18:49, Stefano Stabellini wrote:
>>> Create a new document under docs/process to describe our special tags.
>>> For now, only add the new backport tag.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
>>> Acked-by: Wei Liu <wl@xen.org>
>>> CC: jbeulich@suse.com
>>> CC: george.dunlap@citrix.com
>>> CC: julien@xen.org
>>> CC: lars.kurth@citrix.com
>>> CC: andrew.cooper3@citrix.com
>>> CC: konrad.wilk@oracle.com
>>>
>>> ---
>>>
>>> This is the original thread: https://marc.info/?l=xen-devel&m=157324027614941
>>>
>>> The backport tag was agreed upon.
>>
>> Well, sort of.
>>
>>> George requested the file to be
>>> renamed to something more generic, where we could add more information
>>> later.
>>>
>>> I kept the original content and acked-by. I renamed the file to
>>> tags.pandoc.
>>> ---
>>>  docs/process/tags.pandoc | 23 +++++++++++++++++++++++
>>>  1 file changed, 23 insertions(+)
>>>  create mode 100644 docs/process/tags.pandoc
>>>
>>> diff --git a/docs/process/tags.pandoc b/docs/process/tags.pandoc
>>> new file mode 100644
>>> index 0000000000..e570efdcc8
>>> --- /dev/null
>>> +++ b/docs/process/tags.pandoc
>>> @@ -0,0 +1,23 @@
>>> +Backport Tag
>>> +------------
>>> +
>>> +A backport tag is an optional tag in the commit message to request a
>>> +given commit to be backported to the stable trees:
>>
>> Insert "fully maintained"?
> 
> Yep I'll add.
> 
> 
>>> +    Backport: all
>>> +
>>> +It marks a commit for being a candidate for backports to all relevant
>>> +trees.
>>
>> I'm unconvinced of the utility of this form - what "all" resolves to
>> changes over time. There's almost always a first version where a
>> particular issue was introduced. If we want this to be generally
>> useful, imo we shouldn't limit the scope of the tag to the upstream
>> maintained stable trees.
> 
> The reason why I suggested also to have a "wildcard" version of this
> tag, is that the person adding the tag (could be the contributor trying
> to be helpful) might not know exactly to which stable trees the patch
> should be backported to.
> 
> Writing this sentence, I realize that I really meant "any" rather than
> "all". Would you prefer if I used "any"? Or we could even suggest to leave
> it black like this:
> 
>   Backport:
> 
> But it looks a bit weird.

Indeed. Instead of "all" or "any", how about "yes", "unspecified", or
"unknown"? Nevertheless, I still think people asking for a backport
should be nudged towards determining the applicable range; them not
doing so effectively pushes the burden to the general maintainers or
the stable tree ones, both of which scales less well. Omitting the
tag if they don't want to invest the time would to me then seem to
be the cleanest alternative. Albeit I'm sure views here will vary.

>>> +    Backport: 4.9+
>>> +
>>> +It marks a commit for being a candidate for backports to all stable
>>> +trees from 4.9 onward.
>>> +
>>> +Maintainers request the Backport tag to be added on commit.
>>> +Contributors are also welcome to mark their patches with the Backport
>>> +tag when they deem appropriate. Maintainers will request for it to be
>>> +removed when that is not the case.
>>> +
>>> +Please note that the Backport tag is a **request** for backport, which
>>> +will still need to be evaluated by the stable tree maintainers.
>>
>> Now that we see more widespread use of the Fixes: tag, with there
>> being effectively some overlap between the information conveyed I
>> think there should be some mention of this. Not the least there's the
>> risk of the Backport: one to become stale when a flaky commit gets
>> backported - the Fixes: tag doesn't have this issue.
> 
> Yes, that's true, but "Fixes" cannot always be used. I can add a
> statement like: "When possible use the Fixes tag."

Yes please.

> Also, I can pull in the description of Fixes and add it to this file
> too.

This would be much appreciated.

> Fixes tag
> ---------
> 
> If your patch fixes a bug in a specific commit, e.g. you found an issue using
> ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
> the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
> lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
> parsing scripts.

I think this non-splitting rule, being applicable to all tags, might better
live prominently at the top of the file.

Jan

>  For example::
> 
> 	Fixes: 41548c5472a "mem_sharing: VM forking"
> 
> The following ``git config`` settings can be used to add a pretty format for
> outputting the above style in the ``git log`` or ``git show`` commands::
> 
> 	[core]
> 		abbrev = 12
> 	[pretty]
> 		fixes = Fixes: %h (\"%s\")
> 



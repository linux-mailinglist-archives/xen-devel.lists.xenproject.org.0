Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D8528868
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 17:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330015.553324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqcWn-0000EH-LF; Mon, 16 May 2022 15:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330015.553324; Mon, 16 May 2022 15:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqcWn-0000C3-GV; Mon, 16 May 2022 15:20:57 +0000
Received: by outflank-mailman (input) for mailman id 330015;
 Mon, 16 May 2022 15:20:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqcWm-0000AU-Ag
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 15:20:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqcWk-0004fC-Ah; Mon, 16 May 2022 15:20:54 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqcWk-0002Cf-4H; Mon, 16 May 2022 15:20:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=XopcBKqLeTmo9dkuZElcVOR1lHoBUGqlYZjHzqwCY0Q=; b=bd0VygL/WoLZ/X2UnVgP8tsinO
	uHUWxVx4EXntxEJnXc51BraaK8P2FnngykO4mlARGoPiTV2UTq6anLsOIGE/11Nfn/VbzQd68S+nV
	8XogBiuRUu5D+3Kf7fgdKpz/+R1rlc4mmvlRXDKJXQczTFyPJsPlsdqDZN5Q6LaDudjw=;
Message-ID: <7903619c-4a6e-802d-289c-03aefbede967@xen.org>
Date: Mon, 16 May 2022 16:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: Process for cherry-picking patches from other projects
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
 <c1d34c23-8f99-71c7-4b60-01c7a8773a92@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c1d34c23-8f99-71c7-4b60-01c7a8773a92@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/05/2022 16:04, Andrew Cooper wrote:
> On 13/05/2022 15:33, George Dunlap wrote:
>> Starting a new thread to make it clear that we’re discussing a wider policy here.
>>
>> This question is aimed at Jan and Andy in particular, as I think they’ve probably done the most of this; so I’m looking to them to find out what our “standard practice” is.
>>
>> There have recently been some patches that Bertrand has submitted which pull in code from Linux ("[PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3”), which has caused a discussion between him, Julien, and Stefano about the proper way to do such patches.
>>
>> The “Origin:” tag section of xen.git/docs/process/sending-patches.pandoc suggests that there are some standards, but doesn’t spell them out.
>>
>> The questions seem to be:
>>
>> 1) When doing this kind of update, is it permissible to send a single patch which “batches” several upstream commits together,
> 
> Yes, absolutely.
> 
> We do this all over the place.
> 
>>   or should each patch be backported individually?
>>
>> 2) If “batches” are permissible, when?  When would individual patches be preferred?
> 
> That's a matter of taste.  If it's several patches of a complicated
> bugfix, then it probably wants splitting up in the same way.
> 
> If it's a bunch of misc changes, then batching is fine.
> 
> 
>> 3) For “batch updates”, what tags are necessary?  Do we need to note the changesets of all the commits, and if so, do we need multiple “Origin” tags?  Do we need to include anything from the original commits — commit messages?  Signed-off-by’s?
> 
> "Update $FOO to something resembling $PROJECT, $VERSION" is perfectly good.
> 
>>
>> And a related question:
>>
>> 4) When importing an entire file from an upstream like Linux, what tags do we need?
> 
> Any clear reference to where it came from.
> 
> Nothing is ever imported verbatim.  If nothing else, paths have to be
> changed, and usually more than that.
> 
> Given that, I do question whether it is appropriate to retain original
> authorship.  The original author did not write a patch for Xen, and what
> gets committed wasn't the patch they wrote.
> 
> Any issues with the port into Xen should be sent to the person who did
> the port into Xen, not the original author who most likely has no idea
> that their patch has been borrowed by Xen.

I agree with that. But I don't view the "Author" line as a way to 
achieve it.

Even for Xen, it is possible that the patch was written by A but then 
fully upstreamed by B (they may be different company). In which case, 
the practice so far has been to use A as the author and add a 2nd 
Signed-off-by for B.

I view porting a patch from Linux the same. If the changes are minor, 
the original author should be credited.

> 
> IMO, a commit message saying "port $X from project $Y" makes it crystal
> clear that the original code change isn't mine, but the porting effort
> is.  Amongst other things, porting invalidates any review/ack/test chain
> because those tags were given in the context of the original project,
> not Xen.

This seems to contradict our documentation:

"All tags **above** the `Origin:` tag are from the original patch (which
should all be kept), while tags **after** `Origin:` are related to the
normal Xen patch process as described here."

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840B57875D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 18:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369943.601573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDTbX-00050e-GH; Mon, 18 Jul 2022 16:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369943.601573; Mon, 18 Jul 2022 16:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDTbX-0004xf-D1; Mon, 18 Jul 2022 16:28:19 +0000
Received: by outflank-mailman (input) for mailman id 369943;
 Mon, 18 Jul 2022 16:28:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oDTbW-0004xZ-7a
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 16:28:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDTbN-00030O-2z; Mon, 18 Jul 2022 16:28:09 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.237.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDTbM-0002lP-Sb; Mon, 18 Jul 2022 16:28:09 +0000
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
	bh=pXwS+1WxJf/duyq+2snTUylosff/XDWWYfBkSEfD7UU=; b=l7hRdpGuQ7PwlG2Aqn+eZFPb6D
	rH+U5Ng8lrl+npy+2+QQ4pixCk0DWEKo0jdQBZSKtG54aGZpvSF6JmbeBBilUPSy+qN3DVE7Xch4g
	Ze//vtshB9iLS0l9/onhfrYPxjLiThZ6+yegTvSFxzZ0DU3qZ9YeWRFKGOyKhmqXc1Os=;
Message-ID: <456d3702-c4b8-9a59-a8f3-307517be86a8@xen.org>
Date: Mon, 18 Jul 2022 17:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] tools/xenstore: add some new features to the
 documentation
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>
References: <20220527072427.20327-1-jgross@suse.com>
 <6e12a7ee-8526-2214-8beb-f0f3d8ad3e83@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6e12a7ee-8526-2214-8beb-f0f3d8ad3e83@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/07/2022 17:12, Jan Beulich wrote:
> On 27.05.2022 09:24, Juergen Gross wrote:
>> In the past there have been spotted some shortcomings in the Xenstore
>> interface, which should be repaired. Those are in detail:
>>
>> - Using driver domains for large number of domains needs per domain
>>    Xenstore quota [1]. The feedback sent was rather slim (one reply),
>>    but it was preferring a new set of wire commands.
>>
>> - XSA-349 [2] has shown that the current definition of watches is not
>>    optimal, as it will trigger lots of events when a single one would
>>    suffice: for detecting new backend devices the backends in the Linux
>>    kernel are registering a watch for e.g. "/local/domain/0/backend"
>>    which will fire for ANY sub-node written below this node (on a test
>>    machine this added up to 91 watch events for only 3 devices).
>>    This can be limited dramatically by extending the XS_WATCH command
>>    to take another optional parameter specifying the depth of
>>    subdirectories to be considered for sending watch events ("0" would
>>    trigger a watch event only if the watched node itself being written).
>>
>> - New features like above being added might make migration of guests
>>    between hosts with different Xenstore variants harder, so it should
>>    be possible to set the available feature set per domain. For socket
>>    connections it should be possible to read the available features.
>>
>> - The special watches @introduceDomain and @releaseDomain are rather
>>    cumbersome to use, as they only tell you that SOME domain has been
>>    introduced/released. Any consumer of those watches needs to scan
>>    all domains on the host in order to find out the domid, causing
>>    significant pressure on the dominfo hypercall (imagine a system
>>    with 1000 domains running and one domain dying - there will be more
>>    than 1000 watch events triggered and 1000 xl daemons will try to
>>    find out whether "their" domain has died). Those watches should be
>>    enhanced to optionally be specific to a single domain and to let the
>>    event carry the related domid.
>>
>> As some of those extensions will need to be considered in the Xenstore
>> migration stream, they should be defined in one go (in fact the 4th one
>> wouldn't need that, but it can easily be connected to the 2nd one).
>> As such extensions need to be flagged in the "features" in the ring
>> page anyway, it is fine to implement them independently.
>>
>> Add the documentation of the new commands/features.
>>
>> [1]: https://lists.xen.org/archives/html/xen-devel/2020-06/msg00291.html
>> [2]: http://xenbits.xen.org/xsa/advisory-349.html
>>
>> Changes in V2:
>> - added new patch 1
>> - remove feature bits for dom0-only features
>> - get-features without domid returns Xenstore supported features
>> - get/set-quota without domid for global quota access
>>
>> Juergen Gross (4):
>>    tools/xenstore: modify feature bit specification in xenstore-ring.txt
>>    tools/xenstore: add documentation for new set/get-feature commands
>>    tools/xenstore: add documentation for new set/get-quota commands
>>    tools/xenstore: add documentation for extended watch command
> 
> Hmm, looks like I did commit v1 of this series, not noticing the v2 _and_
> seeing there had been R-b with no other follow-up (leaving aside the v2)
> in a long time. Please advise if I should revert the commits. I'm sorry
> for the confusion. (I also wonder why the R-b weren't carried over to v2.)

patch #1 is a new patch. The patch #2, #3, #4 have been reworded and the 
overall interaction is different. So I don't think the reviewed-by 
should have been carried.

I had some concerns in v1 which were addressed in v2. I have reviewed v2 
a while ago. From my perspective, patch #1, #3, #4 are ready to go. 
Patch #2 needs a respin and we also need to clarify the integration with 
migration/live-update.

As you committed, I would be OK if this is addressed in a follow-up 
series. But this *must* be addressed by the time 4.17 is released 
because otherwise we will commit ourself to a broken interface. @Henry, 
please add this in the blocker list.

Cheers,

-- 
Julien Grall


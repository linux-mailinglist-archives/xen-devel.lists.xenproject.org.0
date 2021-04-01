Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEDE35162C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 17:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104614.200309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzCk-0002wE-Cq; Thu, 01 Apr 2021 15:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104614.200309; Thu, 01 Apr 2021 15:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzCk-0002vp-9e; Thu, 01 Apr 2021 15:25:54 +0000
Received: by outflank-mailman (input) for mailman id 104614;
 Thu, 01 Apr 2021 15:25:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRzCi-0002vk-RM
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 15:25:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76727bc8-721c-4e13-8dbc-ad572b8c1aea;
 Thu, 01 Apr 2021 15:25:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7607B134;
 Thu,  1 Apr 2021 15:25:50 +0000 (UTC)
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
X-Inumbo-ID: 76727bc8-721c-4e13-8dbc-ad572b8c1aea
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617290751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cp8sJcc8VSQACwUA1v0L+jPn8fTDIgBPDFPOf0zdSG4=;
	b=EjMIx5tcO/hGjiPHTWLu79UfAk7NBf62yDZaC/TXWshu7k6hnnhrCmMT9G3dP4L97ZH8mO
	xG91bJQx/6LACsBHla2mqSsXU5pETSmC5i7PALkKQNFIsLUp2EiHIzudKEV3Y6euBTZruS
	pgxmZ0B7NZkd6Sm9aroRxW1NBm8MpxA=
Subject: Re: [PATCH 00/23] further population of xen/lib/
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <27916fa0-9ebd-a49a-bbb9-1ef47c2b5bf6@xen.org>
 <4f745d03-baa8-e9e6-692c-f9c9f401b766@suse.com>
 <6a38f0db-938b-fd13-48e6-6b538c85fe42@xen.org>
 <d9a21b2c-8eca-027d-5672-e5d9dfaaf4b7@suse.com>
 <3bdbd0ba-ce7d-3814-3280-c4f628b74d93@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d763d3a-6fcd-dd5c-803d-a52876a54f6c@suse.com>
Date: Thu, 1 Apr 2021 17:25:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3bdbd0ba-ce7d-3814-3280-c4f628b74d93@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 16:55, Julien Grall wrote:
> 
> 
> On 01/04/2021 15:27, Jan Beulich wrote:
>> On 01.04.2021 16:04, Julien Grall wrote: >> So overall, the number of functions requiring overriding will likely be
>>> pretty limited and #ifdef would be IMHO tolerable.
>>>
>>> Although, I would be OK with creating a file per function that are
>>> already overrided. For all the others, I think this is just pointless.
>>
>> Well, I don't see a reason to special case individual functions.
>> Plus any reasonable static library should imo have one (global)
>> function per object file in the normal case; there may be very
>> few exceptions. Drawing an ad hoc boundary at what currently has
>> an override somewhere doesn't look very attractive to me. Plus
>> to be honest while I would find it unfair to ask to further
>> split things if I did just a partial conversion (i.e. invest yet
>> more time), I find it rather odd to be asked to undo some of the
>> splitting when I've already taken the extra time to make things
>> consistent.
> 
> I am sure each of us spent time working on a solution that some 
> reviewers were not necessary convinced of the usefulness and they had to 
> undo the series...
> 
> In this case, you sent a large series with close to 0 commit message + a 
> small cover letter. So I think it is fair for a reviewer to be 
> unconvinced and ask for more input.
> 
> You provided that now, I think we want a short summary (or a link to the 
> conversation) in each commit message.
> 
> This will be helpful to understand why the move was made without having 
> to spend ages finding the original discussion.

I'll add "Allow the function to be individually linkable, discardable,
and overridable." to all the str*() and mem*() patch descriptions. Is
that going to be good enough?

Jan


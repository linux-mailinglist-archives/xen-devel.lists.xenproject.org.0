Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ED93515C2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104584.200205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyjD-0007t7-OJ; Thu, 01 Apr 2021 14:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104584.200205; Thu, 01 Apr 2021 14:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyjD-0007sh-Kr; Thu, 01 Apr 2021 14:55:23 +0000
Received: by outflank-mailman (input) for mailman id 104584;
 Thu, 01 Apr 2021 14:55:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lRyjC-0007sT-78
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:55:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRyjB-00089W-GM; Thu, 01 Apr 2021 14:55:21 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRyjB-0003b8-9v; Thu, 01 Apr 2021 14:55:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=VvvUZolMET6kbgJUdtBpnHkZ4F0PIjOStve1wWcTpYc=; b=fybt1DEhszLUodsDMEWLhxqKTN
	4dvMHw/PPvumAhLC5i8YqNc1pF8aw1EYVuMx7rkDw021N5qv/0yZvfotQ7xOy2fHedxHWA5vzZrE8
	v28N/Z8ti/dvzeVZLhsNV865xvx4tVWbK5kZYk20F8f/zriDiEpjos5HuPIXe9NmTTi4=;
Subject: Re: [PATCH 00/23] further population of xen/lib/
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <27916fa0-9ebd-a49a-bbb9-1ef47c2b5bf6@xen.org>
 <4f745d03-baa8-e9e6-692c-f9c9f401b766@suse.com>
 <6a38f0db-938b-fd13-48e6-6b538c85fe42@xen.org>
 <d9a21b2c-8eca-027d-5672-e5d9dfaaf4b7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3bdbd0ba-ce7d-3814-3280-c4f628b74d93@xen.org>
Date: Thu, 1 Apr 2021 15:55:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d9a21b2c-8eca-027d-5672-e5d9dfaaf4b7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 01/04/2021 15:27, Jan Beulich wrote:
> On 01.04.2021 16:04, Julien Grall wrote: >> So overall, the number of functions requiring overriding will likely be
>> pretty limited and #ifdef would be IMHO tolerable.
>>
>> Although, I would be OK with creating a file per function that are
>> already overrided. For all the others, I think this is just pointless.
> 
> Well, I don't see a reason to special case individual functions.
> Plus any reasonable static library should imo have one (global)
> function per object file in the normal case; there may be very
> few exceptions. Drawing an ad hoc boundary at what currently has
> an override somewhere doesn't look very attractive to me. Plus
> to be honest while I would find it unfair to ask to further
> split things if I did just a partial conversion (i.e. invest yet
> more time), I find it rather odd to be asked to undo some of the
> splitting when I've already taken the extra time to make things
> consistent.

I am sure each of us spent time working on a solution that some 
reviewers were not necessary convinced of the usefulness and they had to 
undo the series...

In this case, you sent a large series with close to 0 commit message + a 
small cover letter. So I think it is fair for a reviewer to be 
unconvinced and ask for more input.

You provided that now, I think we want a short summary (or a link to the 
conversation) in each commit message.

This will be helpful to understand why the move was made without having 
to spend ages finding the original discussion.

Cheers,

-- 
Julien Grall


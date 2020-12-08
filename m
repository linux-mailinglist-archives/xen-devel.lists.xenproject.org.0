Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8362D27A2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 10:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47258.83675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmZJu-00079l-5S; Tue, 08 Dec 2020 09:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47258.83675; Tue, 08 Dec 2020 09:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmZJu-00077Y-2O; Tue, 08 Dec 2020 09:30:06 +0000
Received: by outflank-mailman (input) for mailman id 47258;
 Tue, 08 Dec 2020 09:30:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmZJs-0006uA-Iq
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 09:30:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33ba3cda-1dda-4203-8050-66a7192fd880;
 Tue, 08 Dec 2020 09:30:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EA5DAD2D;
 Tue,  8 Dec 2020 09:30:02 +0000 (UTC)
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
X-Inumbo-ID: 33ba3cda-1dda-4203-8050-66a7192fd880
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607419802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3wt44vm/MGCLjbQk93Md2GUjGQNb7Fev4LCfvILFYuw=;
	b=p95Sg2pCswPM+TJerj0uOsuP/7qEL6YxGGyfvj7kNLSO0tUVjrlUhpSG1gOmV3s9/bcKYD
	bC4GIe8OPWE9/My6U1ShPPk/KF9x4AmzzW8NWzM1kwUKPySOB2GMLeXNpdP2/ShXiyA8Tg
	AirwJz/swAaZ+g05DQCzosj0sTnRQyg=
Subject: Re: [PATCH V3 09/23] xen/dm: Make x86's DM feature common
To: Oleksandr <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-10-git-send-email-olekstysh@gmail.com>
 <00c3df9f-760d-bb3d-d1d6-7c7df7f0c17c@suse.com>
 <24191fca-78e7-3e6b-ff02-c06e8ae79f56@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c985117-2bb4-dd5b-53cf-e217e25b2e8e@suse.com>
Date: Tue, 8 Dec 2020 10:30:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <24191fca-78e7-3e6b-ff02-c06e8ae79f56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.12.2020 21:23, Oleksandr wrote:
> On 07.12.20 14:08, Jan Beulich wrote:
>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>> From: Julien Grall <julien.grall@arm.com>
>>>
>>> As a lot of x86 code can be re-used on Arm later on, this patch
>>> splits devicemodel support into common and arch specific parts.
>>>
>>> The common DM feature is supposed to be built with IOREQ_SERVER
>>> option enabled (as well as the IOREQ feature), which is selected
>>> for x86's config HVM for now.
>>>
>>> Also update XSM code a bit to let DM op be used on Arm.
>>>
>>> This support is going to be used on Arm to be able run device
>>> emulator outside of Xen hypervisor.
>>>
>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> ---
>>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>>> "Add support for Guest IO forwarding to a device emulator"
>>>
>>> Changes RFC -> V1:
>>>     - update XSM, related changes were pulled from:
>>>       [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features
>>>
>>> Changes V1 -> V2:
>>>     - update the author of a patch
>>>     - update patch description
>>>     - introduce xen/dm.h and move definitions here
>>>
>>> Changes V2 -> V3:
>>>     - no changes
>> And my concern regarding the common vs arch nesting also hasn't
>> changed.
> 
> 
> I am sorry, I might misread your comment, but I failed to see any 
> obvious to me request(s) for changes.
> I have just re-read previous discussion...
> So the question about considering doing it the other way around (top 
> level dm-op handling arch-specific
> and call into e.g. ioreq_server_dm_op() for otherwise unhandled ops) is 
> exactly a concern which I should have addressed?

Well, on v2 you replied you didn't consider the alternative. I would
have expected that you would at least go through this consideration
process, and see whether there are better reasons to stick with the
apparently backwards arrangement than to change to the more
conventional one. If there are such reasons, I would expect them to
be called out in reply and perhaps also in the commit message; the
latter because down the road more people may wonder why the more
narrow / special set of cases gets handled at a higher layer than
the wider set of remaining ones, and they would then be able to find
an explanation without having to resort to searching through list
archives.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98917827331
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 16:32:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663599.1033610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMrba-0001Cm-Lz; Mon, 08 Jan 2024 15:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663599.1033610; Mon, 08 Jan 2024 15:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMrba-0001A8-J2; Mon, 08 Jan 2024 15:31:58 +0000
Received: by outflank-mailman (input) for mailman id 663599;
 Mon, 08 Jan 2024 15:31:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rMrbZ-0001A2-Gj
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 15:31:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMrbZ-0007eg-1F; Mon, 08 Jan 2024 15:31:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMrbY-0001Fk-OO; Mon, 08 Jan 2024 15:31:56 +0000
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
	bh=QYyFyKxKpzRo+0y9ndsv5lw97+kbmzR7Mby9xclXWvc=; b=OHE+MnCujyE0ZW//h+eIh2mvdE
	mYLmKTiUWGxh0qqBzoyMBJpaIxzKXG8EhoZP2DYH31up4Rrso9TtyABnv7bToJhwToHILUZEEhJ5J
	8+7xmaHiGanTP3Bm7mPQan2NrBSvZ5j2yn6bJwOg66FL2yx8Nnv+iy8cOLbh1F6RZthk=;
Message-ID: <e7029592-57e6-4c2a-ab11-f843047ce7f2@xen.org>
Date: Mon, 8 Jan 2024 15:31:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech>
 <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
 <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com>
 <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org>
 <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com>
 <33061994-0b49-4e4e-8698-d6901b9130dc@xen.org>
 <CAG+AhRXPt_e4+OUxbRLhf6W0reH1nmO7cC9-XoFKe_G8BVxt7w@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRXPt_e4+OUxbRLhf6W0reH1nmO7cC9-XoFKe_G8BVxt7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/01/2024 15:18, Carlo Nonato wrote:
>> No. I am saying that that we should not be able to allow changing the
>> colors after the memory has been allocated. To give an example, your
>> current code would allow:
>>
>>     1) Setup the P2M pools or allocate RAM
>>     2) Set the color
>>
>> This would render the coloring configuration moot.
>>
>> Whether we want to allow changing the coloring before hand is a
>> different question and as I wrote earlier on, I don't mind if you want
>> to forbid that.
> 
> At the moment I'm relying on the toolstack in the sense that I know that it
> will set colors right after domain creation and before memory allocation.
> Calling alloc_domheap_pages() without a coloring configuration makes Xen
> crash, so it's mandatory to have the configuration done before any allocation.
> I know that we shouldn't rely on the toolstack this much, but I didn't
> find a better way. Given this assumption, looking for an already existing
> color configuration of a domain is sufficient to avoid what you are saying.
> 
> Is it possible to enforce such a constraint with domctl? > I mean to be sure that this domctl will be called at a precise time.

Yes. You can...

> 
> Thanks.
> 
>>> I don't know what to check that.
>>
>> You can check the size of the P2M pool (d->arch.paging.p2m_total_pages)
>> is still 0. I think for RAM, you can check d->tot_pages == 0.

... reject the call if either of the two fields are not zero.

Cheers,

-- 
Julien Grall


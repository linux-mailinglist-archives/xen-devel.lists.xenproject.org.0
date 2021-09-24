Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8DD41771A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 16:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195439.348139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmZ2-0005Mr-PV; Fri, 24 Sep 2021 14:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195439.348139; Fri, 24 Sep 2021 14:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmZ2-0005Jg-MN; Fri, 24 Sep 2021 14:52:36 +0000
Received: by outflank-mailman (input) for mailman id 195439;
 Fri, 24 Sep 2021 14:52:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTmZ1-0005Ja-VX
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 14:52:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTmYy-0003OG-Aa; Fri, 24 Sep 2021 14:52:32 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTmYx-0008Jt-Vo; Fri, 24 Sep 2021 14:52:32 +0000
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
	bh=tw9TyCjQi/+QYd+Zot2/jpZ1pPlgz5c29aIla0z6OrI=; b=yJSTN/PvQhe2oDfDnqbtH/iiSb
	qeNd5UqwVUsvkvN5OayGxBtCJTjKLXWXVbn8s/cqdtVul8+lccIw7yFjicvYx7xY9uJ7jOVdhNlJ+
	RitO0AUiH3zB5NzITU4pfXft6ss2ZVzXH/1IFU6qugj5lLIzsGetFWesltiv7IGWj7dI=;
Subject: Re: [future abi] [RFC PATCH V3] xen/gnttab: Store frame GFN in struct
 page_info on Arm
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
 <de92ab24-a9f0-8f3b-e721-e0465e4dc065@citrix.com>
 <YU2PT4rUts8KljKe@MacBook-Air-de-Roger.local>
From: Julien Grall <julien@xen.org>
Message-ID: <04400e18-dde2-4b90-4056-f56c5d7937af@xen.org>
Date: Fri, 24 Sep 2021 19:52:24 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YU2PT4rUts8KljKe@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 24/09/2021 13:41, Roger Pau Monné wrote:
> On Thu, Sep 23, 2021 at 09:59:26PM +0100, Andrew Cooper wrote:
>> On 23/09/2021 20:32, Oleksandr Tyshchenko wrote:
>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> You can find the related discussions at:
>>> https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org/
>>> https://lore.kernel.org/xen-devel/1628890077-12545-1-git-send-email-olekstysh@gmail.com/
>>> https://lore.kernel.org/xen-devel/1631652245-30746-1-git-send-email-olekstysh@gmail.com/
>>>
>>> ! Please note, there is still unresolved locking question here for which
>>> I failed to find a suitable solution. So, it is still an RFC !
>>
>> Just FYI, I thought I'd share some of the plans for ABI v2.  Obviously
>> these plans are future work and don't solve the current problem.
>>
>> Guests mapping Xen pages is backwards.  There are reasons why it was
>> used for x86 PV guests, but the entire interface should have been design
>> differently for x86 HVM.
>>
>> In particular, Xen should be mapping guest RAM, rather than the guest
>> manipulating the 2nd stage tables to map Xen RAM.  Amongst other things,
>> its far far lower overhead.
>>
>>
>> A much better design is one where the grant table looks like an MMIO
>> device.  The domain builder decides the ABI (v1 vs v2 - none of this
>> dynamic switch at runtime nonsense), and picks a block of guest physical
>> addresses, which are registered with Xen.  This forms the grant table,
>> status table (v2 only), and holes to map into.
> 
> I think this could be problematic for identity mapped Arm dom0, as
> IIRC in that case grants are mapped so that gfn == mfn in order to
> account for the lack of an IOMMU. You could use a bounce buffer, but
> that would introduce a big performance penalty.

Or you could find a hole that is outside of the RAM regions. This is not 
trivial but not impossible (see [1]).

> 
> Other question is whether we want/need to keep such mode going
> forward.

I am assunming by "such mode" you mean "identity mapped". If so, then I 
am afraid this is not going to disappear on Arm at least. There are 
still out there many platforms without IOMMUs or devices which are not 
protected (the GPU is a common one).

Furthermore, Arm just sent a series to introduce identity mapping for 
domUs as well (see [2]).

[1] <1631034578-12598-1-git-send-email-olekstysh@gmail.com>
[2] <20210923031115.1429719-1-penny.zheng@arm.com>

Cheers,

-- 
Julien Grall


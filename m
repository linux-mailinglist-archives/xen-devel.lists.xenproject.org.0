Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0834E58CB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 19:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294045.499805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX673-00061w-B4; Wed, 23 Mar 2022 18:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294045.499805; Wed, 23 Mar 2022 18:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX673-0005zu-7G; Wed, 23 Mar 2022 18:53:41 +0000
Received: by outflank-mailman (input) for mailman id 294045;
 Wed, 23 Mar 2022 18:53:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nX671-0005zo-Dp
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 18:53:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nX670-0003Kw-Q5; Wed, 23 Mar 2022 18:53:38 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.10.149]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nX670-0004Xb-J3; Wed, 23 Mar 2022 18:53:38 +0000
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
	bh=X97TYqEcRlTf986DnfWpgQM4S7+cGZzffAEtndV9224=; b=NnGqjYq1g1iQtGNZ3giLwoZUl6
	wdtRPKcHjJ6bzkFZI5kvbNN8KzViFc+E+x7FPI7kxZItR12LNo8hJcMpvcUnBJmIbqkGsp6Ke2urW
	fKKb5faeaSWlQg/trGTxZSQ9NZqEKVn7akJZ6laUgb9d/9QoC9DuARdt6x3ZtKTgRTq8=;
Message-ID: <33e2643c-1639-2f3b-bcec-84aac77966af@xen.org>
Date: Wed, 23 Mar 2022 18:53:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
 <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
 <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
 <AE272A2A-EA5B-4217-AECE-80AE04207B55@arm.com>
 <acbf28a2-31b9-2a9c-6b42-6d386b47bfbf@xen.org>
 <6FA48D36-AFF3-4D37-BCF5-27FE68570428@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6FA48D36-AFF3-4D37-BCF5-27FE68570428@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 23/03/2022 13:58, Luca Fancellu wrote:
>> On 22 Mar 2022, at 14:01, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 22/03/2022 09:52, Luca Fancellu wrote:
>>>>>>
>>>>>> Can you document why this is necessary on x86 but not on other architectures?
>>>>> Hi Julien,
>>>>> I received the warning by Juergen here: https://patchwork.kernel.org/comment/24740762/ that at least on x86 there could be
>>>>> some problems if cpu0 is not in cpupool0, I tested it on arm and it was working fine and I didn’t find any restriction.
>>>>
>>>> What exactly did you test on Arm?
>>>>
>>> I have tested start/stop of some guest, moving cpus between cpupools, create/destroy cpupools, shutdown of Dom0
>>> [ from your last mail ]
>>>>>>
>>>>>> If dom0 must run on core0 and core0 is Little then you cannot build a system where dom0 is running on big cores.
>>>>>> If the limitation is not there, you can build such a configuration without any dependency to the boot core type.
>>>>> This might not be completely clear so let me rephrase:
>>>>> In the current system:
>>>>> - dom0 must run on cpupool-0
>>>>
>>>> I don't think we need this restriction. In fact, with this series it will become more a problem because the cpupool ID will based on how we parse the Device-Tree.
>>>>
>>>> So for dom0, we need to specify explicitely the cpupool to be used.
>>>>
>>>>> - cpupool-0 must contain the boot core
>>>>> - consequence: dom0 must run on the boot core
>>>>> If boot core is little, you cannot build as system where dom0 runs only on the big cores.
>>>>> Removing the second limitation (which is not required on arm) is making it possible.
>>>>
>>>> IMHO removing the second restriction is a lot more risky than removing the first one.
>>> I see your point, my concern about moving Dom0 on another cpupool, different from cpupool0, is that we give the
>>> opportunity to destroy the cpupool0 (we can’t let that happen), or remove every cpu from cpupool0.
>>
>>  From my understanding a cpupool can only be destroyed when there are no more CPUs in the pool. Given that cpu0 has to be in pool0 then this should prevent the pool to be destroyed.
>>
>> Now, it is quite possible that we don't have a check to prevent CPU0 to be removed from cpupool0. If so, then I would argue we should add the check otherwise it is pointless to prevent cpu0 to be initially added in another pool than pool0 but can be moved afterwards.
>>
> 
> Hi Julien,
> 
> I’ve done a test on fvp, first finding is that cpu0 can be removed from Pool-0, there is no check.
> Afterwards I’ve created another pool and I’ve assigned a cpu to it, I’ve called xl cpupool-destroy and the tool removes every cpu from the pool before destroying.
> 
> Do you think the check that prevents CPU0 to be removed from Pool-0 should be done in the tools or in Xen?

I think we want a check at least in Xen (so we don't trust the tools to 
do the right thing).

We could also add one in the tools to provide better diagnostics to the 
user (this tends to be a request from Andrew).

Cheers,

-- 
Julien Grall


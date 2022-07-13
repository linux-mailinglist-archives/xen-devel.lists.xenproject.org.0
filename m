Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811E57357D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 13:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366500.597308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBaac-0000h8-MH; Wed, 13 Jul 2022 11:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366500.597308; Wed, 13 Jul 2022 11:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBaac-0000fH-Je; Wed, 13 Jul 2022 11:31:34 +0000
Received: by outflank-mailman (input) for mailman id 366500;
 Wed, 13 Jul 2022 11:31:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oBaaa-0000fB-RZ
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 11:31:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBaaZ-00025j-TA; Wed, 13 Jul 2022 11:31:31 +0000
Received: from [54.239.6.184] (helo=[192.168.7.160])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBaaZ-0006I0-Ly; Wed, 13 Jul 2022 11:31:31 +0000
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
	bh=/Jh6qAIUVQDtPAHdvhIU5HtsZW+mEApgxdRAdlZtbCw=; b=Mf/0o55p1QDtMQgDnFRlR07zRo
	HzRl0Kwc19oXC3FvowVMSIbwhVhLwrAjU5U5v1EJumW8pIreC8nxePIOiDVMNs6Xy3oGR4Eb8yPhu
	54zqzDq/0Oyn+QdoiaZwJekW5nWUysmWzbwO931J33UTZYajNOB2KQekeSqeAQOH0WQg=;
Message-ID: <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
Date: Wed, 13 Jul 2022 12:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 13/07/2022 11:56, Jan Beulich wrote:
> On 13.07.2022 12:18, Julien Grall wrote:
>> On 13/07/2022 10:53, Jan Beulich wrote:
>>> On 13.07.2022 11:35, Julien Grall wrote:
>>>> On 13/07/2022 07:21, Jan Beulich wrote:
>>>>>>> For the FIFO issue, we can introduce the new config option to restrict the maximum number of static
>>>>>>> port supported in Xen. We can check the user-defined static port when we parse the device tree and if
>>>>>>> a user-defined static port is greater than the maximum allowed static port will return an error to the user.
>>>>>>> In this way, we can avoid allocating a lot of memory to fill the hole.
>>>>>>>
>>>>>>> Let me know your view on this.
>>>>>>>
>>>>>>> config MAX_STATIC_PORT
>>>>>>>         int "Maximum number of static ports”
>>>>>>>         range 1 4095
>>>>>>>         help
>>>>>>>            Controls the build-time maximum number of static port supported
>>>>>>
>>>>>> The problem is not exclusive to the static event channel. So I don't
>>>>>> think this is right to introduce MAX_STATIC_PORT to mitigate the issue
>>>>>> (even though this is the only user today).
>>>>>>
>>>>>> A few of alternative solutions:
>>>>>>       1) Handle preemption in alloc_evtchn_bucket()
>>>>>>       2) Allocate all the buckets when the domain is created (the max
>>>>>> numbers event channel is known). We may need to think about preemption
>>>>>>       3) Tweak is_port_valid() to check if the bucket is valid. This would
>>>>>> introduce a couple of extra memory access (might be OK as the bucket
>>>>>> would be accessed afterwards) and we would need to update some users.
>>>>>>
>>>>>> At the moment, 3) is appealing me the most. I would be interested to
>>>>>> have an opionions from the other maintainers.
>>>>>
>>>>> Fwiw of the named alternatives I would also prefer 3. Whether things
>>>>> really need generalizing at this point I'm not sure, though.
>>>> I am worry that we may end up to forget that we had non-generaic way
>>>> (e.g. MAX_STATIC_PORT) to prevent trigger the issue. So we could end up
>>>> to mistakenly introduce a security issue.
>>>>
>>>> However, my point was less about generalization but more about
>>>> introducing CONFIG_MAX_STATIC_PORT.
>>>>
>>>> It seems strange to let the admin to decide the maximum number of static
>>>> port supported.
>>>
>>> Why (assuming s/admin/build admin/)? I view both a build time upper bound
>>> as well as (alternatively) a command line driven upper bound as reasonable
>>> (in the latter case there of course still would want/need to be an upper
>>> bound on what is legitimate to specify from the command line). Using
>>> static ports after all means there's a static largest port number.
>>> Determined across all intended uses of a build such an upper bound can be
>>> a feasible mechanism.
>>
>> AFAICT, the limit is only here to mitigate the risk with the patch I
>> proposed. With a proper fix, the limit would be articial and therefore
>> it is not clear why the admin should be able to configure it (even
>> temporarily).
> 
> The limit would be as artificial as other limits we enforce. 

You are right. But we need to be cautious in adding new one that 
overlaps with existing one.

> I can't
> see why it would be wrong to have a more tight limit on static ports
> than on traditional ("dynamic") ones. Even if only to make sure so
> many dynamic ones are left.

This is similar to Xen forbidding to close a static port: it is not the 
hypervisor business to check that there are enough event channel ports 
freed for dynamic allocation.

Cheers,

-- 
Julien Grall


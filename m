Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57945732E8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 11:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366390.597142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBYmr-0003iA-Jw; Wed, 13 Jul 2022 09:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366390.597142; Wed, 13 Jul 2022 09:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBYmr-0003g6-GE; Wed, 13 Jul 2022 09:36:05 +0000
Received: by outflank-mailman (input) for mailman id 366390;
 Wed, 13 Jul 2022 09:36:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oBYmq-0003g0-2v
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 09:36:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBYmo-0008SF-2A; Wed, 13 Jul 2022 09:36:02 +0000
Received: from [54.239.6.184] (helo=[192.168.7.160])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBYmn-000053-Qf; Wed, 13 Jul 2022 09:36:01 +0000
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
	bh=OiHqk2rfMx9azif91K01KAxc7RB7HIiarkj6RZsbFhk=; b=SYSuC0KfZP+YI9AHL4xaD/LcZR
	ff3hf1WRnlLZ9olMWwfyyw8DFSYFVbRyc/Dmuk7bP4f8ki+MSU8XNb9sc+HK7V6X1JgVL4EckG0AO
	txX7hWkuhbjKSN0RFkKUFSRVE9IN3fYFRCm3C2WOkj7QTnChFIevMQrujquk+X0ZBe74=;
Message-ID: <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
Date: Wed, 13 Jul 2022 10:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 13/07/2022 07:21, Jan Beulich wrote:
>>> For the FIFO issue, we can introduce the new config option to restrict the maximum number of static
>>> port supported in Xen. We can check the user-defined static port when we parse the device tree and if
>>> a user-defined static port is greater than the maximum allowed static port will return an error to the user.
>>> In this way, we can avoid allocating a lot of memory to fill the hole.
>>>
>>> Let me know your view on this.
>>>
>>> config MAX_STATIC_PORT
>>>       int "Maximum number of static ports”
>>>       range 1 4095
>>>       help
>>>          Controls the build-time maximum number of static port supported
>>
>> The problem is not exclusive to the static event channel. So I don't
>> think this is right to introduce MAX_STATIC_PORT to mitigate the issue
>> (even though this is the only user today).
>>
>> A few of alternative solutions:
>>     1) Handle preemption in alloc_evtchn_bucket()
>>     2) Allocate all the buckets when the domain is created (the max
>> numbers event channel is known). We may need to think about preemption
>>     3) Tweak is_port_valid() to check if the bucket is valid. This would
>> introduce a couple of extra memory access (might be OK as the bucket
>> would be accessed afterwards) and we would need to update some users.
>>
>> At the moment, 3) is appealing me the most. I would be interested to
>> have an opionions from the other maintainers.
> 
> Fwiw of the named alternatives I would also prefer 3. Whether things
> really need generalizing at this point I'm not sure, though.
I am worry that we may end up to forget that we had non-generaic way 
(e.g. MAX_STATIC_PORT) to prevent trigger the issue. So we could end up 
to mistakenly introduce a security issue.

However, my point was less about generalization but more about 
introducing CONFIG_MAX_STATIC_PORT.

It seems strange to let the admin to decide the maximum number of static 
port supported.

If we want to rely on non-generic mechanism, then I think the right way 
to go is to restrict max_evtchn_port for domUs to 4096 (it is -1 at the 
moment). If we want to give more flexibility then it should be a 
per-domain property in the DT.

Cheers,

-- 
Julien Grall


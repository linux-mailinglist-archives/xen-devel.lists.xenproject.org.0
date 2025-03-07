Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED0A5733A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 22:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905364.1313217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqeoi-0003l0-R1; Fri, 07 Mar 2025 21:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905364.1313217; Fri, 07 Mar 2025 21:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqeoi-0003ix-No; Fri, 07 Mar 2025 21:01:12 +0000
Received: by outflank-mailman (input) for mailman id 905364;
 Fri, 07 Mar 2025 21:01:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tqeoh-0003ir-2A
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 21:01:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqeog-0079TO-2p;
 Fri, 07 Mar 2025 21:01:10 +0000
Received: from [2a02:8012:3a1:0:5057:2808:1e53:9bd7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqeog-00D5HA-1H;
 Fri, 07 Mar 2025 21:01:10 +0000
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
	bh=12RnVyXYpxg9lGLiVRjMZ/H0i+9xd/YySVHaRNJPHiY=; b=Reu1mkS44gA5BHdQv45qHiow0X
	rq6LuFWlyh48/I5d8ML57YV6L2HMLrfrFA5cj7rUBcOsFrLLHbTis2JErgdz4NfO8UowfIsHNEeNg
	NH2ziU2XLNYzm7SrZDlfDqJ1QLD3rWEE7O3BY3gaGS8ZAWAGZKu7nQmPBpy+6yIxBx5Q=;
Message-ID: <39540c8b-e43d-4315-bc34-a61ac6cb1d70@xen.org>
Date: Fri, 7 Mar 2025 21:01:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
Content-Language: en-GB
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-5-jason.andryuk@amd.com>
 <4ee02463-c413-4afc-add6-d7bf3915dd5a@xen.org>
 <734d9fdf-a201-4a46-9739-26a474683b10@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <734d9fdf-a201-4a46-9739-26a474683b10@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

On 07/03/2025 16:03, Jason Andryuk wrote:
> On 2025-03-07 03:31, Julien Grall wrote:
>> Hi,
>>
>> On 06/03/2025 22:03, Jason Andryuk wrote:
>>> Assign domid 0 to the hwdom.  Normally, dom0less does not use domid 0.
>>
>> A few years ago, we went to great length to avoid making the 
>> assumption that the hardware domain is domid 0. See all the calls to 
>> "is_hardware_domain()". So I am reluctant to force the domain ID to 0.
> 
> I was disappointed when it didn't "just work".
> 
>>>
>>> This fixes using the Xen console which assumes domid 0 to use the
>>> hypercall interface.
>>
>> I had a brief look at drivers/char/console.c and I can't find any 
>> place assuming "domid 0". Do you have any pointer?
> 
> As Jan pointed out, Denis Mukhin's patch removed the domid 0 assumption. 
>   This was developed without this patch when it mattered.
> 
> I tested before posting without this patch (and with Denis's), and again 
> now, and I didn't get a hwdom login.  Turns out xenstored was assuming 
> domid 0.  Changing that with --master-domid gets to the login prompt.

Hmmm, I am not sure --master-domid should point to the hardware domain. 
Instead, it feels like it should be the control domain because it needs 
to manage the VMs so needs to create any nodes in Xenstore.

> 
> Still, there are now other userspace errors.  xen-init-dom0 hardcodes 
> domid 0 which doesn't exist. 

I am confused. Why would you call xen-init-dom0 in a domain that is 
meant to be the hardware domain rather than dom0?

> init-dom0less only initializes non- 
> introduced domains, so hwdom doesn't get its "domid" xenstore node 
> populated.  That leads to other errors.
 > > So I think with Denis's patch, this isn't strictly needed.  It does 
help
> existing toolstack code work today.

I don't think the toolstack is ready for a split between 
control/hardware domain. That said, shouldn't the toolstack run in the 
control domain? Same for xenstored (unless you have a xenstored domain)?

Cheers,

-- 
Julien Grall



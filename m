Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25836A57A03
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 12:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905638.1313364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqsSZ-0005oZ-RI; Sat, 08 Mar 2025 11:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905638.1313364; Sat, 08 Mar 2025 11:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqsSZ-0005lq-N6; Sat, 08 Mar 2025 11:35:15 +0000
Received: by outflank-mailman (input) for mailman id 905638;
 Sat, 08 Mar 2025 11:35:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tqsSY-0005lk-0j
 for xen-devel@lists.xenproject.org; Sat, 08 Mar 2025 11:35:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqsSX-008qVS-2u;
 Sat, 08 Mar 2025 11:35:13 +0000
Received: from [2a02:8012:3a1:0:5057:2808:1e53:9bd7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqsSX-00E4k3-1P;
 Sat, 08 Mar 2025 11:35:13 +0000
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
	bh=kJYgYT9It6FrxdeVh3aCOByd3HUcOnmDFg6fBscdrtU=; b=RMxPPT/qea/8S3BV+Fdk3qLX+O
	L8wjunky3EU/acNkD0eMYlTPNV3MRrNc8crg3Jm+6ewBDH/h0pSrafvHv4peatYypD49y45UdrQSU
	O12KmRoLXhNzlc/KEPtpX5q0spHpbves+Q0fOuNfukcADhkUB9t9SL+Jec7rQpU5zuvM=;
Message-ID: <ff034e29-1aa4-42af-a28c-fd95b83a0ce1@xen.org>
Date: Sat, 8 Mar 2025 11:35:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-5-jason.andryuk@amd.com>
 <4ee02463-c413-4afc-add6-d7bf3915dd5a@xen.org>
 <734d9fdf-a201-4a46-9739-26a474683b10@amd.com>
 <39540c8b-e43d-4315-bc34-a61ac6cb1d70@xen.org>
 <ba5b9675-fa62-4872-b969-e5ecc917a087@amd.com>
 <alpine.DEB.2.22.394.2503071450480.2600338@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2503071450480.2600338@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 08/03/2025 00:40, Stefano Stabellini wrote:
> On Fri, 7 Mar 2025, Jason Andryuk wrote:
>> On 2025-03-07 16:01, Julien Grall wrote:
>>> Hi Jason,
>>>
>>> On 07/03/2025 16:03, Jason Andryuk wrote:
>>>> On 2025-03-07 03:31, Julien Grall wrote:
>>>>> Hi,
>>>>>
>>>>> On 06/03/2025 22:03, Jason Andryuk wrote:
>>>>>> Assign domid 0 to the hwdom.  Normally, dom0less does not use domid 0.
>>>>>
>>>>> A few years ago, we went to great length to avoid making the assumption
>>>>> that the hardware domain is domid 0. See all the calls to
>>>>> "is_hardware_domain()". So I am reluctant to force the domain ID to 0.
>>>>
>>>> I was disappointed when it didn't "just work".
>>>>
>>>>>>
>>>>>> This fixes using the Xen console which assumes domid 0 to use the
>>>>>> hypercall interface.
>>>>>
>>>>> I had a brief look at drivers/char/console.c and I can't find any place
>>>>> assuming "domid 0". Do you have any pointer?
>>>>
>>>> As Jan pointed out, Denis Mukhin's patch removed the domid 0 assumption.
>>>>    This was developed without this patch when it mattered.
>>>>
>>>> I tested before posting without this patch (and with Denis's), and again
>>>> now, and I didn't get a hwdom login.  Turns out xenstored was assuming
>>>> domid 0.  Changing that with --master-domid gets to the login prompt.
>>>
>>> Hmmm, I am not sure --master-domid should point to the hardware domain.
>>> Instead, it feels like it should be the control domain because it needs to
>>> manage the VMs so needs to create any nodes in Xenstore.
>>
>> --master-domid encompasses "the domid where xenstored is running" (which
>> really xenstored should figure out itself), and is needed for xenstored to
>> start.
>>
>> There is an additional --priv-domid, which can point at the control domain.
>>
>>>>
>>>> Still, there are now other userspace errors.  xen-init-dom0 hardcodes
>>>> domid 0 which doesn't exist.
>>>
>>> I am confused. Why would you call xen-init-dom0 in a domain that is meant to
>>> be the hardware domain rather than dom0?
>>
>> I was using domid 0 :)  Also, it's called by default in xencommons and sets up
>> the cpupools.
>>
>>>> init-dom0less only initializes non- introduced domains, so hwdom doesn't
>>>> get its "domid" xenstore node populated.  That leads to other errors.
>>>   > > So I think with Denis's patch, this isn't strictly needed.  It does
>>> help
>>>> existing toolstack code work today.
>>>
>>> I don't think the toolstack is ready for a split between control/ hardware
>>> domain. That said, shouldn't the toolstack run in the control domain? Same
>>> for xenstored (unless you have a xenstored domain)?
>>
>> Yes, maybe running control and xenstore together is better.  I came from the
>> perspective of dom0less with a hardware/control split, the toolstack is less
>> important.
>>
>> But in general, it's all intertwined.  You have to start somewhere untangling.
>>
>> Running xenstored in the hardware domain, and leaving hardware domain at domid
>> 0 seemed like a good way to keep most things working while splitting out the
>> hardware/control permissions.
> 
> In my opinion, there are reasons for placing xenstored in the control
> domain and also reasons for placing it in the hardware domain. I think
> this is the kind of policy decision I would leave to the user.

I agree it should be a policy decision. But as a default setup, I think 
this is muddying the difference between the control domain and hardware 
domain. Today's toolstack can't work without xenstored. So intuitively, 
xenstored would belong to the control domain in a default setup.

> 
> In an embedded environment where safety is a concern, it also depends on
> whether the user wants to keep xenstore only between non-safe VMs, in
> which case I would put it in the hardware domain so that the control
> domain is fully isolated and protected. xenstore could be a source of
> interference.

So your hardware domain is not really an hardware domain, right? This is 
more a dom0 minus toolstack? If so, I think it might be helpful if you 
add a document explaining what a hardware domain really means with this 
series.

> 
> Or whether the user wants to use xenstore also for safe VMs, in which
> case they are likely to reimplement xenstored in a way that is safety
> certified and as part of a safety certified OS such as Zephyr. In this
> type of configuration, it would make sense to have xenstored in the
> control domain.
 > > I would suggest to make the location of xenstored configurable, and 
only
> provide a sensible default when the user doesn't explicitly say. With
> the state of the codebase and protocols that we have today, I think we
> are not ready for a xenstore free-from-interference implementation, so
> it would be safer to leave xenstored in the hardware domain as default,
> but we should make also the other configurations possible.
> 
> This is the first patch series aimed at untangling the whole thing,
> so not everything can be done here. For example, if the location of
> Xenstore is not configurable in this series, it may still be OK. We
> just need to be careful in the docs and interfaces not to bake it into
> an assumption.
> 
> I would also say the same for domid == 0: while it would be ideal to
> avoid relying on domid == 0 for the hardware domain, we don't have to
> resolve everything immediately.

I have to disagree. If we start shipping Xen with "hwdomid == 0", it 
will be quite difficult to remove this behavior because new tooling 
(which may not be under our control) will likely start/continue to rely 
on it. So ...


> This series already achieves a
> significant improvement by separating the hardware domain from the
> control domain, which is valuable in itself.

... while I agree this series is a good step, I don't want to have any 
version of Xen where hwdomid == 0 (even temporarily).

Cheers,

-- 
Julien Grall



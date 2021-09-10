Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DD3406DCA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 16:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184511.333179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOht3-0008SL-4w; Fri, 10 Sep 2021 14:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184511.333179; Fri, 10 Sep 2021 14:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOht3-0008Pd-23; Fri, 10 Sep 2021 14:52:17 +0000
Received: by outflank-mailman (input) for mailman id 184511;
 Fri, 10 Sep 2021 14:52:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOht1-0008PX-RP
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 14:52:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOhsz-0000lM-O8; Fri, 10 Sep 2021 14:52:13 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOhsz-0004xE-I2; Fri, 10 Sep 2021 14:52:13 +0000
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
	bh=mPuB3hdtYyFKmGS5TtNtW6v1boLy/B6UMFdek9kZDBk=; b=ffVIPntJ/u8W8hHaRnPr8ReTld
	LqXE6+dY02MewXqcgJGk0HDRdJt+2SU+s+g/1IueTEywduha+XF6X/6zflh8+7H4NU8PU5PFBOMrL
	p99SIQ2YHW5zV/KdAk+FYD5jFhfrKoyRUzTK2qmjA2FvlMW9lnQUDOcP1+PtUo2NhxQY=;
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
 <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
 <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
 <15a930ff-77d5-b962-b346-c586a2769009@epam.com>
 <733cd423-14f5-c028-8fdd-39aed34cd352@xen.org>
 <3c3c253c-4af7-ea25-5f73-a0f7319dab50@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <34abe11e-c2f9-50ce-fb79-836bfcfb11e0@xen.org>
Date: Fri, 10 Sep 2021 15:52:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3c3c253c-4af7-ea25-5f73-a0f7319dab50@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/09/2021 15:38, Oleksandr Andrushchenko wrote:
> [snip]
> 
> 
>>>> What do you mean by "used by Domain-0 completely"? The hostbridge is owned by Xen so I don't think we can let dom0 access any MMIO regions by
>>>> default.
>>>
>>> Now it's my time to ask why do you think Xen owns the bridge?
>>
>> Because nothing in this series indicates either way. So I assumed this should be owned by Xen because it will drive it.
>>
>>  From what you wrote below, it sounds like this is not the case. I think you want to have a design document sent along the series so we can easily know what's the expected design and validate that the code match the agreement.
>>
>> There was already a design document sent a few months ago. So you may want to refresh it (if needed) and send it again with this series.
>>
> Please see [1] which is the design document we use to implement PCI passthrough on Arm.

Thank. Can you make sure to include at least in a link in your cover 
letter next time?

> 
> For your convenience:
> 
> "
> 
> # Problem statement:
> [snip]
> 
> Only Dom0 and Xen will have access to the real PCI bus,​ guest will have a
> direct access to the assigned device itself​. IOMEM memory will be mapped to
> the guest ​and interrupt will be redirected to the guest. SMMU has to be
> configured correctly to have DMA transaction."
> 
> "
> 
> # Discovering PCI Host Bridge in XEN:
> 
> In order to support the PCI passthrough XEN should be aware of all the PCI host
> bridges available on the system and should be able to access the PCI
> configuration space. ECAM configuration access is supported as of now. XEN
> during boot will read the PCI device tree node “reg” property and will map the
> ECAM space to the XEN memory using the “ioremap_nocache ()” function.
> 
> [snip]
> 
> When Dom0 tries to access the PCI config space of the device, XEN will find the
> corresponding host bridge based on segment number and access the corresponding
> config space assigned to that bridge.
> 
> Limitation:
> * Only PCI ECAM configuration space access is supported.
> * Device tree binding is supported as of now, ACPI is not supported.
> * Need to port the PCI host bridge access code to XEN to access the
> configuration space (generic one works but lots of platforms will required
> some specific code or quirks).
> 
> "
> 
> Unfortunately the document had not been updated since then, but the question
> 
> being discussed has not changed in the design: Domain-0 has full access to the bridge,
> 
> Xen traps ECAM. (I am taking dom0less aside as that was not the target for the first phase)

Having an update design document is quite important. This will allow 
reviewer to comment easily on overall approach and speed up the review 
as we can match to the agreed approach.

So can this please be updated and sent along the work?

In addition to that, it feels to me that the commit message should 
contain a summary of what you just pasted as this helps understanding 
the goal and approach of this patch.

Cheers,

-- 
Julien Grall


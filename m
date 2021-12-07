Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147C46B375
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 08:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240534.417083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muUcW-0004oB-S4; Tue, 07 Dec 2021 07:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240534.417083; Tue, 07 Dec 2021 07:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muUcW-0004lS-O0; Tue, 07 Dec 2021 07:10:36 +0000
Received: by outflank-mailman (input) for mailman id 240534;
 Tue, 07 Dec 2021 07:10:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1gtX=QY=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1muUcV-0004l3-7h
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 07:10:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c3cecb23-572c-11ec-a5e1-b9374ead2679;
 Tue, 07 Dec 2021 08:10:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D60511FB;
 Mon,  6 Dec 2021 23:10:31 -0800 (PST)
Received: from [10.57.4.134] (unknown [10.57.4.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 331553F5A1;
 Mon,  6 Dec 2021 23:10:30 -0800 (PST)
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
X-Inumbo-ID: c3cecb23-572c-11ec-a5e1-b9374ead2679
Subject: Re: [PATCH] xen/arm: Do not include in the image functions...
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211206141923.26757-1-michal.orzel@arm.com>
 <61a730e2-fe20-ae74-bf47-a283c5efc717@xen.org>
 <e149b283-23bd-9d8f-4be4-4a26722f0ed6@arm.com>
 <65035935-935a-f8a9-a797-5d6a1bce4e66@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <abd3beeb-eccb-8c6e-0751-b881efc08d57@arm.com>
Date: Tue, 7 Dec 2021 08:10:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <65035935-935a-f8a9-a797-5d6a1bce4e66@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 06.12.2021 17:40, Julien Grall wrote:
> 
> 
> On 06/12/2021 15:00, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 06.12.2021 15:39, Julien Grall wrote:
>>> Hi Michal,
>>>
>>> On 06/12/2021 14:19, Michal Orzel wrote:
>>>> vtimer_update_irqs, vtimer_update_irq and vcpu_update_evtchn_irq if
>>>> CONFIG_NEW_VGIC is not set.
>>>>
>>>> enter_hypervisor_from_guest is protecting calls to these functions
>>>> with CONFIG_NEW_VGIC but their definitions and declarations are not > protected. This means that we are including them in the image even
>>>> though we are not making use of them. Fix that.
>>>
>>> While I agree, they are only used by the new vGIC, the implementation of the functions are not. So I don't think they should be protected by CONFIG_NEW_VGIC.
>>>
>>> Actually, I am not convinced they should be protected. But I guess you did that for a reason. Would you be able to clarify what is your reason?
>>>
>>  From what I know + what the commit introducing these fucntions states (b9db96f71a74), the current vGIC does not handle level-triggered vIRQs.
>> The functionality of these functions is only related to new VGIC implementation which can handle level triggered vIRQs.
> 
> This is a known error in the vGIC implementation which should be resolved before this leads to a disaster.

I just thought that if this error is present for such a long time, there are no plans to make current vgic handle level type irqs.
> 
>> So I do not think that these functions are generic and thus I believe they should be protected.
> 
> None of the functions rely on the internal of the new vGIC. In fact, as I wrote above, the current vGIC ought to be able to handle level-trigger interrupt properly.
> 
> They are not called for the current vGIC because there was concern about the performance impact on each trap (see [1]).
> 
> So I think those functions ought to stay compiled in for everyone.
> 
I'm totally ok with that.

> Cheers,
> 
> [1] https://lore.kernel.org/xen-devel/22601816-8235-7891-b634-4af5348a1337@arm.com/
> 
> 
> 
>>> Cheers,
>>>
>>
>> Cheers,
>> Michal
>>
> 

Cheers,
Michal


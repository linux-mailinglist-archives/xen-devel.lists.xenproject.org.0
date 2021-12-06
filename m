Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E082546A197
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 17:41:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239384.414899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muH2p-0000Wd-1e; Mon, 06 Dec 2021 16:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239384.414899; Mon, 06 Dec 2021 16:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muH2o-0000Tq-Un; Mon, 06 Dec 2021 16:40:50 +0000
Received: by outflank-mailman (input) for mailman id 239384;
 Mon, 06 Dec 2021 16:40:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1muH2n-0000Tk-5J
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:40:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muH2m-0001uX-2e; Mon, 06 Dec 2021 16:40:48 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.26.205]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muH2l-0000ym-Sq; Mon, 06 Dec 2021 16:40:48 +0000
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
	bh=693K+3xMOgysjnPdnbcZxJSUGbh0Yd6C7XdavfpaaGo=; b=LVQcEyu5flySv4Gdzw8GvMaYn/
	02K1CLNQ5Si1av2xnX/ecpeM8XoZsCwH7d7i86nURl9fnghq79xaYPx/M3W5h0gtrIE8XLNenpslw
	AENoHthImnJZTkLdc7YfkImPH3wUgZfUcnrMi6hx+WDFf8uBR6l1BmIuMj4gio7zY10Y=;
Message-ID: <65035935-935a-f8a9-a797-5d6a1bce4e66@xen.org>
Date: Mon, 6 Dec 2021 16:40:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm: Do not include in the image functions...
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211206141923.26757-1-michal.orzel@arm.com>
 <61a730e2-fe20-ae74-bf47-a283c5efc717@xen.org>
 <e149b283-23bd-9d8f-4be4-4a26722f0ed6@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e149b283-23bd-9d8f-4be4-4a26722f0ed6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/12/2021 15:00, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 06.12.2021 15:39, Julien Grall wrote:
>> Hi Michal,
>>
>> On 06/12/2021 14:19, Michal Orzel wrote:
>>> vtimer_update_irqs, vtimer_update_irq and vcpu_update_evtchn_irq if
>>> CONFIG_NEW_VGIC is not set.
>>>
>>> enter_hypervisor_from_guest is protecting calls to these functions
>>> with CONFIG_NEW_VGIC but their definitions and declarations are not > protected. This means that we are including them in the image even
>>> though we are not making use of them. Fix that.
>>
>> While I agree, they are only used by the new vGIC, the implementation of the functions are not. So I don't think they should be protected by CONFIG_NEW_VGIC.
>>
>> Actually, I am not convinced they should be protected. But I guess you did that for a reason. Would you be able to clarify what is your reason?
>>
>  From what I know + what the commit introducing these fucntions states (b9db96f71a74), the current vGIC does not handle level-triggered vIRQs.
> The functionality of these functions is only related to new VGIC implementation which can handle level triggered vIRQs.

This is a known error in the vGIC implementation which should be 
resolved before this leads to a disaster.

> So I do not think that these functions are generic and thus I believe they should be protected.

None of the functions rely on the internal of the new vGIC. In fact, as 
I wrote above, the current vGIC ought to be able to handle level-trigger 
interrupt properly.

They are not called for the current vGIC because there was concern about 
the performance impact on each trap (see [1]).

So I think those functions ought to stay compiled in for everyone.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/22601816-8235-7891-b634-4af5348a1337@arm.com/



>> Cheers,
>>
> 
> Cheers,
> Michal
> 

-- 
Julien Grall


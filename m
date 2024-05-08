Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D42988C05D7
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 22:47:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718954.1121525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4oBh-0003m4-CI; Wed, 08 May 2024 20:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718954.1121525; Wed, 08 May 2024 20:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4oBh-0003jl-9A; Wed, 08 May 2024 20:46:53 +0000
Received: by outflank-mailman (input) for mailman id 718954;
 Wed, 08 May 2024 20:46:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s4oBf-0003jf-8F
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 20:46:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4oBe-0008Lt-PK; Wed, 08 May 2024 20:46:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4oBe-00088j-Ia; Wed, 08 May 2024 20:46:50 +0000
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
	bh=jqnr1r57jIullktxgnYkYrfprejWmFnMTsPi5pM5FEw=; b=balDH2KO80FfyQ/EKNgLBmR4Cg
	KljCRCJbKFLdmL1qUw1mCK/uQYLhsdF/jWmacqztteNcaA+AXKUmiKFJxSn9DDEEKBxU9c8IotXKN
	OWoAROhz4Pghvfh2y0lrxSZGMd3WnNmOhqRRtDfelvW9is275YBQNBeGgSCCzAk2lM/0=;
Message-ID: <995ce39d-6a04-4bdc-bfe8-bcef3da24cc2@xen.org>
Date: Wed, 8 May 2024 21:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] xen/arm/gic: Enable interrupt assignment to running
 VM
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-3-xin.wang2@amd.com>
 <670d1033-2443-4245-8ff1-cb7099a7c793@xen.org>
 <70c5a593-9ac5-485b-be81-b789562249d8@amd.com>
 <5ba38b7b-16b1-489b-ad55-083504690bbd@xen.org>
 <1a29ae76-a902-4a24-8fd1-ac26ef228971@amd.com>
 <365e1b12-6b20-40ed-8ca9-beb643c907ab@xen.org>
 <145e4192-3113-415f-876c-e67145d1d5c9@amd.com>
 <f30f7599-6bcd-4b8d-bd1f-6afde18c14c8@xen.org>
 <8957ab21-796f-4e15-a89e-d040e6f7b5ca@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8957ab21-796f-4e15-a89e-d040e6f7b5ca@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 08/05/2024 08:49, Henry Wang wrote:
> On 5/8/2024 5:54 AM, Julien Grall wrote:
>> Hi Henry,
>>>> What if the DT overlay is unloaded and then reloaded? Wouldn't the 
>>>> same interrupt be re-used? As a more generic case, this could also 
>>>> be a new bitstream for the FPGA.
>>>>
>>>> But even if the interrupt is brand new every time for the DT 
>>>> overlay, you are effectively relaxing the check for every user (such 
>>>> as XEN_DOMCTL_bind_pt_irq). So the interrupt re-use case needs to be 
>>>> taken into account.
>>>
>>> I agree. I think IIUC, with your explanation here and below, could we 
>>> simplify the problem to how to properly handle the removal of the IRQ 
>>> from a running guest, if we always properly remove and clean up the 
>>> information when remove the IRQ from the guest? In this way, the IRQ 
>>> can always be viewed as a brand new one when we add it back.
>>
>> If we can make sure the virtual IRQ and physical IRQ is cleaned then yes.
>>
>>> Then the only corner case that we need to take care of would be...
>>
>> Can you clarify whether you say the "only corner case" because you 
>> looked at the code? Or is it just because I mentioned only one?
> 
> Well, I indeed checked the code and to my best knowledge the corner case 
> that you pointed out would be the only one I can think of.

Ok :). I was just checking you had a look as well.

[...]

>>> we have 3 possible states which can be read from LR for this case : 
>>> active, pending, pending and active.
>>> - I don't think we can do anything about the active state, so we 
>>> should return -EBUSY and reject the whole operation of removing the 
>>> IRQ from running guest, and user can always retry this operation.
>>
>> This would mean a malicious/buggy guest would be able to prevent a 
>> device to be de-assigned. This is not a good idea in particular when 
>> the domain is dying.
>>
>> That said, I think you can handle this case. The LR has a bit to 
>> indicate whether the pIRQ needs to be EOIed. You can clear it and this 
>> would prevent the guest to touch the pIRQ. There might be other 
>> clean-up to do in the vGIC datastructure.
> 
> I probably misunderstood this sentence, do you mean the EOI bit in the 
> pINTID field? I think this bit is only available when the HW bit of LR 
> is 0, but in our case the HW is supposed to be 1 (as indicated as your 
> previous comment). Would you mind clarifying a bit more? Thanks!

You are right, ICH_LR.HW will be 1 for physical IRQ routed to a guest. 
What I was trying to explain is this bit could be cleared (with 
ICH_LR.pINTD adjusted).

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9E198F2AB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 17:33:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809587.1221991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNpR-0000QQ-QF; Thu, 03 Oct 2024 15:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809587.1221991; Thu, 03 Oct 2024 15:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNpR-0000Nk-NC; Thu, 03 Oct 2024 15:33:21 +0000
Received: by outflank-mailman (input) for mailman id 809587;
 Thu, 03 Oct 2024 15:33:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1swNpQ-0000Ne-8W
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 15:33:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1swNpP-0005LV-Em; Thu, 03 Oct 2024 15:33:19 +0000
Received: from [15.248.2.26] (helo=[10.24.67.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1swNpP-0007oh-7o; Thu, 03 Oct 2024 15:33:19 +0000
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
	bh=NgnNiLPbqBo4DIF2/k/ywFTnJeDvlLJifdYq1Mq2Jmo=; b=KAgnghc0Y8sqBrBKbbAqsMzn6s
	mfc0OJP6sgB6G/r/7kJmvk2d5s6MN/QeYMN1zyJA1pubWUVV+WDtF7ubsTDoQGx7kRM9ITUGLAzaB
	XtZ6E09rD6UVNxQAjc19meKUF0L2PLgHoPSg6lxqpp1TEXGpxWaTG8ii3Qa4kRWk90FE=;
Message-ID: <68a21529-196a-41f0-9156-8fc36f038a5a@xen.org>
Date: Thu, 3 Oct 2024 16:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-overlay: Fix NULL pointer dereference
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
 <20240919104238.232704-2-michal.orzel@amd.com>
 <72bd286a-9ed9-43f0-8935-fb9e07e180cd@xen.org>
 <74bddc2d-59f2-4961-b226-76ce62376c37@amd.com>
 <a104a49e-07f8-4485-ab03-9fe1dcf41f33@xen.org>
 <d41c1433-95cf-4ae0-b1e8-008b374f468a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d41c1433-95cf-4ae0-b1e8-008b374f468a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/09/2024 15:04, Michal Orzel wrote:
> Hi Julien,
> 
> On 30/09/2024 12:37, Julien Grall wrote:
>>
>>
>> On 23/09/2024 12:05, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi Michal,
>>
>>> On 20/09/2024 10:29, Julien Grall wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> On 19/09/2024 12:42, Michal Orzel wrote:
>>>>> Attempt to attach an overlay (xl dt-overlay attach) to a domain without
>>>>> first adding this overlay to Xen (xl dt-overlay add) results in an
>>>>> overlay track entry being NULL in handle_attach_overlay_nodes(). This
>>>>> leads to NULL pointer dereference and the following data abort crash:
>>>>>
>>>>> (XEN) Cannot find any matching tracker with input dtbo. Operation is supported only for prior added dtbo.
>>>>> (XEN) Data Abort Trap. Syndrome=0x5
>>>>> (XEN) Walking Hypervisor VA 0x40 on CPU0 via TTBR 0x0000000046948000
>>>>> (XEN) 0TH[0x000] = 0x46940f7f
>>>>> (XEN) 1ST[0x000] = 0x0
>>>>> (XEN) CPU0: Unexpected Trap: Data Abort
>>>>> (XEN) ----[ Xen-4.20-unstable  arm64  debug=y  Not tainted ]----
>>>>> ...
>>>>> (XEN) Xen call trace:
>>>>> (XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (PC)
>>>>> (XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (LR)
>>>>> (XEN)    [<00000a0000274b7c>] arch_do_domctl+0x48/0x328
>>>>>
>>>>> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>> ---
>>>>>     xen/common/dt-overlay.c | 7 +++++--
>>>>>     1 file changed, 5 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
>>>>> index d53b4706cd2f..8606b14d1e8e 100644
>>>>> --- a/xen/common/dt-overlay.c
>>>>> +++ b/xen/common/dt-overlay.c
>>>>> @@ -908,8 +908,11 @@ static long handle_attach_overlay_nodes(struct domain *d,
>>>>>      out:
>>>>>         spin_unlock(&overlay_lock);
>>>>>
>>>>> -    rangeset_destroy(entry->irq_ranges);
>>>>> -    rangeset_destroy(entry->iomem_ranges);
>>>>> +    if ( entry )
>>>>> +    {
>>>>> +        rangeset_destroy(entry->irq_ranges);
>>>>> +        rangeset_destroy(entry->iomem_ranges);
>>>>> +    }
>>>>
>>>> While looking at the error paths in handle_attach_overlay_nodes(), I
>>>> noticed we don't revert any partial changes made by handle_device().
>>>>
>>>> In this case, I am wondering whether it is correct to destroy the
>>>> rangeset. How would you be able to revert the changes?
>>> I guess the same story applies as for the partial add/remove which was stated by Vikram
>>> in the commit msg of 7e5c4a8b86f12942de0566b1d61f71d15774364b meaning partial success withe some
>>> failures may lead to other failures and might need a system reboot. I did not carefully look into
>>> this series, my plan was to fix the issues without changing the functional behavior.
>>
>> Do you mean in this series or forever? If the former, would you be able
>> to outline what you expect after the end of this series? What should
>> work? What should not work?
> The goal of this series is to fix the issues I encountered while doing some other DT overlay work
> as stated in the patch 0. The goal of each patch is clearly outlined in the commit message
> by stating what is being fixed and why. The first 3 patches contain "Fixes" tag, therefore there> is no functional behavior change - only fixing what should have been 
fixed by the original series.
> Patch 4 does not have "Fixes" tag although in theory it could. There is no doc mentioning that adding
> nodes right into "/" is forbidden. Linux supports it so I added support for Xen as well.
> 
> After end of *this* series I expect the issues mentioned in each patch to be fixed + the ability to add
> nodes directly under root node.
> 
> It's definitely not the end of fixes for this series.

Good. This wasn't clear from your wording. Thanks for clarification!

>>
>>> FWICS, we do not
>>> yet support detachment (only add/remove and attach) and removal of nodes and ranges is only
>>> possible if the nodes are assigned to hwdom.
>>
>> I need some clarifications. By "we do not yet support detachment", do
>> you mean while a guest is running or do you also include a domain
>> shutting down?In order to reason about detachment we need to go back to see what is supported in terms of attachment.
> At the moment, we can only attach dtbo to 1:1 domUs, therefore we can stop talking about libxl domUs for now.

Ah, I missed the check. I thought we already supported device attachment 
to guest started by xl.

> For dom0less domUs, we also cannot really shut down them. So it leaves us with dom0 whose reboot implies system
> reboot. At the moment there is no code that would release IRQs and unmap MMIOs.

Understood. Then no action expected from my side for now. But it would 
be good to keep track of the unknown issues when we will implement detach.

Cheers,

-- 
Julien Grall



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5E12F9D4B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:57:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69581.124645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1SDv-0007hL-3B; Mon, 18 Jan 2021 10:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69581.124645; Mon, 18 Jan 2021 10:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1SDv-0007gw-0F; Mon, 18 Jan 2021 10:57:27 +0000
Received: by outflank-mailman (input) for mailman id 69581;
 Mon, 18 Jan 2021 10:57:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l1SDs-0007gp-T7
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:57:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l1SDr-0007y9-7c; Mon, 18 Jan 2021 10:57:23 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l1SDr-0000jG-0G; Mon, 18 Jan 2021 10:57:23 +0000
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
	bh=+g6D22DXRsSB9NeUCA7h84/NgCgzj0huxgf53EvHArw=; b=pOa5Cc3dBDV0zAu8SxReI0slEU
	HMJwUMeI6PxECFZ5AiFZWvJFOgaX1GqCQCknoKAEGZ2K9QdkxFmZsrtSKkp+ptCsogdZuK5CR75a7
	16pbcBF0/It4h3iKRqKPtPOWezFX9EjoM6gUxVjou7zcvJFnndNAKYOV4ijETCaPqthU=;
Subject: Re: [PATCH V4 15/24] xen/arm: Stick around in
 leave_hypervisor_to_guest until I/O has completed
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-16-git-send-email-olekstysh@gmail.com>
 <1f1f910b-ebef-f071-3458-12ad493d6e79@xen.org>
 <e57ca0f8-f92f-1ba3-d874-4265e1031542@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <56919528-460f-6ba5-3412-11293b032e14@xen.org>
Date: Mon, 18 Jan 2021 10:57:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e57ca0f8-f92f-1ba3-d874-4265e1031542@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 17/01/2021 20:23, Oleksandr wrote:
> 
> On 15.01.21 22:55, Julien Grall wrote:
>>> So we need
>>> to check if the I/O has completed and wait again if it hasn't (we will
>>> block the vCPU again until an event is received). This loop makes sure
>>> that all the vCPU works are done before we return to the guest.
>>>
>>> The call chain below:
>>> check_for_vcpu_work -> vcpu_ioreq_handle_completion -> wait_for_io ->
>>> wait_on_xen_event_channel
>>>
>>> The worse that can happen here if the vCPU will never run again
>>> (the I/O will never complete). But, in Xen case, if the I/O never
>>> completes then it most likely means that something went horribly
>>> wrong with the Device Emulator. And it is most likely not safe
>>> to continue. So letting the vCPU to spin forever if the I/O never
>>> completes is a safer action than letting it continue and leaving
>>> the guest in unclear state and is the best what we can do for now.
>>>
>>> Please note, using this loop we will not spin forever on a pCPU,
>>> preventing any other vCPUs from being scheduled. At every loop
>>> we will call check_for_pcpu_work() that will process pending
>>> softirqs. In case of failure, the guest will crash and the vCPU
>>> will be unscheduled. In normal case, if the rescheduling is necessary
>>> (might be set by a timer or by a caller in check_for_vcpu_work(),
>>> where wait_for_io() is a preemption point) the vCPU will be rescheduled
>>> to give place to someone else.
>>>
>> What you describe here is a bug that was introduced by this series. If 
>> you think the code requires a separate patch, then please split off 
>> patch #14 so the code callling vcpu_ioreq_handle_completion() happen 
>> here.
> I am afraid, I don't understand which bug you are talking about, I just 
> tried to explain why using a loop is not bad (there wouldn't be any 
> impact to other vCPUs, etc) and the worse case which could happen.
> Also I don't see a reason why the code requires a separate patch 
> (probably, if I understood a bug I would see a reason ...) Could you 
> please clarify?

Your commit message begins with:

"This patch adds proper handling of return value of
vcpu_ioreq_handle_completion() which involves using a loop in
leave_hypervisor_to_guest()."

I read this as "there was a bug in the code base and we are now fixing 
  it". AFAICT, this patch would not be necessary if we don't apply patch 
#14 in Xen (assuming the rest of IOREQ is complete).

Therefore you are fixing a bug that you introduced in the same series.

It is considered as a bad practice because it means
   1) we have to review code that is known "buggy" (patch #14).
   2) adds more churn in the series than necessary

Instead, it would be better to split your changes in
check_for_vcpu_work() from patch #14 and add them here.

[...]

>> So I would rework the loop to write it as:
>>
>> while ( check_for_pcpu_work() )
>>    check_for_pcpu_work();
>> check_for_pcpu_work();
> 
> makes sense, I assume you meant while ( check_for_vcpu_work() ) ...

Yes. Sorry for the typo.

Cheers,

-- 
Julien Grall


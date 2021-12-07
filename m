Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2931C46C33E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 20:00:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241751.418221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mufgG-0001Oa-8b; Tue, 07 Dec 2021 18:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241751.418221; Tue, 07 Dec 2021 18:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mufgG-0001MM-5T; Tue, 07 Dec 2021 18:59:12 +0000
Received: by outflank-mailman (input) for mailman id 241751;
 Tue, 07 Dec 2021 18:59:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mufgF-0001MG-DP
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 18:59:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mufgF-0000Vy-2q; Tue, 07 Dec 2021 18:59:11 +0000
Received: from [54.239.6.187] (helo=[10.95.81.235])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mufgE-0007Tv-Sn; Tue, 07 Dec 2021 18:59:11 +0000
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
	bh=Xnvh+R2aJPzyAtuVCtDfW91EHL4slRZJfk16rHxbuc8=; b=Zr+krmsuQT1SDofqidYd5KEWyV
	NcpnYuOAyABKu5s7iFSE+VY0h/EqpQgFmU5gX5LVd81syamp6s+ErT/1KWW6G24SEoFbKoeuA5m8+
	1jx6aadGyBMJ2b/Wg2EepQfQb7876v449Pq+XnVrMdt8pHZf7Sk1PdMzX58Ts7uj4foQ=;
Message-ID: <f16dab0a-e119-f464-d5de-38bc0d31ff62@xen.org>
Date: Tue, 7 Dec 2021 18:59:09 +0000
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
 <65035935-935a-f8a9-a797-5d6a1bce4e66@xen.org>
 <abd3beeb-eccb-8c6e-0751-b881efc08d57@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <abd3beeb-eccb-8c6e-0751-b881efc08d57@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/12/2021 07:10, Michal Orzel wrote:
> On 06.12.2021 17:40, Julien Grall wrote:
>>
>>
>> On 06/12/2021 15:00, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi Michal,
>>
>>> On 06.12.2021 15:39, Julien Grall wrote:
>>>> Hi Michal,
>>>>
>>>> On 06/12/2021 14:19, Michal Orzel wrote:
>>>>> vtimer_update_irqs, vtimer_update_irq and vcpu_update_evtchn_irq if
>>>>> CONFIG_NEW_VGIC is not set.
>>>>>
>>>>> enter_hypervisor_from_guest is protecting calls to these functions
>>>>> with CONFIG_NEW_VGIC but their definitions and declarations are not > protected. This means that we are including them in the image even
>>>>> though we are not making use of them. Fix that.
>>>>
>>>> While I agree, they are only used by the new vGIC, the implementation of the functions are not. So I don't think they should be protected by CONFIG_NEW_VGIC.
>>>>
>>>> Actually, I am not convinced they should be protected. But I guess you did that for a reason. Would you be able to clarify what is your reason?
>>>>
>>>   From what I know + what the commit introducing these fucntions states (b9db96f71a74), the current vGIC does not handle level-triggered vIRQs.
>>> The functionality of these functions is only related to new VGIC implementation which can handle level triggered vIRQs.
>>
>> This is a known error in the vGIC implementation which should be resolved before this leads to a disaster.
> 
> I just thought that if this error is present for such a long time, there are no plans to make current vgic handle level type irqs.

The error has been present for such a long time because no-one yet 
volunteered to properly fix it. That said, the new vGIC has been an 
attempt to resolve it but the effort kind of died.

It would be nice to revive the effort.

Cheers,

-- 
Julien Grall


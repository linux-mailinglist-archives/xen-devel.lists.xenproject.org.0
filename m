Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECA88C7E01
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 23:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723645.1128670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7iZL-0003x6-LC; Thu, 16 May 2024 21:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723645.1128670; Thu, 16 May 2024 21:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7iZL-0003tw-Hu; Thu, 16 May 2024 21:23:19 +0000
Received: by outflank-mailman (input) for mailman id 723645;
 Thu, 16 May 2024 21:23:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s7iZJ-0003tq-Ud
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 21:23:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s7iZJ-00050N-Ke; Thu, 16 May 2024 21:23:17 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s7iZJ-0007OK-FS; Thu, 16 May 2024 21:23:17 +0000
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
	bh=h23PA+5jhWdPSgoGaMOBNbWiqUUduCxH34QORiLEckc=; b=j5/yeZVmiaBoBcQ75kESnGuFew
	tfZ6bpoZlz+Kc6yWPAXXt53FE76a2+1EOJlftmn8Q4WEobgCD/g1LQ/eiphoWVFe5KLty/f1lH50c
	qZBKgMEhqzbyH/tAL/B/rLDMrY4fGao8Oj654QFW0VjJh0yvBibRMzEJD7p5SvnGyOd8=;
Message-ID: <fa9a1728-98a1-4b04-8965-8ec01d33b804@xen.org>
Date: Thu, 16 May 2024 22:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xen/arm: Add DT reserve map regions to
 bootinfo.reserved_mem
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240425131119.2299629-1-luca.fancellu@arm.com>
 <20240425131119.2299629-2-luca.fancellu@arm.com>
 <a9629975-87d1-457b-b6aa-cbeb91fd4854@xen.org>
 <0A931CEA-59CA-4B1F-A8E4-A4CB990C0476@arm.com>
 <d41b633a-7702-41f6-b2b3-26321de53af2@xen.org>
 <F353B76B-D159-43A0-898F-EF8048342B07@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <F353B76B-D159-43A0-898F-EF8048342B07@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 15/05/2024 11:05, Luca Fancellu wrote:
> 
> 
>> On 14 May 2024, at 22:06, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 14/05/2024 08:53, Luca Fancellu wrote:
>>> Hi Julien,
>>> Thanks for having a look on the patch,
>>>> On 13 May 2024, at 22:54, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Luca,
>>>>
>>>> On 25/04/2024 14:11, Luca Fancellu wrote:
>>>>> Currently the code is listing device tree reserve map regions
>>>>> as reserved memory for Xen, but they are not added into
>>>>> bootinfo.reserved_mem and they are fetched in multiple places
>>>>> using the same code sequence, causing duplication. Fix this
>>>>> by adding them to the bootinfo.reserved_mem at early stage.
>>>>
>>>> Do we have enough space in bootinfo.reserved_mem for them?
>>> So we have 255 banks, in my experience I would say I’ve never saw too many reserved regions
>>> in the DT, maybe a couple, but I’ve always had to deal with embedded platforms.
>>> I’ve tested this one with ADLINK AVA board, n1sdp, Juno, raspberry pi, qemu, fvp.
>>> In your experience, have you seen any numbers that could be concerning?
>> I know in the past we had to bump the memory banks a few times. But as you tested on a few platforms, I think we should be ok.
>>
>> It would be best if this patch goes sooner than later to allow wider testing before we release 4.19.
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Yes it would make sense, this patch makes sense on its own, would you/anyone commit it separately while I work on the second
> patch?

Thank you for the confirmation. This is now committed.

Cheers,

-- 
Julien Grall


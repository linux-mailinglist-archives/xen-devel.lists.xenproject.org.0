Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2840478C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182834.330634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOG39-0003cE-KS; Thu, 09 Sep 2021 09:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182834.330634; Thu, 09 Sep 2021 09:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOG39-0003Zq-H6; Thu, 09 Sep 2021 09:08:51 +0000
Received: by outflank-mailman (input) for mailman id 182834;
 Thu, 09 Sep 2021 09:08:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOG37-0003Zk-EM
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:08:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOG37-0001of-B1; Thu, 09 Sep 2021 09:08:49 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOG37-0006uy-5d; Thu, 09 Sep 2021 09:08:49 +0000
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
	bh=mhOfLDnuYzrnywWhoV3AZ8H8cwhqEJE5ro+NGfTKMGI=; b=FBld4M8HJQAomyeXuFLu4wEKKA
	eXyLJ13/JPiWH7PNtCeV5njVcOwDbDwmABu2UN3+heQ1zXpZU3sZEhBzoTeFpWhepWe7uRevC/WqR
	Kasns+92hfZS2Bd9QVOVBAe2bhQuxP5bir6HT/KrrHX9fkHMPSNUi63n5GAe2MN8LfmI=;
Subject: Re: About Arm guests accessing to GICD_ICPENR
To: Hongda Deng <Hongda.Deng@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, nd <nd@arm.com>
References: <VE1PR08MB567729BD416FCCD32FCBD6CCE6D39@VE1PR08MB5677.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d30242ce-7e67-aad2-4b67-6a038dfd3e93@xen.org>
Date: Thu, 9 Sep 2021 10:08:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB567729BD416FCCD32FCBD6CCE6D39@VE1PR08MB5677.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/09/2021 09:05, Hongda Deng wrote:
> Hi Julien,

Hi,

(+ Stefano)

>> On 06/09/2021 10:04, Hongda Deng wrote:
>>> Hi Julien,
>>> If Xen wants a complete GICD ICPENDRn emulation to fix it, do you have any
>>> suggestions.
>>
>> Emulating ICPENDR is not easy with the existing vGIC. It would be great
>> to finally have a vGIC spec compliant, but I also appreciate this is
>> going to take some time.
> 
> Yes, I agree with that.
> 
>>
>> Ignoring the access is probably the best we can do. However, this is
>> also a risky approach because Zephyr (or another OS) may genuinely want
>> to clear an already pending interrupt. So I would suggest to walk the
>> interrupts that are meant to be modified and check whether they are
>> already pending. If they are then print a message.
> 
> OK, I would add this check and warning message to my current patch to fix it
> in current stage. Is it OK?

I would be fine with the warning. I have added Stefano in CC so he is 
aware of the discussion.

Cheers,

> 
>>
>> This would make clear to the developper that something may go wrong
>> later on.
>>
>> Cheers,
>>
>> --
>> Julien Grall
> 
> [1] https://github.com/zephyrproject-rtos/zephyr/blob/eaf6cf745df3807e6e
> cc941c3a30de6c179ae359/drivers/interrupt_controller/intc_gicv3.c#L274
> 
> Cheers
> Hongda
> 

-- 
Julien Grall


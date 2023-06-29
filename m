Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60C7742E12
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 22:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557066.870094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExpw-0004C8-Ub; Thu, 29 Jun 2023 20:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557066.870094; Thu, 29 Jun 2023 20:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExpw-00049e-Rq; Thu, 29 Jun 2023 20:01:52 +0000
Received: by outflank-mailman (input) for mailman id 557066;
 Thu, 29 Jun 2023 20:01:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qExpv-00049Y-OW
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 20:01:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExpv-0006Qa-AJ; Thu, 29 Jun 2023 20:01:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExpv-0008Ck-4f; Thu, 29 Jun 2023 20:01:51 +0000
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
	bh=5WDmSaeH4byCh/tPtHYG9Yuj8Q24M45GwU5agwKYVZM=; b=hZtLqGNKIVqIYv4cSr6g/Ar3rf
	qASsIub6S+ESGt9WpymM3/VJE3511PB+wAH9RAyTyiO7PebSp76v1SB1n/Txl+8iBJEutaYVlqA5K
	iiSCdePE6KSLTrLURoTxMVkO5xjKEACQmuhkt3CPx7E839yYvOW/bGxlP1mX9hxGOQS0=;
Message-ID: <ece531e1-18d0-3b95-866e-5ea3518ee92b@xen.org>
Date: Thu, 29 Jun 2023 21:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
 <AS8PR08MB7991E5463FC69273FE7A48B49226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3caaf967-b7ba-0915-56aa-aeff5450a456@xen.org>
 <AS8PR08MB7991CE92396A70CBAEDFF0039225A@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991CE92396A70CBAEDFF0039225A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/06/2023 02:36, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> Subject: Re: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
>>
>> On 26/06/2023 08:29, Henry Wang wrote:
>>> Hi Julien,
>> Hi Henry,
>>
>>> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>>
>> Thanks, I will fix both typos.
> 
> Great, thanks!
> 
>>
>>>
>>> Just want to make sure you also noticed this, otherwise maybe you
>>> can include another patch in the series to fix this?
>>
>> I haven't seen this one. Probably because you would need a setup where
>> interrupts are around ID 1022.
> 
> I took a closer look today, I think the reason is from this device tree node
> for the FVP:
> 
> ethernet@202000000 {
>      compatible = "smsc,lan91c111";
>      reg = <0x2 0x2000000 0x10000>;
>      interrupts = <0xf>;
> };
> 
> The value 0xf is  passed to vgic_get_virq_type() as "index" then "intr" in
> VGIC_ICFG_MASK. Hence the 31 in
> "(XEN) left shift of 1 by 31 places cannot be represented in type 'int'".
> 
>>
>> Or I can do that
>>> in case you don't have enough bandwidth.
>>
>> You have the setup to exercise the problem. So it would be best if you
>> do it.
> 
> I've prepared below on top of your series:
> -#define VGIC_ICFG_MASK(intr) (1 << ((2 * ((intr) % 16)) + 1))
> +#define VGIC_ICFG_MASK(intr) (1U << ((2 * ((intr) % 16)) + 1))

This LGTM. Feel free to send a patch.

Cheers,

-- 
Julien Grall


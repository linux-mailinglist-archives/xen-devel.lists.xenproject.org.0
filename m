Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AFD61EF02
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 10:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439163.693157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oryRy-00012Y-6Z; Mon, 07 Nov 2022 09:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439163.693157; Mon, 07 Nov 2022 09:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oryRy-00010T-3X; Mon, 07 Nov 2022 09:29:50 +0000
Received: by outflank-mailman (input) for mailman id 439163;
 Mon, 07 Nov 2022 09:29:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oryRx-00010N-1d
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 09:29:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oryRw-0001tE-Oj; Mon, 07 Nov 2022 09:29:48 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oryRw-0002Rs-I9; Mon, 07 Nov 2022 09:29:48 +0000
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
	bh=ZOJWmLcw7kp92I3QuTPAmxq0F/w3g3ZOSqznM6TbQT4=; b=dkIk1/AAej+02hmwO3kwQxsUD2
	WbCKfA/QaRqUgP6a+A+G6BJN4M8tuJwrvnTNEYzztm/EkImRnrle7gR8fKKkJszQ1YHsQL7KuXgLD
	jIs+daSNS1F/bDpRIziRLxl/f0p67Ea0yxboN+FIRaVWrCo1ITRLPYxg6iuljgjuLiig=;
Message-ID: <e8b30043-64b3-a8d2-073b-289a1f85f02b@xen.org>
Date: Mon, 7 Nov 2022 09:29:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 09/11] xen/arm64: create boot-time MPU protection
 regions
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-10-wei.chen@arm.com>
 <f83fdce2-b16e-9ef7-e3b8-d62641907aff@xen.org>
 <AM0PR08MB453082216C4AB04CC8F47612F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB453082216C4AB04CC8F47612F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2022 06:59, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>>> +
>>> +/*
>>> + * In boot stage, we will use 1 MPU region:
>>> + * Region#0: Normal memory for Xen text + data + bss (2MB)
>>> + */
>>
>> Are we only going to modify the MPU in head.S? If not, then I would
>> define the layout in config_mpu.h so there are a single point where you
>> can read how this works.
>>
> 
> We will remap Xen in C codes in setup_mm().
> The whole strategy is aligned with MMU: a very simple setup(map xen
> with the maximum size, 2M) at start-of-the-day, and a fit map in
> setup_mm.

The strategy we are using for the MMU is completely broken (not 
compliant with the Arm Arm) and unnecessary. My long term goal is to 
actually remove the switch_ttbr() and most of setup_pagetables() for all 
setup but cache coloring. This means the concept of boot pages will not 
exist anymore.

For the MPU, we should aim to do better than what was done for the MMU. 
Right now, I see no argument for switching MPUs table. I am only seen 
argument against it because you need to disable the cache and is quite 
fragile.

[...]

>>> +
>>> +    ldr x2, =XEN_START_ADDRESS
>>> +    mov x3, #(XEN_START_MEM_SIZE - 1)
>>
>> XEN_START_MEM_SIZE is the maximum size of Xen. IOW, Xen may be
>> smaller
>> and you will map memory that may not be part of Xen. Therefore, you
>> likely want to compute the real size to avoid mapping too much.
>>
> 
> Later, in setup_mm we will map XEN components by components, such as,
> one MPU memory region for read-only-executable text section, one
> MPU memory region for read-only data section, etc, etc.
> So in there, XEN will be mapped fitly.

But what prevents you to do this now?

> 
> IMHO, the mapping in compiler with maximum size of Xen is also what
> MMU does.

Which is broken because we don't know what located after Xen binary. 
This could be reserved RAM, device which may requires non-caching 
attribute. Mapping those regions with caching attributes is going to break.

As I hinted above, there are a very long list of issues in the MMU boot 
code. So don't take that code for granted. Your MPU code should first be 
compliant with the Arm Arm. If it is close to the MMU code then that's a 
bonus. But bear in mind that the code may look very different soon (see 
[1]).

Cheers,

[1] 20221022150422.17707-1-julien@xen.org

-- 
Julien Grall


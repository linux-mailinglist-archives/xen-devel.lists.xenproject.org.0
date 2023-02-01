Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9887686E77
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 19:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488411.756490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNIHx-0007qo-SQ; Wed, 01 Feb 2023 18:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488411.756490; Wed, 01 Feb 2023 18:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNIHx-0007ob-P3; Wed, 01 Feb 2023 18:56:57 +0000
Received: by outflank-mailman (input) for mailman id 488411;
 Wed, 01 Feb 2023 18:56:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pNIHw-0007oV-FF
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 18:56:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNIHw-0008Qq-1r; Wed, 01 Feb 2023 18:56:56 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.6.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNIHv-00006d-SK; Wed, 01 Feb 2023 18:56:56 +0000
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
	bh=NfY9kjkm/cwAWcRbTiBDNQZ8ivxxe8HKdIkz54f9Efs=; b=Q7OJtuHq8tKlDEK4RE31ZHIarQ
	xoYQdwYBT2akyremhP4AICp64uME8Ba/9uvd6qXdPDZIExGDnHjk4o5DuFIEaskbcPokSw/26hRwN
	hHksM+NlUakrCJH5GEuCemBP/jlVUTH4m/U9MnVAzCor/Lhs7Kfg5IdzVD6y41Pc9GOg=;
Message-ID: <1f360356-b143-e732-5a4a-197ed56b2cd1@xen.org>
Date: Wed, 1 Feb 2023 18:56:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "ayan.kumar.halder@xilinx.com" <ayan.kumar.halder@xilinx.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
 <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
 <AM0PR08MB453083B74DB1D00BDF469331F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <7931e70f-3754-363c-28d8-5fde3198d70f@xen.org>
 <AM0PR08MB45308D5CD69EBB5FE85A4B88F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <3c915633-ddb8-d1e4-f42e-064aaff168b2@xen.org>
 <AM0PR08MB45309F6DCB1B1E0975A741B7F7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <509eafac-bbe7-ed18-ce11-3fede7ca691d@xen.org>
 <AM0PR08MB4530DD5EE9DD4339594F3FE9F7D19@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB4530DD5EE9DD4339594F3FE9F7D19@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 01/02/2023 05:39, Penny Zheng wrote:
>>> If we are adding MPU regions in sequence as you suggested, while using
>>> bitmap at the same time to record used entry.
>>> TBH, this is how I designed at the very beginning internally. We found
>>> that if we don't do reorg late-boot to keep fixed in front and
>>> switching ones after, each time when we do vcpu context switch, not
>>> only we need to hunt down switching ones to disable, while we add new
>>> switch-in regions, using bitmap to find free entry is saying that the
>> process is unpredictable. Uncertainty is what we want to avoid in Armv8-R
>> architecture.
>>
>> I don't understand why it would be unpredictable. For a given combination
>> of platform/device-tree, the bitmap will always look the same. So the
>> number of cycles/instructions will always be the same.
>>
> 
> In boot-time, it will be always the same. But if we still use bitmap to find free
> entry(for switching MPU regions) on runtime, hmmm, I thought this part will
> be unpredictable.

I know this point is now moot as we agreed on not using a bitmap but I 
wanted to answer on the unpredictability part.

It depends on whether you decide to allocate more entry at runtime. My 
assumption is you won't and therefore the the time to walk the bitmap 
will always be consistent.

Cheers,

-- 
Julien Grall


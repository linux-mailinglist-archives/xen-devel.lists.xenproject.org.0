Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6CC782EFC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 19:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587763.919153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8Gx-0006ce-LY; Mon, 21 Aug 2023 17:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587763.919153; Mon, 21 Aug 2023 17:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY8Gx-0006aF-IE; Mon, 21 Aug 2023 17:00:59 +0000
Received: by outflank-mailman (input) for mailman id 587763;
 Mon, 21 Aug 2023 17:00:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY8Gw-0006a7-EN
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 17:00:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY8Gw-000455-08; Mon, 21 Aug 2023 17:00:58 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY8Gv-00048G-Ok; Mon, 21 Aug 2023 17:00:57 +0000
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
	bh=Ba2RzImeiLr4433BR6NG8oR7/KNb3PwTEHjVHbBqv8g=; b=S5oTX1bdKLUlSq6v2fsID2WA5b
	LK0LN6GnDNSM9RQy0l+s+mnlN9+fjXiaZJ5myemQ65XY2Eg56l9ZFFJ+w6CB+ikBSbdrcMwGtrZjO
	hjYbZ+eA+ZYnZSeRwphipDcPV9v9QxtnYJa7ca4PtPi1PO+J+Dk2+h2ViEatSZRvzZBY=;
Message-ID: <778b0a63-0d2b-47c9-8dc5-21717e3e1eb5@xen.org>
Date: Mon, 21 Aug 2023 18:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm: vgic: Use 'unsigned int' rather than 'int'
 whenever it is possible
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-3-julien@xen.org>
 <e3258b25-99fe-5c4a-e539-06b08fe85e2f@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e3258b25-99fe-5c4a-e539-06b08fe85e2f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 18/08/2023 08:02, Michal Orzel wrote:
> On 17/08/2023 23:43, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Switch to unsigned int for the return/parameters of the following
>> functions:
>>      * REG_RANK_NR(): 'b' (number of bits) and the return is always positive.
>>        'n' doesn't need to be size specific.
>>      * vgic_rank_offset(): 'b' (number of bits), 'n' (register index),
>>        's' (size of the access) are always positive.
>>      * vgic_{enable, disable}_irqs(): 'n' (rank index) is always positive
>>      * vgic_get_virq_type(): 'n' (rank index) and 'index' (register
>>        index) are always positive.
> It looks like you forgot to mention the modification done to 'vgic_get_rank()'

I have added:

         * vgic_get_rank(): 'rank' is an index and therefore always 
positive.

> With this addressed:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

Cheers,

-- 
Julien Grall


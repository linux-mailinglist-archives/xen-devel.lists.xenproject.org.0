Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A725A99DE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 16:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396672.636912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkyK-00054d-L8; Thu, 01 Sep 2022 14:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396672.636912; Thu, 01 Sep 2022 14:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkyK-00051y-I8; Thu, 01 Sep 2022 14:15:08 +0000
Received: by outflank-mailman (input) for mailman id 396672;
 Thu, 01 Sep 2022 14:15:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTkyI-00051s-N7
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 14:15:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTkyI-0005KW-7m; Thu, 01 Sep 2022 14:15:06 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTkyI-0005Kw-14; Thu, 01 Sep 2022 14:15:06 +0000
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
	bh=6UG6kfG35vl7kMRaKycuahk569HwHQA5HASlfy1hjBM=; b=F/tmBArcdbpuiA+cX2Bm9SmgDF
	wTwbI5IV/O7aqZ+2G+AjfIf4g1N5W8plp+eTLX0G84X46L2JDackV9tQLZlntxjBCmMY5efwEO4pK
	HYzFTalThXdWEw12uGuNlP9MdrHfBDR9UDlRsNnhlfScieruL9BYEIo75zaIwhYqTbE4=;
Message-ID: <2f99f0ee-6311-219a-2820-5e79d64b7d75@xen.org>
Date: Thu, 1 Sep 2022 15:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH 01/10] xen/arm: smmuv3: Fix l1 stream table size in the
 error message
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1661331102.git.rahul.singh@arm.com>
 <bd9bd6a259b99d4a0ebbfa914f54d8091b1865f5.1661331102.git.rahul.singh@arm.com>
 <a8675747-d445-173b-2e1d-f06577303371@xen.org>
 <454DC664-25A3-4DA2-99F5-BAB20FD8A590@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <454DC664-25A3-4DA2-99F5-BAB20FD8A590@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/09/2022 11:27, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

>> On 24 Aug 2022, at 3:58 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 24/08/2022 14:53, Rahul Singh wrote:
>>> Backport Linux commit dc898eb84b25c39ea46f28c48a169bdbd0e2c7e0
>>> iommu/arm-smmu-v3: Fix l1 stream table size in the error message
>>
>> We have a tag for this (see Origin). If you use it, then…
> Ok.
>>
>>> Original commit message:
>>
>> You don't need to add "original commit message" here and the content is exactly the same.
> Ok.
>>
>>>      iommu/arm-smmu-v3: Fix l1 stream table size in the error message
>>>      The actual size of level-1 stream table is l1size. This looks like
>>>      an oversight on commit d2e88e7c081ef ("iommu/arm-smmu: Fix LOG2SIZE
>>>      setting for 2-level stream tables") which forgot to update the @size
>>>      in error message as well.
>>>      As memory allocation failure is already bad enough, nothing worse
>>>      would happen. But let's be careful.
>>>      Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
>>
>> AFAICT, you didn't make any change to this patch. So the "From:" should still be from Zenghui Yu. For an example how to do backport, see
>> 9c432b876bf518866d431bda73f2be1250f688eb "x86/mwait-idle: add SPR support".
> 
> Ok.
>>
>> Also, it would be good to clarify whether they are clean backport and required some changes (other than context changes). I assume they are clean backports?
> Yes all patches are clean back port.
>   
> Here is the commit msg please have a look once. Once you confirmed I will modify other patches and send it for review.
It looks fine to me.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70722752A3C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 20:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563352.880555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK0rB-0006Mu-76; Thu, 13 Jul 2023 18:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563352.880555; Thu, 13 Jul 2023 18:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK0rB-0006KF-3f; Thu, 13 Jul 2023 18:16:01 +0000
Received: by outflank-mailman (input) for mailman id 563352;
 Thu, 13 Jul 2023 18:15:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qK0r8-0006K9-QU
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 18:15:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qK0r8-0000MR-DB; Thu, 13 Jul 2023 18:15:58 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.30.214]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qK0r8-0004s5-7O; Thu, 13 Jul 2023 18:15:58 +0000
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
	bh=eLMZ1eunLjksH9WZerI8huF0kt1l/ZRISTyz8uO1K7U=; b=vRo/pDKzECBfQwX2FAi7v97/cB
	WursnVu6kQnaqNZ0mITSp7MRxy5DcSrsLWlDXZJmvm9yV924xSVSdkNhXI1ekUqU+abrt/ANOTOAF
	TeprrpXtUoUPThMfTTFmqlsvc642oczcEgdgealg8HGHaTITEH3Tc24FN3Jgeyxv0f5c=;
Message-ID: <66997c9c-d0d9-fce3-e5bd-a4f41cf0de91@xen.org>
Date: Thu, 13 Jul 2023 19:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] xen/arm: Account for domU dtb bootmodule size
 separately
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230711082931.5402-1-michal.orzel@amd.com>
 <20230711082931.5402-3-michal.orzel@amd.com>
 <8bc1ed0e-3ad6-2243-4dd6-a88dd0ee00f8@xen.org>
 <b39b19a4-9649-173b-bb05-518702d05873@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b39b19a4-9649-173b-bb05-518702d05873@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/07/2023 08:01, Michal Orzel wrote:
> Hi Julien,

Hi Michal,
> 
> On 11/07/2023 18:07, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 11/07/2023 09:29, Michal Orzel wrote:
>>> At the moment, we limit the allocation size when creating a domU dtb to
>>> 4KB, which is not enough when using a passthrough dtb with several nodes.
>>> Improve the handling by accounting for a dtb bootmodule (if present)
>>> size separately, while keeping 4KB for the Xen generated nodes (still
>>> plenty of space for new nodes). Also, cap the allocation size to 2MB,
>>> which is the max dtb size allowed.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Note for the future:
>>> As discussed with Julien, really the best way would be to generate dtb directly
>>> in the guest memory, where no allocation would be necessary. This of course
>>> requires some rework. The solution in this patch is good enough for now and
>>> can be treated as an intermediated step to support dtb creation of various
>>> sizes.
>>
>> Thanks for summarizing our discussion :).
>>
>>> ---
>>>    xen/arch/arm/domain_build.c | 18 +++++++++++++-----
>>>    1 file changed, 13 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index f2134f24b971..1dc0eca37bd6 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -3257,14 +3257,15 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
>>>    }
>>>
>>>    /*
>>> - * The max size for DT is 2MB. However, the generated DT is small, 4KB
>>> - * are enough for now, but we might have to increase it in the future.
>>> + * The max size for DT is 2MB. However, the generated DT is small (not including
>>> + * domU passthrough DT nodes whose size we account separately), 4KB are enough
>>> + * for now, but we might have to increase it in the future.
>>>     */
>>>    #define DOMU_DTB_SIZE 4096
>>>    static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>>    {
>>>        int addrcells, sizecells;
>>> -    int ret;
>>> +    int ret, fdt_size = DOMU_DTB_SIZE;
>>
>> Can fdt_size be unsigned?
> I used int because by looking at all the fdt_create() calls in our codebase
> we seem to use int and not unsigned. 

This is a bit of a mess because xmalloc_bytes() is expecting an unsigned 
long parameter. So we have some inconsistency here and we need to chose 
a side.

My preference would be to use the 'unsigned int/long' because the value 
is not meant to be negative.

Also, I used min() that does strict type checking
> and SZ_2M is int. So if you want, I can use unsigned int but will also have to use
> MIN() macro instead not to do type checking (I cannot use MB(2) as it has ULL type
> and do not want to use min() with cast).

By "use min() with cast", do you mean using min_t()? I would be OK with 
using MIN().

> Also, are you OK with the rest of the code?

The rest is fine to me. Anyway, I am OK with this patch as-is. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


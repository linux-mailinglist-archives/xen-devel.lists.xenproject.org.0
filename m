Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10982E284A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 18:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58772.103563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksU8Y-0006gI-Vl; Thu, 24 Dec 2020 17:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58772.103563; Thu, 24 Dec 2020 17:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksU8Y-0006ft-SL; Thu, 24 Dec 2020 17:10:50 +0000
Received: by outflank-mailman (input) for mailman id 58772;
 Thu, 24 Dec 2020 17:10:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ksU8W-0006fo-Uv
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 17:10:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ksU8U-0001sg-A8; Thu, 24 Dec 2020 17:10:46 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ksU8U-00066h-0S; Thu, 24 Dec 2020 17:10:46 +0000
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
	bh=S8TdCqGwO+NrCOUvfPvAOWjr2opPOrGT38oL60MNY30=; b=WdW+6n7QnkPm0vrUxIQ5Oj19b2
	bXG7B7SHfLyO4Y0bVFIuxj/1WengUbNGZt6NQsvCYJtPiVTu2xrdQ1qQsPkeRPslWua6aqVwxZDso
	NDGfJNGlMcoV8Aw+jcHTq9AO2xSJ7no23nNQWbKOVoLHjv7xPIkreCDLGRXIv9HxmhjQ=;
Subject: Re: [PATCH] xen/iommu: smmu: Rework how the SMMU version is detected
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201224164953.32357-1-julien@xen.org>
 <0d592001-66de-4582-f7a1-6ee56cbe7c27@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <11aad53b-2fca-d893-0897-532e5ac4248c@xen.org>
Date: Thu, 24 Dec 2020 17:10:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0d592001-66de-4582-f7a1-6ee56cbe7c27@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 24/12/2020 17:00, Andrew Cooper wrote:
> On 24/12/2020 16:49, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Clang 11 will throw the following error:
>>
>> smmu.c:2284:18: error: cast to smaller integer type 'enum arm_smmu_arch_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>>          smmu->version = (enum arm_smmu_arch_version)of_id->data;
>>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> The error can be prevented by introduce static variable for each SMMU
>> version and store a pointer for each of them.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> You can also fix this by casting through (uintptr_t) instead of (enum
> arm_smmu_arch_version), which wouldn't involve an extra indirection.

I thought about using a different cast, but it feels just papering over 
the issue.

But I don't see what's the problem with the extra indirection... It is 
self-contained and only used during the IOMMU initialization.

> 
> Alternatively, you could modify dt_device_match to union void *data with
> uintptr_t val for when you want to actually pass non-pointer data.
>
> ~Andrew
> 

-- 
Julien Grall


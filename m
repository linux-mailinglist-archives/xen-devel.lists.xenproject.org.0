Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3645B2FD798
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 18:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71695.128601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HkS-0006k5-A8; Wed, 20 Jan 2021 17:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71695.128601; Wed, 20 Jan 2021 17:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HkS-0006jg-6i; Wed, 20 Jan 2021 17:58:28 +0000
Received: by outflank-mailman (input) for mailman id 71695;
 Wed, 20 Jan 2021 17:58:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2HkR-0006jb-5k
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:58:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HkR-0006RG-1O; Wed, 20 Jan 2021 17:58:27 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HkQ-0000nB-RW; Wed, 20 Jan 2021 17:58:26 +0000
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
	bh=h1yYu8b0TxQp7Mz2LV1JhaBIL7uzAV77D9H/6av4Slc=; b=VLAHVujiWKlEFNSNeiKYKfGZ78
	4GEcDAouhF1tDl+EXYqMA8UwEQQrbX8X2GbOoP+4VPKn7V5VeTIOqC6XxMcor80XCYPYMUrH0f2M0
	S7SjaU4icmxJNWASyugAn1weOMPG7DWcYuHwVweKmjs2JNNZtFg1t582Ps6fiSsNbLCg=;
Subject: Re: [PATCH v2] xen/arm: Using unsigned long for arm64 MPIDR mask
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>,
 nd <nd@arm.com>
References: <20210108062953.2335932-1-wei.chen@arm.com>
 <a11a8270-68ab-066f-7799-511e72869e95@xen.org>
 <AM0PR08MB3747169FD88CFD00C5E38A039EAE0@AM0PR08MB3747.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bbeffe6a-beac-54f7-560d-00b99135d365@xen.org>
Date: Wed, 20 Jan 2021 17:58:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB3747169FD88CFD00C5E38A039EAE0@AM0PR08MB3747.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/01/2021 11:50, Wei Chen wrote:
> Hi Julien

Hi Wei,

Sorry for the late answer. While cleaning my inbox today, I noticied 
that I didn't reply to this thread :(.

>>> integer will do unsigned extend while doing some operations
>>> with 64-bit unsigned integer. This can lead to unexpected
>>> result in some use cases.
>>>
>>> For example, in gicv3_send_sgi_list of GICv3 driver:
>>> uint64_t cluster_id = cpu_logical_map(cpu) & ~MPIDR_AFF0_MASK;
>>>
>>> When MPIDR_AFF0_MASK is 0xFFU, compiler output:
>>>       f7c: 92785c16 and x22, x0, #0xffffff00
>>> When MPIDR_AFF0_MASK is 0xFFUL, compiler output:
>>>       f88: 9278dc75 and x21, x3, #0xffffffffffffff00
>>>
>>> If cpu_logical_map(cpu) = 0x100000000UL and MPIDR_AFF0_MASK is
>>> 0xFFU, the cluster_id returns 0. But the expected value should
>>> be 0x100000000.
>>>
>>> So, in this patch, we force aarch64 to use unsigned long
>>> as MPIDR mask to avoid such unexpected results.
>>
>> How about the following commit message:
>>
>> "Currently, Xen is considering that all the affinity bits are defined
>> below 32-bit. However, Arm64 define a 3rd level affinity in bits 32-39.
>>
>> The function gicv3_send_sgi_list in the GICv3 driver will compute the
>> cluser using the following code:
>>
>> uint64_t cluster_id = cpu_logical_map(cpu) & ~MPIDR_AFF0_MASK;
>>
>> Because MPIDR_AFF0_MASK is defined as a 32-bit value, we will miss out
>> the 3rd level affinity. As a consequence, the IPI would not be sent to
>> the correct vCPU.
>>
>> This particular error can be solved by switching MPIDR_AFF0_MASK to use
>> unsigned long. However, take the opportunity to switch all the MPIDR_*
>> define to use unsigned long to avoid anymore issue.
>> "
>>
>> I can update the commit message while committing if you are happy with it.
>>
> 
> Yes, that would be good, thank you very much : )

Reviewed-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA96719E0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 12:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480486.744929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6Ak-0005sd-Ni; Wed, 18 Jan 2023 11:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480486.744929; Wed, 18 Jan 2023 11:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6Ak-0005o0-KL; Wed, 18 Jan 2023 11:00:02 +0000
Received: by outflank-mailman (input) for mailman id 480486;
 Wed, 18 Jan 2023 11:00:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pI6Aj-0005i9-SU
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 11:00:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI6Aj-0006Jl-7G; Wed, 18 Jan 2023 11:00:01 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.8.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI6Aj-0008In-1S; Wed, 18 Jan 2023 11:00:01 +0000
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
	bh=+jrDTHJzP6DIlIJuk91UB+u8pUB+1hkyR01Pw/bysxA=; b=2klbXRBHPymdBmD54Ghgd3WBCr
	Lh0OXZZ0qRS05OBF6C7N8Qhb8G5HwuzUklnZJKikR5HR6DhPw6cQvWfmdtjWcLWzdnY5L/Wb9AMHz
	QZHsEqW1wSev2/aKJXMOuceiJmFvptBdLAM3vEa1DqLqzdL86O+AJMWf/+dzzGiMPbEM=;
Message-ID: <b13c0904-3503-8894-8b14-64fcc717d50d@xen.org>
Date: Wed, 18 Jan 2023 10:59:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 04/40] xen/arm: add an option to define Xen start
 address for Armv8-R
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-5-Penny.Zheng@arm.com>
 <e406484a-aad3-4953-afdb-3159597ec998@xen.org>
 <PAXPR08MB7420A5C7F93F23F14C77C9BA9EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <7ffe5d34-614d-f2aa-cf87-c518917c970a@xen.org>
 <PAXPR08MB7420F43284FEC60BC88496709EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB7420F43284FEC60BC88496709EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/01/2023 10:22, Wei Chen wrote:
>>> Although it is unlikely that vendors using the Armv8-R IP will do so, it
>>> is indeed an option. In the ID register, there are also related bits in
>>> ID_AA64MMFR0_EL1 (MSA_frac) to indicate this.
>>>
>>>>> ---
>>>>>     xen/arch/arm/Kconfig           |  8 ++++++++
>>>>>     xen/arch/arm/platforms/Kconfig | 16 +++++++++++++---
>>>>>     2 files changed, 21 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>>> index ace7178c9a..c6b6b612d1 100644
>>>>> --- a/xen/arch/arm/Kconfig
>>>>> +++ b/xen/arch/arm/Kconfig
>>>>> @@ -145,6 +145,14 @@ config TEE
>>>>>     	  This option enables generic TEE mediators support. It allows
>>>> guests
>>>>>     	  to access real TEE via one of TEE mediators implemented in
>> XEN.
>>>>>
>>>>> +config XEN_START_ADDRESS
>>>>> +	hex "Xen start address: keep default to use platform defined
>>>> address"
>>>>> +	default 0
>>>>> +	depends on ARM_V8R
>>>>
>>>> It is still pretty unclear to me what would be the difference between
>>>> HAS_MPU and ARM_V8R.
>>>>
>>>
>>> If we don't want to support non-MPU supported Armv8-R, I think they are
>> the
>>> same. IMO, non-MPU supported Armv8-R is meaningless to Xen.
>> OOI, why do you think this is meaningless?
> 
> If there is Armv8-R board without EL2 MPU, how can we protect Xen?

So what you call EL2 MPU is an MPU that is following the Arm 
specification. In theory, you could have a proprietary mechanism for that.

So the question is whether a system not following the Arm specification 
is allowed.

Cheers,

-- 
Julien Grall


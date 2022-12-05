Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8441E64271A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 12:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453419.711020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29FA-0000Zk-Oe; Mon, 05 Dec 2022 11:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453419.711020; Mon, 05 Dec 2022 11:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29FA-0000Ww-LH; Mon, 05 Dec 2022 11:02:40 +0000
Received: by outflank-mailman (input) for mailman id 453419;
 Mon, 05 Dec 2022 11:02:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p29F9-0000Wq-El
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 11:02:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p29F9-0004Z0-5i; Mon, 05 Dec 2022 11:02:39 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.30.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p29F8-0005tg-Vn; Mon, 05 Dec 2022 11:02:39 +0000
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
	bh=j3pR6XKEWQzmiMb8Y41MiRS5lF1Iui2G+SYP3J4AxKw=; b=ZcyFuivzirA7edbXcbc7NVc30z
	At9nf3DNzGjR6PbAR8t/wROgheoqx926KI67wt7lxSaKNzbkvrFc0LYz0NK9T5nb/odo8oPdPgj5Y
	ndFZWSDbpj2fFMhpqG8k+fGG37TtgCbtj6+po208yYNtSZCowcBMWJMv5reqr/lmQlb8=;
Message-ID: <44779d4c-9d36-2989-1ee5-c245e9add9a3@xen.org>
Date: Mon, 5 Dec 2022 11:02:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-6-wei.chen@arm.com>
 <0ffe8a4d-7caf-89af-d189-a872b6b4f0fa@xen.org>
 <PAXPR08MB7420A3A20199F477622EB7099E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <e2a1233c-c001-9553-7abe-de97e96a650e@xen.org>
 <b3240b30-39c7-d4b2-eb92-167a1a81c6ad@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b3240b30-39c7-d4b2-eb92-167a1a81c6ad@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05/12/2022 10:17, Wei Chen wrote:
> On 2022/11/10 2:24, Julien Grall wrote:
> diff --git a/xen/arch/arm/platforms/Kconfig
>>>> b/xen/arch/arm/platforms/Kconfig
>>>>> index c93a6b2756..0904793a0b 100644
>>>>> --- a/xen/arch/arm/platforms/Kconfig
>>>>> +++ b/xen/arch/arm/platforms/Kconfig
>>>>> @@ -1,6 +1,7 @@
>>>>>    choice
>>>>>        prompt "Platform Support"
>>>>>        default ALL_PLAT
>>>>> +    default FVP_BASER if ARM_V8R
>>>>
>>>> Is there any reason to create a new Kconfig rather than using MPU?
>>>>
>>>
>>> Did you mean FVP_BASER? If yes, we want to give each board a MACRO
>>> to indicate its specific configurations. In current series, this MACRO
>>> only be used for board specific start address.
>>
>> See above for this.
>>
> 
> If we move board specific information to tailored config file, I think
> we don't need FVP_BASER.
> 
>>>
>>> If you meant Armv8R, that's because Armv8R does not equal to MPU.
>>
>> I am not entirely sure to understand. Are you saying that an existing 
>> Xen can boot on Armv8R?
>>
> 
> No, I didn't mean that. I just think we can't use only one MPU or one
> ARM_V8R to cover all our changes in this series. For example, some
> changes like new system registers are brought by Armv8R not the MPU.

I understand the theory. But in practice this needs to be a balance 
between finer grain and too much Kconfig.

 From this series alone, it doesn't seem to be make sense to introduce 
the two. Furthermore, I am not entirely sure you will be able to make 
the MPU work without enable the ARMv8-R Kconfig.

Cheers,

-- 
Julien Grall


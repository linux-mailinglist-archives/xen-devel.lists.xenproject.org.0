Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99030598A75
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 19:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389728.626835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOjNA-00019M-8A; Thu, 18 Aug 2022 17:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389728.626835; Thu, 18 Aug 2022 17:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOjNA-00015t-4v; Thu, 18 Aug 2022 17:32:00 +0000
Received: by outflank-mailman (input) for mailman id 389728;
 Thu, 18 Aug 2022 17:31:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOjN8-00015n-Oj
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 17:31:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOjN7-0004jd-Jw; Thu, 18 Aug 2022 17:31:57 +0000
Received: from [54.239.6.188] (helo=[192.168.18.101])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOjN7-0003me-AP; Thu, 18 Aug 2022 17:31:57 +0000
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
	bh=Gyf8AkCtfRkz5Ysm17b3lVHO+SZqEfSYBO+4zROdmRk=; b=xWlIGfI/H3vqpPdYI/zGO2964I
	/3+6nJRwnX4Q90F5dzB/H46YNAtxz9FfN9BYzAkekjUCnDa7HN6yXtxQQw0W0rjsjZLSxGFYIg5Y6
	lNzl5zF+jxMtHyixacBH7fhasSTks01IH4G4eYk55E+wUbDrSpCXi2BkBIqvkzBIDZxw=;
Message-ID: <1527cfdf-5018-d495-cff7-528a278e1f67@xen.org>
Date: Thu, 18 Aug 2022 18:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
 <20220818105601.1896082-2-jens.wiklander@linaro.org>
 <EC23C48B-C9ED-4BD0-BD6D-4967A2509B2B@arm.com>
 <4613f385-b11e-6d4f-42df-2febac4440d1@xen.org>
 <D8557FC4-C3B1-4F40-A264-2D8DE68E71CD@arm.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <D8557FC4-C3B1-4F40-A264-2D8DE68E71CD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 18/08/2022 16:55, Bertrand Marquis wrote:
>> On 18 Aug 2022, at 15:31, Julien Grall <julien@xen.org> wrote:
>>>> +/*
>>>> + * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
>>>> + *                        struct arm_smccc_1_2_regs *res)
>>>> + */
>>>> +ENTRY(arm_smccc_1_2_smc)
>>>> +    /* Save `res` and free a GPR that won't be clobbered */
>>> The comment here should be fixed, you are clobbering x19 hence you need to save it.
>>
>> The comment is correct. x19 is one of the few registers that will not be clobbered by the SMC call. But we still need a register below to store 'args', so we need to free it (what you call clobber).
> 
> Adding “by SMC call" would make this more clear

I would be fine with that.

Cheers,

-- 
Julien Grall


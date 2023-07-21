Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF4575C408
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 12:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567453.886519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMn3D-0002uO-Vk; Fri, 21 Jul 2023 10:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567453.886519; Fri, 21 Jul 2023 10:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMn3D-0002sj-T2; Fri, 21 Jul 2023 10:07:55 +0000
Received: by outflank-mailman (input) for mailman id 567453;
 Fri, 21 Jul 2023 10:07:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMn3C-0002sd-55
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 10:07:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMn3B-0001Ki-7a; Fri, 21 Jul 2023 10:07:53 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.21.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMn3A-0007mR-VR; Fri, 21 Jul 2023 10:07:53 +0000
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
	bh=QmNciW+UFf5AYMt5WO+tKxOBZ7mv3Dv6gmlym972ORg=; b=OziNzBYe1yQ71sDoL2IyAKOjhU
	P8gP+ognZG7J8+9GpDT3TQuxygvv0/qXnzRNnSXwP5K1QVectaIlR/a7BV5TUf/hxBud7rBbRxyEC
	yD/5o8JBdwKxM5/vIT/NT1WL9Rez8di7aJReNWUbKK4E3u1e+iCAsfCjQ+R36ZickI7k=;
Message-ID: <d214397a-bffc-0ce9-8126-7878c74e9981@xen.org>
Date: Fri, 21 Jul 2023 11:07:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/arm: optee: provide an initialization for struct
 arm_smccc_res
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <a86604d6c85a0d516b8e29258ffebb2841dc6aff.1689863236.git.nicola.vetrini@bugseng.com>
 <b245a0da-0a21-8405-6744-22b86ba994a5@xen.org>
 <8891a642-853b-7e1c-6d91-21e09793fd51@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8891a642-853b-7e1c-6d91-21e09793fd51@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21/07/2023 08:28, Nicola Vetrini wrote:
> On 20/07/23 17:54, Julien Grall wrote:
>> Hi Nicola,
>>
>> On 20/07/2023 15:29, Nicola Vetrini wrote:
>>> The local variables with type 'struct arm_smccc_res' are initialized
>>> just after the declaration to avoid any possible read usage prior
>>> to any write usage, which would constitute a violation of
>>> MISRA C:2012 Rule 9.1.
>>>
>>> This is already prevented by suitable checks in the code,
>>> but the correctness of this approach is difficult to prove and
>>> reason about.
>>
>> So I looked at the implementation of arm_smccc_smc(). For arm64, it is 
>> (simplified):
>>
>> if ( cpus_have_const_cap(ARM_SMCCC_1_1) )
>>     arm_smccc_1_1_smc(__VA_ARGS__);
>> else
>>     arm_smccc_1_0_smc(_VA_ARGS__);
>>
>> In arm_smccc_1_1_smc(), we will explicitly initialize __res:
>>
>> if ( ___res )
>>    *___res = (typeof(*___res)) {r0, r1, r2, r3};
>>
>>
>> Whereas for arm_smccc_1_0_smc(), we would call assembly function. I 
>> assuming this is the problem?
>>
>> I think this is similar to the discussion we had on set_interrupts() 
>> and dt_set_cells(). If so, couldn't we tell ECLAIR that 
>> __arm_smccc_1_0_smc() will always initialize *res?
>>
> 
> This is slightly different because of the chained variadic macro 
> expansions of arm_smccc_smc. I could have stated that arm_smccc_smc 
> initializes its args, but because it's variadic I can't narrow it down 
> to a specific index, therefore the property is not correct, because the 
> input arguments are instead expected to be read by the macro. The same 
> reasoning applies for all variadic macros that have some input and 
> output parameters, not just this one.
> 
> In the end, if these were fixed-argument functions or macros we can aim 
> for that, and that would obsolete this patch.

They are all ending up to call a fixed-argument macro 
(__arm_smccc_1_0_smc_7()) and then function __arm_smccc_1_0_smc().

Are you suggesting that this would still not be enough for Eclair?

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6048D454DB3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 20:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226984.392435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnQKU-00014p-B6; Wed, 17 Nov 2021 19:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226984.392435; Wed, 17 Nov 2021 19:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnQKU-00012B-6n; Wed, 17 Nov 2021 19:10:46 +0000
Received: by outflank-mailman (input) for mailman id 226984;
 Wed, 17 Nov 2021 19:10:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mnQKS-000125-Vd
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 19:10:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnQKS-0007FH-BR; Wed, 17 Nov 2021 19:10:44 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.21.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnQKS-0007Yp-57; Wed, 17 Nov 2021 19:10:44 +0000
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
	bh=ixSqz082dGPhsyQYum/hrWCFts0RgIerSewKYlSSJeI=; b=C/dp2eofIb64dqhIdNhVyCo/yt
	zxtbztinabOazBuIA8n4wwYze7BUpsKQqIgj1aIfcBVoN9sJkZVUim5P8gWK/tUx69H7A09BBQDw6
	7et6YZpWeobdIYfwEvx4p0hqnIyF0ho/anNYO5TOOC6tPsj77ro1IucYXQwP7iXf5jac=;
Message-ID: <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
Date: Wed, 17 Nov 2021 19:10:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
 <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
 <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(Prunning some CC to just leave Arm and sched folks)

On 17/11/2021 12:07, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 17 Nov 2021, at 11:48, Julien Grall <julien@xen.org> wrote:
>>
>> On 17/11/2021 11:16, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>>> On 17 Nov 2021, at 10:26, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Luca,
>>>>
>>>> On 17/11/2021 09:57, Luca Fancellu wrote:
>>>>> Currently Xen creates a default cpupool0 that contains all the cpu brought up
>>>>> during boot and it assumes that the platform has only one kind of CPU.
>>>>> This assumption does not hold on big.LITTLE platform, but putting different
>>>>> type of CPU in the same cpupool can result in instability and security issues
>>>>> for the domains running on the pool.
>>>>
>>>> I agree that you can't move a LITTLE vCPU to a big pCPU. However...
>>>>
>>>>> For this reason this serie introduces an architecture specific way to create
>>>>> different cpupool at boot time, this is particularly useful on ARM big.LITTLE
>>>>> platform where there might be the need to have different cpupools for each type
>>>>> of core, but also systems using NUMA can have different cpu pool for each node.
>>>>
>>>> ... from my understanding, all the vCPUs of a domain have to be in the same cpupool. So with this approach it is not possible:
>>>>    1) to have a mix of LITTLE and big vCPUs in the domain
>>>>    2) to create a domain spanning across two NUMA nodes
>>>>
>>>> So I think we need to make sure that any solutions we go through will not prevent us to implement those setups.
>>> The point of this patch is to make all cores available without breaking the current behaviour of existing system.
>>
>> I might be missing some context here. By breaking current behavior, do you mean user that may want to add "hmp-unsafe" on the command line?
> 
> Right, with hmp-unsafe the behaviour is now the same as without, only extra cores are parked in other cpupools.
> 
> So you have a point in fact that behaviour is changed for someone who was using hmp-unsafe before if this is activated.
> The command line argument suggested by Jurgen definitely makes sense here.
> 
> We could instead do the following:
> - when this is activated in the configuration, boot all cores and park them in different pools (depending on command line argument). Current behaviour not change if other pools are not used (but more cores will be on in xen)

 From my understanding, it is possible to move a pCPU in/out a pool 
afterwards. So the security concern with big.LITTLE is still present, 
even though it would be difficult to hit it.

I am also concerned that it would be more difficult to detect any 
misconfiguration. So I think this option would still need to be turned 
on only if hmp-unsafe are the new command line one are both on.

If we want to enable it without hmp-unsafe on, we would need to at least 
lock the pools.

> - when hmp-unsafe is on, this feature will be turned of (if activated in configuration) and all cores would be added in the same pool.
> 
> What do you think ?

I am split. On one hand, this is making easier for someone to try 
big.LITTLE as you don't have manually pin vCPUs. On the other hand, this 
is handling a single use-case and you would need to use hmp-unsafe and 
pinning if you want to get more exotic setup (e.g. a domain with 
big.LITTLE).

Another possible solution is to pin dom0 vCPUs (AFAIK they are just 
sticky by default) and then create the pools from dom0 userspace. My 
assumption is for dom0less we would want to use pinning instead.

That said I would like to hear from Xilinx and EPAM as, IIRC, they are 
already using hmp-unsafe in production.

Cheers,

-- 
Julien Grall


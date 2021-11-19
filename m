Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B1457625
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 19:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228161.394728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8E2-0007fJ-Ek; Fri, 19 Nov 2021 18:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228161.394728; Fri, 19 Nov 2021 18:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8E2-0007dV-Au; Fri, 19 Nov 2021 18:03:02 +0000
Received: by outflank-mailman (input) for mailman id 228161;
 Fri, 19 Nov 2021 18:03:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mo8E1-0007dP-8j
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 18:03:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mo8E0-0005Bt-NP; Fri, 19 Nov 2021 18:03:00 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.20.70]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mo8E0-0001wy-Gn; Fri, 19 Nov 2021 18:03:00 +0000
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
	bh=elKBqsSb9ooys+KbOZi0fuWZcG0TS9+OFsE8t0Ex5e8=; b=ELJqL6gSpWliOlhZ1HjlVtDy9G
	kPxyJwZaYujRV8VONmabeopLQubIH3WzekT4YtQar/VjAsSjCyyLnwY6Ldba7jjWHhVT8oDEgGIX2
	/RSewm29S2xxTpOrHFKYy9rY9oEXp6JSbc9ylGD640tRuwuftPCUon5Yi+DgMRw5/l3k=;
Message-ID: <17cd2c69-56cb-15b9-d381-f854aea55d27@xen.org>
Date: Fri, 19 Nov 2021 18:02:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
 <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
 <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
 <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
 <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 18/11/2021 02:19, Stefano Stabellini wrote:
> On Wed, 17 Nov 2021, Julien Grall wrote:
>>>>>> On 17 Nov 2021, at 10:26, Julien Grall <julien@xen.org> wrote:
>>>>>>
>>>>>> Hi Luca,
>>>>>>
>>>>>> On 17/11/2021 09:57, Luca Fancellu wrote:
>>>>>>> Currently Xen creates a default cpupool0 that contains all the cpu
>>>>>>> brought up
>>>>>>> during boot and it assumes that the platform has only one kind of
>>>>>>> CPU.
>>>>>>> This assumption does not hold on big.LITTLE platform, but putting
>>>>>>> different
>>>>>>> type of CPU in the same cpupool can result in instability and
>>>>>>> security issues
>>>>>>> for the domains running on the pool.
>>>>>>
>>>>>> I agree that you can't move a LITTLE vCPU to a big pCPU. However...
>>>>>>
>>>>>>> For this reason this serie introduces an architecture specific way
>>>>>>> to create
>>>>>>> different cpupool at boot time, this is particularly useful on ARM
>>>>>>> big.LITTLE
>>>>>>> platform where there might be the need to have different cpupools
>>>>>>> for each type
>>>>>>> of core, but also systems using NUMA can have different cpu pool for
>>>>>>> each node.
>>>>>>
>>>>>> ... from my understanding, all the vCPUs of a domain have to be in the
>>>>>> same cpupool. So with this approach it is not possible:
>>>>>>     1) to have a mix of LITTLE and big vCPUs in the domain
>>>>>>     2) to create a domain spanning across two NUMA nodes
>>>>>>
>>>>>> So I think we need to make sure that any solutions we go through will
>>>>>> not prevent us to implement those setups.
>>>>> The point of this patch is to make all cores available without breaking
>>>>> the current behaviour of existing system.
>>>>
>>>> I might be missing some context here. By breaking current behavior, do you
>>>> mean user that may want to add "hmp-unsafe" on the command line?
>>>
>>> Right, with hmp-unsafe the behaviour is now the same as without, only extra
>>> cores are parked in other cpupools.
>>>
>>> So you have a point in fact that behaviour is changed for someone who was
>>> using hmp-unsafe before if this is activated.
>>> The command line argument suggested by Jurgen definitely makes sense here.
>>>
>>> We could instead do the following:
>>> - when this is activated in the configuration, boot all cores and park them
>>> in different pools (depending on command line argument). Current behaviour
>>> not change if other pools are not used (but more cores will be on in xen)
>>
>>  From my understanding, it is possible to move a pCPU in/out a pool afterwards.
>> So the security concern with big.LITTLE is still present, even though it would
>> be difficult to hit it.
> 
> As far as I know moving a pCPU in/out of a pool is something that cannot
> happen automatically: it requires manual intervention to the user and it
> is uncommon. 
> We could print a warning or simply return error to prevent
> the action from happening. Or something like:
> 
> "This action might result in memory corruptions and invalid behavior. Do
> you want to continue? [Y/N]
> 
> 
>> I am also concerned that it would be more difficult to detect any
>> misconfiguration. So I think this option would still need to be turned on only
>> if hmp-unsafe are the new command line one are both on.
>>
>> If we want to enable it without hmp-unsafe on, we would need to at least lock
>> the pools.
> 
> Locking the pools is a good idea.
> 
> My preference is not to tie this feature to the hmp-unsafe command line,
> more on this below.

The only reason I suggested to tie with hmp-unsafe is if you (or anyone 
else) really wanted to use a version where the pool are unlocked.

If we are going to implement the lock, then I think the hmp-unsafe would 
not be necessary for such configuration.

> 
> 
>>> - when hmp-unsafe is on, this feature will be turned of (if activated in
>>> configuration) and all cores would be added in the same pool.
>>>
>>> What do you think ?
>>
>> I am split. On one hand, this is making easier for someone to try big.LITTLE
>> as you don't have manually pin vCPUs. On the other hand, this is handling a
>> single use-case and you would need to use hmp-unsafe and pinning if you want
>> to get more exotic setup (e.g. a domain with big.LITTLE).
>>
>> Another possible solution is to pin dom0 vCPUs (AFAIK they are just sticky by
>> default) and then create the pools from dom0 userspace. My assumption is for
>> dom0less we would want to use pinning instead.
>>
>> That said I would like to hear from Xilinx and EPAM as, IIRC, they are already
>> using hmp-unsafe in production.
> 
> This discussion has been very interesting, it is cool to hear new ideas
> like this one. I have a couple of thoughts to share.
> 
> First I think that the ability of creating cpupools at boot time is
> super important. It goes way beyond big.LITTLE. It would be incredibly
> useful to separate real-time (sched=null) and non-real-time
> (sched=credit2) workloads. I think it will only become more important
> going forward so I'd love to see an option to configure cpupools that
> works for dom0less. It could be based on device tree properties rather
> than kconfig options.
> 
> It is true that if we had the devicetree-based cpupool configuration I
> mentioned, then somebody could use it to create cpupools matching
> big.LITTLE. > So "in theory" it solves the problem. However, I think that
> for big.LITTLE it would be suboptimal. For big.LITTLE it would be best
> if Xen configured the cpupools automatically rather than based on the
> device tree configuration. 

This brings one question. How do Linux detect and use big.LITTLE? Is 
there a Device-Tree binding?

[...]

> So I think that it is a good idea to have a command line option (better
> than a kconfig option) to trigger the MIDR-based cpupool creation at
> boot time. The option could be called midr-cpupools=on/off or
> hw-cpupools=on/off for example.
> In terms of whether it should be the default or not, I don't feel
> strongly about it.

On by default means this will security supported and we need to be 
reasonably confident this cannot be broken.

In this case, I am not only referring to moving a pCPU between pool but 
also Xen doing the right thing (e.g. finding the minimum cache line size).


[...]

> - midr-cpupools alone
> cpupools created at boot, warning/errors on changing cpupools >
> - midr-cpupools + hmp-unsafe
> cpupools created at boot, changing cpupools is allowed (we could still
> warn but no errors)
> 
> - hmp-unsafe alone
> same as today with hmp-unsafe

I like better Juergen's version. But before agreeing on the command line 
, I would like to understand how Linux is dealing with big.LITTLE today 
(see my question above).

> 
> For the default as I said I don't have a strong preference. I think
> midr-cpupools could be "on" be default.

I think this should be off at the beginning until the feature is matured 
enough. We are soon opening the tree again for the next development 
cycle. So I think we have enough time to make sure everything work 
properly to have turned on by default before next release.


Cheers,

-- 
Julien Grall


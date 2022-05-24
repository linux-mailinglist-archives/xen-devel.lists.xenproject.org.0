Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CCF532447
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336215.560562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAs-0005Hq-1v; Tue, 24 May 2022 07:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336215.560562; Tue, 24 May 2022 07:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAr-0005EH-TO; Tue, 24 May 2022 07:41:49 +0000
Received: by outflank-mailman (input) for mailman id 336215;
 Tue, 24 May 2022 07:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QgIG=WA=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1ntP5s-0003DA-NU
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:36:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9d17c108-db2b-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 08:34:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42E531FB;
 Mon, 23 May 2022 23:34:50 -0700 (PDT)
Received: from [10.57.2.178] (unknown [10.57.2.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 004563F66F;
 Mon, 23 May 2022 23:34:46 -0700 (PDT)
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
X-Inumbo-ID: 9d17c108-db2b-11ec-837e-e5687231ffcc
Message-ID: <06dbe73a-a14f-4b9f-4839-9c97829303ff@arm.com>
Date: Tue, 24 May 2022 08:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/arm: Allow setting the number of CPUs to activate at
 runtime
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220523091324.137350-1-michal.orzel@arm.com>
 <45054a80-3958-a6b8-1575-02dd5bb17892@xen.org>
 <cb1e1ce0-4667-c436-6e5d-abc26add4ebe@arm.com>
 <3236e8e6-c25d-1733-9315-e0363cc73f84@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <3236e8e6-c25d-1733-9315-e0363cc73f84@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 23.05.2022 22:00, Julien Grall wrote:
> 
> 
> On 23/05/2022 11:21, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>>
>> On 23.05.2022 12:05, Julien Grall wrote:
>>> Hi,
>>>
>>> On 23/05/2022 10:13, Michal Orzel wrote:
>>>> Introduce a command line parameter "maxcpus" on Arm to allow adjusting
>>>> the number of CPUs to activate.
>>>
>>> The current definition "maxcpus" is not really suitable for big.LITTLE systems as you have no flexibility to say how many types of each cores you want to boot.
>>>
>>> Instead, Xen will pick-up the first CPUs it parsed from the firmware tables.
>>>
>>>
>>> So what's your use-case/target?
>>>
>> - use cases where we have no big little (although even on big.LITTLE limiting this number makes sense if we do not care about the types)
> 
> This may make sense in debug build, but for prod I think you need some certainty how which CPUs you are going to use.
My conviction was that using big.LITTLE by enabling hmp-unsafe is not really used in the production systems (after all it's called *unsafe*)
as it may easily end up in an insecure/unstable platform without specifying the cpu affinity (which must be done carefully).

> 
> So I would like a warning in the documentation "maxcpus" that in big.LITTLE system, there are no guarantee on which types will be used.
I'm fully ok with adding this warning.

**WARNING: On Arm big.LITTLE systems, when `hmp-unsafe` option is enabled, this command line
option does not guarantee on which CPU types will be used.**

> 
> This is technically a lie, but I don't want a user to start relying on how Xen will parse the DT.
> 
>> - debug cases where we want to set maxcpus=1
> 
> Thanks for the clarification. I would be happy to add my tag with a warning in the documentation.
> 
Does it mean you want to do this on commit or should I handle it in v2?

> Cheers,
> 

Cheers,
Michal


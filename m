Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C538529CF2
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 10:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330567.553957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqswl-0003G9-4L; Tue, 17 May 2022 08:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330567.553957; Tue, 17 May 2022 08:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqswl-0003DS-0v; Tue, 17 May 2022 08:52:51 +0000
Received: by outflank-mailman (input) for mailman id 330567;
 Tue, 17 May 2022 08:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6f+b=VZ=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nqswj-0003DM-98
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 08:52:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b9949a2a-d5be-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 10:52:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2615B1042;
 Tue, 17 May 2022 01:52:47 -0700 (PDT)
Received: from [10.57.3.238] (unknown [10.57.3.238])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6EAB3F73D;
 Tue, 17 May 2022 01:52:45 -0700 (PDT)
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
X-Inumbo-ID: b9949a2a-d5be-11ec-837e-e5687231ffcc
Message-ID: <981d9872-266a-d03d-d6e4-80960971a00b@arm.com>
Date: Tue, 17 May 2022 10:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220516170246.19908-1-julien@xen.org>
 <789c1899-7444-2e29-dfea-58c9fa446a8e@arm.com>
 <09550023-320a-2d51-f3c6-f5b7a999bf33@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <09550023-320a-2d51-f3c6-f5b7a999bf33@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 17.05.2022 10:34, Julien Grall wrote:
> 
> 
> On 17/05/2022 07:47, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>>
>> On 16.05.2022 19:02, Julien Grall wrote:
>>> +static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>>> +                        void *hcpu)
>>> +{
>>> +    unsigned long cpu = (unsigned long)hcpu;
>> As cpu does not change in this function, shouldn't we mark it as const?
> 
> As discussed in [1], this is not a common practice to use const for variable that just hold integer.
> 
> I would personally only used it if I think there is a security issue risk (e.g. the variable is used to flush the TLB like in [2]).
> 
> Would you be able to explain why you want to use const? Is it a requirement for some certification?
> 
It is not a subject of any requirement. It was my personal thought.
As it is not a common practice in Xen, I will keep that in mind for the future.

>>
>>> +    int rc = 0;
>>> +
>>> +    switch ( action )
>>> +    {
>>> +    case CPU_UP_PREPARE:
>>> +        rc = gicv3_lpi_allocate_pendtable(cpu);
>>> +        if ( rc )
>>> +            printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%u\n",
>> %u requires unsigned int but cpu is unsigned long.
>> FWICS this will cause a compilation error, so you should change to %lu.
> 
> Whoops. I will fix it on the next version.
> 
>>
>>> +                   cpu);
>>> +        break;
>>>       }
>>>   -    return gicv3_lpi_set_proptable(rdist_base);
>>> +    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
>>>   }
>>>   
> 
> Cheers,
> 
> [1] https://lore.kernel.org/xen-devel/20220505103601.322110-2-michal.orzel@arm.com/
> [2] https://lore.kernel.org/xen-devel/20220221102218.33785-5-julien@xen.org/
> 
>>
>> Cheers,
>> Michal
> 

Cheers,
Michal


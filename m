Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4305530C90
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 12:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335772.559965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5Bh-0004nJ-DD; Mon, 23 May 2022 10:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335772.559965; Mon, 23 May 2022 10:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5Bh-0004kI-9y; Mon, 23 May 2022 10:21:21 +0000
Received: by outflank-mailman (input) for mailman id 335772;
 Mon, 23 May 2022 10:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6LT=V7=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nt5Bf-0004kB-LT
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 10:21:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 14bf242b-da82-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 12:21:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8352A11FB;
 Mon, 23 May 2022 03:21:16 -0700 (PDT)
Received: from [10.57.7.84] (unknown [10.57.7.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CD1B3F73D;
 Mon, 23 May 2022 03:21:14 -0700 (PDT)
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
X-Inumbo-ID: 14bf242b-da82-11ec-bd2c-47488cf2e6aa
Message-ID: <cb1e1ce0-4667-c436-6e5d-abc26add4ebe@arm.com>
Date: Mon, 23 May 2022 12:21:04 +0200
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
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <45054a80-3958-a6b8-1575-02dd5bb17892@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Julien,

On 23.05.2022 12:05, Julien Grall wrote:
> Hi,
> 
> On 23/05/2022 10:13, Michal Orzel wrote:
>> Introduce a command line parameter "maxcpus" on Arm to allow adjusting
>> the number of CPUs to activate.
> 
> The current definition "maxcpus" is not really suitable for big.LITTLE systems as you have no flexibility to say how many types of each cores you want to boot.
> 
> Instead, Xen will pick-up the first CPUs it parsed from the firmware tables.
> 
> 
> So what's your use-case/target?
> 
- use cases where we have no big little (although even on big.LITTLE limiting this number makes sense if we do not care about the types)
- debug cases where we want to set maxcpus=1

>> Currently the limit is defined by the
>> config option CONFIG_NR_CPUS. Such parameter already exists on x86.
>>
>> Define a parameter "maxcpus" and a corresponding static variable
>> max_cpus in Arm smpboot.c. Modify function smp_get_max_cpus to take
>> max_cpus as a limit and to return proper unsigned int instead of int.
>>
>> Take the opportunity to remove redundant variable cpus from start_xen
>> function and to directly assign the return value from smp_get_max_cpus
>> to nr_cpu_ids (global variable in Xen used to store the number of CPUs
>> actually activated).
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>> max_cpus is also defined in x86 setup.c. It would be possible to join
>> these definitions in xen/common/cpu.c. However in that case, max_cpus
>> would become global which is not really what we want.
> 
> If we move the global variable, then I would also expect to move the parsing parsing (i.e. smp_get_max_cpus()). So why would max_cpus end up to be global? Is it because the x86 would continue to use it?
> 
Yes, that would involve more x86 modifications that actual Arm coding. That is why I wanted to avoid it.

>> There is already
>> global nr_cpu_ids used everywhere and max_cpus being used only in x86
>> start_xen and Arm smp_get_max_cpus should be kept local. Also there are
>> already lots of places in Xen using max_cpus (local versions) and that
>> would start to be hard to read (variable shadowing).
> 
> We should avoid variable shadowing.
> 
>> ---
>>   docs/misc/xen-command-line.pandoc |  2 +-
>>   xen/arch/arm/include/asm/smp.h    |  2 +-
>>   xen/arch/arm/setup.c              | 10 ++++------
>>   xen/arch/arm/smpboot.c            | 18 ++++++++++++------
>>   4 files changed, 18 insertions(+), 14 deletions(-)
> 
> The patch looks ok to me (see one coding style comment below). I haven't acked it because I am waiting to get more input on your use-cases.
> 
> 
> [...]
> 
>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>> index 9bb32a301a..22fede6600 100644
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -43,6 +43,10 @@ cpumask_t cpu_possible_map;
>>     struct cpuinfo_arm cpu_data[NR_CPUS];
>>   +/* maxcpus: maximum number of CPUs to activate. */
>> +static unsigned int __initdata max_cpus;
>> +integer_param("maxcpus", max_cpus);
>> +
>>   /* CPU logical map: map xen cpuid to an MPIDR */
>>   register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
>>   @@ -277,16 +281,18 @@ void __init smp_init_cpus(void)
>>                       "unless the cpu affinity of all domains is specified.\n");
>>   }
>>   -int __init
>> -smp_get_max_cpus (void)
>> +unsigned int __init smp_get_max_cpus(void)
>>   {
>> -    int i, max_cpus = 0;
>> +    unsigned int i, cpus = 0;
>> +
>> +    if ( ( !max_cpus ) || ( max_cpus > nr_cpu_ids ) )
> 
> Coding style: We don't add space in the inner parentheses. I.e:
Noted, thanks.

> 
> if ( (!max_cpus) || (max_cpus > nr_cpu_ids) )
> 
>> +        max_cpus = nr_cpu_ids;
>>   -    for ( i = 0; i < nr_cpu_ids; i++ )
>> +    for ( i = 0; i < max_cpus; i++ )
>>           if ( cpu_possible(i) )
>> -            max_cpus++;
>> +            cpus++;
>>   -    return max_cpus;
>> +    return cpus;
>>   }
>>     void __init
> 

Cheers,
Michal


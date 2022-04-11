Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3654FBB24
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 13:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303031.516999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndsRR-0003iL-Ab; Mon, 11 Apr 2022 11:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303031.516999; Mon, 11 Apr 2022 11:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndsRR-0003gA-7e; Mon, 11 Apr 2022 11:42:45 +0000
Received: by outflank-mailman (input) for mailman id 303031;
 Mon, 11 Apr 2022 11:42:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndsRP-0003g4-Nw
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 11:42:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndsRP-0005B5-EB; Mon, 11 Apr 2022 11:42:43 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndsRP-0007a4-7e; Mon, 11 Apr 2022 11:42:43 +0000
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
	bh=oVb6dRkYhQlrClg75ZYhW/lxErBNYymBP+O4sMApSus=; b=eCHDCkjUMuEFdd8OHzWwKvk0SO
	rva+AQrNIlvqGf1cO4IT8IHeMp5DHMVbJdvvnwUTf1ButPhSflfyEOeg9oLXrt1jzYjcpGsV++sD4
	/1sZMBtRAV7v2rRBUbUXdengZaDdX2AaIWeGfAiSReIQp6UUjwR6U7yKqg4JGwkq7LIs=;
Message-ID: <201915c1-7f2a-1c75-ccd0-f096cb3ad2ad@xen.org>
Date: Mon, 11 Apr 2022 12:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
 <a052e26c-2142-bf51-bc80-449476ed0854@xen.org>
 <16C126D9-18EF-440E-BD84-6D5028BFE879@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <16C126D9-18EF-440E-BD84-6D5028BFE879@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 11/04/2022 12:30, Luca Fancellu wrote:
>> On 11 Apr 2022, at 11:58, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 08/04/2022 09:45, Luca Fancellu wrote:
>>> diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/device-tree/cpupools.txt
>>> new file mode 100644
>>> index 000000000000..40cc8135c66f
>>> --- /dev/null
>>> +++ b/docs/misc/arm/device-tree/cpupools.txt
>>> @@ -0,0 +1,140 @@
>>> +Boot time cpupools
>>> +==================
>>> +
>>> +When BOOT_TIME_CPUPOOLS is enabled in the Xen configuration, it is possible to
>>> +create cpupools during boot phase by specifying them in the device tree.
>>> +ACPI is not supported for this feature.
>>> +
>>> +Cpupools specification nodes shall be direct childs of /chosen node.
>>> +Each cpupool node contains the following properties:
>>> +
>>> +- compatible (mandatory)
>>> +
>>> +    Must always include the compatiblity string: "xen,cpupool".
>>> +
>>> +- cpupool-cpus (mandatory)
>>> +
>>> +    Must be a list of device tree phandle to nodes describing cpus (e.g. having
>>> +    device_type = "cpu"), it can't be empty.
>>> +
>>> +- cpupool-sched (optional)
>>> +
>>> +    Must be a string having the name of a Xen scheduler. Check the sched=<...>
>>> +    boot argument for allowed values [1]. When this property is omitted, the Xen
>>> +    default scheduler will be used.
>>> +
>>> +
>>> +Constraints
>>> +===========
>>> +
>>> +If no cpupools are specified, all cpus will be assigned to one cpupool
>>> +implicitly created (Pool-0).
>>> +
>>> +If cpupools node are specified, but not every cpu brought up by Xen is assigned,
>>> +all the not assigned cpu will be assigned to an additional cpupool.
>>> +
>>> +If a cpu is assigned to a cpupool, but it's not brought up correctly, Xen will
>>> +stop.
>>> +
>>> +The boot cpu must be assigned to Pool-0, so the cpupool containing that core
>>> +will become Pool-0 automatically.
>>> +
>>> +
>>> +Examples
>>> +========
>>> +
>>> +A system having two types of core, the following device tree specification will
>>> +instruct Xen to have two cpupools:
>>> +
>>> +- The cpupool with id 0 will have 4 cpus assigned.
>>> +- The cpupool with id 1 will have 2 cpus assigned.
>>
>> AFAIK, there are no guarantee that Xen will parse cpupool_a first. So it would be possible that the ID are inverted here.
>>
>> This could happen if you want to keep the boot CPU in pool 0 and it is not cpu@0 (some bootloaders allows you to change the boot CPU).
> Yes I will specify that the boot cpu is listed in cpupool_a, so that cpupool will have id 0 regardless of the parsing order.

This only covers the case where are two cpupools.

AFAIK, there are no guarantee that Xen will parse the DT or the compiler 
will generate the DT the way you want. So for three cpupools, we still 
don't know which pool will be ID 1/2.

See more below.

> 
>>
>> Also, here you write "The cpupool with id X" but ...
>>
>>> +A system having the cpupools specification below will instruct Xen to have three
>>> +cpupools:
>>> +
>>> +- The cpupool Pool-0 will have 2 cpus assigned.
>>> +- The cpupool Pool-1 will have 2 cpus assigned.
>>> +- The cpupool Pool-2 will have 2 cpus assigned (created by Xen with all the not
>>> +  assigned cpus a53_3 and a53_4).
>>
>> here you write "The cpupool Pool-X". Can you be consistent?
> 
> Sure, do you have a preference between “The cpupool with id X” and “Pool-X”? Otherwise I would go for Pool-X everywhere.

Using "cpupool with ID 0" is definitely wrong. Pool-X is marginally 
better because an admin may think that this name will match what we have 
in Xen.

So I think it would be better to use the node name and mention that 
there are no guarantee in which ID will used by Xen.

> 
>>
>> On a separate topic, I think dom0_max_vcpus() needs to be updated to by default (i.e when opt_dom0_max_vcpus == 0) the number of vCPUs match the number of vCPUs in the cpupool (I think 0) used to created dom0.
> 
> Yes right, I didn’t think about that, I think the change could be something like that:
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9c67a483d4a4..9787104c3d31 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -73,7 +73,10 @@ custom_param("dom0_mem", parse_dom0_mem);
>   unsigned int __init dom0_max_vcpus(void)
>   {
>       if ( opt_dom0_max_vcpus == 0 )
> -        opt_dom0_max_vcpus = num_online_cpus();
> +    {
> +        ASSERT(cpupool0);
> +        opt_dom0_max_vcpus = cpumask_weight(cpupool_valid_cpus(cpupool0));
> +    }
>       if ( opt_dom0_max_vcpus > MAX_VIRT_CPUS )
>           opt_dom0_max_vcpus = MAX_VIRT_CPUS;
> 
> And if you agree I will include the changes for the v7.

This should work.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F3F4E2E25
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 17:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293094.497841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWL13-0006To-SN; Mon, 21 Mar 2022 16:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293094.497841; Mon, 21 Mar 2022 16:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWL13-0006Rh-PV; Mon, 21 Mar 2022 16:36:21 +0000
Received: by outflank-mailman (input) for mailman id 293094;
 Mon, 21 Mar 2022 16:36:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWL11-0006Rb-M7
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 16:36:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWL11-0002te-3Z; Mon, 21 Mar 2022 16:36:19 +0000
Received: from [54.239.6.185] (helo=[192.168.25.135])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWL10-00077g-Sv; Mon, 21 Mar 2022 16:36:19 +0000
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
	bh=poN5Rh58EY4NwUmRQmcfmZQsHhvFLXwan8txZV/Bfdw=; b=IQY+fNtF+aUTUIeksnespoW/1P
	JDOJQXjFhnBmaARcOHKL0HDcIcumMF0ymD66FkAn0IaRgLhpvtFNw+uJ5bQBH6lbpGB+iJhD6FvUf
	oNHlHClHu61uZZsTGUxcpIOfuOIpHnyuenDlZqvLjpXJExsXUazhmagCaMVerlrFbgK0=;
Message-ID: <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
Date: Mon, 21 Mar 2022 16:36:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
 <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21/03/2022 15:58, Luca Fancellu wrote:
> 
> 
>> On 18 Mar 2022, at 16:12, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> I only skimmed through the series. I have one question below:
>>
>> On 18/03/2022 15:25, Luca Fancellu wrote:
>>> +void __init btcpupools_allocate_pools(void)
>>> +{
>>> +    unsigned int i;
>>> +    bool add_extra_cpupool = false;
>>> +
>>> +    /*
>>> +     * If there are no cpupools, the value of next_pool_id is zero, so the code
>>> +     * below will assign every cpu to cpupool0 as the default behavior.
>>> +     * When there are cpupools, the code below is assigning all the not
>>> +     * assigned cpu to a new pool (next_pool_id value is the last id + 1).
>>> +     * In the same loop we check if there is any assigned cpu that is not
>>> +     * online.
>>> +     */
>>> +    for ( i = 0; i < nr_cpu_ids; i++ )
>>> +        if ( cpumask_test_cpu(i, &cpu_online_map) )
>>> +        {
>>> +            /* Unassigned cpu gets next_pool_id pool id value */
>>> +            if ( pool_cpu_map[i] < 0 )
>>> +            {
>>> +                pool_cpu_map[i] = next_pool_id;
>>> +                add_extra_cpupool = true;
>>> +            }
>>> +            printk(XENLOG_INFO "Logical CPU %u in Pool-%u.\n", i,
>>> +                   pool_cpu_map[i]);
>>> +        }
>>> +        else
>>> +        {
>>> +            if ( pool_cpu_map[i] >= 0 )
>>> +                panic("Pool-%d contains cpu%u that is not online!\n",
>>> +                      pool_cpu_map[i], i);
>>> +        }
>>> +
>>> +    if ( add_extra_cpupool )
>>> +        next_pool_id++;
>>> +
>>> +    /* Create cpupools with selected schedulers */
>>> +    for ( i = 0; i < next_pool_id; i++ )
>>> +        cpupool_create_pool(i, pool_sched_map[i]);
>>> +
>>> +#ifdef CONFIG_X86
>>> +    /* Cpu0 must be in cpupool0 for x86 */
>>> +    if ( pool_cpu_map[0] != 0 )
>>> +        panic("Cpu0 must be in Pool-0\n");
>>> +#endif
>>
>> Can you document why this is necessary on x86 but not on other architectures?
> 
> Hi Julien,
> 
> I received the warning by Juergen here: https://patchwork.kernel.org/comment/24740762/ that at least on x86 there could be
> some problems if cpu0 is not in cpupool0, I tested it on arm and it was working fine and I didn’t find any restriction.

What exactly did you test on Arm?

> 
> So I don’t know why on x86 we must have cpu0 in cpupool0, maybe x86 maintainer have more knowledge about that and
> I can put a comment here.

On Arm, we are not yet supporting all the CPU features that x86 supports 
(e.g. CPU hotplug, suspend/resume...). So I a am bit concerned that the 
restriction is just not there yet (or possibly hidden).

Therefore, before lifting the restriction on Arm (and other arch), I 
would like us to understand why it is necessary on x86.

We may not have the answer quickly, so is it going to be a problem to 
keep the restriction on Arm?

Cheers,

-- 
Julien Grall


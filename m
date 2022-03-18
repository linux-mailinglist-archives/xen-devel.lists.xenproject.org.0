Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CE54DDE16
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 17:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292140.496152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVFDG-0003pS-35; Fri, 18 Mar 2022 16:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292140.496152; Fri, 18 Mar 2022 16:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVFDF-0003me-Vd; Fri, 18 Mar 2022 16:12:25 +0000
Received: by outflank-mailman (input) for mailman id 292140;
 Fri, 18 Mar 2022 16:12:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nVFDE-0003mY-4Y
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 16:12:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVFDD-0005gH-Nk; Fri, 18 Mar 2022 16:12:23 +0000
Received: from [54.239.6.185] (helo=[192.168.15.239])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVFDD-0008CP-GK; Fri, 18 Mar 2022 16:12:23 +0000
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
	bh=5lS8vopfCZtIvwfAldLMKK2sGquPQeGUpGXIFxCQBCA=; b=2umvIuU9wwSy3dQrYFFdWJxc1V
	ECZEU+7Y2NC69b7io718H4pSAAiOxSttud5aMRp20yxvggJ31KiIBcrL81fl5+CX9eDKRwxSo51MS
	syypNtkpWsRgRGF8I/ea1T28BHLXKr+VRw+voCpggmbxWtRdSMMHq9s8c13xY4VjvEpY=;
Message-ID: <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
Date: Fri, 18 Mar 2022 16:12:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220318152541.7460-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

I only skimmed through the series. I have one question below:

On 18/03/2022 15:25, Luca Fancellu wrote:
> +void __init btcpupools_allocate_pools(void)
> +{
> +    unsigned int i;
> +    bool add_extra_cpupool = false;
> +
> +    /*
> +     * If there are no cpupools, the value of next_pool_id is zero, so the code
> +     * below will assign every cpu to cpupool0 as the default behavior.
> +     * When there are cpupools, the code below is assigning all the not
> +     * assigned cpu to a new pool (next_pool_id value is the last id + 1).
> +     * In the same loop we check if there is any assigned cpu that is not
> +     * online.
> +     */
> +    for ( i = 0; i < nr_cpu_ids; i++ )
> +        if ( cpumask_test_cpu(i, &cpu_online_map) )
> +        {
> +            /* Unassigned cpu gets next_pool_id pool id value */
> +            if ( pool_cpu_map[i] < 0 )
> +            {
> +                pool_cpu_map[i] = next_pool_id;
> +                add_extra_cpupool = true;
> +            }
> +            printk(XENLOG_INFO "Logical CPU %u in Pool-%u.\n", i,
> +                   pool_cpu_map[i]);
> +        }
> +        else
> +        {
> +            if ( pool_cpu_map[i] >= 0 )
> +                panic("Pool-%d contains cpu%u that is not online!\n",
> +                      pool_cpu_map[i], i);
> +        }
> +
> +    if ( add_extra_cpupool )
> +        next_pool_id++;
> +
> +    /* Create cpupools with selected schedulers */
> +    for ( i = 0; i < next_pool_id; i++ )
> +        cpupool_create_pool(i, pool_sched_map[i]);
> +
> +#ifdef CONFIG_X86
> +    /* Cpu0 must be in cpupool0 for x86 */
> +    if ( pool_cpu_map[0] != 0 )
> +        panic("Cpu0 must be in Pool-0\n");
> +#endif

Can you document why this is necessary on x86 but not on other 
architectures?

Cheers,

-- 
Julien Grall


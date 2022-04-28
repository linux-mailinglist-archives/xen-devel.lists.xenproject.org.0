Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A58513254
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 13:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316454.535379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk2Bi-0002Lf-AS; Thu, 28 Apr 2022 11:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316454.535379; Thu, 28 Apr 2022 11:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk2Bi-0002Ip-7e; Thu, 28 Apr 2022 11:19:58 +0000
Received: by outflank-mailman (input) for mailman id 316454;
 Thu, 28 Apr 2022 11:19:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nk2Bh-0002Ij-Ad
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 11:19:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nk2Be-0004lg-IS; Thu, 28 Apr 2022 11:19:54 +0000
Received: from [54.239.6.184] (helo=[192.168.2.126])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nk2Be-0005zu-B1; Thu, 28 Apr 2022 11:19:54 +0000
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
	bh=Ir5WfQaotsNJRraYYm7+8sJwxZ8rQOOCK6X29GsDf3I=; b=6sUo4Ye+6KRDAGf3akO0OSkHfL
	h398fLGX6eI77F6IqydH0X+jqOHQeyq82cf2gNmfU35Ugu2H2IUU0A4nH3u0+NfinYthbydfv7WwD
	brf8F3dufN9WDL0qP3uY0yHUPYbt0PWKusIqM6m1stY4eaKlKwmX5E5+q/DIkqVScV5k=;
Message-ID: <ac0a0bf0-81a8-63c7-6a62-377672e24069@xen.org>
Date: Thu, 28 Apr 2022 12:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [xen-unstable-smoke test] 169781: regressions - FAIL
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 David Vrabel <dvrabel@amazon.co.uk>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <osstest-169781-mainreport@xen.org>
 <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org>
 <alpine.DEB.2.22.394.2204271556110.915916@ubuntu-linux-20-04-desktop>
 <CAJ=z9a1bu=3sX0rvWy+T-ey4363DMUEJvzkSqkQkTnvOQtT0=A@mail.gmail.com>
 <alpine.DEB.2.22.394.2204271622520.915916@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204271622520.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 28/04/2022 01:47, Stefano Stabellini wrote:
> On Thu, 28 Apr 2022, Julien Grall wrote:
>> Hi Stefano,
>>
>> On Thu, 28 Apr 2022, 00:02 Stefano Stabellini, <sstabellini@kernel.org> wrote
>>        It seems to me that it is acceptable to allocate memory with interrupt
>>        disabled during __init. I cannot see any drawbacks with it. I think we
>>        should change the ASSERT to only trigger after __init: system_state ==
>>        SYS_STATE_active.
>>
>>        What do you think?
>>
>>
>> This would solve the immediate problem but not the long term one (i.e cpu hotplug).
>>
>> So I think it would be better to properly fix it right away.
> 
> Yeah, you are right about cpu hotplug. I think both statements are true:
> 
> - it is true that this is supposed to work with cpu hotplug and these
>    functions might be directly affected by cpu hotplug (by a CPU coming
>    online later on)
> 
> - it is also true that it might not make sense to ASSERT at __init time
>    if IRQs are disabled. There might be other places, not affected by cpu
>    hotplug, where we do memory allocation at __init time with IRQ
>    disabled. It might still be a good idea to add the system_state ==
>    SYS_STATE_active check in the ASSERT, not to solve this specific
>    problem but to avoid other issues.

AFAIU, it is not safe on x86 to do TLB flush with interrupts disabled 
*and* multiple CPUs running. So we can't generically relax the check.

Looking at the OSSTest results, both Arm32 and Arm64 without GICv3 ITS 
tests have passed. So it seems unnecessary to me to preemptively relax 
the check just for Arm.

> 
> 
> In regard to gicv3_lpi_allocate_pendtable, I haven't thought about the
> implications of cpu hotplug for LPIs and GICv3 before. Do you envision
> that in a CPU hotplug scenario gicv3_lpi_init_rdist would be called when
> the extra CPU comes online?

It is already called per-CPU. See gicv3_secondary_cpu_init() -> 
gicv3_cpu_init() -> gicv3_populate_rdist().

> 
> Today gicv3_lpi_init_rdist is called based on the number of
> rdist_regions without checking if the CPU is online or offline (I think ?)

The re-distributors are not banked and therefore accessible by everyone. 
However, in Xen case, each pCPU will only touch its own re-distributor 
(well aside TYPER to figure out the ID).

The loop in gicv3_populate_rdist() will walk throught all the
re-distributor to find which one corresponds to the current pCPU. Once 
we found it, we will call gicv3_lpi_init_rdist() to fully initialize the 
re-distributor.

I don't think we want to populate the memory for each re-distributor in 
advance.

Cheers,


-- 
Julien Grall


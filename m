Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7A93CCF7F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 10:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158222.291385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5P6v-0000Op-I1; Mon, 19 Jul 2021 08:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158222.291385; Mon, 19 Jul 2021 08:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5P6v-0000Mu-DX; Mon, 19 Jul 2021 08:58:49 +0000
Received: by outflank-mailman (input) for mailman id 158222;
 Mon, 19 Jul 2021 08:58:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m5P6t-0000Mo-Ou
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 08:58:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m5P6t-0006XG-AJ; Mon, 19 Jul 2021 08:58:47 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m5P6t-0001hA-4Y; Mon, 19 Jul 2021 08:58:47 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=uYwMIhcemQ8YSAnT/nwxo9V3kBvpQI6Uln00t/y5rx8=; b=BbevgEoL3guYTG7fSJYKlBSLeN
	ZCUhNNZl/cD2Jlf0MNo8pkAWNSHCDd3kYgXd8rlQL3YlUNALVMQq1E57u8evB6W5h0quAp8X82R3M
	rBHaIrjZOwWTD9/+iP1CozvWXhiowNZnIrYRENcf5WhigTLoxldF7RkAw35oOqENvhsE=;
Subject: Re: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1624974370.git.bertrand.marquis@arm.com>
 <b9c86a28df2bddca095ae02511ced09585dce164.1624974370.git.bertrand.marquis@arm.com>
 <4014ca20-b3b6-cd39-9b26-d1dd8e9b568c@xen.org>
 <A8304A17-E59A-4C40-A9FA-6EF49B58AC54@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <144614cf-575c-9580-065e-31792e350359@xen.org>
Date: Mon, 19 Jul 2021 09:58:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <A8304A17-E59A-4C40-A9FA-6EF49B58AC54@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 16/07/2021 18:14, Bertrand Marquis wrote:
> Hi Julien

Hi Bertrand,

> […]
>>>
>>> +
>>> +    if ( old_reg != new_reg )
>>> +        printk(XENLOG_DEBUG "SANITY DIF: %s 0x%"PRIx64" -> 0x%"PRIx64"\n",
>>> +               reg_name, old_reg, new_reg);
>>> +    if ( old_reg != *cur_reg )
>>> +        printk(XENLOG_DEBUG "SANITY FIX: %s 0x%"PRIx64" -> 0x%"PRIx64"\n",
>>> +               reg_name, old_reg, *cur_reg);
>>> +
>>> +    if ( taint )
>>> +    {
>>> +        printk(XENLOG_WARNING "SANITY CHECK: Unexpected variation in %s.\n",
>>> +                reg_name);
>>> +        add_taint(TAINT_CPU_OUT_OF_SPEC);
>>> +    }
>>> +}
>>> +
>>> +
>>> +/*
>>> + * This function should be called on secondary cores to sanitize the boot cpu
>>> + * cpuinfo.
>>
>> Can we renamed boot_cpu_data to system_cpuinfo (or something similar)? This would make clear this is not only the features for the boot CPU?
> 
> While looking at this request, I checked a bit how boot_cpu_data and cpu_data overall are used:
> - boot_cpu_data is only used in setup.c, by boot_cpu_features macros, in smpboot to retrieve the bootcpu midr, in p2m and by cpufeatures
> - cpu_data[] is used in smpboot, in errata handling to test for csv2, and in vcpreg to access the midr
> 
> So we have a bunch of cpuinfo structures as global variables but most of them are not really used or did I miss something ?

While I agree this is not useful today, the idea is we can find easily 
what features each processor supports. This could be useful if we wanted 
to expose big.LITTLE to the guest.

For instance, imagine you have a system where some processor may support 
32-bit EL1 only on some processor. With a global approach, we would say 
"32-bit EL1 is not supported". That would prevent a user to use the 
system to its full advantage.

Note that I am not asking to implement such things today... This is more 
to show that we will likely want to keep the per-CPU info around.

The system_cpuinfo could be used for system wide decision in Xen (e.g. 
P2M size, cacheline size....) while the per-CPU could be used to enable 
features only used by a couple of CPUs.

> 
> So I am wondering if we should not reduce a bit the amount of global data and:

How much are we talking?

> - introduce a global system_cpuinfo
> - remove cpu_data[] and use a temp structure in the stack of the cpu booting
> - read midr directly in vcpreg
> - use boot_cpu_data in errata for csv2

This would not be quite the same. You may have a system where not all 
processors have ID_AA64PFR0_EL1.CSV2 is set, yet we want to avoid 
setting the hardening vector on process with the bit set to reduce the 
overhead.

Cheers,

-- 
Julien Grall


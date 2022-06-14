Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B964A54AF0C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 13:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348802.574984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o14PQ-0006B0-Qm; Tue, 14 Jun 2022 11:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348802.574984; Tue, 14 Jun 2022 11:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o14PQ-00067a-NO; Tue, 14 Jun 2022 11:08:32 +0000
Received: by outflank-mailman (input) for mailman id 348802;
 Tue, 14 Jun 2022 11:08:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o14PO-00067Q-V4
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 11:08:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o14PO-0005Qq-D3; Tue, 14 Jun 2022 11:08:30 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.23.240]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o14PO-0000ei-5I; Tue, 14 Jun 2022 11:08:30 +0000
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
	bh=/cIGI4RwopOaSMEwqtBghhPN9mpyaStIvaw7rkgvgbs=; b=bBNxFqcpDot3mq1II3sJPkd/fA
	1f6vQe7g7bDzduVkf8Dy1D1Ez+ZxAdVOpgwbLMYYb3/pzQj/m5wbffqBYeZ/BZHXZONN5kRKMgzk6
	2GT9TK+qAMQMOUNq4nyCdwo1HjcyvYgeO8SgJjyVsBh//LAPBYnDoqiXgt0E9Ii1dLOk=;
Message-ID: <3ed8e44f-293d-958f-c144-466e16d034e2@xen.org>
Date: Tue, 14 Jun 2022 12:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/arm: smpboot: Allocate the CPU sibling/core maps
 while preparing the CPU
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220614094119.94720-1-julien@xen.org>
 <f60bd88a-90bc-60a9-be72-aa533315c55f@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f60bd88a-90bc-60a9-be72-aa533315c55f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/06/2022 12:02, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 14.06.2022 11:41, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
>> xmalloc()" extended the checks in _xmalloc() to catch any use of the
>> helpers from context with interrupts disabled.
>>
>> Unfortunately, the rule is not followed when allocating the CPU
>> sibling/core maps.
>>
>> (XEN) Xen call trace:
>> (XEN)    [<00238a5c>] _xmalloc+0xfc/0x314 (PC)
>> (XEN)    [<00000000>] 00000000 (LR)
>> (XEN)    [<00238c8c>] _xzalloc+0x18/0x4c
>> (XEN)    [<00288cb4>] smpboot.c#setup_cpu_sibling_map+0x38/0x138
>> (XEN)    [<00289024>] start_secondary+0x1b4/0x270
>> (XEN)    [<40010170>] 40010170
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 2:
>> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:601
>> (XEN) ****************************************
>>
>> This is happening because zalloc_cpumask_var() may allocate memory
>> if NR_CPUS is > 2 * sizeof(unsigned long).
>>
>> Avoid the problem by allocate the per-CPU IRQs while preparing the
>> CPU.
> Shouldn't this be "by allocating the CPU sibling/core maps while ..."
> to reflect the commit title and to distinguish between this change and the IRQ one?

Yes. I will update it.

[...]

>>   static void remove_cpu_sibling_map(int cpu)
>> @@ -292,9 +294,14 @@ smp_get_max_cpus (void)
>>   void __init
>>   smp_prepare_cpus(void)
>>   {
>> +    int rc;
> Here you are leaving rc uninitialized (which is ok) but ...
> 
>> +
>>       cpumask_copy(&cpu_present_map, &cpu_possible_map);
>>   
>> -    setup_cpu_sibling_map(0);
>> +    rc = setup_cpu_sibling_map(0);
>> +    if ( rc )
>> +        panic("Unable to allocate CPU sibling/core maps\n");
>> +
>>   }
>>   
>>   /* Boot the current CPU */
>> @@ -361,8 +368,6 @@ void start_secondary(void)
>>   
>>       set_current(idle_vcpu[cpuid]);
>>   
>> -    setup_cpu_sibling_map(cpuid);
>> -
>>       /* Run local notifiers */
>>       notify_cpu_starting(cpuid);
>>       /*
>> @@ -530,9 +535,19 @@ static int cpu_smpboot_callback(struct notifier_block *nfb,
>>                                   void *hcpu)
>>   {
>>       unsigned int cpu = (unsigned long)hcpu;
>> +    unsigned int rc = 0;
> ... here you are setting rc to 0 even though it will be reassigned.
> Furthermore, if rc is used only in case of CPU_UP_PREPARE, why not moving the definition there?

Because I forgot to replace "return NOTIFY_DONE;" with :

return !rc ? NOTIFY_DONE : notifier_from_errno(rc);

In this case, we would need to initialize rc to 0 so it doesn't get used 
initialized.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772FB5552C0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 19:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354264.581320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o44Qe-0005iP-1H; Wed, 22 Jun 2022 17:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354264.581320; Wed, 22 Jun 2022 17:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o44Qd-0005gV-Tt; Wed, 22 Jun 2022 17:46:11 +0000
Received: by outflank-mailman (input) for mailman id 354264;
 Wed, 22 Jun 2022 17:46:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o44Qc-0005fe-Kz
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 17:46:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o44Qc-0001nE-A2; Wed, 22 Jun 2022 17:46:10 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o44Qc-0007Y5-13; Wed, 22 Jun 2022 17:46:10 +0000
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
	bh=dTFEg76KRkxW2BD+pHmMB9wuW8MUbDPjrtIU13AOqb8=; b=vJ1Px+G6vqulPxR6V4ij8y2LoJ
	JY5KtQwErNmWcGKWdGbzijduhZOSrsBwpYC5spoF+lh1FrnrDCKcwsmOPZ4NCeBfx79vQaAEEDlHv
	f+Kq/S4rZ54YTMoDn1sZNn4AUdWV6X+zOfnq8Wmqf0YdJkZ3jZ3Vw9U8VCbp4E0ItO6s=;
Message-ID: <87b7646c-dbc0-f503-131a-a51aa3bd517f@xen.org>
Date: Wed, 22 Jun 2022 18:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while preparing
 the CPU
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 Julien Grall <jgrall@amazon.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220614094157.95631-1-julien@xen.org>
 <alpine.DEB.2.22.394.2206141731320.1837490@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2206141731320.1837490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 15/06/2022 01:32, Stefano Stabellini wrote:
> On Tue, 14 Jun 2022, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
>> xmalloc()" extended the checks in _xmalloc() to catch any use of the
>> helpers from context with interrupts disabled.
>>
>> Unfortunately, the rule is not followed when initializing the per-CPU
>> IRQs:
>>
>> (XEN) Xen call trace:
>> (XEN)    [<002389f4>] _xmalloc+0xfc/0x314 (PC)
>> (XEN)    [<00000000>] 00000000 (LR)
>> (XEN)    [<0021a7c4>] init_one_irq_desc+0x48/0xd0
>> (XEN)    [<002807a8>] irq.c#init_local_irq_data+0x48/0xa4
>> (XEN)    [<00280834>] init_secondary_IRQ+0x10/0x2c
>> (XEN)    [<00288fa4>] start_secondary+0x194/0x274
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
>>
>> This also has the benefit to remove a BUG_ON() in the secondary CPU
>> code.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/include/asm/irq.h |  1 -
>>   xen/arch/arm/irq.c             | 35 +++++++++++++++++++++++++++-------
>>   xen/arch/arm/smpboot.c         |  2 --
>>   3 files changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
>> index e45d57459899..245f49dcbac5 100644
>> --- a/xen/arch/arm/include/asm/irq.h
>> +++ b/xen/arch/arm/include/asm/irq.h
>> @@ -73,7 +73,6 @@ static inline bool is_lpi(unsigned int irq)
>>   bool is_assignable_irq(unsigned int irq);
>>   
>>   void init_IRQ(void);
>> -void init_secondary_IRQ(void);
>>   
>>   int route_irq_to_guest(struct domain *d, unsigned int virq,
>>                          unsigned int irq, const char *devname);
>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>> index b761d90c4063..56bdcb95335d 100644
>> --- a/xen/arch/arm/irq.c
>> +++ b/xen/arch/arm/irq.c
>> @@ -17,6 +17,7 @@
>>    * GNU General Public License for more details.
>>    */
>>   
>> +#include <xen/cpu.h>
>>   #include <xen/lib.h>
>>   #include <xen/spinlock.h>
>>   #include <xen/irq.h>
>> @@ -100,7 +101,7 @@ static int __init init_irq_data(void)
>>       return 0;
>>   }
>>   
>> -static int init_local_irq_data(void)
>> +static int init_local_irq_data(unsigned int cpu)
>>   {
>>       int irq;
>>   
>> @@ -108,7 +109,7 @@ static int init_local_irq_data(void)
>>   
>>       for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
>>       {
>> -        struct irq_desc *desc = irq_to_desc(irq);
>> +        struct irq_desc *desc = &per_cpu(local_irq_desc, cpu)[irq];
>>           int rc = init_one_irq_desc(desc);
>>   
>>           if ( rc )
>> @@ -131,6 +132,29 @@ static int init_local_irq_data(void)
>>       return 0;
>>   }
>>   
>> +static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>> +                        void *hcpu)
>> +{
>> +    unsigned long cpu = (unsigned long)hcpu;
> 
> unsigned int cpu ?

Hmmm... We seem to have a mix in the code base. I am OK to switch to 
unsigned int.

> 
> The rest looks good
Can this be converted to an ack or review tag?

Cheers,

-- 
Julien Grall


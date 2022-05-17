Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E88529C97
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 10:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330540.553923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqsem-0007w2-S7; Tue, 17 May 2022 08:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330540.553923; Tue, 17 May 2022 08:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqsem-0007u9-PC; Tue, 17 May 2022 08:34:16 +0000
Received: by outflank-mailman (input) for mailman id 330540;
 Tue, 17 May 2022 08:34:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqsek-0007u3-Pd
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 08:34:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqsek-0006OF-FM; Tue, 17 May 2022 08:34:14 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqsek-0001Ro-9Q; Tue, 17 May 2022 08:34:14 +0000
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
	bh=uQ6QiIxKnyW0SrngqjoDXbmMgJjM1BC8Y1PBNDbCIAU=; b=VQkcyNFL3bPKi6MoIKsNntu54z
	+w6u6cmD13vppV1+cpX1if3W6Qi9WJW+gAbylU9HMOvoPxtJaj2Nb+VaVkVZhQeJdepQI/avy1y/d
	V670oAB7oidy78wBJsH7IJFQIXYY94fYR9MS+Kq4nCzfICiiF24rsi3P22HK0NS33Pt0=;
Message-ID: <09550023-320a-2d51-f3c6-f5b7a999bf33@xen.org>
Date: Tue, 17 May 2022 09:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220516170246.19908-1-julien@xen.org>
 <789c1899-7444-2e29-dfea-58c9fa446a8e@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <789c1899-7444-2e29-dfea-58c9fa446a8e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/05/2022 07:47, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 16.05.2022 19:02, Julien Grall wrote:
>> +static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>> +                        void *hcpu)
>> +{
>> +    unsigned long cpu = (unsigned long)hcpu;
> As cpu does not change in this function, shouldn't we mark it as const?

As discussed in [1], this is not a common practice to use const for 
variable that just hold integer.

I would personally only used it if I think there is a security issue 
risk (e.g. the variable is used to flush the TLB like in [2]).

Would you be able to explain why you want to use const? Is it a 
requirement for some certification?

> 
>> +    int rc = 0;
>> +
>> +    switch ( action )
>> +    {
>> +    case CPU_UP_PREPARE:
>> +        rc = gicv3_lpi_allocate_pendtable(cpu);
>> +        if ( rc )
>> +            printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%u\n",
> %u requires unsigned int but cpu is unsigned long.
> FWICS this will cause a compilation error, so you should change to %lu.

Whoops. I will fix it on the next version.

> 
>> +                   cpu);
>> +        break;
>>       }
>>   
>> -    return gicv3_lpi_set_proptable(rdist_base);
>> +    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
>>   }
>>   

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20220505103601.322110-2-michal.orzel@arm.com/
[2] https://lore.kernel.org/xen-devel/20220221102218.33785-5-julien@xen.org/

> 
> Cheers,
> Michal

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F954D0C6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 20:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350270.576558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1XYS-0007Ut-02; Wed, 15 Jun 2022 18:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350270.576558; Wed, 15 Jun 2022 18:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1XYR-0007Si-TP; Wed, 15 Jun 2022 18:15:47 +0000
Received: by outflank-mailman (input) for mailman id 350270;
 Wed, 15 Jun 2022 18:15:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o1XYQ-0007Sc-LQ
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 18:15:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1XYP-00087C-Ug; Wed, 15 Jun 2022 18:15:45 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.191]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1XYP-0000p0-B9; Wed, 15 Jun 2022 18:15:45 +0000
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
	bh=74zxn/BFNywwaJ4ztXIs/6H/aTG9Vlub6f9bjuR1SMM=; b=XdaaulWWPv24up747cpikI5BNn
	edoMb6iA6Acpv/oKxjsY+Fyt4kz7s9+H4zwHHNVWJtcIbc/xd/ZZcUyHyYnX52noqC7goUXkG1LVf
	sKkTOzGTcsA1ofw3pR2zR5WNVdVyQYpIJq8g4BYP/ADOhXdE8k0IefnnPxdTNMFmZyt4=;
Message-ID: <ba744d38-7ebe-c58a-5576-99d44ec36a29@xen.org>
Date: Wed, 15 Jun 2022 19:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] xen/arm: add FF-A mediator
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
 <20220609061812.422130-3-jens.wiklander@linaro.org> <874k0nhvsq.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <874k0nhvsq.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/06/2022 20:47, Volodymyr Babchuk wrote:
>>   menu "ARM errata workaround via the alternative framework"
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 1d862351d111..dbf5e593a069 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -20,6 +20,7 @@ obj-y += domain.o
>>   obj-y += domain_build.init.o
>>   obj-y += domctl.o
>>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>> +obj-$(CONFIG_FFA) += ffa.o
>>   obj-y += gic.o
>>   obj-y += gic-v2.o
>>   obj-$(CONFIG_GICV3) += gic-v3.o
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 8110c1df8638..a93e6a9c4aef 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -27,6 +27,7 @@
>>   #include <asm/cpufeature.h>
>>   #include <asm/current.h>
>>   #include <asm/event.h>
>> +#include <asm/ffa.h>
>>   #include <asm/gic.h>
>>   #include <asm/guest_atomics.h>
>>   #include <asm/irq.h>
>> @@ -756,6 +757,9 @@ int arch_domain_create(struct domain *d,
>>       if ( (rc = tee_domain_init(d, config->arch.tee_type)) != 0 )
>>           goto fail;
>>   
>> +    if ( (rc = ffa_domain_init(d)) != 0 )
> 
> So, FFA support will be enabled for each domain? I think that this is
> fine for experimental feature, but I want to hear maintainer's opinion.

I would prefer if we add a flag to allow per-domain support. This would 
allow someone to use FFA with a trusted domain (e.g dom0) but not on 
non-trusted VMs
(I don't yet know how secure it will be to expose it to everyone).

Cheers,

-- 
Julien Grall


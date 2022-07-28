Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5CC583F95
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 15:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376782.609776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH3DG-0006kw-Sa; Thu, 28 Jul 2022 13:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376782.609776; Thu, 28 Jul 2022 13:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH3DG-0006j4-Oy; Thu, 28 Jul 2022 13:06:02 +0000
Received: by outflank-mailman (input) for mailman id 376782;
 Thu, 28 Jul 2022 13:06:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oH3DF-0006iy-Ea
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 13:06:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH3DB-0000s9-1B; Thu, 28 Jul 2022 13:05:57 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.7.237.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH3DA-0004BS-Pw; Thu, 28 Jul 2022 13:05:56 +0000
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
	bh=bWNYgr7B6E95S2zwtcIdKCehnHgLISxp9qvCAtKhwok=; b=eKNZkqm9dLaFjWVxey+qRt0XiU
	mWEKb/ROiPWOOYaV+CzAf096JLEXxGkdVEGkLrTkwxHH/cZdOVB+xLIwlN5yihWS/0egsN+xAoC1G
	CWMdDLVwSChnd8082N2w4NGv/mxibNW9r2K5lU6tQTTJq+wn7uCxM93+OCi8KNEhCGDc=;
Message-ID: <4ba6b639-61c2-12e4-8210-07115d7e50ba@xen.org>
Date: Thu, 28 Jul 2022 14:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH v2] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220728075709.1175445-1-burzalodowa@gmail.com>
 <8d2bbddf-f871-5c64-6f95-f6f34edfb730@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8d2bbddf-f871-5c64-6f95-f6f34edfb730@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/07/2022 10:26, Jan Beulich wrote:
> On 28.07.2022 09:57, Xenia Ragiadakou wrote:
>> --- a/xen/arch/arm/include/asm/current.h
>> +++ b/xen/arch/arm/include/asm/current.h
>> @@ -44,8 +44,11 @@ static inline struct cpu_info *get_cpu_info(void)
>>   
>>   #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
>>   
>> +extern void return_to_new_vcpu32(void);
>> +extern void return_to_new_vcpu64(void);
> 
> While ultimately it's the Arm maintainers to judge, may I suggest that
> these be put in arm/domain.c to limit visibility?

In general, I am not in favor of declaring prototype outside of headers. 
That said, I would be okay with it for the two prototypes because:
   1) they are prototypes for assembly functions
   2) declaring in current.h sounds wrong. A better place would be 
domain.h but this would not reduce the visibility too much
   3) this is unlikely to be used by other part of Xen


Cheers,

-- 
Julien Grall


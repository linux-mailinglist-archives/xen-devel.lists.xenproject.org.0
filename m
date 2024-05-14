Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B98C5C99
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 23:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721784.1125454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6zJO-0002HO-KI; Tue, 14 May 2024 21:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721784.1125454; Tue, 14 May 2024 21:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6zJO-0002ER-HU; Tue, 14 May 2024 21:03:50 +0000
Received: by outflank-mailman (input) for mailman id 721784;
 Tue, 14 May 2024 21:03:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s6zJM-0002EJ-PB
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 21:03:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6zJG-00078u-1o; Tue, 14 May 2024 21:03:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6zJF-000174-Nm; Tue, 14 May 2024 21:03:41 +0000
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
	bh=bUtFDoucwgIQQ3W4NIzb5d8M24BnL6CN0ZmCDbDFVow=; b=zG+N2du3bHKcpAWTow+WfFnvzU
	ljE4ABJa2/NPu0OBUfKBrIScUlj/0/XGHe+f/XyPWEhQRlen5BtIYUREHarDrtUfyoDSMDc3hbf13
	ZD+Fum9GP/ytZaUJvnl/iaG+J2W4widiCb5dQVZ2g8I5fSeRZ6x4S3G9ge/gAu60pv5Y=;
Message-ID: <6ba241d8-77b7-4b1c-81f7-6558d4b38449@xen.org>
Date: Tue, 14 May 2024 22:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] arm/mem_access: add conditional build of
 mem_access.c
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
 <e6b525cb-a1f1-494b-8dfe-c9d86cfc8f9e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e6b525cb-a1f1-494b-8dfe-c9d86cfc8f9e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/05/2024 09:10, Jan Beulich wrote:
> On 10.05.2024 14:32, Alessandro Zucchelli wrote:
>> --- a/xen/arch/arm/include/asm/mem_access.h
>> +++ b/xen/arch/arm/include/asm/mem_access.h
>> @@ -17,6 +17,8 @@
>>   #ifndef _ASM_ARM_MEM_ACCESS_H
>>   #define _ASM_ARM_MEM_ACCESS_H
>>   
>> +#include <xen/types.h>
>> +
>>   static inline
>>   bool p2m_mem_access_emulate_check(struct vcpu *v,
>>                                     const struct vm_event_st *rsp)
>> @@ -35,12 +37,28 @@ static inline bool p2m_mem_access_sanity_check(struct domain *d)
>>    * Send mem event based on the access. Boolean return value indicates if trap
>>    * needs to be injected into guest.
>>    */
>> +#ifdef CONFIG_MEM_ACCESS
>>   bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec);
>>   
>>   struct page_info*
>>   p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
>>                                     const struct vcpu *v);
>> +#else
>> +
>> +static inline bool
>> +p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec)
>> +{
>> +    return false;
>> +}
>> +
>> +static inline struct page_info*
>> +p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
>> +                                  const struct vcpu *v)
>> +{
>> +    return NULL;
>> +}
>>   
>> +#endif /*CONFIG_MEM_ACCESS*/
> 
> Why would each arch need to repeat these stubs? IOW why would they not
> live in xen/mem_access.h?

Because they are not used by nor defined in common code. It is pure 
coincidence they are named the same. If at some point, some code can be 
shared, then yes I would agree it could be common.

Cheers,

-- 
Julien Grall


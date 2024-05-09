Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BAD8C10BD
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 16:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719261.1121909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s54Jj-00082H-0p; Thu, 09 May 2024 14:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719261.1121909; Thu, 09 May 2024 14:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s54Ji-000807-Tr; Thu, 09 May 2024 14:00:14 +0000
Received: by outflank-mailman (input) for mailman id 719261;
 Thu, 09 May 2024 14:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VSaB=MM=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1s54Jg-0007kd-NR
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 14:00:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 728e4f6c-0e0c-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 16:00:09 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 320A14EE0737;
 Thu,  9 May 2024 16:00:09 +0200 (CEST)
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
X-Inumbo-ID: 728e4f6c-0e0c-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Thu, 09 May 2024 16:00:09 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
 <ppircalabu@bitdefender.com>
Subject: Re: [XEN PATCH v2] arm/mem_access: add conditional build of
 mem_access.c
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <4c63493b-3743-4d20-a5e2-5f1b3038a9c8@xen.org>
References: <ad49a2006a6f19c2db1ff5eabb9ffd666693c4c5.1715250761.git.alessandro.zucchelli@bugseng.com>
 <4c63493b-3743-4d20-a5e2-5f1b3038a9c8@xen.org>
Message-ID: <10ae9ea84866cc9678ac056c829c30ea@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-09 12:52, Julien Grall wrote:
> Hi,
> 
> On 09/05/2024 11:39, Alessandro Zucchelli wrote:
>> In order to comply to MISRA C:2012 Rule 8.4 for ARM asm/mem_access.h 
>> in
>> the case where MEM_ACCESS=n stubs are needed to allow the conditional
>> compilation of the users of this header.
> 
> I think you need to update the commit message given ...
> 
>> 
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>> ---
>> Changes from v1:
>> Reverted preprocessor conditional changes to xen/mem_access.h;
>> added conditional build for xen/mem_access.c;
>> provided stubs for asm/mem_access.h functions.
>> ---
>>   xen/arch/arm/Makefile                 | 2 +-
>>   xen/arch/arm/include/asm/mem_access.h | 9 +++++++++
>>   2 files changed, 10 insertions(+), 1 deletion(-)
>> 
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 7b1350e2ef..45dc29ea53 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -37,7 +37,7 @@ obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>>   obj-y += irq.o
>>   obj-y += kernel.init.o
>>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
>> -obj-y += mem_access.o
>> +obj-$(CONFIG_MEM_ACCESS) += mem_access.o
> 
> ... this not only adding stub.
> 
>>   obj-y += mm.o
>>   obj-y += monitor.o
>>   obj-y += p2m.o
>> diff --git a/xen/arch/arm/include/asm/mem_access.h 
>> b/xen/arch/arm/include/asm/mem_access.h
>> index 35ed0ad154..2f73172e39 100644
>> --- a/xen/arch/arm/include/asm/mem_access.h
>> +++ b/xen/arch/arm/include/asm/mem_access.h
>> @@ -17,6 +17,7 @@
>>   #ifndef _ASM_ARM_MEM_ACCESS_H
>>   #define _ASM_ARM_MEM_ACCESS_H
>>   +#include <xen/types.h>
> 
> Can you explain why this is needed?

Without the inclusion of xen/types header NULL would be undefined.

> Style: Newline here please.
> 
>>   static inline
>>   bool p2m_mem_access_emulate_check(struct vcpu *v,
>>                                     const struct vm_event_st *rsp)
>> @@ -35,12 +36,20 @@ static inline bool 
>> p2m_mem_access_sanity_check(struct domain *d)
>>    * Send mem event based on the access. Boolean return value 
>> indicates if trap
>>    * needs to be injected into guest.
>>    */
>> +#ifdef CONFIG_MEM_ACCESS
>>   bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct 
>> npfec npfec);
>>     struct page_info*
>>   p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
>>                                     const struct vcpu *v);
>> +#else
>>   +static inline bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, 
>> const struct npfec npfec) {return false;}
> 
> Coding style: The line is well over the 80 characters limit. Also we 
> don't tend to provide the implementation of the stub in the single line 
> if it is more than {}. So "{return false;}" should look like:
> 
> {
>    return false;
> }
> 
>> +
>> +static inline struct page_info*
>> +p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
>> +                                  const struct vcpu *v) {return 
>> NULL;}
> 
> Ditto.
> 
>> +#endif /*CONFIG_MEM_ACCESS*/
>>   #endif /* _ASM_ARM_MEM_ACCESS_H */
>>     /*

Thanks for the feedback, I will soon provide the new version of the 
patch with the requested stylistic changes and a clearer description.
-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)


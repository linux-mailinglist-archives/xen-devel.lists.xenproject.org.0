Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFBD78ECED
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 14:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593837.926947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbgcy-0003us-Pt; Thu, 31 Aug 2023 12:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593837.926947; Thu, 31 Aug 2023 12:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbgcy-0003sk-Mp; Thu, 31 Aug 2023 12:18:24 +0000
Received: by outflank-mailman (input) for mailman id 593837;
 Thu, 31 Aug 2023 12:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shXB=EQ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qbgcx-0003se-BW
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 12:18:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7832acdf-47f8-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 14:18:19 +0200 (CEST)
Received: from [192.168.8.109] (unknown [151.36.0.213])
 by support.bugseng.com (Postfix) with ESMTPSA id EEE784EE0738;
 Thu, 31 Aug 2023 14:18:17 +0200 (CEST)
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
X-Inumbo-ID: 7832acdf-47f8-11ee-9b0d-b553b5be7939
Message-ID: <35401207-544a-156c-85ee-20e33a78f3a7@bugseng.com>
Date: Thu, 31 Aug 2023 14:18:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 12/13] xen: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <6ef4634e273a89582299061f1d14346572bf1d47.1693228255.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308281548580.6458@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2308281548580.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/23 00:51, Stefano Stabellini wrote:
> On Mon, 28 Aug 2023, Simone Ballarin wrote:
>> Move or amended inclusion guards to address violations of
>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>> to prevent the contents of a header file being included more than
>> once").
>>
>> Inclusion guards must appear at the beginning of the headers
>> (comments are permitted anywhere) and the #if directive cannot
>> be used for other checks.
>>
>> Mechanical change.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> ---
>>   xen/include/xen/err.h       | 4 +++-
>>   xen/include/xen/pci_ids.h   | 5 +++++
>>   xen/include/xen/softirq.h   | 4 +++-
>>   xen/include/xen/unaligned.h | 7 ++++---
>>   xen/include/xen/vmap.h      | 4 +++-
>>   5 files changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
>> index 2f29b57d28..a6323d82d7 100644
>> --- a/xen/include/xen/err.h
>> +++ b/xen/include/xen/err.h
>> @@ -1,5 +1,6 @@
>> -#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
>> +#if !defined(__XEN_ERR_H__)
>>   #define __XEN_ERR_H__
>> +#if !defined(__ASSEMBLY__)
> 
> The original pattern was also guarding the header file sufficiently,
> protecting it from double-inclusion. In fact, it is posing stricter
> restrictions than usual (not laxer). This change is unnecessary?

The MISRA directive asks to use one of the two following forms:

<start-of-file>
#if !defined ( identifier )
#define identifier
/* Contents of file */
#endif
<end-of-file>

<start-of-file>
#ifndef identifier
#define identifier
/* Contents of file */
#endif
<end-of-file>

I do not see any reason for deviating, but if you ask that, I can do it.

> 
> 
>>   #include <xen/compiler.h>
>>   #include <xen/errno.h>
>> @@ -54,4 +55,5 @@ static inline int __must_check PTR_RET(const void *ptr)
>>   	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
>>   }
>>   
>> +#endif /* __ASSEMBLY__ */
>>   #endif /* __XEN_ERR_H__ */
>> diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
>> index e798477a7e..1a739d4c92 100644
>> --- a/xen/include/xen/pci_ids.h
>> +++ b/xen/include/xen/pci_ids.h
>> @@ -1,3 +1,6 @@
>> +#ifndef __XEN_PCI_IDS_H__
>> +#define __XEN_PCI_IDS_H__
>> +
>>   #define PCI_VENDOR_ID_AMD                0x1022
>>   
>>   #define PCI_VENDOR_ID_NVIDIA             0x10de
>> @@ -11,3 +14,5 @@
>>   #define PCI_VENDOR_ID_BROADCOM           0x14e4
>>   
>>   #define PCI_VENDOR_ID_INTEL              0x8086
>> +
>> +#endif /* __XEN_PCI_IDS_H__ */
>> diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
>> index 33d6f2ecd2..092ec733b7 100644
>> --- a/xen/include/xen/softirq.h
>> +++ b/xen/include/xen/softirq.h
>> @@ -1,5 +1,6 @@
>> -#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
>> +#if !defined(__XEN_SOFTIRQ_H__)
>>   #define __XEN_SOFTIRQ_H__
>> +#if !defined(__ASSEMBLY__)
> 
> same here
> 
> 
>>   /* Low-latency softirqs come first in the following list. */
>>   enum {
>> @@ -40,4 +41,5 @@ void cpu_raise_softirq_batch_finish(void);
>>    */
>>   void process_pending_softirqs(void);
>>   
>> +#endif /* __ASSEMBLY__ */
>>   #endif /* __XEN_SOFTIRQ_H__ */
>> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
>> index 0a2b16d05d..45f03b3f1b 100644
>> --- a/xen/include/xen/unaligned.h
>> +++ b/xen/include/xen/unaligned.h
>> @@ -3,13 +3,14 @@
>>    * without faulting, and at least reasonably efficiently.  Other architectures
>>    * will need to have a custom asm/unaligned.h.
>>    */
>> -#ifndef __ASM_UNALIGNED_H__
>> -#error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
>> -#endif
>>   
>>   #ifndef __XEN_UNALIGNED_H__
>>   #define __XEN_UNALIGNED_H__
>>   
>> +#ifndef __ASM_UNALIGNED_H__
>> +#error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
>> +#endif
>> +
>>   #ifdef __XEN__
>>   #include <xen/types.h>
>>   #include <asm/byteorder.h>
>> diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
>> index b0f7632e89..7a61dea54a 100644
>> --- a/xen/include/xen/vmap.h
>> +++ b/xen/include/xen/vmap.h
>> @@ -1,5 +1,6 @@
>> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
>> +#if !defined(__XEN_VMAP_H__)
>>   #define __XEN_VMAP_H__
>> +#if defined(VMAP_VIRT_START)
> 
> same here
> 
> 
>>   #include <xen/mm-frame.h>
>>   #include <xen/page-size.h>
>> @@ -38,4 +39,5 @@ static inline void vm_init(void)
>>       vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>>   }
>>   
>> +#endif /* VMAP_VIRT_START */
>>   #endif /* __XEN_VMAP_H__ */
>> -- 
>> 2.34.1
>>
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)



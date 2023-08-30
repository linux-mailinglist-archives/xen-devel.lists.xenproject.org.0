Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0B78D6F2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593077.925984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbN2p-0006SK-L6; Wed, 30 Aug 2023 15:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593077.925984; Wed, 30 Aug 2023 15:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbN2p-0006PO-ID; Wed, 30 Aug 2023 15:23:47 +0000
Received: by outflank-mailman (input) for mailman id 593077;
 Wed, 30 Aug 2023 15:23:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtsd=EP=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qbN2n-0006PI-VH
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:23:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 354c9d2b-4749-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 17:23:44 +0200 (CEST)
Received: from [192.168.8.109] (unknown [151.38.20.102])
 by support.bugseng.com (Postfix) with ESMTPSA id 0C4904EE0738;
 Wed, 30 Aug 2023 17:23:43 +0200 (CEST)
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
X-Inumbo-ID: 354c9d2b-4749-11ee-8783-cb3800f73035
Message-ID: <acbb4816-139d-ebcc-1a86-e38ab7ba9c1f@bugseng.com>
Date: Wed, 30 Aug 2023 17:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 07/13] x86/asm: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <c5b6c3b7824d620b341c72c8d5dde5f5fce17dec.1693228255.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308281529400.6458@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2308281529400.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/23 00:30, Stefano Stabellini wrote:
> On Mon, 28 Aug 2023, Simone Ballarin wrote:
>> Add or move inclusion guards to address violations of
>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>> to prevent the contents of a header file being included more than
>> once").
>>
>> Inclusion guards must appear at the beginning of the headers
>> (comments are permitted anywhere).
>>
>> The text of the beggining comment of cpufeatures.h has been changed
>> to match the deviation in automation/eclair_analysis/ECLAIR/deviations.ecl,
>> moreover this new formulation is already used in other files.
> 
> I don't think it is a good idea to do this kind of textual matching.
> Instead we should use the format introduced by safe.json, e.g.
> SAF-1-safe
> 

I agree. I will use a comment-based deviation.

> 
>> Mechanical change.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> ---
>>   xen/arch/x86/include/asm/compat.h      | 5 +++++
>>   xen/arch/x86/include/asm/cpufeatures.h | 4 +---
>>   xen/arch/x86/include/asm/efibind.h     | 5 +++++
>>   xen/arch/x86/include/asm/hypercall.h   | 6 +++---
>>   4 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/compat.h b/xen/arch/x86/include/asm/compat.h
>> index 818cad87db..3d3891d061 100644
>> --- a/xen/arch/x86/include/asm/compat.h
>> +++ b/xen/arch/x86/include/asm/compat.h
>> @@ -2,6 +2,9 @@
>>    * compat.h
>>    */
>>   
>> +#ifndef __ASM_X86_COMPAT_H__
>> +#define __ASM_X86_COMPAT_H__
>> +
>>   #ifdef CONFIG_COMPAT
>>   
>>   #define COMPAT_BITS_PER_LONG 32
>> @@ -18,3 +21,5 @@ int switch_compat(struct domain *);
>>   #include <xen/errno.h>
>>   static inline int switch_compat(struct domain *d) { return -EOPNOTSUPP; }
>>   #endif
>> +
>> +#endif /* __ASM_X86_COMPAT_H__ */
>> diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
>> index da0593de85..1dfdd478ab 100644
>> --- a/xen/arch/x86/include/asm/cpufeatures.h
>> +++ b/xen/arch/x86/include/asm/cpufeatures.h
>> @@ -1,6 +1,4 @@
>> -/*
>> - * Explicitly intended for multiple inclusion.
>> - */
>> +/* This file is legitimately included multiple times */
>>   
>>   #include <xen/lib/x86/cpuid-autogen.h>
>>   
>> diff --git a/xen/arch/x86/include/asm/efibind.h b/xen/arch/x86/include/asm/efibind.h
>> index bce02f3707..f2eb8b5496 100644
>> --- a/xen/arch/x86/include/asm/efibind.h
>> +++ b/xen/arch/x86/include/asm/efibind.h
>> @@ -1,2 +1,7 @@
>> +#ifndef __ASM_X86_EFIBIND_H__
>> +#define __ASM_X86_EFIBIND_H__
>> +
>>   #include <xen/types.h>
>>   #include <asm/x86_64/efibind.h>
>> +
>> +#endif /* __ASM_X86_EFIBIND_H__ */
>> diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
>> index ec2edc771e..2ade5d71b8 100644
>> --- a/xen/arch/x86/include/asm/hypercall.h
>> +++ b/xen/arch/x86/include/asm/hypercall.h
>> @@ -2,13 +2,13 @@
>>    * asm-x86/hypercall.h
>>    */
>>   
>> +#ifndef __ASM_X86_HYPERCALL_H__
>> +#define __ASM_X86_HYPERCALL_H__
>> +
>>   #ifndef __XEN_HYPERCALL_H__
>>   #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>>   #endif
>>   
>> -#ifndef __ASM_X86_HYPERCALL_H__
>> -#define __ASM_X86_HYPERCALL_H__
>> -
>>   #include <xen/types.h>
>>   #include <public/physdev.h>
>>   #include <public/event_channel.h>
>> -- 
>> 2.34.1
>>

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)



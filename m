Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C0C85FB7B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 15:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684455.1064314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdAIH-0008V2-UF; Thu, 22 Feb 2024 14:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684455.1064314; Thu, 22 Feb 2024 14:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdAIH-0008TU-QN; Thu, 22 Feb 2024 14:43:25 +0000
Received: by outflank-mailman (input) for mailman id 684455;
 Thu, 22 Feb 2024 14:43:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6628=J7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rdAIG-0008TO-Fi
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 14:43:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9f4828c-d190-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 15:43:22 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 849064EE0737;
 Thu, 22 Feb 2024 15:43:21 +0100 (CET)
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
X-Inumbo-ID: b9f4828c-d190-11ee-98f5-efadbce2ee36
MIME-Version: 1.0
Date: Thu, 22 Feb 2024 15:43:21 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, julien@xen.org, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
In-Reply-To: <4b121e48-9541-4b53-8352-939c904f4f1c@suse.com>
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
 <d90d98b6-508b-4a2a-ab6a-74a9828a5b94@suse.com>
 <45509cb67ecee3f690b5784489b5ccb4@bugseng.com>
 <1743b4248d30a4e8b68a150c25724caa@bugseng.com>
 <2ff52df443fc080875fd05614d89764d@bugseng.com>
 <4b121e48-9541-4b53-8352-939c904f4f1c@suse.com>
Message-ID: <be36b86a08f7573b93edc4c03aff93ef@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>>>> 
>>>>>> --- a/xen/arch/arm/include/asm/page.h
>>>>>> +++ b/xen/arch/arm/include/asm/page.h
>>>>>> @@ -123,6 +123,7 @@
>>>>>> 
>>>>>>  #ifndef __ASSEMBLY__
>>>>>> 
>>>>>> +#include <public/grant_table.h>
>>>>> 
>>>>> This is a no-go, imo (also on x86): Adding this include here
>>>>> effectively
>>>>> means that nearly every CU will have a dependency on that header, 
>>>>> no
>>>>> matter that most are entirely agnostic of grants. Each arch has a
>>>>> grant_table.h - is there any reason the new, grant-specific helper
>>>>> can't
>>>>> be put there?
>>>>> 
>>>> 
>>>> I would have to test, but I think that can be done
>>>> 
>>> 
>>> The only blocker so far is that this triggers a build error due to a
>>> circular dependency between xen/mm.h and asm/flushtlb.h on x86. Also
>>> found some earlier evidence [1] that there are some oddities around
>>> asm/flushtlb's inclusion.
>>> 
>>> [1]
>>> https://lore.kernel.org/xen-devel/20200318210540.5602-1-andrew.cooper3@citrix.com/
>> 
>> There could be a way of untangling asm/flushtlb.h from xen/mm.h, by
>> moving "accumulate_tlbflush" and "filtered_flush_tlb_mask" introduced 
>> by
>> commit 80943aa40e30 ("replace tlbflush check and operation with inline
>> functions") [1].
>> However, these function should then be part of a generic 
>> xen/flushtlb.h
>> header, since they are used in common code (e.g., common/page_alloc) 
>> and
>> a bunch of common code source files should move their includes (see 
>> [2]
>> for a partial non-working patch). Do you feel that this is a feasible
>> route?
> 
> Yeah, introducing xen/flushtlb.h to hold these sounds pretty sensible.
> 

There is some shuffling of includes to be done to get it to build, which 
I'm still trying to address. Most problems are down to the use of struct 
page_info in page_set_tlbflush_timestamp in x86/.*/asm/flushtlb.h which 
then prompts the inclusion asm/mm.h probably.

>> In passing it should be noted that the header ordering in
>> x86/alternative.c is not the one usually prescribed, so that may be
>> taken care of as well.
> 
> I'm afraid I don't understand this remark.
> 

I just meant to say that this

#include <xen/delay.h>
#include <xen/types.h>
#include <asm/apic.h>
#include <asm/endbr.h>
#include <asm/processor.h>
#include <asm/alternative.h>
#include <xen/init.h>
#include <asm/setup.h>
#include <asm/system.h>
#include <asm/traps.h>
#include <asm/nmi.h>
#include <asm/nops.h>
#include <xen/livepatch.h>

is not the usual order of xen/*.h then asm/*.h and there is no comment 
justifying that ordering. So in the process of including asm/flushtlb.h 
here the inclusion order can be tidied up (or also indipendently), 
unless there is some reason I'm missing that disallows it.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)


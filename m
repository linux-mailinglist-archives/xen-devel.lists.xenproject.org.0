Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C028BA9EF
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 11:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716303.1118398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2pHq-0006Q1-9I; Fri, 03 May 2024 09:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716303.1118398; Fri, 03 May 2024 09:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2pHq-0006Nx-6Q; Fri, 03 May 2024 09:33:02 +0000
Received: by outflank-mailman (input) for mailman id 716303;
 Fri, 03 May 2024 09:33:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s2pHo-0006Nr-SF
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 09:33:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s2pHm-00011D-1X; Fri, 03 May 2024 09:32:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s2pHl-0003my-NU; Fri, 03 May 2024 09:32:57 +0000
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
	bh=geCwVCE6Vmcs1nQ3ULn3lQtitAxH+3tQFuZxraC/tgs=; b=t0PHbhsqNRxHHgfQX9+8B/ZRC2
	bGmX7NM2v2IeLt4Ok55ER16fUsnHB/Yc5cKvZ3NLIe4eo1QIk0NpH681DLP1IfMvrkOeIqaG1YGxB
	rzD5KpJ1nK4LWSU3z8f91v58MWM9jCPMaptZ+DJhhg8wMiuZrUkt8QCgyJQGwsg+vUQk=;
Message-ID: <47033435-c621-40f6-b5a9-a385f323f382@xen.org>
Date: Fri, 3 May 2024 10:32:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/mem_access: address violations of MISRA C: 2012
 Rule 8.4
Content-Language: en-GB
To: alessandro.zucchelli@bugseng.com, Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, volodymyr_babchuk@epam.com
References: <a3d4e07433932624266ac9b675daf0b70734696d.1714405386.git.alessandro.zucchelli@bugseng.com>
 <08eb5444-2bf0-48c0-9fcb-d8e4b801e8fa@suse.com>
 <834460aca34e6167a3c4620616c145b8@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <834460aca34e6167a3c4620616c145b8@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 03/05/2024 08:09, Alessandro Zucchelli wrote:
> On 2024-04-29 17:58, Jan Beulich wrote:
>> On 29.04.2024 17:45, Alessandro Zucchelli wrote:
>>> Change #ifdef CONFIG_MEM_ACCESS by OR-ing defined(CONFIG_ARM),
>>> allowing asm/mem_access.h to be included in all ARM build 
>>> configurations.
>>> This is to address the violation of MISRA C: 2012 Rule 8.4 which states:
>>> "A compatible declaration shall be visible when an object or function
>>> with external linkage is defined". Functions p2m_mem_access_check
>>> and p2m_mem_access_check_and_get_page when CONFIG_MEM_ACCESS is not
>>> defined in ARM builds don't have visible declarations in the file
>>> containing their definitions.
>>>
>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>> ---
>>>  xen/include/xen/mem_access.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
>>> index 87d93b31f6..ec0630677d 100644
>>> --- a/xen/include/xen/mem_access.h
>>> +++ b/xen/include/xen/mem_access.h
>>> @@ -33,7 +33,7 @@
>>>   */
>>>  struct vm_event_st;
>>>
>>> -#ifdef CONFIG_MEM_ACCESS
>>> +#if defined(CONFIG_MEM_ACCESS) || defined(CONFIG_ARM)
>>>  #include <asm/mem_access.h>
>>>  #endif
>>
>> This doesn't look quite right. If Arm supports mem-access, why would it
>> not set MEM_ACCESS=y? Whereas if it's only stubs that Arm supplies, then
>> those would better move here, thus eliminating the need for a per-arch
>> stub header (see what was e.g. done for numa.h). This way RISC-V and PPC
>> (and whatever is to come) would then be taken care of as well.
>>
> ARM does support mem-access, so I don't think this is akin to the 
> changes done to handle numa.h.
> ARM also allows users to set MEM_ACCESS=n (e.g. 
> xen/arch/arm/configs/tiny64_defconfig) and builds just fine; however, 
> the implementation file mem_access.c is compiled unconditionally in 
> ARM's makefile, hence why the violation was spotted.
> This is a bit unusual, so I was also hoping to get some feedback from 
> mem-access maintainers as to why this discrepancy from x86 exists. I 
> probably should have also included some ARM maintainers as well, so I'm 
> going to loop them in now.
> 
> An alternative option I think is to make the compilation of arm's 
> mem_access.c conditional on CONFIG_MEM_ACCESS (as for x86/mm and common).

I can't think of a reason to have mem_access.c unconditional compiled 
in. So I think it should be conditional like on x86.

Cheers,

-- 
Julien Grall


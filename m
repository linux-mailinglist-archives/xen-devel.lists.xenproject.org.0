Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8D08144C8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 10:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654995.1022612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4j3-0001w8-Rz; Fri, 15 Dec 2023 09:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654995.1022612; Fri, 15 Dec 2023 09:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4j3-0001tn-PN; Fri, 15 Dec 2023 09:43:21 +0000
Received: by outflank-mailman (input) for mailman id 654995;
 Fri, 15 Dec 2023 09:43:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rE4j2-0001tf-LZ
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 09:43:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rE4is-0001yt-Rl; Fri, 15 Dec 2023 09:43:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rE4is-0001Cm-Lb; Fri, 15 Dec 2023 09:43:10 +0000
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
	bh=Ryc6jrnleTQwhwz3wqjr2Yg2T0bwnh4tw8JpGfF8ofU=; b=mQHlGzRvhgtYUqiZuylkfKOlK+
	kSrR3gCprkKliUGTW+1AdSRlaLvLWlMJbjHJlR+BSDd1+1jXGi24kmctnQ8T5/uPmyo/Y7Sk1Ae7h
	f3T1JWQm3jh8t+fJSynz+HpmFxCYwFcYVYS4A/tcAATR1XdHTWRQMKs/yBXGIGfatWHc=;
Message-ID: <2879189b-eea3-48c4-86e4-baed69e6a8f0@xen.org>
Date: Fri, 15 Dec 2023 09:43:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@cloud.com>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
 <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
 <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com>
 <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
 <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com>
 <9fcc73f0-fc9c-4f4f-a431-f1f3b0df1b6a@xen.org>
 <4a1f86c7-6643-4fd1-ba1c-a4f86abb63f3@suse.com>
 <CA+zSX=YHW3kGFroNDzwQg=EhEe3F_fw3gCd_9W+P2UxC7+g+0A@mail.gmail.com>
 <0166dd5b-c12e-40d8-88a6-1f3c97bcf2e0@xen.org>
 <3b2f1699-d58c-40d8-af36-caef70064601@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3b2f1699-d58c-40d8-af36-caef70064601@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 15/12/2023 08:03, Jan Beulich wrote:
> On 14.12.2023 20:10, Julien Grall wrote:
>> On 14/12/2023 14:15, George Dunlap wrote:
>>> But I do think that it's fair to ask Julien to think about a suitable
>>> wording, since the comment is in a sense to remind him (or other ARM
>>> maintainers) what's needed, and since the eventual solution will be
>>> something to do with the ARM code and architecture anyway.
>>
>> The comment is for anyone using !NUMA (i.e. all architectures but x86)
>> :). What about the following (this is Nicola's patch with the comments
>> reworked):
> 
> This clearly is better, yet then ...
> 
>> --- a/xen/arch/arm/include/asm/numa.h
>> +++ b/xen/arch/arm/include/asm/numa.h
>> @@ -2,8 +2,9 @@
>>    #define __ARCH_ARM_NUMA_H
>>
>>    #include <xen/mm.h>
>> +#include <xen/types.h>
>>
>> -typedef u8 nodeid_t;
>> +typedef uint8_t nodeid_t;
>>
>>    #ifndef CONFIG_NUMA
>>
>> @@ -11,12 +12,6 @@ typedef u8 nodeid_t;
>>    #define cpu_to_node(cpu) 0
>>    #define node_to_cpumask(node)   (cpu_online_map)
>>
>> -/*
>> - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
>> - * is required because the dummy helpers are using it.
>> - */
>> -extern mfn_t first_valid_mfn;
>> -
>>    /* XXX: implement NUMA support */
>>    #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
>>    #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>> diff --git a/xen/arch/ppc/include/asm/numa.h
>> b/xen/arch/ppc/include/asm/numa.h
>> index 7fdf66c3da74..888de2dbd1eb 100644
>> --- a/xen/arch/ppc/include/asm/numa.h
>> +++ b/xen/arch/ppc/include/asm/numa.h
>> @@ -1,8 +1,8 @@
>>    #ifndef __ASM_PPC_NUMA_H__
>>    #define __ASM_PPC_NUMA_H__
>>
>> -#include <xen/types.h>
>>    #include <xen/mm.h>
>> +#include <xen/types.h>
>>
>>    typedef uint8_t nodeid_t;
>>
>> @@ -10,12 +10,6 @@ typedef uint8_t nodeid_t;
>>    #define cpu_to_node(cpu) 0
>>    #define node_to_cpumask(node)   (cpu_online_map)
>>
>> -/*
>> - * TODO: make first_valid_mfn static when NUMA is supported on PPC, this
>> - * is required because the dummy helpers are using it.
>> - */
>> -extern mfn_t first_valid_mfn;
>> -
>>    /* XXX: implement NUMA support */
>>    #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
>>    #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index 9b5df74fddab..d874525916ea 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -255,8 +255,10 @@ static PAGE_LIST_HEAD(page_broken_list);
>>     */
>>
>>    /*
>> - * first_valid_mfn is exported because it is use in ARM specific NUMA
>> - * helpers. See comment in arch/arm/include/asm/numa.h.
>> + * first_valid_mfn is exported because it is used when !CONFIG_NUMA.
>> + *
>> + * TODO: Consider if we can conditionally export first_valid_mfn based
>> + * on whether NUMA is selected.
>>     */
>>    mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
>>
>> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
>> index 3d9b2d05a5c8..a13a9a46ced7 100644
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -118,6 +118,8 @@ int destroy_xen_mappings(unsigned long s, unsigned
>> long e);
>>    /* Retrieve the MFN mapped by VA in Xen virtual address space. */
>>    mfn_t xen_map_to_mfn(unsigned long va);
>>
>> +extern mfn_t first_valid_mfn;
>> +
>>    /*
>>     * Create only non-leaf page table entries for the
>>     * page range in Xen virtual address space.
> 
> ... I still disagree with the placement here (should be xen/numa.h imo),

I don't care too much about which header is used. So I am ok with numa.h 
if this is what you really want. However...

> and I still don't see why we can't carry out the TODO right away, if we
> have to touch all of this anyway. If it's really too much to ask from
> the original contributor, I can certainly see about making a patch myself

There are a few reasons I didn't update with that approach or want to 
ask Nicola for this:
   1. I assume this will be a macro and it is not clear to me whether 
Eclair would be able to detect the visibility change based on the config
   2. IMHO, this is obfuscating a bit more the code
   3. I don't see why we want to special case first_valid_mfn. I am sure 
we have other external variables in the same situation.

So if any solution needs to came up, then it needs to be generic, and I 
fear this is going to be yet another lengthy work which is not worth it 
for this case.

> (and I've now added this to my short-term TODO list).

Thanks. But as I wrote above, I am not sure I agree such proposal. Let 
see what the code looks like.

Cheers,


-- 
Julien Grall


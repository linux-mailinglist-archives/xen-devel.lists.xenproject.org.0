Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540BA78D60A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592909.925755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKuV-0008Fw-Cc; Wed, 30 Aug 2023 13:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592909.925755; Wed, 30 Aug 2023 13:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKuV-0008D6-9a; Wed, 30 Aug 2023 13:07:03 +0000
Received: by outflank-mailman (input) for mailman id 592909;
 Wed, 30 Aug 2023 13:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtsd=EP=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qbKuU-0008D0-0P
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:07:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ac70f8b-4736-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 15:07:00 +0200 (CEST)
Received: from [192.168.8.109] (unknown [151.82.72.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 707F24EE0738;
 Wed, 30 Aug 2023 15:06:58 +0200 (CEST)
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
X-Inumbo-ID: 1ac70f8b-4736-11ee-9b0d-b553b5be7939
Message-ID: <519a036a-80b7-e55d-48c4-c1053bf6e190@bugseng.com>
Date: Wed, 30 Aug 2023 15:06:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 03/13] xen/arm: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, consulting@bugseng.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 Julien Grall <julien.grall.oss@gmail.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <2d37ca48cf6556ebfcb4b17cddd2446fa549f689.1693228255.git.simone.ballarin@bugseng.com>
 <CAJ=z9a2hnjCAkGN_YtCQRh8ZcyMMawxBhF8LOwgrQ5-nML1chg@mail.gmail.com>
 <8d82e827-6ad9-4695-5ec0-65c65b79b055@bugseng.com>
 <73b7a5e5-9fd8-27ef-b143-161d1b0ab7b0@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <73b7a5e5-9fd8-27ef-b143-161d1b0ab7b0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/08/23 15:01, Jan Beulich wrote:
> On 30.08.2023 14:53, Simone Ballarin wrote:
>> On 29/08/23 00:10, Julien Grall wrote:
>>> On Mon, 28 Aug 2023 at 09:20, Simone Ballarin <simone.ballarin@bugseng.com>
>>> wrote:
>>>> --- a/xen/arch/arm/include/asm/hypercall.h
>>>> +++ b/xen/arch/arm/include/asm/hypercall.h
>>>> @@ -1,10 +1,10 @@
>>>> +#ifndef __ASM_ARM_HYPERCALL_H__
>>>> +#define __ASM_ARM_HYPERCALL_H__
>>>> +
>>>>    #ifndef __XEN_HYPERCALL_H__
>>>>    #error "asm/hypercall.h should not be included directly - include
>>>> xen/hypercall.h instead"
>>>>    #endif
>>>>
>>>> -#ifndef __ASM_ARM_HYPERCALL_H__
>>>> -#define __ASM_ARM_HYPERCALL_H__
>>>> -
>>>
>>>
>>> I understand that you are trying to fix a misra violation. However, this
>>> feels like it was done on purpose.
>>>
>>> With the new change, you would not always check that the file were included
>>> at the correct place. I am not against this change but this ought to be
>>> explained.
>> I don't think the semantics have changed. Please correct me if I'm wrong.
>>
>> With this change, the only situation where the check is not performed is
>> when __ASM_ARM_HYPERCALL_H__ is defined (i.e. the file has already been
>> successfully included). This implies that if __ASM_ARM_HYPERCALL_H__ is
>> defined, then __XEN_HYPERCALL_H__ is also defined, so the check would be
>> useless.
>>
>> The same thing happened with the code before the change: if I include
>> the file after xen/hypercall.h, the check will always succeed.
> 
> Hmm, I think you're right, but I draw a different conclusion: The check
> fails to work as intended. And this can only be repaired without your
> adjustment.
> 

Ok, I will just deviate these cases.

> Jan

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)



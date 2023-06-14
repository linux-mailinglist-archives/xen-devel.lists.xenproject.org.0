Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF72172FFD9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548765.856895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9QQW-0004p4-Vt; Wed, 14 Jun 2023 13:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548765.856895; Wed, 14 Jun 2023 13:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9QQW-0004nM-S0; Wed, 14 Jun 2023 13:20:44 +0000
Received: by outflank-mailman (input) for mailman id 548765;
 Wed, 14 Jun 2023 13:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/qP=CC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1q9QQV-0004nD-Kf
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:20:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 419f75eb-0ab6-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 15:20:39 +0200 (CEST)
Received: from [192.168.1.88] (unknown [176.206.20.8])
 by support.bugseng.com (Postfix) with ESMTPSA id E77CC4EE0738;
 Wed, 14 Jun 2023 15:20:37 +0200 (CEST)
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
X-Inumbo-ID: 419f75eb-0ab6-11ee-8611-37d641c3527e
Message-ID: <a143e693-b7d0-ebdc-e1d8-b8ce44f6f676@bugseng.com>
Date: Wed, 14 Jun 2023 15:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH] xen: fixed violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
 <42cb13a7-3b62-8d48-a1a1-3094a7bd07fa@suse.com>
 <f3fc1848-68ca-37a1-add2-e100b4773190@xen.org>
From: nicola <nicola.vetrini@bugseng.com>
In-Reply-To: <f3fc1848-68ca-37a1-add2-e100b4773190@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 13/06/23 11:44, Julien Grall wrote:
> Hi,
>
> On 13/06/2023 09:27, Jan Beulich wrote:
>> On 13.06.2023 09:42, Nicola Vetrini wrote:
>>> The xen sources contain several violations of Rule 3.1 from MISRA 
>>> C:2012,
>>> whose headline states:
>>> "The character sequences '/*' and '//' shall not be used within a 
>>> comment".
>>>
>>> Most of the violations are due to the presence of links to webpages 
>>> within
>>> C-style comment blocks, such as:
>>>
>>> xen/arch/arm/include/asm/smccc.h:37.1-41.3
>>> /*
>>>   * This file provides common defines for ARM SMC Calling Convention as
>>>   * specified in
>>>   * 
>>> http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
>>>   */
>>>
>>> In this case, we propose to deviate all of these occurrences with a
>>> project deviation to be captured by a tool configuration.
>>>
>>> There are, however, a few other violations that do not fall under this
>>> category, namely:
>>>
>>> 1. in file "xen/arch/arm/include/asm/arm64/flushtlb.h" we propose to
>>> avoid the usage of a nested comment;
>>> 2. in file "xen/common/xmalloc_tlsf.c" we propose to substitute the
>>> commented-out if statement with a "#if 0 .. #endif;
>>> 3. in file "xen/include/xen/atomic.h" and
>>> "xen/drivers/passthrough/arm/smmu-v3.c" we propose to split the C-style
>>> comment containing the nested comment into two doxygen comments, 
>>> clearly
>>> identifying the second as a code sample. This can then be captured 
>>> with a
>>> project deviation by a tool configuration.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> Changes:
>>> - Resending the patch with the right maintainers in CC.
>>
>> But without otherwise addressing comments already given, afaics. One 
>> more
>> remark:
>>
>>> --- a/xen/common/xmalloc_tlsf.c
>>> +++ b/xen/common/xmalloc_tlsf.c
>>> @@ -140,9 +140,10 @@ static inline void MAPPING_SEARCH(unsigned long 
>>> *r, int *fl, int *sl)
>>>           *fl = flsl(*r) - 1;
>>>           *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>>>           *fl -= FLI_OFFSET;
>>> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>>> -         *fl = *sl = 0;
>>> -         */
>>> +#if 0
>>> +        if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>>> +        fl = *sl = 0;
>>
>> You want to get indentation right here, and you don't want to lose
>> the indirection on fl.
>>
>>> +#endif
>>>           *r &= ~t;
>>>       }
>>>   }
>>
>> If you split this to 4 patches, leaving the URL proposal in just
>> the cover letter, then I think this one change (with the adjustments)
>> could go in right away. Similarly I expect the arm64/flushtlb.h
>> change could be ack-ed right away by an Arm maintainer.
>
> I actually dislike the proposal. In this case, the code is meant to 
> look like assembly code. I would replace the // with ;. Also, I would 
> like to keep the comment style in sync in arm32/flushtlb.h. So can 
> this be updated as well?
>
> Cheers,
>
Hi, Julien.

I'm not authorized to send patches about files in the arm32 tree, but 
surely the patch can be easily replicated in any place where it makes 
sense for consistency.

Regards,

   Nicola



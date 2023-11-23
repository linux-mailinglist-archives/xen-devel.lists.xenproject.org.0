Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB557F5C45
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639504.996963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66ux-0006LJ-Nt; Thu, 23 Nov 2023 10:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639504.996963; Thu, 23 Nov 2023 10:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r66ux-0006J3-Jx; Thu, 23 Nov 2023 10:26:43 +0000
Received: by outflank-mailman (input) for mailman id 639504;
 Thu, 23 Nov 2023 10:26:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r66uw-0006It-Ia
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:26:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r66uq-0007MY-2q; Thu, 23 Nov 2023 10:26:36 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.16.119]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r66up-0006Bl-SL; Thu, 23 Nov 2023 10:26:36 +0000
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
	bh=R+C8Qv+oF/FwDhE36XWAcXfaReRxTxeol2uj6t+X49I=; b=klvH7pweYRc2sxEcKBowxfV9Tr
	UNdAfJbFxbaTxBZkso6xt3AquXyOaFJsd5rsYPV1z0A5QmahXp+eTxsK7yWOqmulHU5p0Nadl4TMg
	mXv3TDPJ88RVYzQGcmUoewBkwpbF6uWy5yRQf88DPvWLEL49gDTpgcPMS7Z5gJCiE+YA=;
Message-ID: <1f5d5e07-1b34-4e4d-8904-e5463a2db919@xen.org>
Date: Thu, 23 Nov 2023 10:26:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <23575a74-2a8d-41d3-a71a-420f6a6007c8@suse.com>
 <2123235ad5e5d18c89369b6cc1be3a4c@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2123235ad5e5d18c89369b6cc1be3a4c@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicola,

On 23/11/2023 09:25, Nicola Vetrini wrote:
> On 2023-11-23 09:57, Jan Beulich wrote:
>> On 16.11.2023 10:08, Nicola Vetrini wrote:
>>> The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
>>> by the asmlinkage pseudo-attribute, for the sake of uniformity.
>>>
>>> Add missing 'xen/compiler.h' #include-s where needed.
>>>
>>> The text in docs/misra/deviations.rst and docs/misra/safe.json
>>> is modified to reflect this change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> This patch should be applied after patch 2 of this series.
>>> The request made by Julien to update the wording is
>>> contained in the present patch.
>>
>> Along with this request he supplied you with an ack. Did you drop that
>> for a particular reason, or did you simply forget to record it here?
>>
> 
> I forgot and added it in a reply.
> 
>>> --- a/xen/arch/x86/boot/reloc.c
>>> +++ b/xen/arch/x86/boot/reloc.c
>>> @@ -28,6 +28,7 @@ asm (
>>>
>>>  #include "defs.h"
>>>
>>> +#include <xen/compiler.h>
>>>  #include <xen/kconfig.h>
>>>  #include <xen/multiboot.h>
>>>  #include <xen/multiboot2.h>
>>> @@ -348,9 +349,8 @@ static multiboot_info_t *mbi2_reloc(uint32_t 
>>> mbi_in, uint32_t video_out)
>>>      return mbi_out;
>>>  }
>>>
>>> -/* SAF-1-safe */
>>> -void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
>>> -                      uint32_t video_info)
>>> +void *asmlinkage __stdcall reloc(uint32_t magic, uint32_t in,
>>> +                                 uint32_t trampoline, uint32_t 
>>> video_info)
>>>  {
>>
>> One purpose of asmlinkage is to possibly alter the default C calling 
>> convention
>> to some more easy to use in assembly code. At least over a period of 
>> time Linux
>> for example used that on ix86. If we decided to do something like 
>> this, there
>> would be a collision with __stdcall. Hence I'm not convinced we can put
>> asmlinkage here. At which point the complete removal of SAF-1-safe 
>> also would
>> need dropping.
>>
> 
> Ok, so we can keep SAF-1 here and below and leave the wording in 
> deviations.rst and safe.sjon as is.

I guess you mean without this patch applied and not including my 
proposed rewording (i.e. to deprecated SAF-1)?

If so, then we are back to the initial concern I raised. We would have 
two ways to address the deviation. From a user perspective, it would be 
unclear which one should be used.

In particular, I would rather favor asmlinkage whenever it is possible 
and only use SAF-1 when it is not possible to use it (like here).

Another possibility would be to deviate __stdcall like we do for 
asmlinkage (I will let Jan confirm if this is desirable). With this 
approach, there is less ambiguity when to use either of them.

Cheers,

-- 
Julien Grall


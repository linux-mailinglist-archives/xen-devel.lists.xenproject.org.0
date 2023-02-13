Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F1D694784
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 14:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494523.764611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZIc-0005Kl-TK; Mon, 13 Feb 2023 13:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494523.764611; Mon, 13 Feb 2023 13:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZIc-0005Io-QU; Mon, 13 Feb 2023 13:55:18 +0000
Received: by outflank-mailman (input) for mailman id 494523;
 Mon, 13 Feb 2023 13:55:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pRZIb-0005Ic-TV
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 13:55:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pRZIY-00075e-W7; Mon, 13 Feb 2023 13:55:14 +0000
Received: from [54.239.6.185] (helo=[192.168.15.251])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pRZIY-0004wX-P8; Mon, 13 Feb 2023 13:55:14 +0000
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
	bh=7epD5TH6uwNTCfJb+oHBHOHk9U0051bjFRXD+mHLCow=; b=a6JklOfIO8W6j7l8rLM/L6UQrB
	OFgUYbIEiW943NmkWZMmPAn6yCN/lsYY0ubTQmQN2QqulJchRQY2keRvTbd1nYEkwtEvalP42QsGk
	823gK75ypsHBXwgAcF2abY1sfN0FZCQRnVN6fTGI5uQGiIjXT3laaDSDoiQ7LnPMmliM=;
Message-ID: <7e6e7db2-de4e-90aa-bcb3-69327d496c1e@xen.org>
Date: Mon, 13 Feb 2023 13:55:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <64aba76d-1746-9f6c-109a-e8c3bf1e1b61@xen.org>
 <6ff62711-2826-72b9-5864-a37a56d8b74a@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6ff62711-2826-72b9-5864-a37a56d8b74a@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 13/02/2023 13:33, Andrew Cooper wrote:
> On 13/02/2023 1:19 pm, Julien Grall wrote:
>>
>>
>> On 13/02/2023 12:24, Jan Beulich wrote:
>>> On 03.02.2023 18:05, Oleksii Kurochko wrote:
>>>> --- a/xen/common/Kconfig
>>>> +++ b/xen/common/Kconfig
>>>> @@ -92,6 +92,12 @@ config STATIC_MEMORY
>>>>            If unsure, say N.
>>>>    +config GENERIC_DO_BUG_FRAME
>>>> +    bool
>>>> +    help
>>>> +      Generic do_bug_frame() function is needed to handle the type
>>>> of bug
>>>> +      frame and print an information about it.
>>>
>>> Generally help text for prompt-less functions is not very useful.
>>> Assuming
>>> it is put here to inform people actually reading the source file, I'm
>>> okay
>>> for it to be left here, but please at least drop the stray "an". I also
>>> think this may want moving up in the file, e.g. ahead of all the HAS_*
>>> controls (which, as you will notice, all have no help text either). Plus
>>> finally how about shorter and more applicable GENERIC_BUG_FRAME - after
>>> all what becomes generic is more than just do_bug_frame()?
>>>
>>>> --- /dev/null
>>>> +++ b/xen/common/bug.c
>>>> @@ -0,0 +1,88 @@
>>>> +#include <xen/bug.h>
>>>> +#include <xen/errno.h>
>>>> +#include <xen/types.h>
>>>> +#include <xen/kernel.h>
>>>
>>> Please order headers alphabetically unless there's anything preventing
>>> that from being done.
>>>
>>>> +#include <xen/string.h>
>>>> +#include <xen/virtual_region.h>
>>>> +
>>>> +#include <asm/processor.h>
>>>> +
>>>> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>>>
>>> I know Arm is using vaddr_t and RISC-V now also has it, but in UNIX-like
>>> environments that's redundant with "unsigned long", and it's also
>>> redundant with C99's uintptr_t. Hence when seeing the type I always
>>> wonder whether it's really a host virtual address which is meant (and
>>> not perhaps a guest one, which in principle could differ from the host
>>> one for certain guest types). In any event the existence of this type
>>> should imo not be a prereq to using this generic piece of infrastructure
>>
>> C spec aside, the use "unsigned long" is quite overloaded within Xen.
>> Although, this has improved since we introduced mfn_t/gfn_t.
>>
>> In the future, I could imagine us to also introduce typesafe for
>> vaddr_t, reducing further the risk to mix different meaning of
>> unsigned long.
>>
>> Therefore, I think the introduction of vaddr_t should be a prereq for
>> using the generic piece of infrastructure.
> 
> I'm with Jan on this.  vaddr_t is pure obfuscation, and you can do what
> you like with it in ARM, but you will find very firm objection to it
> finding its way into common or x86 code.

Talking about obfuscation...

42sh> ack "unsigned long addr" | wc -l
143

2/3 of this is on x86. Without looking at the code, it can be quite 
difficult to figure out if this is meant to a virtual/physical 
host/guest address.

> 
> virtual addresses are spelt 'unsigned long'.

That's ok so long there are no way to mistakenly mix some parameters. 
For instance in the past, the type of map_pages_to_xen() was:

int map_pages_to_xen(unsigned long virt,
                      unsigned long mfn,
                      unsigned long nr_mfns,
                      unsigned int flags)

Since then 'mfn' is now thankfully mfn_t... But before, it was easy to mix.

For sure, there are other way to do it like properly naming the 
variable... But using a type as the advantage that it could be checked a 
compilation.

I am open to other suggestions if you have a way to guarantee that 
mistake can be avoided.

Cheers,

-- 
Julien Grall


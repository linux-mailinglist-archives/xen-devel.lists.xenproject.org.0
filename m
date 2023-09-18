Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6845C7A472F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 12:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603893.941023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBa7-00041w-LW; Mon, 18 Sep 2023 10:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603893.941023; Mon, 18 Sep 2023 10:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBa7-0003ya-Ih; Mon, 18 Sep 2023 10:34:19 +0000
Received: by outflank-mailman (input) for mailman id 603893;
 Mon, 18 Sep 2023 10:34:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qiBa6-0003yS-Aa
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 10:34:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiBa3-0005aE-8T; Mon, 18 Sep 2023 10:34:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiBa3-0003QT-1j; Mon, 18 Sep 2023 10:34:15 +0000
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
	bh=gusPWsGpVLac4AT3P36gm9GD6FhIErT57NBbAKtV/CQ=; b=oH0Ar7QcAY3k+YUzLm5UsivEDu
	E9W+dlE9O4QEWofwbRMYhEz6eOKcVtb6Kit6i2Wju7gD95/kUGsu/fu7YMbEmN19VATi7y6KlfK+N
	mNKZCr/VySK9smNd2ZxGEZnb1OdAkUQX962X5y1N92YeWRQVzhlVkE/SPH+MzYV+c1UE=;
Message-ID: <6acaf6f5-7c55-4165-91f6-a912c058746e@xen.org>
Date: Mon, 18 Sep 2023 11:34:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] common: assembly entry point type/size annotations
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
 <8ed43968-311e-263b-4dd7-9f8a49a394dc@suse.com>
 <7b1582d2-8c1f-4694-995c-c92e83590b3a@xen.org>
 <c49be18b-256d-76b6-7d73-800ba40c313f@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c49be18b-256d-76b6-7d73-800ba40c313f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/09/2023 11:24, Jan Beulich wrote:
> On 14.09.2023 23:06, Julien Grall wrote:
>> On 04/08/2023 07:26, Jan Beulich wrote:
>>> TBD: What to set CODE_ALIGN to by default? Or should we requires arch-es
>>>        to define that in all cases?
>>
>> The code alignment is very specific to an architecture. So I think it
>> would be better if there are no default.
>>
>> Otherwise, it will be more difficult for a developper to figure out that
>> CODE_ALIGN may need an update.
> 
> Okay, I've dropped the fallback then.
> 
>>> --- /dev/null
>>> +++ b/xen/include/xen/linkage.h
>>> @@ -0,0 +1,56 @@
>>> +#ifndef __LINKAGE_H__
>>> +#define __LINKAGE_H__
>>> +
>>> +#ifdef __ASSEMBLY__
>>> +
>>> +#include <xen/macros.h>
>>> +
>>> +#ifndef CODE_ALIGN
>>> +# define CODE_ALIGN ??
>>> +#endif
>>> +#ifndef CODE_FILL
>>> +# define CODE_FILL ~0
>>> +#endif
>>
>> What's the value to allow the architecture to override CODE_FILL and ...
> 
> What is put between functions may be relevant to control. Without fall-
> through to a subsequent label, I think the intention is to use "int3" (0xcc)
> filler bytes, for example. (With fall-through to the subsequent label, NOPs
> would need using in any event.)

I guess for x86 it makes sense. For Arm, the filler is unlikely to be 
used as the instruction size is always fixed.

> 
>>> +
>>> +#ifndef DATA_ALIGN
>>> +# define DATA_ALIGN 0
>>> +#endif
>>> +#ifndef DATA_FILL
>>> +# define DATA_FILL ~0
>>> +#endif
>>
>> ... DATA_FILL?
> 
> For data the need is probably less strict; still I could see one arch to
> prefer zero filling while another might better like all-ones-filling.

It is unclear to me why an architecture would prefer one over the other. 
Can you provide a bit more details?

> 
>>> +
>>> +#define SYM_ALIGN(algn...) .balign algn
>>
>> I find the name 'algn' confusing (not even referring to the missing
>> 'i'). Why not naming it 'args'?
> 
> I can name it "args", sure. It's just that "algn" is in line with the
> naming further down (where "args" isn't reasonable to use as substitution).

If you want to be consistent then, I think it would be best to use 
'align'. I think it should be fine as we don't seem to use '.align'.

> 
>>> +#define SYM_L_GLOBAL(name) .globl name
>>> +#define SYM_L_WEAK(name)   .weak name
>>> +#define SYM_L_LOCAL(name)  /* nothing */
>>> +
>>> +#define SYM_T_FUNC         STT_FUNC
>>> +#define SYM_T_DATA         STT_OBJECT
>>> +#define SYM_T_NONE         STT_NOTYPE
>>
>> SYM_* will be used only in SYM() below. So why not using STT_* directly?
> 
> For one this is how the Linux original has it. And then to me DATA and
> NONE are neater to have at the use sites than the ELF-specific terms
> OBJECT and NOTYPE. But I'm willing to reconsider provided arguments
> towards the two given reasons not being overly relevant for us.
> 
>>> +
>>> +#define SYM(name, typ, linkage, algn...)          \
>>> +        .type name, SYM_T_ ## typ;                \
>>> +        SYM_L_ ## linkage(name);                  \
>>> +        SYM_ALIGN(algn);                          \
>>> +        name:
>>> +
>>> +#define END(name) .size name, . - name
>>> +
>>> +#define FUNC(name, algn...) \
>>> +        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
>>> +#define LABEL(name, algn...) \
>>> +        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
>>> +#define DATA(name, algn...) \
>>> +        SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)
>>
>> I think the alignment should be explicit for DATA. Otherwise, at least
>> on Arm, we would default to 0 which could lead to unaligned access if
>> not careful.
> 
> I disagree. Even for byte-granular data (like strings) it may be desirable
> to have some default alignment, without every use site needing to repeat
> that specific value. 

I understand that some cases may want to use a default alignment. But my 
concern is the developer may not realize that alignment is necessary. So 
by making it mandatory, it would at least prompt the developper to think 
whether this is needed.

For the string case, we could introduce a different macro.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6484F3074A4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76931.139070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55PO-0002FD-BD; Thu, 28 Jan 2021 11:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76931.139070; Thu, 28 Jan 2021 11:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55PO-0002Eo-7v; Thu, 28 Jan 2021 11:24:18 +0000
Received: by outflank-mailman (input) for mailman id 76931;
 Thu, 28 Jan 2021 11:24:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l55PM-0002Ej-Pb
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:24:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9616608-a725-497a-8e37-9edf1fda0832;
 Thu, 28 Jan 2021 11:24:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7380EB07B;
 Thu, 28 Jan 2021 11:24:14 +0000 (UTC)
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
X-Inumbo-ID: c9616608-a725-497a-8e37-9edf1fda0832
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611833054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7NVt06qxmTa8gdTrXN7GCNrZ/4KDzkpk93mIW3BRfv8=;
	b=V814SOzYN9deoO+jk6dHFMd91dScy4PgEtEJSUNhsd13vGWqUgrTDwV8dEzCKLvYlP+RM6
	CCTZr+9aD1EBlvGvZXsm6/a44FLOmHWIOGV/q/3UW+RchJrjqsbFRQWByJbKyYvaREb+Q7
	HeRvVmSh4EFSghIJ+heGKUCFWQgA8oU=
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
 <01b122dd-37c9-d429-b060-adea9e7cae8b@suse.com>
 <b16bb4e2-fb26-f5e5-2417-86867241036a@gmail.com>
 <1eb1247b-f455-65c8-b91c-3e8bc05186a1@suse.com>
 <17d15bd5-87d3-5159-cb80-a54dbd8fb57d@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f520e8cc-7ca9-909b-0577-b72fc3c5fd08@suse.com>
Date: Thu, 28 Jan 2021 12:24:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <17d15bd5-87d3-5159-cb80-a54dbd8fb57d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.01.2021 12:16, Oleksandr wrote:
> On 28.01.21 10:06, Jan Beulich wrote:
>> On 27.01.2021 21:14, Oleksandr wrote:
>>> On 27.01.21 18:58, Jan Beulich wrote:
>>>> On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
>>>>> --- a/xen/arch/x86/Kconfig
>>>>> +++ b/xen/arch/x86/Kconfig
>>>>> @@ -92,6 +92,7 @@ config PV_LINEAR_PT
>>>>>    
>>>>>    config HVM
>>>>>    	def_bool !PV_SHIM_EXCLUSIVE
>>>>> +	select IOREQ_SERVER
>>>>>    	prompt "HVM support"
>>>>>    	---help---
>>>> ... the addition moved below the prompt line (could probably
>>>> be taken care of while committing, if no other need for a v6
>>>> arises).
>>> V6 is planned anyway, so will do, but ...
>>>
>>>
>>>> (Personally I think this should be
>>>>
>>>> config HVM
>>>> 	bool "HVM support"
>>>> 	default !PV_SHIM_EXCLUSIVE
>>> ... def_bool is changed to default by intention or this is a typo?
>> No, it's not a typo. "def_bool" is just a shorthand for "bool"
>> and "default", which is useful when there's no prompt, but
>> gets abused (in my view at least) in a number of other cases.
>> But as said ...
>>
>>>> anyway, but that's nothing you need to care about.)
>> ... here.
> 
> ok, well, thank you, but FYI playing with default instead of def_bool I 
> noticed the difference in behavior.
> 
> I don't understand why, but HVM option disappears from menuconfig 
> somehow... Or I do something completely wrong...

Hmm, this sounds odd indeed, but I confess I don't ever use
menuconfig, so I don't think I have an explanation.

>>>>> --- /dev/null
>>>>> +++ b/xen/include/asm-x86/ioreq.h
>>>>> @@ -0,0 +1,37 @@
>>>>> +/*
>>>>> + * ioreq.h: Hardware virtual machine assist interface definitions.
>>>>> + *
>>>>> + * This is a wrapper which purpose is to not include arch HVM specific header
>>>>> + * from the common code.
>>>>> + *
>>>>> + * Copyright (c) 2016 Citrix Systems Inc.
>>>>> + *
>>>>> + * This program is free software; you can redistribute it and/or modify it
>>>>> + * under the terms and conditions of the GNU General Public License,
>>>>> + * version 2, as published by the Free Software Foundation.
>>>>> + *
>>>>> + * This program is distributed in the hope it will be useful, but WITHOUT
>>>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>>>> + * more details.
>>>>> + *
>>>>> + * You should have received a copy of the GNU General Public License along with
>>>>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>>>>> + */
>>>>> +
>>>>> +#ifndef __ASM_X86_IOREQ_H__
>>>>> +#define __ASM_X86_IOREQ_H__
>>>>> +
>>>>> +#include <asm/hvm/ioreq.h>
>>>>> +
>>>>> +#endif /* __ASM_X86_IOREQ_H__ */
>>>> Not necessarily for taking care of right away, I think in the
>>>> longer run this wants wrapping by #ifdef CONFIG_HVM, such that
>>>> in !HVM builds the dependency on the "chained" header goes
>>>> away (reducing the amount of rebuilding in incremental builds).
>>> I don't mind wrapping it right away.
>> Well, if that doesn't break the !HVM build, I'd of course
>> appreciate it. I'd expect fallout, though.
> 
> Hmm, I didn't notice a fallout with that change when CONFIG_HVM is not set
> 
> +#ifdef CONFIG_HVM
> #include <asm/hvm/ioreq.h>
> +#endif

Good.

Jan


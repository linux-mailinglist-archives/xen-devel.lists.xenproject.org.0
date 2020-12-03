Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ACF2CD286
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 10:27:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43223.77748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkktb-000258-VS; Thu, 03 Dec 2020 09:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43223.77748; Thu, 03 Dec 2020 09:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkktb-00024j-SF; Thu, 03 Dec 2020 09:27:27 +0000
Received: by outflank-mailman (input) for mailman id 43223;
 Thu, 03 Dec 2020 09:27:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkkta-00024e-F7
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 09:27:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f12fe71c-d742-45fa-ad22-64cfe5131b73;
 Thu, 03 Dec 2020 09:27:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A5E0AC55;
 Thu,  3 Dec 2020 09:27:24 +0000 (UTC)
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
X-Inumbo-ID: f12fe71c-d742-45fa-ad22-64cfe5131b73
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606987644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVf0pzAcE5NuQeytzIki02m6gx+39mPGMJjm8+J2YLY=;
	b=QFsmUBIAB8E/9ubYwrPtGDIF0XEBMDJS3oW2R8PPStTJu2Kf3owlE7Nw/B7oXnyYAiQHyR
	DlzKSrpFpW/hN3RvsXrtsvHv8SNwAhC/syYWif/WPeDULRZ5MyGJPmuiWzi4RlnGFGUmI8
	x8u4zVzazJjB27170VmjdIN4hRGagto=
Subject: Re: [PATCH 1/2] include: don't use asm/page.h from common headers
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hx242@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <75484377-160c-a529-1cfc-96de86cfc550@suse.com>
 <04276039-a5d0-fefd-260e-ffaa8272fd6a@suse.com>
 <a35fb176-e729-a542-4416-7040d6c80964@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bdf294d9-e021-36d3-7e04-1c148e34701f@suse.com>
Date: Thu, 3 Dec 2020 10:27:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a35fb176-e729-a542-4416-7040d6c80964@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.12.2020 18:14, Julien Grall wrote:
> Hi Jan,
> 
> On 02/12/2020 14:49, Jan Beulich wrote:
>> Doing so limits what can be done in (in particular included by) this per-
>> arch header. Abstract out page shift/size related #define-s, which is all
>> the repsecitve headers care about. Extend the replacement / removal to
> 
> s/repsecitve/respective/
> 
>> some x86 headers as well; some others now need to include page.h (and
>> they really should have before).
>>
>> Arm's VADDR_BITS gets restricted to 32-bit, as its current value is
>> clearly wrong for 64-bit, but the constant also isn't used anywhere
>> right now (i.e. the #define could also be dropped altogether).
> 
> Whoops. Thankfully this is not used.
> 
>>
>> I wasn't sure about Arm's use of vaddr_t in PAGE_OFFSET(), and hence I
>> kept it and provided a way to override the #define in the common header.
> 
> vaddr_t is defined to 32-bit for arm32 or 64-bit for arm64. So I think 
> it would be fine to use the generic PAGE_OFFSET() implementation.

Will switch.

>> --- /dev/null
>> +++ b/xen/include/asm-arm/page-shift.h
> 
> The name of the file looks a bit odd given that *_BITS are also defined 
> in it. So how about renaming to page-size.h?

I was initially meaning to use that name, but these headers
specifically don't define any sizes - *_BITS are still shift
values, at least in a way. If the current name isn't liked, my
next best suggestion would then be page-bits.h.

>> @@ -0,0 +1,15 @@
>> +#ifndef __ARM_PAGE_SHIFT_H__
>> +#define __ARM_PAGE_SHIFT_H__
>> +
>> +#define PAGE_SHIFT              12
>> +
>> +#define PAGE_OFFSET(ptr)        ((vaddr_t)(ptr) & ~PAGE_MASK)
>> +
>> +#ifdef CONFIG_ARM_64
>> +#define PADDR_BITS              48
> 
> Shouldn't we define VADDR_BITS here?

See the description - it's unused anyway. I'm fine any of the three
possible ways:
1) keep as is in v1
2) drop altogether
3) also #define for 64-bit (but then you need to tell me whether 64
   is the right value to use, or what the correct one would be)

> But I wonder whether VADDR_BITS 
> should be defined as sizeof(vaddr_t) * 8.
> 
> This would require to include asm/types.h.

Which I'd specifically like to avoid. Plus use of sizeof() also
precludes the use of respective #define-s in #if-s.

>> --- a/xen/include/asm-x86/desc.h
>> +++ b/xen/include/asm-x86/desc.h
>> @@ -1,6 +1,8 @@
>>   #ifndef __ARCH_DESC_H
>>   #define __ARCH_DESC_H
>>   
>> +#include <asm/page.h>
> 
> May I ask why you are including <asm/page.h> and not <xen/page-size.h> here?

Because of

DECLARE_PER_CPU(l1_pgentry_t, gdt_l1e);

and

DECLARE_PER_CPU(l1_pgentry_t, compat_gdt_l1e);

at least (didn't check further).

Jan


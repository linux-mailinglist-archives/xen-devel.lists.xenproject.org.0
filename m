Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C048B797D2D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 22:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597619.931853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeLLC-0006Cn-OL; Thu, 07 Sep 2023 20:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597619.931853; Thu, 07 Sep 2023 20:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeLLC-0006Ae-Lf; Thu, 07 Sep 2023 20:11:02 +0000
Received: by outflank-mailman (input) for mailman id 597619;
 Thu, 07 Sep 2023 20:11:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myun=EX=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qeLLB-0006AY-B5
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 20:11:01 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8a9cfce-4dba-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 22:10:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CF17082856D8;
 Thu,  7 Sep 2023 15:10:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1L85qH1Ir2IZ; Thu,  7 Sep 2023 15:10:57 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 19ADB828641B;
 Thu,  7 Sep 2023 15:10:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 57n58737Hecc; Thu,  7 Sep 2023 15:10:56 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id AA24B82856D8;
 Thu,  7 Sep 2023 15:10:56 -0500 (CDT)
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
X-Inumbo-ID: a8a9cfce-4dba-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 19ADB828641B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694117457; bh=+RxX6yDDUTKACjmENTarCLYUpvBQ1bdM4UwM2lr0uO4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=JiPpED9Pnlqahp7vMNcRrr7kKcUAEwexN3hYkuOPFSwYfaL9pPJcvLhy+27kRvqY1
	 15UZRqy54VNMcvfiQm3BRKY77DnDao11BcHIyezpDmAR0SHc12nqkHgiOAX4LgYHJt
	 wVCQVzqfRKiwrvn5sNgMoaUr/Jt6WcQeppbYhdCw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <63d361c3-4b6a-1e12-db91-8723e3277252@raptorengineering.com>
Date: Thu, 7 Sep 2023 15:10:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/5] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
 <917dc5517b69657b48e69c4100234383f5c70e0e.1693590982.git.sanastasio@raptorengineering.com>
 <692dae52-947b-5856-f1b8-5d9f03f78e6a@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <692dae52-947b-5856-f1b8-5d9f03f78e6a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/23 9:58 AM, Jan Beulich wrote:
> On 01.09.2023 20:25, Shawn Anastasio wrote:
>> +static inline atomic_t atomic_compareandswap(atomic_t old, atomic_t new,
>> +                                             atomic_t *v)
>> +{
>> +    atomic_t rc;
>> +    rc.counter = __cmpxchg(&v->counter, old.counter, new.counter, sizeof(int));
> 
> I can't seem to be able to spot where __cmpxchg() is defined. (I really
> only wanted to check why it needs the 4th argument, which here rather
> would want to be e.g. sizeof(v->counter). If it can't be omitted.)
>

As you later saw, it's defined in system.h later in patch 3. This was an
error I made when splitting up the changes into this patchset. If you're
fine with it I'll just add a mention in the commit message that the
definitions in this commit are not yet fully usable.

Also I will change the size parameter to sizeof(v->counter) per your
suggestion.

>> +    return rc;
>> +}
>> +
>> +#define arch_cmpxchg(ptr, o, n)                                                \
>> +    ({                                                                         \
>> +        __typeof__(*(ptr)) o_ = (o);                                           \
>> +        __typeof__(*(ptr)) n_ = (n);                                           \
>> +        (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long) o_,              \
>> +                                       (unsigned long) n_, sizeof(*(ptr)));    \
> 
> Nit: Stray blanks again after cast specifiers.
>

Will fix.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/memory.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) IBM Corp. 2005
>> + *
>> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
>> + */
>> +
>> +#ifndef _ASM_MEMORY_H_
>> +#define _ASM_MEMORY_H_
>> +
>> +#include <xen/config.h>
> 
> As mentioned before - no need for this explicit #include.
>

Will drop.

>> +#ifdef CONFIG_SMP
>> +#define PPC_ATOMIC_ENTRY_BARRIER "sync\n"
>> +#define PPC_ATOMIC_EXIT_BARRIER  "sync\n"
>> +#else
>> +#define PPC_ATOMIC_ENTRY_BARRIER
>> +#define PPC_ATOMIC_EXIT_BARRIER
>> +#endif
> 
> Is this correct, considering that we have no CONFIG_SMP and assume SMP
> in all cases?
> 
> I'm sorry for not paying attention earlier.
>

Good observation, and no problem. I will remove the ifdef and the !SMP
case.

> Jan

Thanks,
Shawn


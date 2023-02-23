Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077876A1145
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 21:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500693.772165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVIFZ-0005tQ-Rb; Thu, 23 Feb 2023 20:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500693.772165; Thu, 23 Feb 2023 20:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVIFZ-0005ri-Os; Thu, 23 Feb 2023 20:31:33 +0000
Received: by outflank-mailman (input) for mailman id 500693;
 Thu, 23 Feb 2023 20:31:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVIFY-0005rc-Ci
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 20:31:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVIFX-0007Cb-M6; Thu, 23 Feb 2023 20:31:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVIFX-0004SE-Dc; Thu, 23 Feb 2023 20:31:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=XGlKSu4VJ30PSxX/dnJhwEvI87/sHlnm+cPHh423IFg=; b=cLfajCHTlDoG2tM1kXEQTa0HQL
	e6TTxzRU6xWWHJ5iEvr6KT6davJD6hfNUQFKCOIjwipwojlxWwcneZUShVtiecHGCfgukwPxD5l3c
	RwmHS7JRA5xhYgaabzYqkuAzm5ORJR45RJLODQEdfCtdyrl2+lCpadm/YTSxyLA0i99s=;
Message-ID: <70651f5d-12b9-c7b1-9b69-fc0177f4a1ba@xen.org>
Date: Thu, 23 Feb 2023 20:31:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Matias Ezequiel Vara Larsen <matiasevara@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <df706d6dcfba965909d776dda163fdb261d1a0ea.1665138677.git.matias.vara@vates.fr>
 <f71bbf79-e452-f2d6-58f9-0f2cf019c7b6@citrix.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v2 2/2] tools/misc: Add xen-vcpus-stats tool
In-Reply-To: <f71bbf79-e452-f2d6-58f9-0f2cf019c7b6@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 23/02/2023 16:01, Andrew Cooper wrote:
> On 07/10/2022 1:39 pm, Matias Ezequiel Vara Larsen wrote:
> 
> A couple of observations, all unrelated to the stats themselves.
> 
> Although overall, I'm not entirely certain that a tool like this is
> going to be very helpful after initial development.  Something to
> consider would be to alter libxenstat to use this new interface?
> 
>> diff --git a/tools/misc/Makefile b/tools/misc/Makefile
>> index 2b683819d4..837e4b50da 100644
>> --- a/tools/misc/Makefile
>> +++ b/tools/misc/Makefile
>> @@ -49,6 +49,7 @@ TARGETS_COPY += xenpvnetboot
>>
>> # Everything which needs to be built
>> TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
>> +TARGETS_BUILD += xen-vcpus-stats
> 
> This patch is whitespace corrupted.  If at all possible, you need to see
> about getting `git send-email` working to send patches with, as it deals
> with most of the whitespace problems for you.
> 
> I'm afraid you can't simply copy the patch text into an email and send that.
> 
>>
>> # ... including build-only targets
>> TARGETS_BUILD-$(CONFIG_X86)    += xen-vmtrace
>> @@ -135,4 +136,9 @@ xencov: xencov.o
>> xen-ucode: xen-ucode.o
>>      $(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
>>
>> +xen-vcpus-stats.o: CFLAGS += $(CFLAGS_libxenforeginmemory)
>> +
>> +xen-vcpus-stats: xen-vcpus-stats.o
>> +    $(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl)
>> $(LDLIBS_libxenforeignmemory) $(APPEND_LDFLAGS)
>> +
>> -include $(DEPS_INCLUDE)
>> diff --git a/tools/misc/xen-vcpus-stats.c b/tools/misc/xen-vcpus-stats.c
>> new file mode 100644
>> index 0000000000..29d0efb124
>> --- /dev/null
>> +++ b/tools/misc/xen-vcpus-stats.c
>> @@ -0,0 +1,87 @@
>> +#include <err.h>
>> +#include <errno.h>
>> +#include <error.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <sys/mman.h>
>> +#include <signal.h>
>> +
>> +#include <xenctrl.h>
>> +#include <xenforeignmemory.h>
>> +#include <xen/vcpu.h>
>> +
>> +#define rmb()   asm volatile("lfence":::"memory")
> 
> This is rmb(), but rmb() isn't what you want.
> 
> You want smp_rmb(), which is
> 
> #define smp_rmb() asm volatile ("" ::: "memory")

 From the generic PoV, I find smp_rmb() a bit misleading because it is 
not clear in this context whether we are referring to the SMP-ness of 
the hypervisor or the tools domain.

If the latter, then technically it could be uniprocessor domain and one 
could argue that for Arm it could be downgraded to just a compiler barrier.

AFAICT, this would not be the case here because we are getting data from 
Xen. So we always need a "dmb ish".

So, I would suggest to name it virt_*() (to match Linux's naming).

Also, is this tool meant to be arch-agnostic? If so, then we need to 
introduce the proper barrier for the other arch.

Cheers,

-- 
Julien Grall


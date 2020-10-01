Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63D280231
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 17:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1334.4425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0Cs-0001Ar-Ko; Thu, 01 Oct 2020 15:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334.4425; Thu, 01 Oct 2020 15:09:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0Cs-0001AS-Hc; Thu, 01 Oct 2020 15:09:18 +0000
Received: by outflank-mailman (input) for mailman id 1334;
 Thu, 01 Oct 2020 15:09:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kO0Cr-0001AM-FN
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:09:17 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 652f7313-40e2-4098-9317-c7b8d1429665;
 Thu, 01 Oct 2020 15:09:15 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO0Ch-0000OS-Rq; Thu, 01 Oct 2020 15:09:07 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO0Ch-0002lw-Ga; Thu, 01 Oct 2020 15:09:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kO0Cr-0001AM-FN
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:09:17 +0000
X-Inumbo-ID: 652f7313-40e2-4098-9317-c7b8d1429665
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 652f7313-40e2-4098-9317-c7b8d1429665;
	Thu, 01 Oct 2020 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=dqak5iRuFQ+HAyvINf14dk18mjE6xKDgjI3hlVVwKkI=; b=H+HE/MBOqNYVw7r0aRZAipHk8P
	8VkmqIf9KFDp/GGSGSnm9VouNQZ1nVhf58f5WdAe5RkyZUZq21SAZ5eHCg0SFZqrnW9D+8xirviwJ
	N5J6g7zRiA/vDaTcR86NQQrlsL6xdJm0nsMva1OcDA9nKzFRtiRlnYkc4EwJ7/DWxmw0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO0Ch-0000OS-Rq; Thu, 01 Oct 2020 15:09:07 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO0Ch-0002lw-Ga; Thu, 01 Oct 2020 15:09:07 +0000
Subject: Re: [PATCH 1/4] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200926205542.9261-1-julien@xen.org>
 <20200926205542.9261-2-julien@xen.org>
 <alpine.DEB.2.21.2009301659350.10908@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <764fb618-634b-18a5-8f45-e231c71c1bb5@xen.org>
Date: Thu, 1 Oct 2020 16:09:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009301659350.10908@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 01/10/2020 01:06, Stefano Stabellini wrote:
> On Sat, 26 Sep 2020, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The functions acpi_os_{un,}map_memory() are meant to be arch-agnostic
>> while the __acpi_os_{un,}map_memory() are meant to be arch-specific.
>>
>> Currently, the former are still containing x86 specific code.
>>
>> To avoid this rather strange split, the generic helpers are reworked so
>> they are arch-agnostic. This requires the introduction of a new helper
>> __acpi_os_unmap_memory() that will undo any mapping done by
>> __acpi_os_map_memory().
>>
>> Currently, the arch-helper for unmap is basically a no-op so it only
>> returns whether the mapping was arch specific. But this will change
>> in the future.
>>
>> Note that the x86 version of acpi_os_map_memory() was already able to
>> able the 1MB region. Hence why there is no addition of new code.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/acpi/lib.c | 10 ++++++++++
>>   xen/arch/x86/acpi/lib.c | 18 ++++++++++++++++++
>>   xen/drivers/acpi/osl.c  | 34 ++++++++++++++++++----------------
>>   xen/include/xen/acpi.h  |  1 +
>>   4 files changed, 47 insertions(+), 16 deletions(-)
>>
>> diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
>> index 4fc6e17322c1..2192a5519171 100644
>> --- a/xen/arch/arm/acpi/lib.c
>> +++ b/xen/arch/arm/acpi/lib.c
>> @@ -30,6 +30,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>>       unsigned long base, offset, mapped_size;
>>       int idx;
>>   
>> +    /* No arch specific implementation after early boot */
>> +    if ( system_state >= SYS_STATE_boot )
>> +        return NULL;
>> +
>>       offset = phys & (PAGE_SIZE - 1);
>>       mapped_size = PAGE_SIZE - offset;
>>       set_fixmap(FIXMAP_ACPI_BEGIN, maddr_to_mfn(phys), PAGE_HYPERVISOR);
>> @@ -49,6 +53,12 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>>       return ((char *) base + offset);
>>   }
>>   
>> +bool __acpi_unmap_table(void *ptr, unsigned long size)
>> +{
>> +    return ( vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) &&
>> +             vaddr < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) );
>> +}
> 
> vaddr or ptr?  :-)
> 
> lib.c: In function '__acpi_unmap_table':
> lib.c:58:14: error: 'vaddr' undeclared (first use in this function)
>       return ( vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) &&
>                ^
> lib.c:58:14: note: each undeclared identifier is reported only once for each function it appears in
> lib.c:60:1: error: control reaches end of non-void function [-Werror=return-type]
>   }
>   ^
> cc1: all warnings being treated as errors

The whole series builds because 'vaddr' is added in the next patch. But 
I forgot to build patch by patch :(.

I will fix it in the next version.

Cheers,

-- 
Julien Grall


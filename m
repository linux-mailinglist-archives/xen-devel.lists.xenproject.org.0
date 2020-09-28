Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA8027AB86
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 12:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMq63-0007n7-Ug; Mon, 28 Sep 2020 10:09:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMq63-0007n2-75
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:09:27 +0000
X-Inumbo-ID: f8d0a3d7-9692-4a39-97d1-26f6832820ee
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8d0a3d7-9692-4a39-97d1-26f6832820ee;
 Mon, 28 Sep 2020 10:09:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601287765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfjCCj3FA9GdPhjgM84xr3tmT4HNQKMl9TzwgTYaZZA=;
 b=mxNz/wTbIAUNLeOt4zpiWCPNW4MRUU8HelgRQKaxJIKvGdZkA+ajNGfqmQaSD98A2spAQr
 EJVdWOsdtPiHVbxi3bBOEycKajtVHH395oYnScA5fM5XpUMpGbOZkO9B+E4dwmNg7l047w
 j+gUVAn9SpVnKTgwDkEsa13zvV58LCM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B78CB21B;
 Mon, 28 Sep 2020 10:09:25 +0000 (UTC)
Subject: Re: [PATCH 1/4] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200926205542.9261-1-julien@xen.org>
 <20200926205542.9261-2-julien@xen.org>
 <fe055799-de10-891a-bcee-bbb01a8c0b3d@suse.com>
 <b5624bfa-f24b-4c0a-6735-3473892fbd2f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a07b59a0-41a3-ee4e-f28a-38499a2a4055@suse.com>
Date: Mon, 28 Sep 2020 12:09:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b5624bfa-f24b-4c0a-6735-3473892fbd2f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.09.2020 11:58, Julien Grall wrote:
> On 28/09/2020 09:18, Jan Beulich wrote:
>> On 26.09.2020 22:55, Julien Grall wrote:
>>> --- a/xen/arch/x86/acpi/lib.c
>>> +++ b/xen/arch/x86/acpi/lib.c
>>> @@ -46,6 +46,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>>>   	if ((phys + size) <= (1 * 1024 * 1024))
>>>   		return __va(phys);
>>>   
>>> +	/* No arch specific implementation after early boot */
>>> +	if (system_state >= SYS_STATE_boot)
>>> +		return NULL;
>>
>> Considering the code in context above, the comment isn't entirely
>> correct.
> 
> How about "No arch specific implementation after early boot but for the 
> first 1MB"?

That or simply "No further ...".

>>> +{
>>> +	unsigned long vaddr = (unsigned long)ptr;
>>> +
>>> +	if (vaddr >= DIRECTMAP_VIRT_START &&
>>> +	    vaddr < DIRECTMAP_VIRT_END) {
>>> +		ASSERT(!((__pa(ptr) + size - 1) >> 20));
>>> +		return true;
>>> +	}
>>> +
>>> +	return (vaddr >= __fix_to_virt(FIX_ACPI_END)) &&
>>> +		(vaddr < (__fix_to_virt(FIX_ACPI_BEGIN) + PAGE_SIZE));
>>
>> Indentation is slightly wrong here.
> 
> This is Linux coding style and therefore is using hard tab. Care to 
> explain the problem?

The two opening parentheses should align with one another,
shouldn't they?

>>> +	ptr = __vmap(&mfn, PFN_UP(offs + size), 1, 1,
>>> +		     ACPI_MAP_MEM_ATTR, VMAP_DEFAULT);
>>> +
>>> +	return !ptr ? NULL : (ptr + offs);
>>
>> Slightly odd that you don't let the success case go first,
> 
> I don't really see the problem. Are you nitpicking?
> 
>> the more that it's minimally shorter:
>>
>> 	return ptr ? ptr + offs : NULL;

Well, I said "slightly odd" as sort of a replacement of "Nit:".
But I really think it would be more logical the other way
around, not so much for how it looks like, but to aid the not
uncommon compiler heuristics of assuming the "true" path is
the common one.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952BA289FA3
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 11:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5377.14035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRBV4-0004D1-Ln; Sat, 10 Oct 2020 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5377.14035; Sat, 10 Oct 2020 09:49:14 +0000
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
	id 1kRBV4-0004Cb-IN; Sat, 10 Oct 2020 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 5377;
 Sat, 10 Oct 2020 09:49:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rChQ=DR=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kRBV3-0004CL-2K
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 09:49:13 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c231ea3-8f3f-4e25-bb7f-89702403e16c;
 Sat, 10 Oct 2020 09:49:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kRBUu-0007yC-Lz; Sat, 10 Oct 2020 09:49:04 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kRBUu-0008VS-Cz; Sat, 10 Oct 2020 09:49:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rChQ=DR=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kRBV3-0004CL-2K
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 09:49:13 +0000
X-Inumbo-ID: 0c231ea3-8f3f-4e25-bb7f-89702403e16c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0c231ea3-8f3f-4e25-bb7f-89702403e16c;
	Sat, 10 Oct 2020 09:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=zrcSwGlRzNlvVNi/gmxjgy1Cp08YtnuvYagKgCui6MY=; b=CyT9xsUEFVELaoRi0j3X0yA1/7
	Zcchqwo4gcH1MGWfR0VXyjgk+zwECuHHfXlavYuek6y94MjPG1IA/dOUG/LWE0W/oHOxn2DF3kc5Y
	gKZRQzxVgrHbN6lo9BaPtDuB9bqlLybrTdGrZ3WZQxYp8IiX4j9y+On4eUU+TXmISQdM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kRBUu-0007yC-Lz; Sat, 10 Oct 2020 09:49:04 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kRBUu-0008VS-Cz; Sat, 10 Oct 2020 09:49:04 +0000
Subject: Re: [PATCH 1/4] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>
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
 <a07b59a0-41a3-ee4e-f28a-38499a2a4055@suse.com>
 <0d7d239e-a9ca-394a-9c7c-19f3aead6790@xen.org>
Message-ID: <ef338482-7516-5587-ad7e-72e3bbd5415e@xen.org>
Date: Sat, 10 Oct 2020 10:49:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <0d7d239e-a9ca-394a-9c7c-19f3aead6790@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 28/09/2020 11:39, Julien Grall wrote:
> 
> 
> On 28/09/2020 11:09, Jan Beulich wrote:
>> On 28.09.2020 11:58, Julien Grall wrote:
>>> On 28/09/2020 09:18, Jan Beulich wrote:
>>>> On 26.09.2020 22:55, Julien Grall wrote:
>>>>> --- a/xen/arch/x86/acpi/lib.c
>>>>> +++ b/xen/arch/x86/acpi/lib.c
>>>>> @@ -46,6 +46,10 @@ char *__acpi_map_table(paddr_t phys, unsigned 
>>>>> long size)
>>>>>        if ((phys + size) <= (1 * 1024 * 1024))
>>>>>            return __va(phys);
>>>>> +    /* No arch specific implementation after early boot */
>>>>> +    if (system_state >= SYS_STATE_boot)
>>>>> +        return NULL;
>>>>
>>>> Considering the code in context above, the comment isn't entirely
>>>> correct.
>>>
>>> How about "No arch specific implementation after early boot but for the
>>> first 1MB"?
>>
>> That or simply "No further ...".
> 
> I will do that.
> 
>>>>> +{
>>>>> +    unsigned long vaddr = (unsigned long)ptr;
>>>>> +
>>>>> +    if (vaddr >= DIRECTMAP_VIRT_START &&
>>>>> +        vaddr < DIRECTMAP_VIRT_END) {
>>>>> +        ASSERT(!((__pa(ptr) + size - 1) >> 20));
>>>>> +        return true;
>>>>> +    }
>>>>> +
>>>>> +    return (vaddr >= __fix_to_virt(FIX_ACPI_END)) &&
>>>>> +        (vaddr < (__fix_to_virt(FIX_ACPI_BEGIN) + PAGE_SIZE));
>>>>
>>>> Indentation is slightly wrong here.
>>>
>>> This is Linux coding style and therefore is using hard tab. Care to
>>> explain the problem?
>>
>> The two opening parentheses should align with one another,
>> shouldn't they?
> 
> Hmmm... somehow vim wants to indent this way. I am not entirely sure why...

Looking at the Linux codebase this is the expected indentation. This is 
because the first ( on the first line is not closed and until the last ) 
on the second line.

So I will stick with this code.

Cheers,

-- 
Julien Grall


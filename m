Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918389968DB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814399.1227956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUv7-00012l-Nk; Wed, 09 Oct 2024 11:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814399.1227956; Wed, 09 Oct 2024 11:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUv7-000101-L7; Wed, 09 Oct 2024 11:31:57 +0000
Received: by outflank-mailman (input) for mailman id 814399;
 Wed, 09 Oct 2024 11:31:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syUv5-0000zv-Qg
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:31:55 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 140f58ac-8632-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 13:31:53 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728473506234477.29125034308197;
 Wed, 9 Oct 2024 04:31:46 -0700 (PDT)
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
X-Inumbo-ID: 140f58ac-8632-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728473508; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TQS8ibsyO/Rjj2fIj4kU6qEVhoOUP6XLimOn1La2YtDvkZFlA1sEvN15nvy4uTVtoQCdMd2Vft3B2Hp8udQFLtuVKODMBhZLUnHWVeaakwsQpgtlUmD+4Qteblu2u8dLG6CQWaN3UeYrRV4HxnsudLE9PDJYE2DqIABj4Kalizk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728473508; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WvuGkFc4gT/jZq/iUaGx0ApnJE8epyBd9jjJwFEdty0=; 
	b=X070dwy2FMWcOF6nr8mjygb8CUJoF7WnI9R5TItrzZnu147+OJgfSGue4U1+N+W2YBd6OZAqzuT1TsrqNvaBTxVR60LGn2dGkdGIq7Dtko/kJfjgKMYFsh17bTUBj8TidBzMHPGwBRKJwQA1gueaIDjHs8hTJNLGDWfudgqg6g8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728473508;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WvuGkFc4gT/jZq/iUaGx0ApnJE8epyBd9jjJwFEdty0=;
	b=ly01eEuC4/sf2pSLqvahDAUXhAaYxka5Tkur9MjLOO+9Eucl7rxb6mWeJWI+4hHX
	Yvy9d5q6JrM7NNEuq9dRnOpSAN1q9BVT1pVZ9zTKCOMOAl/HeFn6cO8z+7wOkSyyDHU
	14j7iM2AXL5oQl5Wf1O0hBOGksIqpzBPUex9KTsI=
Message-ID: <da7baad5-148b-4c23-b34f-dad4b7369bf1@apertussolutions.com>
Date: Wed, 9 Oct 2024 07:31:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/44] x86/boot: introduce struct boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-6-dpsmith@apertussolutions.com>
 <2fa284ee-907d-4899-aa78-82481cfbfc6a@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2fa284ee-907d-4899-aa78-82481cfbfc6a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/7/24 14:29, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> This will introduce a new struct boot_module to provide a rich state
>> representation around modules provided by the boot loader. Support is 
>> for 64
>> boot modules, one held in reserve for Xen, and up to 63 can be 
>> provided by the
>> boot loader. The array of struct boot_modules will be accessible via a
>> reference held in struct boot_info.
>>
>> A temporary `mod` parameter is included in struct boot_module to ease the
>> transition from using Multiboot v1 structures over to struct 
>> boot_module. Once
>> the transition is complete, the parameter will be dropped from the 
>> structure.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h | 14 ++++++++++++--
>>   xen/arch/x86/setup.c                |  9 +++++++++
>>   2 files changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h 
>> b/xen/arch/x86/include/asm/bootinfo.h
>> index 87d311ac1399..d19473d8941e 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -8,20 +8,30 @@
>>   #ifndef __XEN_X86_BOOTINFO_H__
>>   #define __XEN_X86_BOOTINFO_H__
>> +#include <xen/multiboot.h>
>>   #include <xen/types.h>
>> +/* Max number of boot modules a bootloader can provide in addition to 
>> Xen */
>> +#define MAX_NR_BOOTMODS 63
>> +
>> +struct boot_module {
>> +    /* Transitionary only */
>> +    module_t *mod;
>> +};
>> +
>>   /*
>>    * Xen internal representation of information provided by the
>>    * bootloader/environment, or derived from the information.
>>    */
>>   struct boot_info {
>> -    unsigned int nr_modules;
>> -
> 
> (You should probably re-work the other patches to insert ahead of this 
> and avoid the movement.)

Ack.

>>       const char *loader;
>>       const char *cmdline;
>>       paddr_t memmap_addr;
>>       size_t memmap_length;
>> +
>> +    unsigned int nr_modules;
>> +    struct boot_module mods[MAX_NR_BOOTMODS + 1];
>>   };
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thank you.

v/r,
dps


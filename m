Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994E6522103
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 18:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325873.548642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSZW-0004d8-55; Tue, 10 May 2022 16:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325873.548642; Tue, 10 May 2022 16:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSZW-0004aH-1j; Tue, 10 May 2022 16:18:50 +0000
Received: by outflank-mailman (input) for mailman id 325873;
 Tue, 10 May 2022 16:18:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noSZU-0004a3-9M
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 16:18:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noSZT-0001ZM-Ig; Tue, 10 May 2022 16:18:47 +0000
Received: from [54.239.6.189] (helo=[192.168.24.150])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noSZT-0000gK-CC; Tue, 10 May 2022 16:18:47 +0000
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
	bh=5hIBuWjHB89ohdv+iWOwRiZQUYeICQW1Fi3o0A9eY8g=; b=cdTP4QXoCa+r/HvkPRFizRNyb0
	qHjynnoiGE8jYcbFtZv9gzDL6G7Sj1GpIu57YmTE0rx1L/jkd1hjnP62F/5ZdAJIF30XyXvGC1DtT
	1bDIOzMY6ot2gsv/SBoKinY4CsOile9S8BZF4x4bD4YwyCeXNHkHOd7QeA0YOXq2liZQ=;
Message-ID: <f6762960-3fae-91a4-758d-4b85f018be9e@xen.org>
Date: Tue, 10 May 2022 17:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/6] xen: implement byteswap
To: =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <2699787cd4ba1d71448bbcdf190d927e180e80b9.1652170719.git.lin.liu@citrix.com>
 <11269227-ba07-b2b1-c2ef-ea6309980f67@xen.org>
 <SJ0PR03MB540509C0FCD040A3680DE3799DC99@SJ0PR03MB5405.namprd03.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <SJ0PR03MB540509C0FCD040A3680DE3799DC99@SJ0PR03MB5405.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/05/2022 13:10, Lin Liu （刘林） wrote:
> On 10/05/2022 11:15, Lin Liu wrote:
>> swab() is massively over complicated and can be simplified by builtins.
> 
> NIT: "by builtins" -> "by re-implementing using compiler builtins".
> 
>> The compilers provide builtin function to swap bytes.
>> * gcc:   https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgcc.gnu.org%2Fonlinedocs%2Fgcc%2FOther-Builtins.html&amp;data=05%7C01%7Clin.liu%40citrix.com%7Ce0b3d98d7f8d47b8fe8708da3275afcd%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637877778294067911%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=HDTF1LDJcD2PLSCuM%2FjIz%2FWGf1CrYk0e%2FLox22%2FXnvQ%3D&amp;reserved=0
>> * clang: https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fclang.llvm.org%2Fdocs%2FLanguageExtensions.html&amp;data=05%7C01%7Clin.liu%40citrix.com%7Ce0b3d98d7f8d47b8fe8708da3275afcd%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637877778294067911%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=EvWcLMi2vtT9haQVo%2F9uXmjBh2zVLUzZAgU57i%2FFMNo%3D&amp;reserved=0
>> This patch simplify swab() with builtins and fallback for old compilers.
>>
>> Signed-off-by: Lin Liu <lin.liu@citrix.com>
>> ---
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Julien Grall <julien@xen.org>
>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>> Cc: George Dunlap <george.dunlap@citrix.com>
>> Cc: Jan Beulich <jbeulich@suse.com>
>> Cc: Wei Liu <wl@xen.org>
>> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
>> Changes in v3:
>> - Check __has_builtin instead of GNUC version
>>
>> Changes in v2:
>> - Add fallback for compilers without __builtin_bswap
>> - Implement with plain C instead of macros
>> ---
>>    xen/arch/arm/include/asm/byteorder.h | 14 ++-----
>>    xen/arch/x86/include/asm/byteorder.h | 34 ++---------------
>>    xen/include/xen/byteorder.h          | 56 ++++++++++++++++++++++++++++
>>    xen/include/xen/byteswap.h           | 44 ++++++++++++++++++++++
>>    xen/include/xen/compiler.h           | 12 ++++++
>>    5 files changed, 120 insertions(+), 40 deletions(-)
>>    create mode 100644 xen/include/xen/byteorder.h
>>    create mode 100644 xen/include/xen/byteswap.h
>>
>> diff --git a/xen/arch/arm/include/asm/byteorder.h b/xen/arch/arm/include/asm/byteorder.h
>> index 9c712c4788..622eeaba07 100644
>> --- a/xen/arch/arm/include/asm/byteorder.h
>> +++ b/xen/arch/arm/include/asm/byteorder.h
>> @@ -1,16 +1,10 @@
>>    #ifndef __ASM_ARM_BYTEORDER_H__
>>    #define __ASM_ARM_BYTEORDER_H__
>>
>> -#define __BYTEORDER_HAS_U64__
>> +#ifndef __BYTE_ORDER__
>> +   #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
>> +#endif
>>
>> -#include <xen/byteorder/little_endian.h>
>> +#include <xen/byteorder.h>
>>
>>    #endif /* __ASM_ARM_BYTEORDER_H__ */
>> -/*
>> - * Local variables:
>> - * mode: C
>> - * c-file-style: "BSD"
>> - * c-basic-offset: 4
>> - * indent-tabs-mode: nil
>> - * End:
>> - */
> 
>>> This change looks unrelated to this patch. Can you explain it?
> 
> Do you mean following code block? Yes, it is unrelated, I removed it as I found some files does not include such field.

So in general we try to avoid unrelated change within a same patch. In 
this case, the emacs magic should be present in the files rather than 
the other way around.

Cheers,

-- 
Julien Grall


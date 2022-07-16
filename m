Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A726576F8F
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 17:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368772.600169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjHI-0004Rk-DK; Sat, 16 Jul 2022 15:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368772.600169; Sat, 16 Jul 2022 15:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjHI-0004Pb-AV; Sat, 16 Jul 2022 15:00:20 +0000
Received: by outflank-mailman (input) for mailman id 368772;
 Sat, 16 Jul 2022 15:00:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCjHG-0004PT-Bo
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 15:00:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCjHA-0007UA-AF; Sat, 16 Jul 2022 15:00:12 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCjHA-0007DE-3K; Sat, 16 Jul 2022 15:00:12 +0000
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
	bh=4USBPYDKjqQUtKQEf8+/aCXTiowYxIS2S/D5eVuKUFw=; b=BO4cZt7o0VnOgAUNoTGPtgPuNF
	/+pv51gQaZRd0pn1nxtM7me9Ul0GgnT01xAcob7DTCemomWJhzCCZvZxZQPkIz2yD17QMe3jxl34N
	hvxixOWEgH65nKlWsIpcEyo1eGQvoAKbXqDIvEMWD6BHkYfs+W9YAJSS9nAqPEK4qWgw=;
Message-ID: <76a622ec-bd10-04c3-250f-c55563f9a210@xen.org>
Date: Sat, 16 Jul 2022 16:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 6/7] xen/arm: mm: Move domain_{,un}map_* helpers in a
 separate file
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-7-julien@xen.org>
 <c46469ef-6f42-621c-ef4c-3e1e5d6bb0cd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c46469ef-6f42-621c-ef4c-3e1e5d6bb0cd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 24/06/2022 10:43, Jan Beulich wrote:
> On 24.06.2022 11:11, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The file xen/arch/mm.c has been growing quite a lot. It now contains
>> various independent part of the MM subsytem.
>>
>> One of them is the helpers to map/unmap a page when CONFIG_DOMAIN_PAGE
>> (only used by arm32). Move them in a new file xen/arch/arm/domain_page.c.
>>
>> In order to be able to use CONFIG_DOMAIN_PAGE in the Makefile, a new
>> Kconfig option is introduced that is selected by x86 and arm32.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> In principle
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> But ...
> 
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -10,6 +10,7 @@ config X86
>>   	select ALTERNATIVE_CALL
>>   	select ARCH_SUPPORTS_INT128
>>   	select CORE_PARKING
>> +	select DOMAIN_PAGE
>>   	select HAS_ALTERNATIVE
>>   	select HAS_COMPAT
>>   	select HAS_CPUFREQ
>> diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
>> index 07bcd158314b..fbc4bb3416bd 100644
>> --- a/xen/arch/x86/include/asm/config.h
>> +++ b/xen/arch/x86/include/asm/config.h
>> @@ -22,7 +22,6 @@
>>   #define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS 1
>>   #define CONFIG_DISCONTIGMEM 1
>>   #define CONFIG_NUMA_EMU 1
>> -#define CONFIG_DOMAIN_PAGE 1
> 
> ... while I realize it has been named this way, I wonder whether ...
> 
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -11,6 +11,9 @@ config COMPAT
>>   config CORE_PARKING
>>   	bool
>>   
>> +config DOMAIN_PAGE
>> +	bool
> 
> ... this isn't a good opportunity to make the name match what it is
> about - MAP_DOMAIN_PAGE. See e.g. {clear,copy}_domain_page() which
> aren't under this guard, and domain pages in general is a concept we
> can't get away without in the first place.

Fair point. I decided to move this change in a prerequisite name the new 
Kconfig ARCH_MAP_DOMAIN_PAGE.

Cheers,

-- 
Julien Grall


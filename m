Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44107B39DF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 20:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610655.950125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmI1w-0001Ml-14; Fri, 29 Sep 2023 18:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610655.950125; Fri, 29 Sep 2023 18:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmI1v-0001Jk-Ts; Fri, 29 Sep 2023 18:15:59 +0000
Received: by outflank-mailman (input) for mailman id 610655;
 Fri, 29 Sep 2023 18:15:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaAI=FN=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qmI1u-0001Je-LS
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 18:15:58 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b95f6db-5ef4-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 20:15:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 49E578285644;
 Fri, 29 Sep 2023 13:15:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QrZE8fcX8f7x; Fri, 29 Sep 2023 13:15:54 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5AE4082856CF;
 Fri, 29 Sep 2023 13:15:54 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZgkATqvkucEI; Fri, 29 Sep 2023 13:15:54 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E06128285644;
 Fri, 29 Sep 2023 13:15:53 -0500 (CDT)
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
X-Inumbo-ID: 3b95f6db-5ef4-11ee-878c-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5AE4082856CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1696011354; bh=xsCVRKGyYaJM/8/272BDM+ViI9Cavt7wNk+6JaXwXzk=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Uw8MB5B3mp7HT31ztf94qMx0/K96HvImWSJA88dHafk4C9HtCdkpbmSoH5ac/BvBl
	 caKU8nfpROBlGMy/cAIbXBDesuqFnTRWfRR5WGWTRdCchJIJ0l+/15oxYvNrMcrp+c
	 nPnfspnbvBpYZZKtVANmZQOAUFFocmqPam3xY6Dk=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <1c54864c-e2c2-56eb-1b42-6013d9e609e1@raptorengineering.com>
Date: Fri, 29 Sep 2023 13:15:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] xen/ppc: Add .text.exceptions section for exception
 vectors
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
References: <cover.1695942864.git.sanastasio@raptorengineering.com>
 <de5b99d79671a7fe11c5720797aaa6e3207661d1.1695942864.git.sanastasio@raptorengineering.com>
 <dc966303-6b94-4b82-8b66-4c55bc325449@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <dc966303-6b94-4b82-8b66-4c55bc325449@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/29/23 4:28 AM, Andrew Cooper wrote:
> On 29/09/2023 12:19 am, Shawn Anastasio wrote:
>> On Power, the exception vectors must lie at a fixed address, depending
>> on the state of the Alternate Interrupt Location (AIL) field of the
>> Logical Partition Control Register (LPCR). Create a .text.exceptions
>> section in the linker script at an address suitable for AIL=3 plus an
>> accompanying assertion to pave the way for implementing exception
>> support.
> 
> Thanks - this is a perfect level of detail as far as I'm concerned as a
> PPC novice.
> 
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>  xen/arch/ppc/include/asm/config.h | 3 +++
>>  xen/arch/ppc/xen.lds.S            | 7 +++++++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm/config.h
>> index a11a09c570..e012b75beb 100644
>> --- a/xen/arch/ppc/include/asm/config.h
>> +++ b/xen/arch/ppc/include/asm/config.h
>> @@ -42,6 +42,9 @@
>>  
>>  #define XEN_VIRT_START _AC(0xc000000000000000, UL)
>>  
>> +/* Fixed address for start of the section containing exception vectors */
>> +#define EXCEPTION_VECTORS_START _AC(0xc000000000000100, UL)
> 
> The patch looks fine, but a PPC question.  Does AIL=3 really mean a hard
> coded address at 0xc000000000000100 ?
> 
> Or is it +0x100 from something else that happens to be programmed to
> XEN_VIRT_START ?
> 

AIL=3 means a hardcoded address at 0xc000000000004000, actually, but by
placing the section earlier we can take advantage of some of the space
in between ...0100 and ...4000 for things like the {h_,}exception_common
routines introduced in the next patch instead of just having the linker
pad it with nops.

(Now that I look closely though, I see that I erroneously placed those
routines in .text rather than .text.exceptions in the next patch --
that's something I'll fix for v2).

>> +
>>  #define VMAP_VIRT_START (XEN_VIRT_START + GB(1))
>>  #define VMAP_VIRT_SIZE  GB(1)
>>  
>> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
>> index 9e46035155..9e888d7383 100644
>> --- a/xen/arch/ppc/xen.lds.S
>> +++ b/xen/arch/ppc/xen.lds.S
>> @@ -24,6 +24,10 @@ SECTIONS
>>          _stext = .;            /* Text section */
>>          *(.text.header)
>>  
>> +        . = ALIGN(256);
>> +        _stext_exceptions = .;
> 
> If this is really only used for the linker assertion, then it wants to be
> 
>     HIDDEN(_stext_exceptions = .);
> 
> otherwise the debugging symbols will have _stext_exceptions typically
> hiding exc_sysreset in the disassembly and symbol table.
>

It is indeed only used for the assertion -- I'll make this change in v2.

>> +        *(.text.exceptions)
>> +
>>          *(.text.cold)
>>          *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>>  
>> @@ -184,3 +188,6 @@ ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
>>  
>>  ASSERT(!SIZEOF(.got),      ".got non-empty")
>>  ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
>> +
>> +ASSERT(_stext_exceptions == EXCEPTION_VECTORS_START, \
>> +       ".text.exceptions not at expected location -- .text.header too big?");
> 
> No need for ; at the end, and no need for \ either.
>

Will fix.

> As I said for patch 1, we're now at 4.18-rc1.   Does this need to be
> included now, or wait for 4.19?  There's something to be said for having
> a basic exception handler, but it is technically a new feature...
>

I don't think there's any pressing need to bring this into 4.18, unless
the burden of doing so is trivial.

> ~Andrew

Thanks,
Shawn


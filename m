Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B233CB2704C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 22:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082533.1442344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umenV-0001dr-8u; Thu, 14 Aug 2025 20:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082533.1442344; Thu, 14 Aug 2025 20:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umenV-0001bP-5u; Thu, 14 Aug 2025 20:43:41 +0000
Received: by outflank-mailman (input) for mailman id 1082533;
 Thu, 14 Aug 2025 20:43:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQqN=22=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1umenS-0001ak-IC
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 20:43:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59d88611-794f-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 22:43:36 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 72D454EE3C04;
 Thu, 14 Aug 2025 22:43:35 +0200 (CEST)
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
X-Inumbo-ID: 59d88611-794f-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755204215;
	b=14/b92MzxkwMZCBF5XHypzYyRxl+/hMLpZM7UuHUxhiqW0mTIxU/Um3uL/ph5HJcQHo0
	 /avKlISirNh8n/VtdFjxAywfv7Xh2XXDkqbG+sAffzdullnBPgIMRmBtTU8Q0yHqaPyBo
	 l3mDwp8r8mFmsgdId1QrFy0GvKmf+CLwxG8sL2M6wqXF+bvzCOYXnNDs72wzcjI1SdMez
	 L5n4MrK4dnn0px0DeaUfEaFBCEc8944IUY3MMWbu7lHNaUPpbRg0nWezhzhLXKOmtTKXQ
	 XqK4hLTTrfIwvapNa5pUqu/k+Nj50AANkX1QVjBRPVL7YQ8ShXhwHyKeznKkIfZki6Wiq
	 AZhv4dl9+Q8vwVlzVkA8drRsBriymNaWYNlS+Mqwq4RtwuKpCOxyawMk0KqokyMcu1bVX
	 vC4VXAbiQOt4KTo9FF0B3VnJ8uTxC56kcRepZLiNkL7TIqgW2lZbKpbVcvMJkIe7YSXBk
	 Zu7KDBMenHd1ghNkvVP0LOfX0X3CHRTupNaoY3wOBUCRpn1MREyZzf5JeRcLzoNQCZpA5
	 iIFeFqu1jIeOBRIfz8cehIkiQ+zfmQSRMb1SCwtyJQ0geaWYspzU5bMgyvfNrakJ0bgPJ
	 uza1aGOQsa/GtxbVpVZx8b9Kssonhk0tbZ0KZiszNqY4q58pcdXjP55BCdrE31A=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755204215;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=t2i4JB2kkGIb9QprJ692xafevtOStcEc7CYsB6Tvmno=;
	b=vHqa7EkxvD8LefkgyMUnYUTRYJd492G5IXsj/4b1msBuHO0smZu0y4eyhm5Cm/MO4q8s
	 FDZAfsNZ/9ut/kSzQJJ2WadaxI28XqklJVFt5Mb11XywahtEdR2oAlWGOP/hVCKlZykZo
	 MGIU8+L3rUB+GQRC3c8wlyG0mwgCAQSqOyXplpDMP3JXzat9aR8AKyyh8TXO5s/4dK+Zw
	 LyI9Ewea+n2K616ZoFkg2Gu4TmisIleYFdcYLkWAuxoQDV6eCA7OHMor11U+uIkcUXfoK
	 XrT6Ij9AdBSCtGDd6eZYmMFhjJ3ekGoaTCYcIodyCq3y7B1kqeqU0sfJMpX8IK06hzazm
	 Tw6+l3jgiyGqJeTZTcQ924u6xcY7qJoVYrtBqZNqyl8E6bwvS3nQRlUlXrXL7PaFCG26y
	 tKn4EZPV2mkFUGSyBtFgch/5L39ntseDu3e3TAg79rHtcYcwOfoKh/O+5Y76lBcnHkyqV
	 Yw1+zxsKDAwKdxA0h+Nfrbpyn7AYfJ4j8v5xMRHQwkWjBPGR9eYY0nMWbYsIeJdxSf8RN
	 nnXJSGujSrhfNhUOvoO2ZFxbkXrkDuBQ+ailpMHv2N3AqJKONOsLhfYiaq0vvjxc2gn8m
	 Ysh96isyj7FBt/BKeVyt9UpiqQq9Ib9fVJzsfVb4m9ayklMNL0covtl3pRHXZaY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755204215; bh=Sc9DC7YCBMC2KV8sh6G4neQKjGC2jILflCb2j+u4AK4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jRAldRBMvU8xUJLJCeRQ5Uh15/C8PxTzDwZa83UhGLV06v4xsDCiBBWrX6Hv2rbvD
	 cgwL7Xlt7x9qiHcg6dqOrPtFKIAfPzc0HyJC7V8SC+DxIusL+LB5K4GACiBm3X7KVM
	 XEieytyjaMwWSEEQLc+0h8Lov10qNT/Eg5VhDmJp9rb+Hi8YNF8RFh/Xdq761amsBd
	 HzyvKLzHoWbuoek46k7SSdgHLTEcaKC2/6Eff8J/w+pMeHD0noCQoi2U0xakgNUhc6
	 ct8801yElcxgULeOiklxOS7M1DOaQWuOYMUL3rza7p0r6M8WbYfAhtKctQC7Kxfz+G
	 mTUx4WbvkBBzg==
MIME-Version: 1.0
Date: Thu, 14 Aug 2025 22:43:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] misra: allow conversion from unsigned long to
 function pointer
In-Reply-To: <06120b08-7ce8-4d03-b3cd-cbb22547eca3@suse.com>
References: <8cbc9e6d881661d0d7a1055cbcef5a65e20522be.1755109168.git.dmytro_prokopchuk1@epam.com>
 <06120b08-7ce8-4d03-b3cd-cbb22547eca3@suse.com>
Message-ID: <6990512dab007bfa51e4281dda3cc2f0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-14 10:36, Jan Beulich wrote:
> On 13.08.2025 20:27, Dmytro Prokopchuk1 wrote:
>> ...
>> 
>> from `vaddr_t' (that is `unsigned long') to `switch_ttbr_fn*' (that is 
>> `void(*)(unsigned long)')
>> 
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
>> This is just a RFC patch.
>> The commit message is not important at this stage.
>> 
>> I am seeking comments regarding this case.
>> 
>> Thanks.
>> ---
>>  automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
>>  docs/misra/deviations.rst                        | 10 ++++++++++
>>  docs/misra/rules.rst                             |  8 +++++++-
>>  xen/arch/arm/arm64/mmu/mm.c                      |  2 ++
>>  4 files changed, 27 insertions(+), 1 deletion(-)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index ebce1ceab9..f9fd6076b7 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -365,6 +365,14 @@ constant expressions are required.\""
>>  }
>>  -doc_end
>> 
>> +-doc_begin="The conversion from unsigned long to a function pointer 
>> does not lose any information, provided that the source type has 
>> enough bits to restore it."
>> +-config=MC3A2.R11.1,casts+={safe,
>> +  "from(type(canonical(builtin(unsigned long))))
>> +   &&to(type(canonical(__function_pointer_types)))
>> +   &&relation(definitely_preserves_value)"
>> +}
>> +-doc_end
>> +

This check is not quite targeted at this situation, as the behaviour of 
different compilers is a bit of a grey area (even GCC, though that works 
in practice). The relation is mostly aimed at testing whether the 
pointer are represented using the same number of bits as unsigned long 
(which happens to be the case fortunately).

>>  -doc_begin="The conversion from a function pointer to a boolean has a 
>> well-known semantics that do not lead to unexpected behaviour."
>>  -config=MC3A2.R11.1,casts+={safe,
>>    "from(type(canonical(__function_pointer_types)))
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index 3c46a1e47a..27848602f6 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -348,6 +348,16 @@ Deviations related to MISRA C:2012 Rules:
>>         to store it.
>>       - Tagged as `safe` for ECLAIR.
>> 
>> +   * - R11.1
>> +     - The conversion from unsigned long to a function pointer does 
>> not lose any
>> +       information or violate type safety assumptions if the unsigned 
>> long type
>> +       is guaranteed to be at least as large as a function pointer. 
>> This ensures
>> +       that the function pointer address can be fully represented 
>> without
>> +       truncation or corruption. Macro BUILD_BUG_ON can be integrated 
>> into the
>> +       build system to confirm that 'sizeof(unsigned long) >= 
>> sizeof(void (*)())'
>> +       on all target platforms.
> 
> If sizeof(unsigned long) > sizeof(void (*)()), there is loss of 
> information.
> Unless (not said here) the unsigned long value itself is the result of
> converting a function pointer to unsigned long. Whether all of that 
> together
> can be properly expressed to Eclair I don't know. Hence, as Teddy 
> already
> suggested, == may want specifying instead.
> 

+1; it might be worth to add both the eclair config and the 
BUILD_BUG_ON, noting that neither is sufficient on its own: unless the 
compiler guarantees not to fiddle with the value is unaltered when cast 
back and forth all checks on the number of bits are moot.

>> --- a/xen/arch/arm/arm64/mmu/mm.c
>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>> @@ -150,6 +150,7 @@ void __init relocate_and_switch_ttbr(uint64_t 
>> ttbr)
>>      vaddr_t id_addr = virt_to_maddr(relocate_xen);
>>      relocate_xen_fn *fn = (relocate_xen_fn *)id_addr;
>>      lpae_t pte;
>> +    BUILD_BUG_ON(sizeof(unsigned long) < sizeof(fn));
>> 
>>      /* Enable the identity mapping in the boot page tables */
>>      update_identity_mapping(true);
>> @@ -178,6 +179,7 @@ void __init switch_ttbr(uint64_t ttbr)
>>      vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
>>      switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
>>      lpae_t pte;
>> +    BUILD_BUG_ON(sizeof(unsigned long) < sizeof(fn));
>> 
>>      /* Enable the identity mapping in the boot page tables */
>>      update_identity_mapping(true);
> 
> BUILD_BUG_ON() is a statement, not a declaration, and hence wants 
> grouping
> as such. Question is whether we indeed want to sprinkle such checks all
> over the code base. (I expect the two cases here aren't all we have.)
> 

+1 as well. I would expect such check to live e.g. in compiler.h or any 
similarly general header, since this is a widespread and largely 
arch-neutral property that Xen wants to be always true I believe.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253


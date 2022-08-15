Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D08593367
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 18:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387694.624042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNdCT-00041u-VM; Mon, 15 Aug 2022 16:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387694.624042; Mon, 15 Aug 2022 16:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNdCT-0003z8-SZ; Mon, 15 Aug 2022 16:44:25 +0000
Received: by outflank-mailman (input) for mailman id 387694;
 Mon, 15 Aug 2022 16:44:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oNdCS-0003z2-99
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 16:44:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNdCR-0001FY-UQ; Mon, 15 Aug 2022 16:44:23 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.149.129]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNdCR-0000P5-O6; Mon, 15 Aug 2022 16:44:23 +0000
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
	bh=lYkOHBE5nKzIhvD+AVcWXwGZcoujkJldrbnr3dE6HO0=; b=FZnsANy98qjO+x2BeoypKhkaxO
	g5zs5OOkguhzpXnzUrctKMCguOuLjYtAJCPmHhuTSPGSYrNoVpcEQo2MhHSqplI8gV09xb3n0tvrq
	5uadMwUJfWyUHRVhk0hd1C7wRnSmLX34laCYVWYzR2TameLQe0yWW4Clmr72F5KtjU2g=;
Message-ID: <3136c797-652b-97c9-b356-b49fe53a40b5@xen.org>
Date: Mon, 15 Aug 2022 17:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 2/7] xen/arm64: head: Introduce get_table_slot() and use
 it
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-3-julien@xen.org>
 <8FA138D1-CBF2-4BAB-9283-2573A6A09C79@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8FA138D1-CBF2-4BAB-9283-2573A6A09C79@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/2022 15:45, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 12 Aug 2022, at 20:24, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> There are a few places in the code that need to find the slot
>> at a given page-table level.
>>
>> So create a new macro get_table_slot() for that. This will reduce
>> the effort to figure out whether the code is doing the right thing.
>>
>> Take the opportunity to use 'ubfx'. The only benefits is reducing
>> the number of instructions from 2 to 1.
>>
>> The new macro is used everywhere we need to compute the slot. This
>> requires to tweak the parameter of create_table_entry() to pass
>> a level rather than shift.
>>
>> Note, for slot 0 the code is currently skipping the masking part. While
>> this is fine, it is safer to mask it as technically slot 0 only covers
>> bit 48 - 39 bit (assuming 4KB page granularity).
>>
>> Take the opportunity to correct the comment when finding the second
>> slot for the identity mapping (we are computing the second slot
>> rather than first).
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks!

>>
>> ----
>>
>>     This patch also has the benefits to reduce the number
>>     of use of {ZEROETH, FIRST, SECOND, THIRD}_SHIFT. The next
>>     patch for arm32 will reduce further.
>> ---
>> xen/arch/arm/arm64/head.S | 55 +++++++++++++++++++++------------------
>> 1 file changed, 30 insertions(+), 25 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 26cc7705f556..ad014716db6f 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -493,13 +493,24 @@ cpu_init:
>>          ret
>> ENDPROC(cpu_init)
>>
>> +/*
>> + * Macro to find the slot number at a given page-table level
>> + *
>> + * slot:     slot computed
>> + * virt:     virtual address
>> + * lvl:      page-table level
>> + */
>> +.macro get_table_slot, slot, virt, lvl
>> +        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
>> +.endm
>> +
> 
> Crawling through the macros to verify the code was not that easy.
> This is not related to this patch but XEN_PT_* macros could really do with more comments.

To me, the name of the macros are self-explaining. So I am not entirely 
what to write in the comments. Please suggest.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC18C7CAFA9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 18:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617879.960957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQZe-0005jO-Pm; Mon, 16 Oct 2023 16:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617879.960957; Mon, 16 Oct 2023 16:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQZe-0005gX-N5; Mon, 16 Oct 2023 16:36:10 +0000
Received: by outflank-mailman (input) for mailman id 617879;
 Mon, 16 Oct 2023 16:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2KAZ=F6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qsQZd-0005gR-Ks
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 16:36:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 183239b9-6c42-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 18:36:02 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 202D34EE0737;
 Mon, 16 Oct 2023 18:36:02 +0200 (CEST)
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
X-Inumbo-ID: 183239b9-6c42-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 16 Oct 2023 18:36:02 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-next v2 5/8] x86/io_apic: address violation of
 MISRA C:2012 Rule 10.1
In-Reply-To: <262b878b-578f-451a-6e7d-18af4a826848@suse.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <1fe7602b48cabb7710025f6b4e32e9b99a1faacd.1697123806.git.nicola.vetrini@bugseng.com>
 <262b878b-578f-451a-6e7d-18af4a826848@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <e4e6f6e9e0157a89fe50179d6f8fdbcd@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 17:42, Jan Beulich wrote:
> On 12.10.2023 17:28, Nicola Vetrini wrote:
>> The definition of IO_APIC_BASE contains a sum of an essentially enum
>> value (FIX_IO_APIC_BASE_0) that is positive with an index that, in all
>> instances, is unsigned, therefore the former is cast to unsigned, so 
>> that
>> the operands are of the same essential type.
>> 
>> No functional change.
>> ---
>>  xen/arch/x86/include/asm/io_apic.h | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>> 
>> diff --git a/xen/arch/x86/include/asm/io_apic.h 
>> b/xen/arch/x86/include/asm/io_apic.h
>> index a7e4c9e146de..a0fc50d601fe 100644
>> --- a/xen/arch/x86/include/asm/io_apic.h
>> +++ b/xen/arch/x86/include/asm/io_apic.h
>> @@ -14,9 +14,10 @@
>>   * Copyright (C) 1997, 1998, 1999, 2000 Ingo Molnar
>>   */
>> 
>> -#define IO_APIC_BASE(idx)                                             
>>   \
>> -    ((volatile uint32_t *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + (idx))  
>>   \
>> -                           + (mp_ioapics[idx].mpc_apicaddr & 
>> ~PAGE_MASK)))
>> +#define IO_APIC_BASE(idx)                                     \
>> +    ((volatile uint32_t *)                                    \
>> +     (__fix_to_virt((unsigned int)FIX_IO_APIC_BASE_0 + (idx)) \
>> +      + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
> 
> Let's assume that down the road we want to make __fix_to_virt() an 
> inline
> function (which perhaps it really ought to be already): Won't this 
> trade
> one violation for another then?

I don't think so: the violation is in the argument to the macro (i.e., 
the fact that
idx is unsigned and FIX_IO_APIC_BASE_0 is a constant from a named enum). 
Do you see a way in
which a MISRA rule is violated if __fix_to_virt becomes a function with 
an unsigned int argument?

> I wonder whether the better course of
> action wouldn't be to switch the two enums to be "anonymous", even if 
> that
> means adjusting __set_fixmap() and __set_fixmap_x().
> 

I don't know. It certainly would help from a violation count 
perspective, though that's more of a code
style decision in my opinion.

> As an aside, since you touch the entire construct, it would be nice if 
> the
> + was also moved to the end of the earlier line.
> 

Sure

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)


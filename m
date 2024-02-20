Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C956885B4B1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683196.1062580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLGu-0007pZ-Jl; Tue, 20 Feb 2024 08:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683196.1062580; Tue, 20 Feb 2024 08:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLGu-0007o9-EX; Tue, 20 Feb 2024 08:14:36 +0000
Received: by outflank-mailman (input) for mailman id 683196;
 Tue, 20 Feb 2024 08:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQVm=J5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rcLGs-0007nv-U6
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:14:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13a3a70b-cfc8-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 09:14:32 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 107B54EE073A;
 Tue, 20 Feb 2024 09:14:32 +0100 (CET)
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
X-Inumbo-ID: 13a3a70b-cfc8-11ee-98f5-efadbce2ee36
MIME-Version: 1.0
Date: Tue, 20 Feb 2024 09:14:32 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
In-Reply-To: <d90d98b6-508b-4a2a-ab6a-74a9828a5b94@suse.com>
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
 <d90d98b6-508b-4a2a-ab6a-74a9828a5b94@suse.com>
Message-ID: <45509cb67ecee3f690b5784489b5ccb4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-20 08:45, Jan Beulich wrote:
> On 19.02.2024 16:14, Nicola Vetrini wrote:
>> The cache clearing and invalidation helpers in x86 and Arm didn't
>> comply with MISRA C Rule 17.7: "The value returned by a function
>> having non-void return type shall be used". On Arm they
>> were always returning 0, while some in x86 returned -EOPNOTSUPP
>> and in common/grant_table the return value is saved.
>> 
>> As a consequence, a common helper arch_grant_cache_flush that returns
>> an integer is introduced, so that each architecture can choose whether 
>> to
>> return an error value on certain conditions, and the helpers have 
>> either
>> been changed to return void (on Arm) or deleted entirely (on x86).
>> 
>> Signed-off-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> The original refactor idea came from Julien Grall in [1]; I edited 
>> that proposal
>> to fix build errors.
>> 
>> I did introduce a cast to void for the call to flush_area_local on 
>> x86, because
>> even before this patch the return value of that function wasn't 
>> checked in all
>> but one use in x86/smp.c, and in this context the helper (perhaps 
>> incidentally)
>> ignored the return value of flush_area_local.
> 
> I object to such casting to void, at least until there's an overriding
> decision that for Misra purposes such casts may be needed.
> 

There are three choices here:
1. cast to void
2. deviation for flush_area_local, which for the case of the cache 
helpers is what led to this patch; it may still be a viable option, if 
other maintainers agree
3. refactor of flush_area_local; this is not viable here because the 
return value is actually used and useful, as far as I can tell, in smp.c

>> --- a/xen/arch/arm/include/asm/page.h
>> +++ b/xen/arch/arm/include/asm/page.h
>> @@ -123,6 +123,7 @@
>> 
>>  #ifndef __ASSEMBLY__
>> 
>> +#include <public/grant_table.h>
> 
> This is a no-go, imo (also on x86): Adding this include here 
> effectively
> means that nearly every CU will have a dependency on that header, no
> matter that most are entirely agnostic of grants. Each arch has a
> grant_table.h - is there any reason the new, grant-specific helper 
> can't
> be put there?
> 

I would have to test, but I think that can be done

>> @@ -182,21 +183,21 @@ void flush_area_mask(const cpumask_t *mask, 
>> const void *va,
>>  }
>> 
>>  static inline void flush_page_to_ram(unsigned long mfn, bool 
>> sync_icache) {}
>> -static inline int invalidate_dcache_va_range(const void *p,
>> -                                             unsigned long size)
>> -{ return -EOPNOTSUPP; }
>> -static inline int clean_and_invalidate_dcache_va_range(const void *p,
>> -                                                       unsigned long 
>> size)
>> +
>> +static inline int arch_grant_cache_flush(unsigned int op, const void 
>> *p,
>> +                                     unsigned long size)
>>  {
>> -    unsigned int order = get_order_from_bytes(size);
>> +    unsigned int order;
>> +
>> +    if ( !(op & GNTTAB_CACHE_CLEAN) )
>> +        return -EOPNOTSUPP;
>> +
>> +    order = get_order_from_bytes(size);
>>      /* sub-page granularity support needs to be added if necessary */
>> -    flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
>> +    (void) flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
> 
> As to my objection to the addition of a cast, did you actually check
> what this function returns, before saying "incidentally" in the
> respective remark? Already the return type being "unsigned int" is
> indicative of the return value not being suitable here for handing
> on.
> 

My "incidentally" was motivated by the fact that the caller doesn't 
check whether
flags_in != flags_out (effectively tests for the execution of a certain 
code path). It may have been deliberate or not, I don't know. If it was 
accidental, then a check of the return value in arch_grant_cache_flush 
will eliminate the need for a void cast.

> In addition there shouldn't be a blank after a cast. Instead, if
> already you were to touch this line, it would have been nice if you
> took the opportunity and added the missing blanks around the binary
> operator involved.
> 

That's true, thanks.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)


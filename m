Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144262D9949
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 14:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52257.91333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kooKP-0007KH-HU; Mon, 14 Dec 2020 13:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52257.91333; Mon, 14 Dec 2020 13:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kooKP-0007Jp-Cp; Mon, 14 Dec 2020 13:55:53 +0000
Received: by outflank-mailman (input) for mailman id 52257;
 Mon, 14 Dec 2020 13:55:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kooKN-0007Jk-Qj
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 13:55:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b22d7080-a990-43c1-b495-ed87001f7a22;
 Mon, 14 Dec 2020 13:55:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF6BBAC7F;
 Mon, 14 Dec 2020 13:55:49 +0000 (UTC)
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
X-Inumbo-ID: b22d7080-a990-43c1-b495-ed87001f7a22
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607954149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNYpPEClLjxLbkfVQ8T387bhQE14P7Zufj3BdmP/yaU=;
	b=YJf09CE4zXHqZGHDKo/uzjDk+ssnVwbXtY02AJlEggvBn63y1TMAWyAymmi4Igwm0oZ/bR
	jEdiecSRmdtIfq1BJPQxbu+EG1LsRwKzntqWc23DE8ala/UryqMyRnFMWeQDYjGJLy76BI
	Cjk1xbsbsi9E3ri86M1uqVARi+cr97Y=
Subject: Re: [PATCH] Revert "x86/mm: drop guest_get_eff_l1e()"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Manuel Bouyer <bouyer@antioche.eu.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201211141615.12489-1-andrew.cooper3@citrix.com>
 <454ec720-b823-c2aa-7de4-84c14db2b96f@suse.com>
 <3ab84773-6fec-b653-0d5b-a9374ef336c9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b29a6c3-cd72-9fe2-dbef-076db891bdda@suse.com>
Date: Mon, 14 Dec 2020 14:55:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <3ab84773-6fec-b653-0d5b-a9374ef336c9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.12.2020 14:21, Andrew Cooper wrote:
> On 14/12/2020 08:27, Jan Beulich wrote:
>> On 11.12.2020 15:16, Andrew Cooper wrote:
>>> This reverts commit 9ff9705647646aa937b5f5c1426a64c69a62b3bd.
>>>
>>> The change is only correct in the original context of XSA-286, where Xen's use
>>> of the linear pagetables were dropped.  However, performance problems
>>> interfered with that plan, and XSA-286 was fixed differently.
>>>
>>> This broke Xen's lazy faulting of the LDT for 64bit PV guests when an access
>>> was first encountered in user context.  Xen would proceed to read the
>>> registered LDT virtual address out of the user pagetables, not the kernel
>>> pagetables.
>>>
>>> Given the nature of the bug, it would have also interfered with the IO
>>> permisison bitmap functionality of userspace, which similarly needs to read
>>> data using the kernel pagetables.
>> This paragraph wants dropping afaict - guest_io_okay() has
>> explicit calls to toggle_guest_pt(), and hence is unaffected by
>> the bug here (and there is in particular page tables reading
>> involved there). Then ...
>>
>>> Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Tested-by: Manuel Bouyer <bouyer@antioche.eu.org>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> I was wondering however whether we really want a full revert. I've
>> locally made the change below as an alternative.
>>
>> Jan
>>
>> x86/PV: guest_get_eff_kern_l1e() may still need to switch page tables
>>
>> While indeed unnecessary for pv_ro_page_fault(), pv_map_ldt_shadow_page()
>> may run when guest user mode is active, and hence may need to switch to
>> the kernel page tables in order to retrieve an LDT page mapping.
>>
>> Fixes: 9ff970564764 ("x86/mm: drop guest_get_eff_l1e()")
>> Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This is the alternative to fully reverting the offending commit.
> 
> Hmm yes - I think I prefer this, because we don't really want to keep
> the non-kern alternative.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> however ...

Thanks.

>> I've also been considering to drop the paging-mode-translate ASSERT(),
>> now that we always have translate == external.
> 
> I'd suggest not making that change here in this bugfix.  I think we do
> want to alter how we do asserts like this, and there are other similarly
> impacted code blocks.

Okay, will look forward to learn what exactly you have in mind.

>> --- a/xen/arch/x86/pv/mm.h
>> +++ b/xen/arch/x86/pv/mm.h
>> @@ -11,10 +11,14 @@ int new_guest_cr3(mfn_t mfn);
>>   */
>>  static inline l1_pgentry_t guest_get_eff_kern_l1e(unsigned long linear)
>>  {
>> +    struct vcpu *curr = current;
>>      l1_pgentry_t l1e;
>>  
>> -    ASSERT(!paging_mode_translate(current->domain));
>> -    ASSERT(!paging_mode_external(current->domain));
>> +    ASSERT(!paging_mode_translate(curr->domain));
>> +    ASSERT(!paging_mode_external(curr->domain));
>> +
>> +    if ( !(curr->arch.flags & TF_kernel_mode) )
> 
> ... pull this out into a variable, like the original code used to do.
> 
> bool user_mode = !(curr->arch.flags & TF_kernel_mode);
> 
> I've forgotten which static checker tripped up over this form, but one
> did IIRC.

I've made the change (will send the result in a minute), but I'm curious
not so much which checker might have taken issue here but why.

Jan


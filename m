Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E57E2D98A8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 14:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52241.91321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1konoB-0004S8-TE; Mon, 14 Dec 2020 13:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52241.91321; Mon, 14 Dec 2020 13:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1konoB-0004Rj-Q8; Mon, 14 Dec 2020 13:22:35 +0000
Received: by outflank-mailman (input) for mailman id 52241;
 Mon, 14 Dec 2020 13:22:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oe/o=FS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1konoA-0004RZ-1j
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 13:22:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e01e75d3-f6ad-4cb5-86e1-077d24e1129c;
 Mon, 14 Dec 2020 13:22:32 +0000 (UTC)
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
X-Inumbo-ID: e01e75d3-f6ad-4cb5-86e1-077d24e1129c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607952152;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=qM7SgSHhkF8WKfmbLi+/z+HVJ5RbulhwJlW7+065cRk=;
  b=eo+40o141tjCK6lNy59olrPogfYGc8OQLCkGIySEun+I9gkoKWuYVk7m
   Hc1GFdeTsX5jL5SmpsN5A6Slo0Ujmxr4j7OnQDJZp3h4ymqPruhU9i5TA
   inX3vAp2weouGyLds3CMdn2bcTLTQTj/wwJkMkQ32hoE/1BM+Ygx948IZ
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ES5v1KAWikmdTbi+he6w+WwCDOcj4Ts9/6SQfc7wAZgpZ+jgHdQwJcez7orTTdUcp5UZWXo7w5
 kKUuPSMkZxZ/IKGYKtBKXUmx812svJvgExN73ZRbMhMmA5l/aQDlhSuMrDbNifvLQfT6awtMjf
 hfXk2yYO7D/Kz/HXiptj5qbSqY5i02RErfejXXh/PwIr5BH3r4eZTMRalr8cyy8qPvqgjqRn3w
 qNOs5fLfU/8hU9zDOsfKD92spTLS64DGMy9z3wJbpIchCe2I/SjC+agvu9T01Ub+Kh/5mK+lPo
 5Cs=
X-SBRS: 5.2
X-MesageID: 33162698
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,418,1599537600"; 
   d="scan'208";a="33162698"
Subject: Re: [PATCH] Revert "x86/mm: drop guest_get_eff_l1e()"
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Manuel Bouyer <bouyer@antioche.eu.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20201211141615.12489-1-andrew.cooper3@citrix.com>
 <454ec720-b823-c2aa-7de4-84c14db2b96f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3ab84773-6fec-b653-0d5b-a9374ef336c9@citrix.com>
Date: Mon, 14 Dec 2020 13:21:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <454ec720-b823-c2aa-7de4-84c14db2b96f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 14/12/2020 08:27, Jan Beulich wrote:
> On 11.12.2020 15:16, Andrew Cooper wrote:
>> This reverts commit 9ff9705647646aa937b5f5c1426a64c69a62b3bd.
>>
>> The change is only correct in the original context of XSA-286, where Xen's use
>> of the linear pagetables were dropped.  However, performance problems
>> interfered with that plan, and XSA-286 was fixed differently.
>>
>> This broke Xen's lazy faulting of the LDT for 64bit PV guests when an access
>> was first encountered in user context.  Xen would proceed to read the
>> registered LDT virtual address out of the user pagetables, not the kernel
>> pagetables.
>>
>> Given the nature of the bug, it would have also interfered with the IO
>> permisison bitmap functionality of userspace, which similarly needs to read
>> data using the kernel pagetables.
> This paragraph wants dropping afaict - guest_io_okay() has
> explicit calls to toggle_guest_pt(), and hence is unaffected by
> the bug here (and there is in particular page tables reading
> involved there). Then ...
>
>> Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Tested-by: Manuel Bouyer <bouyer@antioche.eu.org>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> I was wondering however whether we really want a full revert. I've
> locally made the change below as an alternative.
>
> Jan
>
> x86/PV: guest_get_eff_kern_l1e() may still need to switch page tables
>
> While indeed unnecessary for pv_ro_page_fault(), pv_map_ldt_shadow_page()
> may run when guest user mode is active, and hence may need to switch to
> the kernel page tables in order to retrieve an LDT page mapping.
>
> Fixes: 9ff970564764 ("x86/mm: drop guest_get_eff_l1e()")
> Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is the alternative to fully reverting the offending commit.

Hmm yes - I think I prefer this, because we don't really want to keep
the non-kern alternative.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> however ...

> I've also been considering to drop the paging-mode-translate ASSERT(),
> now that we always have translate == external.

I'd suggest not making that change here in this bugfix.  I think we do
want to alter how we do asserts like this, and there are other similarly
impacted code blocks.

>
> --- a/xen/arch/x86/pv/mm.h
> +++ b/xen/arch/x86/pv/mm.h
> @@ -11,10 +11,14 @@ int new_guest_cr3(mfn_t mfn);
>   */
>  static inline l1_pgentry_t guest_get_eff_kern_l1e(unsigned long linear)
>  {
> +    struct vcpu *curr = current;
>      l1_pgentry_t l1e;
>  
> -    ASSERT(!paging_mode_translate(current->domain));
> -    ASSERT(!paging_mode_external(current->domain));
> +    ASSERT(!paging_mode_translate(curr->domain));
> +    ASSERT(!paging_mode_external(curr->domain));
> +
> +    if ( !(curr->arch.flags & TF_kernel_mode) )

... pull this out into a variable, like the original code used to do.

bool user_mode = !(curr->arch.flags & TF_kernel_mode);

I've forgotten which static checker tripped up over this form, but one
did IIRC.

~Andrew

> +        toggle_guest_pt(curr);
>  
>      if ( unlikely(!__addr_ok(linear)) ||
>           __copy_from_user(&l1e,
> @@ -22,6 +26,9 @@ static inline l1_pgentry_t guest_get_eff
>                            sizeof(l1_pgentry_t)) )
>          l1e = l1e_empty();
>  
> +    if ( !(curr->arch.flags & TF_kernel_mode) )
> +        toggle_guest_pt(curr);
> +
>      return l1e;
>  }
>  



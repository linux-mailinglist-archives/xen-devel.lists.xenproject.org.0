Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC82F7C83
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 14:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68086.121807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0P7E-0002MQ-Fv; Fri, 15 Jan 2021 13:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68086.121807; Fri, 15 Jan 2021 13:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0P7E-0002Lz-An; Fri, 15 Jan 2021 13:26:12 +0000
Received: by outflank-mailman (input) for mailman id 68086;
 Fri, 15 Jan 2021 13:26:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0P7C-0002Lu-EK
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 13:26:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 991092ca-4f69-417e-8182-4ac55d4d3f6b;
 Fri, 15 Jan 2021 13:26:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 975FCB923;
 Fri, 15 Jan 2021 13:26:08 +0000 (UTC)
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
X-Inumbo-ID: 991092ca-4f69-417e-8182-4ac55d4d3f6b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610717168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8jAKKzWrwAzlne3DSaM/hsdku4mtYxCzZ6ajU68+P8=;
	b=iVCVnsV1Vcl2uTvjLYiAmZ6p/g/EEgu8hWabIkN31xnJGjeDMWEgeyBtdvA5ptpwTUPOuJ
	9y1KHNhQjppDV8IY5BdGmks80G/WwEBldhRYozmaxMfR//TavWSQJXLVwsbTd7WJy6XLzD
	wCmMz9K72qQY7h7hutPm+FfpqZ6B8nE=
Subject: Re: [PATCH 1/3] gnttab: adjust pin count overflow checks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
 <38331526-5c24-08d4-b1b6-9baa16251c1d@suse.com>
 <fb12277c-beaf-2058-69ce-0c7c14bce56c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cea405c4-354d-307a-4465-a9a59b1a5696@suse.com>
Date: Fri, 15 Jan 2021 14:26:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <fb12277c-beaf-2058-69ce-0c7c14bce56c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 14:09, Andrew Cooper wrote:
> On 14/01/2021 15:23, Jan Beulich wrote:
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -323,22 +323,25 @@ shared_entry_header(struct grant_table *
>>  /* Active grant entry - used for shadowing GTF_permit_access grants. */
>>  struct active_grant_entry {
>>      uint32_t      pin;    /* Reference count information:             */
>> +                          /* Width of the individual counter fields.  */
>> +#define GNTPIN_cntr_width    8
>> +#define GNTPIN_cntr_mask     ((1U << GNTPIN_cntr_width) - 1)
>>                            /* Count of writable host-CPU mappings.     */
>>  #define GNTPIN_hstw_shift    0
>>  #define GNTPIN_hstw_inc      (1U << GNTPIN_hstw_shift)
>> -#define GNTPIN_hstw_mask     (0xFFU << GNTPIN_hstw_shift)
>> +#define GNTPIN_hstw_mask     (GNTPIN_cntr_mask << GNTPIN_hstw_shift)
>>                            /* Count of read-only host-CPU mappings.    */
>> -#define GNTPIN_hstr_shift    8
>> +#define GNTPIN_hstr_shift    (GNTPIN_hstw_shift + GNTPIN_cntr_width)
> 
> While this patch is by-and-large an improvement, it unfortunately
> further hides how the pin field works, which is already clear-as-mud.
> 
> I'd recommend replacing the "Reference count information:" comment with:
> 
> /*
>  * 4x byte-wide reference counts, for {host,device}{read,write}
>  * mappings, implemented as a single 32bit presumably to optimise
>  * checking for any reference.
>  */
> uint32_t      pin;

Sure, added.

>> @@ -1052,19 +1063,19 @@ map_grant_ref(
>>      shah = shared_entry_header(rgt, ref);
>>      act = active_entry_acquire(rgt, ref);
>>  
>> -    /* Make sure we do not access memory speculatively */
>> -    status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
>> -                                                 : &status_entry(rgt, ref);
>> -
>>      /* If already pinned, check the active domid and avoid refcnt overflow. */
>>      if ( act->pin &&
>>           ((act->domid != ld->domain_id) ||
>> -          (act->pin & 0x80808080U) != 0 ||
>> +          (act->pin & (pin_incr << (GNTPIN_cntr_width - 1))) ||
> 
> This, I'm afraid, is not an improvement.  What we want is:
> 
> #define GNTPIN_overflow_mask 0x80808080U
> 
> The reason for checking all at once is defence in depth (not strictly
> necessary, but also not a problem),

How is this not a problem? There is absolutely no reason to
reject a request just because some unrelated field may be
about to overflow. In fact I now think that I didn't even
leverage the full potential - the "act->pin != old_pin" check
could also be relaxed this way, I think. Just that it sits on
a path we probably don't really care about very much.

> and in this specific example, using
> a constant results in better code because pin_incr doesn't need
> unspilling from stack and manipulated.

That's, I think, an acceptable price to pay for getting the
checking correct.

> If you're happy with both of these suggestions, then Reviewed-by: Andrew
> Cooper <andrew.cooper3@citrix.com> to avoid a repost.

Thanks, but as per above - not yet. Plus if I made this 2nd
suggested change, the patch would change significantly (the
new local variable would then become pointless in at least
acquire_grant_for_copy()), which I think would better involve
re-posting then.

Jan


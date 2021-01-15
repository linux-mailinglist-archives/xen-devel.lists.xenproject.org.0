Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F27D2F7E0B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68140.121906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0PzF-0000ae-RW; Fri, 15 Jan 2021 14:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68140.121906; Fri, 15 Jan 2021 14:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0PzF-0000aF-Nx; Fri, 15 Jan 2021 14:22:01 +0000
Received: by outflank-mailman (input) for mailman id 68140;
 Fri, 15 Jan 2021 14:22:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0PzE-0000aA-Lg
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:22:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 430f0a15-4624-4fb2-a417-ece855ceba26;
 Fri, 15 Jan 2021 14:21:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9736EAC8F;
 Fri, 15 Jan 2021 14:21:58 +0000 (UTC)
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
X-Inumbo-ID: 430f0a15-4624-4fb2-a417-ece855ceba26
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610720518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oqNTF4et6TgZ+0836/vWtYf6MKTLYnK0gSQLP+eu48=;
	b=tNJ295P1qOvbucsWNpql1j2E40Izv7YasQVKtgQH63hR8yzZoFmCkCGsmlcVMaDGaJfuvo
	4AqvVA8tFv22KL5t06wqCJtc/zzU+qTyVKx/DgLvL9qQjGUDbdMbeLBVbfiqXOXpxu9dYt
	x3U1YlW3tvTfpbxEif4y3/hFga7gxBg=
Subject: Re: [PATCH 1/3] gnttab: adjust pin count overflow checks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <556c42fd-d7f8-f09f-eb3a-6b724d2b467d@suse.com>
 <38331526-5c24-08d4-b1b6-9baa16251c1d@suse.com>
 <fb12277c-beaf-2058-69ce-0c7c14bce56c@citrix.com>
 <cea405c4-354d-307a-4465-a9a59b1a5696@suse.com>
 <ab7cbe24-8a05-203d-175a-9e85d3ed1ee1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54c340a9-4515-e79c-84b7-44431c481fba@suse.com>
Date: Fri, 15 Jan 2021 15:21:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ab7cbe24-8a05-203d-175a-9e85d3ed1ee1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 14:35, Andrew Cooper wrote:
> On 15/01/2021 13:26, Jan Beulich wrote:
>> On 15.01.2021 14:09, Andrew Cooper wrote:
>>> On 14/01/2021 15:23, Jan Beulich wrote:
>>>> @@ -1052,19 +1063,19 @@ map_grant_ref(
>>>>      shah = shared_entry_header(rgt, ref);
>>>>      act = active_entry_acquire(rgt, ref);
>>>>  
>>>> -    /* Make sure we do not access memory speculatively */
>>>> -    status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
>>>> -                                                 : &status_entry(rgt, ref);
>>>> -
>>>>      /* If already pinned, check the active domid and avoid refcnt overflow. */
>>>>      if ( act->pin &&
>>>>           ((act->domid != ld->domain_id) ||
>>>> -          (act->pin & 0x80808080U) != 0 ||
>>>> +          (act->pin & (pin_incr << (GNTPIN_cntr_width - 1))) ||
>>> This, I'm afraid, is not an improvement.  What we want is:
>>>
>>> #define GNTPIN_overflow_mask 0x80808080U
>>>
>>> The reason for checking all at once is defence in depth (not strictly
>>> necessary, but also not a problem),
>> How is this not a problem? There is absolutely no reason to
>> reject a request just because some unrelated field may be
>> about to overflow. In fact I now think that I didn't even
>> leverage the full potential - the "act->pin != old_pin" check
>> could also be relaxed this way, I think. Just that it sits on
>> a path we probably don't really care about very much.
> 
> Hmm - I see your point.  I'd missed the fact that a previous operation
> could leave this timebomb waiting for us.  (Probably wants a note to
> this effect in the commit message).

I've added half a sentence.

> However we go about fixing it, "pin_incr << (GNTPIN_cntr_width - 1)" is
> too obscure IMO.  Perhaps all we need is a
> 
> #define GNTPIN_overflow_mask(x) ((x) << (GNTPIN_cntr_width - 1))
> 
> but it does occur to me that this logic only works to being with when
> pin_incr is strictly 1 in the relevant bytes.

Perhaps

#define GNTPIN_overflow_mask(x) ({ \
    ASSERT(!((x) & ~(GNTPIN_hstw_inc | GNTPIN_hstr_inc | \
                     GNTPIN_devw_inc | GNTPIN_devr_inc))); \
    (x) << (GNTPIN_cntr_width - 1); \
})

? And maybe name the whole thing e.g. GNTPIN_incr2oflow_mask()
to clarify the input is an increment (which I personally take
to mean consisting of only values of 1, but I realize views
may vary)?

Jan


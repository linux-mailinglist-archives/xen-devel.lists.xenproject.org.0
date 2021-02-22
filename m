Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A7321A27
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88109.165559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEC6f-0001Yk-IV; Mon, 22 Feb 2021 14:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88109.165559; Mon, 22 Feb 2021 14:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEC6f-0001YA-FI; Mon, 22 Feb 2021 14:22:37 +0000
Received: by outflank-mailman (input) for mailman id 88109;
 Mon, 22 Feb 2021 14:22:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEC6e-0001Xi-8w
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 14:22:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 891291a7-b0cb-4b34-9f74-99a3651c5535;
 Mon, 22 Feb 2021 14:22:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0422FACBF;
 Mon, 22 Feb 2021 14:22:34 +0000 (UTC)
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
X-Inumbo-ID: 891291a7-b0cb-4b34-9f74-99a3651c5535
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614003754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ib9VfTPPSxo8nkl5zZBa2u0I49i3UgZnQHQiTXZfQbg=;
	b=emEbzEV0u0dr1jl9bUc3l0lBMjTGDhSryhOm32YbeFIbaK2AvyKydvOb6cbqr+Ky3xcGis
	j5TQ8fisz7SRytI0iY9aguv0rqtnEwuRfanbmc6NbRynPTGudwz/iR01S6CPX3VlGrNoGY
	2+ddxLI0cmxxJEnFLksBn6D0E02QnYA=
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
 <9eade40b-bd95-b850-2dec-f7def66c3c7b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <77a36366-9157-c3d3-b1f0-211f4fc39a93@suse.com>
Date: Mon, 22 Feb 2021 15:22:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9eade40b-bd95-b850-2dec-f7def66c3c7b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.02.2021 15:14, Andrew Cooper wrote:
> On 22/02/2021 10:27, Jan Beulich wrote:
>> Now that we guard the entire Xen VA space against speculative abuse
>> through hypervisor accesses to guest memory, the argument translation
>> area's VA also needs to live outside this range, at least for 32-bit PV
>> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
>> uniformly.
>>
>> While this could be conditionalized upon CONFIG_PV32 &&
>> CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS, omitting such extra conditionals
>> keeps the code more legible imo.
>>
>> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -1727,6 +1727,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
>>                 (ROOT_PAGETABLE_FIRST_XEN_SLOT + slots -
>>                  l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
>>      }
>> +
>> +    /* Slot 511: Per-domain mappings mirror. */
>> +    if ( !is_pv_64bit_domain(d) )
>> +        l4t[l4_table_offset(PERDOMAIN2_VIRT_START)] =
>> +            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
> 
> This virtual address is inside the extended directmap.

No. That one covers only the range excluding the last L4 slot.

>  You're going to
> need to rearrange more things than just this, to make it safe.

I specifically picked that entry because I don't think further
arrangements are needed.

> While largely a theoretical risk as far as the directmap goes, there is
> now a rather higher risk of colliding with the ERR_PTR() range.  Its bad
> enough this infrastructure is inherently unsafe with 64bit PV guests,

The ERR_PTR() range is still _far_ away from the sub-ranges we
use in the per-domain area.

Jan


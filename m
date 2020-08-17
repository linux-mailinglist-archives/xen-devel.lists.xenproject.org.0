Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EB2246C25
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 18:11:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hj2-0001Xy-8m; Mon, 17 Aug 2020 16:11:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7hj1-0001Xt-Eq
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 16:11:07 +0000
X-Inumbo-ID: c6e52a19-c8a5-4af1-ac3b-9b668f641ecc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6e52a19-c8a5-4af1-ac3b-9b668f641ecc;
 Mon, 17 Aug 2020 16:11:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E92DCB79D;
 Mon, 17 Aug 2020 16:11:30 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86: don't override INVALID_M2P_ENTRY with
 SHARED_M2P_ENTRY
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
 <1d83fd35-6ea5-289c-d8db-029c50957f85@suse.com>
 <b54b2eb2-f663-e597-1d80-f7fb37e3b39a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a3612a4-90c5-9147-ded4-612b9bf812df@suse.com>
Date: Mon, 17 Aug 2020 18:11:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b54b2eb2-f663-e597-1d80-f7fb37e3b39a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.08.2020 18:42, Andrew Cooper wrote:
> On 06/08/2020 10:29, Jan Beulich wrote:
>> While in most cases code ahead of the invocation of set_gpfn_from_mfn()
>> deals with shared pages, at least in set_typed_p2m_entry() I can't spot
>> such handling (it's entirely possible there's code missing there). Let's
>> try to play safe and add an extra check.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/include/asm-x86/mm.h
>> +++ b/xen/include/asm-x86/mm.h
>> @@ -525,9 +525,14 @@ extern const unsigned int *const compat_
>>  #endif /* CONFIG_PV32 */
>>  
>>  #define _set_gpfn_from_mfn(mfn, pfn) ({                        \
>> -    struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn))); \
>> -    unsigned long entry = (d && (d == dom_cow)) ?              \
>> -        SHARED_M2P_ENTRY : (pfn);                              \
>> +    unsigned long entry = (pfn);                               \
>> +    if ( entry != INVALID_M2P_ENTRY )                          \
>> +    {                                                          \
>> +        const struct domain *d;                                \
>> +        d = page_get_owner(mfn_to_page(_mfn(mfn)));            \
>> +        if ( d && (d == dom_cow) )                             \
>> +            entry = SHARED_M2P_ENTRY;                          \
>> +    }                                                          \
>>      set_compat_m2p(mfn, (unsigned int)(entry));                \
>>      machine_to_phys_mapping[mfn] = (entry);                    \
>>  })
>>
> 
> Hmm - we already have a lot of callers, and this is already too
> complicated to be a define.

I did consider moving this into an out-of-line function, yes.

> We have x86 which uses M2P, and ARM which doesn't.  We have two more
> architectures on the way which probably won't want M2P, and certainly
> won't in the beginning.
> 
> Can we introduce CONFIG_M2P which is selected by x86, rename this
> infrastructure to set_m2p() or something, provide a no-op fallback in
> common code, and move this implementation into x86/mm.c ?

We can, sure. Question is whether this isn't more scope creep than
is acceptable considering the purpose of this change.

> In particular, silently clobbering pfn to SHARED_M2P_ENTRY is rude
> behaviour.  It would be better to ASSERT() the right one is passed in,
> which also simplifies release builds.

Now this is, irrespective of me agreeing with the point you make,
a change I'm not going to make: There's no way I could guarantee
I wouldn't break mem-sharing. A change like this can imo only
possibly be done by someone actively working on and with
mem-sharing.

Jan


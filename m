Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6481530A9E8
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 15:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79916.145754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aJY-00085X-6s; Mon, 01 Feb 2021 14:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79916.145754; Mon, 01 Feb 2021 14:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aJY-000858-3Y; Mon, 01 Feb 2021 14:36:28 +0000
Received: by outflank-mailman (input) for mailman id 79916;
 Mon, 01 Feb 2021 14:36:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6aJW-000851-6U
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:36:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5eaea734-a8c9-49da-8cf6-ba2e7234efb8;
 Mon, 01 Feb 2021 14:36:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 584B7AB92;
 Mon,  1 Feb 2021 14:36:24 +0000 (UTC)
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
X-Inumbo-ID: 5eaea734-a8c9-49da-8cf6-ba2e7234efb8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612190184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6uykghAdfz9re78oxMr0Ju2czSjC0DFr3lBX48I5rJY=;
	b=UIRXS0qGyOKD43/9h6/BoC469Q11Ymo2/Ak3rTprFlzqc/Xg3Lk+HmpH3SSyV3MOCJ9sUX
	QKZYoTu/LowwuyVQFrdLgk/sktMbeMex7CsRS4oaThOSA38aI0YXkIKBP6fPgXInvJEuuZ
	GmO2i6+Gn6b4tQzEx+7lazHOg8hUj4k=
Subject: Re: [PATCH v8 08/16] xen/domain: Add vmtrace_size domain creation
 parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-9-andrew.cooper3@citrix.com>
 <3cf886f6-db7f-ccc1-5ef0-6fd8ccb38caf@suse.com>
 <f54dec0a-65b6-07bf-9de8-ed96ffd8d791@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <296e5ee3-0ae1-fe0b-9ec3-940b78284cdc@suse.com>
Date: Mon, 1 Feb 2021 15:36:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f54dec0a-65b6-07bf-9de8-ed96ffd8d791@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.02.2021 15:22, Andrew Cooper wrote:
> On 01/02/2021 13:18, Jan Beulich wrote:
>> On 30.01.2021 03:58, Andrew Cooper wrote:
>>> +static int vmtrace_alloc_buffer(struct vcpu *v)
>>> +{
>>> +    struct domain *d = v->domain;
>>> +    struct page_info *pg;
>>> +    unsigned int i;
>>> +
>>> +    if ( !d->vmtrace_size )
>>> +        return 0;
>>> +
>>> +    pg = alloc_domheap_pages(d, get_order_from_bytes(d->vmtrace_size),
>>> +                             MEMF_no_refcount);
>>> +    if ( !pg )
>>> +        return -ENOMEM;
>>> +
>>> +    /*
>>> +     * Getting the reference counting correct here is hard.
>>> +     *
>>> +     * All pages are now on the domlist.  They, or subranges within, will be
>> "domlist" is too imprecise, as there's no list with this name. It's
>> extra_page_list in this case (see also below).
>>
>>> +     * freed when their reference count drops to zero, which may any time
>>> +     * between now and the domain teardown path.
>>> +     */
>>> +
>>> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
>>> +        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
>>> +            goto refcnt_err;
>>> +
>>> +    /*
>>> +     * We must only let vmtrace_free_buffer() take any action in the success
>>> +     * case when we've taken all the refs it intends to drop.
>>> +     */
>>> +    v->vmtrace.pg = pg;
>>> +
>>> +    return 0;
>>> +
>>> + refcnt_err:
>>> +    /*
>>> +     * In the failure case, we must drop all the acquired typerefs thus far,
>>> +     * skip vmtrace_free_buffer(), and leave domain_relinquish_resources() to
>>> +     * drop the alloc refs on any remaining pages - some pages could already
>>> +     * have been freed behind our backs.
>>> +     */
>>> +    while ( i-- )
>>> +        put_page_and_type(&pg[i]);
>>> +
>>> +    return -ENODATA;
>>> +}
>> As said in reply on the other thread, PGC_extra pages don't get
>> freed automatically. I too initially thought they would, but
>> (re-)learned otherwise when trying to repro your claims on that
>> other thread. For all pages you've managed to get the writable
>> ref, freeing is easily done by prefixing the loop body above by
>> put_page_alloc_ref(). For all other pages best you can do (I
>> think; see the debugging patches I had sent on that other
>> thread) is to try get_page() - if it succeeds, calling
>> put_page_alloc_ref() is allowed. Otherwise we can only leak the
>> respective page (unless going to further extents with trying to
>> recover from the "impossible"), or assume the failure here was
>> because it did get freed already.
> 
> Right - I'm going to insist on breaking apart orthogonal issues.
> 
> This refcounting issue isn't introduced by this series - this series
> uses an established pattern, in which we've found a corner case.
> 
> The corner case is theoretical, not practical - it is not possible for a
> malicious PV domain to take 2^43 refs on any of the pages in this
> allocation.  Doing so would require an hours-long SMI, or equivalent,
> and even then all malicious activity would be paused after 1s for the
> time calibration rendezvous which would livelock the system until the
> watchdog kicked in.

Actually an overflow is only one of the possible reasons here.
Another, which may be more "practical", is that another entity
has already managed to free the page (by dropping its alloc-ref,
and of course implying it did guess at the MFN).

Jan


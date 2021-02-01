Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA030A874
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 14:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79880.145625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Z6C-0007gA-RR; Mon, 01 Feb 2021 13:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79880.145625; Mon, 01 Feb 2021 13:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Z6C-0007fl-O3; Mon, 01 Feb 2021 13:18:36 +0000
Received: by outflank-mailman (input) for mailman id 79880;
 Mon, 01 Feb 2021 13:18:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6Z6B-0007fg-7p
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 13:18:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7c84440-30c2-45f8-8432-b0aea597fe99;
 Mon, 01 Feb 2021 13:18:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 737CDABD5;
 Mon,  1 Feb 2021 13:18:32 +0000 (UTC)
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
X-Inumbo-ID: c7c84440-30c2-45f8-8432-b0aea597fe99
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612185512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Au27WK7IriauZdi7YfA2QDsv32IX8X0J3WgdkQPCN3U=;
	b=Wv0OrEc5RvLuLfZs+zdQtz6UOUhTKiDZNfdRcmVfF02n0AY0wmYSdQD69gJWbeYujrqNAf
	PYfuqejPA0PY6Ou4G2Beai0nG/mdcM3v7G/Yjy51lTcNCcdbaE+mYTTyYjDfPcGFMP6wOv
	4S20LiV+3Sz97jNUG6RW0/PhSaleAy0=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3cf886f6-db7f-ccc1-5ef0-6fd8ccb38caf@suse.com>
Date: Mon, 1 Feb 2021 14:18:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210130025852.12430-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.01.2021 03:58, Andrew Cooper wrote:
> +static int vmtrace_alloc_buffer(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    struct page_info *pg;
> +    unsigned int i;
> +
> +    if ( !d->vmtrace_size )
> +        return 0;
> +
> +    pg = alloc_domheap_pages(d, get_order_from_bytes(d->vmtrace_size),
> +                             MEMF_no_refcount);
> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    /*
> +     * Getting the reference counting correct here is hard.
> +     *
> +     * All pages are now on the domlist.  They, or subranges within, will be

"domlist" is too imprecise, as there's no list with this name. It's
extra_page_list in this case (see also below).

> +     * freed when their reference count drops to zero, which may any time
> +     * between now and the domain teardown path.
> +     */
> +
> +    for ( i = 0; i < (d->vmtrace_size >> PAGE_SHIFT); i++ )
> +        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
> +            goto refcnt_err;
> +
> +    /*
> +     * We must only let vmtrace_free_buffer() take any action in the success
> +     * case when we've taken all the refs it intends to drop.
> +     */
> +    v->vmtrace.pg = pg;
> +
> +    return 0;
> +
> + refcnt_err:
> +    /*
> +     * In the failure case, we must drop all the acquired typerefs thus far,
> +     * skip vmtrace_free_buffer(), and leave domain_relinquish_resources() to
> +     * drop the alloc refs on any remaining pages - some pages could already
> +     * have been freed behind our backs.
> +     */
> +    while ( i-- )
> +        put_page_and_type(&pg[i]);
> +
> +    return -ENODATA;
> +}

As said in reply on the other thread, PGC_extra pages don't get
freed automatically. I too initially thought they would, but
(re-)learned otherwise when trying to repro your claims on that
other thread. For all pages you've managed to get the writable
ref, freeing is easily done by prefixing the loop body above by
put_page_alloc_ref(). For all other pages best you can do (I
think; see the debugging patches I had sent on that other
thread) is to try get_page() - if it succeeds, calling
put_page_alloc_ref() is allowed. Otherwise we can only leak the
respective page (unless going to further extents with trying to
recover from the "impossible"), or assume the failure here was
because it did get freed already.

Jan


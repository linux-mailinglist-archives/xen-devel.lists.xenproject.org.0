Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D7C316529
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83559.155772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ndd-00019c-LA; Wed, 10 Feb 2021 11:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83559.155772; Wed, 10 Feb 2021 11:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ndd-00019G-HZ; Wed, 10 Feb 2021 11:26:29 +0000
Received: by outflank-mailman (input) for mailman id 83559;
 Wed, 10 Feb 2021 11:26:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9ndb-00019B-UQ
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 11:26:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 759cd76b-6804-4cd4-a817-164ca2a499fe;
 Wed, 10 Feb 2021 11:26:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D3F3AE36;
 Wed, 10 Feb 2021 11:26:26 +0000 (UTC)
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
X-Inumbo-ID: 759cd76b-6804-4cd4-a817-164ca2a499fe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612956386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UgWnJuf85refogm4v3ApJ4GsPgI5aul814UAUaT0pxA=;
	b=UcTmRfi3NN8y4xwnHsTN4U7+V/rcHGiOHo78/zmKVd87lQmLQ4KmfxqyTdAD2yxaynAgi5
	dnc2HWgGkUgvW2j04Op0gSc5+m9xM3BntrrT5Lt/BfNQHz+0ZnchsJyQ9Z4Q56QB42SL1/
	WRSZu2kyf+r+uYxbXxnMmB4B70C9jhw=
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2485d44-180e-499c-d917-80da3486d98e@suse.com>
Date: Wed, 10 Feb 2021 12:26:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209152816.15792-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.02.2021 16:28, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, the IOMMU page-tables will be populated early in the domain
> creation if the hardware is able to virtualize the local APIC. However,
> the IOMMU page tables will not be freed during early failure and will
> result to a leak.
> 
> An assigned device should not need to DMA into the vLAPIC page, so we
> can avoid to map the page in the IOMMU page-tables.

Here and below, may I ask that you use the correct term "APIC
access page", as there are other pages involved in vLAPIC
handling (in particular the virtual APIC page, which is where
accesses actually go to that translate to the APIC access page
in EPT).

> This statement is also true for any special pages (the vLAPIC page is
> one of them). So to take the opportunity to prevent the mapping for all
> of them.

I probably should have realized this earlier, but there is a
downside to this: A guest wanting to core dump itself may want
to dump e.g. shared info and vcpu info pages. Hence ...

> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -919,6 +919,10 @@ static inline unsigned int p2m_get_iommu_flags(p2m_type_t p2mt, mfn_t mfn)
>  {
>      unsigned int flags;
>  
> +    /* Don't map special pages in the IOMMU page-tables. */
> +    if ( mfn_valid(mfn) && is_special_page(mfn_to_page(mfn)) )
> +        return 0;

... instead of is_special_page() I think you want to limit the
check here to seeing whether PGC_extra is set.

But as said on irc, since this crude way of setting up the APIC
access page is now firmly a problem, I intend to try to redo it.
I can't tell yet whether this will still take a PGC_extra page
of some form (nor if my plans will work out in the first place).
Irrespective of this I think we indeed want to exclude PGC_extra
pages from getting mapped. However, the APIC access page is, I
think, an outlier here - we wouldn't insert other PGC_extra
pages into the p2m, so for all other cases the above addition
would be effectively dead code.

Jan


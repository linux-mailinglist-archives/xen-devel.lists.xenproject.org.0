Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83195321D65
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 17:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88265.165840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEEOu-0000yi-Cd; Mon, 22 Feb 2021 16:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88265.165840; Mon, 22 Feb 2021 16:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEEOu-0000yJ-8r; Mon, 22 Feb 2021 16:49:36 +0000
Received: by outflank-mailman (input) for mailman id 88265;
 Mon, 22 Feb 2021 16:49:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEEOs-0000yE-Ug
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 16:49:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6a807ee-033e-4e34-b1cc-7c92ab1dc21f;
 Mon, 22 Feb 2021 16:49:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A221B121;
 Mon, 22 Feb 2021 16:49:32 +0000 (UTC)
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
X-Inumbo-ID: f6a807ee-033e-4e34-b1cc-7c92ab1dc21f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614012572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PSFRd8POhtHOTw+wsgDyhdDxjvzvtWFzAWOIYusJDY=;
	b=XNU0twYTsC7Dbeq1yFhRQYT2BkCCHNjgJGLiFtElyo5pRO4pWrrJ0WCQoLPWaKX86GkYwP
	2qJaDBZ66l4/XcpftJyiVTHWshNiXURJuotrVVsQejNNu3qIQJig9+neqAPJB5TYcdFUNy
	9NN1pvtKJcHVH/6mk8QZokRtqu34a6Q=
Subject: Re: Domain reference counting breakage
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210222152617.16382-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90be630d-dccf-f63f-8419-dc583204b3a9@suse.com>
Date: Mon, 22 Feb 2021 17:49:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222152617.16382-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.02.2021 16:26, Andrew Cooper wrote:
> At the moment, attempting to create an HVM guest with max_gnttab_frames of 0
> causes Xen to explode on the:
> 
>   BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
> 
> in _domain_destroy().  Intrumenting Xen a little more to highlight where the
> modifcations to d->refcnt occur:
> 
>   (d6) --- Xen Test Framework ---
>   (d6) Environment: PV 64bit (Long mode 4 levels)
>   (d6) Testing domain create:
>   (d6) Testing x86 PVH Shadow
>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d0402046b5 [domain_create+0x1c3/0x7f1], stk e010:ffff83003fea7d58, dr6 ffff0ff1
>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d040321b11 [share_xen_page_with_guest+0x175/0x190], stk e010:ffff83003fea7ce8, dr6 ffff0ff1
>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d04022595b [assign_pages+0x223/0x2b7], stk e010:ffff83003fea7c68, dr6 ffff0ff1
>   (d6) (XEN) grant_table.c:1934: Bad grant table sizes: grant 0, maptrack 0
>   (d6) (XEN) *** d1 ref 3
>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d0402048bc [domain_create+0x3ca/0x7f1], stk e010:ffff83003fea7d58, dr6 ffff0ff1
>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d040225e11 [free_domheap_pages+0x422/0x44a], stk e010:ffff83003fea7c38, dr6 ffff0ff1
>   (d6) (XEN) Xen BUG at domain.c:450
>   (d6) (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y  Not tainted ]----
>   (d6) (XEN) CPU:    0
>   (d6) (XEN) RIP:    e008:[<ffff82d040204366>] common/domain.c#_domain_destroy+0x69/0x6b
> 
> the problem becomes apparent.
> 
> First of all, there is a reference count leak - share_xen_page_with_guest()'s
> reference isn't freed anywhere.
> 
> However, the main problem is the 4th #DB above is this atomic_set()
> 
>   d->is_dying = DOMDYING_dead;
>   if ( hardware_domain == d )
>       hardware_domain = old_hwdom;
>   printk("*** %pd ref %d\n", d, atomic_read(&d->refcnt));
>   atomic_set(&d->refcnt, DOMAIN_DESTROYED);
> 
> in the domain_create() error path, which happens before free_domheap_pages()
> drops the ref acquired assign_pages(), and destroys still-relevant information
> pertaining to the guest.

I think the original idea was that by the time of the atomic_set()
all operations potentially altering the refcount are done. This
then allowed calling free_xenheap_pages() on e.g. the shared info
page without regard to whether the page's reference (installed by
share_xen_page_with_guest()) was actually dropped (i.e.
regardless of whether it's the domain create error path or proper
domain cleanup). With this assumption, no actual leak of anything
would occur, but of course this isn't the "natural" way of how
things should get cleaned up.

According to this original model, free_domheap_pages() may not be
called anymore past that point (for domain owned pages, which
really means put_page() then; anonymous pages are of course fine
to be freed late).

> The best options is probably to use atomic_sub() to subtract (DOMAIN_DESTROYED
> + 1) from the current refcount, which preserves the extra refs taken by
> share_xen_page_with_guest() and assign_pages() until they can be freed
> appropriately.

First of all - why DOMAIN_DESTROYED+1? There's no extra reference
you ought to be dropping here. Or else what's the counterpart of
acquiring the respective reference?

And then of course this means Xen heap pages cannot be cleaned up
anymore by merely calling free_xenheap_pages() - to get rid of
the associated reference, all of them would need to undergo
put_page_alloc_ref(), which in turn requires obtaining an extra
reference, which in turn introduces another of these ugly
theoretical error cases (because get_page() can in principle fail).

Therefore I wouldn't outright discard the option of sticking to
the original model. It would then better be properly described
somewhere, and we would likely want to put some check in place to
make sure such put_page() can't go unnoticed anymore when sitting
too late on the cleanup path (which may be difficult to arrange
for).

Jan


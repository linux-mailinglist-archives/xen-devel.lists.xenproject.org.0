Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E8B2C863B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 15:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41163.74277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjjvw-0000we-AF; Mon, 30 Nov 2020 14:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41163.74277; Mon, 30 Nov 2020 14:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjjvw-0000wF-70; Mon, 30 Nov 2020 14:13:40 +0000
Received: by outflank-mailman (input) for mailman id 41163;
 Mon, 30 Nov 2020 14:13:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1kjjvu-0000wA-Ja
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 14:13:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kjjvt-00065h-04; Mon, 30 Nov 2020 14:13:37 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=edge-cache-235.e-lhr50.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kjjvs-00036I-Ix; Mon, 30 Nov 2020 14:13:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=UH0ytmsdfEMTLKGVQ2dLoIFTz1e9pLOM1P8javWKamc=; b=hbgFIgdPDvEbUC4QmriPSlXsC/
	EtSyxXtbNpnFnqahvuypvbdqAKlCRJcUZxQjafD3HObOEsbCKF/QcXeeeTywRq5D1s0f7VMu+VzIX
	qr9AraMj5g+GMw09JfmHSGwCCQVUfMtyMZS9tjVdnW/P/ukuNhYPEQz06qLj0bIkkaR8=;
Message-ID: <21e17d308adcec2854b35c5d1682927bedf45f58.camel@xen.org>
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 30 Nov 2020 14:13:32 +0000
In-Reply-To: <1dab4032-6ae1-bf77-c183-c62ca06f0ad8@suse.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
	 <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
	 <41d9d8d4-d5cb-8350-c118-c9e1fe73b6d0@suse.com>
	 <a4f02c292a369cfd771790b1d164f139fec6bead.camel@xen.org>
	 <f25e278f-2d63-d806-4650-983df490556f@xen.org>
	 <d75fd45c-3f66-63c9-90c7-90dc10fc5763@suse.com>
	 <8bb9eb92-ede4-0fa4-d21f-c7976fe70acf@xen.org>
	 <622a8319-a439-72f2-c045-15e7611a22e7@suse.com>
	 <3db3081d-232a-cce1-cfce-c657be64a0dd@xen.org>
	 <600d3ea4-f905-3aab-e110-da3bd0d4b38a@suse.com>
	 <23cd67ea1b96ba3f8801a3cf13549298597cb331.camel@xen.org>
	 <1dab4032-6ae1-bf77-c183-c62ca06f0ad8@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-30 at 13:50 +0100, Jan Beulich wrote:
> On 30.11.2020 13:13, Hongyan Xia wrote:
> > On Tue, 2020-08-18 at 18:16 +0200, Jan Beulich wrote:
> > [...]
> > 
> > Actually I did not propose the BUG_ON() fix. I was just in favor of
> > it
> > when Jan presented it as a choice in v7.
> > 
> > The reason I am in favor of it is that even without it, the
> > existing
> > x86 code already BUG_ON() when vmap has a superpage anyway, so it's
> > not
> > like other alternatives behave any differently for superpages. I am
> > also not sure about returning INVALID_MFN because if
> > virt_to_xen_l1e()
> > really returns NULL, then we are calling vmap_to_mfn() on a non-
> > vmap
> > address (not even populated) which frankly deserves at least
> > ASSERT().
> > So, I don't think BUG_ON() is a bad idea for now before
> > vmap_to_mfn()
> > supports superpages.
> > 
> > Of course, we could use MAP_SMALL_PAGES to avoid the whole problem,
> > but
> > Arm may not be happy. After a quick chat with Julien, how about
> > having
> > ARCH_VMAP_FLAGS and only small pages for x86?
> 
> Possibly, albeit this will then make it look less like a bodge and
> more like we would want to keep it this way. How difficult would it
> be to actually make the thing work with superpages? Is it more than
> simply
> (pseudocode, potentially needed locking omitted):
> 
> vmap_to_mfn(va) {
>     pl1e = virt_to_xen_l1e(va);
>     if ( pl1e )
>         return l1e_get_mfn(*pl1e);
>     pl2e = virt_to_xen_l2e(va);
>     if ( pl2e )
>         return l2e_get_mfn(*pl2e) + suitable_bits(va);
>     return l3e_get_mfn(*virt_to_xen_l3e(va)) + suitable_bits(va);
> }
> 
> (assuming virt_to_xen_l<N>e() would be returning NULL in such a
> case)?

The sad part is that instead of returning NULL, such functions BUG_ON()
when there is a superpage, hence why this solution was not considered.
Changing the logic from BUG_ON to returning NULL might not be
straightforward, since so far the callers assume NULL means -ENOMEM and
not anything else.

> Not very efficient, but not needed anywhere anyway - the sole user of
> the construct is domain_page_map_to_mfn(), which maps only individual
> pages. (An even better option would be to avoid the recurring walk of
> the higher levels by using only virt_to_xen_l3e() and then doing the
> remaining steps "by hand". This would at once allow to avoid the here
> unwanted / unneeded checking for whether page tables need
> allocating.)

The "even better option" looks more promising to me, and is what I want
to go forward with. At any rate, this fix grows larger than intended
and I want to send this as an individual patch. Any objections?

Hongyan



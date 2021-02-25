Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8D73257FC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 21:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89969.170049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNc6-0001yq-SX; Thu, 25 Feb 2021 20:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89969.170049; Thu, 25 Feb 2021 20:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNc6-0001yT-PU; Thu, 25 Feb 2021 20:51:58 +0000
Received: by outflank-mailman (input) for mailman id 89969;
 Thu, 25 Feb 2021 20:51:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjlP=H3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFNc5-0001yO-30
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 20:51:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed53f322-5bf0-4ed8-8b39-a1597c8a3473;
 Thu, 25 Feb 2021 20:51:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DFF364DE9;
 Thu, 25 Feb 2021 20:51:55 +0000 (UTC)
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
X-Inumbo-ID: ed53f322-5bf0-4ed8-8b39-a1597c8a3473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614286315;
	bh=Zkkb2TYZmIvm+7VmqMVOuJGwIvUpWUmuKDrtfLmrGd4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sy0TrtSKaar9ZfS1yvgHWZUhU29ZmjN1i1IXpLucNSSoRHBUie0iymRTFbL9seZSH
	 OaY42zxvKmvwRQ74NryPnmfEQJ0pRTQl9kCStSq/XS4agK4YCnfZ9QXZ8T8myrJNAj
	 mUGO5r6hGJ+ainhFKD2mxHCPpqGH02VzfE6yeof9l9ctBg+OiFCv9qCC/9rhTaZgYh
	 kyrvke/IbEAUSPydZyeInKxRWRHiRAhWE07vdiZCHF3P6bAIk+0vfbeDNbPidar3it
	 dT0XNABk3kzan/lXAf3ymVqNZC8sgXZj2wyVbkmRrICkiDVVJ36f/GodU4zS6RkC/c
	 7yzWZBpmuqe1A==
Date: Thu, 25 Feb 2021 12:51:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    andrew.cooper3@citrix.com, julien@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
In-Reply-To: <96d764b6-a719-711c-31ea-235381bfd0ce@suse.com>
Message-ID: <alpine.DEB.2.21.2102250948160.3234@sstabellini-ThinkPad-T480s>
References: <20210225012243.28530-1-sstabellini@kernel.org> <96d764b6-a719-711c-31ea-235381bfd0ce@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Feb 2021, Jan Beulich wrote:
> On 25.02.2021 02:22, Stefano Stabellini wrote:
> > --- a/xen/include/public/features.h
> > +++ b/xen/include/public/features.h
> > @@ -114,6 +114,13 @@
> >   */
> >  #define XENFEAT_linux_rsdp_unrestricted   15
> >  
> > +/*
> > + * A direct-mapped (or 1:1 mapped) domain is a domain for which its
> > + * local pages have gfn == mfn.
> > + */
> > +#define XENFEAT_not_direct_mapped       16
> > +#define XENFEAT_direct_mapped           17
> 
> Why two new values? Absence of XENFEAT_direct_mapped requires
> implying not-direct-mapped by the consumer anyway, doesn't it?

That's because if we add both flags we can avoid all unpleasant guessing
games in the guest kernel.

If one flag or the other flag is set, we can make an informed decision.

But if neither flag is set, it means we are running on an older Xen,
and we fall back on the current checks.


> Further, quoting xen/mm.h: "For a non-translated guest which
> is aware of Xen, gfn == mfn." This to me implies that PV would
> need to get XENFEAT_direct_mapped set; not sure whether this
> simply means x86'es is_domain_direct_mapped() is wrong, but if
> it is, uses elsewhere in the code would likely need changing.

That's a good point, I didn't think about x86 PV. I think the two flags
are needed for autotranslated guests. I don't know for sure what is best
for non-autotranslated guests.

Maybe we could say that XENFEAT_not_direct_mapped and
XENFEAT_direct_mapped only apply to XENFEAT_auto_translated_physmap
guests. And it would match the implementation of
is_domain_direct_mapped().

For non XENFEAT_auto_translated_physmap guests we could either do:

- neither flag is set
- set XENFEAT_direct_mapped (without changing the implementation of
  is_domain_direct_mapped)

What do you think? I am happy either way.


> Also, nit: Please keep the right sides aligned with #define-s
> higher up in the file.

OK


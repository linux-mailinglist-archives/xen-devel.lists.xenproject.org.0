Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47C48665E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 15:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254090.435607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5UAl-0005uH-KO; Thu, 06 Jan 2022 14:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254090.435607; Thu, 06 Jan 2022 14:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5UAl-0005rx-H3; Thu, 06 Jan 2022 14:55:23 +0000
Received: by outflank-mailman (input) for mailman id 254090;
 Thu, 06 Jan 2022 14:55:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOnR=RW=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1n5UAj-0005rr-Qo
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 14:55:21 +0000
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9d8ece2-6f00-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 15:55:19 +0100 (CET)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
 by mta-09.privateemail.com (Postfix) with ESMTP id 77B3B1800B12
 for <xen-devel@lists.xenproject.org>; Thu,  6 Jan 2022 09:55:17 -0500 (EST)
Received: from mail-yb1-f172.google.com (unknown [10.20.151.194])
 by mta-09.privateemail.com (Postfix) with ESMTPA id 5420C1800214
 for <xen-devel@lists.xenproject.org>; Thu,  6 Jan 2022 09:55:17 -0500 (EST)
Received: by mail-yb1-f172.google.com with SMTP id j83so8168029ybg.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jan 2022 06:55:17 -0800 (PST)
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
X-Inumbo-ID: a9d8ece2-6f00-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641480917;
	bh=nyaipcGS3y4xEPjqo5zcVc2ckg4R8mcQbe3P330518A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=yP886jAm87oH3TJWysP0aXQLb4hN/BK3FnqV28MlcYOj34J2Rfz5niioYju/cGI+q
	 XjwCbeIGDrC+w704HmdpWucGepTvRY6Qedu9tdGLPN2J3HyK8BHyEYfOlXww/qBt+o
	 O9rUFhNJx0+m4R9lKp0aQ/v3Mipi8xf3HrlIyAXgQp67nZ2BGU+ixJE8GtsLYYBlHg
	 s5Btq73XBMydGJLDuToochpgtSca+YMVFUl/gIBtXLzwgc8VFzN+nttOtvfSOcE6o3
	 Z8qqrFTh6RAMlLVjz80DGCvOS6c0eYea0NTOLiJCw8fmyHfhbxQb6lnQGWOPktbLMN
	 ZdZJBcaig4P6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641480917;
	bh=nyaipcGS3y4xEPjqo5zcVc2ckg4R8mcQbe3P330518A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=yP886jAm87oH3TJWysP0aXQLb4hN/BK3FnqV28MlcYOj34J2Rfz5niioYju/cGI+q
	 XjwCbeIGDrC+w704HmdpWucGepTvRY6Qedu9tdGLPN2J3HyK8BHyEYfOlXww/qBt+o
	 O9rUFhNJx0+m4R9lKp0aQ/v3Mipi8xf3HrlIyAXgQp67nZ2BGU+ixJE8GtsLYYBlHg
	 s5Btq73XBMydGJLDuToochpgtSca+YMVFUl/gIBtXLzwgc8VFzN+nttOtvfSOcE6o3
	 Z8qqrFTh6RAMlLVjz80DGCvOS6c0eYea0NTOLiJCw8fmyHfhbxQb6lnQGWOPktbLMN
	 ZdZJBcaig4P6Q==
X-Gm-Message-State: AOAM530+cuIqwb9cV/MfzNPmW5wAXmzXQh1bzUCzfnLnDlsPCshDocYY
	VCNT869G8ToO4qK9eAy3F/ZEa1yC3UMlQwNebHg=
X-Google-Smtp-Source: ABdhPJzGIxADnMOTsDEKfR/rali8/azFypsVtCcwXYXetsprgp659VY/roONfS7L8hOiDIbjWgpCGaEFPwxWGuuEuVY=
X-Received: by 2002:a25:770f:: with SMTP id s15mr59719566ybc.751.1641480916292;
 Thu, 06 Jan 2022 06:55:16 -0800 (PST)
MIME-Version: 1.0
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
 <d1b6aede-2c0a-df7a-7815-73ad4d795899@suse.com> <CABfawhmGxHBEC1M2=zo11K11Yr_TdWFkkVpDpVimy_uvD4nxyQ@mail.gmail.com>
 <f13f983f-9190-99d4-7a6d-c73be651896d@suse.com> <CABfawhnNv+KpSm+ZGaRFvkNrooU0_E0TEijs0_WBNtrZ0-y1Jg@mail.gmail.com>
 <35ed148d-c525-5fdb-ad83-d0a1c9432b11@suse.com>
In-Reply-To: <35ed148d-c525-5fdb-ad83-d0a1c9432b11@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 6 Jan 2022 09:54:41 -0500
X-Gmail-Original-Message-ID: <CABfawhn-=z8Yd1CeqtyM9tWrxTp5XfgDvmVqSdKE+uL8aJ90Pg@mail.gmail.com>
Message-ID: <CABfawhn-=z8Yd1CeqtyM9tWrxTp5XfgDvmVqSdKE+uL8aJ90Pg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] x86/altp2m: p2m_altp2m_propagate_change()
 should honor present page order
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Jan 6, 2022 at 8:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 05.01.2022 17:25, Tamas K Lengyel wrote:
> > On Wed, Jan 5, 2022 at 3:59 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 04.01.2022 18:48, Tamas K Lengyel wrote:
> >>>> I may be entirely wrong and hence that part of the change may also be
> >>>> wrong, but I'm having trouble seeing why the original
> >>>> "!mfn_eq(m, INVALID_MFN)" wasn't "mfn_eq(m, INVALID_MFN)". Isn't the
> >>>> goal there to pre-fill entries that were previously invalid, instead of
> >>>> undoing prior intentional divergence from the host P2M? (I have
> >>>> intentionally not reflected this aspect in the description yet; I can't
> >>>> really write a description of this without understanding what's going on
> >>>> in case the original code was correct.)
> >>>
> >>> This function only gets called from p2m-ept when the hostp2m gets an
> >>> update. In that case this check goes through all altp2m's to see if
> >>> any of them has an entry for what just got changed in the host, and
> >>> overwrites the altp2m with that from the host. If there is no entry in
> >>> the altp2m it doesn't pre-populate. That should only happen if the
> >>> altp2m actually needs it and runs into a pagefault. So it is correct
> >>> as-is, albeit being a subtle (and undocumented) behavior of the
> >>> hostp2m and its effect on the altp2m's. But that's why we never
> >>> actually make any changes on the hostp2m, we always create an altp2m
> >>> and apply changes (mem_access/remapping) there.
> >>
> >> Thanks for the explanation. Effectively this means that the call to
> >> get_gfn_type_access() can simply be get_gfn_query(). For the patch
> >> this means that I shouldn't check its return value and also continue
> >> to pass the new order rather than the minimum of the two (as was the
> >> case before), as all we're after is the locking of the GFN. It would
> >> be nice if you could confirm this before I submit a non-RFC v3.
> >
> > I'm a little lost here.
>
> Let me start with simpler questions then:
>
> What's the purpose of calling get_gfn_type_access()?

Only locking the gfn AFAICT.

> Independent of the answer to the previous question, why isn't it
> get_gfn_query() that is called?

The author of the code probably didn't see any difference between the
two. Or just didn't know there is another function.

> What's the purpose of the "a" local variable? (While "t" also is
> otherwise unused, it can't be eliminated as even get_gfn_query()
> requires its address to be taken.)

The a/t variables are ununsed.

>
> Why is p2m_set_entry() called only when the original entry didn't
> resolve to INVALID_MFN?

AFAICT there was never a clear design decision for why that's in
place. The only utility for it is fast propagation of settings across
all altp2m's that already have an entry in place. As per the other
part of the discussion it could be removed so existing entries in
altp2m's don't get overwritten. But we should most definitely NOT
pre-populate entries here for altp2ms.

Tamas


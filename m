Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403704C3401
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 18:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278567.475877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNIFu-00032n-L8; Thu, 24 Feb 2022 17:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278567.475877; Thu, 24 Feb 2022 17:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNIFu-00030x-I5; Thu, 24 Feb 2022 17:50:18 +0000
Received: by outflank-mailman (input) for mailman id 278567;
 Thu, 24 Feb 2022 17:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3iZV=TH=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nNIFs-00030r-Ug
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 17:50:17 +0000
Received: from MTA-15-3.privateemail.com (mta-15-3.privateemail.com
 [198.54.122.111]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 380e5372-959a-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 18:50:15 +0100 (CET)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
 by mta-15.privateemail.com (Postfix) with ESMTP id B6C0F18000A9
 for <xen-devel@lists.xenproject.org>; Thu, 24 Feb 2022 12:50:12 -0500 (EST)
Received: from mail-yw1-f174.google.com (unknown [10.20.151.146])
 by mta-15.privateemail.com (Postfix) with ESMTPA id 9C59F18000A0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Feb 2022 12:50:12 -0500 (EST)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2d68d519a33so6300707b3.7
 for <xen-devel@lists.xenproject.org>; Thu, 24 Feb 2022 09:50:12 -0800 (PST)
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
X-Inumbo-ID: 380e5372-959a-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1645725012;
	bh=RXVQdrq2wUyMpcgS/RMTl3KIG9GiTKXPRfJu6KrbQaU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mltc914Mt+i+Wb/H7eQQxGeB8qerwogCD/jtCgLd7yp/+SXxuKWZ6zQ3O1PROWoRg
	 lLwzHgJefdhk+iukpDCMrqYs45IuU7tDrzAmEcC3YI1brFdgxY2cOaH0ixyIdPNm6s
	 BtFWAC2q9DUTSbs0G+oBkenP6INobGMAF9leW0N/+o5zjmjjRUlynEXg0TIY6MdknC
	 R6p80RA8vR3ioUVjE41C7MYpiSABfd9gQwpciIHz3hAb4buXGV2hri2Ews++7eHIS1
	 glXapr/f193GpbCRbARnpai9Iy7g+esY5YJ2HmRrkiiL0oICWo964UHuGb2u8vlruN
	 eWPAkpQOnkuLw==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1645725012;
	bh=RXVQdrq2wUyMpcgS/RMTl3KIG9GiTKXPRfJu6KrbQaU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mltc914Mt+i+Wb/H7eQQxGeB8qerwogCD/jtCgLd7yp/+SXxuKWZ6zQ3O1PROWoRg
	 lLwzHgJefdhk+iukpDCMrqYs45IuU7tDrzAmEcC3YI1brFdgxY2cOaH0ixyIdPNm6s
	 BtFWAC2q9DUTSbs0G+oBkenP6INobGMAF9leW0N/+o5zjmjjRUlynEXg0TIY6MdknC
	 R6p80RA8vR3ioUVjE41C7MYpiSABfd9gQwpciIHz3hAb4buXGV2hri2Ews++7eHIS1
	 glXapr/f193GpbCRbARnpai9Iy7g+esY5YJ2HmRrkiiL0oICWo964UHuGb2u8vlruN
	 eWPAkpQOnkuLw==
X-Gm-Message-State: AOAM532OB973dTUYeUE4Cj2ItmBBKAV6rDvxDUkzDQ90SWL5SNY/2woo
	KcDnaSWopNZ4BemzoLRlbFe3z5DhyvJYdDj0BsU=
X-Google-Smtp-Source: ABdhPJycN7lO/x0oZeO235pGTY2qapXOC8hzfekxT/sFCyUfa9HJvC+fDgA+Ejqk3ZMc+8lsXzke3Cmd9iEfJ/hwnLo=
X-Received: by 2002:a81:9858:0:b0:2d6:ecb0:71b7 with SMTP id
 p85-20020a819858000000b002d6ecb071b7mr3599506ywg.507.1645725011811; Thu, 24
 Feb 2022 09:50:11 -0800 (PST)
MIME-Version: 1.0
References: <b3564fe0-e375-b386-df0d-a5c2b54d1299@suse.com> <30592690-ee08-1886-b6ba-b3309659d29c@suse.com>
In-Reply-To: <30592690-ee08-1886-b6ba-b3309659d29c@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 24 Feb 2022 12:49:36 -0500
X-Gmail-Original-Message-ID: <CABfawhnSpBK+uSSvqa4QODx5CNjC3Z8_Y+Skie0Bv9_B9jz1qw@mail.gmail.com>
Message-ID: <CABfawhnSpBK+uSSvqa4QODx5CNjC3Z8_Y+Skie0Bv9_B9jz1qw@mail.gmail.com>
Subject: Re: Ping: [PATCH v4] x86/altp2m: p2m_altp2m_propagate_change() should
 honor present page order
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, George Dunlap <george.dunlap@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Feb 24, 2022 at 8:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 03.02.2022 14:57, Jan Beulich wrote:
> > For higher order mappings the comparison against p2m->min_remapped_gfn
> > needs to take the upper bound of the covered GFN range into account, not
> > just the base GFN. Otherwise, i.e. when dropping a mapping overlapping
> > the remapped range but the base GFN outside of that range, an altp2m may
> > wrongly not get reset.
> >
> > Note that there's no need to call get_gfn_type_access() ahead of the
> > check against the remapped range boundaries: None of its outputs are
> > needed earlier, and p2m_reset_altp2m() doesn't require the lock to be
> > held. In fact this avoids a latent lock order violation: With per-GFN
> > locking p2m_reset_altp2m() not only doesn't require the GFN lock to be
> > held, but holding such a lock would actually not be allowed, as the
> > function acquires a P2M lock.
> >
> > Local variables are moved into the more narrow scope (one is deleted
> > altogether) to help see their actual life ranges.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Note that this addresses only half of the problem: get_gfn_type_access()
> > would also need invoking for all of the involved GFNs, not just the 1st
> > one.
> > ---
> > v4: Restore mistakenly dropped mfn_eq(mfn, INVALID_MFN).
>
> I think this was the only open item I needed to deal with. Any chance
> I could get an ack or R-b here, please?
>
> Thanks, Jan

Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>


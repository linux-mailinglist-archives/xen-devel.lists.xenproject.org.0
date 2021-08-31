Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BDD3FCC21
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 19:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175895.320289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL7L3-0006Rw-1Z; Tue, 31 Aug 2021 17:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175895.320289; Tue, 31 Aug 2021 17:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL7L2-0006Ov-Ur; Tue, 31 Aug 2021 17:14:20 +0000
Received: by outflank-mailman (input) for mailman id 175895;
 Tue, 31 Aug 2021 17:14:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL7L1-0006Op-OJ
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 17:14:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL7L1-0002nr-LR
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 17:14:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL7L1-0002bC-KQ
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 17:14:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mL7Kw-0005qz-Lj; Tue, 31 Aug 2021 18:14:14 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=hVL4Yr1q7Baj65HxY9oJ7FAGznnAzNfgTWQFajBKHOY=; b=TIqYZHlm8CGzpLvKDnFnJv7xgo
	OUZZH6468Kz4tCM3phNVSGtcHu0e0WdbAanurzS1NU1/GYonsxkbTD47+v1I1pgWlbcVQwlRDLH2U
	Jj1sVgVXf7DCOlTA0B/jez3gAa4wyk/UCU4cfAGpRKtD8zrq5lxk/Yhez5b2zNrep3eA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24878.25446.392734.901516@mariner.uk.xensource.com>
Date: Tue, 31 Aug 2021 18:14:14 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Juergen Gross <jgross@suse.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: fix tv_sec fprintf format
In-Reply-To: <CAPi7W80gf+gcd0fczTLN7DgnxiwdzhMFxNVTyRvfGRm3PmQYZQ@mail.gmail.com>
References: <20210828090709.738512-1-fontaine.fabrice@gmail.com>
	<48e33bf0-67f6-4259-ac9e-71da16621c5f@suse.com>
	<CAPi7W80gf+gcd0fczTLN7DgnxiwdzhMFxNVTyRvfGRm3PmQYZQ@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Fabrice Fontaine writes ("Re: [PATCH] libs/light: fix tv_sec fprintf format"):
> Le lun. 30 août 2021 à 10:31, Juergen Gross <jgross@suse.com> a écrit :
> >
> > On 28.08.21 11:07, Fabrice Fontaine wrote:
> > > Don't assume tv_sec is a unsigned long, it is 64 bits on NetBSD 32 bits.
> > > Use %jd and cast to (intmax_t) instead
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >   tools/libs/light/libxl_domain.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
> > > index c00c36c928..51a6127552 100644
> > > --- a/tools/libs/light/libxl_domain.c
> > > +++ b/tools/libs/light/libxl_domain.c
> > > @@ -1444,7 +1444,7 @@ static int libxl__mark_domid_recent(libxl__gc *gc, uint32_t domid)
> > >           }
> > >       }
> > >
> > > -    r = fprintf(nf, "%lu %u\n", ctxt.ts.tv_sec, domid);
> > > +    r = fprintf(nf, "%jd %u\n", (intmax_t)ctxt.ts.tv_sec, domid);
> >
> > Any reason not to keep the unsigned attribute?
> Yes, for consistency, I applied the same fix that was merged seven
> months ago to libs/light/libxl_create.c:
> https://gitlab.com/xen-project/xen/-/commit/a8ac01aa3e3ea5e6a9a1620aa8fa7e9da3458120

Thanks,

Reviewed-by: Ian Jackson <iwj@xenproject.org>

and pushed.

Ian.


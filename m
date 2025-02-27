Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B621A481FF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 15:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898179.1306751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfDH-0000oG-6N; Thu, 27 Feb 2025 14:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898179.1306751; Thu, 27 Feb 2025 14:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfDH-0000lX-3f; Thu, 27 Feb 2025 14:50:11 +0000
Received: by outflank-mailman (input) for mailman id 898179;
 Thu, 27 Feb 2025 14:50:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKwg=VS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tnfDF-0000lR-CP
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 14:50:09 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23289ad6-f51a-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 15:50:08 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-abbdf897503so379544966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 06:50:08 -0800 (PST)
Received: from localhost ([46.149.103.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c6ee4a8sm134354966b.98.2025.02.27.06.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 06:50:07 -0800 (PST)
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
X-Inumbo-ID: 23289ad6-f51a-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740667807; x=1741272607; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lt1StCpOXNqv7Lr191DNGZW6tiAohifbvAlFZ8p614=;
        b=OrFZeOa3gdV9ntv48Bof2voSYyPmICNup2vK6GrvKdEd1ym7IWk9J78ZNweg8oCP5Q
         kgWz7ekQ8lIPchV/yaGmGSVZ0AaYky3/WIjU/EFmWiE026x/xfqNdL2+F3yKhgegDY+2
         weM96A6HpNYv43hmh9JbcUyD+xVlxEne0ZLnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740667807; x=1741272607;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lt1StCpOXNqv7Lr191DNGZW6tiAohifbvAlFZ8p614=;
        b=CTJFh/5/7hHXovMxyUGL1ctYXm9rzKiD/4gfNWp6QtSqYwa16gGBITx96Sn4dmXv7/
         vLBUGgz5E3NpNPdYlj3MUk+MRIdv0/TKcH9hWGFCBpsTVyk75VfKThxOM93gR/f/nrIT
         VrthBpoFv2XPnPP8mIW3+nOl4OwutlBmNbo4WMN/WYR/JD8UmtBNLlSsosRSRlYsQDO9
         9eRi2QUu/7UkPWTfr+T6U8I5CgsLpo/CVE5NzM0IwK9JeCLymPr45xBzVU/+7bMzEqZq
         6ZrTU9X1N7UCI7IdF7EW0kEQ9UcdghLbnXZyITIUuweI17CkAsI/5Vga+S1yFa26aGyx
         CStQ==
X-Gm-Message-State: AOJu0YzQkzHqDGWRtKOjyFtNBqEF311NpEWsKOMVUU8oOPZfElKt2Qwt
	Z/O1QaZvKOMLGIysYZdCz0H2CP9qmZmltQmvCf4ug6Qi/GJqBRDVpCorqed3hNRR6HtOJjAaTGV
	i
X-Gm-Gg: ASbGncuCPPBzn6hF10m6IOeuwP/PEezFQU6BsL7LbclFhCA8KDy/SF/6u7b8opg6uYk
	XDSL9g8gce3rIHZifIaRbg994XfHxgnHVISS+4c2x5Kok9Vi2wibicmELSGt6utJT+nJt4Ov2gl
	7oX30RX2gqlXWr3XNVqFodW+TQZuiZBROdt2skln9y7g1OS6hsqtD5PHFBBYhWj6wXhPX089Kt9
	iiteunhdlcfXt2YhCSZRJc3e/HPv4Vv5dvg2daHteQDwTlEWvFoHyshwaoh1WM93hDUEkOJvthl
	VuTsIwExpCuuUxBcIFMVZe87rF8zCNIn
X-Google-Smtp-Source: AGHT+IFc4EXzylXZ3rXF+FLw/XmGymdtyMSxsueaZF7vGgbRr0GU6vPrAGWzCqnlzmeq12szBNnMQg==
X-Received: by 2002:a17:907:7e83:b0:ab7:f36a:24e4 with SMTP id a640c23a62f3a-abf060455cemr433196766b.9.1740667807445;
        Thu, 27 Feb 2025 06:50:07 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Feb 2025 14:50:06 +0000
Message-Id: <D83B8MUC2HYI.F3IYZM092P3R@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <Z78djoAU7vjGepjr@macbook.local>
 <a9d4384c-770b-4947-b099-cf4bba1583a5@suse.com>
 <Z78lJfzqH9btDMrM@macbook.local>
In-Reply-To: <Z78lJfzqH9btDMrM@macbook.local>

On Wed Feb 26, 2025 at 2:28 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Wed, Feb 26, 2025 at 03:08:33PM +0100, Jan Beulich wrote:
> > On 26.02.2025 14:56, Roger Pau Monn=C3=A9 wrote:
> > > On Mon, Feb 24, 2025 at 01:27:24PM +0000, Alejandro Vallejo wrote:
> > >> --- a/xen/common/page_alloc.c
> > >> +++ b/xen/common/page_alloc.c
> > >> @@ -490,13 +490,11 @@ static long outstanding_claims; /* total outst=
anding claims by all domains */
> > >> =20
> > >>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
> > >>  {
> > >> -    long dom_before, dom_after, dom_claimed, sys_before, sys_after;
> > >> -
> > >>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
> > >>      d->tot_pages +=3D pages;
> > >> =20
> > >>      /*
> > >> -     * can test d->claimed_pages race-free because it can only chan=
ge
> > >> +     * can test d->outstanding_pages race-free because it can only =
change
> > >>       * if d->page_alloc_lock and heap_lock are both held, see also
> > >>       * domain_set_outstanding_pages below
> > >>       */
> > >> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct d=
omain *d, long pages)
> > >>          goto out;
> > >=20
> > > I think you can probably short-circuit the logic below if pages =3D=
=3D 0?
> > > (and avoid taking the heap_lock)
> >=20
> > Are there callers passing in 0?
>
> Not sure, but if there are no callers expected we might add an ASSERT
> to that effect then.
>
> > >>      spin_lock(&heap_lock);
> > >> -    /* adjust domain outstanding pages; may not go negative */
> > >> -    dom_before =3D d->outstanding_pages;
> > >> -    dom_after =3D dom_before - pages;
> > >> -    BUG_ON(dom_before < 0);
> > >> -    dom_claimed =3D dom_after < 0 ? 0 : dom_after;
> > >> -    d->outstanding_pages =3D dom_claimed;
> > >> -    /* flag accounting bug if system outstanding_claims would go ne=
gative */
> > >> -    sys_before =3D outstanding_claims;
> > >> -    sys_after =3D sys_before - (dom_before - dom_claimed);
> > >> -    BUG_ON(sys_after < 0);
> > >> -    outstanding_claims =3D sys_after;
> > >> +    BUG_ON(outstanding_claims < d->outstanding_pages);
> > >> +    if ( pages > 0 && d->outstanding_pages < pages )
> > >> +    {
> > >> +        /* `pages` exceeds the domain's outstanding count. Zero it =
out. */
> > >> +        outstanding_claims -=3D d->outstanding_pages;
> > >> +        d->outstanding_pages =3D 0;
> > >> +    } else {
> > >> +        outstanding_claims -=3D pages;
> > >> +        d->outstanding_pages -=3D pages;
> > >=20
> > > I wonder if it's intentional for a pages < 0 value to modify
> > > outstanding_claims and d->outstanding_pages, I think those values
> > > should only be set from domain_set_outstanding_pages().
> > > domain_adjust_tot_pages() should only decrease the value, but never
> > > increase either outstanding_claims or d->outstanding_pages.
> > >=20
> > > At best the behavior is inconsistent, because once
> > > d->outstanding_pages reaches 0 there will be no further modification
> > > from domain_adjust_tot_pages().
> >=20
> > Right, at that point the claim has run out. While freeing pages with an
> > active claim means that the claim gets bigger (which naturally needs
> > reflecting in the global).
>
> domain_adjust_tot_pages() is not exclusively called when freeing
> pages, see steal_page() for example.
>
> When called from steal_page() it's wrong to increase the claim, as
> it assumes that the page removed from d->tot_pages is freed, but
> that's not the case.  The domain might end up in a situation where
> the claim is bigger than the available amount of memory.
>
> Thanks, Roger.

This is what I meant by my initial reply questioning the logic itself.

It's all very dubious with memory_exchange and makes very little sense on t=
he
tentative code I have for per-node claims.

I'd be quite happy to put an early exit before the spin_lock on pages <=3D =
0.
That also covers your initial comment and prevents claims from growing afte=
r a
domain started running if it didn't happen to consume all of them.

Is anyone opposed?

Cheers,
Alejandro


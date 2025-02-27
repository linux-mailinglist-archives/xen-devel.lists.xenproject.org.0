Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF060A48240
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 16:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898195.1306772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfMn-0004ly-8r; Thu, 27 Feb 2025 15:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898195.1306772; Thu, 27 Feb 2025 15:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfMn-0004kJ-5t; Thu, 27 Feb 2025 15:00:01 +0000
Received: by outflank-mailman (input) for mailman id 898195;
 Thu, 27 Feb 2025 14:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKwg=VS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tnfMk-0004kD-W8
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 14:59:59 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82b667ff-f51b-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 15:59:57 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaec111762bso174046266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 06:59:57 -0800 (PST)
Received: from localhost ([46.149.103.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0b92desm134413966b.25.2025.02.27.06.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 06:59:56 -0800 (PST)
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
X-Inumbo-ID: 82b667ff-f51b-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740668397; x=1741273197; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXweAsiXIlFL+pDxu9aiQwdMCB9JKxPVoHxCV0SyLg4=;
        b=RmJPTYTo/b4KQ3ovdn5yC3jSAGn3cKg020k+XKX0WygLvgk3egPy5BMLJ8jRigRREK
         13eE1eOiM1KkTL7VbezSgKPlBvVf7/cpNE/xrlF9y1G6zeSsI6EeBI/jNgBjHru2+0rz
         TALZfYIwU2XopFRQjCPlCorMhhFhj+/OMY3I0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740668397; x=1741273197;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AXweAsiXIlFL+pDxu9aiQwdMCB9JKxPVoHxCV0SyLg4=;
        b=B50hDfJI5h9NJQuLZbObn50fNn57o8gUamxm39/ahDHYbkuuskOK532pW/RcKVajpw
         WfGUFEriBUazfsol4Iel+akKCTRhu2SrrT/d+F+W7JMoTcvve18BZ0zGohp7M7G11rIy
         UGfZG7+0B6Kf6JPKFBDcpGWDc70dFPVjFrM2OrZYRqTzAweIFPgs0ZpWYr4aF3rVuypv
         +zJaI64Zzlc6qFG4BDDDTkv2DjitVCne5xeMiPjcstxjmVc5XC7u/Zcp/tFT51trbsZB
         NUjwYLiugh3pH2VewL3jyxfcrJC2g/ftaCrTQM5z54OiSyN08ugrJGMOj+peO66MhiYT
         Df5g==
X-Forwarded-Encrypted: i=1; AJvYcCXjzMZJ27bVBvhQCJ8RwsG7xyJruRrpW+bfwX1M+5h0Pv6t0moEqWVX3eljjf808R8wMuH8UYfMfms=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSQOccHswKwb7OtUG5Q0WaEPRK6fsUjDiLIPCICH0NkHnSmC+D
	eMna30PlhdRbfgrsFJY2Y1pC3+fIZifiQoE9rNCSxnGNK/vgYolMcUaJgxrWX3I=
X-Gm-Gg: ASbGncvnRvcbdWGxZfEa2bYXMdhFP5CJIupEQ6kBy1aw0ndfKP3oKJmUxSfikeGCKwZ
	07Sf+Y9+wP8y38EjFa6LGDSuLdRxDDziTzKErYhdrWqHLQ7brIXIy8NfW1VsXvKT0Ey6feu0zY6
	hFJIn1EkcPR7omJ9vLQY8jrHXykOrl8VHesqzM2c/JMz08bbwvaoKCgtpgiP5XcFe68qm9ZxohW
	eshfvn5EHQ7lg34j+fJRVS7kWAiesSi/cAYrAhpZy7Oktop9sMWS6NXsiN6J76DHiIlsc7pQ8oi
	VX9GygftHhpo+Q4Bvd8HyY3qcm5otkMw
X-Google-Smtp-Source: AGHT+IEXFVzFS50GX/nItjNFHHV0bXBID1QwnAFT8klKJ+E/U9lPDWrS1aAuy31+Z83SW3RIhnPMCw==
X-Received: by 2002:a17:907:9722:b0:abc:7d6:e445 with SMTP id a640c23a62f3a-abeeef835f5mr995695466b.54.1740668397270;
        Thu, 27 Feb 2025 06:59:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Feb 2025 14:59:56 +0000
Message-Id: <D83BG5T2IRZW.2J68RYJ8CFPY6@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
X-Mailer: aerc 0.18.2
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <fde4d70e-d7af-4e51-a871-d4ac19737064@suse.com>
In-Reply-To: <fde4d70e-d7af-4e51-a871-d4ac19737064@suse.com>

On Wed Feb 26, 2025 at 2:02 PM GMT, Jan Beulich wrote:
> On 24.02.2025 14:27, Alejandro Vallejo wrote:
> > @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct doma=
in *d, long pages)
> >          goto out;
> > =20
> >      spin_lock(&heap_lock);
> > -    /* adjust domain outstanding pages; may not go negative */
> > -    dom_before =3D d->outstanding_pages;
> > -    dom_after =3D dom_before - pages;
> > -    BUG_ON(dom_before < 0);
> > -    dom_claimed =3D dom_after < 0 ? 0 : dom_after;
> > -    d->outstanding_pages =3D dom_claimed;
> > -    /* flag accounting bug if system outstanding_claims would go negat=
ive */
> > -    sys_before =3D outstanding_claims;
> > -    sys_after =3D sys_before - (dom_before - dom_claimed);
> > -    BUG_ON(sys_after < 0);
> > -    outstanding_claims =3D sys_after;
> > +    BUG_ON(outstanding_claims < d->outstanding_pages);
> > +    if ( pages > 0 && d->outstanding_pages < pages )
>
> The lhs isn't needed, is it? d->outstanding_pages is an unsigned quantity=
,
> after all. Else dropping the earlier of the two BUG_ON() wouldn't be quit=
e
> right.

d->outstanding pages is unsigned, but pages isn't.

It was originally like that, but I then got concerned about 32bit machines,
where you'd be comparing a signed and an unsigned integer of the same
not-very-large width. That seems like dangerous terrains if the unsigned nu=
mber
grows large enough.

TL;DR: It's there for clarity and paranoia. Even if the overflowing into bi=
t 31
would be rare in such a system.

>
> > +    {
> > +        /* `pages` exceeds the domain's outstanding count. Zero it out=
. */
> > +        outstanding_claims -=3D d->outstanding_pages;
> > +        d->outstanding_pages =3D 0;
> > +    } else {
>
> Nit: Braces on their own lines please.

Ack.

>
> In any event - yes, this reads quite a bit easier after the adjustment.
>
> With the adjustments (happy to make while committing, so long as you agre=
e)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks. I'd probably like to hold off and send a v2 if you're fine with the
adjustment I answered Roger with (returning ealy on pages <=3D 0, so claims=
 are
never increased on free).

>
> Jan
>

Cheers,
Alejandro


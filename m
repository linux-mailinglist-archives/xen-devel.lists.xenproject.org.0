Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5337726BEE5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:13:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kISZM-0007oL-53; Wed, 16 Sep 2020 08:13:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7lL=CZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kISZK-0007oF-Oe
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:13:34 +0000
X-Inumbo-ID: c477f104-b04b-4877-b3f5-2b32323a2788
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c477f104-b04b-4877-b3f5-2b32323a2788;
 Wed, 16 Sep 2020 08:13:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id d4so1835525wmd.5
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=OR4EFRZ9UAv5CW0MVZNZLCI+6OuyaflBOfpp4z4E54I=;
 b=TlYZDhG+LqJq5SZu2LiDq3/wGErDFe+spujJhJ310m1+qDo32ixe0W6vLcFYn2tyK1
 OgWOJm8qngZD9O5VPX/vwjCYgYJGy4AH/IRWy3ffNmxJCP/K+djVX4WvUugrM+IEOuDv
 DOPzJl90DcepO68T++aGAg0z2sWl+ckKWnoxfcgiBnvVlCWFCZA+TKqwDg+XJAdAK9yU
 dzXEhCePdgdUcBy/BN196XmLSpc6qonkbiIUQzGt42HA6WhgqsjKMgfdDJMYhArUF09O
 xSmDdIeC2sqEpKRCqTE+XWPBMrdfUHuoypKV3MM+y9tvQM8NDEpF+za6Eu1XHBhPfqWG
 OPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=OR4EFRZ9UAv5CW0MVZNZLCI+6OuyaflBOfpp4z4E54I=;
 b=TwW8CvTEANj0mBFWmxK6xCLvWJsc9tbBDid9zsiMuZhwQTgPPIBjaIlkUT8vWQFigi
 xt/VRgpWO6Br4BEyzwgjSq2tyyMQJREw8BwymJojqMgU0kOpHC8KXFPf7rtQtTzjaFK0
 vh/4pHt87B7MuDd16UncL+Y5jcBbJjRYoMm2lp8X4B+B/wepalK2xwcphutm3k39IzF5
 XLJCzw+fWw27u9vWC0Xq1VCjNGOcL3ymYJ9e6abN++acutxBiTJnb5UJvjPtMHm6yycW
 vgP2gEu7S5zZNAUMzcrj56TAyGgTDSTIxM9BgGh5pYvJZEow+Jc8vjlBVgfWdVf2sK64
 p2XA==
X-Gm-Message-State: AOAM5302Pf9tuZtRW3MZyKUrnG57unIh1E1PFe8DAqngQGzsMZa8fAeO
 1aIAvgQlXAmjl7uGkyaQFRo=
X-Google-Smtp-Source: ABdhPJzGzlHa+71J78Y65tx4xZLbREJzS3EFobIszmGYOH9KhsvSpsITO0GROs2ir6Sl6mSy0pGEZw==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr3407490wmk.128.1600244013068; 
 Wed, 16 Sep 2020 01:13:33 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id u12sm3808824wrt.81.2020.09.16.01.13.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 01:13:32 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>
Cc: <xen-devel@lists.xenproject.org>,
 "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Julien Grall'" <julien@xen.org>,
 "'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Julien Grall'" <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-12-git-send-email-olekstysh@gmail.com>
 <93cc6603-44f2-1ceb-997d-cbc51c3ba2c3@suse.com>
In-Reply-To: <93cc6603-44f2-1ceb-997d-cbc51c3ba2c3@suse.com>
Subject: RE: [PATCH V1 11/16] xen/ioreq: Introduce
 hvm_domain_has_ioreq_server()
Date: Wed, 16 Sep 2020 09:13:31 +0100
Message-ID: <002801d68c01$44756ad0$cd604070$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIQ4beZ3sUmYihKXwfoVgy4BRIJGwFWABUoAe1Op8eo3CLzwA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 16 September 2020 09:05
> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant =
<paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko =
<oleksandr_tyshchenko@epam.com>; Stefano
> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; =
Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger
> Pau Monn=C3=A9 <roger.pau@citrix.com>; Julien Grall =
<julien.grall@arm.com>
> Subject: Re: [PATCH V1 11/16] xen/ioreq: Introduce =
hvm_domain_has_ioreq_server()
>=20
> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > This patch introduces a helper the main purpose of which is to check
> > if a domain is using IOREQ server(s).
> >
> > On Arm the benefit is to avoid calling handle_hvm_io_completion()
> > (which implies iterating over all possible IOREQ servers anyway)
> > on every return in leave_hypervisor_to_guest() if there is no active
> > servers for the particular domain.
> >

Is this really worth it? The limit on the number of ioreq serves is =
small... just 8. I doubt you'd be able measure the difference.

> > This involves adding an extra per-domain variable to store the count
> > of servers in use.
>=20
> Since only Arm needs the variable (and the helper), perhaps both =
should
> be Arm-specific (which looks to be possible without overly much =
hassle)?
>=20
> > --- a/xen/common/ioreq.c
> > +++ b/xen/common/ioreq.c
> > @@ -38,9 +38,15 @@ static void set_ioreq_server(struct domain *d, =
unsigned int id,
> >                               struct hvm_ioreq_server *s)
> >  {
> >      ASSERT(id < MAX_NR_IOREQ_SERVERS);
> > -    ASSERT(!s || !d->arch.hvm.ioreq_server.server[id]);
> > +    ASSERT((!s && d->arch.hvm.ioreq_server.server[id]) ||
> > +           (s && !d->arch.hvm.ioreq_server.server[id]));
>=20
> For one, this can be had with less redundancy (and imo even improved
> clarity, but I guess this latter aspect my depend on personal
> preferences):
>=20
>     ASSERT(d->arch.hvm.ioreq_server.server[id] ? !s : !!s);
>=20
> But then I wonder whether the original intention wasn't rather such
> that replacing NULL by NULL is permissible. Paul?
>=20

Yikes, that's a long time ago.. but I can't see why the check for !s =
would be there unless it was indeed intended to allow replacing NULL =
with NULL.

  Paul



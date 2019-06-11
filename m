Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD5E3C80B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:04:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadbI-0001te-Gb; Tue, 11 Jun 2019 10:01:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5o1B=UK=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hadbG-0001tW-Qz
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:01:54 +0000
X-Inumbo-ID: effa44b7-8c2f-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id effa44b7-8c2f-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 10:01:53 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Tue, 11 Jun 2019 12:01:52 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Tue, 11 Jun 2019 11:01:28 +0100
Message-ID: <92e876b270f5ab823f34033ce9ba3460250759b5.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, George Dunlap
 <George.Dunlap@citrix.com>
Date: Tue, 11 Jun 2019 12:01:26 +0200
In-Reply-To: <fef869c7-263f-6595-4f38-7a10f94bd18f@gmail.com>
References: <1559225751-30736-1-git-send-email-andrii.anisov@gmail.com>
 <16B40EA2-7781-48E7-94CA-52B328CE197B@citrix.com>
 <1dd86fe1814a52cb9b521a39511c2c5b70379b03.camel@suse.com>
 <fef869c7-263f-6595-4f38-7a10f94bd18f@gmail.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] schedule: move last_run_time to the
 credit scheduler privates
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============0149209822206299341=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0149209822206299341==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-TwfGE93kUz1TFrDkJ7Si"


--=-TwfGE93kUz1TFrDkJ7Si
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-06-10 at 18:16 +0300, Andrii Anisov wrote:
> On 31.05.19 16:24, Dario Faggioli wrote:
> > --- a/xen/common/sched_credit.c
> > +++ b/xen/common/sched_credit.c
> > @@ -175,6 +175,9 @@ struct csched_vcpu {
> >       atomic_t credit;
> >       unsigned int residual;
> >  =20
> > +    /* last time when vCPU is scheduled out */
> > +    s_time_t last_run_time;
> > +
> >   #ifdef CSCHED_STATS
> >       struct {
> >           int credit_last;
> >=20
> > The comment is not accurate. And I'm afraid that it could be
> > misleading
> > for someone reading it, but then realizing that the code does
> > something
> > slightly different, and hence not being able to tell which one of
> > the
> > two things is correct.
>=20
> Well, I copy-pasted that. And was wrong here. Me actually against the
> text comments inlined into the code. It happens that code changes
> faster than comments and in result comments become misleading very
> often.
> I'd rather drop the comment at all.
>=20
Well, in general, I've mixed feelings on the subject.

About this specific case, if we find a suitable new name for the field,
I agree that the comment may very well become pretty useless.

> > So, either we change the comment (but I'm not capable, right now,
> > of
> > finding something that is short and, at the same time, clear
> > enough),
> > or we change how the variable is using.
>=20
> As per the current code I'd rename the member to `last_sched_time`.
> To reflect that it is the time when the vcpu went through scheduling
> path.
>=20
Ok, yes, this is something I personally can live with. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-TwfGE93kUz1TFrDkJ7Si
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlz/e/YACgkQFkJ4iaW4
c+7juBAAnd60ExzK4FuWc4gWhRJwR56BSDFA18F+4gIM+OgDCMPb2n2mI3rcRkfT
i/pKxA5igrbRiwccfUIFvzdreYitFSWd53TAGKChzeSf/+CP4ki6vSa788zwatNP
b+p0ICZ5+CRRu0RwbMM0wEYq1CNw2DjMdZ2oLTA0juWGQpdE6qhlDQ5lt3i+tcfk
7ST7wsWqd7WhYUjW4YdiQL8li8j3hCpxKP50H5uZb0rYxL7dQgln4pEux0SwPDYs
Peh9P6iaPno7fIJwZMQ1yYLouaGUoau4PRzzu24faalOQHAGiQq2fBfdcpqRJ2xR
TkMh0q075v/kISUfQ7X7QnsPWxSnrU3jxpYahMVc8Eit/fgxO9COPY2oTDayS3gZ
aH54zHbAcRiTfw6ZMY0CPJ/Hkkdq+IzU8ulHTzKWygVtv9OrvcfLGJEQSngfNsRQ
Qk4XsjjZ3iV2Bbdx4KrghGXwuy5sExlAf6ym28gL4t/SXNvauNmXQJGPBK1bCkqd
3xLaudJ/kprnQvUnwhpOB+209gDXEl7czwYx2qUuTwtG792UI1Wamcx3hgM/AUMq
0dl8lXtObnI5xDAa5wGn1QHil3Bg+ptPd8i6yasxYwQHvTgjFjxmwqY8lxV5+zkQ
mad04Rs5CKcFNjPmYfQH0jk45DngxZ8x71X1IJKD1Yi7A/CQC8Q=
=FALW
-----END PGP SIGNATURE-----

--=-TwfGE93kUz1TFrDkJ7Si--



--===============0149209822206299341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0149209822206299341==--



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB0AD9AE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 15:07:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7JKm-0001Tw-Gp; Mon, 09 Sep 2019 13:03:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oV3q=XE=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i7JKl-0001Tq-G7
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 13:03:55 +0000
X-Inumbo-ID: 45dd0c7f-d302-11e9-ac0b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45dd0c7f-d302-11e9-ac0b-12813bfff9fa;
 Mon, 09 Sep 2019 13:03:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29E97ABCB;
 Mon,  9 Sep 2019 13:03:53 +0000 (UTC)
Message-ID: <4049e24b4a82cff0350178f2db103c9b964b3d28.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Date: Mon, 09 Sep 2019 15:03:50 +0200
In-Reply-To: <3e4ed5b5-38e7-6ea7-e674-40d445a2826e@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-8-jgross@suse.com>
 <7ce66a65-8f1b-1587-590c-17d82ac2e800@suse.com>
 <ecad6cb4-c5e1-a280-f86f-3cc7255a0dd3@suse.com>
 <3e4ed5b5-38e7-6ea7-e674-40d445a2826e@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 07/48] xen/sched: move per cpu scheduler
 private data into struct sched_resource
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============3858159343751643642=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3858159343751643642==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mYSKRRQgwS/GbTDbTRo7"


--=-mYSKRRQgwS/GbTDbTRo7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-09-05 at 09:38 +0200, Jan Beulich wrote:
> On 05.09.2019 09:13, Juergen Gross wrote:
> > On 04.09.19 15:48, Jan Beulich wrote:
> > > On 09.08.2019 16:57, Juergen Gross wrote:
> > > >  =20
> > > > -/*
> > > > - * vcpu is urgent if vcpu is polling event channel
> > > > - *
> > > > - * if urgent vcpu exists, CPU should not enter deep C state
> > > > - */
> > > > -static inline int sched_has_urgent_vcpu(void)
> > > > -{
> > > > -    return atomic_read(&this_cpu(schedule_data).urgent_count);
> > > > -}
> > >=20
> > > I
> > > don't suppose there's a way to keep it inline but still drop the
> > > unwanted #include above?
> >=20
> > The only alternatives I could think of are:
> >=20
> > - Passing the "urgent" indicator via parameter to idle (you didn't
> >    like that)
> >=20
> > - Make urgent_count a plain percpu variable
>=20
> Named sched_urgent_count or some such, this latter option doesn't
> look too bad to me; not sure what the scheduler maintainers think
> of this, though.
>=20
This is ok for me as well.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-mYSKRRQgwS/GbTDbTRo7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl12TbcACgkQFkJ4iaW4
c+5s1RAAmjjKZZYKeYD5dedQ3FG7jIBluDtc4/lEnpr5BhZgH6Q+O1YiGQg6Ge9D
6xvSnW46PZXz+HdCfUgyLKgunwNlBU46JOWhaRls7WxV1yBEkjtO01GiMunACWcV
ZCruIl50WOtXWDHKW37WjmJiCufKzFC4/7Piah+qkXO/uqiFVoUH972J0yeM4w34
6wMXm8G4ninGovDghYwXPRLe8k2kZxd3rnc8waDxAiGCfAo7YthWss7i4CSoyULi
A1Kt7BI5Ww4kBmHn8wMIxJ23gLqHBT8meX73BrPJZKRpulKY/bvkcSWQbduGzmRE
ugj/p6WOQ8cGqf2GtyKYzxU3gSToPWe9PzyV/t1LTzxQOd9d3i8OyJRQgjibtb4x
CPoixuNHDHJRUNFwoVAdrfdd9VeThSSMaaQlF0yJOS6lon7y2Tp7+21PqTMvgiTz
hAgIlTJjkk5wb2DjBLI+zWtwUdzdyQG0PQBx+Bd8iDeN6zVmsUzLUCErWXJbs6BI
LZYK9r8U7va/my9tBmyxb78xb3CWs9BGsGCpVB2cf42TAqppeHw0Qjb+2JTzaeHQ
LmYu+Cjea11ZTlRnWzT3ENjbIIodJ5zWkon0ZYZ8hGdWW/kHMR4v4IaSB5qBf+hQ
zLPklYQzvbJivdYndgAa7Ky45k7uiwT72ycmkTYwdycr2RlBITQ=
=6QxC
-----END PGP SIGNATURE-----

--=-mYSKRRQgwS/GbTDbTRo7--



--===============3858159343751643642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3858159343751643642==--



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA663B029A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 19:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i86Ht-0005lo-3E; Wed, 11 Sep 2019 17:20:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ltH=XG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i86Hr-0005lj-56
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 17:20:11 +0000
X-Inumbo-ID: 67b01c58-d4b8-11e9-83dc-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67b01c58-d4b8-11e9-83dc-12813bfff9fa;
 Wed, 11 Sep 2019 17:20:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59401AE3F;
 Wed, 11 Sep 2019 17:20:08 +0000 (UTC)
Message-ID: <e19aeed971dc7582637648cb6e03a297b0f4d913.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Date: Wed, 11 Sep 2019 19:20:06 +0200
In-Reply-To: <39dae4c6-d8a9-a0d7-68fd-89610c9645c3@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-21-jgross@suse.com>
 <7b688998-123a-caec-9e01-eb3ac86f9dfc@suse.com>
 <39dae4c6-d8a9-a0d7-68fd-89610c9645c3@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 20/48] xen: let vcpu_create() select
 processor
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============1013978647467903600=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1013978647467903600==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-CDyTdZZNkid2HZJS6wN2"


--=-CDyTdZZNkid2HZJS6wN2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-11 at 16:22 +0200, Juergen Gross wrote:
> On 09.09.19 15:38, Jan Beulich wrote:
> > On 09.08.2019 16:58, Juergen Gross wrote:
> > > --- a/xen/common/schedule.c
> > > +++ b/xen/common/schedule.c
> > > @@ -368,14 +368,52 @@ static struct sched_unit
> > > *sched_alloc_unit(struct vcpu *v)
> > >       return NULL;
> > >   }
> > >  =20
> > > -int sched_init_vcpu(struct vcpu *v, unsigned int processor)
> > > +static unsigned int sched_select_initial_cpu(const struct vcpu
> > > *v)
> >=20
> > Given the response on an earlier similar question, I don't suppose
> > I could talk you into dropping the sched_ prefix here?
>=20
> I like it better with prefix. Any opinions by the scheduler
> maintainers?
>=20
I do like it with prefix better too.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-CDyTdZZNkid2HZJS6wN2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl15LMYACgkQFkJ4iaW4
c+7MxhAA3u+13KrGMUBWvHBPRiMbXRQLNXwbyPZi+SEKRaNcN+UK/xNo1Jtx02gI
P4WfFco046wWvNSBQxjcIGLyUCKjZrTEYVhUOC+ABDSh8HBwv74kuY1oeOZnfexc
sZJ9htlJBSR4rL2nYD2y+LcrGSUcnjXp914ip9HBujPEALdewqyrsfrhaEXWBLNN
4XUUMsrox4EKsQQz6kz26sDBFRLr+GQErWzzRon9cKZffOvfpG2DrUsazAIomYAM
ljKRuGaY8zGuaTOv2wa9VJejw5CGO1dmRnaHuGEqMBxo9zf5YNFUcrg9ZVLbbrjt
FVB9FKiMW8bj/98ShijcDtZX/mrA0tAzb0TlTZVQC7Tv2Cp/KJRv+vtIFMyiXo1x
jh87dGhOX6mYlnynutK109chUh0AZ6Qljb9/+GPFy/1Jmh8ipwzNNam/tp6DwxqE
v91nciK8m/H3aXQrQ++SqTMonLDdkQZmzGmiQxeO7vkTUEZLV+cbBz7STRLsTmDm
9CJp251OuLZfeL2Ft2vcgpk5fxE1LsUWeKh3kWObAfXhTGb2iV5c5NdRHBfp6S+f
2OBmfpW81I/YY1oDGi97aPd/fpZDsTIOWR2BCtXycQrrxBdVF98jlJWWbi1Fts1v
KoY94x5Zu08/vETqkJUfv71CtTosHHN3OKFanJACUjDrLtAkbpc=
=Ou4b
-----END PGP SIGNATURE-----

--=-CDyTdZZNkid2HZJS6wN2--



--===============1013978647467903600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1013978647467903600==--



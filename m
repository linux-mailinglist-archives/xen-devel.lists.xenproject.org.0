Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2FA42155
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 11:48:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hazoF-0005Xo-Fc; Wed, 12 Jun 2019 09:44:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiAS=UL=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hazoD-0005Xj-KQ
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 09:44:45 +0000
X-Inumbo-ID: b45f0f34-8cf6-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b45f0f34-8cf6-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 09:44:43 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Wed, 12 Jun 2019 11:44:42 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Wed, 12 Jun 2019 10:44:29 +0100
Message-ID: <a86b72d8b81caa61597b24108ea7c1734d02ae03.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Date: Wed, 12 Jun 2019 11:44:28 +0200
In-Reply-To: <5000adb1-ddaf-a13c-afc7-1e36674064a5@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-4-jgross@suse.com>
 <bc1bd71d30525853e293624ec9684935b3082d14.camel@suse.com>
 <5D00AC740200007800237511@prv1-mh.provo.novell.com>
 <5000adb1-ddaf-a13c-afc7-1e36674064a5@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============9092563797213697363=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============9092563797213697363==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-olzKu8arIPFwTZla2oCu"


--=-olzKu8arIPFwTZla2oCu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-06-12 at 10:06 +0200, Juergen Gross wrote:
> On 12.06.19 09:40, Jan Beulich wrote:
> > > > > On 11.06.19 at 18:55, <dfaggioli@suse.com> wrote:
> > > On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > >=20
> > > Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
> > >=20
> > > I'm wondering whether it make sense for the above to be quickly
> > > mentioned in the changelog, but am leaning toward "not really
> > > necessary". In particular, I don't think it's worth to respin the
> > > patch
> > > just for that... So, either just something that can be added
> > > while
> > > committing, or forget it.
> >=20
> > I'd be happy to add something while committing, but one of you
> > would need to propose the wording of this "something".
>=20
> What about:
>=20
> It should be noted that in credit2 the lock used to be set while
> still
> holding the global scheduler write lock, which will no longer be true
> with the new scheme applied. This is actually no problem as the write
> lock is meant to guard the call of init_pdata() which still is true.
>=20
I'm ok with this.

Thanks (to both) and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-olzKu8arIPFwTZla2oCu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0AyXwACgkQFkJ4iaW4
c+6qSxAAp5By0zOwS/LwTc+X5yHERYKWaZBem6Cn+fhEXM240zuNJAYU/cL/Nz7H
8jA/tMePocQUgD4YDB54IqUuWGDh7GV3O2YmOTiWjvZggCXt/5u6h0BbRndjvFOi
ehWqgYDnCqyFon15qp1JrxECceshBnWJ2Kpr2zgxF3MEVY1uO2426TIwDMdHS7wY
IbmlpcjSwmvc88H99H0eE/7J4GLZ3MKyjYMSEK/bVBU3MYOtlUY3oMgt1OjPYyIV
obLWhPQW9EFjHkeCZ2YyZOauUVwk15Kix2Gyyf0w34/tMyzi6OxujWs4WXL++1Bs
9NXoJW0iSVIOsyAZ+9SOSDnU526YPnmeq0ayKQxZblcyPsGim5YwlA3lwMZMdVbH
pip/0uNNMWDVR/yZ2p6T7FFNjKLmcV8lNW9yD4MQItzWJLtUuRH5v8VSZvn+gauZ
ntLy3GW9GcCFsXZrJuXKKmEByLTo20sDDRKdPfI8wCVjKPpdPbG9I47ewujAXUX7
Zf26E+0SsznQHcSdGtMXhsXZtUnYgM8eIxFREW7wPxtnVXMVRZ10F985UaFERBw0
nYNvD87WAdVaz3CizjUx0GSXurD6xIutB/GW1yhwIYWdAA1GBfbfD9KtZH979Ktj
MnatCXAPbi/OlRcGy/i3RH/tztizGsPAOEt9xhhqayG5XXA3tS8=
=SysI
-----END PGP SIGNATURE-----

--=-olzKu8arIPFwTZla2oCu--



--===============9092563797213697363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9092563797213697363==--



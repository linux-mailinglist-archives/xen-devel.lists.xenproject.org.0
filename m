Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5653C6E9F6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 19:20:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoWVw-0007G5-OY; Fri, 19 Jul 2019 17:17:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7nr=VQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoWVv-0007G0-DR
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 17:17:47 +0000
X-Inumbo-ID: 179ee918-aa49-11e9-9a1e-df564fa137dc
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 179ee918-aa49-11e9-9a1e-df564fa137dc;
 Fri, 19 Jul 2019 17:17:43 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 17:13:45 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 17:16:27 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 17:16:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htxKAkuQbytC6AdUjbxmBWBgq8sYiNT7YXaYkaASAwVD18kkbcohdycedJwcDTmAjc1ieyY0ooV1zqbkiwawdz9xaT6+/gsGAEg0j7A9jKuXrwympf/IwBW6GANACCZwcmgXL9u20icXdrbz9DaCjkE7Ol/BSDAtTOrY9EN6jhSaVD0xNvzxyaRmCeVmvtK46jTzynGl5/fqD1mUm5u5/7OHmFjXY7R96MuPQSQMb58PDYYOXFTR/fuli2Wd/FJSEineG3dQ7k17Ftjig+Zh/Opo5yh+7gAcw8y4Reh5LIGp3E7LqmKNriW/gLwtduVII6nC6Svo6g4n590fCuTYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBe/wStOVfJc3QVxC7osmCevwG/W5wgYPVb/i8mU8kM=;
 b=oNZPe8hAGzHSmz/aE5eoXyIitVhvTChs7g+97A7gTvrZG46raPrVGqCnFbj6YPmWY1kCLGwuUDl6utiBwU5+KQ5ochNbELOh42Z1LDuvES+pO/6YNTZnTqTTyFlOHkp7VJuNkmRCKfaUiDpduASOJzzUUa9yVra/DqO8niCnsF+B3z/2ILPkSfgySIQblH8OKjcL8XARhkdf/F9/eDaKmkPMmpJCJXHoeJ530+O+fUBTnCDNtSC8zExrnJly+i0zQ7e4HyW1onO4MZZfQSNWeXoQzb1uyZAmInlcL9MJammiMYrLf8h53JIQ7i+TqAQasnrctYqSKG6XvMgmVhUYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1306.namprd18.prod.outlook.com (10.173.214.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 17:16:26 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 17:16:26 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 07/60] xen/sched: build a linked list of
 struct sched_unit
Thread-Index: AQHVPcUiu1Sp9PA7KEakXcPYJ1SK66bRZDemgADLoAA=
Date: Fri, 19 Jul 2019 17:16:26 +0000
Message-ID: <c00543a0e3ccd5bb297d2a152c292855adac349b.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-8-jgross@suse.com>
 <d6c0b816a66282436f24441c626fd31bb8a39a44.camel@suse.com>
 <b7fe6bb5-7a51-ea74-012a-cda7011261b3@suse.com>
In-Reply-To: <b7fe6bb5-7a51-ea74-012a-cda7011261b3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c364d145-6745-49b9-fbd7-08d70c6cd52e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1306; 
x-ms-traffictypediagnostic: DM5PR18MB1306:
x-microsoft-antispam-prvs: <DM5PR18MB1306623142CF99BEC2A3DA1FC5CB0@DM5PR18MB1306.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(189003)(199004)(3846002)(25786009)(36756003)(256004)(6116002)(86362001)(446003)(11346002)(186003)(26005)(229853002)(99936001)(476003)(2501003)(2616005)(102836004)(76176011)(81166006)(2906002)(14454004)(81156014)(6506007)(53546011)(486006)(5660300002)(66446008)(71190400001)(71200400001)(6246003)(66476007)(53936002)(4326008)(8936002)(305945005)(53366004)(53376002)(7736002)(66556008)(66616009)(76116006)(91956017)(66066001)(66946007)(99286004)(478600001)(6436002)(110136005)(6486002)(966005)(68736007)(118296001)(8676002)(64756008)(54906003)(316002)(6512007)(6306002)(21314003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1306;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AmzapenaJzeeDAjjtO0oow+PAfnzqST6+6PaTosCfUAqmS/TEmlZm1M3YL55LT21Rlz+etGiHjmiOs5HlGLOKwh52tJ9vPFspHxMe/1gcxG/n9xn70Wp1YLKrdUoER2LXK6BGFzyHPBHVV2WYqCGlzRqCKjoEHI+Wh6Oaq16k8q36J3NPdGjXXISjt0OBLgddTAMjtR/jVR1dStNmBQ3xRyyWReLsnN13NXzxOl+HCr1isf+7zMswh6EkzI5R6yHvv1BF+FR9EFaTPYA4i+COm8UuMLOsKMZmP8C8u6jYe25sjVVh3aNoBhZDpk47L22jhbHsWXlYn/SCc0kEXwhLnpJBiDL1m/BYNUALNi2dDZyciQnK72OOH6Zy7L36F3MfAkHblHq72VIy9ah2Vr+FN0bpDixybQymaLx2RguQng=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c364d145-6745-49b9-fbd7-08d70c6cd52e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 17:16:26.7390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1306
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 07/60] xen/sched: build a linked list of
 struct sched_unit
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============7908340715198079396=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7908340715198079396==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-zePLxPiyFz9hJ9rQAmu/"

--=-zePLxPiyFz9hJ9rQAmu/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-19 at 07:07 +0200, Juergen Gross wrote:
> On 19.07.19 02:01, Dario Faggioli wrote:
> > On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> > >=20
> > How about a ',' between domain and build?
>=20
> Okay.

> > "over all vcpus of a sched_unit" ?
>=20
> Oh, of course!
>=20
Thanks.

> > One question:
> >=20
> > > @@ -279,8 +279,16 @@ struct vcpu
> > >   struct sched_unit {
> > >       struct vcpu           *vcpu;
> > >       void                  *priv;      /* scheduler private data
> > > */
> > > +    struct sched_unit     *next_in_list;
> > >   };
> > >  =20
> > > +#define for_each_sched_unit(d,
> > > e)                                         \
> > > +    for ( (e) =3D (d)->sched_unit_list; (e) !=3D NULL; (e) =3D (e)-
> > > > next_in_list )
> > > +
> > > +#define for_each_sched_unit_vcpu(i,
> > > v)                                    \
> > > +    for ( (v) =3D (i)->vcpu; (v) !=3D NULL && (v)->sched_unit =3D=3D
> > > (i);         \
> > > +          (v) =3D (v)->next_in_list )
> > > +
> > >=20
> > So, here... sorry if it's me not seeing it, but why the
> > (v)->sched_unit =3D=3D (i) check is necessary?
> >=20
> > Do we expect to put in the list of vcpus of a particular unit,
> > vcpus
> > that are in another unit?
>=20
> Yes.=20
>
Ah!

> I'm making use of the fact that all vcpus in a unit are consecutive
> as I'm re-using the already existing list of vcpus in a domain:
>=20
> dom->vcpu0->vcpu1->vcpu2->vcpu3
>        ^             ^
>        !             !
> unit0-+             !
>                      !
> unit2---------------+
>=20
Ok, I see. Can you add a short comment, above the for_each_xxx
construct, about that?

"All vcpus from all sched units are kept in the same. Only iterate over
the ones from a particular unit"

Or something like this.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-zePLxPiyFz9hJ9rQAmu/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0x+ukACgkQFkJ4iaW4
c+7XcxAAivkLc4vX9vXJniCWfDvUc2t/z389eYCQNkMcQGeIRbHy+C2k0wZwSN5X
QchkOThG52QDazQfAbX/N4IUqUnyGx1aqdRyXOP79mHNsBAbBM9gfMm15k3+VUSd
QrkcJ/BOQeWkZLmFe9ZGhuVvA+Xp4TP6h8xRkR11dljyI9ALmQYpp4DCkBG04wwN
iLjGBdio6s56f60TGER38X/5vUh0RBRWdssdM6xGNP3/MoM59BJtDhhWT9IOQt48
TGVX4KuWkHH75xpZvP30BmvY++ZT6c2AOP7biEqgD1h3ewDQ/+yBEfx+T+O5sbSU
c4Sg0F4uLWhoRPIYx2WMCS9s2VcXsBiemjwoovnR3zxIiXsWTyKbkEMY2jk08Jkw
T3yS5RCp+8OjQcFGt+0A1K7pHPGUGih4F/+ulglHZsLCOjSeafnFoLlq2Heo5oE3
GWnR6ohhIxUYwzzwrU4Nq+7SeXab9Py1Oi6h4OsgafEgR9Dm7WbJLfTbKYVTLeHr
qJNB8JoWM3Wxh0Tgn1dD0Vqs8UPJEelRC2Cw3HZ9izPVLS0oImEn6AS06T4EKBX1
9+Lz9feBSWA52VAwZizebnTGQ98GwHI6SdzOiXP6jXA3CuP868baPCg+9rTN9Fdg
1/OtFskBik4wZLIgHxUlQWVL12zChLP52W9vVfG/HeVcuRo0DFo=
=nont
-----END PGP SIGNATURE-----

--=-zePLxPiyFz9hJ9rQAmu/--


--===============7908340715198079396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7908340715198079396==--


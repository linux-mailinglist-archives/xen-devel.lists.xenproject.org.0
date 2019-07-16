Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799BA6AB6D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 17:09:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnP2U-0003c8-0q; Tue, 16 Jul 2019 15:06:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=twXG=VN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hnP2S-0003bv-GO
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 15:06:44 +0000
X-Inumbo-ID: 51b4d1e3-a7db-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 51b4d1e3-a7db-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 15:06:42 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 15:06:41 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 15:00:55 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 15:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsutHkZKxyJx5bXVQRRDuQiLoy6Xu64tIjAayOC5cL9Dvp5NRs/zS5DG0xnHSUmEYGyUoMfiFcFqnuamK33XmdVbMw4nBwFBWfZR+cXJXDaCsXv/NduzeCBxBhbgIVIF38DaP64b1FSqI0qFifoR2pqYUpQsWtKeVeywlVXeQfLRurysT5GMgCOoR0lqN2MnverpiymBv4VaQQeTITDGxo+pmjsuZ7uqPTNgb6xnPonYZtwJvlwoSeSC4uUvLb6gdrZATFdD9tv2tG1BIW4Xlqygkq6EJOz0q4X539IehSl2Ev7BNkzQUP9SrdBKaTP6reIrp3M4pnJ+bLvz5xGaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUFIfBNfbMBbD4pPriKpBfZKRtDMSUXPYw+4qaH1g5M=;
 b=laRnmNyj57wRmWXtQZ6hpFnUy1laYPLfLUblyZ455CgpHYNxSZiDPmdtX81Z87Q9HU2yRCJi5mnXbag7Oh7mfCcgwq/yrIyDnF8RXiqae/Lt/RTjO/D78B47nljNb8M8XFoSEiV0kK6LTYBcTJyGST5flsaTrTvl3Xekr5RYeOmKGcgBPwcuVN5vMxwofLy286TE5EfEqVlpbJ8J2Q+3YvgfsHQsoK9r1rk7oEb1w+09gG9GkYQ2qLQagLcm24YKr1BNmU/bcPVrMuV0J5x2+vHRi39mrFBO8SJd8Q+m1Quk5DNAdFfbgAfKSmz2FPoWtDCcr4ksWqEQy5BKrYP+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB2231.namprd18.prod.outlook.com (52.132.143.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 15:00:54 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 15:00:54 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v1 2/5] xen: sched: null: don't assign down
 vcpus to pcpus
Thread-Index: AQHVOydXzSui4XMVAEeMf8BdnFoTaabNtPYAgAE6CACAABQTgP/+VSUA
Date: Tue, 16 Jul 2019 15:00:54 +0000
Message-ID: <9cc36cdbdee25e978303c7b1e77025fb7f97fbde.camel@suse.com>
References: <153515586506.7407.8908626058440527641.stgit@Palanthas.fritz.box>
 <153515650541.7407.13469781440827661968.stgit@Palanthas.fritz.box>
 <54fc671f-0527-e29b-e9ec-634e42c8594d@citrix.com>
 <c3661d2275abe2f34066ec334b2154d6a0339840.camel@suse.com>
 <10573373-94FE-47CE-A7E8-208EBFE8BC29@citrix.com>
In-Reply-To: <10573373-94FE-47CE-A7E8-208EBFE8BC29@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95ebf288-7592-4eb6-625d-08d709fe668e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB2231; 
x-ms-traffictypediagnostic: DM5PR18MB2231:
x-microsoft-antispam-prvs: <DM5PR18MB2231C8BC3452BFF659181DBEC5CE0@DM5PR18MB2231.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(189003)(199004)(5660300002)(53936002)(25786009)(305945005)(6512007)(2501003)(6306002)(8676002)(2906002)(5640700003)(6436002)(71200400001)(71190400001)(81156014)(316002)(8936002)(36756003)(7736002)(118296001)(54906003)(14454004)(2351001)(53376002)(53366004)(4326008)(6246003)(186003)(102836004)(86362001)(6916009)(99936001)(99286004)(76116006)(6506007)(76176011)(91956017)(66616009)(53546011)(66066001)(26005)(446003)(2616005)(66556008)(14444005)(11346002)(81166006)(476003)(64756008)(229853002)(6116002)(66476007)(486006)(3846002)(478600001)(966005)(66446008)(68736007)(66946007)(256004)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2231;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /0gin4YYTJ9epmi2bWguS72IhJYyJdW9dO/zvaNSUj1nXPc8VEgv/L9c6gvU8otr/4HvYC1Q2yKnSzcnmkTb8pB/TPKOGX0EpUIsUF3/6SEegOH+0PM9jI10s1NIVeu1Jxx89nhBDwceTpHYmqTyyo9kaAsD+o9QqFXURH/7TLL4o3Qo8e1iMzvPekeELFtzEGpYdCBtmoVS5/qusHDBTO0clpZUufy35zyyM2ZpHWN+VvC5NBz/pPR0WRL9koa4sKH1xZwkGvOxS6QUTAFXTu0sKf+4RjMMTi5SywkDysMPKmeVtAhw8yhd3q+d1XopOpAF2/DE1d+0k0vI/c+l49yeqEDXU9Hv74YyWHkm7d+J9kUKAeVbtG0GoB6rBHOSoSBOdVgFkon4sxig1wpZhFTmD1SPBThFK2UHuAFYW6A=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ebf288-7592-4eb6-625d-08d709fe668e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 15:00:54.1283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2231
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v1 2/5] xen: sched: null: don't assign down
 vcpus to pcpus
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============1841020700517980085=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1841020700517980085==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-vFs/0CZtsKT+s+k4QkBp"

--=-vFs/0CZtsKT+s+k4QkBp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-16 at 12:02 +0000, George Dunlap wrote:
> > On Jul 16, 2019, at 11:50 AM, Dario Faggioli <faggioli@suse.com>
> > On Mon, 2019-07-15 at 17:06 +0100, George Dunlap wrote:
> > > On 8/25/18 1:21 AM, Dario Faggioli wrote:
> > > >=20
> > > The other thing is, from a "developmental purity" point of view,
> > > I
> > > think
> > > this series technically has a regression in the middle: cpu
> > > offline /
> > > online stops working between patch 2 and patch 4.  But I'm
> > > inclined
> > > in
> > > this case not to worry too much. :-)
> > >=20
> > Well, the point is that offlining/onlining does not work before
> > this
> > series. System does not crash, but behavior is wrong, as offline
> > vCPUs
> > stay assigned to pCPUs (keeping them idle) while online vCPUs are
> > "trapped" in the wait list, which is wrong.
> >=20
> > So that's why I don't think there's much value in being consistent
> > with
> > such behavior throughout the series... which I guess is why you
> > said
> > you "won't worry too much in this case=E2=80=9D ?
>=20
> It=E2=80=99s definitely sub-optimal from a system point of view; but from=
 a
> guest point of view, it does (or should) function.  Before this
> series, if a guest offline and then online vcpus, they should come
> back.
>
Well, yes, I guess they should. IAC, one of the main backing usecases
for these fixes is when null is used as the scheduler of the Xen PV-
SHIM. In that case, if I remember correctly, the L1 and L2 vCPUs are
created offline, and then onlined dynamically. And they don't come up.
:-)

Anyway...

> In the middle of this series, once a vcpu is offlined, it can=E2=80=99t b=
e
> brought back up.  (That is, if I=E2=80=99m reading it right.)
>
...Yes, at that stage, things are working even less. But more
important...

> But I=E2=80=99m not expecting people to be doing bisections of that
> particular functionality in this particular scheduler very much.  I
> think the =E2=80=9Cbenefit=E2=80=9D of avoiding a complicated re-write is=
 well worth
> the =E2=80=9Ccost=E2=80=9D of having that particular bisection fail, on t=
he off
> chance that anyone tries it.
>=20
...As we fully agree on this, let's move on

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-vFs/0CZtsKT+s+k4QkBp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0t5qQACgkQFkJ4iaW4
c+7xYxAAr/qasXzQfBh+ojowLelHYRHZtC+imF/sLr67eFRPcojFyVOhJ57+dGFL
V3VhFEUEn5qax8uszW6T22qWp0jpjac2YdskRwKQfb6n6ZaGMiK5ckyGx9BQqOSU
soChYezBJMXHpUrlZNXFQyHjO+//FXRxCiwTg3XL7SWY/HOSE3+35OeqCsS1kq/k
nCmzWBZxANbj1VrDfwngmLHoi/MBJxNwJ+eSpQMqZ212N2ADNY94psUHoXRuHu2X
bUIuaqVZYHZglbYKNRuh0ab1G6Q87sQQXfW92LWhE5QiNVPz+bKliVRMizXevfFI
oL4h97fa375qYRDip0wlFTruqogEYHL61jV4Zn4Jc9eAWKmOTaT5kQMCbvT09y5S
LAbnVuH89DDhUQQjrryojuIxVlGMeDal70+fhJqxYcG0y+FfJXbEAaX6uPMtjc0o
URhJLin1ZhAGpMldn7E+jxRO6ZZ2bZp1fU7c4rULSq0J1PXYy4xGHuev6vif9QQe
MDF7qWRvAQIciOa1n1/H6CjZ108oKNsqOSL6Y8Lkj9EjnTW1kja4EYLjUW/QyvIq
n2Ed2aIMPOkyqCDo25dDREimN9q/xT2BQfsdrK19YrLj5KlqSRjmbFxnwUAqMyNb
GVUfFkI7P+p4lTXLaQwB4AME5q/luk/mskb1X3sItaBGRWQGrGs=
=1j97
-----END PGP SIGNATURE-----

--=-vFs/0CZtsKT+s+k4QkBp--


--===============1841020700517980085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1841020700517980085==--


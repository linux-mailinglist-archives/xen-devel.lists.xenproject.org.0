Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D7E79363
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 20:51:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsAgK-0002iE-8u; Mon, 29 Jul 2019 18:47:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+N/T=V2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hsAgI-0002i9-Ea
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 18:47:34 +0000
X-Inumbo-ID: 4be0e033-b231-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4be0e033-b231-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 18:47:33 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 18:47:23 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 18:46:10 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 18:46:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hboY9mmj9o/H3d1Kjy7gbisEOAAHAWiuRpzGhzDiwLEVl2Rbj3c9weYqtol3ywR+e70smLmdWAoy8O49kRxyCjgC+hdg2OHHrpRtiFJzB2vBFih7wNTViH3xghStpNliMT3N5Yos/doVWSnxYmYHohUpUG3Zrbyp1GL6xTu6nNEvcoylxObqOGrwxWBwbLZf5VO/CfewpMUPlr/J3ZtA2aHWE9tvR7dnGub9w8RKqBB1NDlJj6JbY8hqQNSRpw2TayP5noyE2tYh3vjFLmta6Nbc5UJdjbsnhL6zO856gvmQSmPT0k7+mCJBdC2kYa1ngbGwpGaINzgnKVMuUWrAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnYhwJGjRdblARjXgQg0zTOfcEkedHDlcSuzKC/fe5k=;
 b=hcfaH+zr96HuDxV041iCILIJX8fvnlO27rHKwHalXX4PMLI+vXtWTTMKqOQpoWRyCMD3HDFuoGm5w3PA2bCWVW0qrgNlqaY26pUkZobMyr7NxInsukreh0Nf5oDNScaIsEpZC5nCOCAHx9RUBFQTdJvUeul6Wfi16SLFtkMZgtL4Wd5PEOGiAxff62LpGn0fQDO4R5XDHGqbjrjU869NuSbxplEJfaROK7sncGcJyOLiBDGQDR/kCC4PEdIuLVH3uWpaHiCNGm2aWHalUdwHG+tHqT1xYWTWNum6IV387QVXAu2fVBFAj/lgpCOhr8l+KzAg/csaE0c89DsMSlVdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB2295.namprd18.prod.outlook.com (52.132.208.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 18:46:07 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::8060:5740:b813:5324]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::8060:5740:b813:5324%4]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 18:46:07 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>, Juergen Gross
 <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [RFC 0/6] XEN scheduling hardening
Thread-Index: AQHVQ6vC3g8obmh8ekWZSTh5IAudE6bhsdtQgABCjIA=
Date: Mon, 29 Jul 2019 18:46:06 +0000
Message-ID: <522ba57b26c27875c34a153e101b3958ec8dd451.camel@suse.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <79b01757ee19b57ac43649a4d94e378891152887.camel@suse.com>
 <25dfa166-c7a4-c2dd-0c1d-58faf5ffc296@suse.com>
 <30bb656e-fe48-e92e-403c-efc8fb7e8cb7@gmail.com>
In-Reply-To: <30bb656e-fe48-e92e-403c-efc8fb7e8cb7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a10d5f4-059d-4655-98eb-08d714550434
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB2295; 
x-ms-traffictypediagnostic: DM5PR18MB2295:
x-microsoft-antispam-prvs: <DM5PR18MB22952C1A068C7C05AEAC86C2C5DD0@DM5PR18MB2295.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(189003)(199004)(66446008)(66066001)(68736007)(7736002)(99936001)(36756003)(118296001)(186003)(26005)(53936002)(99286004)(86362001)(6506007)(76176011)(8676002)(81166006)(81156014)(305945005)(8936002)(53546011)(102836004)(476003)(66946007)(53366004)(91956017)(2616005)(53376002)(14454004)(71190400001)(446003)(11346002)(76116006)(486006)(256004)(66556008)(4326008)(5660300002)(71200400001)(110136005)(6246003)(498600001)(6486002)(2906002)(6512007)(2501003)(6436002)(6116002)(3846002)(6306002)(54906003)(966005)(25786009)(64756008)(229853002)(66616009)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2295;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aUIjUVaR+yzfooJ6tlh5Z/to68YiGVkgARMQY80TNrLKaiUxS5linEhxgUb6SZnrTYRlCzVMX1V+hETNU67bsrWUjfT2FDn1sljFoa0aShG6A+KkcyJ800jXvCcsxW1clmxqTkEAvjUNlJIUagyXgLMct02tj4K58g56ZyG3DZ6uzfkwOzzLKYkTNCkSSBpjkOe84TSsKDIgtQDPAKkZyxj8EIkAFJ6e4qYwajeAaH7QFE5vfLDOUqF2x4JIHgbILn+hjCINwZgucvS6cy/ZizIBggj06qZKgCp8X53V5lehhnImvJSFcCTrvkS6VYOGmYKc87WtPxE9eyptMYaOWi7jYpZNrAz2Y2z1SwmFWK190W4iLmzGwkZPHy8G4erSFllGlHL5ukJ775R7FbtZav4e76BksRyUtsur8vwAoHM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a10d5f4-059d-4655-98eb-08d714550434
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 18:46:06.8783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2295
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC 0/6] XEN scheduling hardening
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
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============0525330695171406530=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0525330695171406530==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-mKJqG8u3hE9IDh0DoOOB"

--=-mKJqG8u3hE9IDh0DoOOB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-07-29 at 17:47 +0300, Andrii Anisov wrote:
> On 26.07.19 15:14, Juergen Gross wrote:
> > > >=20
> > Tasklets are sometimes used to perform async actions which can't be
> > done
> > in guest vcpu context.
> > [...]
> > Like switching a domain to shadow mode for L1TF
> > mitigation,
>=20
> Sorry I'm not really aware what L1TF mitigation is.
> But
>=20
> > or marshalling all cpus for stop_machine().
>=20
> I think I faced some time ago. When fixed a noticeable lag in video
> playback at the moment of the other domain reboot.
>=20
No, stop_machine() is not about a VM being shutdown/killed/stopped.
It's, let's say, about all the (physical) CPU in the host having to do
something, in a coordinated way.

Check the comment in xen/include/xen/stop_machine.h

> > You don't want
> > to be able to block tasklets, you want them to run as soon as
> > possible.
>=20
> Should it really be done in the way of breaking scheduling? What if
> the system has RT requirements?
>=20
It's possible, I guess, that we can implement some of the things that
are done in tasklets (either stop_machine() or something else)
differently, and in a way that is less disruptive for scheduling and
determinism.

But, if it is, it's not going to be as easy as <<let's run tasklet at
domain priority, and be done with it>>, I'm afraid. :-(

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-mKJqG8u3hE9IDh0DoOOB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0/PuwACgkQFkJ4iaW4
c+7Pxw//ati448hsuXPkBg0ZXY25z97+RqY+HdhqQKKIUE0WnEs/e9nN7fcgu3tW
KUfNGoXdWS4PSokVT1nh40ByBVRXIuIXCIVMhzLsjWkHTg4c9beKpA7mzHvWrkAO
Nk4JRFA3MibgJhxSu3rmyUsszmxMoH/N3tkshuQ5lVEnhiB6/KF0jFx2ighqo6m9
vonc2eblIrpzRohZjs7dbooMUq9gn+rqUJLPlNtDMvlDosgvcAOhrSAtWes5BUMA
A3vo5tULR+alWGCSxp+M0QOOhf5w+C5s6JXVGaHqYkHZ36R6E3RKC7vK3keuJazY
99BU0cj8BfhiSUuN6fdtRYAWr+RyyO4fbfcqD/OKpAhr3Nx/glsg9suOCkNZmKsp
QRj7PfommRdhH2MiEQslfWhOxYo0q9vY+5c+KWSeNsAn1OFkBn3fplcbJ5FV4pnC
6kgSNfDHRZDmRmqHjpwKphSoiDg/iNCcGiSULt7FNhFafbZUN3FpGDlJb8RRAb/w
xS21AruKy/MrVlXAl+eWp+HmfdaaCYqfTSynqhC4HjontGy/EFH30wv/bA/zL+Na
JBQ1+Y/Vgb2RKYKcuXEyd9d9qTBT7o5ow1MJhuDhwH3wjK9pXP+8vR9K/klF3X4S
Cm0q+u0ncRkJqcwPpDpECsBinsuvWyysxrHd3Zw6KClX4KgqgxM=
=dMEd
-----END PGP SIGNATURE-----

--=-mKJqG8u3hE9IDh0DoOOB--


--===============0525330695171406530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0525330695171406530==--


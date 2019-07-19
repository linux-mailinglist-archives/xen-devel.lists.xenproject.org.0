Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FEE6E9C5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 19:05:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoWHF-0006HK-Ig; Fri, 19 Jul 2019 17:02:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7nr=VQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoWHE-0006HF-1C
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 17:02:36 +0000
X-Inumbo-ID: f7d802e2-aa46-11e9-872a-abbe421a6ff9
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7d802e2-aa46-11e9-872a-abbe421a6ff9;
 Fri, 19 Jul 2019 17:02:34 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 16:58:32 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 17:01:19 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 17:01:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBpLO9Vvk8AFfTN2vbEtJlSkky0xNlD3lU2IwKkFFWuZGS0wp5vNJ6vg49q8e3VSXbD/Yq9jPLWP1150eI8qxr5gNkfIBENxW847ajnxlYyeEY3r3d7IoU3Lj9RuZ5km0vENGtqWmrbo+188NYdFAu6KnLgB3MRqOi5pOh7hw1h3xc0Q4OTzT32Ne8ALlL3CEMgMXJh8o4gLJbgMMdfAqP4NVCSvNe9/yhUj3v94FaPGLl6gHx8sDdcr2nJ5JOl2eHbg/tmhMeUn40GoglmA+e6M0mUtmxtqj7lbHDRQTcjZCAWYg2vzvVWmkz4vt856XdmO0YFbt4uhUx2VZIUgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSY2DhGOz71cylUN9XG+60+Szv0dcNh+E1KtV5FpPpw=;
 b=MtZvZv9Riw/OPxyDYkHTvGSsgg2shVd0o21e5Ls5xg3YdNzY90vh4ZcDomjPz/HnZwBdeUpuNWo4vuBs7+t4l0K1NlKgIHF75xszswMeV6abrzAsJmN5+CICwKSJ3arHAifEJLG1YjP8IdAuPnNkaRkLQaxiV93yXL2sxpD5rYjVp1ChEYnTV+c4OAjj/pqVPvFW0sWaLPXDGcs9iEIYkJGXmgF4AwnAevuHGMLzjiyM8z2WqMTauFFrFBYCJFa3yq1YuQ4N30yJ7Ec1LWonVtDblG3fa6JtHIwIo97ywbMojRRkkQvt0YSV2FcdXCze2EUXuz5Z0JQbzpgAuZclcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB2311.namprd18.prod.outlook.com (52.132.208.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Fri, 19 Jul 2019 17:01:18 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 17:01:18 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 04/60] xen/sched: use new sched_unit instead
 of vcpu in scheduler interfaces
Thread-Index: AQHVPZBlL1Q1XUpsfEu/nRk5BkyHJ6bRX6PkgADMYoA=
Date: Fri, 19 Jul 2019 17:01:18 +0000
Message-ID: <468f6234beed71c6add16f315fbf0ecfccd64eaa.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-5-jgross@suse.com>
 <545dedb5b964e21f4bbedd72c68ec3700acc3dde.camel@suse.com>
 <97a82335-874a-a55c-df89-01d36209fda6@suse.com>
In-Reply-To: <97a82335-874a-a55c-df89-01d36209fda6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5485417d-f016-4b0f-68f0-08d70c6ab7ab
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB2311; 
x-ms-traffictypediagnostic: DM5PR18MB2311:
x-microsoft-antispam-prvs: <DM5PR18MB23118C381F2DE5B42422AC92C5CB0@DM5PR18MB2311.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(189003)(199004)(446003)(53546011)(66446008)(6506007)(2906002)(81156014)(102836004)(66476007)(86362001)(25786009)(8936002)(76176011)(11346002)(6246003)(68736007)(4326008)(66066001)(81166006)(476003)(2616005)(478600001)(76116006)(486006)(66616009)(71200400001)(64756008)(14454004)(71190400001)(229853002)(36756003)(305945005)(7736002)(6512007)(256004)(6486002)(99936001)(53936002)(6306002)(6436002)(7416002)(91956017)(5660300002)(53366004)(316002)(53376002)(66556008)(66946007)(54906003)(8676002)(110136005)(118296001)(186003)(26005)(99286004)(2501003)(3846002)(966005)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2311;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vd8fJAj4Kogf/k/DkLHLNvT3llAWrmc9pL9QI4pJB9gptwKjLLAh1r4cZdz7OaWK5qoGHe4uWZoIajNNVtEDLmNM5EM+kuJPsAkJoS1VbaY+tvFIReGUfrD6pIk790ZX788ToE1Q+wTtLNPYH6udlsr0pLCwFSDRYO3Bvm1J5Un3O77nX1Bchn9GS1PVXoiDd3xlFrO+dgERV45mVDYe+p3ij3u1G60691dxEnYqtrZq8hNYF5OJJfMhSCTpBGnziBQHUsEFYijTCnqLMcSjEYzFsr/d3vFAmuf4aohbPJDtSlXoYy76k2RQ4il9e+8zYVymhVu0zh9PeIdVVogVlJ6cZiXdxuoAqZLyUHWhqABvjrZ/r+NaN1/AFpOmbr6e6liG+BaRHov8YnhrFGLdxNBTzF/HifODpg9ApgcmuxE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5485417d-f016-4b0f-68f0-08d70c6ab7ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 17:01:18.2254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2311
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 04/60] xen/sched: use new sched_unit instead
 of vcpu in scheduler interfaces
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============7001486866925290643=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7001486866925290643==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-iWtQNFYE0nMPNYavdDrl"

--=-iWtQNFYE0nMPNYavdDrl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-19 at 06:49 +0200, Juergen Gross wrote:
> On 18.07.19 19:44, Dario Faggioli wrote:
> > On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> > One thing that came to mind, is that the various function
> > parameters
> > and local variables called 'unit', could be called 'su'.
> >=20
> > It's a contraction of 'sched_unit', like, e.g., 'v' or 'vc' were
> > contractions of 'vcpu', it's still quite descriptive, it's short,
> > which
> > is always good, IMO, and might mean less line wrap reformatting
> > (considering that it's replacing 'v' or 'vc').
> >=20
> > Of course, this will likely mean changing all the other ~60
> > patches, so
> > I'll understand if you say that it would be too much.
>=20
> I prefer "unit", as it is more readable and the effort to do the
> change
> would be quite large (replacing "item" by "unit" was doable via sed,
> while this change would require more manual intervention).
>=20
I guess what'd be more readable it's to some big extent a matter of
personal taste. However, I trust you about the amount of work needed
for doing such a rework, so I won't insist on it.

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

And this stands even with this:

> > > index 2201faca6b..72a17758a1 100644
> > > --- a/xen/include/xen/sched.h
> > > +++ b/xen/include/xen/sched.h
> > > @@ -275,6 +275,10 @@ struct vcpu
> > >       struct arch_vcpu arch;
> > >   };
> > >  =20
> > > +struct sched_unit {
> > > +    struct vcpu           *vcpu;
> > > +};
> > > +
> > >=20
> > Is my understanding correct that this field is going to be renamed
> > vcpu_list, right from this patch?
>=20
> Yes.
>=20
Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-iWtQNFYE0nMPNYavdDrl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0x91wACgkQFkJ4iaW4
c+6/OA//WzM3aVVb7O3HopbFMRb3FdV3iEQ6U8IcVxCKLxYASCVRiNtk3PDB9/7y
FyYgCk8BNQ2tKw7lC8UCNbiceoJoDnj/+264JcpiNQlYf7RQIZmITGIOTTLkkmVs
f4eo/9o+yS/ssFPGlfCBXItL2jcN95yM/bOqkIFmP8lTWsEp5m3zrEnuM7x+Wi9s
6i0Z8rW52ULf0pDk2BXtxFdU7dGkC+2ey6omntMxPUS0dUoiuqpSvEFC0/pFbf2h
Favsyo7qpQCuzrTx/epMJR4eeKT8tq306+5//l37XPYZLA8nTAcCSuQPtyzlPZ1X
kDNU+s0DDxszniR05+ij0uvzz7+frKOdj5heP6Us2WK3N+/MSeMWGwJGixnnBle1
de3onKlY2HGvNnmn6dEuDM3XQn0J2/fNnsYWTFqKs9K7fcs/n7DpnXRyQviHdfkJ
AVYhFtaEP94vpnpXEu5tchLx8J9EeVbb5Jvx8utxV5BF+V6zAGshy9pmZsHNRoMW
GRN4fnF0Zf7mTq4pe7C4P08eiJ9/UtXAwauQW1TnAAumSVDJVb8blrb5j+4n7o9b
hKLwG3puh3m/GEwMVXeMpBagQNOltEfIwhHn71inTc2HbLWx94xudOka51uYq6tG
JMzuBMKo9eOK4jR+S673fKfWu16HCY09kyZ/dVD7kWLJ60gtbi4=
=VmUl
-----END PGP SIGNATURE-----

--=-iWtQNFYE0nMPNYavdDrl--


--===============7001486866925290643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7001486866925290643==--


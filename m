Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABE4CDDD2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 10:57:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHOmB-0005m1-Li; Mon, 07 Oct 2019 08:53:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ttm0=YA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iHOmA-0005lw-9G
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 08:53:54 +0000
X-Inumbo-ID: fabff8ca-e8df-11e9-97a8-12813bfff9fa
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fabff8ca-e8df-11e9-97a8-12813bfff9fa;
 Mon, 07 Oct 2019 08:53:51 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  7 Oct 2019 08:53:11 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 7 Oct 2019 08:49:59 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 7 Oct 2019 08:49:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pvar4cK9XpmEKB4kkLZIzoTf1dCgdpIEYDXgqTDRcVSbpLhO2NL/WVVTf5zsFwyjn/ZETnXWZcJQNnA0qS8hLacpWmfCvkYBbWfOrE/THcdkEUGBTaog/6atwMJglAJxZcpNJHHkf/Rbvo/tTx553OOJ+sbOpLyI47eK+AHQeW4ZqCcIG5Q2Crlkz0eTsP/p+/YAqPufQtz+Y4pDqOnaLjRufJIkzu6jTXbiIxOErbwzJ1SLBWRver9ANbA+1EghWYFeE0Jz3a3nygEgueET/7gWSztQc2XAKDwT8ALL7H5i04yeEEamkS/+/6hYmhZv6rYOm9Effn+Mj0yKe3Y60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n069xuCnovRqDeClibPegWsTrNi5P1Yq6LDLXHoqjgE=;
 b=VtPbtTXfDzvBQZtmYpPxSaQT52wj4eIy/o7ug1JZZdjxKFgghj4cUmK23NgnGaRlpvlqpGqEutKQoxSjfIs9Eqi9m+FwZpG2wnQZoIksiY/CZ2MadUKgdXD5/hU8inQzdakVpt2hp8FG839qlkWU5oa4E8+Pp0ekkxZYdBxWYPlMBf1aozSPTC5Uvqy5wzjRcjF75BiZ3BPOt8N3twYZT+JD9HNy6d8yS2oNL9cEYs96n6Em/N3dKebV8uXq6IBjaUc/WXbkogiJRue14rSE6gulGNkipbtNeCZ9hY4VdpoS4NFXAhKGoGfy168WoIUCLWZ9y/NhEo+wCJEI931PrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2375.namprd18.prod.outlook.com (20.179.90.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Mon, 7 Oct 2019 08:49:58 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d%3]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 08:49:58 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "george.dunlap@citrix.com"
 <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] xen/sched: fix locking in
 sched_tick_[suspend|resume]()
Thread-Index: AQHVen6W0VHyDZcf7kSoSuWd1KEok6dKhbKZgAAEQ4CAAAK+fYAAAoyAgAADme2AAAHrgIAACeTIgAAAfQCAAAgKE4ADRRIAgAD3JQA=
Date: Mon, 7 Oct 2019 08:49:58 +0000
Message-ID: <65274b96640ba542367dade37b7be03191432953.camel@suse.com>
References: <20191004064010.25646-1-jgross@suse.com>
 <a2e23594-04ae-a87d-5512-f8775a21552b@citrix.com>
 <e8364443-4f7f-62b7-f00d-4687ae07628b@suse.com>
 <2965839e-6be2-720f-ad1a-8e725f0bffaa@citrix.com>
 <36630890-ec4b-1404-7fbe-f8d924613c8e@suse.com>
 <25238153-6769-19d7-fa17-4fc9cf8652a1@citrix.com>
 <e41bfe1e-6b63-2508-f941-fc5ef22a7671@suse.com>
 <7a90d9d6-9af2-47ed-eaed-480dfb2e72f6@citrix.com>
 <17e45c30-9d62-94f0-c77e-26e2532b3f69@suse.com>
 <cb8ae861-7898-cf0d-a3c1-cadcf35251f0@citrix.com>
 <bcc3e784-45fb-03f2-9270-e89cda98b711@suse.com>
In-Reply-To: <bcc3e784-45fb-03f2-9270-e89cda98b711@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8752f267-24fe-477e-3502-08d74b03555b
x-ms-traffictypediagnostic: BYAPR18MB2375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB2375BD31CE837E97B2BB6E72C59B0@BYAPR18MB2375.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(189003)(199004)(25786009)(2501003)(102836004)(76176011)(26005)(53546011)(71190400001)(81156014)(2906002)(966005)(305945005)(81166006)(66574012)(2201001)(71200400001)(186003)(7736002)(99286004)(86362001)(6506007)(36756003)(66446008)(11346002)(8936002)(14454004)(229853002)(316002)(91956017)(66476007)(76116006)(66616009)(446003)(66946007)(66556008)(3846002)(8676002)(2616005)(99936001)(110136005)(486006)(476003)(4326008)(256004)(6246003)(14444005)(6116002)(478600001)(6512007)(6486002)(6436002)(118296001)(6306002)(2420400007)(15650500001)(64756008)(66066001)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2375;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wotupkB7b59j0SxBFZt9YdkNf+bYp/+VzQC5SCoMrJWV8S2kdUTRbSylz//WG4AY+m9xfK1AdSgKToHen6XXBE2yU23djxlXjxoqjK/WLvAzH8ORcqvZ95Pslib982GiMoPw+disZguDJ+pJbq9M8lYP2dv68cdiJpzYQtf0Q5E6p2GF9yy2QpagziAfnuOkTE83LpMeTAnHFaM8HWVQNvtUG8ki8IvGMPSP29Y8/FFAeYYOmswGPVE7dE8m9TImBI5c3l5noXDa5QQJCMFxnh/ENz2uzpHb53pB8KKbgpPqt0+fVN9Ft4RoCsIRnWWi1ilVohlyeJw+uzWwWGCOt9e0fZSv9nDiYnIvbUnuvkJPpqt0E0ugDiV+6IICXWXmQ+eyWa7uzFRn9yXQ0D/CCm+05VSZdN5ruGnxk1s6faQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8752f267-24fe-477e-3502-08d74b03555b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 08:49:58.3201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4QM6WF662Di8VI2ZEQSir31ZTTY1lh9TfMc9HcluMkaJFkSjmR4B82bjWlSkKEJi0NkH7YjShBngmZuHP+atUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2375
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix locking in
 sched_tick_[suspend|resume]()
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============1814276056240030020=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1814276056240030020==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-muI6yzbMZQO7K/Y+25TN"

--=-muI6yzbMZQO7K/Y+25TN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2019-10-06 at 20:05 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 04.10.19 18:09, George Dunlap wrote:
> >=20
> > I can think of a couple of options:
> >=20
> > 1. Have schedule.c call s->tick_* when switching to / from idle
> >=20
> > 2. Get rid of s->tick_*, and have sched_credit.c suspend / resume
> > ticks
> > when switching to / from idle in csched_schedule()
> >=20
> > 3. Have schedule.c suspend / resume ticks, and have an interface
> > that
> > allows schedulers to enable / disable them.
> >=20
> > 4. Rework sched_credit to be tickless.
>=20
> I'm going with 2., as it will have multiple advantages:
>=20
Good choice! For these reasons:

> - not very intrusive
> - keeps credit specifics in credit
>
And also because, if you'd go for 4, I'm sure that reviewing something
like that would would cause me nightmares! :-O

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-muI6yzbMZQO7K/Y+25TN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2a/DQACgkQFkJ4iaW4
c+7rPA/+LtMiXlq7akocrL6m14ZrFa4pLnhOnMVFF8OfU7i/3PeufxRmZXo7OUue
EChr+OKXTr6FhNAs9jzBQsEQIcX2u/5cMPKQjZ6duDj7MVJ8TzqiRxyaKowWelPS
15YIHAEk9RLWKrcCCu8lbNU0lwMQQAeOyz+rswUpR2HtNJBkQB8WLzRi0AnBer0f
uBLpZ/KQYr4x5o3/+QwefRQmXWuCRO5jT8ip6Yq4dzu/G9/L19NiNUtoxcTErnSx
c9mlfKLtn0ShAzdo/DXXhyVZaymTZY5Ee5YaY0s7LCC4tAWy02dIcl3ffQ/0F9Dc
OrgItoBQvi5QWyEpOE3R4Xa4cddniIcDpMoFo+Qu7xC0vHpl4LbP10a7b4pt6S8q
o30a5Jk9b9MM4yzKykA0QDpjNwbNC3tkr0Q5Y9aBGL+XafO8jjVv3Vt2L/+x5k7/
TMQ9sehkUmWD6qOcIFjOxWjEppMeDYVc/iboX3M1xmghkZT7I/j2/+dPSHsK/Zm2
VMLfL1fwKGgi7YPsU320aMlaE6XBIWMHJ8R1WQ1K0vZmxrVfwGkBbg7+DNHi+MlK
iPhmuhpCrVN8mM1r2Y8mI7FeNmb8i66Cin2eq1XJRzxOB8su30jadRe6gHelPpJ7
lsBFbnx1z4PGE9nmrwL4yOUKnL+Gi5NJlcXTbdMOgHmtCFl3UWA=
=tzNr
-----END PGP SIGNATURE-----

--=-muI6yzbMZQO7K/Y+25TN--


--===============1814276056240030020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1814276056240030020==--


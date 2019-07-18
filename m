Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A366D6FE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 00:57:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoFHc-00041F-L0; Thu, 18 Jul 2019 22:53:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHH2=VP=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoFHb-00041A-IS
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 22:53:51 +0000
X-Inumbo-ID: da6250e3-a9ae-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id da6250e3-a9ae-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 22:53:50 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 22:53:32 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 22:52:53 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 22:52:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPry3yKx1nlT7tEKT88qDoahe3vVGYNIwfdbx22U999XBWR2mmpSkCYkwrqgrLiVf5rkOIukS3+IX+fzOp5V+R27P2LfUZVv4tQpTxICa066TlOKiIAfEw44Hgb6OQ0lcBbFkEpwyZkf3KGoTXiCA6pPEWRFeCtTj7Awuin4XoNZG2W8Nqx0WfJ8EMvt0XoCGFwj6J69qmL/g1IykrCgxM0mzmG1EZe/POffaw3W5t1mqM6I31v+CowrwvZF0vj5YPRdg09ZB8dj+4h8uqI7oDZwRz3yhCyaxuD3iJuuCSzcZFlOUF8HPF6+bzVeMMHUTbaIUijs0HHB5gb+HjGl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu0yomhnfEwDG8ztDwPIs9ioQ3AEfQWd5umYLB/BSLs=;
 b=iiLcI1KiG2k9cggcLUoIcW9Oak8sr2UelGb8XNL6CulhQYPFhUuNceWP6dZko7StdIpE76VIorjkgF5nas0+vlF8jCtcnffaKVtHVhVsLf5O0vLOcpwZzeN7uJPQiOtmphL8fUvnEREvCgBgZW9EX9NGGYJGCW/BSoPIhid8PmQz4wDGO7OIljyMCi4FtB+YLbv2O1LapcVtauNZmt4V4lxYDKh3bY0FfMFntbLd8opl+As+Tzvy+n1Y3mxbnX/xG2vGhQUiUZrdX7eMfxY/Qdlv6jG5D9nhNYlKWmogEZkPZN/wq1Ucbf87OJshrFp2JdZ3sGGsG4oNKvdyMxxUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1577.namprd18.prod.outlook.com (10.175.224.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 22:52:51 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 22:52:51 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 06/60] xen/sched: move per-vcpu scheduler
 private data pointer to sched_unit
Thread-Index: AQHVPbuGcK2cLHKhs06MDcLPQ3t5rw==
Date: Thu, 18 Jul 2019 22:52:51 +0000
Message-ID: <577676c68cd9ab1019f7bcfe9c746641d838b6dc.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-7-jgross@suse.com>
In-Reply-To: <20190528103313.1343-7-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68ea23dc-062f-4508-bc09-08d70bd2a9a5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1577; 
x-ms-traffictypediagnostic: DM5PR18MB1577:
x-microsoft-antispam-prvs: <DM5PR18MB15779569D99CE27C8D15D52BC5C80@DM5PR18MB1577.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(189003)(199004)(54534003)(99936001)(6306002)(7416002)(966005)(2501003)(6512007)(76116006)(66476007)(66446008)(66556008)(25786009)(478600001)(53936002)(91956017)(66616009)(54906003)(2906002)(64756008)(6436002)(5660300002)(8936002)(6486002)(14454004)(229853002)(66946007)(71190400001)(71200400001)(486006)(186003)(66066001)(4326008)(6246003)(53376002)(53366004)(6116002)(446003)(3846002)(14444005)(11346002)(476003)(8676002)(256004)(2616005)(86362001)(68736007)(81166006)(81156014)(6506007)(118296001)(99286004)(316002)(7736002)(305945005)(102836004)(36756003)(76176011)(110136005)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1577;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: USpb9NbL9W52PEwfy92WwyZETWg75223hFCf31TX0UV/r/T5R3qbfLdgnZE4g8EGkJZsqYyL8W36b1WwDQTe1K4OM1y8amptpD/DBXE9hS/iEGO69g8TYYbdmZ2WUWJvSkmKX5jX9saMx0PlNorsTzhVyVDG2Qn7tVJEGZ/Y6At9n05/5zC/AGTZM+ftUtQfWLZy+f5YiPOFY+i+mVOVKfhe64NG5av4Ws5vWWli3rOVg2jPErOLrTt1fCYrK16nfF1yFDe0WVt9rsvsmZvjBZEJlp7dfboi+RW5w+5yvHpAwcAJae9lb08GPFTbj2D3Cx5/XIIks2KkTA5vg6qi9xQmAjQ+ra+Yh0R/nv3wi2XX2vhx8XQiejvfiYeagAQ/lT6rQPSErS2j9lW186F2b3QzPc9OtzJiYcHoagpgKnA=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ea23dc-062f-4508-bc09-08d70bd2a9a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 22:52:51.0571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1577
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 06/60] xen/sched: move per-vcpu scheduler
 private data pointer to sched_unit
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
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============1979782010553827139=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1979782010553827139==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-4v7QvYIAk12AJFb8qsW0"

--=-4v7QvYIAk12AJFb8qsW0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> This prepares making the different schedulers vcpu agnostic.
>=20
Ok, but the scheduler private data is, actually, for all the
schedulers, per-vcpu scheduler data such as, for instance,
struct csched2_vcpu.

After this patch we have (sticking to Credit2 as an example)
csched2_vcpu allocated by a function called csched2_alloc_vdata() but
stored on a per-sched_unit basis.

Similarly, we have an accessor method called csched2_vcpu() which
returns the struct csched2_vcpu which was stored in the per-unit
private space.

But shouldn't then the struct be called csched2_unit, and cited
functions be called csched2_alloc_udata() and csched2_unit()?
Now, I know that these transformation happen later in the series.
And, this time, I'm not asking to consolidate the patches.

However:
- can the changelog of this patch be a little more explicit, not only=20
  informing that this is a preparatory patch, but also explaining=20
  briefly the temporary inconcistency
- could the patches that deal with this be grouped together, so that=20
  they are close to each other in the series (e.g., this patch, the=20
  renaming hunks of patch 10 and patches that are currently 20 to 24)?
  Or are there dependencies that I am not considering?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-4v7QvYIAk12AJFb8qsW0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0w+EEACgkQFkJ4iaW4
c+5CrQ/9FFJaqkJvOyYZHdHthFceeLB1BwTc8do5cE1SJncGJmcurwGxroy4axzp
618WBR9y8oajl2CSLVTvhILcj18ehxAhxkOBZ/4iJPimqoo58U4FNIGkNOGpWjxC
6Og3LJrfaIVDJCPzMZCoUTjn/RawuIDaRE5B5Lf15cd+PvOrLTItGFdF0KVUqW0M
p1lFCtzYWnrO0yvzyf3hbc6L77BHygvfhE7rYNETlH1IrwAoX0WOExXaidfzA11h
yoyFHjZjfp5Nuh44q4RpyfHv+hlZUhlFP64A17pxwlyo606UKo0xOlI3BkzzF3rN
aIfTKRwYLiVd83KNvVw09Sjy1oxEUpxCHQJahZZsSiyHmYKuMfUeuwsC1r2LTLwW
q77mO7d7EYmAo6rBA6S1ra28WgkH4sWe4If1d02NXsnJdrlQ8toAwbc4UOXV5pD4
e0QGkDGi6plZNpawwDxz0Rt6UHQi6cGlXMcSVJt47qT+OOt8GGRjHY/nFajsanBp
HbiSULW74FhHTwUZdC6AHrfcEYwFytLjKXDG2IqWpWgskaSepOzNq6RS0mhmX8mS
SA3cCLuEA3WlqgGlrcKcUzNGa7Pzz5Fkj5/3wjLCyM6jSdJWrw6jhe67bAC0CLAA
0zTTlLPFhnrjSPypQKlMqUa4HNua6pxKxne9pcZeRUsfgxS+7e8=
=BA5T
-----END PGP SIGNATURE-----

--=-4v7QvYIAk12AJFb8qsW0--


--===============1979782010553827139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1979782010553827139==--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5898A6D369
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 20:02:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoAhd-0000LB-08; Thu, 18 Jul 2019 18:00:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHH2=VP=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoAhb-0000L5-FD
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 18:00:23 +0000
X-Inumbo-ID: e2519720-a985-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e2519720-a985-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 18:00:22 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 18:00:13 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 17:57:07 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 17:57:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbKhpYZfVTBcf21ms/74gwNPidLMGG9j3lq4s1Ammm+FnCdHkij1NYMK+LW63vSZRnVbEkWG4O9chYRiDJgJD5cVPw7Op9k6ExuF1AQSBK2IVioK5xUmnbs7FT42Rc4VgdisqIYnVo/Jh4POtn4SwGfWrtmkAq4gMl1kpF0jxlOiRqKXn9GPKv1rvV2vkdX/mrSD5Pn7kv1mJQryuhlRFlrIwUFd/NnalIcceOgpXTRgksNPxL75VE1PZZ0affWodQv8Gnzossi8DXn9/ESEPmbNl/jYYjxmiXFDE4R355TpAyNXDmN+aYYXVSeKddLlN/pvx5vdITwVdpaLx5GKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IapSg9/YNi8AC+rfjEDIE8+wBO4dEeWdlCHx/6nnUw=;
 b=cuuBnho3ygMcHMa/K5uueIeyWO7BKy4U3TqUiVAn7yxaqImECdYR2dUcrAMeZjwRvS3+90e8lQtadxLeIdTWmZHHP0Q9BrxAxK4Tpmu0WJ0LekjtovF/UBDyyZTRdEErNe84CA1olrVT47LpMmqIrm24/X1IDCETcwsN6EIhh/sjjURu15DUJO+B9hdsiKG7u1dxgJAFyAHeGvqURqftsXf52uY5Zu9b6EOe+OWgm0/sV4H4Da7VHyGFX3ZW7171CrGMhCnL8/DGpzblq4oHwW53K+gXvJ5EC/juXfrNlHXkbhmStvV6QXlxCDR7VTuBWi/ueQ0Z6sZRk/9pt72oGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1242.namprd18.prod.outlook.com (10.173.213.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 17:57:05 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 17:57:05 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 05/60] xen/sched: alloc struct sched_unit for
 each vcpu
Thread-Index: AQHVPZI1eSV5JYG3wEiY4OjiJWJE7g==
Date: Thu, 18 Jul 2019 17:57:05 +0000
Message-ID: <ac36f4026604dcdaf5fb6274e287bd4c2b54720e.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-6-jgross@suse.com>
In-Reply-To: <20190528103313.1343-6-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea480a4f-cf79-490c-9139-08d70ba95873
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1242; 
x-ms-traffictypediagnostic: DM5PR18MB1242:
x-microsoft-antispam-prvs: <DM5PR18MB1242F66D4A3685154B1A57A1C5C80@DM5PR18MB1242.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(189003)(199004)(76176011)(66066001)(7736002)(305945005)(14454004)(486006)(4326008)(64756008)(66476007)(66616009)(81166006)(11346002)(36756003)(66556008)(76116006)(66446008)(66946007)(5660300002)(2906002)(446003)(81156014)(2501003)(2616005)(476003)(86362001)(8936002)(102836004)(53376002)(54906003)(6486002)(91956017)(6246003)(53366004)(26005)(6116002)(186003)(53936002)(99936001)(110136005)(3846002)(6512007)(966005)(25786009)(8676002)(71200400001)(478600001)(316002)(118296001)(229853002)(256004)(71190400001)(14444005)(6306002)(99286004)(6436002)(6506007)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1242;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ak/N97wbd00R123U2270n8R0CA10MzZndMyCExl1mjuLJ0Tj1oUf2kj2lHvZXVeRB9qX6h7ro6fMEy4ofmmEJdhIw4fzlb03hebng3HB8qD5NSciICr/l+tid0lhNIDSkeAZNMYnMdayzs5OyRcAIhSwxDIT8QQy08ybOPURquf+D6SMxTsMcO3A8rhcmYqR09juVWnD8ehFB5MlslAoTREHX9Tw/oyO7BSiCEeSbyJWekCKxtDepWr0RzJQSIArmx6sYfCsnmgTI9W/70ZkYeZtAgsFHHkJvpC5RS6GNtYg2nWxT5tE91puaDB5ncep5svPBoepFOtwYnDAWxeswZaLB4vMJ5BgAcg+FPGrXEPnoNXO84dMpjdKkH8mL9UcVO2E7V6SzUleFizp74fWsS+AUhGlpYjGsvR8sfVA3Hk=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ea480a4f-cf79-490c-9139-08d70ba95873
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 17:57:05.4889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1242
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 05/60] xen/sched: alloc struct sched_unit
 for each vcpu
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
Content-Type: multipart/mixed; boundary="===============7693379023509361746=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7693379023509361746==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-zlMspWBUIfIh/J7qRlUO"

--=-zlMspWBUIfIh/J7qRlUO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> Allocate a struct sched_unit for each vcpu. This removes the need to
> have it locally on the stack in schedule.c.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
And this patch looks ok as well.

However, I don't see much value in not doing what's done here in patch
4 already (it's pretty much only line changed by patch 4 that are being
changed again here).

Is there a particular reason you think it's important to keep these two
patches separated?

Ah, my comment about 'unit' --> 'su' --in case you think it's feasible-
- applies to struct members as well, of course, e.g., here:

>@@ -160,6 +161,7 @@ struct vcpu
> =20
>      struct timer     poll_timer;    /* timeout for SCHEDOP_poll */
> =20
> +    struct sched_unit *sched_unit;
>      void            *sched_priv;    /* scheduler-specific data */
> =20
>      struct vcpu_runstate_info runstate;

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-zlMspWBUIfIh/J7qRlUO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0wsu8ACgkQFkJ4iaW4
c+5hNw//ZYoVSAdIMHSeEaoLUaBz4E6AwPEdhihigW/7YoHE9LTJgty0+5YyTQlU
Ie52iq+u+ZV920hbVwjOzOJK6yE82yvtdJHb38YUwMYnchCMey4oOkUaR+vfxwvy
C2/Iu1Q10oLejHhtcCN65pftM1QBLHcSewo/skA1nyLTxc502tM0FEobST5uimcK
JBDu7/x89GtBSWbfucR0x/Pgny9wWaVzKValMF5K/9jpn89H7coiULN/B5pvGrBa
kSyihERlcL9rgiCoX9JOWFB1bQ1QKEvp0bE2KknbK/f53Pt+ozTpzEALwmPboGhV
r9cJ9WFKakGXMN8W8NglOkheYYD+PVU+cLp5B9ZshuPFCeKpg9DUzfU8h7c08kwp
uquWbB12ky1JtNAR1V3Gp7mwGn0wXrX8LLbAiSCHQqRIKr+B+qE/9ak6npXwsJtO
xxc757ApjvgeGpej8LuT86/Yb26kaK4tynC7AGg38+c01boDLX742vRxY3op6Few
Aqxt9cxevfKYGZ+Bou0X0384SmDC0nzelsWvHE/WZ0e3RQD6dCDJ5l+E0fR1NIfn
hy5yUROGhQJwXRdEVrtpWNLkzsbg9RAow8etASll59YdInGsp0ipYTP8gOW1lBTo
VLvvdsUclGF6OHMAGAmIMbVqgfRhHnWJGYu2cYx/2lVYabXUQ2Y=
=6m5u
-----END PGP SIGNATURE-----

--=-zlMspWBUIfIh/J7qRlUO--


--===============7693379023509361746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7693379023509361746==--


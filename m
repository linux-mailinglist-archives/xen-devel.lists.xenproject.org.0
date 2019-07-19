Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FA36E838
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 17:50:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoV6G-0007TO-SS; Fri, 19 Jul 2019 15:47:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7nr=VQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoV6F-0007TF-B4
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 15:47:11 +0000
X-Inumbo-ID: 729b8841-aa3c-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 729b8841-aa3c-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 15:47:09 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 15:47:03 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 15:46:33 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 15:46:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caUmsNGBL45bGQOjlwPSZ2sUydCfIi/5M8sEXzZUQQKS4LQMA3cOVYDj4uku9IvUQCq+piT8oOzJNtVzs+s+S5kyt2valxvT/tAf1khrUDdGt9UP4uH6OmkplCRMQX5VtQtRcSpCoLHbQCpIXTHgPK/AM9gCDR/fGy8hqDZDgkFIcwLbbfJfieZ7lruV1jqYS77Xp/ANWEwYlotNj6LTIcCLRo3+h/Krd5S7ovdV06jw7SrP14TRXy+mVz6U1DPmczO1EjogXecWTy5CdckNqn4aPEKGdJGJ1dcDE+RHZc24efTowaENsqhH/Lc+iVGgIgFzs77HRmaeyQlzEoqkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlGA1wIWdYZJ5gNKf/bvuM6zdQ9UUo8CWGegBmVq9+s=;
 b=oMcC5skeRwXJqIWqRBtWXf+NNzwkx2Hb9Yi5/I5CrmxCodevKudTx3kgfydxAX/iAPEk9w0Qo9QSXEfhk1+pB2QQuytEoPt4Lu+Twejj5vNqCzoNcQrrm3Q8ObR3FeeTQcLEtWGSp2lv/ZaLVcnmBc4qPgRZP7z09dJlFco3HeT9SpisrzFrZ7v87RqtMsyyy1VeaSfQo3OfZpqDHF13n5iJ+qN6ELUnLeTuNHK22ZhVY81KmtWIAJ7c+NfaOVjfUBVHsU4aBaWXZGwe94ct6McPW7zxyEVzOO+OH026f2GjOhG7/xKtJyz1bRvxwg245dMmUzSp1M+r+GG01gsWcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1147.namprd18.prod.outlook.com (10.168.115.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 15:46:32 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 15:46:32 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v1 3/5] xen: sched: null: deassign offline
 vcpus from pcpus
Thread-Index: AQHVPLldBnQTmgAVAEKMCBR/SPQnEabPJF+AgAE2lC2AAb3cgA==
Date: Fri, 19 Jul 2019 15:46:31 +0000
Message-ID: <0df4c185fa6070bf9e64e9fc9a2718ad2a1a211b.camel@suse.com>
References: <153515586506.7407.8908626058440527641.stgit@Palanthas.fritz.box>
 <153515651319.7407.3000873927341886165.stgit@Palanthas.fritz.box>
 <533decf6-7ae0-cc43-0162-695151cde292@citrix.com>
 <9d4acfa8661eb571492405be91b0cdce1bb069c0.camel@suse.com>
 <3054de3e-8e95-8d0d-cc72-e14d194dce96@citrix.com>
In-Reply-To: <3054de3e-8e95-8d0d-cc72-e14d194dce96@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63dd2fbc-4813-4a12-1404-08d70c604598
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1147; 
x-ms-traffictypediagnostic: DM5PR18MB1147:
x-microsoft-antispam-prvs: <DM5PR18MB11479F9FFD11EF3DBD998F62C5CB0@DM5PR18MB1147.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(189003)(199004)(54534003)(53376002)(53366004)(91956017)(54906003)(76176011)(4326008)(446003)(478600001)(76116006)(14454004)(5660300002)(6512007)(110136005)(66616009)(66946007)(11346002)(99286004)(81166006)(64756008)(66446008)(86362001)(6306002)(66476007)(6116002)(66556008)(476003)(26005)(66066001)(2616005)(316002)(3846002)(8676002)(6246003)(81156014)(36756003)(6436002)(256004)(6506007)(118296001)(14444005)(229853002)(966005)(68736007)(25786009)(8936002)(99936001)(102836004)(2501003)(53936002)(7736002)(486006)(2906002)(71190400001)(71200400001)(186003)(6486002)(305945005)(53546011)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1147;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MDh0cLTbJ0VqxnGGe41jv4mbpybVu/CF+LuP8XGqQAzDrNRARxN0Cc0ar33p3WvKpLLMZdX18eN5vnC/SkO6itAD5oWGd6kC2C+vc+2U+ARYNghqXDQtFFO4l5yOWw/3SUaQw4VUBAsZDnxlC0VG8yyXtgVVsJnzZ6X5wUGJevqaVQmjOViwBPG8zSoFQAiOlKHyrOAgH2v9YDLbjkEpyCwQstGYMP689ksspQuGiEeoKGuUf6et5bC2kqbQpgPTL0DA+42T5FWYOCIsPEBKaFanycYlEPOJRw04D3YVIfsaxpTwFhxw2CKSPzDFoIHXCdFro1qlpq5nlCSN00DByZPOWVg4sCOTedlQ010sontK7m75eSoqzcgIruQtcyR82b3bZ2YytoDx1+2bQ8dfKgG4niv28PymHLEErdvF7B8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dd2fbc-4813-4a12-1404-08d70c604598
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 15:46:31.7190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1147
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v1 3/5] xen: sched: null: deassign offline
 vcpus from pcpus
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6009151341659605848=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6009151341659605848==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-/RG8MnhqoIutCBt4Gn5M"

--=-/RG8MnhqoIutCBt4Gn5M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-18 at 14:09 +0100, George Dunlap wrote:
> On 7/17/19 7:39 PM, Dario Faggioli wrote:
> > Point is the work of removing such vCPU from any CPU and from the
> > wait
> > list has been done already, in null_vcpu_sleep(), while the vCPU
> > was
> > going offline. So, here, we only need to make sure that we don't do
> > anything, i.e., that we don't call _vcpu_remove().
>=20
> Right; I'm mainly saying, if the commit message had said what I wrote
> above, then I would  have immediately been able to see what this hunk
> was doing and understand why it was needed.
>=20
Ok then, I'll improve the commit message and...

> > But I appreciate you seeing it differently, while I don't have a
> > too
> > strong opinion, so I'd be fine merging the patches (or doing other
> > series rearrangements, if you feel strongly that they're
> > necessary).
> >=20
> Merging the patches would be one way to avoid the regression, yes.
>=20
... I'll merge the patches.

> Sorry to be picky, but I've recently spent a lot of time doing
> archaeology, and wishing people in the distant past had been more
> careful / informative in their commit hygiene.
>
No problem at all, I see and agree on the fact that changelogs are
really important. :-)

I guess I'll wait a little, to see if you have any comments on patch 4,
and then resend.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-/RG8MnhqoIutCBt4Gn5M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0x5dUACgkQFkJ4iaW4
c+4LoxAAhvVNMnu+t+ZGrDCEw2/wuas3LjYySkRF3m86bnqquA9BRjEjxs2XJ3X5
h8EQxR3+2+dssTRcrXPXyR2ylm2ZHc2qzzFdx1Kd7Gs7W0bpj2iFpZrMTc8BdLtb
uAAd8GX/DxWntvF3UnXTB99wuPwxajfrEN9R4GAAovR8j4W8Wz8Xbf6i6+FAs9c7
sWB68tK7IrmwKMmnlqeuKpV2TFfKbbjPgnhzZh+mwj8HnCpi3yo6QlLMrhQdJ/7J
MCdjgEl0pdZV0k44H0pofzzNVLQaXbwysdtQvO9BDGf79LagZLr10Lvqy0PDR+7m
KFCw9WLMAEPjfsRvW6h3xf8eqSMHL8EFKR8Sa2cd+uotXSuHptlJ01Xhx6/waKcq
y/b433AhJtx3VsS/DP/JfvOhaRrDoiamnqAXhWwsng+09/ei+i+5dLMTQFAJ5wCZ
WsXz3zE15ZOTYecR1IpkTVNznatUjbgJHJcjXXSNOiJIEHhoiVe3VgTh/glDtCGC
zJinzqEwJr39Df11A9r+XlaGEMNemtYKYl1vel/ogzO8VIoQAMKCwj5vjIIdCwCX
QTa6YfBVMpdVrjjfBLp/Auc5mzWAZqq+/HO/f5a99aBnUO4V4HX+LJKwjRIK/J/V
flIUEcYU0M++fgXwNKixkGmOaoQqLgYEbqN7L4bsGR5N1cmiVMA=
=5+p2
-----END PGP SIGNATURE-----

--=-/RG8MnhqoIutCBt4Gn5M--


--===============6009151341659605848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6009151341659605848==--


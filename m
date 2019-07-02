Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9860B5CCD7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 11:44:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiFIq-0007UJ-Nx; Tue, 02 Jul 2019 09:42:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cB3/=U7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hiFIp-0007UB-Iv
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 09:42:19 +0000
X-Inumbo-ID: a484d99a-9cad-11e9-a47a-039418e34cad
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a484d99a-9cad-11e9-a47a-039418e34cad;
 Tue, 02 Jul 2019 09:42:15 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 09:38:28 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 09:40:53 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 09:40:53 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB2230.namprd18.prod.outlook.com (52.132.143.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 09:40:53 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::859b:66e:c904:21cc]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::859b:66e:c904:21cc%10]) with mapi id 15.20.2008.020; Tue, 2 Jul 2019
 09:40:53 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 13/60] xen/sched: move some per-vcpu items to struct
 sched_unit
Thread-Index: AQHVMBZ1o3Yy0YSI1EOsynhkarGQtKa13jUXgAAJ1wCAAPcUfIAAF4wAgAAHhYCAAAIrAIAAE+cA
Date: Tue, 2 Jul 2019 09:40:52 +0000
Message-ID: <e2b690e4ecb8267c600b394c684968c01e510f81.camel@suse.com>
References: <be24ad7e-9510-912c-9984-7eec792fae86@suse.com>
 <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
 <de741925-b823-92ee-c9be-c4cc55da859d@suse.com>
 <0bb81eb9-8303-2dae-2fba-28c73ac74050@suse.com>
 <ee6a055b-2a47-e6ee-91d4-f23bfce5243d@suse.com>
 <ace01bb733d0dd624b9e9ee07c5da4f5567a8a8a.camel@suse.com>
 <ae74f899-b3ea-6349-5352-88b07c0dc9d8@suse.com>
In-Reply-To: <ae74f899-b3ea-6349-5352-88b07c0dc9d8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: MR2P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::22)
 To DM5PR18MB1499.namprd18.prod.outlook.com
 (2603:10b6:3:144::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4d806ca-5242-4132-3741-08d6fed15f8d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB2230; 
x-ms-traffictypediagnostic: DM5PR18MB2230:
x-microsoft-antispam-prvs: <DM5PR18MB22307F482F0227E3CD561BEAC5F80@DM5PR18MB2230.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(199004)(189003)(4326008)(6506007)(102836004)(5660300002)(53376002)(53366004)(386003)(52116002)(25786009)(86362001)(76176011)(6246003)(11346002)(99286004)(53546011)(81166006)(36756003)(26005)(2616005)(6306002)(53936002)(486006)(478600001)(7416002)(446003)(476003)(256004)(66066001)(6436002)(6486002)(186003)(6512007)(6636002)(305945005)(68736007)(229853002)(64756008)(66556008)(110136005)(8936002)(316002)(14454004)(966005)(2906002)(7736002)(6116002)(99936001)(66946007)(73956011)(3846002)(71190400001)(71200400001)(118296001)(66616009)(54906003)(66446008)(66476007)(81156014)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2230;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lLkqCXa65oTluBE0OCj6VX3DG8W2Kh9xpwAMixp6SKgukAU+cFVrDEbtEDtgMpPVJGzIE2hHEJW+kb4iiyaNp5LyFgdwmbDmoCNMxhGrvMDz2zxfNpM6Q2oJuCfA/N6Q90ZD1ThHPigKUkrQmVA7lHUZuIXRKLb4csXQH2CCxHi1nX6hcH0Vjb475DPz9lv3OS/2xUlbTbTxOCEJh0BBZWNEhT/Dof4vAIkHquCV0JQZx0MLdEm5MeVhcYNmt6w2aPvQN3II4hPU6sxT1M24RCjyWx7dJIpG0U97BokVK1louLUveBjKP6Q0IS6J/cR4dqGX4sHn31MsPR5mqBZpz+JgZEuU/CHpu0W8s3Ke7vPKUnJhOC3r/Zv6fbR1PqL2gXS2xgkHIW4CpmFjL7+ErZQZb/7vOG3DIkqIjstEk8o=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d806ca-5242-4132-3741-08d6fed15f8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 09:40:52.8017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2230
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
 Konrad Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============3683619623386448541=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3683619623386448541==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-AzQKgO+Yd6UVi1+SOaml"

--=-AzQKgO+Yd6UVi1+SOaml
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-02 at 08:29 +0000, Jan Beulich wrote:
> On 02.07.2019 10:21, Dario Faggioli wrote:
> > On Tue, 2019-07-02 at 07:54 +0000, Jan Beulich wrote:
> > >=20
> > > And again - if someone pins every vCPU to a single pCPU, that
> > > last
> > > such pinning operation will be what takes long term effect. Aiui
> > > all
> > > vCPU-s in the unit will then be pinned to that one pCPU, i.e.
> > > they'll either all compete for the one pCPU's time, or only one
> > > of
> > > them will ever get scheduled.
> > >=20
> > I'm not sure I'm getting this. On an, say, SMT system, with 4
> > threads
> > per core, a unit is 4 vCPUs and a pCPU is 4 threads.
>=20
> No, the meaning of pCPU is a single thread of a single core. I.e.
> what is represented by a single cpumask_t bit.
>
Fine, let's continue to call that a pCPU. Then, when core-scheduling is
enabled, there's no <<multiple vCPUs of a unit being pinned to the same
pCPU and all competing for jut its CPU time>>.

There's units of 4 vCPUs being pinned to 4 pCPUs (the 4 pCPUs of a
core, not 4 random, nor arbitrary, ones).

That is the point, AFAIUI.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-AzQKgO+Yd6UVi1+SOaml
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0bJpwACgkQFkJ4iaW4
c+7gGA//RbVmBWUgo1E0yAruue7tCnHEZL9PrO0Ql4bj3v2YqOgX0O8paIf0ia1H
BzhAWS3FTWIdCWEJoJI62ZRozxGgVyUQ0KZdpnnGvLBsZSoiaAcsudze7Bdun/UK
ppq+65P40iGr/vl8/fMqgrgcu3eOsSSorcfNUkEFPpN6zghZDASB5ak9GXOSDrX2
m7HKNzGYbz4OT2S8QjMIlxoAx4p2ytok7uPIroa5Hq3KIRXL6S/S3QLU5h3zNaF+
DN3d2DP2LgdfSaGLCQjS3nmXpiCJRN8AqqUMZLG+6PGuUtDTu/VcdAN9LSFZJEGl
bEBhAboTxsSPnTbPPZFKoarQ0zrnEDVlJQfL1R8SPg+U/ecvDX3q3JtY5rctbF10
A8UkokwN3u1blVf6wJKVt5fP8Nbi7emkrLP2PpDfuC2++sVREWwcXmKjsR/XfBjG
/wnLkQIyeEMOug5Agk1c3KUbS/0kP/rl1Hdq2cDFrY5gD0JDxhpDhtcZ48A4KwRT
g4z2hc2X/XBCWwmmRmNyVs6Hb5e1beqVbrRl4ZYxCPHrH0Ts8LV4YeognSXvSM0W
EDE9jtYAD4vHDhWJdL7KDwc/fXd3hoolAr4qG1CRc5rsZz4Fq4jV3crITLOXkMZX
rFLqB5A4ax/I9toYMKQqVTCcAWabrV5lzm98+3TyNlHbtTyZVBU=
=Teht
-----END PGP SIGNATURE-----

--=-AzQKgO+Yd6UVi1+SOaml--


--===============3683619623386448541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3683619623386448541==--


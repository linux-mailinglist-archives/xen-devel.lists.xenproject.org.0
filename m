Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE738C45F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 00:39:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxfPG-0006W1-6h; Tue, 13 Aug 2019 22:36:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWNT=WJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxfPF-0006Vw-KH
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 22:36:41 +0000
X-Inumbo-ID: d0b6704e-be1a-11e9-9469-a70f95ba46bd
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0b6704e-be1a-11e9-9469-a70f95ba46bd;
 Tue, 13 Aug 2019 22:36:39 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 13 Aug 2019 22:36:24 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 13 Aug 2019 22:34:12 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 13 Aug 2019 22:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRX+L5gOxNKmtCGPuz0ZJEcxTHWggznQsF84kEDb+93fLPDR+uuqub1wF04Q7yikHiaobCs8Tq9rAlGzQkBzGKC6FmbEuGP/boJECTsmFqhivhTOWFzrvKBQm6EN/OotDwGw4/TnLK+RwV6UwRnxwiM0TVoI3OPj7Vpx/bVzXhZo3Flo6eLiz5pw3bdnJ4yKiCBdsdwGBP3MYhRRhz2b779wZ/P5V1iQbOhTTVtyPPCu0qCzQlJD1vGl219CbciUUCxX3cHcLMsCZLgjl9knyH05ETyQeMzmMmGkQROHulAn4pwivgyHZYNuZVRf13P5LrAiQNS9rbUEZd2+Tvsrwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81yrqwDMjAMYHRb2mjk2Uibt4+fpvJNoc8EOjPDI7VQ=;
 b=VThPrIfBTVGwBrGPHaQuyOVjj/MDeJ4Z7MA0aNopgUF641JwTpLDT/eU7wxtXOdYwH1LhTQy2uRQfOSRLwfbpP+w9JKRvPY0SQwMcFvxx8rOLWhe29PzT9oIq5wfpx8VSsvTGKnSQwBsHyeKFZTuGshwJNAFuZhah6fP68BXdbrc/dFe4i4a+dGK4DLIHXt0usUHZg5arq3Tc0T7oY4fCofU8/HzClF+8vNSqCoqw7GX0MPUOfoTdlk86ZkpxAQqvKPCLE2Qt1jtVT0uyZpf1Jn6UueEaZxh9nbNNJ9ceZYPoTrtqTOdVCRG29NZMIS7Gt13g3T6HHAcKjU2orxueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2630.namprd18.prod.outlook.com (20.179.94.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Tue, 13 Aug 2019 22:34:11 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e%7]) with mapi id 15.20.2157.015; Tue, 13 Aug 2019
 22:34:11 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien.grall@arm.com"
 <julien.grall@arm.com>
Thread-Topic: [Xen-devel] dom0less + sched=null => broken in staging
Thread-Index: AQHVTU0h+kfyo+Dyy0KGuLer1mUTwabzJpKlgAYWI4CAABfdQYAAC4UAgAATdqOAAEBIgA==
Date: Tue, 13 Aug 2019 22:34:10 +0000
Message-ID: <e82af45e0841f9cf8f27ac93c698e4c4a2d4c44e.camel@suse.com>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <bfcd8473-a73b-932c-3cdf-7ad41c14e4c0@arm.com>
 <6f44856f428c936f9c1913f3f35196dff6044509.camel@suse.com>
 <fdbf9a17-acbf-3402-6b69-d1af0193df53@arm.com>
In-Reply-To: <fdbf9a17-acbf-3402-6b69-d1af0193df53@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b6e1fd0-6cc2-44ec-b249-08d7203e5c9c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:BYAPR18MB2630; 
x-ms-traffictypediagnostic: BYAPR18MB2630:
x-microsoft-antispam-prvs: <BYAPR18MB2630EC976D448B10D68D970BC5D20@BYAPR18MB2630.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(189003)(199004)(53546011)(6436002)(81156014)(6506007)(7736002)(76176011)(446003)(11346002)(53936002)(6486002)(305945005)(99936001)(81166006)(6306002)(14454004)(86362001)(6512007)(99286004)(8676002)(4326008)(8936002)(71200400001)(71190400001)(6246003)(229853002)(486006)(2906002)(5660300002)(186003)(53376002)(53366004)(76116006)(66946007)(91956017)(66066001)(66556008)(66616009)(54906003)(2501003)(64756008)(66476007)(66446008)(478600001)(256004)(2616005)(36756003)(3846002)(102836004)(118296001)(966005)(26005)(110136005)(6116002)(476003)(14444005)(25786009)(316002)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2630;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EzlyDM5Z4dz5QFseLDRWM7aPGOBJpjRiCHWjgqjAOs9uhVg+ekmdoNq7oYOaDxWmq0Nplz0ffTHsiN0oY9ORYpSaqPydPJK97NnK/rqRakc8/LJ9ZJGAcGpgYiiOu+H8tffSH36LhZzCgEGx9ZFfdoqSmg7OXsHbCUItVHDR+Ue7nfEvmx/q1KcW57o1SjR2B6nHrUepcHPTYSm5oqoLLiUsmGiRkn6JUdvP00tJ0ojUD7eDRcgLUTn7w1PJ5rJbs8u3TEm15QynX4tltrvZu+BqqysMRFNcNQUH9d+Hu/9HY49RfsgSI0QN+BQwagMoGPGnGsbQ12Gop5RERNEEBgGYOSrkB2WTFznlkTYq3SgVl/rB1g3jYXQo4XqZ242qpxjPtlNMGhDR26NKvYJ5vFBHIEiYHTYuBj4Y+X7yZXY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6e1fd0-6cc2-44ec-b249-08d7203e5c9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 22:34:10.6530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eCXNh88nKi+sx1S/ms1O9ruEflPCW41YTpUcoWEmzLON0pR9HqVjjY07XnzfjSIP9RyfvZExqxnAtVG+cVhXrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2630
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============8478085779622212676=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8478085779622212676==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-9c0PONtYbPqG+Eu1t1zV"

--=-9c0PONtYbPqG+Eu1t1zV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-08-13 at 19:43 +0100, Julien Grall wrote:
> On 8/13/19 6:34 PM, Dario Faggioli wrote:
> > On Tue, 2019-08-13 at 17:52 +0100, Julien Grall wrote:
> > >=20
> > So, unless the flag gets cleared again, or something else happens
> > that
> > makes the vCPU(s) fail the vcpu_runnable() check in
> > domain_unpause()->vcpu_wake(), I don't see why the wakeup that let
> > the
> > null scheduler start scheduling the vCPU doesn't happen... as it
> > instead does on x86 or !dom0less ARM (because, as far as I've
> > understood, it's only dom0less that doesn't work, it this correct?)
>=20
> Yes, I quickly tried to use NULL scheduler with just dom0 and it
> boots.
>=20
Ok.

> Interestingly, I can't see the log:
>=20
> (XEN) Freed 328kB init memory.
>=20
> This is called as part of init_done before CPU0 goes into the idle
> loop.
>=20
> Adding more debug, it is getting stuck when calling=20
> domain_unpause_by_controller for dom0. Specifically vcpu_wake on
> dom0v0.
>=20
Wait... Is this also with just dom0, or when trying dom0less with some
domUs?

> The loop to assign a pCPU in null_vcpu_wake() is turning into an=20
> infinite loop. Indeed the loop is trying to pick CPU0 for dom0v0 that
> is=20
> already used by dom1v0. So the problem is in pick_cpu() or the data
> used=20
> by it.
>=20
Ah, interesting...

> It feels to me this is an affinity problem. Note that I didn't
> request=20
> to pin dom0 vCPUs.
>=20
Yep, looking better, I think I've seen something suspicious now. I'll
send another debug patch.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-9c0PONtYbPqG+Eu1t1zV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1TOt8ACgkQFkJ4iaW4
c+7GExAAmYQcH5/yIRWbYCtK8itYkEiinLrcM44csqHFgaaGGoOg+ZZmnS2hEVrS
Qj4USCUPTuR5gOhpOo3/UGIWZALdTdyBRIu+uvBgURQeqduWJS/++LEFF1bEezSU
fNSanjpjV/41bLIH/3aGO5OzAmKl5FLl1aaeVSLbTB3mJX0adRtsHoiZNYtTj5tO
5Qnc7nj10ge/FaneNQ302/6ngud3/k0zs8FCv+iGzV7YCQ+0QJS3fvKACiyD1jhs
BzPMR4twQGCgPvC2KxX41cHWFO1KHmi4u5M0o78+/gr/7nnP2AnypOmCSXXuCxX3
JnfzmFpmd1LoRtDlAzqE2oYHQLv6M/W+2r2a2+w6tqQrpGYa2dmGdNSdsz67KO2H
Wpil4gNzDoRlh0JkTJOXigJP7A2Gfi3ou/rzAGx8uM11hwx9oWFk1HMzjC4k1D0O
uJqfSqYrsg701B/UDNqcR3LCznYs35L9HWbKTEkENpOQSMgwiihUr8c4Y0jyYVwt
jD3TsGeoQZc3iDdN31eP/5NMKLYHAINvkC+pknPNLAfTGBl+mkVv5VVhLnj+0xo4
WYmoiJRMMGYGI7qmuPysSSiBEdGf4JNJKFpdSdnPHQke2pKEbjRLn4NNUYb+FTK0
lXTjPO0O/s1tmMVk5SfX73eRel+cLCOODZWrK1J08++YNSh7ld0=
=2di+
-----END PGP SIGNATURE-----

--=-9c0PONtYbPqG+Eu1t1zV--


--===============8478085779622212676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8478085779622212676==--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A5D6070D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:00:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjOiR-0007S4-8h; Fri, 05 Jul 2019 13:57:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jwj3=VC=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hjOiP-0007Ru-Gq
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 13:57:29 +0000
X-Inumbo-ID: c604dbe8-9f2c-11e9-a295-8fa8414a5989
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c604dbe8-9f2c-11e9-a295-8fa8414a5989;
 Fri, 05 Jul 2019 13:57:25 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 13:57:04 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 13:56:47 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 13:56:47 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5SPR00MB2541.namprd18.prod.outlook.com (10.168.120.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Fri, 5 Jul 2019 13:56:46 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::b8ae:df10:7b4a:5245]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::b8ae:df10:7b4a:5245%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 13:56:46 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Juergen Gross <JGross@suse.com>
Thread-Topic: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
Thread-Index: AQHVMzQf1/wC7eqyt0OnXkyWABT136a8DISA
Date: Fri, 5 Jul 2019 13:56:46 +0000
Message-ID: <3cb1c2b777e623a55bf87dc12a155734667ab23e.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
In-Reply-To: <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: MR2P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::23) To DM5PR18MB1499.namprd18.prod.outlook.com
 (2603:10b6:3:144::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5df216d3-e07e-40e3-7b34-08d701509e5a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5SPR00MB2541; 
x-ms-traffictypediagnostic: DM5SPR00MB2541:
x-microsoft-antispam-prvs: <DM5SPR00MB25412E4D1090013659E7454BC5F50@DM5SPR00MB2541.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(199004)(189003)(6306002)(6512007)(53936002)(14454004)(25786009)(7736002)(305945005)(66066001)(256004)(966005)(6436002)(66446008)(73956011)(2906002)(64756008)(66476007)(66946007)(53366004)(66616009)(53376002)(6246003)(66556008)(5660300002)(229853002)(36756003)(6636002)(4326008)(54906003)(110136005)(71200400001)(71190400001)(11346002)(52116002)(99286004)(68736007)(316002)(446003)(118296001)(486006)(86362001)(76176011)(99936001)(81156014)(476003)(6486002)(2616005)(7416002)(6116002)(186003)(2501003)(26005)(8936002)(386003)(6506007)(3846002)(8676002)(81166006)(478600001)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5SPR00MB2541;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g+UQX6TPwqv/b3chA978QpLXUXi0F+3ROMWuc3tM4dqgNrFLE1rtHE3SHxuEyfIKSEVbnkj47mGqryxiWNSWAIQl/RZX9KKI4Te8N3elkQ6qSKqXLuqprDo6mSoSuwvJ9L2WLp4fTVP+ToGo7/SBxuBbFSLAmCfb2QovMUGSbF8WP5UmN/zI0pKjOIhXlK4rd8KYqDtz4rLvF4BeOa5HaImF5s8l6rNaSF5NF5AGflrAS+ZAFWvK3mBLaWPc0rDCL9rIrFPGrktaD3XmR8+ayAFSbIkegSoJFxRjh1O6FGREy2R+aKAZrJ3sMREY7FTN2+a123GbSbN78toPBk3OuYalsy0186AGkpSJs2qXroV1KJxl9hMQFEc9hLUTZ9nRxQN7aLsuxzNDAo4Bhilwkjx/P3e3l0tGL/haTVmGSV8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df216d3-e07e-40e3-7b34-08d701509e5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 13:56:46.4698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR00MB2541
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 RobertVanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============3384779782891191977=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3384779782891191977==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-zYh6ZcF9Mj46AiSvPXwX"

--=-zYh6ZcF9Mj46AiSvPXwX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-05 at 14:17 +0100, Sergey Dyasli wrote:
> 1) This crash is quite likely to happen:
>=20
> [2019-07-04 18:22:46 UTC] (XEN) [ 3425.220660] Watchdog timer detects
> that CPU2 is stuck!
> [2019-07-04 18:22:46 UTC] (XEN) [ 3425.226293] ----[ Xen-4.13.0-
> 8.0.6-d  x86_64  debug=3Dy   Not tainted ]----
> [...]
> [2019-07-04 18:22:47 UTC] (XEN) [ 3425.501989] Xen call trace:
> [2019-07-04 18:22:47 UTC] (XEN) [
> 3425.505278]    [<ffff82d08023d578>] vcpu_sleep_sync+0x50/0x71
> [2019-07-04 18:22:47 UTC] (XEN) [
> 3425.511518]    [<ffff82d080208370>] vcpu_pause+0x21/0x23
> [2019-07-04 18:22:47 UTC] (XEN) [
> 3425.517326]    [<ffff82d08023e25d>]
> vcpu_set_periodic_timer+0x27/0x73
> [2019-07-04 18:22:47 UTC] (XEN) [
> 3425.524258]    [<ffff82d080209682>] do_vcpu_op+0x2c9/0x668
> [2019-07-04 18:22:47 UTC] (XEN) [
> 3425.530238]    [<ffff82d08024f970>] compat_vcpu_op+0x250/0x390
> [2019-07-04 18:22:47 UTC] (XEN) [
> 3425.536566]    [<ffff82d080383964>] pv_hypercall+0x364/0x564
> [2019-07-04 18:22:47 UTC] (XEN) [
> 3425.542719]    [<ffff82d080385644>] do_entry_int82+0x26/0x2d
> [2019-07-04 18:22:47 UTC] (XEN) [
> 3425.548876]    [<ffff82d08038839b>] entry_int82+0xbb/0xc0
>
Mmm... vcpu_set_periodic_timer?

What kernel is this and when does this crash happen?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-zYh6ZcF9Mj46AiSvPXwX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0fVxUACgkQFkJ4iaW4
c+4SZg//VNSfDzdty+i4DYVvKl4GYM/1hwKPLOIf+06r2QCdzjm3BxBoGMCCgs/G
/RhZ+3i8zAP1v6vF2pBq1VynUcMfLKmYzZMDiXmVB72v5UnwUa2OJ/WJp5Op/WbJ
PKRGAct65quHj3ZjkM7rjNz8xlQk/i6u0dusSkcCrtR0sR/VcT9D6vMVLbyuh+gy
73kl/YXqvogU4aAsydO54xQwSGW9e6OrOx7WRQ/7zI55clfjkybv3N2VM1+6wD+T
q5PK7lNZm4bFWZefYUqKSx3KpDRQB2Q5aaemx4SBynUR19tzz0IbFbjDOa12dB+S
pt1/XfAaYUTaexwCrm5DEVMrltVvc7Ckm4J26UF8biIjT5ENK6zfX/7+cqrg+0nT
3zG5cXIQq8kFOoNuIt1McxhnAjy+fWFGA/fKqcafIK+ho3t9cRdHn3pCzIcI/xJd
s6cBFZ/TpCiKxa9y3gPP+6CMTiDLy36I54TzU5pjA2gX3IxqplNpKEqgI1ayZB1E
/eBpz6MPI5Ew76O6h0/MXzOc7bx+REpEeNmJn6kJ2RUVjcjGdWHZNYSlkcdw1i4H
5zOxTLRWQUyuq2XEuhxSJh6qclvwVJh9uAFGkFy5/nUkRZDRbzIt66PKvgv8j3pD
qAjtVotXD4kF0a4460c3R3fHz1u4ufKZpdXTM6CK/ortiNYEk98=
=x5Xj
-----END PGP SIGNATURE-----

--=-zYh6ZcF9Mj46AiSvPXwX--


--===============3384779782891191977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3384779782891191977==--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22B87651C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:04:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqyvS-0006BY-PW; Fri, 26 Jul 2019 12:02:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqyvQ-0006BT-WF
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:02:17 +0000
X-Inumbo-ID: 30b201f7-af9d-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30b201f7-af9d-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:02:15 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 12:02:07 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 12:00:26 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 12:00:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ/trX9PPg7YfPdpbYD/9hpMyWCtUdV1kciVvH8u442GhkYT2tQbqvRgFvZZMJj8o/vAV8y6LbulL+M+AcM/ZWmmQjSbWjA65MkNlN198pJ914XjyVWf9Sh+63kkS21DB3BPn8Pc/zf0nnJALFi4NUjJT4CkUwyfNGGTqVKcOCJezKghWXWpdVMhBngJeqNuuMgB91Vch0iye5voblfvJhWBtQJJ32BO8lRtS5poEu8ejutenDoRRqcZPkMZKy/1/cewJoyizpmCrxHwyoJz0i9nKrmTI0iQbBlay6KWQTJ7SjOSY9ozBJO/uec1VV/ox67CDqlHU3BbCmQmRnmIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkbuU+8M/8yBoZJQruWK+Mcl2AxeY6WGKX04a0u/0t4=;
 b=FZ2bC4ZIOi0XImzRuW6oNtmwVnvvRWuChbEGFp7FmiS7vHRoj0ikRes0xYeKfafhvdxI1THr79m/R22Lq60OjBlChQWRLU420yxVcdbyPCvzmvntvmpjWqNeXg9iuUX6Ro4Zh0F0Vl37a7oVco/d9Y+Cg4lDzQFBZceH8l9iel9t3RmYAfs7YIIx8IzAIU3d6NgYXWVaq8EYko/yKY1Ge08jEdjisEGbp9v50bFFhr2y+h59cVzxUVBhhhGVvaTxvrl1qCMZC5LoP3vdH22ufEhiC7m/iY7EajfLtkIAl86KWing7xtDif3ERyxK6UTL1yiXmlaTq34iX4NqPTZRyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BN6PR18MB1490.namprd18.prod.outlook.com (10.175.194.149) by
 BN6PR18MB1396.namprd18.prod.outlook.com (10.172.209.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 26 Jul 2019 12:00:24 +0000
Received: from BN6PR18MB1490.namprd18.prod.outlook.com
 ([fe80::591a:7cd:495f:8e37]) by BN6PR18MB1490.namprd18.prod.outlook.com
 ([fe80::591a:7cd:495f:8e37%6]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 12:00:24 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [RFC 2/6] schedule: account true system idle time
Thread-Index: AQHVQ542k/V3jm/kpEa8uLBSXrMN5abczCoA
Date: Fri, 26 Jul 2019 12:00:24 +0000
Message-ID: <f8e9bd7c08f85acc17af58fa305495113c990e0a.camel@suse.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-3-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1564137460-25629-3-git-send-email-andrii.anisov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 445d7686-c44b-439d-7764-08d711c0d7d8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:BN6PR18MB1396; 
x-ms-traffictypediagnostic: BN6PR18MB1396:
x-microsoft-antispam-prvs: <BN6PR18MB139685477AF4EC60E22816BFC5C00@BN6PR18MB1396.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(189003)(199004)(118296001)(6116002)(6436002)(3846002)(2501003)(86362001)(5660300002)(66616009)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(91956017)(14454004)(6506007)(102836004)(76176011)(2906002)(966005)(229853002)(6486002)(478600001)(486006)(305945005)(14444005)(2616005)(256004)(476003)(99936001)(7736002)(6512007)(6306002)(71190400001)(99286004)(68736007)(71200400001)(81166006)(81156014)(8676002)(110136005)(54906003)(316002)(8936002)(25786009)(2420400007)(53366004)(53376002)(6246003)(36756003)(186003)(66066001)(4326008)(15650500001)(11346002)(446003)(53936002)(7110500001)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR18MB1396;
 H:BN6PR18MB1490.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tOW5+V7VhDUBoDdt/zp4bmLIEhDmg5JIeV4PZn83AABOAPwDDIGFNh04G/W3j+1thr0RcoUVl3vU+CCjiWdtPIkiCDzhCvLP2yt4/cpLG3UQsq3b4I3KPc/zlnDbJmZwDO89B70StgWWwxrUTC2wldC1nwD5bsHe3m+FDaMiDDUFgfhMiJaENDDhO+1I1YBhyU/ozbjXDZlfDs1K5W//MXrcM2pESAVgQ92yq5T/O/J9gPjFBvPI9on/UDmVMZDeZ6L9CgWfB47qncYTh0rJ5FpZiBo1dXvyCfdV6i68S3wGwvT7o+a9QTok0Y40a4YXhdNuCZFREzrXuB4jxkUOcw17fEyQzpQypwCE1UsD4blOpOmiPc/1e88V8CSLw2HzDObDn98IMNBogV8hW65FRH+zRkoqrhusnI3R9gkxYnY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 445d7686-c44b-439d-7764-08d711c0d7d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 12:00:24.6606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR18MB1396
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC 2/6] schedule: account true system idle time
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
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============0340460673654471627=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0340460673654471627==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-NLvOb3y624bJnsOd4Bgm"

--=-NLvOb3y624bJnsOd4Bgm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-26 at 13:37 +0300, Andrii Anisov wrote:
> From: Andrii Anisov <andrii_anisov@epam.com>
>=20
> Currently the idle time is being accounted as a idle vcpu runtime.
> This is not entirely correct, because the entity named idle vcpu is
> in fact a hypervisor tasks worker. E.g. some softirqs are processed
> by the idle vcpu.
>
That's all very true, and, as discussed both via mail and in person,
I'm all for it.

About the implementation.

> So lets change idle vcpu time accounting and specify system idle time
> as a idle vcpu blocked time.=20
>
This, for one, doesn't really look right to me. You're trying to make
things more clear and more precise... and that's by hiding real idle
time in the idle_vcpu blocked time metric? :-D :-P

Jokes apart, I see how it is rather easy to do something like this, so
I understand it being done like this in an RFC patch, but I don't think
it's correct.

And, on an even more general perspective, the fact that the hypervisor,
when scheduling the idle vcpu, runs softirq, tasklets, etc, it's a
generic concept, not an arch specific one. So, we really should find a
way to implement this in common code, not in arch code.

Maybe, but I'm just thinking out loud, and I need to think more about
this, we can do things the other way round. I.e., we measure the time
that it takes to run softirq and tasklets, and we subtract it from
idle_vcpu runtime?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-NLvOb3y624bJnsOd4Bgm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0661YACgkQFkJ4iaW4
c+7zRxAAqf2djT/+MIjIpnBYvM/4vgw1Jp9jhrV7dEVTV48m2KoReJXnzqfDTGc+
gc5/eeA0AOktMf4XzuuD9s85T8YYQJCatNJazoyIWh1lMz9SFACDKrcLXBIR0VEB
5ibraMDyExjanRHtbg1jUMQ4JsaEC68Rj+oeyP1J1yULrbO+o/J6pKcNxafjYQlF
lufas8odZcUtHLWfHP0JZr6PilgdIvai5t4+jO/KjNzrZO0kUyXWsih+CCaabb7Z
K8Sq6Z+fFuwxeV9ynCf9LTUdwAOPmCUdTO3ehmyJMtfIDdLwY0+LRH3uLXkQ2AmJ
DHIrjofs0zcTG1ULnWSnVTEzbJWs4oCJz1sdqX+AipzuOxfRaZArFiKvZkmJ7Mz0
sl3xrD2pLfrrDgbyNmtjMCjGUH1a9LbfC7CbpN+u7WxHvLOmMhFVw7BBuEFvpj9j
uLZKokrHfEV1+wdLEYX3upg+35akUlD7WmlwWJIKZrgAgWZ5faPCJ1JJKvglz4kw
kgBxFbp+1KlBy8pqS/+VcZcQj9n4x8GOjrRqfuOp7iFJdnKxJsQpzmb5A1NLvFBg
OEf3/qi6Ty1q+NdpL7SDlzRRW3U4nxc52+TDcrshiYkJVjvWgmRDfszfrotezbrE
WttuyiNEnqKSMMLT2Ym8g0aiC3XZ2M/Mq8yfwGmKjNY7/4WI6Dw=
=RHti
-----END PGP SIGNATURE-----

--=-NLvOb3y624bJnsOd4Bgm--


--===============0340460673654471627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0340460673654471627==--


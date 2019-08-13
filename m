Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5780F8BE55
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 18:22:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxZX1-00062e-8O; Tue, 13 Aug 2019 16:20:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wWNT=WJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxZX0-00062Y-B4
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 16:20:18 +0000
X-Inumbo-ID: 3b4d827e-bde6-11e9-a2bc-8786216917ee
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b4d827e-bde6-11e9-a2bc-8786216917ee;
 Tue, 13 Aug 2019 16:20:15 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP
 FOR xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 16:19:48 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 13 Aug 2019 16:07:33 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 13 Aug 2019 16:07:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aG585jhiZxlotgJhtJI4IVryMhZY3XqwiGnOCJB4AnPnR3hR6WZSXwK6ANbF5y0Uqv89rSfiXRKQf5gb1UlOkya0jX2LUw0VyC5wYRjjKW8XqzlgfhhD66SQbq2Ht1VUO9H0OXBDdtXB5KKK0M6dat9jwvuosyfvd5QguThXh/x28+KMyd09S+0bMcbgsBJOIkCXCkusELirqGFE6sNze36QwBo8k/jAKAseOH4U/ELDYGecnnUrieO6TByChAgp1VInlGUruRCfzkX3QCeMG5D3s+DrcwdntwZYmkzz188OB1O5PWyxrOKjB9pyz8SMoRsIBk3lEzDRfn8M+B12kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZD0vI0AraatwbuU6RcDNHqEfJelP5tj+cMVqndQolC0=;
 b=DyfyQPseu/6dumAmigtCi3aXjuZVcsh+3pjNncWIAFCL/bp6DtMaxJ4b+3K6XhFFS2e4okDmVbc0lzNfUCKdcXLOwKcc4MXqjarM/+ii+SqBX0SN0CcMbOl/WTtRiVWrcDb9mOW+Q2sAp2macMt9UAfsTHf0jUh/x3FbvYZN3ZyK0JH3MnP05iRfh2CDE5jCfee9EFueRIhGNI8by79Fcs1Zou8mtn52/kZAk4kSkgWZrI/53u7CrqZFCG/cL2+L/aPSHYasEeCYBWlaU+3OlErwkx8D0l+FItdYcZVkBu1PLJDsflu9H/mJVclrVl/82mAgiu5OvSMiTc5Nqo/2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2902.namprd18.prod.outlook.com (20.179.58.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Tue, 13 Aug 2019 16:07:33 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::5d3a:af7:bbf8:f75e%7]) with mapi id 15.20.2157.015; Tue, 13 Aug 2019
 16:07:33 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 1/3] xen/sched: populate cpupool0 only after
 all cpus are up
Thread-Index: AQHVSTNKKFQK8XVh00OIkOngoDoQmKb5UAWA
Date: Tue, 13 Aug 2019 16:07:32 +0000
Message-ID: <a230e9a93d32f16bd4821d9a97b55b4343641526.camel@suse.com>
References: <20190802130730.15942-1-jgross@suse.com>
 <20190802130730.15942-2-jgross@suse.com>
In-Reply-To: <20190802130730.15942-2-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2190ab78-2874-40c5-5869-08d7200859a0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:BYAPR18MB2902; 
x-ms-traffictypediagnostic: BYAPR18MB2902:
x-microsoft-antispam-prvs: <BYAPR18MB29029AFCA014B61CE1781814C5D20@BYAPR18MB2902.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(51444003)(199004)(189003)(66946007)(53376002)(81166006)(6116002)(6486002)(86362001)(2616005)(3846002)(6306002)(118296001)(305945005)(8676002)(53366004)(99936001)(81156014)(26005)(6512007)(53936002)(6246003)(7736002)(229853002)(36756003)(14444005)(256004)(8936002)(66476007)(71200400001)(66446008)(110136005)(76116006)(316002)(478600001)(2906002)(64756008)(66556008)(71190400001)(6436002)(66616009)(446003)(6506007)(11346002)(14454004)(66066001)(486006)(91956017)(186003)(5660300002)(99286004)(2501003)(966005)(476003)(25786009)(76176011)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2902;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HQdkVmz4oFn4gFLFP506/Xid2rOXjsxmhVX7wfhtNklXWKs+gxvFHbTHQlHKOnlc0OATqXGkFLe0nXH/yV+HAKa8bQ30Y3bklhc6QeGMir2iTBABpTiA3rBZT5SA6kKYgRNbTs8jGU5KoRnf3HgVYV3Brb0WtP8pMx3z5JRrsd6mxeWLoX6UhYwjzZWTmGcLOjYbfQEqAoXeT593HfWjOKuchQ1fvYoy4+lKIbE5ZqgwjlX9R0khqvJ0ApVQ1Glb+wNkdPoU8nP1HsUsd9VeqNMjy0UcBRZ9ebrLj2I0ZoRzzZuNA2j2EjzGtSUuh5bByLWFpCV2yO7Q5P5SrG7Tdi/JPLdP55b4jTVJ3DnKRKylV2tvaJ377/ZKMdcknNi4maOq8ptMR1ke/Es6cnSoAzNaqIyNtzRWuBYBzgVEEUU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2190ab78-2874-40c5-5869-08d7200859a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 16:07:32.9873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 299oSevwI+mik6CWmO5Eub+m7Lgt0aP1TS1GI+6VwM7KAUOKxeR1w13ycG2s+ByACWyNI6AJJBbKvYnIgXWUYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2902
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/3] xen/sched: populate cpupool0 only after
 all cpus are up
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
Content-Type: multipart/mixed; boundary="===============4747956717564996723=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4747956717564996723==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-SywUGHq8oPTQwB43069n"

--=-SywUGHq8oPTQwB43069n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-02 at 15:07 +0200, Juergen Gross wrote:
> With core or socket scheduling we need to know the number of siblings
> per scheduling unit before we can setup the scheduler properly. In
> order to prepare that do cpupool0 population only after all cpus are
> up.
>=20
> With that in place there is no need to create cpupool0 earlier, so
> do that just before assigning the cpus. Initialize free cpus with all
> online cpus at that time in order to be able to add the cpu notifier
> late, too.
>=20
So, now that this series has been made independent, I think that
mentions to the core-scheduling one should be dropped.

I mean, it is at least possible that this series would go in, while the
core-scheduling one never will. And at that point, it would be very
hard, for someone doing archaeology, to understand what went on.

It seems to me that, this patch, simplifies cpupool initialization (as,
e.g., the direct call to the CPU_ONLINE notifier for the BSP was IMO
rather convoluted). And that is made possible by moving the
initialization itself to a later point, making all the online CPUs look
like free CPUs, and using the standard (internal) API directly (i.e.,
cpupool_assign_cpu_locked()) to add them to Pool-0.

So, I'd kill the very first sentence and rearrange the rest to include
at least a quick mention to the simplification that we achieve.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-SywUGHq8oPTQwB43069n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1S4EMACgkQFkJ4iaW4
c+4nJA//R3QumEVn9klOIeG+Cw68invF34LJSQypsYYxNIYSg4fjc913dk4kUx6E
oWs7/Yctbl1jM337905FHCtt/gXlqyUA6GatdJinqeLOXs6ZaHh4FPYF7otcPDOj
D3i5qUTvEVoAmpbongMjAqikqkRvaCmqm1KLOv+Nl6u5WElNn+tnFy10D97JWuKZ
lR6IBACoDxz7GuFvl3XimALDbc3DlM1Nk+XXsLBId18ujD9JFzdt4lMm0ufbqunJ
gWjgNZz5Pxa2hVv1R6ToJWqT/ZXLzDrvCizFj88YpYlnCoppjR4rGcUFgoFP60SD
ku0PBIeelBZXL2SmvusXA3i5X/YQ7g04kf7uvKVUXrkMHblRCtMJG4dH4ByoC2ks
Hm7u9vpAAPmVYAABPototx4vx+ccFQbBsaBPylBv8YIayhH06w5SwxFrYaR8/UOX
/QwmLadh/g0AkO1y96WhVGgIgHnRPAG3HD8Hy1xHSYzx5uoMqYN3Gd/bRplKyalq
PLz6zAX7zFB3JhWRtJ3uBKHxdBqmWKHU4valh8QN00Ub1db/UbLVcfUf54BX15S6
a0MH5ViNCnT/UZgXPjuu1xNww7YD0vWCwNhzkZpENPzG4CbB5FFQqsp+npfAdLdG
+CALIK5ATaGeaV3IOSNbJwhaVcgbpcsgZFTktosMSNTYSSxpt8E=
=JkEG
-----END PGP SIGNATURE-----

--=-SywUGHq8oPTQwB43069n--


--===============4747956717564996723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4747956717564996723==--


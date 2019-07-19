Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1F16D795
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 02:06:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoGLr-0000z3-6m; Fri, 19 Jul 2019 00:02:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7nr=VQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoGLp-0000yy-MT
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 00:02:17 +0000
X-Inumbo-ID: 71281450-a9b8-11e9-b180-0fd55b02fdb6
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71281450-a9b8-11e9-b180-0fd55b02fdb6;
 Fri, 19 Jul 2019 00:02:15 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 23:58:17 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 00:01:39 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 00:01:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzEm9M1V4rAFSHQghGUc4bpXzgl9dKWwnW8NEmLhWuoxI75RNOriZo7sqsG7V0/gKZejn3hi3eo0X7nha9BbJYa4anx/HpbJKJXoF8rdCZcmANiQqP7Mc39ua1n90PEZfu6lh2qz6hxkLIx583el2GIuIIBVOXQQGOAjSIsz5Bg/rRMm8PizlFJIx1jByyMfuxOFJBBRS+e8Gv2vcOgfM9kL5mP+y0QYv/IuzmIR2y2LGgr1Y88PhjzU19h8E//C10zZWg5Ufs2Mar9zCgpkwmQu3ea+oBL5yrMsK4Ak3f8QKa9Vz+XBmY40/X79lKB8k5qvoz7nv7FoAvGb1C+yHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWArKBL34mW2Wlc/KKIE+/QLUsjA1Q9zkNCxklPE3+g=;
 b=GH/VnCNLvsbhSDZK8qViy6gdd2gmwbA3ReJIPwIy1jSSShvpiUbBZE5QrKbqCYg+sbyT2Kl43Rd8hz0fUTbQDo+0/6dYDQBGQ/63gnXMJIFVgJ8j5gy5Vckrev+eRatFw5gaVEOBpO26TLr+/Y6aN39j4jOxN5oJwluC7UhKRg6oKHcv6kVxqNrhVc1JgpK/umYWxQ9+UV4hGRKKiv5aIlJmaQC0FmeFwaU9GqOwIUExEem+9x35irsm51CSdG/3KLl0Zl914RGWfiPdKpKchrOXN5axhg7VvL/ydH1WcrEuan4MCM4ET0rqQhgSP2qVVNcbPEQm6ZECgT4/iX1DBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1387.namprd18.prod.outlook.com (10.173.209.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Fri, 19 Jul 2019 00:01:38 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 00:01:38 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 07/60] xen/sched: build a linked list of
 struct sched_unit
Thread-Index: AQHVPcUiu1Sp9PA7KEakXcPYJ1SK6w==
Date: Fri, 19 Jul 2019 00:01:37 +0000
Message-ID: <d6c0b816a66282436f24441c626fd31bb8a39a44.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-8-jgross@suse.com>
In-Reply-To: <20190528103313.1343-8-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de9e8e05-579b-4d0a-430a-08d70bdc457d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1387; 
x-ms-traffictypediagnostic: DM5PR18MB1387:
x-microsoft-antispam-prvs: <DM5PR18MB138754F8A4026B397699049DC5CB0@DM5PR18MB1387.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(199004)(189003)(71190400001)(110136005)(54906003)(2906002)(71200400001)(2501003)(316002)(305945005)(25786009)(86362001)(66616009)(14454004)(64756008)(91956017)(66476007)(66946007)(486006)(68736007)(66556008)(76116006)(5660300002)(36756003)(76176011)(102836004)(6246003)(966005)(478600001)(6506007)(6512007)(118296001)(53366004)(66446008)(256004)(14444005)(229853002)(66066001)(6436002)(99286004)(186003)(26005)(4326008)(6116002)(99936001)(7736002)(6486002)(11346002)(446003)(476003)(8936002)(8676002)(53936002)(3846002)(81166006)(81156014)(2616005)(6306002)(53376002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1387;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DvWu427GErVj5bnCOO7lkr0SH2eGCQcpMGkNb6VRZItvtQz9DN5WHIVwn7TETYPUoCEU/vJ2ejEkcQO7C6SHIzZOZey+3NN01ClW9EbQBYcd7BUgVJ9x9g1MAozSB44LahH41TOCmtHG6Hs6q0T4iObJHagJVkp5ph4hixDPGl5cZG93yhuFIWlxNQl5s3wvWz5Ad9ELR9m82Q5HveJqgpzYkmQD9mp6bfQDKUee7CPvMlP4G4P2Hr7G8CpOo0YKuXS1Jk9JY+8/lPPmjXobNJBk+DeqcpjAIdm5xTdRW5ZoUC//jrIkbS2S4oa2zVEyWK6ZAdbw+6OlMBaKJ/u7p/UG3HHCVRyU6LDYoWi4okSIX5T3/WN/UxESSLTkglB3qVJt+I4TXRPVVNq5ozkQT0eF+XiIATugd/6292Ho444=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: de9e8e05-579b-4d0a-430a-08d70bdc457d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 00:01:37.6717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1387
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 07/60] xen/sched: build a linked list of
 struct sched_unit
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
Content-Type: multipart/mixed; boundary="===============3454201732731920070=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3454201732731920070==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-lWou/+aXvn2CFdVSEw6p"

--=-lWou/+aXvn2CFdVSEw6p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> In order to make it easy to iterate over sched_unit elements of a
> domain build a single linked list and add an iterator for it.
>
How about a ',' between domain and build?

> For completeness add another iterator for_each_sched_unit_vcpu()
> which
> will iterate over all vcpus if a sched_unit (right now only one).
> This

"over all vcpus of a sched_unit" ?

> will be needed later for larger scheduling granularity (e.g. cores).
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
One question:

> @@ -279,8 +279,16 @@ struct vcpu
>  struct sched_unit {
>      struct vcpu           *vcpu;
>      void                  *priv;      /* scheduler private data */
> +    struct sched_unit     *next_in_list;
>  };
> =20
> +#define for_each_sched_unit(d,
> e)                                         \
> +    for ( (e) =3D (d)->sched_unit_list; (e) !=3D NULL; (e) =3D (e)-
> >next_in_list )
> +
> +#define for_each_sched_unit_vcpu(i,
> v)                                    \
> +    for ( (v) =3D (i)->vcpu; (v) !=3D NULL && (v)->sched_unit =3D=3D
> (i);         \
> +          (v) =3D (v)->next_in_list )
> +
>
So, here... sorry if it's me not seeing it, but why the=20
(v)->sched_unit =3D=3D (i) check is necessary?

Do we expect to put in the list of vcpus of a particular unit, vcpus
that are in another unit?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-lWou/+aXvn2CFdVSEw6p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0xCF4ACgkQFkJ4iaW4
c+5UCQ//VEKgJKyIQWdPtvqx7Blci1UUQLf3kl7vIFwF5h/9Mms6r1PfY7SBd6fa
1o3jOBf09uGw6oKkMxP/fvd5D1jOzXM0hypw7ueeDk6mBt0Z+pABIobS8l2L4i5x
/vwU1/f4ZYr1Koa9D4hH6Mm1VmZS9h8sF4UuDCUW7ZD1WaPkoLLef3Mk49/ot5N9
sfB1brb+JbXpkPU5BC/R5RRmM9GTemIdA7pKtoL88DiEVgM51X9tyXn4iAwybPMW
m5cLjUlXXS76w2TNJTM7xh9RuYNXhRB/3zJuI1d5k655gXeJVbfhkZstQjupqG2d
Ud6tvNkFtRDvV4kmR5mq04sqPgXWO/3oUUePkq6eEMjMQZeoYNGO4xosnjD2Yix9
gNePU3deIi9xmnZMC5jWBBm4vrVYb0iBOo25+yTSmSgIm/sfThOHtxarAmK5o2fT
8n6YUn+GcnVTKmWassR5UPdS5ERF9T4T5SRdHjHP8IrDQ+gUZ7Vz1LXztJOFbOTz
uFDH5LAIXMsCGteeRiUw/WtyMRR60r9mXhrqqpMUJ68O3AJGMiixl8yCgv+pYFds
PdwtCM8I/C8AMBJd53ECfsL8UC+kZjfBO1j6JCb6Mdp2xWCh5fVqT+oKGFV/kjtG
QDNqeSJ/P/mg/Tn4w5p1vQVOyvBDEYszC9oj0O3JP1vvMZzadHc=
=8WrZ
-----END PGP SIGNATURE-----

--=-lWou/+aXvn2CFdVSEw6p--


--===============3454201732731920070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3454201732731920070==--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC705CC04
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 10:26:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiE4e-0000H9-Mq; Tue, 02 Jul 2019 08:23:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cB3/=U7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hiE4c-0000H4-Vz
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 08:23:35 +0000
X-Inumbo-ID: aa75f8a8-9ca2-11e9-949d-ff9888e1cb3b
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa75f8a8-9ca2-11e9-949d-ff9888e1cb3b;
 Tue, 02 Jul 2019 08:23:29 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 08:23:22 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 08:21:55 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 08:21:55 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1436.namprd18.prod.outlook.com (10.173.213.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Tue, 2 Jul 2019 08:21:54 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::859b:66e:c904:21cc]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::859b:66e:c904:21cc%10]) with mapi id 15.20.2008.020; Tue, 2 Jul 2019
 08:21:54 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 13/60] xen/sched: move some per-vcpu items to struct
 sched_unit
Thread-Index: AQHVMBZ1o3Yy0YSI1EOsynhkarGQtKa13jUXgAAJ1wCAAPcUfIAAF4wAgAAHhYA=
Date: Tue, 2 Jul 2019 08:21:53 +0000
Message-ID: <ace01bb733d0dd624b9e9ee07c5da4f5567a8a8a.camel@suse.com>
References: <be24ad7e-9510-912c-9984-7eec792fae86@suse.com>
 <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
 <de741925-b823-92ee-c9be-c4cc55da859d@suse.com>
 <0bb81eb9-8303-2dae-2fba-28c73ac74050@suse.com>
 <ee6a055b-2a47-e6ee-91d4-f23bfce5243d@suse.com>
In-Reply-To: <ee6a055b-2a47-e6ee-91d4-f23bfce5243d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: MR2P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::24) To DM5PR18MB1499.namprd18.prod.outlook.com
 (2603:10b6:3:144::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad84733a-e5f9-4572-ed99-08d6fec65700
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1436; 
x-ms-traffictypediagnostic: DM5PR18MB1436:
x-microsoft-antispam-prvs: <DM5PR18MB1436E7D65477B753C714C0C4C5F80@DM5PR18MB1436.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(199004)(189003)(86362001)(73956011)(68736007)(316002)(486006)(53376002)(14454004)(53366004)(6636002)(52116002)(478600001)(66446008)(64756008)(66556008)(476003)(66616009)(66476007)(76176011)(102836004)(66066001)(11346002)(2906002)(2616005)(7736002)(6246003)(256004)(66946007)(305945005)(81156014)(53546011)(118296001)(81166006)(386003)(6506007)(26005)(99286004)(229853002)(7416002)(53936002)(6306002)(446003)(71190400001)(36756003)(186003)(5660300002)(99936001)(4326008)(6512007)(8676002)(3846002)(6116002)(6486002)(6436002)(8936002)(110136005)(25786009)(54906003)(71200400001)(966005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1436;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KKNSNi9Xtzgl/KFo7tb7dbf/iQ3tmnBwRXDkMjTr496k6GPnlFMFVLRUmfrGUrrj0/lzjRZsbfmz0mpm62+EbDvyc4RFeGxwLLRFHxxiSDKbHcr+pk9fPVt3mmhl9sFJszJHWHPgrF82iZEvtP4ejLYbOFQHifr7ah3BbtV46sQIhNaEPhTwxfydJOzW2S8FqqWOaPSCu3ElXpBjt7qb7/SUAmO9XjASbUyOvOu0cNNarNEEI4waFyMj4JVW6KRCGjSywubXVcVRb5wRGp+YXr62/Q5WBggf7DjCyivNiKAjdqiCCi2soZP6w3rhIQZl7U/s2dIExbFxOPo6r1aJtvZdhGuZcmdMBcncHCvuTXqbU+2fjFoLU0GTrctgHY4OsUjM8+HCsGuMXB6WTXcTI/5a48P8mOqncP4TJ3Yoi2s=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ad84733a-e5f9-4572-ed99-08d6fec65700
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 08:21:53.9587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1436
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
Content-Type: multipart/mixed; boundary="===============1302345412945206991=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1302345412945206991==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-gchDcV/dNJPR6argyMl0"

--=-gchDcV/dNJPR6argyMl0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-02 at 07:54 +0000, Jan Beulich wrote:
> On 02.07.2019 08:30, Juergen Gross wrote:
> > On 01.07.19 17:46, Jan Beulich wrote:
> > >=20
> > > Hmm, that's indeed what I was deducing, but how will we sell this
> > > to people actually fiddling with vCPU affinities? I foresee
> > > getting
> > > bug reports that the respective xl command(s) do(es)n't do
> > > anymore
> > > what it used to do.
> >=20
> > The new behavior must be documented, sure.
>=20
> Documentation is just one aspect. Often enough people only read docs
> when wanting to introduce new functionality, which I consider a fair
> model. Such people will be caught by surprise that the pinning
> behavior does not work the same way anymore.
>=20
That is indeed the case, and we need to think about how to address it,
I agree.

> And again - if someone pins every vCPU to a single pCPU, that last
> such pinning operation will be what takes long term effect. Aiui all
> vCPU-s in the unit will then be pinned to that one pCPU, i.e.
> they'll either all compete for the one pCPU's time, or only one of
> them will ever get scheduled.
>=20
I'm not sure I'm getting this. On an, say, SMT system, with 4 threads
per core, a unit is 4 vCPUs and a pCPU is 4 threads.

If we pin all the 4 vCPUs of a unit to one 4 thread pCPU, each vCPU
will get a thread.

Isn't it so?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-gchDcV/dNJPR6argyMl0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0bFBoACgkQFkJ4iaW4
c+4H5w/9EZHl/iagc8bFp4r1mD9eMs0XCrLBHHmBut1UOXVxnaEAAQtS7KwQBYN+
EpsSUu22RXt+g9YFo3uOmXVcFq4peyVoOTU/AC74q9+KGO1PLoUtDd3hvHgW1Nce
3jzTRqQFAX+C1DvIKevk+oovuR3JS9GBqwja+Q1hvp5Cvhk4jkIT3Oi1xs9k32nj
8h9ATh5rRInuDGfpEFLH2Z8KdhyvuEEHg9eiSYw3LeUSKiTQz5jUzYScK3X5sl/b
HTlI2ELSXYwQUBVVkUgm7NpILI3HYEAyXl4bC6aFboaS2jiwB8WtMotwIlQazlFJ
jUp0nvixigRC0kFMbWS4jExtYgQYhKezsMcQ3C9uRulgRYSUtM2Yw3el7NZfzulu
EG1EnfA7LvQPvqX3wenA5L8OoYx1FaCs2h94fM9RmoPmb1chuSfRrSGlo3QoRWs2
EAQllOVct1augZUgQpg26aCMm42jmDuP9NKbruoW8SX6BtAQdRZZcnzmHDoRDsFM
pdig50NpLxqzz2SlrJYRcicOVe3Oknmotgu0C54VFo8f86HVMvqJMAcuF12TCdE9
yjWgFr4VcywzgjthMF12KuaJZKWlZDFyIHxgh/EFfuwX66h3L8rXOc2d0OA1iFQv
2rmc4YYfgnn8m98pxMhcHmxq2KMsSnLMSRjGk/N12/qLPrb14LA=
=L5KX
-----END PGP SIGNATURE-----

--=-gchDcV/dNJPR6argyMl0--


--===============1302345412945206991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1302345412945206991==--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98226C1C09
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 09:26:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEq2e-0005V7-5L; Mon, 30 Sep 2019 07:24:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V+AX=XZ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iEq2d-0005V2-6h
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 07:24:19 +0000
X-Inumbo-ID: 450942fc-e353-11e9-96c9-12813bfff9fa
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by localhost (Halon) with ESMTPS
 id 450942fc-e353-11e9-96c9-12813bfff9fa;
 Mon, 30 Sep 2019 07:24:17 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 30 Sep 2019 07:23:11 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 30 Sep 2019 07:22:22 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 30 Sep 2019 07:22:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2Kn22y3HHz2OLdnE30Iu+r1RACHTq0J2A8u0NE8EL3TKcRMr4lQ/gxx6whUF3KidQqq0m8Okd6z9Zn1BEc30B8NeG6KD+VzWzzbLxZJl32BCDRBfGaJmzGfHrap+BFiqMfuAwkJW7M/IRe5X3dAieGEQw7Ovb3IYSnK6MKiuxCKovqgYsmDjQx6k7g0i73jjcBX2jswXOF/V+aAdQDM7ShjVT+r4xZilwR/dSI7WoLxFcbanAdwgZaD94Cf6qHhv0AVDXWHLrqIXpTmRUI13jPhyI0Bg0aCDZWR17M6ZWVlMPWpa6zFXZo5G1t8Qu7bZCNyjW4TliRiYeQ0kK2ZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBfBg1B/qWZaW/y1kTEdDQ2mPGubhHxrrBRE4up3MPw=;
 b=ezd5Bdd6+zcBadrLnAm+JgRyPIeQ66jTz6zVYkT5vZ3OIKzRIPvwmtT4BjqqK6WpmMLpBusi7VubltSnLWTOqERHVSd+aFft61g1V2j+NRCZXFgRqpKlf3YWQOu/oR5CzuanfGpuO3y9uPqlO/KpkH8EeIo1PoWOigIpGRzCQGFkAHy/xqPZrBkYZdmJv85pE8RkfuVwl4nk8hlabX9qM/eZH6MxGv6QrHMFnEb08el5da2ALQMIu6dgeCdHwC5LKzFeRQUr93K3no27BG97/n/6UasS7vnnxyTCo0woDT/4BCCtbE8AlMPtduu6YcP+lsSfRvni53luGW0pn+phHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2901.namprd18.prod.outlook.com (20.179.59.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 07:22:15 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::24f0:71e8:38d1:4d8d%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 07:22:15 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v5 02/19] xen/sched: introduce
 unit_runnable_state()
Thread-Index: AQHVd070RdX8FPw9T06Hz9NODDKgC6dD0PGA
Date: Mon, 30 Sep 2019 07:22:15 +0000
Message-ID: <9d37bec460de8013920e6ae8a684921fa44d1e21.camel@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-3-jgross@suse.com>
In-Reply-To: <20190930052135.11257-3-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbd9eafd-1b7f-4617-f6ac-08d74576eb91
x-ms-traffictypediagnostic: BYAPR18MB2901:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB290105AEA89823391FA0D3DEC5820@BYAPR18MB2901.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(189003)(199004)(66066001)(11346002)(305945005)(486006)(476003)(14454004)(6116002)(2906002)(5660300002)(3846002)(36756003)(71200400001)(118296001)(71190400001)(76176011)(6436002)(8936002)(102836004)(2501003)(4326008)(6246003)(81166006)(81156014)(76116006)(91956017)(6512007)(7416002)(6306002)(6486002)(6506007)(478600001)(2616005)(66616009)(66476007)(66446008)(66946007)(966005)(26005)(229853002)(25786009)(7736002)(8676002)(446003)(99286004)(186003)(316002)(54906003)(256004)(110136005)(66556008)(99936001)(64756008)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2901;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ZGwWuM/OrqMgM2Fl2lDnhBymkhCshHWtX42mwrZcwKo421c6ycb+AJQRgeFcimPVuB/3P9x5kId7bPn0+GLmsZeSAMjhwbWIDDM/90EfPt9Ms3FGk8vp8qsxj0H+tN+Ge2zC8mOLQBydwyRoLr501iAbA12R/Jgpa9GI4TlrXTGO1aVbpoKHLMtjZktJc/wBN15TQisfDIQ2nfx4D40xD/te7N7VfIQAjh7BjFzJzCG9sB61kB+tdZUTusX6wzx7am1oBj+A46rhxmR6o79h6pyv0H/9DcXAXuIflHfB1A+vWBXAxs7yJ3Nqkc9O5gy0RV3Bv2ZDtLDbVAaMXu2ItXs7dwDyiKFxqcEA/lb3kPPzIp3OHSREj6WFzZ8huVcyZabMavgI0GkcVaneVsWQCb06v+xBkdgLVWepS4dnps=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd9eafd-1b7f-4617-f6ac-08d74576eb91
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 07:22:15.4704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cEM37A42ZjGhqBdQUkNFN/+plmKRQEJhip4GkBKrUxK0ZcMK0DAbGRPmWdOf/mXxQVGvJltiEZnjt5wBa9K+xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2901
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5 02/19] xen/sched: introduce
 unit_runnable_state()
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
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============3434374925030142350=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3434374925030142350==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-1lYw+lhvTTRDmKZD6pBu"

--=-1lYw+lhvTTRDmKZD6pBu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-30 at 07:21 +0200, Juergen Gross wrote:
> Today the vcpu runstate of a new scheduled vcpu is always set to
> "running" even if at that time vcpu_runnable() is already returning
> false due to a race (e.g. with pausing the vcpu).
>=20
> With core scheduling this can no longer work as not all vcpus of a
> schedule unit have to be "running" when being scheduled. So the
> vcpu's
> new runstate has to be selected at the same time as the runnability
> of
> the related schedule unit is probed.
>=20
> For this purpose introduce a new helper unit_runnable_state() which
> will save the new runstate of all tested vcpus in a new field of the
> vcpu struct.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> RFC V2:
> - new patch
> V3:
> - add vcpu loop to unit_runnable_state() right now instead of doing
>   so in next patch (Jan Beulich, Dario Faggioli)
> - make new_state unsigned int (Jan Beulich)
> V4:
> - add comment explaining unit_runnable_state() (Jan Beulich)
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-1lYw+lhvTTRDmKZD6pBu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2RrSUACgkQFkJ4iaW4
c+6dHRAA0NWLBJBB3oli0YZnyBJZ3/SoutdmUwh5JI0grlPVP1PCDGGTMzWYVpDw
Dh6Exj2EO6m/eiMIZKkKtwn0bRX7L3WhzEZkdlqGZ2jlcWVRvfuB1TeCKBBsO0nY
drveG4j+XIF2vi8UgUfqVH813E3AuB4ISOqpS4AvlmMRFu3KySkkoR8CpbaG0egZ
qYI7i3Vk8rr1XrDRaHfM41haXp2E+w3rBDpT4cEcobGsyplFpFNMqJ3laOJnJTUo
smfWHZQ4TFIBlyQLJWaNWmBcy/+co9DLEEA07Cbbl5Pi4y5oL2hvQF/QKUIQntGz
6OZqJUv8U7rCCCBPKxS9SHS6L+xAU/FZzxzUmuoel93C+O6nnz1+UwlOu32ZmN05
70euxDXrdeZBEU1IjxXTU7pO3BisFj/1bQgxd4zgjXOOV6tRbYQ1wk+hUNAWwgqn
9yZVK8BMLOIA/JgdXk0KafwIyuvgjDYWf0oqVAs7l0cYZxD05euNx45YskryW5zg
xzDRskxdojDnAteF6Ogds95vYY9Poa5R1VXj2DvN8OpNQq6q0ZWfOajD9GCI9usu
0ZxlREY41qBtZRztzEiWUWKHrchVEB6tSRM3Z8FNmJNZEmCBKvoevDb/Rg/aOrcN
+fNYnwnX9Q13DpzWEXN1a9phuW2IX/CA4LsseUBNM5rfXNHSB2w=
=bkIp
-----END PGP SIGNATURE-----

--=-1lYw+lhvTTRDmKZD6pBu--


--===============3434374925030142350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3434374925030142350==--


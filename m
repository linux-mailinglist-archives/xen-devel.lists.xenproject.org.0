Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790B46E9E4
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 19:14:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoWPJ-00075x-PI; Fri, 19 Jul 2019 17:10:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7nr=VQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoWPI-00075s-8N
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 17:10:56 +0000
X-Inumbo-ID: 22218ac4-aa48-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 22218ac4-aa48-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 17:10:54 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 17:10:42 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 17:10:37 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 17:10:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/8GkLut6Xq0X3WVmLHsiFijGwie1XvYRtj21MAVN2bkGrlbS55W6qvWYp637sQcG7DBs8tWvSdgqaI7ECBmzD9bbOsf5lLxFYkH96S+AXb5LdUWHZYOeTLpgZ3NIQmizHVXhRWQPzOiv5AbklIuAtq5oJMoMatSGcJRQ4tl1Ic/FpWiN9jmF6H5+x9FfQL8JsA6Rr4d8ZvwsxZkIpeVMwM29QBfzpqAOCjlPET9K54SsWH4WnkGkacqaljHmmOtX5OBBmBKjK8lDl7SdZ86oxsYN/dW3AIfcNv8hAEC8qhTFi6JR6WQ/Z8Z5k4bubWQqO9aYdAu1Da6yGmajefC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAbnYhZ7/TcDGbNAXyn8/ZH6+cuttk1Yepw50PyNZQA=;
 b=cYID73PTpUOVAUqBPbKrMeT7AJUlhXq3pleHfWHJrajI1Zs7SLt++9/9it0eAhtItlJbLcYA5l06kPUI+QievA7x+SXzUZxTBbZxBARJ30n0+z5/aLiSJ8j+f7XK3W/tKQWRoHRb8iwoitHuO2nhXV1BgJoE9LFrg1qJGbniYFWz2mlFvcvRKH2xJ9zGnOZC1OU9i2nJhtU/dq6JlvJEThzinSgr5HZFYoJiJEVaSltt7Z7zvlYjIn3PqHetKERWx2tJ7cV0xsL9RZga/w92Q4eiaEJ40k4Uoe+KwjWjk6hHQnjSHJ5CFctE0/kFqluFMq9mrzoNTa2k1LaxovZuXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1354.namprd18.prod.outlook.com (10.175.223.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 17:10:36 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 17:10:36 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 06/60] xen/sched: move per-vcpu scheduler
 private data pointer to sched_unit
Thread-Index: AQHVPbuGcK2cLHKhs06MDcLPQ3t5r6bRY0VzgADLA4A=
Date: Fri, 19 Jul 2019 17:10:35 +0000
Message-ID: <a672d87d2d9769736f8bed63147541d2d81b91d4.camel@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-7-jgross@suse.com>
 <577676c68cd9ab1019f7bcfe9c746641d838b6dc.camel@suse.com>
 <3ae3c4bb-6fce-0e3b-4a3f-73c64d0917ae@suse.com>
In-Reply-To: <3ae3c4bb-6fce-0e3b-4a3f-73c64d0917ae@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c56ad1f0-d8ab-41be-9f2b-08d70c6c040d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1354; 
x-ms-traffictypediagnostic: DM5PR18MB1354:
x-microsoft-antispam-prvs: <DM5PR18MB135477C55D54A598D4307FB5C5CB0@DM5PR18MB1354.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(189003)(199004)(54534003)(52314003)(66946007)(71190400001)(71200400001)(5660300002)(66616009)(7416002)(53366004)(66446008)(66556008)(25786009)(4326008)(64756008)(66476007)(91956017)(966005)(76116006)(53376002)(8936002)(36756003)(68736007)(478600001)(66066001)(486006)(14454004)(14444005)(8676002)(316002)(11346002)(86362001)(6306002)(2501003)(99286004)(53546011)(2616005)(186003)(53936002)(81166006)(118296001)(6246003)(81156014)(305945005)(6506007)(7736002)(229853002)(3846002)(110136005)(54906003)(6512007)(99936001)(76176011)(6116002)(102836004)(446003)(2906002)(26005)(256004)(6436002)(476003)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1354;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5Qxco6MCaEpe7iJPQisw9na3zxlxiqewRqu2AdIpjwEj0WtzCAqnq+GpFszgcZXCTqgGt4JXcEoVZEo2mYrQW+KsI4/QPy5eZ/WmU7AHJapN83QSHH8+MRwskrLAspTpa3+7C+tiEEg75AsfL17Hu8mCUJ4VLtzC1vyd3YbzY4bCK6iw4rpiP3fVgt9kYT7B0V0dCuXloxoe1Vciri+xvdgQS26EULXRj8rwhmtKB73nYFUvtq6H+mGHtzETl1Szj2gOwmAen5RaGOc4l3csxfEFyEK7odnACk6/c2sT1Zi37TsioSYW2u5uUD8DjXu9n0Nc/FI57IJCgxauY0UWR33ZvQ9rLvhrh/nbbSxOfl6h0BpVHbBSazbkLK21nvDFeJNnxROkjVxENHJu1QsRHOguIF8WwNCaAuEBCvSzekY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c56ad1f0-d8ab-41be-9f2b-08d70c6c040d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 17:10:35.8926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1354
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 06/60] xen/sched: move per-vcpu scheduler
 private data pointer to sched_unit
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============3234272397882147557=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3234272397882147557==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-HyZAolOIDw8tLEa1/8Io"

--=-HyZAolOIDw8tLEa1/8Io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-07-19 at 07:03 +0200, Juergen Gross wrote:
> On 19.07.19 00:52, Dario Faggioli wrote:
> > On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> > > This prepares making the different schedulers vcpu agnostic.
>
> > But shouldn't then the struct be called csched2_unit, and cited
> > functions be called csched2_alloc_udata() and csched2_unit()?
> > Now, I know that these transformation happen later in the series.
> > And, this time, I'm not asking to consolidate the patches.
> >=20
> > However:
> > - can the changelog of this patch be a little more explicit, not
> > only
> >    informing that this is a preparatory patch, but also explaining
> >    briefly the temporary inconcistency
>=20
> Sure.
>=20
Ok, thanks.

> > - could the patches that deal with this be grouped together, so
> > that
> >    they are close to each other in the series [...]
>=20
> There are some patches which could be reordered, but I'm not sure the
> needed work is worth it. By moving the patches you named closer to
> each
> other there will be other closely related patches ripped apart from
> each other.
>
Yes, I appreciate that.
>=20
> In the end it will make no sense to apply only some patches of the
> main
> series. The huge amount of patches is meant only to make review
> easier.
>
And yet, this happens some times, especially for big series, and was
exactly what I was thinking to when making this comment.

Anyway, let's go with an updated changelog for now... And I'll build a
better and more solid opinion after having looked at the rest of the
series.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-HyZAolOIDw8tLEa1/8Io
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0x+YoACgkQFkJ4iaW4
c+4qUxAAnNzhepgmO/Di4HUpfRe5i7nsKoPwzypLnfSU3pjKEbwJtYKHco6NjpH/
x4TLIiPvP018JDE86rTLXk8xTpusKZoPDmTa3yNSv1l7o+rw0u06ddKsrikyqWCN
mv/nTgDZFIAFxn1HWmYF8jA2MbKo6kl9MyfG1TPhioBOYmHHJsimk2VcPUOyb8wL
lVVSUsZoViiY6nx1xtnxoZElSzASIkVWX4CnLRhmVuKklmRydQnREPOwjtHoCXrc
33Xg9chCf54zt5K5ospnXTyj/71/qqjE1/0Islr9BlVygdLtJ3+gzn1Ce60/OhsB
edEKcb0qWJ16I0kQizazaQUCvEnlp40kwoVl3WJU7CYa1h6ZGH57KZXmUIwoTfwL
hL7yIMf7GQZvJG6CySksRsco+ffvG+mRRqdbtJq21qFpEZc3ZcDDCS/tPyxdyaI0
cVrjgp4gQv/I0WDqgZWsDAz+3Js2pM1V1z65z5EWVhuXqyzm/gBYn9rxnCW7poHP
FEbsQm1oG98wZwJX3dfn8pa9kHAAft9WztxFxDb1FMGjzN6D7oTifOa8Lk9u7+Rc
q/sihLrJqdce6Ts/WFUTQVnrkI3/+XTDz4ZNc38TfCFMCNwZTewcjnX9kAanBGU2
FiS9vntqO4q7X5QpncVH+BORKmf+VDRQtgFTQ42u/75kKwfn9u0=
=da83
-----END PGP SIGNATURE-----

--=-HyZAolOIDw8tLEa1/8Io--


--===============3234272397882147557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3234272397882147557==--


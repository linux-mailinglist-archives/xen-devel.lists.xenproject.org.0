Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435C6A6D7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 12:56:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnL58-0001uy-QG; Tue, 16 Jul 2019 10:53:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=twXG=VN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hnL58-0001ut-5e
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 10:53:14 +0000
X-Inumbo-ID: e5d778c0-a7b7-11e9-b4f0-5fb391c8d307
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5d778c0-a7b7-11e9-b4f0-5fb391c8d307;
 Tue, 16 Jul 2019 10:53:12 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 10:53:10 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 10:50:39 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 10:50:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foKIufQAOKanVXnh+DV9iVakcdgQrkSj/RpP2tvXbMk3+SD3fzc3LuVIr49cnDJv/W4UrraCG1XzQO6KwoumFjrhmc2fxwvPX5k7SXQaA6bLci0iFnOC2bnKFHxuwn5QhBvj6hgblOF4f9+qXQa6GlmP3l/u9MfJzKtxBki0LfiHbs/CwEWXoHr3rnC/LL3Hf34r5VHstQm8tsC+hmo/sQ2uM0eDt3T92tcHMaZJMzWXsF3ZLQw+UGfZmSUNxlmbxu/wSmZZXJLtn9fLFCgp0rQYJ7QXkczVd604lzzoCAqhFI7PQMd4wvskRGEDkHZBqT5Q9NS4SeTM3vyDZJBYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtBywd5QpjfSRunJtUTreIoDedDvEd73z7vgWRcuvrk=;
 b=jKGFib0l4D04Op1M5b3J5kUPpcnttTiAmtBxDtvXyeiVBBGJgOtC6kd69AT+ASBvwb+jGqoxl0pZnci6ZDjvNJtl/qb2n5p5XSQpQEWnWqf/NEc7jVuwOFaQgTyjaDtdl4w9ha3+6l39ZTxR5LspTbB+RgHrFbOKKs5jckXhbZssBiqYrusPLezRYpq5MfyyvuO6uRPaD2d5PwV+vD73bq3l+9Opko0Vb/RReBR4RgdNsaPf2Jn/MU2vrFD5M79GopL72c6bn3SjWpcTF6phcBrQVJ9xDGAcpB957F51QOUUNEzyTmLbt3gHUwRBHpubmsn+Hysl+dxvZmNOUs3ZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1499.namprd18.prod.outlook.com (10.175.220.20) by
 DM5PR18MB1675.namprd18.prod.outlook.com (10.175.224.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 10:50:36 +0000
Received: from DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807]) by DM5PR18MB1499.namprd18.prod.outlook.com
 ([fe80::d409:6406:c7a4:b807%2]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 10:50:36 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v1 2/5] xen: sched: null: don't assign down
 vcpus to pcpus
Thread-Index: AQHVOydXzSui4XMVAEeMf8BdnFoTaabNEkcA
Date: Tue, 16 Jul 2019 10:50:36 +0000
Message-ID: <c3661d2275abe2f34066ec334b2154d6a0339840.camel@suse.com>
References: <153515586506.7407.8908626058440527641.stgit@Palanthas.fritz.box>
 <153515650541.7407.13469781440827661968.stgit@Palanthas.fritz.box>
 <54fc671f-0527-e29b-e9ec-634e42c8594d@citrix.com>
In-Reply-To: <54fc671f-0527-e29b-e9ec-634e42c8594d@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d76b0b4c-2c73-4c35-cb15-08d709db6f81
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR18MB1675; 
x-ms-traffictypediagnostic: DM5PR18MB1675:
x-microsoft-antispam-prvs: <DM5PR18MB1675A630CCF5CC857BD6148DC5CE0@DM5PR18MB1675.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(199004)(54534003)(189003)(476003)(2906002)(6486002)(446003)(966005)(14454004)(76116006)(53936002)(229853002)(25786009)(66476007)(66556008)(64756008)(66446008)(66946007)(66616009)(4326008)(99936001)(91956017)(81166006)(81156014)(5660300002)(11346002)(6506007)(2616005)(2501003)(118296001)(7736002)(316002)(68736007)(6306002)(26005)(66066001)(186003)(8676002)(53366004)(8936002)(6512007)(6116002)(6246003)(110136005)(305945005)(54906003)(71190400001)(71200400001)(478600001)(102836004)(486006)(6436002)(36756003)(99286004)(53546011)(76176011)(53376002)(86362001)(256004)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1675;
 H:DM5PR18MB1499.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ChufQFs5wT0kAd+2x4C27YYH6Ja3gE8F2n5sq4hC4gDWq1IKeD8JT7gLFsBv83+ah2ZRCfwsmlSuBHd0TWBHhGvtB/KbEcrP9iS+GhNwkogoSoIOI8oWDFF2OCIk9vj/EZ7qu0tdDYWrTnqoPU40c/fbPON4z13Y2c8xVc/iDWi2a2OeQKiughMQ0Sjy0tZ8MbipnnDcKT/ZC139GSQI5QvOeUalgKGgGX2BhhOhz1Bq8QKBNNwZPa+OWa2wOAQJnC+UrPzzF2oSN1SIoYqcdxtYujPPWOVX9nKyyuk+JLIQ6X7vEkq1u8i5vqejjAzGHLU5J719Tm1lXoPLPbz2URFlqCuogjvPQ7fIXOG8PI39lKhAuuT/Q8NWvKvxO5poKGpiTsn4srKwCJIlyHF7/v+pBcV4Hj4g0Pvnr4l765I=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d76b0b4c-2c73-4c35-cb15-08d709db6f81
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 10:50:36.7167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfaggioli@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1675
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v1 2/5] xen: sched: null: don't assign down
 vcpus to pcpus
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
Content-Type: multipart/mixed; boundary="===============8943441381172564341=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8943441381172564341==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-vsO4rdnhKPsbkeNWJ7Sw"

--=-vsO4rdnhKPsbkeNWJ7Sw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-07-15 at 17:06 +0100, George Dunlap wrote:
> On 8/25/18 1:21 AM, Dario Faggioli wrote:
> > If a pCPU has been/is being offlined, we don't want it to be
> > neither
> > assigned to any pCPU, nor in the wait list.
>=20
> I take it the first `pCPU` should be `vCPU`?
>=20
Indeed. :-)

> Also, English grammar agreement is funny: `neither` needs to agree
> with
> `nor`, but the two do *not* agree with the original verb.  That is,
> the
> sentence should say:
>=20
> "...we want it to be neither assigned to pCPU, nor in the wait list".
>=20
Yep, now that I see it, this rings a bell back from my high-school
English class! :-O

Sorry... and thanks. :-)

> Both here and in the comment.
>
And in patch 3 changelog too, I'm afraid. :-P

> The other thing is, from a "developmental purity" point of view, I
> think
> this series technically has a regression in the middle: cpu offline /
> online stops working between patch 2 and patch 4.  But I'm inclined
> in
> this case not to worry too much. :-)
>=20
Well, the point is that offlining/onlining does not work before this
series. System does not crash, but behavior is wrong, as offline vCPUs
stay assigned to pCPUs (keeping them idle) while online vCPUs are
"trapped" in the wait list, which is wrong.

So that's why I don't think there's much value in being consistent with
such behavior throughout the series... which I guess is why you said
you "won't worry too much in this case" ?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-vsO4rdnhKPsbkeNWJ7Sw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0tq/oACgkQFkJ4iaW4
c+7i1A//VMOyFqMJoLggJyumxCVhSkDYSFCOeTscsakDNcLN2RZ7EgTHWqAcH0Pf
hOnxloi+lLVLxbtaADcoSDy+Y6wyyTh0KLWlifkcWzS7F7m4rdoJXE4nWeLe7Im7
m2peDloHFolZFC5UlyWu3FmrJmW2kpghTfnvNkj//X8jPv6lzhstHLWieTCu46c4
cNVc5IFC6l+NVwSi1JGEma9g6fsL9ZmwvfqWuR34m2UIns0gVOSNeVU8DgvHOAuY
oIe3dlger+V1dV1E9Zn6mE57P8cvowQLD6ZuOnKEtxkB5GqbVpVsIMWFl6U8LeW5
4VTKZCt1PBk/4vSlEODiYE72OqRUeuCASlTnvHgBUPhWn/oCujEWX9SvABeLdvz0
CYk0o1QPzElLvcuqUq6OD0fgOP3A4pAvGYKJgjAbK9pyNELMgpDQ4iH+i8Yy3pv0
/vvG+xTtJS8PO+y87pgeXqWFU8v33qM5wo9LFMCjTColAtOSLIjEVOlUr+w2iqG6
A3oHpZGJ4VITgGCytKkCZeYVk9ECbQqkTz2aHK0ScMRlotKy8sEHVPaz5jMG6Y+v
A5oxyatExOu1+uW28EF8fS2A0beBnO9aI1PoQAC7p28czBxeYGfAOqQqDe3y8LMQ
uAJ7l+8VGpP/KEAhEr77hU4emSCZnQpxL4YwMXSsigGkQSC+ga8=
=gbsK
-----END PGP SIGNATURE-----

--=-vsO4rdnhKPsbkeNWJ7Sw--


--===============8943441381172564341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8943441381172564341==--


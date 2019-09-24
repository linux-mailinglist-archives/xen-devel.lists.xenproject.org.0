Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D319BD06E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:16:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoNt-0002HW-Lf; Tue, 24 Sep 2019 17:13:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCa0=XT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iCoNs-0002HQ-Jl
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:13:52 +0000
X-Inumbo-ID: a87f5c91-deee-11e9-9625-12813bfff9fa
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by localhost (Halon) with ESMTPS
 id a87f5c91-deee-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 17:13:52 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 24 Sep 2019 17:13:07 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 24 Sep 2019 17:07:11 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 24 Sep 2019 17:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBqBELkt+NnLDJ0oOPkRJMCFXMP8VSSoH8DiQNwbSkFXCS5V3kUZo63ie+ly6QdOkkfU8B0piam5HMlrUSJF5rW53kDRq2POJUB0VaKy5BWqQWh2v13oZhAR6PDP87ITsk2atcUXKVomodPCaAwpdzjJon6A4zsocCyq4N+UDtJNw/0souCw7pIGXTTcKQvTBguhehKXf66heIz7+Wg01lPh0s8tMg1QaMIhNDDZ8apKxO6rkGBMlU1B7WT9/J9v7dKGzItIe7QsEM74iFQncvkSMS5kzP8ehi0Jh94B98uKjshhH8UL90QOusts0HXKGHo9DO40majgbBRX4LxpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxWahxxanrEX1KGaPFhxD5h/pOHyQCKS3xiH8l7nyyg=;
 b=IahA/B4NLmh3JvLxYa8/mYvpaZwMVyNJe0/YuizuPdElN/DNIbIFsOnFXnIKn4MkEv6jiToy/Chb5Ujc2rm0eYaB3egW5k49JYgeTnbt+Hhu9TvkgH9mCFnfVqg03FOa33m1nlvzFFcbqENHIdcqk5rdOZtfUww6cl6+68zQD9LERSmzg3J4CsE4zqe1JJlzCDFmXqm0jGIleoNePksE5udCLEnBNzpYF7nOcHZkaeBHfzizpkJkHlqSU7TZ0Wx3eTUswlP5BRQBw2FDzoyMNNI2/ZLW5pTqkpA5jNG5KxHhbw8Jmip+nS63O21oB/mO5IjsF3jVOwmDUUEg5J2MCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BYAPR18MB2613.namprd18.prod.outlook.com (20.179.94.142) by
 BYAPR18MB2534.namprd18.prod.outlook.com (20.179.93.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Tue, 24 Sep 2019 17:07:04 +0000
Received: from BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::cd55:47c:9431:f7a8]) by BYAPR18MB2613.namprd18.prod.outlook.com
 ([fe80::cd55:47c:9431:f7a8%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 17:07:04 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, Jan Beulich <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v3 07/47] xen/sched: move per cpu scheduler
 private data into struct sched_resource
Thread-Index: AQHVatnbGS2FGNyAyU6AEPubfzKF1qczJ+qAgAecYwCAAAeMgIAAMs8AgAAgmIA=
Date: Tue, 24 Sep 2019 17:07:04 +0000
Message-ID: <7f9047e94624e7c4c5a8a9449669a5295297c0fd.camel@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-8-jgross@suse.com>
 <19409170-4a99-e336-dae3-b439db509111@suse.com>
 <6e7b8475-bd13-94fc-2715-1d8b4f510eb4@suse.com>
 <630b1a32-20a5-e2c2-8dd9-60504f8fc6f2@suse.com>
 <d4e599cd-8443-5652-84dc-4440c16fa93b@suse.com>
In-Reply-To: <d4e599cd-8443-5652-84dc-4440c16fa93b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dfaggioli@suse.com; 
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a8e1352-445c-4fc6-5c37-08d741119fa5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:BYAPR18MB2534; 
x-ms-traffictypediagnostic: BYAPR18MB2534:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR18MB253439D169B090DCAFF16A45C5840@BYAPR18MB2534.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(189003)(199004)(76176011)(91956017)(14454004)(99286004)(99936001)(118296001)(66556008)(446003)(486006)(71190400001)(36756003)(966005)(6636002)(76116006)(66946007)(8676002)(6506007)(11346002)(6486002)(256004)(25786009)(7416002)(71200400001)(6306002)(81166006)(81156014)(7736002)(5660300002)(4326008)(66616009)(86362001)(476003)(6436002)(66446008)(6246003)(316002)(64756008)(66066001)(478600001)(54906003)(2616005)(66476007)(8936002)(26005)(6116002)(3846002)(2906002)(102836004)(229853002)(110136005)(6512007)(186003)(53546011)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR18MB2534;
 H:BYAPR18MB2613.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rj81KPANZmY7T8avAXCStp5aDmcAxd0BPOTP5lNSsTNCxXnsY5W4hiGL3oqJmsfGcNTmTS7SWYvxseqfN9kcdz1fj98/YmWmfbBKOBtsEpef+tWM3w2lda34Xt7cANe6TsWbut3DwjT0sqrxmCk16LdilvA4SutkKorA06UCXEMPbRWMQUlK0rOaGyw5tOsihSfe0s985TU2omQoSqizHtfL+pgkwvgZFA4q3NY4pUe/CuFWCcmKs1T7Xupf9uRrSlV8VzrgMy3B50VT3CQx0SYbZBqbKspnPaaBNRA7Sqeoz+OLhH5SlCv6C56a9tq0mVtKWwGgunYu/LsiAJk0xy4ohvX9YwSrq/qJIJChbjFxfE0v1o4WjFp5dARYsTSSmbJ3m7BgED9kAYCMCNoosEAX8XxnAlCoNuGIiI0mUpc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8e1352-445c-4fc6-5c37-08d741119fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 17:07:04.1220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LKe3mx9LqxRI59+HFbQdby2fub9wzt/C93+913MexDkjfqZu2HighKT55CSIr0Sgld3Ij6wfznvU5gAfjv0AnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2534
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 07/47] xen/sched: move per cpu scheduler
 private data into struct sched_resource
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
 "tim@xen.org" <tim@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "robert.vanvossen@dornerworks.com" <robert.vanvossen@dornerworks.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "josh.whitehead@dornerworks.com" <josh.whitehead@dornerworks.com>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============1482114185211741725=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1482114185211741725==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-WnHE6l11g4lUiCadIMFM"

--=-WnHE6l11g4lUiCadIMFM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-09-24 at 17:10 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 24.09.19 14:08, Jan Beulich wrote:
> > On 24.09.2019 13:41, J=C3=BCrgen Gro=C3=9F  wrote:
> > > Regarding to rename "sd" to "sr": I agree this would be a
> > > sensible
> > > change. OTOH I'd like to be consistent, so I'd like to defer that
> > > to
> > > the planned scheduling cleanup series.
> >=20
> > Seeing another introduction of "sd" in as late as patch 37, I
> > really
> > wonder if this approach (and the resulting extra code churn) is
> > indeed better than naming at least new variable instances properly
> > right away.
>=20
> Okay with me. What do scheduler maintainers think?
>=20
I do prefer 'sr'. As to whether this happens right now, but only for
new variables, or all at once in a followup series, either approach is
fine for me.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-WnHE6l11g4lUiCadIMFM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2KTTMACgkQFkJ4iaW4
c+4R9A//a/C2g3ZX4D4gTy8rMQ8lEjxWqi+HpEr9vQ7WIEXuKeK0sy/5lyueQt07
HoHK86Bq3pV30C0I+PCMDZcv193qPMrnifPaAiy8zyxrp69Ch+iQoD3GuO+KBSnz
GcOCtWgqROUGqpDnOif0qHNZVLwZ87FW3Q13vLth9AUKFVo8FC7Gj6GVUDxZpzIy
8tDB8iLrTqLu9EcBpv7qQRdggjmgVW9n+k5rF3aV9p08QrPpwmm7zPLSqsWjkuUA
OckBajymgVSHhXVUFzpUJWQIzGik4+D4LmRH7QuZjIG7+9TL+RnAi3nDqrCZTuXb
M0tcpTuP7dm1xsKUqkqFmtlPIc6lBnvSDNLw8ZO2fHqvH+6KxilbH6ROp3mkdFv7
AvOFjC06BDyXqlhuV0Ly+mO2zz/aump2gdRji0mgl2IKB2ATa7Xemf0UcAQ+XmX7
IwMdmFFn/vpnjLsxT4W/pbGDzL4G37S6wchRfndrkWJ+Tbw28q5oDtU2Lt+ojT5I
865BzF/JGKSXSb9V6IVzc5nsMIXy77JBRuzHSU4zibWBA0kBpbP2S1qHx1BsoiIL
AdQVqb2gVz/PUAhb8VqYIZPIGfRjjaP+LKvXuIsI3HrkapbdgupNh1RafIeez+BQ
cYk60CEE85MlC1F0BsPlzMMwVQWkPxDkVcvIsU9dpmKXQitxET8=
=G6fl
-----END PGP SIGNATURE-----

--=-WnHE6l11g4lUiCadIMFM--


--===============1482114185211741725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1482114185211741725==--


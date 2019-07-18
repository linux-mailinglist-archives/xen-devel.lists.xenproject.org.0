Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DDA6D0EE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:20:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho8AT-0002qX-2c; Thu, 18 Jul 2019 15:18:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho8AR-0002qQ-Vk
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:18:00 +0000
X-Inumbo-ID: 31545dcf-a96f-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 31545dcf-a96f-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 15:17:59 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 15:17:46 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 15:17:30 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 15:17:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N99+ZxgM+tDrH01xoSQeeUbTDVpvZLB3OT4Y7ralhaD/+HPIHh7THgX4QwKZYi/1FezSKIvMmE2NoVs6qt1TaSLcXTuXL4tYLTD0c+QO3dGaR2zKPxvdXhmZtbPiFq/fir6zTTXoQOCARV7PLxGIYypg+cZxUeY974mDnU0SzVflxv7kRX2YoUsfvc750Ax1r2Sf7Jis7cTiSmdW4ldQHJJBlqXOzXejzgsc/uoZZmnuNMV9N3SxdlSWVpGOCGvIe2uOXyVxMNJozolE0UrTx5aTj9fzAqavQ1a/ZxfND/Ujq62DPGrsfH7XOEqbD+NKo4Fx2sHhqE8dXylj8W8Q6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKtN4buhnUWAjc/Wquq1cAAwXQqTqd7mOk2z5GmO+Kc=;
 b=jTR0d0eSA4BCa3A4bvCllDUiAdHGpIPdhVwcIZ3l3aVNCMeNS9m7zcOpxTqMXZN3V57ujd4E3CsBw3BX7UcxnyaEgbcNZDK+K6KdEGfu6+I/ATFnz68K4sp1KbX0AcjpdXPi355QJZmJmOdfwNQ0D0hULxQD7ylgkRHjBGY/LU8qoBTC6i5+mGfxDTejNGdoJiPoLA01UwVtTK5eCReUkvl5IUGINV8oqsm3XXqbomWhNwLHDL02Uh2Yh+Yum4i5wHtuxYnieXRPmb2xEnlageZP4+cY8rBaimJ2nCLbR1p9nRRWHvXj5eMslnLa5a4SKfUkL9/O2DDRMcTFqKxuhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3020.namprd18.prod.outlook.com (20.179.107.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 15:17:27 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 15:17:27 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Thread-Topic: [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
Thread-Index: AQHVPW85l6TypzCOPUKKzJbbmldm3qbQfOwA
Date: Thu, 18 Jul 2019 15:17:27 +0000
Message-ID: <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
 <20190717235426.GX1250@mail-itl>
 <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
In-Reply-To: <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::30) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ec8beb5-0c5e-40d9-e2f6-08d70b930b72
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3020; 
x-ms-traffictypediagnostic: DM6PR18MB3020:
x-microsoft-antispam-prvs: <DM6PR18MB302013F4A4036C7C6098D0ABB3C80@DM6PR18MB3020.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(189003)(199004)(316002)(110136005)(54906003)(6246003)(36756003)(26005)(476003)(66066001)(6486002)(2616005)(14454004)(446003)(53546011)(386003)(76176011)(31686004)(6512007)(4744005)(53936002)(6436002)(186003)(102836004)(11346002)(25786009)(52116002)(81166006)(8676002)(81156014)(305945005)(8936002)(99286004)(229853002)(6506007)(68736007)(2906002)(6116002)(3846002)(7416002)(5660300002)(66946007)(478600001)(66446008)(64756008)(66556008)(31696002)(86362001)(4326008)(256004)(14444005)(80792005)(71190400001)(7736002)(71200400001)(486006)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3020;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fdVgK+Q5CZGL/iRe1qIOY7Guqf8ufYEoCoaLIK2zDuz9d/hWJF1iI5c4EvueOblPtEZTcZfZZTieobn5WQ1HQ4jX2WZx1SvTXRcVSW1aQvD6vb7R49rea6NScEGnXtRCLT98nepqKUNXVegd7hXApfgr1VedvrbR8DZ+6wrJ99v7II0TbqRwCOdIgJ4Dic6g270UEEk/70jMIBpYcR3+O5L9qY32XX4MdydYQb/kfoFwRdB2Xh/qcbc8OctPhqs06yK1EUMXv2lZ/E4XZzFRJMZdr9aa0a07SY/9gmZR60Mc0FJuvehZ2iO0+RG5LjchRXI5vTNEDWf8syrtgy3N6Q0rGXrm/idvjuLEy9tMZyPjTRDyTVedBlTBTcPi8jsbesHLFJZSYB1oqjnY9gRguDiE8wDI3TQBf2Co2X2Avi8=
Content-ID: <37B5041CE5120442A491B9BC1299C91C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec8beb5-0c5e-40d9-e2f6-08d70b930b72
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:17:27.8809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3020
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNTo0NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IEluIGZhY3Qg
SSBkb24ndCB0aGluayBJTlR4IHNob3VsZCBiZSBlbmFibGVkIHdoZW4gTVNJKC1YKSBpcyBkaXNh
YmxlZCwNCj4gUUVNVSBhbHJlYWR5IHRyYXBzIHdyaXRlcyB0byB0aGUgY29tbWFuZCByZWdpc3Rl
ciwgYW5kIGl0IHdpbGwgbWFuYWdlDQo+IElOVHggZW5hYmxpbmcvZGlzYWJsaW5nIGJ5IGl0c2Vs
Zi4gSSB0aGluayB0aGUgb25seSBjaGVjayByZXF1aXJlZCBpcw0KPiB0aGF0IE1TSSgtWCkgY2Fu
bm90IGJlIGVuYWJsZWQgaWYgSU5UeCBpcyBhbHNvIGVuYWJsZWQuIEluIHRoZSBzYW1lDQo+IHdh
eSBib3RoIE1TSSBjYXNwYWJpbGl0aWVzIGNhbm5vdCBiZSBlbmFibGVkIHNpbXVsdGFuZW91c2x5
LiBUaGUNCj4gZnVuY3Rpb24gc2hvdWxkIG5vdCBleHBsaWNpdGx5IGRpc2FibGUgYW55IG9mIHRo
ZSBvdGhlciBjYXBhYmlsaXRpZXMsDQo+IGFuZCBqdXN0IHJldHVybiAtRUJVU1kgaWYgdGhlIGNh
bGxlciBhdHRlbXB0cyBmb3IgZXhhbXBsZSB0byBlbmFibGUNCj4gTVNJIHdoaWxlIElOVHggb3Ig
TVNJLVggaXMgZW5hYmxlZC4NCg0KWW91IGRvIHJlYWxpemUgdGhhdCBwY2lfaW50eCgpIG9ubHkg
ZXZlciBnZXRzIGNhbGxlZCBmb3IgWGVuDQppbnRlcm5hbGx5IHVzZWQgaW50ZXJydXB0cywgaS5l
LiBtYWlubHkgdGhlIHNlcmlhbCBjb25zb2xlIG9uZT8NCg0KSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84837FABC
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:34:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXfZ-0001WR-Fr; Fri, 02 Aug 2019 13:32:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htXfY-0001WM-1u
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:32:28 +0000
X-Inumbo-ID: f7106ea3-b529-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f7106ea3-b529-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 13:32:26 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 13:32:24 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 13:29:14 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 13:29:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3dtyFviDqOHJcYTUoSaB/rZvZrv5CG4Pf9ZbKmaBEvRwamsZbgBI5xkDF52CpyTrNLKQvGyxTW2HQqaZ6p8pQeRwCgr6HNZKn3mX28r/MIBQ8tmAxZjGIDnmIlK9uvWMf5KCmcQuS4+/DSN7GNZrAz1nXWgx5BWg3BeKocuKxLWcpwJIFTZxPTGga58WkGxv46sqitcSCoqzvuE2bxvRDXDWIYNQ8FOMYpGoPaLB+Oc2r68TKyMt0LpolWLfBOfudtw/HWUIQz8i1rSARn8nLPgRXYrg7/DSctf/lWizjIHeIcKQ/Q5WuGG05ma1Yj9vzOq2D8LgPOvdcCH887u5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+Tqh4/wgGaa9jkgTHySXY1t2EqufyfBaKtlLe0kHdc=;
 b=Zoiq3V9w4+VrcigQLAId73FeVCnPPQP2LY5sqZnLCaiyVzEvwc5ksTgGK5PBL8yY0yEI0UMawdIEdp8zALi+GTDSNfNPmtgay6eIbmcJieTUhZ+b26AQl3OsNsbcLjvKAMkQntrLK/vGoHLF/OLqDTExpDLb9T46eb2gS5nrHmjUz73tAJXyUr814+pvSmRXh19JUL47DcEVoaayuHehu6bn1luF7wzusZTI8+D++OgMqw9io3HwFRMFpKf8YvJmGmn9GEvAxDrxLOyuah0GsWUMsqWVixovTRPQfRLxX5WwukwdZ3nllNiKEH/n/0IXNlU3wOCOhxYFvX3h656TcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2969.namprd18.prod.outlook.com (20.179.52.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Fri, 2 Aug 2019 13:29:14 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 13:29:14 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 03/16] microcode/intel: extend microcode_update_match()
Thread-Index: AQHVSFKZoSixyJPoX02LB9PmM1B4FKbn2+SA
Date: Fri, 2 Aug 2019 13:29:14 +0000
Message-ID: <86eff704-cf77-ede0-7220-7cab59b65982@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-4-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-4-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0104.eurprd02.prod.outlook.com
 (2603:10a6:208:154::45) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9169bcef-2e8c-44dd-5b75-08d7174d690e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2969; 
x-ms-traffictypediagnostic: DM6PR18MB2969:
x-microsoft-antispam-prvs: <DM6PR18MB29691157EF5C3131B6569901B3D90@DM6PR18MB2969.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(189003)(199004)(6486002)(66446008)(4326008)(14444005)(3846002)(81166006)(8676002)(8936002)(6512007)(256004)(53546011)(6116002)(6246003)(53936002)(386003)(80792005)(66066001)(81156014)(68736007)(316002)(102836004)(99286004)(71200400001)(2906002)(6506007)(2616005)(486006)(11346002)(54906003)(6436002)(186003)(26005)(14454004)(36756003)(229853002)(5660300002)(64756008)(76176011)(52116002)(6916009)(66476007)(478600001)(7736002)(305945005)(66946007)(446003)(25786009)(71190400001)(86362001)(31686004)(31696002)(476003)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2969;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tcfAQhDDVHRPGGt8Uc0hapXjfjKcKeuwwpynHj6y9njcqTj/4IYRi/jNj9qPqsimL2WUFByyNsUvcG81fCqypuXHbVwwY/EuhoT62BOO9jMqatoFLTzJvb/Q2ziQ+2hfKzSZbghifA9Dx6YxiGxQV2l6nHVwnwSYEnBzz4mI0VSU5KZQ7ZB1sQ7DEQbmzKQo1YQTSobc2Sbk8nzUtVp1/uo26bK9zLak5WYP3zqxjSi0l0SDxr35L+vMwOxoe0mfAutThgpn/2QSCicBqfGnsuw33b+fj2VZ7WpIREjAHT71UTd+0/d6vUiuZv54QvaFwU7M2qf09ky6Q0kQGSFZnMLiHiEBZ+Nq/GnQQWDu7GXdvMGmRg+Oe8YufA7XWl0Rr4VPi40TtjYpKAeAAxzFwWJlytP3PDFgEvI0DdBto34=
Content-ID: <03E827BEE2FE8D4DAA896F7690FF92C2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9169bcef-2e8c-44dd-5b75-08d7174d690e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 13:29:14.0132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2969
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 03/16] microcode/intel: extend
 microcode_update_match()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9taWNyb2NvZGVfaW50ZWwuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVs
LmMNCj4gQEAgLTEzNCwxNCArMTM0LDM1IEBAIHN0YXRpYyBpbnQgY29sbGVjdF9jcHVfaW5mbyh1
bnNpZ25lZCBpbnQgY3B1X251bSwgc3RydWN0IGNwdV9zaWduYXR1cmUgKmNzaWcpDQo+ICAgICAg
IHJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbmxpbmUgaW50IG1pY3JvY29kZV91
cGRhdGVfbWF0Y2goDQo+IC0gICAgdW5zaWduZWQgaW50IGNwdV9udW0sIGNvbnN0IHN0cnVjdCBt
aWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIsDQo+IC0gICAgaW50IHNpZywgaW50IHBm
KQ0KPiArc3RhdGljIGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCBtaWNyb2NvZGVfdXBkYXRl
X21hdGNoKA0KPiArICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19o
ZWFkZXIsIHVuc2lnbmVkIGludCBzaWcsDQo+ICsgICAgdW5zaWduZWQgaW50IHBmLCB1bnNpZ25l
ZCBpbnQgcmV2KQ0KPiAgIHsNCj4gLSAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZw
ZXJfY3B1KHVjb2RlX2NwdV9pbmZvLCBjcHVfbnVtKTsNCj4gLQ0KPiAtICAgIHJldHVybiAoc2ln
bWF0Y2goc2lnLCB1Y2ktPmNwdV9zaWcuc2lnLCBwZiwgdWNpLT5jcHVfc2lnLnBmKSAmJg0KPiAt
ICAgICAgICAgICAgKG1jX2hlYWRlci0+cmV2ID4gdWNpLT5jcHVfc2lnLnJldikpOw0KPiArICAg
IGNvbnN0IHN0cnVjdCBleHRlbmRlZF9zaWd0YWJsZSAqZXh0X2hlYWRlcjsNCj4gKyAgICBjb25z
dCBzdHJ1Y3QgZXh0ZW5kZWRfc2lnbmF0dXJlICpleHRfc2lnOw0KPiArICAgIHVuc2lnbmVkIGxv
bmcgZGF0YV9zaXplID0gZ2V0X2RhdGFzaXplKG1jX2hlYWRlcik7DQo+ICsgICAgdW5zaWduZWQg
aW50IGk7DQo+ICsgICAgY29uc3Qgdm9pZCAqZW5kID0gKGNvbnN0IHZvaWQgKiltY19oZWFkZXIg
KyBnZXRfdG90YWxzaXplKG1jX2hlYWRlcik7DQo+ICsNCj4gKyAgICBpZiAoIHNpZ21hdGNoKHNp
ZywgbWNfaGVhZGVyLT5zaWcsIHBmLCBtY19oZWFkZXItPnBmKSApDQo+ICsgICAgICAgIHJldHVy
biAobWNfaGVhZGVyLT5yZXYgPiByZXYpID8gTkVXX1VDT0RFIDogT0xEX1VDT0RFOw0KDQpCb3Ro
IGhlcmUgYW5kIC4uLg0KDQo+ICsgICAgZXh0X2hlYWRlciA9IChjb25zdCB2b2lkICopKG1jX2hl
YWRlciArIDEpICsgZGF0YV9zaXplOw0KPiArICAgIGV4dF9zaWcgPSAoY29uc3Qgdm9pZCAqKShl
eHRfaGVhZGVyICsgMSk7DQo+ICsNCj4gKyAgICAvKg0KPiArICAgICAqIE1ha2Ugc3VyZSB0aGVy
ZSBpcyBlbm91Z2ggc3BhY2UgdG8gaG9sZCBhbiBleHRlbmRlZCBoZWFkZXIgYW5kIGVub3VnaA0K
PiArICAgICAqIGFycmF5IGVsZW1lbnRzLg0KPiArICAgICAqLw0KPiArICAgIGlmICggKGVuZCA8
IChjb25zdCB2b2lkICopZXh0X3NpZykgfHwNCj4gKyAgICAgICAgIChlbmQgPCAoY29uc3Qgdm9p
ZCAqKShleHRfc2lnICsgZXh0X2hlYWRlci0+Y291bnQpKSApDQo+ICsgICAgICAgIHJldHVybiBN
SVNfVUNPREU7DQo+ICsNCj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IGV4dF9oZWFkZXItPmNvdW50
OyBpKysgKQ0KPiArICAgICAgICBpZiAoIHNpZ21hdGNoKHNpZywgZXh0X3NpZ1tpXS5zaWcsIHBm
LCBleHRfc2lnW2ldLnBmKSApDQo+ICsgICAgICAgICAgICByZXR1cm4gKG1jX2hlYWRlci0+cmV2
ID4gcmV2KSA/IE5FV19VQ09ERSA6IE9MRF9VQ09ERTsNCg0KLi4uIGhlcmUgdGhlcmUncyBhZ2Fp
biBhbiBhc3N1bXB0aW9uIHRoYXQgdGhlcmUncyBzdHJpY3Qgb3JkZXJpbmcNCmJldHdlZW4gYmxv
YnMsIGJ1dCBhcyBtZW50aW9uZWQgaW4gcmVwbHkgdG8gYSBsYXRlciBwYXRjaCBvZiBhbg0KZWFy
bGllciB2ZXJzaW9uIHRoaXMgaXNuJ3QgdGhlIGNhc2UuIFRoZXJlZm9yZSB0aGUgZnVuY3Rpb24g
Y2FuJ3QNCmJlIHVzZWQgdG8gY29tcGFyZSB0d28gYXJiaXRyYXJ5IGJsb2JzLCBpdCBtYXkgb25s
eSBiZSB1c2VkIHRvDQpjb21wYXJlIGEgYmxvYiB3aXRoIHdoYXQgaXMgYWxyZWFkeSBsb2FkZWQg
aW50byBhIENQVS4gSSB0aGluayBpdA0KaXMgcXVpdGUgaW1wb3J0YW50IHRvIG1lbnRpb24gdGhp
cyByZXN0cmljdGlvbiBpbiBhIGNvbW1lbnQgYWhlYWQNCm9mIHRoZSBmdW5jdGlvbi4NCg0KVGhl
IGNvZGUgaXRzZWxmIGxvb2tzIGZpbmUgdG8gbWUsIGFuZCBhIGNvbW1lbnQgY291bGQgcGVyaGFw
cyBiZQ0KYWRkZWQgd2hpbGUgY29tbWl0dGluZzsgd2l0aCBzdWNoIGEgY29tbWVudA0KUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KSmFuDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

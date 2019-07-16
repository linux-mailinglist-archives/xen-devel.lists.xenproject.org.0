Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4696A33F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:49:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnIAP-0002iB-2v; Tue, 16 Jul 2019 07:46:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnIAO-0002hz-2p
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:46:28 +0000
X-Inumbo-ID: d093216a-a79d-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d093216a-a79d-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 07:46:26 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:46:26 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:41:38 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:41:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4bRhDkl7pNMLanBGukwk+5vvDg72QEP4bLLgZ3nXQPtN7uywWstKhV8motAUMIO5+dA8QBk7CD3tMTWzF7qguewSM+aKkQPvjsnrf6LS783ovEgH4NQ+yPlmkLCjj2v3zGkCr9gcbOMUxHmv6c6OKlCO96aEyPJ+w/XSMbp2J6Dta7tqJGTVhrpi4TuViHcQP5v8WmW9Dw4C8szT6pxC4S8ktvBiyzyExcc+JB23Nkk8IhAxJgcJHVVnlvYFTTT/HR7tmJA4xqpVSVEhcAwS8QBLFbUYL1yGdRNwAL4goJgxIz8Mo2fvhbizf0jV1enbToke52bUSY/R1Tf/8/JqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amtD0DjelUJyExkoK+bSNEAQS3ivVpyrM7uiTRxcBA0=;
 b=R1NNvQlLGwAEHM/A+XSToUVuT3I/wnYEVFsrXAqJD9l07yZusUo+89gogTn0/giM72wDeEz/Skcb8rcE2hJUj2p7oNI4Cb1ME8eDjg95h4kFe2OfH1HQjkKutJMSjLaKBoEwc/j+EIB5y3VlYc4fBrWycQBhq+gDi5/r7ZC5efFyBZQahPE977TNzTmuX2hkw7FxGtscoCdDqXkBd6v7SGX/dSduT+WNQqJPlMRb5vfxzRkSrD3snkDx1NcSSMe2ZALC1VK5rkNoXrNmmkT/J5kSRFdP1wbKibVE2469OBgHqjC/odhG7Ung4//mJTYRL3vJr+yweauodHyXb07jSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2667.namprd18.prod.outlook.com (20.179.107.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 07:41:37 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:41:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 07/13] x86/IRQ: target online CPUs when binding guest
 IRQ
Thread-Index: AQHVO6nmfFYuEqv+8kqqHKmb7c6wdQ==
Date: Tue, 16 Jul 2019 07:41:37 +0000
Message-ID: <d60f7c11-457f-798e-7a4f-b9164439f565@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0005.eurprd02.prod.outlook.com
 (2603:10a6:6:15::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5168ad17-2e18-4869-e0f7-08d709c108b3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2667; 
x-ms-traffictypediagnostic: DM6PR18MB2667:
x-microsoft-antispam-prvs: <DM6PR18MB266798588D67DD28F7450CFDB3CE0@DM6PR18MB2667.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(6436002)(102836004)(5640700003)(8676002)(53936002)(6506007)(4326008)(386003)(6512007)(7736002)(186003)(6116002)(6486002)(305945005)(52116002)(2906002)(66066001)(11346002)(81166006)(2616005)(8936002)(316002)(476003)(3846002)(66476007)(446003)(76176011)(2351001)(99286004)(26005)(81156014)(31686004)(68736007)(6916009)(256004)(14444005)(14454004)(486006)(71190400001)(478600001)(71200400001)(31696002)(5660300002)(86362001)(80792005)(2501003)(54906003)(36756003)(25786009)(64756008)(66556008)(66946007)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2667;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ToHy7np/qXwaKfIQdMmlbY4356YiNC2bb+d3ypDV7IV1vb9VJeJPGnBPCQuT5dtCAa4NPulcZiKDBN7aDIfXtmUnrtAfSE1/If4o/L+sn3KCe1ijx3/ZWUkmVbd+t7LlRRFipHFPLvvfaD24OZhATEVYo3gsWSl4+0BExYxSKDKqf77AQSClqI4Vx1+upJZD80GaeinoolUMSuFEqrz4oWLMgsDvZUjrW2nLXwlDbkhk0qpJ9s0CjlYkfaCNbMzN/cdNdxsiRCwGEUtPwqkkjkQw9TccVFH67R169cD7RGKVIkVI6npepw+Z932ny+voVt631MfURIUzibuP3c+qBt+3NF2QAsWNjo5O6C7x2wOLiT1Hk2stELObmcbY50fw0I508I42D7hmZjqZPoQmHCG/I4Aid2ihplEZ1OF4B5c=
Content-ID: <39A87F26BC76104DAB1B0CD619AEFEA8@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5168ad17-2e18-4869-e0f7-08d709c108b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:41:37.7947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2667
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 07/13] x86/IRQ: target online CPUs when
 binding guest IRQ
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Zml4dXBfaXJxcygpIHNraXBzIGludGVycnVwdHMgd2l0aG91dCBhY3Rpb24uIEhlbmNlIHN1Y2gg
aW50ZXJydXB0cyBjYW4NCnJldGFpbiBhZmZpbml0eSB0byBqdXN0IG9mZmxpbmUgQ1BVcy4gV2l0
aCAibm9pcnFiYWxhbmNlIiBpbiBlZmZlY3QsDQpwaXJxX2d1ZXN0X2JpbmQoKSBzbyBmYXIgd291
bGQgaGF2ZSBsZWZ0IHRoZW0gYWxvbmUsIHJlc3VsdGluZyBpbiBhIG5vbi0NCndvcmtpbmcgaW50
ZXJydXB0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQpB
Y2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCi0tLQ0K
djM6IE5ldy4NCi0tLQ0KSSd2ZSBub3Qgb2JzZXJ2ZWQgdGhpcyBwcm9ibGVtIGluIHByYWN0aWNl
IC0gdGhlIGNoYW5nZSBpcyBqdXN0IHRoZQ0KcmVzdWx0IG9mIGNvZGUgaW5zcGVjdGlvbiBhZnRl
ciBoYXZpbmcgbm90aWNlZCBhY3Rpb24tbGVzcyBJUlFzIGluICdpJw0KZGVidWcga2V5IG91dHB1
dCBwb2ludGluZyBhdCBhbGwgcGFya2VkL29mZmxpbmUgQ1BVcy4NCg0KLS0tIGEveGVuL2FyY2gv
eDg2L2lycS5jDQorKysgYi94ZW4vYXJjaC94ODYvaXJxLmMNCkBAIC0xNzAzLDkgKzE3MDMsMjcg
QEAgaW50IHBpcnFfZ3Vlc3RfYmluZChzdHJ1Y3QgdmNwdSAqdiwgc3RydQ0KICANCiAgICAgICAg
ICBkZXNjLT5zdGF0dXMgfD0gSVJRX0dVRVNUOw0KICANCi0gICAgICAgIC8qIEF0dGVtcHQgdG8g
YmluZCB0aGUgaW50ZXJydXB0IHRhcmdldCB0byB0aGUgY29ycmVjdCBDUFUuICovDQotICAgICAg
ICBpZiAoICFvcHRfbm9pcnFiYWxhbmNlICYmIChkZXNjLT5oYW5kbGVyLT5zZXRfYWZmaW5pdHkg
IT0gTlVMTCkgKQ0KLSAgICAgICAgICAgIGRlc2MtPmhhbmRsZXItPnNldF9hZmZpbml0eShkZXNj
LCBjcHVtYXNrX29mKHYtPnByb2Nlc3NvcikpOw0KKyAgICAgICAgLyoNCisgICAgICAgICAqIEF0
dGVtcHQgdG8gYmluZCB0aGUgaW50ZXJydXB0IHRhcmdldCB0byB0aGUgY29ycmVjdCAob3IgYXQg
bGVhc3QNCisgICAgICAgICAqIHNvbWUgb25saW5lKSBDUFUuDQorICAgICAgICAgKi8NCisgICAg
ICAgIGlmICggZGVzYy0+aGFuZGxlci0+c2V0X2FmZmluaXR5ICkNCisgICAgICAgIHsNCisgICAg
ICAgICAgICBjb25zdCBjcHVtYXNrX3QgKmFmZmluaXR5ID0gTlVMTDsNCisNCisgICAgICAgICAg
ICBpZiAoICFvcHRfbm9pcnFiYWxhbmNlICkNCisgICAgICAgICAgICAgICAgYWZmaW5pdHkgPSBj
cHVtYXNrX29mKHYtPnByb2Nlc3Nvcik7DQorICAgICAgICAgICAgZWxzZSBpZiAoICFjcHVtYXNr
X2ludGVyc2VjdHMoZGVzYy0+YWZmaW5pdHksICZjcHVfb25saW5lX21hcCkgKQ0KKyAgICAgICAg
ICAgIHsNCisgICAgICAgICAgICAgICAgY3B1bWFza19zZXRhbGwoZGVzYy0+YWZmaW5pdHkpOw0K
KyAgICAgICAgICAgICAgICBhZmZpbml0eSA9ICZjcHVtYXNrX2FsbDsNCisgICAgICAgICAgICB9
DQorICAgICAgICAgICAgZWxzZSBpZiAoICFjcHVtYXNrX2ludGVyc2VjdHMoZGVzYy0+YXJjaC5j
cHVfbWFzaywNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3B1
X29ubGluZV9tYXApICkNCisgICAgICAgICAgICAgICAgYWZmaW5pdHkgPSBkZXNjLT5hZmZpbml0
eTsNCisgICAgICAgICAgICBpZiAoIGFmZmluaXR5ICkNCisgICAgICAgICAgICAgICAgZGVzYy0+
aGFuZGxlci0+c2V0X2FmZmluaXR5KGRlc2MsIGFmZmluaXR5KTsNCisgICAgICAgIH0NCiAgDQog
ICAgICAgICAgZGVzYy0+c3RhdHVzICY9IH5JUlFfRElTQUJMRUQ7DQogICAgICAgICAgZGVzYy0+
aGFuZGxlci0+c3RhcnR1cChkZXNjKTsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

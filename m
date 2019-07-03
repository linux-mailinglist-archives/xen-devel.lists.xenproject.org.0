Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959545E7A6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 17:20:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hih1I-0008Rx-6x; Wed, 03 Jul 2019 15:18:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hih1G-0008Rq-VR
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 15:18:02 +0000
X-Inumbo-ID: be88b570-9da5-11e9-8968-37cad65c261b
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be88b570-9da5-11e9-8968-37cad65c261b;
 Wed, 03 Jul 2019 15:18:01 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 15:14:24 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 15:13:12 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 15:13:12 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3123.namprd18.prod.outlook.com (10.255.139.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Wed, 3 Jul 2019 15:13:11 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 15:13:11 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Varad Gautam <vrd@amazon.de>
Thread-Topic: [Xen-devel] [PATCH] x86: Get rid of p2m_host array allocation
 for HVM guests
Thread-Index: AQHVMaCIT4vtdpkd10yDpOO+7YWuCqa5AF+A
Date: Wed, 3 Jul 2019 15:13:11 +0000
Message-ID: <31135492-eb38-0cfd-ab0f-ea116834adfb@suse.com>
References: <1562159202-11316-1-git-send-email-vrd@amazon.de>
In-Reply-To: <1562159202-11316-1-git-send-email-vrd@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0112.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::26) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b50e7146-ef67-4b38-1999-08d6ffc8f67c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3123; 
x-ms-traffictypediagnostic: BY5PR18MB3123:
x-microsoft-antispam-prvs: <BY5PR18MB3123E147429CDF68EEDB4556B3FB0@BY5PR18MB3123.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(189003)(199004)(53936002)(316002)(2906002)(6486002)(36756003)(5660300002)(64756008)(66946007)(66476007)(66556008)(305945005)(73956011)(7736002)(25786009)(229853002)(6116002)(3846002)(66446008)(6436002)(8676002)(68736007)(80792005)(81166006)(81156014)(54906003)(86362001)(71200400001)(31696002)(8936002)(71190400001)(6512007)(4326008)(14454004)(72206003)(31686004)(6246003)(478600001)(66066001)(256004)(186003)(386003)(6506007)(53546011)(76176011)(6916009)(11346002)(446003)(486006)(102836004)(476003)(52116002)(2616005)(26005)(99286004)(26583001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3123;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xYG1d8rGbESR++6E6ZsOxWD/x5Icc9qW0SiKo3oDOCjCDOKGnlQ8WTOGr7nAJMHwqUIa/cfVTl6cW6msbaA6YDPEErKeMeWf8Y83pyeFTll9hbWcKjAEUYOcPrp6mf/2F+aBaB7Zw/ZaXtDk1DIGTMet8tNxUHSy2w8HtSQ13NKrNKfaUT3IBzivxJNn4y8U1roylL8kg7MMlkgXJyfFouGw0aBMK1kJ9jQHYOxKpelpA/2mwyN6BRHKwfwm6pzpKobSrcrs+kXKh1U31vWYUoa0INOvHAfxc9JQiRTdXKxG3mZaYO5X4l6q03zBjmsY9bk+cLaxaSykEmSSpQD+iCqvyg52ZiL387ch06Pb0KXZJzyLn67l7u7kEpwF6fG1rDE4m18UtKSmd6J4oh2O217LcSemjKFWs6wEYFf8Ysg=
Content-ID: <D1ABC870E708BD46A472970E0DEFEB28@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b50e7146-ef67-4b38-1999-08d6ffc8f67c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 15:13:11.4843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3123
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86: Get rid of p2m_host array allocation
 for HVM guests
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
 Amit Shah <aams@amazon.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxNTowNiwgVmFyYWQgR2F1dGFtIHdyb3RlOg0KPiBXaGVuIGFsbG9jYXRp
bmcgdGhlIGd1ZXN0IG1lbW9yeSBmb3IgYW4gSFZNIGRvbWFpbiwgbGlieGMga2VlcHMgdGhlIFAy
TQ0KPiBtYXBwaW5nIGZvciB0aGUgZW50aXJldHkgb2YgdGhlIGd1ZXN0IG1lbW9yeSBhcm91bmQg
Zm9yIHRoZSB0aW1lIG9mIHRoZQ0KPiBsYXVuY2ggYXMgeGNfZG9tX2ltYWdlLT5wMm1faG9zdC4g
Rm9yIGd1ZXN0cyB0aGF0IGhhdmUgYSBsYXJnZSBtZW1vcnkNCj4gKDM5MDQgR2lCKSwgdGhlIHAy
bV9ob3N0IGFsbG9jYXRpb24gdGFrZXMgbW9yZSB0aGFuIDcuNSBHaUIgb2Ygc3BhY2UsIGFuZA0K
PiBsZWF2ZXMgeGwgc3VzY2VwdGlibGUgdG8gZ2V0dGluZyBPT00ta2lsbGVkIG9uIGd1ZXN0IGNy
ZWF0aW9uLg0KPiANCj4gQ29udmVydCB0aGUgcDJtX2hvc3QgdGFibGUgbG9va3VwcyB0byBhbiBh
cmNoLXNwZWNpZmljIGZ1bmN0aW9uIHRoYXQNCj4gcmV0dXJucyB0aGUgbWFwcGluZyBvbi10aGUt
Zmx5IGZvciB4ODYgSFZNIGd1ZXN0cyB0byBhdm9pZCB0aGlzDQo+IGFsbG9jYXRpb24sIGJyaW5n
aW5nIGRvd24geGwncyBtZW1vcnkgdXNhZ2UgZnJvbSA+IDhHaUIgdG8gPCA3ME1pYiBmb3INCj4g
c3VjaCBsYXVuY2hlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZhcmFkIEdhdXRhbSA8dnJkQGFt
YXpvbi5kZT4NCj4gDQo+IC0tLQ0KPiANCj4gQXBwbGllcyB0byBzdGFibGUtNC4xMSsuDQo+IA0K
PiAgIHRvb2xzL2xpYnhjL2luY2x1ZGUveGNfZG9tLmggfCAgMTEgKysrLQ0KPiAgIHRvb2xzL2xp
YnhjL3hjX2RvbV9hcm0uYyAgICAgfCAgIDIgKw0KPiAgIHRvb2xzL2xpYnhjL3hjX2RvbV9jb3Jl
LmMgICAgfCAgIDQgKy0NCj4gICB0b29scy9saWJ4Yy94Y19kb21feDg2LmMgICAgIHwgMTI2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0NCj4gICA0IGZpbGVzIGNo
YW5nZWQsIDk5IGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQ0KDQpNYXkgSSBhc2sgdGhh
dCB5b3UgdGFnIHN1Y2ggcGF0Y2hlcyBjb3JyZWN0bHk/IFNlZWluZyB0aGUgc3ViamVjdCwgSSd2
ZQ0KYXNzdW1lZCB0aGUgQ2MgbGlzdCBpc24ndCByaWdodCwgdGh1cyBwdWxsaW5nIGl0IGludG8g
bXkgdG8tYmUtcmV2aWV3ZWQNCmZvbGRlci4gVGhlIHN1YmplY3QgaGVyZSByZWFsbHkgd2FudHMg
dG8gY29udGFpbiBlLmcuIGxpYnhjLCBsaWtlIGluDQoibGlieGMveDg2OiAuLi4iLg0KDQpUaGFu
a3MsIEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

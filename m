Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE4E6FBAD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 10:57:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpU41-0004hP-I3; Mon, 22 Jul 2019 08:52:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpU3z-0004hK-OC
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 08:52:55 +0000
X-Inumbo-ID: 14b32b3a-ac5e-11e9-acbf-1779de734593
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14b32b3a-ac5e-11e9-acbf-1779de734593;
 Mon, 22 Jul 2019 08:52:50 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 08:52:40 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 08:49:33 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 08:49:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGrKdSg1iQq5XAMOuXNY0cUbIG2sv+xpA9DEvhHbJMsYeYMMDNC1sYxTeTZyVSJYpUp6YAmD5n2m9Rq48T0usokwGVqkoh29UFUu4udzMdZB572Asuv1vTmpZNhEXUtqNpGKh4Bf7bFmF6unhZtvApy2yl1iUvPTtvzuq5NTuiw8koerVBJ7l36RZLYAqYg0CifjmclRtlGzrmrABb9gcRM1Q3xPo52lQtWxRzF68Mr6TZ5O/TLQMFumkfmBU3+OqkBWkLtLgrweORngJRDywSQ6SwMfZ8LwrTNCX0nfMOz1AKkczC74jJuERGnGtYaeJelJlkx6xUZ9DQmOZNlPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLEn1PbYfeH5L5LDJSS5T/f3EKQAsMSckE69r11w/uU=;
 b=MhnqGasJAv3HTeH7iibm2IkE2kMHptiZNmo7bsez6jLaS5Lt1/0wJ9oKvx+wZ/V7FqeSbtNM9lNI9KOeIIX5i/dzNiJAHEi3On4CJ2KnszbKtl02QMG7FtvttFcoduW8EllxTQH1nIGcGM5xkgg3i2XP4jopddB9Np3x8RCyMhW/ZysshcPCMvS12jwsLcD7Xt5HeP5rmcdspWvSW6kzRLk+0pUIwIE/SbYbIrerjaUgMclyKhFOjscrXOEYpyq6OKqxm2alRYPFrU61MKJb7l5nqU5xfj9/cVra4p6sbXAcNI5I/JYK5mE2o5YZ2Hl/2RBbOdU8YPabovOknfL98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2619.namprd18.prod.outlook.com (20.179.106.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 22 Jul 2019 08:49:32 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 08:49:32 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 14/14] AMD/IOMMU: process softirqs while dumping IRTs
Thread-Index: AQHVO/VM0Z1oh+Srj0iEZDBBy+eI46bSPozHgAQeRYA=
Date: Mon, 22 Jul 2019 08:49:32 +0000
Message-ID: <4645c8d8-4e4b-34ff-dcb8-6b6e74a3ac90@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <10fb0354-9018-a714-44b7-efda1b579aa1@suse.com>
 <d66e0efb-a31f-63c7-1b40-e9e60098daa9@citrix.com>
In-Reply-To: <d66e0efb-a31f-63c7-1b40-e9e60098daa9@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0211.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::31) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7accdb85-a0db-49c6-712d-08d70e818410
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2619; 
x-ms-traffictypediagnostic: DM6PR18MB2619:
x-microsoft-antispam-prvs: <DM6PR18MB2619A14BA170E3FDC1979531B3C40@DM6PR18MB2619.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(189003)(199004)(4326008)(36756003)(66476007)(25786009)(305945005)(476003)(66556008)(14454004)(66446008)(64756008)(6436002)(7736002)(486006)(5660300002)(186003)(26005)(6246003)(316002)(66066001)(81156014)(256004)(478600001)(81166006)(54906003)(53936002)(52116002)(68736007)(6512007)(6486002)(6916009)(86362001)(76176011)(102836004)(71200400001)(229853002)(446003)(14444005)(71190400001)(6116002)(31696002)(53546011)(8676002)(80792005)(2906002)(386003)(6506007)(31686004)(8936002)(2616005)(3846002)(99286004)(11346002)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2619;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pkxNuf8pJB7r+OOmhYFQPYNl3snaxOC/FUl0v6WRPVprjv92eOWW1wio+cr6GSvHsHW0jblRhgOCzCIKT3nw/mvGrwBTki/G8J5RnOJHSB1Bic672ENWGwiFyUfqex4is6Nkft9CoCotjUaXY7u5n2tjOfrcFVZpoq+yCgNgwdO65gYllLUTqhyMyTea7czcBJvlsKN3kTbPEOZ37Y6k31LCBXPlWyU8jWseas59WL7h+h5eEJF/uZMJ5BMmrl5O8yQ2xet+4ARV2MyNO9mUpR7lTGaNOYt4VZb5IvdEvTev1ggUrzJJoU0gm3zSCGO/ZFGKEbCC5C9xqHMKKOsxxrynewSBb8TzXobb4KyU4UzeZiuzwbhtdLvhShOo9Om19l2kzSVeyK9pau4mpVRUU9GIZwNslW24RuGVvNWSDlk=
Content-ID: <D76EA26C3213694196928CAAC1B15273@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7accdb85-a0db-49c6-712d-08d70e818410
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 08:49:32.7293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2619
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 14/14] AMD/IOMMU: process softirqs while
 dumping IRTs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxOTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTYvMDcvMjAx
OSAxNzo0MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBXaGVuIHRoZXJlIGFyZSBzdWZmaWNpZW50
bHkgbWFueSBkZXZpY2VzIGxpc3RlZCBpbiB0aGUgQUNQSSB0YWJsZXMgKG5vDQo+PiBtYXR0ZXIg
aWYgdGhleSBhY3R1YWxseSBleGlzdCksIG91dHB1dCBtYXkgdGFrZSB3YXkgbG9uZ2VyIHRoYW4g
dGhlDQo+PiB3YXRjaGRvZyB3b3VsZCBsaWtlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gdjM6IE5ldy4NCj4+IC0tLQ0K
Pj4gVEJEOiBTZWVpbmcgdGhlIHZvbHVtZSBvZiBvdXRwdXQgSSB3b25kZXIgd2hldGhlciB3ZSBz
aG91bGQgZnVydGhlcg0KPj4gICAgICAgIHN1cHByZXNzIGxvZ2dpbmcgaGVhZGVycyBvZiBkZXZp
Y2VzIHdoaWNoIGhhdmUgbm8gYWN0aXZlIGVudHJ5DQo+PiAgICAgICAgKGkuZS4gZW1pdCB0aGUg
aGVhZGVyIG9ubHkgdXBvbiBmaW5kaW5nIHRoZSBmaXJzdCBJUlRFIHdvcnRoDQo+PiAgICAgICAg
bG9nZ2luZykuIEFuZCB3aGlsZSBtaW5vciBmb3IgdGhlIHRvdGFsIHZvbHVtZSBvZiBvdXRwdXQg
SSdtDQo+PiAgICAgICAgYWxzbyB1bmNvbnZpbmNlZCBsb2dnaW5nIGJvdGggYSAicGVyIGRldmlj
ZSIgaGVhZGVyIGxpbmUgYW5kIGENCj4+ICAgICAgICAic2hhcmVkIiBvbmUgbWFrZXMgc2Vuc2Us
IHdoZW4gb25seSBvbmUgb2YgdGhlIHR3byBjYW4gYWN0dWFsbHkNCj4+ICAgICAgICBiZSBmb2xs
b3dlZCBieSBhY3R1YWwgY29udGVudHMuDQo+IA0KPiBJIGRvbid0IGhhdmUgYSBzeXN0ZW0gSSBj
YW4gYWNjZXNzIGF0IHRoZSBtb21lbnQsIHNvIGNhbid0IGp1ZGdlIGhvdyBiYWQNCj4gaXQgaXMg
cmlnaHQgbm93LsKgIEhvd2V2ZXIsIEkgd291bGQgYWR2b2NhdGUgdGhlIHJlbW92YWwgb2YgaXJy
ZWxldmFudA0KPiBpbmZvcm1hdGlvbi4NCg0KSSdsbCB0cnkgdG8gZ2V0IHRvIHB1dHRpbmcgdG9n
ZXRoZXIgYW5vdGhlciBwYXRjaCB0byB0aGlzIGVmZmVjdC4NCg0KPiBFaXRoZXIgd2F5LCB0aGlz
IGlzIGRlYnVnZ2luZyBzbyBBY2tlZC1ieTogQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCg0KVGhhbmtzLCBhbHNvIGZvciBhbGwgdGhlIG90aGVyIHJldmlldyBv
ZiB0aGlzIHNlcmllcyENCg0KPiBBcyBhbiBvYnNlcnZhdGlvbiwgSSB3b25kZXIgd2hldGhlciBj
b250aW51YWxseSBzcHJpbmtsaW5nDQo+IHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpIGlzIHRo
ZSBiZXN0IHRoaW5nIHRvIGRvIGZvciBrZXloYW5kbGVycy4NCj4gV2UndmUgZ290IGEgbnVtYmVy
IG9mIG90aGVyIHdoaWNoIGluY3VyIHRoZSB3cmF0aCBvZiB0aGUgd2F0Y2hkb2cgKGdyYW50DQo+
IHRhYmxlIGluIHBhcnRpY3VsYXIpLCB3aGljaCBpbiBwcmFjdGljZSBtZWFucyB0aGV5IGFyZSB0
eXBpY2FsbHkgYnJva2VuDQo+IHdoZW4gdGhleSBhcmUgYWN0dWFsbHkgdXNlZCBmb3IgZGVidWdn
aW5nIHByb2R1Y3Rpb24uDQo+IA0KPiBBcyB0aGVzZSBhcmUgZm9yIGRlYnVnZ2luZyBvbmx5LCBt
aWdodCBpdCBiZSBhIGJldHRlciBpZGVhIHRvIHN0b3AgdGhlDQo+IHdhdGNoZG9nIHdoaWxlIGtl
eWhhbmRsZXJzIGFyZSBydW5uaW5nP8KgIFRoZSBvbmx5IHVzZWZ1bCB0aGluZyB3ZQ0KPiBhY3R1
YWxseSBtYW5hZ2UgaGVyZSBpcyB0byBzdG9wIHRoZSB3YXRjaGRvZyBraWxsaW5nIHVzLg0KDQpI
bW0sIEkgd291bGQgYWdyZWUgZ29pbmcgdGhpcyByb3V0ZSBpZiB0aGUgd2F0Y2hkb2cgY291bGQg
YmUgZGlzYWJsZWQNCm9uIGEgcGVyLUNQVSBiYXNpcywgYnV0IHJpZ2h0IG5vdyB3YXRjaGRvZ19k
aXNhYmxlKCkgaXMgYSBzeXN0ZW0gd2lkZQ0KYWN0aW9uLg0KDQpKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E65D6A24C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 08:43:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnH83-0005f0-Cv; Tue, 16 Jul 2019 06:39:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnH81-0005ev-NX
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 06:39:57 +0000
X-Inumbo-ID: 827aaa22-a794-11e9-9f7c-cbef2acd5241
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 827aaa22-a794-11e9-9f7c-cbef2acd5241;
 Tue, 16 Jul 2019 06:39:52 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 06:39:50 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 06:39:24 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 06:39:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Re8ZaCdxdgc06uiOo8KDiy1xdQ4AenrqLTJP5xGoTlZz3XCEH1nTkNxpqxz3MO7hSRtnu8Hxp1lXCQ3Lm3gSuaHWvixeBC+QuGBnW0JA2a1W5LK4Vv35C4CYAOMICKfHfbQdQ6WgDjpvSzglcqPvl9iGUVeC+DwPa97bT3053tmZ9PoQY29mssATSazAb3m6QuU6uDbfgVEbaYMt4t6LcGIm1tUuUwD35chLShUZQnXc6OLSy6/8QJMyRwh3GzXeMrVXjNrm1f5aM0ljqw7VvcV0Ap+kEFUU4o42r44u0IjgJ3PucR2cJZcV2epgbwFqB7a3K/mTKGxOyiZs/VJDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqPOuuF372mYEX8n8h60jK8D0WrbiKw3ezLptdbuvxY=;
 b=Pe7PLKxpMLHqJAnl/6RctVWeuPz4u+WOsqDcla37gusUqeSsVR1he/SYkSBv6maW0KtscpslT9NeUO4nm1+9BGFNsUIzAx+YcemEp0n3zRvGNcWYz0zCXGRomYjwyJFwj5Ozui3Eyuif+EL8xG7t08kPdRgTKV5jQirouZisWMQs7aSLXpBHbbdn5Kh1UEO1U6+PFnonO/VqBc5CckFekHF/K4BbzU/4g49A/yISnFjkUbu21RuthXUzpV+iaEGR0QeWWuQp6+dM1asHe8bzDBeVLU/pVcxQ9I20sZqERTUs6jvPJMVuDxZUTSygwLX2msEFFBeYrEH3r0I+kjlyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3385.namprd18.prod.outlook.com (10.255.174.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 06:39:22 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 06:39:22 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 05/10] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
Thread-Index: AQHVMO2UOHmA7j9ffkazg1PUO76EkKbM4IGA
Date: Tue, 16 Jul 2019 06:39:22 +0000
Message-ID: <312c8464-81cc-361e-a266-663515f161e2@suse.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
 <5D14DEEB020000780023B987@prv1-mh.provo.novell.com>
 <330aa2a1-bb69-140e-3a91-125b82df755f@citrix.com>
In-Reply-To: <330aa2a1-bb69-140e-3a91-125b82df755f@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::15)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0cb567f-4a4d-4a2b-9b78-08d709b8562f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3385; 
x-ms-traffictypediagnostic: DM6PR18MB3385:
x-microsoft-antispam-prvs: <DM6PR18MB33858DAF7BB6A7DFEFEE9FD6B3CE0@DM6PR18MB3385.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(189003)(199004)(3846002)(53936002)(14444005)(81166006)(81156014)(6436002)(446003)(6246003)(99286004)(256004)(8676002)(53546011)(386003)(6506007)(86362001)(31696002)(8936002)(11346002)(6486002)(25786009)(6116002)(80792005)(31686004)(476003)(316002)(66556008)(64756008)(478600001)(66946007)(66446008)(2616005)(66476007)(6512007)(26005)(110136005)(186003)(54906003)(4326008)(2906002)(66066001)(229853002)(36756003)(52116002)(76176011)(5660300002)(102836004)(305945005)(486006)(7736002)(14454004)(71200400001)(68736007)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3385;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ogw1XhPTvatVCOElf3GgQ/bVdeF0KgbF0Kdf1xAcsb+19A68l6N5wzYTnInPIxSbMDszzqipb1edH0rGOUxZqaYSyhkrKM6KLXhnzSOBR1MKy8cDpJAFz7lBzzaAJo2T0aodByjMAVIAmgVai+VS3S3m/ml3d2porrsK799OV4MbxHM9d21FUrOjrL21576a3Qh8sVbXXj1zityrVqPB23p+hn3kRNgyo5RKWLRKytaZysznimrkfbbj0yJFsfxTVSPy02CkG8JF4tE00uew6nj/cOS/8wF0wk5xfB3A/KsHwQB6p3Nu1mgPOExvlOxvsvD3HmO0yauDSn98fBk3Awp1QHAfDbw5DKQJc5bgIetxhL3dojju0MuKmwXyDkjNxBMiyihaQW7CuYzoERmYDiWmSN2z6S+XYXDs7Zs/ESc=
Content-ID: <D6E6762B19B3104CA4784A1E355159B4@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cb567f-4a4d-4a2b-9b78-08d709b8562f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 06:39:22.4125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3385
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 05/10] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxNjo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjcvMDYvMjAx
OSAxNjoyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvaW9tbXVfaW50ci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXVfaW50ci5jDQo+PiBAQCAtNDAsMTIgKzQwLDQ1IEBAIHVuaW9uIGlydGUzMiB7DQo+
Pg0KPj4gLSNkZWZpbmUgSU5UUkVNQVBfVEFCTEVfT1JERVIgICAgMQ0KPj4gK3VuaW9uIGlydGVf
Y3B0ciB7DQo+PiArICAgIGNvbnN0IHZvaWQgKnB0cjsNCj4+ICsgICAgY29uc3QgdW5pb24gaXJ0
ZTMyICpwdHIzMjsNCj4+ICsgICAgY29uc3QgdW5pb24gaXJ0ZTEyOCAqcHRyMTI4Ow0KPj4gK30g
X190cmFuc3BhcmVudF9fOw0KPj4gKw0KPj4gKyNkZWZpbmUgSU5UUkVNQVBfVEFCTEVfT1JERVIg
KGlydGVfbW9kZSA9PSBpcnRlMzIgPyAxIDogMykNCj4gDQo+IFRoaXMgaXMgcHJvYmxlbWF0aWMg
Zm9yIGlydGVfbW9kZSA9PSBpcnRlVU5LLsKgIEFzIHRoaXMgImNvbnN0YW50IiBpcw0KPiB1c2Vk
IGluIGV4YWN0bHkgdHdvIHBsYWNlcywgSSdkIHN1Z2dlc3QgYSB0aW55IHN0YXRpYyBmdW5jdGlv
biBhbG9uZyB0aGUNCj4gc2FtZSBsaW5lcyBhcyB7Z2V0LHVwZGF0ZX1faW50cmVtYXBfZW50cnko
KSwgd2hpY2ggY2FuIHNlbnNpYmx5IHByZXZlbnQNCj4gY29kZSBsb29raW5nIGZvciBhIHNpemUg
YmVmb3JlIGlydGVfbW9kZSBpcyBzZXQgdXAuDQoNClRoaXMgd2FzIGluZGVlZCBhIHByb2JsZW0s
IGFuZCByZXF1aXJlcyBxdWl0ZSBhIGJpdCBvZiBmdXJ0aGVyIHJld29yazoNClRoaW5ncyBvbmx5
IHdvcmtlZCAoYWxtb3N0KSBjb3JyZWN0bHkgYmVjYXVzZSBmb3IgaXJ0ZVVOSyB3ZSdkIGFsc28g
c2V0DQp1cCBhIHRhYmxlIGZpdHRpbmcgMTI4LWJpdCBlbnRyaWVzLiBUaGUgaXNzdWUgaXMgdGhh
dA0KYW1kX2lvbW11X3VwZGF0ZV9pdnJzX21hcHBpbmdfYWNwaSgpIGdldHMgY2FsbGVkIChpbiB0
aGUgb3JpZ2luYWwgY29kZQ0KaW1tZWRpYXRlbHkpIGFoZWFkIG9mIGFtZF9pb21tdV9zZXR1cF9p
b2FwaWNfcmVtYXBwaW5nKCksIHlldCBzbyBmYXIgaXQNCmlzIHRoZSBsYXR0ZXIgd2hhdCBlc3Rh
Ymxpc2hlcyBpcnRlX21vZGUuDQoNCkknbSBub3cgdHJ5aW5nIHRvIGZpZ3VyZSB3aGV0aGVyIC8g
aG93IGZhciBpdCB3b3VsZCBiZSBmZWFzaWJsZSB0byBnbw0KYnkgcGVyLUlPTU1VIHNldHRpbmdz
IHJhdGhlciB0aGFuIHRoZSBnbG9iYWwgbW9kZSBpbmRpY2F0b3IuIEJ1dCB0aGF0DQppbiB0dXJu
IHJlcXVpcmVzIHNldHRpbmcgR0FFbiBlYXJsaWVyLiBBbm90aGVyIG9wdGlvbiAob3IgbWF5YmUg
YW4NCmFkZGl0aW9uYWwgcmVxdWlyZW1lbnQpIGlzIHRvIGhhbmQgdGhyb3VnaCB0aGUgInh0IiBm
bGFnIHRvIGZ1cnRoZXINCmZ1bmN0aW9ucy4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

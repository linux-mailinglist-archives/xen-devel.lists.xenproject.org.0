Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF50766C9
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:03:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzq5-0003eS-G7; Fri, 26 Jul 2019 13:00:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YaH9=VX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqzq4-0003eJ-3t
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:00:48 +0000
X-Inumbo-ID: 3d55338d-afa5-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3d55338d-afa5-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:00:46 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 13:00:45 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 12:57:23 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 12:57:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+A+2NdG4xDwXxq1vRKY7Nux9OevJGrxrG0o/Y03YQoX1O++hytBX5fFJe9rzXk5ROj515JEmyZah/ltDMKsIcRakjiOyzhWAzx9GyEfRuKqan0gNy8dXxHtAae8KajAX3Ed9ErQZAPju/hT1sz+q5pCpnxnek4kTiB5AE1qo3DMprRGSx7sVOizeUCHoj2fWNr6Xn4cZMiEJJT1dOzwU8KkI2jf1izOLORBiBK3AQKRaKZnNj3l9/kfC9TloSQj/QO1kiUAsioHZHMVfKHz8PmR5VDy+iDKKO+j0PyJAfThgsDF2QZpXbUIj1f2reIw/qLZc07yTtSKBJCglVW91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfE/oqCB0anQDBPRcQCsmk2ZC6cHm3c7/MgXSUN7Vc4=;
 b=AZP7EgssYSGmyQNpe2cx1ZazT3qIQ4uiy6dleZOuFoGyFqdILfotELe9eQ2bjjU8I43+gfvu40wVPxF6o6e1v+41bzRYYTgDEV8NXoSZ7zQz9MN6eH/k0KFQrxusBISzjB0epkNN2/GLLYe97j99WO+Lxzfh++n7umfU91IcR5xmoaKAJXiaFQaVfMZXgkmNiyItMim0raGYqaqSVW6mYrhbB5uIq/hNQikILI//4T1g3wShqJPGgy9fqbWS/LXJ+L+eVWosijJ7I81E64FaJAs2TKy16Sw8YHExpVQio2YN96zcdX7f1DbwO47X6bx8dx7mdH3QbLT3vJwMVOdaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3122.namprd18.prod.outlook.com (10.255.139.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 26 Jul 2019 12:57:21 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 12:57:21 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [Xen-devel] per-domain passthrough/iommu options
Thread-Index: AdVDqy2gdS3slVvQRuCN/iB10JmJ2gABnjsA
Date: Fri, 26 Jul 2019 12:57:21 +0000
Message-ID: <8fff2485-bf0a-5b98-dfbc-4679c39b9ed0@suse.com>
References: <a65d176f8912458c8576367597613de9@AMSPEX02CL03.citrite.net>
In-Reply-To: <a65d176f8912458c8576367597613de9@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::23) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0d96d86-b534-461a-3791-08d711c8cc03
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3122; 
x-ms-traffictypediagnostic: BY5PR18MB3122:
x-microsoft-antispam-prvs: <BY5PR18MB31223F4E15DB63B19BD5B42BB3C00@BY5PR18MB3122.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(189003)(199004)(52314003)(53546011)(6506007)(6436002)(53936002)(386003)(31696002)(6512007)(6246003)(102836004)(31686004)(2906002)(99286004)(7736002)(86362001)(4326008)(71190400001)(6916009)(6116002)(66066001)(25786009)(478600001)(186003)(14454004)(3846002)(76176011)(5660300002)(316002)(26005)(80792005)(8936002)(36756003)(8676002)(81166006)(81156014)(66476007)(66556008)(64756008)(229853002)(66446008)(68736007)(476003)(71200400001)(446003)(2616005)(256004)(11346002)(52116002)(305945005)(486006)(66946007)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3122;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wnYZw+ZGI+HMhvN6RN23P2yD13lLv2w/RoGCV+Qebh1FQ5ejABSDRbsa4p4fDB237q8zUZZwpE6mXGva5j2FvBYLEgZmIc1Pzv4aClV+uEjSwCfqBEUXRWYmpM9tuvINWuShd1jH/M7gF/EQAUmgFwcissETMiF0GM6gld1M1S/RREK9/SFm2lpHaBW9hXbHeyxRJqsELITeNY+LFz7zcowAKMYS4YOnoSc/V0/ZFzgL8vLKDxEGay4KZ+Y6OvYNLcA6T/DhXqjwosLjrMT73kln9NYMaft68dptTYt6jJplLQWMwrkgnd/+gaA1Z5hKpMGr13PAToVZlYB9t4qodJyYuk/4u1AqzFjA0R3V/+wD4melBF9ukdsR+W6hWDBFu/aprMUBBTM2sQjHGBSZ2zdc2VluQAUC35iy6sROn90=
Content-ID: <BDFB354B82AE494A9E528E073598F776@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d96d86-b534-461a-3791-08d711c8cc03
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 12:57:21.4396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3122
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] per-domain passthrough/iommu options
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
Cc: "xen-devel \(xen-devel@lists.xenproject.org\)"
 <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAxNDoyOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAgICBJIHNlbnQgYSBw
cmV2aW91cyBlbWFpbCBbMV0gYWJvdXQgZW5hYmxpbmcgdXNlIG9mIHRoZSBJT01NVSBvbiBhIHBl
ci1kb21haW4gYmFzaXMgYW5kIGFtIG5vdyBhIHJlYXNvbmFibGUgd2F5IGludG8gbXkgcGF0Y2gg
c2VyaWVzLCB3aGljaCBhbHNvIGFsbG93cyBmb3IgSU9NTVUgb3B0aW9uLXNldHRpbmcgKHNwZWNp
ZmljYWxseSBzaGFyZWQgRVBUIHVzZSkgb24gYSBwZXItZG9tYWluIGJhc2lzIHRvby4gQmVmb3Jl
IEkgcG9zdCB2MSBJJ2QgbGlrZSB0byBnZXQgc29tZSBvcGluaW9uIG9uIHRoZSB3aGF0IHRoZSB4
bC5jZmcgb3B0aW9ucyBzaG91bGQgbG9vayBsaWtlLg0KPiAgICBUaGUgc2ltcGxlc3Qgd2F5IGZv
ciBtZSB0byBkbyB0aGluZ3Mgd291bGQgYmUgdG8gaGF2ZSB0d28gbmV3IGJvb2xlYW4gb3B0aW9u
czsgc29tZXRoaW5nIGxpa2U6DQo+IA0KPiAncGFzc3Rocm91Z2gnIC0gZW5hYmxlL2Rpc2FibGUg
cGFzcy10aHJvdWdoIHN1cHBvcnQgKGkuZS4gdXNlIG9mIHRoZSBJT01NVSkuLi4gY2FuIGJlIGlt
cGxpY2l0bHkgZW5hYmxlZCBpZiB0aGVyZSBhcmUgcGNpIG9yIGR0IGRldmljZXMgc3BlY2lmaWVk
IGluIHRoZSB4bC5jZmcuDQo+ICduby1zaGFyZXB0JyAtIG5hbWVkIHRvIG1hdGNoIHRoZSB4ZW4t
Y21kbGluZSBvcHRpb24gZm9yIHR1cm5pbmcgb2ZmIHNoYXJlZCBFUFQuIChFUFQgc2hhcmluZyBj
dXJyZW50bHkgZGVmYXVsdHMgb24gZ2xvYmFsbHkpLg0KPiANCj4gICAgSSB0aGluayB0aGUgZm9y
bWVyIGlzIHByb2JhYmx5IG9rLCBidXQgdGhpbmtpbmcgZm9yd2FyZCB0byBhIHRpbWUgd2hlcmUg
d2UgbWlnaHQgaGF2ZSB2SU9NTVUgKFBWIG9yIGVtdWxhdGVkKSB0aGUgbGF0dGVyIGlzIHByb2Jh
Ymx5IG5vdCB0aGUgcmlnaHQgdGhpbmcgdG8gdXNlLiBTbywgYW5vdGhlciB3YXkgbWlnaHQgYmUg
dG8gaGF2ZSBhbiBJT01NVSBwYWdlLXRhYmxlIG9wdGlvbi4uLiBzb21ldGhpbmcgbGlrZToNCj4g
DQo+ICdpb21tdS1wdCA9IHNoYXJlZHxzeW5jJw0KPiANCj4gICAgd2hlcmUgJ3NoYXJlZCcgbWVh
bnMgdXNlIEVQVCBtYXBwaW5ncywgYW5kICdzeW5jJyBtZWFucyBrZWVwIHRoZSBQMk0gaW4gc3lu
Yy4gVGhpcyBjb3VsZCB0aGVuIGJlIGV4dGVuZGVkIHdpdGggJ3Zpb21tdScgbGF0ZXIsIG1lYW5p
bmcgdGhhdCB0aGVyZSB3b3VsZCBiZSBzb21lIGZvcm0gb2YgdklPTU1VIGV4cG9zZWQgdG8gdGhl
IGd1ZXN0LCBiZSBpdCBlbXVsYXRlZCwgUFYgb3IgYm90aC4gT25lIGRyYXdiYWNrIHdpdGggdGhp
cyBtZWNoYW5pc20gaXMgdGhhdCAnc2hhcmVkJyBpcyBub3QgYWx3YXlzIHBvc3NpYmxlIChlLmcu
IG9uIEFNRCBoL3cpIHNvIHdoYXQgc2hvdWxkIGJlIGRvbmUgaW4gdGhhdCBjYXNlPyBTaG91bGQg
c2VsZWN0aW5nIHRoYXQgb3B0aW9uIGJlIGNvbnNpZGVyZWQgYW4gZXJyb3IsIG9yIHNob3VsZCB0
aGVyZSBiZSBhIGZhbGwtYmFjayB0byAnc3luYyc/IFRoZSBmYWxsLWJhY2sgd291bGQgYmUgZWFz
aWVyIHRvIGRlYWwgd2l0aCBhcyB0aGVuIHRoZSBvcHRpb24gY291bGQganVzdCBkZWZhdWx0IHRv
ICdzeW5jJyBpZiBpdCB3YXMgbm90IHNwZWNpZmllZC4NCg0KVGhlIGZhbGwtYmFjayBzb3VuZHMg
cmVhc29uYWJsZSB0byBtZSAoYXMgbG9uZyBhcyB0aGF0J3MgcHJvcGVybHkNCmRlc2NyaWJlZCBp
biBkb2N1bWVudGF0aW9uKS4gV2hhdCBJJ20gbGVzcyBoYXBweSB3aXRoIGlzIHRoZSBpZGVhDQpv
ZiBoYXZpbmcgdHdvIG9wdGlvbnMgaW5zdGVhZCBvZiBqdXN0IG9uZS4gQnV0IG9mIGNvdXJzZSB0
aGlzIG1heQ0KYmUgYSByZXN1bHQgb2YgaG93IGxpYnhsIHdhbnRzIHRvIG9yZ2FuaXplIG9wdGlv
bnMuIElmIHRoZXJlJ3Mgbm8NCnJlc3RyaWN0aW9uIGF0IHRoYXQgZW5kLCB0aGVuIGhvdyBhYm91
dA0KDQpwYXNzdGhyb3VnaCA9IG9mZnxzeW5jfHNoYXJlLXB0fHZpb21tdQ0KDQo/IEl0IHdvdWxk
IGRlZmF1bHQgdG8gb2ZmIHdoZW4gdGhlcmUgYXJlIG5vIGRldmljZXMgbGlzdGVkIGluIHRoZQ0K
Y29uZmlnLCBhbmQgdG8gc2hhcmUtcHQgKHdpdGggdGhlIGZhbGwtYmFjayB0byBzeW5jKSB3aGVu
IHRoZXJlIGlzDQphdCBsZWFzdCBvbmUuDQoNCkFzIHRvICJzeW5jIiAtIGhvdyBkaWQgeW91IGNv
bWUgdG8gdXNlIHRoaXMgYXMgdGhlICJvcHBvc2l0ZSIgb2YNCiJzaGFyZS1wdCI/IFRoZXJlJ3Mg
bm90aGluZyBhc3luY2hyb25vdXMgd2l0aCBzaGFyZWQgcGFnZSB0YWJsZXMsDQppcyB0aGVyZT8g
TWF5YmUgInByaXZhdGUtcHQiIG9yICJzZXBhcmF0ZS1wdCI/IFRoZSBvcHRpb24gd291bGRuJ3QN
CmJlIHVzZWQgdHlwaWNhbGx5IGFueXdheSwgZXNwZWNpYWxseSBpZiBhbG9uZ3NpZGUgIm9mZiIg
dGhlcmUgd2FzDQphbHNvIGFuICJvbiIgdmFyaWFudCwgbWVhbmluZyB0aGUgc2FtZSBhcyAic2hh
cmUtcHQiLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

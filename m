Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8817A7EA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 14:15:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsQzU-0004eV-04; Tue, 30 Jul 2019 12:12:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsQzT-0004eQ-5l
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 12:12:27 +0000
X-Inumbo-ID: 4916a152-b2c3-11e9-b9c8-630f0c3025cd
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4916a152-b2c3-11e9-b9c8-630f0c3025cd;
 Tue, 30 Jul 2019 12:12:23 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 12:12:20 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 12:02:37 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 12:02:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUuGtJIiOp4ncA1l2djzbI8can0KHqLGZrSz7RqoCbKE8pGs33IJwVnRoBF2c8r3cYZGPShgYfqI/3Ge2hVVHrHc1qnmwBwWmP9fmWJxeK+lppKFI9CI7+qwBRFv8m6Y16Hf/b7wDeVljHX14Tl2sP/n1HkdpNIRRGmx9+uIrWIUWSF1r5LUqLueMO6VVAV9ax3K3gRsUPr1tdKFj3FkrdE4PHYeXz4ZS+kYqvAsJ4wrGdoUiEzSJPG6aBCafNA90OSMP178Eebh3BPgNPzybO0qHDr3OlZzKbZKpsPYx0CehCNHxZaY5tB/2Ax1mFHTP8yDbbNhoqQwLc0ekyaXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH2UOb5yFd+CtzorfxsclCidefSYtcDGU++20TwRyFs=;
 b=n4ZQ9MGPKWB+X4FkU0c0ICdhMhJmQJMf0/8LxDWb1icHe8LcnCZ9C1dlSADquv+iYUJYUrAfKSRLHADF6oBxKgmTN2fs0upmD+4+d9vMV2KNX7plCwWDi4qlMNQRWwiRnKaU9ljjyXbToSoUd0tAcb9qz+r+d8TcVCVd0YvnUws5p3wph6LuGJhFBi2lrM5Hvb46lxRAD4KMPMN/ZZSM4FBmNwmH5XFDSWWXAKkRM/TCWANVIlgr8vi7RCfZwnN1O8AE3eA2efRCZCp2NinLtQ9208tsOUg3DtiFUx87Je6Z2u9DM6eHdCtXX2DDnbWLhHH/7eF7NQ9b5vu6kfKavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3140.namprd18.prod.outlook.com (10.255.136.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 12:02:35 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 12:02:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 5/5] x86/domain: remove the 's3_integrity'
 flag
Thread-Index: AQHVRrrAC6ow8Y7o4EiAXVm7RRDWSKbjD9yA
Date: Tue, 30 Jul 2019 12:02:35 +0000
Message-ID: <6a99c8af-3477-9387-135a-7386020df3c5@suse.com>
References: <20190730093904.1794-1-paul.durrant@citrix.com>
 <20190730093904.1794-6-paul.durrant@citrix.com>
In-Reply-To: <20190730093904.1794-6-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:6::47)
 To BY5PR18MB3394.namprd18.prod.outlook.com (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c3b180a-4557-4f65-5194-08d714e5cf4d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3140; 
x-ms-traffictypediagnostic: BY5PR18MB3140:
x-microsoft-antispam-prvs: <BY5PR18MB31407D984EA79862E7EA2F81B3DC0@BY5PR18MB3140.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(199004)(189003)(71190400001)(31686004)(5660300002)(14454004)(2906002)(386003)(76176011)(36756003)(4744005)(80792005)(305945005)(102836004)(53546011)(6246003)(6116002)(7736002)(6512007)(316002)(71200400001)(99286004)(53936002)(3846002)(31696002)(11346002)(54906003)(6486002)(52116002)(25786009)(256004)(486006)(6436002)(2616005)(81156014)(81166006)(229853002)(186003)(6506007)(446003)(478600001)(86362001)(8936002)(66446008)(64756008)(26005)(8676002)(6916009)(66476007)(66556008)(66066001)(68736007)(4326008)(476003)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3140;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1anBP9eQpXS4v7OfWmerXHlboQTKHCHRdmBqVv4AUAKN5jQgoM21TGtBVFLGnI29VWIgUQ3am7BmFsAuUs6zaBcTqMcYKzUBWrb8wONBJY31XuCT6pS04xdoy3kJSQAeIFIyzXpJdYrkRG7GnzaOdccaAL7/lV7t8paAcz7YsW+aBQvhfP3rxe1Xk0kWJOQ2k1WpvSwfhud5ceRT2MWAnxIw3sbMeDVjm0pkgMPj45WsZk64IGoSoejr7cvcwlozSwXxrZNXyPgyKqK3RTEekbsbV1/fa+CAO+Mp56wOUIY7zXybN2DihAkBiyipBEyKFk6ADUvL3fWqZ4PhCWBjSLBbNgMgTrgeqnc+N+snlwwouDdxI72tbdfC5hGFEw69mFUx+gECq+jcaxIoAMzpScU2r5KCieOrj8UFy9EjKbE=
Content-ID: <ADA907CFE90F4F49BF2B2E335AE736BD@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3b180a-4557-4f65-5194-08d714e5cf4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 12:02:35.6420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3140
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 5/5] x86/domain: remove the
 's3_integrity' flag
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxMTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvZG9tYWluLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jDQo+IEBAIC00NjYs
NiArNDY2LDEzIEBAIGludCBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9k
b21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gICAgICAgfQ0KPiAgIA0KPiArICAgIGlmICggKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RM
X0NERl9zM19pbnRlZ3JpdHkpICYmDQo+ICsgICAgICAgICAhSVNfRU5BQkxFRChUQk9PVCkgKQ0K
DQpUaGlzIGxhY2tzIHRoZSBDT05GSUdfIHByZWZpeC4NCg0KPiAtLS0gYS94ZW4vYXJjaC94ODYv
c2V0dXAuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiBAQCAtNjg5LDcgKzY4OSw3
IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3Ap
DQo+ICAgICAgICAgICAuc3RvcF9iaXRzID0gMQ0KPiAgICAgICB9Ow0KPiAgICAgICBzdHJ1Y3Qg
eGVuX2RvbWN0bF9jcmVhdGVkb21haW4gZG9tMF9jZmcgPSB7DQo+IC0gICAgICAgIC5mbGFncyA9
IFhFTl9ET01DVExfQ0RGX3MzX2ludGVncml0eSwNCj4gKyAgICAgICAgLmZsYWdzID0gSVNfRU5B
QkxFRChUQk9PVCkgPyBYRU5fRE9NQ1RMX0NERl9zM19pbnRlZ3JpdHkgOiAwLA0KDQpTYW1lIGhl
cmUuIFdpdGggdGhpcyB0YWtlbiBjYXJlIG9mIChjb3VsZCBiZSBkb25lIHdoaWxlIGNvbW1pdHRp
bmcsDQpidXQgSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBwYXRjaCBpcyBpbmRlcGVuZGVudCBv
ZiB0aGUgZWFybGllcg0Kb25lcykNClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

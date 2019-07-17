Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B216B9EC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 12:17:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hngy0-0007YH-Bo; Wed, 17 Jul 2019 10:15:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hngxy-0007Y8-Hf
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 10:15:18 +0000
X-Inumbo-ID: c5c8a630-a87b-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c5c8a630-a87b-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 10:15:16 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 10:15:15 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 10:15:07 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 10:15:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUEr1fEkjyaaXYu0PZKWw+aKeNVTqgBv5s+uOCYRkjoqxkjkFZ6x+bYSxfHSRls7va+31EovSL3+1lAElVgwn4rKuyYQ1ChDB44joxMChzqvkTw/xq7r+t6l42lGckYnT8DTymwiC7k05C59Izy7/5jNmrH08k+jf+5KjpbdrbmuKPGFEZvNS+g9FKq4u1Fk/DHjY14Y69Ss03B80bhVcd6lQgzsrVObMo2uGRkrKu3dOKivlzjB39dUjqDnJqDHnd5g/0EuDa0NfAg5AERfalFpbKgmLnhQvFB1dX9GBaKhlMglojZ67z1TXOln0EOtuP53lnvORrNHvIPmB/FjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6IQW5ss1hndnC8+zrubQezRDVMdkKCZwntGwQD0b40=;
 b=XVB1Wom8hh14sFPIKOqv4fMj4jnVdq72iEnn2L2HF/YoMufyclNXNCrytjGBIJ5LPnTdrH+9xruoQM3yYOABrVKPBMPxaHC+tMnqTAd15C5J9jtSqE/OtOzWoj7z31LfFEwAk8kyQGPQX/VdZC/Ho66fhY71O+KraWXOuBXOncD42C9vHFRLh6gTpOSey82w3HNaH+MeI0yBe5mB1B+uZVYdMCsgZWTigz3YZ4rLf5nHAjfVJanZ+dhBK2h07XdfPsubYA93ueReLUBELR0NCCSNFY2DUeUp/1x2Kq0K6n4OcPnxHy7BKSZntWLzuNbFB5VH6W1Z6nZ+DnSMhFTRfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3292.namprd18.prod.outlook.com (10.255.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 17 Jul 2019 10:15:06 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 10:15:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/mm: Provide more useful information in diagnostics
Thread-Index: AQHVO/vkBYpGD+yhuU6ZuthJqP3CWqbOmQYA
Date: Wed, 17 Jul 2019 10:15:06 +0000
Message-ID: <7beadcbc-104e-0d2d-cfa4-d46c5d13e495@suse.com>
References: <20190716172801.11518-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190716172801.11518-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:2f::25)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48ee1459-420c-453c-d7a9-08d70a9fa401
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3292; 
x-ms-traffictypediagnostic: DM6PR18MB3292:
x-microsoft-antispam-prvs: <DM6PR18MB3292B13CC8FA198AF2D3D050B3C90@DM6PR18MB3292.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(199004)(189003)(186003)(8936002)(53546011)(86362001)(478600001)(386003)(6506007)(76176011)(316002)(53936002)(486006)(4744005)(99286004)(52116002)(14444005)(256004)(6916009)(6436002)(31696002)(2616005)(476003)(6486002)(3846002)(446003)(25786009)(11346002)(5660300002)(229853002)(102836004)(71190400001)(14454004)(68736007)(7736002)(71200400001)(4326008)(6512007)(6246003)(36756003)(26005)(66066001)(54906003)(80792005)(305945005)(31686004)(66476007)(2906002)(64756008)(6116002)(66556008)(8676002)(66446008)(81166006)(66946007)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3292;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E9bx2ZVFs4Tm36IVneiwysPvm/DBOVXcsQ6FIzn+uLCYFncREhXhQ6mNig5GbLii75v9PlUF6mvlo1ZEPUy79QNPMZ6qyukXJ9CBS4YtnPFxQPPfG1hdA31c1iuSJAu2R26FGfIFZuD8M+lTkHoZcqd8nMgcmlUUhwtdBHE4FKbO0icRbTEUuXMbDSzXDQz4rQcsXaCxFN8HZniMhFq2w0k+er/oKB4n9QJqWk0ESwCLnBFOrOoQgMEVy8/IQk0U5hF5Mvv9Af9zy0Xd6/1+D2c8gcDwKlYNUFN1pZxjJE1NJOMVSofjM4WRoQrMM6jE+QgsWNVWtmd6zfbtCzTqAKPIt3hYfEfiZa7rbMIARltj7SvciHvtkSDlvACpdUk6V8FvhVyh0Q5SEIbknlKf772x5gkNBznx6AT1Tl3mpHY=
Content-ID: <C4E89CA6CA1CAD4C8A97CDDEA4BF8EDC@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ee1459-420c-453c-d7a9-08d70a9fa401
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 10:15:06.4716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3292
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/mm: Provide more useful information in
 diagnostics
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxOToyOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21tLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMNCj4gQEAgLTE0MDcsNyArMTQw
Nyw4IEBAIHN0YXRpYyBpbnQgYWxsb2NfbDFfdGFibGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkN
Cj4gICAgICAgcmV0dXJuIDA7DQo+ICAgDQo+ICAgIGZhaWw6DQo+IC0gICAgZ2RwcmludGsoWEVO
TE9HX1dBUk5JTkcsICJGYWlsdXJlIGluIGFsbG9jX2wxX3RhYmxlOiBzbG90ICUjeFxuIiwgaSk7
DQo+ICsgICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsDQo+ICsgICAgICAgICAgICAgIkZhaWx1
cmUgaW4gYWxsb2NfbDFfdGFibGU6IHNsb3QgJSN4LCByZXQgJWRcbiIsIGksIHJldCk7DQoNClRv
IG1ha2UgaXQgc2xpZ2h0bHkgbGVzcyBvdXRwdXQgd2l0aG91dCBsb3NpbmcgaW5mb3JtYXRpb24s
IGluIGNhc2VzDQpsaWtlIHRoaXMgSSBnZW5lcmFsbHkgcHJlZmVyICJGYWlsdXJlICVkIGluIGFs
bG9jX2wxX3RhYmxlOiBzbG90ICUjeFxuIi4NClNlZWluZyAuLi4NCg0KPiBAQCAtMTUwNSw3ICsx
NTA2LDggQEAgc3RhdGljIGludCBhbGxvY19sMl90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdl
LCB1bnNpZ25lZCBsb25nIHR5cGUpDQo+ICAgICAgICAgICB9DQo+ICAgICAgICAgICBlbHNlIGlm
ICggcmMgPCAwICYmIHJjICE9IC1FSU5UUiApDQo+ICAgICAgICAgICB7DQo+IC0gICAgICAgICAg
ICBnZHByaW50ayhYRU5MT0dfV0FSTklORywgIkZhaWx1cmUgaW4gYWxsb2NfbDJfdGFibGU6IHNs
b3QgJSN4XG4iLCBpKTsNCj4gKyAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLA0K
PiArICAgICAgICAgICAgICAgICAgICAgIkZhaWx1cmUgaW4gYWxsb2NfbDJfdGFibGU6IHNsb3Qg
JSN4LCByYyAlZFxuIiwgaSwgcmMpOw0KDQouLi4gdGhpcyBmb3IgY29tcGFyaXNvbiBpdCBpcywg
aW1vLCBub3QgcmVsZXZhbnQgdG8gYWN0dWFsbHkgaGF2ZSBuYW1lcw0Kb2YgbG9jYWwgdmFyaWFi
bGVzIGluIGxvZ2dlZCBtZXNzYWdlcy4NCg0KUHJlZmVyYWJseSB3aXRoIHRoaXMgYWRqdXN0ZWQN
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

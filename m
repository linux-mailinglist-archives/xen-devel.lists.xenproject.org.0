Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AAB6CDEB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 14:14:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho5GA-0002bw-FT; Thu, 18 Jul 2019 12:11:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho5G8-0002bo-LQ
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 12:11:40 +0000
X-Inumbo-ID: 31e555a1-a955-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 31e555a1-a955-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 12:11:39 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 12:11:37 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 12:10:17 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 12:10:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzEwoxulEWCM7VLmUTvRbWCLVQdDDWh+xpGdDP9mdhkxenYz2iC2/b4wD/Wt0mqc77r2i2DROSVvWa6OfpzH8HfmaxH6I/o2UXQOBTDN1WwBnqbzx5yt5D4t73/KtVhHpgzF5QqcMXOF8ZL6OzD2Iwy9XHfXotPPZAgeWl0NajWMcLGN92h83t3iMTTR9WwE2Q4M3t+ykpp79chqHyG5Gdt4OSIMYoGHnOomOwJhIeer/y8WO0Hi4iO8t38Ph8NFZwPS5HB2Qom7qbmUa7rjZd+a05R7mwbu4loT3S8mwj/bvlunLebVSrn5o/0hUxrlSpHSmms+j4c3RUjMPQ/hZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiOro+tnKuzBsHjfnvOCnAbrWvvNNQ4KGnUw8fME/dA=;
 b=AH/DbFXOGZJafoxqz2w0qhu7G5Sh/TzyXwnpNvv9ucMljCaYcivzqYG6fdGi/+dZ0Jx9fwPgZCbfe81+Wq0OuJ9PBrC5lhnv+rXRLJ1S+vo8tC3qlmOGNcFDR8LlCZY7Zfzv0rwyORX0X93QalpgCpEFXP3hi4qUW4NDVtp6WKnNVhUohvbH69fMKMKbTrXVvUQWwg4n9U8rmAdIrA5Q9aSQron8JF/7a71kOaRCHqVFm/mt1Fi7rXH2BAns63ucpfN1GkG4DfW52+r5XotkK7mnjp58uujI1CGNY5jmw8NPUt46BU9po+8sVIBjCUSPqpyzIWG8NnO8lW3p/plSgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2796.namprd18.prod.outlook.com (20.179.50.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 12:10:16 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 12:10:16 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/2] x86/mtrr: Skip cache flushes on CPUs with cache
 self-snooping
Thread-Index: AQHVPWHCwCiDeJzVW0Sy9S0HVfPNTQ==
Date: Thu, 18 Jul 2019 12:10:15 +0000
Message-ID: <d982278f-daf9-67e5-f9b2-775105ef3233@suse.com>
References: <31d4cb3f-6ff0-a13c-00ce-bced77c6dd78@suse.com>
In-Reply-To: <31d4cb3f-6ff0-a13c-00ce-bced77c6dd78@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:10:be::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8711327-3d2a-44b9-3347-08d70b78e4c6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2796; 
x-ms-traffictypediagnostic: DM6PR18MB2796:
x-microsoft-antispam-prvs: <DM6PR18MB27964330457AA600D464FF8FB3C80@DM6PR18MB2796.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(80792005)(478600001)(76176011)(14454004)(66066001)(8676002)(186003)(52116002)(31696002)(476003)(446003)(25786009)(7736002)(2616005)(68736007)(2906002)(6512007)(2501003)(11346002)(305945005)(26005)(6506007)(6436002)(31686004)(3846002)(6486002)(36756003)(386003)(4326008)(486006)(81156014)(316002)(54906003)(81166006)(66476007)(102836004)(256004)(71190400001)(6116002)(2351001)(86362001)(66946007)(66556008)(64756008)(66446008)(71200400001)(14444005)(5660300002)(99286004)(6916009)(8936002)(53936002)(5640700003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2796;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: f9q0zI3Fwb8AEbFna1Kr7tT45qjpd4WL/1SjvFahXBy+XnrLGUrl9M/TAf5H5+Lvd+RjGArlqyeFpE8SRVXZuLeYw8DLQzyuMDzWcsU4R6DXXr8vSSYBHtvFJ9ZsrBLjMCreLMU+/EsrVmTjkoWOpQsneoU4Kmba3JwZRT1Hq7c8lHOZlQkTqLrQ/em6voUX3az095nkQEEjGwzFpPfnYN3eroC83SJga0qWeaTRbnHbjv2CUJ58CNAYFAKxrnDYekf/fKw5+zcFshVYgNHWxytmH3UMGAo4BnmfM7jGSed0SJo3MsvafU8ZXp4xlS4upznr7xdi7CMjROEwkxC3FqRdnCm3a/0pRnXBMqmTaeKamuVl/YHcx3JJhxLXFzdtDgehzI0nMSKbHhsArDRWK4zbU+uqfNZk5qXSY3OkLwU=
Content-ID: <C8EE72FFE171C840905495CBBBDEAE45@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c8711327-3d2a-44b9-3347-08d70b78e4c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 12:10:15.9449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2796
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH 2/2] x86/mtrr: Skip cache flushes on CPUs with
 cache self-snooping
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

RnJvbTogUmljYXJkbyBOZXJpIDxyaWNhcmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwuY29t
Pg0KDQpQcm9ncmFtbWluZyBNVFJSIHJlZ2lzdGVycyBpbiBtdWx0aS1wcm9jZXNzb3Igc3lzdGVt
cyBpcyBhIHJhdGhlciBsZW5ndGh5DQpwcm9jZXNzLiBGdXJ0aGVybW9yZSwgYWxsIHByb2Nlc3Nv
cnMgbXVzdCBwcm9ncmFtIHRoZXNlIHJlZ2lzdGVycyBpbiBsb2NrDQpzdGVwIGFuZCB3aXRoIGlu
dGVycnVwdHMgZGlzYWJsZWQ7IHRoZSBwcm9jZXNzIGFsc28gaW52b2x2ZXMgZmx1c2hpbmcNCmNh
Y2hlcyBhbmQgVExCcyB0d2ljZS4gQXMgYSByZXN1bHQsIHRoZSBwcm9jZXNzIG1heSB0YWtlIGEg
Y29uc2lkZXJhYmxlDQphbW91bnQgb2YgdGltZS4NCg0KT24gc29tZSBwbGF0Zm9ybXMsIHRoaXMg
Y2FuIGxlYWQgdG8gYSBsYXJnZSBza2V3IG9mIHRoZSByZWZpbmVkLWppZmZpZXMNCmNsb2NrIHNv
dXJjZS4gRWFybHkgd2hlbiBib290aW5nLCBpZiBubyBvdGhlciBjbG9jayBpcyBhdmFpbGFibGUg
KGUuZy4sDQpib290aW5nIHdpdGggaHBldD1kaXNhYmxlZCksIHRoZSByZWZpbmVkLWppZmZpZXMg
Y2xvY2sgc291cmNlIGlzIHVzZWQgdG8NCm1vbml0b3IgdGhlIFRTQyBjbG9jayBzb3VyY2UuIElm
IHRoZSBza2V3IG9mIHJlZmluZWQtamlmZmllcyBpcyB0b28gbGFyZ2UsDQpMaW51eCB3cm9uZ2x5
IGFzc3VtZXMgdGhhdCB0aGUgVFNDIGlzIHVuc3RhYmxlOg0KDQogICBjbG9ja3NvdXJjZTogdGlt
ZWtlZXBpbmcgd2F0Y2hkb2cgb24gQ1BVMTogTWFya2luZyBjbG9ja3NvdXJjZQ0KICAgICAgICAg
ICAgICAgICd0c2MtZWFybHknIGFzIHVuc3RhYmxlIGJlY2F1c2UgdGhlIHNrZXcgaXMgdG9vIGxh
cmdlOg0KICAgY2xvY2tzb3VyY2U6ICdyZWZpbmVkLWppZmZpZXMnIHdkX25vdzogZmZmZWRjMTAg
d2RfbGFzdDoNCiAgICAgICAgICAgICAgICBmZmZlZGI5MCBtYXNrOiBmZmZmZmZmZg0KICAgY2xv
Y2tzb3VyY2U6ICd0c2MtZWFybHknIGNzX25vdzogNWVjY2ZkZGViYyBjc19sYXN0OiA1ZTdlMzMw
M2Q0DQogICAgICAgICAgICAgICAgbWFzazogZmZmZmZmZmZmZmZmZmZmZg0KICAgdHNjOiBNYXJr
aW5nIFRTQyB1bnN0YWJsZSBkdWUgdG8gY2xvY2tzb3VyY2Ugd2F0Y2hkb2cNCg0KQXMgcGVyIG1l
YXN1cmVtZW50cywgYXJvdW5kIDk4JSBvZiB0aGUgdGltZSBuZWVkZWQgYnkgdGhlIHByb2NlZHVy
ZSB0bw0KcHJvZ3JhbSBNVFJScyBpbiBtdWx0aS1wcm9jZXNzb3Igc3lzdGVtcyBpcyBzcGVudCBm
bHVzaGluZyBjYWNoZXMgd2l0aA0Kd2JpbnZkKCkuIEFzIHBlciB0aGUgU2VjdGlvbiAxMS4xMS44
IG9mIHRoZSBJbnRlbCA2NCBhbmQgSUEgMzINCkFyY2hpdGVjdHVyZXMgU29mdHdhcmUgRGV2ZWxv
cGVyJ3MgTWFudWFsLCBpdCBpcyBub3QgbmVjZXNzYXJ5IHRvIGZsdXNoDQpjYWNoZXMgaWYgdGhl
IENQVSBzdXBwb3J0cyBjYWNoZSBzZWxmLXNub29waW5nLiBUaHVzLCBza2lwcGluZyB0aGUgY2Fj
aGUNCmZsdXNoZXMgY2FuIHJlZHVjZSBieSBzZXZlcmFsIHRlbnMgb2YgbWlsbGlzZWNvbmRzIHRo
ZSB0aW1lIG5lZWRlZCB0bw0KY29tcGxldGUgdGhlIHByb2dyYW1taW5nIG9mIHRoZSBNVFJSIHJl
Z2lzdGVyczoNCg0KUGxhdGZvcm0gICAgICAgICAgICAgICAgICAgICAgCUJlZm9yZQkgICBBZnRl
cg0KMTA0LWNvcmUgKDIwOCBUaHJlYWRzKSBTa3lsYWtlICAxNDM3bXMgICAgICAyOG1zDQogICAy
LWNvcmUgKCAgNCBUaHJlYWRzKSBIYXN3ZWxsICAgMTE0bXMgICAgICAgMm1zDQoNClJlcG9ydGVk
LWJ5OiBNb2hhbW1hZCBFdGVtYWRpIDxtb2hhbW1hZC5ldGVtYWRpQGludGVsLmNvbT4NClNpZ25l
ZC1vZmYtYnk6IFJpY2FyZG8gTmVyaSA8cmljYXJkby5uZXJpLWNhbGRlcm9uQGxpbnV4LmludGVs
LmNvbT4NCltMaW51eCBjb21taXQgZmQzMjlmMjc2ZWNhYWQ3YTM3MWQ2ZjkxYjliYmVhMDMxZDBj
MzQ0MF0NCg0KVXNlIGFsdGVybmF0aXZlcyBwYXRjaGluZyBpbnN0ZWFkIG9mIHN0YXRpY19jcHVf
aGFzKCkgKHdoaWNoIHdlIGRvbid0DQpoYXZlIFt5ZXRdKS4NCg0KSW50ZXJlc3RpbmdseSB3ZSd2
ZSBiZWVuIGxhY2tpbmcgdGhlIDJuZCB3YmludmQoKSwgd2hpY2ggSSdtIHRha2luZyB0aGUNCmxp
YmVydHkgaGVyZS4NCg0KUmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KDQotLS0gYS94ZW4vYXJjaC94ODYvY3B1L210cnIvZ2VuZXJpYy5jDQorKysgYi94ZW4v
YXJjaC94ODYvY3B1L210cnIvZ2VuZXJpYy5jDQpAQCAtNDUwLDcgKzQ1MCwxNCBAQCBzdGF0aWMg
Ym9vbCBwcmVwYXJlX3NldCh2b2lkKQ0KICANCiAgCS8qICBFbnRlciB0aGUgbm8tZmlsbCAoQ0Q9
MSwgTlc9MCkgY2FjaGUgbW9kZSBhbmQgZmx1c2ggY2FjaGVzLiAqLw0KICAJd3JpdGVfY3IwKHJl
YWRfY3IwKCkgfCBYODZfQ1IwX0NEKTsNCi0Jd2JpbnZkKCk7DQorDQorCS8qDQorCSAqIENhY2hl
IGZsdXNoaW5nIGlzIHRoZSBtb3N0IHRpbWUtY29uc3VtaW5nIHN0ZXAgd2hlbiBwcm9ncmFtbWlu
Zw0KKwkgKiB0aGUgTVRSUnMuIEZvcnR1bmF0ZWx5LCBhcyBwZXIgdGhlIEludGVsIFNvZnR3YXJl
IERldmVsb3BtZW50DQorCSAqIE1hbnVhbCwgd2UgY2FuIHNraXAgaXQgaWYgdGhlIHByb2Nlc3Nv
ciBzdXBwb3J0cyBjYWNoZSBzZWxmLQ0KKwkgKiBzbm9vcGluZy4NCisJICovDQorCWFsdGVybmF0
aXZlKCJ3YmludmQiLCAiIiwgWDg2X0ZFQVRVUkVfU1MpOw0KICANCiAgCWNyNCA9IHJlYWRfY3I0
KCk7DQogIAlpZiAoY3I0ICYgWDg2X0NSNF9QR0UpDQpAQCAtNDY2LDYgKzQ3Myw5IEBAIHN0YXRp
YyBib29sIHByZXBhcmVfc2V0KHZvaWQpDQogIAkvKiAgRGlzYWJsZSBNVFJScywgYW5kIHNldCB0
aGUgZGVmYXVsdCB0eXBlIHRvIHVuY2FjaGVkICAqLw0KICAJbXRycl93cm1zcihNU1JfTVRSUmRl
ZlR5cGUsIGRlZnR5cGUgJiB+MHhjZmYpOw0KICANCisJLyogQWdhaW4sIG9ubHkgZmx1c2ggY2Fj
aGVzIGlmIHdlIGhhdmUgdG8uICovDQorCWFsdGVybmF0aXZlKCJ3YmludmQiLCAiIiwgWDg2X0ZF
QVRVUkVfU1MpOw0KKw0KICAJcmV0dXJuIGNyNCAmIFg4Nl9DUjRfUEdFOw0KICB9DQogIA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

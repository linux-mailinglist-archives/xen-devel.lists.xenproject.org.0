Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071C86E45F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 12:32:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoQ9T-0004Fq-Az; Fri, 19 Jul 2019 10:30:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoQ9R-0004Fa-Ly
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 10:30:09 +0000
X-Inumbo-ID: 2dd7cfda-aa10-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2dd7cfda-aa10-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 10:30:08 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 10:30:03 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 10:29:37 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 10:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+SbXQCmb0EG2MpDimHimQFRqRCy+uEHAbFLD7mhZVfiivL6rKs2dJGyyJIk7YVSrkr2dDrJBI2QJFPNj7tAmZLcxIJnPVYtTqAhdZfCw+ycAsFlAxahCcXZMxy00Y44fye2+lubtvmx+j1oHewAxS0rNMDdqRqlHLPNL04TGSA6AG65qNwS8I97/eAeQH7ItBx5qrQ7MqdwzhxPFQWjbvKIBFJg9x9jtfq6YBiiJwN0/jtZQ3bVWIhqcYn+y7gKxIBrYY6R0QoFueYCIPdcWQkYUAQU3cADQSGb0sY2GS+w1I1Kh6UYICZG/dnuYF5sEemrOw3H15fJSyulk7gsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXO7ZHh8KO9QySatYEKjIhxrXNYQLgOP6fVcipQY5aM=;
 b=PoHG6DBMjH/Qzg0ZAC96ritAnhUvqnuY3x2nUVRhpDGOb4SnuSI3o7tIWqtA9xUcN27pYqP3hTLQ64FI8T9lyTSwAJxZQC8MVFmq0HwNAf1nhedRVLhrwBbnYujyGO86mVlQMBktXz2V0I3RZxH3Xqd3m/qRhSnUfi//Jd/gfGLRC3G0sqAZsr+mW0T8sVmcbuZgwKIDm1+bgD0wrCDkG5fmVrbZqBFGls4jiAo89B8nTK5oqji5v58crhGGxjUOyIc3/vQoQuWgrx2B+690/PSGqJ0OOynVKzYk6cEvSRmPxwew8OJAD+ImvDBrNvyomjW+fD60ekYZNtMcMVzTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2540.namprd18.prod.outlook.com (20.179.105.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 10:29:36 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 10:29:36 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/2] x86/mtrr: Skip cache flushes on CPUs with cache
 self-snooping
Thread-Index: AQHVPhzduXN26MwI5kWBrLOv0yjR7g==
Date: Fri, 19 Jul 2019 10:29:36 +0000
Message-ID: <2120a03f-3712-82d2-0b3d-759a996d0c87@suse.com>
References: <0ccb27d1-6612-d915-a898-8423ac3afdd0@suse.com>
In-Reply-To: <0ccb27d1-6612-d915-a898-8423ac3afdd0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0334.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::34) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c35da599-08a2-4708-6a24-08d70c33ff7d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2540; 
x-ms-traffictypediagnostic: DM6PR18MB2540:
x-microsoft-antispam-prvs: <DM6PR18MB2540EEFE86F2EAFF38381E77B3CB0@DM6PR18MB2540.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(66066001)(446003)(11346002)(3846002)(6116002)(6436002)(36756003)(26005)(53936002)(5640700003)(2616005)(476003)(102836004)(186003)(6486002)(478600001)(14454004)(2351001)(25786009)(256004)(14444005)(486006)(6506007)(71200400001)(7736002)(6916009)(71190400001)(2501003)(316002)(4326008)(99286004)(8676002)(305945005)(86362001)(31696002)(54906003)(31686004)(5660300002)(2906002)(66556008)(76176011)(52116002)(6512007)(386003)(80792005)(66946007)(81156014)(68736007)(8936002)(81166006)(66446008)(64756008)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2540;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dWU70aBWfFS/HywhVK35Vz5QhSQHLBF/1rk6p8SDIu1ZOF59qaQoPRVPUr/fkfO1hw4BxIvHrEygi0OiaMODjFVbIBVQ5lN1NiACRjzNJBOusiMtNU+oHPBFOqXbqrmy3VNvhiW1Et7Hsc21Os3RkUJZtFpJE1r9kQ5UCw7gmrOJh9W/mw7AqvWo3wsdEVJlW5z9oRn14WkfdrrBWfS3CjaH7p2WCoy/vnszD78cLEKlLw7Gu0r85Vggv5+fQes1iRQrSFtLx/Lp0Wvs3NAJv+aKLJF/BaJ7KnIoejRrLMifz1j6nqzbvKt4yaN3cu8hqhZIB61XKIZJVxI6Cjxf7P7ePzPJcrXFxCxSnsrPRfVFqhA5m85LGFpIfH3/4VRts4LVUVTbUIOTbezmerhP/CatZNnEgAxncJrEodQUhjo=
Content-ID: <52C2239B8BC4724684C1374403D8B075@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c35da599-08a2-4708-6a24-08d70c33ff7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 10:29:36.6608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2540
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v2 2/2] x86/mtrr: Skip cache flushes on CPUs
 with cache self-snooping
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
Y29tPg0KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+DQotLS0NCnYyOiBSZS1iYXNlICh1c2UgWEVOX1NFTEZTTk9PUCkuDQoNCi0tLSBhL3hlbi9h
cmNoL3g4Ni9jcHUvbXRyci9nZW5lcmljLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbXRyci9n
ZW5lcmljLmMNCkBAIC00NTAsNyArNDUwLDE0IEBAIHN0YXRpYyBib29sIHByZXBhcmVfc2V0KHZv
aWQpDQogIA0KICAJLyogIEVudGVyIHRoZSBuby1maWxsIChDRD0xLCBOVz0wKSBjYWNoZSBtb2Rl
IGFuZCBmbHVzaCBjYWNoZXMuICovDQogIAl3cml0ZV9jcjAocmVhZF9jcjAoKSB8IFg4Nl9DUjBf
Q0QpOw0KLQl3YmludmQoKTsNCisNCisJLyoNCisJICogQ2FjaGUgZmx1c2hpbmcgaXMgdGhlIG1v
c3QgdGltZS1jb25zdW1pbmcgc3RlcCB3aGVuIHByb2dyYW1taW5nDQorCSAqIHRoZSBNVFJScy4g
Rm9ydHVuYXRlbHksIGFzIHBlciB0aGUgSW50ZWwgU29mdHdhcmUgRGV2ZWxvcG1lbnQNCisJICog
TWFudWFsLCB3ZSBjYW4gc2tpcCBpdCBpZiB0aGUgcHJvY2Vzc29yIHN1cHBvcnRzIGNhY2hlIHNl
bGYtDQorCSAqIHNub29waW5nLg0KKwkgKi8NCisJYWx0ZXJuYXRpdmUoIndiaW52ZCIsICIiLCBY
ODZfRkVBVFVSRV9YRU5fU0VMRlNOT09QKTsNCiAgDQogIAljcjQgPSByZWFkX2NyNCgpOw0KICAJ
aWYgKGNyNCAmIFg4Nl9DUjRfUEdFKQ0KQEAgLTQ2Niw2ICs0NzMsOSBAQCBzdGF0aWMgYm9vbCBw
cmVwYXJlX3NldCh2b2lkKQ0KICAJLyogIERpc2FibGUgTVRSUnMsIGFuZCBzZXQgdGhlIGRlZmF1
bHQgdHlwZSB0byB1bmNhY2hlZCAgKi8NCiAgCW10cnJfd3Jtc3IoTVNSX01UUlJkZWZUeXBlLCBk
ZWZ0eXBlICYgfjB4Y2ZmKTsNCiAgDQorCS8qIEFnYWluLCBvbmx5IGZsdXNoIGNhY2hlcyBpZiB3
ZSBoYXZlIHRvLiAqLw0KKwlhbHRlcm5hdGl2ZSgid2JpbnZkIiwgIiIsIFg4Nl9GRUFUVVJFX1hF
Tl9TRUxGU05PT1ApOw0KKw0KICAJcmV0dXJuIGNyNCAmIFg4Nl9DUjRfUEdFOw0KICB9DQogIA0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

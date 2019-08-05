Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BDC815CB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 11:46:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huZWq-0003DZ-02; Mon, 05 Aug 2019 09:43:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huZWo-0003DU-TY
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 09:43:42 +0000
X-Inumbo-ID: 81a6b59f-b765-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 81a6b59f-b765-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 09:43:41 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 09:43:36 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 09:42:07 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 09:42:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1jNfzExitrLi6OKMjlNi+ubeMJ8K4WxCLQx6CAsjYWm/2KXh1RMbw5BHh23kDRxOj/ld4uu8so5bbcdUAAUlh1+2Fv64SZwCdOroGKH8C/TqcvjCxLpUrDExQFH0zL33FsR0RUiC5paLMrRUa3vVN4vI/9gswU8tJW6bBJ3eaWZOHJFeegmygAqQYvGnWvSPpXk8rT+oL7me1n00TqFR61ZmKMCSZtqdVUX6Rxc4soNbvVU+qg+6XhEC9Jr3m+YxtpiBLCfDaIaw32/2lhCFFZY0zFpadWJbxh6pcZAoOd/xMUzHnQFars+AvD3rM4lQhkENULYd26DcTfeomXPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7Lfm5av1aaWb61l1BsJssc8z72U/JxkV3plF7E/0aw=;
 b=UIQ36/rYEPx1vyfGd2o5rtMwXnQK5TUfe8wjJC20+CEzAESIuRv50zA/Ul5/utoHzH7bZ++ZaQCpoXH8UpCArlyc6KRcR664mLfHT+XKT+9f5miGlxyZVjCkWM1YZDbL14QhyC9JvDIlPKtkDq9ngJY5GcH9jWc+7aGmN8hC2uACySr+4Wjd8ZsE+Tx/A7EYIviGSzXJ2QmZSn31N7J+EKbuo7LX+kYgKQ+wSoOxEsr3x191dT2Cj7wYc+H7lAyAGvBkQfHtKuYAstwnwil1UXF/4b0RI4smd48TmaiqnzDbxkX2B6c+KQA1b92yMBcpCKOETSE2lmsB6PGnCcDR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3182.namprd18.prod.outlook.com (10.255.236.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Mon, 5 Aug 2019 09:42:06 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:42:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [PATCH] mm: Safe to clear PGC_allocated on xenheap pages without
 an extra reference
Thread-Index: AQHVSU2kZMdYId1RWUmjRXli///P+6bsUXoA
Date: Mon, 5 Aug 2019 09:42:06 +0000
Message-ID: <94409ef1-5b8e-b522-ad84-cb2f6ca2ab5d@suse.com>
References: <20190802161611.4145-1-george.dunlap@citrix.com>
In-Reply-To: <20190802161611.4145-1-george.dunlap@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0073.eurprd07.prod.outlook.com
 (2603:10a6:207:4::31) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 374fc4f5-8464-4c30-564d-08d719892d9f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3182; 
x-ms-traffictypediagnostic: MN2PR18MB3182:
x-microsoft-antispam-prvs: <MN2PR18MB3182E90604F7A8B47D9220F7B3DA0@MN2PR18MB3182.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(199004)(189003)(102836004)(316002)(14444005)(99286004)(256004)(386003)(6116002)(76176011)(6506007)(54906003)(3846002)(52116002)(53546011)(6512007)(66066001)(6246003)(25786009)(14454004)(305945005)(4326008)(36756003)(478600001)(31686004)(53936002)(7736002)(6916009)(186003)(31696002)(68736007)(6436002)(229853002)(446003)(2906002)(86362001)(6486002)(26005)(81156014)(81166006)(486006)(2616005)(66556008)(66446008)(71200400001)(66476007)(5660300002)(64756008)(66946007)(8936002)(8676002)(11346002)(476003)(80792005)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3182;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jKMGrXBQLNRd1T8NA+KgA6mlhzecAbEnW5VJMI94iq7LXz0p0YwXa1b3TtTi880zkbwKfLU/3ygJQ2Ilq1OECh7MTsmrUyBYz89cTQmAhGGnkdmp3OXaQFIH0LMcPaz7kFGL4FAXosZAko/dce1seXABo3tA1vhbmiaF9mywkIfhmzip/J31t35E4wLpaJhk3TJJUZzFUT42nyW9O8YfHjNB/D4BAW20L4yl8JulEn2PDUMyno4euWfdBD7/od2qUwuL5i8VUNzSz8cMZG7EDZ6nUjrbboY1mCvqlJAuB2Jx1y3GbhXhUVuikCZQhgJXdJFUkQIhnV/OZ72JZE6LFyJ8V6lVwqWS+9vg2xJ0OVRMD38cVJR7R5ztGF27SAGLzq7Ug3KRyUgsGvIRszKSLuHmv9d7cqPyqKIpx+nN83M=
Content-ID: <9D15045F5C7DD14C8F7B82497B4D2D12@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 374fc4f5-8464-4c30-564d-08d719892d9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:42:06.3705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3182
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] mm: Safe to clear PGC_allocated on xenheap
 pages without an extra reference
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
 Paul Durrant <paul.durrant@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMjAxOSAxODoxNiwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gQ29tbWl0cyBlYzgz
ZjgyNTYyNyAibW0uaDogYWRkIGhlbHBlciBmdW5jdGlvbiB0byB0ZXN0LWFuZC1jbGVhcg0KPiBf
UEdDX2FsbG9jYXRlZCIgKGFuZCBzdWJzZXF1ZW50IGZpeC11cCA0NGE4ODdkMDIxZCAibW0uaDog
Zml4IEJVR19PTigpDQo+IGNvbmRpdGlvbiBpbiBwdXRfcGFnZV9hbGxvY19yZWYoKSIpIGludHJv
ZHVjZWQgYSBCVUdfT04oKSB0byBkZXRlY3QNCj4gdW5zYWZlIGJlaGF2aW9yIG9mIGNhbGxlcnMu
DQo+IA0KPiBVbmZvcnR1bmF0ZWx5IHRoaXMgY29uZGl0aW9uIHN0aWxsIHR1cm5zIG91dCB0byBi
ZSB0b28gc3RyaWN0Lg0KPiB4ZW5oZWFwIHBhZ2VzIGFyZSBzb21ld2hhdCAibWFnaWMiOiBjYWxs
aW5nIGZyZWVfZG9taGVhcF9wYWdlcygpIG9uDQo+IHRoZW0gd2lsbCBub3QgY2F1c2UgZnJlZV9o
ZWFwX3BhZ2VzKCkgdG8gYmUgY2FsbGVkOiB3aGljaGV2ZXIgcGFydCBvZg0KPiBYZW4gYWxsb2Nh
dGVkIHRoZW0gc3BlY2lhbGx5IG11c3QgY2FsbCBmcmVlX3hlbmhlYXBfcGFnZXMoKQ0KPiBzcGVj
aWZpY2FsbHkuICAoVGhleSdsbCBhbHNvIGJlIGhhbmRsZWQgYXBwcm9wcmlhdGVseSBhdCBkb21h
aW4NCj4gZGVzdHJ1Y3Rpb24gdGltZS4pDQo+IA0KPiBPbmx5IGNyYXNoIFhlbiB3aGVuIHB1dF9w
YWdlX2FsbG9jX3JlZigpIGZpbmRzIG9ubHkgYSBzaW5nbGUgcmVmY291bnQNCj4gaWYgdGhlIHBh
Z2UgaXMgbm90IGEgeGVuaGVhcCBwYWdlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KYWxiZWl0IHdpdGggYSBzdWdnZXN0aW9uOg0KDQo+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oDQo+
IEBAIC02NjYsMTUgKzY2NiwyMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2hhcmVfeGVuX3BhZ2Vf
d2l0aF9wcml2aWxlZ2VkX2d1ZXN0cygNCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgcHV0X3BhZ2Vf
YWxsb2NfcmVmKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpDQo+ICAgew0KPiAgICAgICAvKg0KPiAt
ICAgICAqIFdoZW5ldmVyIGEgcGFnZSBpcyBhc3NpZ25lZCB0byBhIGRvbWFpbiB0aGVuIHRoZSBf
UEdDX2FsbG9jYXRlZCBiaXQNCj4gLSAgICAgKiBpcyBzZXQgYW5kIHRoZSByZWZlcmVuY2UgY291
bnQgaXMgc2V0IHRvIGF0IGxlYXN0IDEuIFRoaXMgZnVuY3Rpb24NCj4gLSAgICAgKiBjbGVhcnMg
dGhhdCAnYWxsb2NhdGlvbiByZWZlcmVuY2UnIGJ1dCBpdCBpcyB1bnNhZmUgdG8gZG8gc28gd2l0
aG91dA0KPiAtICAgICAqIHRoZSBjYWxsZXIgaG9sZGluZyBhbiBhZGRpdGlvbmFsIHJlZmVyZW5j
ZS4gSS5lLiB0aGUgYWxsb2NhdGlvbg0KPiAtICAgICAqIHJlZmVyZW5jZSBtdXN0IG5ldmVyIGJl
IHRoZSBsYXN0IHJlZmVyZW5jZSBoZWxkLg0KPiArICAgICAqIFdoZW5ldmVyIGEgcGFnZSBpcyBh
c3NpZ25lZCB0byBhIGRvbWFpbiB0aGVuIHRoZSBfUEdDX2FsbG9jYXRlZA0KPiArICAgICAqIGJp
dCBpcyBzZXQgYW5kIHRoZSByZWZlcmVuY2UgY291bnQgaXMgc2V0IHRvIGF0IGxlYXN0IDEuIFRo
aXMNCj4gKyAgICAgKiBmdW5jdGlvbiBjbGVhcnMgdGhhdCAnYWxsb2NhdGlvbiByZWZlcmVuY2Un
IGJ1dCBpdCBpcyB1bnNhZmUgdG8NCj4gKyAgICAgKiBkbyBzbyB0byBkb21oZWFwIHBhZ2VzIHdp
dGhvdXQgdGhlIGNhbGxlciBob2xkaW5nIGFuIGFkZGl0aW9uYWwNCj4gKyAgICAgKiByZWZlcmVu
Y2UuIEkuZS4gdGhlIGFsbG9jYXRpb24gcmVmZXJlbmNlIG11c3QgbmV2ZXIgYmUgdGhlIGxhc3QN
Cj4gKyAgICAgKiByZWZlcmVuY2UgaGVsZC4NCj4gKyAgICAgKg0KPiArICAgICAqIChJdCdzIHNh
ZmUgZm9yIHhlbmhlYXAgcGFnZXMsIGJlY2F1c2UgcHV0X3BhZ2UoKSB3aWxsIG5vdCBjYXVzZQ0K
PiArICAgICAqIHRoZW0gdG8gYmUgZnJlZWQuKQ0KPiAgICAgICAgKi8NCj4gICAgICAgaWYgKCB0
ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZwYWdlLT5jb3VudF9pbmZvKSApDQo+
ICAgICAgIHsNCj4gLSAgICAgICAgQlVHX09OKChwYWdlLT5jb3VudF9pbmZvICYgUEdDX2NvdW50
X21hc2spIDw9IDEpOw0KPiArICAgICAgICBCVUdfT04oKHBhZ2UtPmNvdW50X2luZm8gJiBQR0Nf
Y291bnRfbWFzaykgPD0gMSAmJg0KPiArICAgICAgICAgICAgICAgIShwYWdlLT5jb3VudF9pbmZv
ICYgUEdDX3hlbl9oZWFwKSk7DQoNClRoaXMgY2FuIGJlIGhhZCB3aXRoIGEgc2luZ2xlIGNvbmRp
dGlvbmFsOg0KDQogICAgICAgICBCVUdfT04oKHBhZ2UtPmNvdW50X2luZm8gJiAoUEdDX3hlbl9o
ZWFwIHwgUEdDX2NvdW50X21hc2spKSA8PSAxKTsNCg0KSmFuDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

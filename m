Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2888E1467AE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 13:14:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iubKb-0005vj-EE; Thu, 23 Jan 2020 12:11:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iubKZ-0005ve-Or
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 12:11:27 +0000
X-Inumbo-ID: 75c25970-3dd9-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75c25970-3dd9-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579781478; x=1611317478;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gaHefyT8N3AC84aZY1yKCyzeodR8bls8duHw02+9X3w=;
 b=MRqENWtz8QFmBQTW2mLQSyroCOoyMlYunbFux1ibS4T0Q35O/Sa/vHqk
 5jaaURHVetT5AFMVzvgmYe5wPPy4csBIQWSh/FAL/cOtnBW7bgcOfRaFo
 8OiUb7yoMpxVhA+2MDsYxb4qDwPAp6DN0lO248G9HGAz8UpqBb8jfjP9f 4=;
IronPort-SDR: 7P+0cr2LJCSa+TKTENZ/X2//NCEUmgGbzP4l5mDlubOS7pbDbOI98Ojuww+Enf1dRmLdAAkVk1
 TwJFViKliWmw==
X-IronPort-AV: E=Sophos;i="5.70,353,1574121600"; d="scan'208";a="21943237"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 23 Jan 2020 12:11:07 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id B5EA8A1E9D; Thu, 23 Jan 2020 12:11:06 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 12:11:06 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 12:11:05 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 23 Jan 2020 12:11:05 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] cmdline: treat hyphens and underscores
 the same
Thread-Index: AQHV0eKg7UcvIkvA80OXATeoxSAFwqf4J4NQ
Date: Thu, 23 Jan 2020 12:11:05 +0000
Message-ID: <ed7e3960a25447c5b262666db346c05c@EX13D32EUC003.ant.amazon.com>
References: <63d1bdfc-9000-7471-f4f2-7c7f2e931bfe@suse.com>
In-Reply-To: <63d1bdfc-9000-7471-f4f2-7c7f2e931bfe@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.130]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] cmdline: treat hyphens and underscores
 the same
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMjMgSmFudWFyeSAyMDIwIDExOjQzDQo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhlbi5vcmc+OyBXZWkgTGl1IDx3bEB4
ZW4ub3JnPjsgS29ucmFkIFdpbGsNCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Ow0KPiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tzb24NCj4gPGlhbi5qYWNrc29uQGNp
dHJpeC5jb20+DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2Ml0gY21kbGluZTogdHJl
YXQgaHlwaGVucyBhbmQgdW5kZXJzY29yZXMgdGhlDQo+IHNhbWUNCj4gDQo+IEluIG9yZGVyIHRv
IGF2b2lkIHBlcm1hbmVudGx5IGhhdmluZyB0byBhc2sgdGhhdCBubyBuZXcgY29tbWFuZCBsaW5l
DQo+IG9wdGlvbnMgdXNpbmcgdW5kZXJzY29yZXMgYmUgaW50cm9kdWNlZCAoYWxiZWl0IEknbSBs
aWtlbHkgdG8gc3RpbGwgbWFrZQ0KPiByZW1hcmtzKSwgYW5kIGluIG9yZGVyIHRvIGFsc28gYWxs
b3cgZXh0ZW5kaW5nIHRoZSB1c2Ugb2YgaHlwaGVucyB0bw0KPiBwcmUtZXhpc3Rpbmcgb25lcywg
aW50cm9kdWNlIGN1c3RvbSBjb21wYXJpc29uIGZ1bmN0aW9ucyB0cmVhdGluZyBib3RoDQo+IGNo
YXJhY3RlcnMgYXMgbWF0Y2hpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiB2MjogUmVuYW1lIHRvIG9wdF9zdHJ7LG59Y21w
KCkuIERvbid0IHVzZSB0aGUgbmV3IGZ1bmN0aW9uIGZvciBjb21hcHJpbmcNCj4gICAgIGFnYWlu
c3QgIm5vLSIgaW4gcGFyc2VfcGFyYW1zKCkuIEFkZCBjb21tZW50IHRvIGNkaWZmKCkuDQo+IA0K
PiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MNCj4gKysrIGIvZG9jcy9t
aXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jDQo+IEBAIC03Miw2ICs3MiwxMSBAQCBTb21lIG9w
dGlvbnMgdGFrZSBhIGNvbW1hIHNlcGFyYXRlZCBsaXN0DQo+ICBTb21lIHBhcmFtZXRlcnMgYWN0
IGFzIGNvbWJpbmF0aW9ucyBvZiB0aGUgYWJvdmUsIG1vc3QgY29tbW9ubHkgYSBtaXgNCj4gIG9m
IEJvb2xlYW4gYW5kIFN0cmluZy4gIFRoZXNlIGFyZSBub3RlZCBpbiB0aGUgcmVsZXZhbnQgc2Vj
dGlvbnMuDQo+IA0KPiArIyMjIFNwZWxsaW5nDQo+ICsNCj4gK1BhcmFtZXRlciBuYW1lcyBtYXkg
aW5jbHVkZSBoeXBoZW5zIG9yIHVuZGVyc2NvcmVzLiAgVGhlc2UgYXJlDQo+ICtnZW5lcmFsbHkg
YmVpbmcgdHJlYXRlZCBhcyBtYXRjaGluZyBvbmUgYW5vdGhlciBieSB0aGUgcGFyc2luZyBsb2dp
Yy4NCj4gKw0KPiAgIyMgUGFyYW1ldGVyIGRldGFpbHMNCj4gDQo+ICAjIyMgYWNwaQ0KPiAtLS0g
YS94ZW4vY29tbW9uL2tlcm5lbC5jDQo+ICsrKyBiL3hlbi9jb21tb24va2VybmVsLmMNCj4gQEAg
LTIzLDYgKzIzLDUzIEBAIGVudW0gc3lzdGVtX3N0YXRlIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEEN
Cj4gIHhlbl9jb21tYW5kbGluZV90IHNhdmVkX2NtZGxpbmU7DQo+ICBzdGF0aWMgY29uc3QgY2hh
ciBfX2luaXRjb25zdCBvcHRfYnVpbHRpbl9jbWRsaW5lW10gPSBDT05GSUdfQ01ETElORTsNCj4g
DQo+ICsvKg0KPiArICogQ2FsY3VsYXRlIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdHdvIGNoYXJh
Y3RlcnMgZm9yIGNvbW1hbmQgbGluZQ0KPiBwYXJzaW5nDQo+ICsgKiBwdXJwb3NlcywgaS5lLiB0
cmVhdGluZyAnLScgYW5kICdfJyB0aGUgc2FtZS4NCj4gKyAqLw0KPiArc3RhdGljIGludCBjZGlm
Zih1bnNpZ25lZCBjaGFyIGMxLCB1bnNpZ25lZCBjaGFyIGMyKQ0KPiArew0KPiArICAgIGludCBy
ZXMgPSBjMSAtIGMyOw0KPiArDQo+ICsgICAgaWYgKCByZXMgJiYgKGMxIF4gYzIpID09ICgnLScg
XiAnXycpICYmDQo+ICsgICAgICAgICAoYzEgPT0gJy0nIHx8IGMxID09ICdfJykgKQ0KPiArICAg
ICAgICByZXMgPSAwOw0KPiArDQoNCldvdyEgVGhhdCBtYWtlcyBteSBoZWFkIGh1cnQuIEhvdyBh
Ym91dDoNCg0Kc3RhdGljIGludCBjZGlmZih1bnNpZ25lZCBjaGFyIGMxLCB1bnNpZ25lZCBjaGFy
IGMyKQ0Kew0KICAgIGlmICggYzEgPT0gJy0nICkNCiAgICAgICAgYzEgPSAnXyc7DQoNCiAgICBp
ZiAoIGMyID09ICctJyApDQogICAgICAgIGMyID0gJ18nOw0KDQogICAgcmV0dXJuIGMxIC0gYzI7
DQp9DQoNCj8NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

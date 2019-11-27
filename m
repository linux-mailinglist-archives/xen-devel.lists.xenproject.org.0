Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6010B25E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:24:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZz9H-0007wC-Kk; Wed, 27 Nov 2019 15:22:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gNPh=ZT=amazon.de=prvs=227bc8624=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZz9F-0007w7-QB
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:22:33 +0000
X-Inumbo-ID: bb9e8c48-1129-11ea-b155-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb9e8c48-1129-11ea-b155-bc764e2007e4;
 Wed, 27 Nov 2019 15:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574868153; x=1606404153;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=ujmEfYNJ9ea7Es4hb8Qfi7ZvxyxcyqVb+F0X4h2yY3k=;
 b=fuxxYftW8R2pilD6+1lMgWXYwJKszpdGLX7nYi3RRtWWtf5i3OB8V2GJ
 ja/4K/X34/lJx/n+2n3OPzRKOf//QVjjMVKQTdONELf6V98s68DhU6+P4
 WX6iWk2oMNTkuwqUt+KTjZOhhJKRykMuX6P4ytbpbN4jbS2iHwGZW6IrY I=;
IronPort-SDR: 8xvHPkWzWUujIZQlH+hMD9hy+MwBM54o++cnYV5QCBCQTvvU3VL3Bu9qZTj4I96LYMS0Ky6O8F
 JrScpcFHlECg==
X-IronPort-AV: E=Sophos;i="5.69,249,1571702400"; 
   d="scan'208";a="1825393"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 27 Nov 2019 15:22:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id EB331A18DD; Wed, 27 Nov 2019 15:22:21 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 15:22:21 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 15:22:20 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 27 Nov 2019 15:22:20 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Thread-Topic: livepatch-build-tools regression
Thread-Index: AQHVni9ReRquixYoHEOXl3oCOkZoJaeRI0wAgAAGFwCAAAVUAIAAA80AgAGMj4CAATPFAIAJ1PUAgAANBQCAARbnAIAARNKA
Date: Wed, 27 Nov 2019 15:22:20 +0000
Message-ID: <B621C71F-0798-4CAC-8201-484D17A93888@amazon.com>
References: <5ef38d72-3a80-e2ef-68d9-ec498866d4eb@citrix.com>
 <DD847497-6517-4668-9AD6-66F11B91288A@amazon.com>
 <b686f6b2-96e4-6f41-7844-bb0ab184cc71@citrix.com>
 <D092B667-0662-4B8E-958E-02B14530C363@amazon.com>
 <d65106c4-e35d-bd69-0539-a7fb525ae776@citrix.com>
 <1A2AE077-662E-40C0-820D-13EC3B88D1F3@amazon.com>
 <69cbfa61-fae3-ee6a-b482-31cca7f05d60@citrix.com>
 <60D2D242-4806-402F-99BC-F0CE572E5925@amazon.com>
 <CF690FB1-DF59-44B3-AB3F-B2101617826E@amazon.com>
 <5efd649a-4f70-0955-a789-a7cf8ea7c377@citrix.com>
In-Reply-To: <5efd649a-4f70-0955-a789-a7cf8ea7c377@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.67]
Content-ID: <CA43182F9A45434EA0F25E950B7CB722@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] livepatch-build-tools regression
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Paraschiv, Andra-Irina" <andraprs@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Pohlack, 
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 "Manthey, Norbert" <nmanthey@amazon.de>, Martin Mazein <amazein@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Doebel,
 Bjoern" <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjcuIE5vdiAyMDE5LCBhdCAxMjoxNiwgU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5
YXNsaUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDI2LzExLzIwMTkgMTg6MzcsIFdpZWN6
b3JraWV3aWN6LCBQYXdlbCB3cm90ZToNCj4+IEl0IGxvb2tzIGxpa2UgZ2NjIHBsYXlzIHRoZSB1
c3VhbCBkaXJ0eSB0cmlja3Mgd2l0aCBsb2NhbCB2YXJpYWJsZXMgcmVuYW1pbmc6DQo+PiANCj4+
IC0geGVuLXN5bXMNCj4+ICA3NTI5OiBmZmZmODJkMDgwNWZlZDUwICAgICA4IE9CSkVDVCAgTE9D
QUwgIERFRkFVTFQgNDIzMCBsYXN0cGFnZS4yMjg1Nw0KPj4gLSBsaXZlcGF0Y2gNCj4+ICAgMjg5
OiAwMDAwMDAwMDAwMDAwMDAwICAgICA4IE9CSkVDVCAgR0xPQkFMIERFRkFVTFQgIFVORCBodm0u
YyNsYXN0cGFnZS4yMjg1Ng0KPj4gDQo+PiBUaGVuLCBzeW1ib2xzIHJlc29sdXRpb24gYnkgbmFt
ZSBmYWlscy4uDQo+PiANCj4+IENhbiB5b3UgcGxlYXNlIHRyeSB0byBidWlsZCB0aGUgbGl2ZXBh
dGNoIG1vZHVsZSB3aXRoIGFkZGl0aW9uYWwgb3B0aW9uICfigJRwcmVsaW5rJyBhbmQgZ2l2ZSBp
dCBhIHRyeSA/DQo+IA0KPiBNeSBMUCBsb2FkaW5nIGVycm9yIGlzOg0KPiANCj4gICAgKFhFTikg
bGl2ZXBhdGNoOiBscDogVW5rbm93biBzeW1ib2w6IC5MQzcNCj4gDQo+IFdoZW4gSSBwYXNzIC0t
cHJlbGluayB0byBsaXZlcGF0Y2gtYnVpbGQsIGl0IGNvbXBsYWlucyBpbiBhIHNpbWlsYXIgd2F5
Og0KPiANCj4gICAgbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzL3ByZWxpbms6IEVSUk9SOiBvdXRwdXQu
bzogbGl2ZXBhdGNoX3Jlc29sdmVfc3ltYm9sczogODA6IGxvb2t1cF9sb2NhbF9zeW1ib2wgLkxD
NyAocDJtLmMpDQo+IA0KDQpDb3VsZCB5b3UgZ2l2ZSB0aGlzIHRlc3RpbmcgcGF0Y2ggYSB0cnk/
DQoNCmRpZmYgLS1naXQgYS9jcmVhdGUtZGlmZi1vYmplY3QuYyBiL2NyZWF0ZS1kaWZmLW9iamVj
dC5jDQppbmRleCA4ZDYzOTQwLi4xMDgwN2QyIDEwMDY0NA0KLS0tIGEvY3JlYXRlLWRpZmYtb2Jq
ZWN0LmMNCisrKyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jDQpAQCAtODM5LDggKzgzOSwxMCBAQCBz
dGF0aWMgdm9pZCBrcGF0Y2hfY29tcGFyZV9zeW1ib2xzKHN0cnVjdCBsaXN0X2hlYWQgKnN5bWxp
c3QpDQogICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoc3ltLCBzeW1saXN0LCBsaXN0KSB7DQog
ICAgICAgICAgICAgICAgaWYgKHN5bS0+dHdpbikNCiAgICAgICAgICAgICAgICAgICAgICAgIGtw
YXRjaF9jb21wYXJlX2NvcnJlbGF0ZWRfc3ltYm9sKHN5bSk7DQotICAgICAgICAgICAgICAgZWxz
ZQ0KKyAgICAgICAgICAgICAgIGVsc2Ugew0KICAgICAgICAgICAgICAgICAgICAgICAgc3ltLT5z
dGF0dXMgPSBORVc7DQorICAgICAgICAgICAgICAgICAgICAgICBzeW0tPmluY2x1ZGUgPSAxOw0K
KyAgICAgICAgICAgICAgIH0NCg0KICAgICAgICAgICAgICAgIGxvZ19kZWJ1Zygic3ltYm9sICVz
IGlzICVzXG4iLCBzeW0tPm5hbWUsIHN0YXR1c19zdHIoc3ltLT5zdGF0dXMpKTsNCiAgICAgICAg
fQ0KDQo+IC0tDQo+IFRoYW5rcywNCj4gU2VyZ2V5DQoNCkJlc3QgUmVnYXJkcywNClBhd2VsIFdp
ZWN6b3JraWV3aWN6DQoNCg0KDQoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkg
R21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJp
c3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0
IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBE
RSAyODkgMjM3IDg3OQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

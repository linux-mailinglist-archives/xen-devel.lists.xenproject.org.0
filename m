Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E5E126120
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:44:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihuBQ-00082N-Fm; Thu, 19 Dec 2019 11:41:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihuBP-00082I-24
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:41:31 +0000
X-Inumbo-ID: 7f7c6cbc-2254-11ea-918a-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f7c6cbc-2254-11ea-918a-12813bfff9fa;
 Thu, 19 Dec 2019 11:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576755691; x=1608291691;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G/tLk9gbUykBLD2HPmmALsqrD1jAfMVPQ+aex/hvEG0=;
 b=AFOrKB90i9K4AmFIWSoAgd10ihtKo2I0ItY8rnaMXog4NkTt5qEYRyxJ
 RJWUdDm7g1pq3E1o65Fr4oEGGTBKe9s7FtHDOMBLRpSNaipjMPdPFe3Vz
 L+Hty0fjtYlH5yruwPhJFAE7YeppIMQSHQkHhEvCs54EnfR+udH+YZg3O I=;
IronPort-SDR: laVGunBQWIskm1RcyldxPwFa4RTSgRrDhiU1vHPFG6qn9f+q+fyCXU7fxVrUD6iTMZ7UZ/FKJc
 uPzHpnJ4om8g==
X-IronPort-AV: E=Sophos;i="5.69,331,1571702400"; 
   d="scan'208";a="6040477"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 19 Dec 2019 11:41:20 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9A7A6A285E; Thu, 19 Dec 2019 11:41:18 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 11:41:18 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 11:41:17 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 19 Dec 2019 11:41:17 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH] x86/hvm/rtc: preserved guest RTC offset during
 suspend/resume/migrate
Thread-Index: AQHVtbFC25G9AtN2Ek6XlZIZd8wXs6fBU9CAgAAAU5A=
Date: Thu, 19 Dec 2019 11:41:17 +0000
Message-ID: <68efdd44703a4f0f926dbfbceb39884b@EX13D32EUC003.ant.amazon.com>
References: <20191218144133.16089-1-pdurrant@amazon.com>
 <3f5cadab-bdef-25ab-69e9-8a12c1899ee1@suse.com>
In-Reply-To: <3f5cadab-bdef-25ab-69e9-8a12c1899ee1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.49]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/hvm/rtc: preserved guest RTC offset
 during suspend/resume/migrate
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE5IERlY2VtYmVyIDIwMTkgMTE6MzANCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8
Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjsNCj4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXgu
Y29tPjsgSWFuIEphY2tzb24NCj4gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBLb25yYWQg
Unplc3p1dGVrIFdpbGsNCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBXZWkgTGl1IDx3bEB4
ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0hdIHg4Ni9odm0vcnRjOiBwcmVzZXJ2ZWQgZ3Vlc3QgUlRDIG9mZnNl
dCBkdXJpbmcNCj4gc3VzcGVuZC9yZXN1bWUvbWlncmF0ZQ0KPiANCj4gT24gMTguMTIuMjAxOSAx
NTo0MSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IFRoZSBlbXVsYXRlZCBSVEMgaXMgc3luY2hy
b25pemVkIHdpdGggdGhlIFBWIHdhbGxjbG9jazsgYW55IHdyaXRlIHRvIHRoZQ0KPiA+IFJUQyB3
aWxsIHVwZGF0ZSBzdHJ1Y3QgZG9tYWluJ3MgJ3RpbWVfb2Zmc2V0X3NlY29uZHMnIGZpZWxkIGFu
ZCBjYWxsDQo+ID4gdXBkYXRlX2RvbWFpbl93YWxsY2xvY2soKS4NCj4gPg0KPiA+IEhvd2V2ZXIs
IHRoZSB2YWx1ZSBvZiAndGltZV9vZmZzZXRfc2Vjb25kcycgaXMgbm90IHByZXNlcnZlZCBpbiBh
bnkgc2F2ZQ0KPiA+IHJlY29yZCBhbmQgaW5kZWVkLCB3aGVuIHRoZSBSVEMgc2F2ZSByZWNvcmQg
aXMgbG9hZGVkLCB0aGUgQ01PUyB2YWx1ZXMNCj4gPiB3aWxsIGJlIHVwZGF0ZWQgYmFzZWQgb24g
YW4gb2Zmc2V0IHZhbHVlIHdoaWNoIG1heSBvciBtYXkgbm90IGhhdmUgYmVlbg0KPiA+IHNldCBi
eSB0aGUgdG9vbHN0YWNrIFsxXS4gVGhpcyBtYXkgcmVzdWx0IGluIG1ha2luZyBib2d1cyB2YWx1
ZXMNCj4gYXZhaWxhYmxlDQo+ID4gdG8gdGhlIGd1ZXN0IGFuZCBtZXNzaW5nIHVwIGFueSBjYWxj
dWxhdGlvbnMgZG9uZSBpbiB0aGUgY2FsbCB0bw0KPiA+IGFsYXJtX3RpbWVyX3VwZGF0ZSgpIGF0
IHRoZSBlbmQgb2YgcnRjX2xvYWQoKS4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggZXh0ZW5kcyB0aGUg
UlRDIHNhdmUgcmVjb3JkIHRvIGNvbnRhaW4gYW4gb2Zmc2V0IHZhbHVlLCB3aGljaA0KPiA+IHdp
bGwgYmUgemVybyBmaWxsZWQgb24gbG9hZCBvZiBhbiBvbGRlciByZWNvcmQuIFRoZQ0KPiAndGlt
ZV9vZmZzZXRfc2Vjb29uZHMnDQo+ID4gZmllbGQgaW4gc3RydWN0IGRvbWFpbiBpcyBhbHNvIG1v
ZGlmaWVkIGludG8gYSAndGltZV9vZmZzZXQnIHN0cnVjdCwNCj4gPiBjb250YWluaW5nIGEgJ3Nl
Y29uZHMnIGZpZWxkIGFuZCBhIGJvb2xlYW4gJ3NldCcgZmllbGQuDQo+ID4NCj4gPiBUaGUgY29k
ZSBpbiBydGNfbG9hZCgpIHRoZW4gdXNlcyB0aGUgbmV3IHZhbHVlIGluIHRoZSBzYXZlIHJlY29y
ZCB0bw0KPiA+IHVwZGF0ZSB0aGUgdmFsdWUgb2Ygc3RydWN0IGRvbWFpbidzICd0aW1lX29mZnNl
dC5zZWNvbmRzJyB1bmxlc3MNCj4gPiAndGltZV9vZmZzZXQuc2V0JyBpcyB0cnVlLCB3aGljaCB3
aWxsIG9ubHkgYmUgdGhlIGNhc2UgaWYgdGhlIHRvb2xzdGFjaw0KPiBoYXMNCj4gPiBhbHJlYWR5
IHBlcmZvcm1lZCBhIFhFTl9ET01DVExfc2V0dGltZW9mZnNldC4NCj4gPg0KPiA+IFsxXSBUaGVy
ZSBpcyBjdXJyZW50bHkgbm8gd2F5IGZvciBhIHRvb2xzdGFjayB0byByZWFkIHRoZSB2YWx1ZSBv
Zg0KPiA+ICAgICAndGltZV9vZmZzZXRfc2Vjb25kcycgZnJvbSBzdHJ1Y3QgZG9tYWluLiBJbiB0
aGUgcGFzdCwgYW55IGhvcGUgb2YNCj4gPiAgICAgcHJlc2VydmF0aW9uIG9mIHRoZSB2YWx1ZSBh
Y3Jvc3MgYSBndWVzdCBsaWZlLWN5Y2xlIG9wZXJhdGlvbiB3YXMNCj4gYmFzZWQNCj4gPiAgICAg
b24gcmVseWluZyBvbiBxZW11LWRtIHRvIHdyaXRlIGEgdmFsdWUgaW50byB4ZW5zdG9yZSB3aGVu
ZXZlciB0aGUNCj4gUlRDDQo+ID4gICAgIHdhcyB1cGRhdGVkLCBpbiByZXNwb25zZSB0byBhbiBJ
T1JFUSB3aXRoIHR5cGUgSU9SRVFfVFlQRV9USU1FT0ZGU0VUDQo+ID4gICAgIGJlaW5nIHNlbnQg
YnkgWGVuOyBzZWU6DQo+ID4NCj4gPiAgICAgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPXFlbXUteGVuLQ0KPiB0cmFkaXRpb25hbC5naXQ7YT1ibG9iO2Y9aTM4Ni1kbS9oZWxwZXIy
LmMjbDQ1Nw0KPiA+DQo+ID4gICAgIGJ1dCB0aGlzIGJlaGF2aW91ciB3YXMgbmV2ZXIgZm9yd2Fy
ZC1wb3J0ZWQgaW50byB1cHN0cmVhbSBRRU1VLA0KPiB3aGljaA0KPiA+ICAgICBjb21wbGV0ZWx5
IGlnbm9yZXMgdGhhdCBJT1JFUSB0eXBlLg0KPiA+ICAgICBJbiBlaXRoZXIgY2FzZSwgbm90aGlu
ZyBpbiB4bCBvciBsaWJ4bCBldmVyIHNhbXBsZXMgdGhlIHZhbHVlIG9mDQo+ID4gICAgIFJUQyBv
ZmZzZXQgZnJvbSB4ZW5zdG9yZSBzbyBhbnkgb2Zmc2V0IGFkanVzdG1lbnQgdG8gYSBub24temVy
bw0KPiB2YWx1ZQ0KPiA+ICAgICBwZXJmb3JtZWQgYnkgdGhlIGd1ZXN0ICh3aGljaCBpbiB0aGUg
Y2FzZSBvZiBXaW5kb3dzIGlzIGhpZ2hseQ0KPiBsaWtlbHkNCj4gPiAgICAgYXMgaXQgbm9ybWFs
bHkgd3JpdGVzIFJUQyBpbiBsb2NhbCB0aW1lLCB3aGVyZWFzIFhlbiBtYWludGFpbnMgdGltZQ0K
PiBpbg0KPiA+ICAgICBVVEMpIGlzIGNvbXBsZXRlbHkgbG9zdCB3aXRoIHRoZSBkZS1mYWN0byB0
b29sc3RhY2ssIGFuZCBhbHdheXMgaGFzDQo+ID4gICAgIGJlZW4uIEluc3RlYWQsIFBWIGRyaXZl
cnMgYXJlIHJlbGllZCB1cG9uIHRvIHBhcGVyIG92ZXIgdGhpcyBnYXBpbmcNCj4gPiAgICAgaG9s
ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9u
LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQoNClRoYW5rcy4NCg0KPiB3aXRoIG9uZSByZW1hcms6DQo+IA0KPiA+IEBAIC03NzEsNiArNzcz
LDEyIEBAIHN0YXRpYyBpbnQgcnRjX2xvYWQoc3RydWN0IGRvbWFpbiAqZCwNCj4gaHZtX2RvbWFp
bl9jb250ZXh0X3QgKmgpDQo+ID4NCj4gPiAgICAgIC8qIFJlc2V0IHRoZSB3YWxsLWNsb2NrIHRp
bWUuICBJbiBub3JtYWwgcnVubmluZywgdGhpcyBydW5zIHdpdGgNCj4gaG9zdA0KPiA+ICAgICAg
ICogdGltZSwgc28gbGV0J3Mga2VlcCBkb2luZyB0aGF0LiAqLw0KPiA+ICsgICAgaWYgKCAhZC0+
dGltZV9vZmZzZXQuc2V0ICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBkLT50aW1lX29mZnNl
dC5zZWNvbmRzID0gcy0+aHcucnRjX29mZnNldDsNCj4gPiArICAgICAgICB1cGRhdGVfZG9tYWlu
X3dhbGxjbG9ja190aW1lKGQpOw0KPiA+ICsgICAgfQ0KPiANCj4gSXQncyBub3QgcmVhbGx5IGNs
ZWFyIHRvIG1lIHdoaWNoIG9mIHRoZSBwb3NzaWJsZSBiZWhhdmlvcnMgaXMgdGhlDQo+IGJldHRl
ciBvbmUgLSBvdmVycmlkaW5nIGEgdG9vbCBzdGFjayBzZXQgdmFsdWUgd2l0aCB3aGF0IHRoZSBz
YXZlDQo+IHJlY29yZCBzYXlzLCBvciAobGlrZSB5b3UgZG8pIHRoZSBvdGhlciB3YXkgYXJvdW5k
Lg0KDQpJdCdzIG5vdCBjbGVhciB0byBtZSBlaXRoZXIsIHdoaWNoIGlzIHdoeSBJIGVycmVkIG9u
IHRoZSBzaWRlIG9mIGNhdXRpb24uIEkgZGlkbid0IHdhbnQgdG8gYnJlYWsgYW55IG91dC1vZi10
cmVlIHRvb2xzdGFja3MgdGhhdCBtaWdodCBiZSBvdmVycmlkaW5nIHRoZSBvZmZzZXQgZWFybHkg
aW4gdGhlIHJlc3RvcmUgcGhhc2UgZnJvbSBhIHZhbHVlIGFjcXVpcmVkIHZpYSBRRU1VIGhhY2tl
cnkuIEkgZ3Vlc3MgdGhlIGJvb2xlYW4gY291bGQgYmUgZGlzcGVuc2VkIHdpdGggaWYgd2UgcmV0
aXJlIHRoZSBJT1JFUSBhbmQgc2lsZW50bHkgaWdub3JlIHRoZSBET01DVEwgZm9yIEhWTSBndWVz
dHMgKHNvIG92ZXJyaWRlcyBmcm9tIHRoZSBhZm9yZW1lbnRpb25lZCB0b29sc3RhY2tzIHNpbXBs
eSBoYXZlIG5vIGVmZmVjdCkuDQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

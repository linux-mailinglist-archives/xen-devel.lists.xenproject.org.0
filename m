Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B16C524386B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 12:23:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6AOH-0001j2-K6; Thu, 13 Aug 2020 10:23:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GToo=BX=amazon.co.uk=prvs=48723a21b=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k6AOG-0001im-15
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 10:23:20 +0000
X-Inumbo-ID: 4f0c6234-ee69-4951-9d0d-de4e8cddc4eb
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f0c6234-ee69-4951-9d0d-de4e8cddc4eb;
 Thu, 13 Aug 2020 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1597314198; x=1628850198;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=f9d29F5sGGI8DNbvbpAXZsjT8iYjQOn60gVR063u9eI=;
 b=lS6stSptRndmcyzFXya86+oAgIubvCNn8+NEKs9x6hJB37wLWQ1ifNkj
 qFrx7hAT4LVc8gm2cou0f6cIgGJKUm8BejZKpKlTlHxGmQBxnYoQhxVQS
 i86PuvLYyerx+5i7sfejxgDRjbcqeP2MTS3zsqUJgA/9EHqep/k6CbhxS Q=;
IronPort-SDR: cBYbhNwPbEE72GcZJtGSVo5+Oq0+LXPUMejEOxiwrzDKhmuhVam/hLdEw83HFqWAhhxeK84naK
 26Y/LlK78Ysg==
X-IronPort-AV: E=Sophos;i="5.76,307,1592870400"; d="scan'208";a="59516527"
Subject: RE: [PATCH] x86 / viridian: remove the viridian_vcpu msg_pending bit
 mask
Thread-Topic: [PATCH] x86 / viridian: remove the viridian_vcpu msg_pending bit
 mask
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 13 Aug 2020 10:23:06 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 335B9A1DEE; Thu, 13 Aug 2020 10:23:05 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 13 Aug 2020 10:23:04 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 13 Aug 2020 10:23:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Thu, 13 Aug 2020 10:23:03 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Paul Durrant
 <paul@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
 <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Thread-Index: AQHWcVhFVTPR3g/PfkyRDqUr3TeWt6k10r6AgAAAj/A=
Date: Thu, 13 Aug 2020 10:23:03 +0000
Message-ID: <b1d35e6abeef4c688d4d0f6a715406e9@EX13D32EUC003.ant.amazon.com>
References: <20200813095723.1429-1-paul@xen.org>
 <20200813101549.GH975@Air-de-Roger>
In-Reply-To: <20200813101549.GH975@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDogMTMgQXVndXN0IDIwMjAgMTE6MTYNCj4gVG86
IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOyBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBXZWkgTGl1
IDx3bEB4ZW4ub3JnPjsgSmFuDQo+IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUkU6IFtFWFRF
Uk5BTF0gW1BBVENIXSB4ODYgLyB2aXJpZGlhbjogcmVtb3ZlIHRoZSB2aXJpZGlhbl92Y3B1IG1z
Z19wZW5kaW5nIGJpdCBtYXNrDQo+IA0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQg
ZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuDQo+IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQg
a25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IA0KPiBPbiBUaHUsIEF1ZyAxMywg
MjAyMCBhdCAxMDo1NzoyM0FNICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gRnJvbTog
UGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiA+DQo+ID4gVGhlIG1hc2sgZG9l
cyBub3QgYWN0dWFsbHkgc2VydmUgYSB1c2VmdWwgcHVycG9zZSBhcyB3ZSBvbmx5IHVzZSB0aGUg
U3luSUMNCj4gPiBmb3IgdGltZXIgbWVzc2FnZXMuDQo+IA0KPiBPaCwgSSBzZWUuIEkgYXNzdW1l
IGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSBiZWNhdXNlIHRoZXJlIGNhbiBvbmx5IGJlIGENCj4gc2lu
Z2xlIG1lc3NhZ2UgcGVuZGluZyAoYSB0aW1lciBvbmUpLCBhbmQgaGVuY2UgdGhlcmUgaXNuJ3Qg
bXVjaCB2YWx1ZQ0KPiBpbiBkb2luZyB0aGlzIFN5bklDIHBlbmRpbmcgdHJhY2tpbmc/DQoNClll
cywgZXhhY3RseS4gV2UnZCBwb3RlbnRpYWxseSBuZWVkIHRvIGFkZCBjb2RlIGJhY2sgaW4gaWYg
d2UgdXNlIHRoZSBzeW5pYyBmb3Igb3RoZXIgbWVzc2FnZSB0eXBlcyAoZS5nLiBpbXBsZW1lbnRp
bmcgSHZQb3N0TWVzc2FnZSwgcGVyaGFwcyBvbiB0b3Agb2YgdGhlIGFyZ28gZnJhbWV3b3JrKS4N
Cg0KPiANCj4gPiBEcm9wcGluZyB0aGUgbWFzayBtZWFucyB0aGF0IHRoZSBFT00gTVNSIGhhbmRs
ZXINCj4gPiBlc3NlbnRpYWxseSBiZWNvbWVzIGEgbm8tb3AuIFRoaXMgbWVhbnMgd2UgY2FuIGF2
b2lkIHNldHRpbmcgJ21lc3NhZ2VfcGVuZGluZycNCj4gPiBmb3IgdGltZXIgbWVzc2FnZXMgYW5k
IGhlbmNlIGF2b2lkIGEgVk1FWElUIGZvciB0aGUgRU9NLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiANCg0KVGhhbmtzLg0K
DQo+IEkndmUgZ290IHNvbWUgcXVlc3Rpb24gYmVsb3cgYW5kIG9uZSBuaXQuDQo+IA0KPiA+IC0t
LQ0KPiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiA+IENjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+ID4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo+ID4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQo+ID4NCj4gPiBUaGlzIHNob3VsZCBob3BlZnVsbHkgc2ltcGxpZnkgUm9nZXIncyAieDg2
L3ZsYXBpYzogaW1wbGVtZW50IEVPSSBjYWxsYmFja3MiDQo+ID4gc2VyaWVzIGEgbGl0dGxlLg0K
PiA+IC0tLQ0KPiA+ICB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3N5bmljLmMgIHwgMjQgKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMgICAg
ICAgICAgfCAgMiAtLQ0KPiA+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92aXJpZGlhbi5oIHwg
IDIgLS0NCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjcgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi9zeW5p
Yy5jIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi9zeW5pYy5jDQo+ID4gaW5kZXggOTRhMmI4
ODczMy4uMjJlMmRmMjdlNSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3Zpcmlk
aWFuL3N5bmljLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3N5bmljLmMN
Cj4gPiBAQCAtMTM3LDcgKzEzNyw2IEBAIGludCB2aXJpZGlhbl9zeW5pY193cm1zcihzdHJ1Y3Qg
dmNwdSAqdiwgdWludDMyX3QgaWR4LCB1aW50NjRfdCB2YWwpDQo+ID4gICAgICAgICAgaWYgKCAh
KHZpcmlkaWFuX2ZlYXR1cmVfbWFzayhkKSAmIEhWTVBWX3N5bmljKSApDQo+ID4gICAgICAgICAg
ICAgIHJldHVybiBYODZFTVVMX0VYQ0VQVElPTjsNCj4gPg0KPiA+IC0gICAgICAgIHZ2LT5tc2df
cGVuZGluZyA9IDA7DQo+ID4gICAgICAgICAgYnJlYWs7DQo+ID4NCj4gPiAgICAgIGNhc2UgSFZf
WDY0X01TUl9TSU5UMCAuLi4gSFZfWDY0X01TUl9TSU5UMTU6DQo+ID4gQEAgLTE2OCw5ICsxNjcs
NiBAQCBpbnQgdmlyaWRpYW5fc3luaWNfd3Jtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IGlk
eCwgdWludDY0X3QgdmFsKQ0KPiA+ICAgICAgICAgIHByaW50ayhYRU5MT0dfR19JTkZPICIlcHY6
IFZJUklESUFOIFNJTlQldTogdmVjdG9yOiAleFxuIiwgdiwgc2ludHgsDQo+ID4gICAgICAgICAg
ICAgICAgIHZlY3Rvcik7DQo+ID4NCj4gPiAtICAgICAgICBpZiAoIG5ldy5wb2xsaW5nICkNCj4g
PiAtICAgICAgICAgICAgX19jbGVhcl9iaXQoc2ludHgsICZ2di0+bXNnX3BlbmRpbmcpOw0KPiA+
IC0NCj4gPiAgICAgICAgICAqdnMgPSBuZXc7DQo+ID4gICAgICAgICAgYnJlYWs7DQo+ID4gICAg
ICB9DQo+ID4gQEAgLTMzNCw5ICszMzAsNiBAQCBib29sIHZpcmlkaWFuX3N5bmljX2RlbGl2ZXJf
dGltZXJfbXNnKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgc2ludHgsDQo+ID4gICAgICAg
ICAgLkRlbGl2ZXJ5VGltZSA9IGRlbGl2ZXJ5LA0KPiA+ICAgICAgfTsNCj4gPg0KPiA+IC0gICAg
aWYgKCB0ZXN0X2JpdChzaW50eCwgJnZ2LT5tc2dfcGVuZGluZykgKQ0KPiA+IC0gICAgICAgIHJl
dHVybiBmYWxzZTsNCj4gPiAtDQo+ID4gICAgICAvKg0KPiA+ICAgICAgICogVG8gYXZvaWQgdXNp
bmcgYW4gYXRvbWljIHRlc3QtYW5kLXNldCwgYW5kIGJhcnJpZXIgYmVmb3JlIGNhbGxpbmcNCj4g
PiAgICAgICAqIHZsYXBpY19zZXRfaXJxKCksIHRoaXMgZnVuY3Rpb24gbXVzdCBiZSBjYWxsZWQg
aW4gY29udGV4dCBvZiB0aGUNCj4gPiBAQCAtMzQ2LDEyICszMzksOSBAQCBib29sIHZpcmlkaWFu
X3N5bmljX2RlbGl2ZXJfdGltZXJfbXNnKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgc2lu
dHgsDQo+ID4NCj4gPiAgICAgIG1zZyArPSBzaW50eDsNCj4gPg0KPiA+ICsgICAgLyogVGhlcmUg
aXMgbm8gbmVlZCB0byBzZXQgbWVzc2FnZV9wZW5kaW5nIGFzIHdlIGRvIG5vdCByZXF1aXJlIGFu
IEVPTSAqLw0KPiA+ICAgICAgaWYgKCBtc2ctPmhlYWRlci5tZXNzYWdlX3R5cGUgIT0gSFZNU0df
Tk9ORSApDQo+IA0KPiBJIHRoaW5rIGl0J3MgZmluZSB0byB1c2UgSFZNU0dfTk9ORSBBVE0gYmVj
YXVzZSBYZW4gb25seSBrbm93cyBhYm91dA0KPiB0aW1lciBtZXNzYWdlcywgYnV0IGxvbmcgdGVy
bSB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gdXNlDQo+IEhWTVNHX1RJTUVSX0VYUElSRUQ/DQo+
IA0KDQpJIGRvbid0IHRoaW5rIHNvLiBUaGUgdGVzdCBpcyBzdXBwb3NlZCB0byBiZSAnaXMgdGhl
IHNsb3Qgb2NjdXBpZWQnLiBJbiBmdXR1cmUgd2UgY291bGQgaW50cm9kdWNlIHN1cHBvcnQgZm9y
IG5ldyBtZXNzYWdlIHR5cGVzIGFuZCBoZW5jZSBhIGNoZWNrIG9mICE9IEhWTVNHX05PTkUgc2Vl
bXMgbGlrZSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uDQoNCj4gPiAtICAgIHsNCj4gPiAtICAgICAg
ICBtc2ctPmhlYWRlci5tZXNzYWdlX2ZsYWdzLm1zZ19wZW5kaW5nID0gMTsNCj4gPiAtICAgICAg
ICBfX3NldF9iaXQoc2ludHgsICZ2di0+bXNnX3BlbmRpbmcpOw0KPiA+ICAgICAgICAgIHJldHVy
biBmYWxzZTsNCj4gPiAtICAgIH0NCj4gPg0KPiA+ICAgICAgbXNnLT5oZWFkZXIubWVzc2FnZV90
eXBlID0gSFZNU0dfVElNRVJfRVhQSVJFRDsNCj4gPiAgICAgIG1zZy0+aGVhZGVyLm1lc3NhZ2Vf
ZmxhZ3MubXNnX3BlbmRpbmcgPSAwOw0KPiA+IEBAIC0zODAsMTggKzM3MCw2IEBAIGJvb2wgdmly
aWRpYW5fc3luaWNfaXNfYXV0b19lb2lfc2ludChjb25zdCBzdHJ1Y3QgdmNwdSAqdiwNCj4gPiAg
ICAgIHJldHVybiB2cy0+YXV0b19lb2k7DQo+ID4gIH0NCj4gPg0KPiA+IC12b2lkIHZpcmlkaWFu
X3N5bmljX2Fja19zaW50KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgdmVjdG9y
KQ0KPiA+IC17DQo+ID4gLSAgICBzdHJ1Y3QgdmlyaWRpYW5fdmNwdSAqdnYgPSB2LT5hcmNoLmh2
bS52aXJpZGlhbjsNCj4gPiAtICAgIHVuc2lnbmVkIGludCBzaW50eCA9IHZ2LT52ZWN0b3JfdG9f
c2ludHhbdmVjdG9yXTsNCj4gPiAtDQo+ID4gLSAgICBBU1NFUlQodiA9PSBjdXJyZW50KTsNCj4g
PiAtDQo+ID4gLSAgICBpZiAoIHNpbnR4IDwgQVJSQVlfU0laRSh2di0+c2ludCkgKQ0KPiA+IC0g
ICAgICAgIF9fY2xlYXJfYml0KGFycmF5X2luZGV4X25vc3BlYyhzaW50eCwgQVJSQVlfU0laRSh2
di0+c2ludCkpLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICZ2di0+bXNnX3BlbmRpbmcpOw0K
PiA+IC19DQo+ID4gLQ0KPiA+ICB2b2lkIHZpcmlkaWFuX3N5bmljX3NhdmVfdmNwdV9jdHh0KGNv
bnN0IHN0cnVjdCB2Y3B1ICp2LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBodm1fdmlyaWRpYW5fdmNwdV9jb250ZXh0ICpjdHh0KQ0KPiA+ICB7DQo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMgYi94ZW4vYXJjaC94ODYvaHZt
L3ZsYXBpYy5jDQo+ID4gaW5kZXggN2I1YzYzMzAzMy4uMWFmZjRjZjk4OSAxMDA2NDQNCj4gPiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZsYXBpYy5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2
bS92bGFwaWMuYw0KPiA+IEBAIC00NjYsOCArNDY2LDYgQEAgdm9pZCB2bGFwaWNfaGFuZGxlX0VP
SShzdHJ1Y3QgdmxhcGljICp2bGFwaWMsIHU4IHZlY3RvcikNCj4gPg0KPiA+ICAgICAgaWYgKCB2
bGFwaWNfdGVzdF92ZWN0b3IodmVjdG9yLCAmdmxhcGljLT5yZWdzLT5kYXRhW0FQSUNfVE1SXSkg
KQ0KPiA+ICAgICAgICAgIHZpb2FwaWNfdXBkYXRlX0VPSShkLCB2ZWN0b3IpOw0KPiA+IC0gICAg
ZWxzZSBpZiAoIGhhc192aXJpZGlhbl9zeW5pYyhkKSApDQo+ID4gLSAgICAgICAgdmlyaWRpYW5f
c3luaWNfYWNrX3NpbnQodiwgdmVjdG9yKTsNCj4gDQo+IFBsZWFzZSBhbHNvIGNsZWFuIHRoZSBj
b21tZW50IGFib3ZlIGFib3V0IFN5bklDIFNJTlR4IGJlaW5nIGVkZ2UNCj4gdHJpZ2dlcmVkLg0K
PiANCg0KT2ggeWVzLCBJJ2xsIHNlbmQgYSB2Mi4NCg0KICBQYXVsDQoNCj4gVGhhbmtzLCBSb2dl
ci4NCg==


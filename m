Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2F0AEB3E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:16:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7fwq-0006r7-6j; Tue, 10 Sep 2019 13:12:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M1KC=XF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i7fwo-0006r2-N8
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:12:42 +0000
X-Inumbo-ID: ab1640f4-d3cc-11e9-ac1d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab1640f4-d3cc-11e9-ac1d-12813bfff9fa;
 Tue, 10 Sep 2019 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568121161;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sDoSrnH15362IivK/8zt2x2nvZ4ybBXvydEWpsp0CPU=;
 b=g7kwiAF1hGkrDujlFQcqH8XgnoCqesNfkuxXAUJQSifOgeN1M6/pqRQL
 cLQfi9xaUTYRYSoIqHHIee/j9AydyiIFo2r+JYsp/RTdcCRf2umrZxC8a
 kfBs3W2QSqlfGmoEpxZNVE794IIxXM6uPIYprLH1uKUu1ZZC+hzdjPtlc M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rw0lAuI4s4qK5X84Avxnut1TU+FPud7OwhhGrY69JyL8+FlchHUorIIQaK6xAy9Q7BsWt/mk6p
 15VnsdRnKi7cE+c0HidOByF4iCs49KaPZCcYnvBioVifjHXv1P/gdHpQh42vgmCyaZG54sVTHM
 qlquWhCMh+vZbm+Sl1vnBz3MWq0CtYHu+qOT+e702EElXNpRYEvN72rqQfAVPO+M3zN/8Izoq2
 EubZXxO5S6duwDPmkngZXXTHg2WEeeinz3iPqT8IK7DoNJkyCLJ6CkBQ2fAfxr9KovMz9CSLUi
 NVc=
X-SBRS: 2.7
X-MesageID: 5560387
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5560387"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 07/11] ioreq: allow registering internal ioreq server
 handler
Thread-Index: AQHVYnK4z4GxRsrl30eTUjzmnC+3HKck7V1g
Date: Tue, 10 Sep 2019 13:12:37 +0000
Message-ID: <04871248729b4790ac6ac18688d305cf@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-8-roger.pau@citrix.com>
In-Reply-To: <20190903161428.7159-8-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 07/11] ioreq: allow registering internal
 ioreq server handler
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9nZXIgUGF1IE1vbm5l
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDogMDMgU2VwdGVtYmVyIDIwMTkgMTc6MTQN
Cj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogUm9nZXIgUGF1IE1v
bm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNp
dHJpeC5jb20+OyBKYW4gQmV1bGljaA0KPiA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29v
cGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4g
U3ViamVjdDogW1BBVENIIHYyIDA3LzExXSBpb3JlcTogYWxsb3cgcmVnaXN0ZXJpbmcgaW50ZXJu
YWwgaW9yZXEgc2VydmVyIGhhbmRsZXINCj4gDQo+IFByb3ZpZGUgYSByb3V0aW5lIHRvIHJlZ2lz
dGVyIHRoZSBoYW5kbGVyIGZvciBhbiBpbnRlcm5hbCBpb3JlcQ0KPiBzZXJ2ZXIuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4g
LS0tDQo+IENoYW5nZXMgc2luY2UgdjE6DQo+ICAtIEFsbG93IHRvIHByb3ZpZGUgYW4gb3BhcXVl
IGRhdGEgcGFyYW1ldGVyIHRvIHBhc3MgdG8gdGhlIGhhbmRsZXIuDQo+ICAtIEFsbG93IGNoYW5n
aW5nIHRoZSBoYW5kbGVyIGFzIGxvbmcgYXMgdGhlIHNlcnZlciBpcyBub3QgZW5hYmxlZC4NCj4g
LS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgICAgICAgIHwgMzUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5o
IHwgIDQgKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIGIveGVuL2FyY2gveDg2L2h2bS9p
b3JlcS5jDQo+IGluZGV4IDgzMzFhODllYWUuLjYzMzllNWY4ODQgMTAwNjQ0DQo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vaW9yZXEuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMN
Cj4gQEAgLTQ4NSw2ICs0ODUsNDEgQEAgc3RhdGljIGludCBodm1fYWRkX2lvcmVxX2dmbihzdHJ1
Y3QgaHZtX2lvcmVxX3NlcnZlciAqcywgYm9vbCBidWYpDQo+ICAgICAgcmV0dXJuIHJjOw0KPiAg
fQ0KPiANCj4gK2ludCBodm1fYWRkX2lvcmVxX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwgaW9z
ZXJ2aWRfdCBpZCwNCg0KSSBkaWQgYXNrIGZvciAnaHZtX3NldF9pb3JlcV9oYW5kbGVyKCknLiBJ
IHRoaW5rIGl0IG1ha2VzIG1vcmUgc2Vuc2UgYXMgdGhlcmUncyBubyBjb3JyZXNwb25kaW5nICdo
dm1fcmVtb3ZlX2lvcmVxX2hhbmRsZXIoKScuDQoNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50ICgqaGFuZGxlcikoc3RydWN0IHZjcHUgKnYsIGlvcmVxX3QgKiwgdm9pZCAqKSwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSkNCj4gK3sNCj4gKyAgICBzdHJ1
Y3QgaHZtX2lvcmVxX3NlcnZlciAqczsNCj4gKyAgICBpbnQgcmMgPSAwOw0KPiArDQo+ICsgICAg
aWYgKCAhaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSApDQo+ICsgICAgew0KPiArICAgICAgICBy
YyA9IC1FSU5WQUw7DQo+ICsgICAgICAgIGdvdG8gb3V0Ow0KDQpZb3UganVzdCB3YW50IHRvIHJl
dHVybiBoZXJlIGJlY2F1c2UgeW91J3JlIG5vdCBob2xkaW5nIHRoZSBsb2NrLg0KDQogIFBhdWwN
Cg0KPiArICAgIH0NCj4gKw0KPiArICAgIHNwaW5fbG9ja19yZWN1cnNpdmUoJmQtPmFyY2guaHZt
LmlvcmVxX3NlcnZlci5sb2NrKTsNCj4gKyAgICBzID0gZ2V0X2lvcmVxX3NlcnZlcihkLCBpZCk7
DQo+ICsgICAgaWYgKCAhcyApDQo+ICsgICAgew0KPiArICAgICAgICByYyA9IC1FTk9FTlQ7DQo+
ICsgICAgICAgIGdvdG8gb3V0Ow0KPiArICAgIH0NCj4gKyAgICBpZiAoIHMtPmVuYWJsZWQgKQ0K
PiArICAgIHsNCj4gKyAgICAgICAgcmMgPSAtRUJVU1k7DQo+ICsgICAgICAgIGdvdG8gb3V0Ow0K
PiArICAgIH0NCj4gKw0KPiArICAgIHMtPmhhbmRsZXIgPSBoYW5kbGVyOw0KPiArICAgIHMtPmRh
dGEgPSBkYXRhOw0KPiArDQo+ICsgb3V0Og0KPiArICAgIHNwaW5fdW5sb2NrX3JlY3Vyc2l2ZSgm
ZC0+YXJjaC5odm0uaW9yZXFfc2VydmVyLmxvY2spOw0KPiArDQo+ICsgICAgcmV0dXJuIHJjOw0K
PiArfQ0KPiArDQo+ICBzdGF0aWMgdm9pZCBodm1fdXBkYXRlX2lvcmVxX2V2dGNobihzdHJ1Y3Qg
aHZtX2lvcmVxX3NlcnZlciAqcywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBodm1faW9yZXFfdmNwdSAqc3YpDQo+ICB7DQo+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaW9y
ZXEuaA0KPiBpbmRleCBjMzkxN2FhNzRkLi45MGNjMmFhOTM4IDEwMDY0NA0KPiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL2lvcmVxLmgNCj4gQEAgLTU0LDYgKzU0LDEwIEBAIHVuc2lnbmVkIGludCBodm1fYnJvYWRj
YXN0X2lvcmVxKGlvcmVxX3QgKnAsIGJvb2wgYnVmZmVyZWQpOw0KPiANCj4gIHZvaWQgaHZtX2lv
cmVxX2luaXQoc3RydWN0IGRvbWFpbiAqZCk7DQo+IA0KPiAraW50IGh2bV9hZGRfaW9yZXFfaGFu
ZGxlcihzdHJ1Y3QgZG9tYWluICpkLCBpb3NlcnZpZF90IGlkLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgKCpoYW5kbGVyKShzdHJ1Y3QgdmNwdSAqdiwgaW9yZXFfdCAqLCB2b2lk
ICopLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKTsNCj4gKw0KPiAg
c3RhdGljIGlubGluZSBib29sIGh2bV9pb3JlcV9pc19pbnRlcm5hbCh1bnNpZ25lZCBpbnQgaWQp
DQo+ICB7DQo+ICAgICAgQVNTRVJUKGlkIDwgTUFYX05SX0lPUkVRX1NFUlZFUlMpOw0KPiAtLQ0K
PiAyLjIyLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

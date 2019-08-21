Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE0898044
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 18:37:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0TZx-0002rd-Ql; Wed, 21 Aug 2019 16:35:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qki=WR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0TZw-0002rY-AE
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 16:35:20 +0000
X-Inumbo-ID: a97955ec-c431-11e9-8980-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a97955ec-c431-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566405319;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kx+39iVNEHKiIIRPq/RPnEtgN1R6R+qtOJtb3QEM1/c=;
 b=TcdjnwWpIzHXiX67mLIh+WjO3eXho6OG9VZfsVx6+rlKTDHXBG4LX3xp
 GRuh7vviFdwVFNvkPAZxPk2q/jWge0MCC4ATW6mtMFBKb3xadHW4a9SzV
 2kWuLR7OmTjq+v4Z8UX5R13wmsEnKH4+ItJ11KIvvGsMC+AZWh43dWP8Y I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8W1Xasp6DQx9ddaFSQFXUgN33uETLcEMwhQczAwFatBPH2M9NNeRY4w77bE83p+f34icKxpa5g
 N4D0rEMAVd+RmF9PJJI2AcHDZX8HqkLWOl1PwJStjddOjwG6CzyZMdTO7NZkMLuaEZHXdsbulU
 bEvLHBzRZLvpSMAMQNo9Sc9/SP4UVEtLwR6qA0MpxcvZYEkowF+wL3EfflmVMkmNuPvDQeBa8V
 IsI8KtT7cwYRcjyhtMPVOjF/e4jE8kN+R5vZO6a5RU0IIP2Y7LtPmYibqfzmT6P80msf89bwnM
 F8o=
X-SBRS: 2.7
X-MesageID: 4791009
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4791009"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 4/7] ioreq: allow registering internal ioreq server
 handler
Thread-Index: AQHVWDEPlulwlwC99UOKWtDavsCzH6cFy9Fw
Date: Wed, 21 Aug 2019 16:35:15 +0000
Message-ID: <88e62ee14cad4235a377376638a1892f@AMSPEX02CL03.citrite.net>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-5-roger.pau@citrix.com>
In-Reply-To: <20190821145903.45934-5-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/7] ioreq: allow registering internal ioreq
 server handler
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAyMSBBdWd1c3QgMjAxOSAxNTo1OQ0KPiBUbzog
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNv
bT47IEphbiBCZXVsaWNoDQo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggNC83XSBpb3JlcTogYWxsb3cgcmVnaXN0ZXJpbmcgaW50ZXJuYWwgaW9yZXEgc2Vy
dmVyIGhhbmRsZXINCj4gDQo+IFByb3ZpZGUgYSByb3V0aW5lIHRvIHJlZ2lzdGVyIHRoZSBoYW5k
bGVyIGZvciBhbiBpbnRlcm5hbCBpb3JlcQ0KPiBzZXJ2ZXIuIE5vdGUgdGhlIGhhbmRsZXIgY2Fu
IG9ubHkgYmUgc2V0IG9uY2UuDQoNCkknZCBwcmVmZXIgaHZtX3NldF9pb3JlcV9oYW5kbGVyKCkg
YW5kIHNvbWUgc29ydCBvZiBndWFyZCB0byBwcmV2ZW50IGVuYWJsaW5nIG9mIGFuIGludGVybmFs
IHNlcnZlciB3aXRoIG5vIGhhbmRsZXIgKHByb2JhYmx5IGluIHRoZSBwcmV2aW91cyBwYXRjaCkg
d291bGQgYmUgcHJ1ZGVudCwgSSB0aGluay4gQWxzbywgd2h5IHRoZSBzZXQtb25jZSBzZW1hbnRp
Yz8NCg0KICBQYXVsDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyAg
ICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgeGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vaW9yZXEuaCB8ICAzICsrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNSBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5j
IGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jDQo+IGluZGV4IDNmYjZmZTk1ODUuLmQ4ZmVhMTkx
YWEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYw0KPiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL2lvcmVxLmMNCj4gQEAgLTQ4Niw2ICs0ODYsMzggQEAgc3RhdGljIGludCBo
dm1fYWRkX2lvcmVxX2dmbihzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqcywgYm9vbCBidWYpDQo+
ICAgICAgcmV0dXJuIHJjOw0KPiAgfQ0KPiANCj4gK2ludCBodm1fYWRkX2lvcmVxX2hhbmRsZXIo
c3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW50ICgqaGFuZGxlcikoc3RydWN0IHZjcHUgKnYsIGlvcmVxX3QgKikpDQo+ICt7DQo+
ICsgICAgc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnM7DQo+ICsgICAgaW50IHJjID0gMDsNCj4g
Kw0KPiArICAgIHNwaW5fbG9ja19yZWN1cnNpdmUoJmQtPmFyY2guaHZtLmlvcmVxX3NlcnZlci5s
b2NrKTsNCj4gKyAgICBzID0gZ2V0X2lvcmVxX3NlcnZlcihkLCBpZCk7DQo+ICsgICAgaWYgKCAh
cyApDQo+ICsgICAgew0KPiArICAgICAgICByYyA9IC1FTk9FTlQ7DQo+ICsgICAgICAgIGdvdG8g
b3V0Ow0KPiArICAgIH0NCj4gKyAgICBpZiAoICFzLT5pbnRlcm5hbCApDQo+ICsgICAgew0KPiAr
ICAgICAgICByYyA9IC1FSU5WQUw7DQo+ICsgICAgICAgIGdvdG8gb3V0Ow0KPiArICAgIH0NCj4g
KyAgICBpZiAoIHMtPmhhbmRsZXIgIT0gTlVMTCApDQo+ICsgICAgew0KPiArICAgICAgICByYyA9
IC1FQlVTWTsNCj4gKyAgICAgICAgZ290byBvdXQ7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgcy0+
aGFuZGxlciA9IGhhbmRsZXI7DQo+ICsNCj4gKyBvdXQ6DQo+ICsgICAgc3Bpbl91bmxvY2tfcmVj
dXJzaXZlKCZkLT5hcmNoLmh2bS5pb3JlcV9zZXJ2ZXIubG9jayk7DQo+ICsNCj4gKyAgICByZXR1
cm4gcmM7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIGh2bV91cGRhdGVfaW9yZXFfZXZ0Y2hu
KHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGh2bV9pb3JlcV92Y3B1ICpzdikNCj4gIHsNCj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lvcmVxLmggYi94ZW4vaW5jbHVkZS9hc20teDg2
L2h2bS9pb3JlcS5oDQo+IGluZGV4IGU4MTE5YjI2YTYuLjIxMzFjOTQ0ZDQgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lvcmVxLmgNCj4gKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vaW9yZXEuaA0KPiBAQCAtNTUsNiArNTUsOSBAQCB1bnNpZ25lZCBpbnQgaHZt
X2Jyb2FkY2FzdF9pb3JlcShpb3JlcV90ICpwLCBib29sIGJ1ZmZlcmVkKTsNCj4gDQo+ICB2b2lk
IGh2bV9pb3JlcV9pbml0KHN0cnVjdCBkb21haW4gKmQpOw0KPiANCj4gK2ludCBodm1fYWRkX2lv
cmVxX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW50ICgqaGFuZGxlcikoc3RydWN0IHZjcHUgKnYsIGlvcmVxX3Qg
KikpOw0KPiArDQo+ICAjZW5kaWYgLyogX19BU01fWDg2X0hWTV9JT1JFUV9IX18gKi8NCj4gDQo+
ICAvKg0KPiAtLQ0KPiAyLjIyLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

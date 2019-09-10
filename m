Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EFCAEA76
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:33:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7fIj-0002uM-3I; Tue, 10 Sep 2019 12:31:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M1KC=XF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i7fIh-0002uH-3L
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:31:15 +0000
X-Inumbo-ID: e093d0c6-d3c6-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e093d0c6-d3c6-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 12:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568118674;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0oE3PuQmnz801De8wtlSAYnQvBxNKZkm05V4ECqnqes=;
 b=Ks6Xu3kIbpVs/Q7ZowkLKNxFCT3/eaze0RaVjYnaDWrCq2fCSZCZCwLo
 AtK86zSKF8XQxsYsW4G9kdaq+04lHqtFP2vusRqJoxetVj5SzsduKJ9A4
 Gh1nugdNlx7kaYjhKW2Fqyh2SgPgbZvDOICdvFZ7DkGrUkTlb90R8Yyj0 4=;
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
IronPort-SDR: zb2vsXtLd1F4VLIdWl+ysnjdDZIfMK0kilJK63kffmr3CM/Jw8TPpIRLJ0riY85dMs0bI/P7hX
 u6+8tf5zVH8yGq8SzxBmVPflcvau/oAbqAay7WsNiIeOKT8aX//GIEvye7J9JAGF8MErUpb5Qq
 QC910dqxxEoO7Qg3YwjwWZCGc7Juar0YNtO6A1iK21MxqOzVZ0xVt0kc0U+VxGWQHhPnRFtvAY
 r2VxU9NdpKjqvjy2W2yVOO1dJGk8ao8G31d97n59WO8cviYvwwlGV/+PgZ0J0ZyHWHqKDGOQDt
 BPM=
X-SBRS: 2.7
X-MesageID: 5651480
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5651480"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 03/11] ioreq: switch selection and forwarding to use
 ioservid_t
Thread-Index: AQHVYnKzQAYAF6MhWkGgnqbgOaE9Pack4OoQ
Date: Tue, 10 Sep 2019 12:31:09 +0000
Message-ID: <46b8e9bdb412439d83d619234ce69ae7@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-4-roger.pau@citrix.com>
In-Reply-To: <20190903161428.7159-4-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 03/11] ioreq: switch selection and
 forwarding to use ioservid_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George
 Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAxNzoxNA0KPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsg
QW5kcmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHds
QHhlbi5vcmc+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4N
Cj4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsNCj4gPGtvbnJhZC53aWxrQG9y
YWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBU
aW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47DQo+IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50
QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAwMy8xMV0gaW9yZXE6IHN3aXRjaCBz
ZWxlY3Rpb24gYW5kIGZvcndhcmRpbmcgdG8gdXNlIGlvc2VydmlkX3QNCj4gDQo+IGh2bV9zZWxl
Y3RfaW9yZXFfc2VydmVyIGFuZCBodm1fc2VuZF9pb3JlcSB3aGVyZSBib3RoIHVzaW5nDQo+IGh2
bV9pb3JlcV9zZXJ2ZXIgZGlyZWN0bHksIHN3aXRjaCB0byB1c2UgaW9zZXJ2aWRfdCBpbiBvcmRl
ciB0byBzZWxlY3QNCj4gYW5kIGZvcndhcmQgaW9yZXFzLg0KPiANCj4gVGhpcyBpcyBhIHByZXBh
cmF0b3J5IGNoYW5nZSwgc2luY2UgZnV0dXJlIHBhdGNoZXMgd2lsbCB1c2UgdGhlIGlvcmVxDQo+
IHNlcnZlciBpZCBpbiBvcmRlciB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gaW50ZXJuYWwgYW5k
IGV4dGVybmFsDQo+IGlvcmVxIHNlcnZlcnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQoNCi4uLiB3aXRoIG9uZSBzdWdnZXN0aW9u
Lg0KDQpbc25pcF0NCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vZG1fb3Au
aCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vZG1fb3AuaA0KPiBpbmRleCBkM2I1NTRkMDE5Li44
NzI1Y2MyMGQzIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2RtX29wLmgN
Cj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9kbV9vcC5oDQo+IEBAIC01NCw2ICs1NCw3
IEBADQo+ICAgKi8NCj4gDQo+ICB0eXBlZGVmIHVpbnQxNl90IGlvc2VydmlkX3Q7DQo+ICsjZGVm
aW5lIFhFTl9JTlZBTElEX0lPU0VSVklEIDB4ZmZmZg0KPiANCg0KUGVyaGFwcyB1c2UgKGlvc2Vy
dmlkX3QpfjAgcmF0aGVyIHRoYW4gaGFyZGNvZGluZz8NCg0KICBQYXVsDQoNCj4gIC8qDQo+ICAg
KiBYRU5fRE1PUF9jcmVhdGVfaW9yZXFfc2VydmVyOiBJbnN0YW50aWF0ZSBhIG5ldyBJT1JFUSBT
ZXJ2ZXIgZm9yIGENCj4gLS0NCj4gMi4yMi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

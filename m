Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C598020
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 18:31:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0TTy-0001uT-Mt; Wed, 21 Aug 2019 16:29:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qki=WR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0TTw-0001uO-HV
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 16:29:08 +0000
X-Inumbo-ID: cc09b4d6-c430-11e9-b95f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc09b4d6-c430-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566404947;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oL3zR3Hu8e9/by4pTCOvIkV1GZNH5oAcYh1WwiaT954=;
 b=LXSharyZ0AHPhH0vYcpmusgWMGgC+JdPbwT6R7mu00ghc59y3GJQrNdP
 Wa2JoQjcFcvF0UajhO9lKekGT55bNyzP9pg5MIqrjyjmG33csy9NRotFs
 hvHHH5DhI4EL2kEKDO5bA13eNka8k37oqT25c2mSKLe+ssdORmrkrUOO+ w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5H40AicNvGKoY6cb6CvyTF4hJEPvMf6+6R7Ldlau4NnyaYboPmR0PgnUvXGRxay+ZTg8zItoAb
 NToOv0p7WFBQqHaFvmJpEptAcu7ERdPGhZnCA7e/xjdS5e2PBI581dWNA6eacWcI6Pb8sNzkiJ
 VlVRj1oAZnbNlHM7f/ZHpVc4n1KdfH9yvneUv7MLbFUTuKG8GREyWtI3IFLwQrlD3hln7v+jVj
 rsmXoSnDMzZXASPMH278+hBZbOTos+S7ermEQEBCSf090FsRRLvnPmmj/KyVXO/K/odtyS12gy
 N5A=
X-SBRS: 2.7
X-MesageID: 4588048
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4588048"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 3/7] ioreq: allow dispatching ioreqs to internal servers
Thread-Index: AQHVWDENzumIAV6ZWEmsnxjuoJWjIacFylMQ
Date: Wed, 21 Aug 2019 16:29:04 +0000
Message-ID: <9428742b49454a0782a618dc246b9a56@AMSPEX02CL03.citrite.net>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-4-roger.pau@citrix.com>
In-Reply-To: <20190821145903.45934-4-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/7] ioreq: allow dispatching ioreqs to
 internal servers
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
OiBbUEFUQ0ggMy83XSBpb3JlcTogYWxsb3cgZGlzcGF0Y2hpbmcgaW9yZXFzIHRvIGludGVybmFs
IHNlcnZlcnMNCj4gDQo+IEludGVybmFsIGlvcmVxIHNlcnZlcnMgYXJlIGFsd2F5cyBwcm9jZXNz
ZWQgZmlyc3QsIGFuZCBpb3JlcXMgYXJlDQo+IGRpc3BhdGNoZWQgYnkgY2FsbGluZyB0aGUgaGFu
ZGxlciBmdW5jdGlvbi4gSWYgbm8gaW50ZXJuYWwgc2VydmVycyBoYXZlDQo+IHJlZ2lzdGVyZWQg
Zm9yIGFuIGlvcmVxIGl0J3MgdGhlbiBmb3J3YXJkZWQgdG8gZXh0ZXJuYWwgY2FsbGVycy4NCg0K
RGlzdGluY3QgaWQgcmFuZ2VzIHdvdWxkIGhlbHAgaGVyZS4uLiBJbnRlcm5hbCBpZHMgY291bGQg
YmUgd2Fsa2VkIGZpcnN0LCB0aGVuIGV4dGVybmFsLiBJZiB0aGVyZSdzIG5vIHBvc3NpYmlsaXR5
IG9mIGludGVybGVhdmluZyB0aGVuIHlvdSBkb24ndCBuZWVkIHRoZSByZXRyeS4NCg0KICBQYXVs
DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyB8IDE5ICsrKysrKysr
KysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIGIveGVu
L2FyY2gveDg2L2h2bS9pb3JlcS5jDQo+IGluZGV4IDIzZWY5YjBjMDIuLjNmYjZmZTk1ODUgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYw0KPiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL2lvcmVxLmMNCj4gQEAgLTEzMDUsNiArMTMwNSw3IEBAIHN0cnVjdCBodm1faW9yZXFf
c2VydmVyICpodm1fc2VsZWN0X2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLA0KPiAgICAg
IHVpbnQ4X3QgdHlwZTsNCj4gICAgICB1aW50NjRfdCBhZGRyOw0KPiAgICAgIHVuc2lnbmVkIGlu
dCBpZDsNCj4gKyAgICBib29sIGludGVybmFsID0gdHJ1ZTsNCj4gDQo+ICAgICAgaWYgKCBwLT50
eXBlICE9IElPUkVRX1RZUEVfQ09QWSAmJiBwLT50eXBlICE9IElPUkVRX1RZUEVfUElPICkNCj4g
ICAgICAgICAgcmV0dXJuIE5VTEw7DQo+IEBAIC0xMzQ1LDExICsxMzQ2LDEyIEBAIHN0cnVjdCBo
dm1faW9yZXFfc2VydmVyICpodm1fc2VsZWN0X2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpk
LA0KPiAgICAgICAgICBhZGRyID0gcC0+YWRkcjsNCj4gICAgICB9DQo+IA0KPiArIHJldHJ5Og0K
PiAgICAgIEZPUl9FQUNIX0lPUkVRX1NFUlZFUihkLCBpZCwgcykNCj4gICAgICB7DQo+ICAgICAg
ICAgIHN0cnVjdCByYW5nZXNldCAqcjsNCj4gDQo+IC0gICAgICAgIGlmICggIXMtPmVuYWJsZWQg
KQ0KPiArICAgICAgICBpZiAoICFzLT5lbmFibGVkIHx8IHMtPmludGVybmFsICE9IGludGVybmFs
ICkNCj4gICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiANCj4gICAgICAgICAgciA9IHMtPnJhbmdl
W3R5cGVdOw0KPiBAQCAtMTM4Nyw2ICsxMzg5LDEyIEBAIHN0cnVjdCBodm1faW9yZXFfc2VydmVy
ICpodm1fc2VsZWN0X2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLA0KPiAgICAgICAgICB9
DQo+ICAgICAgfQ0KPiANCj4gKyAgICBpZiAoIGludGVybmFsICkNCj4gKyAgICB7DQo+ICsgICAg
ICAgIGludGVybmFsID0gZmFsc2U7DQo+ICsgICAgICAgIGdvdG8gcmV0cnk7DQo+ICsgICAgfQ0K
PiArDQo+ICAgICAgcmV0dXJuIE5VTEw7DQo+ICB9DQo+IA0KPiBAQCAtMTQ5Miw5ICsxNTAwLDE4
IEBAIGludCBodm1fc2VuZF9pb3JlcShzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqcywgaW9yZXFf
dCAqcHJvdG9fcCwNCj4gDQo+ICAgICAgQVNTRVJUKHMpOw0KPiANCj4gKyAgICBpZiAoIHMtPmlu
dGVybmFsICYmIGJ1ZmZlcmVkICkNCj4gKyAgICB7DQo+ICsgICAgICAgIEFTU0VSVF9VTlJFQUNI
QUJMRSgpOw0KPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7DQo+ICsgICAg
fQ0KPiArDQo+ICAgICAgaWYgKCBidWZmZXJlZCApDQo+ICAgICAgICAgIHJldHVybiBodm1fc2Vu
ZF9idWZmZXJlZF9pb3JlcShzLCBwcm90b19wKTsNCj4gDQo+ICsgICAgaWYgKCBzLT5pbnRlcm5h
bCApDQo+ICsgICAgICAgIHJldHVybiBzLT5oYW5kbGVyKGN1cnIsIHByb3RvX3ApOw0KPiArDQo+
ICAgICAgaWYgKCB1bmxpa2VseSghdmNwdV9zdGFydF9zaHV0ZG93bl9kZWZlcnJhbChjdXJyKSkg
KQ0KPiAgICAgICAgICByZXR1cm4gWDg2RU1VTF9SRVRSWTsNCj4gDQo+IC0tDQo+IDIuMjIuMA0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

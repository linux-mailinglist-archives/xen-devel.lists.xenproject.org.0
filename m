Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BF8A65F2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 11:45:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55Li-000763-Rt; Tue, 03 Sep 2019 09:43:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q0sn=W6=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i55Lh-00075w-H3
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 09:43:41 +0000
X-Inumbo-ID: 4f71b898-ce2f-11e9-8980-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f71b898-ce2f-11e9-8980-bc764e2007e4;
 Tue, 03 Sep 2019 09:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567503821;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hutvvcnBVWtdCXUWC0oipxUomLiTnPFx1URCDvZBNwI=;
 b=ZpLksCgCy5uzOvJ0qVo1d5xV53B7njz02SbGNINUlN/4mTXwsk31w4k5
 buZRUc8RwUmaf4Iiz7XADi0yuy6++hY/G6OOjZxttmZu0gkqX7iteFRaE
 aURVVUcqWWKL88GbE3tzhOMSmW2a6AA4laG1yopr8nUefJAUG0+/CuFNy o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TRrH6GeEpykHfPjYE9kg5gm5u5mRS2ubQESNBfXVp3o7rWo/s5R+6UwLc1TYBpL3LIWXRoH3SF
 /dR5tJwQJTQMfWXnj4fvC+O3o4QQXRQhvs0hO2jbc8d4eS+dSCDb0KBZtPMstI3o9xsmyDsCMF
 J9gYACM8vCxaX+v+5C/w9LFEgXSBGbtgiAEPhqljSJjmWDUC/GZpmmDbpmKRKWOOWZpXGpMrt5
 Z1XM8Q8ReWL5wJ2dW89TuEqxJSlnLDHa72xf/wJLQk7t+Io8OLfXCKbNTH79VhW8IktQcoHFI7
 8P0=
X-SBRS: 2.7
X-MesageID: 5046942
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,462,1559534400"; 
   d="scan'208";a="5046942"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 2/8] x86/HVM: ignore guest INVD uses
Thread-Index: AQHVYjs9+wjA9kL1+UuBi+HXHTUEsqcZs3Pw
Date: Tue, 3 Sep 2019 09:43:37 +0000
Message-ID: <bde7a0333ba6408fb447d1dcf93b3d39@AMSPEX02CL03.citrite.net>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
 <2355680d-2052-60a8-fd46-ebf23196a4d6@suse.com>
In-Reply-To: <2355680d-2052-60a8-fd46-ebf23196a4d6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 2/8] x86/HVM: ignore guest INVD uses
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIFNlcHRlbWJlciAyMDE5IDEwOjM4DQo+IFRvOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5D
b29wZXIzQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29t
PjsgUm9nZXIgUGF1IE1vbm5lDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHds
QHhlbi5vcmc+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAyLzhdIHg4Ni9IVk06IGlnbm9yZSBndWVz
dCBJTlZEIHVzZXMNCj4gDQo+IFRoZSBvbmx5IHBsYWNlIHdlJ2QgZXhwZWN0IHRoZSBpbnNuIHRv
IGJlIHNlbnNpYmx5IHVzZWQgaXMgaW4NCj4gKHZpcnR1YWxpemF0aW9uIHVuYXdhcmUpIGZpcm13
YXJlLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQoNClNlZW1zIGxpa2UgYSByZWFzb25hYmxlIG9wdGltaXphdGlvbi4NCg0KUmV2aWV3ZWQt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQoNCj4gLS0tDQo+IHYz
OiBOZXcuDQo+IA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYw0KPiArKysgYi94
ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYw0KPiBAQCAtMjIxMCwxMSArMjIxMCwxOCBAQCBzdGF0
aWMgaW50IGh2bWVtdWxfY2FjaGVfb3AoDQo+IA0KPiAgICAgICAgICBodm1lbXVsX3VubWFwX2xp
bmVhcl9hZGRyKG1hcHBpbmcsIGFkZHIsIDAsIGh2bWVtdWxfY3R4dCk7DQo+ICAgICAgICAgIC8q
IGZhbGwgdGhyb3VnaCAqLw0KPiAtICAgIGNhc2UgeDg2ZW11bF9pbnZkOg0KPiAgICAgIGNhc2Ug
eDg2ZW11bF93YmludmQ6DQo+ICAgICAgY2FzZSB4ODZlbXVsX3dibm9pbnZkOg0KPiAgICAgICAg
ICBhbHRlcm5hdGl2ZV92Y2FsbChodm1fZnVuY3Mud2JpbnZkX2ludGVyY2VwdCk7DQo+ICAgICAg
ICAgIGJyZWFrOw0KPiArDQo+ICsgICAgY2FzZSB4ODZlbXVsX2ludmQ6DQo+ICsgICAgICAgIC8q
DQo+ICsgICAgICAgICAqIERlbGliZXJhdGVseSBpZ25vcmVkOiBXZSBkb24ndCB3YW50IHRvIGlz
c3VlIElOVkQsIGFuZCBpc3N1aW5nIFdCSU5WRA0KPiArICAgICAgICAgKiB3b3VsZG4ndCBtYXRj
aCB0aGUgcmVxdWVzdC4gQW5kIHRoZSBvbmx5IHBsYWNlIHdlJ2QgZXhwZWN0IHRoZSBpbnNuDQo+
ICsgICAgICAgICAqIHRvIGJlIHNlbnNpYmx5IHVzZWQgaXMgaW4gKHZpcnR1YWxpemF0aW9uIHVu
YXdhcmUpIGZpcm13YXJlLg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAgYnJlYWs7DQo+ICAg
ICAgfQ0KPiANCj4gICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOw0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

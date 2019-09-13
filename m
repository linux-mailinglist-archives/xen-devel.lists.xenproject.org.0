Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10CDB1954
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 10:08:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8gYU-0001qx-NW; Fri, 13 Sep 2019 08:03:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qndu=XI=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8gYT-0001qs-0o
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 08:03:45 +0000
X-Inumbo-ID: 01245d14-d5fd-11e9-95aa-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01245d14-d5fd-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568361823;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uRauKbkGlmg8fwk+PXf7FxlWKRPNEQq0noEt4O9Iw9o=;
 b=MPg0QjCvaD9a/irFhuLDfuakmFGPRlxnJOxkMwU0ncZreJqE8iukw+ML
 cvmyDQ4EZlbscIYHLgtoDiYJdch9F4PvUho+evkkRkSSfd5fobeswt4bU
 R0X3YwS0xDsSpUcF9QJGgcNtXIZapW3yc7pIyhf4AUEyaJkKk53InJNm9 8=;
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
IronPort-SDR: w89N7k8+icj9p0L5rStHYiIeCYj8z5VaZaHdHvupfkM94Nf26OsFN+ya4oeLIOmxFI8rLPH/+s
 psvLSGkP0l6Bs+e6lfQEu33fJH1atQMObOaFPZeHblJdg70yPN9FSrkbfhvNjiy3iEmr4I0vlD
 D9dlj7hJFqO/LY7/WnBj8byDvjdAJExE16pCqpi7CSr67A2tlVJXxr/FtapXKs7+K6/UIuuOm8
 GEsvH5/pKVJdnvGo019h5dgsN1MKVoNLCqs3NZS/Z65+rxJZ2c3dSFkhoXKn2nxU7xKQ8k1GuR
 mt4=
X-SBRS: 2.7
X-MesageID: 5722127
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5722127"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, Anthony Perard
 <anthony.perard@citrix.com>
Thread-Topic: [PATCH v2 3/3] xen: perform XenDevice clean-up in XenBus watch
 handler
Thread-Index: AQHVaWP1a6uo9FDbNkeviSOLMWhOMKcoAmKAgAAj/tCAARiygA==
Date: Fri, 13 Sep 2019 08:03:40 +0000
Message-ID: <9c03c1ba9c1d4c1bb5d8b5a38cbca3de@AMSPEX02CL03.citrite.net>
References: <20190912121646.29148-1-paul.durrant@citrix.com>
 <20190912121646.29148-4-paul.durrant@citrix.com>
 <20190912150417.GD1308@perard.uk.xensource.com>
 <c71d01fbe7ab46d78992fe30fd2e550d@AMSPEX02CL03.citrite.net>
In-Reply-To: <c71d01fbe7ab46d78992fe30fd2e550d@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen: perform XenDevice clean-up in
 XenBus watch handler
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUGF1bCBEdXJyYW50
DQo+IFNlbnQ6IDEyIFNlcHRlbWJlciAyMDE5IDE2OjE2DQo+IFRvOiBBbnRob255IFBlcmFyZCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgcWVt
dS1kZXZlbEBub25nbnUub3JnDQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjIg
My8zXSB4ZW46IHBlcmZvcm0gWGVuRGV2aWNlIGNsZWFuLXVwIGluIFhlbkJ1cyB3YXRjaCBoYW5k
bGVyDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+ID4gU2VudDogMTIgU2VwdGVt
YmVyIDIwMTkgMTY6MDQNCj4gPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4
LmNvbT4NCj4gPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvM10geGVuOiBwZXJmb3JtIFhlbkRldmlj
ZSBjbGVhbi11cCBpbiBYZW5CdXMgd2F0Y2ggaGFuZGxlcg0KPiA+DQo+ID4gT24gVGh1LCBTZXAg
MTIsIDIwMTkgYXQgMDE6MTY6NDZQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+ID4g
Q2xlYW5pbmcgdXAgb2ZmaW5lIFhlbkRldmljZSBvYmplY3RzIGRpcmVjdGx5IGluDQo+ID4gICAg
ICAgICAgICAgICBeIG9mZmxpbmUNCj4gPg0KPiA+ID4geGVuX2RldmljZV9iYWNrZW5kX2NoYW5n
ZWQoKSBpcyBkYW5nZXJvdXMgYXMgeGVuX2RldmljZV91bnJlYWxpemUoKSB3aWxsDQo+ID4gPiBt
b2RpZnkgdGhlIHdhdGNoIGxpc3QgdGhhdCBpcyBiZWluZyB3YWxrZWQuIEV2ZW4gdGhlIFFMSVNU
X0ZPUkVBQ0hfU0FGRSgpDQo+ID4gPiB1c2VkIGluIG5vdGlmaWVyX2xpc3Rfbm90aWZ5KCkgaXMg
aW5zdWZmaWNpZW50IGFzICp0d28qIG5vdGlmaWVycyAoZm9yDQo+ID4gPiB0aGUgZnJvbnRlbmQg
YW5kIGJhY2tlbmQgd2F0Y2hlcykgYXJlIHJlbW92ZWQsIHRodXMgcG90ZW50aWFsbHkgcmVuZGVy
aW5nDQo+ID4gPiB0aGUgJ25leHQnIHBvaW50ZXIgdW5zYWZlLg0KPiA+ID4NCj4gPiA+IFRoZSBz
b2x1dGlvbiBpcyB0byB1c2UgdGhlIFhlbkJ1cyBiYWNrZW5kX3dhdGNoIGhhbmRsZXIgdG8gZG8g
dGhlIGNsZWFuLXVwDQo+ID4gPiBpbnN0ZWFkLCBhcyBpdCBpcyBpbnZva2VkIHdoaWxzdCB3YWxr
aW5nIGEgc2VwYXJhdGUgd2F0Y2ggbGlzdC4NCj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNoIHRoZXJl
Zm9yZSBhZGRzIGEgbmV3ICdvZmZsaW5lX2RldmljZXMnIGxpc3QgdG8gWGVuQnVzLCB0byB3aGlj
aA0KPiA+ID4gb2ZmbGluZSBkZXZpY2VzIGFyZSBhZGRlZCBieSB4ZW5fZGV2aWNlX2JhY2tlbmRf
Y2hhbmdlZCgpLiBUaGUgWGVuQnVzDQo+ID4gPiBiYWNrZW5kX3dhdGNoIHJlZ2lzdHJhdGlvbiBp
cyBhbHNvIGNoYW5nZWQgdG8gbm90IG9ubHkgaW52b2tlDQo+ID4gPiB4ZW5fYnVzX2VudW1lcmF0
ZSgpIGJ1dCBhbHNvIGEgbmV3IHhlbl9idXNfY2xlYW51cCgpIGZ1bmN0aW9uLCB3aGljaCB3aWxs
DQo+ID4gPiB3YWxrICdvZmZsaW5lX2RldmljZXMnIGFuZCBwZXJmb3JtIHRoZSBuZWNlc3Nhcnkg
YWN0aW9ucy4NCj4gPiA+IEZvciBzYWZldHkgYSBhbiBleHRyYSAnb25saW5lJyBjaGVjayBpcyBh
bHNvIGFkZGVkIHRvDQo+ID4gICAgICAgICAgICAgIF4gb25lICdhJyB0b28gbWFueT8NCj4gPg0K
PiA+ID4geGVuX2J1c190eXBlX2VudW1lcmF0ZSgpIHRvIG1ha2Ugc3VyZSB0aGF0IG5vIGF0dGVt
cHQgaXMgbWFkZSB0byBjcmVhdGUgYQ0KPiA+ID4gbmV3IFhlbkRldmljZSBvYmplY3QgZm9yIGEg
YmFja2VuZCB0aGF0IGlzIG9mZmxpbmUuDQo+ID4gPg0KPiA+ID4gTk9URTogVGhpcyBwYXRjaCBh
bHNvIGluY2x1ZGUgc29tZSBjb3NtZXRpYyBjaGFuZ2VzOg0KPiA+ID4gICAgICAgLSBzdWJzdGl0
dXRlIHRoZSBsb2NhbCB2YXJpYWJsZSBuYW1lICdiYWNrZW5kX3N0YXRlJw0KPiA+ID4gICAgICAg
ICBpbiB4ZW5fYnVzX3R5cGVfZW51bWVyYXRlKCkgd2l0aCAnc3RhdGUnLCBzaW5jZSB0aGVyZQ0K
PiA+ID4gICAgICAgICBpcyBubyBhbWJpZ3VpdHkgd2l0aCBhbnkgb3RoZXIgc3RhdGUgaW4gdGhh
dCBjb250ZXh0Lg0KPiA+ID4gICAgICAgLSBjaGFuZ2UgeGVuX2RldmljZV9zdGF0ZV9pc19hY3Rp
dmUoKSB0bw0KPiA+ID4gICAgICAgICB4ZW5fZGV2aWNlX2Zyb250ZW5kX2lzX2FjdGl2ZSgpIChh
bmQgcGFzcyBhIFhlbkRldmljZSBkaXJlY3RseSkNCj4gPiA+ICAgICAgICAgc2luY2UgdGhlIHN0
YXRlIHRlc3RzIGNvbnRhaW5lZCB0aGVyZWluIG9ubHkgYXBwbHkgdG8gYSBmcm9udGVuZC4NCj4g
PiA+ICAgICAgIC0gdXNlICdzdGF0ZScgcmF0aGVyIHRoZW4gJ3hlbmRldi0+YmFja2VuZF9zdGF0
ZScgaW4NCj4gPiA+ICAgICAgICAgeGVuX2RldmljZV9iYWNrZW5kX2NoYW5nZWQoKSB0byBzaG9y
dGVuIHRoZSBjb2RlLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+DQo+ID4gPiB2MjoNCj4g
PiA+ICAtIE1ha2Ugc3VyZSB3ZSBkb24ndCB0cnkgdG8gYWRkIGEgWGVuRGV2aWNlIHRvICdvZmZs
aW5lX2RldmljZXMnIG1vcmUgdGhhbg0KPiA+ID4gICAgb25jZQ0KPiA+ID4gLS0tDQo+ID4gPg0K
PiA+ID4gICAgICAvKg0KPiA+ID4gICAgICAgKiBJZiBhIGJhY2tlbmQgaXMgc3RpbGwgJ29ubGlu
ZScgdGhlbiB3ZSBzaG91bGQgbGVhdmUgaXQgYWxvbmUgYnV0LA0KPiA+ID4gLSAgICAgKiBpZiBh
IGJhY2tlbmQgaXMgbm90ICdvbmxpbmUnLCB0aGVuIHRoZSBkZXZpY2Ugc2hvdWxkIGJlIGRlc3Ry
b3llZA0KPiA+ID4gLSAgICAgKiBvbmNlIHRoZSBzdGF0ZSBpcyBDbG9zZWQuDQo+ID4gPiArICAg
ICAqIGlmIGEgYmFja2VuZCBpcyBub3QgJ29ubGluZScsIHRoZW4gdGhlIGRldmljZSBpcyBhIGNh
bmRpZGF0ZQ0KPiA+ID4gKyAgICAgKiBmb3IgZGVzdHJ1Y3Rpb24uIEhlbmNlIGFkZCBpdCB0byB0
aGUgJ29mZmxpbmUnIGxpc3QgdG8gYmUgY2xlYW5lZA0KPiA+ID4gKyAgICAgKiBieSB4ZW5fYnVz
X2NsZWFudXAoKS4NCj4gPiA+ICAgICAgICovDQo+ID4gPiAtICAgIGlmICgheGVuZGV2LT5iYWNr
ZW5kX29ubGluZSAmJg0KPiA+ID4gLSAgICAgICAgKHhlbmRldi0+YmFja2VuZF9zdGF0ZSA9PSBY
ZW5idXNTdGF0ZUNsb3NlZCB8fA0KPiA+ID4gLSAgICAgICAgIHhlbmRldi0+YmFja2VuZF9zdGF0
ZSA9PSBYZW5idXNTdGF0ZUluaXRpYWxpc2luZyB8fA0KPiA+ID4gLSAgICAgICAgIHhlbmRldi0+
YmFja2VuZF9zdGF0ZSA9PSBYZW5idXNTdGF0ZUluaXRXYWl0IHx8DQo+ID4gPiAtICAgICAgICAg
eGVuZGV2LT5iYWNrZW5kX3N0YXRlID09IFhlbmJ1c1N0YXRlVW5rbm93bikpIHsNCj4gPiA+IC0g
ICAgICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOw0KPiA+ID4gKyAgICBpZiAoIW9ubGluZSAm
Jg0KPiA+ID4gKyAgICAgICAgKHN0YXRlID09IFhlbmJ1c1N0YXRlQ2xvc2VkIHx8ICBzdGF0ZSA9
PSBYZW5idXNTdGF0ZUluaXRpYWxpc2luZyB8fA0KPiA+ID4gKyAgICAgICAgIHN0YXRlID09IFhl
bmJ1c1N0YXRlSW5pdFdhaXQgfHwgc3RhdGUgPT0gWGVuYnVzU3RhdGVVbmtub3duKSAmJg0KPiA+
ID4gKyAgICAgICAgIVFMSVNUX05FWFQoeGVuZGV2LCBsaXN0KSkgew0KPiA+DQo+ID4gQ291bGQg
eW91IGFkZCBhIG5vdGUgYWJvdXQgdGhpcyBRTElTVF9ORVhUPyBJIGRvbid0IHRoaW5rIGl0J3Mg
Z29pbmcgdG8NCj4gPiBiZSBvYnZpb3VzIGVub3VnaCB3aHkgd2UgY2hlY2sgdGhhdCB0aGVyZSBh
cmUgbm8gbmV4dCBpdGVtLiBJIG1pZ2h0IG9ubHkNCj4gPiB1bmRlcnN0YW5kIGl0IGp1c3QgYmVj
YXVzZSBvZiB5b3VyIHJlcGx5IHRvIHRoZSB2MSBvZiB0aGUgcGF0Y2guDQo+ID4gKFdlbGwgdGhl
IGNoYW5nZWxvZyBvZiB0aGUgcGF0Y2ggYWxzbyBwb2ludCBvdXQgd2hhdCBpdCdzIGZvci4pDQo+
ID4NCj4gDQo+IFN1cmUsIGl0J3Mgd29ydGggYSBjb21tZW50Lg0KDQpBY3R1YWxseSwgb24gY2xv
c2VyIGluc3BlY3Rpb24gIVFMSVNUX05FWFQoKSBpcyBhbiBpbnN1ZmZpY2llbnQgY2hlY2tlZC4g
SSBoYWQgYXNzdW1lZCB0aGF0IFFMSVNUcyB3ZXJlIGZ1bGwgZG91Ymx5LWxpbmtlZCBsaXN0cyBi
dXQgdGhleSBhcmUgbm90OyB0aGUgbGFzdCBlbGVtZW50IG9uIGEgbGlzdCB3aWxsIHN0aWxsIGhh
dmUgYSBOVUxMIG5leHQgcG9pbnRlci4gSXQgd2lsbCBiZSBzdWZmaWNpZW50LCBhbmQgYWxzbyBj
bGVhcmVyIHRvIHRoZSByZWFkZXIsIGlmIEkgYWRkIGEgYm9vbGVhbiB0byBYZW5EZXZpY2Ugd2hp
Y2ggaXMgc2V0IHdoZW4gaXQgaXMgYWRkZWQgdG8gdGhlIGxpc3QuDQoNCiAgUGF1bA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC7106DFC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 12:05:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY6hx-0001dA-J5; Fri, 22 Nov 2019 11:02:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6SD+=ZO=amazon.com=prvs=222105d68=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iY6hw-0001d5-52
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 11:02:36 +0000
X-Inumbo-ID: 96e71eb2-0d17-11ea-9631-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96e71eb2-0d17-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 11:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574420555; x=1605956555;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5matlOzHcFdBQW1mbX/cAmjp5S8qdu7M8v/pNibEtyc=;
 b=k4xH0D2SaJVE0qFLJL599NQATYq5oeNHvcAId94l57LdVeIItQj3aHlg
 tY8j3jRZZNCPN6lCWt44hv8OiGJy29ZNZWuScWXWePsnJ5rbvLUUEmb7Z
 cySB+n3RlWa5uW5bJOAbDoO14C/DtSKV5byhHorX/FoQWQ4urxoajRzhN M=;
IronPort-SDR: lLXcjvNn4CE1ZmLTEKBLtVX4p23fBFswgJmYNKYFcU+B7w+EpWTc3nJll81e/FNJmqSn5ZgIZJ
 9pUCaqDwqG7Q==
X-IronPort-AV: E=Sophos;i="5.69,229,1571702400"; 
   d="scan'208";a="4425479"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 22 Nov 2019 11:02:34 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id C1EB4A2A95; Fri, 22 Nov 2019 11:02:32 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 22 Nov 2019 11:02:32 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 22 Nov 2019 11:02:31 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 22 Nov 2019 11:02:30 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v4 6/8] x86: switch xen guest implementation
 to use hypervisor framework
Thread-Index: AQHVoJ0bW2zjhTzoQ0+Y/W9dlvfTuKeXBuCw
Date: Fri, 22 Nov 2019 11:02:30 +0000
Message-ID: <1952bbb1513241fe97f1c4da7e2ba03e@EX13D32EUC003.ant.amazon.com>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-7-liuwe@microsoft.com>
In-Reply-To: <20191121185049.16666-7-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.33]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 6/8] x86: switch xen guest implementation
 to use hypervisor framework
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpDQo+IExpdQ0K
PiBTZW50OiAyMSBOb3ZlbWJlciAyMDE5IDE5OjUxDQo+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlz
dCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0KPiBDYzogV2VpIExpdSA8bGl1d2VA
bWljcm9zb2Z0LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyDQo+IDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jv
c29mdC5jb20+OyBKYW4NCj4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BB
VENIIHY0IDYvOF0geDg2OiBzd2l0Y2ggeGVuIGd1ZXN0IGltcGxlbWVudGF0aW9uDQo+IHRvIHVz
ZSBoeXBlcnZpc29yIGZyYW1ld29yaw0KPiANCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1
d2VAbWljcm9zb2Z0LmNvbT4NCltzbmlwXSANCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QveGVuLmggYi94ZW4vaW5jbHVkZS9hc20tDQo+IHg4Ni9ndWVzdC94ZW4uaA0K
PiBpbmRleCAwMWRjM2VlNmY2Li5kYjkwYjU1MGE3IDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L3hlbi5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qv
eGVuLmgNCj4gQEAgLTIzLDYgKzIzLDcgQEANCj4gDQo+ICAjaW5jbHVkZSA8YXNtL2U4MjAuaD4N
Cj4gICNpbmNsdWRlIDxhc20vZml4bWFwLmg+DQo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVy
dmlzb3IuaD4NCj4gDQo+ICAjZGVmaW5lIFhFTl9zaGFyZWRfaW5mbyAoKHN0cnVjdCBzaGFyZWRf
aW5mbw0KPiAqKWZpeF90b192aXJ0KEZJWF9YRU5fU0hBUkVEX0lORk8pKQ0KPiANCj4gQEAgLTMy
LDcgKzMzLDcgQEAgZXh0ZXJuIGJvb2wgeGVuX2d1ZXN0Ow0KPiAgZXh0ZXJuIGJvb2wgcHZfY29u
c29sZTsNCj4gIGV4dGVybiB1aW50MzJfdCB4ZW5fY3B1aWRfYmFzZTsNCj4gDQo+IC12b2lkIHBy
b2JlX2h5cGVydmlzb3Iodm9pZCk7DQo+ICtjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKnhl
bl9wcm9iZSh2b2lkKTsNCj4gIGludCB4Z19hbGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKTsN
Cj4gIGludCB4Z19mcmVlX3VudXNlZF9wYWdlKG1mbl90IG1mbik7DQo+IA0KPiBAQCAtNDQsNyAr
NDUsNyBAQCBERUNMQVJFX1BFUl9DUFUoc3RydWN0IHZjcHVfaW5mbyAqLCB2Y3B1X2luZm8pOw0K
PiAgI2RlZmluZSB4ZW5fZ3Vlc3QgMA0KPiAgI2RlZmluZSBwdl9jb25zb2xlIDANCg0KTml0OiBU
aGVzZSBzaG91bGQgYmUgI2RlZmluZWQgdG8gZmFsc2UgcmF0aGVyIHRoYW4gMC4gVGhlIHJlc3Qg
TEdUTSBzbyB3aXRoIHRob3NlIGZpeGVkLA0KDQpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPg0KDQoNCg0KPiANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBwcm9i
ZV9oeXBlcnZpc29yKHZvaWQpIHt9DQo+ICtzdGF0aWMgaW5saW5lIGNvbnN0IHN0cnVjdCBoeXBl
cnZpc29yX29wcyAqeGVuX3Byb2JlKHZvaWQpIHsgcmV0dXJuIE5VTEw7DQo+IH0NCj4gDQo+ICAj
ZW5kaWYgLyogQ09ORklHX1hFTl9HVUVTVCAqLw0KPiAgI2VuZGlmIC8qIF9fWDg2X0dVRVNUX1hF
Tl9IX18gKi8NCj4gLS0NCj4gMi4yMC4xDQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

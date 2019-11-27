Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3809A10B30E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:17:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzy9-0005cL-PJ; Wed, 27 Nov 2019 16:15:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J2FP=ZT=amazon.com=prvs=227ebe4de=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZzy7-0005cC-G0
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:15:07 +0000
X-Inumbo-ID: 13a3e94a-1131-11ea-83b8-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13a3e94a-1131-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574871307; x=1606407307;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b/NVRr7nszMRXxcys9tkrWRgCQTCBHfZkwfYZkTNKv8=;
 b=qnC0wfX7YRaU/6LTR/qxT7yotJvy30aoie1w4i//lBuZ+hmOtscVEbvz
 WzFpOiw5rstU0lXQ+gfjGiHmjN/LzrnFgLv0SssjCrfZZWpoSdZv/3fO6
 E/KTVJ7oyAIPEQIiF49B5J5Z46WoQsxBs3BYuy9Zm/64Y8Ifh6xP5ap6o Y=;
IronPort-SDR: TRgye0bWbd/sb2JwLRAlBe9kV1zzHzsEs5lISBEM/4qHpLwK7xm2Pv6H9mEYM2MMCiUeOiAESy
 8w3gHnx8gkFQ==
X-IronPort-AV: E=Sophos;i="5.69,250,1571702400"; 
   d="scan'208";a="5171201"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 27 Nov 2019 16:15:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9E52BA1775; Wed, 27 Nov 2019 16:15:00 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 16:14:59 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 16:14:58 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 27 Nov 2019 16:14:58 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [PATCH v2] Rationalize max_grant_frames and max_maptrack_frames
 handling
Thread-Index: AQHVpTAp6d7afvQ5DEmrMruSpV3gSaefK+QAgAABmBA=
Date: Wed, 27 Nov 2019 16:14:58 +0000
Message-ID: <a644007e77374b90b5abf11a76b2331d@EX13D32EUC003.ant.amazon.com>
References: <20191127143711.4377-1-pdurrant@amazon.com>
 <31090dd0-a8e5-7716-40a6-0e72de7f7934@suse.com>
In-Reply-To: <31090dd0-a8e5-7716-40a6-0e72de7f7934@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] Rationalize max_grant_frames and
 max_maptrack_frames handling
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMTkgMTU6NTYNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47DQo+IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJj
aHVrQGVwYW0uY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29t
PjsNCj4gSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kNCj4gPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+OyBT
dGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLb25yYWQgUnpl
c3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Ow0KPiBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2Ml0gUmF0aW9uYWxpemUgbWF4X2dyYW50X2ZyYW1lcyBhbmQNCj4gbWF4X21hcHRyYWNrX2Zy
YW1lcyBoYW5kbGluZw0KPiANCj4gT24gMjcuMTEuMjAxOSAxNTozNywgUGF1bCBEdXJyYW50IHdy
b3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ID4gKysrIGIveGVuL2FyY2gv
YXJtL3NldHVwLmMNCj4gPiBAQCAtNzg5LDcgKzc4OSw3IEBAIHZvaWQgX19pbml0IHN0YXJ0X3hl
bih1bnNpZ25lZCBsb25nDQo+IGJvb3RfcGh5c19vZmZzZXQsDQo+ID4gICAgICAgICAgLmZsYWdz
ID0gWEVOX0RPTUNUTF9DREZfaHZtIHwgWEVOX0RPTUNUTF9DREZfaGFwLA0KPiA+ICAgICAgICAg
IC5tYXhfZXZ0Y2huX3BvcnQgPSAtMSwNCj4gPiAgICAgICAgICAubWF4X2dyYW50X2ZyYW1lcyA9
IGdudHRhYl9kb20wX2ZyYW1lcygpLA0KPiA+IC0gICAgICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVz
ID0gb3B0X21heF9tYXB0cmFja19mcmFtZXMsDQo+ID4gKyAgICAgICAgLm1heF9tYXB0cmFja19m
cmFtZXMgPSAtMSwNCj4gPiAgICAgIH07DQo+ID4gICAgICBpbnQgcmM7DQo+ID4NCj4gPiAtLS0g
YS94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jDQo+
ID4gQEAgLTY5Nyw4ICs2OTcsOCBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1
bnNpZ25lZCBsb25nDQo+IG1iaV9wKQ0KPiA+ICAgICAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRl
ZG9tYWluIGRvbTBfY2ZnID0gew0KPiA+ICAgICAgICAgIC5mbGFncyA9IElTX0VOQUJMRUQoQ09O
RklHX1RCT09UKSA/IFhFTl9ET01DVExfQ0RGX3MzX2ludGVncml0eQ0KPiA6IDAsDQo+ID4gICAg
ICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0xLA0KPiA+IC0gICAgICAgIC5tYXhfZ3JhbnRfZnJh
bWVzID0gb3B0X21heF9ncmFudF9mcmFtZXMsDQo+ID4gLSAgICAgICAgLm1heF9tYXB0cmFja19m
cmFtZXMgPSBvcHRfbWF4X21hcHRyYWNrX2ZyYW1lcywNCj4gPiArICAgICAgICAubWF4X2dyYW50
X2ZyYW1lcyA9IC0xLA0KPiA+ICsgICAgICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVzID0gLTEsDQo+
ID4gICAgICB9Ow0KPiANCj4gV2l0aCB0aGVzZSB0aGVyZSdzIG5vIG5lZWQgYW55bW9yZSBmb3Ig
b3B0X21heF9tYXB0cmFja19mcmFtZXMgdG8NCj4gYmUgbm9uLXN0YXRpYy4gU2FkbHkgQXJtIHN0
aWxsIHdhbnRzIG9wdF9tYXhfZ3JhbnRfZnJhbWVzDQo+IGFjY2Vzc2libGUgaW4gZ250dGFiX2Rv
bTBfZnJhbWVzKCkuDQo+DQoNClllcywgSSB3YXMgYWJvdXQgdG8gbWFrZSB0aGVtIHN0YXRpYyB1
bnRpbCBJIHNhdyB3aGF0IHRoZSBBUk0gY29kZSBkaWQuDQogDQo+ID4gLS0tIGEveGVuL2NvbW1v
bi9ncmFudF90YWJsZS5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+ID4g
QEAgLTE4MzcsMTIgKzE4MzcsMTggQEAgYWN0aXZlX2FsbG9jX2ZhaWxlZDoNCj4gPiAgICAgIHJl
dHVybiAtRU5PTUVNOw0KPiA+ICB9DQo+ID4NCj4gPiAtaW50IGdyYW50X3RhYmxlX2luaXQoc3Ry
dWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IG1heF9ncmFudF9mcmFtZXMsDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXhfbWFwdHJhY2tfZnJhbWVzKQ0KPiA+ICtp
bnQgZ3JhbnRfdGFibGVfaW5pdChzdHJ1Y3QgZG9tYWluICpkLCBpbnQgbWF4X2dyYW50X2ZyYW1l
cywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgaW50IG1heF9tYXB0cmFja19mcmFtZXMpDQo+
ID4gIHsNCj4gPiAgICAgIHN0cnVjdCBncmFudF90YWJsZSAqZ3Q7DQo+ID4gICAgICBpbnQgcmV0
ID0gLUVOT01FTTsNCj4gPg0KPiA+ICsgICAgLyogRGVmYXVsdCB0byBtYXhpbXVtIHZhbHVlIGlm
IG5vIHZhbHVlIHdhcyBzcGVjaWZpZWQgKi8NCj4gPiArICAgIGlmICggbWF4X2dyYW50X2ZyYW1l
cyA8IDAgKQ0KPiA+ICsgICAgICAgIG1heF9ncmFudF9mcmFtZXMgPSBvcHRfbWF4X2dyYW50X2Zy
YW1lczsNCj4gPiArICAgIGlmICggbWF4X21hcHRyYWNrX2ZyYW1lcyA8IDAgKQ0KPiA+ICsgICAg
ICAgIG1heF9tYXB0cmFja19mcmFtZXMgPSBvcHRfbWF4X21hcHRyYWNrX2ZyYW1lczsNCj4gPiAr
DQo+ID4gICAgICBpZiAoIG1heF9ncmFudF9mcmFtZXMgPCBJTklUSUFMX05SX0dSQU5UX0ZSQU1F
UyB8fA0KPiANCj4gSSB0YWtlIGl0IHdlIGRvbid0IGV4cGVjdCBwZW9wbGUgdG8gc3BlY2lmeSAy
Xl4zMSBvciBtb3JlDQo+IGZyYW1lcyBmb3IgZWl0aGVyIG9wdGlvbi4gSXQgbG9va3MgbGlrZSBh
bG1vc3QgZXZlcnl0aGluZw0KPiBoZXJlIHdvdWxkIGNvcGUsIGV4Y2VwdCBmb3IgdGhpcyB2ZXJ5
IGNvbXBhcmlzb24uIE5ldmVydGhlbGVzcw0KPiBJIHdvbmRlciB3aGV0aGVyIHlvdSB3b3VsZG4n
dCBiZXR0ZXIgY29uZmluZSBib3RoIHZhbHVlcyB0bw0KPiBbMCwgSU5UX01BWF0gbm93LCBpbmNs
dWRpbmcgd2hlbiBhZGp1c3RlZCBhdCBydW50aW1lLg0KDQpJIGNhbiBjZXJ0YWlubHkgcmVtb3Zl
IHRoZSAnVScgZnJvbSB0aGUgZGVmaW5pdGlvbiBvZiBJTklUSUFMX05SX0dSQU5UX0ZSQU1FUywg
YnV0IGRvIHlvdSB3YW50IG1lIHRvIG1ha2Ugb3B0X21heF9ncmFudF9mcmFtZXMgYW5kIG9wdF9t
YXhfbWFwdHJhY2tfZnJhbWVzIGludG8gc2lnbmVkIGludHMgYW5kIGFkZCBzaWduZWQgcGFyc2Vy
IGNvZGUgdG9vPyBJIGFsc28gZG9uJ3QgdW5kZXJzdGFuZCB0aGUgJ2FkanVzdGVkIGF0IHJ1bnRp
bWUnIHBhcnQuDQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

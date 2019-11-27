Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8210B3C1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:45:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia0Q4-0000P7-7p; Wed, 27 Nov 2019 16:44:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J2FP=ZT=amazon.com=prvs=227ebe4de=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ia0Q2-0000Ow-RG
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:43:58 +0000
X-Inumbo-ID: 1b6b6dc0-1135-11ea-83b8-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b6b6dc0-1135-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574873039; x=1606409039;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7clY8hwGPwaZ283C+uBuTDfBrs3Afc6lpoLa4XWkkz0=;
 b=jmNxNHpoxTYWGYZIWJzg8LPRPbAtWOmBrTZ5etKecZtQy2xNNPUSkmgi
 1VQ1kn3E26arToT10mJWTY9nhUW10nypKp+9f8N2HQcR5l5VayNzItt58
 z+JbTFTuK7TvxBFUFblF+xI13TLv/vbp34qYdPUSE/V+BZXhq+oRWRy1t I=;
IronPort-SDR: bjHcLoV2q6TiVY5jEGqSeMkrkJ58oBi6fN2LvSGIQuqAb3dpzj1MCJ2ontVN8oEUqyYDn2Ku7n
 Lx7RfaPw8drA==
X-IronPort-AV: E=Sophos;i="5.69,250,1571702400"; d="scan'208";a="10250131"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 27 Nov 2019 16:43:48 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1CBF7A1F4C; Wed, 27 Nov 2019 16:43:46 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 16:43:45 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 16:43:44 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 27 Nov 2019 16:43:44 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v2] Rationalize max_grant_frames and max_maptrack_frames
 handling
Thread-Index: AQHVpTAp6d7afvQ5DEmrMruSpV3gSaefK+QAgAABmBCAAAVmgIAAA6gAgAABsSA=
Date: Wed, 27 Nov 2019 16:43:44 +0000
Message-ID: <e8a947346b084e0088608ddeca4bd52c@EX13D32EUC003.ant.amazon.com>
References: <20191127143711.4377-1-pdurrant@amazon.com>
 <31090dd0-a8e5-7716-40a6-0e72de7f7934@suse.com>
 <a644007e77374b90b5abf11a76b2331d@EX13D32EUC003.ant.amazon.com>
 <d581a826-0959-1e8e-f78f-65a0f10b4b65@suse.com>
 <bfdfac8d-8f80-7d79-ba8b-b781de1b310a@citrix.com>
In-Reply-To: <bfdfac8d-8f80-7d79-ba8b-b781de1b310a@citrix.com>
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+DQo+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMTkgMTY6MzQNCj4g
VG86IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jb20+DQo+IENjOiBBbmRyZXdDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNo
dWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgR2VvcmdlIER1bmxhcA0KPiA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPjsgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+Ow0KPiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJs
ZXRoaW5nc2xhYi5jb20+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IEtvbnJhZCBSemVzenV0
ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVu
QHhlbi5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYy
XSBSYXRpb25hbGl6ZSBtYXhfZ3JhbnRfZnJhbWVzIGFuZA0KPiBtYXhfbWFwdHJhY2tfZnJhbWVz
IGhhbmRsaW5nDQo+IA0KPiBPbiAxMS8yNy8xOSA0OjIwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4gPiBPbiAyNy4xMS4yMDE5IDE3OjE0LCAgRHVycmFudCwgUGF1bCAgd3JvdGU6DQo+ID4+PiBG
cm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+PiBTZW50OiAyNyBOb3Zl
bWJlciAyMDE5IDE1OjU2DQo+ID4+Pg0KPiA+Pj4gT24gMjcuMTEuMjAxOSAxNTozNywgUGF1bCBE
dXJyYW50IHdyb3RlOg0KPiA+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ID4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gPj4+PiBAQCAtNzg5LDcgKzc4OSw3IEBAIHZv
aWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nDQo+ID4+PiBib290X3BoeXNfb2Zmc2V0
LA0KPiA+Pj4+ICAgICAgICAgIC5mbGFncyA9IFhFTl9ET01DVExfQ0RGX2h2bSB8IFhFTl9ET01D
VExfQ0RGX2hhcCwNCj4gPj4+PiAgICAgICAgICAubWF4X2V2dGNobl9wb3J0ID0gLTEsDQo+ID4+
Pj4gICAgICAgICAgLm1heF9ncmFudF9mcmFtZXMgPSBnbnR0YWJfZG9tMF9mcmFtZXMoKSwNCj4g
Pj4+PiAtICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1lcyA9IG9wdF9tYXhfbWFwdHJhY2tfZnJh
bWVzLA0KPiA+Pj4+ICsgICAgICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVzID0gLTEsDQo+ID4+Pj4g
ICAgICB9Ow0KPiA+Pj4+ICAgICAgaW50IHJjOw0KPiA+Pj4+DQo+ID4+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3NldHVwLmMNCj4gPj4+PiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiA+Pj4+
IEBAIC02OTcsOCArNjk3LDggQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5z
aWduZWQgbG9uZw0KPiA+Pj4gbWJpX3ApDQo+ID4+Pj4gICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9j
cmVhdGVkb21haW4gZG9tMF9jZmcgPSB7DQo+ID4+Pj4gICAgICAgICAgLmZsYWdzID0gSVNfRU5B
QkxFRChDT05GSUdfVEJPT1QpID8NCj4gWEVOX0RPTUNUTF9DREZfczNfaW50ZWdyaXR5DQo+ID4+
PiA6IDAsDQo+ID4+Pj4gICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0xLA0KPiA+Pj4+IC0g
ICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gb3B0X21heF9ncmFudF9mcmFtZXMsDQo+ID4+Pj4g
LSAgICAgICAgLm1heF9tYXB0cmFja19mcmFtZXMgPSBvcHRfbWF4X21hcHRyYWNrX2ZyYW1lcywN
Cj4gPj4+PiArICAgICAgICAubWF4X2dyYW50X2ZyYW1lcyA9IC0xLA0KPiA+Pj4+ICsgICAgICAg
IC5tYXhfbWFwdHJhY2tfZnJhbWVzID0gLTEsDQo+ID4+Pj4gICAgICB9Ow0KPiA+Pj4NCj4gPj4+
IFdpdGggdGhlc2UgdGhlcmUncyBubyBuZWVkIGFueW1vcmUgZm9yIG9wdF9tYXhfbWFwdHJhY2tf
ZnJhbWVzIHRvDQo+ID4+PiBiZSBub24tc3RhdGljLiBTYWRseSBBcm0gc3RpbGwgd2FudHMgb3B0
X21heF9ncmFudF9mcmFtZXMNCj4gPj4+IGFjY2Vzc2libGUgaW4gZ250dGFiX2RvbTBfZnJhbWVz
KCkuDQo+ID4+DQo+ID4+IFllcywgSSB3YXMgYWJvdXQgdG8gbWFrZSB0aGVtIHN0YXRpYyB1bnRp
bCBJIHNhdyB3aGF0IHRoZSBBUk0gY29kZSBkaWQuDQo+ID4NCj4gPiBCdXQgdGhlIG9uZSB0aGF0
IEFybSBkb2Vzbid0IG5lZWQgc2hvdWxkIGJlY29tZSBzdGF0aWMgbm93Lg0KPiA+DQo+ID4+Pj4g
LS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+ID4+Pj4gKysrIGIveGVuL2NvbW1vbi9n
cmFudF90YWJsZS5jDQo+ID4+Pj4gQEAgLTE4MzcsMTIgKzE4MzcsMTggQEAgYWN0aXZlX2FsbG9j
X2ZhaWxlZDoNCj4gPj4+PiAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+Pj4+ICB9DQo+ID4+Pj4N
Cj4gPj4+PiAtaW50IGdyYW50X3RhYmxlX2luaXQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQg
aW50DQo+IG1heF9ncmFudF9mcmFtZXMsDQo+ID4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBtYXhfbWFwdHJhY2tfZnJhbWVzKQ0KPiA+Pj4+ICtpbnQgZ3JhbnRfdGFibGVf
aW5pdChzdHJ1Y3QgZG9tYWluICpkLCBpbnQgbWF4X2dyYW50X2ZyYW1lcywNCj4gPj4+PiArICAg
ICAgICAgICAgICAgICAgICAgaW50IG1heF9tYXB0cmFja19mcmFtZXMpDQo+ID4+Pj4gIHsNCj4g
Pj4+PiAgICAgIHN0cnVjdCBncmFudF90YWJsZSAqZ3Q7DQo+ID4+Pj4gICAgICBpbnQgcmV0ID0g
LUVOT01FTTsNCj4gPj4+Pg0KPiA+Pj4+ICsgICAgLyogRGVmYXVsdCB0byBtYXhpbXVtIHZhbHVl
IGlmIG5vIHZhbHVlIHdhcyBzcGVjaWZpZWQgKi8NCj4gPj4+PiArICAgIGlmICggbWF4X2dyYW50
X2ZyYW1lcyA8IDAgKQ0KPiA+Pj4+ICsgICAgICAgIG1heF9ncmFudF9mcmFtZXMgPSBvcHRfbWF4
X2dyYW50X2ZyYW1lczsNCj4gPj4+PiArICAgIGlmICggbWF4X21hcHRyYWNrX2ZyYW1lcyA8IDAg
KQ0KPiA+Pj4+ICsgICAgICAgIG1heF9tYXB0cmFja19mcmFtZXMgPSBvcHRfbWF4X21hcHRyYWNr
X2ZyYW1lczsNCj4gPj4+PiArDQo+ID4+Pj4gICAgICBpZiAoIG1heF9ncmFudF9mcmFtZXMgPCBJ
TklUSUFMX05SX0dSQU5UX0ZSQU1FUyB8fA0KPiA+Pj4NCj4gPj4+IEkgdGFrZSBpdCB3ZSBkb24n
dCBleHBlY3QgcGVvcGxlIHRvIHNwZWNpZnkgMl5eMzEgb3IgbW9yZQ0KPiA+Pj4gZnJhbWVzIGZv
ciBlaXRoZXIgb3B0aW9uLiBJdCBsb29rcyBsaWtlIGFsbW9zdCBldmVyeXRoaW5nDQo+ID4+PiBo
ZXJlIHdvdWxkIGNvcGUsIGV4Y2VwdCBmb3IgdGhpcyB2ZXJ5IGNvbXBhcmlzb24uIE5ldmVydGhl
bGVzcw0KPiA+Pj4gSSB3b25kZXIgd2hldGhlciB5b3Ugd291bGRuJ3QgYmV0dGVyIGNvbmZpbmUg
Ym90aCB2YWx1ZXMgdG8NCj4gPj4+IFswLCBJTlRfTUFYXSBub3csIGluY2x1ZGluZyB3aGVuIGFk
anVzdGVkIGF0IHJ1bnRpbWUuDQo+ID4+DQo+ID4+IEkgY2FuIGNlcnRhaW5seSByZW1vdmUgdGhl
ICdVJyBmcm9tIHRoZSBkZWZpbml0aW9uIG9mDQo+ID4+IElOSVRJQUxfTlJfR1JBTlRfRlJBTUVT
LA0KPiA+DQo+ID4gT2gsIEkgZGlkbid0IHBheSBhdHRlbnRpb24gdGhhdCBpcyBoYXMgYSBVIG9u
IGl0IC0gaW4gdGhpcyBjYXNlDQo+ID4gdGhlIGNvbXBhcmlzb24gYWJvdmUgaXMgZmluZS4NCj4g
Pg0KPiA+PiBidXQgZG8geW91IHdhbnQgbWUgdG8gbWFrZSBvcHRfbWF4X2dyYW50X2ZyYW1lcyBh
bmQNCj4gPj4gb3B0X21heF9tYXB0cmFja19mcmFtZXMgaW50byBzaWduZWQgaW50cyBhbmQgYWRk
IHNpZ25lZCBwYXJzZXINCj4gPj4gY29kZSB0b28/DQo+ID4NCj4gPiBEZWZpbml0ZWx5IG5vdC4g
VGhleSBzaG91bGQgcmVtYWluIHVuc2lnbmVkIHF1YW50aXRpZXMsIGJ1dCB0aGVpcg0KPiA+IHZh
bHVlcyBtYXkgbmVlZCBzYW5pdHkgY2hlY2tpbmcgbm93Lg0KPiA+DQo+ID4+IEkgYWxzbyBkb24n
dCB1bmRlcnN0YW5kIHRoZSAnYWRqdXN0ZWQgYXQgcnVudGltZScgcGFydC4NCj4gPg0KPiA+IFdl
bGwsIGZvciBhIGNvbW1hbmQgbGluZSBkcml2ZSB2YWx1ZSB5b3UgY291bGQgYWRqdXN0IGFuIG91
dCBvZg0KPiA+IGJvdW5kcyB2YWx1ZSBpbiBzb21lIF9faW5pdCBmdW5jdGlvbi4gQnV0IGZvciBy
dW50aW1lIG1vZGlmaWFibGUNCj4gPiBzZXR0aW5ncyB5b3Ugd29uJ3QgZ2V0IGF3YXkgdGhpcyBl
YXNpbHkuDQo+IA0KPiBUQkggSSdkIGJlIHRlbXB0ZWQgdG8gZGVmaW5lIFhFTlNPTUVUSElOR19N
QVhfREVGQVVMVCBhcyAodW5zaWduZWQNCj4gbG9uZykoLTEpIG9yIHNvbWV0aGluZywgYW5kIGV4
cGxpY2l0bHkgY29tcGFyZSB0byB0aGF0LiAgVGhhdCBsZWF2ZXMNCj4gb3BlbiB0aGUgcG9zc2li
aWxpdHkgb2YgaGF2aW5nIG1vcmUgc2VudGluZWwgdmFsdWVzIGlmIHdlIGRlY2lkZWQgd2UNCj4g
d2FudGVkIHRoZW0uDQoNCkknbSBleHRyZW1lbHkgY29uZnVzZWQgbm93LiBXaGF0IGRvIHlvdSB3
YW50IG1lIHRvIGNvbXBhcmUgYW5kIHdoZXJlPw0KDQpJIGFzc3VtZSB3ZSdyZSB0YWxraW5nIGFi
b3V0IHRoZSBvcHRfWFhYIHZhbHVlcy4gQW0gSSBzdXBwb3NlZCB0byBzdG9wID5JTlRfTUFYIGJl
aW5nIGFzc2lnbmVkIHRvIHRoZW0/IE9yIHNob3VsZCBJIGRlZmluZSBsb2NhbCB1bnNpZ25lZCB2
YWx1ZXMgZm9yIG1heF9tYXB0cmFjay9ncmFudF9mcmFtZXMgYW5kIHNpbXBseSBpbml0aWFsaXpl
IHRoZW0gdG8gdGhlIHBhc3NlZC1pbiBhcmcgKGlmID49IDApIG9yIHRoZSBvcHRfWFhYIHZhbHVl
IG90aGVyd2lzZS4NCg0KICBQYXVsDQoNCj4gDQo+ICAtR2VvcmdlDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

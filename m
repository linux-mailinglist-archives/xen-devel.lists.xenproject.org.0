Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C8997F62
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 17:50:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Sq7-0005h5-TV; Wed, 21 Aug 2019 15:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qki=WR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0Sq6-0005h0-0J
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 15:47:58 +0000
X-Inumbo-ID: 0b03bc00-c42b-11e9-b95f-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b03bc00-c42b-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566402476;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TphQITFB1a07LOucCRf8nqPst0TQHqfbR2HVeEZOUzA=;
 b=VEJEQKLGDsLsIHoT+dzwGAAZtblYFXJyBp5kcrV12fmc+kjKZT9pDPEU
 Dwa4hnXJvxIeakUIq/UQrAsPWZUDHP+/PYVj6GWdpK/RUmXItTfzCCrP2
 BgFc7vR4tgVEv8lfdK9wcZvco4IaYF+Lm+8qWGFqXkYFhfFeK5Vv5u/dt 8=;
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
IronPort-SDR: rk/iJv7jGqgefajSlDLWS9p9HIRB8MraFjVVUi9rW0v9E4p5Cq+0DBSrJCoLRDyW2BWiG4MVuX
 A4qBDfyhka/wYLW/IDbtEV5r3tKStTSfur4iixHQjxpEyCG9qR/cwNRlyFaYPLYwWzz8w/0241
 +z4ZT4s/m/ZqI9nuI+gHzMX39KEcWxlWiT4nQY4aebhc7dx3Nv/6hPzlkAaFhjW9C9QdPsaocF
 hu1vG7tZkdcyOLGocMVUjd65lYpI1gr5aRZJYW8TYgue6ZTyYTwxmNVllLrj4lq+19CgnoHYH/
 urM=
X-SBRS: 2.7
X-MesageID: 4721129
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4721129"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Oleksandr' <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH V3 3/8] xen/common: Introduce _xrealloc
 function
Thread-Index: AQHVV4KtanexaiQorkezECnm2VwoWqcFPdlggABNJACAADPtAA==
Date: Wed, 21 Aug 2019 15:47:51 +0000
Message-ID: <51167370fc2d4853bd0d34df1b4dfb24@AMSPEX02CL03.citrite.net>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-4-git-send-email-olekstysh@gmail.com>
 <a12616b4e61e418ab2d17a5e0ed02754@AMSPEX02CL03.citrite.net>
 <5cac4d1b-2406-a8e8-90c2-e04176a837ae@gmail.com>
In-Reply-To: <5cac4d1b-2406-a8e8-90c2-e04176a837ae@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V3 3/8] xen/common: Introduce _xrealloc
 function
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBPbGVrc2FuZHIgPG9sZWtzdHlz
aEBnbWFpbC5jb20+DQo+IFNlbnQ6IDIxIEF1Z3VzdCAyMDE5IDE1OjM2DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IENjOiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsNCj4gR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3NvbkBjaXRy
aXguY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBPbGVrc2FuZHIgVHlzaGNoZW5r
bw0KPiA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+OyBqdWxpZW4uZ3JhbGxAYXJtLmNv
bTsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsNCj4gVm9sb2R5bXlyX0JhYmNodWtA
ZXBhbS5jb20NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCBWMyAzLzhdIHhlbi9j
b21tb246IEludHJvZHVjZSBfeHJlYWxsb2MgZnVuY3Rpb24NCj4gDQo+IA0KPiBPbiAyMS4wOC4x
OSAxMTowOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiANCj4gSGksIFBhdWwNCj4gDQo+ID4+ICAg
fQ0KPiA+Pg0KPiA+PiArdm9pZCAqX3hyZWFsbG9jKHZvaWQgKnB0ciwgdW5zaWduZWQgbG9uZyBz
aXplLCB1bnNpZ25lZCBsb25nIGFsaWduKQ0KPiA+PiArew0KPiA+PiArICAgIHVuc2lnbmVkIGxv
bmcgY3Vycl9zaXplLCB0bXBfc2l6ZTsNCj4gPj4gKyAgICB2b2lkICpwOw0KPiA+PiArDQo+ID4+
ICsgICAgaWYgKCAhc2l6ZSApDQo+ID4+ICsgICAgew0KPiA+PiArICAgICAgICB4ZnJlZShwdHIp
Ow0KPiA+PiArICAgICAgICByZXR1cm4gWkVST19CTE9DS19QVFI7DQo+ID4+ICsgICAgfQ0KPiA+
PiArDQo+ID4+ICsgICAgaWYgKCBwdHIgPT0gTlVMTCB8fCBwdHIgPT0gWkVST19CTE9DS19QVFIg
KQ0KPiA+PiArICAgICAgICByZXR1cm4gX3htYWxsb2Moc2l6ZSwgYWxpZ24pOw0KPiA+PiArDQo+
ID4+ICsgICAgaWYgKCAhKCh1bnNpZ25lZCBsb25nKXB0ciAmIChQQUdFX1NJWkUgLSAxKSkgKQ0K
PiA+PiArICAgICAgICBjdXJyX3NpemUgPSBQRk5fT1JERVIodmlydF90b19wYWdlKHB0cikpIDw8
IFBBR0VfU0hJRlQ7DQo+ID4+ICsgICAgZWxzZQ0KPiA+PiArICAgIHsNCj4gPj4gKyAgICAgICAg
c3RydWN0IGJoZHIgKmI7DQo+ID4+ICsgICAgICAgIGIgPSAoc3RydWN0IGJoZHIgKikoKGNoYXIg
KilwdHIgLSBCSERSX09WRVJIRUFEKTsNCj4gPj4gKyAgICAgICAgY3Vycl9zaXplID0gYi0+c2l6
ZSAmIEJMT0NLX1NJWkVfTUFTSzsNCj4gPj4gKyAgICB9DQo+ID4gVGhhdCBzZWNvbmRzIGNsYXVz
ZSBpcyBub3QgZ29pbmcgdG8gZ2l2ZSB5b3UgdGhlIGJsb2NrIHNpemUgaWYgdGhlIHByZXZpb3Vz
IGFsbG9jYXRpb24gaGFkIGFsaWdubWVudA0KPiBwYWRkaW5nLiBZb3UnbGwgbmVlZCB0byBjaGVj
ayB0aGUgRlJFRV9CTE9DSyBiaXQgdG8gdGVsbCB3aGV0aGVyIGl0J3MgYSByZWFsIGJsb2NrIGhl
YWRlciBvciB0aGUNCj4gJ2Zha2UnIGFsaWdubWVudCBoZWFkZXIgYW5kIHRoZW4gbWF5YmUgd2Fs
ayBiYWNrd2FyZHMgb250byB0aGUgcmVhbCBoZWFkZXIuIFNlZSB0aGUgY29kZSBpbiB4ZnJlZSgp
Lg0KPiANCj4gSW5kZWVkLiBUaGFuayB5b3UgZm9yIHRoZSBwb2ludGVyLg0KPiANCj4gDQo+ID4g
WW91IHNob3VsZCBhbHNvIGNoZWNrIHdoZXRoZXIgdGhlIG5ldyByZXF1ZXN0ZWQgYWxpZ25tZW50
IGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgZXhpc3RpbmcgYmxvY2sNCj4gYWxpZ25tZW50DQo+IA0K
PiANCj4gSSBhbSB3b25kZXJpbmc6DQo+IA0KPiBJbiBjYXNlIHdoZW4gd2UgdXNlIG9ubHkgdHlw
ZS1zYWZlIGNvbnN0cnVjdGlvbiBmb3IgdGhlIGJhc2ljIGFsbG9jYXRpb24NCj4gKHhtYWxsb2Mp
IGFuZCB0eXBlLXNhZmUgY29uc3RydWN0aW9uIGZvciB0aGUgcmUtYWxsb2NhdGlvbg0KPiAoeHJl
YWxsb2NfZmxleF9zdHJ1Y3QpIG92ZXIgdGhlIHNhbWUgcG9pbnRlciBvZiB0aGUgY29ycmVjdCB0
eXBlLCB3aWxsDQo+IHdlIGdldCBhIHBvc3NpYmxlIGFsaWdubWVudCBpbmNvbXBhdGliaWxpdHk/
DQoNCllvdSBzaG91bGRuJ3QgYnV0IHlvdSdyZSB0cnVzdGluZyB0aGF0IG5vLW9uZSB3aWxsIHdh
bnQgdG8gY2FsbCB0aGUgZnVuY3Rpb24gZGlyZWN0bHkgd2l0aCBhIGhpZ2hlciBhbGlnbm1lbnQu
DQogDQo+IA0KPiANCj4gVGhpcyBpcyBob3cgSSBzZWUgaXQ6DQo+IA0KPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYyBiL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMNCj4g
aW5kZXggZWVjYWUyZS4uZjkwZjQ1MyAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi94bWFsbG9j
X3Rsc2YuYw0KPiArKysgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jDQo+IEBAIC02MTYsOCAr
NjE2LDE1IEBAIHZvaWQgKl94cmVhbGxvYyh2b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSwN
Cj4gdW5zaWduZWQgbG9uZyBhbGlnbikNCj4gIMKgwqDCoMKgwqDCoMKgwqAgY3Vycl9zaXplID0g
UEZOX09SREVSKHZpcnRfdG9fcGFnZShwdHIpKSA8PCBQQUdFX1NISUZUOw0KPiAgwqDCoMKgwqAg
ZWxzZQ0KPiAgwqDCoMKgwqAgew0KPiAtwqDCoMKgwqDCoMKgwqAgc3RydWN0IGJoZHIgKmI7DQo+
IC3CoMKgwqDCoMKgwqDCoCBiID0gKHN0cnVjdCBiaGRyICopKChjaGFyICopcHRyIC0gQkhEUl9P
VkVSSEVBRCk7DQo+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYmhkciAqYiA9IChzdHJ1Y3QgYmhk
ciAqKSgoY2hhciAqKXB0ciAtIEJIRFJfT1ZFUkhFQUQpOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoIGItPnNpemUgJiBGUkVFX0JMT0NLICkNCj4gK8KgwqDCoMKgwqDCoMKgIHsNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcCA9IChjaGFyICopcHRyIC0gKGItPnNpemUgJiB+RlJFRV9C
TE9DSyk7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGIgPSAoc3RydWN0IGJoZHIgKikoKGNo
YXIgKilwIC0gQkhEUl9PVkVSSEVBRCk7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VS
VCghKGItPnNpemUgJiBGUkVFX0JMT0NLKSk7DQo+ICvCoMKgwqDCoMKgwqDCoCB9DQo+ICsNCj4g
IMKgwqDCoMKgwqDCoMKgwqAgY3Vycl9zaXplID0gYi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFTSzsN
Cg0KWWVzLCB0aGF0IGxvb2tzIG9rIGZvciBnZXR0aW5nIHRoZSBzaXplIHJpZ2h0Li4uDQoNCj4g
IMKgwqDCoMKgIH0NCj4gDQo+IEBAIC02MzAsOCArNjM3LDggQEAgdm9pZCAqX3hyZWFsbG9jKHZv
aWQgKnB0ciwgdW5zaWduZWQgbG9uZyBzaXplLA0KPiB1bnNpZ25lZCBsb25nIGFsaWduKQ0KPiAg
wqDCoMKgwqDCoMKgwqDCoCB0bXBfc2l6ZSA9ICggdG1wX3NpemUgPCBNSU5fQkxPQ0tfU0laRSAp
ID8gTUlOX0JMT0NLX1NJWkUgOg0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJPVU5EVVBf
U0laRSh0bXBfc2l6ZSk7DQo+IA0KPiAtwqDCoMKgIGlmICggdG1wX3NpemUgPD0gY3Vycl9zaXpl
ICkgLyogZml0cyBpbiBjdXJyZW50IGJsb2NrICovDQo+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4g
cHRyOw0KPiArwqDCoMKgIGlmICggdG1wX3NpemUgPD0gY3Vycl9zaXplICYmICgodW5zaWduZWQg
bG9uZylwdHIgJiAoYWxpZ24gLSAxKSkgPT0gMCApDQo+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cHRyOyAvKiBmaXRzIGluIGN1cnJlbnQgYmxvY2sgKi8NCg0KLi4uYW5kIHRoYXQgc2hvdWxkIGRl
YWwgd2l0aCB0aGUgYWxpZ25tZW50IHRvbyAoYWx0aG91Z2ggeW91IG1heSB3YW50IHRvIG1lbnRp
b24gdGhlIGFsaWdubWVudCBwYXJ0IGluIHRoZSBjb21tZW50IHRvbykNCg0KPiANCj4gIMKgwqDC
oMKgIHAgPSBfeG1hbGxvYyhzaXplLCBhbGlnbik7DQo+ICDCoMKgwqDCoCBpZiAoIHAgKQ0KPiAN
Cj4gKEVORCkNCj4gDQo+IA0KPiBEaWQgSSBnZXQgeW91ciBwb2ludCBjb3JyZWN0Pw0KPiANCg0K
WWVzLCB3aXRoIHRob3NlIGNoYW5nZXMgSSB0aGluayBpdCB3aWxsIGxvb2sgb2suDQoNCiAgUGF1
bA0KDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gT2xla3NhbmRyIFR5c2hjaGVua28NCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

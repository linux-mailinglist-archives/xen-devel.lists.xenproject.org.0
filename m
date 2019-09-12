Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D7AB0FB8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:21:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8P06-0004iy-7n; Thu, 12 Sep 2019 13:19:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GjwE=XH=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8P04-0004it-Gf
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:19:04 +0000
X-Inumbo-ID: e2e162eb-d55f-11e9-9599-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2e162eb-d55f-11e9-9599-12813bfff9fa;
 Thu, 12 Sep 2019 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568294343;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zQWG/Qw3s55TkRZd93Vy6uH3ZShZIhevlR6/fDK6wds=;
 b=QPsm1C89d4TM/iW0/ZGmKjyYdFqTtGOanqsYMNX9fuJKMeE1LaKuNVw/
 xq0eHO2qUkykn52cEADFGw23DP97/aVFb6zfJKJcYdIm2lsU5Yp47GKRJ
 Nx1aGdypqrdwNcnIn8uAN4T2mkrtnR8IL5JNJN2Y9jvmTsauA21fSHuzJ U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 53ZvDpgho3ypxzNHrWL/mSbECnaVS4fASEtgf1O8jW0B8IuaxNlfEONT6Wd0p5yNKQG+YlgaXf
 rTYdwtKramgb+OEOtS/oRglRK5cxVh56e4W9LmoL09L1ujCRHAbsdx46WKQNmFsc7dvnCTwqoK
 OccpEcNP8tY7nzdBlLovLcUtHAjuaeJ+SN6eO10QCeN2rbM0XOwH3q9SNthgQ+QNsKMjLYawQw
 tzb1rSRV2gSMSIM7lX7TqrXvD8t0W6KExx38Y/dfanr7tZ1EIh42tv1F5C3Ax2OFAL7XVjkru1
 ie0=
X-SBRS: 2.7
X-MesageID: 5725684
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5725684"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v9 3/6] sysctl / libxl: report whether IOMMU/HAP page
 table sharing is supported
Thread-Index: AQHVaVu2GSc9488Xt0+NIqHKq1T8zacn4PqAgAAkKHA=
Date: Thu, 12 Sep 2019 13:18:45 +0000
Message-ID: <db42dfe903484b948cd82ad5d2a46844@AMSPEX02CL03.citrite.net>
References: <20190912111744.40410-1-paul.durrant@citrix.com>
 <20190912111744.40410-4-paul.durrant@citrix.com>
 <7cd00313-8d28-708b-23b1-4f6b0ff89cdf@suse.com>
In-Reply-To: <7cd00313-8d28-708b-23b1-4f6b0ff89cdf@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v9 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, DavidScott <dave@recoil.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien
 Grall <julien.grall@arm.com>, Christian Lindig <christian.lindig@citrix.com>,
 Ian
 Jackson <Ian.Jackson@citrix.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDEyIFNlcHRlbWJlciAyMDE5IDE0OjA0DQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5k
cmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUGVyYXJk
IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgQ2hyaXN0aWFuIExpbmRpZw0KPiA8Y2hyaXN0
aWFuLmxpbmRpZ0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRy
aXguY29tPjsgSWFuIEphY2tzb24NCj4gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdp
bGsNCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBEYXZpZFNjb3R0IDxkYXZlQHJlY29pbC5v
cmc+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjkgMy82XSBzeXNjdGwgLyBsaWJ4bDogcmVwb3J0IHdo
ZXRoZXIgSU9NTVUvSEFQIHBhZ2UgdGFibGUgc2hhcmluZyBpcyBzdXBwb3J0ZWQNCj4gDQo+IE9u
IDEyLjA5LjIwMTkgMTM6MTcsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJj
aC9hcm0vc3lzY3RsLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vc3lzY3RsLmMNCj4gPiBAQCAt
MTUsNiArMTUsOSBAQA0KPiA+ICB2b2lkIGFyY2hfZG9fcGh5c2luZm8oc3RydWN0IHhlbl9zeXNj
dGxfcGh5c2luZm8gKnBpKQ0KPiA+ICB7DQo+ID4gICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhF
Tl9TWVNDVExfUEhZU0NBUF9odm0gfCBYRU5fU1lTQ1RMX1BIWVNDQVBfaGFwOw0KPiA+ICsNCj4g
PiArICAgIGlmICggaW9tbXVfZW5hYmxlZCAmJiBpb21tdV9oYXBfcHRfc2hhcmUgKQ0KPiA+ICsg
ICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2lvbW11X2hhcF9w
dF9zaGFyZTsNCj4gPiAgfQ0KPiANCj4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBkb25lIGluIGNv
bW1vbiBjb2RlLg0KPiANCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvc3lzY3RsLmMNCj4gPiArKysg
Yi94ZW4vYXJjaC94ODYvc3lzY3RsLmMNCj4gPiBAQCAtMTY0LDcgKzE2NCwxMiBAQCB2b2lkIGFy
Y2hfZG9fcGh5c2luZm8oc3RydWN0IHhlbl9zeXNjdGxfcGh5c2luZm8gKnBpKQ0KPiA+ICAgICAg
aWYgKCBJU19FTkFCTEVEKENPTkZJR19QVikgKQ0KPiA+ICAgICAgICAgIHBpLT5jYXBhYmlsaXRp
ZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX3B2Ow0KPiA+ICAgICAgaWYgKCBodm1faGFwX3N1cHBv
cnRlZCgpICkNCj4gPiArICAgIHsNCj4gPiAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhF
Tl9TWVNDVExfUEhZU0NBUF9oYXA7DQo+ID4gKw0KPiA+ICsgICAgICAgIGlmICggaW9tbXVfZW5h
YmxlZCAmJiBpb21tdV9oYXBfcHRfc2hhcmUgKQ0KPiA+ICsgICAgICAgICAgICBwaS0+Y2FwYWJp
bGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBfcHRfc2hhcmU7DQo+ID4gKyAg
ICB9DQo+ID4gIH0NCj4gDQo+IEFuZCBpZiBpdCdzIGltcG9ydGFudCB0byBub3QgaGF2ZSB0aGUg
Yml0IHNldCB3aGVuICFodm1faGFwX3N1cHBvcnRlZCgpLA0KDQouLi5hbmQgdGhhdCdzIHdoYXQg
aXTigJlzIG5vdCBpbiBjb21tb24gY29kZS4uLiB0aGVyZSBpcyBubyBodm1faGFwX3N1cHBvcnRl
ZCgpIGZvciBBcm0NCg0KPiB0aGVuIGlvbW11X2hhcF9wdF9zaGFyZSBzaG91bGQgYmUgY2xlYXJl
ZCBpbiBfX2luaXQgY29kZSBpbiB0aGlzIGNhc2UuDQoNClRoYXQgd291bGQgaGF2ZSBiZWVuIGFu
IGFsdGVybmF0aXZlIGFwcHJvYWNoIGlmIHlvdSdkIG5vdCB3YW50ZWQgaXQgI2RlZmluZWQgaW4g
cGF0Y2ggIzUuIChZZXMgaXQncyBhIGxhdGVyIHBhdGNoIGluIHRoZSBzZXJpZXMsIGJ1dCB0aGlz
IG9uZSBpcyBsYXRlciBjaHJvbm9sb2dpY2FsbHkgYW5kIEkgZGlkbid0IHdhbnQgdG8gaW52YWxp
ZGF0ZSB0aGUgb3RoZXIgcGF0Y2guKQ0KSSBjb3VsZCBwZXJoYXBzIGltcGxlbWVudCBodm1faGFw
X3N1cHBvcnRlZCgpIGZvciBBcm0/DQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

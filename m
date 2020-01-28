Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE514BE8E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:29:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUcZ-0005WF-6s; Tue, 28 Jan 2020 17:25:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g73u=3R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwUcX-0005WA-92
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:25:49 +0000
X-Inumbo-ID: 38fd847e-41f3-11ea-8747-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38fd847e-41f3-11ea-8747-12813bfff9fa;
 Tue, 28 Jan 2020 17:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580232349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WQ/KbLQjmb3BZYyokkq72H6uG3LC3d3Nb+t20Sf18f0=;
 b=VmxaWI/dhljkxzR5iSwW1QVf4buYlmrHjeVBTGJ7RtVUfn+uGefgN16I
 kP97QpobsnpC6RGdWj0vs9H036t3ifYXNyjKk/6EWiBCrNeaYtebx154P
 Hq7d52QMfVKuyiFCIYmOye2UxqczbCOu/ZctbRObMZNTuuKa7aVdvX3xF o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: e1mL17gxmP5rUAiUfNS5w/Ko8TuOz60rgCv2d1dm1aJLOGDEU3qFXw5hKofKYQfNjyjQ5hPDcu
 mcwBg/wVGlofmuHJkA4Kc05PNlft3suWH5f9InDQurPvgix3DCTh9esrp8PYspkmxArSg3CBqP
 Mk2kp1CjnHHZM49XAy7ZuxJnz2CCIQQnWrpfcJeqGqh39pSuXkfUuZPP80ByfO7X+ag5HujEHY
 9dBUB0DI4GBHOXuaRp8UaK3RN00Q14jMkTCagWzcv5mQgGhOWjsZMWd5m1iOAtKSjgfUnJnwrk
 6JU=
X-SBRS: 2.7
X-MesageID: 11741800
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,374,1574139600"; d="scan'208";a="11741800"
Date: Tue, 28 Jan 2020 18:25:21 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200128172521.GS57924@desktop-tdan49n.eng.citrite.net>
References: <93b4ae81-6bfb-f7bd-06be-62032fd9a445@suse.com>
 <20200128145422.GP57924@desktop-tdan49n.eng.citrite.net>
 <682a8462-ded7-3f73-d8fe-ffa42738a61e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <682a8462-ded7-3f73-d8fe-ffa42738a61e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
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
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDQ6NDk6MDlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDEuMjAyMCAxNTo1NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgSmFuIDI4LCAyMDIwIGF0IDAyOjE2OjUzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IERvbWFpbiBjcmVhdGlvbiBmYWlsdXJlIHBhdGhzIGRvbid0IGNhbGwgZG9tYWluX3Jl
bGlucXVpc2hfcmVzb3VyY2VzKCksCj4gPj4geWV0IGFsbG9jYXRpb25zIGFuZCBhbGlrZSBkb25l
IGZyb20gaHZtX2RvbWFpbl9pbml0aWFsaXplKCkgbmVlZCB0byBiZQo+ID4+IHVuZG9uZSBuZXZl
cnRoZWxlc3MuIENhbGwgdGhlIGZ1bmN0aW9uIGFsc28gZnJvbSBodm1fZG9tYWluX2Rlc3Ryb3ko
KSwKPiA+PiBhZnRlciBtYWtpbmcgc3VyZSBhbGwgZGVzY2VuZGFudHMgYXJlIGlkZW1wb3RlbnQu
Cj4gPj4KPiA+PiBOb3RlIHRoYXQgd2hpbGUgdmlyaWRpYW5fe2RvbWFpbix2Y3B1fV9kZWluaXQo
KSB3ZXJlIGFscmVhZHkgdXNlZCBpbgo+ID4+IHdheXMgc3VnZ2VzdGluZyB0aGV5J3JlIGlkZW1w
b3RlbnQsIHZpcmlkaWFuX3RpbWVfdmNwdV9kZWluaXQoKSBhY3R1YWxseQo+ID4+IHdhc24ndDog
T25lIGNhbid0IGtpbGwgYSB0aW1lciB0aGF0IHdhcyBuZXZlciBpbml0aWFsaXplZC4KPiA+Pgo+
ID4+IEZvciBodm1fZGVzdHJveV9hbGxfaW9yZXFfc2VydmVycygpJ3MgcHVycG9zZXMgbWFrZQo+
ID4+IHJlbG9jYXRlX3BvcnRpb19oYW5kbGVyKCkgcmV0dXJuIHdoZXRoZXIgdGhlIHRvIGJlIHJl
bG9jYXRlZCBwb3J0IHJhbmdlCj4gPj4gd2FzIGFjdHVhbGx5IGZvdW5kLiBUaGlzIHNlZW1zIGNo
ZWFwZXIgdGhhbiBpbnRyb2R1Y2luZyBhIGZsYWcgaW50bwo+ID4+IHN0cnVjdCBodm1fZG9tYWlu
J3MgaW9yZXFfc2VydmVyIHN1Yi1zdHJ1Y3R1cmUuCj4gPj4KPiA+PiBJbiBodm1fZG9tYWluX2lu
aXRpYWxpc2UoKSBhZGRpdGlvbmFsbHkKPiA+PiAtIHVzZSBYRlJFRSgpIGFsc28gdG8gcmVwbGFj
ZSBhZGphY2VudCB4ZnJlZSgpLAo+ID4+IC0gdXNlIGh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNv
dXJjZXMoKSBhcyBiZWluZyBpZGVtcG90ZW50IG5vdy4KPiA+Pgo+ID4+IEZpeGVzOiBlN2E5YjVl
NzJmMjYgKCJ2aXJpZGlhbjogc2VwYXJhdGVseSBhbGxvY2F0ZSBkb21haW4gYW5kIHZjcHUgc3Ry
dWN0dXJlcyIpCj4gPj4gRml4ZXM6IDI2ZmJhM2M4NTU3MSAoInZpcmlkaWFuOiBhZGQgaW1wbGVt
ZW50YXRpb24gb2Ygc3ludGhldGljIHRpbWVycyIpCj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+Cj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9ocGV0LmMKPiA+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2hwZXQuYwo+ID4+IEBAIC03NTEs
NyArNzUxLDcgQEAgdm9pZCBocGV0X2RlaW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+ID4+ICAgICAg
aW50IGk7Cj4gPj4gICAgICBIUEVUU3RhdGUgKmggPSBkb21haW5fdmhwZXQoZCk7Cj4gPj4gIAo+
ID4+IC0gICAgaWYgKCAhaGFzX3ZocGV0KGQpICkKPiA+PiArICAgIGlmICggIWhhc192aHBldChk
KSB8fCAhZC0+YXJjaC5odm0ucGxfdGltZSB8fCAhaC0+c3RpbWVfZnJlcSApCj4gPj4gICAgICAg
ICAgcmV0dXJuOwo+ID4+ICAKPiA+PiAgICAgIHdyaXRlX2xvY2soJmgtPmxvY2spOwo+ID4+IEBA
IC03NjMsNiArNzYzLDggQEAgdm9pZCBocGV0X2RlaW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+ID4+
ICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgSFBFVF9USU1FUl9OVU07IGkrKyApCj4gPj4gICAg
ICAgICAgICAgIGlmICggdGltZXJfZW5hYmxlZChoLCBpKSApCj4gPj4gICAgICAgICAgICAgICAg
ICBocGV0X3N0b3BfdGltZXIoaCwgaSwgZ3Vlc3RfdGltZSk7Cj4gPj4gKwo+ID4+ICsgICAgICAg
IGgtPmhwZXQuY29uZmlnID0gMDsKPiA+PiAgICAgIH0KPiA+PiAgCj4gPj4gICAgICB3cml0ZV91
bmxvY2soJmgtPmxvY2spOwo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiA+PiAr
KysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gPj4gQEAgLTY5NiwyNCArNjk2LDI0IEBAIGlu
dCBodm1fZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbgo+ID4+ICAgICAgcmV0dXJuIDA7
Cj4gPj4gIAo+ID4+ICAgZmFpbDI6Cj4gPj4gLSAgICBydGNfZGVpbml0KGQpOwo+ID4+ICAgICAg
c3RkdmdhX2RlaW5pdChkKTsKPiA+PiAgICAgIHZpb2FwaWNfZGVpbml0KGQpOwo+ID4+ICAgZmFp
bDE6Cj4gPj4gICAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApCj4gPj4gICAgICAgICAg
eGZyZWUoZC0+YXJjaC5odm0uaW9fYml0bWFwKTsKPiA+PiAtICAgIHhmcmVlKGQtPmFyY2guaHZt
LmlvX2hhbmRsZXIpOwo+ID4+IC0gICAgeGZyZWUoZC0+YXJjaC5odm0ucGFyYW1zKTsKPiA+PiAt
ICAgIHhmcmVlKGQtPmFyY2guaHZtLnBsX3RpbWUpOwo+ID4+IC0gICAgeGZyZWUoZC0+YXJjaC5o
dm0uaXJxKTsKPiA+PiArICAgIFhGUkVFKGQtPmFyY2guaHZtLmlvX2hhbmRsZXIpOwo+ID4+ICsg
ICAgWEZSRUUoZC0+YXJjaC5odm0ucGFyYW1zKTsKPiA+PiArICAgIFhGUkVFKGQtPmFyY2guaHZt
LnBsX3RpbWUpOwo+ID4+ICsgICAgWEZSRUUoZC0+YXJjaC5odm0uaXJxKTsKPiA+PiAgIGZhaWww
Ogo+ID4+ICAgICAgaHZtX2Rlc3Ryb3lfY2FjaGVhdHRyX3JlZ2lvbl9saXN0KGQpOwo+ID4+ICAg
ICAgZGVzdHJveV9wZXJkb21haW5fbWFwcGluZyhkLCBQRVJET01BSU5fVklSVF9TVEFSVCwgMCk7
Cj4gPj4gICBmYWlsOgo+ID4+IC0gICAgdmlyaWRpYW5fZG9tYWluX2RlaW5pdChkKTsKPiA+PiAr
ICAgIGh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoZCk7Cj4gPiAKPiA+IFdvdWxkIGJl
IG5pY2UgdG8gdW5pZnkgYWxsIHRob3NlIGxhYmVscyBpbnRvIGEgc2luZ2xlIGZhaWwgbGFiZWws
IGJ1dAo+ID4gSSdtIG5vdCBzdXJlIGlmIGFsbCBmdW5jdGlvbnMgYXJlIHByZXBhcmVkIHRvIGhh
bmRsZSB0aGlzLgo+IAo+IFRoYXQncyB0aGUgbWlkLSB0byBsb25nLXRlcm0gcGxhbiwgeWVzLiBC
dXQgaXQgaGFzIHRha2VuIG1lIHF1aXRlIGEKPiBiaXQgbW9yZSB0aW1lIHRoYW4gaW50ZW5kZWQg
dG8gYXQgbGVhc3Qgc29ydCBvdXQgdGhpcyBwYXJ0LiBJIHJlYWxseQo+IGRvbid0IHdhbnQgdG8g
ZXh0ZW5kIHRoaXMgcmlnaHQgbm93IChhbmQgZXZlbiBsZXNzIHNvIGluIHRoaXMgcGF0Y2gpLgo+
IAo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+ID4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vaW9yZXEuYwo+ID4+IEBAIC0xMjI4LDYgKzEyMjgsOSBAQCB2b2lkIGh2bV9kZXN0
cm95X2FsbF9pb3JlcV9zZXJ2ZXJzKHN0cnVjCj4gPj4gICAgICBzdHJ1Y3QgaHZtX2lvcmVxX3Nl
cnZlciAqczsKPiA+PiAgICAgIHVuc2lnbmVkIGludCBpZDsKPiA+PiAgCj4gPj4gKyAgICBpZiAo
ICFyZWxvY2F0ZV9wb3J0aW9faGFuZGxlcihkLCAweGNmOCwgMHhjZjgsIDQpICkKPiA+PiArICAg
ICAgICByZXR1cm47Cj4gPiAKPiA+IENvdWxkIHlvdSBhZGQgYSBub3RlIGhlcmUgdGhhdCB0aGUg
J3JlbG9jYXRpb24nIGlzIGp1c3QgdXNlZCBhcyBhIG1lYW4KPiA+IHRvIGZpZ3VyZSBvdXQgaWYg
aW9vcmVxIHNlcnZlcnMgaGF2ZSBiZWVuIHNldHVwIChpZTogdGhlIGxvY2sgaGFzIGJlZW4KPiA+
IGluaXRpYWxpemVkKT8KPiAKPiBIbW0sIEknbSBleHBsYWluaW5nIHRoaXMgaW4gdGhlIGRlc2Ny
aXB0aW9uLCBhbmQgdHdpY2UgdGhlIHNhbWUKPiBudW1iZXIgSSB0aG91Z2h0IHdvdWxkIG1ha2Ug
dGhlIHB1cnBvc2Ugc3VmZmljaWVudGx5IGNsZWFyCj4gKGFueW9uZSB3aG8gc3RpbGwgd29uZGVy
cyBjb3VsZCBzdGlsbCBnbyBiYWNrIHRvIHRoZSBjb21taXQpLgo+IAo+ID4gSSBmaW5kIHRoaXMg
a2luZCBvZiBkaXJ0eSwgYW5kIHdvdWxkIG5lZWQgcmV3b3JrIGlmIG90aGVyIGFyY2hlcyBnYWlu
Cj4gPiBpb3JlcSBzdXBwb3J0Lgo+IAo+IFRoaXMgaXMgeDg2IGNvZGUgLSBob3cgYXJlIG90aGVy
IGFyY2hlcyBnb2luZyB0byBiZSBhZmZlY3RlZD8KPiBFdmVuIGlmIHRoZXkgZ2FpbiBpb3JlcSBz
ZXJ2ZXIgc3VwcG9ydCwgdGhlIG5vdGlvbiBvZiBwb3J0IEkvTwo+IGluIGdlbmVyYWwgd2lsbCBy
ZW1haW4gYW4geDg2IHNwZWNpZmljLgo+IAo+IEkgYWdyZWUgaXQncyBhIGxpdHRsZSBkaXJ0eSwg
YnV0IEkgY29uc2lkZXIgaXQgYmV0dGVyIHRoYW4KPiBwdXR0aW5nIGluIGFub3RoZXIgYm9vbCAo
YW5kIHByb2JhYmx5IDcgYnl0ZXMgb2YgcGFkZGluZykgaW50bwo+IHN0cnVjdCBodm1fZG9tYWlu
LgoKQWNrLCBJIGd1ZXNzIGl0IHdvdWxkIGJlY29tZSBjbGVhciBlbm91Z2ggZm9yIHJlYWRlcnMg
d2hlbiBzZWVpbmcgdGhlCmluaXQgZnVuY3Rpb24uCgo+IAo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vcnRjLmMKPiA+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3J0Yy5jCj4gPj4gQEAgLTg0
NCw3ICs4NDQsOCBAQCB2b2lkIHJ0Y19kZWluaXQoc3RydWN0IGRvbWFpbiAqZCkKPiA+PiAgewo+
ID4+ICAgICAgUlRDU3RhdGUgKnMgPSBkb21haW5fdnJ0YyhkKTsKPiA+PiAgCj4gPj4gLSAgICBp
ZiAoICFoYXNfdnJ0YyhkKSApCj4gPj4gKyAgICBpZiAoICFoYXNfdnJ0YyhkKSB8fCAhZC0+YXJj
aC5odm0ucGxfdGltZSB8fAo+ID4+ICsgICAgICAgICBzLT51cGRhdGVfdGltZXIuc3RhdHVzID09
IFRJTUVSX1NUQVRVU19pbnZhbGlkICkKPiA+IAo+ID4gWW91IGNvdWxkIGFsc28gY2hlY2sgZm9y
IHRoZSBwb3J0IHJlZ2lzdHJhdGlvbiBBRkFJQ1QsIHdoaWNoIGlzIG1heWJlCj4gPiBtb3JlIG9i
dmlvdXM/Cj4gCj4gWW91IGNhbGxlZCB0aGF0IGFwcHJvYWNoIGRpcnR5IGFib3ZlIC0gSSdkIGxp
a2UgdG8gcmVzdHJpY3QgaXQKPiB0byBqdXN0IHdoZXJlIG5vIGJldHRlciBhbHRlcm5hdGl2ZSBl
eGlzdHMuCgpBY2ssIGl0IGRpZG4ndCBzZWVtIHRoYXQgYmFkIGhlcmUgYmVjYXVzZSB0aGlzIGlz
IGEgeDg2IGVtdWxhdGVkCmRldmljZSB0aGF0IHJlbGllcyBvbiBJTyBwb3J0cywgd2hpbGUgdGhl
IGlvcmVxIGNvZGUgKGFsYmVpdCB4ODYKc3BlY2lmaWMgQVRNKSBjb3VsZCBiZSB1c2VkIGJ5IG90
aGVyIGFyY2hlcywgYW5kIGhlbmNlIHdvdWxkIGxpa2VseQpwcmVmZXIgdG8gYXZvaWQgdXNpbmcg
eDg2IHNwZWNpZmljIGRldGFpbHMgZm9yIGdlbmVyaWMgZnVuY3Rpb25zLCBsaWtlCnRoZSBpbml0
IG9yIGRlaW5pdCBvbmVzLgoKPiA+IEkgYWxzbyB3b25kZXIgd2hldGhlciBhbGwgdGhvc2UgdGlt
ZS1yZWxhdGVkIGVtdWxhdGlvbnMgY291bGQgYmUKPiA+IGdyb3VwZWQgaW50byBhIHNpbmdsZSBo
ZWxwZXIsIHRoYXQgY291bGQgaGF2ZSBhIGQtPmFyY2guaHZtLnBsX3RpbWUKPiA+IGluc3RlYWQg
b2YgaGF2aW5nIHRvIHNwcmlua2xlIHN1Y2ggY2hlY2tzIGZvciBlYWNoIGRldmljZT8KPiAKPiBR
dWl0ZSBwb3NzaWJsZSwgYnV0IG5vdCBoZXJlIGFuZCBub3Qgbm93LgoKU3VyZS4KClJldmlld2Vk
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

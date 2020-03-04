Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EFA178E15
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 11:12:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Qy8-0004GV-H1; Wed, 04 Mar 2020 10:09:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Mvz=4V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9Qy7-0004GQ-EC
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 10:09:35 +0000
X-Inumbo-ID: 3f0c82e2-5e00-11ea-b74d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f0c82e2-5e00-11ea-b74d-bc764e2007e4;
 Wed, 04 Mar 2020 10:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583316574;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rcCgRFGO+zvyVx5/NR2VqvbcIspw74oudzc4x9+84Nk=;
 b=AARbKhGYS+HI4pcvSS4pM+zB1LpdXyQBi6he+w+/lzuUmogv/POSe9IQ
 FQkOD8pEYzJPZcrgMZFk4Sh5ije4XkUisdj4ejqTl/blOEj3G04vLmaAK
 OzzR+POW+4vL0wArmSdg4qxCpJWl926xYXd6HJifVyt2y/4lV//J1Gzin 0=;
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
IronPort-SDR: A1VoKXzEoxOpygqbKUK1n3czTz2EeGmeYt3934Rj6FRKlsVwyE3efYerR3g0MhrriRn42ztsLm
 guODjMWuCPkbOkuZdyi/1pXk+t585yPcE049/8Md2wy//XmORkra/LdXi7DoFnEzSwXyrRLSYe
 RGrSybISCbyK34dRxLMU1YaD91ikipyohMVkQYmMo3JA23ycUN00myY8LrW66PpKoEukrmZ9NN
 s0b/YnJCHUvsNUoz0VceRxTcKkRepn1BerVeMjlSbqx7K9kULxRXO7PtHyZbujJ35GsereWNvh
 L80=
X-SBRS: 2.7
X-MesageID: 13568449
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,513,1574139600"; d="scan'208";a="13568449"
Date: Wed, 4 Mar 2020 11:09:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200304100926.GR24458@Air-de-Roger.citrite.net>
References: <20200303115253.47449-1-roger.pau@citrix.com>
 <9cc580b5-f7e1-16d1-02f8-f847d10f70dc@suse.com>
 <20200304095341.GQ24458@Air-de-Roger.citrite.net>
 <e2397893-01fc-78a2-6cd3-3b8dcd74cdff@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2397893-01fc-78a2-6cd3-3b8dcd74cdff@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/dom0: improve PVH initrd and
 metadata placement
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMTE6MDA6MThBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMDMuMjAyMCAxMDo1MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgTWFyIDAzLCAyMDIwIGF0IDA0OjQwOjM2UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDAzLjAzLjIwMjAgMTI6NTIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPiA+Pj4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS9kb20wX2J1aWxkLmMKPiA+Pj4gQEAgLTQ5MCw2ICs0OTAsNDUgQEAgc3RhdGljIGlu
dCBfX2luaXQgcHZoX3BvcHVsYXRlX3AybShzdHJ1Y3QgZG9tYWluICpkKQo+ID4+PiAgI3VuZGVm
IE1CMV9QQUdFUwo+ID4+PiAgfQo+ID4+PiAgCj4gPj4+ICtzdGF0aWMgcGFkZHJfdCBmaW5kX21l
bW9yeShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgZWxmX2JpbmFyeSAqZWxm
LAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IHNpemUpCj4gPj4+ICt7
Cj4gPj4+ICsgICAgcGFkZHJfdCBrZXJuZWxfc3RhcnQgPSAocGFkZHJfdCllbGYtPmRlc3RfYmFz
ZTsKPiA+Pj4gKyAgICBwYWRkcl90IGtlcm5lbF9lbmQgPSAocGFkZHJfdCkoZWxmLT5kZXN0X2Jh
c2UgKyBlbGYtPmRlc3Rfc2l6ZSk7Cj4gPj4+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4gPj4+ICsK
PiA+Pj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IGQtPmFyY2gubnJfZTgyMDsgaSsrICkKPiA+Pj4g
KyAgICB7Cj4gPj4+ICsgICAgICAgIHBhZGRyX3Qgc3RhcnQsIGVuZCA9IGQtPmFyY2guZTgyMFtp
XS5hZGRyICsgZC0+YXJjaC5lODIwW2ldLnNpemU7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgICAgLyog
RG9uJ3QgdXNlIG1lbW9yeSBiZWxvdyAxTUIsIGFzIGl0IGNvdWxkIG92ZXJ3cml0ZSB0aGUgQkRB
L0VCREEuICovCj4gPj4+ICsgICAgICAgIGlmICggZW5kIDw9IE1CKDEpIHx8IGQtPmFyY2guZTgy
MFtpXS50eXBlICE9IEU4MjBfUkFNICkKPiA+Pj4gKyAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4+
PiArCj4gPj4+ICsgICAgICAgIHN0YXJ0ID0gTUFYKFJPVU5EVVAoZC0+YXJjaC5lODIwW2ldLmFk
ZHIsIFBBR0VfU0laRSksIE1CKDEpKTsKPiA+Pj4gKwo+ID4+PiArICAgICAgICBpZiAoIGVuZCA8
PSBrZXJuZWxfc3RhcnQgfHwgc3RhcnQgPj0ga2VybmVsX2VuZCApCj4gPj4+ICsgICAgICAgICAg
ICA7IC8qIE5vIG92ZXJsYXAsIG5vdGhpbmcgdG8gZG8uICovCj4gPj4+ICsgICAgICAgIC8qIERl
YWwgd2l0aCB0aGUga2VybmVsIGFscmVhZHkgYmVpbmcgbG9hZGVkIGluIHRoZSByZWdpb24uICov
Cj4gPj4+ICsgICAgICAgIGVsc2UgaWYgKCBrZXJuZWxfc3RhcnQgPD0gc3RhcnQgJiYga2VybmVs
X2VuZCA+IHN0YXJ0ICkKPiA+Pgo+ID4+IFNpbmNlLCBhY2NvcmRpbmcgdG8geW91ciByZXBseSBv
biB2MSwgW2tlcm5lbF9zdGFydCxrZXJuZWxfZW5kKSBpcwo+ID4+IGEgc3Vic2V0IG9mIFtzdGFy
dCxlbmQpLCBJIHVuZGVyc3RhbmQgdGhhdCB0aGUgPD0gY291bGQgZXF1YWxseQo+ID4+IHdlbGwg
YmUgPT0gLSBkbyB5b3UgYWdyZWU/IEZyb20gdGhpcyB0aGVuIC4uLgo+ID4+Cj4gPj4+ICsgICAg
ICAgICAgICAvKiBUcnVuY2F0ZSB0aGUgc3RhcnQgb2YgdGhlIHJlZ2lvbi4gKi8KPiA+Pj4gKyAg
ICAgICAgICAgIHN0YXJ0ID0gUk9VTkRVUChrZXJuZWxfZW5kLCBQQUdFX1NJWkUpOwo+ID4+PiAr
ICAgICAgICBlbHNlIGlmICgga2VybmVsX3N0YXJ0IDw9IGVuZCAmJiBrZXJuZWxfZW5kID4gZW5k
ICkKPiA+Pgo+ID4+IC4uLiBpdCBmb2xsb3dzIHRoYXQgeW91IG5vdyBoYXZlIHR3byBvZmYtYnkt
MXMgaGVyZSwgYXMgeW91IGNoYW5nZWQKPiA+PiB0aGUgcmlnaHQgc2lkZSBvZiB0aGUgJiYgaW5z
dGVhZCBvZiB0aGUgbGVmdCBvbmUgKHRoZSByaWdodCBzaWRlCj4gPj4gY291bGQsIGFzIHBlciBh
Ym92ZSwgdXNlID09IGFnYWluKS4gVXNpbmcgPT0gaW4gYm90aCBwbGFjZXMgd291bGQsCj4gPj4g
aW4gbGlldSBvZiBhIGNvbW1lbnQsIGltbyBtYWtlIG1vcmUgdmlzaWJsZSB0byB0aGUgcmVhZGVy
IHRoYXQKPiA+PiB0aGVyZSBpcyB0aGlzIHN1Yi1yYW5nZSByZWxhdGlvbnNoaXAgYmV0d2VlbiBi
b3RoIHJhbmdlcy4KPiA+IAo+ID4gUmlnaHQsIEkgYWdyZWUgdG8gYm90aCB0aGUgYWJvdmUgYW5k
IGhhdmUgYWRqdXN0ZWQgdGhlIGNvbmRpdGlvbnMuCj4gPiAKPiA+Pj4gKyAgICAgICAgICAgIC8q
IFRydW5jYXRlIHRoZSBlbmQgb2YgdGhlIHJlZ2lvbi4gKi8KPiA+Pj4gKyAgICAgICAgICAgIGVu
ZCA9IGtlcm5lbF9zdGFydDsKPiA+Pj4gKyAgICAgICAgLyogUGljayB0aGUgYmlnZ2VzdCBvZiB0
aGUgc3BsaXQgcmVnaW9ucy4gKi8KPiA+Pgo+ID4+IFRoZW4gYWdhaW4gLSB3b3VsZG4ndCB0aGlz
IHBhcnQgc3VmZmljZT8gaWYgc3RhcnQgPT0ga2VybmVsX3N0YXJ0Cj4gPj4gb3IgZW5kID09IGtl
cm5lbF9lbmQsIG9uZSBzaWRlIG9mIHRoZSAic3BsaXQiIHJlZ2lvbiB3b3VsZCBzaW1wbHkKPiA+
PiBiZSBlbXB0eS4KPiA+IAo+ID4gVGhhdCdzIHdoeSBpdCdzIHVzaW5nIGFuIGVsc2UgaWYgY29u
c3RydWN0LCBzbyB0aGF0IHdlIG9ubHkgZ2V0Cj4gPiBoZXJlIGlmIHRoZSBrZXJuZWwgaXMgbG9h
ZGVkIGluIHRoZSBtaWRkbGUgb2YgdGhlIHJlZ2lvbiwgYW5kIHRoZXJlCj4gPiBhcmUgdHdvIHJl
Z2lvbnMgbGVmdCBhcyBwYXJ0IG9mIHRoZSBzcGxpdC4KPiAKPiBCdXQgbXkgcXVlc3Rpb24gaXMg
LSBkbyB3ZSByZWFsbHkgbmVlZCB0aGUgZWFybGllciBwYXJ0cyBvZgo+IHRoaXMgaWYvZWxzZS1p
ZiBjaGFpbj8gV29uJ3QgdGhpcyBsYXR0ZXIgcGFydCBkZWFsIGZpbmQgd2l0aAo+IHplcm8tc2l6
ZWQgcmFuZ2VzIGF0IGhlYWQgb3IgdGFpbCBvZiB0aGUgcmVnaW9uPwoKT2gsIEkgbWlzcmVhZCB5
b3VyIHJlcGx5IHNvcnJ5LiBZZXMgeW91IGFyZSByaWdodCwgSSBjYW4gYWNoaWV2ZSB0aGUKc2Ft
ZSBqdXN0IHdpdGggdGhpcyBsYXN0IHBhcnQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

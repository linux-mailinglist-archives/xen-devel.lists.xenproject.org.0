Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DA2178EE3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 11:51:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9RaS-0008VM-R2; Wed, 04 Mar 2020 10:49:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Mvz=4V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9RaR-0008VH-ME
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 10:49:11 +0000
X-Inumbo-ID: c78e4e66-5e05-11ea-a386-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c78e4e66-5e05-11ea-a386-12813bfff9fa;
 Wed, 04 Mar 2020 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583318950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9MittYWxEG8QmXStVYLvt1hq3eujrEqfk24O0NCHjbE=;
 b=HfPYwOTgynj0UIQcYeJ5M0djf/A1pHLou1F8ay/Dsoa3RX3sQCf5fhRV
 3jDIvCWrCgT3nTG7jAjB/+XegovU++eq8FIxt0B/Xq0FfJbTNjlgo01zW
 2SunuEC0Glo4EuEUv0gBEaPfDq+JENCEQjpjcboA8Y1VF7KIcG4CvQgJN g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pNzEtvB9x1HRRNbc9pfSzAH7z0z4aMvqhiAKCM9NoaXeG/zI3yZmkLoS0dPHojsX3kEZ81WHeO
 XuIgFw/qXcUyt6wweY1XBzaHRkNmnR7A0baRf7Mul1GoVtQ78VJKI6igk5oe49q1vCYPelqQGM
 l4cW+Wo1vV5OXK/C0UI1/6w/ffhpCcG+jsQP3QehleFRuiSSiisg1zRNIkQTGLNDClYkbE8cc2
 Z8LJfEm3n1Jk0hN+TSBOTNzUY+FSGByMOHUjhw6K6z6LdaL1eyrLOdJXFxTxnm6B7vWimw/0XS
 6uE=
X-SBRS: 2.7
X-MesageID: 13815371
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,513,1574139600"; d="scan'208";a="13815371"
Date: Wed, 4 Mar 2020 11:49:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200304104903.GT24458@Air-de-Roger.citrite.net>
References: <20200303115253.47449-1-roger.pau@citrix.com>
 <a85ca6e1-f02b-0576-3b59-e331da2607cd@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a85ca6e1-f02b-0576-3b59-e331da2607cd@citrix.com>
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
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMDY6NDc6MzVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwMy8wMy8yMDIwIDExOjUyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBE
b24ndCBhc3N1bWUgdGhlcmUncyBnb2luZyB0byBiZSBlbm91Z2ggc3BhY2UgYXQgdGhlIHRhaWwg
b2YgdGhlCj4gPiBsb2FkZWQga2VybmVsIGFuZCBpbnN0ZWFkIHRyeSB0byBmaW5kIGEgc3VpdGFi
bGUgbWVtb3J5IGFyZWEgd2hlcmUgdGhlCj4gPiBpbml0cmQgYW5kIG1ldGFkYXRhIGNhbiBiZSBs
b2FkZWQuCj4gPgo+ID4gUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiAKPiBJIGNhbiBjb25maXJtIHRoYXQgdGhpcyBmaXhlcyB0aGUgImZh
aWxlZCB0byBib290IFBWSCIgb24gbXkgUm9tZSBzeXN0ZW0uCj4gCj4gVGVzdGVkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzIQoKPiBXZSd2ZSBz
dGlsbCBnb3QgdGhlIGV4Y2Vzc2l2ZS10aW1lLXRvLWNvbnN0cnVjdCBpc3N1ZXMgdG8gbG9vayBh
dCwgYnV0Cj4gdGhpcyBkZWZpbml0ZWx5IGJyaW5ncyB0aGluZ3MgdG8gYSBiZXR0ZXIgcG9zaXRp
b24uCgpXZWxsLCBQViBpcyBhbHdheXMgZ29pbmcgdG8gYmUgZmFzdGVyIHRvIGNvbnN0cnVjdCwg
c2luY2UgeW91IG9ubHkKbmVlZCB0byBhbGxvY2F0ZSBtZW1vcnkgYW5kIGNyZWF0ZSB0aGUgaW5p
dGlhbCBwYWdlIHRhYmxlcyB0aGF0IGNvdmVyCnRoZSBrZXJuZWwsIHRoZSBtZXRhZGF0YSBhbmQg
b3B0aW9uYWxseSB0aGUgaW5pdHJkIElJUkMuCgpPbiBQVkggd2UgbmVlZCB0byBwb3B1bGF0ZSB0
aGUgZnVsbCBwMm0sIHNvIEkgdGhpbmsgaXQncyBzYWZlIHRvIHNheQp0aGF0IFBWSCBidWlsZCB0
aW1lIGlzIGFsd2F5cyBnb2luZyB0byBiZSB3b3JzZSB0aGFuIFBWLiBUaGF0IGRvZXNuJ3QKbWVh
biB3ZSBjYW4ndCBtYWtlIGl0IGZhc3Rlci4KSSBoYXZlIHRvIApTaW5jZSBJIGFsc28gaGF2ZSBh
biBBTUQgYm94IHRoYXQgSSBjYW4gcGxheSB3aXRoLCBob3cgbXVjaCBtZW1vcnkgYXJlCnlvdSBh
c3NpZ25pbmcgdG8gZG9tMD8KCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9kb20w
X2J1aWxkLmMgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwo+ID4gaW5kZXggZWRlZDg3
ZWFmNS4uMzM1MjBlYzFiYyAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9i
dWlsZC5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwo+ID4gQEAgLTQ5
MCw2ICs0OTAsNDUgQEAgc3RhdGljIGludCBfX2luaXQgcHZoX3BvcHVsYXRlX3AybShzdHJ1Y3Qg
ZG9tYWluICpkKQo+ID4gICN1bmRlZiBNQjFfUEFHRVMKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGlj
IHBhZGRyX3QgZmluZF9tZW1vcnkoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0
IGVsZl9iaW5hcnkgKmVsZiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3Qg
c2l6ZSkKPiA+ICt7Cj4gPiArICAgIHBhZGRyX3Qga2VybmVsX3N0YXJ0ID0gKHBhZGRyX3QpZWxm
LT5kZXN0X2Jhc2U7Cj4gPiArICAgIHBhZGRyX3Qga2VybmVsX2VuZCA9IChwYWRkcl90KShlbGYt
PmRlc3RfYmFzZSArIGVsZi0+ZGVzdF9zaXplKTsKPiA+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4g
PiArCj4gPiArICAgIGZvciAoIGkgPSAwOyBpIDwgZC0+YXJjaC5ucl9lODIwOyBpKysgKQo+ID4g
KyAgICB7Cj4gPiArICAgICAgICBwYWRkcl90IHN0YXJ0LCBlbmQgPSBkLT5hcmNoLmU4MjBbaV0u
YWRkciArIGQtPmFyY2guZTgyMFtpXS5zaXplOwo+ID4gKwo+ID4gKyAgICAgICAgLyogRG9uJ3Qg
dXNlIG1lbW9yeSBiZWxvdyAxTUIsIGFzIGl0IGNvdWxkIG92ZXJ3cml0ZSB0aGUgQkRBL0VCREEu
ICovCj4gCj4gVGhlIEJEQSBpcyBpbiBtZm4gMCBzbyBpcyBzcGVjaWFsIGZvciBvdGhlciByZWFz
b25zKi7CoCBUaGUgRUJEQSBhbmQgSUJGVAo+IGFyZSB0aGUgcHJvYmxlbSBkYXRhc3RydWN0dXJl
cy4KClN1cmUuIFNvcnJ5IEkgaGF2ZW4ndCBhZGRlZCBpdCB0byB0aGUgY29tbWVudC4KCj4gfkFu
ZHJldwo+IAo+IFsqXSBUaGlua2luZyBhYm91dCBpdCwgaG93IHNob3VsZCBhIFBWSCBoYXJkd2Fy
ZSBkb21haW4gcmVjb25jaWxlIGl0cwo+IHBhcmF2aXJ0dWFsaXNlZCBib290IHdpdGggZmluZGlu
ZyBpdHNlbGYgb24gYSBCSU9TIG9yIEVGSSBzeXN0ZW0uLi4KCkkgZ3Vlc3MgdGhlIHNhbWUgYXBw
bGllcyB0byBQViB3aGljaCBhbHNvIGJvb3RzIHVzaW5nIGEgUFYgcGF0aCBidXQKaGFzIGFjY2Vz
cyB0byBmaXJtd2FyZS4KCkkgaGF2ZSB0byBhZG1pdCBJIG5ldmVyIGxvb2tlZCBjbG9zZWx5IGF0
IGhvdyBMaW51eCBkb2VzIHRoYXQsIGZvcgpGcmVlQlNEIGl0J3MgZmFpcmx5IGVhc3kgYmVjYXVz
ZSBhdCBsZWFzdCB3aGVuIGJvb3RpbmcgZnJvbSBCSU9TIHRoZQprZXJuZWwgd29uJ3QgdHJ5IHRv
IG1ha2UgYW55IGNhbGxzIGludG8gdGhlIEJJT1MsIGFuZCBpbnN0ZWFkIGV4cGVjdAp0aGUgZGF0
YSBpdCByZXF1aXJlcyB0byBiZSBwcm92aWRlZCBieSB0aGUgbG9hZGVyIGFzIHBhcnQgb2YgdGhl
Cm1ldGFkYXRhIGJsb2IsIHRvZ2V0aGVyIHdpdGggdGhlIG1vZHVsZXMgJmMuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

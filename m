Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A782C048D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:44:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDodX-0000ML-Lc; Fri, 27 Sep 2019 11:42:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jwcO=XW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDodW-0000MD-O2
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:42:10 +0000
X-Inumbo-ID: d6ada6c4-e11b-11e9-9676-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id d6ada6c4-e11b-11e9-9676-12813bfff9fa;
 Fri, 27 Sep 2019 11:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569584529;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i2zXjh2Rsl55V97RXbMe7RIKxWKTpFXxaLPNk2pY59c=;
 b=aw9ypg30U9TgSQKjrIpTWqb7p7BwcFjdJmSr7Rax7gCbu6vZfS3L6AJ6
 G9+ChnGiCBvRFcji4gJjJApeq1vAhrMU8jB6rhuNAQK3JsaAPn29x264L
 +1EPnNj66vYdiU/rDK4FYBOTuYHBssBaAMC4AXa1QLvUvuZ2RaU1UGupr w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fXW+eUBCvEs9yVM8Uvpz2QQ0sWNZUc6PLlZNDuFe+0ka45wyTh6dud0CGd0fOtUNjkH7B8IOHt
 sOmfqAlNigp3rx0sfv6Wuy+qe4NcRbWDDKEssomDNxLdnYS9SaUt15MJvOKAJePoiBaq+GiXFx
 pGgIuaHY8GiZKDZhGAVI/OyQnzhz8BHC1XMr3mK5LYBtM1LktC4u12bPn8wz0+vLQ7Rx69E+xo
 lK6DI7aq9M5s5nBDMFE697ArwAkXI0aYNOkchqDnGftDSgnYTI7TE0ErZCpRkyoQudtPUjDaZS
 feY=
X-SBRS: 2.7
X-MesageID: 6398161
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6398161"
Date: Fri, 27 Sep 2019 13:41:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190927114159.3ngxlqdgsn6bnarf@Air-de-Roger>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-5-liuwe@microsoft.com>
 <20190925102354.2tr5ojk6yvfsqtxy@Air-de-Roger>
 <20190927113058.53xs3sw57as3r3tr@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927113058.53xs3sw57as3r3tr@debian>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next RFC 4/8] x86: factor out xen
 variants for hypervisor setup code
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTI6MzA6NThQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIFNlcCAyNSwgMjAxOSBhdCAxMjoyMzo1NFBNICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gPiAtdm9pZCBfX2luaXQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKQo+ID4g
PiArc3RhdGljIHZvaWQgX19pbml0IHByb2JlX3hlbih2b2lkKQo+ID4gCj4gPiBXaGlsZSBoZXJl
IEkgd291bGQgcmVuYW1lIHRvIHhlbl9wcm9iZSwgdG8gbWF0Y2ggd2l0aCB0aGUgb3RoZXIKPiA+
IGZ1bmN0aW9ucyAoaWU6IHhlbl9zZXR1cCBiZWxvdyBmb3IgZXhhbXBsZSkuCj4gCj4gU3VyZS4g
SSBjYW4gZG8gdGhhdC4gSSBhbHdheXMgdGhvdWdodCB0aGF0IHN0cmFuZ2UgdG9vLgo+IAo+ID4g
Cj4gPiA+ICB7Cj4gPiA+ICAgICAgaWYgKCB4ZW5fZ3Vlc3QgKQo+ID4gPiAgICAgICAgICByZXR1
cm47Cj4gPiA+IEBAIC04Nyw2ICs4NywxMSBAQCB2b2lkIF9faW5pdCBwcm9iZV9oeXBlcnZpc29y
KHZvaWQpCj4gPiA+ICAgICAgeGVuX2d1ZXN0ID0gdHJ1ZTsKPiA+ID4gIH0KPiA+ID4gIAo+ID4g
PiArdm9pZCBfX2luaXQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKQo+ID4gCj4gPiBTaG91bGRuJ3Qg
dGhpcyBsaXZlIGluIGEgc2VwYXJhdGUgZmlsZSwgbGlrZSBndWVzdC9ndWVzdC5jIG9yIHNvbWUK
PiA+IHN1Y2g/Cj4gPiAKPiAKPiBJdCdzIGRvbmUgaW4gYSBsYXRlciBwYXRjaC4gSSBiZWxpZXZl
IHlvdSd2ZSBhbHJlYWR5IHNlZW4gaXQuCj4gCj4gPiBBbHNvIGl0IG1pZ2h0IGJlIG5pY2UgdG8g
aW50cm9kdWNlIHNvbWV0aGluZyBsaWtlOgo+ID4gCj4gPiBlbnVtIGd1ZXN0X3R5cGUgewo+ID4g
ICAgIFhFTl9HVUVTVCwKPiA+IH0gZ3Vlc3RfdHlwZTsKPiA+IAo+IAo+IFRoaXMgd29ya3MgZm9y
IG1lLgo+IAo+ID4gU28gdGhhdCB5b3UgY2FuIGFkZCBhIHN3aXRjaCBoZXJlLCBldmVuIGlmIHRo
ZSBvbmx5IGNhc2UgaXMgWGVuIEFUTS4gSQo+ID4gZ3Vlc3MgdGhpcyB3aWxsIGJlIGRvbmUgaW4g
YSBsYXRlciBwYXRjaCwgb3IgaW50cm9kdWNlIGFuCj4gPiBoeXBlcnZpc29yX29wcyBzdHJ1Y3Qg
dGhhdCBjb250YWluIHBvaW50ZXJzIHRvIGZ1bmN0aW9ucyB0byBhbGxvdyBmb3IKPiA+IGRpZmZl
cmVudCBpbXBsZW1lbnRhdGlvbnMuCj4gPiAKPiAKPiBJIGRlYmF0ZWQgdGhpcy4gVGhlc2UgY2hh
bmdlcyByZXF1aXJlIG1vcmUgY29kZSBjaHVybiB3aXRoIG5vIGFwcGFyZW50Cj4gYmVuZWZpdCwg
YnV0IGlmIHBlb3BsZSBhZ3JlZSB0aGlzIGlzIGJldHRlciBJIGNhbiBtYWtlIHRob3NlIGNoYW5n
ZXMuCj4gCj4gPiA+ICt7Cj4gPiA+ICsgICAgcHJvYmVfeGVuKCk7Cj4gPiA+ICt9Cj4gPiA+ICsK
PiA+ID4gIHN0YXRpYyB2b2lkIG1hcF9zaGFyZWRfaW5mbyh2b2lkKQo+ID4gPiAgewo+ID4gPiAg
ICAgIG1mbl90IG1mbjsKPiA+ID4gQEAgLTI0OSwxMCArMjU0LDggQEAgc3RhdGljIHZvaWQgaW5p
dF9ldnRjaG4odm9pZCkKPiA+ID4gICAgICB9Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gLXZvaWQg
X19pbml0IGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKPiA+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCB4
ZW5fc2V0dXAodm9pZCkKPiA+ID4gIHsKPiA+ID4gLSAgICBpbml0X21lbW1hcCgpOwo+ID4gPiAt
Cj4gPiA+ICAgICAgbWFwX3NoYXJlZF9pbmZvKCk7Cj4gPiA+ICAKPiA+ID4gICAgICBzZXRfdmNw
dV9pZCgpOwo+ID4gPiBAQCAtMjc3LDEzICsyODAsMjUgQEAgdm9pZCBfX2luaXQgaHlwZXJ2aXNv
cl9zZXR1cCh2b2lkKQo+ID4gPiAgICAgIGluaXRfZXZ0Y2huKCk7Cj4gPiA+ICB9Cj4gPiA+ICAK
PiA+ID4gLXZvaWQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKQo+ID4gPiArdm9pZCBfX2luaXQg
aHlwZXJ2aXNvcl9zZXR1cCh2b2lkKQo+ID4gPiArewo+ID4gPiArICAgIGluaXRfbWVtbWFwKCk7
Cj4gPiAKPiA+IEkgd29uZGVyLCBkbyB5b3UgYWxzbyByZXF1aXJlIHRvIG1hcCBoeXBlcnZpc29y
IGRhdGEgaW50byB0aGUgZ3Vlc3QKPiA+IHBoeXNtYXAgd2hlbiBydW5uaW5nIG9uIEh5cGVyVj8K
PiA+IAo+IAo+IFllcy4gVGhlcmUgYXJlIGEgbG90IG9mIGNvbXBhcmFibGUgY29uY2VwdHMgaW4g
SHlwZXItVi4gRm9yIGV4YW1wbGUsCj4gdGhlcmUgaXMgYSBwYWdlIGNhbGxlZCBWUCBhc3Npc3Qg
cGFnZSB3aGljaCBpcyBtb3JlIG9yIGxlc3MgdGhlIHNhbWUgYXMKPiBYZW4ncyB2Y3B1aW5mby4g
SXRzIGZvcm1hdCwgY29udGVudCBhbmQgaW50ZXJmYWNlcyBtYXkgYmUgZGlmZmVyZW50LCBidXQK
PiBjb25jZXB0dWFsbHkgaXQgaXMgdGhlIHNhbWUgYXMgdmNwdWluZm8uCj4gCj4gPiBJcyB0aGVy
ZSBhIHdheSB3aGVuIHJ1bm5pbmcgb24gSHlwZXJWIHRvIHJlcXVlc3QgdW51c2VkIHBoeXNpY2Fs
Cj4gPiBhZGRyZXNzIHNwYWNlIHJhbmdlcz8gV2hhdCBYZW4gY3VycmVudGx5IGRvZXMgaW4gaW5p
dF9tZW1tYXAgaXMgcXVpdGUKPiA+IGNyYXBweS4KPiA+IAo+IAo+IFhlbiBpdHNlbGYgc3RpbGwg
bmVlZHMgdG8gbWFuYWdlIHRoZSBhZGRyZXNzIHNwYWNlLCBubz8KPgo+IEkgYWdyZWUgdGhlIHJh
bmdlc2V0IGNvZGUgaW4geGVuLmMgaXNuJ3QgcHJldHR5LCBidXQgaXQgZG9lcyB0aGUgam9iIGFu
ZAo+IGlzIG5vdCB0b28gaW50cnVzaXZlLgoKVGhlIHByb2JsZW0gd2l0aCB0aGUgY3VycmVudCBh
cHByb2FjaCBpcyB0aGF0IHRoZSBuZXN0ZWQgWGVuIGhhcyBubwp3YXkgb2Yga25vd2luZyB3aGV0
aGVyIHRob3NlIGhvbGVzIGFyZSBhY3R1YWxseSB1bnVzZWQsIG9yIGFyZSBNTUlPCnJlZ2lvbnMg
dXNlZCBieSBkZXZpY2VzIGZvciBleGFtcGxlLgoKSGVuY2UgSSB3b25kZXJlZCBpZiBIeXBlclYg
aGFkIGEgd2F5IHRvIHNpZ25hbCB0byBndWVzdHMgdGhhdCBhCnBoeXNpY2FsIGFkZHJlc3MgcmFu
Z2UgaXMgc2FmZSB0byBiZSB1c2VkIGFzIHNjcmF0Y2ggbWFwcGluZyBzcGFjZS4gV2UKaGFkIHNw
b2tlbiBhdm9pZCBpbnRyb2R1Y2luZyBzb21ldGhpbmcgaW4gWGVuIHRvIGJlIGFibGUgdG8gcmVw
b3J0IHRvCmd1ZXN0cyBzYWZlIHJhbmdlcyBpbiB0aGUgcGh5c21hcCB0byBtYXAgc3R1ZmYuCgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

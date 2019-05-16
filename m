Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B235920889
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:48:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGhA-0000Rp-3q; Thu, 16 May 2019 13:45:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hRGh8-0000Rk-4r
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:45:14 +0000
X-Inumbo-ID: d4082742-77e0-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d4082742-77e0-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:45:12 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 0cf9vklZGri2stAONlzkGrSZZmlZ2QHQEac6+Lsmhmic4j/bo+hOehOIOU0NqjgkD9RgX9MAyQ
 LMLkbWmr1ay23OLa3ZG+e8owbVgM63BXppjIJddS4a4S4W17KhniSr/Zbi6zoY67Z60YtQ+3el
 6BHMtiCg4M+swwMpixcZRVKTUFOU/gWJxHvbat3TTGg0KBoOsw0oKr5Zg9xH+wKv41O43tXeub
 sHWVCcfx+0HhZVUaeXtLMgI/VmoQRpwvgJff+u4a2k9vW4bWQt3YO4h6XxwhaSC+UXQOPGZwR8
 MnE=
X-SBRS: 2.7
X-MesageID: 515718
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="515718"
Date: Thu, 16 May 2019 15:44:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190516134454.irapo7buz7w5mlru@Air-de-Roger>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFBB020000780022CCC6@prv1-mh.provo.novell.com>
 <20190516113728.wnjbezwtaq45ijfb@Air-de-Roger>
 <5CDD5147020000780022F9F2@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDD5147020000780022F9F2@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/4] x86/IRQ: bail early from
 irq_guest_eoi_timer_fn() when nothing is in flight
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDY6MDI6MTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE2LjA1LjE5IGF0IDEzOjM3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDY6NDY6NTFBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gVGhlcmUncyBubyBwb2ludCBlbnRlcmluZyB0aGUgbG9vcCBpbiB0
aGUgZnVuY3Rpb24gaW4gdGhpcyBjYXNlLiBJbnN0ZWFkCj4gPj4gdGhlcmUgc3RpbGwgYmVpbmcg
c29tZXRoaW5nIGluIGZsaWdodCBfYWZ0ZXJfIHRoZSBsb29wIHdvdWxkIGJlIGFuCj4gPj4gYWN0
dWFsIHByb2JsZW06IE5vIHRpbWVyIHdvdWxkIGJlIHJ1bm5pbmcgYW55bW9yZSBmb3IgaXNzdWlu
ZyB0aGUgRU9JCj4gPj4gZXZlbnR1YWxseSwgYW5kIGhlbmNlIHRoaXMgSVJRIChhbmQgcG9zc2li
bHkgbG93ZXIgcHJpb3JpdHkgb25lcykgd291bGQKPiA+PiBiZSBibG9ja2VkLCBwZXJoYXBzIGlu
ZGVmaW5pdGVseS4KPiA+PiAKPiA+PiBJc3N1ZSBhIHdhcm5pbmcgaW5zdGVhZCBhbmQgcHJlZmVy
IGJyZWFraW5nIHNvbWUgKHByZXN1bWFibHkKPiA+PiBtaXNiZWhhdmluZykgZ3Vlc3Qgb3ZlciBz
dGFsbGluZyBwZXJoYXBzIHRoZSBlbnRpcmUgc3lzdGVtLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+IAo+ID4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9pcnEuYwo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+ID4+IEBAIC0xMTE1
LDcgKzExMTUsNyBAQCBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuKHZvaWQKPiA+
PiAgCj4gPj4gICAgICBhY3Rpb24gPSAoaXJxX2d1ZXN0X2FjdGlvbl90ICopZGVzYy0+YWN0aW9u
Owo+ID4+ICAKPiA+PiAtICAgIGlmICggdGltZXJfaXNfYWN0aXZlKCZhY3Rpb24tPmVvaV90aW1l
cikgKQo+ID4+ICsgICAgaWYgKCAhYWN0aW9uLT5pbl9mbGlnaHQgfHwgdGltZXJfaXNfYWN0aXZl
KCZhY3Rpb24tPmVvaV90aW1lcikgKQo+ID4+ICAgICAgICAgIGdvdG8gb3V0Owo+ID4+ICAKPiA+
PiAgICAgIGlmICggYWN0aW9uLT5hY2tfdHlwZSAhPSBBQ0tUWVBFX05PTkUgKQo+ID4+IEBAIC0x
MTMwLDggKzExMzAsMTAgQEAgc3RhdGljIHZvaWQgaXJxX2d1ZXN0X2VvaV90aW1lcl9mbih2b2lk
Cj4gPj4gICAgICAgICAgfQo+ID4+ICAgICAgfQo+ID4+ICAKPiA+PiAtICAgIGlmICggYWN0aW9u
LT5pbl9mbGlnaHQgIT0gMCApCj4gPj4gLSAgICAgICAgZ290byBvdXQ7Cj4gPj4gKyAgICBpZiAo
IGFjdGlvbi0+aW5fZmxpZ2h0ICkKPiA+PiArICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklO
Rwo+ID4+ICsgICAgICAgICAgICAgICAiSVJRJWQ6ICVkIGhhbmRsZXJzIHN0aWxsIGluIGZsaWdo
dCBhdCBmb3JjZWQgRU9JXG4iLAo+ID4+ICsgICAgICAgICAgICAgICBkZXNjLT5pcnEsIGFjdGlv
bi0+aW5fZmxpZ2h0KTsKPiA+IAo+ID4gQUZBSUNUIGFjdGlvbi0+aW5fZmxpZ2h0IHNob3VsZCBj
b250YWluIHRoZSBudW1iZXIgb2YgZ3Vlc3RzIHBpcnFzCj4gPiB0aGF0IGhhdmUgdGhlIHBpcnEg
bWFza2VkIChwaXJxLT5tYXNrZWQgPT0gdHJ1ZSksIGJlY2F1c2UgaW5fZmxpZ2h0IGlzCj4gPiBv
bmx5IGluY3JlYXNlZCBieSBfX2RvX0lSUV9ndWVzdCB3aGVuIHRoZSBwaXJxIGlzIG5vdCBhbHJl
YWR5IG1hc2tlZC4KPiA+IEF0IGd1ZXN0IEVPSSAoZGVzY19ndWVzdF9lb2kpIHRoZSBpbl9mbGln
aHQgY291bnQgaXMgYWxzbyBvbmx5Cj4gPiBkZWNyZWFzZWQgaWYgdGhlIHBpcnEgaXMgdW5tYXNr
ZWQuCj4gPiAKPiA+IEhlbmNlIEkgdGhpbmsgdGhpcyBjb25kaXRpb24gY291bGQgYmUgdHVybmVk
IGludG8gYW4gQVNTRVJULCBidXQgSSdtCj4gPiBsaWtlbHkgbWlzc2luZyBzb21ldGhpbmcuCj4g
Cj4gSSBkb24ndCB0aGluayB5b3UgYXJlLiBHb2luZyBmcm9tIGlmKCkgc3RyYWlnaHQgdG8gQVNT
RVJUKCkgc2ltcGx5Cj4gc2VlbWVkIHRvbyBoYXJzaCB0byBtZSwgdGhlIG1vcmUgaW4gYSBzdWJz
eXN0ZW0gd2hlcmUgSSBjb3VsZAo+IGVhc2lseSBoYXZlIG92ZXJsb29rZWQgc29tZSBjb3JuZXIg
Y2FzZSwgZHVlIHRvIGhvdyBjb252b2x1dGVkCj4gc29tZSBvZiB0aGUgaW1wbGVtZW50YXRpb24g
aXMuCgpJIGFncmVlIGl0J3MgcXVpdGUgY29udm9sdXRlZC4gSSB0aGluayBpdCB3b3VsZCBiZSBo
ZWxwZnVsIHRvIGFkZCBhbgpBU1NFUlRfVU5SRUFDSEFCTEUgdG9nZXRoZXIgd2l0aCB0aGUgd2Fy
bmluZyBtZXNzYWdlLiBXaXRoIHRoYXQ6CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1AE204D9
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:41:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREhh-0002eq-Dr; Thu, 16 May 2019 11:37:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hREhg-0002ec-74
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:37:40 +0000
X-Inumbo-ID: 01ef00a7-77cf-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 01ef00a7-77cf-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:37:38 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: K3G4oRP5rbszpICZk28P/vdhsSoozoKvpJbyprodXz6QzBNTWVHyIKc69RTevkbdCkUoOqcG95
 Cn6/VvXJ2YfdVRAXbyjBxovrcFvtLjlpcTJzSyP1V4YDCbR38OvOf7Wdi/LkpftLYUuA8Fgb7B
 twwENLlIX7lZzpKeImyDdklM2s3qtlRSHsZkcXFocJKvvPmwsqhuaQZER7LwnbhHXELAYEcgLN
 1h+Fkg/ynL/AwWbfNQinM4Vt74QRzH7fcSbzxJ8iDwVbSXMiNtNSadTYV4QXpC/yAhdCzOWqQD
 hE8=
X-SBRS: 2.7
X-MesageID: 497650
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="497650"
Date: Thu, 16 May 2019 13:37:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190516113728.wnjbezwtaq45ijfb@Air-de-Roger>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFBB020000780022CCC6@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD2CFBB020000780022CCC6@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDY6NDY6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUncyBubyBwb2ludCBlbnRlcmluZyB0aGUgbG9vcCBpbiB0aGUgZnVuY3Rpb24g
aW4gdGhpcyBjYXNlLiBJbnN0ZWFkCj4gdGhlcmUgc3RpbGwgYmVpbmcgc29tZXRoaW5nIGluIGZs
aWdodCBfYWZ0ZXJfIHRoZSBsb29wIHdvdWxkIGJlIGFuCj4gYWN0dWFsIHByb2JsZW06IE5vIHRp
bWVyIHdvdWxkIGJlIHJ1bm5pbmcgYW55bW9yZSBmb3IgaXNzdWluZyB0aGUgRU9JCj4gZXZlbnR1
YWxseSwgYW5kIGhlbmNlIHRoaXMgSVJRIChhbmQgcG9zc2libHkgbG93ZXIgcHJpb3JpdHkgb25l
cykgd291bGQKPiBiZSBibG9ja2VkLCBwZXJoYXBzIGluZGVmaW5pdGVseS4KPiAKPiBJc3N1ZSBh
IHdhcm5pbmcgaW5zdGVhZCBhbmQgcHJlZmVyIGJyZWFraW5nIHNvbWUgKHByZXN1bWFibHkKPiBt
aXNiZWhhdmluZykgZ3Vlc3Qgb3ZlciBzdGFsbGluZyBwZXJoYXBzIHRoZSBlbnRpcmUgc3lzdGVt
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+IEBA
IC0xMTE1LDcgKzExMTUsNyBAQCBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuKHZv
aWQKPiAgCj4gICAgICBhY3Rpb24gPSAoaXJxX2d1ZXN0X2FjdGlvbl90ICopZGVzYy0+YWN0aW9u
Owo+ICAKPiAtICAgIGlmICggdGltZXJfaXNfYWN0aXZlKCZhY3Rpb24tPmVvaV90aW1lcikgKQo+
ICsgICAgaWYgKCAhYWN0aW9uLT5pbl9mbGlnaHQgfHwgdGltZXJfaXNfYWN0aXZlKCZhY3Rpb24t
PmVvaV90aW1lcikgKQo+ICAgICAgICAgIGdvdG8gb3V0Owo+ICAKPiAgICAgIGlmICggYWN0aW9u
LT5hY2tfdHlwZSAhPSBBQ0tUWVBFX05PTkUgKQo+IEBAIC0xMTMwLDggKzExMzAsMTAgQEAgc3Rh
dGljIHZvaWQgaXJxX2d1ZXN0X2VvaV90aW1lcl9mbih2b2lkCj4gICAgICAgICAgfQo+ICAgICAg
fQo+ICAKPiAtICAgIGlmICggYWN0aW9uLT5pbl9mbGlnaHQgIT0gMCApCj4gLSAgICAgICAgZ290
byBvdXQ7Cj4gKyAgICBpZiAoIGFjdGlvbi0+aW5fZmxpZ2h0ICkKPiArICAgICAgICBwcmludGso
WEVOTE9HX0dfV0FSTklORwo+ICsgICAgICAgICAgICAgICAiSVJRJWQ6ICVkIGhhbmRsZXJzIHN0
aWxsIGluIGZsaWdodCBhdCBmb3JjZWQgRU9JXG4iLAo+ICsgICAgICAgICAgICAgICBkZXNjLT5p
cnEsIGFjdGlvbi0+aW5fZmxpZ2h0KTsKCkFGQUlDVCBhY3Rpb24tPmluX2ZsaWdodCBzaG91bGQg
Y29udGFpbiB0aGUgbnVtYmVyIG9mIGd1ZXN0cyBwaXJxcwp0aGF0IGhhdmUgdGhlIHBpcnEgbWFz
a2VkIChwaXJxLT5tYXNrZWQgPT0gdHJ1ZSksIGJlY2F1c2UgaW5fZmxpZ2h0IGlzCm9ubHkgaW5j
cmVhc2VkIGJ5IF9fZG9fSVJRX2d1ZXN0IHdoZW4gdGhlIHBpcnEgaXMgbm90IGFscmVhZHkgbWFz
a2VkLgpBdCBndWVzdCBFT0kgKGRlc2NfZ3Vlc3RfZW9pKSB0aGUgaW5fZmxpZ2h0IGNvdW50IGlz
IGFsc28gb25seQpkZWNyZWFzZWQgaWYgdGhlIHBpcnEgaXMgdW5tYXNrZWQuCgpIZW5jZSBJIHRo
aW5rIHRoaXMgY29uZGl0aW9uIGNvdWxkIGJlIHR1cm5lZCBpbnRvIGFuIEFTU0VSVCwgYnV0IEkn
bQpsaWtlbHkgbWlzc2luZyBzb21ldGhpbmcuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

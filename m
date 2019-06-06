Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009623730C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 13:36:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYqfA-0007UI-Dh; Thu, 06 Jun 2019 11:34:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JKzC=UF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hYqf9-0007UB-Gd
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 11:34:31 +0000
X-Inumbo-ID: 0bc5a9d4-884f-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0bc5a9d4-884f-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 11:34:29 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jVWP3R/khJ2l2lrcuKHPzguYKuQpwU0pbWXgyznGKWWJr2c2dgolBhqx7RNH+Puy4ahxzuOcPU
 TU/sUd3uaJum6+C9lrySn9nORXtHYr96WUKhmXzPyO7mZNW3yVCfXEqCax6mmI7TLFXc5ZR38Q
 Cnlr5X8siOKYTIjyxLSFcQHAY0DCjjn+it+A3QFPwqj6iiWHERut20c/XILU6BZou6wdjtv4uZ
 cOCCbj40v/q5m2wakvGrFV6mDZ8JwDq0RqUqXPz9HtSftvt887qYdHurw78/wZn1hdCm6WqIee
 gnE=
X-SBRS: -0.9
X-MesageID: 1397465
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1397465"
To: Jan Beulich <JBeulich@suse.com>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFBB020000780022CCC6@prv1-mh.provo.novell.com>
 <562b4893-82eb-2ae6-3945-f80fdcc8c7a8@citrix.com>
 <5CF8CC0F0200007800235C8C@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f75089a8-7493-0e20-15c3-8a8771219d53@citrix.com>
Date: Thu, 6 Jun 2019 12:34:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CF8CC0F0200007800235C8C@prv1-mh.provo.novell.com>
Content-Language: en-GB
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDYvMjAxOSAwOToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDUuMDYuMTkg
YXQgMTk6MTUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMDgvMDUv
MjAxOSAxMzo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBAQCAtMTEzMCw4ICsxMTMwLDEwIEBA
IHN0YXRpYyB2b2lkIGlycV9ndWVzdF9lb2lfdGltZXJfZm4odm9pZAo+Pj4gICAgICAgICAgfQo+
Pj4gICAgICB9Cj4+PiAgCj4+PiAtICAgIGlmICggYWN0aW9uLT5pbl9mbGlnaHQgIT0gMCApCj4+
PiAtICAgICAgICBnb3RvIG91dDsKPj4+ICsgICAgaWYgKCBhY3Rpb24tPmluX2ZsaWdodCApCj4+
PiArICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklORwo+Pj4gKyAgICAgICAgICAgICAgICJJ
UlElZDogJWQgaGFuZGxlcnMgc3RpbGwgaW4gZmxpZ2h0IGF0IGZvcmNlZCBFT0lcbiIsCj4+PiAr
ICAgICAgICAgICAgICAgZGVzYy0+aXJxLCBhY3Rpb24tPmluX2ZsaWdodCk7Cj4+IEFGQUNJVCwg
dGhpcyBjb25kaXRpb24gY2FuIGJlIHRyaWdnZXJlZCBieSBhIGJ1Z2d5L21hbGljaW91cyBndWVz
dCwgYnkKPj4gaXQgc2ltcGx5IGlnbm9yaW5nIG9yIG1hc2tpbmcgdGhlIGxpbmUgaW50ZXJydXB0
IGF0IHRoZSB2SU8tQVBJQy4KPiBJIGRvbid0IHRoaW5rIGl0IGNhbiwgbm8uIE9yIGVsc2UgdGhl
IEFTU0VSVF9VTlJFQUNIQUJMRSgpIGJlbG93Cj4gaGVyZSB3b3VsZCBiZSBpbnZhbGlkIHRvIGFk
ZC4KCldoaWNoIEFTU0VSVF9VTlJFQUNIQUJMRSgpID/CoCBJIGtub3cgUm9nZXIgYXNrZWQgZm9y
IG9uZSwgYnV0IEkgZG9uJ3QKc2VlIGl0IGFueXdoZXJlIGluIHRoZSBjb2RlLgoKPgo+PiBUaGUg
bWVzc2FnZSB3b3VsZCBiZSBmYXIgbW9yZSB1c2VmdWwgaWYgaXQgaWRlbnRpZmllZCB0aGUgZG9t
YWluIGluCj4+IHF1ZXN0aW9uLCB3aGljaCBsb29rcyBsaWtlIGl0IGNhbiBiZSBvYnRhaW5lZCBm
cm9tIHRoZSBtaWRkbGUgb2YgdGhlIGxvb3AuCj4gVGhhdCB2ZXJ5IGxvb3AgaGFzIGp1c3QgdGFr
ZW4gY2FyZSBvZiBkZWNyZW1lbnRpbmcgLT5pbl9mbGlnaHQgZm9yCj4gYWxsIHN1Y2ggZ3Vlc3Rz
Lgo+Cj4gQWxzbyBub3RlIHRoYXQgdGhlcmUgY291bGQgYmUgbW9yZSB0aGFuIG9uZSBvZmZlbmRp
bmcgZG9tYWluLCBmb3IKPiBzaGFyZWQgSVJRcy4gUGx1cyB0aGUgbG9vcCB5b3UncmUgcmVmZXJy
aW5nIHRvIGNhbiBzcGVjaWZpY2FsbHkgX25vdF8KPiBiZSB1c2VkIGZvciBpZGVudGlmeWluZyB0
aGUgZG9tYWluKHMpLCBiZWNhdXNlIGZvciB0aGUgb25lcwo+IHByb2Nlc3NlZCB0aGVyZSB3ZSBf
ZGlkXyBkZWNyZW1lbnQgLT5pbl9mbGlnaHQuIElmIHRoaXMgbWVzc2FnZQo+IGdldHMgbG9nZ2Vk
LCB3ZSBzaW1wbHkgaGF2ZSBubyBpZGVhIHdoeSAtPmluX2ZsaWdodCBpcyBfc3RpbGxfIG5vbi0K
PiB6ZXJvLiBUaGlzIGNvdWxkIGJlIGEgQlVHX09OKCksIGJ1dCBpdCBzZWVtcyBtb3JlIGluIGxp
bmUgd2l0aCBvdXIKPiBnZW5lcmFsIGlkZWEgb2YgaG93IHdlIHdvdWxkIGxpa2UgdG8gZGVhbCB3
aXRoIHN1Y2ggY2FzZXMgdG8gdHJ5Cj4gYW5kIGtlZXAgdGhlIHN5c3RlbSBydW5uaW5nIGhlcmUg
aW4gcmVsZWFzZSBidWlsZHMuCgpPayAtIGxldHMgZ28gd2l0aCB0aGlzIGZvciBub3cuwqAgSXQg
aXMgYSBuZXQgaW1wcm92ZW1lbnQsIGFuZCB3ZSBjYW4KZXZhbHVhdGUgdGhlIGd1ZXN0LXRyaWdn
ZXJhYmlsaXR5IGF0IGEgbGF0ZXIgcG9pbnQuCgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

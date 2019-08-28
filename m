Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D24EA07EF
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 18:59:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i31ES-0003Zg-G5; Wed, 28 Aug 2019 16:55:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+/MF=WY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i31EQ-0003Zb-R8
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 16:55:38 +0000
X-Inumbo-ID: a8147028-c9b4-11e9-ae49-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8147028-c9b4-11e9-ae49-12813bfff9fa;
 Wed, 28 Aug 2019 16:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567011337;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=uLrbIWSQ+rlqKYPKyG0O233+AP+eMd6jqW/uZAnkcA8=;
 b=VHstu6mgH3nwgMmPaoXHi+fWrzw/ys4lSDG90fzq20nyMWkouKNWt074
 giEczVkGDh1J11WrjTKpmbDQ6dnS2ZlZ5oWg+1IodFH62GinNwoTWQWvI
 SKvYqFkAV7YoJbGHXkJBrjT37A3X7EWPhGizYHnGsbOND8D+3dGrlyTpJ s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CNmRA9URbzGlPasl1RG/WwgYN71g6V+tdaC+uOl7wBF16otBmBrO3dAZVx+nFddu1ElK2ICXxC
 10c1OTLurYdCWxYC2aPdxcDuzn8Ywy7XdNXOTFN0pGQfXDRfodtZK8TLE2FUegGRAhJE67qT59
 JDVMO8kfu2elgFf0PBAn8LqkCYxjIoi2KiPushmTzm8lrX0l2eeZPpqgffWpyjSV22PI0vJZJ2
 tsFGR9+8IQt+1UCte3k36eDuvxajnZEhnV6bbsDi4+NgV4DE0LCMBD06EgoZqMA9VSYkd6DXu+
 hds=
X-SBRS: 2.7
X-MesageID: 4848431
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,441,1559534400"; 
   d="scan'208";a="4848431"
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Jan Beulich
 <jbeulich@suse.com>
References: <CABfawhm+eu2ebwdou3btLJxcxBbq+uCHNxf82zahxp8dcsoDEQ@mail.gmail.com>
 <8c7ba37a-7fd0-4901-fd5b-4d04e02d63fc@suse.com>
 <CABfawhkHm89cqMu5m-6SiLU-r8m4kFXcTMAH_3cFfvRQCUDBug@mail.gmail.com>
 <43f75b07-0e2d-1c71-1a98-d3e875e09b82@suse.com>
 <CABfawhnc6-h_KAS62k08P0L98Q1ZCAm4AM7U_pJKdDVGnhH=MQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <50340e5f-32ab-f856-d1ec-5ed50a59e1ca@citrix.com>
Date: Wed, 28 Aug 2019 17:55:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawhnc6-h_KAS62k08P0L98Q1ZCAm4AM7U_pJKdDVGnhH=MQ@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Question about xenpage_list
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDgvMjAxOSAxNzoyNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgQXVn
IDI4LCAyMDE5IGF0IDk6NTQgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4gT24gMjguMDguMjAxOSAxNzo1MSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4gT24g
V2VkLCBBdWcgMjgsIDIwMTkgYXQgOTozNSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+Pj4+IE9uIDI4LjA4LjIwMTkgMTc6MjgsIFRhbWFzIEsgTGVuZ3llbCB3cm90
ZToKPj4+Pj4gSGkgYWxsLAo+Pj4+PiBJJ20gdHJ5aW5nIHRvIHRyYWNrIGRvd24gaG93IGEgY2Fs
bCBpbiBjb21tb24vZ3JhbnRfdGFibGUuYyB0bwo+Pj4+PiBzaGFyZV94ZW5fcGFnZV93aXRoX2d1
ZXN0IHdpbGwgYWN0dWFsbHkgcG9wdWxhdGUgdGhhdCBwYWdlIGludG8gdGhlCj4+Pj4+IGd1ZXN0
J3MgcGh5c21hcC4KCnNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QoKSBpcyBwZXJoYXBzIHBvb3Js
eSBuYW1lZC7CoCBJdCBtYWtlcyB0aGUgcGFnZQphYmxlIHRvIGJlIGluc2VydGVkIGludG8gdGhl
IGd1ZXN0cyBwMm0uCgpJdCBpcyBpbnRlcm5hbCBhY2NvdW50aW5nLCBzbyB0aGF0IHRoZSBwZXJt
aXNzaW9uIGNoZWNrcyBpbiBhIHN1YnNlcXVlbnQKYWRkX3RvX3BoeXNtYXAoKSBjYWxsIHdpbGwg
cGFzcy4KClBlcmhhcHMgaXQgc2hvdWxkIGJlIG5hbWVkICJhbGxvd19ndWVzdF9hY2Nlc3NfdG9f
ZnJhbWUoKSIgb3Igc2ltaWxhci4KCj4+Pj4+ICBJbW1lZGlhdGVseSBhZnRlciB0aGUgY2FsbCB0
aGUgcGFnZSBkb2Vzbid0IHNlZW0gdG8KPj4+Pj4gYmUgcHJlc2VudCBpbiB0aGUgcGh5c21hcCwg
YXMgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCB3aWxsIGp1c3QgYWRkCj4+Pj4+IHRoZSBwYWdl
IHRvIHRoZSBkb21haW4ncyB4ZW5wYWdlX2xpc3QgbGlua2VkLWxpc3Q6Cj4+Pj4+Cj4+Pj4+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBtZm47Cj4+Pj4+ICAgICAgICAgdW5zaWduZWQgbG9uZyBnZm47
Cj4+Pj4+Cj4+Pj4+ICAgICAgICAgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCh2aXJ0X3RvX3Bh
Z2UoZ3QtPnNoYXJlZF9yYXdbaV0pLCBkLCBTSEFSRV9ydyk7Cj4+Pj4+Cj4+Pj4+ICAgICAgICAg
bWZuID0gdmlydF90b19tZm4oZ3QtPnNoYXJlZF9yYXdbaV0pOwo+Pj4+PiAgICAgICAgIGdmbiA9
IG1mbl90b19nbWZuKGQsIG1mbik7Cj4+Pj4+Cj4+Pj4+ICAgICAgICAgZ2RwcmludGsoWEVOTE9H
X0lORk8sICJTaGFyaW5nICVseCAtPiAlbHggd2l0aCBkb21haW4gJXVcbiIsCj4+Pj4+IGdmbiwg
bWZuLCBkLT5kb21haW5faWQpOwo+Pj4+Pgo+Pj4+PiBUaGlzIHJlc3VsdHMgaW4gdGhlIGZvbGxv
d2luZzoKPj4+Pj4KPj4+Pj4gKFhFTikgZ3JhbnRfdGFibGUuYzoxODIwOmQwdjAgU2hhcmluZyBm
ZmZmZmZmZmZmZmZmZmZmIC0+IDQyYzcxZSB3aXRoIGRvbWFpbiAxCj4+Pj4+Cj4+Pj4+IEFGQUlD
VCB0aGUgcGFnZSBvbmx5IGdldHMgcG9wdWxhdGVkIGludG8gdGhlIHBoeXNtYXAgb25jZSB0aGUg
ZG9tYWluCj4+Pj4+IGdldHMgdW5wYXVzZWQuIElmIEkgbGV0IHRoZSBkb21haW4gcnVuIGFuZCB0
aGVuIHBhdXNlIGl0IEkgY2FuIHNlZQo+Pj4+PiB0aGF0IHRoZSBwYWdlIGlzIGluIHRoZSBndWVz
dCdzIHBoeXNtYXAgKGJ5IGxvb3BpbmcgdGhyb3VnaCBhbGwgdGhlCj4+Pj4+IGVudHJpZXMgaW4g
aXRzIEVQVCk6Cj4+Pj4+Cj4+Pj4+IChYRU4pIG1lbV9zaGFyaW5nLmM6MTYzNjpkMHYwIDB4ZjIw
MDAgLT4gMHg0MmM3MWUgaXMgYSBncmFudCBtYXBwaW5nCj4+Pj4+IHNoYXJlZCB3aXRoIHRoZSBn
dWVzdAo+Pj4+IFRoaXMgc2hvdWxkIGJlIHRoZSByZXN1bHQgb2YgdGhlIGRvbWFpbiBoYXZpbmcg
bWFkZSBhIHJlc3BlY3RpdmUKPj4+PiBYRU5NQVBTUEFDRV9ncmFudF90YWJsZSByZXF1ZXN0LCBz
aG91bGRuJ3QgaXQ/Cj4+Pj4KPj4+IERvIHlvdSBtZWFuIHRoZSBndWVzdCBpdHNlbGYgb3IgdGhl
IHRvb2xzdGFjaz8KPj4gVGhlIGd1ZXN0IGl0c2VsZiAtIGhvdyB3b3VsZCB0aGUgdG9vbCBzdGFj
ayBrbm93IHdoZXJlIHRvIHB1dCB0aGUKPj4gZnJhbWUocyk/Cj4gSSBkb24ndCB0aGluayB0aGF0
IG1ha2VzIHNlbnNlLiBIb3cgd291bGQgYSBndWVzdCBpdHNlbGYgbm93IHRoYXQgaXQKPiBuZWVk
cyB0byBtYXAgdGhhdCBmcmFtZT8gV2hlbiB5b3UgcmVzdG9yZSB0aGUgVk0gZnJvbSBhIHNhdmVm
aWxlLCBpdAo+IGlzIGFscmVhZHkgcnVubmluZyBhbmQgbm8gZmlybXdhcmUgaXMgZ29pbmcgdG8g
cnVuIGluIGl0IHRvIGluaXRpYWxpemUKPiBzdWNoIEdGTnMuCj4KPiBBcyBmb3IgdGhlIHRvb2xz
dGFjaywgSSBzZWUgY2FsbHMgdG8geGNfZG9tX2dudHRhYl9zZWVkIGZyb20gdGhlCj4gdG9vbHN0
YWNrIGR1cmluZyBkb21haW4gY3JlYXRpb24gKGJlIGl0IGEgbmV3IGRvbWFpbiBvciBvbmUgYmVp
bmcKPiByZXN0b3JlZCBmcm9tIGEgc2F2ZSBmaWxlKSB3aGljaCBkb2VzIGlzc3VlIGEgWEVOTUVN
X2FkZF90b19waHlzbWFwCj4gd2l0aCB0aGUgc3BhY2UgYmVpbmcgc3BlY2lmaWVkIGFzIFhFTk1B
UFNQQUNFX2dyYW50X3RhYmxlLiBMb29rcyBsaWtlCj4gaXQgZ2F0aGVycyB0aGUgR0ZOIHZpYSB4
Y19jb3JlX2FyY2hfZ2V0X3NjcmF0Y2hfZ3Bmbi4gU28gaXQgbG9va3MgbGlrZQo+IHRoYXQncyBo
b3cgaXRzIGRvbmUuCgpPbiBkb21haW4gY3JlYXRpb24sIHRoZSB0b29sc3RhY2sgbmVlZHMgdG8g
d3JpdGUgdGhlIHN0b3JlL2NvbnNvbGUgZ3JhbnQKZW50cnkuCgpJZiBYRU5NRU1fYWNxdWlyZV9y
ZXNvdXJjZSBpcyBhdmFpbGFibGUgYW5kIHVzYWJsZSAobmVlZHMgbmV3aXNoIFhlbiBhbmQKZG9t
MCBrZXJuZWwpLCB0aGVuIHRoYXQgbWV0aG9kIGlzIHByZWZlcnJlZC7CoCBUaGlzIGxldHMgdGhl
IHRvb2xzdGFjawptYXAgdGhlIGdyYW50IHRhYmxlIGZyYW1lIGRpcmVjdGx5LCB3aXRob3V0IGlu
c2VydGluZyBpdCBpbnRvIHRoZSBndWVzdHMKcDJtIGZpcnN0LgoKVGhlIGZhbGxiYWNrIHBhdGgg
aXMgdG8gcGljayBhIGZyZWUgcGZuLCBpbnNlcnQgaXQgaW50byB0aGUgZ3Vlc3QKcGh5c21hcCwg
Zm9yZWlnbiBtYXAgaXQsIHdyaXRlIHRoZSBlbnRyaWVzLCB1bm1hcCBhbmQgcmVtb3ZlIGZyb20g
dGhlCmd1ZXN0IHBoeXNtYXAuwqAgVGhpcyBoYXMgdmFyaW91cyBwb29yIHByb3BlcnRpZXMgbGlr
ZSBzaGF0dGVyaW5nCnN1cGVycGFnZXMgZm9yIHRoZSBndWVzdCwgYW5kIGEgZ2VuZXJhbCBpbmFi
aWxpdHkgdG8gZnVuY3Rpb24gY29ycmVjdGx5Cm9uY2UgdGhlIGd1ZXN0IGhhcyBzdGFydGVkIGV4
ZWN1dGluZyBhbmQgaGFzIGEgYmFsbG9vbiBkcml2ZXIgaW4gcGxhY2UuCgpBdCBhIGxhdGVyIHBv
aW50LCBvbmNlIHRoZSBndWVzdCBzdGFydHMgZXhlY3V0aW5nLCBhIGdyYW50LXRhYmxlIGF3YXJl
CnBhcnQgb2YgdGhlIGtlcm5lbCBvdWdodCB0byBtYXAgdGhlIGdyYW50IHRhYmxlIGF0IHRoZSBr
ZXJuZWxzIHByZWZlcnJlZApsb2NhdGlvbiBhbmQga2VlcCBpdCB0aGVyZSBwZXJtYW5lbnRseS4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

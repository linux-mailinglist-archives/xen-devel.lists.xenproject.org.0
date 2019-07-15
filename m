Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDDF68C74
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 15:52:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn1Mg-0000YR-2N; Mon, 15 Jul 2019 13:50:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Co6f=VM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hn1Me-0000YM-SF
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 13:50:00 +0000
X-Inumbo-ID: 6f97f86f-a707-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6f97f86f-a707-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 13:49:59 +0000 (UTC)
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
IronPort-SDR: qBFo1Kx2XZ5/KbfsSdzFbH+eYf0oSM8PW3LTivFUojJb++cTUVH1GAu7wdHLhwDb6rc0sPM8Oa
 ZrlJ6Pfy1BmE8YFSwW5KI2Yk51nBe0xLsy4N6FXXqDLx0FuwbWFyWYBrFsqse5ikZ9eUU1Cl/p
 +ZqVE851o9o2ifuY00Md4pH7k2Y+p6+oxl5EWs2Yhs6Wmhf2GYSisFNiLpqZnEXZpLF9JKhNPn
 1KvXqZurS5JjOtjpiPYgutifnUeHIeMu2IdzP2ZLR2qX7jnAUOg0aQKuofhbU/wKi6Fe2BXsg3
 oaM=
X-SBRS: 2.7
X-MesageID: 2981842
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2981842"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <ef670212-8257-b960-a3cb-9363cf076033@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <aed92669-d53d-1543-094b-a4c0458f944e@citrix.com>
Date: Mon, 15 Jul 2019 14:49:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ef670212-8257-b960-a3cb-9363cf076033@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/dom0-build: fix build with clang5
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDcvMjAxOSAxMTozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2l0aCBub24tZW1wdHkg
Q09ORklHX0RPTTBfTUVNIGNsYW5nNSBwcm9kdWNlcwo+Cj4gZG9tMF9idWlsZC5jOjM0NDoyNDog
ZXJyb3I6IHVzZSBvZiBsb2dpY2FsICcmJicgd2l0aCBjb25zdGFudCBvcGVyYW5kIFstV2Vycm9y
LC1XY29uc3RhbnQtbG9naWNhbC1vcGVyYW5kXQo+ICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYm
IENPTkZJR19ET00wX01FTVswXSApCj4gICAgICAgICAgICAgICAgICAgICAgICAgXiAgfn5+fn5+
fn5+fn5+fn5+fn5+Cj4gZG9tMF9idWlsZC5jOjM0NDoyNDogbm90ZTogdXNlICcmJyBmb3IgYSBi
aXR3aXNlIG9wZXJhdGlvbgo+ICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00w
X01FTVswXSApCj4gICAgICAgICAgICAgICAgICAgICAgICAgXn4KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAmCj4gZG9tMF9idWlsZC5jOjM0NDoyNDogbm90ZTogcmVtb3ZlIGNvbnN0YW50IHRv
IHNpbGVuY2UgdGhpcyB3YXJuaW5nCj4gICAgICBpZiAoICFkb20wX21lbV9zZXQgJiYgQ09ORklH
X0RPTTBfTUVNWzBdICkKPiAgICAgICAgICAgICAgICAgICAgICAgIH5efn5+fn5+fn5+fn5+fn5+
fn5+fn4KPiAxIGVycm9yIGdlbmVyYXRlZC4KPgo+IE9idmlvdXNseSBuZWl0aGVyIG9mIHRoZSB0
d28gc3VnZ2VzdGlvbnMgYXJlIGFuIG9wdGlvbiBoZXJlLiBPZGRseQo+IGVub3VnaCBzd2FwcGlu
ZyB0aGUgb3BlcmFuZHMgb2YgdGhlICYmIGhlbHBzLCB3aGlsZSBlLmcuIGNhc3Rpbmcgb3IKPiBw
YXJlbnRoZXNpemluZyBkb2Vzbid0LiBBbm90aGVyIHdvcmthYmxlIHZhcmlhbnQgbG9va3MgdG8g
YmUgdGhlIHVzZSBvZgo+ICEhIG9uIHRoZSBjb25zdGFudC4KPgo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBJJ20gb3BlbiB0byBnb2luZyB0
aGUgISEgb3IgeWV0IHNvbWUgZGlmZmVyZW50IHJvdXRlLiBObyBtYXR0ZXIgd2hpY2gKPiBvbmUg
d2UgY2hvb3NlLCBJJ20gYWZyYWlkIGl0IGlzIGdvaW5nIHRvIHJlbWFpbiBndWVzc3dvcmsgd2hh
dCBuZXdlcgo+IChhbmQgZnV0dXJlKSB2ZXJzaW9ucyBvZiBjbGFuZyB3aWxsIGNob2tlIG9uLgo+
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9k
b20wX2J1aWxkLmMKPiBAQCAtMzQxLDcgKzM0MSw3IEBAIHVuc2lnbmVkIGxvbmcgX19pbml0IGRv
bTBfY29tcHV0ZV9ucl9wYWcKPiAgICAgICB1bnNpZ25lZCBsb25nIGF2YWlsID0gMCwgbnJfcGFn
ZXMsIG1pbl9wYWdlcywgbWF4X3BhZ2VzOwo+ICAgICAgIGJvb2wgbmVlZF9wYWdpbmc7Cj4gICAK
PiAtICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQo+ICsgICAg
aWYgKCBDT05GSUdfRE9NMF9NRU1bMF0gJiYgIWRvbTBfbWVtX3NldCApCj4gICAgICAgICAgIHBh
cnNlX2RvbTBfbWVtKENPTkZJR19ET00wX01FTSk7CgpGaXJzdCBhbmQgZm9yZW1vc3QsIHRoZXJl
IGlzIGFuIGlkZW50aWNhbCBjb25zdHJ1Y3Qgb24gdGhlIEFSTSBzaWRlLAp3aGljaCB3YW50cyBh
biBlcXVpdmFsZW50IGFkanVzdG1lbnQuCgpBcyB0byB0aGUgY2hhbmdlLCBJJ20gZ29pbmcgdG8g
c3VnZ2VzdCB3aGF0IEkgc3VnZ2VzdGVkIGluc3RlYWQgb2YgdGhpcwp0aGUgZmlyc3QgdGltZSBh
cm91bmQsIHdoaWNoIGlzIHN0cmxlbihDT05GSUdfRE9NMF9NRU0pIHRvIG1ha2UgdGhlCmxvZ2lj
IGVhc2llciB0byBmb2xsb3cuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

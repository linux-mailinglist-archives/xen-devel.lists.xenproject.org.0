Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF4EAF22
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 12:48:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ8td-0003gY-Qk; Thu, 31 Oct 2019 11:45:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/tI=YY=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iQ8tc-0003gT-Cm
 for xen-devel@lists.xen.org; Thu, 31 Oct 2019 11:45:44 +0000
X-Inumbo-ID: f8094d0a-fbd3-11e9-8aca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8094d0a-fbd3-11e9-8aca-bc764e2007e4;
 Thu, 31 Oct 2019 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572522343;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=z2UEg1/7Ou3RcNmDOKMqd6notAkgRzE8/KyadwP5R4k=;
 b=EortHQ0BgZBNFZ1TOx/zg8hTz+qiSHZZoj0jgSaKdVUIg4DRy7T5qmuJ
 0sSOZffBObjhpTdiwokxIn0Ne9sBvfxruvjbR+nsvo0sqFY1ZLEVWC25B
 rRHb1kVDurja/PE59GswLrzmi4DHJPe31kFLvF6raxtGnccQfuA5lnyXo c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eT4oDICyoQGnBLPPoh6+nd2klHjVl9wPUPBaRAV0wZQqdiVnyTgaF3Rc4o1+ay63djMmNsCB5Q
 jVckuYfdNuL6Jl/znB/PVJE3lfRy1Lq9pSbhCu7Rt06mMukfxhZ5y69Vzfm/5SdXjL1zqbCopN
 DMj7rOsAaUGDCXsaEDma6HuBSvfOmdRI5TlJ4DMRizHqsZKJ043q903EBFV9Ns9biSIdWujHXT
 lFC4Vln9e5FXcxvUh/xcu7X1Dxa21xt0vJEIkwvo0y1X2GivKFVf41MX7tO3yuN1rcfGfB2pm/
 fe0=
X-SBRS: 2.7
X-MesageID: 7998154
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,250,1569297600"; 
   d="scan'208";a="7998154"
To: Jan Beulich <jbeulich@suse.com>
References: <20191031105609.21819-1-sergey.dyasli@citrix.com>
 <932471f8-fbe3-de7b-f005-d7e036f2c936@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <8ef28fe6-70dc-8233-9671-5e9cd60b7306@citrix.com>
Date: Thu, 31 Oct 2019 11:45:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <932471f8-fbe3-de7b-f005-d7e036f2c936@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 for 4.13] x86/e820: fix 640k - 1M region
 reservation logic
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
Cc: Juergen Gross <jgross@suse.com>,
 "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>, Wei
 Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xen.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMTAvMjAxOSAxMTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzEuMTAuMjAxOSAx
MTo1NiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9jb21t
b24uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCj4+IEBAIC0yNzQsNiArMjc0
LDE1IEBAIHN0YXRpYyBpbmxpbmUgdTMyIHBoeXNfcGtnX2lkKHUzMiBjcHVpZF9hcGljLCBpbnQg
aW5kZXhfbXNiKQo+PiAgCXJldHVybiBfcGh5c19wa2dfaWQoZ2V0X2FwaWNfaWQoKSwgaW5kZXhf
bXNiKTsKPj4gIH0KPj4gIAo+PiArLyoKPj4gKyAqIFNvbWV0aW1lcyBpdCdzIHRvbyBlYXJseSB0
byB1c2UgY3B1X2hhc19oeXBlcnZpc29yIHdoaWNoIGlzIGF2YWlsYWJsZSBvbmx5Cj4+ICsgKiBh
ZnRlciBlYXJseV9jcHVfaW5pdCgpLgo+PiArICovCj4+ICtib29sIF9faW5pdCBlYXJseV9jcHVf
aGFzX2h5cGVydmlzb3Iodm9pZCkKPj4gK3sKPj4gKwlyZXR1cm4gY3B1aWRfZWN4KDEpICYgY3B1
ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpOwo+PiArfQo+IAo+IE9PSSwgZGlkIHlv
dSBjb25zaWRlciBpbnRyb2R1Y2luZyBhIG1vcmUgZ2VuZXJhbCBlYXJseV9jcHVfaGFzKCksCj4g
d2l0aCBYODZfRkVBVFVSRV8qIHBhc3NlZCBhcyBhbiBhcmd1bWVudD8KCkkgY291bGRuJ3QgZmlu
ZCBhbnkgb3RoZXIgdXNlcnMgb2YgY3B1aWRfZXtjLGR9eCgweDEpLCBzbyBJIGRvbid0IHNlZQp0
aGUgcG9pbnQgaW4gZG9pbmcgaXQgbm93LgoKPj4gQEAgLTMxOCw5ICszMTksMTAgQEAgc3RhdGlj
IGludCBfX2luaXQgY29weV9lODIwX21hcChzdHJ1Y3QgZTgyMGVudHJ5ICogYmlvc21hcCwgdW5z
aWduZWQgaW50IG5yX21hcCkKPj4gIAo+PiAgICAgICAgICAvKgo+PiAgICAgICAgICAgKiBTb21l
IEJJT1NlcyBjbGFpbSBSQU0gaW4gdGhlIDY0MGsgLSAxTSByZWdpb24uCj4+IC0gICAgICAgICAq
IE5vdCByaWdodC4gRml4IGl0IHVwLgo+PiArICAgICAgICAgKiBOb3QgcmlnaHQuIEZpeCBpdCB1
cCwgYnV0IG9ubHkgd2hlbiBydW5uaW5nIG9uIGJhcmUgbWV0YWwuCj4+ICAgICAgICAgICAqLwo+
PiAtICAgICAgICBpZiAodHlwZSA9PSBFODIwX1JBTSkgewo+PiArICAgICAgICBpZiAoICFlYXJs
eV9jcHVfaGFzX2h5cGVydmlzb3IoKSAmJiB0eXBlID09IEU4MjBfUkFNICkKPj4gKyAgICAgICAg
ewo+PiAgICAgICAgICAgICAgaWYgKHN0YXJ0IDwgMHgxMDAwMDBVTEwgJiYgZW5kID4gMHhBMDAw
MFVMTCkgewo+PiAgICAgICAgICAgICAgICAgIGlmIChzdGFydCA8IDB4QTAwMDBVTEwpCj4+ICAg
ICAgICAgICAgICAgICAgICAgIGFkZF9tZW1vcnlfcmVnaW9uKHN0YXJ0LCAweEEwMDAwVUxMLXN0
YXJ0LCB0eXBlKTsKPiAKPiBTZWVpbmcgb3JpZ2luYWwgbGluZSBhbmQgbG93ZXIgY29udGV4dCAt
IGFyZW4ndCB5b3UgY29ycnVwdGluZwo+IHByZXZpb3VzbHkgcmVhc29uYWJseSBjb25zaXN0ZW50
IChMaW51eCkgc3R5bGUgaGVyZT8gKFRoaXMgY291bGQKPiBiZSBlYXNpbHkgdGFrZW4gY2FyZSBv
ZiB3aGlsZSBjb21taXR0aW5nLCBidXQgSSdkIGZpcnN0IGxpa2UgdGhlCj4gcG9pbnQgYmVsb3cg
YmUgY2xhcmlmaWVkLikKClRoaXMgZmlsZSBoYXMgbWl4ZWQgY29kaW5nIHN0eWxlIGFuZCBJIGRv
bid0IGhhdmUgYW55IHByZWZlcmVuY2UgaGVyZS4KCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5j
Cj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4+IEBAIC01OTQzLDcgKzU5NDMsNyBAQCBjb25z
dCBzdHJ1Y3QgcGxhdGZvcm1fYmFkX3BhZ2UgKl9faW5pdCBnZXRfcGxhdGZvcm1fYmFkcGFnZXMo
dW5zaWduZWQgaW50ICphcnJheQo+PiAgICAgIGNhc2UgMHgwMDA4MDZlMDogLyogZXJyYXR1bSBL
Qkw/Pz8gKi8KPj4gICAgICBjYXNlIDB4MDAwOTA2ZTA6IC8qIGVycmF0YSBLQkw/Pz8gLyBLQlcx
MTQgLyBDRlcxMDMgKi8KPj4gICAgICAgICAgKmFycmF5X3NpemUgPSAoY3B1aWRfZWF4KDApID49
IDcgJiYKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgIShjcHVpZF9lY3goMSkgJiBjcHVmZWF0
X21hc2soWDg2X0ZFQVRVUkVfSFlQRVJWSVNPUikpICYmCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICFlYXJseV9jcHVfaGFzX2h5cGVydmlzb3IoKSAmJgo+IAo+IFN0cmljdGx5IHNwZWFraW5n
IHRoaXMgbWFrZXMgY2xlYXIgdGhhdCBpbiBlYXJseV9jcHVfaGFzX2h5cGVydmlzb3IoKQo+IHlv
dSBzaG91bGQgYWxzbyBjaGVjayBjcHVpZF9lYXgoMCkgPj0gMS4gV2UgZG9uJ3QgY3VycmVudGx5
IHNlZW0gdG8KPiBvYmplY3QgdG8gcnVubmluZyBvbiBhIHN5c3RlbSB3aXRoIG9ubHkgYmFzaWMg
bGVhZiAwIGF2YWlsYWJsZSAod2UKPiBkbyBvYmplY3QgdG8gdGhlcmUgbm90IGJlaW5nIGV4dGVu
ZGVkIGxlYWYgMSkuIEFuZHJldywgZG8geW91IGhhdmUKPiBhbnkgY2xlYXIgb3BpbmlvbiBvbmUg
d2F5IG9yIHRoZSBvdGhlcj8KCldoYXQgZ2F2ZSB5b3UgdGhhdCBpbXByZXNzaW9uPyBlYXJseV9j
cHVfaW5pdCgpIGFuZCBnZW5lcmljX2lkZW50aWZ5KCkKZG8gY3B1aWQoMHgxKSB1bmNvbmRpdGlv
bmFsbHkuCgotLQpUaGFua3MsClNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56805127F73
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 16:37:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiKHl-00056j-RR; Fri, 20 Dec 2019 15:33:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1+gY=2K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iiKHl-00056b-5C
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 15:33:49 +0000
X-Inumbo-ID: 18bd83a4-233e-11ea-88e7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18bd83a4-233e-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576856020;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UngIaZdERBh/2gDcrFo/Xj5w7xf/CshkHSX2p++hTu4=;
 b=TdPXUGBVKTfKmoMzpHAHWmjhasCwQgtUiGBwr4bnPPFIVYX0+lA+InxI
 SrJTQa+9feIzBSX6q78QYcPDoMi1I/vfFPu9qyTuhTbAjXw09aoUPKR8U
 suvnB9oXnayogHkpd8JyRaesprBYVeK8x14Qq8rb84rW8duRBifQNq2df E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sqAqZqcfJG/5IDQa7F73S3X0q4OoA0D67uwG8qUdfH/DQaTRnbkkCkRa6KkTpUlrqItRX05sFj
 KuHBVLKioPvFR7hZxYqfS4OKCx7XxgOf3XJdYh7mpObNZ5xAflcxXc0K6EQi2ytL2L0X1ReoL4
 k5Dj7UW3Pvz82WRknrJ1nyFiZiamFvpnsd1QXDGIqZCqXeRmvMo9qMobKQwqoWuNvHxUr5TY8/
 D1jUuByXy2Na4BhsrF8gsRbcUfIKyxB5cbIdGwrLFHu3XL6pT3J0720oW10FSrl7fAVuSAt95k
 IXc=
X-SBRS: 2.7
X-MesageID: 10582305
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10582305"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
 <455ab356-3354-1661-51d0-7f67caa9ecfb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <029a10fb-ff6e-c637-9267-3fd284b9c938@citrix.com>
Date: Fri, 20 Dec 2019 15:33:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <455ab356-3354-1661-51d0-7f67caa9ecfb@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/4] x86/mm: rename and tidy
 create_pae_xen_mappings()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMTIvMjAxOSAxNDoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQWZ0ZXIgZGFkNzRiMGY5
ZSAoImkzODY6IGZpeCBoYW5kbGluZyBvZiBYZW4gZW50cmllcyBpbiBmaW5hbCBMMiBwYWdlCj4g
dGFibGUiKSBhbmQgdGhlIHJlbW92YWwgb2YgMzItYml0IHN1cHBvcnQgdGhlIGZ1bmN0aW9uIGRv
ZXNuJ3QgbW9kaWZ5Cj4gc3RhdGUgYW55bW9yZSwgYW5kIGhlbmNlIGl0cyBuYW1lIGhhcyBiZWVu
IG1pc2xlYWRpbmcuIENoYW5nZSBpdHMgbmFtZSwKPiBjb25zdGlmeSBwYXJhbWV0ZXJzIGFuZCBh
IGxvY2FsIHZhcmlhYmxlLCBhbmQgbWFrZSBpdCByZXR1cm4gYm9vbC4KPgo+IEFsc28gZHJvcCB0
aGUgY2FsbCB0byBpdCBmcm9tIG1vZF9sM19lbnRyeSgpOiBUaGUgZnVuY3Rpb24gZXhwbGljaXRs
eQo+IGRpc2FsbG93cyAzMi1iaXQgZG9tYWlucyB0byBtb2RpZnkgc2xvdCAzLiBGdXJ0aGVybW9y
ZSwgcmUtY2hlY2tpbmcKPiBvZiBzbG90IDMgd2hlbiBvdGhlciBzbG90cyBjaGFuZ2UgaGFzIG5l
ZWRsZXNzbHkgZGlzYWxsb3dlZCBkb2luZyB0aGlzCj4gdG9nZXRoZXIgd2l0aCBtYWtpbmcgc29t
ZSBMMiB0YWJsZSByZWN1cnNpdmVseSBsaW5rIGJhY2sgdG8gYW4gTDIgdXNlZAo+IGluIHNvbWUg
TDMncyAzcmQgc2xvdCAoYmVjYXVzZSBvZiB0aGUgY2hlY2tpbmcgb2YgdGhlIHR5cGUgcmVmIGNv
dW50IHRvCj4gYmUgMSkuIChOb3RlIHRoYXQgYWxsb3dpbmcgZHluYW1pYyBjaGFuZ2VzIG9mIEwz
IGVudHJpZXMgaW4gdGhlIHdheSB3ZQo+IGRvIGlzIGJvZ3VzIGFueXdheSwgYXMgdGhhdCdzIG5v
dCBob3cgTDNzIGJlaGF2ZSBpbiB0aGUgbmF0aXZlIGNhc2U6Cj4gVGhleSBnZXQgcmUtZXZhbHVh
dGVkIG9ubHkgdXBvbiBDUjMgcmVsb2Fkcy4pCgpJJ20gaGF2aW5nIGEgaGFyZCB0aW1lIGZvbGxv
d2luZyB0aGlzLsKgIEkgYWdyZWUgdGhhdCBkcm9wcGluZyB0aGUgY2FsbApmcm9tIG1vZF9sM19l
bnRyeSgpIGlzIHNhZmUsIGJ1dCBJIGNhbnQgcGFyc2UgdGhlIHNlY29uZCBzZW50ZW5jZS4KCkFz
IGZvciB0aGUgZmluYWwgc2VudGVuY2UsIEknbSBub3Qgc3VyZSB0aGF0IGlzIGFjdHVhbGx5IHRy
dWUuwqAgSW4KcGFydGljdWxhciwgQU1EIE5QVCBzYXlzIHRoYXQgdGhlIFBEUFRScyBtYXkgYWN0
dWFsbHkgYmVoYXZlIGxpa2UgTDMncwppbiA0LWxldmVsIHBhZ2luZywgcmF0aGVyIHRoYW4gaG93
IGxlZ2FjeSBQQUUgdXNlZCB0byB3b3JrLgoKPiBBcyBhIHJlc3VsdCBvZiB0aGlzIHdlIG5vIGxv
bmdlciBuZWVkIHRvIHBsYXkgZ2FtZXMgdG8gZ2V0IGF0IHRoZSBzdGFydAo+IG9mIHRoZSBMMyB0
YWJsZS4gTGVhdmUgYW4gQVNTRVJUKCkgdGhvdWdoLCBqdXN0IGluIGNhc2UuCgpJJ2QgZHJvcCB0
aGUgYXNzZXJ0KCkuwqAgVGhlIHNvbGUgY2FsbGVyIGlzIGludGVybmFsLCBhbmQgd2Ugd291bGQg
aGF2ZQptYWpvciBwcm9ibGVtcyBpZiBhbnkgb2YgbW0uYyBvcGVyYXRlZCBvbiBtaXNhbGlnbmVk
IHBvaW50ZXJzLsKgIChJIGRpZApkb3VibGUgY2hlY2sgYWxsIG9mIHRoZSBNTSBjb2RlIGZvbGxv
d2luZyB3aGljaGV2ZXIgWFNBIHRoZSBtaXNhbGlnbmVkCmdyYW50IG1hcCBieSBQVEUgd2FzLikK
Cj4KPiBGdXJ0aGVyIG1vdmUgYSBCVUdfT04oKSBzdWNoIHRoYXQgaW4gdGhlIGNvbW1vbiBjYXNl
IGl0cyBjb25kaXRpb24KPiB3b3VsZG4ndCBuZWVkIGV2YWx1YXRpbmcuCj4KPiBGaW5hbGx5LCBz
aW5jZSB3ZSdyZSBhdCBpdCwgbW92ZSBpbml0X3hlbl9wYWVfbDJfc2xvdHMoKSBuZXh0IHRvIHRo
ZQo+IHJlbmFtZWQgZnVuY3Rpb24sIGFzIHRoZXkgcmVhbGx5IGJlbG9uZyB0b2dldGhlciAoaW4g
ZmFjdAo+IGluaXRfeGVuX3BhZV9sMl9zbG90cygpIHdhcyBbaW5kaXJlY3RseV0gYnJva2VuIG91
dCBvZiB0aGlzIGZ1bmN0aW9uKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBXZSBjb3VsZCBnbyBmdXJ0aGVyIGhlcmUgYW5kIGRlbGV0
ZSB0aGUgZnVuY3Rpb24gYWx0b2dldGhlcjogVGhlcmUgYXJlCj4gbm8gbGluZWFyIG1hcHBpbmdz
IGluIGEgUEdUX3BhZV94ZW5fbDIgdGFibGUgYW55bW9yZSAodGhpcyB3YXMgb24gMzItYml0Cj4g
b25seSkuIFRoZSBjb3JyZXNwb25kaW5nIGNvbmRpdGlvbmFsIGluIG1vZF9sM19lbnRyeSgpIGNv
dWxkIHRoZW4gZ28KPiBhd2F5IGFzIHdlbGwgKG9yLCBtb3JlIHByZWNpc2VseSwgd291bGQgbmVl
ZCB0byBiZSByZXBsYWNlZCBieSBjb3JyZWN0Cj4gaGFuZGxpbmcgb2YgM3JkIHNsb3QgdXBkYXRl
cykuIFRoaXMgd291bGQgbWVhbiB0aGF0IGEgMzItYml0IGd1ZXN0Cj4gZnVuY3Rpb25pbmcgb24g
bmV3IFhlbiBtYXkgZmFpbCB0byB3b3JrIG9uIG9sZGVyIChwb3NzaWJseSAzMi1iaXQpIFhlbi4K
CkdpdmVuIHRoYXQgUFYgZ3Vlc3RzIGNhbid0IGRvIGFueXRoaW5nIGRpZmZlcmVudGx5IG9yIHRo
ZXknZCBzdG9wCndvcmtpbmcgb24gcHJlLTQuMTQsIEkgZG9uJ3QgdGhpbmsgcmVtb3ZpbmcgdGhp
cyByZXN0cmljdGlvbiBpcyBoZWxwZnVsLgoKSXQgd291bGQgYmUgd29ydGggZXhwbGljaXRseSBj
b21tZW50aW5nIHRoYXQgaXQgaXMgYSBsZWdhY3kgcmVzdHJpY3Rpb24KaG93ZXZlci7CoCAoSSBj
b3VsZCBoYXZlIHN3b3JuIEkgc3VibWl0dGVkIGEgcGF0Y2ggdG8gZG8gdGhpcywgYnV0IEkKY2Fu
J3QgbG9jYXRlIGl0IGluIG15IHRyZWUuKQoKPgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4g
KysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAtMTQxNCwyMiArMTQxNCwyMyBAQCBzdGF0aWMg
aW50IHByb21vdGVfbDFfdGFibGUoc3RydWN0IHBhZ2VfCj4gICAgICByZXR1cm4gcmV0Owo+ICB9
Cj4gIAo+IC1zdGF0aWMgaW50IGNyZWF0ZV9wYWVfeGVuX21hcHBpbmdzKHN0cnVjdCBkb21haW4g
KmQsIGwzX3BnZW50cnlfdCAqcGwzZSkKPiArc3RhdGljIGJvb2wgcGFlX3hlbl9tYXBwaW5nc19j
aGVjayhjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGwzX3BnZW50cnlfdCAqcGwzZSkKPiAgewo+IC0gICAgc3RydWN0IHBh
Z2VfaW5mbyAqcGFnZTsKPiAtICAgIGwzX3BnZW50cnlfdCAgICAgbDNlMzsKPiArICAgIGNvbnN0
IHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7Cj4gKyAgICBsM19wZ2VudHJ5X3QgbDNlMzsKPiAgCj4g
ICAgICBpZiAoICFpc19wdl8zMmJpdF9kb21haW4oZCkgKQo+IC0gICAgICAgIHJldHVybiAxOwo+
ICsgICAgICAgIHJldHVybiB0cnVlOwoKVGhlcmUgaXMgbm93IGEgc2luZ2xlIGNhbGxlci7CoCBC
eSByZXBvc2l0aW9uaW5nIHRoZSBjYWxsZXIgaW4KcHJvbW90ZV9sM190YWJsZSgpLCB0aGlzIGNv
bmRpdGlvbiBjYW4gYmUgZHJvcHBlZCwgd2hpY2ggcmVtb3ZlcyBvbmUKZXZhbF9ub3NwZWMoKSBm
cm9tIHRoZSBtaXggKHNlZWluZyBhcyB0aGVzZSBhcmUgZXhwZW5zaXZlIG5vdy4pCgo+ICAKPiAt
ICAgIHBsM2UgPSAobDNfcGdlbnRyeV90ICopKCh1bnNpZ25lZCBsb25nKXBsM2UgJiBQQUdFX01B
U0spOwo+ICsgICAgQVNTRVJUKCEoKHVuc2lnbmVkIGxvbmcpcGwzZSAmIH5QQUdFX01BU0spKTsK
PiAgCj4gICAgICAvKiAzcmQgTDMgc2xvdCBjb250YWlucyBMMiB3aXRoIFhlbi1wcml2YXRlIG1h
cHBpbmdzLiBJdCAqbXVzdCogZXhpc3QuICovCj4gICAgICBsM2UzID0gcGwzZVszXTsKPiAgICAg
IGlmICggIShsM2VfZ2V0X2ZsYWdzKGwzZTMpICYgX1BBR0VfUFJFU0VOVCkgKQo+ICAgICAgewo+
ICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiUEFFIEwzIDNyZCBzbG90IGlzIGVt
cHR5XG4iKTsKCkFsc28sIGJ5IHJlcG9zaXRpb25pbmcsIGl0IGJlY29tZXMgY2xlYXIgdGhhdCB0
aGUgX1BBR0VfUFJFU0VOVCBjaGVjayBpcwpkdXBsaWNhdGVkLCBhbmQgdGhpcyBwcmludGsoKSBp
cyBub3cgZGVhZCBjb2RlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A5017148D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 10:59:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7FtR-0000k8-2d; Thu, 27 Feb 2020 09:55:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7FtP-0000k3-VW
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 09:55:43 +0000
X-Inumbo-ID: 50a703ab-5947-11ea-9624-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50a703ab-5947-11ea-9624-12813bfff9fa;
 Thu, 27 Feb 2020 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582797343;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=80Hb3SJS2Hxkr8bkC/MZNBdIirFokggjHXfwj4prHJE=;
 b=F66KL6rfgBYihUe25R8iYYAroFajxEua77UAJnZmoAUJjRMlDkWQ86TN
 Y4DxlVVNvHLKvCyzXtXQd/Jb0Snqv6a4G2qVwKwvAi8ZhKsi3YzlH9NvB
 bKwc9gHurz+a5hg7qkSPQhWrXvgnh+zw1y1KcCcGcM1YuPvhmfnm+KaoD A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q9NLEpGfeQRu1u3D1wJdWkxsnwyonaFbhOLHQKpvQAzAJCgmujsMq33J4ckM1x8JLLLcv1VnFm
 ICOhwy/yE52Bm9UEjGvleJ3EmxaayRn+j89Fxafqh0XYphvQ6A839Thvk6IdnrwIAYengR9e/O
 o4RlNbUP7Jvz83W/Mjsi8lUCFpEu81TZUx4lehlAETrQ8zgNiIuODAPzeYACI3lxihyRzXZBR8
 XuY8g/Sd/JloXeZB9UuTG7PKesHwrh3BOTLSgDsUVBkFlg+PiAdJJxxYiySTlPFfgJ0zkn9vVu
 X48=
X-SBRS: 2.7
X-MesageID: 13098499
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,491,1574139600"; d="scan'208";a="13098499"
To: Jan Beulich <jbeulich@suse.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-3-andrew.cooper3@citrix.com>
 <9faee7d1-a555-dc3f-f7e0-3dcbc8442cc3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <16cc367a-28e0-4b20-80d0-c82ef9093f64@citrix.com>
Date: Thu, 27 Feb 2020 09:55:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9faee7d1-a555-dc3f-f7e0-3dcbc8442cc3@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 02/10] tools/libxc: Simplify
 xc_get_static_cpu_featuremask()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDIvMjAyMCAwNzo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDIuMjAyMCAy
MToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRHJvcCBYQ19GRUFUVVJFTUFTS19ERUVQX0ZF
QVRVUkVTLiAgSXQgaXNuJ3QgdXNlZCBieSBhbnkgY2FsbGVycywgYW5kIHVubGlrZQo+PiB0aGUg
b3RoZXIgc3RhdGljIG1hc2tzLCB3b24ndCBiZSBvZiBpbnRlcmVzdCB0byBhbnlvbmUgd2l0aG91
dCBvdGhlciBwaWVjZXMgb2YKPj4gY3B1aWQtYXV0b2dlbi5oCj4+Cj4+IEluIHhjX2dldF9zdGF0
aWNfY3B1X2ZlYXR1cmVtYXNrKCksIHVzZSBhIDJkIGFycmF5IGluc3RlYWQgb2YgaW5kaXZpZHVh
bGx5Cj4+IG5hbWVkIHZhcmlhYmxlcywgYW5kIGRyb3AgdGhlIHN3aXRjaCBzdGF0ZW1lbnQgY29t
cGxldGVseS4KPj4KPj4gTm8gcHJhY3RpY2FsIGNoYW5nZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IHdpdGggdGhyZWUgcmVtYXJrczoKPgo+
PiAtLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+PiArKysgYi90b29scy9saWJ4Yy94
Y19jcHVpZF94ODYuYwo+PiBAQCAtOTAsNDMgKzkwLDIzIEBAIHVpbnQzMl90IHhjX2dldF9jcHVf
ZmVhdHVyZXNldF9zaXplKHZvaWQpCj4+ICBjb25zdCB1aW50MzJfdCAqeGNfZ2V0X3N0YXRpY19j
cHVfZmVhdHVyZW1hc2soCj4+ICAgICAgZW51bSB4Y19zdGF0aWNfY3B1X2ZlYXR1cmVtYXNrIG1h
c2spCj4+ICB7Cj4+IC0gICAgY29uc3Qgc3RhdGljIHVpbnQzMl90IGtub3duW0ZFQVRVUkVTRVRf
TlJfRU5UUklFU10gPSBJTklUX0tOT1dOX0ZFQVRVUkVTLAo+PiAtICAgICAgICBzcGVjaWFsW0ZF
QVRVUkVTRVRfTlJfRU5UUklFU10gPSBJTklUX1NQRUNJQUxfRkVBVFVSRVMsCj4+IC0gICAgICAg
IHB2W0ZFQVRVUkVTRVRfTlJfRU5UUklFU10gPSBJTklUX1BWX0ZFQVRVUkVTLAo+PiAtICAgICAg
ICBodm1fc2hhZG93W0ZFQVRVUkVTRVRfTlJfRU5UUklFU10gPSBJTklUX0hWTV9TSEFET1dfRkVB
VFVSRVMsCj4+IC0gICAgICAgIGh2bV9oYXBbRkVBVFVSRVNFVF9OUl9FTlRSSUVTXSA9IElOSVRf
SFZNX0hBUF9GRUFUVVJFUywKPj4gLSAgICAgICAgZGVlcF9mZWF0dXJlc1tGRUFUVVJFU0VUX05S
X0VOVFJJRVNdID0gSU5JVF9ERUVQX0ZFQVRVUkVTOwo+PiAtCj4+IC0gICAgQlVJTERfQlVHX09O
KEFSUkFZX1NJWkUoa25vd24pICE9IEZFQVRVUkVTRVRfTlJfRU5UUklFUyk7Cj4+IC0gICAgQlVJ
TERfQlVHX09OKEFSUkFZX1NJWkUoc3BlY2lhbCkgIT0gRkVBVFVSRVNFVF9OUl9FTlRSSUVTKTsK
Pj4gLSAgICBCVUlMRF9CVUdfT04oQVJSQVlfU0laRShwdikgIT0gRkVBVFVSRVNFVF9OUl9FTlRS
SUVTKTsKPj4gLSAgICBCVUlMRF9CVUdfT04oQVJSQVlfU0laRShodm1fc2hhZG93KSAhPSBGRUFU
VVJFU0VUX05SX0VOVFJJRVMpOwo+PiAtICAgIEJVSUxEX0JVR19PTihBUlJBWV9TSVpFKGh2bV9o
YXApICE9IEZFQVRVUkVTRVRfTlJfRU5UUklFUyk7Cj4+IC0gICAgQlVJTERfQlVHX09OKEFSUkFZ
X1NJWkUoZGVlcF9mZWF0dXJlcykgIT0gRkVBVFVSRVNFVF9OUl9FTlRSSUVTKTsKPj4gLQo+PiAt
ICAgIHN3aXRjaCAoIG1hc2sgKQo+PiAtICAgIHsKPj4gLSAgICBjYXNlIFhDX0ZFQVRVUkVNQVNL
X0tOT1dOOgo+PiAtICAgICAgICByZXR1cm4ga25vd247Cj4+IC0KPj4gLSAgICBjYXNlIFhDX0ZF
QVRVUkVNQVNLX1NQRUNJQUw6Cj4+IC0gICAgICAgIHJldHVybiBzcGVjaWFsOwo+PiAtCj4+IC0g
ICAgY2FzZSBYQ19GRUFUVVJFTUFTS19QVjoKPj4gLSAgICAgICAgcmV0dXJuIHB2Owo+PiArICAg
IGNvbnN0IHN0YXRpYyB1aW50MzJfdCBtYXNrc1tdW0ZFQVRVUkVTRVRfTlJfRU5UUklFU10gPSB7
Cj4gV291bGQgeW91IG1pbmQgc3dpdGNoaW5nIHRvIHRoZSBtb3JlIGNvbnZlbnRpb25hbCAic3Rh
dGljIGNvbnN0Ij8KCk9rLgoKPgo+PiArI2RlZmluZSBNQVNLKHgpIFtYQ19GRUFUVVJFTUFTS18g
IyMgeF0gPSBJTklUXyAjIyB4ICMjIF9GRUFUVVJFUwo+IEknbSBzdXJwcmlzZWQgdG8gc2VlIHlv
dSBpbnRyb2R1Y2Ugc3VjaCBhIGNvbnN0cnVjdCwgd2hlbiBtb3JlCj4gdGhhbiBvbmNlIEkgaGVh
cmQgeW91IHNheSB0aGF0IHlvdSBkaXNsaWtlIG1hY3JvcyB1c2luZyAjIyBpbgo+IHdheXMgbGlr
ZSBpdCBpcyBkb25lIGhlcmUuCgpJdCBpcyBhbGwgYWJvdXQgcG9zaXRpb25pbmcuCgpMaWtlIHRo
aXMsIHRoZSBkZXRhaWxzIGFyZSBhbHdheXMgdmlzaWJsZSAoYW5kIGNsZWFyKSB0byBhbnlvbmUK
aW5zcGVjdGluZyB0aGUgZnVuY3Rpb24sIGJlY2F1c2UgdGhlIG1hY3JvIG9ubHkgZXhpc3RzIGFk
amFjZW50IHRvIGl0cwp1c2UuwqAgSXQgaXMgYWxzbyBub3QgYW4gaW50ZXJlc3RpbmcgZnVuY3Rp
b24gKGxvZ2ljIHdpc2UpLCBzbyB0aGUgZmFjdAppdCBkb2Vzbid0IHNob3cgdXAgb24gdHJpdmlh
bCBncmVwcyBpcyBhIGxlc3NlciBldmlsLCBjb21wYXJlZCB0byB0aGUKb3BlbmNvZGVkIHZlcnNp
b24uCgpNeSBpc3N1ZSB3aXRoICMjIGdlbmVyYWxseSBpcyB0aGF0IGl0cyB1c2Ugb2JmdXNjYXRl
cyBsb2dpYywgYm90aCBpbgp0ZXJtcyBvZiBoaWRpbmcgdGhlIG9wZXJhdGlvbiBnb2luZyBvbiwg
YW5kIG1ha2luZyBpdCBkaWZmaWN1bHQgdG8KbG9jYXRlIHJlbGF0ZWQgY29kZSBwYXR0ZXJucy4K
Cj4KPj4gKyAgICBCVUlMRF9CVUdfT04oQVJSQVlfU0laRShtYXNrc1swXSkgIT0gRkVBVFVSRVNF
VF9OUl9FTlRSSUVTKTsKPiBJc24ndCB0aGlzIHF1aXRlIHBvaW50bGVzcyB3aXRoIHRoZSBub3cg
Y2hhbmdlZCBkZWZpbml0aW9uIG9mCj4gdGhlIGFycmF5PwoKSSdkIG5lZWQgdG8gZG91YmxlIGNo
ZWNrLCBidXQgSSBzdXNwZWN0IGl0IGlzIHN0aWxsIG5lY2Vzc2FyeSAoaW4gdGVybXMKb2YgdGhl
IGNvbmRpdGlvbiB3aGljaCBtaWdodCBjYXVzZSBpdCB0byB0cmlwIC0gd2hldGhlciB0aGlzIGNv
bmRpdGlvbgppcyBhbiBpbnRlcmVzdGluZyB0aGluZyB0byBicmVhayB0aGUgYnVpbGQgb3ZlciBt
aWdodCBiZSBhIGRpZmZlcmVudCBzdG9yeSkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

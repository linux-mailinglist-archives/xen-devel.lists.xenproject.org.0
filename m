Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3F4BBA9B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 19:37:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCSDP-0000kc-0S; Mon, 23 Sep 2019 17:33:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v9XQ=XS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iCSDN-0000kX-E4
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 17:33:33 +0000
X-Inumbo-ID: 4357060e-de28-11e9-9605-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 4357060e-de28-11e9-9605-12813bfff9fa;
 Mon, 23 Sep 2019 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569260013;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=z4NeoCAa0uW2c3SP6Tex/jWvR6LLtmNVKUEG5gBz95I=;
 b=NpR+Ibw0u/YK46oowhsOaq2NOAzhGInlBTKMMlZsyH5Dm/8CWy38VhL8
 C3sHesOkx50MRQULx2mBmXvGa9CS7mnqfT8kSRpg8p1wVQZkmpNy5O7f7
 AKSkGZEGtbctyZUqVcmD09a4wg4DxGF9G6Bu6aYh7dF3wfp/7XgS7Vnvf 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OGLg8Ntb6fuljbC8RRLYGVqOFN9BzB8mJoDK5IqODKivezzyv9Efkb2NV+m2JFgo1e5AbX2Dvr
 8z7611eqnTOtaPwjiyoqAo4chzAmCq+g7/+yZGqKlxFAR9UAkrkOBcQk1xp1Z8UVEwUpLkhdWA
 5/8mdHzUrLFfUvmCFHgL56Bg/hSdHAxzMLQ0vWzbqZZcRjyIFwLyQdGo1ebBaERvwivqKQzA8Z
 2vywLM2Oe+hkEfWqlAieEs8DH1U04b8arufZykybFnYMiXBJf3eWaMjcNmn0rcaVlI0F2qbQ8i
 zq8=
X-SBRS: 2.7
X-MesageID: 5942442
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,541,1559534400"; 
   d="scan'208";a="5942442"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <c5ffff18-bded-486d-5883-da1f6e091d51@suse.com>
 <6b9ca7a2-e2c4-5662-7f56-b1cceac75c67@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <159c23f4-aa7f-7aa0-e054-2a6cd0ebe82f@citrix.com>
Date: Mon, 23 Sep 2019 18:33:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6b9ca7a2-e2c4-5662-7f56-b1cceac75c67@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] libxc/x86: avoid overflow in CPUID APIC
 ID adjustments
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDkvMjAxOSAwOToyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjAuMDkuMjAxOSAx
NTo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFJlY2VudCBBTUQgcHJvY2Vzc29ycyBtYXkgcmVw
b3J0IHVwIHRvIDEyOCBsb2dpY2FsIHByb2Nlc3NvcnMgaW4gQ1BVSUQKPj4gbGVhZiAxLiBEb3Vi
bGluZyB0aGlzIHZhbHVlIHByb2R1Y2VzIDAgKHdoaWNoIE9TZXMgc2luY2VyZWx5IGRpc2xpa2Up
LAo+PiBhcyB0aGUgcmVzcGVjdGl2ZSBmaWVsZCBpcyBvbmx5IDggYml0cyB3aWRlLiBTdXBwcmVz
cyBkb3VibGluZyB0aGUgdmFsdWUKPj4gKGFuZCBpdHMgbGVhZiAweDgwMDAwMDA4IGNvdW50ZXJw
YXJ0KSBpbiBzdWNoIGEgY2FzZS4KPj4KPj4gTm90ZSB0aGF0IHdoaWxlIHRoZXJlJ3MgYSBzaW1p
bGFyIG92ZXJmbG93IGluIGludGVsX3hjX2NwdWlkX3BvbGljeSgpLAo+PiB0aGF0IG9uZSBpcyBi
ZWluZyBsZWZ0IGFsb25lIGZvciBub3cuCj4+Cj4+IE5vdGUgZnVydGhlciB0aGF0IHdoaWxlIGl0
IHdhcyBjb25zaWRlcmVkIHRvIHN1cHByZXNzIHRoZSBtdWx0aXBsaWNhdGlvbgo+PiBieSAyIGFs
dG9nZXRoZXIgaWYgdGhlIGhvc3QgdG9wb2xvZ3kgYWxyZWFkeSBwcm92aWRlcyBhdCBsZWFzdCBv
bmUgYml0Cj4+IG9mIHRocmVhZCBJRCB3aXRoaW4gQVBJQyBJRHMsIGl0IHdhcyBkZWNpZGVkIHRv
IGF2b2lkIG1vcmUgY2hhbmdlIGhlcmUKPj4gdGhhbiByZWFsbHkgbmVlZGVkIGF0IHRoaXMgcG9p
bnQuCj4+Cj4+IEFsc28gemFwIGxlYWYgNCAoYW5kIGF0IHRoZSBzYW1lIHRpbWUgbGVhZiAyKSBF
RFggb3V0cHV0IGZvciBBTUQsIGFzIGl0Cj4+IHNob3VsZCBoYXZlIGJlZW4gZnJvbSB0aGUgYmVn
aW5uaW5nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4+IC0tLQo+PiB2MjogRHJvcCB1c2Ugb2YgcGh5c2luZm8uIERyb3AgSW50ZWwtb25seSBs
ZWFmIDQgY2hhbmdlLiBJbmNyZW1lbnQKPj4gICAgIEFwaWNJZENvcmVTaXplIG9ubHkgd2hlbiBk
b3VibGluZyBOdW1iZXJPZkNvcmVzLgo+IFRoaW5raW5nIGFib3V0IGl0IHNvbWUgbW9yZSwgZHJv
cHBpbmcgdGhlIGxlYWYgNCBjaGFuZ2Ugc2VlbXMgYXQgbGVhc3QKPiBzb21ld2hhdCByaXNreSB0
byBtZS4gVGhpcyBiZWluZyBqdXN0IGEgNi1iaXQgZmllbGQgKGFuZCBlZmZlY3RpdmVseQo+IGFs
cmVhZHkgc2F0dXJhdGluZyBpbiBhIHdheSwgYXQgbGVhc3Qgd2hlbiBwb3dlci1vZi10d28gbWF4
aW11bSBjb3JlCj4gY291bnRzIGFyZSBpbnZvbHZlZCksIGFuZCBoZW5jZSB0aGVyZSBiZWluZyAy
IGJpdHMgb2YgInBsYXlpbmcgcm9vbSIKPiBiZXR3ZWVuIHRoaXMgYW5kIHRoZSBpbnZvbHZlZCBs
ZWFmIDEgZmllbGQsIHRoZSBjYWxjdWxhdGlvbiB0aGVyZSBub3QKPiBnZXR0aW5nIGFkanVzdGVk
IGlzIHN0aWxsIGEgbGF0ZW50IHJpc2sgaW1vIHdpdGggZ3Vlc3Qgc2lkZSBjYWxjdWxhdGlvbnMK
PiBsaWtlIHRoaXMgb25lCj4KPiAJc21wX251bV9zaWJsaW5ncyA9IHNtcF9udW1fc2libGluZ3Mg
LyBjLT54ODZfbWF4X2NvcmVzOwo+Cj4gZm91bmQgaW4gYmFzaWNhbGx5IGFsbCB2ZXJzaW9ucyBv
ZiBMaW51eCAod2hlcmUgY2VydGFpbiBmdW5jdGlvbnMsCj4gZS5nLiBhcGljX2lkX2lzX3ByaW1h
cnlfdGhyZWFkKCksIHdvbid0IGNvcGUgd2l0aCBzbXBfbnVtX3NpYmxpbmdzCj4gZW5kaW5nIHVw
IGFzIHplcm8sIHdoaWxlIG90aGVycywgZS5nLiB0b3BvbG9neV9zbXRfc3VwcG9ydGVkKCksIGRv
KS4KCk5vbmUgb2YgdGhlc2UgYWRqdXN0bWVudHMgYXJlIGNvcnJlY3QuwqAgVGhlIHRvcG9sb2d5
IHNob3VsZCBiZQpjb25zdHJ1Y3RlZCBmcm9tIGZpcnN0IHByaW5jaXBsZXMuCgpXaGF0IG1hdHRl
cnMgaXMgaGF2aW5nIGFzIGZldyBhbHRlcmF0aW9ucyB0byB0aGUgYWxnb3JpdGhtIGFzIG5lY2Vz
c2FyeSwKdW50aWwgd2UgY2FuIGZpeCB0aGUgbWFueSB0b29sc3RhY2sgc2lkZSBpc3N1ZXMuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

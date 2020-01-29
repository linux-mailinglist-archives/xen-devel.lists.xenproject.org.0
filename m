Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15CD14CDCE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 16:51:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwpZp-0005WK-M6; Wed, 29 Jan 2020 15:48:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SEwJ=3S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iwpZo-0005WF-E0
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 15:48:24 +0000
X-Inumbo-ID: c7a2dc86-42ae-11ea-a933-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7a2dc86-42ae-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580312904;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=oOYNyaLYNCUWRjDFqzv4U5NK/8cw60j1H3rdlL+gNog=;
 b=KvcmZaVnbjmToDYWbDdB3adzrzZcIlJS6zGcWOLvBjYkwDWXe8CVDFlX
 9cNfLrEn8IHYDaVbektseRTWUG6MOHbeQime6hBTjL0m1bx9pxv16teys
 bTOParBldVx/Ei9ZAZqjsmTyzXNpB+NNixg0dK9AH4c6H+KePgo0ZPFjq c=;
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
IronPort-SDR: a990cvuHN2e0qVpi8ROzBlBFJjgwjkkwXj3UGLtODl9Xf8l62KDx0L2VW67V8IRUw88RKZM4pX
 xq7MAsKPXb5DwkC/zLVqJWswDzog9W/ufwuiKLnEo9buCFG2VYqc++eJU3774IIeludWxXIvw6
 Um4h27Hc1aPvteJXaIo8NTxGmWG5iuafzi3jVUI2wcR7lM42iEjdtexvJSgB2q4g1bIXPaKKyj
 WOJfRdahKz2NiULJdk//mhMjDJUpLhIOaN7uLm6fE/jzPsax+SLfBO/kx0ULlnUMP+BFOA0yCU
 QdQ=
X-SBRS: 2.7
X-MesageID: 11637861
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,378,1574139600"; d="scan'208";a="11637861"
To: Daniel Smith <dpsmith.dev@gmail.com>, <xen-devel@lists.xenproject.org>
References: <CADAP9AWn3EbeWoiqpXj7==VEJR0HVfjYJOPrL4mm4ny8wQ3_Eg@mail.gmail.com-0>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a8750faf-1d87-bef8-2fff-d1e846b19016@citrix.com>
Date: Wed, 29 Jan 2020 15:48:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADAP9AWn3EbeWoiqpXj7==VEJR0HVfjYJOPrL4mm4ny8wQ3_Eg@mail.gmail.com-0>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Notes from December 2019 Xen F2F in Cambridge
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDEvMjAyMCAwMDozNiwgRGFuaWVsIFNtaXRoIHdyb3RlOgo+ICMjIyBEaXNjdXNzaW9u
Cj4KPiBSZXF1ZXN0ZWQ6IGFuIGluLVhlbi10cmVlIHJlZmVyZW5jZSBkb21CIGltcGxlbWVudGF0
aW9uCj4KPiBOb3RlOiB0aGUgaHlwZXJ2aXNvciBpbnRlcmZhY2Ugc3VwcG9ydHMgc3RhcnRpbmcg
YSBkb21haW4gd2l0aCBhCj4gc3BlY2lmaWVkIGRvbWlkLiBUaGlzIGlzIG5vdCBtYWRlIGF2YWls
YWJsZSBieSB0aGUgbGlieGwgdG9vbHN0YWNrLgo+Cj4gWGVuIGhhcyBsb2dpYyBvbiBwZXJtaXNz
aW9uIGRlbGVnYXRpb246Cj4KPiAtICAgaW4gb3JkZXIgZm9yIGEgVk0gdG8gYmUgYWJsZSB0byBk
ZWxlZ2F0ZSBhIHBlcm1pc3Npb24gdG8gYW5vdGhlciwgaXQKPiAgICAgaXRzZWxmIG11c3QgaGF2
ZSB0aGF0IHBlcm1pc3Npb24uCj4KPiAgICAgLSAgICoqQUNUSU9OKio6IGNoYW5nZSB0aGlzIHRv
IGJlIGltcGxlbWVudGVkIGFzIGEgWFNNIGhvb2ssIHNvIHRoYXQKPiAgICAgICAgID4gcG9saWN5
IGNhbiBjaG9vc2UgdG8gb3ZlcnJpZGUgdGhpcyBjb25zdHJhaW50LCB3aGlsZQo+ICAgICAgICAg
PiBwcmVzZXJ2aW5nIGl0IChpZS4gdGhlIGV4aXN0aW5nIGJlaGF2aW91cikgYXMgdGhlIGRlZmF1
bHQuCgpJIHRoaW5rIGl0IGlzIHdvcnRoIGhpZ2hsaWdodGluZyB0aGF0IFhlbidzIGN1cnJlbnQg
YmVoYXZpb3VyIGFwcGVhcnMgdG8KaGF2ZSByZWdyZXNzZWQgYW4gb2xkZXIgdXNlY2FzZSBhY2Np
ZGVudGFsbHksIGFuZCB0aGlzIHByb3Bvc2VkIGFwcHJvYWNoCmlzIGNsb3NlIHRvIHRoZSBvcmln
aW5hbCBpZGVhIGZvciBod2RvbS4KCj4gVGhlIGRvbWFpbiBpZCB0byBhc3NpZ24gdG8gZG9tQjog
c2hvdWxkIG5vdCBiZSB6ZXJvLgo+Cj4gLSAgIFJlY29tbWVuZGF0aW9uIGlzIHRvIHVzZSBhIG5l
dyBmaXhlZCBkb21haW4gaWQgYWxsb2NhdGVkIGZyb20gdGhlCj4gICAgIHJlc2VydmVkIHJhbmdl
Lgo+Cj4gICAgIC0gICBTZWUgRE9NSURcX0lETEUsIERPTUlEXF9JTlZBTElELCBldGMgaW4gXDx4
ZW4uaFw+Cj4KPiBUaGUgaXNcX2hhcmR3YXJlXF9kb21haW4gcHJlZGljYXRlCj4KPiAtICAgdXNl
cyB3aXRoaW4gWGVuIG5vdCBuZWNlc3NhcmlseSBhbGwgY29uc2lzdGVudD8KCkkgdGhpbmsgdGhl
IGN1cnJlbnQgdXNlcyBvZiBpc197aGFyZHdhcmUsY29udHJvbH1fZG9tYWluKCkgc2hvdWxkIGJl
Cm9rLsKgIFdlJ3ZlIGJlZW4gZmFpcmx5IGNhcmVmdWwgc2luY2UgdGhlIHNlcGFyYXRlIGh3ZG9t
IGxvZ2ljIGZpcnN0IHdlbnQgaW4uCgo+IC0gICBjb252ZXJ0IHRoaXMgdG8gYSBYU00gaG9vaz8K
Pgo+ICAgICAtICAgKioqdG8gYmUgZGV0ZXJtaW5lZCoqKjogcGVyZm9ybWFuY2UgaW1wYWN0IHNp
bmNlIGhpdHMgdGhlIGF2Yz8KCldoYXQgY2hhbmdlcyBpbiBhICJldmVuIHRoZSBYU00gZHVtbXkg
cG9saWN5IGlzIGFjdHVhbGx5IGEgZmxhc2sgcG9saWN5Igp3b3JsZCBpcyB0aGF0IHRoZXJlIGlz
IHRoYXQgdGhlIGNvbmNlcHQgb2YgInRoZSBoYXJkd2FyZS9jb250cm9sIGRvbWFpbiIKYmx1cnMu
wqAgSXRzIGFsbCBzdHJpY3RseSAiY2FuICRET00gZG8gJFg/Ii4KClRoYXQgc2FpZCwgd2hpbGUg
InRoZSIgY29udHJvbCBkb21haW4gY2FuIHByb2JhYmx5IGRpc2FwcGVhciwgInRoZSIKaGFyZHdh
cmUgZG9tYWluIHByb2JhYmx5IGNhbid0LsKgIFRoZXJlIG5lZWRzIHRvIGJlIHNvbWUgZW50aXR5
CnJlc3BvbnNpYmxlIGZvciBhdCBsZWFzdCwgZ2V0dGluZyBub3RpZmljYXRpb25zIG9mIG5ld2x5
IGhvdHBsdWdnZWQKaGFyZHdhcmUuCgo+Cj4gTmVlZCB0byBub3Qgc2h1dCBkb3duIHRoZSBwbGF0
Zm9ybSB3aGVuIGRvbUIgZXhpdHMKPgo+IC0gICBpZS4gZGlzdGluZ3Vpc2ggZG9tQiBmcm9tIHRo
ZSBoYXJkd2FyZSBkb21haW4KPgo+IFNpbmNlIHRoZSBoeXBlcnZpc29yIEFCSSBpcyB1bnN0YWJs
ZSwgc3BlY2lmaWNhbGx5IHRoZSBkb21haW4gYnVpbGRpbmcKPiBoeXBlcmNhbGxzLCB3aWxsIG5l
ZWQgdG8gdXNlIHRoZSBYZW4gdG9vbHN0YWNrOgo+Cj4gLSAgIHNvIGxpYnhjL2xpYnhsIGlzIHRo
ZSByaWdodCBpbnRlcmZhY2UgZm9yIGluaXRpYWwgZG9tQiBkb21haW4gbG9naWMKPiAgICAgdG8g
dXNlCj4KPiAgICAgLSAgIG90aGVyd2lzZSBwcm9ibGVtYXRpYyB3aGVuIFhlbiBoeXBlcnZpc29y
IHZlcnNpb24gaXMgY2hhbmdlZAo+Cj4gICAgIC0gICBpbiB0aGUgbmVhciB0ZXJtLCB0aGlzIG1h
bmRhdGVzIHRoZSB1c2Ugb2YgTGludXggKyB0b29sc3RhY2sKClRoaXMgYXNwZWN0IGlzIGJlaW5n
IHdvcmtlZCBvbiBmb3IgcGxlbnR5IG9mIG90aGVyIGdvb2QgcmVhc29ucy4KCldpdGggYW55IGx1
Y2ssIGl0IHdpbGwgYmUgaW4gcHJvY2VzcyBieSB0aGUgdGltZSBkb21CIHdhbnRzIHRvIGdldAph
cm91bmQgdG8gdXNpbmcgaXQuCgo+ICMjIyBEZWNpc2lvbjoKPgo+IHVzZSBmdWxsIExpbnV4IHdp
dGhpbiBkb21CIGFzIHN0YXJ0aW5nIHBvaW50Cj4KPiAtICAgdW5pa3JhZnQgZGlzY3Vzc2VkLCBu
b3Qgc2VsZWN0ZWQ6IGlzIG5vdCBkZXBsb3llZCBpbiBwcm9kdWN0aW9uIGFuZAo+ICAgICB3YW50
IHRvIHVzZSBtYXR1cmUsIFFBXCdkIGFuZCBleHRlcm5hbGx5IG1haW50YWluZWQgY29tcG9uZW50
cwo+IC0gICAzMk1CIHNpemUgZm9yIHRoZSBrZXJuZWwgcXVlcmllZDogcHJvcG9zZXJzIGhhdmUg
bm8gaXNzdWUgd2l0aCB0aGF0Cj4gICAgIHNpemUKPgo+IFJlcXVlc3QgbWFkZSBmb3IgYSBzY3Jp
cHQgaW50ZXJwcmV0ZXIgaW4gYW4gZXhhbXBsZSBkb21CLCB3aXRoIHNjcmlwdHMKPiB0byBzdGFy
dCBkb20wIHdpdGggYSBnaXZlbiBzZXQgb2YgcGVybWlzc2lvbnMKPgo+IC0gICBhaW0gaXMgdG8g
bWFrZSBkb21CIHVzYWJsZSBmb3Igb3RoZXIgcGVvcGxlXCdzIHVzZSBjYXNlcyBhbmQgd2lkZW4K
PiAgICAgYWRvcHRpb24sIGhlbHAgb3RoZXIgcGVvcGxlIHdpdGggd2hhdCB3ZSBidWlsZCBmb3Ig
ZG9tQgoKSSB0aGluayB0aGUgcG9pbnQgd2FzIHRoYXQgdGhlIGZpcnN0IHJlZmVyZW5jZSBkb21C
IG91Z2h0IHRvIGJlCnNvbWV0aGluZyBmYWlybHkgZmFtaWxpYXIgYW5kIGVhc2lseSB0d2Vhay1h
YmxlLsKgIEluIHBhcnRpY3VsYXIsIHRoYXQKcmVkdWNlcyB0aGUgcXVhbnRpdHkgb2YgY29uY3Vy
cmVudCB3b3JrIHRvIGRvIHdoaWxlIGdldHRpbmcgdGhlCmh5cGVydmlzb3IgcGllY2VzIGluIHBs
YWNlLgoKSG93ZXZlciwgSSB0aGluayBpdCB3b3VsZCBhbHNvIGJlIGhlbHBmdWwgb2Ygc3RhdGlu
ZyB0aGUgZXZlbnR1YWwgZGVzaWduCmdvYWxzLCB0byBrZWVwIHRoZSBtaWNyb2tlcm5lbCBwbGFu
IGluIG1pbmQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

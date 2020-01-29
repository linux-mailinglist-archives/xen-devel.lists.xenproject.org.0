Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF2E14D01B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 19:07:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwrgl-0002f4-R3; Wed, 29 Jan 2020 18:03:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SEwJ=3S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iwrgl-0002ez-23
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 18:03:43 +0000
X-Inumbo-ID: aed4ce68-42c1-11ea-8940-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aed4ce68-42c1-11ea-8940-12813bfff9fa;
 Wed, 29 Jan 2020 18:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580321022;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Dsndr2QdSUZrNHuwDhpVjy9XUQkncyGI0f84iN9Mqwc=;
 b=cp2uuSepvbernFeCyncHho8gHhAwnWfF8BF/DPBQKcBUoibvpcsRvg0n
 JkPdmRP9Lb1WdpOmQSfl8oLfdgs2LS9x9nCdfDIi7Fhh64dwLqHW6mSfG
 ChVFqMvXNf8Lu3R07VWCA+urWO2bVHGxsSDeEErKG8JorNKZhWI0oeMvP U=;
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
IronPort-SDR: ld6ZgkM94f1NU1BzZzVxiqxSQBKA8ahgmbICwpKiUtcAlajEVkRp9T5ZuZRh9Tg6nlhRNVCtfC
 ZhWZKlRdfKN618dDqImx2D8pSE0hMNBwgfFPxYqO5yDZG7yq8F8tpmtHfH26M8E7rJdgVqB+Ea
 NvdL5V/9TzeeMNZJ/0d6egjKUlEeCiUzFqRwxPlwR4tNAvYw4vPm8+mbTIWBS5JLR4wko69MnM
 G3kMsV7acPIsWG9WgYB/z+Tq2RmVuq0z835hgLheHsglhe6KWgpeF1nU3upWaxdA3BSSA5EExf
 vko=
X-SBRS: 2.7
X-MesageID: 12243403
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,378,1574139600"; d="scan'208";a="12243403"
To: <xen-devel@lists.xenproject.org>, <pdurrant@amazon.com>
References: <20200129123618.1202-1-pdurrant@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d6347fd0-19f7-f2ba-517d-4c7c794239c5@citrix.com>
Date: Wed, 29 Jan 2020 18:03:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200129123618.1202-1-pdurrant@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.14 Development Update
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
Cc: roger.pau@citrix.com, luwei.kang@intel.com, marmarek@invisiblethingslab.com,
 dwmw@amazon.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDEvMjAyMCAxMjozNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID0gUHJvamVjdHMgPQo+
Cj4gPT0gSHlwZXJ2aXNvciA9PSAKPgo+ID09PSB4ODYgPT09IAo+Cj4gKiAgSW50ZWwgUHJvY2Vz
c29yIFRyYWNlIHZpcnR1YWxpemF0aW9uIGVuYWJsaW5nICh2MSkKPiAgIC0gIEx1d2VpIEthbmcK
Ckhhc24ndCBzZWVuIGFueSBhY3Rpdml0eSBpbiBzZXZlcmFsIHJlbGVhc2VzLsKgIFByb2JhYmx5
IHNhZmUgdG8gZHJvcC7CoApBbHNvIGF0IGxlYXN0IHNvbWV3aGF0IGVudGFuZ2xlZCB3aXRoIENQ
VUlEL01TUiBzdXBwb3J0LgoKPiAqICBGaXhlcyB0byAjREIgaW5qZWN0aW9uCj4gICAtICBBbmRy
ZXcgQ29vcGVyCgpQYXJ0cyBvZiB0aGlzIG1hbmlmZXN0ZWQgdW5leHBlY3RlZCBhcyBYU0EtMzA4
LsKgIFJlc3QgaXMgc3RpbGwgd29yayBpbgpwcm9ncmVzcywgd2l0aCBhIFRPRE8gb2YgaG93IG5v
dCB0byBicmVhayBpbnRyb3NwZWN0aW9uIHdoaWxlIGZpeGluZwppdC7CoCBVbmxpa2VseSB0byBz
ZWUgYW55IG1vdmVtZW50IGluIHRoZSBzaG9ydCB0ZXJtLgoKPiAqICBDUFVJRC9NU1IgWGVuL3Rv
b2xzdGFjayBpbXByb3ZlbWVudHMKPiAgIC0gIEFuZHJldyBDb29wZXIKClZlcnkgbXVjaCBpbiBw
cm9ncmVzcy4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDIwMDEyNzE0MzQ0
NC4yNTUzOC0xLWFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20vCmlzIHYyIG9mIHRoZSAibW92ZSBk
YXRhIGludG8gdGhlIG1pZ3JhdGlvbiBzdHJlYW0iIGFzcGVjdC4KCkknbSB3b3JraW5nIG9uICJy
ZXdvcmsgYm9vdCB0aW1lIENQVUlEIGhhbmRsaW5nIiByaWdodCBub3csIHdoaWNoIHdpbGwKdWx0
aW1hdGVseSBhbGxvdyBNU1JzIHRvIGJlIGluY2x1ZGVkIGluIHdoYXQgZ2V0cyBjb25maWd1cmVk
LgoKQWxsIG9mIHRoaXMgZm9ybXMgYSBiYXNlIGZvciAiVmlydHVhbGlzZSBNU1JfQVJDSF9DQVBT
IGZvciBndWVzdHMiIHdoaWNoCmlzIChub3cpIHRoZSBsb2dpY2FsIGdvYWwgb2YgdGhlIHdvcmss
IGFuZCBtaWdodCBiZSBhIGJldHRlciB0cmFja2luZyBuYW1lLgoKSW4gcmVhbGl0eSwgZm9yIG5v
dyBJIG1lYW4gb25seSB0aGUgdmFyaW91cyAqX05PIGJpdHMgYmVjYXVzZSAuLi4KCj4gKiAgZUlC
UlMKPiAgIC0gIEFuZHJldyBDb29wZXIKCi4uLiBpdCBpcyB1bmZvcnR1bmF0ZWx5IHF1aXRlIHRh
bmdsZWQgb24gdG9wLsKgIEJlY2F1c2Ugb2YgdGhlIG92ZXJsb2FkZWQKbmF0dXJlIG9mIElCUlMs
IGV2ZW4gaGF2aW5nIFhlbiB0cnkgdG8gdXNlIGVJQlJTIHdoaWxlIG9ubHkgc3VwcG9ydGluZwp0
aGUgbGVnYWN5IElCUlMgaW50ZXJmYWNlIGZvciBndWVzdHMgdHVybnMgaW50byBhIG1hc3NpdmUg
aGVhZGFjaGUuCgpJJ20gZmFpcmx5IGNvbmZpZGVudCB0aGF0IGVJQlJTIHN1cHBvcnQgc2hvdWxk
bid0IGJlIGF0dGVtcHRlZCB1bnRpbApnZW5lcmFsIE1TUl9BUkNIX0NBUFMgaXMgaW4gcGxhY2Uu
Cgo+ICogIEltcHJvdmVtZW50cyB0byBkb21haW5fY3Jhc2goKQo+ICAgLSAgQW5kcmV3IENvb3Bl
cgoKVGhpcyBpcyBhIGZhaXJseSBzbWFsbCBwaWVjZSBvZiB3b3JrLCBidXQgSSBkb24ndCBoYXZl
IHRpbWUgdG8gcHJvZ3Jlc3MKaXQuwqAgSSd2ZSBnb3QgYSByZWJhc2VkIGJyYW5jaCBpZiBhbnlv
bmUgZWxzZSBmZWVscyBsaWtlIHNwZW5kaW5nIHRoZQpkYXkgb3Igc28gaXQgd2lsbCB0YWtlIHRv
IGdldCB1cCB0byBxdWFsaXR5LgoKQW5vdGhlciB0YXNrIGlzIEFNRCBoYXJkd2FyZSBtaXRpZ2F0
aW9ucyBmb3IgZXZlcnl0aGluZwpTcGVjdWxhdGl2ZVN0b3JlQnlwYXNzIChpLmUuIHByZS1MMVRG
KSBhbmQgbGF0ZXIuwqAgVGhlcmUgYXJlIGNyaXBwbGluZwpwZXJmb3JtYW5jZSBwcm9ibGVtcyBj
YXVzZWQgYnkgdGhlIGxhY2sgb2YgTVNSX1ZJUlRfU1BFQ19DVFJMLsKgIFNpbmNlCnRoYXQgc2Vy
aWVzIEkgcG9zdGVkIGZvciB0aGF0LCBSb21lIGhhcyBnYWluZWQgc2V2ZXJhbCBvdGhlciBoYXJk
d2FyZQpmZWF0dXJlcyB3aGljaCBuZWVkIGV4cG9zaW5nIHRvIGd1ZXN0cyBzdWl0YWJseS4KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

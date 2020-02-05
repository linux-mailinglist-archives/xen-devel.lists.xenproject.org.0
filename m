Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16F115296B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 11:50:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIDP-0007G9-LR; Wed, 05 Feb 2020 10:47:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jt5G=3Z=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1izIDO-0007G4-4V
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 10:47:26 +0000
X-Inumbo-ID: e502e3c4-4804-11ea-90c6-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e502e3c4-4804-11ea-90c6-12813bfff9fa;
 Wed, 05 Feb 2020 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580899646;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MBG/bzfh9uWRTdrtwaUZnuqkSH7HMXCgCLATK5f6TNg=;
 b=JGzuRN8QWMpWJJheeawyVts/wzm+Y/LMHqfVKzGNKor4VPOT31GeLepR
 mqWTwavH1yPoOzG8aMD8arS0O124GUTBRQWLpXlfc5JJRuiPNYddYLxlC
 N2GPQYBElVKr0r3Yb0jzmpW8e66XpAyCHl0yw2Nmz2tr+PaXVBiGgTlgs 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kwM635AaEpHnMqqBYUr8H6mzBIpAMfgsUrBGTUj5aQ7eB9LuZo3n0pvIy0s46yWqTvCTR5yj1v
 aIVbiXc5nTU76IZbF5pMfHUjZ0dNvPa5Mcv2qfHamRpyeWu2AHOSNCHiUX4Y+Nre/gRswavlKG
 ZYJS8HkQDvfUGjwVgY988l2MZTX7Rg/+IGUTNNNqrvZqnxDMx7yC+/aJI4cs4+2bgscPx+l63/
 YU0IvyOCq/HHC6E7wQmJ7qzTzO8ESjJ0K2MHpDuTp90VZdDIWc4/VVOXkVQzZjzXaChNSzOVfL
 cL0=
X-SBRS: 2.7
X-MesageID: 11968843
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,405,1574139600"; d="scan'208";a="11968843"
Date: Wed, 5 Feb 2020 10:47:16 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200205104716.GA85066@perard.uk.xensource.com>
References: <20200205093724.2854-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205093724.2854-1-pdurrant@amazon.com>
Subject: Re: [Xen-devel] [PATCH] libxl: fix assertion failure in stub domain
 creation
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDk6Mzc6MjRBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEFuIGFzc2VydGlvbiBpbiBsaWJ4bF9fZG9tYWluX21ha2UoKToKPiAKPiAnc29mdF9y
ZXNldCB8fCAqZG9taWQgPT0gSU5WQUxJRF9ET01JRCcKPiAKPiBkb2VzIG5vdCBob2xkIHRydWUg
Zm9yIHN0dWIgZG9tYWluIGNyZWF0aW9uLCB3aGVyZSBzb2Z0X3Jlc2V0IGlzIGZhbHNlCj4gYnV0
IHRoZSBwYXNzZWQgaW4gZG9taWQgPT0gMC4gVGhpcyBpcyBlYXNpbHkgZml4ZWQgYnkgY2hhbmdp
bmcgdGhlCj4gaW5pdGlhbGl6ZXIgaW4gbGlieGxfX3NwYXduX3N0dWJfZG0oKS4KPiAKPiBGaXhl
czogNzUyNTkyMzlkODVkICgibGlieGxfY3JlYXRlOiBtYWtlICdzb2Z0IHJlc2V0JyBleHBsaWNp
dCIpCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+
IC0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF9kbS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfZG0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiBpbmRleCBmNzU4ZGFmM2I2
Li4zYjFkYTkwMTY3IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiArKysg
Yi90b29scy9saWJ4bC9saWJ4bF9kbS5jCj4gQEAgLTIxMjcsNyArMjEyNyw3IEBAIHZvaWQgbGli
eGxfX3NwYXduX3N0dWJfZG0obGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fc3R1Yl9kbV9zcGF3bl9z
dGF0ZSAqc2RzcykKPiAgICAgICAgICBnb3RvIG91dDsKPiAgICAgIH0KPiAgCj4gLSAgICBzZHNz
LT5wdnFlbXUuZ3Vlc3RfZG9taWQgPSAwOwo+ICsgICAgc2Rzcy0+cHZxZW11Lmd1ZXN0X2RvbWlk
ID0gSU5WQUxJRF9ET01JRDsKCkhvdyB0aGlzIHdvcmtzPyBJTlZBTElEX0RPTUlEIHNlZW1zIHRv
IGJlIGRpcmVjdGx5IGZlZWQgdG8KeGNfZG9tYWluX2NyZWF0ZSgpLCB3aGljaCBpcyB1c2luZyBY
RU5fRE9NQ1RMX2NyZWF0ZWRvbWFpbi4KQnV0IGEgY29tbWVudCBpbiBkb21jdGwuaCBmb3IgWEVO
X0RPTUNUTF9jcmVhdGVkb21haW4gcmVhZDoKICAgIE5CLiB4ZW5fZG9tY3RsLmRvbWFpbiBpcyBh
biBJTi9PVVQgcGFyYW1ldGVyIGZvciB0aGlzIG9wZXJhdGlvbi4KICAgIElmIGl0IGlzIHNwZWNp
ZmllZCBhcyB6ZXJvLCBhbiBpZCBpcyBhdXRvLWFsbG9jYXRlZCBhbmQgcmV0dXJuZWQuClNvLCBp
cyB4Y19kb21haW5fY3JlYXRlIGdvaW5nIHRvIGNyZWF0ZSBhIG5ldyBkb21haW4gd2l0aApkb21p
ZD09SU5WQUxJRF9ET01JRD8KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

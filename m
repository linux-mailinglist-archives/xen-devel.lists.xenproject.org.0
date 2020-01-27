Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A4814A405
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 13:38:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw3cx-00079Q-OX; Mon, 27 Jan 2020 12:36:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ocL+=3Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iw3cw-00079J-RI
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 12:36:26 +0000
X-Inumbo-ID: a1f7da08-4101-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1f7da08-4101-11ea-b833-bc764e2007e4;
 Mon, 27 Jan 2020 12:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580128586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l9HEk0N6HvaEVddoPYRgucQLtkA9lmbo5PZ0W4wvjUk=;
 b=FkxevGmeplzxQTn8tfYGYFSk/QlHL6E97SX9pJbc9oXUiRNA4hZ3028b
 yCuJNoPTVHR1zrqEpPmvmbGB7LnhAGzrtBgWNglWbKUVn6F04Ftb0p5GZ
 YKJ671N7kF5gfGUHn5tb0oqfdUXE/icfzDNwH7Lr3xGTuS89ugw5/boET A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SQa95TvAOI5zR/u6BhOVUazQVjXEo4HUl18LnkgONuitDr6hsj0rezhYw1MW085LtwrjjZlfBG
 gh5lmWaLGxwRiuWtzV/S2PW61c1Lp7l7t53ibDIpQVA6n3o5H3bmcso3OiCvcnn8n46WqcGDci
 Nvrj17O5jEtqcrQnqTahhdoTu9VDxufwMYnRKhPY9E0EZGUji4UyP6kCrBSgtAVskdr0ozV5cX
 t2XHTj7fuVHm6aINRM8vX73Icfx3XeYyVrPisnFTjHHmY1JfS2oHSvgXoiJ6rPsDbLpPJM7Kch
 Z9c=
X-SBRS: 2.7
X-MesageID: 12085806
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,369,1574139600"; d="scan'208";a="12085806"
Date: Mon, 27 Jan 2020 12:36:23 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200127123623.GL1288@perard.uk.xensource.com>
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
 <20200120115217.GF1288@perard.uk.xensource.com>
 <20200127123021.gqxdbe2vv4tylf5l@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127123021.gqxdbe2vv4tylf5l@debian>
Subject: Re: [Xen-devel] [XEN PATCH 0/3] Default to python3
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
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMTI6MzA6MjFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEphbiAyMCwgMjAyMCBhdCAxMTo1MjoxN0FNICswMDAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDIwLCAyMDIwIGF0IDExOjUwOjUwQU0gKzAwMDAsIEFu
dGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBQYXRjaCBzZXJpZXMgYXZhaWxhYmxlIGluIHRoaXMg
Z2l0IGJyYW5jaDoKPiA+ID4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAvcGVvcGxl
L2FwZXJhcmQveGVuLXVuc3RhYmxlLmdpdCBici5weXRob24zLWRlZmF1bHQtdjEKPiA+ID4gCj4g
PiA+IEhpLAo+ID4gPiAKPiA+ID4gSSB0aGluayBpdCdzIHRpbWUgZm9yIFhlbiB0byBidWlsZCB3
aXRoIHB5dGhvbjMgYnkgZGVmYXVsdC4KPiA+ID4gCj4gPiA+IFRoZSBtYWluIHJlYXNvbiBmb3Ig
dGhhdCBpcyB0aGF0IFFFTVUgdXBzdHJlYW0gZG9uJ3QgYnVpbGQgd2l0aCBweXRob24gMi54Cj4g
PiA+IGFueW1vcmUsIGFuZCB0aGUgcHl0aG9uIGJpbmFyeSBzZWxlY3RlZCBieSBYZW4gYnVpbGQg
c3lzdGVtIGlzIHRoZSBvbmUgdXNlZAo+ID4gPiB3aGVuIGJ1aWxkaW5nIHFlbXUteGVuLiBTbyBu
b3cgb3NzdGVzdCBmYWlsZWQgdG8gYnVpbGQgUUVNVSB1cHN0cmVhbS4KPiA+ID4gCj4gPiA+IEFs
c28sIHB5dGhvbjIgaXMgRU9MLgo+ID4gPiAKPiA+ID4gRllJLCB0aGUgaHlwZXJ2aXNvciBidWls
ZCBzeXN0ZW0gYWxyZWFkeSBzZWxlY3QgcHl0aG9uMyBieSBkZWZhdWx0LCB0aGlzIGNoYW5nZQo+
ID4gPiB0aGUgdG9vbHMgc2lkZS4KPiA+IAo+ID4gSSBmb3Jnb3QgdG8gc2F5IHRoYXQgdGhlcmUn
cyBhIG9zc3Rlc3QgcGF0Y2ggYXMgd2VsbDoKPiA+IFtPU1NURVNUIFBBVENIXSB0cy14ZW4tYnVp
bGQtcHJlcDogSW5zdGFsbCBweXRob24zLWRldgo+IAo+IEFJVUkgSSBkb24ndCBuZWVkIHRvIHdh
aXQgZm9yIHRoYXQgcGF0Y2ggdG8gYmUgYXBwbGllZCBiZWZvcmUgYXBwbHlpbmcKPiB0aGlzIHNl
cmllcy4gTGV0IG1lIGtub3cgaWYgSSdtIHdyb25nLgoKSXQganVzdCBnb2luZyB0byBwcmV2ZW50
IGEgcHVzaCA6LSkuIEFsbCBidWlsZCBvZiBzdGFnaW5nIHdpbGwgZmFpbC4gU28sCnRoZSBvc3N0
ZXN0IHBhdGNoIGlzIG5lZWRlZCBiZWZvcmUgYXBwbHlpbmcgdGhlIHBhdGNoIDMvMy4KCkNoZWVy
cywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

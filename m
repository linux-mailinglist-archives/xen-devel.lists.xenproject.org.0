Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B960B7E0F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 17:22:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAyCg-0006JB-MB; Thu, 19 Sep 2019 15:18:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Iqgf=XO=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iAyCe-0006Iz-8o
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 15:18:40 +0000
X-Inumbo-ID: c17c255e-daf0-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c17c255e-daf0-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568906320;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ofOA4TGnbb8UJilHeyn81wf5MfaMmUjRfAUQhJaP63w=;
 b=LbwdzRPWNYcrvRWlr/mrvb93b/8wzKgCJWrrdoB8oFxNIuERB+KB4lvm
 AlYhK9p+Y7I3B6PRHMzy609DL9/thmcIe84lYjqPgEiOhE3YLtf2oOf1i
 W+bcFEBosQ6gnJoRCVktrl07i9rosJPGf+MnDpc8m6bvu/54fF2p+4PGX w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xfZzE35ZJPv8Zsre8ZiQtr/qtZuMx+mi9wTXRPKPgOKWbXZkr1WhphN3RX95dE0tLRoxajJYvm
 +zOF235wIadLPhmJ3Rk+FGlVH6EqG5mCMmBgu2OJDU4MuamJ/vaxQChn82JnlcV9W2f/ngR25t
 9rYn8XaO9SOuu3hWy9VWwWCQvfj+ebJimXjVqaNZ+Ep16/mzU4aMXFFcHWrEwXfb9QzbnA7Ia9
 BSD1ASNqHSub4ZVqvXxQGjt+KsNqfTeu/o4bLfG8DtCrvZD4DX2eCY1LE/PPbxxspKHNf78kc5
 EwI=
X-SBRS: 2.7
X-MesageID: 5856041
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5856041"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-8-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <23d23d1d-efe7-9525-723e-42f944cfc55d@citrix.com>
Date: Thu, 19 Sep 2019 16:18:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916105945.93632-8-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 07/12] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMTo1OSBBTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gTGl2ZXBh
dGNoIG9ubHkgdHJhY2tzIGFuIGVudGlyZSBwYXlsb2FkIGFwcGxpZWQvcmV2ZXJ0ZWQgc3RhdGUu
IEJ1dCwKPiB3aXRoIGFuIG9wdGlvbiB0byBzdXBwbHkgdGhlIGFwcGx5X3BheWxvYWQoKSBhbmQv
b3IgcmV2ZXJ0X3BheWxvYWQoKQo+IGZ1bmN0aW9ucyBhcyBvcHRpb25hbCBob29rcywgaXQgYmVj
b21lcyBwb3NzaWJsZSB0byBpbnRlcm1peCB0aGUKPiBleGVjdXRpb24gb2YgdGhlIG9yaWdpbmFs
IGFwcGx5X3BheWxvYWQoKS9yZXZlcnRfcGF5bG9hZCgpIGZ1bmN0aW9ucwo+IHdpdGggdGhlaXIg
ZHluYW1pY2FsbHkgc3VwcGxpZWQgY291bnRlcnBhcnRzLgo+IEl0IGlzIGltcG9ydGFudCB0aGVu
IHRvIHRyYWNrIHRoZSBjdXJyZW50IHN0YXRlIG9mIGV2ZXJ5IGZ1bmN0aW9uCj4gYmVpbmcgcGF0
Y2hlZCBhbmQgcHJldmVudCBzaXR1YXRpb25zIG9mIHVuaW50ZW50aW9uYWwgZG91YmxlLWFwcGx5
Cj4gb3IgdW5hcHBsaWVkIHJldmVydC4KPiAKPiBUbyBzdXBwb3J0IHRoYXQsIGl0IGlzIG5lY2Vz
c2FyeSB0byBleHRlbmQgcHVibGljIGludGVyZmFjZSBvZiB0aGUKPiBsaXZlcGF0Y2guIFRoZSBz
dHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgZ2V0cyBhZGRpdGlvbmFsIGZpZWxkIGhvbGRpbmcKPiB0aGUg
YXBwbGllZC9yZXZlcnRlZCBzdGF0ZSBtYXJrZXIuCj4gCj4gVG8gcmVmbGVjdCB0aGUgbGl2ZXBh
dGNoIHBheWxvYWQgQUJJIGNoYW5nZSwgYnVtcCB0aGUgdmVyc2lvbiBmbGFnCj4gTElWRVBBVENI
X1BBWUxPQURfVkVSU0lPTiB1cCB0byAyLgo+IAo+IFtBbmQgYWxzbyB1cGRhdGUgdGhlIHRvcCBv
ZiB0aGUgZGVzaWduIGRvY3VtZW50XQo+IApzbmlwPiBAQCAtODM0LDYgKzgzOSw4IEBAIHN0cnVj
dCBsaXZlcGF0Y2hfZnVuYyB7Cj4gICAgICAgdWludDMyX3Qgb2xkX3NpemU7Cj4gICAgICAgdWlu
dDhfdCB2ZXJzaW9uOyAgICAgICAgLyogTVVTVCBiZSBMSVZFUEFUQ0hfUEFZTE9BRF9WRVJTSU9O
LiAqLwo+ICAgICAgIHVpbnQ4X3Qgb3BhcXVlWzMxXTsKPiArICAgIHVpbnQ4X3QgYXBwbGllZDsK
PiArICAgIHVpbnQ4X3QgX3BhZFs3XTsKPiAgIH07Cj4gICB0eXBlZGVmIHN0cnVjdCBsaXZlcGF0
Y2hfZnVuYyBsaXZlcGF0Y2hfZnVuY190Owo+ICAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi9saXZlcGF0Y2guaCBiL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2guaAo+IGlu
ZGV4IDJhZWM1MzJlZTIuLjI4Zjk1MzY3NzYgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L2xpdmVwYXRjaC5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oCj4gQEAgLTEw
OSw2ICsxMDksMzEgQEAgc3RhdGljIGlubGluZSBpbnQgbGl2ZXBhdGNoX3ZlcmlmeV9kaXN0YW5j
ZShjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgKmZ1bmMpCj4gICAKPiAgICAgICByZXR1cm4g
MDsKPiAgIH0KPiArCj4gK3N0YXRpYyBpbmxpbmUgYm9vbF90IGlzX2Z1bmNfYXBwbGllZChjb25z
dCBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgKmZ1bmMpCgpVc2UgYm9vbCByYXRoZXIgdGhhbiBib29s
X3QgKHRocm91Z2hvdXQgdGhlIHBhdGNoKS4KCj4gK3sKPiArICAgIGlmICggZnVuYy0+YXBwbGll
ZCA9PSBMSVZFUEFUQ0hfRlVOQ19BUFBMSUVEICkKPiArICAgIHsKPiArICAgICAgICBwcmludGso
WEVOTE9HX1dBUk5JTkcgTElWRVBBVENIICIlczogJXMgaGFzIGJlZW4gYWxyZWFkeSBhcHBsaWVk
IGJlZm9yZVxuIiwKPiArICAgICAgICAgICAgICAgIF9fZnVuY19fLCBmdW5jLT5uYW1lKTsKCkhv
dyBhYm91dCBkcm9wcGluZyB0aGlzIGZ1bmN0aW9uIGFuZCBoYXZpbmcgYSB3cmFwcGVyIGZ1bmN0
aW9uIGxpa2UgdGhpczoKCmNvbW1vbl9saXZlcGF0Y2hfYXBwbHkoKSB7CiAgICAgaWYgKGZ1bmMt
PmFwcGxpZWQgPT0gTElWRVBBVENIX0ZVTkNfQVBQTElFRCkgewogICAgICAgICBXQVJOKC4uLikK
ICAgICAgICAgcmV0dXJuCiAgICAgfQoKICAgICBhcmNoX2xpdmVwYXRjaF9hcHBseSgpCgogICAg
IGZ1bmMtPmFwcGxpZWQgPSBMSVZFUEFUQ0hfRlVOQ19BUFBMSUVECn0KClRoaXMgY291bGQgYmUg
dXNlZCBieSB0aGUgbm9ybWFsIGFwcGx5IGNvZGUgYW5kIGFueSBhcHBseSBob29rcy4KClRoaXMg
YXZvaWRzIGhhdmluZyBkdXBsaWNhdGUgY29kZSBpbiBlYWNoIG9mIHRoZSBhcmNoaXRlY3R1cmVz
IHRoYXQgaXMgCm5vdCBhcmNoIHNwZWNpZmljIGFuZCBhbHNvIGF2b2lkcyBoYXZpbmcgYSBzdGF0
ZSBxdWVyeWluZyBmdW5jdGlvbiBlbWl0IAphIHdhcm5pbmcgd2hpY2ggc2VlbXMgb2RkIHRvIG1l
LgoKPiArICAgICAgICByZXR1cm4gdHJ1ZTsKPiArICAgIH0KPiArCj4gKyAgICByZXR1cm4gZmFs
c2U7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgYm9vbF90IGlzX2Z1bmNfcmV2ZXJ0ZWQoY29u
c3Qgc3RydWN0IGxpdmVwYXRjaF9mdW5jICpmdW5jKQo+ICt7Cj4gKyAgICBpZiAoICFmdW5jLT5v
bGRfYWRkciB8fCBmdW5jLT5hcHBsaWVkID09IExJVkVQQVRDSF9GVU5DX05PVF9BUFBMSUVEICkK
PiArICAgIHsKPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgTElWRVBBVENIICIlczog
JXMgaGFzIG5vdCBiZWVuIGFwcGxpZWQgYmVmb3JlXG4iLAo+ICsgICAgICAgICAgICAgICAgX19m
dW5jX18sIGZ1bmMtPm5hbWUpOwo+ICsgICAgICAgIHJldHVybiB0cnVlOwo+ICsgICAgfQo+ICsK
PiArICAgIHJldHVybiBmYWxzZTsKPiArfQo+ICsKPiAgIC8qCj4gICAgKiBUaGVzZSBmdW5jdGlv
bnMgYXJlIGNhbGxlZCBhcm91bmQgdGhlIGNyaXRpY2FsIHJlZ2lvbiBwYXRjaGluZyBsaXZlIGNv
ZGUsCj4gICAgKiBmb3IgYW4gYXJjaGl0ZWN0dXJlIHRvIHRha2UgbWFrZSBhcHByb3ByYXRpZSBn
bG9iYWwgc3RhdGUgYWRqdXN0bWVudHMuCj4gQEAgLTExNyw3ICsxNDIsNyBAQCBpbnQgYXJjaF9s
aXZlcGF0Y2hfcXVpZXNjZSh2b2lkKTsKPiAgIHZvaWQgYXJjaF9saXZlcGF0Y2hfcmV2aXZlKHZv
aWQpOwo+ICAgCi0tIApSb3NzIExhZ2Vyd2FsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

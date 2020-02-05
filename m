Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0416715327C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 15:07:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izLI4-0001k5-7n; Wed, 05 Feb 2020 14:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HwEA=3Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izLI2-0001k0-Ak
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 14:04:26 +0000
X-Inumbo-ID: 6a2a9f7c-4820-11ea-9100-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a2a9f7c-4820-11ea-9100-12813bfff9fa;
 Wed, 05 Feb 2020 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580911465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HioQDsNRY1csUXfxof30b5Ld/D+55ymYHYfMQpxpH+g=;
 b=GWTCIXrKPanRS5WXm+GSwyKcz8YtrM7/7IWAlsgCLmea9m0MuunCD/ao
 nRl8EhMFP6WTnqPtfqHxUGXB9w3ilxjeKXFIXt+mXCrGT1L3les1gKYi8
 jpPbg0HqZeR98vUGF6JxSI7gTz+mdabeW8QJd/kWN+f54T7ESvSb2SU+3 k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: edNrObC+wP+WkIRPPEdk51GYu1iVtSe4NkYy5myD4BPtiYdL7b4xD3B3VzmzHbY3fkm2aeLmqa
 mbB/PQdImDwOCHdt2Ii1ipNDfxTEdEKDY5nn3ajUOihS8CGynNpiK7+xtLNLSoG+RSozUw/ge+
 D3CsuwwTsN0EnDiIN6jOeMv4LZwOWM86u4/bDsX5kcGp2Yfnq2wNj3ZqsG3y6xIFjIScRsSXCH
 CaHawo/w78eXs7pOxX+1qIOZYe5bN8TGx+VqqzpwNo9BnMQ7ZXD3Ggq7y1vKkc3fkjtL6lJU3S
 1kY=
X-SBRS: 2.7
X-MesageID: 12156053
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,405,1574139600"; d="scan'208";a="12156053"
Date: Wed, 5 Feb 2020 15:04:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200205140416.GT4679@Air-de-Roger>
References: <20200204153704.15934-1-liuwe@microsoft.com>
 <20200204153704.15934-6-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204153704.15934-6-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v7 05/10] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDM6MzY6NTlQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBIeXBlci1WIHVzZXMgYSB0ZWNobmlxdWUgY2FsbGVkIG92ZXJsYXkgcGFnZSBmb3IgaXRzIGh5
cGVyY2FsbCBwYWdlLiBJdAo+IHdpbGwgaW5zZXJ0IGEgYmFja2luZyBwYWdlIHRvIHRoZSBndWVz
dCB3aGVuIHRoZSBoeXBlcmNhbGwgZnVuY3Rpb25hbGl0eQo+IGlzIGVuYWJsZWQuIFRoYXQgbWVh
bnMgd2UgY2FuIHVzZSBhIHBhZ2UgdGhhdCBpcyBub3QgYmFja2VkIGJ5IHJlYWwKPiBtZW1vcnkg
Zm9yIGh5cGVyY2FsbCBwYWdlLgo+IAo+IFRvIGF2b2lkIHNoYXR0ZXJpbmcgTDAgc3VwZXJwYWdl
cyBhbmQgdHJlYWRpbmcgb24gYW55IE1NSU8gYXJlYXMKPiByZXNpZGluZyBpbiBsb3cgYWRkcmVz
c2VzLCB1c2UgdGhlIHRvcC1tb3N0IGFkZHJlc3NhYmxlIHBhZ2UgZm9yIHRoYXQKPiBwdXJwb3Nl
LiBBZGp1c3QgZTgyMCBtYXAgYWNjb3JkaW5nbHkuCj4gCj4gV2UgYWxzbyBuZWVkIHRvIHJlZ2lz
dGVyIFhlbidzIGd1ZXN0IE9TIElEIHRvIEh5cGVyLVYuIFVzZSAweDMgYXMgdGhlCj4gdmVuZG9y
IElELiBGaXggdGhlIGNvbW1lbnQgaW4gaHlwZXJ2LXRsZnMuaCB3aGlsZSBhdCBpdC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgoKUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKPiAtLS0KPiB2NzoKPiAx
LiBGaXggYSBzdHlsZSBpc3N1ZQo+IDIuIEluaXRpYWxpc2UgSUQgdG8gMAo+IDMuIFVwZGF0ZSBj
b21taXQgbWVzc2FnZQo+IAo+IHY2Ogo+IDEuIFVzZSBodl9ndWVzdF9vc19pZAo+IDIuIFVzZSBu
ZXcgZTgyMF9maXh1cCBob29rCj4gMy4gQWRkIGEgQlVJTERfQlVHX09OCj4gCj4gdjU6Cj4gMS4g
dXNlIGh5cGVydmlzb3JfcmVzZXJ2ZV90b3BfcGFnZXMKPiAyLiBhZGQgYSBtYWNybyBmb3IgaHlw
ZXJjYWxsIHBhZ2UgbWZuCj4gMy4gYWRkcmVzcyBvdGhlciBtaXNjIGNvbW1lbnRzCj4gCj4gdjQ6
Cj4gMS4gVXNlIGZpeG1hcAo+IDIuIEZvbGxvdyByb3V0aW5lcyBsaXN0ZWQgaW4gVExGUwo+IC0t
LQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAgfCA2OSArKysrKysr
KysrKysrKysrKysrKysrKy0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRs
ZnMuaCB8ICA1ICstCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggICAgICB8
ICAzICsrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBpbmRleCA4ZDM4MzEzZDdhLi4y
ZTIwYTk2ZjMwIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2
LmMKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gQEAgLTE5LDE1
ICsxOSwyNyBAQAo+ICAgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWljcm9zb2Z0Lgo+ICAgKi8KPiAg
I2luY2x1ZGUgPHhlbi9pbml0Lmg+Cj4gKyNpbmNsdWRlIDx4ZW4vdmVyc2lvbi5oPgo+ICAKPiAr
I2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KPiAgI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgo+ICAjaW5j
bHVkZSA8YXNtL2d1ZXN0L2h5cGVydi10bGZzLmg+Cj4gKyNpbmNsdWRlIDxhc20vcHJvY2Vzc29y
Lmg+Cj4gIAo+ICBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7
Cj4gIAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wcyA9IHsKPiAtICAg
IC5uYW1lID0gIkh5cGVyLVYiLAo+IC19Owo+ICtzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vl
c3RfaWQodm9pZCkKPiArewo+ICsgICAgdW5pb24gaHZfZ3Vlc3Rfb3NfaWQgaWQgPSB7fTsKPiAr
Cj4gKyAgICBpZC52ZW5kb3IgPSBIVl9YRU5fVkVORE9SX0lEOwo+ICsgICAgaWQubWFqb3IgPSB4
ZW5fbWFqb3JfdmVyc2lvbigpOwo+ICsgICAgaWQubWlub3IgPSB4ZW5fbWlub3JfdmVyc2lvbigp
Owo+ICsKPiArICAgIHJldHVybiBpZC5yYXc7Cj4gK30KPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzOwo+ICAKPiAgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3Bz
ICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCj4gIHsKPiBAQCAtNzIsNiArODQsNTcgQEAgY29u
c3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCj4gICAg
ICByZXR1cm4gJm9wczsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2h5cGVy
Y2FsbF9wYWdlKHZvaWQpCj4gK3sKPiArICAgIHVuaW9uIGh2X3g2NF9tc3JfaHlwZXJjYWxsX2Nv
bnRlbnRzIGh5cGVyY2FsbF9tc3I7Cj4gKyAgICB1bmlvbiBodl9ndWVzdF9vc19pZCBndWVzdF9p
ZDsKPiArICAgIHVuc2lnbmVkIGxvbmcgbWZuOwo+ICsKPiArICAgIEJVSUxEX0JVR19PTihIVl9I
WVBfUEFHRV9TSElGVCAhPSBQQUdFX1NISUZUKTsKPiArCj4gKyAgICByZG1zcmwoSFZfWDY0X01T
Ul9HVUVTVF9PU19JRCwgZ3Vlc3RfaWQucmF3KTsKPiArICAgIGlmICggIWd1ZXN0X2lkLnJhdyAp
Cj4gKyAgICB7Cj4gKyAgICAgICAgZ3Vlc3RfaWQucmF3ID0gZ2VuZXJhdGVfZ3Vlc3RfaWQoKTsK
PiArICAgICAgICB3cm1zcmwoSFZfWDY0X01TUl9HVUVTVF9PU19JRCwgZ3Vlc3RfaWQucmF3KTsK
PiArICAgIH0KPiArCj4gKyAgICByZG1zcmwoSFZfWDY0X01TUl9IWVBFUkNBTEwsIGh5cGVyY2Fs
bF9tc3IuYXNfdWludDY0KTsKPiArICAgIGlmICggIWh5cGVyY2FsbF9tc3IuZW5hYmxlICkKPiAr
ICAgIHsKPiArICAgICAgICBtZm4gPSBIVl9IQ0FMTF9NRk47Cj4gKyAgICAgICAgaHlwZXJjYWxs
X21zci5lbmFibGUgPSAxOwo+ICsgICAgICAgIGh5cGVyY2FsbF9tc3IuZ3Vlc3RfcGh5c2ljYWxf
YWRkcmVzcyA9IG1mbjsKPiArICAgICAgICB3cm1zcmwoSFZfWDY0X01TUl9IWVBFUkNBTEwsIGh5
cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPiArICAgIH0KPiArICAgIGVsc2UKPiArICAgICAgICBt
Zm4gPSBoeXBlcmNhbGxfbXNyLmd1ZXN0X3BoeXNpY2FsX2FkZHJlc3M7CgpJcyBpdCBleHBlY3Rl
ZCB0aGF0IHRoZSBndWVzdCBJRCBvciB0aGUgaHlwZXJjYWwgcGFnZSBpcyBhbHJlYWR5CnNldHVw
PwoKSWU6IHdvdWxkIHZpcnR1YWwgZmlybXdhcmUgc2V0dXAgYW55IG9mIHRoaXM/IChhbmQgbm90
IGNsZWFuIGl0IHVwCmFmdGVyd2FyZHMpCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

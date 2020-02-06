Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF455154567
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 14:49:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhU6-0004xB-Km; Thu, 06 Feb 2020 13:46:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CJ3H=32=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izhU4-0004x5-Fp
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 13:46:20 +0000
X-Inumbo-ID: 0d4eff42-48e7-11ea-af8c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d4eff42-48e7-11ea-af8c-12813bfff9fa;
 Thu, 06 Feb 2020 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580996778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dCawphzEqL8G3vsLmOEa5AXxcud5V74uRla2joiekzs=;
 b=eNBuq54SHpCigCq8JaOEMgb3jWqY+IZ26AHj4jB5NYZ2zpr5WeiUYKeF
 3pUwjOAfjNDNjipFwsBb8ZA4pzx9tq0KFDG8dsl2u/Yq+BcNsUX5rkD3z
 NSn+e2emjITaYOQ7bwe+o6ohXk6ee4hlL7QXo4TnGYlbGrPom7xGxiyIg g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JQTmWNg7ufZ6lwsYjgRS8us60exYrT/XrOC98WujkfEvY69ypAdPXLopDKfQ3ttvE5x/A/pDU8
 I+miZgHOBd9sjDBjeGdqtXd1r3rrCy82jJhAJ9yoZrd6CPC7M9IHuewNsrRDS/KITxDjcdFQLZ
 A6ulo4efj9zhPMDErvW/JcheSoJdMl67jbJrjhadDVB4/mw9akummsrtFrtiIlPDEOZYivNNXi
 EXFuRymCxP0AVepK7Ad3m/boS6ksUxlPAqF7u4S+0E3sq4lT5uZE1LVpqmsd1ru9PEXBrTV3A8
 4Qs=
X-SBRS: 2.7
X-MesageID: 12482535
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,409,1574139600"; d="scan'208";a="12482535"
Date: Thu, 6 Feb 2020 14:46:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200206134610.GW4679@Air-de-Roger>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-7-roger.pau@citrix.com>
 <20200206133134.zh3e5wsrskjcksld@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206133134.zh3e5wsrskjcksld@debian>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 6/7] x86/tlb: allow disabling the TLB
 clock
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMDYsIDIwMjAgYXQgMDE6MzE6MzRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEphbiAyNywgMjAyMCBhdCAwNzoxMToxNFBNICswMTAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPiBUaGUgVExCIGNsb2NrIGlzIGhlbHBmdWwgd2hlbiBydW5uaW5nIFhlbiBv
biBiYXJlIG1ldGFsIGJlY2F1c2Ugd2hlbgo+ID4gZG9pbmcgYSBUTEIgZmx1c2ggZWFjaCBDUFUg
aXMgSVBJJ2VkIGFuZCBjYW4ga2VlcCBhIHRpbWVzdGFtcCBvZiB0aGUKPiA+IGxhc3QgZmx1c2gu
Cj4gPiAKPiA+IFRoaXMgaXMgbm90IHRoZSBjYXNlIGhvd2V2ZXIgd2hlbiBYZW4gaXMgcnVubmlu
ZyB2aXJ0dWFsaXplZCwgYW5kIHRoZQo+ID4gdW5kZXJseWluZyBoeXBlcnZpc29yIHByb3ZpZGVz
IG1lY2hhbmlzbSB0byBhc3Npc3QgaW4gcGVyZm9ybWluZyBUTEIKPiA+IGZsdXNoZXM6IFhlbiBp
dHNlbGYgZm9yIGV4YW1wbGUgb2ZmZXJzIGEgSFZNT1BfZmx1c2hfdGxicyBoeXBlcmNhbGwgaW4K
PiA+IG9yZGVyIHRvIHBlcmZvcm0gYSBUTEIgZmx1c2ggd2l0aG91dCBoYXZpbmcgdG8gSVBJIGVh
Y2ggQ1BVLiBXaGVuCj4gPiB1c2luZyBzdWNoIG1lY2hhbmlzbXMgaXQncyBubyBsb25nZXIgcG9z
c2libGUgdG8ga2VlcCBhIHRpbWVzdGFtcCBvZgo+ID4gdGhlIGZsdXNoZXMgb24gZWFjaCBDUFUs
IGFzIHRoZXkgYXJlIHBlcmZvcm1lZCBieSB0aGUgdW5kZXJseWluZwo+ID4gaHlwZXJ2aXNvci4K
PiA+IAo+ID4gT2ZmZXIgYSBib29sZWFuIGluIG9yZGVyIHRvIHNpZ25hbCBYZW4gdGhhdCB0aGUg
dGltZXN0YW1wZWQgVExCCj4gPiBzaG91bGRuJ3QgYmUgdXNlZC4gVGhpcyBhdm9pZHMga2VlcGlu
ZyB0aGUgdGltZXN0YW1wcyBvZiB0aGUgZmx1c2hlcywKPiA+IGFuZCBhbHNvIGZvcmNlcyBORUVE
X0ZMVVNIIHRvIGFsd2F5cyByZXR1cm4gdHJ1ZS4KPiA+IAo+ID4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UgaW50ZW5kZWQsIGFzIHRoaXMgY2hhbmdlIGRvZXNuJ3QgaW50cm9kdWNlIGFueQo+ID4gdXNl
ciB0aGF0IGRpc2FibGVzIHRoZSB0aW1lc3RhbXBlZCBUTEIuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiAg
eGVuL2FyY2gveDg2L2ZsdXNodGxiLmMgICAgICAgIHwgMTkgKysrKysrKysrKysrKy0tLS0tLQo+
ID4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaCB8IDE3ICsrKysrKysrKysrKysrKyst
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMgYi94ZW4vYXJjaC94
ODYvZmx1c2h0bGIuYwo+ID4gaW5kZXggZTdjY2Q0ZWM3Yi4uMzY0OTkwMDc5MyAxMDA2NDQKPiA+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9mbHVzaHRsYi5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZmx1
c2h0bGIuYwo+ID4gQEAgLTMyLDYgKzMyLDkgQEAKPiA+ICB1MzIgdGxiZmx1c2hfY2xvY2sgPSAx
VTsKPiA+ICBERUZJTkVfUEVSX0NQVSh1MzIsIHRsYmZsdXNoX3RpbWUpOwo+ID4gIAo+ID4gKy8q
IFNpZ25hbHMgd2hldGhlciB0aGUgVExCIGZsdXNoIGNsb2NrIGlzIGluIHVzZS4gKi8KPiA+ICti
b29sIF9fcmVhZF9tb3N0bHkgdGxiX2Nsa19lbmFibGVkID0gdHJ1ZTsKPiA+ICsKPiA+ICAvKgo+
ID4gICAqIHByZV9mbHVzaCgpOiBJbmNyZW1lbnQgdGhlIHZpcnR1YWwgVExCLWZsdXNoIGNsb2Nr
LiBSZXR1cm5zIG5ldyBjbG9jayB2YWx1ZS4KPiA+ICAgKiAKPiA+IEBAIC04MiwxMiArODUsMTMg
QEAgc3RhdGljIHZvaWQgcG9zdF9mbHVzaCh1MzIgdCkKPiA+ICBzdGF0aWMgdm9pZCBkb190bGJf
Zmx1c2godm9pZCkKPiA+ICB7Cj4gPiAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIGNyNDsKPiA+
IC0gICAgdTMyIHQ7Cj4gPiArICAgIHUzMiB0ID0gMDsKPiA+ICAKPiA+ICAgICAgLyogVGhpcyBu
b24tcmVlbnRyYW50IGZ1bmN0aW9uIGlzIHNvbWV0aW1lcyBjYWxsZWQgaW4gaW50ZXJydXB0IGNv
bnRleHQuICovCj4gPiAgICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKPiA+ICAKPiA+IC0gICAg
dCA9IHByZV9mbHVzaCgpOwo+ID4gKyAgICBpZiAoIHRsYl9jbGtfZW5hYmxlZCApCj4gPiArICAg
ICAgICB0ID0gcHJlX2ZsdXNoKCk7Cj4gCj4gSSB0aGluayBpdCBtYWtlcyBtb3JlIHNlbnNlIHRv
IHB1c2ggdGhlIGNoZWNrIHRvIHByZV9mbHVzaCBhbmQKPiBwb3N0X2ZsdXNoIC0tIHRoZXkgYXJl
IHRoZSBvbmVzIHRoYXQgY2FyZSBhYm91dCB0aGUgY2xvY2ssIGFmdGVyIGFsbC4KPiAKPiBUaGlz
IGFsc28gaGFzIHRoZSBlZmZlY3Qgb2YgbWFraW5nIHRoaXMgcGF0Y2ggYSBiaXQgc2hvcnRlciwg
SSB0aGluay4KCkkgYWRkZWQgdGhlIGNoZWNrIGhlcmUgaW4gb3JkZXIgdG8gYXZvaWQgdGhlIGNh
bGwganVzdCB0byByZXR1cm4gMC4KVGhpcyBpcyBhIGhvdCBwYXRoLCBzbyBJIHRob3VnaHQgdGhh
dCBhIGNoZWNrIGhlcmUgd291bGQgYmUgbGVzcwpleHBlbnNpdmUgdGhhdCBhIGZ1bmN0aW9uIGNh
bGwgd2hlbiB0aGUgVExCIHN0YW1wcyBhcmUgZGlzYWJsZWQuCgpJIGRvbid0IG1pbmQgbW92aW5n
IGl0IGluc2lkZSB7cHJlL3Bvc3R9X2ZsdXNoIGZ1bmN0aW9ucyBpZiB0aGF0J3MgdGhlCmNvbnNl
bnN1cy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

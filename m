Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1ABB123D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:34:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8R4l-0001wB-8V; Thu, 12 Sep 2019 15:32:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1F3=XH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8R4k-0001w6-9B
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:32:02 +0000
X-Inumbo-ID: 73306d16-d572-11e9-959c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73306d16-d572-11e9-959c-12813bfff9fa;
 Thu, 12 Sep 2019 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568302314;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qUotGzGj1OhFrEhtnviP0wVw7L2JFJRbmtNmyPPT6Zc=;
 b=huEg0PLF4Fod2l0ua7ZrJgvSSm1SuIiKx4H9yo5roYgTzAQfAdPxov9X
 6d7CX7a6MhhhIFa/bHfbZPh2LmLRgMJ6lXHFsZv3kfJ2+GcX3JLnAOFR8
 lgDRue99erOE30EiT5DixtTjR7on6GfHKL7DC9AGV9zoBdlF+qeJxc865 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xpvNs1Na4GpAHnK4TsJVYOUA5gH3K/b1oNIsWJZzdV1bYT+NLnMWYp02V15iQ0XDlEtb9rgbG/
 q+nhyswiD6HesVNhem9Whqpg4n5CoAwjXBuFLtZdORLtXEdZ0lPxWC8FMxWZeLRCyHsLvbB9CE
 lmApljR9t/AexcsKwVMZeFOL1uTuUuiKbdpjiF9CbElJ62zC4H7ABU5ovgUAPBWMzJF3aIgoIW
 H+gkoFWyisCsYyrd2+dIsGCNFTZVRHLOn+VNsF+91JJ6q70h7oPGyaL9e4aMS1alj5QvnzsnP/
 U74=
X-SBRS: 2.7
X-MesageID: 5735428
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5735428"
Date: Thu, 12 Sep 2019 17:31:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190912153147.nhxdrifqney752lc@Air-de-Roger>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <f44f12f3-6449-8014-43e4-1f08100be251@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f44f12f3-6449-8014-43e4-1f08100be251@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 9/9] x86: PCID is unused when !PV
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDU6MjY6NDZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhpcyBhbGxvd3MgaW4gcGFydGljdWxhciBzb21lIHN0cmVhbWxpbmluZyBvZiB0aGUg
VExCIGZsdXNoaW5nIGNvZGUKPiBwYXRocy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gLS0tIGEveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMK
PiArKysgYi94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwo+IEBAIC0yNCw2ICsyNCwxMSBAQAo+ICAj
ZGVmaW5lIFdSQVBfTUFTSyAoMHgwMDAwMDNGRlUpCj4gICNlbmRpZgo+ICAKPiArI2lmbmRlZiBD
T05GSUdfUFYKPiArIyB1bmRlZiBYODZfQ1I0X1BDSURFCj4gKyMgZGVmaW5lIFg4Nl9DUjRfUENJ
REUgMAo+ICsjZW5kaWYKCkkgaGF2ZSB0byBhZG1pdCBJIGZpbmQgaXQgcXVpdGUgdWdseSB0byBo
YXZlIHRvIG1hc2sgUENJRCBpbiBzdWNoIGEKd2F5LiBQbGF5aW5nIHdpdGggdGhlIGhhcmR3YXJl
IGFyY2hpdGVjdHVyZSBkZWZpbmVzIHNlZW1zIGxpa2UgYXNraW5nCmZvciB0cm91YmxlLiBJIHdv
dWxkIGxpa2VseSBwcmVmZXIgdG8gc3ByaW5rbGUgSVNfRU5BQkxFRChDT05GSUdfUFYpLAp3aGlj
aCBzaG91bGQgYWNoaWV2ZSB0aGUgc2FtZSBjb21waWxlIHRpbWUgc2hvcnQgY2lyY3VpdGluZy4K
Cj4gKwo+ICB1MzIgdGxiZmx1c2hfY2xvY2sgPSAxVTsKPiAgREVGSU5FX1BFUl9DUFUodTMyLCB0
bGJmbHVzaF90aW1lKTsKPiAgCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3Iu
aAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKPiBAQCAtMjg5LDcgKzI4
OSwxMSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgY3IzX3BhKHVuc2lnCj4gIAo+ICBz
dGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBjcjNfcGNpZCh1bnNpZ25lZCBsb25nIGNyMykKPiAg
ewo+ICsjaWZkZWYgQ09ORklHX1BWCj4gICAgICByZXR1cm4gY3IzICYgWDg2X0NSM19QQ0lEX01B
U0s7Cj4gKyNlbHNlCj4gKyAgICByZXR1cm4gMDsKPiArI2VuZGlmCgpXb24ndDoKCnJldHVybiBJ
U19FTkFCTEVEKENPTkZJR19QVikgPyBjcjMgJiBYODZfQ1IzX1BDSURfTUFTSyA6IDA7CgpBY2hp
ZXZlIHRoZSBzYW1lPwoKPiAgfQo+ICAKPiAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHJl
YWRfY3I0KHZvaWQpCj4gQEAgLTMwMSw4ICszMDUsMTIgQEAgc3RhdGljIGlubGluZSB2b2lkIHdy
aXRlX2NyNCh1bnNpZ25lZCBsbwo+ICB7Cj4gICAgICBzdHJ1Y3QgY3B1X2luZm8gKmluZm8gPSBn
ZXRfY3B1X2luZm8oKTsKPiAgCj4gKyNpZmRlZiBDT05GSUdfUFYKPiAgICAgIC8qIE5vIGdsb2Jh
bCBwYWdlcyBpbiBjYXNlIG9mIFBDSURzIGVuYWJsZWQhICovCj4gICAgICBBU1NFUlQoISh2YWwg
JiBYODZfQ1I0X1BHRSkgfHwgISh2YWwgJiBYODZfQ1I0X1BDSURFKSk7Cj4gKyNlbHNlCj4gKyAg
ICBBU1NFUlQoISh2YWwgJiBYODZfQ1I0X1BDSURFKSk7CgpUaGF0IGFzc2VydCBzZWVtcyBxdWl0
ZSBwb2ludGxlc3MsIHlvdSBoYXZlIHNldCBYODZfQ1I0X1BDSURFIHRvIDAsIHNvCnRoaXMgaXMg
bmV2ZXIgZ29pbmcgdG8gdHJpZ2dlcj8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

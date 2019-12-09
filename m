Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B8A116B95
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:58:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGiD-0003Nq-7E; Mon, 09 Dec 2019 10:56:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieGiB-0003Nl-Dq
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:56:19 +0000
X-Inumbo-ID: 86dc6dac-1a72-11ea-88e7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86dc6dac-1a72-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 10:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575888978;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JWbKikyPTkWqfOZmuuJkn55ZOJANP2z4dU7K/gsI96c=;
 b=YpwTQ629AxjiQXb8K+a1i9NEInVXRzJkA8Cof+78m5RrP/O04U503CHY
 QIs9dnenKe/0DiTJ6e3inOF+X8Eo8/HCT/0RkpH5yNMXPSvyZp+iNwM6Z
 0qs949TDSG2s6MWIa0I9Az5awZHGTi18ifY4naYg3wdzOG93Xdn9oqErc M=;
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
IronPort-SDR: T25yrwncxN7xWxWxE98bnYMr+KgPBjqxdLHkrXS+dcBBijkSMK9w1qUuPsxnSlEiFeqJQsHF6l
 4VfAZxVB1J7ewzGoBeOG5qhvf459G/92HblO/mXAZ/UmtW+P54sS/517dJjAtpVK87ljXka2yA
 X4Ia9aNxtvtWHBFoB7wDk69066zcG7ZFl0jdZHVl8u461Bo41nkyT/XyxbvcsubcNs7j/GVskB
 96Ohw3qME1YdGzRmLR1Wtp4e0mHzi9BpZ4UEKlVCIuWtAgshGVP63xzi5zUs7BGxXtmdK8ChqB
 7pA=
X-SBRS: 2.7
X-MesageID: 9512598
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9512598"
Date: Mon, 9 Dec 2019 11:56:10 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191209105610.GQ980@Air-de-Roger>
References: <20191204162025.37510-1-roger.pau@citrix.com>
 <20191204162025.37510-5-roger.pau@citrix.com>
 <d6db8dfa-0b47-6f19-fb1a-e7a3bf7ee3df@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6db8dfa-0b47-6f19-fb1a-e7a3bf7ee3df@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v3 4/4] x86/apic: allow enabling x2APIC mode
 regardless of interrupt remapping
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMTA6NDU6NTlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMTIuMjAxOSAxNzoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gKyAg
ICAgICAgc3dpdGNoICggaW9tbXVfZW5hYmxlX3gyYXBpYygpICkKPiA+ICAgICAgICAgIHsKPiA+
ICsgICAgICAgIGNhc2UgMDoKPiA+ICsgICAgICAgICAgICBpb21tdV94MmFwaWNfZW5hYmxlZCA9
IHRydWU7Cj4gPiArICAgICAgICAgICAgYnJlYWs7Cj4gPiArCj4gPiArICAgICAgICBjYXNlIC1F
TlhJTzogLyogQUNQSV9ETUFSX1gyQVBJQ19PUFRfT1VUIHNldCAqLwo+ID4gKyAgICAgICAgICAg
IGlmICggeDJhcGljX2VuYWJsZWQgKQo+ID4gKyAgICAgICAgICAgICAgICBwYW5pYygiSU9NTVUg
cmVxdWVzdHMgeEFQSUMgbW9kZSwgYnV0IHgyQVBJQyBhbHJlYWR5IGVuYWJsZWQgYnkgZmlybXdh
cmVcbiIpOwo+ID4gKwo+ID4gICAgICAgICAgICAgIHByaW50aygiTm90IGVuYWJsaW5nIHgyQVBJ
QyAodXBvbiBmaXJtd2FyZSByZXF1ZXN0KVxuIik7Cj4gPiAtICAgICAgICAgICAgaW50cmVtYXBf
ZW5hYmxlZCA9IGZhbHNlOwo+ID4gKyAgICAgICAgICAgIGlvbW11X3gyYXBpY19lbmFibGVkID0g
ZmFsc2U7Cj4gPiAgICAgICAgICAgICAgZ290byByZXN0b3JlX291dDsKPiA+ICsKPiA+ICsgICAg
ICAgIGRlZmF1bHQ6Cj4gPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkZhaWxlZCB0
byBlbmFibGUgSW50ZXJydXB0IFJlbWFwcGluZ1xuIik7Cj4gPiArICAgICAgICAgICAgaW9tbXVf
eDJhcGljX2VuYWJsZWQgPSBmYWxzZTsKPiA+ICsgICAgICAgICAgICBicmVhazsKPiAKPiBJIGd1
ZXNzIHlvdSBzdGlsbCBuZWVkIHRvIHBhbmljKCkgaW4gdGhlIGZhaWx1cmUgY2FzZXMgaWYgeDJh
cGljX3BoeXMKPiBpcyBmYWxzZS4gVW5sZXNzIHlvdSBjYW4gc3RpbGwgcHJvcGVybHkgc3dpdGNo
IGZyb20gY2x1c3RlciB0bwo+IHBoeXNpY2FsIG1vZGUgYXQgdGhpcyBwb2ludCBpbiB0aW1lLiAo
SWYgeW91IGdvIHRoZSBwYW5pYygpIHJvdXRlLAo+IEknZCBhcHByZWNpYXRlIGlmIHlvdSBjb3Vs
ZCBhdm9pZCBtYWtpbmcgeDJhcGljX3BoeXMgbm9uLXN0YXRpYy4pCgpJIGRvbid0IHRoaW5rIFhl
biBuZWVkcyB0byBjaGVjayB4MmFwaWNfcGh5cyBvciBwYW5pYyBoZXJlLCB0aGUgeDJhcGljCnBy
b2JlIHRoYXQgc2VsZWN0cyBwaHlzIG9yIGNsdXN0ZXIgbW9kZSBpcyBkb25lIGFmdGVyd2FyZHMg
aW4KYXBpY194MmFwaWNfcHJvYmUsIHdoaWNoIGlzIGNhbGxlZCBhZnRlciB0aGUgYXR0ZW1wdCB0
byBlbmFibGUKaW50ZXJydXB0IHJlbWFwcGluZyBhbmQgaGVuY2Ugd2lsbCB0YWtlIHRoaXMgcmVz
dWx0IGludG8gYWNjb3VudC4KCj4gPiBAQCAtOTM4LDEzICs5MzEsMTYgQEAgdm9pZCBfX2luaXQg
eDJhcGljX2JzcF9zZXR1cCh2b2lkKQo+ID4gICAgICAgICAgcHJpbnRrKCJTd2l0Y2hlZCB0byBB
UElDIGRyaXZlciAlc1xuIiwgZ2VuYXBpYy5uYW1lKTsKPiA+ICAKPiA+ICByZXN0b3JlX291dDoK
PiA+IC0gICAgLyoKPiA+IC0gICAgICogTkI6IGRvIG5vdCB1c2UgcmF3IG1vZGUgd2hlbiByZXN0
b3JpbmcgZW50cmllcyBpZiB0aGUgaW9tbXUgaGFzIGJlZW4KPiA+IC0gICAgICogZW5hYmxlZCBk
dXJpbmcgdGhlIHByb2Nlc3MsIGJlY2F1c2UgdGhlIGVudHJpZXMgbmVlZCB0byBiZSB0cmFuc2xh
dGVkCj4gPiAtICAgICAqIGFuZCBhZGRlZCB0byB0aGUgcmVtYXBwaW5nIHRhYmxlIGluIHRoYXQg
Y2FzZS4KPiA+IC0gICAgICovCj4gPiAtICAgIHJlc3RvcmVfSU9fQVBJQ19zZXR1cChpb2FwaWNf
ZW50cmllcywgIWludHJlbWFwX2VuYWJsZWQpOwo+ID4gLSAgICB1bm1hc2tfODI1OUEoKTsKPiA+
ICsgICAgaWYgKCBpb21tdV9zdXBwb3J0c194MmFwaWMoKSApCj4gCj4gSG1tLCBJIGZpcnN0IHdh
bnRlZCB0byBzdWdnZXN0IHRvIHVzZSBpb21tdV94MmFwaWNfZW5hYmxlZCBoZXJlLCBidXQKPiBJ
IHJlYWxpemUgdGhlIGVycm9yIGNhc2VzIGFib3ZlIHdvdWxkIHRoZW4gYmUgd3JvbmcuIFBlcmhh
cHMgYmV0dGVyCj4gdG8gbGVhdmUgYSBicmllZiBjb21tZW50IHRvIHRoaXMgZWZmZWN0PwoKQWNr
LCB3b3VsZCB5b3UgYmUgZmluZSB3aXRoOgoKIk5vdGUgdGhhdCBpb21tdV94MmFwaWNfZW5hYmxl
ZCBjYW5ub3QgYmUgdXNlZCBoZXJlIGJlY2F1c2UgaWYgdGhlCklPTU1VIHN1cHBvcnRzIHgyQVBJ
QyBidXQgZW5hYmxpbmcgZmFpbGVkIFhlbiB3b3VsZG4ndCByZXN0b3JlIHRoZQpJTy1BUElDIGFu
ZCB0aGUgODI1OUEgc3RhdGUgY29ycmVjdGx5LiIKClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

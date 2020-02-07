Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E90155A03
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 15:49:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j04to-0004KU-G3; Fri, 07 Feb 2020 14:46:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gniO=33=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j04tm-0004KP-GN
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 14:46:26 +0000
X-Inumbo-ID: 9d3ce99e-49b8-11ea-b18b-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d3ce99e-49b8-11ea-b18b-12813bfff9fa;
 Fri, 07 Feb 2020 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581086785;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pCIMP47+t1oXAvegIdFl8esp0ZoIn8jhedWaZRgV7nA=;
 b=FFMaz8beseZtbpGu5a7oEmK0tzJrD+VDp63+e9cFsgyPS3RhwGV1U180
 d4Nv+GrStvxVpqhdkkQ47Pda1PM3Wvxtqfrc1+hbZc5MPFgadMMcHKRyh
 k/wfpIUX4wquWbjr4HMpDpjU7mIXqLw003YPpd1BlVELUDVR1qXm9bTZJ 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GLiNtGTc3f9BtpxHIIiLaY/1XiU1nzRlJjmOM1f+q9BWzMxc1H7TjPCYoq2tS4euyVPCMX5OrQ
 3H6HHihOyIMFT2es90CUdiZbUIbpvwo4E4yHGwTuXnGWri8YgA+DJBL/GVT20Kjfzf4dxOgg+B
 K9VoPS1CCzHoDzkyw9yDsfo4x10S2SgMdE02ks1g7D/jPVB92cF+Wb+mmmyhqfIylwqbwZ3dFz
 OFWNGk6TdaR+L7NaV4I8ZedxxxnRDOUdH2vBZ3ZCDFfczFwf7Tk6Fv/FskQVrsuyfnnaV0K7eI
 1Js=
X-SBRS: 2.7
X-MesageID: 12730210
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,413,1574139600"; d="scan'208";a="12730210"
Date: Fri, 7 Feb 2020 15:46:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200207144600.GF4679@Air-de-Roger>
References: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
 <68fb9767-3104-3f0b-d052-20df7603e1e9@suse.com>
 <20200207122021.GD4679@Air-de-Roger>
 <be40b0b2-10ec-60ef-bd14-1041045d5a02@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be40b0b2-10ec-60ef-bd14-1041045d5a02@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] VT-d: check all of an RMRR for being
 E820-reserved
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMDcsIDIwMjAgYXQgMDI6Mjc6MTFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDcuMDIuMjAyMCAxMzoyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRmViIDA2LCAyMDIwIGF0IDAyOjMxOjAzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IENoZWNraW5nIGp1c3QgdGhlIGZpcnN0IGFuZCBsYXN0IHBhZ2UgaXMgbm90IHN1ZmZp
Y2llbnQgKGFuZCByZWR1bmRhbnQKPiA+PiBmb3Igc2luZ2xlLXBhZ2UgcmVnaW9ucykuIEFzIHdl
IGRvbid0IG5lZWQgdG8gY2FyZSBhYm91dCBJQTY0IGFueW1vcmUsCj4gPj4gdXNlIGFuIHg4Ni1z
cGVjaWZpYyBmdW5jdGlvbiB0byBnZXQgdGhpcyBkb25lIHdpdGhvdXQgbG9vcGluZyBvdmVyIGVh
Y2gKPiA+PiBpbmRpdmlkdWFsIHBhZ2UuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4KPiA+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvZG1hci5jCj4gPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2RtYXIuYwo+ID4+IEBAIC0yOSw2ICsyOSw3IEBACj4gPj4gICNpbmNsdWRlIDx4ZW4vcGNpLmg+
Cj4gPj4gICNpbmNsdWRlIDx4ZW4vcGNpX3JlZ3MuaD4KPiA+PiAgI2luY2x1ZGUgPGFzbS9hdG9t
aWMuaD4KPiA+PiArI2luY2x1ZGUgPGFzbS9lODIwLmg+Cj4gPj4gICNpbmNsdWRlIDxhc20vc3Ry
aW5nLmg+Cj4gPj4gICNpbmNsdWRlICJkbWFyLmgiCj4gPj4gICNpbmNsdWRlICJpb21tdS5oIgo+
ID4+IEBAIC02MzIsMTQgKzYzMywxMSBAQCBhY3BpX3BhcnNlX29uZV9ybXJyKHN0cnVjdCBhY3Bp
X2RtYXJfaGVhCj4gPj4gICAgICAgKiBub3QgcHJvcGVybHkgcmVwcmVzZW50ZWQgaW4gdGhlIHN5
c3RlbSBtZW1vcnkgbWFwIGFuZAo+ID4+ICAgICAgICogaW5mb3JtIHRoZSB1c2VyCj4gPj4gICAg
ICAgKi8KPiA+PiAtICAgIGlmICggKCFwYWdlX2lzX3JhbV90eXBlKHBhZGRyX3RvX3BmbihiYXNl
X2FkZHIpLCBSQU1fVFlQRV9SRVNFUlZFRCkpIHx8Cj4gPj4gLSAgICAgICAgICghcGFnZV9pc19y
YW1fdHlwZShwYWRkcl90b19wZm4oZW5kX2FkZHIpLCBSQU1fVFlQRV9SRVNFUlZFRCkpICkKPiA+
PiAtICAgIHsKPiA+PiArICAgIGlmICggIWU4MjBfYWxsX21hcHBlZChiYXNlX2FkZHIsIGVuZF9h
ZGRyICsgMSwgUkFNX1RZUEVfUkVTRVJWRUQpICkKPiA+IAo+ID4gRG8geW91IG5lZWQgdG8gYWRk
IG9uZSB0byB0aGUgZW5kPwo+ID4gCj4gPiBUaGUgb3RoZXIgdXNlciBvZiBlODIwX2FsbF9tYXBw
ZWQgc2VlbXMgdG8gdHJlYXQgZW5kIGFzIHN0YXJ0ICsgc2l6ZQo+ID4gLSAxLCB3aGljaCBtYWtl
cyBtZSB0aGluayB0aGUgcGFyYW1ldGVycyB0byB0aGUgZnVuY3Rpb24gYXJlIGFuCj4gPiBpbmNs
dXNpdmUgcmFuZ2UgW3N0YXJ0LCBlbmRdIGFuZCB0aGF0J3Mgd2hhdCdzIHByZXNlbnQgaW4gdGhl
IFJNUlIKPiA+IEFDUEkgZW50cmllcz8KPiAKPiBXZWxsLCBpdCdzIHRoZSBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgZnVuY3Rpb24gd2hpY2ggbWF0dGVycy4gVGhpcwo+IG9uZSBvdGhlciBjYWxsZXIg
aXMgd3JvbmcgYWZhaWN0LCBhbmQgSSd2ZSBqdXN0IHNlbnQgYSBwYXRjaC4gVGhlCj4gbm9uLWlu
Y2x1c2l2ZW5lc3MgaXMgYWxzbyBpbiBsaW5lIHdpdGggTGludXgnZXMgdmFyaWFudCBvZiB0aGUK
PiBmdW5jdGlvbiAod2hlcmUgd2UndmUgZ290IG91cnMgZnJvbSBvcmlnaW5hbGx5LCBqdXN0IHRo
YXQgaXQgaGFzCj4gYmVlbiByZW5hbWVkIGFuZCBzbGlnaHRseSBleHRlbmRlZCBzaW5jZSB0aGVu
KS4KClRoYW5rcyBmb3IgZml4aW5nIHRoYXQgb3RoZXIgY2FsbGVyIGFuZCBjbGFyaWZ5aW5nIHRo
ZSBjb21tZW50LgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

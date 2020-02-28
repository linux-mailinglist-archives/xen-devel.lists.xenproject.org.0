Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E499173759
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:42:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7evp-0001tN-0P; Fri, 28 Feb 2020 12:39:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7evn-0001tG-Ud
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:39:51 +0000
X-Inumbo-ID: 6960a1ae-5a27-11ea-83b0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6960a1ae-5a27-11ea-83b0-bc764e2007e4;
 Fri, 28 Feb 2020 12:39:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1C1F8B434;
 Fri, 28 Feb 2020 12:39:50 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
 <d2833654-fc51-555e-1c38-bda283baf27f@suse.com>
 <20200228123116.GW24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <25579374-ab95-9ab8-f4b5-3c12dee43865@suse.com>
Date: Fri, 28 Feb 2020 13:39:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228123116.GW24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] AMD/IOMMU: without XT,
 x2APIC needs to be forced into physical mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxMzozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAwMToxMjowM1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0t
IGEveGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2dl
bmFwaWMveDJhcGljLmMKPj4gQEAgLTIzNiwxMiArMjM2LDIxIEBAIGNvbnN0IHN0cnVjdCBnZW5h
cGljICpfX2luaXQgYXBpY194MmFwaWMKPj4gICAgICAgICAgeDJhcGljX3BoeXMgPSAhaW9tbXVf
aW50cmVtYXAgfHwKPj4gICAgICAgICAgICAgICAgICAgICAgICAoYWNwaV9nYmxfRkFEVC5mbGFn
cyAmIEFDUElfRkFEVF9BUElDX1BIWVNJQ0FMKTsKPj4gICAgICB9Cj4+IC0gICAgZWxzZSBpZiAo
ICF4MmFwaWNfcGh5cyAmJiAhaW9tbXVfaW50cmVtYXAgKQo+PiAtICAgIHsKPj4gLSAgICAgICAg
cHJpbnRrKCJXQVJOSU5HOiB4MkFQSUMgY2x1c3RlciBtb2RlIGlzIG5vdCBzdXBwb3J0ZWQgd2l0
aG91dCBpbnRlcnJ1cHQgcmVtYXBwaW5nXG4iCj4+IC0gICAgICAgICAgICAgICAieDJBUElDOiBm
b3JjaW5nIHBoeXMgbW9kZVxuIik7Cj4+IC0gICAgICAgIHgyYXBpY19waHlzID0gdHJ1ZTsKPj4g
LSAgICB9Cj4+ICsgICAgZWxzZSBpZiAoICF4MmFwaWNfcGh5cyApCj4+ICsgICAgICAgIHN3aXRj
aCAoIGlvbW11X2ludHJlbWFwICkKPj4gKyAgICAgICAgewo+PiArICAgICAgICBjYXNlIGlvbW11
X2ludHJlbWFwX29mZjoKPj4gKyAgICAgICAgY2FzZSBpb21tdV9pbnRyZW1hcF9yZXN0cmljdGVk
Ogo+PiArICAgICAgICAgICAgcHJpbnRrKCJXQVJOSU5HOiB4MkFQSUMgY2x1c3RlciBtb2RlIGlz
IG5vdCBzdXBwb3J0ZWQgJXMgaW50ZXJydXB0IHJlbWFwcGluZ1xuIgo+PiArICAgICAgICAgICAg
ICAgICAgICJ4MkFQSUM6IGZvcmNpbmcgcGh5cyBtb2RlXG4iLAo+PiArICAgICAgICAgICAgICAg
ICAgIGlvbW11X2ludHJlbWFwID09IGlvbW11X2ludHJlbWFwX29mZiA/ICJ3aXRob3V0Igo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6
ICJ3aXRoIHJlc3RyaWN0ZWQiKTsKPj4gKyAgICAgICAgICAgIHgyYXBpY19waHlzID0gdHJ1ZTsK
PiAKPiBJIHRoaW5rIHlvdSBhbHNvIG5lZWQgdG8gZml4dXAgdGhlIHVzYWdlIG9mIGlvbW11X2lu
dHJlbWFwIGluIF9fY3B1X3VwCj4gc28gdGhhdCBDUFVzIHdpdGggQVBJQyBJRHMgPiAyNTUgYXJl
IG5vdCBicm91Z2h0IHVwIHdoZW4gaW4KPiBpb21tdV9pbnRyZW1hcF9yZXN0cmljdGVkIG1vZGUu
CgpUaGF0IGNlcnRhaW5seSB3YW50cyBjaGFuZ2luZywgeWVzLCBidXQgSSB2aWV3IHRoaXMgYXMg
YW4gb3J0aG9nb25hbAphZGp1c3RtZW50LCB3aGljaCBJJ2QgbGlrZSB0byBtYWtlIG9ubHkgb25j
ZSBJIHVuZGVyc3RhbmQgd2hhdCB0aGUKYmVoYXZpb3IgZm9yIEFQSUMgSUQgMHhmZiBzaG91bGQg
YmUgaW4gdGhpcyBzZXR1cC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

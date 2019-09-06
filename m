Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8590DAB5CE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 12:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6BTo-0002Rj-0v; Fri, 06 Sep 2019 10:28:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6BTl-0002Rb-VI
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 10:28:34 +0000
X-Inumbo-ID: 13453f20-d091-11e9-978d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13453f20-d091-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 10:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567765712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JWp75kInJ0N8E6CPbm9tPaYidl0RCw8ATxINV/r8qqY=;
 b=P+XEPo4LuAk1M+1i7UwWKx3644pgaMar5+4XsxOl7F4vRUWsPtljT7Lx
 XPAI7rJ2CwC/AtoBDr7B9YdYPXQ8dGjCVW2gF9Bs0/UzzhG1kF3aSoOLc
 s305yK/IN2x5pamFAfzKMZ2jTlku476uX/pEGFLMyUK7+XjRi+81YUZwQ I=;
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
IronPort-SDR: VY/F1RiZt7z/H/EgxemdCyMkrKsJOAfBzE0ojXmCuJ/oOBIp4IqEWEPql++l60d85dl27zkgJH
 pqqZLOF91ZiHbMuUmlE0cU+qRp75ZdwIjRuAs/sqxJY2yiJ7M0T37dFX2AMzTlMmSiX8Nh4iNW
 LoGorJlQ4h42bFOHWutTVkuHSxOVBk8gFolckUhsbWjUjv6ti1hpJQBQpgwutFPkoG/2LbuGjz
 PNMITsOgVaublABciIS63IWnPIy5IRCHvXboE90sxo6nNxnJxCJnoJZWjo+iPz3xDrU0TWU2Js
 cSE=
X-SBRS: 2.7
X-MesageID: 5458512
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5458512"
Date: Fri, 6 Sep 2019 12:28:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190906102825.mmaphgw7hvoavmv4@Air-de-Roger>
References: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
 <20190829102059.bk4l7itydj73d3ua@Air-de-Roger>
 <20190906090107.GA25703@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906090107.GA25703@gao-cwp>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC Patch] xen/pt: Emulate FLR capability
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDU6MDE6MDlQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMTI6MjE6MTFQTSArMDIwMCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPiA+T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDU6MDI6MjdQTSArMDgwMCwg
Q2hhbyBHYW8gd3JvdGU6Cj4gPj4gQ3VycmVudGx5LCBmb3IgYSBIVk0gb24gWGVuLCBubyByZXNl
dCBtZXRob2QgaXMgdmlydHVhbGl6ZWQuIFNvIGluIGEgVk0ncwo+ID4+IHBlcnNwZWN0aXZlLCBh
c3NpZ25lZCBkZXZpY2VzIGNhbm5vdCBiZSByZXNldC4gQnV0IHNvbWUgZGV2aWNlcyByZWx5IG9u
IFBDSQo+ID4+IHJlc2V0IHRvIHJlY292ZXIgZnJvbSBoYXJkd2FyZSBoYW5ncy4gV2hlbiBiZWlu
ZyBhc3NpZ25lZCB0byBhIFZNLCB0aG9zZQo+ID4+IGRldmljZXMgY2Fubm90IGJlIHJlc2V0IGFu
ZCB3b24ndCB3b3JrIGFueSBsb25nZXIgaWYgYSBoYXJkd2FyZSBoYW5nIG9jY3Vycy4KPiA+PiBX
ZSBoYXZlIHRvIHJlYm9vdCBWTSB0byB0cmlnZ2VyIFBDSSByZXNldCBvbiBob3N0IHRvIHJlY292
ZXIgdGhlIGRldmljZS4KPiA+Pgo+ID4+IFRoaXMgcGF0Y2ggZXhwb3NlcyBGTFIgY2FwYWJpbGl0
eSB0byBWTXMgaWYgdGhlIGFzc2lnbmVkIGRldmljZSBjYW4gYmUgcmVzZXQgb24KPiA+PiBob3N0
LiBXaGVuIFZNIGluaXRpYXRlcyBhbiBGTFIgdG8gYSBkZXZpY2UsIHFlbXUgY2xlYW5zIHVwIHRo
ZSBkZXZpY2Ugc3RhdGUsCj4gPj4gKGluY2x1ZGluZyBkaXNhYmxpbmcgb2YgaW50eCBhbmQvb3Ig
TVNJIGFuZCB1bm1hcHBpbmcgQkFScyBmcm9tIGd1ZXN0LCBkZWxldGluZwo+ID4+IGVtdWxhdGVk
IHJlZ2lzdGVycyksIHRoZW4gaW5pdGlhdGUgUENJIHJlc2V0IHRocm91Z2ggJ3Jlc2V0JyBrbm9i
IHVuZGVyIHRoZQo+ID4+IGRldmljZSdzIHN5c2ZzLCBmaW5hbGx5IGluaXRpYWxpemUgdGhlIGRl
dmljZSBhZ2Fpbi4KPiA+Cj4gPkkgdGhpbmsgeW91IGxpa2VseSBuZWVkIHRvIGRlYXNzaWduIHRo
ZSBkZXZpY2UgZnJvbSB0aGUgVk0sIHBlcmZvcm0KPiA+dGhlIHJlc2V0LCBhbmQgdGhlbiBhc3Np
Z24gdGhlIGRldmljZSBhZ2Fpbiwgc28gdGhhdCB0aGVyZSdzIG5vIFhlbgo+ID5pbnRlcm5hbCBz
dGF0ZSBjYXJyaWVkIG92ZXIgcHJpb3IgdG8gdGhlIHJlc2V0Pwo+IAo+IFllcy4gSXQgaXMgdGhl
IHNhZmVzdCB3YXkuIEJ1dCBoZXJlIEkgd2FudCB0byBwcmVzZW50IHRoZSBmZWF0dXJlIGFzIEZM
Ugo+IChzdWNoIHRoYXQgdGhlIGRldmljZSBkcml2ZXIgaW4gZ3Vlc3QgY2FuIGlzc3VlIFBDSSBy
ZXNldCB3aGVuZXZlcgo+IG5lZWRlZCBhbmQgbm8gY2hhbmdlIGlzIG5lZWRlZCB0byBkZXZpY2Ug
ZHJpdmVyKS4gIEN1cnJlbnQgZGV2aWNlCj4gZGVhc3NpZ25tZW50IG5vdGlmaWVzIGd1ZXN0IHRo
YXQgdGhlIGRldmljZSBpcyBnb2luZyB0byBiZSByZW1vdmVkCgpJbiB3aGljaCB3YXkgZG9lcyBh
IGd1ZXN0IGdldCBub3RpZmllZD8KCkFGQUlDVCBYRU5fRE9NQ1RMX2RlYXNzaWduX2RldmljZSBk
b2Vzbid0IGRvIGFueSBraW5kIG9mIGd1ZXN0Cm5vdGlmaWNhdGlvbiwgaXQganVzdCB0ZWFycyBk
b3duIHRoZSBkZXZpY2UuCgo+IEl0IGlzIG5vdCB0aGUgc3RhbmRhcmQgUENJIHJlc2V0LiBJcyBp
dCBwb3NzaWJsZSB0byBtYWtlIGd1ZXN0IHVuYXdhcmUKPiBvZiB0aGUgZGV2aWNlIGRlYXNzaWdu
bWVudCB0byBlbXVsYXRlIGEgc3RhbmRhcmQgUENJIHJlc2V0PwoKVGhhdCB3b3VsZCBiZSBteSBl
eHBlY3RhdGlvbi4gU3VjaCBkZWFzc2lnbm1lbnQvYXNzaWdubWVudCBzaG91bGQgYmUKY29tcGxl
dGVseSB0cmFuc3BhcmVudCBmcm9tIGEgZ3Vlc3QgUG9WLiBNeSBzdWdnZXN0aW9uIGZvciBkb2lu
Zwp0aGUgcmVhc3NpZ25tZW50IGlzIHRvIGVuc3VyZSB0aGVyZSdzIG5vIGRldmljZSBzdGF0ZSBj
YXJyaWVkIG92ZXIuCgo+IEluIG15IG1pbmQsCj4gd2UgY2FuIGV4cG9zZSBkb19wY2lfcmVtb3Zl
L2FkZCB0byBxZW11IG9yIHJld3JpdGUgdGhlbSBpbiBxZW11IChidXQKPiBkb24ndCByZW1vdmUg
dGhlIGRldmljZSBmcm9tIGd1ZXN0J3MgUENJIGhpZXJhcmNoeSkuIERvIHlvdSB0aGluayBpdCBp
cwo+IHRoZSByaWdodCBkaXJlY3Rpb24/CgpEb2luZyBhbGwgdGhpcyBjbGVhbnVwIHdpdGhvdXQg
cmVhc3NpZ25pbmcgdGhlIGRldmljZSBzZWVtcyBtb3JlCmNvbXBsaWNhdGVkIGFuZCBsaWtlbHkg
dG8gbWlzcyBzdHVmZiB0byBjbGVhbnVwIElNTywgYnV0IGFzIGxvbmcgYXMKeW91IGNhbiBndWFy
YW50ZWUgdGhlcmUncyBubyBzdGF0ZSBjYXJyaWVkIG92ZXIgZnJvbSBiZWZvcmUgdGhlIHJlc2V0
Cml0IHNob3VsZCBiZSBmaW5lLgoKSSB0aGluayB5b3UgYWxzbyBuZWVkIHNvbWUgZG9tMCBjb29w
ZXJhdGlvbiBmb3IgdGhpcywgc28gdGhhdCBmb3IKZXhhbXBsZSB0aGUgQkFScyBhcmUgY29ycmVj
dGx5IHJlLXBvc2l0aW9uZWQgYWZ0ZXIgdGhlIHJlc2V0PwoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

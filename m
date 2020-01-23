Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D5146815
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 13:34:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iubeZ-0008P8-BP; Thu, 23 Jan 2020 12:32:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AKOf=3M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iubeX-0008Oz-DS
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 12:32:05 +0000
X-Inumbo-ID: 5c62c175-3ddc-11ea-be15-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c62c175-3ddc-11ea-be15-12813bfff9fa;
 Thu, 23 Jan 2020 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579782724;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LXOX381uirJk1+7BmjAQOZpwZ1S7VHIQabln4Lp4ypY=;
 b=XFst6ebt2rF1+5eNe1ppiR3bcvtDI/m2uEHEXiH7N1C//+uiaHYHxVEV
 04qXqnJuyqrI5rhtg+9Oj02w/Qlqua5eIhZqWesvvaPe7YGA1CVzS5Abv
 bmgyJANDtzEhqJWt8fo9/H8JYAhe23S3zBf1u44tRX6ieo62FHEiJsddX o=;
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
IronPort-SDR: 5VFseHbHfXDGlMw+p416lr41rvSeBoLzluQ2iPygCJYvbFBWqy9rQ8XVTXosDqr1BKB6ZsrXx2
 Nl+um2KpTDodKA9CXXdjoxWPQQJvSQNs+FXSLMAiZmPNCp5oEqkMmNVvPQ82wzi1bh0ruaUIFY
 wsW24T6npxPnqGYzPil0SIs194Pf6D55BC75iQwox5V6X+nNLWZCjRUXJ2y7ykJV4q1HYeVPfK
 j3mi/GHuw02ElF769114McyHiZfAa5Gy2NjKv8YI4Ak+8fIUJn3Ct6TugPIW1UXNvIBTEyAUCt
 gyc=
X-SBRS: 2.7
X-MesageID: 11921443
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,353,1574139600"; d="scan'208";a="11921443"
Date: Thu, 23 Jan 2020 13:31:54 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200123123154.GC57924@desktop-tdan49n.eng.citrite.net>
References: <20200108103857.77236-1-roger.pau@citrix.com>
 <20200108103857.77236-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739C38@SHSMSX104.ccr.corp.intel.com>
 <20200120101906.GW11756@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D73E81C@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D73E81C@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] nvmx: fix handling of interrupts
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
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMDM6MzQ6MTNBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+
IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAyMCwgMjAyMCA2OjE5IFBNCj4gPiAKPiA+IE9uIFN1biwg
SmFuIDE5LCAyMDIwIGF0IDA0OjE1OjA0QU0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3RlOgo+ID4g
PiA+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4g
U2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDgsIDIwMjAgNjozOSBQTQo+ID4gPiA+Cj4gPiA+ID4g
V2hlbiBkb2luZyBhIHZpcnR1YWwgdm1leGl0IChpZTogYSB2bWV4aXQgaGFuZGxlZCBieSB0aGUg
TDEgVk1NKQo+ID4gPiA+IGludGVycnVwdHMgc2hvdWxkbid0IGJlIGluamVjdGVkIHVzaW5nIHRo
ZSB2aXJ0dWFsIGludGVycnVwdCBkZWxpdmVyeQo+ID4gPiA+IG1lY2hhbmlzbSwgYW5kIGluc3Rl
YWQgc2hvdWxkIGJlIHNpZ25hbGVkIGluIHRoZSB2bWNzIHVzaW5nIHRoZSBleGl0Cj4gPiA+ID4g
cmVhc29uIGFuZCB0aGUgaW50ZXJydXB0aW9uLWluZm9ybWF0aW9uIGZpZWxkIGlmIHRoZSAiQWNr
bm93bGVkZ2UKPiA+ID4gPiBpbnRlcnJ1cHQgb24gZXhpdCIgdm1leGl0IGNvbnRyb2wgaXMgc2V0
Lgo+ID4gPiA+Cj4gPiA+ID4gUmVtb3ZlIHRoZSBudm14X3VwZGF0ZV9hcGljdiBoZWxwZXI6IGl0
J3MgYm9ndXMgdG8gYXR0ZW1wdCB0byBpbmplY3QKPiA+ID4gPiBpbnRlcnJ1cHRzIG9uIHZpcnR1
YWwgdm1leGl0IHVzaW5nIHRoZSB2aXJ0dWFsIGludGVycnVwdCBkZWxpdmVyeQo+ID4gPiA+IGFz
c2lzdGFuY2UsIGFuZCBpdCdzIGFsc28gYm9ndXMgdG8gYWNrIGludGVycnVwdHMgd2l0aG91dCBj
aGVja2luZyBpZgo+ID4gPiA+IHRoZSB2bWV4aXQgIkFja25vd2xlZGdlIGludGVycnVwdCBvbiBl
eGl0IiB2bWV4aXQgY29udHJvbCBpcyBzZXQuCj4gPiA+ID4gbnZteF9pbnRyX2ludGVyY2VwdCBh
bHJlYWR5IGhhbmRsZXMgaW50ZXJydXB0cyBjb3JyZWN0bHkgb24gdmlydHVhbAo+ID4gPiA+IHZt
ZXhpdC4KPiA+ID4gPgo+ID4gPiA+IE5vdGUgdGhhdCB0aGlzIGZpeGVzIHRoZSB1c2FnZSBvZiB4
MkFQSUMgYnkgdGhlIEwxIFZNTSwgYXQgbGVhc3Qgd2hlbgo+ID4gPiA+IHRoZSBMMSBWTU0gaXMg
WGVuLgo+ID4gPgo+ID4gPiB3aGlsZSB0aGlzIGZpeCBtYWtlcyBzZW5zZSB0byBtZSwgY2FuIHlv
dSBhbHNvIHRlc3Qgb3RoZXIgTDEgVk1NcywKPiA+ID4gc28gd2UgZG9uJ3Qgb3Zlcmxvb2sgc29t
ZSBvdGhlciBpbnRlbnRpb25zIGNvdmVyZWQgb3IgaGlkZGVuIGJ5Cj4gPiA+IHJlbW92ZWQgbG9n
aWM/Cj4gPiAKPiA+IEkgY291bGQgdGVzdCBvdGhlciBoeXBlcnZpc29ycywgYnV0IGRvIHdlIHJl
YWxseSBleHBlY3QgYW55dGhpbmcKPiA+IHRoYXQncyBub3QgWGVuIG9uIFhlbiB0byB3b3JrPwo+
ID4gCj4gPiBJJ20gYXNraW5nIGJlY2F1c2UgdGhhdCdzIHRoZSBvbmx5IGNvbWJpbmF0aW9uIHRo
YXQncyBhY3R1YWxseSB0ZXN0ZWQKPiA+IGJ5IG9zc3Rlc3QuCj4gPiAKPiA+IFRoYW5rcywgUm9n
ZXIuCj4gCj4gSWYgb3RoZXJzIGFyZSBPSyB3aXRoIHlvdXIgYXNzdW1wdGlvbiwgdGhlbiBpdCdz
IGZpbmUuIEkgZGlkbid0IHRpZ2h0bHkgCj4gZm9sbG93IHRoZSBuZXN0ZWQgdmlydHVhbGl6YXRp
b24gcmVxdWlyZW1lbnRzIGluIFhlbi4KPiAKPiBPbiB0aGUgb3RoZXIgaGFuZCwgSSB0aGluayB0
aGlzIHBhdGNoIG5lZWRzIGEgcmV2aXNpb24uIEl0IGlzIG5vdCBib2d1cwo+IHRvIHVzZSB2aXJ0
dWFsIGludGVycnVwdCBkZWxpdmVyeSBvbiB2aXJ0dWFsIFZNZXhpdCwgaWYgIkFjayBpbnRlcnJ1
cHQKPiBvbiBleGl0IiBpcyBvZmYuIEluIHN1Y2ggY2FzZSwgdGhlIGRlbGl2ZXJ5IGRvZXNuJ3Qg
aGFwcGVuIHVudGlsIEwxIAo+IGh5cGVydmlzb3IgZW5hYmxlcyBpbnRlcnJ1cHQgdG8gY2xlYXIg
aW50ZXJydXB0IHdpbmRvdy4gVGhlbiBpdCBkb2VzCj4gc2F2ZSBvbmUgZXhpdC4gVGhlIG9ubHkg
Ym9ndXMgcG9pbnQgaXMgdGhhdCBudm14X3VkcGF0ZV9hcGljdiBkb2Vzbid0Cj4gY2hlY2sgIkFj
ayBpbnRlcnJ1cHQgb24gZXhpdCIuIFNvIEkgcHJlZmVyIHRvIGFkZCBzdWNoIGNoZWNrIHRoZXJl
IAo+IGluc3RlYWQgb2YgY29tcGxldGVseSByZW1vdmluZyB0aGlzIG9wdGltaXphdGlvbi4KCkkg
d2VudCBiYWNrIG92ZXIgdGhpcywgYW5kIEknbSBzdGlsbCBub3Qgc3VyZSBjYWxsaW5nCm52bXhf
dXBkYXRlX2FwaWN2IGlzIGFjdHVhbGx5IHJlcXVpcmVkOiBBRkFJQ1Qgdm14X2ludHJfYXNzaXN0
IHdpbGwKYWxyZWFkeSBpbmplY3QgdGhlIGludGVycnVwdCBjb3JyZWN0bHkgdXNpbmcgdmlydHVh
bCBpbnRlcnJ1cHQKZGVsaXZlcnkgaWYgbGVmdCBwZW5kaW5nIG9uIHRoZSB2bGFwaWMuIEkgZ3Vl
c3MgdGhlIGNvZGUgaW4KbnZteF91cGRhdGVfYXBpY3YgZG9lc24ndCBodXJ0IGFzIGxvbmcgYXMg
aXQncyBnYXRlZCBvbiAiQWNrIG9uIGV4aXQiCm5vdCBiZWluZyBlbmFibGVkLCBidXQgaXQncyBs
aWtlbHkgcmVkdW5kYW50LgoKSSB3aWxsIHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBhbnl3YXksIHNp
bmNlIEkgd291bGQgbGlrZSB0byBnZXQgdGhpcwpzb3J0ZWQgb3V0IHNvb25lciByYXRoZXIgdGhh
biBsYXRlciBhbmQgd2lsbCBmb2xsb3cgeW91ciBhZHZpc2Ugb2YKbGVhdmluZyBudm14X3VwZGF0
ZV9hcGljdiBpbiBwbGFjZSBnYXRlZCBieSBhIGNoZWNrIG9mIHdoZXRoZXIgIkFjayBvbgpleGl0
IiBpcyBub3QgZW5hYmxlZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs

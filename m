Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F49A15F5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:29:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HdR-0005Gt-DZ; Thu, 29 Aug 2019 10:26:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8sxS=WZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i3HdP-0005Go-E4
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:26:31 +0000
X-Inumbo-ID: 75b11972-ca47-11e9-ae64-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75b11972-ca47-11e9-ae64-12813bfff9fa;
 Thu, 29 Aug 2019 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567074388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IPPo/sG5zuQ6cWpX/Uo77blWksr+xdZ9KhEGVlMeIFY=;
 b=c4VH/fa8OFJBei/yuaST7/gVXkkiAdIYKEv6A6B65knwFJaGrDmY5C9D
 ulw7JYRu0ql+R7lvHixPkVBcUGetQxRdM8YUXQSM2aeUMOISbaq4eVEoa
 Heup3wVtR1tX3QqKAZPT6S4q7w75VlgPfeJceIqE0QcHsZHwTicBKQNeX g=;
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
IronPort-SDR: YgaF/wtFcDCT2jbzmVz1dlCAIMlQsc27Nd7Tkbo9jC2o8DEV4VyFbjNwl98WrozH3SDGKZ6XWv
 Vk/RnNGoXeZ2ZG/j1DQVvfjh9lxMK5Zw3k3mUekvdqAY5UgOgvs+BPGk1OCi6gzqDpnbVR1wlV
 D2Y/31eRvVNEH6yBU80TQHHld5pC8XN5AcMScInErRdKtXWk8JeOrZEHNvGbAI4s7hjgGOY1uf
 ZCZ6mDaejDswFfLq+GHzgqhPCnsktX07HfEJ7oagSzBDP07bgotGG5P5QdMpYMpiweW8F270zd
 wvk=
X-SBRS: 2.7
X-MesageID: 5095846
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="5095846"
Date: Thu, 29 Aug 2019 12:26:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190829102620.6gut2dmpouynbj44@Air-de-Roger>
References: <20190820153745.40103-1-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D545BBD@SHSMSX104.ccr.corp.intel.com>
 <824ee21b-d9d9-434b-2125-25420cadfcea@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <824ee21b-d9d9-434b-2125-25420cadfcea@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] p2m/ept: pass correct level to
 atomic_write_ept_entry in ept_invalidate_emt
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDU6MjM6MzNQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjMuMDguMjAxOSAwNzo1OCwgIFRpYW4sIEtldmluICB3cm90ZToKPiA+ID4gRnJv
bTogUm9nZXIgUGF1IE1vbm5lIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4gPiA+IFNl
bnQ6IFR1ZXNkYXksIEF1Z3VzdCAyMCwgMjAxOSAxMTozOCBQTQo+ID4gPiAKPiA+ID4gVGhlIGxl
dmVsIHBhc3NlZCB0byBlcHRfaW52YWxpZGF0ZV9lbXQgY29ycmVzcG9uZHMgdG8gdGhlIEVQVCBl
bnRyeQo+ID4gPiBwYXNzZWQgYXMgdGhlIG1mbiBwYXJhbWV0ZXIsIHdoaWNoIGlzIGEgcG9pbnRl
ciB0byBhbiBFUFQgcGFnZSB0YWJsZSwKPiA+ID4gaGVuY2UgdGhlIGVudHJpZXMgaW4gdGhhdCBw
YWdlIHRhYmxlIHdpbGwgaGF2ZSBvbmUgbGV2ZWwgbGVzcyB0aGFuIHRoZQo+ID4gPiBwYXJlbnQu
Cj4gPiA+IAo+ID4gPiBGaXggdGhlIGNhbGwgdG8gYXRvbWljX3dyaXRlX2VwdF9lbnRyeSB0byBw
YXNzIHRoZSBjb3JyZWN0IGxldmVsLCBpZToKPiA+ID4gb25lIGxldmVsIGxlc3MgdGhhbiB0aGUg
cGFyZW50Lgo+ID4gPiAKPiA+ID4gRml4ZXM6IDUwZmU2ZTczNzA1ICgncHZoIGRvbTA6IGFkZCBh
bmQgcmVtb3ZlIGZvcmVpZ24gcGFnZXMnKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+ID4gLS0tCj4gPiA+IENjOiBKdW4gTmFr
YWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4gPiA+IENjOiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4KPiA+ID4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
ZXUuY2l0cml4LmNvbT4KPiA+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
PiA+ID4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiA+
IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gPiBDYzogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5
LmR5YXNsaUBjaXRyaXguY29tPgo+ID4gPiBDYzogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgeGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyB8
IDIgKy0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jIGIv
eGVuL2FyY2gveDg2L21tL3AybS1lcHQuYwo+ID4gPiBpbmRleCA2Yjg0NjhjNzkzLi4yM2FlNmU5
ZGEzIDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jCj4gPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKPiA+ID4gQEAgLTM2Nyw3ICszNjcsNyBAQCBz
dGF0aWMgYm9vbF90IGVwdF9pbnZhbGlkYXRlX2VtdChzdHJ1Y3QgcDJtX2RvbWFpbgo+ID4gPiAq
cDJtLCBtZm5fdCBtZm4sCj4gPiA+ICAgICAgICAgICBlLmVtdCA9IE1UUlJfTlVNX1RZUEVTOwo+
ID4gPiAgICAgICAgICAgaWYgKCByZWNhbGMgKQo+ID4gPiAgICAgICAgICAgICAgIGUucmVjYWxj
ID0gMTsKPiA+ID4gLSAgICAgICAgcmMgPSBhdG9taWNfd3JpdGVfZXB0X2VudHJ5KHAybSwgJmVw
dGVbaV0sIGUsIGxldmVsKTsKPiA+ID4gKyAgICAgICAgcmMgPSBhdG9taWNfd3JpdGVfZXB0X2Vu
dHJ5KHAybSwgJmVwdGVbaV0sIGUsIGxldmVsIC0gMSk7Cj4gPiA+ICAgICAgICAgICBBU1NFUlQo
cmMgPT0gMCk7Cj4gPiA+ICAgICAgICAgICBjaGFuZ2VkID0gMTsKPiA+ID4gICAgICAgfQo+ID4g
Cj4gPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Lgo+ID4g
Cj4gPiBPbmUgc21hbGwgY29tbWVudCBhYm91dCByZWFkYWJpbGl0eS4gV2hhdCBhYm91dCByZW5h
bWluZyAnbGV2ZWwnCj4gPiB0byAncGFyZW50X2xldmVsJyBpbiB0aGlzIGZ1bmN0aW9uPwo+IAo+
IEFuZCBhbHNvIHRha2luZyB0aGUgb3Bwb3J0dW5pdHkgYW5kIG1ha2luZyBpdCB1bnNpZ25lZCBp
bnQ/CgpJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgdGhpcywgYW5kIEknbSBub3Qgc3VyZSByZW5h
bWluZyBsZXZlbCB0bwpwYXJlbnRfbGV2ZWwgaXMgY29ycmVjdCwgbGV2ZWwgYWN0dWFsbHkgbWF0
Y2hlcyB0aGUgbGV2ZWwgb2YgdGhlIG1mbgphbHNvIHBhc3NlZCBhcyBhIHBhcmFtZXRlciwgYW5k
IGhlbmNlIGl0J3MgY29ycmVjdC4gSXQncyB0aGUgZnVuY3Rpb24KaXRzZWxmIHRoYXQgYWN0dWFs
bHkgaXRlcmF0ZXMgb3ZlciB0aGUgcGFnZSB0YWJsZSBlbnRyaWVzLCBhbmQgaGVuY2UKZGVzY2Vu
ZHMgb25lIGxldmVsIGludG8gdGhlIHBhZ2UgdGFibGVzLgoKaWU6IEkgY291bGQgYWRkIHNvbWV0
aGluZyBsaWtlIEFTU0VSVChsZXZlbCkgdG8gbWFrZSBzdXJlIG5vIGxldmVsIDAKZW50cmllcyBh
cmUgcGFzc2VkIHRvIHRoZSBmdW5jdGlvbiwgYnV0IHJlbmFtaW5nIGRvZXNuJ3Qgc2VlbSBjb3Jy
ZWN0CnRvIG1lLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

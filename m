Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3D1A83E3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 15:42:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5VWB-0003a6-FN; Wed, 04 Sep 2019 13:40:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mPyZ=W7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5VWA-0003a0-Fh
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:40:14 +0000
X-Inumbo-ID: 856bec8a-cf19-11e9-b299-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 856bec8a-cf19-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567604413;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k9iictQqRgMOvBA/GhkdYlnJ5qa5P/3l7mLoIPOHiRY=;
 b=Vhk5aPklTi4QFEbV14hoT/9LER1m3Q/kxZNyyBpwVQE3FMMoROjIztnA
 RVfsrSYZ02kxGQ5aBzPov66es02OIXDBzvKy/GzHuoPpT1TtCmZ8gT404
 4FKVmd4s0lZxq/woVoVoc5h/fAZiIU9UJcSSa9DW83lP1PONW0/M/nkTy g=;
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
IronPort-SDR: Fil0i924O9xXa67Fl5L6tdMsKtxPcY5w47zqiJRAlx5F84wWdz+iN2n9STYGleEJDTKpYiahiq
 y4DiYjWTFGQqa9fCDXoMnLaFAifKMr0kQsfpy3nEGPRHoirYsLrhqYCEBuotsjTV+d8Ssc6oYY
 kNlth8PpyYhH1zA4wQpsd48d65kUZS7Qmp8mU98A9whZKkaPr8QBOsIBM42hBpKi5854pZ2dqe
 C5H54K9tr45U/AVQQxryN/FTNVDwhDrCKXbciKuhiALa3qbFeqLAAEdxieWifxuqB1e2dq+KXP
 G4U=
X-SBRS: 2.7
X-MesageID: 5339194
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,467,1559534400"; 
   d="scan'208";a="5339194"
Date: Wed, 4 Sep 2019 15:39:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190904133957.2g2sxfvhfbf7n3x3@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-3-roger.pau@citrix.com>
 <c626a063-f657-d614-eea5-dcfca3df46f0@citrix.com>
 <20190904074923.ji76uhn2kr7rff4b@Air-de-Roger>
 <a0d458949642478786ce606761bf2726@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0d458949642478786ce606761bf2726@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 02/11] ioreq: terminate cf8 handling at
 hypervisor level
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMTE6NDY6MjRBTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAwNCBTZXB0ZW1iZXIgMjAxOSAw
ODo0OQo+ID4gVG86IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+Cj4g
PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBQYXVsIER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2gKPiA+IDxqYmV1bGljaEBzdXNlLmNvbT47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAyLzExXSBp
b3JlcTogdGVybWluYXRlIGNmOCBoYW5kbGluZyBhdCBoeXBlcnZpc29yIGxldmVsCj4gPiAKPiA+
IE9uIFR1ZSwgU2VwIDAzLCAyMDE5IGF0IDA2OjEzOjU5UE0gKzAxMDAsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4gPiA+IE9uIDAzLzA5LzIwMTkgMTc6MTQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToK
PiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIGIveGVuL2FyY2gv
eDg2L2h2bS9pb3JlcS5jCj4gPiA+ID4gaW5kZXggNjkyYjcxMGIwMi4uNjk2NTJlMTA4MCAxMDA2
NDQKPiA+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKPiA+ID4gPiArKysgYi94
ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKPiA+ID4gPiBAQCAtMTAxNSw2ICsxMDE1LDEyIEBAIGlu
dCBodm1fbWFwX2lvX3JhbmdlX3RvX2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLCBpb3Nl
cnZpZF90IGlkLAo+ID4gPiA+ICAgICAgc3dpdGNoICggdHlwZSApCj4gPiA+ID4gICAgICB7Cj4g
PiA+ID4gICAgICBjYXNlIFhFTl9ETU9QX0lPX1JBTkdFX1BPUlQ6Cj4gPiA+ID4gKyAgICAgICAg
cmMgPSAtRUlOVkFMOwo+ID4gPiA+ICsgICAgICAgIC8qIFBDSSBjb25maWcgc3BhY2UgYWNjZXNz
ZXMgYXJlIGhhbmRsZWQgaW50ZXJuYWxseS4gKi8KPiA+ID4gPiArICAgICAgICBpZiAoIHN0YXJ0
IDw9IDB4Y2Y4ICsgOCAmJiAweGNmOCA8PSBlbmQgKQo+ID4gPiA+ICsgICAgICAgICAgICBnb3Rv
IG91dDsKPiA+ID4gPiArICAgICAgICBlbHNlCj4gPiA+ID4gKyAgICAgICAgICAgIC8qIGZhbGx0
aHJvdWdoLiAqLwo+ID4gPgo+ID4gPiBZb3UgbmVlZCB0byBkcm9wIHRoZSBlbHNlLCBvciBpdCBt
YXkgc3RpbGwgdHJpZ2dlciB3YXJuaW5ncy4KPiA+IAo+ID4gWWVzLCBteSBtaXN0YWtlLiBUaGUg
ZWxzZSBicmFuY2ggaXMgbm90IG5lZWRlZC4KPiA+IAo+ID4gPiBGdXJ0aGVybW9yZSwgcWVtdSBy
ZWdpc3RlcnMgY2Y4LWNmZiBzbyBJIHRoaW5rIHlvdSBuZWVkIHNvbWUgZml4LXVwcwo+ID4gPiB0
aGVyZSBmaXJzdCBiZWZvcmUgdGhyb3dpbmcgZXJyb3JzIGJhY2sgaGVyZS4KPiA+IAo+ID4gVGhl
IHZlcnNpb24gb2YgUUVNVSBJIGhhdmUgZG9lc24ndCBzZWVtIHRvIHJlZ2lzdGVyIDB4Y2Y4IG9y
IDB4Y2ZjLAo+ID4gdGhlcmUgYXJlIG5vIGVycm9ycyBvbiB0aGUgbG9nIGFuZCBRRU1VIHNlZW1z
IHRvIHdvcmsganVzdCBmaW5lLgo+ID4gCj4gPiBJIGFsd2F5cyBhc3N1bWVkIFFFTVUgd2FzIGdl
dHRpbmcgYWNjZXNzZXMgdG8gY2Y4L2NmYyBmb3J3YXJkZWQKPiA+IGJlY2F1c2UgaXQgd2FzIHRo
ZSBkZWZhdWx0IGRldmljZSBtb2RlbCwgYW5kIGV2ZXJ5dGhpbmcgbm90IHRyYXBwZWQgYnkKPiA+
IFhlbiB3b3VsZCBiZSBmb3J3YXJkZWQgdG8gaXQuIFRoaXMgZGVmYXVsdCBkZXZpY2UgbW9kZWwg
YmVoYXZpb3VyIHdhcwo+ID4gcmVtb3ZlZCBieSBQYXVsIHNvbWUgdGltZSBhZ28sIGFuZCBub3cg
UUVNVSByZWdpc3RlcnMgZXhwbGljaXRseSB3aGljaAo+ID4gSU8gYWNjZXNzZXMgaXQgd2FudHMg
dG8gdHJhcC4KPiAKPiBZZXMsIGl0IHVzZWQgdG8gbmVlZCB0aGVtIHRvIHdvcmsgY29ycmVjdGx5
IGFzIGEgZGVmYXVsdCBlbXVsYXRvci4gSG93ZXZlciwgd2UgZG9uJ3QgZ2VuZXJhbGx5IHN0b3Ag
YW4gZXh0ZXJuYWwgZW11bGF0b3IgZnJvbSByZWdpc3RlcmluZyByYW5nZXMgdGhhdCBhcmUgaGFu
ZGxlZCBieSBlbXVsYXRpb24gZGlyZWN0bHkgaW4gWGVuIChlLmcuIHBtdGltZXIpIHNvIEkgZG9u
J3QgdGhpbmsgeW91IG5lZWQgc3BlY2lhbC1jYXNlIHRoZXNlIHBvcnRzLgoKVGhhdCdzIHJpZ2h0
LCBzbyBJIGd1ZXNzIEkgd291bGQganVzdCByZW1vdmUgdGhhdCBjaGVjayAoYW5kIHRoZSBvbmUK
aW50cm9kdWNlZCBmb3IgTUNGRyByZWdpb25zKS4gV2UgYWxzbyBkb24ndCBjaGVjayB3aGV0aGVy
IGFueSBvdGhlcgppb3JlcSBzZXJ2ZXIgaGFzIGFscmVhZHkgcmVnaXN0ZXJlZCBhIHJhbmdlLgoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

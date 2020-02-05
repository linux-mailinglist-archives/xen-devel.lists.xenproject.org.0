Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795481531B4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:23:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKcr-0006P0-Dm; Wed, 05 Feb 2020 13:21:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HwEA=3Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izKcq-0006Ov-Oo
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:21:52 +0000
X-Inumbo-ID: 7868b6ba-481a-11ea-8396-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7868b6ba-481a-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 13:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580908911;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CyBBZymLZG/9vB6oGvBhxDPwv8AmTiHOY1Zww3rtSxc=;
 b=DR6NCnOSXMAByzj1WOxN+TP9YiL/5gETDu9xEYb16TK68IlDw4MGiBA9
 LPkqAWzzc8F733qvUk3D1pUSKC6LnFnH3G4Ig5inhXQhAinsQfHy7zR15
 bq84dC4FwjfHWUV5AcQ99GARfOsZSrhOVv4GM8oPH0E63trYx4NBc0H/g s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mU72kfUkgcM4zPUbG24FnNQp1SpdjmL2y5hM+y4orz0ectNeywpure/UVK032vhSM6btC0f7nn
 OnCXkXD9ChxVEZRZDdh2VAyBzkheg3G+ejEp87v3On7K2LIigCCNtp8ib82j8YCt+jq7Rfx8YG
 i0crYn500PEDDh/6lO9haQVoFIzOMs5KEkodu7zisBAzMq8jkzjArflPjLlIWsS73TZ8QEtwVM
 y5BLaTJwL/16SaQat/cR+o14jsoi8FdoNt6PnyTJRmZYHCVjLF6FKfrJiJzBaqCfJ9Gfe2KdYQ
 flQ=
X-SBRS: 2.7
X-MesageID: 12352190
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,405,1574139600"; d="scan'208";a="12352190"
Date: Wed, 5 Feb 2020 14:21:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200205132144.GS4679@Air-de-Roger>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-3-roger.pau@citrix.com>
 <3d067f06-a054-bbe1-916e-ef43e2527f45@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d067f06-a054-bbe1-916e-ef43e2527f45@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDk6NDY6MjVBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMDIuMjAyMCAxODozNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gSW1w
b3J0IHRoZSBmdW5jdGlvbnMgYW5kIGl0J3MgZGVwZW5kZW5jaWVzLiBCYXNlZCBvbiBMaW51eCA1
LjUsIGNvbW1pdAo+ID4gaWQgZDUyMjZmYTZkYmFlMDU2OWVlNDNlY2ZjMDhiZGNkNjc3MGZjNDc1
NS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gCj4gVGhhbmtzIGZvciBnb2luZyB0aGlzIHJvdXRlOyB0d28gcmVtYXJrcyAv
IHJlcXVlc3RzOgo+IAo+ID4gLS0tIGEveGVuL2NvbW1vbi9iaXRtYXAuYwo+ID4gKysrIGIveGVu
L2NvbW1vbi9iaXRtYXAuYwo+ID4gQEAgLTIxMiw2ICsyMTIsNDcgQEAgaW50IF9fYml0bWFwX3dl
aWdodChjb25zdCB1bnNpZ25lZCBsb25nICpiaXRtYXAsIGludCBiaXRzKQo+ID4gICNlbmRpZgo+
ID4gIEVYUE9SVF9TWU1CT0woX19iaXRtYXBfd2VpZ2h0KTsKPiA+ICAKPiA+ICt2b2lkIF9fYml0
bWFwX3NldCh1bnNpZ25lZCBsb25nICptYXAsIHVuc2lnbmVkIGludCBzdGFydCwgaW50IGxlbikK
PiA+ICt7Cj4gPiArCXVuc2lnbmVkIGxvbmcgKnAgPSBtYXAgKyBCSVRfV09SRChzdGFydCk7Cj4g
PiArCWNvbnN0IHVuc2lnbmVkIGludCBzaXplID0gc3RhcnQgKyBsZW47Cj4gPiArCWludCBiaXRz
X3RvX3NldCA9IEJJVFNfUEVSX0xPTkcgLSAoc3RhcnQgJSBCSVRTX1BFUl9MT05HKTsKPiA+ICsJ
dW5zaWduZWQgbG9uZyBtYXNrX3RvX3NldCA9IEJJVE1BUF9GSVJTVF9XT1JEX01BU0soc3RhcnQp
Owo+ID4gKwo+ID4gKwl3aGlsZSAobGVuIC0gYml0c190b19zZXQgPj0gMCkgewo+ID4gKwkJKnAg
fD0gbWFza190b19zZXQ7Cj4gPiArCQlsZW4gLT0gYml0c190b19zZXQ7Cj4gPiArCQliaXRzX3Rv
X3NldCA9IEJJVFNfUEVSX0xPTkc7Cj4gPiArCQltYXNrX3RvX3NldCA9IH4wVUw7Cj4gPiArCQlw
Kys7Cj4gPiArCX0KPiA+ICsJaWYgKGxlbikgewo+ID4gKwkJbWFza190b19zZXQgJj0gQklUTUFQ
X0xBU1RfV09SRF9NQVNLKHNpemUpOwo+ID4gKwkJKnAgfD0gbWFza190b19zZXQ7Cj4gPiArCX0K
PiA+ICt9Cj4gPiArRVhQT1JUX1NZTUJPTChfX2JpdG1hcF9zZXQpOwo+ID4gKwo+ID4gK3ZvaWQg
X19iaXRtYXBfY2xlYXIodW5zaWduZWQgbG9uZyAqbWFwLCB1bnNpZ25lZCBpbnQgc3RhcnQsIGlu
dCBsZW4pCj4gPiArewo+ID4gKwl1bnNpZ25lZCBsb25nICpwID0gbWFwICsgQklUX1dPUkQoc3Rh
cnQpOwo+ID4gKwljb25zdCB1bnNpZ25lZCBpbnQgc2l6ZSA9IHN0YXJ0ICsgbGVuOwo+ID4gKwlp
bnQgYml0c190b19jbGVhciA9IEJJVFNfUEVSX0xPTkcgLSAoc3RhcnQgJSBCSVRTX1BFUl9MT05H
KTsKPiA+ICsJdW5zaWduZWQgbG9uZyBtYXNrX3RvX2NsZWFyID0gQklUTUFQX0ZJUlNUX1dPUkRf
TUFTSyhzdGFydCk7Cj4gPiArCj4gPiArCXdoaWxlIChsZW4gLSBiaXRzX3RvX2NsZWFyID49IDAp
IHsKPiA+ICsJCSpwICY9IH5tYXNrX3RvX2NsZWFyOwo+ID4gKwkJbGVuIC09IGJpdHNfdG9fY2xl
YXI7Cj4gPiArCQliaXRzX3RvX2NsZWFyID0gQklUU19QRVJfTE9ORzsKPiA+ICsJCW1hc2tfdG9f
Y2xlYXIgPSB+MFVMOwo+ID4gKwkJcCsrOwo+ID4gKwl9Cj4gPiArCWlmIChsZW4pIHsKPiA+ICsJ
CW1hc2tfdG9fY2xlYXIgJj0gQklUTUFQX0xBU1RfV09SRF9NQVNLKHNpemUpOwo+ID4gKwkJKnAg
Jj0gfm1hc2tfdG9fY2xlYXI7Cj4gPiArCX0KPiA+ICt9Cj4gPiArRVhQT1JUX1NZTUJPTChfX2Jp
dG1hcF9jbGVhcik7Cj4gCj4gRGVzcGl0ZSBhbGwgdGhlIG90aGVyIEVYUE9SVF9TWU1CT0woKSBp
biB0aGlzIGZpbGUsIHBlcnNvbmFsbHkgSQo+IHdvdWxkIHN1Z2dlc3QgdG8gcmVmcmFpbiBmcm9t
IGFkZGluZyBtb3JlLiBCdXQgSSdtIG5vdCBnb2luZyB0bwo+IGluc2lzdCAodW50aWwgc3VjaCB0
aW1lIHRoYXQgdGhleSBhbGwgZ2V0IGNsZWFuZWQgdXApLgo+IAo+ID4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9iaXRvcHMuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9iaXRvcHMu
aAo+ID4gQEAgLTQ4MCw0ICs0ODAsNiBAQCBzdGF0aWMgaW5saW5lIGludCBmbHModW5zaWduZWQg
aW50IHgpCj4gPiAgI2RlZmluZSBod2VpZ2h0MTYoeCkgZ2VuZXJpY19od2VpZ2h0MTYoeCkKPiA+
ICAjZGVmaW5lIGh3ZWlnaHQ4KHgpIGdlbmVyaWNfaHdlaWdodDgoeCkKPiA+ICAKPiA+ICsjZGVm
aW5lIEJJVF9XT1JEKG5yKSAoKG5yKSAvIEJJVFNfUEVSX0xPTkcpCj4gCj4gQXQgZmlyc3QgSSB0
aG91Z2h0IC0gd2h5IGZvciB4ODYgb25seT8gVGhlbiBJIG5vdGljZWQgQXJtIGhhcyBhbgo+IGFs
bW9zdCBpZGVudGljYWwgI2RlZmluZSBhbHJlYWR5LiBXaGljaCBpbiB0dXJuIG1hZGUgbWUgbG9v
ayBhdAo+IExpbnV4LCB3aGVyZSB0aGF0ICNkZWZpbmUgbGl2ZXMgaW4gYSBjb21tb24gaGVhZGVy
LiBJIHRoaW5rIHlvdQo+IHdhbnQgdG8gbW92ZSB0aGUgQXJtIG9uZS4gT3Igd2FpdCwgbm8gLSBB
cm0ncyBpc24ndCBldmVuCj4gY29tcGF0aWJsZSB3aXRoIHRoZSBpbXBsZW1lbnRhdGlvbnMgb2Yg
dGhlIGZ1bmN0aW9ucyB5b3UgYWRkLgo+IFRoaXMgZGVmaW5pdGVseSBuZWVkcyB0YWtpbmcgY2Fy
ZSBvZiwgcGVyaGFwcyBieSB3YXkgb2YgaWdub3JpbmcKPiBteSByZXF1ZXN0IHRvIGdvIHRoaXMg
cm91dGUgKGFzIGdldHRpbmcgdG9vIGludm9sdmVkKS4KClVyZywgeWVzLCBJIGRpZG4ndCByZWFs
aXplIHRoYXQgQklUX1dPUkQgb24gQVJNIGlzIG9ubHkgbWVhbnQgdG8gYmUKdXNlZCB3aGVuIHRo
ZSBiaXRtYXAgaXMgbWFwcGVkIHRvIGFuIGFycmF5IG9mIDMyYml0IHR5cGUgZWxlbWVudHMuCgpJ
IGNvdWxkIGludHJvZHVjZSBCSVRfTE9ORyB0aGF0IHdvdWxkIGhhdmUgdGhlIHNhbWUgZGVmaW5p
dGlvbiBvbiBBcm0KYW5kIHg4NiwgYW5kIHRoZW4gbW9kaWZ5IHRoZSBpbXBvcnRlZCBmdW5jdGlv
bnMgdG8gdXNlIGl0LCBidXQgSU1PIHRoZQpyaWdodCBzb2x1dGlvbiB3b3VsZCBiZSB0byBjaGFu
Z2UgdGhlIEFybSBCSVRfV09SRCBtYWNybyB0byBhbHNvIHVzZQpCSVRTX1BFUl9MT05HIChhbmQg
YWRqdXN0IHRoZSBjYWxsZXJzKS4KClRoaXMgc2VlbXMgcXVpdGUgZmFyIG9mZiwgc28gaWYgeW91
IGRvbid0IG1pbmQgSSB3b3VsZCByYXRoZXIgaGF2ZSB0aGUKb3JpZ2luYWwgdjMgMi8yIHVzaW5n
IHNldF9iaXQ6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMjAtMDIvbXNnMDAxOTAuaHRtbAoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

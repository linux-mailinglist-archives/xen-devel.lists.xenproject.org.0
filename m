Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704D6AB755
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 13:49:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Cga-0001B4-6S; Fri, 06 Sep 2019 11:45:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6CgY-0001Aw-1s
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 11:45:50 +0000
X-Inumbo-ID: d8484f38-d09b-11e9-abf5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8484f38-d09b-11e9-abf5-12813bfff9fa;
 Fri, 06 Sep 2019 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567770338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QymniUJn/RPnm0IZMyN7HkkLhK1fjfoJxxLzc3Ouk00=;
 b=PmdFvLyP1js+43Pb10AoAiuMsHTTuQnTvVHUcu8Plc4jgwrWBVll73fD
 ULdkm5s/E6M0SALWhyhOGcB04lxKBN001CQTiOAWoNL9xHawjNOxyy/jr
 6i3HoMTi8PsGRMYja9UfY7T5vVxCJenoNZLE9TBu4qljwL4Dluo1pSqq+ c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b7SUE9RNQ5/aH/zc0yRqtoR73lzpkTxfogSWrXH8n7eM4UzZ8rnprfbAjE2LloUBlKbfQm0ry0
 ijIXLWqiUOt4+bwGhhHbhwW6VnJ9QeWEx/pIf67k8qQQEoZgQjFbYnCjtVOL5YmZqQ1h0i9A7r
 wsPXs6eECMIvECpdzl1ud1v7W54VYhy4El+42Gap5w6YkvUMWzSZ5fhRzYU/CgQx/5wgubtE+t
 pNgpB4ecrVsAgwMe93VGyrW+ETOj/N49N6ruRz5nUqpiTPJixuSjU17Sze/Baaw1gyFRN4xiqf
 iVw=
X-SBRS: 2.7
X-MesageID: 5415945
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5415945"
Date: Fri, 6 Sep 2019 13:45:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190906114531.sfkzr53souo36meq@Air-de-Roger>
References: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
 <20190906093707.wn5zn4nzqxrffwo3@Air-de-Roger>
 <b3ad1cbb-a45b-612c-28b1-e5c203b24676@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3ad1cbb-a45b-612c-28b1-e5c203b24676@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3] IOMMU/x86: make page type checks
 consistent when mapping pages
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
Cc: GeorgeDunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMTI6NTI6MTFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDYuMDkuMjAxOSAxMTozNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIEp1bCAwMywgMjAxOSBhdCAxMjoxODo0NVBNICswMDAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+PiArKysgYi94ZW4vYXJjaC94
ODYvbW0vcDJtLmMKPiA+PiBAQCAtODI5LDEzICs4MjksMTMgQEAgZ3Vlc3RfcGh5c21hcF9hZGRf
cGFnZShzdHJ1Y3QgZG9tYWluICpkLAo+ID4+ICAgICAgICAgICAgKgo+ID4+ICAgICAgICAgICAg
KiBSZXRhaW4gdGhpcyBwcm9wZXJ0eSBieSBncmFiYmluZyBhIHdyaXRhYmxlIHR5cGUgcmVmIGFu
ZCB0aGVuCj4gPj4gICAgICAgICAgICAqIGRyb3BwaW5nIGl0IGltbWVkaWF0ZWx5LiAgVGhlIHJl
c3VsdCB3aWxsIGJlIHBhZ2VzIHRoYXQgaGF2ZSBhCj4gPj4gLSAgICAgICAgICogd3JpdGFibGUg
dHlwZSAoYW5kIGFuIElPTU1VIGVudHJ5KSwgYnV0IGEgY291bnQgb2YgMCAoc3VjaCB0aGF0Cj4g
Pj4gLSAgICAgICAgICogYW55IGd1ZXN0LXJlcXVlc3RlZCB0eXBlIGNoYW5nZXMgc3VjY2VlZCBh
bmQgcmVtb3ZlIHRoZSBJT01NVQo+ID4+IC0gICAgICAgICAqIGVudHJ5KS4KPiA+PiArICAgICAg
ICAgKiB3cml0YWJsZSB0eXBlIChhbmQgYW4gSU9NTVUgZW50cnkgaWYgbmVjZXNzYXJ5KSwgYnV0
IGEgY291bnQgb2YgMAo+ID4+ICsgICAgICAgICAqIChzdWNoIHRoYXQgYW55IGd1ZXN0LXJlcXVl
c3RlZCB0eXBlIGNoYW5nZXMgc3VjY2VlZCBhbmQgcmVtb3ZlIHRoZQo+ID4+ICsgICAgICAgICAq
IElPTU1VIGVudHJ5KS4KPiA+PiAgICAgICAgICAgICovCj4gPj4gICAgICAgICAgIGZvciAoIGkg
PSAwOyBpIDwgKDFVTCA8PCBwYWdlX29yZGVyKTsgKytpLCArK3BhZ2UgKQo+ID4+ICAgICAgICAg
ICB7Cj4gPj4gLSAgICAgICAgICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4gPj4g
KyAgICAgICAgICAgIGlmICggIWlvbW11X2VuYWJsZWQgKQo+ID4gCj4gPiBUaGF0J3Mga2luZCBv
ZiBhIHN0cm9uZyBjaGVjayBmb3IgYSBkb21haW4gdGhhdCBtaWdodCBuZXZlciB1c2UgdGhlCj4g
PiBpb21tdSBhdCBhbGwuIElzbid0IGl0IGZpbmUgdG8ganVzdCByZWx5IG9uCj4gPiBhcmNoX2lv
bW11X3BvcHVsYXRlX3BhZ2VfdGFibGUgZmluZGluZyBub24td3JpdGFibGUgcGFnZXMgYW5kIHRo
dXMgbm90Cj4gPiBhZGRpbmcgdGhlbSB0byB0aGUgaW9tbXUgcGFnZS10YWJsZXM/Cj4gCj4gTm8g
LSB0aGUgY29kZSBjaGFuZ2UgaGVyZSBpcyB0byB0YWtlIGNhcmUgb2YgcGFnZSBhZGRpdGlvbnMg
dG8KPiB0aGUgZG9tYWluIGFmdGVyIGl0IGhhcyBib290ZWQuCgpQbGVhc2UgYmVhciB3aXRoIG1l
LCBidXQgQUZBSUNUIGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90YWJsZSBjb3VsZApiZSB1c2Vk
IGFmdGVyIHRoZSBkb21haW4gaGFzIGJvb3RlZCBpZiBhIHBjaSBkZXZpY2UgaXMgaG90IHBsdWdn
ZWQuCgpJZiB0aGlzIGlzIHRvIGRlYWwgd2l0aCBhZGRpdGlvbnMgdG8gZG9tYWlucyBoYXZpbmcg
YW4gaW9tbXUgYWxyZWFkeQplbmFibGVkLCBpc24ndCBpdCBlbm91Z2ggdG8gdXNlIG5lZWRfaW9t
bXVfcHRfc3luYz8KClRoYXQncyBnb2luZyB0byByZXR1cm4gdHJ1ZSBmb3IgYWxsIFBWIGRvbWFp
bnMsIGV4Y2VwdCBmb3IgZG9tMCBub3QKcnVubmluZyBpbiBzdHJpY3QgbW9kZSwgd2hpY2ggaXMg
ZXhwZWN0ZWQgYmVjYXVzZSBpbiB0aGF0IGNhc2UgZG9tMAphbHJlYWR5IGhhcyB0aGUgd2hvbGUg
UkFNIG1hcHBlZCBpbnRvIHRoZSBpb21tdSBwYWdlLXRhYmxlcz8KCj4gCj4gPj4gLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2lvbW11LmMKPiA+PiBAQCAtMTkyLDI4ICsxOTIsNDYgQEAgdm9pZCBfX2h3ZG9tX2lu
aXQgaW9tbXVfaHdkb21faW5pdChzdHJ1Ywo+ID4+ICAgICAgICAgICB1bnNpZ25lZCBpbnQgaSA9
IDAsIGZsdXNoX2ZsYWdzID0gMDsKPiA+PiAgICAgICAgICAgaW50IHJjID0gMDsKPiA+PiAgIAo+
ID4+ICsgICAgICAgIHRoaXNfY3B1KGlvbW11X2RvbnRfZmx1c2hfaW90bGIpID0gdHJ1ZTsKPiA+
PiArCj4gPj4gICAgICAgICAgIHBhZ2VfbGlzdF9mb3JfZWFjaCAoIHBhZ2UsICZkLT5wYWdlX2xp
c3QgKQo+ID4+ICAgICAgICAgICB7Cj4gPj4gLSAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWZu
ID0gbWZuX3gocGFnZV90b19tZm4ocGFnZSkpOwo+ID4+IC0gICAgICAgICAgICB1bnNpZ25lZCBs
b25nIGRmbiA9IG1mbl90b19nbWZuKGQsIG1mbik7Cj4gPj4gLSAgICAgICAgICAgIHVuc2lnbmVk
IGludCBtYXBwaW5nID0gSU9NTVVGX3JlYWRhYmxlOwo+ID4+IC0gICAgICAgICAgICBpbnQgcmV0
Owo+ID4+IC0KPiA+PiAtICAgICAgICAgICAgaWYgKCAoKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZv
ICYgUEdUX2NvdW50X21hc2spID09IDApIHx8Cj4gPj4gLSAgICAgICAgICAgICAgICAgKChwYWdl
LT51LmludXNlLnR5cGVfaW5mbyAmIFBHVF90eXBlX21hc2spCj4gPj4gLSAgICAgICAgICAgICAg
ICAgID09IFBHVF93cml0YWJsZV9wYWdlKSApCj4gPj4gLSAgICAgICAgICAgICAgICBtYXBwaW5n
IHw9IElPTU1VRl93cml0YWJsZTsKPiA+PiAtCj4gPj4gLSAgICAgICAgICAgIHJldCA9IGlvbW11
X21hcChkLCBfZGZuKGRmbiksIF9tZm4obWZuKSwgMCwgbWFwcGluZywKPiA+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZmbHVzaF9mbGFncyk7Cj4gPj4gLQo+ID4+IC0gICAgICAgICAg
ICBpZiAoICFyYyApCj4gPj4gLSAgICAgICAgICAgICAgICByYyA9IHJldDsKPiA+PiArICAgICAg
ICAgICAgc3dpdGNoICggcGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQR1RfdHlwZV9tYXNrICkK
PiA+PiArICAgICAgICAgICAgewo+ID4+ICsgICAgICAgICAgICBjYXNlIFBHVF9ub25lOgo+ID4+
ICsgICAgICAgICAgICAgICAgaWYgKCBpc19wdl9kb21haW4oZCkgKQo+ID4+ICsgICAgICAgICAg
ICAgICAgewo+ID4+ICsgICAgICAgICAgICAgICAgICAgIEFTU0VSVCghKHBhZ2UtPnUuaW51c2Uu
dHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spKTsKPiA+PiArICAgICAgICAgICAgICAgICAgICBp
ZiAoIGdldF9wYWdlX2FuZF90eXBlKHBhZ2UsIGQsIFBHVF93cml0YWJsZV9wYWdlKSApCj4gPiAK
PiA+IENvdWxkIHlvdSBhZGQgYSBjb21tZW50IHRoYXQgZ2V0X3BhZ2VfYW5kX3R5cGUgd2lsbCBh
ZGQgYW4gaW9tbXUKPiA+IGVudHJ5IGlmIHN1Y2NlZWRpbmc/Cj4gCj4gV2VsbCwgeWVzLCBJIGNv
dWxkLCBidXQgdGhpcyB3b3VsZCBqdXN0IHJlLXN0YXRlIHdoYXQgdGhlIHJlc3BlY3RpdmUKPiBz
ZWN0aW9uIG9mIHRoZSBiaWcgY29tbWVudCBhdCB0aGUgdG9wIG9mIG1tLmMgZWZmZWN0aXZlbHkg
c2F5cy4KCk9oLCBuZXZlciBtaW5kIHRoZW4sIGl0IGp1c3QgdG9vayBtZSBzb21lIHRpbWUgdG8g
ZmlndXJlIG91dCB3aHkgeW91CnNldCBpb21tdV9kb250X2ZsdXNoX2lvdGxiIHdpdGhvdXQgZG9p
bmcgYW55IF9sZWdhY3kgaW9tbXUgY2FsbHMuIEkKdGhlbiByZWFsaXplZCBnZXRfcGFnZV9hbmRf
dHlwZSB3YXMgZG9pbmcgc3VjaCBjYWxscy4KCj4gQW55d2F5IC0gYXMgbG9uZyBhcyBQYXVsJ3Mg
InJlbW92ZSBsYXRlIChvbi1kZW1hbmQpIGNvbnN0cnVjdGlvbiBvZgo+IElPTU1VIHBhZ2UgdGFi
bGVzIiB3b3VsZCBnbyBpbiBhbnkgdGltZSBzb29uLCB0aGlzIHdpbGwgYWxsIGJlY29tZQo+IHVu
bmVjZXNzYXJ5IGFueXdheS4KPiAKPiA+PiArICAgICAgICAgICAgICAgICAgICB7Cj4gPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOwo+ID4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICBmbHVzaF9mbGFncyB8PSBJT01NVUZfcmVhZGFibGUgfCBJT01N
VUZfd3JpdGFibGU7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgfQo+ID4+ICsgICAgICAgICAg
ICAgICAgICAgIGVsc2UgaWYgKCAhcmMgKQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICBy
YyA9IC1FQlVTWTsKPiA+IAo+ID4gSXMgaXQgZmluZSB0byByZXR1cm4gYW4gZXJyb3IgaGVyZT8g
QUZBSUNUIHlvdSBjb3VsZCBoYXZlIGEgUk8gcGFnZQo+ID4gc2hhcmVkIHdpdGggWGVuIHdpdGgg
UEdUX25vbmUsIGFuZCBub3QgaGF2aW5nIGFuIGlvbW11IG1hcHBpbmcgZm9yIGl0Cj4gPiB3b3Vs
ZCBiZSBleHBlY3RlZCwgaGVuY2UgcmV0dXJuaW5nIGFuIGVycm9yIHNlZW1zIHdyb25nPwo+IAo+
IE5vLCBwYWdlcyBzaGFyZWQgd2l0aCBYZW4gZG9uJ3QgbGl2ZSBvbiBkLT5wYWdlX2xpc3QgKHdo
aWNoIGlzIHdoYXQgdGhlCj4gbG9vcCBpdGVyYXRlcyBvdmVyKS4KClNvIHRoZW4gdGhlcmUgc2hv
dWxkIGJlIG5vIFBHVF9ub25lIHBhZ2VzIGluIGQtPnBhZ2VfbGlzdD8KClRoZSBvbmx5IHVzZXIg
SSBjYW4gZmluZCBvZiBQR1Rfbm9uZSBpcyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0LgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

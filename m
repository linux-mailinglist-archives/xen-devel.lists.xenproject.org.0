Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4A414D9FE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:42:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix8Au-0001AU-WA; Thu, 30 Jan 2020 11:39:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix8At-0001AO-HF
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:39:55 +0000
X-Inumbo-ID: 3b8a040c-4355-11ea-b211-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b8a040c-4355-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580384395;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EbeXrsUBJD8K24NnWtXl8L0uXiyWg6U2hwfzg8tNhhA=;
 b=fNr8+gBh36yPCOWpzeivCdIeg1xSMENU1wyNMrDJjOTlkGZCrB/i1v81
 yV4zWa88/DxiSk7+h28imVH6rrtFF7tc2vZqpfgXUGfpqNluaOmsLyvBn
 hlHBICTG0PbEIvfxHM84dWMGuhLUSMdPJF19UcyK0bXO2JxBBJ3e+UtMa 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mL4JWCYicKPQsoLUUXa4a7jf3mf8J70rONgs74vHNdmPjNpImOOnL9Fpe0mt1O9doBabK5mHMA
 R14ZBbr7wLajHc8qnFweZmWw89AaYApaDUQ+7Dc/ND4Xdwk7EGShCm6N+gDuQBX/3snnKVvVRi
 oBvRmGu3y6QScUYqdcw5FhU3aDykmRM7QUtN9ByT2Ahw7h4fg69PQNa9Qy+baOcNHD2Cm0BRnK
 1TvyOrxU6F6gKAK1eXYiPSbKzwxy7xTv4N7uGZTtN+BU9GpYmGBgzSshLnZuzTkxCW+MjdVFTF
 1do=
X-SBRS: 2.7
X-MesageID: 11686528
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="11686528"
Date: Thu, 30 Jan 2020 12:39:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130113947.GI4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-8-liuwe@microsoft.com>
 <20200130104143.GH4679@Air-de-Roger>
 <20200130111821.zmzp7ykg4slqpa5y@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130111821.zmzp7ykg4slqpa5y@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 07/12] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTE6MTg6MjFBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAxMTo0MTo0M0FNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6MjA6MjlQTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gSHlwZXItViB1c2VzIGEgdGVjaG5pcXVlIGNhbGxlZCBvdmVy
bGF5IHBhZ2UgZm9yIGl0cyBoeXBlcmNhbGwgcGFnZS4gSXQKPiA+ID4gd2lsbCBpbnNlcnQgYSBi
YWNraW5nIHBhZ2UgdG8gdGhlIGd1ZXN0IHdoZW4gdGhlIGh5cGVyY2FsbCBmdW5jdGlvbmFsaXR5
Cj4gPiA+IGlzIGVuYWJsZWQuIFRoYXQgbWVhbnMgd2UgY2FuIHVzZSBhIHBhZ2UgdGhhdCBpcyBu
b3QgYmFja2VkIGJ5IHJlYWwKPiA+ID4gbWVtb3J5IGZvciBoeXBlcmNhbGwgcGFnZS4KPiA+ID4g
Cj4gPiA+IFVzZSB0aGUgdG9wLW1vc3QgYWRkcmVzc2FibGUgcGFnZSBmb3IgdGhhdCBwdXJwb3Nl
LiBBZGp1c3QgZTgyMCBjb2RlCj4gPiA+IGFjY29yZGluZ2x5Lgo+ID4gPiAKPiA+ID4gV2UgYWxz
byBuZWVkIHRvIHJlZ2lzdGVyIFhlbidzIGd1ZXN0IE9TIElEIHRvIEh5cGVyLVYuIFVzZSAweDMg
YXMgdGhlCj4gPiA+IHZlbmRvciBJRC4gRml4IHRoZSBjb21tZW50IGluIGh5cGVydi10bGZzLmgg
d2hpbGUgYXQgaXQuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBt
aWNyb3NvZnQuY29tPgo+ID4gPiAtLS0KPiA+ID4gdjU6Cj4gPiA+IDEuIHVzZSBoeXBlcnZpc29y
X3Jlc2VydmVfdG9wX3BhZ2VzCj4gPiA+IDIuIGFkZCBhIG1hY3JvIGZvciBoeXBlcmNhbGwgcGFn
ZSBtZm4KPiA+ID4gMy4gYWRkcmVzcyBvdGhlciBtaXNjIGNvbW1lbnRzCj4gPiA+IAo+ID4gPiB2
NDoKPiA+ID4gMS4gVXNlIGZpeG1hcAo+ID4gPiAyLiBGb2xsb3cgcm91dGluZXMgbGlzdGVkIGlu
IFRMRlMKPiA+ID4gLS0tCj4gPiA+ICB4ZW4vYXJjaC94ODYvZTgyMC5jICAgICAgICAgICAgICAg
ICAgICAgfCAgNSArKysKPiA+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMg
ICAgICB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysrLS0KPiA+ID4gIHhlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCB8ICA1ICsrLQo+ID4gPiAgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC9oeXBlcnYuaCAgICAgIHwgIDMgKysKPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwg
NjUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+ID4gPiBpbmRleCAz
ODkyYzljZmI3Li45OTY0M2YzZWEwIDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZTgy
MC5jCj4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKPiA+ID4gQEAgLTM0Myw2ICszNDMs
NyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX2luaXQgZmluZF9tYXhfcGZuKHZvaWQpCj4gPiA+
ICB7Cj4gPiA+ICAgICAgdW5zaWduZWQgaW50IGk7Cj4gPiA+ICAgICAgdW5zaWduZWQgbG9uZyBt
YXhfcGZuID0gMDsKPiA+ID4gKyAgICB1bnNpZ25lZCBsb25nIHRvcF9wZm4gPSAoKDF1bGwgPDwg
cGFkZHJfYml0cykgLSAxKSA+PiBQQUdFX1NISUZUOwo+ID4gPiAgCj4gPiA+ICAgICAgZm9yIChp
ID0gMDsgaSA8IGU4MjAubnJfbWFwOyBpKyspIHsKPiA+ID4gICAgICAgICAgdW5zaWduZWQgbG9u
ZyBzdGFydCwgZW5kOwo+ID4gPiBAQCAtMzU3LDYgKzM1OCwxMCBAQCBzdGF0aWMgdW5zaWduZWQg
bG9uZyBfX2luaXQgZmluZF9tYXhfcGZuKHZvaWQpCj4gPiA+ICAgICAgICAgICAgICBtYXhfcGZu
ID0gZW5kOwo+ID4gPiAgICAgIH0KPiA+ID4gIAo+ID4gPiArICAgIHRvcF9wZm4gLT0gaHlwZXJ2
aXNvcl9yZXNlcnZlX3RvcF9wYWdlcygpOwo+ID4gPiArICAgIGlmICggbWF4X3BmbiA+PSB0b3Bf
cGZuICkKPiA+ID4gKyAgICAgICAgbWF4X3BmbiA9IHRvcF9wZm47Cj4gPiAKPiA+IEhtLCBJJ20g
bm90IHN1cmUgSSBzZWUgdGhlIHBvaW50IG9mIHRoaXMuIFRoZSB2YWx1ZSByZXR1cm5lZCBieQo+
ID4gZmluZF9tYXhfcGZuIGlzIHRoZSBtYXhpbXVtIFJBTSBhZGRyZXNzIGZvdW5kIGluIHRoZSBt
ZW1vcnkgbWFwLCBidXQKPiA+IHRoZSBwaHlzaWNhbCBhZGRyZXNzIHlvdSBhcmUgdXNpbmcgdG8g
bWFwIHRoZSBoeXBlcmNhbGwgcGFnZSBpcyBhbG1vc3QKPiA+IGNlcnRhaW5seSBtdWNoIGhpZ2hl
ciB0aGFuIHRoZSBtYXhpbXVtIGFkZHJlc3MgZm91bmQgaW4gdGhlIHBoeXNtYXAKPiA+IChhbmQg
Y2VydGFpbmx5IG5vdCBSQU0pLCBhbmQgaGVuY2UgSSdtIG5vdCBzdXJlIHdoYXQncyB0aGUgcG9p
bnQgb2YKPiA+IHRoaXMuCj4gCj4gWWVzLCB0aGUga2V5d29yZCBpcyAiYWxtb3N0IGNlcnRhaW5s
eSIuIDotKQo+IAo+IFRoaXMgaXMgZG9uZSBmb3IgY29ycmVjdG5lc3MncyBzYWtlLiBJIGRvbid0
IGV4cGVjdCBpbiBwcmFjdGljZSB0aGVyZQo+IHdvdWxkIGJlIGEgY29uZmlndXJhdGlvbiB0aGF0
IGhhcyB0aGF0IG11Y2ggbWVtb3J5LCBidXQgY29ycmVjdG5lc3MgaXMKPiBzdGlsbCBpbXBvcnRh
bnQuCj4gCj4gSXQgYWxzbyBndWFyZHMgYWdhaW5zdCB3ZWlyZCBjb25maWd1cmF0aW9uIGluIHdo
aWNoIG1lbW9yeSBpcyBwdXQgaW50bwo+IHRoYXQgcGFydCBvZiB0aGUgcGh5c2ljYWwgYWRkcmVz
cyBzcGFjZSBmb3Igd2hhdGV2ZXIgcmVhc29uLiBJIGRvbid0Cj4ga25vdyB3aHkgYW55b25lIHdv
dWxkIGRvIHRoYXQsIGJ1dCBhZ2Fpbiwgd2Ugc2hvdWxkIGJlIHByZXBhcmVkIGZvcgo+IHRoYXQu
Cj4gCj4gCj4gPiAKPiA+IEFsc28geW91IGhhdmVuJ3QgaW50cm9kdWNlZCBhIEh5cGVyViBpbXBs
ZW1lbnRhdGlvbiBvZgo+ID4gaHlwZXJ2aXNvcl9yZXNlcnZlX3RvcF9wYWdlcyBzbyBmYXIsIHNv
IGl0J3MgaGFyZCB0byB0ZWxsIHRoZSBpbnRlbmQKPiA+IG9mIHRoaXMuCj4gCj4gRCdvaC4gVGhh
dCB3YXMgc3VwcG9zZWQgdG8gYmUgaW4gdGhpcyBwYXRjaC4gSSBndWVzcyBJIGZvcmdvdCB0byBj
b21taXQKPiB0aGF0IGh1bmshCj4gCj4gVGhhdCBmdW5jdGlvbiBmb3IgSHlwZXItViBpcyBnb2lu
ZyB0byByZXR1cm4gMSAocGFnZSkuCgpCdXQgdGhhdCB3b3VsZCBsaWtlbHkgYmUgd3JvbmcsIHVu
bGVzcyB0aGUgbWVtb3J5IG1hcCBoYXMgYSBSQU0KcmVnaW9uIHRoYXQgZXhwYW5kcyB1cCB0byAo
MSA8PCBwYWRkcl9iaXRzKT8KCk9yIGVsc2UgeW91IGFyZSBqdXN0IHJlbW92aW5nIGEgcGFnZSBm
cm9tIHRoZSBsYXN0IFJBTSByZWdpb24gaW4KdGhlIG1lbW9yeSBtYXAgZm9yIG5vIHJlYXNvbi4g
bWF4X3BmbiBpcyBhbG1vc3QgY2VydGFpbmx5IHdheSBiZWxvdyAoMQo8PCBwYWRkcl9iaXRzKS4K
CkkgdGhpbmsgd2hhdCB5b3UgbmVlZCBpcyBhIGhvb2sgdGhhdCBtb2RpZmllcyB0aGUgbWVtb3J5
IG1hcCBhbmQgYWRkcwphIHJlc2VydmVkIHJlZ2lvbiBhdCAoKDEgPDwgcGFkZHJfYml0cykgLSBQ
QUdFX1NJWkUpIG9mIHNpemUKUEFHRV9TSVpFLiBTZWUgd2hlcmUgcHZfc2hpbV9maXh1cF9lODIw
IGlzIHVzZWQsIGFuZCBJIHRoaW5rIHlvdSB3YW50CnRvIG1ha2UgdGhpcyBhIGh5cGVydmlzb3Ig
aG9vayBhbmQgYWRkIHRoZSBIeXBlclYgY29kZSB0byByZXNlcnZlIHRoZQpoeXBlcmNhbGwgcGFn
ZSBpbiB0aGUgZTgyMCB0aGVyZS4KCj4gPiAKPiA+ID4gKwo+ID4gPiAgICAgIHJldHVybiBtYXhf
cGZuOwo+ID4gPiAgfQo+ID4gPiAgCj4gWy4uLl0KPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydi5oCj4gPiA+IGluZGV4IGM3YTdmMzJiZDUuLjBkY2Q4MDgyYWQgMTAwNjQ0Cj4gPiA+IC0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKPiA+ID4gKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAo+ID4gPiBAQCAtMjEsNiArMjEsOSBAQAo+ID4g
PiAgCj4gPiA+ICAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+Cj4gPiA+ICAKPiA+ID4gKy8qIFVzZSB0
b3AtbW9zdCBNRk4gZm9yIGh5cGVyY2FsbCBwYWdlICovCj4gPiA+ICsjZGVmaW5lIEhWX0hDQUxM
X01GTiAoKCgxdWxsIDw8IHBhZGRyX2JpdHMpIC0gMSkgPj4gSFZfSFlQX1BBR0VfU0hJRlQpCj4g
PiAKPiA+IEkgdGhpbmsgeW91IHNob3VsZCB1c2UgUEFHRV9TSElGVCBoZXJlLCBvciBlbHNlIHlv
dSBhbHNvIG5lZWQgdG8gbWFrZQo+ID4gc3VyZSB0aGUgZml4bWFwIHJlc2VydmVkIGVudHJ5IGlz
IG9mIHNpemUgKCgxIDw8IEhWX0hZUF9QQUdFX1NISUZUKSAtCj4gPiAxKSwgYW5kIHRoZSBjYWxs
IHRvIHNldF9maXhtYXBfeCBpbiBzZXR1cF9oeXBlcmNhbGxfcGFnZSBuZWVkcyB0byB0YWtlCj4g
PiB0aGlzIGludG8gYWNjb3VudCBBRkFJQ1QgYW5kIG5vdCB1c2UgUEFHRV9TSElGVC4KPiAKPiBQ
QUdFX1NISUZUIGFuZCBIVl9IWVBfUEFHRV9TSElGVCBhcmUgaW4gZmFjdCB0aGUgc2FtZS4KPiAK
PiBJIGNhbiBhZGQgYSBCVUlMRF9CVUdfT04gc29tZXdoZXJlLgoKWWVzIHBsZWFzZS4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368018A25C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 17:34:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxCHN-0004pl-8q; Mon, 12 Aug 2019 15:30:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2okp=WI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hxCHM-0004pg-Av
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 15:30:36 +0000
X-Inumbo-ID: 2053d95f-bd16-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2053d95f-bd16-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565623835;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WxqcpF5uBwO4os/D1QNrMWTkwBiFLX2VZgriV99el98=;
 b=TVU5pvwZzlD2w6ks7qWKCFt3aFNMns+eMLaaKGFojV3ihm+iCiHj3ZnL
 1Fz/nftYmgP5hriNvZLNQr/CBzhLETcOZsYrGcUTouz0rAVtTU9BzXX+4
 5+dQO1Z9nOJifaARoEOZpS0BSgXXRgqTzsL4HcUeE5ty0uJuxWMKOHLDb U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zJdDz3Dlwk15pXXIDupvIJbwFwo6GmZSI8OekIkCRDc24lNKEW5di472Mt5FygtrfNfgmw/m2d
 wjMo2C8y6zsNH1qjlw9mztR2o8KO7DF8CeukSPAlCswEosaGcA4Z4OWbMRoqlCABLe4lawPb1b
 +CR+W+f82lSR2xLSNEIAfc6xYPbkaC0Vmk8ZDxnb0ABoipJWvn/RgYyL4xEgl5MrGB7ehmyzUs
 oRwC/49TLkkK6hBLILqX0qMsZ9yrejQNjtyHS3aGFB8ERrdtbpy/WcT8Bn06VozEc2RcAZRCHs
 Glo=
X-SBRS: 2.7
X-MesageID: 4172955
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4172955"
Date: Mon, 12 Aug 2019 17:30:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20190812153026.mubd3o5mlyisggxl@Air-de-Roger>
References: <20190802092227.43058-1-roger.pau@citrix.com>
 <8f92a662-d576-8d41-2856-74f38c10c1b3@citrix.com>
 <20190812135628.624gtsgv4if2zd6l@Air-de-Roger>
 <b2200e4e-ba26-5e5c-2841-d55ab03b2f12@citrix.com>
 <20190812145501.nuigbgugjbotqc6b@Air-de-Roger>
 <93b5ce4e-f841-cf41-8ae4-e5986afe7aae@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93b5ce4e-f841-cf41-8ae4-e5986afe7aae@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/iommu: remove usage of
 {set/clear}_identity_p2m_entry against PV domains
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDQ6MTU6MzhQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiA4LzEyLzE5IDM6NTUgUE0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBP
biBNb24sIEF1ZyAxMiwgMjAxOSBhdCAwMzoyNDozNlBNICswMTAwLCBHZW9yZ2UgRHVubGFwIHdy
b3RlOgo+ID4+IE9uIDgvMTIvMTkgMjo1NiBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+
Pj4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDI6MTc6NTNQTSArMDEwMCwgR2VvcmdlIER1bmxh
cCB3cm90ZToKPiA+Pj4+IE9uIDgvMi8xOSAxMDoyMiBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3Rl
Ogo+ID4+Pj4+IFN3aXRjaCBybXJyX2lkZW50aXR5X21hcHBpbmcgdG8gdXNlIGlvbW11X3t1bn1t
YXAgaW4gb3JkZXIgdG8KPiA+Pj4+PiBlc3RhYmxpc2ggUk1SUiBtYXBwaW5ncyBmb3IgUFYgZG9t
YWlucywgbGlrZSBpdCdzIGRvbmUgaW4KPiA+Pj4+PiBhcmNoX2lvbW11X2h3ZG9tX2luaXQuIFRo
aXMgc29sdmVzIHRoZSBpc3N1ZSBvZiBhIFBWIGhhcmR3YXJlIGRvbWFpbgo+ID4+Pj4+IG5vdCBn
ZXR0aW5nIFJNUlIgbWFwcGluZ3MgYmVjYXVzZSB7c2V0L2NsZWFyfV9pZGVudGl0eV9wMm1fZW50
cnkgd2FzCj4gPj4+Pj4gbm90IHByb3Blcmx5IHVwZGF0aW5nIHRoZSBpb21tdSBwYWdlIHRhYmxl
cy4KPiA+Pj4+Cj4gPj4+PiBTb3JyeSwgSSB0aGluayB0aGlzIGRlc2NyaXB0aW9uIGlzIHNvbWV3
aGF0IGJhY2t3YXJkczogeW91J3JlIHNheWluZwo+ID4+Pj4gd2hhdCB5b3UncmUgZG9pbmcgZmly
c3QsIGFuZCB0aGVuIHNheWluZyB3aGF0IHRoZSBwcm9ibGVtYXRpYyBiZWhhdmlvcgo+ID4+Pj4g
d2FzLCBidXQgbm90IGFjdHVhbGx5IHNheWluZyB3aGF0IHdhcyBjYXVzaW5nIHRoZSBwcm9ibGVt
YXRpYyBiZWhhdmlvci4KPiA+Pj4+Cj4gPj4+PiBXaHkgd2FzIHtzZXQsY2xlYXJ9X2lkZW50aXR5
X3AybSBub3QgdXBkYXRpbmcgdGhlIHBhZ2UgdGFibGVzPwo+ID4+Pj4KPiA+Pj4+IEkgYWdyZWUg
d2l0aCBKYW4sIHRoYXQgZmlndXJpbmcgdGhhdCBvdXQgaXMgYSBwcmVyZXF1aXNpdGUgZm9yIGFu
eSBraW5kCj4gPj4+PiBvZiBmaXg6IGlmIGBuZWVkX2lvbW11X3B0X3N5bmMoKWAgaXMgZmFsc2Ug
YXQgdGhhdCBwb2ludCBmb3IgdGhlCj4gPj4+PiBoYXJkd2FyZSBkb21haW4sIHRoZW4gdGhlcmUn
cyBhIGJpZ2dlciBwcm9ibGVtIHRoYW4gUk1SUnMgbm90IGJlaW5nCj4gPj4+PiBhZGp1c3RlZCBw
cm9wZXJseS4KPiA+Pj4KPiA+Pj4gbmVlZF9pb21tdV9wdF9zeW5jIGlzIGluZGVlZCBmYWxzZSBm
b3IgYSBQViBoYXJkd2FyZSBkb21haW4gbm90Cj4gPj4+IHJ1bm5pbmcgaW4gc3RyaWN0IG1vZGUs
IHNlZToKPiA+Pj4KPiA+Pj4gaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdp
dDthPWJsb2I7Zj14ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jO2g9ZjhjM2JmNTNiZDE3
OTNkZjkzZDdkZGVhNjU2NGRjOTI5ZjQwYzE1NjtoYj1IRUFEI2wxOTIKPiA+Pj4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA3L21zZzAx
NTQ3Lmh0bWwKPiA+Pj4KPiA+Pj4gVGhpcyBpcyBmaW5lIGZvciBhIG5vbi1zdHJpY3QgUFYgaGFy
ZHdhcmUgZG9tYWluLCBzaW5jZSBpdCBoYXMgYWxsIHRoZQo+ID4+PiBob3N0IG1lbW9yeSAobWlu
dXMgbWVtb3J5IHVzZWQgYnkgWGVuKSBtYXBwZWQgaW4gdGhlIGlvbW11IHBhZ2UgdGFibGVzCj4g
Pj4+IGV4Y2VwdCBmb3IgUk1SUiByZWdpb25zIG5vdCBtYXJrZWQgYXMgcmVzZXJ2ZWQgaW4gdGhl
IGU4MjAgbWVtb3J5IG1hcCwKPiA+Pj4gd2hpY2ggYXJlIGFkZGVkIHVzaW5nIHNldF9pZGVudGl0
eV9wMm1fZW50cnkuCj4gPj4+Cj4gPj4+IFRoZSBpc3N1ZSBoZXJlIGlzIHRoYXQgdGhpcyBwYXRj
aCBhbG9uZSBkb2Vzbid0IGZpeCB0aGUgaXNzdWUgZm9yIHRoZQo+ID4+PiByZXBvcnRlciwgYW5k
IHRoZXJlIHNlZW1zIHRvIGJlIGFuIGFkZGl0aW9uYWwgZmx1c2ggcmVxdWlyZWQgaW4gb3JkZXIK
PiA+Pj4gdG8gZ2V0IHRoZSBpc3N1ZSBzb2x2ZWQgb24gaGlzIGVuZDoKPiA+Pj4KPiA+Pj4gaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA4
L21zZzAwNTI2Lmh0bWwKPiA+Pj4KPiA+Pj4gTXkgdGhlb3J5IGlzIHRoYXQgdGhlIHN5c3RlbSBS
b21hbiBpcyB1c2luZyBpcyBib290aW5nIHdpdGggRE1BCj4gPj4+IHJlbWFwcGluZyBlbmFibGVk
IGluIHRoZSBpb21tdSwgYW5kIHNvbWVob3cgdGhlIGNhbGwgdG8KPiA+Pj4gaW9tbXVfZmx1c2hf
YWxsIGluIGludGVsX2lvbW11X2h3ZG9tX2luaXQgZG9lc24ndCBzZWVtIHRvIHdvcmsKPiA+Pj4g
cHJvcGVybHksIHdoaWxlIGNhbGxpbmcgaW9tbXVfaW90bGJfZmx1c2hfYWxsIGRvZXMgc2VlbSB0
byBkbyB0aGUKPiA+Pj4gcmlnaHQgdGhpbmcuIEknbSBzdGlsbCB3YWl0aW5nIGZvciBSb21hbiB0
byBjb21lIGJhY2sgd2l0aCB0aGUgcmVzdWx0Cj4gPj4+IG9mIG15IGxhc3QgZGVidWcgcGF0Y2hl
cyBpbiBvcmRlciB0byBmaWd1cmUgb3V0IHdoZXRoZXIgbXkgaHlwb3RoZXNpcwo+ID4+PiBhYm92
ZSBpcyB0cnVlLgo+ID4+Pgo+ID4+PiBUaGlzIGhvd2V2ZXIgd29uJ3Qgc3RpbGwgZXhwbGFpbiB0
aGUgd2VpcmQgYmVoYXZpb3VyIG9mCj4gPj4+IGlvbW11X2ZsdXNoX2FsbCwgYW5kIGZ1cnRoZXIg
ZGVidWdnaW5nIHdpbGwgc3RpbGwgYmUgcmVxdWlyZWQuCj4gPj4KPiA+PiBPSzsgc28gdGhpcyBw
YXRjaCBoYXMgZm91ciBlZmZlY3RzLCBpdCBsb29rcyBsaWtlOgo+ID4+Cj4gPj4gMS4gaW9tbXVf
bGVnYWN5X1t1bl1tYXAgLT4gaW9tbXVfW3VuXW1hcAo+ID4+IDIuIE1vdmUgaW9tbXUgb3BzIG91
dCBvZiB7c2V0LGNsZWFyfV9pZGVudGl0eV9wMm0gZm9yIFBWIGd1ZXN0czsKPiA+PiBvcGVuLWNv
ZGUgdGhlbSBpbiBybXJyX2lkZW50aXR5X21hcHBpbmcKPiA+PiAzLiBGb3Igbm9uLXRyYW5zbGF0
ZWQgZ3Vlc3RzLCBkbyB0aGUgb3BlcmF0aW9uIHVuY29uZGl0aW9uYWxseQo+ID4+IDQuIEFkZCBh
IGZsdXNoCj4gPiAKPiA+IFRoZXJlJ3MgYWxyZWFkeSBhIGZsdXNoIGluIGlvbW11X2xlZ2FjeV9b
dW5dbWFwLCBzbyB0aGUgZmx1c2ggaXMgYWxzbwo+ID4gZG9uZSBmb3IgYm90aCBwYXRjaGVzLCBq
dXN0IGluIGRpZmZlcmVudCBwbGFjZXMuIFRoZSBsZWdhY3kgaW50ZXJmYWNlCj4gPiBkb2VzIHRo
ZSBmbHVzaCBvbiBldmVyeSBjYWxsLCB3aGlsZSB0aGUgbmV3IGludGVyZmFjZSBhbGxvd3MgdG8K
PiA+IHBvc3Rwb25lIHRoZSBmbHVzaCB1bnRpbCBhbGwgaW9tbXUgcGFnZS10YWJsZSBvcGVyYXRp
b25zIGFyZSBkb25lLgo+ID4gCj4gPj4KPiA+PiBSZWdhcmRpbmcgIzMsIHRoZSBwcmV2aW91cyBw
YXRjaCBjaGFuZ2VkIGl0IGZyb20gImlmCj4gPj4gaW9tbXVfbmVlZHNfcHRfc3luYyIgdG8gImlm
IGhhc19pb21tdV9wdCI7IHRoaXMgb25lIGNoYW5nZXMgaXQgdG8KPiA+PiAiYWx3YXlzIi4gIElz
IHRoYXQgd2hhdCB5b3UgaW50ZW5kZWQ/Cj4gPiAKPiA+IFdlbGwsICMzIGlzIG5vdCBhY3R1YWxs
eSBjb3JyZWN0LiBUaGUgY29kZSBpbiBpbnRlbF9pb21tdV9od2RvbV9pbml0Cj4gPiBhbmQgaGVu
Y2Ugc2V0dXBfaHdkb21fcm1yciB3aWxsIG9ubHkgYmUgY2FsbGVkIGlmIHRoZSBkb21haW4gaGFz
IGFuCj4gPiBpb21tdSwgc28gaGFzX2lvbW11X3B0IHdpbGwgYWx3YXlzIGJlIHRydWUgd2hlbiBh
ZGRpbmcgUk1SUiByZWdpb25zLgo+ID4gTm90ZSBybXJyX2lkZW50aXR5X21hcHBpbmcgaXMgdGhl
IG9ubHkgY2FsbGVyIG9mCj4gPiB7c2V0LGNsZWFyfV9pZGVudGl0eV9wMm0gYWdhaW5zdCBQViBn
dWVzdHMuCj4gCj4gQnV0IGlmIGlvbW11IGlzIHNldCB0aGUgc2FtZSBpbiBib3RoIGNhc2VzLCBh
bmQgaWYgdGhlIGZsdXNoIGhhcHBlbnMgaW4KPiBib3RoIGNhc2VzLCB0aGVuIHdoeSBkaWQgdGhp
cyBwYXRjaCB3b3JrIGFuZCB0aGUgcHJldmlvdXMgcGF0Y2ggZGlkbid0PwoKaW9tbXVfbGVnYWN5
X1t1bl1tYXAgdXNlcyBpb21tdV9pb3RsYl9mbHVzaCB3aGlsZSBteSBwYXRjaCB1c2VzCmlvbW11
X2lvdGxiX2ZsdXNoX2FsbC4gSSdtIHN0aWxsIG5vdCBzdXJlIHdoeSB0aGlzIGRpZmZlcmVuY2Ug
aW4KYmVoYXZpb3VyLCBzaW1pbGFyIHRvIHdoYXQgaGFwcGVucyB3aXRoIGlvbW11X2ZsdXNoX2Fs
bC4KCj4gPj4gSSBkb24ndCByZWFsbHkgc2VlIHRoZSBwb2ludCBvZiAjMjogZnJvbSB0aGUgZGV2
aWNlJ3MgcGVyc3BlY3RpdmUsIHRoZQo+ID4+ICJwaHlzbWFwIiBpcyB0aGUgSU9NTVUgZm9yIFBW
IGd1ZXN0cywgYW5kIElPTU1VK3AybSBmb3IgSFZNIGd1ZXN0czsgaXQKPiA+PiBtYWtlcyBzZW5z
ZSB0byBoYXZlIGEgc2luZ2xlIHBsYWNlIHRvIGNhbGwgZm9yIGVpdGhlciB0eXBlIG9mIGd1ZXN0
LAo+ID4+IHJhdGhlciB0aGFuIG9wZW4tY29kaW5nIGV2ZXJ5IGxvY2F0aW9uLgo+ID4gCj4gPiBP
SywgdGhhdCdzIGZpbmUsIGJ1dCBub3RlIHRoYXQge3NldC9jbGVhcn1faWRlbnRpdHlfcDJtX2Vu
dHJ5IGlzCj4gPiBBRkFJQ1QgdGhlIG9ubHkgcDJtIGZ1bmN0aW9uIGFsbG93ZWQgYWdhaW5zdCBQ
ViBndWVzdHMsIHRoZSByZXN0IHdpbGwKPiA+IHJldHVybiBzb21lIGtpbmQgb2YgZXJyb3IsIHdo
aWNoIElNTyBtYWtlcyBpdCB0aGUgb3V0bGllciwgaGVuY2UgbXkKPiA+IHByb3Bvc2FsIHRvIG1h
a2UgaXQgYXZhaWxhYmxlIHRvIHRyYW5zbGF0ZWQgZ3Vlc3RzIG9ubHksIGxpa2UgdGhlIHJlc3QK
PiA+IG9mIHRoZSBwMm0gZnVuY3Rpb25zIGluIHRoYXQgZmlsZS4gSSBqdXN0IGZpbmQgaXQgY29u
ZnVzaW5nIHRoYXQgc29tZQo+ID4gcDJtIGZ1bmN0aW9ucyBjYW4gYmUgdXNlZCBhZ2FpbnN0IFBW
IGd1ZXN0cywgYnV0IG5vdCBvdGhlcnMuCj4gCj4gUmlnaHQsIGJ1dCB0aGF0J3MgYmVjYXVzZSBz
ZXRfaWRlbnRpdHlfcDJtX2VudHJ5KCkgaXNuJ3QgcmVhbGx5IGFib3V0Cj4gdGhlIHAybS4gIEl0
J3MgYWJvdXQgbWFraW5nIHN1cmUgdGhhdCBib3RoIGRldmljZXMgYW5kIFNNSSBoYW5kbGVycyAo
b3IKPiB3aGF0ZXZlcikgY2FuIGFjY2VzcyBjZXJ0YWluIGJpdHMgb2YgbWVtb3J5Lgo+IAo+IExv
dHMgb2YgZnVuY3Rpb25zIGluIHAybS5jICJ0b2xlcmF0ZSIgY2FsbHMgZm9yIFBWIGd1ZXN0czsg
YW5kCj4gZ3Vlc3RfcGh5c21hcF8qIGNhbGxzIHVzZWQgdG8gYWN0dWFsbHkgdG8gSU9NTVUgb3Bl
cmF0aW9ucyBvbiBQViBndWVzdHMKPiBiZWZvcmUgWFNBIDI4OC4KPiAKPiBXZSBjb3VsZCBjaGFu
Z2UgdGhhdCB0byBzZXRfaWRlbnRpdHlfcGh5c21hcF9lbnRyeSgpIG9yIHNvbWV0aGluZyBpZiB5
b3UKPiBwcmVmZXIuCgpPSywgbGV0IG1lIHRyeSB0byBmaXJzdCBmaWd1cmUgb3V0IGV4YWN0bHkg
d2hhdCdzIGdvaW5nIG9uIGFuZCB0aGVuIEkKY2FuIHByb3Bvc2Ugc29tZXRoaW5nIHNlbnNpYmxl
IDopLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

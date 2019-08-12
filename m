Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038178A1BE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 16:57:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxBj6-0001RV-F4; Mon, 12 Aug 2019 14:55:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2okp=WI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hxBj4-0001RI-Rn
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 14:55:10 +0000
X-Inumbo-ID: 2de67742-bd11-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2de67742-bd11-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565621709;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=C1GqU04hxfdD8pY/1tRlB1INSU1QvAala0EmZfau2P4=;
 b=UQgzFCRuYE3qcQHSK0OzfqxgXPpDYcA6tDrITI4wPImTeTsd79WxkQzt
 BHP/iUn4h9Pvwvc2YFvFb3kfBQ9G8j0hilwV/Dz6xWTySLVegC856JlFF
 cKeJsBzlgwyjTsckUeCYg35iRGHmTe/HeYb1hWAX7qGrlqFl0UQvmsKwt M=;
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
IronPort-SDR: ueukYmkWNiW16sqU0UZMTpi+h7kaXSusu5xSW9JBqNcjaLPGeADetuwVQdG59/PnxPkwrRw0/w
 Bwd1wWIOT2Jieq1foDTRihdvqNemprbN58joxDsW6s0a5WXERHjdpgRO0Z9Au7r8Ox2eBVZzIZ
 fofKI62+ztufy/UIIEA9squznwPxZG4Okfq/8s1Eute//a6XLJVEe8boJv9UT5yWnmbiWEYTdZ
 L2pebqtmu+9hjWhlZyOcsPvzUgnXeWF4+v//OZ4T/x7F4QaisLjzRL5zrqyxb/b3J9oecF/+UN
 Kf8=
X-SBRS: 2.7
X-MesageID: 4304987
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4304987"
Date: Mon, 12 Aug 2019 16:55:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20190812145501.nuigbgugjbotqc6b@Air-de-Roger>
References: <20190802092227.43058-1-roger.pau@citrix.com>
 <8f92a662-d576-8d41-2856-74f38c10c1b3@citrix.com>
 <20190812135628.624gtsgv4if2zd6l@Air-de-Roger>
 <b2200e4e-ba26-5e5c-2841-d55ab03b2f12@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2200e4e-ba26-5e5c-2841-d55ab03b2f12@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDM6MjQ6MzZQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiA4LzEyLzE5IDI6NTYgUE0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBP
biBNb24sIEF1ZyAxMiwgMjAxOSBhdCAwMjoxNzo1M1BNICswMTAwLCBHZW9yZ2UgRHVubGFwIHdy
b3RlOgo+ID4+IE9uIDgvMi8xOSAxMDoyMiBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4+
PiBTd2l0Y2ggcm1ycl9pZGVudGl0eV9tYXBwaW5nIHRvIHVzZSBpb21tdV97dW59bWFwIGluIG9y
ZGVyIHRvCj4gPj4+IGVzdGFibGlzaCBSTVJSIG1hcHBpbmdzIGZvciBQViBkb21haW5zLCBsaWtl
IGl0J3MgZG9uZSBpbgo+ID4+PiBhcmNoX2lvbW11X2h3ZG9tX2luaXQuIFRoaXMgc29sdmVzIHRo
ZSBpc3N1ZSBvZiBhIFBWIGhhcmR3YXJlIGRvbWFpbgo+ID4+PiBub3QgZ2V0dGluZyBSTVJSIG1h
cHBpbmdzIGJlY2F1c2Uge3NldC9jbGVhcn1faWRlbnRpdHlfcDJtX2VudHJ5IHdhcwo+ID4+PiBu
b3QgcHJvcGVybHkgdXBkYXRpbmcgdGhlIGlvbW11IHBhZ2UgdGFibGVzLgo+ID4+Cj4gPj4gU29y
cnksIEkgdGhpbmsgdGhpcyBkZXNjcmlwdGlvbiBpcyBzb21ld2hhdCBiYWNrd2FyZHM6IHlvdSdy
ZSBzYXlpbmcKPiA+PiB3aGF0IHlvdSdyZSBkb2luZyBmaXJzdCwgYW5kIHRoZW4gc2F5aW5nIHdo
YXQgdGhlIHByb2JsZW1hdGljIGJlaGF2aW9yCj4gPj4gd2FzLCBidXQgbm90IGFjdHVhbGx5IHNh
eWluZyB3aGF0IHdhcyBjYXVzaW5nIHRoZSBwcm9ibGVtYXRpYyBiZWhhdmlvci4KPiA+Pgo+ID4+
IFdoeSB3YXMge3NldCxjbGVhcn1faWRlbnRpdHlfcDJtIG5vdCB1cGRhdGluZyB0aGUgcGFnZSB0
YWJsZXM/Cj4gPj4KPiA+PiBJIGFncmVlIHdpdGggSmFuLCB0aGF0IGZpZ3VyaW5nIHRoYXQgb3V0
IGlzIGEgcHJlcmVxdWlzaXRlIGZvciBhbnkga2luZAo+ID4+IG9mIGZpeDogaWYgYG5lZWRfaW9t
bXVfcHRfc3luYygpYCBpcyBmYWxzZSBhdCB0aGF0IHBvaW50IGZvciB0aGUKPiA+PiBoYXJkd2Fy
ZSBkb21haW4sIHRoZW4gdGhlcmUncyBhIGJpZ2dlciBwcm9ibGVtIHRoYW4gUk1SUnMgbm90IGJl
aW5nCj4gPj4gYWRqdXN0ZWQgcHJvcGVybHkuCj4gPiAKPiA+IG5lZWRfaW9tbXVfcHRfc3luYyBp
cyBpbmRlZWQgZmFsc2UgZm9yIGEgUFYgaGFyZHdhcmUgZG9tYWluIG5vdAo+ID4gcnVubmluZyBp
biBzdHJpY3QgbW9kZSwgc2VlOgo+ID4gCj4gPiBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmM7aD1m
OGMzYmY1M2JkMTc5M2RmOTNkN2RkZWE2NTY0ZGM5MjlmNDBjMTU2O2hiPUhFQUQjbDE5Mgo+ID4g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5
LTA3L21zZzAxNTQ3Lmh0bWwKPiA+IAo+ID4gVGhpcyBpcyBmaW5lIGZvciBhIG5vbi1zdHJpY3Qg
UFYgaGFyZHdhcmUgZG9tYWluLCBzaW5jZSBpdCBoYXMgYWxsIHRoZQo+ID4gaG9zdCBtZW1vcnkg
KG1pbnVzIG1lbW9yeSB1c2VkIGJ5IFhlbikgbWFwcGVkIGluIHRoZSBpb21tdSBwYWdlIHRhYmxl
cwo+ID4gZXhjZXB0IGZvciBSTVJSIHJlZ2lvbnMgbm90IG1hcmtlZCBhcyByZXNlcnZlZCBpbiB0
aGUgZTgyMCBtZW1vcnkgbWFwLAo+ID4gd2hpY2ggYXJlIGFkZGVkIHVzaW5nIHNldF9pZGVudGl0
eV9wMm1fZW50cnkuCj4gPiAKPiA+IFRoZSBpc3N1ZSBoZXJlIGlzIHRoYXQgdGhpcyBwYXRjaCBh
bG9uZSBkb2Vzbid0IGZpeCB0aGUgaXNzdWUgZm9yIHRoZQo+ID4gcmVwb3J0ZXIsIGFuZCB0aGVy
ZSBzZWVtcyB0byBiZSBhbiBhZGRpdGlvbmFsIGZsdXNoIHJlcXVpcmVkIGluIG9yZGVyCj4gPiB0
byBnZXQgdGhlIGlzc3VlIHNvbHZlZCBvbiBoaXMgZW5kOgo+ID4gCj4gPiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDA1MjYu
aHRtbAo+ID4gCj4gPiBNeSB0aGVvcnkgaXMgdGhhdCB0aGUgc3lzdGVtIFJvbWFuIGlzIHVzaW5n
IGlzIGJvb3Rpbmcgd2l0aCBETUEKPiA+IHJlbWFwcGluZyBlbmFibGVkIGluIHRoZSBpb21tdSwg
YW5kIHNvbWVob3cgdGhlIGNhbGwgdG8KPiA+IGlvbW11X2ZsdXNoX2FsbCBpbiBpbnRlbF9pb21t
dV9od2RvbV9pbml0IGRvZXNuJ3Qgc2VlbSB0byB3b3JrCj4gPiBwcm9wZXJseSwgd2hpbGUgY2Fs
bGluZyBpb21tdV9pb3RsYl9mbHVzaF9hbGwgZG9lcyBzZWVtIHRvIGRvIHRoZQo+ID4gcmlnaHQg
dGhpbmcuIEknbSBzdGlsbCB3YWl0aW5nIGZvciBSb21hbiB0byBjb21lIGJhY2sgd2l0aCB0aGUg
cmVzdWx0Cj4gPiBvZiBteSBsYXN0IGRlYnVnIHBhdGNoZXMgaW4gb3JkZXIgdG8gZmlndXJlIG91
dCB3aGV0aGVyIG15IGh5cG90aGVzaXMKPiA+IGFib3ZlIGlzIHRydWUuCj4gPiAKPiA+IFRoaXMg
aG93ZXZlciB3b24ndCBzdGlsbCBleHBsYWluIHRoZSB3ZWlyZCBiZWhhdmlvdXIgb2YKPiA+IGlv
bW11X2ZsdXNoX2FsbCwgYW5kIGZ1cnRoZXIgZGVidWdnaW5nIHdpbGwgc3RpbGwgYmUgcmVxdWly
ZWQuCj4gCj4gT0s7IHNvIHRoaXMgcGF0Y2ggaGFzIGZvdXIgZWZmZWN0cywgaXQgbG9va3MgbGlr
ZToKPiAKPiAxLiBpb21tdV9sZWdhY3lfW3VuXW1hcCAtPiBpb21tdV9bdW5dbWFwCj4gMi4gTW92
ZSBpb21tdSBvcHMgb3V0IG9mIHtzZXQsY2xlYXJ9X2lkZW50aXR5X3AybSBmb3IgUFYgZ3Vlc3Rz
Owo+IG9wZW4tY29kZSB0aGVtIGluIHJtcnJfaWRlbnRpdHlfbWFwcGluZwo+IDMuIEZvciBub24t
dHJhbnNsYXRlZCBndWVzdHMsIGRvIHRoZSBvcGVyYXRpb24gdW5jb25kaXRpb25hbGx5Cj4gNC4g
QWRkIGEgZmx1c2gKClRoZXJlJ3MgYWxyZWFkeSBhIGZsdXNoIGluIGlvbW11X2xlZ2FjeV9bdW5d
bWFwLCBzbyB0aGUgZmx1c2ggaXMgYWxzbwpkb25lIGZvciBib3RoIHBhdGNoZXMsIGp1c3QgaW4g
ZGlmZmVyZW50IHBsYWNlcy4gVGhlIGxlZ2FjeSBpbnRlcmZhY2UKZG9lcyB0aGUgZmx1c2ggb24g
ZXZlcnkgY2FsbCwgd2hpbGUgdGhlIG5ldyBpbnRlcmZhY2UgYWxsb3dzIHRvCnBvc3Rwb25lIHRo
ZSBmbHVzaCB1bnRpbCBhbGwgaW9tbXUgcGFnZS10YWJsZSBvcGVyYXRpb25zIGFyZSBkb25lLgoK
PiAKPiBSZWdhcmRpbmcgIzMsIHRoZSBwcmV2aW91cyBwYXRjaCBjaGFuZ2VkIGl0IGZyb20gImlm
Cj4gaW9tbXVfbmVlZHNfcHRfc3luYyIgdG8gImlmIGhhc19pb21tdV9wdCI7IHRoaXMgb25lIGNo
YW5nZXMgaXQgdG8KPiAiYWx3YXlzIi4gIElzIHRoYXQgd2hhdCB5b3UgaW50ZW5kZWQ/CgpXZWxs
LCAjMyBpcyBub3QgYWN0dWFsbHkgY29ycmVjdC4gVGhlIGNvZGUgaW4gaW50ZWxfaW9tbXVfaHdk
b21faW5pdAphbmQgaGVuY2Ugc2V0dXBfaHdkb21fcm1yciB3aWxsIG9ubHkgYmUgY2FsbGVkIGlm
IHRoZSBkb21haW4gaGFzIGFuCmlvbW11LCBzbyBoYXNfaW9tbXVfcHQgd2lsbCBhbHdheXMgYmUg
dHJ1ZSB3aGVuIGFkZGluZyBSTVJSIHJlZ2lvbnMuCk5vdGUgcm1ycl9pZGVudGl0eV9tYXBwaW5n
IGlzIHRoZSBvbmx5IGNhbGxlciBvZgp7c2V0LGNsZWFyfV9pZGVudGl0eV9wMm0gYWdhaW5zdCBQ
ViBndWVzdHMuCgo+IEkgZG9uJ3QgcmVhbGx5IHNlZSB0aGUgcG9pbnQgb2YgIzI6IGZyb20gdGhl
IGRldmljZSdzIHBlcnNwZWN0aXZlLCB0aGUKPiAicGh5c21hcCIgaXMgdGhlIElPTU1VIGZvciBQ
ViBndWVzdHMsIGFuZCBJT01NVStwMm0gZm9yIEhWTSBndWVzdHM7IGl0Cj4gbWFrZXMgc2Vuc2Ug
dG8gaGF2ZSBhIHNpbmdsZSBwbGFjZSB0byBjYWxsIGZvciBlaXRoZXIgdHlwZSBvZiBndWVzdCwK
PiByYXRoZXIgdGhhbiBvcGVuLWNvZGluZyBldmVyeSBsb2NhdGlvbi4KCk9LLCB0aGF0J3MgZmlu
ZSwgYnV0IG5vdGUgdGhhdCB7c2V0L2NsZWFyfV9pZGVudGl0eV9wMm1fZW50cnkgaXMKQUZBSUNU
IHRoZSBvbmx5IHAybSBmdW5jdGlvbiBhbGxvd2VkIGFnYWluc3QgUFYgZ3Vlc3RzLCB0aGUgcmVz
dCB3aWxsCnJldHVybiBzb21lIGtpbmQgb2YgZXJyb3IsIHdoaWNoIElNTyBtYWtlcyBpdCB0aGUg
b3V0bGllciwgaGVuY2UgbXkKcHJvcG9zYWwgdG8gbWFrZSBpdCBhdmFpbGFibGUgdG8gdHJhbnNs
YXRlZCBndWVzdHMgb25seSwgbGlrZSB0aGUgcmVzdApvZiB0aGUgcDJtIGZ1bmN0aW9ucyBpbiB0
aGF0IGZpbGUuIEkganVzdCBmaW5kIGl0IGNvbmZ1c2luZyB0aGF0IHNvbWUKcDJtIGZ1bmN0aW9u
cyBjYW4gYmUgdXNlZCBhZ2FpbnN0IFBWIGd1ZXN0cywgYnV0IG5vdCBvdGhlcnMuCgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

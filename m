Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E698B81F8D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 16:53:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hueKL-0003Oi-RT; Mon, 05 Aug 2019 14:51:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dpjS=WB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hueKK-0003Oc-KJ
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 14:51:08 +0000
X-Inumbo-ID: 7390adc0-b790-11e9-894f-0f0645fdd566
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7390adc0-b790-11e9-894f-0f0645fdd566;
 Mon, 05 Aug 2019 14:51:05 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cMvkXKGKGy1WOcOJUDWtkcxy1RZSpxmmjxzDAR/nxKuIKXCW6HyxcUF4MeQgbZMWWYoaNtak4X
 c9OzAZlaWkjaahOH51eD3bc0Pw6YanpBFNQX9vMfjtLZsQI1tWQXfC88Js7BBZgUxn6YIrJxl7
 yhXVWvjLGQpZzTiuRLQv3X3dI3MUG691OmvUs78ItlIgPGbGK4kFGg8G1kUIVGpeS66RKdqfhb
 VwKd/gKc1iZ391EpAe9db8PTlPgTsFY0lU1HrehzRXfP8hoXuTQ5Ir3VkkFeUpkJm7Ts+KcMgl
 5cA=
X-SBRS: 2.7
X-MesageID: 3994417
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3994417"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23880.16947.795708.667141@mariner.uk.xensource.com>
Date: Mon, 5 Aug 2019 15:50:27 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CE6BCA70200007800231C92@prv1-mh.provo.novell.com>
References: <1558548634-25154-1-git-send-email-igor.druzhinin@citrix.com>
 <5CE6608D02000078002319C3@prv1-mh.provo.novell.com>
 <20190523152007.GH2373@zion.uk.xensource.com>
 <5CE6BCA70200007800231C92@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libacpi: report PCI slots as enabled only
 for hotpluggable devices
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSF0gbGliYWNwaTogcmVwb3J0IFBDSSBzbG90
cyBhcyBlbmFibGVkIG9ubHkgZm9yIGhvdHBsdWdnYWJsZSBkZXZpY2VzIik6Cj4gPj4+IE9uIDIz
LjA1LjE5IGF0IDE3OjIwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBPbiBUaHUs
IE1heSAyMywgMjAxOSBhdCAwMjo1Nzo0OUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
PiA+Pj4gT24gMjIuMDUuMTkgYXQgMjA6MTAsIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPiB3
cm90ZToKPiA+PiA+IERTRFQgZm9yIHFlbXUteGVuIGxhY2tzIF9TVEEgbWV0aG9kIG9mIFBDSSBz
bG90IG9iamVjdC4gSWYgX1NUQSBtZXRob2QKPiA+PiA+IGRvZXNuJ3QgZXhpc3QgdGhlbiB0aGUg
c2xvdCBpcyBhc3N1bWVkIHRvIGJlIGFsd2F5cyBwcmVzZW50IGFuZCBhY3RpdmUKPiA+PiA+IHdo
aWNoIGluIGNvbmp1bmN0aW9uIHdpdGggX0VKMCBtZXRob2QgbWFrZXMgZXZlcnkgZGV2aWNlIGVq
ZWN0YWJsZSBmb3IKPiA+PiA+IGFuIE9TIGV2ZW4gaWYgaXQncyBub3QgdGhlIGNhc2UuCj4gPj4g
PiAKPiA+PiA+IHFlbXUta3ZtIGlzIGFibGUgdG8gZHluYW1pY2FsbHkgYWRkIF9FSjAgbWV0aG9k
IG9ubHkgdG8gdGhvc2Ugc2xvdHMKPiA+PiA+IHRoYXQgZWl0aGVyIGhhdmUgaG90cGx1Z2dhYmxl
IGRldmljZXMgb3IgZnJlZSBmb3IgUENJIHBhc3N0aHJvdWdoLgo+ID4+ID4gQXMgWGVuIGxhY2tz
IHRoaXMgY2FwYWJpbGl0eSB3ZSBjYW5ub3QgdXNlIHRoZWlyIHdheS4KPiA+PiA+IAo+ID4+ID4g
cWVtdS14ZW4tdHJhZGl0aW9uYWwgRFNEVCBoYXMgX1NUQSBtZXRob2Qgd2hpY2ggb25seSByZXBv
cnRzIHRoYXQKPiA+PiA+IHRoZSBzbG90IGlzIHByZXNlbnQgaWYgdGhlcmUgaXMgYSBQQ0kgZGV2
aWNlcyBob3RwbHVnZ2VkIHRoZXJlLgo+ID4+ID4gVGhpcyBpcyBkb25lIHRocm91Z2ggcXVlcnlp
bmcgb2YgaXRzIFBDSSBob3RwbHVnIGNvbnRyb2xsZXIuCj4gPj4gPiBxZW11LXhlbiBoYXMgc2lt
aWxhciBjYXBhYmlsaXR5IHRoYXQgcmVwb3J0cyBpZiBkZXZpY2UgaXMgImhvdHBsdWdnYWJsZQo+
ID4+ID4gb3IgYWJzZW50IiB3aGljaCB3ZSBjYW4gdXNlIHRvIGFjaGlldmUgdGhlIHNhbWUgcmVz
dWx0Lgo+ID4+ID4gCj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5k
cnV6aGluaW5AY2l0cml4LmNvbT4KPiA+PiAKPiA+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+IAo+ID4gCj4gPiBKYW4sIEZBT0Qgc2luY2UgeW91J3Jl
IHRoZSBtYWludGFpbmVyIEknbSBleHBlY3RpbmcgeW91IHRvIHB1c2ggdGhpcwo+ID4gcGF0Y2gg
eW91cnNlbGYuCj4gCj4gU3VyZSwgSSBoYXZlIGl0IG9uIG15IGxpc3Qgb2YgdGhpbmdzIHRvIHB1
c2guCgpJcyB0aGlzIGEgYmFja3BvcnQgY2FuZGlkYXRlID8gIEl0IHNvdW5kcyBsaWtlIGl0IG1p
Z2h0IGJlIGEgYnVnZml4CmJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIHJpc2tzL2ltcGxpY2F0
aW9ucy4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

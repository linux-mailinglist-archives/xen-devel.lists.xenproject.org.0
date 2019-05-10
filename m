Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAD819965
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 10:16:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP0ey-00039L-Uk; Fri, 10 May 2019 08:13:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP0ey-00039G-19
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 08:13:40 +0000
X-Inumbo-ID: 80ff146c-72fb-11e9-bdd1-97c279198ae2
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80ff146c-72fb-11e9-bdd1-97c279198ae2;
 Fri, 10 May 2019 08:13:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 02:13:33 -0600
Message-Id: <5CD532AD020000780022D6CC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 02:13:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com><cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
 <706a1e5f87ae789197fba3a268b18183fd4b8e5b.1557431250.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <706a1e5f87ae789197fba3a268b18183fd4b8e5b.1557431250.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 4/5] xen: fix handling framebuffer
 located above 4GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA5LjA1LjE5IGF0IDIxOjQ4LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gLS0tIGEveGVuL2RyaXZlcnMvdmlkZW8vdmVzYS5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvdmlkZW8vdmVzYS5jCj4gQEAgLTQwLDYgKzQwLDExIEBAIHN0YXRpYyBpbnQgX19pbml0
IHBhcnNlX2ZvbnRfaGVpZ2h0KGNvbnN0IGNoYXIgKnMpCj4gIH0KPiAgY3VzdG9tX3BhcmFtKCJm
b250IiwgcGFyc2VfZm9udF9oZWlnaHQpOwo+ICAKPiArc3RhdGljIGlubGluZSBwYWRkcl90IGxm
Yl9iYXNlKHZvaWQpCj4gK3sKPiArICAgIHJldHVybiAocGFkZHJfdCkodmxmYl9pbmZvLmV4dF9s
ZmJfYmFzZSkgPDwgMzIgfCB2bGZiX2luZm8ubGZiX2Jhc2U7CgpUaGlzIHdhbnRzIGFub3RoZXIg
c2V0IG9mIHBhcmVudGhlc2VzIGFyb3VuZCB0aGUgb3BlcmFuZHMgb2YgPDwKZm9yIGRpc2FtYmln
dWF0aW9uIHB1cnBvc2VzLiBXZSByZWFsbHkgb25seSBsZWF2ZSB0aGUgc2Nob29sIG1hdGgKb3Bl
cmF0b3JzICgrLCAtLCAqLCAvLCAlLCBhbmQgb2Z0ZW4gdGhlIHJlbGF0aW9uYWwgb25lcyB3aGVu
IHVzZWQKaW4gaXNvbGF0aW9uKSB1bi1wYXJlbnRoZXNpemVkLCBmb3IgaXQgYmVpbmcgKGhvcGVm
dWxseSkga25vd24gdG8KZXZlcnlvbmUgd2hhdCB0aGVpciBwcmVjZWRlbmNlIGlzLgoKPiBAQCAt
OTcsMTUgKzEwMiwxNSBAQCB2b2lkIF9faW5pdCB2ZXNhX2luaXQodm9pZCkKPiAgICAgIGxmYnAu
dGV4dF9jb2x1bW5zID0gdmxmYl9pbmZvLndpZHRoIC8gZm9udC0+d2lkdGg7Cj4gICAgICBsZmJw
LnRleHRfcm93cyA9IHZsZmJfaW5mby5oZWlnaHQgLyBmb250LT5oZWlnaHQ7Cj4gIAo+IC0gICAg
bGZicC5sZmIgPSBsZmIgPSBpb3JlbWFwKHZsZmJfaW5mby5sZmJfYmFzZSwgdnJhbV9yZW1hcCk7
Cj4gKyAgICBsZmJwLmxmYiA9IGxmYiA9IGlvcmVtYXAobGZiX2Jhc2UoKSwgdnJhbV9yZW1hcCk7
Cj4gICAgICBpZiAoICFsZmIgKQo+ICAgICAgICAgIHJldHVybjsKPiAgCj4gICAgICBtZW1zZXQo
bGZiLCAwLCB2cmFtX3JlbWFwKTsKPiAgCj4gLSAgICBwcmludGsoWEVOTE9HX0lORk8gInZlc2Fm
YjogZnJhbWVidWZmZXIgYXQgJSN4LCBtYXBwZWQgdG8gMHglcCwgIgo+ICsgICAgcHJpbnRrKFhF
TkxPR19JTkZPICJ2ZXNhZmI6IGZyYW1lYnVmZmVyIGF0ICUiIFBSSXBhZGRyICIsIG1hcHBlZCB0
byAweCVwLCAiCgpUaGlzIGRyb3BzIHRoZSAweCBwcmVmaXggZnJvbSB0aGUgbG9nZ2VkIGxpbmU7
IGl0IG5lZWRzIHRvIGJlIG1hZGUKZXhwbGljaXQgbm90IGluIHRoZSBmb3JtYXQgc3RyaW5nLgoK
SSB0aGluayB0aGlzIHdvdWxkIGFsc28gYmUgYSBnb29kIG9wcG9ydHVuaXR5IHRvIHVuLXdyYXAg
dGhlIGZvcm1hdApzdHJpbmcuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+ICsr
KyBiL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+IEBAIC05MjMsNiArOTIzLDEwIEBAIHR5cGVk
ZWYgc3RydWN0IGRvbTBfdmdhX2NvbnNvbGVfaW5mbyB7Cj4gICAgICAgICAgICAgIC8qIE1vZGUg
YXR0cmlidXRlcyAob2Zmc2V0IDB4MCwgVkVTQSBjb21tYW5kIDB4NGYwMSkuICovCj4gICAgICAg
ICAgICAgIHVpbnQxNl90IG1vZGVfYXR0cnM7Cj4gICNlbmRpZgo+ICsjaWYgX19YRU5fSU5URVJG
QUNFX1ZFUlNJT05fXyA+PSAweDAwMDQwZDAwIHx8IGRlZmluZWQoX19YRU5fXykKClRoZSAiZGVm
aW5lZChfX1hFTl9fKSIgaXMgdW5uZWNlc3NhcnkgZm9yIG1hc3RlciwgYW5kIHNob3VsZCBoZW5j
ZQpiZSBkcm9wcGVkLiBJJ3ZlIHN1Z2dlc3RlZCB0aGlzIGZvciBiYWNrcG9ydGluZyBvbmx5LgoK
VGhlcmUncyBhbHNvIGFuIHVubmFtZWQgcGFkZGluZyBmaWVsZCB0aGF0IHlvdSBpbnRyb2R1Y2Uu
IFRoaXMKc2hvdWxkIGJlIG1hZGUgZXhwbGljaXQsIHNvIGl0IGNhbiBiZSBhc3NpZ25lZCBhIG1l
YW5pbmcgbGF0ZXIgb24gKGFuZAppbiBwYXJ0aWN1bGFyIGNhbiBiZSBjaGVja2VkIHRvIGJlIHpl
cm8sIGlmIG5lZWQgYmUpLiBBZmFpY3QgdGhlIG9ubHkKaW5zdGFuY2Ugb2YgdGhpcyBzdHJ1Y3R1
cmUgdHlwZSBpcyBhIHN0YXRpYyB2YXJpYWJsZSwgaW4gd2hpY2ggY2FzZSB0aGVyZSdzCm5vIG5l
ZWQgdG8gYWRkIGV4cGxpY2l0IHplcm8gaW5pdGlhbGl6YXRpb24gYW55d2hlcmUuCgpXaXRoIGFs
bCBvZiB0aGVtIHRha2VuIGNhcmUgb2YKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

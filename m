Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8E18768
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 11:04:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOeuF-0006kc-Pk; Thu, 09 May 2019 08:59:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOeuE-0006kX-Eb
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 08:59:58 +0000
X-Inumbo-ID: cf4fa5b4-7238-11e9-97ca-e3caac99f1d2
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf4fa5b4-7238-11e9-97ca-e3caac99f1d2;
 Thu, 09 May 2019 08:59:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 02:59:52 -0600
Message-Id: <5CD3EC03020000780022D0B7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 02:59:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <5CD14ACF020000780022C643@prv1-mh.provo.novell.com>
 <20190509002239.GD24075@mail-itl>
In-Reply-To: <20190509002239.GD24075@mail-itl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA5LjA1LjE5IGF0IDAyOjIyLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gT24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDM6MDc6MjdBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+PiBPbiAwNi4wNS4xOSBhdCAxNjo1MCwgPG1hcm1hcmVrQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+PiA+IC0tLSBhL3hlbi9kcml2ZXJzL3ZpZGVv
L3Zlc2EuYwo+PiA+ICsrKyBiL3hlbi9kcml2ZXJzL3ZpZGVvL3Zlc2EuYwo+PiA+IEBAIC04NCw2
ICs4NCw3IEBAIHZvaWQgX19pbml0IHZlc2FfZWFybHlfaW5pdCh2b2lkKQo+PiA+ICB2b2lkIF9f
aW5pdCB2ZXNhX2luaXQodm9pZCkKPj4gPiAgewo+PiA+ICAgICAgc3RydWN0IGxmYl9wcm9wIGxm
YnA7Cj4+ID4gKyAgICB1bnNpZ25lZCBsb25nIGxmYl9iYXNlOwo+PiA+ICAKPj4gPiAgICAgIGlm
ICggIWZvbnQgKQo+PiA+ICAgICAgICAgIHJldHVybjsKPj4gPiBAQCAtOTcsMTUgKzk4LDE3IEBA
IHZvaWQgX19pbml0IHZlc2FfaW5pdCh2b2lkKQo+PiA+ICAgICAgbGZicC50ZXh0X2NvbHVtbnMg
PSB2bGZiX2luZm8ud2lkdGggLyBmb250LT53aWR0aDsKPj4gPiAgICAgIGxmYnAudGV4dF9yb3dz
ID0gdmxmYl9pbmZvLmhlaWdodCAvIGZvbnQtPmhlaWdodDsKPj4gPiAgCj4+ID4gLSAgICBsZmJw
LmxmYiA9IGxmYiA9IGlvcmVtYXAodmxmYl9pbmZvLmxmYl9iYXNlLCB2cmFtX3JlbWFwKTsKPj4g
PiArICAgIGxmYl9iYXNlID0gdmxmYl9pbmZvLmxmYl9iYXNlOwo+PiA+ICsgICAgbGZiX2Jhc2Ug
fD0gKHVuc2lnbmVkIGxvbmcpdmxmYl9pbmZvLmV4dF9sZmJfYmFzZSA8PCAzMjsKPj4gPiArICAg
IGxmYnAubGZiID0gbGZiID0gaW9yZW1hcChsZmJfYmFzZSwgdnJhbV9yZW1hcCk7Cj4+ID4gICAg
ICBpZiAoICFsZmIgKQo+PiA+ICAgICAgICAgIHJldHVybjsKPj4gPiAgCj4+ID4gICAgICBtZW1z
ZXQobGZiLCAwLCB2cmFtX3JlbWFwKTsKPj4gPiAgCj4+ID4gLSAgICBwcmludGsoWEVOTE9HX0lO
Rk8gInZlc2FmYjogZnJhbWVidWZmZXIgYXQgJSN4LCBtYXBwZWQgdG8gMHglcCwgIgo+PiA+ICsg
ICAgcHJpbnRrKFhFTkxPR19JTkZPICJ2ZXNhZmI6IGZyYW1lYnVmZmVyIGF0ICUjbHgsIG1hcHBl
ZCB0byAweCVwLCAiCj4+ID4gICAgICAgICAgICAgInVzaW5nICV1aywgdG90YWwgJXVrXG4iLAo+
PiA+IC0gICAgICAgICAgIHZsZmJfaW5mby5sZmJfYmFzZSwgbGZiLAo+PiA+ICsgICAgICAgICAg
IGxmYl9iYXNlLCBsZmIsCj4+ID4gICAgICAgICAgICAgdnJhbV9yZW1hcCA+PiAxMCwgdnJhbV90
b3RhbCA+PiAxMCk7Cj4+ID4gICAgICBwcmludGsoWEVOTE9HX0lORk8gInZlc2FmYjogbW9kZSBp
cyAlZHglZHgldSwgbGluZWxlbmd0aD0lZCwgZm9udCAldXgldVxuIiwKPj4gPiAgICAgICAgICAg
ICB2bGZiX2luZm8ud2lkdGgsIHZsZmJfaW5mby5oZWlnaHQsCj4+ID4gQEAgLTE1Miw2ICsxNTUs
MTAgQEAgdm9pZCBfX2luaXQgdmVzYV9tdHJyX2luaXQodm9pZCkKPj4gPiAgICAgICAgICBNVFJS
X1RZUEVfV1JDT01CLCBNVFJSX1RZUEVfV1JUSFJPVUdIIH07Cj4+ID4gICAgICB1bnNpZ25lZCBp
bnQgc2l6ZV90b3RhbDsKPj4gPiAgICAgIGludCByYywgdHlwZTsKPj4gPiArICAgIHVuc2lnbmVk
IGxvbmcgbGZiX2Jhc2U7Cj4+ID4gKwo+PiA+ICsgICAgbGZiX2Jhc2UgPSB2bGZiX2luZm8ubGZi
X2Jhc2U7Cj4+ID4gKyAgICBsZmJfYmFzZSB8PSAodW5zaWduZWQgbG9uZyl2bGZiX2luZm8uZXh0
X2xmYl9iYXNlIDw8IDMyOwo+PiA+ICAKPj4gPiAgICAgIGlmICggIWxmYiB8fCAodmVzYV9tdHJy
ID09IDApIHx8ICh2ZXNhX210cnIgPj0gQVJSQVlfU0laRShtdHJyX3R5cGVzKSkgKQo+PiA+ICAg
ICAgICAgIHJldHVybjsKPj4gPiBAQCAtMTY3LDcgKzE3NCw3IEBAIHZvaWQgX19pbml0IHZlc2Ff
bXRycl9pbml0KHZvaWQpCj4+ID4gIAo+PiA+ICAgICAgLyogVHJ5IGFuZCBmaW5kIGEgcG93ZXIg
b2YgdHdvIHRvIGFkZCAqLwo+PiA+ICAgICAgZG8gewo+PiA+IC0gICAgICAgIHJjID0gbXRycl9h
ZGQodmxmYl9pbmZvLmxmYl9iYXNlLCBzaXplX3RvdGFsLCB0eXBlLCAxKTsKPj4gPiArICAgICAg
ICByYyA9IG10cnJfYWRkKGxmYl9iYXNlLCBzaXplX3RvdGFsLCB0eXBlLCAxKTsKPj4gPiAgICAg
ICAgICBzaXplX3RvdGFsID4+PSAxOwo+PiA+ICAgICAgfSB3aGlsZSAoIChzaXplX3RvdGFsID49
IFBBR0VfU0laRSkgJiYgKHJjID09IC1FSU5WQUwpICk7Cj4+ID4gIH0KPj4gCj4+IEltbyB0aGUg
cmVzdWx0IHdvdWxkIGJlIGJldHRlciByZWFkYWJsZSBpZiwgaW5zdGVhZCBvZiB0aGUgbG9jYWwK
Pj4gdmFyaWFibGVzLCB5b3UgaW50cm9kdWNlZCBhbiBpbmxpbmUgaGVscGVyIGxmYl9iYXNlKCku
Cj4gCj4gTm90IG5lY2Vzc2FyaWx5IC0gdmxmYl9pbmZvIGlzIGEgI2RlZmluZSB0byB2Z2FfY29u
c29sZV9pbmZvLnUudmVzYV9sZmIuCj4gVGhpcyBtZWFucyBzdWNoIGhlbHBlciB3b3VsZCBlaXRo
ZXIgbm90IGhhdmUgYW55IHBhcmFtZXRlcnMsIG9yIHdvdWxkCj4gbmVlZCB0byBoYXZlIGZ1bGwg
c3RydWN0IHhlbl9jb25zb2xlX2luZm8gYXMgYSBwYXJhbWV0ZXIgKGlubmVyCj4gc3RydWN0dXJl
IGlzIGFub255bW91cykuCgpBbm9ueW1vdXMgc3RydWN0dXJlcyBjYW4sIGlpcmMsIGJlIGVhc2ls
eSBoYXZlIHRoZWlyIHR5cGUgdXNlZCBieQp1c2luZyB0eXBlb2YoKS4gQnV0IGluZGVlZCBJIHdh
cyB0aGlua2luZyBhYm91dCBhIHBhcmFtZXRlci1sZXNzCmZ1bmN0aW9uIG9yIG1hY3JvIGFzIGEg
cG9zc2libGUgb3B0aW9uLgoKPiBJbiBib3RoIGNhc2VzLCBpdCB3b24ndCBiZSBvYnZpb3VzIHRo
YXQKPiBsZmJfYmFzZSBsaXZlIGluc2lkZSB2bGZiX2luZm8uIEkgY291bGQgYWRkIHlldCBhbm90
aGVyICNkZWZpbmUgaW5zdGVhZAo+IG9mIGlubGluZSBmdW5jdGlvbiBmb3IgdGhhdCwgYnV0IGl0
IHdvdWxkbid0IGF2b2lkIHRoZSBzZWNvbmQgKG1pbm9yKQo+IGlzc3VlOiBhIGhlbHBlciB3aXRo
b3V0IGEgdmFyaWFibGUgd291bGQgbWVhbiByZWFkaW5nIHRoZSB2YWx1ZSB0d2ljZSBpbgo+IHZl
c2FfaW5pdCgpLiBJbiB0aGVvcnkgaXQgc2hvdWxkbid0IGNoYW5nZSBpbiB0aGUgbWVhbnRpbWUs
IGJ1dCBJTU8KPiBiZXR0ZXIgYXZvaWQgaXQgYW55d2F5LgoKVG8gYmUgaG9uZXN0LCBJJ3ZlIG5v
dGljZWQgdGhpcyB3aGlsZSBwdXR0aW5nIHRvZ2V0aGVyIHRoZSBwcmV2aW91cwpyZXBseSwgYW5k
IEkgZGlkbid0IHRoaW5rIGl0IHdvdWxkIGJ5IGFueSBwcm9ibGVtIGluIHRoZSBzbGlnaHRlc3Qu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B251602E
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 11:10:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNw4a-0005oW-Gj; Tue, 07 May 2019 09:07:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNw4Z-0005oR-9Q
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 09:07:39 +0000
X-Inumbo-ID: 8b2ab622-70a7-11e9-b402-03b23c61a4e9
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b2ab622-70a7-11e9-b402-03b23c61a4e9;
 Tue, 07 May 2019 09:07:31 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 03:07:29 -0600
Message-Id: <5CD14ACF020000780022C643@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 03:07:27 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com><cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
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

Pj4+IE9uIDA2LjA1LjE5IGF0IDE2OjUwLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gLS0tIGEveGVuL2RyaXZlcnMvdmlkZW8vdmVzYS5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvdmlkZW8vdmVzYS5jCj4gQEAgLTg0LDYgKzg0LDcgQEAgdm9pZCBfX2luaXQgdmVzYV9l
YXJseV9pbml0KHZvaWQpCj4gIHZvaWQgX19pbml0IHZlc2FfaW5pdCh2b2lkKQo+ICB7Cj4gICAg
ICBzdHJ1Y3QgbGZiX3Byb3AgbGZicDsKPiArICAgIHVuc2lnbmVkIGxvbmcgbGZiX2Jhc2U7Cj4g
IAo+ICAgICAgaWYgKCAhZm9udCApCj4gICAgICAgICAgcmV0dXJuOwo+IEBAIC05NywxNSArOTgs
MTcgQEAgdm9pZCBfX2luaXQgdmVzYV9pbml0KHZvaWQpCj4gICAgICBsZmJwLnRleHRfY29sdW1u
cyA9IHZsZmJfaW5mby53aWR0aCAvIGZvbnQtPndpZHRoOwo+ICAgICAgbGZicC50ZXh0X3Jvd3Mg
PSB2bGZiX2luZm8uaGVpZ2h0IC8gZm9udC0+aGVpZ2h0Owo+ICAKPiAtICAgIGxmYnAubGZiID0g
bGZiID0gaW9yZW1hcCh2bGZiX2luZm8ubGZiX2Jhc2UsIHZyYW1fcmVtYXApOwo+ICsgICAgbGZi
X2Jhc2UgPSB2bGZiX2luZm8ubGZiX2Jhc2U7Cj4gKyAgICBsZmJfYmFzZSB8PSAodW5zaWduZWQg
bG9uZyl2bGZiX2luZm8uZXh0X2xmYl9iYXNlIDw8IDMyOwo+ICsgICAgbGZicC5sZmIgPSBsZmIg
PSBpb3JlbWFwKGxmYl9iYXNlLCB2cmFtX3JlbWFwKTsKPiAgICAgIGlmICggIWxmYiApCj4gICAg
ICAgICAgcmV0dXJuOwo+ICAKPiAgICAgIG1lbXNldChsZmIsIDAsIHZyYW1fcmVtYXApOwo+ICAK
PiAtICAgIHByaW50ayhYRU5MT0dfSU5GTyAidmVzYWZiOiBmcmFtZWJ1ZmZlciBhdCAlI3gsIG1h
cHBlZCB0byAweCVwLCAiCj4gKyAgICBwcmludGsoWEVOTE9HX0lORk8gInZlc2FmYjogZnJhbWVi
dWZmZXIgYXQgJSNseCwgbWFwcGVkIHRvIDB4JXAsICIKPiAgICAgICAgICAgICAidXNpbmcgJXVr
LCB0b3RhbCAldWtcbiIsCj4gLSAgICAgICAgICAgdmxmYl9pbmZvLmxmYl9iYXNlLCBsZmIsCj4g
KyAgICAgICAgICAgbGZiX2Jhc2UsIGxmYiwKPiAgICAgICAgICAgICB2cmFtX3JlbWFwID4+IDEw
LCB2cmFtX3RvdGFsID4+IDEwKTsKPiAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAidmVzYWZiOiBt
b2RlIGlzICVkeCVkeCV1LCBsaW5lbGVuZ3RoPSVkLCBmb250ICV1eCV1XG4iLAo+ICAgICAgICAg
ICAgIHZsZmJfaW5mby53aWR0aCwgdmxmYl9pbmZvLmhlaWdodCwKPiBAQCAtMTUyLDYgKzE1NSwx
MCBAQCB2b2lkIF9faW5pdCB2ZXNhX210cnJfaW5pdCh2b2lkKQo+ICAgICAgICAgIE1UUlJfVFlQ
RV9XUkNPTUIsIE1UUlJfVFlQRV9XUlRIUk9VR0ggfTsKPiAgICAgIHVuc2lnbmVkIGludCBzaXpl
X3RvdGFsOwo+ICAgICAgaW50IHJjLCB0eXBlOwo+ICsgICAgdW5zaWduZWQgbG9uZyBsZmJfYmFz
ZTsKPiArCj4gKyAgICBsZmJfYmFzZSA9IHZsZmJfaW5mby5sZmJfYmFzZTsKPiArICAgIGxmYl9i
YXNlIHw9ICh1bnNpZ25lZCBsb25nKXZsZmJfaW5mby5leHRfbGZiX2Jhc2UgPDwgMzI7Cj4gIAo+
ICAgICAgaWYgKCAhbGZiIHx8ICh2ZXNhX210cnIgPT0gMCkgfHwgKHZlc2FfbXRyciA+PSBBUlJB
WV9TSVpFKG10cnJfdHlwZXMpKSApCj4gICAgICAgICAgcmV0dXJuOwo+IEBAIC0xNjcsNyArMTc0
LDcgQEAgdm9pZCBfX2luaXQgdmVzYV9tdHJyX2luaXQodm9pZCkKPiAgCj4gICAgICAvKiBUcnkg
YW5kIGZpbmQgYSBwb3dlciBvZiB0d28gdG8gYWRkICovCj4gICAgICBkbyB7Cj4gLSAgICAgICAg
cmMgPSBtdHJyX2FkZCh2bGZiX2luZm8ubGZiX2Jhc2UsIHNpemVfdG90YWwsIHR5cGUsIDEpOwo+
ICsgICAgICAgIHJjID0gbXRycl9hZGQobGZiX2Jhc2UsIHNpemVfdG90YWwsIHR5cGUsIDEpOwo+
ICAgICAgICAgIHNpemVfdG90YWwgPj49IDE7Cj4gICAgICB9IHdoaWxlICggKHNpemVfdG90YWwg
Pj0gUEFHRV9TSVpFKSAmJiAocmMgPT0gLUVJTlZBTCkgKTsKPiAgfQoKSW1vIHRoZSByZXN1bHQg
d291bGQgYmUgYmV0dGVyIHJlYWRhYmxlIGlmLCBpbnN0ZWFkIG9mIHRoZSBsb2NhbAp2YXJpYWJs
ZXMsIHlvdSBpbnRyb2R1Y2VkIGFuIGlubGluZSBoZWxwZXIgbGZiX2Jhc2UoKS4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

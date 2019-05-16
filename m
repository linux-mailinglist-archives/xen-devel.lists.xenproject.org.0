Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C11420A91
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRHr9-000876-J0; Thu, 16 May 2019 14:59:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRHr8-000871-6z
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 14:59:38 +0000
X-Inumbo-ID: 38cfb622-77eb-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 38cfb622-77eb-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 14:59:36 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 08:59:35 -0600
Message-Id: <5CDD7AD8020000780022FC7B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 08:59:36 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <cover.36e828561477c30a5472a8e9213ab0efc5484de8.1558015595.git-series.marmarek@invisiblethingslab.com><cover.36e828561477c30a5472a8e9213ab0efc5484de8.1558015595.git-series.marmarek@invisiblethingslab.com>
 <93faeff91ee3e14320b5048818badc38460143e7.1558015595.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <93faeff91ee3e14320b5048818badc38460143e7.1558015595.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 1/1] xen: fix handling framebuffer
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

Pj4+IE9uIDE2LjA1LjE5IGF0IDE2OjA3LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gLS0tIGEveGVuL2RyaXZlcnMvdmlkZW8vdmVzYS5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvdmlkZW8vdmVzYS5jCj4gQEAgLTQwLDYgKzQwLDExIEBAIHN0YXRpYyBpbnQgX19pbml0
IHBhcnNlX2ZvbnRfaGVpZ2h0KGNvbnN0IGNoYXIgKnMpCj4gIH0KPiAgY3VzdG9tX3BhcmFtKCJm
b250IiwgcGFyc2VfZm9udF9oZWlnaHQpOwo+ICAKPiArc3RhdGljIGlubGluZSBwYWRkcl90IGxm
Yl9iYXNlKHZvaWQpCj4gK3sKPiArICAgIHJldHVybiAocGFkZHJfdCkoKHZsZmJfaW5mby5leHRf
bGZiX2Jhc2UpIDw8IDMyKSB8IHZsZmJfaW5mby5sZmJfYmFzZTsKCkknbSBhZnJhaWQgeW91J3Zl
IG1pc3BsYWNlZCB0aGUgcGFyZW50aGVzZXMgaGVyZS4gSSB3b25kZXIgaWYKdGhpcyBoYXMgd29y
a2VkIGZvciB5b3UgYXQgYWxsLgoKICAgIHJldHVybiAoKHBhZGRyX3QpdmxmYl9pbmZvLmV4dF9s
ZmJfYmFzZSA8PCAzMikgfCB2bGZiX2luZm8ubGZiX2Jhc2U7Cgo+IC0tLSBhL3hlbi9pbmNsdWRl
L3B1YmxpYy94ZW4uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+IEBAIC05MjMs
NiArOTIzLDExIEBAIHR5cGVkZWYgc3RydWN0IGRvbTBfdmdhX2NvbnNvbGVfaW5mbyB7Cj4gICAg
ICAgICAgICAgIC8qIE1vZGUgYXR0cmlidXRlcyAob2Zmc2V0IDB4MCwgVkVTQSBjb21tYW5kIDB4
NGYwMSkuICovCj4gICAgICAgICAgICAgIHVpbnQxNl90IG1vZGVfYXR0cnM7Cj4gICNlbmRpZgo+
ICsjaWYgX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXyA+PSAweDAwMDQwZDAwCj4gKyAgICAgICAg
ICAgIHVpbnQxNl90IF9wYWQ7Cj4gKyAgICAgICAgICAgIC8qIGhpZ2ggMzIgYml0cyBvZiBsZmJf
YmFzZSAqLwo+ICsgICAgICAgICAgICB1aW50MzJfdCBleHRfbGZiX2Jhc2U7Cj4gKyNlbmRpZgoK
U3RyaWN0bHkgc3BlYWtpbmcgdGhlIHBhZGRpbmcgZmllbGQgYmVsb25ncyBhaGVhZCBvZiB0aGUg
ZWFybGllcgojZW5kaWYuCgpCb3RoIGFzcGVjdHMgY2FuIGJlIGZpeGVkIHdoaWxlIGNvbW1pdHRp
bmcsIGJ1dCBjb25maXJtYXRpb24gb24KdGhlIGZpcnN0IHdydCBpdCB3b3JraW5nIGZvciB5b3Ug
d291bGQgc3RpbGwgYmUgbmljZS4gV2l0aCB0aGVtIGluCnBsYWNlClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EF657169
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 21:16:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgDLX-0001H5-Gv; Wed, 26 Jun 2019 19:12:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgDLW-0001H0-Mq
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 19:12:42 +0000
X-Inumbo-ID: 5ec69c7e-9846-11e9-b221-7b47e2c9d97a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ec69c7e-9846-11e9-b221-7b47e2c9d97a;
 Wed, 26 Jun 2019 19:12:42 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E2A7208E3;
 Wed, 26 Jun 2019 19:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561576361;
 bh=TRn00udtMjbUeY4qLQ51RnH9ZitzizyU2Pxfcfhb7uc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=p1i9KWNpM605YEP2cEy1KPkGCRsNQR0K0S1m8Q7ZCRiG0nOAi7gMW4vxD3KiKEOeD
 O/Lx0yDaNm5qhcXMf9CcjSjnIRpuKpiPYoBM5SQHqESoOvanehla94BLqYBdYewTiW
 GibM4ku62ijinw8qflLZlINbMLMs4oMqkVe5azN8=
Date: Wed, 26 Jun 2019 12:12:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-17-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906261204030.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-17-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 16/17] xen/arm64: head: Rework and document
 launch()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEJvb3QgQ1BVIGFuZCBz
ZWNvbmRhcnkgQ1BVcyB3aWxsIHVzZSBkaWZmZXJlbnQgZW50cnkgcG9pbnQgdG8gQyBjb2RlLiBB
dAo+IHRoZSBtb21lbnQsIHRoZSBkZWNpc2lvbiBvbiB3aGljaCBlbnRyeSB0byB1c2UgaXMgdGFr
ZW4gd2l0aGluIGxhdW5jaCgpLgo+IAo+IEluIG9yZGVyIHRvIGF2b2lkIGEgYnJhbmNoIGZvciB0
aGUgZGVjaXNpb24gYW5kIG1ha2UgdGhlIGNvZGUgY2xlYXJlciwKPiBsYXVuY2goKSBpcyByZXdv
cmtlZCB0byB0YWtlIGluIHBhcmFtZXRlcnMgdGhlIGVudHJ5IHBvaW50IGFuZCBpdHMKPiBhcmd1
bWVudHMuCj4gCj4gTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJl
Z2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCj4gZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gvYXJt
L2FybTY0L2hlYWQuUyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2Fy
bS9hcm02NC9oZWFkLlMKPiBpbmRleCA0ZjdmYTY3NjlmLi4xMzBhYjY2ZDhlIDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TCj4gQEAgLTMxMiw2ICszMTIsMTEgQEAgcHJpbWFyeV9zd2l0Y2hlZDoKPiAgICAgICAg
ICAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNjZXNzIHRoZSBVQVJULiAqLwo+ICAgICAg
ICAgIGxkciAgIHgyMywgPUVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTCj4gICNlbmRpZgo+ICsg
ICAgICAgIFBSSU5UKCItIFJlYWR5IC1cclxuIikKPiArICAgICAgICAvKiBTZXR1cCB0aGUgYXJn
dW1lbnRzIGZvciBzdGFydF94ZW4gYW5kIGp1bXAgdG8gQyB3b3JsZCAqLwo+ICsgICAgICAgIG1v
diAgIHgwLCB4MjAgICAgICAgICAgICAgICAgLyogeDAgOj0gcGh5c19vZmZzZXQgKi8KPiArICAg
ICAgICBtb3YgICB4MSwgeDIxICAgICAgICAgICAgICAgIC8qIHgxIDo9IHBhZGRyKEZEVCkgKi8K
PiArICAgICAgICBsZHIgICB4MiwgPXN0YXJ0X3hlbgo+ICAgICAgICAgIGIgICAgIGxhdW5jaAo+
ICBFTkRQUk9DKHJlYWxfc3RhcnQpCj4gIAo+IEBAIC0zNzQsNiArMzc5LDkgQEAgc2Vjb25kYXJ5
X3N3aXRjaGVkOgo+ICAgICAgICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3Mg
dGhlIFVBUlQuICovCj4gICAgICAgICAgbGRyICAgeDIzLCA9RUFSTFlfVUFSVF9WSVJUVUFMX0FE
RFJFU1MKPiAgI2VuZGlmCj4gKyAgICAgICAgUFJJTlQoIi0gUmVhZHkgLVxyXG4iKQo+ICsgICAg
ICAgIC8qIEp1bXAgdG8gQyB3b3JsZCAqLwo+ICsgICAgICAgIGxkciAgIHgyLCA9c3RhcnRfc2Vj
b25kYXJ5Cj4gICAgICAgICAgYiAgICAgbGF1bmNoCj4gIEVORFBST0MoaW5pdF9zZWNvbmRhcnkp
Cj4gIAo+IEBAIC03MzQsMjMgKzc0MiwyNCBAQCBzZXR1cF9maXhtYXA6Cj4gICAgICAgICAgcmV0
Cj4gIEVORFBST0Moc2V0dXBfZml4bWFwKQo+ICAKPiArLyoKPiArICogU2V0dXAgdGhlIGluaXRp
YWwgc3RhY2sgYW5kIGp1bXAgdG8gdGhlIEMgd29ybGQKPiArICoKPiArICogSW5wdXRzOgo+ICsg
KiAgIHgwIDogQXJndW1lbnQgMCBvZiB0aGUgQyBmdW5jdGlvbiB0byBjYWxsCj4gKyAqICAgeDEg
OiBBcmd1bWVudCAxIG9mIHRoZSBDIGZ1bmN0aW9uIHRvIGNhbGwKPiArICogICB4MiA6IEMgZW50
cnkgcG9pbnQKCkkga25vdyBpdCBpcyB0aGUgbGFzdCBvbmUgYmVmb3JlIEMtbGFuZCwgYnV0IHdl
IG1pZ2h0IGFzIHdlbGwgYWRkIGEKIkNsb2JiZXJzIiBzZWN0aW9uIHRvbywganVzdCBpbiBjYXNl
LiBIZXJlIGl0IGNsb2JiZXJzIHg0IChvciB4Mywgc2VlCmJlbG93KS4KCgo+ICsgKi8KPiAgbGF1
bmNoOgo+IC0gICAgICAgIFBSSU5UKCItIFJlYWR5IC1cclxuIikKPiAtCj4gLSAgICAgICAgbGRy
ICAgeDAsID1pbml0X2RhdGEKPiAtICAgICAgICBhZGQgICB4MCwgeDAsICNJTklUSU5GT19zdGFj
ayAvKiBGaW5kIHRoZSBib290LXRpbWUgc3RhY2sgKi8KPiAtICAgICAgICBsZHIgICB4MCwgW3gw
XQo+IC0gICAgICAgIGFkZCAgIHgwLCB4MCwgI1NUQUNLX1NJWkUgICAgLyogKHdoaWNoIGdyb3dz
IGRvd24gZnJvbSB0aGUgdG9wKS4gKi8KPiAtICAgICAgICBzdWIgICB4MCwgeDAsICNDUFVJTkZP
X3NpemVvZiAvKiBNYWtlIHJvb20gZm9yIENQVSBzYXZlIHJlY29yZCAqLwo+IC0gICAgICAgIG1v
diAgIHNwLCB4MAo+IC0KPiAtICAgICAgICBjYm56ICB4MjIsIDFmCj4gLQo+IC0gICAgICAgIG1v
diAgIHgwLCB4MjAgICAgICAgICAgICAgICAgLyogTWFyc2hhbCBhcmdzOiAtIHBoeXNfb2Zmc2V0
ICovCj4gLSAgICAgICAgbW92ICAgeDEsIHgyMSAgICAgICAgICAgICAgICAvKiAgICAgICAgICAg
ICAgIC0gRkRUICovCj4gLSAgICAgICAgYiAgICAgc3RhcnRfeGVuICAgICAgICAgICAgICAvKiBh
bmQgZGlzYXBwZWFyIGludG8gdGhlIGxhbmQgb2YgQyAqLwo+IC0xOgo+IC0gICAgICAgIGIgICAg
IHN0YXJ0X3NlY29uZGFyeSAgICAgICAgLyogKHRvIHRoZSBhcHByb3ByaWF0ZSBlbnRyeSBwb2lu
dCkgKi8KPiArICAgICAgICBsZHIgICB4NCwgPWluaXRfZGF0YQoKd2h5IG5vdCB1c2UgeDMgaW5z
dGVhZCBvZiB4ND8KCgo+ICsgICAgICAgIGFkZCAgIHg0LCB4NCwgI0lOSVRJTkZPX3N0YWNrIC8q
IEZpbmQgdGhlIGJvb3QtdGltZSBzdGFjayAqLwo+ICsgICAgICAgIGxkciAgIHg0LCBbeDRdCj4g
KyAgICAgICAgYWRkICAgeDQsIHg0LCAjU1RBQ0tfU0laRSAgICAvKiAod2hpY2ggZ3Jvd3MgZG93
biBmcm9tIHRoZSB0b3ApLiAqLwoKSWYgeW91IGFyZSBnb2luZyB0byByZXNwaW4gaXQsIGNvdWxk
IHlvdSBwbGVhc2UgYWxpZ24gdGhlIGNvbW1lbnRzIGEgYml0CmJldHRlciAob25lIHNwYWNlIHRv
IHRoZSByaWdodCk/CgoKPiArICAgICAgICBzdWIgICB4NCwgeDQsICNDUFVJTkZPX3NpemVvZiAv
KiBNYWtlIHJvb20gZm9yIENQVSBzYXZlIHJlY29yZCAqLwo+ICsgICAgICAgIG1vdiAgIHNwLCB4
NAo+ICsKPiArICAgICAgICAvKiBKdW1wIHRvIEMgd29ybGQgKi8KPiArICAgICAgICBiciAgICB4
Mgo+ICBFTkRQUk9DKGxhdW5jaCkKPiAgCj4gIC8qIEZhaWwtc3RvcCAqLwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

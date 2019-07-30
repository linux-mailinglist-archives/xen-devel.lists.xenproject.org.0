Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16787B4EF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 23:23:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsZYu-0001CF-SJ; Tue, 30 Jul 2019 21:21:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsZYt-0001CA-Ez
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 21:21:35 +0000
X-Inumbo-ID: 01557c1a-b310-11e9-88a8-2b782261c61c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01557c1a-b310-11e9-88a8-2b782261c61c;
 Tue, 30 Jul 2019 21:21:34 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3A02205F4;
 Tue, 30 Jul 2019 21:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564521693;
 bh=Le3rczvkQS+MrreETpnOsAkMS59EqIVfAxmpDzxVDEc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=fqqliyweEfx3tV/iYD/8YHlTuRxxZLDO95EP/R0CNLxHQ4RX0ZdnbLqW3bsScgjso
 5KmWewUi+0UbO2bn+T8OgoK9VVlIS7nuANoQ6yZlWvQP8JJmPBn8WlF7IcwYPFc0DC
 CMigOz0YW7p60ohONQusaNBz4yVIxSVqwH12/tKo=
Date: Tue, 30 Jul 2019 14:21:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-34-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301421030.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-34-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 33/35] xen/arm32: head: Rework and
 document launch()
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEJvb3QgQ1BVIGFuZCBz
ZWNvbmRhcnkgQ1BVcyB3aWxsIHVzZSBkaWZmZXJlbnQgZW50cnkgcG9pbnQgdG8gQyBjb2RlLiBB
dAo+IHRoZSBtb21lbnQsIHRoZSBkZWNpc2lvbiBvbiB3aGljaCBlbnRyeSB0byB1c2UgaXMgdGFr
ZW4gd2l0aGluIGxhdW5jaCgpLgo+IAo+IEluIG9yZGVyIHRvIGF2b2lkIHVzaW5nIGNvbmRpdGlv
bmFsIGluc3RydWN0aW9uIGFuZCBtYWtlIHRoZSBjYWxsCj4gY2xlYXJlciwgbGF1bmNoKCkgaXMg
cmV3b3JrZWQgdG8gdGFrZSBpbiBwYXJhbWV0ZXJzIHRoZSBlbnRyeSBwb2ludCBhbmQgaXRzCj4g
YXJndW1lbnRzLgo+IAo+IExhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0aGUgbWFp
biByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQo+IGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gLS0tCj4gICAgIENo
YW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIFBhdGNoIGFkZGVkCj4gLS0tCj4gIHhlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0z
Mi9oZWFkLlMKPiBpbmRleCBlMGY4YzJlMGNiLi42ZDU1YTIxMTlhIDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5T
Cj4gQEAgLTE3MCw2ICsxNzAsMTEgQEAgcHJpbWFyeV9zd2l0Y2hlZDoKPiAgICAgICAgICAvKiBV
c2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNjZXNzIHRoZSBVQVJULiAqLwo+ICAgICAgICAgIG1v
dl93IHIxMSwgRUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MKPiAgI2VuZGlmCj4gKyAgICAgICAg
UFJJTlQoIi0gUmVhZHkgLVxyXG4iKQo+ICsgICAgICAgIC8qIFNldHVwIHRoZSBhcmd1bWVudHMg
Zm9yIHN0YXJ0X3hlbiBhbmQganVtcCB0byBDIHdvcmxkICovCj4gKyAgICAgICAgbW92ICAgcjAs
IHIxMCAgICAgICAgICAgICAgICAvKiByMCA6PSBQaHlzaWNhbCBvZmZzZXQgKi8KPiArICAgICAg
ICBtb3YgICByMSwgcjggICAgICAgICAgICAgICAgIC8qIHIxIDo9IHBhZGRyKEZEVCkgKi8KPiAr
ICAgICAgICBsZHIgICByMiwgPXN0YXJ0X3hlbgo+ICAgICAgICAgIGIgICAgIGxhdW5jaAo+ICBF
TkRQUk9DKHN0YXJ0KQo+ICAKPiBAQCAtMjM0LDYgKzIzOSw5IEBAIHNlY29uZGFyeV9zd2l0Y2hl
ZDoKPiAgICAgICAgICAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNjZXNzIHRoZSBVQVJU
LiAqLwo+ICAgICAgICAgIG1vdl93IHIxMSwgRUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MKPiAg
I2VuZGlmCj4gKyAgICAgICAgUFJJTlQoIi0gUmVhZHkgLVxyXG4iKQo+ICsgICAgICAgIC8qIEp1
bXAgdG8gQyB3b3JsZCAqLwo+ICsgICAgICAgIGxkciAgIHIyLCA9c3RhcnRfc2Vjb25kYXJ5Cj4g
ICAgICAgICAgYiAgICAgbGF1bmNoCj4gIEVORFBST0MoaW5pdF9zZWNvbmRhcnkpCj4gIAo+IEBA
IC01NzgsMTkgKzU4NiwyNSBAQCBzZXR1cF9maXhtYXA6Cj4gICAgICAgICAgbW92ICAgcGMsIGxy
Cj4gIEVORFBST0Moc2V0dXBfZml4bWFwKQo+ICAKPiArLyoKPiArICogU2V0dXAgdGhlIGluaXRp
YWwgc3RhY2sgYW5kIGp1bXAgdG8gdGhlIEMgd29ybGQKPiArICoKPiArICogSW5wdXRzOgo+ICsg
KiAgIHIwIDogQXJndW1lbnQgMCBvZiB0aGUgQyBmdW5jdGlvbiB0byBjYWxsCj4gKyAqICAgcjEg
OiBBcmd1bWVudCAxIG9mIHRoZSBDIGZ1bmN0aW9uIHRvIGNhbGwKPiArICogICByMiA6IEMgZW50
cnkgcG9pbnQKPiArICoKPiArICogQ2xvYmJlcnMgcjMKPiArICovCj4gIGxhdW5jaDoKPiAtICAg
ICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCj4gLQo+IC0gICAgICAgIGxkciAgIHIwLCA9aW5p
dF9kYXRhCj4gLSAgICAgICAgYWRkICAgcjAsICNJTklUSU5GT19zdGFjayAgICAvKiBGaW5kIHRo
ZSBib290LXRpbWUgc3RhY2sgKi8KPiAtICAgICAgICBsZHIgICBzcCwgW3IwXQo+ICsgICAgICAg
IGxkciAgIHIzLCA9aW5pdF9kYXRhCj4gKyAgICAgICAgYWRkICAgcjMsICNJTklUSU5GT19zdGFj
ayAgICAvKiBGaW5kIHRoZSBib290LXRpbWUgc3RhY2sgKi8KPiArICAgICAgICBsZHIgICBzcCwg
W3IzXQo+ICAgICAgICAgIGFkZCAgIHNwLCAjU1RBQ0tfU0laRSAgICAgICAgLyogKHdoaWNoIGdy
b3dzIGRvd24gZnJvbSB0aGUgdG9wKS4gKi8KPiAgICAgICAgICBzdWIgICBzcCwgI0NQVUlORk9f
c2l6ZW9mICAgIC8qIE1ha2Ugcm9vbSBmb3IgQ1BVIHNhdmUgcmVjb3JkICovCj4gLSAgICAgICAg
dGVxICAgcjEyLCAjMAo+IC0gICAgICAgIG1vdmVxIHIwLCByMTAgICAgICAgICAgICAgICAgLyog
TWFyc2hhbCBhcmdzOiAtIHBoeXNfb2Zmc2V0ICovCj4gLSAgICAgICAgbW92ZXEgcjEsIHI4ICAg
ICAgICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gRFRCIGFkZHJlc3MgKi8KPiAtICAgICAg
ICBiZXEgICBzdGFydF94ZW4gICAgICAgICAgICAgIC8qIGFuZCBkaXNhcHBlYXIgaW50byB0aGUg
bGFuZCBvZiBDICovCj4gLSAgICAgICAgYiAgICAgc3RhcnRfc2Vjb25kYXJ5ICAgICAgICAvKiAo
dG8gdGhlIGFwcHJvcHJpYXRlIGVudHJ5IHBvaW50KSAqLwo+ICsKPiArICAgICAgICAvKiBKdW1w
IHRvIEMgd29ybGQgKi8KPiArICAgICAgIGJ4ICAgIHIyCgpXaHkgYng/CgoKPiAgRU5EUFJPQyhs
YXVuY2gpCj4gIAo+ICAvKiBGYWlsLXN0b3AgKi8KPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

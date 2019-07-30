Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25BD7B0D2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:48:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsWBr-000188-5v; Tue, 30 Jul 2019 17:45:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsWBq-000183-1l
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:45:34 +0000
X-Inumbo-ID: d42341d2-b2f1-11e9-bf1d-b7b57a0f70ca
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d42341d2-b2f1-11e9-bf1d-b7b57a0f70ca;
 Tue, 30 Jul 2019 17:45:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 570C2216C8;
 Tue, 30 Jul 2019 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564508732;
 bh=QZlt36r1MpnaW1vKWfnxO0QzSXnfal+G1WXx6pEsEA8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Ky6cgH5KUcdfZx2OcNocdGdRVLikDHoHh5rTThGaEuk8MGf9wGTLAkdnxgJ5mAb+S
 ukmZFxs2xYsznNnBH1WqLMellsZ7OrYuKUKpSRk6urVb7iBRX50XIrnaVlmev7mJZQ
 Ggyzd/yC49+c4luFj+9l00vyn2cT9fyTYB48vZN4=
Date: Tue, 30 Jul 2019 10:45:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-17-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301044180.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-17-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 16/35] xen/arm64: head: Rework and
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
ZW4gd2l0aGluIGxhdW5jaCgpLgo+IAo+IEluIG9yZGVyIHRvIGF2b2lkIGEgYnJhbmNoIGZvciB0
aGUgZGVjaXNpb24gYW5kIG1ha2UgdGhlIGNvZGUgY2xlYXJlciwKPiBsYXVuY2goKSBpcyByZXdv
cmtlZCB0byB0YWtlIGluIHBhcmFtZXRlcnMgdGhlIGVudHJ5IHBvaW50IGFuZCBpdHMKPiBhcmd1
bWVudHMuCj4gCj4gTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJl
Z2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCj4gZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiAtLS0KPiAgICAgQ2hhbmdl
cyBpbiB2MjoKPiAgICAgICAgIC0gVXNlIHgzIGluc3RlYWQgb2YgeDQKPiAgICAgICAgIC0gQWRk
IGEgY2xvYmJlcnMgc2VjdGlvbgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwg
NDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
Cj4gaW5kZXggZjE2NWRkNjFjYS4uNzU0MTYzNTEwMiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IEBAIC0z
MTIsNiArMzEyLDExIEBAIHByaW1hcnlfc3dpdGNoZWQ6Cj4gICAgICAgICAgLyogVXNlIGEgdmly
dHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4gKi8KPiAgICAgICAgICBsZHIgICB4MjMs
ID1FQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwo+ICAjZW5kaWYKPiArICAgICAgICBQUklOVCgi
LSBSZWFkeSAtXHJcbiIpCj4gKyAgICAgICAgLyogU2V0dXAgdGhlIGFyZ3VtZW50cyBmb3Igc3Rh
cnRfeGVuIGFuZCBqdW1wIHRvIEMgd29ybGQgKi8KPiArICAgICAgICBtb3YgICB4MCwgeDIwICAg
ICAgICAgICAgICAgIC8qIHgwIDo9IFBoeXNpY2FsIG9mZnNldCAqLwo+ICsgICAgICAgIG1vdiAg
IHgxLCB4MjEgICAgICAgICAgICAgICAgLyogeDEgOj0gcGFkZHIoRkRUKSAqLwo+ICsgICAgICAg
IGxkciAgIHgyLCA9c3RhcnRfeGVuCj4gICAgICAgICAgYiAgICAgbGF1bmNoCj4gIEVORFBST0Mo
cmVhbF9zdGFydCkKPiAgCj4gQEAgLTM3NCw2ICszNzksOSBAQCBzZWNvbmRhcnlfc3dpdGNoZWQ6
Cj4gICAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4g
Ki8KPiAgICAgICAgICBsZHIgICB4MjMsID1FQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwo+ICAj
ZW5kaWYKPiArICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCj4gKyAgICAgICAgLyogSnVt
cCB0byBDIHdvcmxkICovCj4gKyAgICAgICAgbGRyICAgeDIsID1zdGFydF9zZWNvbmRhcnkKPiAg
ICAgICAgICBiICAgICBsYXVuY2gKPiAgRU5EUFJPQyhpbml0X3NlY29uZGFyeSkKPiAgCj4gQEAg
LTczMiwyMyArNzQwLDI2IEBAIHNldHVwX2ZpeG1hcDoKPiAgICAgICAgICByZXQKPiAgRU5EUFJP
QyhzZXR1cF9maXhtYXApCj4gIAo+ICsvKgo+ICsgKiBTZXR1cCB0aGUgaW5pdGlhbCBzdGFjayBh
bmQganVtcCB0byB0aGUgQyB3b3JsZAo+ICsgKgo+ICsgKiBJbnB1dHM6Cj4gKyAqICAgeDAgOiBB
cmd1bWVudCAwIG9mIHRoZSBDIGZ1bmN0aW9uIHRvIGNhbGwKPiArICogICB4MSA6IEFyZ3VtZW50
IDEgb2YgdGhlIEMgZnVuY3Rpb24gdG8gY2FsbAo+ICsgKiAgIHgyIDogQyBlbnRyeSBwb2ludAo+
ICsgKgo+ICsgKiBDbG9iYmVycyB4Mwo+ICsgKi8KPiAgbGF1bmNoOgo+IC0gICAgICAgIFBSSU5U
KCItIFJlYWR5IC1cclxuIikKPiAtCj4gLSAgICAgICAgbGRyICAgeDAsID1pbml0X2RhdGEKPiAt
ICAgICAgICBhZGQgICB4MCwgeDAsICNJTklUSU5GT19zdGFjayAvKiBGaW5kIHRoZSBib290LXRp
bWUgc3RhY2sgKi8KPiAtICAgICAgICBsZHIgICB4MCwgW3gwXQo+IC0gICAgICAgIGFkZCAgIHgw
LCB4MCwgI1NUQUNLX1NJWkUgICAgLyogKHdoaWNoIGdyb3dzIGRvd24gZnJvbSB0aGUgdG9wKS4g
Ki8KPiAtICAgICAgICBzdWIgICB4MCwgeDAsICNDUFVJTkZPX3NpemVvZiAvKiBNYWtlIHJvb20g
Zm9yIENQVSBzYXZlIHJlY29yZCAqLwo+IC0gICAgICAgIG1vdiAgIHNwLCB4MAo+IC0KPiAtICAg
ICAgICBjYm56ICB4MjIsIDFmCj4gLQo+IC0gICAgICAgIG1vdiAgIHgwLCB4MjAgICAgICAgICAg
ICAgICAgLyogTWFyc2hhbCBhcmdzOiAtIHBoeXNfb2Zmc2V0ICovCj4gLSAgICAgICAgbW92ICAg
eDEsIHgyMSAgICAgICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gRkRUICovCj4gLSAgICAg
ICAgYiAgICAgc3RhcnRfeGVuICAgICAgICAgICAgICAvKiBhbmQgZGlzYXBwZWFyIGludG8gdGhl
IGxhbmQgb2YgQyAqLwo+IC0xOgo+IC0gICAgICAgIGIgICAgIHN0YXJ0X3NlY29uZGFyeSAgICAg
ICAgLyogKHRvIHRoZSBhcHByb3ByaWF0ZSBlbnRyeSBwb2ludCkgKi8KPiArICAgICAgICBsZHIg
ICB4MywgPWluaXRfZGF0YQo+ICsgICAgICAgIGFkZCAgIHgzLCB4MywgI0lOSVRJTkZPX3N0YWNr
IC8qIEZpbmQgdGhlIGJvb3QtdGltZSBzdGFjayAqLwo+ICsgICAgICAgIGxkciAgIHgzLCBbeDNd
Cj4gKyAgICAgICAgYWRkICAgeDMsIHgzLCAjU1RBQ0tfU0laRSAgICAvKiAod2hpY2ggZ3Jvd3Mg
ZG93biBmcm9tIHRoZSB0b3ApLiAqLwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXiBwbGVhc2UgbW92ZSAxIHNwYWNlIHRvIHRoZQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmlnaHQKCkFzaWRlIGZyb20gdGhpcyBtaW5vciBjb2RlIHN0eWxl
IHRoaW5nCgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKCj4gKyAgICAgICAgc3ViICAgeDMsIHgzLCAjQ1BVSU5GT19zaXplb2YgLyogTWFr
ZSByb29tIGZvciBDUFUgc2F2ZSByZWNvcmQgKi8KPiArICAgICAgICBtb3YgICBzcCwgeDMKPiAr
Cj4gKyAgICAgICAgLyogSnVtcCB0byBDIHdvcmxkICovCj4gKyAgICAgICAgYnIgICAgeDIKPiAg
RU5EUFJPQyhsYXVuY2gpCj4gIAo+ICAvKiBGYWlsLXN0b3AgKi8KPiAtLSAKPiAyLjExLjAKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

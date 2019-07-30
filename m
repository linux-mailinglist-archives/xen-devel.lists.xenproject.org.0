Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7547B470
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 22:42:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYtc-0005uU-Lb; Tue, 30 Jul 2019 20:38:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsYtb-0005uL-S1
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 20:38:55 +0000
X-Inumbo-ID: 0bf14e52-b30a-11e9-a84b-8f68e9f206fb
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bf14e52-b30a-11e9-a84b-8f68e9f206fb;
 Tue, 30 Jul 2019 20:38:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C537820659;
 Tue, 30 Jul 2019 20:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564519134;
 bh=q5jOAnK4C2LYhRgKk4kyv8+UdSmObMeY2j5fIjVI5rc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=JVXkqbniWTGMSRSZ+JOHxdlTyR4MD2DPEgwy5Wje7apoQAS5rh82TaaaM+9Pd+u2k
 0eedOdJOTcBZSwGn0UbVs0AXSKVe53qrhvCaIDBzqbl8Q6RfRyyATYy+NcstUzCSHr
 1IjoitBT2XVZgktSjLYFE83SWI1ggZV0kiab/A7o=
Date: Tue, 30 Jul 2019 13:38:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-31-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301338430.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-31-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 30/35] xen/arm32: head: Don't setup the
 fixmap on secondary CPUs
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHNldHVwX2ZpeG1hcCgp
IHdpbGwgc2V0dXAgdGhlIGZpeG1hcCBpbiB0aGUgYm9vdCBwYWdlIHRhYmxlcyBpbiBvcmRlciB0
bwo+IHVzZSBlYXJseXByaW50ayBhbmQgYWxzbyB1cGRhdGUgdGhlIHJlZ2lzdGVyIHIxMSBob2xk
aW5nIHRoZSBhZGRyZXNzIHRvCj4gdGhlIFVBUlQuCj4gCj4gSG93ZXZlciwgc2Vjb25kYXJ5IENQ
VXMgYXJlIG5vdCB1c2luZyBlYXJseXByaW50ayBiZXR3ZWVuIHR1cm5pbmcgdGhlCj4gTU1VIG9u
IGFuZCBzd2l0Y2hpbmcgdG8gdGhlIHJ1bnRpbWUgcGFnZSB0YWJsZS4gU28gc2V0dGluZyB1cCB0
aGUKPiBmaXhtYXAgaW4gdGhlIGJvb3QgcGFnZXMgdGFibGUgaXMgcG9pbnRsZXNzLgo+IAo+IFRo
aXMgbWVhbnMgbW9zdCBvZiBzZXR1cF9maXhtYXAoKSBpcyBub3QgbmVjZXNzYXJ5IGZvciB0aGUg
c2Vjb25kYXJ5Cj4gQ1BVcy4gVGhlIHVwZGF0ZSBvZiBVQVJUIGFkZHJlc3MgaXMgbm93IG1vdmVk
IG91dCBvZiBzZXR1cF9maXhtYXAoKSBhbmQKPiBkdXBsaWNhdGVkIGluIHRoZSBDUFUgYm9vdCBh
bmQgc2Vjb25kYXJ5IENQVXMgYm9vdC4gQWRkaXRpb25hbGx5LCB0aGUKPiBjYWxsIHRvIHNldHVw
X2ZpeG1hcCgpIGlzIHJlbW92ZWQgZnJvbSBzZWNvbmRhcnkgQ1BVcyBib290Lgo+IAo+IExhc3Rs
eSwgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVwbGFjZSBsb2FkIGZyb20gbGl0ZXJhbCBwb29s
IHdpdGggdGhlCj4gbmV3IG1hY3JvIG1vdl93Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4gdjI6
Cj4gICAgICAgICAtIFBhdGNoIGFkZGVkCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMgfCAyMCArKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Fy
bTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBpbmRleCA2ZGM2MDMyNDk4
Li4wYTVjM2E4NTI1IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiAr
KysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gQEAgLTE1OSw2ICsxNTksMTAgQEAgcGFz
dF96SW1hZ2U6Cj4gICAgICAgICAgbW92ICAgcGMsIHIwCj4gIHByaW1hcnlfc3dpdGNoZWQ6Cj4g
ICAgICAgICAgYmwgICAgc2V0dXBfZml4bWFwCj4gKyNpZmRlZiBDT05GSUdfRUFSTFlfUFJJTlRL
Cj4gKyAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4g
Ki8KPiArICAgICAgICBtb3ZfdyByMTEsIEVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTCj4gKyNl
bmRpZgo+ICAgICAgICAgIGIgICAgIGxhdW5jaAo+ICBFTkRQUk9DKHN0YXJ0KQo+ICAKPiBAQCAt
MjAwLDggKzIwNCw2IEBAIEdMT0JBTChpbml0X3NlY29uZGFyeSkKPiAgICAgICAgICBsZHIgICBy
MCwgPXNlY29uZGFyeV9zd2l0Y2hlZAo+ICAgICAgICAgIG1vdiAgIHBjLCByMAo+ICBzZWNvbmRh
cnlfc3dpdGNoZWQ6Cj4gLSAgICAgICAgYmwgICAgc2V0dXBfZml4bWFwCj4gLQo+ICAgICAgICAg
IC8qCj4gICAgICAgICAgICogTm9uLWJvb3QgQ1BVcyBuZWVkIHRvIG1vdmUgb24gdG8gdGhlIHBy
b3BlciBwYWdldGFibGVzLCB3aGljaCB3ZXJlCj4gICAgICAgICAgICogc2V0dXAgaW4gaW5pdF9z
ZWNvbmRhcnlfcGFnZXRhYmxlcy4KPiBAQCAtMjIxLDYgKzIyMywxMCBAQCBzZWNvbmRhcnlfc3dp
dGNoZWQ6Cj4gICAgICAgICAgZHNiICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBFbnN1cmUg
Y29tcGxldGlvbiBvZiBUTEIrQlAgZmx1c2ggKi8KPiAgICAgICAgICBpc2IKPiAgCj4gKyNpZmRl
ZiBDT05GSUdfRUFSTFlfUFJJTlRLCj4gKyAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNz
IHRvIGFjY2VzcyB0aGUgVUFSVC4gKi8KPiArICAgICAgICBtb3ZfdyByMTEsIEVBUkxZX1VBUlRf
VklSVFVBTF9BRERSRVNTCj4gKyNlbmRpZgo+ICAgICAgICAgIGIgICAgIGxhdW5jaAo+ICBFTkRQ
Uk9DKGluaXRfc2Vjb25kYXJ5KQo+ICAKPiBAQCAtNDc1LDEzICs0ODEsNiBAQCBzZXR1cF9maXht
YXA6Cj4gICAgICAgICAgICovCj4gICAgICAgICAgZHNiCj4gICNpZiBkZWZpbmVkKENPTkZJR19F
QVJMWV9QUklOVEspIC8qIEZpeG1hcCBpcyBvbmx5IHVzZWQgYnkgZWFybHkgcHJpbnRrICovCj4g
LSAgICAgICAgLyoKPiAtICAgICAgICAgKiBOb24tYm9vdCBDUFVzIGRvbid0IG5lZWQgdG8gcmVi
dWlsZCB0aGUgZml4bWFwIGl0c2VsZiwganVzdAo+IC0gICAgICAgICAqIHRoZSBtYXBwaW5nIGZy
b20gYm9vdF9zZWNvbmQgdG8geGVuX2ZpeG1hcAo+IC0gICAgICAgICAqLwo+IC0gICAgICAgIHRl
cSAgIHIxMiwgIzAKPiAtICAgICAgICBibmUgICAxZgo+IC0KPiAgICAgICAgICAvKiBBZGQgVUFS
VCB0byB0aGUgZml4bWFwIHRhYmxlICovCj4gICAgICAgICAgbGRyICAgcjEsID14ZW5fZml4bWFw
ICAgICAgICAvKiByMSA6PSB2YWRkciAoeGVuX2ZpeG1hcCkgKi8KPiAgICAgICAgICBsc3IgICBy
MiwgcjExLCAjVEhJUkRfU0hJRlQKPiBAQCAtNTAyLDkgKzUwMSw2IEBAIHNldHVwX2ZpeG1hcDoK
PiAgICAgICAgICBtb3YgICByNCwgcjQsIGxzciAjKFNFQ09ORF9TSElGVCAtIDMpICAgLyogcjQg
Oj0gU2xvdCBmb3IgRklYTUFQKDApICovCj4gICAgICAgICAgbW92ICAgcjMsICMweDAKPiAgICAg
ICAgICBzdHJkICByMiwgcjMsIFtyMSwgcjRdICAgICAgIC8qIE1hcCBpdCBpbiB0aGUgZml4bWFw
J3Mgc2xvdCAqLwo+IC0KPiAtICAgICAgICAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNj
ZXNzIHRoZSBVQVJULiAqLwo+IC0gICAgICAgIGxkciAgIHIxMSwgPUVBUkxZX1VBUlRfVklSVFVB
TF9BRERSRVNTCj4gICNlbmRpZgo+ICAKPiAgICAgICAgICAvKgo+IC0tIAo+IDIuMTEuMAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

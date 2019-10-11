Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8AFD482C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 21:04:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJ0AP-00038r-8k; Fri, 11 Oct 2019 19:01:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iJ0AN-00038h-PT
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 19:01:31 +0000
X-Inumbo-ID: 891b4a44-ec59-11e9-beca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 891b4a44-ec59-11e9-beca-bc764e2007e4;
 Fri, 11 Oct 2019 19:01:31 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 077CF2190F;
 Fri, 11 Oct 2019 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570820490;
 bh=Mz/CZ6EHWg/dh8LIp0C2/JMssDF3EiHvWCNGRfrrGKs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=GV0CBWlujPdLdhFDd4hwUCuJmT3gFepH81qm2fBjYAX0DVoqUW8eULr621D3cvU55
 NyJe6gwQ+p8IA6c9SvX3mSiaX65oFMQBUvst+2ANWicgwoOQIF9CHNAtHnYsrYuY9F
 ODy7Q0jz/UjLSNnVzj4kz/7xKzj6t+v3DjdGbBp8=
Date: Fri, 11 Oct 2019 12:01:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <50786e73-e98a-2eea-f4b8-396afa1ef7ca@arm.com>
Message-ID: <alpine.DEB.2.21.1910111156140.6326@sstabellini-ThinkPad-T480s>
References: <20190917160202.16770-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1909191613060.19418@sstabellini-ThinkPad-T480s>
 <5a093a67-51f6-2d3d-6a98-87753cf4d186@arm.com>
 <alpine.DEB.2.21.1909200813510.3272@sstabellini-ThinkPad-T480s>
 <72de38de-2856-8873-ed70-6c354786bba3@arm.com>
 <alpine.DEB.2.21.1910021756570.2691@sstabellini-ThinkPad-T480s>
 <40fc893e-2739-2fec-4b17-2aaa733ddc6c@arm.com>
 <alpine.DEB.2.21.1910071620140.13684@sstabellini-ThinkPad-T480s>
 <c9b7bd90-344c-77a1-0191-c215f1b201c1@arm.com>
 <alpine.DEB.2.21.1910081422040.13684@sstabellini-ThinkPad-T480s>
 <69bdb4a8-a50f-61cf-f685-867f67436555@arm.com>
 <alpine.DEB.2.21.1910101729000.9081@sstabellini-ThinkPad-T480s>
 <ef551ef4-f4a2-4829-1405-2bcf541f17c3@arm.com>
 <alpine.DEB.2.21.1910111002250.6326@sstabellini-ThinkPad-T480s>
 <50786e73-e98a-2eea-f4b8-396afa1ef7ca@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTAvMTEvMTkgNjoxMSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiBU
aGlzIGlzIG5vdCBwcmV0dHksIGJ1dCBJIGRvbid0IHZpZXcgdGhpcyBhcyBjcml0aWNhbCB0byBm
aXggZm9yIFhlbiA0LjEzLgo+ID4gPiBTbwo+ID4gPiBJIGFtIHRoaW5raW5nIHRvIGRlZmVyIHRo
aXMgcG9zdCA0LjEzLgo+ID4gCj4gPiBJZiB0aGUgaXNzdWUgZG9lc24ndCB0cmlnZ2VyIG9uIDQu
MTMsIHRoZW4gSSBhZ3JlZSB3ZSBzaG91bGRuJ3QgdHJ5IHRvCj4gPiBmaXggaXQgKGJhZGx5KSBh
dCB0aGlzIHN0YWdlLgo+ID4gCj4gPiBCdXQgd2UgZG8gaGF2ZSBhICJtaW51cyBwaHlzX29mZnNl
dCIgb3BlcmF0aW9uIGluIGR1bXBfaHlwX3dhbGssIEkgZG9uJ3QKPiA+IGZvbGxvdyB3aHkgd2Ug
d291bGRuJ3Qgc2VlIGEgcHJvYmxlbSBpZiBYZW4gaXMgbG9hZGVkIGF0IDFNQiBvbiBhcm0zMi4K
PiAKPiBJIGhhdmVuJ3Qgc2FpZCB0aGUgaXNzdWUgY2Fubm90IGJlIHRyaWdnZXJlZC4gSSBwb2lu
dGVkIG91dCBJIGRvbid0IHZpZXcgdGhpcwo+IGFzIGNyaXRpY2FsLgo+IAo+IE9uZSBvZiB0aGUg
cmVhc29uIGlzIHRoYXQgSSBiZXQgbm9ib2R5IGV2ZXIgcnVuIFhlbiBiZWxvdyAxTUIgb24gQXJt
MzIuCj4gT3RoZXJ3aXNlIHRoZXkgd291bGQgaGF2ZSBzZWVuIGFuIGVycm9yLi4uCj4gCj4gSW4g
b3RoZXIgd29yZHMsIEkgYW0gbm90IGdvaW5nIHRvIHBsYW4gdG8gZml4IGl0IGZvciBYZW4gNC4x
My4gSG93ZXZlciwgaWYKPiBzb21lb25lIHdhbnRzIHRvIHNwZW5kIHRpbWUgb24gaXQgKGFuZCBo
YXZlIHBsYXRmb3JtIHRvIHRlc3QgaXQpLCB0aGVuIHBhdGNoCj4gYXJlIHdlbGNvbWVkLgoKSWYg
dGhlIGlzc3VlIGNhbiBiZSB0cmlnZ2VyZWQgdGhlbiBJIHRoaW5rIHdlIGhhdmUgYSBjaG9pY2Ug
YmV0d2VlbgpmaXhpbmcgaXQgKHlvdSBkb24ndCBuZWNlc3NhcmlseSBoYXZlIHRvIGJlIHRoZSBv
bmUgdG8gZG8gaXQpIG9yCmRvY3VtZW50aW5nIHRoYXQgWGVuIG5lZWRzIHRvIGJlIGxvYWRlZCBh
Ym92ZSBYRU5fVklSVF9BRERSIG9uIGFybTMyLgpCdXQgc2VlIGJlbG93LgoKCj4gPiBYZW4gcGE6
IDB4MTAwMDAwCj4gPiBYZW4gdmE6IDB4MjAwMDAwCj4gPiBwaHlzX29mZnNldDogMHhmZmYwMDAw
MAo+ID4gCj4gPiB0ZXN0X3ZhOiAweDIwMjAwMAo+ID4gdGVzdF92YSAtIHBoeXNfb2Zmc2V0ID0g
MHhmZmZmZmZmZjAwMzAwMjAwLiBCdXQgaXQgc2hvdWxkIGJlIDB4MTAyMDAwLiA+Cj4gPiBHaXZl
biB0aGF0IHRoZSBwcm9ibGVtIGlzIGluIGEgQlVHX09OIG1heWJlIHdlIGNvdWxkIHJlbW92ZSBp
dD8gT3IganVzdAo+ID4gcmV3b3JrIHRoZSBCVUdfT04/Cj4gCj4gRm9yIGFybTMyLCBkdW1wX2h5
cF93YWxrKCkgaXMgb25seSBjYWxsZWQgd2hlbiB0aGUgQVQgaW5zdHJ1Y3Rpb24gZmFpbHMgdG8K
PiB0cmFuc2xhdGUgYSBwaHlzaWNhbCBhZGRyZXNzLiBZb3UgYXJlIGFscmVhZHkgZG9pbmcgc29t
ZXRoaW5nIHdyb25nIGlmIHlvdQo+IGhpdCwgc28geW91IHdpbGwgcGFuaWMgaW4gZWl0aGVyIGNh
c2UuIFRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgeW91IGRvbid0IGdldAo+IHRoZSBwYWdlLXRhYmxl
IGR1bXBlZC4KCldoeSBkb24ndCB3ZSBjaGFuZ2UgdGhlIEJVR19PTiBsaWtlIHRoZSBmb2xsb3dp
bmc6CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwpp
bmRleCBhNjYzN2NlMzQ3Li5iNzg4M2NmYmFiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0u
YworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMjg0LDEwICsyODQsNyBAQCB2b2lkIGR1bXBf
aHlwX3dhbGsodmFkZHJfdCBhZGRyKQogICAgICAgICAgICAib24gQ1BVJWQgdmlhIFRUQlIgMHgl
MDE2IlBSSXg2NCJcbiIsCiAgICAgICAgICAgIGFkZHIsIHNtcF9wcm9jZXNzb3JfaWQoKSwgdHRi
cik7CiAKLSAgICBpZiAoIHNtcF9wcm9jZXNzb3JfaWQoKSA9PSAwICkKLSAgICAgICAgQlVHX09O
KCAobHBhZV90ICopKHVuc2lnbmVkIGxvbmcpKHR0YnIgLSBwaHlzX29mZnNldCkgIT0gcGd0YWJs
ZSApOwotICAgIGVsc2UKLSAgICAgICAgQlVHX09OKCB2aXJ0X3RvX21hZGRyKHBndGFibGUpICE9
IHR0YnIgKTsKKyAgICBCVUdfT04oIHZpcnRfdG9fbWFkZHIocGd0YWJsZSkgIT0gdHRiciApOwog
ICAgIGR1bXBfcHRfd2Fsayh0dGJyLCBhZGRyLCBIWVBfUFRfUk9PVF9MRVZFTCwgMSk7CiB9CiAK
V2UgcHJvYmFibHkgZG9uJ3QgbmVlZCB0aGUgQ1BVMCBzcGVjaWFsIGNhc2U/CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

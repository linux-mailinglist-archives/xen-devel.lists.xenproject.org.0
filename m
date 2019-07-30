Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947547AED7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:03:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsVTt-0005WB-14; Tue, 30 Jul 2019 17:00:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsVTr-0005Ss-Hw
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:00:07 +0000
X-Inumbo-ID: 7b465726-b2eb-11e9-aad6-970ba5239fe3
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b465726-b2eb-11e9-aad6-970ba5239fe3;
 Tue, 30 Jul 2019 17:00:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34D45208E4;
 Tue, 30 Jul 2019 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564506006;
 bh=vcDTtLlnm3LvbOcwSVSnNAwAEcpa17ZUtU9su50iV4E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=hEA04WvvZiKRkkRHx3tLeC1vG329HNt/zVCI7oBYLgV0l+nzbOi5KW1VfGoZredgB
 qaJRXdrZVwKu1kqOZgQWAUhvb0osN6EJSAqjSVT6wAC7Mvd/GbKO8qYkeY0BlHa73X
 blW/Q1GgrDJuwFr8evSmVE1GczznSY9GLJGDLJYc=
Date: Tue, 30 Jul 2019 10:00:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <d4f7330a-ad8d-032f-2020-efcf649c4312@arm.com>
Message-ID: <alpine.DEB.2.21.1907300959470.28600@sstabellini-ThinkPad-T480s>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-6-julien.grall@arm.com>
 <alpine.DEB.2.21.1907291500210.1237@sstabellini-ThinkPad-T480s>
 <d4f7330a-ad8d-032f-2020-efcf649c4312@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 5/7] xen/arm: traps: Avoid BUG_ON() in
 do_trap_brk()
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

T24gVHVlLCAzMCBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNy8yOS8xOSAxMTowMiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VHVlLCAyMyBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBBdCB0aGUgbW9tZW50
LCBkb190cmFwX2JyaygpIGlzIHVzaW5nIGEgQlVHX09OKCkgdG8gY2hlY2sgdGhlIGhhcmR3YXJl
Cj4gPiA+IGhhcyBiZWVuIGNvcnJlY3RseSBjb25maWd1cmVkIGR1cmluZyBib290Lgo+ID4gPiAK
PiA+ID4gQW55IGVycm9yIHdoZW4gY29uZmlndXJpbmcgdGhlIGhhcmR3YXJlIGNvdWxkIHJlc3Vs
dCB0byBhIGd1ZXN0ICdicmsnCj4gPiA+IHRyYXBwaW5nIGluIHRoZSBoeXBlcnZpc29yIGFuZCBj
cmFzaCBpdC4KPiA+ID4gCj4gPiA+IFRoaXMgaXMgcHJldHR5IGhhcnNoIHRvIGtpbGwgWGVuIHdo
ZW4gYWN0dWFsbHkga2lsbGluZyB0aGUgZ3Vlc3Qgd291bGQKPiA+ID4gYmUgZW5vdWdoIGFzIG1p
c2NvbmZpZ3VyaW5nIHRoaXMgdHJhcCB3b3VsZCBub3QgbGVhZCB0byBleHBvc2luZwo+ID4gPiBz
ZW5zaXRpdmUgZGF0YS4gUmVwbGFjZSB0aGUgQlVHX09OKCkgd2l0aCBjcmFzaGluZyB0aGUgZ3Vl
c3QuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgo+ID4gPiAtLS0KPiA+ID4gICB4ZW4vYXJjaC9hcm0vdHJhcHMuYyB8IDExICsr
KysrKysrLS0tCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdHJhcHMuYyBi
L3hlbi9hcmNoL2FybS90cmFwcy5jCj4gPiA+IGluZGV4IDEzMjY4NmVlMGYuLmVmMzdjYTZiZGUg
MTAwNjQ0Cj4gPiA+IC0tLSBhL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gPiA+ICsrKyBiL3hlbi9h
cmNoL2FybS90cmFwcy5jCj4gPiA+IEBAIC0xMzA0LDEwICsxMzA0LDE1IEBAIGludCBkb19idWdf
ZnJhbWUoY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCj4gPiA+IHZhZGRyX3QgcGMp
Cj4gPiA+ICAgI2lmZGVmIENPTkZJR19BUk1fNjQKPiA+ID4gICBzdGF0aWMgdm9pZCBkb190cmFw
X2JyayhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgY29uc3QgdW5pb24gaHNyIGhzcikKPiA+
ID4gICB7Cj4gPiA+IC0gICAgLyogSENSX0VMMi5UR0UgYW5kIE1EQ1JfRUwyLlRERSBhcmUgbm90
IHNldCBzbyB3ZSBuZXZlciByZWNlaXZlCj4gPiA+IC0gICAgICogc29mdHdhcmUgYnJlYWtwb2lu
dCBleGNlcHRpb24gZm9yIEVMMSBhbmQgRUwwIGhlcmUuCj4gPiA+ICsgICAgLyoKPiA+ID4gKyAg
ICAgKiBIQ1JfRUwyLlRHRSBhbmQgTURDUl9FTDIuVERSIGFyZSBjdXJyZW50bHkgbm90IHNldC4g
U28gd2Ugc2hvdWxkCj4gPiA+ICsgICAgICogbmV2ZXIgcmVjZWl2ZSBzb2Z0d2FyZSBicmVha3Bv
aW5nIGV4Y2VwdGlvbiBmb3IgRUwxIGFuZCBFTDAgaGVyZS4KPiA+ID4gICAgICAgICovCj4gPiA+
IC0gICAgQlVHX09OKCFoeXBfbW9kZShyZWdzKSk7Cj4gPiA+ICsgICAgaWYgKCAhaHlwX21vZGUo
cmVncykgKQo+ID4gPiArICAgIHsKPiA+ID4gKyAgICAgICAgZG9tYWluX2NyYXNoKGN1cnJlbnQt
PmRvbWFpbik7Cj4gPiA+ICsgICAgICAgIHJldHVybjsKPiA+ID4gKyAgICB9Cj4gPiAKPiA+IFRo
aXMgaXMgYSBnb29kIGNoYW5nZSB0byBoYXZlLiBJIGFtIHdvbmRlcmluZyBpZiBpdCB3b3VsZCBt
YWtlIHNlbnNlIHRvCj4gPiBhbHNvIHByaW50ayBzb21lIGRlYnVnIG1lc3NhZ2VzLCBtYXliZSBl
dmVuIHNob3dfZXhlY3V0aW9uX3N0YXRlLiBJZiBzbywKPiA+IHdlIG5lZWQgdG8gYmUgY2FyZWZ1
bCB0aGF0IGl0J3Mgb25seSBkb25lIGluIGRlYnVnIGJ1aWxkcywgb3IgaXQgaXMgcmF0ZQo+ID4g
bGltaXRlZC4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gCj4gTWVzc2FnZXMgYXJlIGFscmVhZHkgcHJp
bnRlZCBieSBkb21haW5fY3Jhc2goLi4uKS4gQnV0IEkgZG9uJ3Qgc2VlIHRoZSBjb25jZXJuCj4g
YWJvdXQgbm9uLWRlYnVnIGJ1aWxkIG9yIGV2ZW4gbm90IHJhdGUgbGltaXRpbmcuLi4gSWYgdGhl
IGRvbWFpbiBjcmFzaCwgdGhlbgo+IGl0IHdpbGwgbm90IGNhdXNlIGFueW1vcmUgcHJpbnQgYW5k
IHRoZXJlZm9yZSB5b3UgY2FuJ3Qgc3BhbSB0aGUgY29uc29sZSBoZXJlLgoKQWggeWVzLCB5b3Ug
YXJlIHF1aXRlIHJpZ2h0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE354C2B83
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 03:08:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF6bf-0005Cn-Cj; Tue, 01 Oct 2019 01:05:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF6bd-0005Ci-QN
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 01:05:33 +0000
X-Inumbo-ID: 90eb1cf6-e3e7-11e9-96eb-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 90eb1cf6-e3e7-11e9-96eb-12813bfff9fa;
 Tue, 01 Oct 2019 01:05:32 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C1DA2075C;
 Tue,  1 Oct 2019 01:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569891931;
 bh=TW5ALbkgd4SKmZgQzHTXobFoJA0pehiV24Y6/p5BReA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tud9nipJcsjfd0bOVAdef9eFLUEyCPHxwQF19jgqHCMyc1bA+AG/8+sFwkM6U7sDA
 B4g7jn5pMyeF5c55xJ3m6ZPTvWM5wJiOcWwDpUnzW1LJNhcslaAEN1qonASRsCJZ5Y
 6oT3tg6bge4LdWzP+4zEoyQhon1o/vt7LxSTFuvg=
Date: Mon, 30 Sep 2019 18:05:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190929155627.23493-2-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1909301802520.2594@sstabellini-ThinkPad-T480s>
References: <20190929155627.23493-1-julien.grall@arm.com>
 <20190929155627.23493-2-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 1/2] xen/arm: domain_build: Avoid
 implicit conversion from ULL to UL
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCAyOSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENsYW5nIDguMCB3aWxs
IGZhaWwgdG8gYnVpbGQgZG9tYWluX2J1aWxkLmMgb24gQXJtMzIgYmVjYXVzZSBvZiB0aGUKPiBm
b2xsb3dpbmcgZXJyb3I6Cj4gCj4gZG9tYWluX2J1aWxkLmM6NDQ4OjIxOiBlcnJvcjogaW1wbGlj
aXQgY29udmVyc2lvbiBmcm9tICd1bnNpZ25lZCBsb25nIGxvbmcnIHRvICd1bnNpZ25lZCBsb25n
JyBjaGFuZ2VzIHZhbHVlIGZyb20gMTA5MDkyMTY5MzE4NCB0byAwCj4gWy1XZXJyb3IsLVdjb25z
dGFudC1jb252ZXJzaW9uXQo+ICAgICBiYW5rX3NpemUgPSBNSU4oR1VFU1RfUkFNMV9TSVpFLCBr
aW5mby0+dW5hc3NpZ25lZF9tZW0pOwo+IAo+IEFybTMyIGlzIGFibGUgdG8gc3VwcG9ydCBtb3Jl
IHRoYW4gNEdCIG9mIHBoeXNpY2FsIG1lbW9yeSwgc28gaXQgd291bGQKPiBiZSB0aGVvcmljYWxs
eSBwb3NzaWJsZSB0byBjcmVhdGUgZG9taWFuIHdpdGggbW9yZSB0aGUgNEdCIG9mIFJBTS4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiBkb21haW4KCk90aGVyIHRoYW4gdGhl
IHR5cG86CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgoKCj4gVGhlcmVmb3JlLCB0aGUgc2l6ZSBvZiBhIGJhbmsgbWF5IG5vdCBmaXQgaW4gMzIt
Yml0Lgo+IAo+IFRoaXMgY2FuIGJlIHJlc29sdmVkIGJ5IHN3aXRjaCB0aGUgdmFyaWFibGUgYmFu
a19zaXplIGFuZCB0aGUgcGFyYW1ldGVyCj4gdG90X3NpemUgdG8gInBhZGRyX3QiLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gLS0t
Cj4gCj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiAgICAgSSBhbSBu
b3QgYXdhcmUgb2YgYW55IHVzZXJzIHRyeWluZyB0byBhbGxvY2F0ZSBtb3JlIHRoYW4gNEdCIFZN
IGZvcgo+ICAgICAzMi1iaXQgKHRoZXJlIG1vcmUgaXQgaXMgaW4gdGhlIGRvbTBsZXNzIHBhdGgp
LiBOb25ldGhlbGVzcywgaXQKPiAgICAgd291bGQgYmUgYmVzdCB0byBmaXggaXQgYXMgc29vbiBh
cyBwb3NzaWJsZS4KPiAKPiAgICAgT25seSBidWlsdCB0ZXN0IGl0Lgo+IC0tLQo+ICB4ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggMzM3YTg5
ZTUxOC4uYjc5MWU0YjUxMiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtMzc3LDcgKzM3Nyw3
IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBhbGxvY2F0ZV9tZW1vcnlfMTEoc3RydWN0IGRvbWFpbiAq
ZCwKPiAgc3RhdGljIGJvb2wgX19pbml0IGFsbG9jYXRlX2JhbmtfbWVtb3J5KHN0cnVjdCBkb21h
aW4gKmQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBr
ZXJuZWxfaW5mbyAqa2luZm8sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdmbl90IHNnZm4sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgdG90X3NpemUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhZGRyX3QgdG90X3NpemUpCj4gIHsKPiAgICAgIGludCByZXM7Cj4gICAgICBz
dHJ1Y3QgcGFnZV9pbmZvICpwZzsKPiBAQCAtNDMzLDcgKzQzMyw3IEBAIHN0YXRpYyBib29sIF9f
aW5pdCBhbGxvY2F0ZV9iYW5rX21lbW9yeShzdHJ1Y3QgZG9tYWluICpkLAo+ICBzdGF0aWMgdm9p
ZCBfX2luaXQgYWxsb2NhdGVfbWVtb3J5KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxf
aW5mbyAqa2luZm8pCj4gIHsKPiAgICAgIHVuc2lnbmVkIGludCBpOwo+IC0gICAgdW5zaWduZWQg
bG9uZyBiYW5rX3NpemU7Cj4gKyAgICBwYWRkcl90IGJhbmtfc2l6ZTsKPiAgCj4gICAgICBwcmlu
dGsoWEVOTE9HX0lORk8gIkFsbG9jYXRpbmcgbWFwcGluZ3MgdG90YWxsaW5nICVsZE1CIGZvciAl
cGQ6XG4iLAo+ICAgICAgICAgICAgIC8qIERvbid0IHdhbnQgZm9ybWF0IHRoaXMgYXMgUFJJcGFk
ZHIgKDE2IGRpZ2l0IGhleCkgKi8KPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

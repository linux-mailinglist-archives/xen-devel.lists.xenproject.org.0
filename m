Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7570F5714D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 21:05:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgDCB-0000MT-9j; Wed, 26 Jun 2019 19:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgDC9-0000MK-TX
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 19:03:01 +0000
X-Inumbo-ID: 0453de60-9845-11e9-9c0f-6751f68d3022
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0453de60-9845-11e9-9c0f-6751f68d3022;
 Wed, 26 Jun 2019 19:03:00 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF3C7216FD;
 Wed, 26 Jun 2019 19:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561575780;
 bh=jDdu3AqVfD+g9HDbjJXTNwuJrC9DrjsHS747gxkhHN8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nJd3X39KgR+t7YVgW325mlbFY9KpYIX9wQkWptV64x+Bik2YrQh6sBfO+DwQImjgF
 qwCUXjuTpF6FztOqlRetzydk5GBjFo+vXWT8aBK+aUqrahhYqkyeo5cMYgPLeSMfPj
 QVERHtnFqkNNAJn4CZveCUNCEcvWsIpDgXOpQ/f4=
Date: Wed, 26 Jun 2019 12:02:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-16-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906261202110.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-16-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 15/17] xen/arm64: head: Rework and document
 setup_fixmap()
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

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSBmaXhtYXAgdGFibGUgaXMgb25seSBob29rZWQgd2hlbiBlYXJseXByaW50ayBpcyB1c2Vk
Lgo+IFRoaXMgaXMgZmluZSB0b2RheSBiZWNhdXNlIGluIEMgbGFuZCwgdGhlIGZpeG1hcCBpcyBu
b3QgdXNlZCBieSBhbnlvbmUKPiB1bnRpbCB0aGUgdGhlIGJvb3QgQ1BVIGlzIHN3aXRjaGluZyB0
byB0aGUgcnVudGltZSBwYWdlLXRhYmxlcy4KPiAKPiBJbiB0aGUgZnV0dXJlLCB0aGUgYm9vdCBD
UFUgd2lsbCBub3Qgc3dpdGNoIGJldHdlZW4gcGFnZS10YWJsZXMgdG8gYXZvaWQKPiBUTEIgY29u
ZmxpY3QuIFRoaXMgbWVhbnMgdGhlIGZpeG1hcCB0YWJsZSB3aWxsIG5lZWQgdG8gYmUgaG9va2Vk
IGJlZm9yZQo+IGFueSB1c2UuIEZvciBzaW1wbGljaXR5LCBzZXR1cF9maXhtYXAoKSB3aWxsIG5v
dyBkbyB0aGF0IGpvYi4KPiAKPiBMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhl
IG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUKPiBmdW5jdGlvbi4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICB4ZW4v
YXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMTMgKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBpbmRl
eCA5NmU4NWY4ODM0Li40ZjdmYTY3NjlmIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gQEAgLTcwMCw4ICs3
MDAsMTcgQEAgaWRfbWFwX3JlbW92ZWQ6Cj4gICAgICAgICAgcmV0Cj4gIEVORFBST0MocmVtb3Zl
X2lkX21hcCkKPiAgCj4gKy8qCj4gKyAqIE1hcCB0aGUgVUFSVCBpbiB0aGUgZml4bWFwICh3aGVu
IGVhcmx5cHJpbnRrIGlzIHVzZWQpIGFuZCBob29rIHRoZQo+ICsgKiBmaXhtYXAgdGFibGUgaW4g
dGhlIHBhZ2UgdGFibGVzLgo+ICsgKgo+ICsgKiBUaGUgZml4bWFwIGNhbm5vdCBiZSBtYXBwZWQg
aW4gY3JlYXRlX3BhZ2VfdGFibGVzIGJlY2F1c2UgaXQgbWF5Cj4gKyAqIGNsYXNoIHdpdGggdGhl
IElEIG1hcC4KPiArICoKPiArICogQ2xvYmJlcnMgeDAgLSB4MQoKSSBtaXNzZWQgdGhpcyBpbiB0
aGUgbGFzdCBlbWFpbDogaXQgc2hvdWxkIGJlIHgwIC0geDQ/CgoKPiArICovCj4gIHNldHVwX2Zp
eG1hcDoKPiAtI2lmIGRlZmluZWQoQ09ORklHX0VBUkxZX1BSSU5USykgLyogRml4bWFwIGlzIG9u
bHkgdXNlZCBieSBlYXJseSBwcmludGsgKi8KPiArI2lmZGVmIENPTkZJR19FQVJMWV9QUklOVEsK
PiAgICAgICAgICAvKiBBZGQgVUFSVCB0byB0aGUgZml4bWFwIHRhYmxlICovCj4gICAgICAgICAg
bGRyICAgeDEsID14ZW5fZml4bWFwICAgICAgICAvKiB4MSA6PSB2YWRkciAoeGVuX2ZpeG1hcCkg
Ki8KPiAgICAgICAgICBsc3IgICB4MiwgeDIzLCAjVEhJUkRfU0hJRlQKPiBAQCAtNzA5LDYgKzcx
OCw3IEBAIHNldHVwX2ZpeG1hcDoKPiAgICAgICAgICBtb3YgICB4MywgI1BUX0RFVl9MMwo+ICAg
ICAgICAgIG9yciAgIHgyLCB4MiwgeDMgICAgICAgICAgICAgLyogeDIgOj0gNEsgZGV2IG1hcCBp
bmNsdWRpbmcgVUFSVCAqLwo+ICAgICAgICAgIHN0ciAgIHgyLCBbeDEsICMoRklYTUFQX0NPTlNP
TEUqOCldIC8qIE1hcCBpdCBpbiB0aGUgZmlyc3QgZml4bWFwJ3Mgc2xvdCAqLwo+ICsjZW5kaWYK
PiAgCj4gICAgICAgICAgLyogTWFwIGZpeG1hcCBpbnRvIGJvb3Rfc2Vjb25kICovCj4gICAgICAg
ICAgbGRyICAgeDQsID1ib290X3NlY29uZCAgICAgICAvKiB4NCA6PSB2YWRkciAoYm9vdF9zZWNv
bmQpICovCj4gQEAgLTcyMSw3ICs3MzEsNiBAQCBzZXR1cF9maXhtYXA6Cj4gIAo+ICAgICAgICAg
IC8qIEVuc3VyZSBhbnkgcGFnZSB0YWJsZSB1cGRhdGVzIG1hZGUgYWJvdmUgaGF2ZSBvY2N1cnJl
ZCAqLwo+ICAgICAgICAgIGRzYiAgIG5zaHN0Cj4gLSNlbmRpZgo+ICAgICAgICAgIHJldAo+ICBF
TkRQUk9DKHNldHVwX2ZpeG1hcCkKPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

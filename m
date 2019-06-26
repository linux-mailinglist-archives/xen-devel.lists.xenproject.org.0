Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823AB57148
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 21:04:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgDAo-0000Df-IV; Wed, 26 Jun 2019 19:01:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgDAn-0000Da-OU
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 19:01:37 +0000
X-Inumbo-ID: d20db9da-9844-11e9-84bc-cb5a08194bb2
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d20db9da-9844-11e9-84bc-cb5a08194bb2;
 Wed, 26 Jun 2019 19:01:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8112D216C8;
 Wed, 26 Jun 2019 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561575695;
 bh=W8Qwi39ibDj7CfGe4ssGah2oKqetIjDqd/AesGScd7o=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=efTAqfqC56HBcbKLNUJYNdmj4C/1VL9IzTFl8PjqKm5hB1rf7YnXafA048QA02s9I
 Kc2YXAuvUjs+VGs6hEKf/mT+w/QGaf8HRo1hCzQVPrN8LaKIg0spCIjSq5CSz9fJ1x
 JXjxhzBzCqPI+k2Xy+wg3HWogZOvIHAa+xrZQlMk=
Date: Wed, 26 Jun 2019 12:01:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-16-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906261153580.5851@sstabellini-ThinkPad-T480s>
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
dyBkbyB0aGF0IGpvYi4KCkNhbiBJIGFzayB5b3UgdG8gcmV3b3JkIHRoaXMgc2xpZ2h0bHksIGVz
cGVjaWFsbHkgdGhlIGxhc3Qgc2VudGVuY2U/IEl0CnRvb2sgbWUgYSB3aGlsZSB0byB1bmRlcnN0
YW5kIHdoYXQgeW91IG1lYW50LiBJIHN1Z2dlc3Q6CgogSW4gdGhlIGZ1dHVyZSwgdGhlIGJvb3Qg
Q1BVIHdpbGwgbm90IHN3aXRjaCBiZXR3ZWVuIHBhZ2UtdGFibGVzIHRvCiBhdm9pZCBhbnkgVExC
IGNvbmZsaWN0cy4gVGh1cywgdGhlIGZpeG1hcCB0YWJsZSB3aWxsIG5lZWQgdG8gYmUgYWx3YXlz
CiBob29rZWQgYmVmb3JlIGFueSB1c2UuIExldCdzIHN0YXJ0IGRvaW5nIGl0IG5vdyBpbiBzZXR1
cF9maXhtYXAoKS4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CgoKPiBMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1haW4g
cmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUKPiBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TIHwgMTMgKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBpbmRleCA5NmU4
NWY4ODM0Li40ZjdmYTY3NjlmIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gQEAgLTcwMCw4ICs3MDAsMTcg
QEAgaWRfbWFwX3JlbW92ZWQ6Cj4gICAgICAgICAgcmV0Cj4gIEVORFBST0MocmVtb3ZlX2lkX21h
cCkKPiAgCj4gKy8qCj4gKyAqIE1hcCB0aGUgVUFSVCBpbiB0aGUgZml4bWFwICh3aGVuIGVhcmx5
cHJpbnRrIGlzIHVzZWQpIGFuZCBob29rIHRoZQo+ICsgKiBmaXhtYXAgdGFibGUgaW4gdGhlIHBh
Z2UgdGFibGVzLgo+ICsgKgo+ICsgKiBUaGUgZml4bWFwIGNhbm5vdCBiZSBtYXBwZWQgaW4gY3Jl
YXRlX3BhZ2VfdGFibGVzIGJlY2F1c2UgaXQgbWF5Cj4gKyAqIGNsYXNoIHdpdGggdGhlIElEIG1h
cC4KPiArICoKPiArICogQ2xvYmJlcnMgeDAgLSB4MQo+ICsgKi8KPiAgc2V0dXBfZml4bWFwOgo+
IC0jaWYgZGVmaW5lZChDT05GSUdfRUFSTFlfUFJJTlRLKSAvKiBGaXhtYXAgaXMgb25seSB1c2Vk
IGJ5IGVhcmx5IHByaW50ayAqLwo+ICsjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USwoKSSBhbSBj
dXJpb3VzIHdoeSB5b3UgbWFkZSB0aGlzIGNvZGUgc3R5bGUgY2hhbmdlCgoKPiAgICAgICAgICAv
KiBBZGQgVUFSVCB0byB0aGUgZml4bWFwIHRhYmxlICovCj4gICAgICAgICAgbGRyICAgeDEsID14
ZW5fZml4bWFwICAgICAgICAvKiB4MSA6PSB2YWRkciAoeGVuX2ZpeG1hcCkgKi8KPiAgICAgICAg
ICBsc3IgICB4MiwgeDIzLCAjVEhJUkRfU0hJRlQKPiBAQCAtNzA5LDYgKzcxOCw3IEBAIHNldHVw
X2ZpeG1hcDoKPiAgICAgICAgICBtb3YgICB4MywgI1BUX0RFVl9MMwo+ICAgICAgICAgIG9yciAg
IHgyLCB4MiwgeDMgICAgICAgICAgICAgLyogeDIgOj0gNEsgZGV2IG1hcCBpbmNsdWRpbmcgVUFS
VCAqLwo+ICAgICAgICAgIHN0ciAgIHgyLCBbeDEsICMoRklYTUFQX0NPTlNPTEUqOCldIC8qIE1h
cCBpdCBpbiB0aGUgZmlyc3QgZml4bWFwJ3Mgc2xvdCAqLwo+ICsjZW5kaWYKPiAgCj4gICAgICAg
ICAgLyogTWFwIGZpeG1hcCBpbnRvIGJvb3Rfc2Vjb25kICovCj4gICAgICAgICAgbGRyICAgeDQs
ID1ib290X3NlY29uZCAgICAgICAvKiB4NCA6PSB2YWRkciAoYm9vdF9zZWNvbmQpICovCj4gQEAg
LTcyMSw3ICs3MzEsNiBAQCBzZXR1cF9maXhtYXA6Cj4gIAo+ICAgICAgICAgIC8qIEVuc3VyZSBh
bnkgcGFnZSB0YWJsZSB1cGRhdGVzIG1hZGUgYWJvdmUgaGF2ZSBvY2N1cnJlZCAqLwo+ICAgICAg
ICAgIGRzYiAgIG5zaHN0Cj4gLSNlbmRpZgo+ICAgICAgICAgIHJldAo+ICBFTkRQUk9DKHNldHVw
X2ZpeG1hcCkKPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

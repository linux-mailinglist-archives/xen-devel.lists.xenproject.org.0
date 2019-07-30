Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63947B4DE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 23:16:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsZSP-0000Ts-Vq; Tue, 30 Jul 2019 21:14:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsZSO-0000Tm-Lk
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 21:14:52 +0000
X-Inumbo-ID: 11d00250-b30f-11e9-8b5e-539f99e52e2a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11d00250-b30f-11e9-8b5e-539f99e52e2a;
 Tue, 30 Jul 2019 21:14:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A06E2067D;
 Tue, 30 Jul 2019 21:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564521291;
 bh=ks27MUk06A/D1gIxFTd6oy6f6/xVvZ8tYkOS/N3KsPU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=kgM6cZ9IMJdCEv5f5C2BOCXr6nmX2ya9gR+iVwlzT968OPkHEW0r2hBVKMB81uG+1
 QWEwC5xIZuhA2s2kO69SKpwa2a2brvz728lDXNlKCyEjvG6rJE2gNejq2MuiPNQxvM
 9/83rgI7Z3+QvmyZezSNJCTI7H4CDfzXipjZLxVA=
Date: Tue, 30 Jul 2019 14:14:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-33-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301414070.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-33-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 32/35] xen/arm32: head: Rework and
 document setup_fixmap()
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSBmaXhtYXAgdGFibGUgaXMgb25seSBob29rZWQgd2hlbiBlYXJseXByaW50ayBpcyB1c2Vk
Lgo+IFRoaXMgaXMgZmluZSB0b2RheSBiZWNhdXNlIGluIEMgbGFuZCwgdGhlIGZpeG1hcCBpcyBu
b3QgdXNlZCBieSBhbnlvbmUKPiB1bnRpbCB0aGUgdGhlIGJvb3QgQ1BVIGlzIHN3aXRjaGluZyB0
byB0aGUgcnVudGltZSBwYWdlLXRhYmxlcy4KPiAKPiBJbiB0aGUgZnV0dXJlLCB0aGUgYm9vdCBD
UFUgd2lsbCBub3Qgc3dpdGNoIGJldHdlZW4gcGFnZS10YWJsZXMgdG8KPiBhdm9pZCBUTEIgaW5j
b2hlcmVuY3kuIFRodXMsIHRoZSBmaXhtYXAgdGFibGUgd2lsbCBuZWVkIHRvIGJlIGFsd2F5cwo+
IGhvb2tlZCBiZW9mcmUgYW55IHVzZS4gTGV0J3Mgc3RhcnQgZG9pbmcgaXQgbm93IGluIHNldHVw
X2ZpeG1hcCgpLgo+IAo+IExhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0aGUgbWFp
biByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQo+IGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gLS0tCj4gICAgIENo
YW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIFBhdGNoIGFkZGVkCj4gLS0tCj4gIHhlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMgfCAxOSArKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+IGluZGV4
IDU2ZTJkMDllZDQuLmUwZjhjMmUwY2IgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTMy
L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBAQCAtNTM2LDggKzUz
NiwyMSBAQCBpZGVudGl0eV9tYXBwaW5nX3JlbW92ZWQ6Cj4gICAgICAgICAgbW92ICAgcGMsIGxy
Cj4gIEVORFBST0MocmVtb3ZlX2lkZW50aXR5X21hcHBpbmcpCj4gIAo+ICsvKgo+ICsgKiBNYXAg
dGhlIFVBUlQgaW4gdGhlIGZpeG1hcCAod2hlbiBlYXJseXByaW50ayBpcyB1c2VkKSBhbmQgaG9v
ayB0aGUKPiArICogZml4bWFwIHRhYmxlIGluIHRoZSBwYWdlIHRhYmxlcy4KPiArICoKPiArICog
VGhlIGZpeG1hcCBjYW5ub3QgYmUgbWFwcGVkIGluIGNyZWF0ZV9wYWdlX3RhYmxlcyBiZWNhdXNl
IGl0IG1heQo+ICsgKiBjbGFzaCB3aXRoIHRoZSAxOjEgbWFwcGluZy4KPiArICoKPiArICogSW5w
dXRzOgo+ICsgKiAgIHIxMDogUGh5c2ljYWwgb2Zmc2V0Cj4gKyAqICAgcjExOiBFYXJseSBVQVJU
IGJhc2UgcGh5c2ljYWwgYWRkcmVzcwo+ICsgKgo+ICsgKiBDbG9iYmVycyByMSAtIHI0Cj4gKyAq
Lwo+ICBzZXR1cF9maXhtYXA6Cj4gLSNpZiBkZWZpbmVkKENPTkZJR19FQVJMWV9QUklOVEspIC8q
IEZpeG1hcCBpcyBvbmx5IHVzZWQgYnkgZWFybHkgcHJpbnRrICovCj4gKyNpZiBkZWZpbmVkKENP
TkZJR19FQVJMWV9QUklOVEspCj4gICAgICAgICAgLyogQWRkIFVBUlQgdG8gdGhlIGZpeG1hcCB0
YWJsZSAqLwo+ICAgICAgICAgIGxkciAgIHIxLCA9eGVuX2ZpeG1hcCAgICAgICAgLyogcjEgOj0g
dmFkZHIgKHhlbl9maXhtYXApICovCj4gICAgICAgICAgbHNyICAgcjIsIHIxMSwgI1RISVJEX1NI
SUZUCj4gQEAgLTU0Niw3ICs1NTksNyBAQCBzZXR1cF9maXhtYXA6Cj4gICAgICAgICAgb3JyICAg
cjIsIHIyLCAjUFRfTE9XRVIoREVWX0wzKSAvKiByMjpyMyA6PSA0SyBkZXYgbWFwIGluY2x1ZGlu
ZyBVQVJUICovCj4gICAgICAgICAgbW92ICAgcjMsICMweDAKPiAgICAgICAgICBzdHJkICByMiwg
cjMsIFtyMSwgIyhGSVhNQVBfQ09OU09MRSo4KV0gLyogTWFwIGl0IGluIHRoZSBmaXJzdCBmaXht
YXAncyBzbG90ICovCj4gLTE6Cj4gKyNlbmRpZgoKUGF0Y2ggaXMgT0suIEhvd2V2ZXIsIHRoZSAx
OiBzaG91bGQgYmUgcmVtb3ZlZCBpbiB0aGUgcHJldmlvdXMgcGF0Y2gKInhlbi9hcm0zMjogaGVh
ZDogRG9uJ3Qgc2V0dXAgdGhlIGZpeG1hcCBvbiBzZWNvbmRhcnkgQ1BVcyIsIHdoZXJlIHdlCnRv
b2sgYXdheSB0aGUgYmVxLgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KCgo+ICAgICAgICAgIC8qIE1hcCBmaXhtYXAgaW50byBib290X3Nl
Y29uZCAqLwo+ICAgICAgICAgIGxkciAgIHIxLCA9Ym9vdF9zZWNvbmQgICAgICAgLyogcjEgOj0g
dmFkZHIgKGJvb3Rfc2Vjb25kKSAqLwo+IEBAIC01NjEsNyArNTc0LDcgQEAgc2V0dXBfZml4bWFw
Ogo+ICAKPiAgICAgICAgICAvKiBFbnN1cmUgYW55IHBhZ2UgdGFibGUgdXBkYXRlcyBtYWRlIGFi
b3ZlIGhhdmUgb2NjdXJyZWQuICovCj4gICAgICAgICAgZHNiICAgbnNoc3QKPiAtI2VuZGlmCj4g
Kwo+ICAgICAgICAgIG1vdiAgIHBjLCBscgo+ICBFTkRQUk9DKHNldHVwX2ZpeG1hcCkKPiAgCj4g
LS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

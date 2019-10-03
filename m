Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FEDC961E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 03:25:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFpov-0002ae-Ld; Thu, 03 Oct 2019 01:22:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KLgg=X4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFpou-0002aZ-DH
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 01:22:16 +0000
X-Inumbo-ID: 3bd41a9c-e57c-11e9-971d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 3bd41a9c-e57c-11e9-971d-12813bfff9fa;
 Thu, 03 Oct 2019 01:22:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF0CF21A4C;
 Thu,  3 Oct 2019 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570065735;
 bh=vou7pQ+lM8fVkMGFa3N2rk8MjdzNFBfJ5pq5MhuYSL8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=eJIixNR4zRvvNmdVtIP/V2or6vPZk0vxhyTetLxO97vgOADgJ+H2wIEt4rNOxhpz8
 pmFbrLNGo25aX0A792fjNimFFJm1hukmyItKa+7CFBwM+Q9CHsDQTgT8eDuZKJpcpB
 mhOPfbpy1ULdZn/08/OPRvHc35Czl30fMaWkNITI=
Date: Wed, 2 Oct 2019 18:22:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190921100836.21396-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910021820560.2691@sstabellini-ThinkPad-T480s>
References: <20190921100836.21396-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RESEND][PATCH for-4.13] xen/arm: mm: Clear boot
 pagetables before bringing-up each secondary CPU
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

T24gU2F0LCAyMSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IGJvb3QgcGFnZXRhYmxlcyBhcmUgb25seSBjbGVhcmVkIG9uY2UgYXQgYm9vdC4gVGhpcyBtZWFu
cwo+IHdoZW4gYm9vdGluZyBDUFUyIChhbmQgb253YXJkcykgdGhlbiBib290IHBhZ2V0YWJsZXMg
d2lsbCBub3QgYmUKPiBjbGVhcmVkLgo+IAo+IFRvIGtlZXAgdGhlIGludGVyZmFjZSBleGFjdGx5
IHRoZSBzYW1lIGZvciBhbGwgc2Vjb25kYXJ5IENQVSwgdGhlIGJvb3QKPiBwYWdldGFibGVzIGFy
ZSBub3cgY2xlYXJlZCBiZWZvcmUgYnJpbmdpbmctdXAgZWFjaCBzZWNvbmRhcnkgQ1BVLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZp
ZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4g
LS0tCj4gIHhlbi9hcmNoL2FybS9tbS5jIHwgMjcgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gaW5k
ZXggMTEyOWRjMjhjOC4uZTE0ZWU3NmZmOCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0u
Ywo+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gQEAgLTcwNCw4ICs3MDQsMjAgQEAgdm9pZCBf
X2luaXQgc2V0dXBfcGFnZXRhYmxlcyh1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQpCj4g
IAo+ICAgICAgc3dpdGNoX3R0YnIodHRicik7Cj4gIAo+IC0gICAgLyogQ2xlYXIgdGhlIGNvcHkg
b2YgdGhlIGJvb3QgcGFnZXRhYmxlcy4gRWFjaCBzZWNvbmRhcnkgQ1BVCj4gLSAgICAgKiByZWJ1
aWxkcyB0aGVzZSBpdHNlbGYgKHNlZSBoZWFkLlMpICovCj4gKyAgICB4ZW5fcHRfZW5mb3JjZV93
bngoKTsKPiArCj4gKyNpZmRlZiBDT05GSUdfQVJNXzMyCj4gKyAgICBwZXJfY3B1KHhlbl9wZ3Rh
YmxlLCAwKSA9IGNwdTBfcGd0YWJsZTsKPiArICAgIHBlcl9jcHUoeGVuX2RvbW1hcCwgMCkgPSBj
cHUwX2RvbW1hcDsKPiArI2VuZGlmCj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGNsZWFyX2Jvb3Rf
cGFnZXRhYmxlcyh2b2lkKQo+ICt7Cj4gKyAgICAvKgo+ICsgICAgICogQ2xlYXIgdGhlIGNvcHkg
b2YgdGhlIGJvb3QgcGFnZXRhYmxlcy4gRWFjaCBzZWNvbmRhcnkgQ1BVCj4gKyAgICAgKiByZWJ1
aWxkcyB0aGVzZSBpdHNlbGYgKHNlZSBoZWFkLlMpCj4gKyAgICAgKi8KPiAgICAgIGNsZWFyX3Rh
YmxlKGJvb3RfcGd0YWJsZSk7Cj4gICNpZmRlZiBDT05GSUdfQVJNXzY0Cj4gICAgICBjbGVhcl90
YWJsZShib290X2ZpcnN0KTsKPiBAQCAtNzEzLDE4ICs3MjUsMTMgQEAgdm9pZCBfX2luaXQgc2V0
dXBfcGFnZXRhYmxlcyh1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQpCj4gICNlbmRpZgo+
ICAgICAgY2xlYXJfdGFibGUoYm9vdF9zZWNvbmQpOwo+ICAgICAgY2xlYXJfdGFibGUoYm9vdF90
aGlyZCk7Cj4gLQo+IC0gICAgeGVuX3B0X2VuZm9yY2Vfd254KCk7Cj4gLQo+IC0jaWZkZWYgQ09O
RklHX0FSTV8zMgo+IC0gICAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCkgPSBjcHUwX3BndGFibGU7
Cj4gLSAgICBwZXJfY3B1KHhlbl9kb21tYXAsIDApID0gY3B1MF9kb21tYXA7Cj4gLSNlbmRpZgo+
ICB9Cj4gIAo+ICAjaWZkZWYgQ09ORklHX0FSTV82NAo+ICBpbnQgaW5pdF9zZWNvbmRhcnlfcGFn
ZXRhYmxlcyhpbnQgY3B1KQo+ICB7Cj4gKyAgICBjbGVhcl9ib290X3BhZ2V0YWJsZXMoKTsKPiAr
Cj4gICAgICAvKiBTZXQgaW5pdF90dGJyIGZvciB0aGlzIENQVSBjb21pbmcgdXAuIEFsbCBDUHVz
IHNoYXJlIGEgc2luZ2xlIHNldG9mCj4gICAgICAgKiBwYWdldGFibGVzLCBidXQgcmV3cml0ZSBp
dCBlYWNoIHRpbWUgZm9yIGNvbnNpc3RlbmN5IHdpdGggMzIgYml0LiAqLwo+ICAgICAgaW5pdF90
dGJyID0gKHVpbnRwdHJfdCkgeGVuX3BndGFibGUgKyBwaHlzX29mZnNldDsKPiBAQCAtNzY3LDYg
Kzc3NCw4IEBAIGludCBpbml0X3NlY29uZGFyeV9wYWdldGFibGVzKGludCBjcHUpCj4gICAgICBw
ZXJfY3B1KHhlbl9wZ3RhYmxlLCBjcHUpID0gZmlyc3Q7Cj4gICAgICBwZXJfY3B1KHhlbl9kb21t
YXAsIGNwdSkgPSBkb21oZWFwOwo+ICAKPiArICAgIGNsZWFyX2Jvb3RfcGFnZXRhYmxlcygpOwo+
ICsKPiAgICAgIC8qIFNldCBpbml0X3R0YnIgZm9yIHRoaXMgQ1BVIGNvbWluZyB1cCAqLwo+ICAg
ICAgaW5pdF90dGJyID0gX19wYShmaXJzdCk7Cj4gICAgICBjbGVhbl9kY2FjaGUoaW5pdF90dGJy
KTsKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

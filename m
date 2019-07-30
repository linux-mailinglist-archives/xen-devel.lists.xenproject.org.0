Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C497B065
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:43:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsW7N-00010Y-HT; Tue, 30 Jul 2019 17:40:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsW7L-00010Q-Ti
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:40:55 +0000
X-Inumbo-ID: 2e8be062-b2f1-11e9-857a-a3373ea1d556
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e8be062-b2f1-11e9-857a-a3373ea1d556;
 Tue, 30 Jul 2019 17:40:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A82E2087F;
 Tue, 30 Jul 2019 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564508454;
 bh=e876GeaTGhz3alDKWX3aLCnuXT7wjXKUR+RiKVncQtY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=qU6Yzc6b8wuE6rHvNxHLEWxKun+WvuQNBqxhhqV2jH29SJ+ewqKkJmkulgtS2TE4B
 baarFG9pk3tp711Hpi1/yHqYJSlG6EClkpEWo/T7n/bc1RiEor/PjqKC7eznEwJGy7
 tycl5pDpvyOywoxRpDWRm1oK1iD//XtT4+VCN+bM=
Date: Tue, 30 Jul 2019 10:40:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-16-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301037400.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-16-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 15/35] xen/arm64: head: Rework and
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
X2ZpeG1hcCgpLgogICAgICAgICBeIGJlZm9yZQoKQXNzdW1pbmcgeW91IGZpeCB0aGUgdHlwbzoK
CkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoK
PiBMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVz
YWdlIHdpdGhpbiB0aGUKPiBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+
ICAgICAgICAgLSBVcGRhdGUgdGhlIGNvbW1lbnQgdG8gcmVmbGVjdCB0aGF0IHdlIGNsb2JiZXJz
IHgxIC0geDQgYW5kIG5vdAo+ICAgICAgICAgeDAgLSB4MS4KPiAgICAgICAgIC0gQWRkIHRoZSBs
aXN0IG9mIGlucHV0IHJlZ2lzdGVycwo+ICAgICAgICAgLSBzL0lEIG1hcC8xOjEgbWFwcGluZy8K
PiAgICAgICAgIC0gUmV3b3JkIHRoZSBjb21taXQgbWVzc2FnZQo+IC0tLQo+ICB4ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TIHwgMTggKysrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IGluZGV4
IGE2MDdiM2JkYjEuLmYxNjVkZDYxY2EgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBAQCAtNjkzLDggKzY5
MywyMSBAQCBpZGVudGl0eV9tYXBwaW5nX3JlbW92ZWQ6Cj4gICAgICAgICAgcmV0Cj4gIEVORFBS
T0MocmVtb3ZlX2lkZW50aXR5X21hcHBpbmcpCj4gIAo+ICsvKgo+ICsgKiBNYXAgdGhlIFVBUlQg
aW4gdGhlIGZpeG1hcCAod2hlbiBlYXJseXByaW50ayBpcyB1c2VkKSBhbmQgaG9vayB0aGUKPiAr
ICogZml4bWFwIHRhYmxlIGluIHRoZSBwYWdlIHRhYmxlcy4KPiArICoKPiArICogVGhlIGZpeG1h
cCBjYW5ub3QgYmUgbWFwcGVkIGluIGNyZWF0ZV9wYWdlX3RhYmxlcyBiZWNhdXNlIGl0IG1heQo+
ICsgKiBjbGFzaCB3aXRoIHRoZSAxOjEgbWFwcGluZy4KPiArICoKPiArICogSW5wdXRzOgo+ICsg
KiAgIHgyMDogUGh5c2ljYWwgb2Zmc2V0Cj4gKyAqICAgeDIzOiBFYXJseSBVQVJUIGJhc2UgcGh5
c2ljYWwgYWRkcmVzcwo+ICsgKgo+ICsgKiBDbG9iYmVycyB4MSAtIHg0Cj4gKyAqLwo+ICBzZXR1
cF9maXhtYXA6Cj4gLSNpZiBkZWZpbmVkKENPTkZJR19FQVJMWV9QUklOVEspIC8qIEZpeG1hcCBp
cyBvbmx5IHVzZWQgYnkgZWFybHkgcHJpbnRrICovCj4gKyNpZmRlZiBDT05GSUdfRUFSTFlfUFJJ
TlRLCj4gICAgICAgICAgLyogQWRkIFVBUlQgdG8gdGhlIGZpeG1hcCB0YWJsZSAqLwo+ICAgICAg
ICAgIGxkciAgIHgxLCA9eGVuX2ZpeG1hcCAgICAgICAgLyogeDEgOj0gdmFkZHIgKHhlbl9maXht
YXApICovCj4gICAgICAgICAgbHNyICAgeDIsIHgyMywgI1RISVJEX1NISUZUCj4gQEAgLTcwMiw2
ICs3MTUsNyBAQCBzZXR1cF9maXhtYXA6Cj4gICAgICAgICAgbW92ICAgeDMsICNQVF9ERVZfTDMK
PiAgICAgICAgICBvcnIgICB4MiwgeDIsIHgzICAgICAgICAgICAgIC8qIHgyIDo9IDRLIGRldiBt
YXAgaW5jbHVkaW5nIFVBUlQgKi8KPiAgICAgICAgICBzdHIgICB4MiwgW3gxLCAjKEZJWE1BUF9D
T05TT0xFKjgpXSAvKiBNYXAgaXQgaW4gdGhlIGZpcnN0IGZpeG1hcCdzIHNsb3QgKi8KPiArI2Vu
ZGlmCj4gIAo+ICAgICAgICAgIC8qIE1hcCBmaXhtYXAgaW50byBib290X3NlY29uZCAqLwo+ICAg
ICAgICAgIGxkciAgIHg0LCA9Ym9vdF9zZWNvbmQgICAgICAgLyogeDQgOj0gdmFkZHIgKGJvb3Rf
c2Vjb25kKSAqLwo+IEBAIC03MTQsNyArNzI4LDcgQEAgc2V0dXBfZml4bWFwOgo+ICAKPiAgICAg
ICAgICAvKiBFbnN1cmUgYW55IHBhZ2UgdGFibGUgdXBkYXRlcyBtYWRlIGFib3ZlIGhhdmUgb2Nj
dXJyZWQuICovCj4gICAgICAgICAgZHNiICAgbnNoc3QKPiAtI2VuZGlmCj4gKwo+ICAgICAgICAg
IHJldAo+ICBFTkRQUk9DKHNldHVwX2ZpeG1hcCkKPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

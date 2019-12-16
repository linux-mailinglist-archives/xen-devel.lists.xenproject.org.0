Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ACB11FF0B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 08:42:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igkxV-0001IP-Nw; Mon, 16 Dec 2019 07:38:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1igkxU-0001IK-Hy
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 07:38:24 +0000
X-Inumbo-ID: 08e556a6-1fd7-11ea-9362-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08e556a6-1fd7-11ea-9362-12813bfff9fa;
 Mon, 16 Dec 2019 07:38:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 056F9B033;
 Mon, 16 Dec 2019 07:38:20 +0000 (UTC)
To: Aditya Pakki <pakki001@umn.edu>
References: <20191215201321.7439-1-pakki001@umn.edu>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0b2714b7-36d4-f281-5287-d6889791098f@suse.com>
Date: Mon, 16 Dec 2019 08:38:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191215201321.7439-1-pakki001@umn.edu>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/grant-table: remove unnecessary BUG_ON
 on gnttab_interface
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTIuMTkgMjE6MTMsIEFkaXR5YSBQYWtraSB3cm90ZToKPiBncm93X2dudHRhYl9saXN0
KCkgY2hlY2tzIGZvciBOVUxMIG9uIGdudHRhYl9pbnRlcmZhY2UgaW1tZWRpYXRlbHkKPiBhZnRl
ciBnbnR0YWJfZXhwYW5kKCkgY2hlY2suIFRoZSBwYXRjaCByZW1vdmVzIHRoZSByZWR1bmRhbnQg
YXNzZXJ0aW9uCj4gYW5kIHJlcGxhY2VzIHRoZSBCVUdfT04gY2FsbCB3aXRoIHJlY292ZXJ5IGNv
ZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRpdHlhIFBha2tpIDxwYWtraTAwMUB1bW4uZWR1Pgo+
IC0tLQo+ICAgZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyB8IDkgKysrKysrLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jIGIvZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUu
Ywo+IGluZGV4IDQ5YjM4MWUxMDRlZi4uZjU5Njk0YzM1MmJlIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMveGVuL2dyYW50LXRhYmxlLmMKPiArKysgYi9kcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jCj4g
QEAgLTY2NCw3ICs2NjQsNiBAQCBzdGF0aWMgaW50IGdyb3dfZ250dGFiX2xpc3QodW5zaWduZWQg
aW50IG1vcmVfZnJhbWVzKQo+ICAgCXVuc2lnbmVkIGludCBucl9nbGlzdF9mcmFtZXMsIG5ld19u
cl9nbGlzdF9mcmFtZXM7Cj4gICAJdW5zaWduZWQgaW50IGdyZWZzX3Blcl9mcmFtZTsKPiAgIAo+
IC0JQlVHX09OKGdudHRhYl9pbnRlcmZhY2UgPT0gTlVMTCk7Cj4gICAJZ3JlZnNfcGVyX2ZyYW1l
ID0gZ250dGFiX2ludGVyZmFjZS0+Z3JlZnNfcGVyX2dyYW50X2ZyYW1lOwo+ICAgCj4gICAJbmV3
X25yX2dyYW50X2ZyYW1lcyA9IG5yX2dyYW50X2ZyYW1lcyArIG1vcmVfZnJhbWVzOwo+IEBAIC0x
Mzg4LDcgKzEzODcsOSBAQCBzdGF0aWMgaW50IGdudHRhYl9leHBhbmQodW5zaWduZWQgaW50IHJl
cV9lbnRyaWVzKQo+ICAgCWludCByYzsKPiAgIAl1bnNpZ25lZCBpbnQgY3VyLCBleHRyYTsKPiAg
IAo+IC0JQlVHX09OKGdudHRhYl9pbnRlcmZhY2UgPT0gTlVMTCk7Cj4gKwlpZiAoIWdudHRhYl9p
bnRlcmZhY2UpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICAgCWN1ciA9IG5yX2dyYW50X2Zy
YW1lczsKPiAgIAlleHRyYSA9ICgocmVxX2VudHJpZXMgKyBnbnR0YWJfaW50ZXJmYWNlLT5ncmVm
c19wZXJfZ3JhbnRfZnJhbWUgLSAxKSAvCj4gICAJCSBnbnR0YWJfaW50ZXJmYWNlLT5ncmVmc19w
ZXJfZ3JhbnRfZnJhbWUpOwo+IEBAIC0xNDIzLDcgKzE0MjQsOSBAQCBpbnQgZ250dGFiX2luaXQo
dm9pZCkKPiAgIAkvKiBEZXRlcm1pbmUgdGhlIG1heGltdW0gbnVtYmVyIG9mIGZyYW1lcyByZXF1
aXJlZCBmb3IgdGhlCj4gICAJICogZ3JhbnQgcmVmZXJlbmNlIGZyZWUgbGlzdCBvbiB0aGUgY3Vy
cmVudCBoeXBlcnZpc29yLgo+ICAgCSAqLwo+IC0JQlVHX09OKGdudHRhYl9pbnRlcmZhY2UgPT0g
TlVMTCk7Cj4gKwlpZiAoIWdudHRhYl9pbnRlcmZhY2UpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4g
KwoKSSdkIGp1c3QgcmVtb3ZlIHRoZSBCVUdfT04oKS4KCmdudHRhYl9yZXF1ZXN0X3ZlcnNpb24o
KSBjYWxsZWQgc29tZSBsaW5lcyB1cCBhbHdheXMgc2V0cwpnbnR0YWJfaW50ZXJmYWNlLgoKVGhl
IEJVR19PTigpIGluIG5yX3N0YXR1c19mcmFtZXMoKSBjYW4gYmUgcmVtb3ZlZCwgdG9vLiBJdCBp
cyBlaXRoZXIKY2FsbGVkIGJ5IHYyIHNwZWNpZmljIGZ1bmN0aW9ucyAoZm9yIHRob3NlIHRvIGJl
IHJlYWNoZWQKZ250dGFiX2ludGVyZmFjZSBtdXN0IGJlIHNldCkgb3IgYnkgZ250dGFiX2luaXQo
KSAocmVhc29uaW5nIHNlZQphYm92ZSkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

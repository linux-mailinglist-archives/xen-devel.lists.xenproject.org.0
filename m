Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7907C0540
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:36:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpRk-0007EV-3f; Fri, 27 Sep 2019 12:34:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDpRj-0007EO-Dh
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:34:03 +0000
X-Inumbo-ID: 15ff1ca2-e123-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 15ff1ca2-e123-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 12:34:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D47AA1000;
 Fri, 27 Sep 2019 05:34:01 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 456A03F67D;
 Fri, 27 Sep 2019 05:34:01 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-10-julien.grall@arm.com> <87tv8y7xcy.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <39072273-7237-c10d-ca1f-8f9f706895b6@arm.com>
Date: Fri, 27 Sep 2019 13:34:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87tv8y7xcy.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 09/10] xen/arm: asm: Replace
 use of ALTERNATIVE with alternative_if
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNy8wOS8yMDE5IDEzOjExLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiAK
PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBVc2luZyBhbHRlcm5hdGl2ZV9pZiBtYWtlcyB0
aGUgY29kZSBhIGJpdCBtb3JlIHN0cmVhbWxpbmVkLgo+Pgo+PiBUYWtlIHRoZSBvcHBvcnR1bml0
eSB0byB1c2UgdGhlIG5ldyBhdXRvLW5vcCBpbmZyYXN0cnVjdHVyZSB0byBhdm9pZAo+PiBjb3Vu
dGluZyB0aGUgbnVtYmVyIG9mIG5vcCBpbiB0aGUgZWxzZSBwYXJ0IGZvciBhcmNoL2FybS9hcm02
NC9lbnRyeS5TCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4+Cj4+IC0tLQo+PiAgICAgIFRoaXMgaXMgcHJldHR5IG11Y2ggYSBtYXR0ZXIg
b2YgdGFzdGUsIGJ1dCBhdCBsZWFzdCBmb3IgYXJtNjQgdGhpcwo+PiAgICAgIGFsbG93cyB1cyB0
byB1c2UgdGhlIGF1dG8tbm9wIGluZnJhc3RydWN0dXJlLiBTbyB0aGUgYXJtMzIgaXMgbW9yZQo+
PiAgICAgIHRvIGtlZXAgaW5saW5lIHdpdGggYXJtNjQuCj4+IC0tLQo+PiAgIHhlbi9hcmNoL2Fy
bS9hcm0zMi9lbnRyeS5TIHwgOSArKysrKystLS0KPj4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvZW50
cnkuUyB8IDggKysrKystLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvZW50
cnkuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TCj4+IGluZGV4IDBiNGNkMTlhYmQuLjE0
MjhjZDM1ODMgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TCj4+IEBAIC02NSw5ICs2NSwxMiBAQCBzYXZl
X2d1ZXN0X3JlZ3M6Cj4+ICAgICAgICAgICAgKiBJZiB0aGUgU0tJUF9TWU5DSFJPTklaRV9TRVJS
T1JfRU5UUllfRVhJVCBoYXMgYmVlbiBzZXQgaW4gdGhlIGNwdQo+PiAgICAgICAgICAgICogZmVh
dHVyZSwgdGhlIGNoZWNraW5nIG9mIHBlbmRpbmcgU0Vycm9ycyB3aWxsIGJlIHNraXBwZWQuCj4+
ICAgICAgICAgICAgKi8KPj4gLSAgICAgICAgQUxURVJOQVRJVkUoIm5vcCIsCj4+IC0gICAgICAg
ICAgICAgICAgICAgICJiIHNraXBfY2hlY2siLAo+PiAtICAgICAgICAgICAgICAgICAgICBTS0lQ
X1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUKQo+PiArICAgICAgICBhbHRlcm5hdGl2ZV9p
ZiBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUCj4+ICsgICAgICAgIG5vcAo+PiAr
ICAgICAgICBhbHRlcm5hdGl2ZV9lbHNlCj4+ICsgICAgICAgIGIgICBza2lwX2NoZWNrCj4+ICsg
ICAgICAgIGFsdGVybmF0aXZlX2VuZGlmCj4+ICsKPiBmb3IgdGhlIGFybTMyIGNvZGUgeW91IGNh
biBoYXZlIG15IHItYjoKPiBSZXZpZXdlZC1CeTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15
cl9iYWJjaHVrQGVwYW0uY29tPgo+IAo+PiAgICAgICAgICAgLyoKPj4gICAgICAgICAgICAqIFN0
YXJ0IHRvIGNoZWNrIHBlbmRpbmcgdmlydHVhbCBhYm9ydCBpbiB0aGUgZ2FwIG9mIEd1ZXN0IC0+
IEhZUAo+PiAgICAgICAgICAgICogd29ybGQgc3dpdGNoLgo+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2FybTY0L2VudHJ5LlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+PiBpbmRl
eCA0NThkMTJmMTg4Li45MWNmNmVlNmY0IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJt
NjQvZW50cnkuUwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+PiBAQCAtMTcw
LDkgKzE3MCwxMSBAQAo+PiAgICAgICAgICAgICogaXMgbm90IHNldC4gSWYgYSB2U0Vycm9yIHRv
b2sgcGxhY2UsIHRoZSBpbml0aWFsIGV4Y2VwdGlvbiB3aWxsIGJlCj4+ICAgICAgICAgICAgKiBz
a2lwcGVkLiBFeGl0IEFTQVAKPj4gICAgICAgICAgICAqLwo+PiAtICAgICAgICBBTFRFUk5BVElW
RSgiYmwgY2hlY2tfcGVuZGluZ192c2Vycm9yOyBjYm56IHgwLCAxZiIsCj4+IC0gICAgICAgICAg
ICAgICAgICAgICJub3A7IG5vcCIsCj4+IC0gICAgICAgICAgICAgICAgICAgIFNLSVBfU1lOQ0hS
T05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpCj4+ICsgICAgICAgIGFsdGVybmF0aXZlX2lmIFNLSVBf
U1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQKPj4gKyAgICAgICAgYmwgICAgICBjaGVja19w
ZW5kaW5nX3ZzZXJyb3IKPj4gKyAgICAgICAgY2JueiAgICB4MCwgMWYKPj4gKyAgICAgICAgYWx0
ZXJuYXRpdmVfZWxzZV9ub3BfZW5kaWYKPj4gKwo+IFlvdSBhc2tlZCBvdGhlciBwZW9wbGUgdG8g
ZG8gbm90IGludHJvZHVjZSBuZXcgY29kZSBpbiBvbmUgcGF0Y2ggYW5kCj4gcmV3cml0ZSBpdCBp
biB0aGUgZm9sbG93aW5nIHBhdGNoLiBCdXQgdGhlcmUgeW91IGFyZSBkb2luZyBleGFjdGx5IHRo
ZQo+IHNhbWUuCgpUaGlzIGlzIGEgZmFpcmx5IGJvcmRlcmxpbmUgY29tbWVudCBrbm93aW5nIHRo
YXQgSSB1c3VhbGx5IGRvbid0IHJlcXVlc3QgCmNsZWFuLXVwIGFuZCBjb2RlIGNvbnNvbGlkYXRp
b24gaW4gdGhlIHNhbWUgcGF0Y2guCgo+IEkgYmVsaWV2ZSwgaXQgaXMgcG9zc2libGUgdG8gbW92
ZSBhbGwgImFsdGVybmF0aXZlIiBwYXRjaGVzIHRvIHRoZQo+IHZlcnkgYmVnaW5uaW5nIG9mIHRo
ZSBwYXRjaCBzZXJpZXMgYW5kIG9ubHkgdGhlbiBpbnRyb2R1Y2UgbWFjcm8KPiBndWVzdF92ZWN0
b3IuCgpGb3IgYSBmaXJzdCwgdGhlIGZpcnN0IHBhdGNoIGlzIGRlZmluaXRlbHkgbm90IG5ldyBj
b2RlLiBUaGlzIGlzIGNvZGUgCmNvbnNvbGlkYXRpb24gYW5kIHRoZXJlZm9yZSBJIGRvbid0IHRl
bmQgdG8gbWl4IHRoZSB0d28gZm9yIGNsYXJpdHkuIFNvIHRoaXMgCnNob3VsZCBoYXZlIGJlZW4g
YSBwYXRjaCBiZWZvcmUgdGhlIGZpcnN0IHBhdGNoLgoKU2Vjb25kbHksIHRoZSBmaXJzdCA0IHBh
dGNoZXMgYXJlIGNhbmRpZGF0ZSBmb3IgYmFja3BvcnQuIFRoZSByZXN0IG9mIHRoZSBzZXJpZXMg
CndvdWxkIGJlIGdvb2QgdG8gYmFja3BvcnQgYnV0IEkgYW0gbm90IGF3YXJlIG9mIGEgY3JpdGlj
YWwgaXNzdWUgaW4gcHJldmlvdXMgWGVuIApyZWxlYXNlIHRvIHN0cm9uZ2x5IHB1c2ggZm9yIGl0
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

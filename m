Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092DC062F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 15:18:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDq6e-0004sX-6J; Fri, 27 Sep 2019 13:16:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDq6c-0004sN-Rn
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 13:16:18 +0000
X-Inumbo-ID: fc95b1da-e128-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id fc95b1da-e128-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 13:16:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3198428;
 Fri, 27 Sep 2019 06:16:16 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EC8E3F67D;
 Fri, 27 Sep 2019 06:16:15 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com> <87v9te7y1m.fsf@epam.com>
 <bbb73576-a2ae-16d8-5147-34a584721e7c@arm.com> <87r2419am7.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <df6b891c-2670-47d9-ae0d-223161edc225@arm.com>
Date: Fri, 27 Sep 2019 14:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87r2419am7.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNy8wOS8yMDE5IDEzOjM5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBKdWxp
ZW4gR3JhbGwgd3JpdGVzOgo+PiBPbiAyNy8wOS8yMDE5IDEyOjU2LCBWb2xvZHlteXIgQmFiY2h1
ayB3cm90ZToKPj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Pgo+Pj4+IEF0IHRoZSBtb21lbnQs
IFNTQkQgd29ya2Fyb3VuZCBpcyByZS1lbmFibGVkIGZvciBYZW4gYWZ0ZXIgaW50ZXJydXB0cwo+
Pj4+IGFyZSB1bm1hc2tlZC4gVGhpcyBtZWFucyB3ZSBtYXkgZW5kIHVwIHRvIGV4ZWN1dGUgc29t
ZSBwYXJ0IG9mIHRoZQo+Pj4+IGh5cGVydmlzb3IgaWYgYW4gaW50ZXJydXB0IGlzIHJlY2VpdmVk
IGJlZm9yZSB0aGUgd29ya2Fyb3VuZCBpcwo+Pj4+IHJlLWVuYWJsZWQuCj4+Pj4KPj4+PiBBcyB0
aGUgcmVzdCBvZiBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3QoKSBkb2VzIG5vdCByZXF1aXJl
IHRvIGhhdmUKPj4+PiBpbnRlcnJ1cHRzIG1hc2tlZCwgdGhlIGZ1bmN0aW9uIGlzIG5vdyBzcGxp
dCBpbiB0d28gcGFydHM6Cj4+Pj4gICAgICAgMSkgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0
X25vaXJxKCkgY2FsbGVkIHdpdGggaW50ZXJydXB0cwo+Pj4+ICAgICAgICAgIG1hc2tlZC4KPj4+
IEknbSBva2F5IHdpdGggdGhpcyBhcHByb2FjaCwgYnV0IEkgZG9uJ3QgbGlrZSBuYW1lIGZvcgo+
Pj4gZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X25vaXJxKCkuIFJpZ2h0IG5vdyBpdCBpcyBk
b2luZyBleGFjdGx5IG9uZQo+Pj4gdGhpbmcgLSBtaXRpZ2F0ZXMgU1NCRC4gU28sIG1heWJlIG1v
cmUgYXBwcm9wcmlhdGUgbmFtZSB3aWxsIGJlCj4+PiBzb21ldGhpbmcgbGlrZSAibWl0aWdhdGVf
c3NiZCgpIiA/Cj4+Cj4+IElmIEkgd2FudGVkIHRvIGNhbGwgaXQgbWl0aWdhdGVfc3NiZCgpIEkg
d291bGQgaGF2ZSBpbXBsZW1lbnRlZAo+PiBjb21wbGV0ZWx5IGRpZmZlcmVudGx5LiBUaGUgcmVh
c29uIGl0IGlzIGxpa2UgdGhhdCBpcyBiZWNhdXNlIHdlIG1heQo+PiBuZWVkIG1vcmUgY29kZSB0
byBiZSBhZGRlZCBoZXJlIGluIHRoZSBmdXR1cmUgKEkgaGF2ZSBBbmRyaWkncyBzZXJpZXMKPj4g
aW4gbWluZCkuIFNvIEkgd291bGQgcmF0aGVyIGF2b2lkIGEgZnVydGhlciByZW5hbWluZyBsYXRl
ciBvbiBhbmQgc29tZQo+PiByZXdvcmsuCj4gRmFpciBlbm91Z2gKPiAKPj4KPj4gUmVnYXJkaW5n
IHRoZSBuYW1lLCB0aGlzIGlzIGEgc3BsaXQgb2YKPj4gZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1
ZXN0KCkuIEhlbmNlLCB3aHkgdGhlIGZpcnN0IHBhdGggaXMgdGhlCj4+IHNhbWUuIFRoZSBub2ly
cSBtZXJlbHkgaGVscCB0aGUgdXNlciB0byBrbm93IHdoYXQgdG8gZXhwZWN0LiBUaGlzIGlzCj4+
IGJldHRlciBvZiB5ZXQgYW4gX18gdmVyc2lvbi4gRmVlbCBmcmVlIHRvIHN1Z2dlc3QgYSBiZXR0
ZXIgc3VmZml4Lgo+IEknbSBiYWQgYXQgbmFtaW5nIHRoaW5ncyA6KQoKTWUgdG9vIDspLgoKPiAK
PiBJIHVuZGVyc3RhbmQgdGhhdCBpcyB0d28gaGFsdmVzIG9mIG9uZSBmdW5jdGlvbi4gQnV0IGZ1
bmNfbmFtZV9ub2lycSgpCj4gcGF0dGVybiBpcyB3aWRlbHkgdXNlZCBmb3Igb3RoZXIgY2FzZTog
d2hlbiB3ZSBoYXZlIGZ1bmNfbmFtZV9ub2lycSgpCj4gZnVuY3Rpb24gYW5kIHNvbWUgZnVuY19u
YW1lKCkgdGhhdCBkaXNhYmxlcyBpbnRlcnJ1cHRzIGxpa2UgdGhpczoKPiAKPiB2b2lkIGZ1bmNf
bmFtZSgpCj4gewo+ICAgICAgICAgIGRpc2FibGVfaXJxcygpOwo+ICAgICAgICAgIGZ1bmNfbmFt
ZV9ub2lycSgpOwo+ICAgICAgICAgIGVuYWJsZV9pcnFzKCk7Cj4gfQo+IAo+IEkgbGlrZSBwcmlu
Y2lwbGUgb2YgbGVhc3Qgc3VycHJpc2UsIHNvIGl0IGlzIGJldHRlciB0byB1c2Ugc29tZSBvdGhl
cgo+IG5hbWluZyBwYXR0ZXJuIHRoZXJlLgoKSSBjYW4ndCBmaW5kIGFueSBmdW5jdGlvbiBzdWZm
aXhlZCB3aXRoIF9ub2lycSBpbiBYZW4uIFNvIEkgZG9uJ3QgdGhpbmsgdGhpcyAKd291bGQgYmUg
YSBtYWpvciBpc3N1ZSBoZXJlLgoKPiAKPiBtYXliZSBzb21ldGhpbmcgbGlrZSBlbnRlcl9oeXBl
cnZpc29yX2Zyb21fZ3Vlc3RfcHQxKCkgYW5kCj4gZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0
X3B0MigpPwpIbW1tLCBpdCByZW1pbmRzIG1lIHVuaSB3aGVuIHdlIGhhZCB0byBsaW1pdCBmdW5j
dGlvbiBzaXplIHRvIDIwIGxpbmVzIDopLgoKSSBjaG9zZSBfbm9pcnEgYmVjYXVzZSB0aGUgb3Ro
ZXIgbmFtZSBJIGhhZCBpbiBtaW5kIHdhcyBxdWl0ZSB2ZXJib3NlLiBJIHdhcyAKdGhpbmtpbmc6
IGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9iZWZvcmVfaW50ZXJydXB0cygpLgoKPiAKPiBP
ciBtYXliZSwgd2Ugc2hvdWxkIG5vdCBzcGxpdCB0aGUgZnVuY3Rpb24gYXQgYWxsPyBJbnN0ZWFk
LCB3ZSBlbmFibGUKPiBpbnRlcnJ1cHRzIHJpZ2h0IGluIHRoZSBtaWRkbGUgb2YgaXQuCgpJIHRo
b3VnaHQgYWJvdXQgdGhpcyBidXQgSSBkaWRuJ3QgbXVjaCBsaWtlIHRoZSByZXN1bHRpbmcgY29k
ZS4KClRoZSBpbnN0cnVjdGlvbiB0byB1bm1hc2sgaW50ZXJydXB0cyByZXF1aXJlcyB0byB0YWtl
IGFuIGltbWVkaWF0ZSAoaW5kaWNhdGVzIAp3aGljaCBpbnRlcnJ1cHRzIHRvIHVubWFzaykuIEFz
IG5vdCBhbGwgdGhlIHRyYXBzIHJlcXVpcmUgdG8gdW5tYXNrIHRoZSBzYW1lIAppbnRlcnJ1cHRz
LCB3ZSB3b3VsZCBlbmQgdXAgdG8gaGF2ZSB0byBhIGJ1bmNoIG9mIGlmIGluIHRoZSBjb2RlIHRv
IHNlbGVjdCB0aGUgCnJpZ2h0IHVubWFza2luZy4KClNvIHRoZSBzcGxpdCBzb2x1dGlvbiB3YXMg
dGhlIGJlc3QgSSBoYWQgaW4gbWluZC4gSSBhbSBvcGVuIHRvIGJldHRlciBzdWdnZXN0aW9uIApo
ZXJlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

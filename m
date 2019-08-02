Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF767EFDE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 11:06:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htTTM-0005iz-MU; Fri, 02 Aug 2019 09:03:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s405=V6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htTTL-0005iu-SW
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:03:35 +0000
X-Inumbo-ID: 67ff5dfb-b504-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 67ff5dfb-b504-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 09:03:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E10EB344;
 Fri,  2 Aug 2019 02:03:33 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 380D83F575;
 Fri,  2 Aug 2019 02:03:33 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <096ebef8-0bc5-8b49-9b59-10fdb7e6c1de@arm.com>
 <0f4bd23e-587d-d166-01a1-7c4d44ad4b50@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <10fd9482-8440-ac7c-c40e-4b735ecfe97c@arm.com>
Date: Fri, 2 Aug 2019 10:03:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0f4bd23e-587d-d166-01a1-7c4d44ad4b50@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMi8wOC8yMDE5IDA5OjI4LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDAx
LjA4LjE5IDEyOjM3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAwMS8wOC8y
MDE5IDA3OjQ1LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+Pj4gT24gMzAuMDcuMTkgMjM6MTAsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+Cj4+Pj4+IEluIHRoaXMgc2VyaWVzIEkgdGhpbmsgSSBuZWVk
IGludGVycnVwdHMgbG9ja2VkIHVudGlsIEkgc3RhcnQgdGltZSAKPj4+Pj4gYWNjb3VudGluZyBm
b3IgaHlwZXJ2aXNvci4gVGltZSBhY2NvdW50aW5nIGlzIHN0YXJ0ZWQgYnkgYHRhY2NfaGVhZCgp
YCAKPj4+Pj4gZnVuY3Rpb24uIEkgcHJlZmVyIHRvIGhhdmUgaXQgY2FsbGVkIGZyb20gQywgYmVj
YXVzZSBpdCBpcyBtb3JlIGNvbnZlbmllbnQgCj4+Pj4+IGFuZCBvYnZpb3VzIGZvciB0aG9zZSB3
aG8gYXJlIGxlc3MgZmFtaWxpYXIgd2l0aCB0aGUgQVJNIGNvZGUuCj4+Pgo+Pj4gSGVyZSBpcyB0
aGUgcXVlc3Rpb24gdG8geW91OiB3aGF0IGlzIHRoZSBiZXN0IHBsYWNlIChhbmQgd2F5KSB0byBz
dGFydCAKPj4+IGh5cGVydmlzb3IgdGltZSB0cmFja2luZz8KPj4KPj4gTG9va2luZyBhdCB0aGUg
cGF0Y2gsIGh5cGVydmlzb3IgdGltZSBhY2NvdW50aW5nIGlzIGZvcjoKPj4gwqDCoMKgwqAgMSkg
c29mdGlycXMKPj4gwqDCoMKgwqAgMikgaGFyZGlycXMKPj4KPj4gRm9yIGhhcmRpcnFzLCB5b3Ug
YWx3YXlzIGVudGVyIGluIEMgd2l0aCBpbnRlcnJ1cHQgZGlzYWJsZWQuIFNvIHRoaXMgY2FuIGJl
IAo+PiBjYWxsZWQgZGlyZWN0bHkgZnJvbSB0aGVyZS4KPj4KPj4gRm9yIHNvZnRpcnFzLCB0aGV5
IGFyZSBxdWl0ZSBhIGZldyBwbGFjZXMgd2hlcmUgZG9fc29maXJxKCkgaXMgY2FsbGVkLiBTbyB5
b3UgCj4+IGVpdGhlciB3YW50IHRvIHRyYWNrIHRoZSB0aW1lIGluIHRoZSBmdW5jdGlvbiBkaXJl
Y3RseSBvciBvbiBlYWNoIGNhbGxlcnMuCj4gCj4gCj4gU29mdGlycT8gV2hhdCBhYm91dCB0aGUg
cmVzdCBvZiBgbGVhdmVfaHlwZXJ2aXNvcl90YWlsKClgPwoKQSBmYWlyIGFtb3VudCBvZiBsZWF2
ZV9oeXBlcnZpc29yX3RhaWwoKSBkZWFsIHdpdGggdGhlIGd1ZXN0IGl0c2VsZiAoaS5lIHZHSUMs
IApQMk0uLi4pLCBzbyBJIHRoaW5rIHRoZXkgc2hvdWxkIGJlIGFjY291bnRlZCB0byB0aGUgZ3Vl
c3QgdGltZS4gVGhlIG9ubHkgYml0cyBpbiAKbGVhdmVfaHlwZXJ2aXNvcl90YWlsKCkgdGhhdCBz
aG91bGQgYmUgYWNjb3VudGVkIHRvIGh5cGVydmlzb3IgdGltZSBpcyAKY2hlY2tfZm9yX3BjcHVf
d29yaygpLgoKPiAKPiAKPj4gImJpZyBwaWVjZSIgaXMgc29tZXdoYXQgaGFsZi1jb3JyZWN0Li4u
LiBBbGwgdGhlIGh5cGVyY2FsbHMgd2lsbCBiZSBjb3JyZWN0bHkgCj4+IHByb3RlY3RlZCwgc28g
dGhlIHByb2JsZW0gaXMgb25seSBpZiB5b3UgcmVjZWl2ZSBhbiBpbnRlcnJ1cHQgYmVmb3JlIFNT
QkQgaXMgCj4+IGVuYWJsZWQuCj4+Cj4+IEkgd291bGQgbW92ZSB0aGUgZW5hYmxlbWVudCBpbiBh
c3NlbWJseSBjb2RlIGFzIHBhcnQgb2YgZW50cnkuCj4gCj4gVGhhdCdzIGl0Lgo+IEkgc3VwcG9z
ZSB0aGUgZnVuY3Rpb24gYGVudGVyX2h5cGVydmlzb3JfaGVhZCgpYCB3YXMgaW50cm9kdWNlZCBh
bmQgCj4gbmFtZWQgYXMgYSBwYXJ0IG9mIGVudHJ5LCB3aGlsZSBpbiBmYWN0IGlzIG5vdCB0aGUg
cGFydC4KPiBBbmQgSSBndWVzcyB5b3Ugd2VyZSBjb25mdXNlZCB3aXRoIGl0IHdoZW4gaW50cm9k
dWNpbmcgdGhhdCBXQS4KPiBBcyB3ZWxsIGFzIEkgd2FzIHNvbWUgdGltZSBhZ28gWzFdLgoKVGhl
IG1hY3JvIGVudHJ5LlMgd2lsbCBkZWFsIHdpdGggYW55dGhpbmcgdGhhdCBuZWVkcyB0byBiZSBk
b25lIGJlZm9yZSBhbnkgb3RoZXIgCnBhcnQgb2YgdGhlIGh5cGVydmlzb3IgaXMgcnVuLiBBbGwg
dGhlIGludGVycnVwdHMgKGRlYnVnLCBhc3luY2hyb25vdXMsIElSUSwgCkZJUSkgc2hvdWxkIGJl
IG1hc2tlZC4KCmVudGVyX2h5cGVydmlzb3JfaGVhZCgpIGNhbiBiZSBleGVjdXRlZCBhdCBhbnkg
dGltZSBhbmQgaXQgZG9lcyBub3QgbWF0dGVyIHRoZSAKb3JkZXIuCgpDaGVlcnMsCgo+IAo+IFsx
XSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MTgtMTAvbXNnMDIyNDguaHRtbAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

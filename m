Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D048435C0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 14:09:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbOVD-00029D-Gl; Thu, 13 Jun 2019 12:06:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xsGU=UM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbOVB-000298-K2
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 12:06:45 +0000
X-Inumbo-ID: b5833217-8dd3-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b5833217-8dd3-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 12:06:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 565D7367;
 Thu, 13 Jun 2019 05:06:43 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C0EE3F694;
 Thu, 13 Jun 2019 05:08:26 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-17-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041048490.14041@sstabellini-ThinkPad-T480s>
 <97d5c58d-b198-a094-4f54-78d94d1c8d42@arm.com>
 <alpine.DEB.2.21.1906071715330.15554@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d461092b-17d7-9bfc-fdba-065933c480f8@arm.com>
Date: Thu, 13 Jun 2019 13:06:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906071715330.15554@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 16/19] xen/arm: mm:
 Protect Xen page-table update with a spinlock
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
Cc: xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA4LzA2LzIwMTkgMDE6MTcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDUgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMDUvMDYv
MjAxOSAwMDoxMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gVHVlLCAxNCBNYXkg
MjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IFRoZSBmdW5jdGlvbiBjcmVhdGVfeGVuX2Vu
dHJpZXMoKSBtYXkgYmUgY2FsbGVkIGNvbmN1cnJlbnRseS4gRm9yCj4+Pj4gaW5zdGFuY2UsIHdo
aWxlIHRoZSB2bWFwIGFsbG9jYXRpb24gaXMgcHJvdGVjdGVkIGJ5IGEgc3BpbmxvY2ssIHRoZQo+
Pj4+IG1hcHBpbmcgaXMgbm90Lgo+Pj4KPj4+IERvIHlvdSBoYXZlIGFuIGV4YW1wbGUgb2YgcG90
ZW50aWFsIGNvbmN1cnJlbnQgY2FsbHMgb2YKPj4+IGNyZWF0ZV94ZW5fZW50cmllcygpIHdoaWNo
IGRvZXNuJ3QgaW52b2x2ZSBjb25jdXJyZW50IHZtYXBzIChiZWNhdXNlCj4+PiB2bWFwcyBhcmUg
YWxyZWFkeSBwcm90ZWN0ZWQgYnkgdGhlaXIgc3BpbmxvY2spPyB2bWFwICsgc29tZXRoaW5nX2Vs
c2UKPj4+IGZvciBpbnN0YW5jZT8KPj4gV2VsbCwgSSBnYXZlIGFuIGV4YW1wbGUgaGVyZS4gVGhl
IHZtYXAgYWxsb2NhdGlvbiAoaS5lIHZtX2FsbG9jKSBpcyBwcm90ZWN0ZWQKPj4gYnkgYSBzcGlu
bG9jay4gSG93ZXZlciwgd2hlbiB0aGUgbWFwcGluZyBpcyBkb25lIHRoZXJlIGFyZSBubyBzcGlu
bG9jayB0bwo+PiBwcm90ZWN0ZWQgYWdhaW5zdCBjb25jdXJyZW50IG9uZS4KPj4KPj4gU28gdGhl
IGZvbGxvd2luZyBzY2VuYXJpbyBjb3VsZCBoYXBwZW46Cj4+Cj4+IENQVTAJCQkJICAgICAgfAlD
UFUxCj4+IAkJCQkgICAgICB8Cj4+IHZtYXAoKQkJCQkgICAgICB8CXZtYXAoKQo+PiAgICB2bV9h
bGxvYygpCQkJICAgICAgfCAgIHZtX2FsbG9jKCkKPj4gICAgICBzcGluX2xvY2soKQkJCSAgICAg
IHwKPj4gICAgICAuLi4JCQkgIAkgICAgICB8Cj4+ICAgICAgc3Bpbl91bmxvY2soKQkJICAgICAg
fAo+PiAJCQkJICAgICAgfAkgICAgc3Bpbl9sb2NrKCkKPj4gICAgICAqIGludGVycnVwdCAqCQkg
ICAgICB8CSAgICAuLi4KPj4gCQkJCSAgICAgIHwJICAgIHNwaW5fdW5sb2NrKCkKPj4gCQkJCSAg
ICAgIHwKPj4gICAgICBtYXBfcGFnZXNfdG9feGVuKCkJCSAgICAgIHwJICAgIG1hcF9wYWdlc190
b194ZW4oKQo+PiAJZW50cnkgPSAmeGVuX3NlY29uZFtYXQkgICAgICB8CSAJZW50cnkgPSAmeGVu
X3NlY29uZFtZXQo+PiAJKiBlbnRyeSBpbnZhbGlkICogICAgICAgICAgICAgfCAgICAgICAgICog
ZW50cnkgaW52YWxpZCAqCj4+IAljcmVhdGVfeGVuX3RhYmxlKCkJICAgICAgfAkJY3JlYXRlX3hl
bl90YWJsZSgpCj4+IAkKPj4KPj4gQXNzdW1pbmcgWCA9PSBZIChpLmUgd2UgdGhlIHhlbiBzZWNv
bmQgZW50cnkgaXMgdGhlIHNhbWUpLCB0aGVuIG9uZSB3aWxsIHdpbgo+PiB0aGUgcmFjZSBhbmQg
dGhlcmVmb3JlIG9uZSBtYXBwaW5nIHdpbGwgYmUgaW5leGlzdGVudC4KPj4KPj4gQnV0IGFzIEkg
d3JvdGUsIHRoZSBjaGFuY2UgaXQgaXMgaGFwcGVuaW5nIGlzIHZlcnkgbGltaXRlZC4KPj4KPj4g
SSBjYW4gYWRkIHRoYXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+IAo+IFRoYW5rcyBmb3IgdGhl
IGRldGFpbGVkIGV4cGxhbmF0aW9uLCBJIGFtIGp1c3QgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgYW5k
Cj4gZG91YmxlLWNoZWNrIHRoZSByYWNlLiBXb3VsZG4ndCB2bV9hbGxvYyBndWFyYW50ZWUgdG8g
cmV0dXJuIGEgZGlmZmVyZW50Cj4gdmEgaW4gdGhlIHR3byBjYXNlcyAoQ1BVMCBhbmQgQ1BVMSBh
Ym92ZSksIGdpdmVuIHRoYXQgdGhlIHNlbGVjdGlvbiBvZgo+IHRoZSB2YSBpcyBkb25lIHVuZGVy
IHNwaW5fbG9jaz8KClllcyB2bV9hbGxvYygpIHdvdWxkIGd1YXJhbnRlZSB5b3UgdG8gaGF2ZSBh
IGRpZmZlcmVudCBWQS4KCj4gQnV0IGl0IHdvdWxkIGJlIHN0aWxsIHBvc3NpYmxlIHRvIGhhdmUg
WAo+IGFuZCBZIHNvIHRoYXQgdGhleSBzZWxlY3QgdGhlIHNhbWUgJnhlbl9zZWNvbmQgZW50cnks
IGhlbmNlLCB0aGUgcmFjZQo+IHdpdGggY3JlYXRlX3hlbl90YWJsZSgpLiBJdCBsb29rcyBsaWtl
IHRoZSByYWNlIGlzIHRoZXJlLgoKVGhhdCdzIGNvcnJlY3QuCgo+IAo+IFJldmlld2VkLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpUaGFuayB5b3UhCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

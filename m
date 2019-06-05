Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964F735A63
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 12:22:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYT1B-0003mZ-R8; Wed, 05 Jun 2019 10:19:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYT1A-0003mI-Bf
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 10:19:40 +0000
X-Inumbo-ID: 6c9f45eb-877b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6c9f45eb-877b-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 10:19:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ED61374;
 Wed,  5 Jun 2019 03:19:38 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 842AB3F690;
 Wed,  5 Jun 2019 03:19:37 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041113220.14041@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f2908fd8-f72f-fdc9-45c0-d0b09288b5f3@arm.com>
Date: Wed, 5 Jun 2019 11:19:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906041113220.14041@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 14/19] xen/arm32: mm:
 Avoid cleaning the cache for secondary CPUs page-tables
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNS8wNi8yMDE5IDAwOjExLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gVHVl
LCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGUgcGFnZS10YWJsZSB3YWxr
ZXIgaXMgY29uZmlndXJlZCB0byB1c2UgdGhlIHNhbWUgc2hhcmVhYmlsaXR5IGFuZAo+PiBjYWNo
ZWFiaWxpdHkgYXMgdGhlIGFjY2VzcyBwZXJmb3JtZWQgd2hlbiB1cGRhdGluZyB0aGUgcGFnZS10
YWJsZXMuIFRoaXMKPj4gbWVhbnMgY2xlYW5pbmcgdGhlIGNhY2hlIGZvciBzZWNvbmRhcnkgQ1BV
cyBydW50aW1lIHBhZ2UtdGFibGVzIGlzCj4+IHVubmVjZXNzYXJ5Lgo+IAo+IEFsbCByaWdodC4g
SXMgdGhlcmUgYW4gZXhwbGljaXQgY29uZmlndXJhdGlvbiBmb3IgdGhlIHNoYXJlYWJpbGl0eSBh
bmQKPiBjYWNoZWFiaWxpdHkgdXNlZCBieSB0aGUgcGFnZS10YWJsZSB3YWxrZXIgb3IgaXMgaXQg
c3BlY2lmaWVkIGFzIHN1Y2ggaW4KPiB0aGUgQXJtIEFybT8KClNlZSB0aGUgY29uZmlndXJhdGlv
biBvZiBUQ1JfRUwyLCBJIGNhbiBtZW50aW9uIGl0LgoKPiBBbHNvLCBpc24ndCBpdCBwb3NzaWJs
ZSB0aGF0IENQVXMgb24gYSBkaWZmZXJlbnQgY2x1c3Rlcgo+IChiaWcuTElUVExFKSB3b3VsZCBo
YXZlIGlzc3VlcyB3aXRoIHRoaXMgaWYgdGhlIGNhY2hlIGNvdWxkIGJlIHNwbGl0Cj4gYmV0d2Vl
biB0aGUgdHdvIGNsdXN0ZXJzPwoKSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMuLi4gQ2FjaGUgc2hv
dWxkIGJlIGNvaGVyZW50IHdoZW4gYSBDUFUgbGVhdmVzIEVMMy4KQnV0IHdlIGFscmVhZHkgc2hh
cmUgc29tZSBiaXRzIG9mIHRoZSBwYWdlIHRhYmxlcyBiZXR3ZWVuIHRoZSBwcm9jZXNzb3IgKHNl
ZSAKY3JlYXRlX3hlbl9wYWdlX3RhYmxlcykuIFNvIEkgZG9uJ3Qgc2VlIHdoZXJlIHRoZXJlIGlz
IGEgcG9zc2libGUgcHJvYmxlbSBoZXJlLgoKQ2hlZXJzLAoKPiAKPiAKPj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEFu
ZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+Cj4+IC0tLQo+PiAgICAgIENo
YW5nZXMgaW4gdjI6Cj4+ICAgICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Cj4+IC0t
LQo+PiAgIHhlbi9hcmNoL2FybS9tbS5jIHwgMyAtLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2Fy
Y2gvYXJtL21tLmMKPj4gaW5kZXggY2RhMjg0N2QwMC4uNmRiN2RkYTBkYSAxMDA2NDQKPj4gLS0t
IGEveGVuL2FyY2gvYXJtL21tLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMKPj4gQEAgLTc2
OSw5ICs3NjksNiBAQCBpbnQgaW5pdF9zZWNvbmRhcnlfcGFnZXRhYmxlcyhpbnQgY3B1KQo+PiAg
ICAgICAgICAgd3JpdGVfcHRlKCZmaXJzdFtmaXJzdF90YWJsZV9vZmZzZXQoRE9NSEVBUF9WSVJU
X1NUQVJUK2kqRklSU1RfU0laRSldLCBwdGUpOwo+PiAgICAgICB9Cj4+ICAgCj4+IC0gICAgY2xl
YW5fZGNhY2hlX3ZhX3JhbmdlKGZpcnN0LCBQQUdFX1NJWkUpOwo+PiAtICAgIGNsZWFuX2RjYWNo
ZV92YV9yYW5nZShkb21oZWFwLCBET01IRUFQX1NFQ09ORF9QQUdFUypQQUdFX1NJWkUpOwo+PiAt
Cj4+ICAgICAgIHBlcl9jcHUoeGVuX3BndGFibGUsIGNwdSkgPSBmaXJzdDsKPj4gICAgICAgcGVy
X2NwdSh4ZW5fZG9tbWFwLCBjcHUpID0gZG9taGVhcDsKPj4gICAKPj4gLS0gCj4+IDIuMTEuMAo+
PgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5D3B2D8
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 12:18:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haHKg-0004mw-5f; Mon, 10 Jun 2019 10:15:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haHKe-0004mr-MG
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 10:15:16 +0000
X-Inumbo-ID: a21fd174-8b68-11e9-88bc-c357d173dfc9
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a21fd174-8b68-11e9-88bc-c357d173dfc9;
 Mon, 10 Jun 2019 10:15:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20659346;
 Mon, 10 Jun 2019 03:15:12 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 668F03F557;
 Mon, 10 Jun 2019 03:16:53 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041113220.14041@sstabellini-ThinkPad-T480s>
 <f2908fd8-f72f-fdc9-45c0-d0b09288b5f3@arm.com>
Message-ID: <4ee949b1-0031-6696-8245-15874cb5a416@arm.com>
Date: Mon, 10 Jun 2019 11:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f2908fd8-f72f-fdc9-45c0-d0b09288b5f3@arm.com>
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

SGksCgpPbiAwNS8wNi8yMDE5IDExOjE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMDUvMDYv
MjAxOSAwMDoxMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBPbiBUdWUsIDE0IE1heSAy
MDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBUaGUgcGFnZS10YWJsZSB3YWxrZXIgaXMgY29u
ZmlndXJlZCB0byB1c2UgdGhlIHNhbWUgc2hhcmVhYmlsaXR5IGFuZAo+Pj4gY2FjaGVhYmlsaXR5
IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBkYXRpbmcgdGhlIHBhZ2UtdGFibGVzLiBU
aGlzCj4+PiBtZWFucyBjbGVhbmluZyB0aGUgY2FjaGUgZm9yIHNlY29uZGFyeSBDUFVzIHJ1bnRp
bWUgcGFnZS10YWJsZXMgaXMKPj4+IHVubmVjZXNzYXJ5Lgo+Pgo+PiBBbGwgcmlnaHQuIElzIHRo
ZXJlIGFuIGV4cGxpY2l0IGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBzaGFyZWFiaWxpdHkgYW5kCj4+
IGNhY2hlYWJpbGl0eSB1c2VkIGJ5IHRoZSBwYWdlLXRhYmxlIHdhbGtlciBvciBpcyBpdCBzcGVj
aWZpZWQgYXMgc3VjaCBpbgo+PiB0aGUgQXJtIEFybT8KPiAKPiBTZWUgdGhlIGNvbmZpZ3VyYXRp
b24gb2YgVENSX0VMMiwgSSBjYW4gbWVudGlvbiBpdC4KPiAKPj4gQWxzbywgaXNuJ3QgaXQgcG9z
c2libGUgdGhhdCBDUFVzIG9uIGEgZGlmZmVyZW50IGNsdXN0ZXIKPj4gKGJpZy5MSVRUTEUpIHdv
dWxkIGhhdmUgaXNzdWVzIHdpdGggdGhpcyBpZiB0aGUgY2FjaGUgY291bGQgYmUgc3BsaXQKPj4g
YmV0d2VlbiB0aGUgdHdvIGNsdXN0ZXJzPwoKR2VudGxlIHBpbmcsIGNhbiB5b3UgcGxlYXNlIGNs
YXJpZnkgeW91ciBxdWVzdGlvbi4KCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMuLi4gQ2Fj
aGUgc2hvdWxkIGJlIGNvaGVyZW50IHdoZW4gYSBDUFUgbGVhdmVzIEVMMy4KPiBCdXQgd2UgYWxy
ZWFkeSBzaGFyZSBzb21lIGJpdHMgb2YgdGhlIHBhZ2UgdGFibGVzIGJldHdlZW4gdGhlIHByb2Nl
c3NvciAoc2VlIAo+IGNyZWF0ZV94ZW5fcGFnZV90YWJsZXMpLiBTbyBJIGRvbid0IHNlZSB3aGVy
ZSB0aGVyZSBpcyBhIHBvc3NpYmxlIHByb2JsZW0gaGVyZS4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

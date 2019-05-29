Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9642E333
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 19:26:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW2Id-0007Xp-EM; Wed, 29 May 2019 17:23:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW2Ib-0007Xf-Og
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 17:23:37 +0000
X-Inumbo-ID: 7dd8d04e-8236-11e9-8edb-637dc4e1f467
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7dd8d04e-8236-11e9-8edb-637dc4e1f467;
 Wed, 29 May 2019 17:23:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1801C341;
 Wed, 29 May 2019 10:23:36 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F05083F5AF;
 Wed, 29 May 2019 10:23:33 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190514123125.29086-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <74c57ae1-192c-b3dd-4e76-9ac7d6ac2f5c@arm.com>
Date: Wed, 29 May 2019 18:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514123125.29086-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 00/12] xen/arm: Provide a
 generic function to update Xen PT
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpHZW50bGUgcGluZy4uLgoKQ2hlZXJzLAoKT24gMTQvMDUvMjAxOSAxMzozMSwgSnVsaWVu
IEdyYWxsIHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBUaGlzIGlzIHRoZSB0aGlyZCBwYXJ0IG9mIHRo
ZSBib290L21lbW9yeSByZXdvcmsgZm9yIFhlbiBvbiBBcm0uIEF0IHRoZQo+IG1vbWVudCwgdGhl
IHVwZGF0ZSB0byBYZW4gUFQgaXMgc2NhdHRlcmVkIGFsbCBhcm91bmQgbW0uYy4gVGhpcyBtYWtl
cwo+IGRpZmZpY3VsdCB0byByZXdvcmsgWGVuIG1lbW9yeSBsYXlvdXQgb3IgZXZlbiBlbnN1cmlu
ZyB3ZSBhcmUgZm9sbG93aW5nIHRoZQo+IEFybSBBcm0gcHJvcGVybHkgKGFuZCB3ZSBhcmUgbm90
IHNvIGZhciEpLgo+IAo+IFRoaXMgcGFydCBjb250YWlucyBjb2RlIHRvIHByb3ZpZGUgYSBnZW5l
cmljIGZ1bmN0aW9uIHRvIHVwZGF0ZSBYZW4gUFQuCj4gV2hpbGUgSSBjb3VsZCBoYXZlIHN0YXJ0
ZWQgZnJvbSBzY3JhdGNoLCBJIGRlY2lkZWQgdG8gYmFzZSB0aGUgbmV3IGZ1bmN0aW9uCj4gb24g
Y3JlYXRlX3hlbl9lbnRyaWVzKCkgKG5vdyByZW5hbWVkIHhlbl9wdF91cGRhdGUoKSkuIFRoaXMg
bWFrZXMgc2xpZ2h0bHkKPiBlYXNpZXIgdG8gZm9sbG93IHRoZSBjaGFuZ2VzLgo+IAo+IEluIHRo
aXMgc2VyaWVzLCB0aGUgbmV3IGdlbmVyaWMgZnVuY3Rpb24gd2lsbCBvbmx5IHN1cHBvcnQgM3Jk
LWxldmVsIHVwZGF0ZQo+IGFuZCBjYW5ub3QgYmUgdXNlZCBpbiBlYXJseSBib290IChpLmUgYmVj
YXVzZSB4ZW5oZWFwIGlzIG5vdCBpbml0aWFsaXplZCkuCj4gVGhpcyB3aWxsIGJlIGV4dGVuZGVk
IGluIGZvbGxvdy11cCBzZXJpZXMgdG8gYWxsb3cgbW9yZSB1c2Ugd2l0aGluIG1tLmMuCj4gCj4g
VGhlcmUgYXJlIHByb2JhYmx5IHNvbWUgb3B0aW1pemF0aW9uIHBvc3NpYmxlIGFyb3VuZCB0aGUg
VExCcyBmbHVzaC4gSSBoYXZlbid0Cj4gbG9va2VkIGF0IGl0IHNvIGZhci4KPiAKPiBUaGUgbGFz
dCB0d28gcGF0Y2hlcyBvZiB0aGlzIHNlcmllcyBpcyB0byBzaG93IGhvdyBleGlzdGluZyBjYWxs
ZXJzIGNhbiBiZQo+IGNvbnZlcnRlZC4gVGhlcmUgYXJlIG1vcmUgY29udmVyc2lvbiB0byBjb21l
IGluIGZvbGxvdy11cCBzZXJpZXMuCj4gCj4gVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gdGhlIGZp
cnN0IHR3byBwYXJ0cyBzZW50IHNlcGFyYXRlbHkgKHNlZSBbMV0gYW5kIFsyXSkuCj4gCj4gRm9y
IGNvbnZlbmllbmNlLCBJIHByb3ZpZGVkIGEgYnJhbmNoIHdpdGggYWxsIHRoZSBwYXRjaGVzIGFw
cGxpZWQgYmFzZWQgb24KPiBzdGFnaW5nOgo+IAo+ICAgICAgZ2l0Oi8veGVuYml0cy54ZW4ub3Jn
L3Blb3BsZS9qdWxpZW5nL3hlbi11bnN0YWJsZS5naXQgYnJhbmNoIG1tL3BhcnQzL3YyCj4gCj4g
Q2hlZXJzLAo+IAo+IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMTktMDUvbXNnMDExMDkuaHRtbAo+IFsyXSBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDUvbXNnMDExNDkuaHRt
bAo+IAo+IEp1bGllbiBHcmFsbCAoMTIpOgo+ICAgIHhlbi9hcm06IGxwYWU6IEFkZCBhIG1hY3Jv
IHRvIGdlbmVyYXRlIG9mZnNldHMgZnJvbSBhbiBhZGRyZXNzCj4gICAgeGVuL2FybTogbW06IFJl
bmFtZSBjcmVhdGVfeGVuX2VudHJpZXMoKSB0byB4ZW5fcHRfdXBkYXRlKCkKPiAgICB4ZW4vYXJt
OiBtbTogTW92ZSBvdXQgb2YgeGVuX3B0X3VwZGF0ZSgpIHRoZSBsb2dpYyB0byB1cGRhdGUgYW4g
ZW50cnkKPiAgICB4ZW4vYXJtOiBtbTogT25seSBpbmNyZW1lbnQgbWZuIHdoZW4gdmFsaWQgaW4g
eGVuX3B0X3VwZGF0ZQo+ICAgIHhlbi9hcm06IG1tOiBJbnRyb2R1Y2UgX1BBR0VfUFJFU0VOVCBh
bmQgX1BBR0VfUE9QVUxBVEUKPiAgICB4ZW4vYXJtOiBtbTogU2FuaXR5IGNoZWNrIGFueSB1cGRh
dGUgb2YgWGVuIHBhZ2UgdGFibGVzCj4gICAgeGVuL2FybTogbW06IFJld29yayB4ZW5fcHRfdXBk
YXRlX2VudHJ5IHRvIGF2b2lkIHVzZSB4ZW5tYXBfb3BlcmF0aW9uCj4gICAgeGVuL2FybTogbW06
IFJlbW92ZSBlbnVtIHhlbm1hcF9vcGVyYXRpb24KPiAgICB4ZW4vYXJtOiBtbTogVXNlIHssIHVu
fW1hcF9kb21haW5fcGFnZSgpIHRvIG1hcC91bm1hcCBYZW4gcGFnZS10YWJsZXMKPiAgICB4ZW4v
YXJtOiBtbTogUmV3b3JrIFhlbiBwYWdlLXRhYmxlcyB3YWxrIGR1cmluZyB1cGRhdGUKPiAgICB4
ZW4vYXJtOiBtbTogRG9uJ3Qgb3Blbi1jb2RlIFhlbiBQVCB1cGRhdGUgaW4ge3NldCwgY2xlYXJ9
X2ZpeG1hcCgpCj4gICAgeGVuL2FybTogbW06IFJlbW92ZSBzZXRfcHRlX2ZsYWdzX29uX3Jhbmdl
KCkKPiAKPiAgIHhlbi9hcmNoL2FybS9tbS5jICAgICAgICAgIHwgNDIxICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAgeGVuL2FyY2gvYXJtL3AybS5jICAg
ICAgICAgfCAgMjMgKy0tCj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2xwYWUuaCB8ICAgOSArCj4g
ICB4ZW4vaW5jbHVkZS9hc20tYXJtL3BhZ2UuaCB8ICAgOSArLQo+ICAgNCBmaWxlcyBjaGFuZ2Vk
LCAzMDUgaW5zZXJ0aW9ucygrKSwgMTU3IGRlbGV0aW9ucygtKQo+IAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

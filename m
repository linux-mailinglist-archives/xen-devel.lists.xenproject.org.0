Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B123BD7C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 22:30:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQtv-0005R9-Bl; Mon, 10 Jun 2019 20:28:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O/RI=UJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1haQtt-0005R4-St
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 20:28:17 +0000
X-Inumbo-ID: 473b1ef2-8bbe-11e9-8341-63635e510742
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 473b1ef2-8bbe-11e9-8341-63635e510742;
 Mon, 10 Jun 2019 20:28:17 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 199852082E;
 Mon, 10 Jun 2019 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560198496;
 bh=PAJhC57OU+WTI/5taYLBeDl9sjNPXM58jEEwgJfdrzA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ae2GMdbAiSI1HS+wIO0Cxw5D8ymdWGJeG4gQN+lJj7IrpK5/++5WqWcNg9VNoKkvZ
 g5YPGLN6VpEpSnYVCUtavbBK5FweFY1IIXlVKLaeaCclSsvD6bxE2WKSdhP2onYQ7z
 C5EUWe8Qf/MJsBwyc34rUkPRWgj5ygK5iBE19i9I=
Date: Mon, 10 Jun 2019 13:28:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <f2908fd8-f72f-fdc9-45c0-d0b09288b5f3@arm.com>
Message-ID: <alpine.DEB.2.21.1906101322480.8691@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041113220.14041@sstabellini-ThinkPad-T480s>
 <f2908fd8-f72f-fdc9-45c0-d0b09288b5f3@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA1IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMDUvMDYvMjAxOSAw
MDoxMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gVHVlLCAxNCBNYXkgMjAxOSwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBUaGUgcGFnZS10YWJsZSB3YWxrZXIgaXMgY29uZmln
dXJlZCB0byB1c2UgdGhlIHNhbWUgc2hhcmVhYmlsaXR5IGFuZAo+ID4gPiBjYWNoZWFiaWxpdHkg
YXMgdGhlIGFjY2VzcyBwZXJmb3JtZWQgd2hlbiB1cGRhdGluZyB0aGUgcGFnZS10YWJsZXMuIFRo
aXMKPiA+ID4gbWVhbnMgY2xlYW5pbmcgdGhlIGNhY2hlIGZvciBzZWNvbmRhcnkgQ1BVcyBydW50
aW1lIHBhZ2UtdGFibGVzIGlzCj4gPiA+IHVubmVjZXNzYXJ5Lgo+ID4gCj4gPiBBbGwgcmlnaHQu
IElzIHRoZXJlIGFuIGV4cGxpY2l0IGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBzaGFyZWFiaWxpdHkg
YW5kCj4gPiBjYWNoZWFiaWxpdHkgdXNlZCBieSB0aGUgcGFnZS10YWJsZSB3YWxrZXIgb3IgaXMg
aXQgc3BlY2lmaWVkIGFzIHN1Y2ggaW4KPiA+IHRoZSBBcm0gQXJtPwo+IAo+IFNlZSB0aGUgY29u
ZmlndXJhdGlvbiBvZiBUQ1JfRUwyLCBJIGNhbiBtZW50aW9uIGl0LgogClRoYXQgd291bGQgYmUg
bmljZS4gSSBkb3VibGUtY2hlY2tlZCBhbmQgaXQgaXMgYXMgeW91IHdyb3RlLgoKCj4gPiBBbHNv
LCBpc24ndCBpdCBwb3NzaWJsZSB0aGF0IENQVXMgb24gYSBkaWZmZXJlbnQgY2x1c3Rlcgo+ID4g
KGJpZy5MSVRUTEUpIHdvdWxkIGhhdmUgaXNzdWVzIHdpdGggdGhpcyBpZiB0aGUgY2FjaGUgY291
bGQgYmUgc3BsaXQKPiA+IGJldHdlZW4gdGhlIHR3byBjbHVzdGVycz8KPiAKPiBJIGRvbid0IHVu
ZGVyc3RhbmQgdGhpcy4uLiBDYWNoZSBzaG91bGQgYmUgY29oZXJlbnQgd2hlbiBhIENQVSBsZWF2
ZXMgRUwzLgo+IEJ1dCB3ZSBhbHJlYWR5IHNoYXJlIHNvbWUgYml0cyBvZiB0aGUgcGFnZSB0YWJs
ZXMgYmV0d2VlbiB0aGUgcHJvY2Vzc29yIChzZWUKPiBjcmVhdGVfeGVuX3BhZ2VfdGFibGVzKS4g
U28gSSBkb24ndCBzZWUgd2hlcmUgdGhlcmUgaXMgYSBwb3NzaWJsZSBwcm9ibGVtCj4gaGVyZS4K
CklmIHRoZSBjYWNoZSBpcyBhbHdheXMgY29oZXJlbnQgYWNyb3NzIHRoZSBjbHVzdGVycyBhbmQg
dGhlCnBhZ2V0YWJsZS13YWxrZXJzIG9mIGRpZmZlcmVudCBjbHVzdGVycywgdGhlbiB0aGlzIGlz
IGZpbmUuCgogCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292
QGVwYW0uY29tPgo+ID4gPiAKPiA+ID4gLS0tCj4gPiA+ICAgICAgQ2hhbmdlcyBpbiB2MjoKPiA+
ID4gICAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKPiA+ID4gLS0tCj4gPiA+ICAg
eGVuL2FyY2gvYXJtL21tLmMgfCAzIC0tLQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0
aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVu
L2FyY2gvYXJtL21tLmMKPiA+ID4gaW5kZXggY2RhMjg0N2QwMC4uNmRiN2RkYTBkYSAxMDA2NDQK
PiA+ID4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKPiA+ID4gKysrIGIveGVuL2FyY2gvYXJtL21t
LmMKPiA+ID4gQEAgLTc2OSw5ICs3NjksNiBAQCBpbnQgaW5pdF9zZWNvbmRhcnlfcGFnZXRhYmxl
cyhpbnQgY3B1KQo+ID4gPiAgICAgICAgICAgd3JpdGVfcHRlKCZmaXJzdFtmaXJzdF90YWJsZV9v
ZmZzZXQoRE9NSEVBUF9WSVJUX1NUQVJUK2kqRklSU1RfU0laRSldLAo+ID4gPiBwdGUpOwo+ID4g
PiAgICAgICB9Cj4gPiA+ICAgLSAgICBjbGVhbl9kY2FjaGVfdmFfcmFuZ2UoZmlyc3QsIFBBR0Vf
U0laRSk7Cj4gPiA+IC0gICAgY2xlYW5fZGNhY2hlX3ZhX3JhbmdlKGRvbWhlYXAsIERPTUhFQVBf
U0VDT05EX1BBR0VTKlBBR0VfU0laRSk7Cj4gPiA+IC0KPiA+ID4gICAgICAgcGVyX2NwdSh4ZW5f
cGd0YWJsZSwgY3B1KSA9IGZpcnN0Owo+ID4gPiAgICAgICBwZXJfY3B1KHhlbl9kb21tYXAsIGNw
dSkgPSBkb21oZWFwOwo+ID4gPiAgIAo+ID4gPiAtLSAKPiA+ID4gMi4xMS4wCj4gPiA+IAo+IAo+
IC0tIAo+IEp1bGllbiBHcmFsbAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ABF3BDE8
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 22:57:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haRJU-0008PV-4H; Mon, 10 Jun 2019 20:54:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O/RI=UJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1haRJS-0008PP-TR
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 20:54:42 +0000
X-Inumbo-ID: f7a4351c-8bc1-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f7a4351c-8bc1-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 20:54:41 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9FE320820;
 Mon, 10 Jun 2019 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560200080;
 bh=eCiU5hXdSizOhGkKCxGW5wU+ea42B1LBF1zENuvcbLw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rPt4pfEtSoAdTDNHWXmlCMATPQA0cFFbL+9FN8S+OWnQiMpzSF+WvklTYeEn2OBeo
 wkxhjAF2fw0uvz8ztJ7VIdhGZS26t+t351KIRFhNJO6v7n3H0YFrJIIZlID2doP5r1
 /pp4NVEb7zDVkHE77VAjfPjWtAEjhiw8E5YYsjyQ=
Date: Mon, 10 Jun 2019 13:54:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <ec030ed9-c44b-c476-866e-6c9c47def506@arm.com>
Message-ID: <alpine.DEB.2.21.1906101352010.8691@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041113220.14041@sstabellini-ThinkPad-T480s>
 <f2908fd8-f72f-fdc9-45c0-d0b09288b5f3@arm.com>
 <alpine.DEB.2.21.1906101322480.8691@sstabellini-ThinkPad-T480s>
 <ec030ed9-c44b-c476-866e-6c9c47def506@arm.com>
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

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWFubywKPiAK
PiBPbiA2LzEwLzE5IDk6MjggUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFdl
ZCwgNSBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBPbiAwNS8wNi8yMDE5IDAw
OjExLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCAxNCBNYXkgMjAx
OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ID4gVGhlIHBhZ2UtdGFibGUgd2Fsa2VyIGlz
IGNvbmZpZ3VyZWQgdG8gdXNlIHRoZSBzYW1lIHNoYXJlYWJpbGl0eSBhbmQKPiA+ID4gPiA+IGNh
Y2hlYWJpbGl0eSBhcyB0aGUgYWNjZXNzIHBlcmZvcm1lZCB3aGVuIHVwZGF0aW5nIHRoZSBwYWdl
LXRhYmxlcy4KPiA+ID4gPiA+IFRoaXMKPiA+ID4gPiA+IG1lYW5zIGNsZWFuaW5nIHRoZSBjYWNo
ZSBmb3Igc2Vjb25kYXJ5IENQVXMgcnVudGltZSBwYWdlLXRhYmxlcyBpcwo+ID4gPiA+ID4gdW5u
ZWNlc3NhcnkuCj4gPiA+ID4gCj4gPiA+ID4gQWxsIHJpZ2h0LiBJcyB0aGVyZSBhbiBleHBsaWNp
dCBjb25maWd1cmF0aW9uIGZvciB0aGUgc2hhcmVhYmlsaXR5IGFuZAo+ID4gPiA+IGNhY2hlYWJp
bGl0eSB1c2VkIGJ5IHRoZSBwYWdlLXRhYmxlIHdhbGtlciBvciBpcyBpdCBzcGVjaWZpZWQgYXMg
c3VjaCBpbgo+ID4gPiA+IHRoZSBBcm0gQXJtPwo+ID4gPiAKPiA+ID4gU2VlIHRoZSBjb25maWd1
cmF0aW9uIG9mIFRDUl9FTDIsIEkgY2FuIG1lbnRpb24gaXQuCj4gPiAgIFRoYXQgd291bGQgYmUg
bmljZS4gSSBkb3VibGUtY2hlY2tlZCBhbmQgaXQgaXMgYXMgeW91IHdyb3RlLgo+IAo+IFN1cmUu
IEhvdyBhYm91dDoKPiAKPiAiVGhlIHBhZ2UtdGFibGUgd2Fsa2VyIGlzIGNvbmZpZ3VyZWQgYnkg
VENSX0VMMiB0byB1c2Ugc2hhcmVhYmlsaXR5IGFuZAo+IGNhY2hlYWJpbGl0eSBhcyB0aGUgYWNj
ZXNzIHBlcmZvcm1lZCB3aGVuIHVwZGF0aW5nIHRoZSBwYWdlLXRhYmxlcy4gWy4uLl0iCgpUaGF0
J3MgZ3JlYXQgdGhhbmsgeW91LiBXaXRoIHRoYXQsIGFkZCBteSByZXZpZXdlZC1ieS4KCgo+ID4g
PiA+IEFsc28sIGlzbid0IGl0IHBvc3NpYmxlIHRoYXQgQ1BVcyBvbiBhIGRpZmZlcmVudCBjbHVz
dGVyCj4gPiA+ID4gKGJpZy5MSVRUTEUpIHdvdWxkIGhhdmUgaXNzdWVzIHdpdGggdGhpcyBpZiB0
aGUgY2FjaGUgY291bGQgYmUgc3BsaXQKPiA+ID4gPiBiZXR3ZWVuIHRoZSB0d28gY2x1c3RlcnM/
Cj4gPiA+IAo+ID4gPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcy4uLiBDYWNoZSBzaG91bGQgYmUg
Y29oZXJlbnQgd2hlbiBhIENQVSBsZWF2ZXMgRUwzLgo+ID4gPiBCdXQgd2UgYWxyZWFkeSBzaGFy
ZSBzb21lIGJpdHMgb2YgdGhlIHBhZ2UgdGFibGVzIGJldHdlZW4gdGhlIHByb2Nlc3Nvcgo+ID4g
PiAoc2VlCj4gPiA+IGNyZWF0ZV94ZW5fcGFnZV90YWJsZXMpLiBTbyBJIGRvbid0IHNlZSB3aGVy
ZSB0aGVyZSBpcyBhIHBvc3NpYmxlIHByb2JsZW0KPiA+ID4gaGVyZS4KPiA+IAo+ID4gSWYgdGhl
IGNhY2hlIGlzIGFsd2F5cyBjb2hlcmVudCBhY3Jvc3MgdGhlIGNsdXN0ZXJzIGFuZCB0aGUKPiA+
IHBhZ2V0YWJsZS13YWxrZXJzIG9mIGRpZmZlcmVudCBjbHVzdGVycywgdGhlbiB0aGlzIGlzIGZp
bmUuCj4gCj4gWGVuIChhbmQgTGludXgpIGJ1aWx0IG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgYWxs
IHRoZSBDUFVzIChhbmQgcGFnZS10YWJsZQo+IHdhbGtlcikgYXJlIGluIHRoZSBzYW1lIHNoYXJl
YWJsZSBkb21haW4gKGkuZSBpbm5lcnNoYXJlYWJsZSkuIElmIHlvdSBoYXZlIGEKPiBwbGF0Zm9y
bSB3aGVyZSBpdCBpcyBub3QgdGhlIGNhc2UsIHRoZW4gWGVuIGlzIGdvaW5nIHRvIGJlIGJhZGx5
IGJyb2tlbi4KPiAKPiBUaGlzIGlzIGFsc28gaW5saW5lIHdpdGggdGhlIGV4cGVjdGF0aW8gIGZy
b20gdGhlIEFybSBBcm0gKEIyLTEyMyBpbiBEREkKPiAwNDg3RC5hKToKPiAKPiAiVGhlIElubmVy
IFNoYXJlYWJsZSBkb21haW4gaXMgZXhwZWN0ZWQgdG8gYmUgdGhlIHNldCBvZiBQRXMgY29udHJv
bGxlZCBieSBhCj4gc2luZ2xlIGh5cGVydmlzb3Igb3Igb3BlcmF0aW5nIHN5c3RlbS4iCj4gCj4g
RG8geW91IGhhdmUgYSBjYXNlIHdoZXJlIFhlbiBuZWVkcyB0byBydW4gb24gUEVzIGluIGRpZmZl
cmVudCBkb21haW5zPwoKTm8sIHRoYW5rZnVsbHkgSSBkb24ndCA6LSkKCkkgd2FzIHdvcnJpZWQg
dGhhdCBzb21lIGJpZy5MSVRUTEUgU29DcyBtaWdodCBiZSBidWlsdCBsaWtlIHRoYXQgc28uIChJ
CmRvbid0IGhhdmUgYW55IGJpZy5MSVRUTEUgbWFjaGluZXMgaGVyZSB0byBjb25maXJtL2Rlbnku
KSBJdCBpcyBnb29kCnRoYXQgd2UgZG9uJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCBpdC4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

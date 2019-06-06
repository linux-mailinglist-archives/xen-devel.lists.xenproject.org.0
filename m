Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3937B1F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 19:35:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYwFg-00068n-Lc; Thu, 06 Jun 2019 17:32:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYwFe-00068i-NH
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 17:32:34 +0000
X-Inumbo-ID: 112d9d1e-8881-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 112d9d1e-8881-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 17:32:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5E1E374;
 Thu,  6 Jun 2019 10:32:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27E0A3F690;
 Thu,  6 Jun 2019 10:32:32 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-18-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041110170.14041@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3733e879-14b7-3ad2-6c9c-8cd6dab799c7@arm.com>
Date: Thu, 6 Jun 2019 18:32:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906041110170.14041@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 17/19] xen/arm: mm:
 Initialize page-tables earlier
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

SGkgU3RlZmFubywKCk9uIDA1LzA2LzIwMTkgMDA6MTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDE0IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFNpbmNlIGNv
bW1pdCBmNjA2NThjNmFlICJ4ZW4vYXJtOiBTdG9wIHJlbG9jYXRpbmcgWGVuIiwgdGhlIGZ1bmN0
aW9uCj4+IHNldHVwX3BhZ2VfdGFibGVzKCkgZG9lcyBub3QgcmVxdWlyZSBhbnkgaW5mb3JtYXRp
b24gZnJvbSB0aGUgRkRULgo+Pgo+PiBTbyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIHBhZ2Ut
dGFibGVzIGNhbiBiZSBkb25lIG11Y2ggZWFybGllciBpbiB0aGUKPj4gYm9vdCBwcm9jZXNzLiBU
aGUgZWFybGllc3Qgc2V0dXBfcGFnZV90YWJsZXMoKSBjYW4gYmUgY2FsbGVkIGlzIGFmdGVyCj4+
IHRyYXBzIGhhdmUgYmVlbiBpbml0aWFsaXplZCwgc28gd2UgY2FuIGdldCBiYWNrdHJhY2UgaWYg
YW4gZXJyb3IKPj4gb2NjdXJyZWQuCj4+Cj4+IE1vdmluZyB0aGUgaW5pdGlhbGl6YXRpb24gb2Yg
dGhlIHBhZ2UtdGFibGVzIGFsc28gYXZvaWQgdGhlIGRhbmNlIHRvIG1hcAo+PiB0aGUgRkRUIGFn
YWluIGluIHRoZSBuZXcgc2V0IG9mIHBhZ2UtdGFibGVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiBSZXZpZXdlZC1ieTogQW5kcmlp
IEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPj4KPj4gLS0tCj4+ICAgICAgQ2hhbmdl
cyBpbiB2MjoKPj4gICAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKPj4gLS0tCj4+
ICAgeGVuL2FyY2gvYXJtL21tLmMgICAgfCAxMiArKystLS0tLS0tLS0KPj4gICB4ZW4vYXJjaC9h
cm0vc2V0dXAuYyB8ICA0ICsrLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBi
L3hlbi9hcmNoL2FybS9tbS5jCj4+IGluZGV4IDc1MDJhMTQ3NjAuLmVhY2MxNjQ3ZTAgMTAwNjQ0
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jCj4+
IEBAIC01NTAsNyArNTUwLDcgQEAgc3RhdGljIGlubGluZSBscGFlX3QgcHRlX29mX3hlbmFkZHIo
dmFkZHJfdCB2YSkKPj4gICAgICAgcmV0dXJuIG1mbl90b194ZW5fZW50cnkobWFkZHJfdG9fbWZu
KG1hKSwgTVRfTk9STUFMKTsKPj4gICB9Cj4+ICAgCj4+IC0vKiBNYXAgdGhlIEZEVCBpbiB0aGUg
ZWFybHkgYm9vdCBwYWdlIHRhYmxlICovCj4+ICsvKiBNYXAgdGhlIEZEVCBpbiB0aGUgcnVudGlt
ZSBwYWdlIHRhYmxlICovCj4gCj4gSSB0aGluayB5b3UgY2FuIGRyb3AgdGhpcyBjb21tZW50IG5v
dy4KCkdvb2QgcG9pbnQsIHRoZSBtb3JlIHRoZSBwbGFuIGlzIHRvIGhhdmUgb25seSBvbmUgc2V0
IG9mIHBhZ2UtdGFibGVzLgoKPiAKPiBJbiBhbnkgY2FzZToKPiAKPiBSZXZpZXdlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKVGhhbmsgeW91IGZvciB0
aGUgcmV2aWV3IQoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

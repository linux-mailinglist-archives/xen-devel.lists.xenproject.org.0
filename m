Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F22617A3B8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 12:09:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9oLa-0007ZN-5V; Thu, 05 Mar 2020 11:07:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9oLZ-0007ZE-6h
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 11:07:21 +0000
X-Inumbo-ID: 7894a586-5ed1-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7894a586-5ed1-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 11:07:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A59E7AD3C;
 Thu,  5 Mar 2020 11:07:14 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-21-anthony.perard@citrix.com>
 <20200227131452.GP24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76692de3-3ef5-464a-1c46-c58de5be0027@suse.com>
Date: Thu, 5 Mar 2020 12:07:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227131452.GP24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 20/23] xen/build: factorise
 generation of the linker scripts
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDIuMjAyMCAxNDoxNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAyNiwgMjAyMCBhdCAxMTozMzo1MkFNICswMDAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4g
SW4gQXJtIGFuZCBYODYgbWFrZWZpbGUsIGdlbmVyYXRpbmcgdGhlIGxpbmtlciBzY3JpcHQgaXMg
dGhlIHNhbWUsIHNvCj4+IHdlIGNhbiBzaW1wbHkgaGF2ZSBib3RoIGNhbGwgdGhlIHNhbWUgbWFj
cm8uCj4+Cj4+IFdlIG5lZWQgdG8gYWRkICoubGRzIGZpbGVzIGludG8gZXh0cmEteSBzbyB0aGF0
IFJ1bGVzLm1rIGNhbiBmaW5kIHRoZQo+PiAuKi5jbWQgZGVwZW5kZW5jeSBmaWxlIGFuZCBsb2Fk
IGl0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KPj4gLS0tCj4+ICB4ZW4vUnVsZXMubWsgICAgICAgICAgfCA4ICsrKysrKysr
Cj4+ICB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgfCA1ICsrLS0tCj4+ICB4ZW4vYXJjaC94ODYvTWFr
ZWZpbGUgfCA2ICsrKy0tLQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL1J1bGVzLm1rIGIveGVuL1J1bGVz
Lm1rCj4+IGluZGV4IDhjN2RiYTkyMTFkMS4uMDJjZDM3ZDA0MDU0IDEwMDY0NAo+PiAtLS0gYS94
ZW4vUnVsZXMubWsKPj4gKysrIGIveGVuL1J1bGVzLm1rCj4+IEBAIC0yMzAsNiArMjMwLDE0IEBA
IGNtZF9zX1MgPSAkKENQUCkgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEpJSwkKGFfZmxhZ3MpKSAk
PCAtbyAkQAo+PiAgJS5zOiAlLlMgRk9SQ0UKPj4gIAkkKGNhbGwgaWZfY2hhbmdlZCxjcHBfc19T
KQo+PiAgCj4+ICsjIExpbmtlciBzY3JpcHRzLCAubGRzLlMgLT4gLmxkcwo+PiArcXVpZXRfY21k
X2NjX2xkc19TID0gTERTICAgICAkQAo+PiArZGVmaW5lIGNtZF9jY19sZHNfUwo+PiArICAgICQo
Q0MpIC1QIC1FIC1VaTM4NiAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQoYV9mbGFncykpIC1v
ICRAICQ8OyBcCj4gCj4gRG8geW91IGtub3cgd2h5IHRoZSAtVWkzODYgaXMgbmVlZGVkPwoKSXQg
d2FzIG5lZWRlZCBmb3IgdGhlIDMyLWJpdCBoeXBlcnZpc29yIGJ1aWxkLCB0byBhdm9pZCBjb3Jy
dXB0aW5nCgpPVVRQVVRfQVJDSChpMzg2KQoKYnV0IGl0J3Mgbm90IG5lZWRlZCBhbnltb3JlLiBB
cm0gc2hvdWxkbid0IGhhdmUgaGFkIGl0IGluIHRoZSBmaXJzdApwbGFjZS4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

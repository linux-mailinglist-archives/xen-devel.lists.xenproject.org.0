Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C960923BD3
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 17:17:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSjz3-0003bG-UA; Mon, 20 May 2019 15:13:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSjz2-0003bB-8q
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:13:48 +0000
X-Inumbo-ID: dd566139-7b11-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id dd566139-7b11-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 15:13:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6C5280D;
 Mon, 20 May 2019 08:13:46 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 925CF3F575;
 Mon, 20 May 2019 08:13:45 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Jan Beulich <JBeulich@suse.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-4-julien.grall@arm.com>
 <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
 <4cef7816-74da-b6e6-6f7d-e327edb083da@arm.com>
 <5CD57B78020000780022D888@prv1-mh.provo.novell.com>
 <b0dc05a5-3b2e-669a-a955-1a543b3e7581@arm.com>
Message-ID: <423c2750-ca33-501f-cdc2-988bb58038b6@arm.com>
Date: Mon, 20 May 2019 16:13:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b0dc05a5-3b2e-669a-a955-1a543b3e7581@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/14] xen/x86: Make mfn_to_gfn typesafe
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8wNS8yMDE5IDE0OjI1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4gCj4gT24g
MTAvMDUvMjAxOSAxNDoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEwLjA1LjE5IGF0
IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pgo+Pj4KPj4+IE9uIDEwLzA1
LzIwMTkgMTI6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDA3LjA1LjE5IGF0IDE3
OjE0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cv
Y29tbW9uLmMKPj4+Pj4gQEAgLTQ3NCw3ICs0NzQsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdHJh
Y2VfcmVzeW5jKGludCBldmVudCwgbWZuX3QgZ21mbikKPj4+Pj4gwqDCoMKgwqDCoMKgIGlmICgg
dGJfaW5pdF9kb25lICkKPj4+Pj4gwqDCoMKgwqDCoMKgIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyogQ29udmVydCBnbWZuIHRvIGdmbiAqLwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgdW5z
aWduZWQgbG9uZyBnZm4gPSBtZm5fdG9fZ2ZuKGN1cnJlbnQtPmRvbWFpbiwgZ21mbik7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGdmbiA9IGdmbl94KG1mbl90b19nZm4oY3Vy
cmVudC0+ZG9tYWluLCBnbWZuKSk7Cj4+Pj4+ICsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
X190cmFjZV92YXIoZXZlbnQsIDAvKiF0c2MqLywgc2l6ZW9mKGdmbiksICZnZm4pOwo+Pj4+PiDC
oMKgwqDCoMKgwqAgfQo+Pj4+Cj4+Pj4gQ2FuJ3QgeW91IHVzZSBnZm5fdCBoZXJlLCBhbmQgaGVu
Y2UgYXZvaWQgdGhlIGdmbl94KCk/IFNhbWUgYWdhaW4gZnVydGhlcgo+Pj4+IGRvd24uCj4+PiBC
ZWNhdXNlIF9fdHJhY2VfdmFyIHdpbGwgZXhwb3J0IHRoZSB2YWx1ZSB0byB0aGUgZ3Vlc3QuIEkg
d2Fzbid0IHN1cmUKPj4+IHdoZXRoZXIgd2UKPj4+IGNhbiBzYWZlbHkgY29uc2lkZXIgdGhhdCBn
Zm5fdCBpcyBleGFjdGx5IHRoZSBzYW1lIGFzIHVuc2lnbmVkIGxvbmcgaW4KPj4+IGRlYnVnLWJ1
aWxkLgo+Pgo+PiBIbW0sIHdlbGwgLSBzZWUgdGhlIGRlZmluaXRpb24gb2YgZ2ZuX3QuIEdlb3Jn
ZSwgd2hhdCBkbyB5b3UgdGhpbms/Cj4gCj4gSSBrbm93IHdoYXQncyB0aGUgY3VycmVudCBkZWZp
bml0aW9uLiBNeSBwb2ludCBpcyB3ZSBuZXZlciBtYWRlIHRoYXQgYXNzdW1wdGlvbiAKPiBiZWZv
cmUuIEluIGFsbCBob25lc3R5LCBzdXJlIGFzc3VtcHRpb24gd291bGQgZGVmaW5pdGVseSBoZWxw
IGluIGEgZmV3IHBsYWNlcywgCj4gYnV0IEkgdGhpbmsgd2Ugb3VnaHQgdG8gc2FmZWd1YXJkIHdp
dGggQlVJTERfQlVHKC4uLikuCgpHZW9yZ2UsIGRvIHlvdSBoYXZlIGFueSBvcGluaW9ucz8KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397F887B8B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 15:42:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw56i-0000V1-Gj; Fri, 09 Aug 2019 13:39:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw56g-0000Uw-60
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 13:38:58 +0000
X-Inumbo-ID: 08d03838-baab-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 08d03838-baab-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 13:38:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CDA3AD88;
 Fri,  9 Aug 2019 13:38:55 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>
References: <20190809121440.5668-1-julien.grall@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9d6353c-fd4d-116e-2531-7db46abf2b23@suse.com>
Date: Fri, 9 Aug 2019 15:38:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809121440.5668-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/page_alloc: Keep away MFN 0 from the
 buddy allocator
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Stewart.Hildebrand@dornerworks.com, xen-devel@lists.xenproject.org,
 Jarvis.Roach@dornerworks.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNDoxNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENvbWJpbmluZyBvZiBi
dWRkaWVzIGhhcHBlbnMgb25seSBzdWNoIHRoYXQgdGhlIHJlc3VsdGluZyBsYXJnZXIgYnVkZHkK
PiBpcyBzdGlsbCBvcmRlci1hbGlnbmVkLiBUbyBjcm9zcyBhIHpvbmUgYm91bmRhcnkgd2hpbGUg
bWVyZ2luZywgdGhlCj4gaW1wbGljYXRpb24gaXMgdGhhdCBib3RoIHRoZSBidWRkeSBbMCwgMl5u
LTFdIGFuZCB0aGUgYnVkZHkKPiBbMl5uLCAyXihuKzEpXSBhcmUgZnJlZS4KClsyXm4sIDJeKG4r
MSktMV0KCllvdSBtYXkgd2FudCB0byBhZGQgdGhhdCBtZXJnaW5nIGFjcm9zcyB6b25lIGJvdW5k
YXJpZXMgaXMgd2hhdCB3ZQpuZWVkIHRvIHByZXZlbnQuCgo+IElkZWFsbHkgd2Ugd2FudCB0byBm
aXggdGhlIGFsbG9jYXRvciwgYnV0IGZvciBub3cgd2UgY2FuIGp1c3QgcHJldmVudAo+IGFkZGlu
ZyB0aGUgTUZOIDAgaW4gdGhlIGFsbG9jYXRvci4KPiAKPiBPbiB4ODYsIHRoZSBNRk4gMCBpcyBh
bHJlYWR5IGtlcHQgYXdheSBmcm9tIHRoZSBidWRkeSBhbGxvY2F0b3IuIFNvIHRoZQo+IGJ1ZyBj
YW4gb25seSBoYXBwZW4gb24gQXJtIHBsYXRmb3JtIHdoZXJlIHRoZSBmaXJzdCBtZW1vcnkgYmFu
ayBpcwo+IHN0YXJ0aW5nIGF0IDAuCj4gCj4gQXMgdGhpcyBpcyBhIHNwZWNpZmljIHRvIHRoZSBh
bGxvY2F0b3IsIHRoZSBNRk4gMCBpcyByZW1vdmVkIGluIHRoZSBjb21tb24gY29kZQo+IHRvIGNh
dGVyIGFsbCB0aGUgYXJjaGl0ZWN0dXJlcyAoY3VycmVudCBhbmQgZnV0dXJlKS4KPiAKPiBSZXBv
cnRlZC1ieTogSmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

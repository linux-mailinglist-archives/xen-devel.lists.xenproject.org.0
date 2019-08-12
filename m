Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8968970A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 08:04:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx3Oh-0003zB-5C; Mon, 12 Aug 2019 06:01:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hx3Of-0003z6-Rm
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 06:01:33 +0000
X-Inumbo-ID: a19c2d04-bcc6-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a19c2d04-bcc6-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 06:01:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CCC6B636;
 Mon, 12 Aug 2019 06:01:30 +0000 (UTC)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
References: <20190809121440.5668-1-julien.grall@arm.com>
 <e9d6353c-fd4d-116e-2531-7db46abf2b23@suse.com>
 <62e082b025d8483d8b577c283fce1873@dornerworks.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bce8106d-bd49-0ec1-23fd-804fde4a48ef@suse.com>
Date: Mon, 12 Aug 2019 08:01:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <62e082b025d8483d8b577c283fce1873@dornerworks.com>
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
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAyMDoxNSwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+IE9uIEZyaWRh
eSwgQXVndXN0IDksIDIwMTkgOTozOSBBTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PiB3cm90ZToKPj4gT24gMDkuMDguMjAxOSAxNDoxNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4g
Q29tYmluaW5nIG9mIGJ1ZGRpZXMgaGFwcGVucyBvbmx5IHN1Y2ggdGhhdCB0aGUgcmVzdWx0aW5n
IGxhcmdlciBidWRkeQo+Pj4gaXMgc3RpbGwgb3JkZXItYWxpZ25lZC4gVG8gY3Jvc3MgYSB6b25l
IGJvdW5kYXJ5IHdoaWxlIG1lcmdpbmcsIHRoZQo+Pj4gaW1wbGljYXRpb24gaXMgdGhhdCBib3Ro
IHRoZSBidWRkeSBbMCwgMl5uLTFdIGFuZCB0aGUgYnVkZHkKPj4+IFsyXm4sIDJeKG4rMSldIGFy
ZSBmcmVlLgo+Pgo+PiBbMl5uLCAyXihuKzEpLTFdCj4+Cj4+IFlvdSBtYXkgd2FudCB0byBhZGQg
dGhhdCBtZXJnaW5nIGFjcm9zcyB6b25lIGJvdW5kYXJpZXMgaXMgd2hhdCB3ZQo+PiBuZWVkIHRv
IHByZXZlbnQuCj4+Cj4+PiBJZGVhbGx5IHdlIHdhbnQgdG8gZml4IHRoZSBhbGxvY2F0b3IsIGJ1
dCBmb3Igbm93IHdlIGNhbiBqdXN0IHByZXZlbnQKPj4+IGFkZGluZyB0aGUgTUZOIDAgaW4gdGhl
IGFsbG9jYXRvci4KPj4+Cj4+PiBPbiB4ODYsIHRoZSBNRk4gMCBpcyBhbHJlYWR5IGtlcHQgYXdh
eSBmcm9tIHRoZSBidWRkeSBhbGxvY2F0b3IuIFNvIHRoZQo+Pj4gYnVnIGNhbiBvbmx5IGhhcHBl
biBvbiBBcm0gcGxhdGZvcm0gd2hlcmUgdGhlIGZpcnN0IG1lbW9yeSBiYW5rIGlzCj4+PiBzdGFy
dGluZyBhdCAwLgo+Pj4KPj4+IEFzIHRoaXMgaXMgYSBzcGVjaWZpYyB0byB0aGUgYWxsb2NhdG9y
LCB0aGUgTUZOIDAgaXMgcmVtb3ZlZCBpbiB0aGUgY29tbW9uIGNvZGUKPj4+IHRvIGNhdGVyIGFs
bCB0aGUgYXJjaGl0ZWN0dXJlcyAoY3VycmVudCBhbmQgZnV0dXJlKS4KPj4+Cj4+PiBSZXBvcnRl
ZC1ieTogSmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pgo+PiBS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEhlcmUgaXMg
SmVmZidzIGluaXRpYWwgcGF0Y2ggZm9yIHRoZSBpc3N1ZS4KClRvIGJlIGhvbmVzdCwgaXQgd291
bGQgaGF2ZSBiZWVuIG5pY2UgaWYgeW91IGhhZCBjbGFyaWZpZWQgX3doeV8KeW91IHNlbnQgdGhp
cyBpbiByZXBseSBoZXJlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ABF151D67
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:40:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0Ft-0001Dm-GB; Tue, 04 Feb 2020 15:36:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H7xx=3Y=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iz0Fs-0001Dh-2u
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:36:48 +0000
X-Inumbo-ID: 2648a7b6-4764-11ea-ad98-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2648a7b6-4764-11ea-ad98-bc764e2007e4;
 Tue, 04 Feb 2020 15:36:47 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [XEN PATCH v2 1/2] Check zone before merging adjacent blocks in
 heap
Thread-Index: AQHV228KH37EHJOkIUeTvSvdxgW/8KgLJ4zA
Date: Tue, 4 Feb 2020 15:37:45 +0000
Message-ID: <d8aff909a53a4f1c969988410bebafc1@dornerworks.com>
References: <20200204151441.10626-1-stewart.hildebrand@dornerworks.com>
 <89f9cdc5-bd93-7c15-7832-740db273aca6@suse.com>
In-Reply-To: <89f9cdc5-bd93-7c15-7832-740db273aca6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.13.130]
MIME-Version: 1.0
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [XEN PATCH v2 1/2] Check zone before merging
 adjacent blocks in heap
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jeff
 Kubascik <Jeff.Kubascik@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlc2RheSwgRmVicnVhcnkgNCwgMjAyMCAxMDoyMiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+T24gMDQuMDIuMjAyMCAxNjoxNCwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOg0KPj4gRnJv
bTogSmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20+DQo+Pg0KPj4g
VGhlIFhlbiBoZWFwIGlzIHNwbGl0IHVwIGludG8gbm9kZXMgYW5kIHpvbmVzLiBFYWNoIG5vZGUg
KyB6b25lIGlzDQo+PiBtYW5hZ2VkIGFzIGEgc2VwYXJhdGUgcG9vbCBvZiBtZW1vcnkuDQo+Pg0K
Pj4gV2hlbiByZXR1cm5pbmcgcGFnZXMgdG8gdGhlIGhlYXAsIGZyZWVfaGVhcF9wYWdlcyB3aWxs
IGNoZWNrIGFkamFjZW50DQo+PiBibG9ja3MgdG8gc2VlIGlmIHRoZXkgY2FuIGJlIGNvbWJpbmVk
IGludG8gYSBsYXJnZXIgYmxvY2suIEhvd2V2ZXIsIHRoZQ0KPj4gem9uZSBvZiB0aGUgYWRqYWNl
bnQgYmxvY2sgaXMgbm90IGNoZWNrZWQuIFRoaXMgcmVzdWx0cyBpbiBibG9ja3MgdGhhdA0KPj4g
bWlncmF0ZSBmcm9tIG9uZSB6b25lIHRvIGFub3RoZXIuDQo+Pg0KPj4gV2hlbiBhIGJsb2NrIG1p
Z3JhdGVzIHRvIHRoZSBhZGphY2VudCB6b25lLCB0aGUgYXZhaWwgY291bnRlcnMgZm9yIHRoZQ0K
Pj4gb2xkIGFuZCBuZXcgbm9kZSArIHpvbmUgaXMgbm90IHVwZGF0ZWQgYWNjb3JkaW5nbHkuIFRo
ZSBhdmFpbCBjb3VudGVyDQo+PiBpcyB1c2VkIHdoZW4gYWxsb2NhdGluZyBwYWdlcyB0byBkZXRl
cm1pbmUgd2hldGhlciB0byBza2lwIG92ZXIgYSB6b25lLg0KPj4gV2l0aCB0aGlzIGJlaGF2aW9y
LCBpdCBpcyBwb3NzaWJsZSBmb3IgZnJlZSBwYWdlcyB0byBjb2xsZWN0IGluIGEgem9uZQ0KPj4g
d2l0aCB0aGUgYXZhaWwgY291bnRlciBzbWFsbGVyIHRoYW4gdGhlIGFjdHVhbCBwYWdlIGNvdW50
LCByZXN1bHRpbmcNCj4+IGluIGZyZWUgcGFnZXMgdGhhdCBhcmUgbm90IGFsbG9jYWJsZS4NCj4N
Cj4iV2hlbiBhIGJsb2NrIG1pZ3JhdGVzIiAtIGZpbmUuIEJ1dCBpcyB0aGlzIHNpdHVhdGlvbiBw
b3NzaWJsZSB0bw0KPm9jY3VyLCB3aXRob3V0ICJ4ZW4vcGFnZV9hbGxvYzogS2VlcCBhd2F5IE1G
TiAwIGZyb20gdGhlIGJ1ZGR5DQo+YWxsb2NhdG9yIiByZXZlcnRlZD8NCg0KTm8sIG5vdCBhcyBm
YXIgYXMgSSdtIGF3YXJlLCB0aG91Z2ggSSBoYXZlIG5vdCBzdHVkaWVkIHRoaXMgY29kZSBpbiBk
ZXRhaWwgc28gSSBkb24ndCBmZWVsIGZ1bGx5IGNvbmZpZGVudCBpbiBteSAibm8iLg0KDQo+IElm
IG5vdCwgdGhlcmUncyBubyBidWcsIG5vIG5lZWQgZm9yIGEgY2hhbmdlLA0KPmFuZCBldmVuIGxl
c3Mgc28gLi4uDQo+DQo+PiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPj4gKysrIGIv
eGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4+IEBAIC0xNDYyLDYgKzE0NjIsNyBAQCBzdGF0aWMg
dm9pZCBmcmVlX2hlYXBfcGFnZXMoDQo+PiAgICAgICAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKHBh
Z2VfdG9fbWZuKHByZWRlY2Vzc29yKSkgfHwNCj4+ICAgICAgICAgICAgICAgICAgICFwYWdlX3N0
YXRlX2lzKHByZWRlY2Vzc29yLCBmcmVlKSB8fA0KPj4gICAgICAgICAgICAgICAgICAgKFBGTl9P
UkRFUihwcmVkZWNlc3NvcikgIT0gb3JkZXIpIHx8DQo+PiArICAgICAgICAgICAgICAgICAocGFn
ZV90b196b25lKHByZWRlY2Vzc29yKSAhPSB6b25lKSB8fA0KPj4gICAgICAgICAgICAgICAgICAg
KHBoeXNfdG9fbmlkKHBhZ2VfdG9fbWFkZHIocHJlZGVjZXNzb3IpKSAhPSBub2RlKSApDQo+PiAg
ICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4NCj4+IEBAIC0xNDg1LDYgKzE0ODYsNyBAQCBzdGF0
aWMgdm9pZCBmcmVlX2hlYXBfcGFnZXMoDQo+PiAgICAgICAgICAgICAgaWYgKCAhbWZuX3ZhbGlk
KHBhZ2VfdG9fbWZuKHN1Y2Nlc3NvcikpIHx8DQo+PiAgICAgICAgICAgICAgICAgICAhcGFnZV9z
dGF0ZV9pcyhzdWNjZXNzb3IsIGZyZWUpIHx8DQo+PiAgICAgICAgICAgICAgICAgICAoUEZOX09S
REVSKHN1Y2Nlc3NvcikgIT0gb3JkZXIpIHx8DQo+PiArICAgICAgICAgICAgICAgICAocGFnZV90
b196b25lKHN1Y2Nlc3NvcikgIT0gem9uZSkgfHwNCj4+ICAgICAgICAgICAgICAgICAgIChwaHlz
X3RvX25pZChwYWdlX3RvX21hZGRyKHN1Y2Nlc3NvcikpICE9IG5vZGUpICkNCj4+ICAgICAgICAg
ICAgICAgICAgYnJlYWs7DQo+DQo+Li4uIGZvciBvbmUgdGhhdCBzbG93cyBkb3duIG1hbnkgZnJl
ZSBvcGVyYXRpb25zLCBldmVuIGlmIGp1c3QNCj5zbGlnaHRseS4gSU9XIGFmYWljdCBlaXRoZXIg
dGhlIGNoYW5nZSBpcyBub3QgbmVlZGVkLCBvciBpdHMNCj5kZXNjcmlwdGlvbiBuZWVkcyB1cGRh
dGluZy4NCg0KUmlnaHQuIEFuIGFsdGVybmF0aXZlIHRoYXQgd291bGRuJ3QgcG90ZW50aWFsbHkg
c2xvdyB0aGluZ3MgZG93biBpbiBwcm9kdWN0aW9uIGJ1aWxkcyB3b3VsZCBiZSB0byBhcHBseSB0
aGUgQVNTRVJUIGZyb20gcGF0Y2ggMi4gSSBkb24ndCBoYXZlIGFueSBwZXJmb3JtYW5jZSBtZXRy
aWNzIHJlZ2FyZGluZyBleGFjdGx5IGhvdyBtdWNoIG9mIGEgcGVyZm9ybWFuY2UgaGl0IHRoaXMg
d291bGQgaW5jdXIuDQoNClN0ZXcNCg0KPg0KPkphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

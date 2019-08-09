Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984C8821E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 20:16:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw9Oi-0003Rv-Er; Fri, 09 Aug 2019 18:13:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KhBG=WF=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hw9Oh-0003RV-D1
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 18:13:51 +0000
X-Inumbo-ID: 6ed464d4-bad1-11e9-8980-bc764e045a96
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6ed464d4-bad1-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 18:13:50 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH] xen/page_alloc: Keep away MFN 0 from the buddy allocator
Thread-Index: AQHVTqw/OFC4iXiK+065fjQRWTtISqbzFUoAgAAHzMA=
Date: Fri, 9 Aug 2019 18:15:14 +0000
Message-ID: <62e082b025d8483d8b577c283fce1873@dornerworks.com>
References: <20190809121440.5668-1-julien.grall@arm.com>
 <e9d6353c-fd4d-116e-2531-7db46abf2b23@suse.com>
In-Reply-To: <e9d6353c-fd4d-116e-2531-7db46abf2b23@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.139.1]
MIME-Version: 1.0
X-spam-status: No, score=3.3 required=5.0 tests=BAYES_00, RCVD_IN_PBL,
 RCVD_IN_XBL, MAILSHELL_SCORE_0_4, RDNS_NONE, HELO_NO_DOMAIN
X-Spam-Flag: NO
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpZGF5LCBBdWd1c3QgOSwgMjAxOSA5OjM5IEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPk9uIDA5LjA4LjIwMTkgMTQ6MTQsIEp1bGllbiBHcmFsbCB3cm90
ZToNCj4+IENvbWJpbmluZyBvZiBidWRkaWVzIGhhcHBlbnMgb25seSBzdWNoIHRoYXQgdGhlIHJl
c3VsdGluZyBsYXJnZXIgYnVkZHkNCj4+IGlzIHN0aWxsIG9yZGVyLWFsaWduZWQuIFRvIGNyb3Nz
IGEgem9uZSBib3VuZGFyeSB3aGlsZSBtZXJnaW5nLCB0aGUNCj4+IGltcGxpY2F0aW9uIGlzIHRo
YXQgYm90aCB0aGUgYnVkZHkgWzAsIDJebi0xXSBhbmQgdGhlIGJ1ZGR5DQo+PiBbMl5uLCAyXihu
KzEpXSBhcmUgZnJlZS4NCj4NCj5bMl5uLCAyXihuKzEpLTFdDQo+DQo+WW91IG1heSB3YW50IHRv
IGFkZCB0aGF0IG1lcmdpbmcgYWNyb3NzIHpvbmUgYm91bmRhcmllcyBpcyB3aGF0IHdlDQo+bmVl
ZCB0byBwcmV2ZW50Lg0KPg0KPj4gSWRlYWxseSB3ZSB3YW50IHRvIGZpeCB0aGUgYWxsb2NhdG9y
LCBidXQgZm9yIG5vdyB3ZSBjYW4ganVzdCBwcmV2ZW50DQo+PiBhZGRpbmcgdGhlIE1GTiAwIGlu
IHRoZSBhbGxvY2F0b3IuDQo+Pg0KPj4gT24geDg2LCB0aGUgTUZOIDAgaXMgYWxyZWFkeSBrZXB0
IGF3YXkgZnJvbSB0aGUgYnVkZHkgYWxsb2NhdG9yLiBTbyB0aGUNCj4+IGJ1ZyBjYW4gb25seSBo
YXBwZW4gb24gQXJtIHBsYXRmb3JtIHdoZXJlIHRoZSBmaXJzdCBtZW1vcnkgYmFuayBpcw0KPj4g
c3RhcnRpbmcgYXQgMC4NCj4+DQo+PiBBcyB0aGlzIGlzIGEgc3BlY2lmaWMgdG8gdGhlIGFsbG9j
YXRvciwgdGhlIE1GTiAwIGlzIHJlbW92ZWQgaW4gdGhlIGNvbW1vbiBjb2RlDQo+PiB0byBjYXRl
ciBhbGwgdGhlIGFyY2hpdGVjdHVyZXMgKGN1cnJlbnQgYW5kIGZ1dHVyZSkuDQo+Pg0KPj4gUmVw
b3J0ZWQtYnk6IEplZmYgS3ViYXNjaWsgPGplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4N
Cj5SZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpIZXJlIGlz
IEplZmYncyBpbml0aWFsIHBhdGNoIGZvciB0aGUgaXNzdWUuDQoNCkZyb206IEplZmYgS3ViYXNj
aWsgPGplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tPg0KRGF0ZTogTW9uLCA0IE1hciAyMDE5
IDE0OjE0OjA1IC0wNTAwDQpTdWJqZWN0OiBbUEFUQ0hdIENoZWNrIHpvbmUgYmVmb3JlIG1lcmdp
bmcgYWRqYWNlbnQgYmxvY2tzIGluIGhlYXANCg0KVGhlIFhlbiBoZWFwIGlzIHNwbGl0IHVwIGlu
dG8gbm9kZXMgYW5kIHpvbmVzLiBFYWNoIG5vZGUgKyB6b25lIGlzDQptYW5hZ2VkIGFzIGEgc2Vw
YXJhdGUgcG9vbCBvZiBtZW1vcnkuDQoNCldoZW4gcmV0dXJuaW5nIHBhZ2VzIHRvIHRoZSBoZWFw
LCBmcmVlX2hlYXBfcGFnZXMgd2lsbCBjaGVjayBhZGphY2VudA0KYmxvY2tzIHRvIHNlZSBpZiB0
aGV5IGNhbiBiZSBjb21iaW5lZCBpbnRvIGEgbGFyZ2VyIGJsb2NrLiBIb3dldmVyLCB0aGUNCnpv
bmUgb2YgdGhlIGFkamFjZW50IGJsb2NrIGlzIG5vdCBjaGVja2VkLiBUaGlzIHJlc3VsdHMgaW4g
YmxvY2tzIHRoYXQNCm1pZ3JhdGUgZnJvbSBvbmUgem9uZSB0byBhbm90aGVyLg0KDQpXaGVuIGEg
YmxvY2sgbWlncmF0ZXMgdG8gdGhlIGFkamFjZW50IHpvbmUsIHRoZSBhdmFpbCBjb3VudGVycyBm
b3IgdGhlDQpvbGQgYW5kIG5ldyBub2RlICsgem9uZSBpcyBub3QgdXBkYXRlZCBhY2NvcmRpbmds
eS4gVGhlIGF2YWlsIGNvdW50ZXINCmlzIHVzZWQgd2hlbiBhbGxvY2F0aW5nIHBhZ2VzIHRvIGRl
dGVybWluZSB3aGV0aGVyIHRvIHNraXAgb3ZlciBhIHpvbmUuDQpXaXRoIHRoaXMgYmVoYXZpb3Is
IGl0IGlzIHBvc3NpYmxlIGZvciBmcmVlIHBhZ2VzIHRvIGNvbGxlY3QgaW4gYSB6b25lDQp3aXRo
IHRoZSBhdmFpbCBjb3VudGVyIHNtYWxsZXIgdGhhbiB0aGUgYWN0dWFsIHBhZ2UgY291bnQsIHJl
c3VsdGluZw0KaW4gZnJlZSBwYWdlcyB0aGF0IGFyZSBub3QgYWxsb2NhYmxlLg0KDQpUaGlzIGNv
bW1pdCBhZGRzIGEgY2hlY2sgdG8gY29tcGFyZSB0aGUgYWRqYWNlbnQgYmxvY2sncyB6b25lIHdp
dGggdGhlDQpjdXJyZW50IHpvbmUgYmVmb3JlIG1lcmdpbmcgdGhlbS4NCg0KU2lnbmVkLW9mZi1i
eTogSmVmZiBLdWJhc2NpayA8SmVmZi5LdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20+DQpUZXN0ZWQt
Ynk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNv
bT4NCi0tLQ0KIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
IGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCmluZGV4IDQ4MmYwOTg4ZjcuLmE5MjI2OGNjNjcg
MTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KKysrIGIveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMNCkBAIC0xNDE5LDYgKzE0MTksNyBAQCBzdGF0aWMgdm9pZCBmcmVlX2hlYXBf
cGFnZXMoDQogICAgICAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKHBhZ2VfdG9fbWZuKHByZWRlY2Vz
c29yKSkgfHwNCiAgICAgICAgICAgICAgICAgICFwYWdlX3N0YXRlX2lzKHByZWRlY2Vzc29yLCBm
cmVlKSB8fA0KICAgICAgICAgICAgICAgICAgKFBGTl9PUkRFUihwcmVkZWNlc3NvcikgIT0gb3Jk
ZXIpIHx8DQorICAgICAgICAgICAgICAgICAocGFnZV90b196b25lKHBnLW1hc2spICE9IHpvbmUp
IHx8DQogICAgICAgICAgICAgICAgICAocGh5c190b19uaWQocGFnZV90b19tYWRkcihwcmVkZWNl
c3NvcikpICE9IG5vZGUpICkNCiAgICAgICAgICAgICAgICAgYnJlYWs7DQogDQpAQCAtMTQ0Miw2
ICsxNDQzLDcgQEAgc3RhdGljIHZvaWQgZnJlZV9oZWFwX3BhZ2VzKA0KICAgICAgICAgICAgIGlm
ICggIW1mbl92YWxpZChwYWdlX3RvX21mbihzdWNjZXNzb3IpKSB8fA0KICAgICAgICAgICAgICAg
ICAgIXBhZ2Vfc3RhdGVfaXMoc3VjY2Vzc29yLCBmcmVlKSB8fA0KICAgICAgICAgICAgICAgICAg
KFBGTl9PUkRFUihzdWNjZXNzb3IpICE9IG9yZGVyKSB8fA0KKyAgICAgICAgICAgICAgICAgKHBh
Z2VfdG9fem9uZShwZyttYXNrKSAhPSB6b25lKSB8fA0KICAgICAgICAgICAgICAgICAgKHBoeXNf
dG9fbmlkKHBhZ2VfdG9fbWFkZHIoc3VjY2Vzc29yKSkgIT0gbm9kZSkgKQ0KICAgICAgICAgICAg
ICAgICBicmVhazsNCiANCi0tIA0KMi4yMi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

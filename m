Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50473AAC3C6
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 14:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977121.1364186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHKB-0003Ia-GU; Tue, 06 May 2025 12:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977121.1364186; Tue, 06 May 2025 12:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHKB-0003GX-D0; Tue, 06 May 2025 12:23:03 +0000
Received: by outflank-mailman (input) for mailman id 977121;
 Tue, 06 May 2025 12:23:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hshq=XW=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1uCHKA-0003EX-5P
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 12:23:02 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d73b14ad-2a74-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 14:22:56 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 14:22:55 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Tue, 6 May 2025 14:22:55 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d73b14ad-2a74-11f0-9ffb-bf95429c2676
From: John Ernberg <john.ernberg@actia.se>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/2] xen: swiotlb: Implement map_resource callback
Thread-Topic: [PATCH 2/2] xen: swiotlb: Implement map_resource callback
Thread-Index: AQHbu1cR+sKkXAZoXEOAUfrcrER157O/dMAAgAX2O4A=
Date: Tue, 6 May 2025 12:22:55 +0000
Message-ID: <75266eb7-66a4-4477-ae8a-cbd1ebbee8db@actia.se>
References: <20250502114043.1968976-1-john.ernberg@actia.se>
 <20250502114043.1968976-3-john.ernberg@actia.se>
 <alpine.DEB.2.22.394.2505021007460.3879245@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2505021007460.3879245@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.35]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14453667060
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E994E23DDFC0E4EB8666504990A79B4@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgU3RlZmFubywNCg0KT24gNS8yLzI1IDc6MjAgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToNCj4gK0NocmlzdG9waA0KPiANCj4gT24gRnJpLCAyIE1heSAyMDI1LCBKb2huIEVybmJlcmcg
d3JvdGU6DQo+PiBOZWVkZWQgYnkgdGhlIGVETUEgdjMgRE1BIGVuZ2luZSBmb3VuZCBpbiBpb21t
dS1sZXNzIFNvQ3Mgc3VjaCBhcyBpTVg4UVhQDQo+PiB0byBiZSBhYmxlIHRvIHBlcmZvcm0gRE1B
IG9wZXJhdGlvbnMgYXMgYSBYZW4gSGFyZHdhcmUgRG9tYWluLCB3aGljaCBuZWVkcw0KPj4gdG8g
YmUgYWJsZSB0byBkbyBETUEgaW4gTU1JTyBzcGFjZS4NCg0KU2VsZi1ub3RlOiBUaGUgYWJvdmUg
cGFydCBvZiB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgYSBkaXNhc3RlciBhbmQgc2hvdWxkIA0KcmVh
ZCBzb21ldGhpbmcgbGlrZS4NCg0KTmVlZGVkIGJ5IFNvQ3Mgd2l0aG91dCBhbiBpb21tdSAoc3Vj
aCBhcyB0aGUgaU1YOFFYUCBhbmQgaXQncyBlRE1BIHYzIA0KZW5naW5lKSB0aGF0IG5lZWQgdG8g
YmUgYWJsZSB0byBwZXJmb3JtIERNQSBvcGVyYXRpb25zIGluIE1NSU8gc3BhY2UuDQoNCj4+DQo+
PiBUaGUgY2FsbGJhY2sgaW1wbGVtZW50YXRpb24gaXMgYmFzaWNhbGx5IHRoZSBzYW1lIGFzIHRo
ZSBvbmUgZm9yIGRpcmVjdA0KPj4gbWFwcGluZyBvZiByZXNvdXJjZXMsIGV4Y2VwdCB0aGlzIGFs
c28gdGFrZXMgaW50byBhY2NvdW50IFhlbiBwYWdlDQo+PiBtYXBwaW5ncy4NCj4+DQo+PiBUaGVy
ZSBpcyBub3RoaW5nIHRvIGRvIGZvciB1bm1hcCwganVzdCBsaWtlIHdpdGggZGlyZWN0LCBzbyB0
aGUgdW5tYXANCj4+IGNhbGxiYWNrIGlzIG5vdCBuZWVkZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogSm9obiBFcm5iZXJnIDxqb2huLmVybmJlcmdAYWN0aWEuc2U+DQo+Pg0KPj4gLS0tDQo+Pg0K
Pj4gSSBvcmlnaW5hbGx5IGV4cG9ydGVkIGRtYV9kaXJlY3RfbWFwX3Jlc291cmNlKCkgYW5kIHVz
ZWQgdGhhdCB3aGljaA0KPj4gYXBwZWFyZWQgdG8gd29yaywgYnV0IGl0IGZlbHQgbGlrZSBub3Qg
Y2hlY2tpbmcgWGVuIHBhZ2UgbWFwcGluZ3Mgd2Fzbid0DQo+PiBmdWxseSBjb3JyZWN0IGFuZCBJ
IHdlbnQgd2l0aCB0aGlzLiBCdXQgaWYgZG1hX2RpcmVjdF9tYXBfcmVzb3VyY2UoKSBpcw0KPj4g
dGhlIGNvcnJlY3QgYXBwcm9hY2ggaGVyZSB0aGVuIEkgY2FuIHN1Ym1pdCB0aGF0IGlzbnRlYWQu
DQo+PiAtLS0NCj4+ICAgZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyB8IDE1ICsrKysrKysrKysr
KysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14
ZW4uYw0KPj4gaW5kZXggZWY1NmEyNTAwZWQ2Li4wZjAyZmRkOTEyOGQgMTAwNjQ0DQo+PiAtLS0g
YS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jDQo+PiArKysgYi9kcml2ZXJzL3hlbi9zd2lvdGxi
LXhlbi5jDQo+PiBAQCAtMjg1LDYgKzI4NSwyMCBAQCBzdGF0aWMgdm9pZCB4ZW5fc3dpb3RsYl91
bm1hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLA0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXR0cnMsIHBvb2wpOw0K
Pj4gICB9DQo+Pg0KPj4gK3N0YXRpYyBkbWFfYWRkcl90IHhlbl9zd2lvdGxiX21hcF9yZXNvdXJj
ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHBoeXNfYWRkcl90IHBoeXMsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2Rp
cmVjdGlvbiBkaXIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgYXR0cnMpDQo+PiArew0KPj4gKyAgICAgZG1hX2FkZHJfdCBkZXZfYWRk
ciA9IHhlbl9waHlzX3RvX2RtYShkZXYsIHBoeXMpOw0KPiANCj4gWWVzLCB3ZSBuZWVkIHRoZSB4
ZW5fcGh5c190b19kbWEgY2FsbCBoZXJlLiBUaGlzIGlzIG9uZSBvZiB0aGUgcmVhc29ucyBJDQo+
IGRvbid0IHRoaW5rIHdlIGNhbiB1c2UgZG1hX2RpcmVjdF9tYXBfcmVzb3VyY2UoKSB0byBpbXBs
ZW1lbnQNCj4gbWFwX3Jlc291cmNlDQo+IA0KPiANCj4+ICsgICAgIEJVR19PTihkaXIgPT0gRE1B
X05PTkUpOw0KPj4gKw0KPj4gKyAgICAgaWYgKCFkbWFfY2FwYWJsZShkZXYsIGRldl9hZGRyLCBz
aXplLCBmYWxzZSkpDQo+PiArICAgICAgICAgICAgIHJldHVybiBETUFfTUFQUElOR19FUlJPUjsN
Cj4gDQo+IEJ1dCBoZXJlIHlvdSBhbHNvIG5lZWQgdG8gY2hlY2sgdGhhdCBwaHlzK3NpemUgZG9l
c24ndCBjcm9zcyBhIHBhZ2UNCj4gYm91bmRhcnkuIFlvdSBuZWVkIHRvIGNhbGwgcmFuZ2Vfc3Ry
YWRkbGVzX3BhZ2VfYm91bmRhcnksIGxpa2Ugd2UgZG8gYXQNCj4gdGhlIGJlZ2lubmluZyBvZiB4
ZW5fc3dpb3RsYl9tYXBfcGFnZS4NCj4gDQo+IElmIGl0IGlzIHBvc3NpYmxlIHRvIGNyb3NzIGEg
cGFnZSBib3VuZGFyeSwgdGhlbiB3ZSBuZWVkIHRvIGJhc2ljYWxseSB0bw0KPiBkbyB0aGUgc2Ft
ZSB0aGluZyBoZXJlIGFzIHdlIGRvIGluIHhlbl9zd2lvdGxiX21hcF9wYWdlIHdoZXJlIHdlIGNo
ZWNrDQo+IGZvcjoNCj4gDQo+ICAgICAgICAgIGlmIChkbWFfY2FwYWJsZShkZXYsIGRldl9hZGRy
LCBzaXplLCB0cnVlKSAmJg0KPiAgICAgICAgICAgICAgIXJhbmdlX3N0cmFkZGxlc19wYWdlX2Jv
dW5kYXJ5KHBoeXMsIHNpemUpICYmDQo+ICAgICAgICAgICAgICAgICAgIXhlbl9hcmNoX25lZWRf
c3dpb3RsYihkZXYsIHBoeXMsIGRldl9hZGRyKSAmJg0KPiAgICAgICAgICAgICAgICAgICFpc19z
d2lvdGxiX2ZvcmNlX2JvdW5jZShkZXYpKQ0KPiAgICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsN
Cj4gDQo+IGlmIGFsbCBpcyB3ZWxsLCB3ZSBnbyB3aXRoIHRoZSBuYXRpdmUgcGF0aCwgb3RoZXJ3
aXNlIHdlIGJvdW5jZSBvbg0KPiBzd2lvdGxiLXhlbi4NCj4gDQoNCkknbGwgcHJlZmFjZSB0aGlz
IHdpdGggdGhhdCBpdCdzIG15IGZpcnN0IGRlZXAgZGl2ZSBpbiBETUEsIHNvIHRoZSANCmZvbGxv
d2luZyBtYXkgZW50aXJlbHkgYmUgbWUgYmVpbmcgc3R1cGlkOg0KDQpJJ20gbm90IHN1cmUgYSBz
dHJhZGRsZXMgcGFnZSBib3VuZGFyeSBwYXRoIG1ha2VzIHNlbnNlLg0KDQpUaGlzIG1hcHBpbmcg
aXMgbm90IGZvciBhIFJBTSBiYWNrZWQgYWRkcmVzcy4gSW4gdGhlIGVETUEgY2FzZSBmb3IgdGhl
IA0KaU1YOFFYUCB0aGUgYHBoeXNgIGNvbWluZyBpbiBoZXJlIGlzIHRoZSBhZGRyZXNzIG9mIGEg
cmVnaXN0ZXIuIEkgY2Fubm90IA0Kc2VlIGhvdyBhIHN3aW90bGIgYm91bmNlIHdvdWxkIGZpeCBh
bnl0aGluZyBpZiB5b3UgZW5kIHVwIHN0cmFkZGxpbmcgYSANCnBhZ2UgYm91bmRhcnkuIEF0IG1v
c3QgSSBjYW4gc2VlIGEgV0FSTl9PTiB3aXRoIGEgRE1BX01BUFBJTkdfRVJST1IgDQpyZXR1cm4g
aWYgc3VjaCBhIGNoZWNrIHdvdWxkIHlpZWxkIHRydWUuDQoNCkxldCdzIHNheSB5b3Ugd2FudCB0
byBkbyBhIERFVl9UT19NRU0gYW5kIGEgY2hlY2sgZGVjaWRlcyB5b3UgbmVlZCB0byANCmJvdW5j
ZSBpdCB5b3UnZCBib3VuY2UgYW4gUlggcmVnaXN0ZXIgYWRkcmVzcy4gSSBjYW5ub3Qgc2VlIGhv
dyB0aGF0IERNQSANCndvdWxkIGV2ZXIgZW5kIHVwIGRvaW5nIHRoZSBleHBlY3RlZCB0aGluZy4N
Cg0KVGhlIGVETUEgZW5naW5lIHdpbGwgbWFuYWdlIHRoZSBSWC9UWCByZWdpc3RlcnMgZm9yIGFu
IElQIGJsb2NrIGFuZCBtb3ZlIA0KdGhlIGRhdGEgYmV0d2VlbiB0aGVtIGFuZCBSQU0sIHdoZXJl
IHRoZSBSQU0gbWVtb3J5IGlzIG1hcHBlZCBzZXBhcmF0ZWx5IA0KYnkgZG1hX21hcF9wYWdlIChh
bmQgZmFtaWx5KS4gQW5kIHRoZXNlIGNhbiBiZSBzd2lvdGxiIGJvdW5jZWQgdmlhIHRoZSANCm1h
cCBwYWdlIGNhbGxiYWNrIHdpdGggbm8gcHJvYmxlbS4NCg0KQmVzdCByZWdhcmRzIC8vIEpvaG4g
RXJuYmVyZw==


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1AB877BCC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 09:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691242.1076972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbCL-0002TR-13; Mon, 11 Mar 2024 08:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691242.1076972; Mon, 11 Mar 2024 08:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbCK-0002RC-UV; Mon, 11 Mar 2024 08:39:52 +0000
Received: by outflank-mailman (input) for mailman id 691242;
 Mon, 11 Mar 2024 08:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQmv=KR=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rjbCJ-0002R6-TZ
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 08:39:51 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec7f22f2-df82-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 09:39:50 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Mar
 2024 09:39:49 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Mon, 11 Mar 2024 09:39:49 +0100
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
X-Inumbo-ID: ec7f22f2-df82-11ee-afdc-a90da7624cb6
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Peng Fan <peng.fan@nxp.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
CC: Jonas Blixt <jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDzxxsAgAA1KwCAAVx5AIAAQjeAgAEdtQCAAyp5AIABm3uAgAZ8E4CAKNxDgIAApfwAgAKGQoCAAAbIgIAEXCQA
Date: Mon, 11 Mar 2024 08:39:49 +0000
Message-ID: <7f49fd48-808b-4a05-98ee-3f53fd8574d5@actia.se>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se>
 <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
 <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <5a0c8f09-4f01-45e9-892c-86342c0d0ec5@xen.org>
 <08ae764c-3490-4dd1-ab70-7a855a98d16d@actia.se>
 <911ec1bb-3733-4f37-839e-673a88e408ff@actia.se>
 <ab61278a-f3f1-41de-a0b2-eca6f19be103@xen.org>
 <848794f3-a337-49d9-84db-a969970f071b@actia.se>
 <48038c7f-d7cd-4100-a41b-8042bcb93208@xen.org>
In-Reply-To: <48038c7f-d7cd-4100-a41b-8042bcb93208@xen.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2921D72955627C62
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6444A95D98CEE478990EC25FAA028B1@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgSnVsaWVuLA0KDQpPbiAzLzgvMjQgMTU6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkg
Sm9obiwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJlcGx5Lg0KPiANCj4gT24gMDgvMDMvMjAy
NCAxMzo0MCwgSm9obiBFcm5iZXJnIHdyb3RlOg0KPj4gT24gMy83LzI0IDAwOjA3LCBKdWxpZW4g
R3JhbGwgd3JvdGU6DQo+Pj4gwqAgPiBQaW5nIG9uIHRoZSB3YXRjaGRvZyBkaXNjdXNzaW9uIGJp
dHMuDQo+Pj4NCj4+PiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuDQo+Pj4NCj4+PiBPbiAwNi8w
My8yMDI0IDEzOjEzLCBKb2huIEVybmJlcmcgd3JvdGU6DQo+Pj4+IE9uIDIvOS8yNCAxNDoxNCwg
Sm9obiBFcm5iZXJnIHdyb3RlOg0KPj4+Pj4NCj4+Pj4+PiDCoMKgwqDCoCAqIElNWF9TSVBfVElN
RVJfKjrCoCBUaGlzIHNlZW1zIHRvIGJlIHJlbGF0ZWQgdG8gdGhlIHdhdGNoZG9nLg0KPj4+Pj4+
IFNob3VsZG4ndCBkb20wIHJlbHkgb24gdGhlIHdhdGNoZG9nIHByb3ZpZGVkIGJ5IFhlbiBpbnN0
ZWFkPyBTbyB0aG9zZQ0KPj4+Pj4+IGNhbGwgd2lsbCBiZSB1c2VkIGJ5IFhlbi4NCj4+Pj4+DQo+
Pj4+PiBUaGF0IGlzIGluZGVlZCBhIHdhdGNoZG9nIFNJUCwgYW5kIGFsc28gZm9yIHNldHRpbmcg
dGhlIFNvQyANCj4+Pj4+IGludGVybmFsIFJUQw0KPj4+Pj4gaWYgaXQgaXMgYmVpbmcgdXNlZC4N
Cj4+Pj4+DQo+Pj4+PiBJIGxvb2tlZCBhcm91bmQgaWYgdGhlcmUgd2FzIHByZXZpb3VzIGRpc2N1
c3Npb24gYW5kIG9ubHkgcmVhbGx5DQo+Pj4+PiBmb3VuZCBbM10uDQo+Pj4+PiBJcyB0aGUgeGVu
L3hlbi9pbmNsdWRlL3dhdGNoZG9nLmggaGVhZGVyIG1lYW50IHRvIGJlIGZvciB0aGlzIGtpbmQg
b2YNCj4+Pj4+IHdhdGNoZG9nIHN1cHBvcnQgb3IgaXMgdGhhdCBtb3JlIGZvciB0aGUgVk0gd2F0
Y2hkb2c/IExvb2tpbmcgYXQgDQo+Pj4+PiB0aGUgeDg2DQo+Pj4+PiBBQ1BJIE5NSSB3YXRjaGRv
ZyBpdCBzZWVtcyBsaWtlIHRoZSBmb3JtZXIsIGJ1dCBJIGhhdmUgbmV2ZXIgd29ya2VkIA0KPj4+
Pj4gd2l0aA0KPj4+Pj4geDg2IG5vciBBQ1BJLg0KPj4+DQo+Pj4gaW5jbHVkZS93YXRjaGRvZy5o
IGNvbnRhaW5zIGhlbHBlciB0byBjb25maWd1cmUgdGhlIHdhdGNoZG9nIGZvciBYZW4uIFdlDQo+
Pj4gYWxzbyBoYXZlIHBlci1WTSB3YXRjaGRvZyBhbmQgdGhpcyBpcyBjb25maWd1cmVkIGJ5IHRo
ZSBoeXBlcmNhbGwNCj4+PiBTQ0hFRE9QX3dhdGNoZG9nLg0KPj4+DQo+Pj4+Pg0KPj4+Pj4gQ3Vy
cmVudGx5IGZvcndhcmRpbmcgaXQgdG8gRG9tMCBoYXMgbm90IGNhdXNlZCBhbnkgd2F0Y2hkb2cg
cmVzZXRzIA0KPj4+Pj4gd2l0aA0KPj4+Pj4gb3VyIHdhdGNoZG9nIHRpbWVvdXQgc2V0dGluZ3Ms
IG91ciBzcGVjaWZpYyBEb20wIHNldHVwIGFuZCBWTSBjb3VudC4NCj4+Pg0KPj4+IElJVUMsIHRo
ZSBTTUMgQVBJIGZvciB0aGUgd2F0Y2hkb2cgd291bGQgYmUgc2ltaWxhciB0byB0aGUgQUNQSSBO
TUkNCj4+PiB3YXRjaGRvZy4gU28gSSB0aGluayBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgaWYg
dGhpcyBpcyBub3QgZXhwb3NlZCB0bw0KPj4+IGRvbTAgKGV2ZW4gaWYgWGVuIGlzIGRvaW5nIG5v
dGhpbmcgd2l0aCBpdCkuDQo+Pj4NCj4+PiBDYW4geW91IHRyeSB0byBoaWRlIHRoZSBTTUNzIGFu
ZCBjaGVjayBpZiBkb20wIHN0aWxsIGJlaGF2ZSBwcm9wZXJseT8NCj4+Pg0KPj4+IENoZWVycywN
Cj4+Pg0KPj4NCj4+IFRoaXMgU01DIG1hbmFnZXMgYSBoYXJkd2FyZSB3YXRjaGRvZywgaWYgaXQn
cyBub3QgcGluZ2VkIHdpdGhpbiBhDQo+PiBzcGVjaWZpYyBpbnRlcnZhbCB0aGUgZW50aXJlIGJv
YXJkIHJlc2V0cy4NCj4gDQo+IERvIHlvdSBrbm93IHdoYXQncyB0aGUgZGVmYXVsdCBpbnRlcnZh
bD8gSXMgaXQgbGFyZ2UgZW5vdWdoIHNvIFhlbiArIA0KPiBkb20wIGNhbiBib290IChhdCBsZWFz
dCB1cCB0byB3aGVuIHRoZSB3YXRjaGRvZyBkcml2ZXIgaXMgaW5pdGlhbGl6ZWQpPw0KPiANCj4+
DQo+PiBJZiBJIGJsb2NrIHRoZSBTTUNzIHRoZSB3YXRjaGRvZyBkcml2ZXIgaW4gRG9tMCB3aWxs
IGZhaWwgdG8gcGluZyB0aGUNCj4+IHdhdGNoZG9nLCB0cmlnZ2VyaW5nIGEgYm9hcmQgcmVzZXQg
YmVjYXVzZSB0aGUgc3lzdGVtIGxvb2tzIHRvIGhhdmUNCj4+IGJlY29tZSB1bnJlc3BvbnNpdmUu
IFRoZSByZWFzb24gdGhpcyBwYXRjaCBzZXQgc3RhcnRlZCBpcyBiZWNhdXNlIHdlDQo+PiBjb3Vs
ZG4ndCBwaW5nIHRoZSB3YXRjaGRvZyB3aGVuIHJ1bm5pbmcgd2l0aCBYZW4uDQo+Pg0KPj4gSW4g
b3VyIHNwZWNpZmljIHN5c3RlbSB0aGUgYm9vdGxvYWRlciBlbmFibGVzIHRoZSB3YXRjaGRvZyBh
cyBlYXJseSBhcw0KPj4gcG9zc2libGUgc28gdGhhdCB3ZSBjYW4gZ2V0IHdhdGNoZG9nIHByb3Rl
Y3Rpb24gZm9yIGFzIG11Y2ggb2YgdGhlIGJvb3QNCj4+IGFzIHdlIHBvc3NpYmx5IGNhbi4NCj4+
DQo+PiBTbywgaWYgd2UgYXJlIHRvIGJsb2NrIHRoZSBTTUMgZnJvbSBEb20wLCB0aGVuIFhlbiBu
ZWVkcyB0byB0YWtlIG92ZXINCj4+IHRoZSBwaW5naW5nLiBJdCBjb3VsZCBiZSBpbXBsZW1lbnRl
ZCBzaW1pbGFybHkgdG8gdGhlIE5NSSB3YXRjaGRvZywNCj4+IGV4Y2VwdCB0aGF0IHRoZSBzeXN0
ZW0gd2lsbCByZXNldCBpZiB0aGUgcGluZyBpcyBtaXNzZWQgcmF0aGVyIHRoYW4NCj4+IGJhY2t0
cmFjZS4NCj4+IEl0IHdvdWxkIGFsc28gbWVhbiB0aGF0IFhlbiB3aWxsIGdldCBhIHdob2xlIHdh
dGNoZG9nIGRyaXZlci1jYXRlZ29yeQ0KPj4gZHVlIHRvIHRoZSB3YXRjaGRvZyBiZWluZyB2ZW5k
b3IgYW5kIHNvbWV0aW1lcyBldmVuIFNvQyBzcGVjaWZpYyB3aGVuIGl0DQo+PiBjb21lcyB0byBB
cm0uDQo+Pg0KPj4gTXkgdW5kZXJzdGFuZGluZyBvZiB0aGUgZG9tYWluIHdhdGNoZG9nIGNvZGUg
aXMgdGhhdCB0b2RheSB0aGUgZG9tYWluDQo+PiBuZWVkcyB0byBjYWxsIFNDSEVET1Bfd2F0Y2hk
b2cgYXQgbGVhc3Qgb25jZSB0byBzdGFydCB0aGUgd2F0Y2hkb2cNCj4+IHRpbWVyLiBTaW5jZSB3
YXRjaGRvZyBwcm90ZWN0aW9uIHRocm91Z2ggdGhlIHdob2xlIGJvb3QgcHJvY2VzcyBpcw0KPj4g
ZGVzaXJhYmxlIHdlJ2QgbmVlZCBzb21lIGNvcmUgY2hhbmdlcywgc3VjaCBhcyBhbiBvcHRpb24g
dG8gc3RhcnQgdGhlDQo+PiBkb21haW4gd2F0Y2hkb2cgb24gaW5pdC4gPg0KPj4gSXQncyBxdWl0
ZSBhIGJpZyBjaGFuZ2UgdG8gbWFrZQ0KPiANCj4gRm9yIGNsYXJpZmljYXRpb24sIGFib3ZlIHlv
dSBzZWVtIHRvIG1lbnRpb24gdHdvIGNoYW5nZXM6DQo+IA0KPiAgwqAxKSBBbGxvdyBYZW4gdG8g
dXNlIHRoZSBIVyB3YXRjaGRvZw0KPiAgwqAyKSBBbGxvdyB0aGUgZG9tYWluIHRvIHVzZSB0aGUg
d2F0Y2hkb2cgZWFybHkNCj4gDQo+IEkgYW0gYXNzdW1pbmcgYnkgYmlnIGNoYW5nZSwgeW91IGFy
ZSByZWZlcnJpbmcgdG8gMj8NCg0KQm90aCBvZiB0aGVtLiBJJ20gZXhwZWN0aW5nIHRoZSBhZGRp
dGlvbiBvZiBhIG5ldyBkcml2ZXIgY2F0ZWdvcnkgDQooaGFyZHdhcmUgd2F0Y2hkb2cpIHRvIGJl
IGEgZGVjZW50IGFtb3VudCBvZiB3b3JrIGFzIHdlbGwuDQo+IA0KPiAsIHdoaWxlIEkgYW0gbm90
IGFnYWluc3QgZG9pbmcgaXQgaWYgaXQNCj4+IG1ha2VzIHNlbnNlLCBJIG5vdyB3b25kZXIgaWYg
WGVuIHNob3VsZCBtYW5hZ2UgaGFyZHdhcmUgd2F0Y2hkb2dzLg0KPj4gTG9va2luZyBhdCB0aGUg
ZG9tYWluIHdhdGNoZG9nIGNvZGUgaXQgbG9va3MgbGlrZSBpZiBhIGRvbWFpbiBkb2VzIG5vdA0K
Pj4gZ2V0IGVub3VnaCBleGVjdXRpb24gdGltZSwgdGhlIHdhdGNoZG9nIHdpbGwgbm90IGJlIHBp
bmdlZCBlbm91Z2ggYW5kDQo+PiB0aGUgZ3Vlc3Qgd2lsbCBiZSByZXNldC4gU28gZWl0aGVyIHdh
dGNoZG9nIGFwcHJvYWNoIHJlcXVpcmVzIERvbTAgdG8NCj4+IGdldCBleGVjdXRpb24gdGltZS4g
RG9tMCBhbHNvIG5lZWRzIHRvIHNlcnZpY2UgYWxsIHRoZSBQViBiYWNrZW5kcyBpdCdzDQo+PiBy
ZXNwb25zaWJsZSBmb3IuIEknbSBub3Qgc3VyZSBpdCdzIHZhbHVhYmxlIHRvIGFkZCBhbm90aGVy
IGxheWVyIG9mDQo+PiB3YXRjaGRvZyBmb3IgdGhpcyBzY2VuYXJpbyBhcyB0aGUgZW5kIHJlc3Vs
dCAoY2hlY2tpbmcgdGhhdCB0aGUgZW50aXJlDQo+PiBzeXN0ZW0gd29ya3MpIGlzIGFjaGlldmVk
IHdpdGhvdXQgaXQgYXMgd2VsbC4NCj4+DQo+PiBTbywgYmVmb3JlIEkgdHJ5IHRvIGZpbmQgdGhl
IHRpbWUgdG8gbWFrZSBhIHByb3Bvc2FsIGZvciBtb3ZpbmcgdGhlDQo+PiBoYXJkd2FyZSB3YXRj
aGRvZyBiaXQgdG8gWGVuLCBkbyB3ZSByZWFsbHkgd2FudCBpdD8NCj4gDQo+IFRoYW5rcyBmb3Ig
dGhlIGRldGFpbHMuIEdpdmVuIHRoYXQgdGhlIHdhdGNoZG9nIGlzIGVuYWJsZWQgYnkgdGhlIA0K
PiBib290bG9hZGVyLCBJIHRoaW5rIHdlIHdhbnQgWGVuIHRvIGRyaXZlIHRoZSB3YXRjaGRvZyBm
b3IgdHdvIHJlYXNvbnM6DQo+ICDCoDEpIEluIHRydWUgZG9tMGxlc3MgZW52aXJvbm1lbnQsIGRv
bTAgd291bGQgbm90IGV4aXN0DQo+ICDCoDIpIFlvdSBhcmUgcmVseWluZyBvbiBYZW4gKyBEb20w
IHRvIGJvb3QgKG9yIGF0IGxlYXN0IGVub3VnaCB0byBnZXQgDQo+IHRoZSB3YXRjaGRvZyB3b3Jr
aW5nKSB3aXRoaW4gdGhlIHdhdGNoZG9nIGludGVydmFsLg0KPiANCj4gTGV0IHNlZSB3aGF0IHRo
ZSBvdGhlciBBcm0gbWFpbnRhaW5lciB0aGlua3MuDQo+IA0KDQpSZWdhcmRzIC8vIEpvaG4gRXJu
YmVyZw==


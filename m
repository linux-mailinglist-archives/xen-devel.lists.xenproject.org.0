Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA487377E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 14:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689130.1074155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhr5W-0000kq-4D; Wed, 06 Mar 2024 13:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689130.1074155; Wed, 06 Mar 2024 13:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhr5W-0000hw-0i; Wed, 06 Mar 2024 13:13:38 +0000
Received: by outflank-mailman (input) for mailman id 689130;
 Wed, 06 Mar 2024 13:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/obO=KM=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rhr5V-0008Pj-0K
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 13:13:37 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 573eb6eb-dbbb-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 14:13:36 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 14:13:36 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Wed, 6 Mar 2024 14:13:36 +0100
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
X-Inumbo-ID: 573eb6eb-dbbb-11ee-afda-a90da7624cb6
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Peng Fan <peng.fan@nxp.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
CC: Jonas Blixt <jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDzxxsAgAA1KwCAAVx5AIAAQjeAgAEdtQCAAyp5AIABm3uAgAZ8E4CAKNxDgA==
Date: Wed, 6 Mar 2024 13:13:35 +0000
Message-ID: <911ec1bb-3733-4f37-839e-673a88e408ff@actia.se>
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
In-Reply-To: <08ae764c-3490-4dd1-ab70-7a855a98d16d@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2921D72955627162
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D6D0E34F6FE1C49B06607BD1330CBAE@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgSnVsaWVuLA0KDQpPbiAyLzkvMjQgMTQ6MTQsIEpvaG4gRXJuYmVyZyB3cm90ZToNCj4gSGkg
SnVsaWVuLA0KPiANCj4gQXBvbG9naWVzIGZvciB0aGUgZGVsYXksIEkgd2FzIHB1bGxlZCBhd2F5
IGZvciBhIGJpdC4NCj4gDQo+IE9uIDIvNS8yNCAxMToxMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0K
Pj4gSGksDQo+Pg0KPj4gT24gMDQvMDIvMjAyNCAwOTo0MCwgUGVuZyBGYW4gd3JvdGU6DQo+Pj4N
Cj4+Pg0KPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+PiBGcm9tOiBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPj4+PiBTZW50OiAyMDI05bm0MuaciDLml6UgMTc6MjAN
Cj4+Pj4gVG86IEpvaG4gRXJuYmVyZyA8am9obi5lcm5iZXJnQGFjdGlhLnNlPjsgU3RlZmFubyBT
dGFiZWxsaW5pDQo+Pj4+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPjsNCj4+Pj4gTWljaGFsIE9yemVsIDxtaWNoYWwu
b3J6ZWxAYW1kLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+Pj4+IDxWb2xvZHlteXJfQmFiY2h1
a0BlcGFtLmNvbT47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPj4+PiBDYzogSm9uYXMg
QmxpeHQgPGpvbmFzLmJsaXh0QGFjdGlhLnNlPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSB4ZW4vYXJtOiBBZGQgaW14OHF7bSx4
fSBwbGF0Zm9ybSBnbHVlDQo+Pj4+DQo+Pj4+IE9uIDAxLzAyLzIwMjQgMTY6MTcsIEpvaG4gRXJu
YmVyZyB3cm90ZToNCj4+Pj4+IE9uIDIvMS8yNCAxMzoyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0K
Pj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+PiBPbiAzMS8wMS8yMDI0IDE1OjMyLCBKb2huIEVybmJlcmcg
d3JvdGU6DQo+Pj4+Pj4+IEhpIEp1bGllbiwNCj4+Pj4+Pg0KPj4+Pj4+IEhpIEpvaG4sDQo+Pj4+
Pj4NCj4+Pj4+Pj4gT24gMS8zMS8yNCAxMzoyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4+
Pj4gSGksDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gT24gMzEvMDEvMjAyNCAxMTo1MCwgSm9obiBFcm5i
ZXJnIHdyb3RlOg0KPiBbIC4uLiBdDQo+Pj4+Pj4NCj4+Pj4+Pj4+IEJ1dCBldmVuIGlmIHdlIHJl
c3RyaWN0IHRvIGRvbTAsIGhhdmUgeW91IGNoZWNrZWQgdGhhdCBub25lIG9mIHRoZQ0KPj4+Pj4+
Pj4gU01DcyB1c2UgYnVmZmVycz8NCj4+Pj4+Pj4gSSBoYXZlbid0IGZvdW5kIGFueSBzdWNoIGlu
c3RhbmNlcyBpbiB0aGUgTGludXgga2VybmVsIHdoZXJlIGENCj4+Pj4+Pj4gYnVmZmVyIGlzIHVz
ZWQuIEFkZGluZyBhIGNhbGwgZmlsdGVyaW5nIGxpa2Ugc3VnZ2VzdGVkIGJlbG93DQo+Pj4+Pj4+
IGFkZGl0aW9ucyBvZiBzdWNoIGZ1bmN0aW9ucyBjYW4gYmUgZGlzY292ZXJlZCBhbmQgYWRhcHRl
ZCBmb3IgaWYgDQo+Pj4+Pj4+IHRoZXkNCj4+Pj4gd291bGQgc2hvdyB1cCBsYXRlci4NCj4+Pj4+
Pj4+DQo+Pj4+Pj4+PiBSYXRoZXIgdGhhbiBwcm92aWRpbmcgYSBibGFua2V0IGZvcndhcmQsIHRv
IG1lIGl0IHNvdW5kcyBtb3JlIGxpa2UNCj4+Pj4+Pj4+IHlvdSB3YW50IHRvIHByb3ZpZGUgYW4g
YWxsb3dsaXN0IG9mIHRoZSBTTUNzLiBUaGlzIGlzIG1vcmUNCj4+Pj4+Pj4+IGZ1dHVyZXByb29m
IGFuZCBhdm9pZCB0aGUgcmlzayB0byBleHBvc2UgdW5zYWZlIFNNQ3MgdG8gYW55IGRvbWFpbi4N
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBGb3IgYW4gZXhhbXBsZSwgeW91IGNhbiBoYXZlIGEgbG9vayBh
dCB0aGUgRUVNSSBtZWRpYXRvciBmb3IgDQo+Pj4+Pj4+PiBYaWxpbnguDQo+Pj4+Pj4+DQo+Pj4+
Pj4+IEFjay4gRG8geW91IHByZWZlciB0byBzZWUgb25seSBvbiBTTUNDQyBzZXJ2aWNlIGxldmVs
IG9yIGFsc28gb24NCj4+Pj4+Pj4gZnVuY3Rpb24gbGV2ZWw/IChhMSByZWdpc3RlciwgcGVyIGRl
c2NyaXB0aW9uIGVhcmxpZXIpDQo+Pj4+Pj4NCj4+Pj4+PiBJIGFtIG5vdCBzdXJlLiBJdCB3aWxs
IGRlcGVuZCBvbiB3aGV0aGVyIGl0IGlzIGNvcnJlY3QgdG8gZXhwb3NlDQo+Pj4+Pj4gKmFsbCog
dGhlIGZ1bmN0aW9ucyB3aXRoaW4gYSBzZXJ2aWNlIGxldmVsIGFuZCB0aGV5IGhhdmUgdGhlIHNh
bWUgDQo+Pj4+Pj4gZm9ybWF0Lg0KPj4+Pj4+DQo+Pj4+Pj4gSWYgeW91IGNhbid0IGd1YXJhbnRl
ZSB0aGF0LCB0aGVuIHlvdSB3aWxsIG1vc3QgbGlrZWx5IG5lZWQgdG8NCj4+Pj4+PiBhbGxvd2xp
c3QgYXQgdGhlIGZ1bmN0aW9uIGxldmVsLg0KPj4+Pj4+DQo+Pj4+Pj4gQWxzbywgZG8geW91IGhh
dmUgYSBzcGVjIGluIGhhbmQgdGhhdCB3b3VsZCBoZWxwIHRvIHVuZGVyc3RhbmQgd2hpY2gNCj4+
Pj4+PiBzZXJ2aWNlL2Z1bmN0aW9uIGlzIGltcGxlbWVudGVkIHZpYSB0aG9zZSBTTUNzPw0KPj4+
Pj4NCj4+Pj4+IEkgZG9uJ3QgaGF2ZSB0aGUgc3BlYyB1bmZvcnR1bmF0ZWx5LCBidXQgSSB3aWxs
IGFkZCBhIGZpbHRlciBvbiBib3RoDQo+Pj4+PiBzZXJ2aWNlIGFuZCBmdW5jdGlvbiBmb3IgVjIg
YW5kIHdlJ2xsIHRha2UgaXQgZnJvbSB0aGVyZS4NCj4+Pj4NCj4+Pj4gQFBlbmcsIGRvIHlvdSBo
YXZlIGFueSBzcGVjaWZpY2F0aW9uIHlvdSBjb3VsZCBzaGFyZT8gSG93IHN0YWJsZSBpcyB0aGUN
Cj4+Pj4gaW50ZXJmYWNlPw0KPj4+DQo+Pj4gTm8gc3BlY2lmaWNhdGlvbiwgdGhlIHVzZSBpcyBJ
TVhfU0lQX1ggaW4gbGludXgga2VybmVsIHNvdXJjZS4NCj4+Pg0KPj4+IFN1Y2ggYXMgSU1YX1NJ
UF9SVEMsIElNWF9TSVBfVElNRVINCj4+Pg0KPj4+IEl0IGlzIHN0YWJsZSBhbmQgbm8gY2hhbmdl
LCB3ZSBvbmx5IGFkZCBuZXcgU0lQIG1hY3JvIGlmIG5lZWRlZA0KPj4+IGFuZCBubyBjaGFuZ2Ug
dGhlIG1lYW5pbmcgb3IgcmV1c2Ugb2xkIFNJUC4NCj4+DQo+PiBUaGFua3MgZm9yIHRoZSBhbnN3
ZXIuIEl0IGlzIGEgYml0IHVuZm9ydHVuYXRlIHRoZXJlIGFyZSBubyANCj4+IHNwZWNpZmljYXRp
b24sIGJ1dCBhdCBsZWFzdCB0aGV5IGFyZSBzdGFibGUuDQo+Pg0KPj4gSSBoYXZlIHNlYXJjaGVk
IElNWF9TSVAgaW4gTGludXgsIHRoZXJlIGRvZXNuJ3Qgc2VlbSBtYW55IHNvIHdlIGNvdWxkIA0K
Pj4gYWxsb3dsaXN0IHRoZW0gKHNlZSBtb3JlIGJlbG93KS4gRG8geW91IGtub3cgaWYgdGhlcmUg
YXJlIG1vcmUgDQo+PiBuZWNlc3NhcnkgdGhhdCBhcmUgbm90IHlldCB1cHN0cmVhbWVkIGluIExp
bnV4Pw0KPiANCj4gSSB0b29rIGEgZGl2ZSBpbnRvIGJvdGggdXBzdHJlYW0ga2VybmVsIGFuZCB0
aGUgdmVuZG9yIHRyZWUgYW5kIGZvdW5kIA0KPiB0aGUgZm9sbG93aW5nIGxpc3QgYW5kIGZvciB3
aGljaCBTb0NzIHRoZXkgYXJlIGFwcGxpY2FibGUgKFBsZWFzZSANCj4gY29ycmVjdCBtZSBpZiB5
b3UgY2FuIFBlbmcpDQo+IA0KPiAweDgyMDAwMDA2IElNWF9TSVBfQlVTRlJFUV9DSEFOR0UgW3Vu
c3VyZSwgcHJvYmFibHkgbm90IGlteDhdDQo+IDB4QzIwMDAwMDAgSU1YX1NJUF9HUEMgW29ubHkg
aW14OG0gc2VyaWVzXQ0KPiAweEMyMDAwMDAxIElNWF9TSVBfQ1BVRlJFUSBbb25seSBpbXg4cXt4
LG19IHNlcmllc10NCj4gMHhDMjAwMDAwMiBJTVhfU0lQX1NSVEMgLyBJTVhfU0lQX1RJTUVSIFtv
bmx5IGlteDhxe3gsbX0gc2VyaWVzXQ0KPiAweEMyMDAwMDA0IElNWF9TSVBfRERSX0RWRlMgW29u
bHkgaW14OG0gc2VyaWVzXQ0KPiAweEMyMDAwMDA1IElNWF9TSVBfUlBST0MgLyBJTVhfU0lQX1NS
QyBbb25seSBpbXg4bSBzZXJpZXNdDQo+IDB4QzIwMDAwMDYgSU1YX1NJUF9HRVRfU09DX0lORk8g
W29ubHkgaW14OG0gc2VyaWVzXQ0KPiAweEMyMDAwMDA4IElNWF9TSVBfTk9DIFtvbmx5IGlteDht
IHNlcmllc10NCj4gMHhDMjAwMDAwOSBJTVhfU0lQX1dBS0VVUF9TUkMgW29ubHkgaW14OHF7eCxt
fSBzZXJpZXNdDQo+IDB4QzIwMDAwMEIgSU1YX1NJUF9PVFBfV1JJVEUgW29ubHkgaW14OHF7eCxt
fSBzZXJpZXNdDQo+Pg0KPj4NCg0KWyAuLi4gXQ0KDQo+IA0KPj4gwqDCoCAqIElNWF9TSVBfVElN
RVJfKjrCoCBUaGlzIHNlZW1zIHRvIGJlIHJlbGF0ZWQgdG8gdGhlIHdhdGNoZG9nLiANCj4+IFNo
b3VsZG4ndCBkb20wIHJlbHkgb24gdGhlIHdhdGNoZG9nIHByb3ZpZGVkIGJ5IFhlbiBpbnN0ZWFk
PyBTbyB0aG9zZSANCj4+IGNhbGwgd2lsbCBiZSB1c2VkIGJ5IFhlbi4NCj4gDQo+IFRoYXQgaXMg
aW5kZWVkIGEgd2F0Y2hkb2cgU0lQLCBhbmQgYWxzbyBmb3Igc2V0dGluZyB0aGUgU29DIGludGVy
bmFsIFJUQw0KPiBpZiBpdCBpcyBiZWluZyB1c2VkLg0KPiANCj4gSSBsb29rZWQgYXJvdW5kIGlm
IHRoZXJlIHdhcyBwcmV2aW91cyBkaXNjdXNzaW9uIGFuZCBvbmx5IHJlYWxseSBmb3VuZCBbM10u
DQo+IElzIHRoZSB4ZW4veGVuL2luY2x1ZGUvd2F0Y2hkb2cuaCBoZWFkZXIgbWVhbnQgdG8gYmUg
Zm9yIHRoaXMga2luZCBvZiANCj4gd2F0Y2hkb2cgc3VwcG9ydCBvciBpcyB0aGF0IG1vcmUgZm9y
IHRoZSBWTSB3YXRjaGRvZz8gTG9va2luZyBhdCB0aGUgeDg2IA0KPiBBQ1BJIE5NSSB3YXRjaGRv
ZyBpdCBzZWVtcyBsaWtlIHRoZSBmb3JtZXIsIGJ1dCBJIGhhdmUgbmV2ZXIgd29ya2VkIHdpdGgg
DQo+IHg4NiBub3IgQUNQSS4NCj4gDQo+IEN1cnJlbnRseSBmb3J3YXJkaW5nIGl0IHRvIERvbTAg
aGFzIG5vdCBjYXVzZWQgYW55IHdhdGNoZG9nIHJlc2V0cyB3aXRoIA0KPiBvdXIgd2F0Y2hkb2cg
dGltZW91dCBzZXR0aW5ncywgb3VyIHNwZWNpZmljIERvbTAgc2V0dXAgYW5kIFZNIGNvdW50Lg0K
PiANCj4gRm9yIHRoZSByZW1haW5pbmcgYml0czoNCj4gDQo+IFRoZSB3YWtldXAgc3JjIGlzIG5v
dCBpbiB0aGUgdXBzdHJlYW0ga2VybmVsIHlldCBhbmQgcmVsYXRlZCB0byBzeXN0ZW0gDQo+IHJl
c3VtZSBmcm9tIHN1c3BlbmQgd2hpY2ggaXNuJ3Qgc3VwcG9ydGVkIGluIFhlbiBvbiBBUk0geWV0
IC0gc28gdGhpcyB3ZSANCj4gY2FuIGJsb2NrIHNhZmVseS4NCj4gDQo+IFRoZSBPVFAgd3JpdGUg
aXMgZnVzZSBwcm9ncmFtbWluZyBpbiB0aGUgU29DIGZ1c2UgYmFua3MsIGFuZCBzaG91bGQgDQo+
IHByb2JhYmx5IGJlIGFsbG93ZWQgYnV0IHJlc2VydmVkIGZvciBEb20wLCBhcyB0aGlzIGNhbiBz
ZXQgZnVzZXMgdGhhdA0KPiBhZmZlY3RzIHRoZSBTb0MgYm9vdC4NCj4gDQo+Pg0KPj4gQWxzbywg
d2hhdCBoYXBwZW4gaWYgd2UgZG9uJ3QgZXhwb3NlIHRob3NlIFNNQyB0byBkb20wPw0KPj4NCj4+
IENoZWVycywNCj4+DQo+IA0KPiBbMV06IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4t
ZGV2ZWwvMTUxMDI0NzQyMS0yNDA5NC0xLWdpdC1zZW5kLWVtYWlsLW9sZWtzdHlzaEBnbWFpbC5j
b20vDQo+IFsyXTogDQo+IGh0dHBzOi8vd3d3LnNsaWRlc2hhcmUubmV0L3hlbl9jb21fbWdyL3hw
ZGRzMTgtY3B1ZnJlcS1pbi14ZW4tb24tYXJtLW9sZWtzYW5kci10eXNoY2hlbmtvLWVwYW0tc3lz
dGVtcw0KPiBbM106IGh0dHBzOi8veGVuLXVzZXJzLm5hcmtpdmUuY29tL0lTWG5sbUIwL3dhdGNo
ZG9nLXN1cHBvcnQtaW4teGVuDQo+IA0KPiBUaGFua3MhIC8vIEpvaG4gRXJuYmVyZw0KDQpQaW5n
IG9uIHRoZSB3YXRjaGRvZyBkaXNjdXNzaW9uIGJpdHMuDQoNClRoYW5rcyEgLy8gSm9obiBFcm5i
ZXJn


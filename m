Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D540D8A4D7C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 13:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706051.1103074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwKL6-0005d9-UY; Mon, 15 Apr 2024 11:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706051.1103074; Mon, 15 Apr 2024 11:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwKL6-0005Zw-Ri; Mon, 15 Apr 2024 11:17:32 +0000
Received: by outflank-mailman (input) for mailman id 706051;
 Mon, 15 Apr 2024 11:17:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4O8H=LU=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rwKL5-0005Ya-P5
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 11:17:31 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf11e384-fb19-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 13:17:29 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 15 Apr
 2024 13:17:28 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Mon, 15 Apr 2024 13:17:28 +0200
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
X-Inumbo-ID: bf11e384-fb19-11ee-94a3-07e782e9044d
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "conduct@xenproject.org"
	<conduct@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Peng
 Fan" <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
Subject: Re: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaic9tXQJwwldfJUm8+1aRDWuvfLFpCWMAgAAGzoCAAAPWgIAAA9GA
Date: Mon, 15 Apr 2024 11:17:28 +0000
Message-ID: <e3785d8a-9b16-4b74-9453-b0166bdbb171@actia.se>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-2-john.ernberg@actia.se>
 <084b9ed5-1585-4802-b504-6ccd2f262542@xen.org>
 <69dcd768-74b8-4033-8ab3-77848d6774dc@citrix.com>
 <4b39f4fa-246d-479e-ab76-ff234b641703@xen.org>
In-Reply-To: <4b39f4fa-246d-479e-ab76-ff234b641703@xen.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A29059A2F57647260
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6F2F1EA0A821243B20C1F8C4D10FFB6@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgSnVsaWVuLA0KDQpPbiA0LzE1LzI0IDE6MDMgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
DQo+IA0KPiBPbiAxNS8wNC8yMDI0IDExOjUwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24g
MTUvMDQvMjAyNCAxMToyNSBhbSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEpvaG4sDQo+
Pj4NCj4+PiBJIHNhdyB0aGlzIHBhdGNoIHdhcyBjb21taXR0ZWQuIEkgaGF2ZSBvbmUgcXVlc3Rp
b24gdGhpcyBtYXkgcmVxdWlyZQ0KPj4+IHNvbWUgYWRqdXN0bWVudC4NCj4+Pg0KPj4+IE9uIDA4
LzA0LzIwMjQgMTc6MTEsIEpvaG4gRXJuYmVyZyB3cm90ZToNCj4+Pj4gLS0tDQo+Pj4+IMKgwqAg
eGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZSB8wqDCoCAxICsNCj4+Pj4gwqDCoCB4ZW4v
YXJjaC9hcm0vcGxhdGZvcm1zL2lteDhxbS5jIHwgMTM5IA0KPj4+PiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgMTQwIGluc2VydGlv
bnMoKykNCj4+Pj4gwqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3BsYXRmb3Jt
cy9pbXg4cW0uYw0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jt
cy9NYWtlZmlsZQ0KPj4+PiBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvTWFrZWZpbGUNCj4+Pj4g
aW5kZXggODYzMmY0MTE1Zi4uYmVjNmU1NWQxZiAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gv
YXJtL3BsYXRmb3Jtcy9NYWtlZmlsZQ0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1z
L01ha2VmaWxlDQo+Pj4+IEBAIC05LDUgKzksNiBAQCBvYmotJChDT05GSUdfQUxMX1BMQVQpwqDC
oCArPSBzdW54aS5vDQo+Pj4+IMKgwqAgb2JqLSQoQ09ORklHX0FMTDY0X1BMQVQpICs9IHRodW5k
ZXJ4Lm8NCj4+Pj4gwqDCoCBvYmotJChDT05GSUdfQUxMNjRfUExBVCkgKz0geGdlbmUtc3Rvcm0u
bw0KPj4+PiDCoMKgIG9iai0kKENPTkZJR19BTEw2NF9QTEFUKSArPSBicmNtLXJhc3BiZXJyeS1w
aS5vDQo+Pj4+ICtvYmotJChDT05GSUdfQUxMNjRfUExBVCkgKz0gaW14OHFtLm8NCj4+Pj4gwqDC
oCBvYmotJChDT05GSUdfTVBTT0NfUExBVEZPUk0pwqAgKz0geGlsaW54LXp5bnFtcC5vDQo+Pj4+
IMKgwqAgb2JqLSQoQ09ORklHX01QU09DX1BMQVRGT1JNKcKgICs9IHhpbGlueC16eW5xbXAtZWVt
aS5vDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2lteDhxbS5jDQo+
Pj4+IGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPj4+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPj4+PiBpbmRleCAwMDAwMDAwMDAwLi4zNjAwYTA3M2U4DQo+Pj4+IC0tLSAvZGV2
L251bGwNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9pbXg4cW0uYw0KPj4+PiBA
QCAtMCwwICsxLDEzOSBAQA0KPj4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb3ItbGF0ZXIgKi8NCj4+Pg0KPj4+IFRoZSBtYWpvcml0eSBvZiBYZW4gY29kZSBpcyB1c2lu
ZyBHUEwtMi4wLW9ubHkuIEluIHRoZSBlYXJseSBkYXlzIGZvcg0KPj4+IFhlbiBvbiBBcm0gd2Ug
c3RhcnRlZCB0byB1c2UgR1BMdjIrIHdoaWNoIEkgY29uc2lkZXIgaXQgd2FzIGEgbWlzdGFrZS4N
Cj4+PiBVbmZvcnR1bmF0ZWx5IHRoaXMgc3RhcnRlZCB0byBzcHJlYWQgYXMgcGVvcGxlIGNvcGll
ZC9wYXN0ZWQgdGhlIHNhbWUNCj4+PiBjb3B5cmlnaHQgaGVhZGVycy4NCj4+Pg0KPj4+IFNvIGNh
biB5b3UgY29uZmlybSB3aGV0aGVyIHlvdSBpbnRlbmRlZCB0byB1c2UgR1BMLTIuMCs/IElmIG5v
dCB3b3VsZA0KPj4+IHlvdSBiZSBhYmxlIHRvIHNlbmQgYSBwYXRjaCB0byBhZGp1c3QgaXQ/IChC
ZXR0ZXIgdG8gaXQgYmVmb3JlIHRoZXJlDQo+Pj4gYXJlIG1vcmUgbW9kaWZpY2F0aW9ucykuDQo+
Pg0KPj4gSnVsaWVuOiBJJ3ZlIGNhbGxlZCB5b3Ugb3V0IG11bHRpcGxlIHRpbWVzIGJlZm9yZS4N
Cj4gDQo+IEFuZCB0aGVyZSBhcmUgbXVsdGlwbGUgdGhyZWFkIGV4cGxhaW5pbmcgd2h5IEkgYW0g
cmVxdWVzdGluZyBpZiB3ZSBjYW4gDQo+IHVzZSBHUEx2Mi1vbmx5LiBJbiBmYWN0IGZyb20gQ09O
VFJJQlVUSU5HOg0KPiANCj4gVGhlIHJlY29tbWVuZGVkIGxpY2Vuc2Ugb2YgYSBkaXJlY3Rvcnkg
d2lsbCBkZXBlbmQgb24gdGhlIENPUFlJTkcgZmlsZS4NCj4gSWYgdGhlIG5ldyBmaWxlIGlzIHVz
aW5nIGEgZGlmZmVyZW50IGxpY2Vuc2UsIHRoaXMgc2hvdWxkIGJlIGhpZ2hsaWdodGVkDQo+IGFu
ZCBkaXNjdXNzZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIG9yIGNvdmVyIGxldHRlciBpbnRyb2R1
Y2luZyB0aGUNCj4gZmlsZS4NCj4gDQoNClNpbmNlIHBhcnQgb2YgdGhlIGNvZGUgd2FzIG5vdCB3
cml0dGVuIGJ5IG1lLCBidXQgYnkgUGVuZywgSSB0aGluayBib3RoIA0Kb2YgdXMgbmVlZCB0byBh
Z3JlZSB0byBhIGxpY2Vuc2UgY2hhbmdlIGlmIG9uZSBpcyB0byBiZSBtYWRlLg0KDQpJIGFtIHBl
cnNvbmFsbHkgZmluZSB3aXRoIGVpdGhlciBsaWNlbnNlLg0KDQo+PiBEb24ndCBldmVyIGJ1bGx5
IGNvbnRyaWJ1dG9ycyBpbnRvIGNoYW5naW5nIGxpY2Vuc2luZy7CoCBJdCBpcw0KPj4gdW5hY2Nl
cHRhYmxlIGJlaGF2aW91ciwgYW5kIGluIG1vc3QgY2FzZXMgLSBpbmNsdWRpbmcgdGhpcyBvbmUg
YnkgdGhlDQo+PiBsb29rcyBvZiB0aGluZ3MgLSBub3QgbGVnYWwuDQo+IA0KPiBJIGRvbid0IHRo
aW5rIEkgaGF2ZSBidWxsaWVkIHRoZSBjb250cmlidXRvci4gSSBoYXZlIGFza2VkIHBvbGl0ZWx5
IA0KPiB3aGV0aGVyIGl0IGNhbiBiZSBkb25lLiBUaGVyZSBpcyBub3RoaW5nIGlsbGVnYWwgKHNl
ZSBhYm92ZSkuDQoNCkp1c3QgYWRkaW5nOiBJIGRpZCBub3QgZmVlbCBidWxsaWVkIGhlcmUuDQoN
Cj4gDQo+IFRoZSBwcm9ibGVtYXRpYyBiZWhhdmlvciBpcyB5b3UgdHJ5aW5nIHRvIHByZXNzdXJl
IHRoZSBvdGhlciBwZW9wbGUgdG8gDQo+IGFjY2VwdCB5b3VyIHBvaW50IG9mIHZpZXcgYnkgYmVl
biBjb25kZXNjZW5kaW5nIG9yIGluc3VsdGluZyB0aGVtIGxpa2UgDQo+IHlvdSBkaWQgaGVyZS4N
Cj4gDQo+IEkgaGF2ZSByZXBvcnRlZCB0aGlzIGJlaGF2aW9yIHNldmVyYWwgdGltZXMgdG8gQ29D
LiBBbmQgSSBndWVzcyB0aGlzIA0KPiBuZWVkIHRvIGhhcHBlbiBhZ2Fpbi4NCj4gDQo+IENoZWVy
cywNCj4gDQoNCkJlc3QgcmVnYXJkcyAvLyBKb2huIEVybmJlcmc=


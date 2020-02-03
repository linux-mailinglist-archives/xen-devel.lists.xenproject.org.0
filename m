Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB18150207
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 08:40:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyWHk-0006a0-VF; Mon, 03 Feb 2020 07:36:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S7Gb=3X=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1iyWHj-0006Zv-8K
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 07:36:43 +0000
X-Inumbo-ID: eb54bbfc-4657-11ea-8e33-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb54bbfc-4657-11ea-8e33-12813bfff9fa;
 Mon, 03 Feb 2020 07:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5lru2CSBX/D2mLjjMai4Z9pIfj3KknniShiISLXNRujwnVTRgMRZhcy5bdyaycJCrY31uusSTvqVUe8GTrS3/urXNAzxB0blkLWbKVrMnybF+bS2hOhaMr7tZ1S1lWY8woz1l1wuEMSvlRCI/xUNTJz+1lu31TdQdgv0rNxAqZ6bPEnyExPKa1W1+yL+JKjyxqHEiQuguCggRUYxUINOR2wQqT3quDGlBmkEajSvFERYyF+/X9tz9Ohhfd/1/CJIgMu0JZ6ET8V1MrG/ndaR4kAR5kzUaKhx1mWsnQC03tawm9VBpu1qeSArYDoiHpzXfxKmaSSKdvOO6xq0Nj+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wceMrtz3f517Ix2bc5Omh2JGiaaJTyJEqsFPB9iJJzg=;
 b=iL/Q6C2CpNki5A3Z4QrFdwgndJq+BcNdfhCjeAzsg3eUZKNcwusQJ49p+IyT3isHWiNcxOiTcxumjgbVMnddJqo+om0pUo4uDOSUvemRVl3jpmrABjEmBCbUZoLkq1v1tNkZcmNNTw2gG9Cw53AsOcB3VZWkuj+QS7JBXWYqTMB79oPWUFaBflg7+WctFEfwgCaAAj2k3hsDuiORxNnTW+OU+QUzG5McH0Gcg42F9c0gVtrrNhrMy+25H4WcAiAs50mrmYwv2qkh9Sf7auVfJDDPdYNHinyjtScvd06mlqyFvf40W1Y26bBcSgYbLH1bTHaSRdcBvnjtwuSjWXlKkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wceMrtz3f517Ix2bc5Omh2JGiaaJTyJEqsFPB9iJJzg=;
 b=O0gwNNHebf8ax8X/v3YerPMlkODolKNmki1d9xEM2tjiKk653PTvRF2wT2v4+djuoEMYc5p1CMKRTeMMtmj6ViehK+NsdNq/uwLj90r2QWCYsVlG5yDZXLC3XhK8VdP3kEuzjAL/O5okEaHuMZPlsSV+nvGLpi+Dk5RfuAoXLZU=
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com (20.177.41.82) by
 AM0PR03MB4931.eurprd03.prod.outlook.com (20.178.21.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Mon, 3 Feb 2020 07:36:40 +0000
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59]) by AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59%4]) with mapi id 15.20.2686.031; Mon, 3 Feb 2020
 07:36:39 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Santucco <santucco@mail.ru>
Thread-Topic: [Xen-devel] PV DRM doesn't work without auto_translated_physmap
 feature in Dom0
Thread-Index: AQHV2mSrTsRoqTZx/kKKOqyRgvyg1Q==
Date: Mon, 3 Feb 2020 07:36:38 +0000
Message-ID: <68a8131b-aed5-2c72-19ca-89a7c02c40dd@epam.com>
References: <1578297407.255542354@f149.i.mail.ru>
 <1578497907.395464209@f311.i.mail.ru>
 <37b9ee58-9fe6-30cd-cc26-383d13cfa5a5@epam.com>
 <1580567975.670485508@f344.i.mail.ru>
In-Reply-To: <1580567975.670485508@f344.i.mail.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26b0c924-cd2e-4b7c-9d1a-08d7a87bce81
x-ms-traffictypediagnostic: AM0PR03MB4931:
x-microsoft-antispam-prvs: <AM0PR03MB49313E61564EB332E275C17BE7000@AM0PR03MB4931.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0302D4F392
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(189003)(199004)(66556008)(53546011)(66476007)(66446008)(64756008)(186003)(31686004)(66574012)(66946007)(31696002)(71200400001)(4326008)(5660300002)(26005)(36756003)(6486002)(478600001)(55236004)(966005)(8676002)(81166006)(76116006)(81156014)(91956017)(6916009)(2906002)(2616005)(8936002)(6506007)(316002)(6512007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4931;
 H:AM0PR03MB4516.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: glYLRLFb4ncbRKKQKCrVp/YszBCZHyLBBn3Cxyu0x1u9YeIl19qaxG5Q19Eb4+PoamK4Nqd5sk0K/VfI8nj+6XlbnQ/AUQbfVmmOuR8rSZ4QQrnCAQrneORWkZgiqAZta9WEffusjhfaHHcDy45+vN2S2hZGJRGLfzyNcGQBVzdHK7XX6cJz3+QR4oThLIzQYfqvU3nMKZRXxmZzMWr4XVIsdXSVbjqGCiLYTmbAl3GDuc4013vzntXNYzRf3Zo20NCm+n3IHQdqFubldxRtk7/i0LszjH9WBdPmXAm/IO9SnPBebiI0uhQj+j09d15lRQn4Q2v6xO2cUT/6t6dH5i7dJ/NU0v/dzOWvbsia30IzmK+r3s0twy0MmA3kDCx3B58ezngSwsZhxh06mFwWctRh93SfR2HFbrWG98UVEtuSCaj7p/uKAO2ldI5/SRPd/7/B4U3NJ8s/NL3xTLHtv+svRv732m9mdAskd1MUID8VYbg71sYg54KNUCYRM0k0MWeC9tNWtqJpZOy67X780Q==
x-ms-exchange-antispam-messagedata: SmPA+cXLFoxYhYVS1iWbM52TGF3kP4d8q66CWSW8521vMDOUdHLEetJk+mrg9XRx72hE7WS5Tglf3tnmBtDgGsYYNaQ5kw66GUy+Ml2XwV20MhgrpunuTJlVz2hU0mLJPeEGXjG0QIsaTdnB4X9V5g==
x-ms-exchange-transport-forked: True
Content-ID: <4B6664E0DE68E44BA30330512D0FA935@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b0c924-cd2e-4b7c-9d1a-08d7a87bce81
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2020 07:36:39.4439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dMvMRp3DS4mtFfUQQHkqw/fnG727zqdwiI7M+hjaPJoS8n9pWNyHKLWiaSbbw6hTJYIjBmUF52d+wwGPcUwbtp8n32y14+x35ku3phrM9HN8AwnvwYg6Q9468VHBnszW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4931
Subject: Re: [Xen-devel] PV DRM doesn't work without auto_translated_physmap
 feature in Dom0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIvMS8yMCA0OjM5IFBNLCBTYW50dWNjbyB3cm90ZToNCj4gSGVsbG8gYWdhaW4sDQo+
IEkgaGF2ZSBub3QgeWV0IG1hZGUgdG8gd29yayBteSBkcm0gY2xpZW50LCBzbyBJIGhhdmUgdHJp
ZWQgdG8gcnVuIA0KPiBsaW51eCBsaWtlIGEgZG9tVcKgKHRvIHNlZSBob3cgaXQgc2hvdWxkIHdv
cmspLCBpdCBkb2VzbuKAmXQgd29yayB0b28gDQo+IOKAlMKgZGlzcGxfYmUgY2F0Y2hlcyBTSUdT
RUdWOg0KPg0KPiAjMCDCoDB4MDAwMDdmNGFmZWQxYzE2MSBpbiA/PyAoKSBmcm9tIC9saWI2NC9s
aWJjLnNvLjYNCj4gIzEgwqAweDAwMDA1NTcyM2I5YzViZWMgaW4gRHJtOjpEdW1iRHJtOjpjb3B5
ICh0aGlzPTB4N2Y0YWRjMDAwZTAwKSBhdCANCj4gL2hvbWUvc2FudHVjY28vdG1wL3hlbi10cm9v
cHMvZGlzcGxfYmUvc3JjL2Rpc3BsYXlCYWNrZW5kL2RybS9EdW1iLmNwcDoxNDkNCj4gIzIgwqAw
eDAwMDA1NTcyM2I5YThmNTEgaW4gQnVmZmVyc1N0b3JhZ2U6OmdldEZyYW1lQnVmZmVyQW5kQ29w
eSANCj4gKHRoaXM9MHg3ZjRhZTAwMDEwZTAsIGZiQ29va2llPTE4NDQ2NjEyNjgyMjk1MDgzMjY0
KSBhdCANCj4gL2hvbWUvc2FudHVjY28vdG1wL3hlbi10cm9vcHMvZGlzcGxfYmUvc3JjL2Rpc3Bs
YXlCYWNrZW5kL0J1ZmZlcnNTdG9yYWdlLmNwcDoxNjUNCj4gSXQgdHJpZXMgdG8gY29weSB0byBt
QnVmZmVyIHdpdGggbm9uLWFjY2Vzc2libGUgYWRkcmVzcy4NCj4gRm9yIHRoZSBtb21lbnQgSSBz
ZWUgYcKgc3RyYW5nZSBvZmZzZXQgZm9yIG1tYXAgY2FsbCBvZiAvZGV2L2RybS9jYXJkMCANCj4g
aW4gdGhlIHN0cmFjZSBsb2cg4oCUwqAweDEwMDAwMDAwMC4gSXMgdGhhdCBub3JtYWw/DQo+IEFu
eSBkaXJlY3Rpb24gb2Ygd2hpY2jCoHRvIGRpZyB3aWxsIGJlIHZlcnkgaGVscGZ1bC4NCj4gQ29u
ZmlndXJhdGlvbiBkZXRhaWxzOg0KPiBYZW4gNC4xMi4xIERvbTA6IExpbnV4IDQuMjAuMTctZ2Vu
dG9vICMxMyBTTVAgU2F0IERlYyAyOCAxMToxMjoyNCBNU0sgDQo+IDIwMTkgeDg2XzY0IEludGVs
KFIpIENlbGVyb24oUikgQ1BVIE4zMDUwIEAgMS42MEdIeiBHZW51aW5lSW50ZWwgR05VL0xpbnV4
DQo+IERvbVU6IExpbnV4IDQuMjAuMTctZ2VudG9vDQo+IGxhc3QgeGVuLXRyb29wcy9saWJ4ZW5i
ZSBhbmQgeGVuLXRyb29wcy9kaXNwbF9iZQ0KPiBMb2dzIChkbWVzZywgeGwgZG1lc2csIGRpc3Bs
X2JlLCBzdHJhY2UgbG9nIG9mIGRpc3BsX2JlKSwgYSBiYWNrdHJhY2UgDQo+IG9mIGdkYiBhbmQg
a2VybmVsIGNvbmZpZ3MgYXJlIGF0dGFjaGVkLg0KPiBUaGFua3MgaW4gYWR2YW5jZS4NCkNvdWxk
IHlvdSBwbGVhc2UgdHJ5IERvbTAga2VybmVsIFdJVEhPVVQgdGhlIG9wdGlvbnMgYmVsb3c6DQpD
T05GSUdfWEVOX0dOVERFVl9ETUFCVUY9eQ0KQ09ORklHX1hFTl9HUkFOVF9ETUFfQUxMT0M9eQ0K
DQpUaGVuLCBqdXN0IHRvIG1ha2Ugc3VyZSwgZGlkIHlvdSBidWlsZCBkaXNwbF9iZSB3aXRob3V0
IHplcm8tY29weSBzdXBwb3J0Pw0KDQo+IE9uIDEvOC8yMCA1OjM4IFBNLCBTYW50dWNjbyB3cm90
ZToNCj4gPiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciBhbGwgeW91ciBhbnN3ZXJzLg0KPiA+DQo+
ID4g0KHRgNC10LTQsCwgOCDRj9C90LLQsNGA0Y8gMjAyMCwgMTA6NTQgKzAzOjAwINC+0YIgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28NCj4gPiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20NCj4gPiA8L2NvbXBvc2U/VG89b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+PjoN
Cj4gPiBPbiAxLzYvMjAgMTA6MzggQU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+ID4gPiBPbiAw
Ni4wMS4yMCAwODo1NiwgU2FudHVjY28gd3JvdGU6DQo+ID4gPj4gSGVsbG8sDQo+ID4gPj4NCj4g
PiA+PiBJ4oCZbSB0cnlpbmcgdG8gdXNlIHZkaXNwbCBpbnRlcmZhY2UgZnJvbSBQViBPUywgaXQg
ZG9lc27igJl0IHdvcmsuDQo+ID4gPj4gQ29uZmlndXJhdGlvbiBkZXRhaWxzOg0KPiA+ID4+IMKg
wqDCoMKgIFhlbiA0LjEyLjENCj4gPiA+PiDCoMKgwqDCoCBEb20wOiBMaW51eCA0LjIwLjE3LWdl
bnRvbyAjMTMgU01QIFNhdCBEZWMgMjggMTE6MTI6MjQgTVNLDQo+ID4gMjAxOQ0KPiA+ID4+IHg4
Nl82NCBJbnRlbChSKSBDZWxlcm9uKFIpIENQVSBOMzA1MCBAIDEuNjBHSHogR2VudWluZUludGVs
DQo+ID4gR05VL0xpbnV4DQo+ID4gPj4gwqDCoMKgwqAgRG9tVTogeDg2wqBQbGFuOSwgUFYNCj4g
PiA+PiDCoMKgwqDCoCBkaXNwbF9iZSBhcyBhIGJhY2tlbmQgZm9yIHZkaXNwbCBhbmQgdmtiDQo+
ID4gPj4NCj4gPiA+PiB3aGVuIFZNIHN0YXJ0cywgZGlzcGxfYmUgcmVwb3J0cyBhYm91dCBhbiBl
cnJvcjoNCj4gPiA+PiBnbnR0YWI6IGVycm9yOiBpb2N0bCBETUFCVUZfRVhQX0ZST01fUkVGUyBm
YWlsZWQ6IEludmFsaWQgYXJndW1lbnQNCj4gPiA+PiAoZGlzcGxfYmUubG9nOjIyMSkNCj4gPiA+
Pg0KPiA+ID4+IHJlbGF0ZWTCoERvbTAgb3V0cHV0IGlzOg0KPiA+ID4+IFvCoCAxOTEuNTc5Mjc4
XSBDYW5ub3QgcHJvdmlkZSBkbWEtYnVmOiB1c2VfcHRlbW9kZSAxDQo+ID4gPj4gKGRtZXNnLmNy
ZWF0ZS5sb2c6MTIzKQ0KPiA+ID4NCj4gPiA+IFRoaXMgc2VlbXMgdG8gYmUgYSBsaW1pdGF0aW9u
IG9mIHRoZSB4ZW4gZG1hLWJ1ZiBkcml2ZXIuIEl0IHdhcw0KPiA+IHdyaXR0ZW4NCj4gPiA+IGZv
ciBiZWluZyB1c2VkIG9uIEFSTSBpbml0aWFsbHkgd2hlcmUgUFYgaXMgbm90IGF2YWlsYWJsZS4N
Cj4gPiBUaGlzIGlzIHRydWUgYW5kIHdlIG5ldmVyIHRyaWVkL3RhcmdldGVkIFBWIGRvbWFpbnMg
d2l0aCB0aGlzDQo+ID4gaW1wbGVtZW50YXRpb24sDQo+ID4gc28gaWYgdGhlcmUgaXMgYSBuZWVk
IGZvciB0aGF0IHNvbWVvbmUgaGFzIHRvIHRha2UgYSBsb29rIG9uIHRoZQ0KPiA+IHByb3Blcg0K
PiA+IGltcGxlbWVudGF0aW9uIGZvciBQVuKApg0KPiA+DQo+ID4gSGF2ZSBJIGdvdCB5b3VyIHJp
Z2h0IGFuZCB0aGVyZSBpcyBub8KgdGhlIHByb3BlciBpbXBsZW1lbnRhdGlvbiA6LSk/DQo+IFRo
ZXJlIGlzIG5vDQo+ID4NCj4gPiA+DQo+ID4gPiBDQy1pbmcgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gd2hvIGlzIHRoZSBhdXRob3Igb2YgdGhhdCBkcml2ZXIuIEhlDQo+ID4gPiBzaG91bGQgYmUg
YWJsZSB0byB0ZWxsIHVzIHdoYXQgd291bGQgYmUgbmVlZGVkIHRvIGVuYWJsZSBQViBkb20wLg0K
PiA+ID4NCj4gPiA+IERlcGVuZGluZyBvbiB5b3VyIHVzZSBjYXNlIGl0IG1pZ2h0IGJlIHBvc3Np
YmxlIHRvIHVzZSBQVkggZG9tMCwgYnV0DQo+ID4gPiBzdXBwb3J0IGZvciB0aGlzIG1vZGUgaXMg
ImV4cGVyaW1lbnRhbCIgb25seSBhbmQgc29tZSBmZWF0dXJlcw0KPiA+IGFyZSBub3QNCj4gPiA+
IHlldCB3b3JraW5nLg0KPiA+ID4NCj4gPiBXZWxsLCBvbmUgb2YgdGhlIHdvcmthcm91bmRzIHBv
c3NpYmxlIGlzIHRvIGRyb3AgemVyby1jb3B5aW5nIHVzZS1jYXNlDQo+ID4gKHRoaXMgaXMgd2h5
IGRpc3BsYXkgYmFja2VuZCB0cmllcyB0byBjcmVhdGUgZG11LWJ1ZnMgZnJvbSBncmFudHMNCj4g
PiBwYXNzZWQNCj4gPiBieSB0aGUgZ3Vlc3QgZG9tYWluIGFuZCBmYWlscyBiZWNhdXNlIG9mICJD
YW5ub3QgcHJvdmlkZSBkbWEtYnVmOg0KPiA+IHVzZV9wdGVtb2RlIDEiKQ0KPiA+IFNvLCBpbiB0
aGlzIGNhc2UgZGlzcGxheSBiYWNrZW5kIHdpbGwgZG8gbWVtb3J5IGNvcHlpbmcgZm9yIHRoZQ0K
PiA+IGluY29taW5nDQo+ID4gZnJhbWVzDQo+ID4gYW5kIHdvbid0IHRvdWNoIERNQUJVRl9FWFBf
RlJPTV9SRUZTIGlvY3RsLg0KPiA+IFRvIGRvIHNvIGp1c3QgZGlzYWJsZSB6ZXJvLWNvcHlpbmcg
d2hpbGUgYnVpbGRpbmcgdGhlIGJhY2tlbmQgWzFdDQo+ID4NCj4gPiBUaGFua3MsIEkgaGF2ZSBq
dXN0wqB0cmllZMKgdGhlIHdvcmthcm91bmQuwqAgVGhlIGJhY2tlbmQgaGFzwqBmYWlsZWQNCj4g
PiBpbsKgYW4gb3RoZXIgcGxhY2XCoG5vdCBjb3JyZXNwb25kaW5nIHdpdGggZG1hX2J1Zi4NCj4g
PiBBbnl3YXnCoGl0IGlzIGVub3VnaCB0byBjb250aW51ZcKgZGVidWdnaW5nwqDCoG15IGZyb250
ZW5kwqBpbXBsZW1lbnRhdGlvbi4NCj4gPiBEbyB5b3XCoGtub3cgaG93IGJpZyBpcyBwZXJmb3Jt
YW5jZSBwZW5hbHR5IGluIGNvbXBhcmlzb24gd2l0aA0KPiA+IHRoZcKgemVyby1jb3B5IHZhcmlh
bnQ/DQo+IFdlbGwsIGl0IHNvbGVseSBkZXBlbmRzIG9uIHlvdXIgc2V0dXAsIHNvIEkgY2Fubm90
IHRlbGwgd2hhdA0KPiB3b3VsZCB0aGUgbnVtYmVycyBiZSBpbiB5b3VyIGNhc2UuIENvbXBhcmlu
ZyB0byB3aGF0IEkgaGF2ZSBkb2Vzbid0DQo+IG1ha2UgYW55IHNlbnNlIHRvIG1lOiBvbmUgc2hv
dWxkIGNvbXBhcmUgYXBwbGVzIHRvIGFwcGxlcw0KPiA+IERvZXMgaXQgbWFrZSBhwqBzZW5zZSBp
ZiBJIG1ha2UgYcKgZGVkaWNhdGVkIEhWTSBkb21haW4gd2l0aCBsaW51eCBvbmx5DQo+ID4gZm9y
IHRoZSBwdXJwb3NlIG9mwqB2ZGlzcGwgYW5kIHZrYmQgYmFja2VuZHM/wqBJcyB0aGVyZSBhIGhv
cGXCoHRoaXMNCj4gPiBhcHByb2FjaCB3aWxsIHdvcms/DQo+IFlvdSBjYW4gdHJ5IGlmIHRoaXMg
YXBwcm9hY2ggZml0cyB5b3VyIGRlc2lnbiBhbmQgcmVxdWlyZW1lbnRzDQo+ID4NCj4gPiA+DQo+
ID4gPiBKdWVyZ2VuDQo+ID4gPg0KPiA+IFsxXQ0KPiA+IA0KPiBodHRwczovL2dpdGh1Yi5jb20v
eGVuLXRyb29wcy9kaXNwbF9iZS9ibG9iL21hc3Rlci9DTWFrZUxpc3RzLnR4dCNMMTIgDQo+IDxo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL3hlbi10cm9vcHMv
ZGlzcGxfYmUvYmxvYi9tYXN0ZXIvQ01ha2VMaXN0cy50eHQqTDEyX187SXchIUdGXzI5ZGJjUUlV
QlBBIWdpODFvWlpOdldhRldVVm5hWmx1QV9tTkJBSXRMTWQ0UlptbmMtTV9GbWxwRG9qcWVRUW5T
N2FYU05sYm84MHJlOXVPbDJ3cUZBJD4NCj4gPiANCj4gPGh0dHBzOi8vdXJsZGVmZW5zZS5jb20v
djMvX19odHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29wcy9kaXNwbF9iZS9ibG9iL21hc3Rlci9D
TWFrZUxpc3RzLnR4dCpMMTJfXztJdyEhR0ZfMjlkYmNRSVVCUEEhbXozZ24xd1FNWDJEWGVOdUFW
LTFfZEk3bnhGWVlaT2dkUGlKTlNGTWVzQ3o5bEF6T0tsd1ZQbGRkYnhiY0xtVU80NE5PeTBURkEk
Pg0KPiA+DQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IMKgIEFsZXhhbmRlciBTeWNoZXYNCj4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

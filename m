Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FF1227C29
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 11:54:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxoy1-0001Ar-G8; Tue, 21 Jul 2020 09:53:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJsm=BA=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jxoxz-0001Am-Sp
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 09:53:43 +0000
X-Inumbo-ID: 0f22c168-cb38-11ea-84fd-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f22c168-cb38-11ea-84fd-bc764e2007e4;
 Tue, 21 Jul 2020 09:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595325222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GvsOY8nL9hru4HOZs3I0bKp4alvd43EjwcfVQIXsRdM=;
 b=TbSAELeeI2EoIUHZmxv/w/TP7A6BAQJGslDMkLp8BceKARDonAgSKHFg
 20R0pqBFxcALYsGBxlDcghsTQlP6mQrUPV/um2CEddA21GtIZ1CMbncRl
 bd6SrSwCe+tMU5Q9hnly4eAbICgvtWJr11CwfAKSbh73Tq7YUSz72DkX4 o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: w3SWYxVnWB/ovGzHsoPG1cMgsKDfPOV/gOPPmXs+oopOUJbfw39zVKsaOinZOygIC/C2+1VRiJ
 XP5tUmxIonhyA7z3oCpetJNJNxfpK9uOUaJf+YVRZCg9+F3mja1kQFUPjVAnXU3+XcMgXOrK8G
 nE45VCSu4DsUm39YWW50EVYYU8QV1v/zz1iTDtDHrQlIymUhIoJUQDLrVUN+xTdRFRq0ezfeE7
 p8JSYb1Wt3FwnDySAGEASA4WCVEdtVgxH8yJtR81iu+Jf7rJttgXycs95SqrDR5ofFg2c9UvVw
 7RQ=
X-SBRS: 2.7
X-MesageID: 23680999
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,378,1589256000"; d="scan'208";a="23680999"
From: George Dunlap <George.Dunlap@citrix.com>
To: "paul@xen.org" <paul@xen.org>
Subject: Re: [PATCH for-4.14] golang/xenlight: fix code generation for python
 2.6
Thread-Topic: [PATCH for-4.14] golang/xenlight: fix code generation for python
 2.6
Thread-Index: AQHWXvEozBxH2vl03UmqM8eBIsELzakRfXMAgAAjhQCAAADdgIAACFcA
Date: Tue, 21 Jul 2020 09:53:32 +0000
Message-ID: <44537ECC-E301-46BD-8B8E-F3B522A18FEC@citrix.com>
References: <d406ae82e0cdde2dc33a92d2685ffb77bacab7ee.1595289055.git.rosbrookn@ainfosec.com>
 <003901d65f2e$6faab0c0$4f001240$@xen.org>
 <66dc2e79-e899-1d94-c0f2-d834b55cd859@citrix.com>
 <004001d65f40$a0348330$e09d8990$@xen.org>
In-Reply-To: <004001d65f40$a0348330$e09d8990$@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <5939C594A45DC04E8E97F6EF6D5EB097@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Nick Rosbrook <rosbrookn@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDIxLCAyMDIwLCBhdCAxMDoyMyBBTSwgUGF1bCBEdXJyYW50IDx4YWRpbWdu
aWtAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
Pj4gRnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+IFNl
bnQ6IDIxIEp1bHkgMjAyMCAxMDoyMQ0KPj4gVG86IHBhdWxAeGVuLm9yZzsgJ05pY2sgUm9zYnJv
b2snIDxyb3Nicm9va25AZ21haWwuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+PiBDYzogJ05pY2sgUm9zYnJvb2snIDxyb3Nicm9va25AYWluZm9zZWMuY29tPjsgJ0lhbiBK
YWNrc29uJyA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47ICdHZW9yZ2UNCj4+IER1bmxhcCcg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47ICdXZWkgTGl1JyA8d2xAeGVuLm9yZz4NCj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggZm9yLTQuMTRdIGdvbGFuZy94ZW5saWdodDogZml4IGNvZGUgZ2Vu
ZXJhdGlvbiBmb3IgcHl0aG9uIDIuNg0KPj4gDQo+PiBPbiAyMS8wNy8yMDIwIDA4OjEzLCBQYXVs
IER1cnJhbnQgd3JvdGU6DQo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4+IEZy
b206IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBnbWFpbC5jb20+DQo+Pj4+IFNlbnQ6IDIxIEp1
bHkgMjAyMCAwMDo1NQ0KPj4+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+
Pj4+IENjOiBwYXVsQHhlbi5vcmc7IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5j
b20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0KPj4+PiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+
DQo+Pj4+IFN1YmplY3Q6IFtQQVRDSCBmb3ItNC4xNF0gZ29sYW5nL3hlbmxpZ2h0OiBmaXggY29k
ZSBnZW5lcmF0aW9uIGZvciBweXRob24gMi42DQo+Pj4+IA0KPj4+PiBCZWZvcmUgcHl0aG9uIDIu
Nywgc3RyLmZvcm1hdCgpIGNhbGxzIHJlcXVpcmVkIHRoYXQgdGhlIGZvcm1hdCBmaWVsZHMNCj4+
Pj4gd2VyZSBleHBsaWNpdGx5IGVudW1lcmF0ZWQsIGUuZy46DQo+Pj4+IA0KPj4+PiAgJ3swfSB7
MX0nLmZvcm1hdChmb28sIGJhcikNCj4+Pj4gDQo+Pj4+ICB2cy4NCj4+Pj4gDQo+Pj4+ICAne30g
e30nLmZvcm1hdChmb28sIGJhcikNCj4+Pj4gDQo+Pj4+IEN1cnJlbnRseSwgZ2VuZ290eXBlcy5w
eSB1c2VzIHRoZSBsYXR0ZXIgcGF0dGVybiBldmVyeXdoZXJlLCB3aGljaCBtZWFucw0KPj4+PiB0
aGUgR28gYmluZGluZ3MgZG8gbm90IGJ1aWxkIG9uIHB5dGhvbiAyLjYuIFVzZSB0aGUgMi42IHN5
bnRheCBmb3INCj4+Pj4gZm9ybWF0KCkgaW4gb3JkZXIgdG8gc3VwcG9ydCBweXRob24gMi42IGZv
ciBub3cuDQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AYWluZm9zZWMuY29tPg0KPj4+IEknbSBhZnJhaWQgdGhpcyBpcyB0b28gbGF0ZSBmb3IgNC4x
NCBub3cuIFdlIGFyZSBpbiBoYXJkIGZyZWV6ZSwgc28gb25seSBtaW5vciBkb2NzIGNoYW5nZXMg
b3INCj4+IGNyaXRpY2FsIGJ1ZyBmaXhlcyBhcmUgYmVpbmcgdGFrZW4gYXQNCj4+PiB0aGlzIHBv
aW50Lg0KPj4gDQo+PiBUaGlzIGlzIFJlcG9ydGVkLWJ5IG1lLCBhbmQgYnJlYWtpbmcgZ2l0bGFi
IENJIG9uIHRoZSBtYXN0ZXIgYW5kIDQuMTQNCj4+IGJyYW5jaGVzIChiZWNhdXNlIGFwcGFyZW50
bHkgbm9vbmUgZWxzZSBjYXJlcyB0byBsb29rIGF0IHRoZSByZXN1bHRzLi4uKQ0KPj4gDQo+PiBU
aGUgYWx0ZXJuYXRpdmUgaXMgdG8gcHVsbCBzdXBwb3J0IGZvciBDZW50T1MgNiBmcm9tIHRoZSA0
LjE0IHJlbGVhc2UsDQo+PiB3aGljaCB3b3VsZCBiZXN0IGJlIGRvbmUgYnkgYSBjb21taXQgdGFr
aW5nIG91dCB0aGUgQzYgY29udGFpbmVycyBmcm9tIENJLg0KPj4gDQo+IA0KPiBBdCB0aGlzIGxh
dGUgc3RhZ2UgSSdkIHJhdGhlciB3ZSBkaWQgdGhhdC4NCg0KV2Ugc2hvdWxkIHByb2JhYmx5IGFk
ZCBhIHJlbGVhc2Ugbm90ZSBzYXlpbmcgdGhhdCB0aGVyZeKAmXMgYSBrbm93biBpbnRlcm1pdHRl
bnQgYnVpbGQgaXNzdWUgb24gQ2VudE9TIDYuDQoNCiAtR2Vvcmdl


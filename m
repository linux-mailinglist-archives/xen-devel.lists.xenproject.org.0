Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080ED7676E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:27:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0Cu-0005mU-Kz; Fri, 26 Jul 2019 13:24:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hr0Cs-0005mP-JS
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:24:22 +0000
X-Inumbo-ID: acf66d0f-afa8-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::618])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id acf66d0f-afa8-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:24:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyyblccjY0YNYmkoGPaB46O3ui/giw79htpR5Vxd0p415GDMKsn5esMA2Ok2sn2C7mba4KEa6sI+vKgr8hw4FFxw17ptrLiqXlcSyUCinVJHQ5cjIjWmhiO2JQ/mARShAFq46NTKA1PaVZazCW++bqQPPGqMlzR0Ti3eanBoIDFmhYSLWkKtnS7Po4DvtXg8oyR0Dl0DiisvvZXjLHO/RtIVrfnrd67BQSSyX3xBa+/cZUZdfRw/dxozTkC50X3G6KY//BgVGKqDEQmwEDF6IyN+EBeBXoMvitNNSpX+99WbleYI+bo03qOJWGQLIi8fq5UfCGoPeJzsNmzEnyTNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkQCwrE26Z1FbdXwfgvn9GDTEGUAKu2PK3Q6omL//Ow=;
 b=YG8WAvH4yd1pnUafoby++flNdS4bRwpEvqKBjTMSs6sb3rtB2h4ESJBq2mOHuBPaJgNMAF1mub5IyL5bGB9hpMJgnHeA+m6/RO21Gl0sh64xzCDWbvkzITDV1fT5U98QwqtHXCHGl2jVlaLn22g6+vVjqB6yzGPptvHrCaUuqhEaowI+/1OtNW8UYsutqCo84ekokWW+qwDLLvLcg7M0LN0sq36f+t4Mx3MxxmIQiuQc8NLs3adY48CGovHwFgeDnb2Qr/Sj/FuHYz/+hRydtR4LuU8xTHin92x41letfQZsYz1lkhy7k07ghn3GpTXFO0XDDcHUzm7CwVf94auG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkQCwrE26Z1FbdXwfgvn9GDTEGUAKu2PK3Q6omL//Ow=;
 b=Rq/Ai+YE78vC/3JG/uizSmtuovtBkKMl3ehyUXnIxRxTVr0DI/UVOX7QSLh0YCEPy1vk00ci1EAdsY1O3NWF4Hw9Xs2Kths+qvKdxkY6NJn1oxSyyTzs+pvs7LJVC1KIgF5lX/zefjk2+mf4eBXwgFvdSVDSih6zYK9wbEaFQoWjBtUyCQzsIgaX5XSmEjwibe2XJR5YbOd5o20j9d9fRqrv911JRUEi0fuUjdT6ikA+t7/4tn2v8m/Nz5iCj8d1gkW1LvEo28jEpKhFNVyiNrgSd8Cp2Lge8KYXzMrDXY/VS3iC0Z455Cy6gsg2KGaNE8clfZRURl4Bi1BkkVSwLA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4483.eurprd03.prod.outlook.com (20.177.40.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 26 Jul 2019 13:24:19 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 13:24:19 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [PATCH] xen/arm: extend fdt_property_interrupts
Thread-Index: AQHVQ5DIG4Wp10DIaUKStsgLLIvpgKbcy2UAgAAN54CAAAptAA==
Date: Fri, 26 Jul 2019 13:24:18 +0000
Message-ID: <87ftmthqt9.fsf@epam.com>
References: <20190726090124.26444-1-viktor.mitin.19@gmail.com>
 <87sgqthuud.fsf@epam.com>
 <CAOcoXZbc8tUf8DKjAD7Rj3JjOqrFA=3hVsw0fe21TNyoG8Q8CA@mail.gmail.com>
In-Reply-To: <CAOcoXZbc8tUf8DKjAD7Rj3JjOqrFA=3hVsw0fe21TNyoG8Q8CA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14b504dd-102d-41bb-e6e5-08d711cc9071
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4483; 
x-ms-traffictypediagnostic: AM0PR03MB4483:|AM0PR03MB4483:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR03MB44833CD8327A7C34BCC6A733E6C00@AM0PR03MB4483.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(199004)(189003)(99286004)(71190400001)(71200400001)(68736007)(7736002)(6512007)(6306002)(316002)(8936002)(8676002)(81156014)(81166006)(54906003)(6916009)(305945005)(486006)(476003)(256004)(2616005)(14444005)(446003)(11346002)(4326008)(66066001)(80792005)(53936002)(26005)(36756003)(25786009)(6246003)(186003)(66946007)(66476007)(66556008)(64756008)(66446008)(91956017)(76116006)(5660300002)(86362001)(3846002)(6116002)(6436002)(229853002)(6486002)(478600001)(14454004)(102836004)(6506007)(53546011)(55236004)(76176011)(966005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4483;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lPUYo/fmiEcEVRY/7IiLQCstNhYzwCPaqn/Eki7yU1tU82iZsGTx3Yjx2f2nMuA/o/YulpLfMw2xJvtC3PJ/DSuxbm1ZNMiq1iWO5mRHjPaurPtzogYZLm9BsdZSZp0jLhWTdPM7VYn3JjRRsrLywj/D5j4/UC+3LNzKPnGt7mW+pttJ9yWf1pd5FuYa0K18nRIlxf3OcuC5LuxGd7GOIE2P4+eqiv0hN0WrJRQGVqLq/OqfiXqsKWneLn1eFZiYgdC/7eaDqjZzaFusInfrFJKe9+rST4kFKQWkrTHkbcc8jeoRl8QAvpExOzsmIhBZ6qHSLAqSLVpjTzdbua7bhg985o+6sEUlLcjVe3WSqgbIHGEpJlu8oeThgSQPF3OIh2TkooKkwF63GJ7EiZrZ4WbrbdGCQZZDHh+YiJQsYdg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b504dd-102d-41bb-e6e5-08d711cc9071
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 13:24:18.9299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4483
Subject: Re: [Xen-devel] [PATCH] xen/arm: extend fdt_property_interrupts
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ClZpa3RvciBNaXRpbiB3cml0ZXM6Cgo+IEhpIFZvbG9keW15ciwKPgo+IE9uIEZyaSwgSnVsIDI2
LCAyMDE5IGF0IDI6NTcgUE0gVm9sb2R5bXlyIEJhYmNodWsKPiA8Vm9sb2R5bXlyX0JhYmNodWtA
ZXBhbS5jb20+IHdyb3RlOgo+Pgo+Pgo+PiBIZWxsbyBWaWtvciwKPj4KPj4gVmlrdG9yIE1pdGlu
IHdyaXRlczoKPj4KPj4gPiB4ZW4vYXJtOiBleHRlbmQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHMg
dG8gZGVhbCB3aXRoIG90aGVyCj4+ID4gZG9tYWluIHRoYW4gdGhlIGh3ZG9tCj4+Cj4+IEl0IGlz
IHVuY2xlYXIgd2hhdCBwcm9ibGVtIHlvdSBhcmUgZmFjaW5nLiBDb3VsZCB5b3UgcGxlYXNlIGVs
YWJvcmF0ZQo+PiBjb21taXQgbWVzc2FnZT8KPgo+IE9yaWdpbmFsIGdvYWwgaXMgdG8gbWVyZ2Ug
bWFrZV90aW1lcl9ub2RlIGFuZCBtYWtlX3RpbWVyX2RvbVVfbm9kZSBmdW5jdGlvbnMuCj4gRm9y
IGJhY2tncm91bmQgZGlzY3Vzc2lvbiBwbGVhc2Ugc2VlIGRpc2N1c3Npb24gaW4gbWFpbCAoYWxz
bwo+IG1lbnRpb25lZCBpbiB0aGUgcGF0Y2gpOgo+IFtQQVRDSF0geGVuL2FybTogbWVyZ2UgbWFr
ZV90aW1lcl9ub2RlIGFuZCBtYWtlX3RpbWVyX2RvbVVfbm9kZQo+IGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMDkxNC5odG1s
ClRoaXMgaXMgbWVudGlvbmVkIGJlbG93IHRoZSB0ZWFybGluZSBhbmQgbmV3ZXIgd2lsbCBiZSBp
bmNsdWRlZCBpbiB0aGUKZ2l0IGhpc3RvcnkuIEhlcmUgaXMgdGhlIHJ1bGVzOgoKIFdyaXRlIGEg
Z29vZCBkZXNjcmlwdGlvbiBmb3IgZWFjaCBwYXRjaDoKCiAtIFRoZSBmaXJzdCBsaW5lIHRoZSB0
b3Agb2YgdGhlIHBhdGNoIHNob3VsZCBjb250YWluIGEgc2hvcnQKICAgZGVzY3JpcHRpb24gb2Yg
d2hhdCB0aGUgcGF0Y2ggZG9lcywgYW5kIGhpbnRzIGFzIHRvIHdoYXQgY29kZSBpdAogICB0b3Vj
aGVzCgogLSBUaGUgZGVzY3JpcHRpb24gc2hvdWxkIGJlIHVzZWZ1bCBmb3IgYm90aCB0aGUgcmV2
aWV3ZXJzIGFuZCBwZW9wbGUgaW4KICAgdGhlIGZ1dHVyZSB0cnlpbmcgdG8gdW5kZXJzdGFuZCB3
aGF0IHRoZSBwYXRjaCBkb2VzLiBJdCBjYW4gYmUgYXMKICAgc2hvcnQgYXMgQ29kZSBjbGVhbnVw
IC0tIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcywgb3IgYXMgbG9uZyBhcyBpdAogICB0YWtlcyB0byBh
Y2N1cmF0ZWx5IGRlc2NyaWJlIHRoZSBidWcgeW91IGFyZSB0cnlpbmcgdG8gc29sdmUgb3IgdGhl
CiAgIG5ldyBmdW5jdGlvbmFsaXR5IHlvdSBhcmUgaW50cm9kdWNpbmcuCgpJdCBpcyBoYXJkIHRv
IHNheSB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIHNvbHZlIHdpdGggdGhpcyBjaGFuZ2UuCgpJIGNh
bid0IHJldmlldyBmdW5jdGlvbmFsIGNoYW5nZXMgaW4geW91ciBwYXRjaCwgYmVjYXVzZSBJIGRv
bid0CnVuZGVyc3RhbmQgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBhY2hpZXZlLgoKCj4+IEFsc28s
IGxvb2tzIGxpa2UgeW91ciBjb21taXQgbWVzc2FnZSBpcyBmb3JtYXR0ZWQgaW5jb3JyZWN0bHku
Cj4+Cj4gUGxlYXNlIHNlZSBiZWxvdy4KSSB3YXMgdGFsa2luZyBhYm91dCBjb21taXQgbWVzc2Fn
ZS4gSSdtIHNlZWluZyAieGVuL2FybToiIHRhZyBib3RoIGluCnRoZSBzdWJqZWN0IGFuZCBpbiB0
aGUgZS1tYWlsIGJvZHkuCgo+PiA+IFRlc3RlZCB3aXRoIGFhcmNoNjQgcWVtdSBkb20wIGFuZCBk
b20wbGVzcyBib290Lgo+PiA+Cj4+ID4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgo+PiA+IFNpZ25lZC1vZmYtYnk6IFZpa3RvciBNaXRpbiA8dmlrdG9y
X21pdGluQGVwYW0uY29tPgo+PiA+Cj4+ID4gLS0tCj4+ID4gU2VlIGRpc2N1c3Npb24gaW4gbWFp
bDoKPj4gPiBbUEFUQ0hdIHhlbi9hcm06IG1lcmdlIG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90
aW1lcl9kb21VX25vZGUKPj4gPgo+PiA+Cj4+ID4gIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YyB8IDIyICsrKysrKysrKysrKystLS0tLS0tLS0KPj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+ID4KPj4gPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+ID4g
aW5kZXggNGM4NDA0MTU1YS4uNWY2ODYwMzM5MiAxMDA2NDQKPj4gPiAtLS0gYS94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMKPj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
Pj4gPiBAQCAtNjIxLDE3ICs2MjEsMTkgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldF9pbnRlcnJ1
cHQoZ2ljX2ludGVycnVwdF90IGludGVycnVwdCwKPj4gPiAgICogICJpbnRlcnJ1cHRzIjogY29u
dGFpbnMgdGhlIGxpc3Qgb2YgaW50ZXJydXB0cwo+PiA+ICAgKiAgImludGVycnVwdC1wYXJlbnQi
OiBsaW5rIHRvIHRoZSBHSUMKPj4gPiAgICovCj4+ID4gLXN0YXRpYyBpbnQgX19pbml0IGZkdF9w
cm9wZXJ0eV9pbnRlcnJ1cHRzKHZvaWQgKmZkdCwgZ2ljX2ludGVycnVwdF90ICppbnRyLAo+PiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBudW1f
aXJxKQo+PiA+ICtzdGF0aWMgaW50IF9faW5pdCBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyhjb25z
dCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZ2ljX2ludGVycnVwdF90ICppbnRyLCB1bnNpZ25lZCBudW1faXJxKQo+PiBXcm9uZyBp
bmRlbnRhdGlvbiB0aGVyZS4KPgo+IFN1Y2ggY2FzZXMgYXJlIG5vdCBkZWZpbmVkIGluIHRoZSBD
b2RpbmcgU3R5bGUgZG9jdW1lbnQgZXhwbGljaXRseS4KPiBTZWUgbXkgY2xhbmctZm9ybWF0IGNv
ZGluZyBzdHlsZSBtYWlsLgpZZXMsIHRoaXMgaXMgb25lIG9mIHRoYXQgcnVsZXMgdGhhdCBhY3R1
YWxseSBpcyBub3QgZG9jdW1lbnRlZCwgYnV0IGlzCndpZGVseSBlbmZvcmNlZC4KCi0tClZvbG9k
eW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

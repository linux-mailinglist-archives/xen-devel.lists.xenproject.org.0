Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B35C05B9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpgk-0001C6-KR; Fri, 27 Sep 2019 12:49:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDpgi-0001Bx-Ac
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:49:32 +0000
X-Inumbo-ID: 3f76fa58-e125-11e9-9677-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.74]) by localhost (Halon) with ESMTPS
 id 3f76fa58-e125-11e9-9677-12813bfff9fa;
 Fri, 27 Sep 2019 12:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWTu5djQ1KA0qRKRu/xzQuxzMkJKcnt8CptJD19HczyG59341YwIhKV8FGsqVSIIKFr3h8aWftu4tTx9YncCKhPzjDXUEd4wcGkn4zRzYs2FSq86td/lVkZXRCD3CfsEUC9MCoGRMT/HarTVe7Uqm6fAI8Kh8/vyQJIQjKggfw83vD6j2gsDzWeMMqDgCxRorapDgc8mbNgBNeE/kkf+2GKOKB3zwrmILIWodH37m2Qb9rU3x+8Z0mQ0/q0DbA1/PrWJ6rgOIIU4UgoCXcMXTVk09eFacAK3QIqzVei3YnmCi1D/9xfEQ2DBVPyTgh5fVPe6iVIsDxrkuWeIq/rnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOmC/AY1331ShInXmR0+l32JKVgutj7MEwnqxZEGbbY=;
 b=n4oQ/v/YIxCWijgMTsCCpIgLRumGwXTP+lDfDVZf7wJHwKQflfDgNe5HP1WNMsYBfz8C0zVoaE4DvOp3AwFGTF1d95roBiNBUm4QQ2LH0gEr3zi5S3JAQT38VgEHUqVl8cAc7HPG4d37Nom/NAhnbtVg+j1wEPdGf3txJSU0BZQivWJT3dbtQ2cg+dfZIonyv7Qwzvio3PeiUnyDMpSNrWgEBHkmfHWwcVO04EmhDFfvTEcEE8f2psxCkgKyrkzVnSW1B15/hScsTn6johnMGKGNhmOPExEX6i64WQnIUl3bqaCLlLpCaTh/aGBTLOc6aALEmDd1M6RPQf19fl1Nrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOmC/AY1331ShInXmR0+l32JKVgutj7MEwnqxZEGbbY=;
 b=GtV4CTy4CVghx4SpVmt/RgH1XtNDoEKj8t2RthLiKb0YubIWOHz8MmndvyU1hNEGnUryU/bqdTanCMaL8Us8N6kV1p8+WkalMngMsCd/P+FhCiTK3FliCbwDjxp0LsPEUOomc19odY24Lyzg6aSCAJOd/cH53JiXhI82JD9D9dM=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4355.eurprd03.prod.outlook.com (20.177.42.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Fri, 27 Sep 2019 12:49:26 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 12:49:26 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework entry/exit
 from the guest path
Thread-Index: AQHVdJmSYNSsXwZ/UE+SD815sb8MBKc/aNGAgAAI4oCAAALbAIAABPcAgAABQ4A=
Date: Fri, 27 Sep 2019 12:49:26 +0000
Message-ID: <87o8z59a5m.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-4-julien.grall@arm.com> <871rw29d4s.fsf@epam.com>
 <aa4d64a4-98bf-d248-fc2e-c00bc1c76a91@arm.com> <87sgoh9b6r.fsf@epam.com>
 <9b9b276e-21a0-78b2-1b42-c80a0d8d6353@arm.com>
In-Reply-To: <9b9b276e-21a0-78b2-1b42-c80a0d8d6353@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9fef83e-a1d9-42c3-1c22-08d743492142
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4355; 
x-ms-traffictypediagnostic: AM0PR03MB4355:|AM0PR03MB4355:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB43556C40B2FEE2524E2B138AE6810@AM0PR03MB4355.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(189003)(199004)(6506007)(25786009)(6512007)(86362001)(478600001)(71200400001)(102836004)(7736002)(26005)(305945005)(186003)(80792005)(6436002)(4326008)(71190400001)(55236004)(14444005)(66066001)(6246003)(256004)(53546011)(54906003)(8936002)(76116006)(81156014)(6116002)(3846002)(66556008)(66476007)(64756008)(81166006)(8676002)(66946007)(36756003)(66446008)(5660300002)(2906002)(91956017)(76176011)(486006)(6486002)(229853002)(6916009)(2616005)(11346002)(14454004)(99286004)(446003)(316002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4355;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NJxxMx0FaaULaLh3LnPzUIblNmOP0ieEaKS96T+c/pdt/tkVQteA/NGq156roFCJWonjQ63g9V9d2DatRv1HhZI+oJQw5O+LCJyOfBL0cbKAlf7ed1cI3Lqk6xQDktuaTIP+YAm+XmglZ/QvUxFfN97umpdRoiuLMPykzHh9SBlZBXfXzvIDIathVheYLcydQEwIAHN2EC9vDuH2INxV0qWk/Vm5ku1wRMqPlB8Dy0m6qUkS2u83QfGcRUFVVGe5ipkUTYGQ6cKe8xKxMhhhI9lR4ZjIXd8QFnApriWIH5UHZaVTr13FCy+WiacUSZhDL9VnXwjYcKTxo6XqsG1BpVcOOTO3rwHSsOOoT6IQamPv8ivEsDDbFmLgQ6dQhcByl9j5KximyW0kK9gLjoymkAs/ikey/49+0FjmEGNE8m8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fef83e-a1d9-42c3-1c22-08d743492142
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 12:49:26.4189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTEWRzv8zYpv9mxEa4FBi2uAXknvfArbdkOxm7sNDr9rsWw8OFzKaiNA1Jc9RAK2oLWuhxBkXvOAIXotGn3rwYoVeRGoFYBp06UdrsbLmOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4355
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework
 entry/exit from the guest path
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gMjcvMDkvMjAxOSAxMzoyNywgVm9s
b2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Cj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Cj4+PiBP
biAyNy8wOS8yMDE5IDEyOjQ1LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+Pgo+Pj4+IEp1
bGllbiwKPj4+Cj4+PiBIaS4uLgo+Pj4KPj4+PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+Pj4+Cj4+
Pj4+IEF0IHRoZSBtb21lbnQsIGVudGVyX2h5cGVydmlzb3JfaGVhZCgpIGFuZCBsZWF2ZV9oeXBl
cnZpc29yX3RhaWwoKSBhcmUKPj4+Pj4gdXNlZCB0byBkZWFsIHdpdGggYWN0aW9ucyB0byBiZSBk
b25lIGJlZm9yZS9hZnRlciBhbnkgZ3Vlc3QgcmVxdWVzdCBpcwo+Pj4+PiBoYW5kbGVkLgo+Pj4+
Pgo+Pj4+PiBXaGlsZSB0aGV5IGFyZSBtZWFudCB0byB3b3JrIGluIHBhaXIsIHRoZSBmb3JtZXIg
aXMgY2FsbGVkIGZvciBtb3N0IG9mCj4+Pj4+IHRoZSB0cmFwcywgaW5jbHVkaW5nIHRyYXBzIGZy
b20gdGhlIHNhbWUgZXhjZXB0aW9uIGxldmVsIChpLmUuCj4+Pj4+IGh5cGVydmlzb3IpIHdoaWxz
dCB0aGUgbGF0dGVyIHdpbGwgb25seSBiZSBjYWxsZWQgd2hlbiByZXR1cm5pbmcgdG8gdGhlCj4+
Pj4+IGd1ZXN0Lgo+Pj4+Pgo+Pj4+PiBBcyBwb2ludGVkIG91dCwgdGhlIGVudGVyX2h5cGVydmlz
b3JfaGVhZCgpIGlzIG5vdCBjYWxsZWQgZnJvbSBhbGwgdGhlCj4+Pj4+IHRyYXBzLCBzbyB0aGlz
IG1ha2VzIHBvdGVudGlhbGx5IGRpZmZpY3VsdCB0byBleHRlbmQgaXQgZm9yIHRoZSBkZWFsaW5n
Cj4+Pj4+IHdpdGggc2FtZSBleGNlcHRpb24gbGV2ZWwuCj4+Pj4+Cj4+Pj4+IEZ1cnRoZXJtb3Jl
LCBzb21lIGFzc2VtYmx5IG9ubHkgcGF0aCB3aWxsIHJlcXVpcmUgdG8gY2FsbAo+Pj4+PiBlbnRl
cl9oeXBlcnZpc29yX3RhaWwoKS4gU28gdGhlIGZ1bmN0aW9uIGlzIG5vdyBkaXJlY3RseSBjYWxs
IGJ5Cj4+Pj4+IGFzc2VtYmx5IGluIGZvciBndWVzdCB2ZWN0b3Igb25seS4gVGhpcyBtZWFucyB0
aGF0IHRoZSBjaGVjayB3aGV0aGVyIHdlCj4+Pj4+IGFyZSBjYWxsZWQgaW4gYSBndWVzdCB0cmFw
IGNhbiBub3cgYmUgcmVtb3ZlZC4KPj4+Pj4KPj4+Pj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8g
cmVuYW1lIGVudGVyX2h5cGVydmlzb3JfdGFpbCgpIGFuZAo+Pj4+PiBsZWF2ZV9oeXBlcnZpc29y
X3RhaWwoKSB0byBzb21ldGhpbmcgbW9yZSBtZWFuaW5nZnVsIGFuZCBkb2N1bWVudCB0aGVtLgo+
Pj4+PiBUaGlzIHNob3VsZCBoZWxwIGV2ZXJ5b25lIHRvIHVuZGVyc3RhbmQgdGhlIHB1cnBvc2Ug
b2YgdGhlIHR3bwo+Pj4+PiBmdW5jdGlvbnMuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Pj4+Cj4+Pj4+IC0tLQo+Pj4+Pgo+
Pj4+PiBJIGhhdmVuJ3QgZG9uZSB0aGUgMzItYml0cyBwYXJ0IHlldC4gSSB3YW50ZWQgdG8gZ2F0
aGVyIGZlZWRiYWNrIGJlZm9yZQo+Pj4+PiBsb29raW5nIGluIGRldGFpbHMgaG93IHRvIGludGVn
cmF0ZSB0aGF0IHdpdGggQXJtMzIuCj4+Pj4gSSdtIGxvb2tpbmcgYXQgcGF0Y2hlcyBvbmUgYnkg
b25lIGFuZCBpdCBpcyBsb29raW5nIG9rYXkgc28gZmFyLgo+Pj4+Cj4+Pj4KPj4+Pj4gLS0tCj4+
Pj4+ICAgIHhlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIHwgIDQgKystCj4+Pj4+ICAgIHhlbi9h
cmNoL2FybS90cmFwcy5jICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+Pj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMo
KyksIDM4IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2FybTY0L2VudHJ5LlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+Pj4+PiBpbmRleCA0
MGQ5ZjNlYzhjLi45ZWFmYWU1MTZiIDEwMDY0NAo+Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJt
NjQvZW50cnkuUwo+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+Pj4+PiBA
QCAtMTQ3LDcgKzE0Nyw3IEBACj4+Pj4+Cj4+Pj4+ICAgICAgICAgICAgLmlmIFxoeXAgPT0gMCAg
ICAgICAgIC8qIEd1ZXN0IG1vZGUgKi8KPj4+Pj4KPj4+Pj4gLSAgICAgICAgYmwgICAgICBsZWF2
ZV9oeXBlcnZpc29yX3RhaWwgLyogRGlzYWJsZXMgaW50ZXJydXB0cyBvbiByZXR1cm4gKi8KPj4+
Pj4gKyAgICAgICAgYmwgICAgICBsZWF2ZV9oeXBlcnZpc29yX3RvX2d1ZXN0IC8qIERpc2FibGVz
IGludGVycnVwdHMgb24gcmV0dXJuICovCj4+Pj4+Cj4+Pj4+ICAgICAgICAgICAgZXhpdF9ndWVz
dCBcY29tcGF0Cj4+Pj4+Cj4+Pj4+IEBAIC0xNzUsNiArMTc1LDggQEAKPj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUKQo+Pj4+PiAg
ICAgICAgICAgIG1zciAgICAgZGFpZmNsciwgXGlmbGFncwo+Pj4+PiAgICAgICAgICAgIG1vdiAg
ICAgeDAsIHNwCj4+Pj4gTG9va3MgbGlrZSB0aGlzIG1vdiBjYW4gYmUgcmVtb3ZlZCAoc2VlIGNv
bW1lbmQgYmVsb3cpLgo+Pj4+Cj4+Pj4+ICsgICAgICAgIGJsICAgICAgZW50ZXJfaHlwZXJ2aXNv
cl9mcm9tX2d1ZXN0Cj4+Pj4+ICsgICAgICAgIG1vdiAgICAgeDAsIHNwCj4+Pj4+ICAgICAgICAg
ICAgYmwgICAgICBkb190cmFwX1x0cmFwCj4+Pj4+ICAgIDE6Cj4+Pj4+ICAgICAgICAgICAgZXhp
dCAgICBoeXA9MCwgY29tcGF0PVxjb21wYXQKPj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4+Pj4gaW5kZXggYTNiOTYxYmQwNi4u
MjBiYTM0ZWM5MSAxMDA2NDQKPj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4+Pj4gQEAgLTIwMDYsNDcgKzIwMDYsNDYgQEAg
c3RhdGljIGlubGluZSBib29sIG5lZWRzX3NzYmRfZmxpcChzdHJ1Y3QgdmNwdSAqdikKPj4+Pj4g
ICAgICAgICAgICAgICAgIGNwdV9yZXF1aXJlX3NzYmRfbWl0aWdhdGlvbigpOwo+Pj4+PiAgICB9
Cj4+Pj4+Cj4+Pj4+IC1zdGF0aWMgdm9pZCBlbnRlcl9oeXBlcnZpc29yX2hlYWQoc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MpCj4+Pj4+ICsvKgo+Pj4+PiArICogQWN0aW9ucyB0aGF0IG5lZWRz
IHRvIGJlIGRvbmUgYWZ0ZXIgZXhpdGluZyB0aGUgZ3Vlc3QgYW5kIGJlZm9yZSBhbnkKPj4+Pj4g
KyAqIHJlcXVlc3QgZnJvbSBpdCBpcyBoYW5kbGVkLgo+Pj4+IE1heWJlIGl0IGlzIG1lIG9ubHks
IGJ1dCB0aGUgcGhyYXNpbmcgaXMgY29uZnVzaW5nLiBJIGhhZCB0byByZWFkIGl0IHR3bwo+Pj4+
IHRpbWVzIGJlZm9yZSBJIGdldCBpdC4gV2hhdCBhYm91dCAiQWN0aW9ucyB0aGF0IG5lZWRzIHRv
IGJlIGRvbmUgd2hlbgo+Pj4+IHJhaXNpbmcgZXhjZXB0aW9uIGxldmVsIj8gT3IgbWF5YmUgIkFj
dGlvbnMgdGhhdCBuZWVkcyB0byBiZSBkb25lIHdoZW4KPj4+PiBzd2l0Y2hpbmcgZnJvbSBndWVz
dCB0byBoeXBlcnZpc29yIG1vZGUiID8KPj4+Cj4+PiBJcyBpdCBhIHN1Z2dlc3Rpb24gdG8gcmVw
bGFjZSB0aGUgZnVsbCBzZW50ZW5jZSBvciBqdXN0IHRoZSBmaXJzdAo+Pj4gYmVmb3JlIChpLmUu
IGJlZm9yZSAnYW5kJyk/Cj4+IFRoaXMgaXMgYSBzdWdnZXN0aW9uIGZvciB0aGUgZmlyc3QgcGFy
dC4KPgo+IEhvdyBhYm91dDoKPgo+ICJBY3Rpb25zIHRoYXQgbmVlZHMgdG8gYmUgZG9uZSBhZnRl
ciBlbnRlcmluZyB0aGUgaHlwZXJ2aXNvciBmcm9tIHRoZQo+IGd1ZXN0IGFuZCBiZWZvcmUgd2Ug
aGFuZGxlIGFueSByZXF1ZXN0LiIKU291bmQgcGVyZmVjdC4KClsuLi5dCgotLSAKVm9sb2R5bXly
IEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

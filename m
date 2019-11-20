Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933AE10363A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 09:51:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXLfE-0004sj-BC; Wed, 20 Nov 2019 08:48:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ykW7=ZM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iXLfC-0004se-7D
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 08:48:38 +0000
X-Inumbo-ID: 8970632a-0b72-11ea-9631-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::707])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8970632a-0b72-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 08:48:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSarQ7W1jgX3SRMsRX96nMRHzsO9L1jM0iKaAJPqG1KVaYFK7bCZUTut+jh8x0swmWfnwTfIU0jsvyRMG0y/n166HlIxT4YN7GkWWuaG5xj+11K6ZH5cN7SfSZZKBnY729aem2pMvTVQC44Ky/XCnpbCmbAl6ZtQU+0RiQZZjJjJu5VOZsODaDex2wymcsdzRtSngTbVAQFM7+R0xnqz69HrBD85PDWPy7MyTnovVwnXKWTc80z9xas3VJs5levbQIGKttHkFX/aBNOc9J8aJSjNE67gP/+2ycbiKm/o7uPmq7LkEdL5yZ6y+YeZeBZZt7WmIP9gB62+gmRFuD45Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7f8r66/+N+qF6PhXfXH9ktEPaexrd9EoHnskpEfjFk=;
 b=VRJaLqx2t3S6gEM612jKTwAucBJpyTqiZ51wBENDJ0m8ANITzNcGHk6cty1JDbjNlOS9A2WT4rXRQzd/HNV+i2RWMcfdExAiRwWSokzPSnJMQlqUj+nXSWqKm8p9Nras0XxTnzV4Vd4iRfPsVouKEG+emqyXG3VOAyNW+AR9Y76fcq47Ma4Hj9OFHNMBUUybrsL+wkD+/olVBQ3/NFkUmj2P11sX7sq4zaHRoUXi5vlWV3dJbPvlSHB+03YLKlbHldFjxO0eFcQtGRwwhw2GcsZAkO7KGvzj2x8nFpPQ+hjmmpFezxlb/jWCLJ+gvBJlpuwp80uaNbh9fVFnpeK+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7f8r66/+N+qF6PhXfXH9ktEPaexrd9EoHnskpEfjFk=;
 b=K4BDm1ZtObYjpXsILRZuNXDrLCo0KrQwkubkGalK+Wu1iagc/8CUjeLrzKAOXW/iy2DjHjeTOCcc+yf4gd5plwsPnwgasKecDBWClaUPYX/DzPEg20QWAtPDerBtDdq9+t3hkeqlwbII1/0MSFvdSRZbGwgoNOZmMQA/TgzWPHg=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5362.eurprd02.prod.outlook.com (20.178.23.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.26; Wed, 20 Nov 2019 08:48:33 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 08:48:33 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V2 1/2] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVn36CZgsjfQ8yGkeVry3V2yKjqqeTv5SA
Date: Wed, 20 Nov 2019 08:48:33 +0000
Message-ID: <feaab708-5874-d652-35f6-dc6f3658e4d3@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <8c928769-c0ea-8a48-3bda-aba7d17133ba@bitdefender.com>
 <9141e27c-edd4-301a-ee76-e3fcf5e787af@suse.com>
 <559c1807-2f5d-2267-c563-448c0bd88725@bitdefender.com>
 <b653b14f-bf46-85ef-c412-876d5ad26ade@suse.com>
 <cb030ad4-df5c-6f28-f5c8-1add63d3b80d@bitdefender.com>
 <7e2ac74e-2ce6-9a2d-9333-a58815fe10d3@suse.com>
In-Reply-To: <7e2ac74e-2ce6-9a2d-9333-a58815fe10d3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::13) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3aa905c7-ab06-4513-b431-08d76d966ccc
x-ms-traffictypediagnostic: AM0PR02MB5362:|AM0PR02MB5362:|AM0PR02MB5362:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB53627A3AC614DAAE9CD76B6AAB4F0@AM0PR02MB5362.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(136003)(376002)(366004)(39860400002)(189003)(199004)(7736002)(229853002)(31686004)(31696002)(54906003)(71190400001)(71200400001)(6916009)(99286004)(66066001)(81156014)(81166006)(316002)(476003)(6116002)(3846002)(486006)(2616005)(4326008)(25786009)(6246003)(8936002)(6512007)(36756003)(53546011)(26005)(6506007)(52116002)(76176011)(14454004)(102836004)(8676002)(446003)(2906002)(256004)(11346002)(478600001)(6486002)(186003)(7416002)(305945005)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(86362001)(6436002)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5362;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rq+K7KGA0o17y8XfHlqkRsrssa+XA2gDhV6mKdzfh/70Q7l1sIpzhuKm09wVuw8yvTOTrQMue9zLRwGTFrtEdJw9hf7sgSyFKtSP/CJZ6Mat+JaGMGwS6WfTJ24yZ7bpIkLKhkw2D4t6QpEnW37OB+txPXPrvoNjFxsdPjHp0VsqT1T9MF6RP+IxouZjxPx4yZ1fwsbqC8BlxJii1XLg80UK90HxxJg2sOLt2TEyjY0eOWjXrZGRgv6f+yYcGcfz6HDqXe/3joCyWDZFyT5NkgheDGMQ+O6PlW/6A8cLzsbjllG1fPmdDMhA0uozKSvCg4T/QTROL8e8TkffGMz9n/aV5RbeLSfzJOM840+6tlDiV2Ws03ox8VxzOiYBlMARPn6BWnBDPPU+EGZkqZE0gE0gPvt3DRu5X7S4WeHUBweSVByQfV2x3SC8X7SUCcs/
Content-ID: <995F37109268F74DB786B2B3439D0971@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa905c7-ab06-4513-b431-08d76d966ccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 08:48:33.5300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fT2dEyaKaZWpnqdBIrhfW0b4PkH1E9Zp7b+xWEBQbXA8pcU2IG8lLQ409ySd86bAZ2sG9qGxoEpp7VAuTxEgNB19vfiYNaqgA0FX3Uv5ojI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5362
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIwLjExLjIwMTkgMTA6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4xMS4y
MDE5IDA5OjI5LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDE5LjExLjIw
MTkgMTE6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE5LjExLjIwMTkgMTA6MDUsIEFs
ZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+PiBPbiAxOC4xMS4yMDE5IDE2OjA5LCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDE4LjExLjIwMTkgMTQ6MzksIEFsZXhhbmRydSBT
dGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+Pj4+IEZvciB0aGlzIEhWTU9QX0FMVFAyTV9JTlRFUkZB
Q0VfVkVSU0lPTiBzaG91dCBiZSBpbmNyZWFzZWQuIEkgd2lsbCBsZWF2ZQ0KPj4+Pj4+IGl0IHRv
IFRhbWFzIHRvIGRlY2lkZSBpZiB3ZSB3aWxsIG5lZWQgYSBkaWZmZXJlbnQgc3RydWN0dXJlIGZv
cg0KPj4+Pj4+IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRpIHRvIGtlZXAgdGhlIGNv
bXBhdGliaWxpdHkuDQo+Pj4+Pg0KPj4+Pj4gV2Fzbid0IGlzIHRoYXQgZHVlIHRvIHRoZSBwb3Nz
aWJsZSBndWVzdCBleHBvc3VyZSBpdCB3YXMgZGVjaWRlZA0KPj4+Pj4gdGhhdCB0aGUgaW50ZXJm
YWNlIHZlcnNpb24gYXBwcm9hY2ggd2FzIG5vdCBzdWl0YWJsZSBoZXJlLCBhbmQgaGVuY2UNCj4+
Pj4+IGl0IHNob3VsZG4ndCBiZSBidW1wZWQgYW55IGZ1cnRoZXI/DQo+Pj4+Pg0KPj4+Pg0KPj4+
PiBUaGF0IGlzIGNvcnJlY3QgYnV0IHRoZXJlIHdhcyBhbHNvIHJlcXVlc3RlZCB0byBhZGQgdGhl
IG5ldyBvcGFxdWUgZmllbGQNCj4+Pj4gc28gSSBkb24ndCBrbm93IGhvdyB0byBoYXZlIHRoYXQg
YW4gc3RpbGwga2VlcCB0aGUgc2FtZSB2ZXJzaW9uLg0KPj4+DQo+Pj4gTmV3IHN1Yi1vcD8NCj4+
DQo+PiBXb3VsZG4ndCBpdCBiZSBzaW1wbGVyIHRvIGhhdmUgYSBuZXcgc3RydWN0dXJlIHRvIHVz
ZSBmb3IgdGhpcywNCj4+IHNvbWV0aGluZyBsaWtlICJzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3Vw
cHJlc3NfdmVfbXVsdGkiIGFuZCB0aGVuIHRoZQ0KPj4gdmVyc2lvbiB3aWxsIGJlIHVuY2hhbmdl
ZA0KPiANCj4gV2VsbCwgaWYgdGhlIG9yaWdpbmFsIHN1Yi1vcCBpcyB0byByZW1haW4gZW50aXJl
bHkgdW50b3VjaGVkLA0KPiB0aGVuIHllcywgc3VyZS4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgaW4g
dGhlIGNvdXJzZSBvZiB0aGUNCj4gZGlzY3Vzc2lvbiBpdCBiZWNhbWUgZGVjcmVhc2luZ2x5IGNs
ZWFyIHdoZXRoZXIgdGhlIG9yaWdpbmFsDQo+IHN1Yi1vcCBhbHNvIHdhbnRlZCBzb21lIGZvciBv
ZiBhZGp1c3RtZW50Lg0KPiANCg0KSSBhZ3JlZSB3aXRoIHRoZSBjbGVhcm5lc3MgaGVyZS4gU28g
dGhlIG9yaWdpbmFsIHN1Yi1vcCB3aWxsIHJlbWFpbiANCnVudG91Y2hlZC4NCg0KVGhhbmtzLA0K
QWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

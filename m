Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5110C8EA26
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 13:24:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyDo0-0005UY-FL; Thu, 15 Aug 2019 11:20:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ryZ=WL=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hyDny-0005UT-Jy
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 11:20:30 +0000
X-Inumbo-ID: afa5607e-bf4e-11e9-8524-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afa5607e-bf4e-11e9-8524-bc764e2007e4;
 Thu, 15 Aug 2019 11:20:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghm7FfF8edtDhgLVYJosdjJNhXH4hpaeDvOyQQfT+/gvpD2vA+Lz7CDvjLJkJ8OaUEbU2DRdeUmueKXj+oe6UyFPqfhtgBp/n/lJp7fvj/LshGV4YB6xm6Vb32BJxevxNhgu17/2bvcrEW6ZwjEL5E68Z/p46Q2JdmGE2LWBOGWgbjbbc0rdPLzBOHFOXR8DsNewYdFl6aHdH6oUaKtIjl7hufS5HpandvZsY1c6//R7Kz+qzORPPDCmuGHEmEoPCgPvZAs65OuP2cycRe4Wo+mvELmreQpcCW/Zvfat6z//8FHdGOvdB4b2RLTmk038ErBb2ZE8mItWX4YqaWv0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anuzQ9DMq+cnf8E42+qQpfJ2bVM2kLrhSWBrewCF8hA=;
 b=XX291B1tBHxTQ/3BYHKpCu96XZYCaDGSTktQBu/6JdboWR2wHTdS+BV3bTetCYHS/XnmsWFfHiUTYeJKBGhZ6p0bxKSz8lZsFqRaKT9IzPBsnLVt229Xy3s2RpWAtHuTsMcXhyzXgYSrX03bUevXU6CkDP4axo1EmUJjX5svHo7tuAzm+JLBaXt5X8jE28endfTBvcEbBUBCQc9EMqOhR4rz4zGzzlaaWwkBu3ZxFBJFGyvpRvGR9HQ2GchX6UNz+oqaLOsuhRTbJLgILw674he+CLBfzP2Y6TQQIJiLfzdf0anuZxJ0R8B/cCITlBKyYLlpqLeaaUS8vYf6wZd0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anuzQ9DMq+cnf8E42+qQpfJ2bVM2kLrhSWBrewCF8hA=;
 b=VYnK//SpBn0iYKWkH+3R/6fltgZHcgdh8EU5s3KlXkTQ2FkkOQvOZywvhNoZLOw66ORBvdtdvaICAcz+SOLUvZRly5mtMmIcDP2O3yXDA4v8Bck0YoUimBwKk54Y/b29dapPSqcCMea67OSdaQYY3Vwxa+T+IsblFCaNiD7lhumfmArSBlYrVUtrqWXpn3dbfWKm1TJFTAw224zDoRhIboA+4sPNndhhRGFgUNMMN0BfwEQa05vf+/ZAMCJzR0hXCdJtfToNYV3KjwIcoKFF/E80BIiqrOfVzxLuJ9TI2f+dhwkKbuf/tkLo+haISTJMfSvJ1KqoPz6/ZODfMzV8/g==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4628.eurprd03.prod.outlook.com (20.177.41.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Thu, 15 Aug 2019 11:20:27 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 11:20:27 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
Thread-Index: AQHVUV1R/d2bF3zaTUGfbkxrXQjKbab5IAaAgAIeWACAANW8gA==
Date: Thu, 15 Aug 2019 11:20:27 +0000
Message-ID: <875zmyhdzi.fsf@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-2-sstabellini@kernel.org> <87ftm5gnkc.fsf@epam.com>
 <alpine.DEB.2.21.1908141528250.8737@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1908141528250.8737@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c5da75d-260c-4a60-9791-08d72172932a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4628; 
x-ms-traffictypediagnostic: AM0PR03MB4628:|AM0PR03MB4628:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB46282A602460AAC87CFAAA24E6AC0@AM0PR03MB4628.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(199004)(189003)(81156014)(316002)(64756008)(6512007)(229853002)(66446008)(186003)(6916009)(66556008)(66476007)(66946007)(54906003)(80792005)(6506007)(476003)(6436002)(446003)(6486002)(2616005)(478600001)(55236004)(91956017)(76116006)(76176011)(14454004)(26005)(86362001)(7736002)(305945005)(102836004)(81166006)(11346002)(3846002)(486006)(256004)(8676002)(36756003)(6116002)(6246003)(99286004)(71200400001)(8936002)(14444005)(53936002)(25786009)(5660300002)(2906002)(4326008)(66066001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4628;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pc1xHQlctzYF4p6dCiBqzWSkFAoFRWi0p5A3tQybNHxottat+9qxYcAt3jG5iqee7YRH9yfhbsEZuSW78O9/2kl9trw4ATql0iEyphWvh3mUsU/Q3s0g9T+U8vSzQirrP+SwaOBlBCi+SJ2axrLNYOzvMvLFLQCD24Jy7FuEvk9ODV+/OgGju1RU6sVwVUWLjia5eU9CE2XHNfCfGdwIIlWaHt7sYpGNdhcHbtPDDiMEySB4ZUtuebPJB+6/iE06CTieFcpByTSV4k7lM78KlPvtCBfHbXvJRlQqBPUMll9lsI3ORByEwMPVD/DVM7MftUeOS6DdzdPXpRrdekwWRocfw7AN5sfmnZackxqLT3v3CW0vhlLnmLligbhvEqQJBuG7LMmIAHj/g+l8uVaszrsY7dJ+ERly77EiAJ2URW4=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5da75d-260c-4a60-9791-08d72172932a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 11:20:27.4042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMumSyNG4zcxcRDVs61J/p/D2doJpjcRKeNFklIiHHs2KEREFhlqlr9bRHHMbnOXhZiujg8y7oAE6+nbo5JqGtqMZDhSmQwxseqMsp+pf2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4628
Subject: Re: [Xen-devel] [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
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
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIFN0ZWZhbm8sCgpTdGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgoKPiBPbiBUdWUsIDEzIEF1
ZyAyMDE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gPiBAQCAtMTYyLDYgKzE1NiwxMCBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkICpmZHQs
IGludCBub2RlLAo+PiA+ICAgICAgICAgIGJvb3RpbmZvLm1lbS5iYW5rW2Jvb3RpbmZvLm1lbS5u
cl9iYW5rc10uc2l6ZSA9IHNpemU7Cj4+ID4gICAgICAgICAgYm9vdGluZm8ubWVtLm5yX2Jhbmtz
Kys7Cj4+ID4gICAgICB9Cj4+ID4gKwo+PiA+ICsgICAgaWYgKCBib290aW5mby5tZW0ubnJfYmFu
a3MgPT0gTlJfTUVNX0JBTktTICkKPj4gPiArICAgICAgICByZXR1cm4gLUVOT1NQQzsKPj4gQXJl
IHlvdSBzdXJlIHRoYXQgdGhpcyBsb2dpYyBpcyBjb3JyZWN0Pwo+Pgo+PiBGb3IgZXhhbXBsZSwg
aWYgTlJfTUVNX0JBTktTIGlzIDEsIGFuZCB3ZSBoYXZlIGV4YWN0bHkgb25lIG1lbW9yeSBub2Rl
Cj4+IGluIGRldmljZSB0cmVlLCB0aGlzIGZ1bmN0aW9uIHdpbGwgZmFpbC4gQnV0IGl0IHNob3Vs
ZCBub3QuIEkgdGhpbmsgeW91Cj4+IHdhbnQgdGhpcyBjb25kaXRpb246IGJvb3RpbmZvLm1lbS5u
cl9iYW5rcyA+IE5SX01FTV9CQU5LUwo+Cj4gWW91IGFyZSByaWdodCwgaWYgTlJfTUVNX0JBTktT
IGlzIDEgYW5kIHdlIGhhdmUgMSBtZW1vcnkgbm9kZSBpbiBkZXZpY2UKPiB0cmVlIHRoZSBjb2Rl
IHdvdWxkIHJldHVybiBhbiBlcnJvciB3aGlsZSBhY3R1YWxseSBpdCBpcyBub3JtYWwuCj4KPiBJ
IHRoaW5rIHRoZSByaWdodCBjaGVjayB3b3VsZCBiZToKPgo+ICAgaWYgKCBpIDwgYmFua3MgJiYg
Ym9vdGluZm8ubWVtLm5yX2JhbmtzID09IE5SX01FTV9CQU5LUyApCj4gICAgICAgcmV0dXJuIC1F
Tk9TUEM7CgpBY3R1YWxseSwgdGhpcyBkb2VzIG5vdCBjb3ZlciBhbGwgY29ybmVyIGNhc2VzLiBI
ZXJlIGlzIHRoZSByZXN1bHRpbmcKY29kZToKCiAxNTAgICAgIGZvciAoIGkgPSAwOyBpIDwgYmFu
a3MgJiYgYm9vdGluZm8ubWVtLm5yX2JhbmtzIDwgTlJfTUVNX0JBTktTOyBpKysgKQogMTUxICAg
ICB7CiAxNTIgICAgICAgICBkZXZpY2VfdHJlZV9nZXRfcmVnKCZjZWxsLCBhZGRyZXNzX2NlbGxz
LCBzaXplX2NlbGxzLCAmc3RhcnQsICZzaXplKTsKIDE1MyAgICAgICAgIGlmICggIXNpemUgKQog
MTU0ICAgICAgICAgICAgIGNvbnRpbnVlOwogMTU1ICAgICAgICAgYm9vdGluZm8ubWVtLmJhbmtb
Ym9vdGluZm8ubWVtLm5yX2JhbmtzXS5zdGFydCA9IHN0YXJ0OwogMTU2ICAgICAgICAgYm9vdGlu
Zm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5zaXplID0gc2l6ZTsKIDE1NyAgICAg
ICAgIGJvb3RpbmZvLm1lbS5ucl9iYW5rcysrOwogMTU4ICAgICB9CiAxNTkKIDE2MCAgICAgaWYg
KCBpIDwgYmFua3MgJiYgYm9vdGluZm8ubWVtLm5yX2JhbmtzID09IE5SX01FTV9CQU5LUyApCiAx
NjEgICAgICAgICByZXR1cm4gLUVOT1NQQzsKCkxpbmVzIDE1My0xNTQgY2F1c2UgdGhlIGlzc3Vl
LgoKSW1hZ2luZSB0aGF0IE5SX01FTV9CQU5LUyA9IDEgYW5kIHdlIGhhdmUgdHdvIG1lbW9yeSBu
b2RlcyBpbiBkZXZpY2UKdHJlZSB3aXRoLiBOb2RlcyBoYXZlIHNpemVzIDAgYW5kIDEwMjQuIFlv
dXIgY29kZSB3aWxsIHdvcmsgYXMKaW50ZW5kZWQuIEF0IHRoZSBlbmQgb2YgbG9vcCB3ZSB3aWxs
IGhhdmUgYmFua3MgPSAyLCBpID0gMiBhbmQKYm9vdGluZm8ubWVtLm5yX2JhbmtzID0gMS4KCkJ1
dCBpZiB3ZSBzd2l0Y2ggb3JkZXIgb2YgbWVtb3J5IG5vZGVzLCBzbyBmaXJzdCBvbmUgd2lsbCBi
ZSB3aXRoIHNpemUKMTAyNCBhbmQgc2Vjb25kIG9uZSB3aXRoIHNpemUgMCwgeW91ciBjb2RlIHdp
bGwgcmV0dXJuIC1FTk9TUEMsIGJlY2F1c2UKd2UnbGwgaGF2ZSBiYW5rcyA9IDIsIGkgPSAxLCBi
b290aW5mby5tZW0ubnJfYmFua3MgPSAxLgoKSSB0aGluaywgcmlnaHQgc29sdXRpb24gd2lsbCBi
ZSB0byBzY2FuIGFsbCBub2RlcyB0byBjb3VudCBub2Rlcwp3aXRoIHNpemUgPiAwLiBBbmQgdGhl
biAtIGVpdGhlciByZXR1cm4gYW4gZXJyb3Igb3IgZG8gc2Vjb25kIGxvb3AgdG8KZmlsbCBib290
aW5mby5tZW0uYmFua1tdLgoKPgo+IChUaGF0J3MgYmVjYXVzZSBpdCBpcyBpbXBvc3NpYmxlIHRv
IGdldCB0byBucl9iYW5rcyA+IE5SX01FTV9CQU5LUy4pClllcywgdGhpcyBpcyBteSBtaXN0YWtl
LgoKLS0KVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs

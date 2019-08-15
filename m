Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2328ED76
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 15:55:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyGAR-0002FJ-0U; Thu, 15 Aug 2019 13:51:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ryZ=WL=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hyGAP-0002FE-RJ
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 13:51:49 +0000
X-Inumbo-ID: d2c35754-bf63-11e9-b90c-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2c35754-bf63-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 13:51:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtFAFEf4m/jUSW8ydAMXJeLJh8JGJb3LcjjRS2YxUos3PrQUXL6KBsshvwjd69CpX4K5rsmq2qnTItEAukclvYwc1aFQfnEWQimXULw7WVvoL60tHKlg+CTSTK/4r16cn7RIdOhuupWKLiIXV2hP116YpoT2C+49qHeaxJb061LNXmCv75MmGdS8ROi6mPKoQRXgqU4yEgTQctmspm/iMjxjRc6XXCxFZ/9f4b4TCE8/T6KhXxfBAFjZfqaVSHuAIrZ73lKQ9Cs+VZ9YY6uqJfZWGadXqt6uKuY3/WsVzJuBrJM+6naCM9RMDZ10iNdxOitb2EcO6OAKF5FEIsOeng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WE9n3grDQ92IroTtsoxD1xueNaaWB/7lRVyQZnpYIJY=;
 b=nIouM/jOELpV63YYMXXXLz+IE5+grTpb087OG4x0Drrq7Nhhx6l+01tZNmYsZZQI7wLiWHtlPO441zDfOK9cFyaAizORe6fZRKdzBWZEmBwl9H1Cwf/7aj543zGTXVbkmtuqPUkbXGVJXKQUXDlkN9cBo0aIwu96mmrqdHN4QsEuAGnwnkhFNV0B2Ux+p7B8Rx150VtaXtg/2zefEut27yNVe2CYtq6nTw1Gfcduj5zqsDHqBf73gXo8wA1C74DrFRyQxtBHt8kDbVo+IYx4kN33yyysSAaScLUButPMcN5Vb/RMrjdiGERDuXTz1/SjUToGLE0ePcpxkjcoVz3eBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WE9n3grDQ92IroTtsoxD1xueNaaWB/7lRVyQZnpYIJY=;
 b=IGjR82SmgiZHmqOfvY95PEUdd9RmZjzYe9pPgnpbTN85mCuA24foxf/v306cqD07h7nlLwI5oytVskdF7ZgBeGR4MjofcUamZfiorQU2LrkAd43I1IVwpY6h6PiZY0LF9yb+GTDC4fZFtllcaZm6WhClNgKj/kIGZw0Zh06d90OwwjfzTQhzjpujfpywPzQzMWPVhTcFYh5PYmtrr5lek+HkdUmMbEDOo7GndDeUJGsEtLERyUyUtGdf2xXq4yqC3nMki6qglS2uNfjywMHsCZTVcHWtGpf1I9+ksnYuiURgilXTBBz3f8c4R803OsldCZbTmzILPzHs+bYd6AQaIw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5876.eurprd03.prod.outlook.com (10.255.29.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Thu, 15 Aug 2019 13:51:45 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 13:51:45 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
Thread-Index: AQHVUV1R/d2bF3zaTUGfbkxrXQjKbab5IAaAgAIeWACAANW8gIAAAS+AgAABXwCAAAy1gIAABSEAgAAV7AA=
Date: Thu, 15 Aug 2019 13:51:45 +0000
Message-ID: <8736i2h6z3.fsf@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-2-sstabellini@kernel.org> <87ftm5gnkc.fsf@epam.com>
 <alpine.DEB.2.21.1908141528250.8737@sstabellini-ThinkPad-T480s>
 <875zmyhdzi.fsf@epam.com> <9452f4b5-7e36-0514-f207-a6b7c4410ea6@arm.com>
 <79e7a0a2-7c1e-cfe9-b5b1-d503075f60bd@arm.com> <874l2ihbgg.fsf@epam.com>
 <d3982ff4-1c1e-3f16-4f6d-2aa42410d3da@arm.com>
In-Reply-To: <d3982ff4-1c1e-3f16-4f6d-2aa42410d3da@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69be94db-208a-4e21-8b62-08d72187b630
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB5876; 
x-ms-traffictypediagnostic: AM0PR03MB5876:|AM0PR03MB5876:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB58763B542472F427F563180BE6AC0@AM0PR03MB5876.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(189003)(199004)(14444005)(54906003)(4326008)(71190400001)(8676002)(256004)(71200400001)(6512007)(102836004)(86362001)(6486002)(6246003)(53546011)(55236004)(6506007)(229853002)(14454004)(186003)(76176011)(99286004)(478600001)(26005)(53936002)(316002)(81166006)(66946007)(7736002)(80792005)(66476007)(6436002)(486006)(476003)(81156014)(446003)(5660300002)(2616005)(66556008)(64756008)(66446008)(36756003)(66066001)(2906002)(3846002)(25786009)(6116002)(91956017)(76116006)(8936002)(305945005)(11346002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5876;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: buxEY+09DMTbfCrKbez5zZcG7UP1VLyFvEgS2Gkzviwdo3wYTgZcpmapVC0foJuqhx5YMf73Yf7QwlUliGy1fhd8pgjpmvJ2jJzbKVOde3ledhMrurblgzuNsNUfmLFGgMt4nPQl+moNF0iDaZVBzu6cNLiVwzzGMi3OEr59RUrNn97E6h66e4lFVngCy8RQjzlN/JONUhV43fh6/KvJELYEsH9fQp2QbVlCueQlBHhk1z4GpIgWr0uBzDct7KpZdAW5BjsvxrUCiU9UUh1lkvgXlOeg6P7ylcgTgUpuPOck1Spm3xbvrItmHDzIt6O78Pz8JDa+Eft6hnz2Y3lgsaiT4A6lRy7v3Zybecd9QDHM9EEt4mLx3scP2MzU/Ibr5GrqSHIF3gFL5ymUkdgWWsZJey7o8PdZQHKLyDw9ICQ=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69be94db-208a-4e21-8b62-08d72187b630
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 13:51:45.6097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEQIRmKH9peHevhCrRl+PR1yqRDbIanJ/RiQ+cLwuRpIfihmbLcAdH9HTSu6k/AJXm0RE+ioctdx/tJCNa4HX5EYG1LXip30v7JCeXQx/DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5876
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpIFZvbG9keW15ciwKPgo+IE9uIDE1LzA4LzIwMTkg
MTM6MTQsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+
Pgo+Pj4gT24gMTUvMDgvMjAxOSAxMjoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEhpIFZv
bG9keW15ciwKPj4+Pgo+Pj4+IE9uIDE1LzA4LzIwMTkgMTI6MjAsIFZvbG9keW15ciBCYWJjaHVr
IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBIaSBTdGVmYW5vLAo+Pj4+Pgo+Pj4+PiBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JpdGVzOgo+Pj4+Pgo+Pj4+Pj4gT24gVHVlLCAxMyBBdWcgMjAxOSwgVm9sb2R5bXly
IEJhYmNodWsgd3JvdGU6Cj4+Pj4+Pj4+IEBAIC0xNjIsNiArMTU2LDEwIEBAIHN0YXRpYyB2b2lk
IF9faW5pdAo+Pj4+Pj4+PiBwcm9jZXNzX21lbW9yeV9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50
IG5vZGUsCj4+Pj4+Pj4+ICAgYm9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2Jhbmtz
XS5zaXplID0gc2l6ZTsKPj4+Pj4+Pj4gICBib290aW5mby5tZW0ubnJfYmFua3MrKzsKPj4+Pj4+
Pj4gICB9Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKyBpZiAoIGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA9
PSBOUl9NRU1fQkFOS1MgKQo+Pj4+Pj4+PiArIHJldHVybiAtRU5PU1BDOwo+Pj4+Pj4+IEFyZSB5
b3Ugc3VyZSB0aGF0IHRoaXMgbG9naWMgaXMgY29ycmVjdD8KPj4+Pj4+Pgo+Pj4+Pj4+IEZvciBl
eGFtcGxlLCBpZiBOUl9NRU1fQkFOS1MgaXMgMSwgYW5kIHdlIGhhdmUgZXhhY3RseSBvbmUgbWVt
b3J5IG5vZGUKPj4+Pj4+PiBpbiBkZXZpY2UgdHJlZSwgdGhpcyBmdW5jdGlvbiB3aWxsIGZhaWwu
IEJ1dCBpdCBzaG91bGQgbm90LiBJIHRoaW5rIHlvdQo+Pj4+Pj4+IHdhbnQgdGhpcyBjb25kaXRp
b246IGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA+IE5SX01FTV9CQU5LUwo+Pj4+Pj4KPj4+Pj4+IFlv
dSBhcmUgcmlnaHQsIGlmIE5SX01FTV9CQU5LUyBpcyAxIGFuZCB3ZSBoYXZlIDEgbWVtb3J5IG5v
ZGUgaW4gZGV2aWNlCj4+Pj4+PiB0cmVlIHRoZSBjb2RlIHdvdWxkIHJldHVybiBhbiBlcnJvciB3
aGlsZSBhY3R1YWxseSBpdCBpcyBub3JtYWwuCj4+Pj4+Pgo+Pj4+Pj4gSSB0aGluayB0aGUgcmln
aHQgY2hlY2sgd291bGQgYmU6Cj4+Pj4+Pgo+Pj4+Pj4gICBpZiAoIGkgPCBiYW5rcyAmJiBib290
aW5mby5tZW0ubnJfYmFua3MgPT0gTlJfTUVNX0JBTktTICkKPj4+Pj4+ICAgcmV0dXJuIC1FTk9T
UEM7Cj4+Pj4+Cj4+Pj4+IEFjdHVhbGx5LCB0aGlzIGRvZXMgbm90IGNvdmVyIGFsbCBjb3JuZXIg
Y2FzZXMuIEhlcmUgaXMgdGhlIHJlc3VsdGluZwo+Pj4+PiBjb2RlOgo+Pj4+Pgo+Pj4+PiAgIDE1
MCBmb3IgKCBpID0gMDsgaSA8IGJhbmtzICYmIGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA8IE5SX01F
TV9CQU5LUzsgaSsrICkKPj4+Pj4gICAxNTEgewo+Pj4+PiAgIDE1MiBkZXZpY2VfdHJlZV9nZXRf
cmVnKCZjZWxsLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzLAo+Pj4+PiAmc3RhcnQsICZzaXpl
KTsKPj4+Pj4gICAxNTMgaWYgKCAhc2l6ZSApCj4+Pj4+ICAgMTU0IGNvbnRpbnVlOwo+Pj4+PiAg
IDE1NSBib290aW5mby5tZW0uYmFua1tib290aW5mby5tZW0ubnJfYmFua3NdLnN0YXJ0ID0gc3Rh
cnQ7Cj4+Pj4+ICAgMTU2IGJvb3RpbmZvLm1lbS5iYW5rW2Jvb3RpbmZvLm1lbS5ucl9iYW5rc10u
c2l6ZSA9IHNpemU7Cj4+Pj4+ICAgMTU3IGJvb3RpbmZvLm1lbS5ucl9iYW5rcysrOwo+Pj4+PiAg
IDE1OCB9Cj4+Pj4+ICAgMTU5Cj4+Pj4+ICAgMTYwIGlmICggaSA8IGJhbmtzICYmIGJvb3RpbmZv
Lm1lbS5ucl9iYW5rcyA9PSBOUl9NRU1fQkFOS1MgKQo+Pj4+PiAgIDE2MSByZXR1cm4gLUVOT1NQ
QzsKPj4+Pj4KPj4+Pj4gTGluZXMgMTUzLTE1NCBjYXVzZSB0aGUgaXNzdWUuCj4+Pj4+Cj4+Pj4+
IEltYWdpbmUgdGhhdCBOUl9NRU1fQkFOS1MgPSAxIGFuZCB3ZSBoYXZlIHR3byBtZW1vcnkgbm9k
ZXMgaW4gZGV2aWNlCj4+Pj4+IHRyZWUgd2l0aC4gTm9kZXMgaGF2ZSBzaXplcyAwIGFuZCAxMDI0
LiBZb3VyIGNvZGUgd2lsbCB3b3JrIGFzCj4+Pj4+IGludGVuZGVkLiBBdCB0aGUgZW5kIG9mIGxv
b3Agd2Ugd2lsbCBoYXZlIGJhbmtzID0gMiwgaSA9IDIgYW5kCj4+Pj4+IGJvb3RpbmZvLm1lbS5u
cl9iYW5rcyA9IDEuCj4+Pj4+Cj4+Pj4+IEJ1dCBpZiB3ZSBzd2l0Y2ggb3JkZXIgb2YgbWVtb3J5
IG5vZGVzLCBzbyBmaXJzdCBvbmUgd2lsbCBiZSB3aXRoIHNpemUKPj4+Pj4gMTAyNCBhbmQgc2Vj
b25kIG9uZSB3aXRoIHNpemUgMCwgeW91ciBjb2RlIHdpbGwgcmV0dXJuIC1FTk9TUEMsIGJlY2F1
c2UKPj4+Pj4gd2UnbGwgaGF2ZSBiYW5rcyA9IDIsIGkgPSAxLCBib290aW5mby5tZW0ubnJfYmFu
a3MgPSAxLgo+Pj4+Pgo+Pj4+PiBJIHRoaW5rLCByaWdodCBzb2x1dGlvbiB3aWxsIGJlIHRvIHNj
YW4gYWxsIG5vZGVzIHRvIGNvdW50IG5vZGVzCj4+Pj4+IHdpdGggc2l6ZSA+IDAuIEFuZCB0aGVu
IC0gZWl0aGVyIHJldHVybiBhbiBlcnJvciBvciBkbyBzZWNvbmQgbG9vcCB0bwo+Pj4+PiBmaWxs
IGJvb3RpbmZvLm1lbS5iYW5rW10uCj4+Pj4KPj4+PiBUbyBiZSBob25lc3QsIGEgbWVtb3J5IHdp
dGggc2l6ZSAwIGlzIGFuIGVycm9yIGluIHRoZSBEVAo+Pj4+IHByb3ZpZGVkLiBTbyBJIHdvdWxk
IG5vdCBjYXJlIHRvbyBtdWNoIGlmIFhlbiBpcyBub3Qgd29ya2luZyBhcwo+Pj4+IGludGVuZGVk
Lgo+Pj4+Cj4+Pj4gSWYgd2Ugd2FudCB0byBmaXggdGhpcywgdGhlbiB3ZSBzaG91bGQgYmFpbCBv
dXQgYXMgd2UgZG8gZm9yIG1pc3NpbmcKPj4+PiAncmVncycgYW5kIGludmFsaWQgJ2FkZHJlc3Mt
Y2VsbHMnLydzaXplLWNlbGxzJy4KPj4+Cj4+PiBJIHNlbmQgdGhpcyB0b28gZWFybHkuIEkgZm9y
Z290IHRvIG1lbnRpb24gdGhhdCBJIHdvdWxkIG5vdCBiZSBoYXBweQo+Pj4gd2l0aCBwYXJzaW5n
IHRoZSBEZXZpY2UtVHJlZSB0d2ljZSBqdXN0IGZvciBiZW5lZml0cyBvZiB3cm9uZyBEVC4gSWYg
YQo+Pj4gRFQgaXMgd3JvbmcgdGhlbiB3ZSBzaG91bGQgdHJlYXQgYXMgc3VjaCBhbmQgc2hvdXQg
YXQgdGhlIHVzZXIuCj4+IEZhaXIgZW5vdWdoLiBCdXQgdGhlbiBhdCBsaW5lIDE1NCB3ZSBuZWVk
IHRvIHJldHVybiBhbiBlcnJvciwgaW5zdGVhZCBvZgo+PiBjb250aW51aW5nIHRoZSBpdGVyYXRp
b25zLiBBbmQgaW4gdGhpcyBjYXNlIHdlIGNhbiBzaW1wbGlmeSB0aGUgZXJyb3IKPj4gY2hlY2sg
dG8gKGJhbmtzID4gTlJfTUVNX0JBTktTKS4KPgo+IEkgYW0gYWZyYWlkIHRoaXMgd291bGQgbm90
IGJlIGNvcnJlY3QuIEl0IGlzIGFsbG93ZWQgdG8gaGF2ZSBtdWx0aXBsZQo+IG1lbW9yeSBub2Rl
cyBpbiB0aGUgZGV2aWNlLXRyZWUuIFRoaXMgZnVuY3Rpb24gb25seSBkZWFsIHdpdGggb25lIG5v
ZGUKPiBhdCB0aGUgdGltZXMuCk9rYXksIEkgc2VlIHRoZSBwb2ludCB0aGVyZS4KCj4gSW4gcGFy
dGljdWxhciBiYW5rcyBpcyB0aGUgbnVtYmVyIG9mIHJlZ2lvbnMgZGVzY3JpYmVkIGluIHRoZQo+
IG5vZGUuIFdpdGggdGhlIGNoZWNrIHlvdSBzdWdnZXN0LCB5b3Ugd291bGQgb25seSBjYXRjaCB0
aGUgY2FzZSB3aGVyZQo+IGEgbm9kZSBjb250YWluIG1vcmUgYmFua3MgdGhhbiBzdXBwb3J0ZWQu
IEl0IGRvZXMgbm90IHRlbGwgeW91IHdoZXRoZXIKPiB0aGVyZSBhcmUgZW5vdWdoIHNwYWNlIGxl
ZnQgaW4gbWVtLmJhbmtbLi4uXSB0byBjYXRlciB0aGUgcmVnaW9ucwo+IGRlc2NyaWJlZCBieSB0
aGUgbm9kZS4KWWVzLCByaWdodC4gQnV0LCB3ZSBjYW4gZnJlZSBzcGFjZToKCihiYW5rcyArIGJv
b3RpbmZvLm1lbS5ucl9iYW5rcyA+IE5SX01FTV9CQU5LUykKCj4gU28gd2UgbmVlZCB0aGUgY2hl
Y2sgc3VnZ2VzdGVkIGJ5IFN0ZWZhbm8uCkFzIEkgc2FpZCBlYXJsaWVyLCBpdCBkb2VzIG5vdCBj
b3ZlciBhbGwgY29ybmVyIGNhc2VzLiBJdCB3aWxsIGJlaGF2ZQpkaWZmZXJlbnRseSwgZGVwZW5k
aW5nIG9uIG9yZGVyaW5nIG9mIGVudHJpZXMgaW4gInJlZyIgcHJvcGVydHkgKGlmIHdlCmFsbG93
IHplcm8tbGVuZ3RoIHJlZ2lvbnMpLiBZZXMsIHRoaXMgaXMgdGhlIHVzZXIncyBwcm9ibGVtLCBi
dXQgSSB0aGluawppdCBpcyBiZXR0ZXIgdG8gaGF2ZSBjb25zaXN0ZW50IGJlaGF2aW9yIGV2ZW4g
aW4gY2FzZSBvZiB1c2VyJ3MgZmF1bHQuCgpCdXQgd2VyZSBzYXlpbmcsIHRoYXQgaXQgaXMgZXJy
b3IgdG8gaGF2ZSByZWdpb24gd2l0aCB6ZXJvIGxlbmd0aC4gU28sCmluc3RlYWQgb2YKCiBkZXZp
Y2VfdHJlZV9nZXRfcmVnKCZjZWxsLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzLCAmc3RhcnQs
ICZzaXplKTsKIGlmICggIXNpemUgKQogICAgIGNvbnRpbnVlOwoKd2UgbmVlZAoKIGRldmljZV90
cmVlX2dldF9yZWcoJmNlbGwsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsICZzdGFydCwgJnNp
emUpOwogaWYgKCAhc2l6ZSApCiAgICAgcmV0dXJuIC1FTk9FTlQ7CgpJbiB0aGlzIGNhc2UsIGNo
ZWNrIHN1Z2dlc3RlZCBieSBTdGVmYW5vIHdpbGwgd29yayBmaW5lLCBidXQgaXQgd2lsbCBiZQpy
ZWR1bmRhbnQsIGJlY2F1c2Ugd2UgY2FuIGVpdGhlciBkbyBlYXJseSBjaGVjayBmb3IgZnJlZSBz
cGFjZSBpbiB0aGUKYXJyYXksIG9yIGp1c3Qgd3JpdGUKCiBpZiAoIGkgPCBiYW5rcyApCiAgICAg
cmV0dXJuIC1FTk9TUEM7CgpJZiB3ZSB3YW50IGFycmF5IHRvIGJlIGZpbGxlZCBubyBtYXRlciB3
aGF0LgoKCkFueXdheXMsIEkgZG9uJ3Qgd2FudCB0byBwcmVzcyBvbiB0aGlzIGFueW1vcmUuIEkg
anVzdCB3YW50ZWQgdG8gc2hhcmUKbXkgY29uY2VybnMuCgotLQpWb2xvZHlteXIgQmFiY2h1ayBh
dCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

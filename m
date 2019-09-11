Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE4B035C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 20:04:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i86wA-00016C-9I; Wed, 11 Sep 2019 18:01:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b1gu=XG=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i86w8-000167-ME
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 18:01:48 +0000
X-Inumbo-ID: 388adaf2-d4be-11e9-b299-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::61b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 388adaf2-d4be-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 18:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzwIoQTc1FbLvsFNelTj/R8B3vVRNDFlStX9282ixyMfQRikDX+aQvEDHdzl5fkiydgax0C4dscbPvMvGn8+bcm1zHahs9WBD6X6d/Ak9qYa3v3Q5w5zBn6XEvUMXz3uQWGyvCKslKkLZVT7JBAg4w5I/N2WzJXfy4LBNdMguMg/ABLcaq5JjfsPxzEoBU41ucFhwzbhAkzM0oevB63tTLsdk6Af+DDoCFWCoWzM+IF2I140teZdsSegOj2ZlgfQS6h9+6Lqh1WirtiqG09zwHtXIqKFppNujGM45s5Ir+ARhB3FKF+Eh1rHXGkiAUwYtLdrwYqvMh7EYsz2ruH1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xisAQ9QwDMqeJjbrktgWnbvZ71labpa9ITYz7uFx6Y=;
 b=M0O/Uvw09LtqGmsHa8Sh9v7JVtxb+JufGlXFpVFWSort13L9nCMO+V7Q+1T3Cxumv6fPb3qEkIAHHr1d322GxScCiw2buyiXX1OkRtJedyYiGqz8CUuUCeOhK8C/sbdYoC2lVtGeNu3jOZgGiR+ILwBtiu3M1Hx42CUB4Cvheq+a0KKtxlDPTx+FVOBSXl626Yy0aFMYMbNYaL8en+xEQePag8rQGjtiBggJQqatdZSgv/qjO5CT8zgj9lT+Bh1vZV2Wa9mOvYbT035liGyMIqeE4J1/q9ANGgmTcY9RfSB6xavaokDAOAYUTaIi3juvzDwKuAsNE3eLyJO4vjrCXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xisAQ9QwDMqeJjbrktgWnbvZ71labpa9ITYz7uFx6Y=;
 b=uPOLyxhXfCCkd2mJA2eNgwYiqRiZJnr5e8ATrAQdYiwTKATvNTXXg/IOBfxlZ7QuDIHEk6Plal4B4wZ5B1SCSYjUTaFsZDQBHhfPekgpyEzvzO4e7h8QO3Yrm260GYoRMI9s3gbSrodsqr4Rvy+7GNwscRX++ymlFPUpxOihLQM=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5028.eurprd03.prod.outlook.com (20.178.21.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 18:01:45 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 11 Sep 2019
 18:01:45 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Thread-Topic: [Xen-devel] [RFC 1/9] schedule: Introduce per-pcpu time
 accounting
Thread-Index: AQHVaIxKZPZB1+b+UEeHqKVXpxsigKcmxNgA
Date: Wed, 11 Sep 2019 18:01:44 +0000
Message-ID: <87o8zqg19z.fsf@epam.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
 <1568197942-15374-2-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1568197942-15374-2-git-send-email-andrii.anisov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85129c9e-68c7-4a44-1700-08d736e21bbd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5028; 
x-ms-traffictypediagnostic: AM0PR03MB5028:|AM0PR03MB5028:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB502894C348D1EAAA7D24E43AE6B10@AM0PR03MB5028.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(189003)(199004)(3846002)(229853002)(36756003)(99286004)(14454004)(11346002)(446003)(6512007)(478600001)(305945005)(71190400001)(71200400001)(7416002)(81156014)(25786009)(8936002)(8676002)(64756008)(81166006)(66556008)(53936002)(66946007)(2906002)(5660300002)(6436002)(66446008)(256004)(14444005)(6916009)(6246003)(7736002)(66476007)(6486002)(486006)(86362001)(476003)(4326008)(6116002)(2616005)(6506007)(54906003)(76116006)(91956017)(26005)(186003)(15650500001)(55236004)(102836004)(316002)(80792005)(76176011)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5028;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nkQ2S+7c4U4BX6dHij0FH615IHcaxEzU/hB2lzwnpvZp6dtOZU0mehTXPxSsujVd7Nb4bXtS87WDEw0OLaQBlsB6oa9XzOae4yRdSjOTQTxkOvRx0rdP5zqbQYtBFWVgeVixgxuAMcfxPWEWPLexA0AihGPm+sLquRIXbtEpfI6vfIf2933YEDU4/H2E4KF9FGeZBMreljhelCGUW3qy9Y9xaQ8YepLk+1dw5aQlsCAZE4+FTehc6wyJTGmlkIQFxPQJ6pTf/WJ6KyEQnyj6u1Q11OcPKGJu9p7d2k7BeKCUJhshT/HXigiyHNeOa7v66MJGf4aWrQ2Smd2KKk9aPysWzYqYC536Yfu47bSdB8o8NgWJe0/+q8qFGl8wK0Q8iJmA4tXdC7RDHDFF1nUxc21ZpjqBtbrqjNvriSuPH5I=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85129c9e-68c7-4a44-1700-08d736e21bbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 18:01:45.0651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W7+7ho86QsMeJt35W+1P9kywONGsMELNUhv7Q+HyxiPQYLlRAJ27H/P+Q7EkQTyqUvyGsw5r32vM6e8KP8cpvFwcC2QIbnDCTqDDwcdjUs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5028
Subject: Re: [Xen-devel] [RFC 1/9] schedule: Introduce per-pcpu time
 accounting
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkFuZHJpaSwKCkFuZHJpaSBBbmlzb3Ygd3JpdGVzOgoKPiBGcm9tOiBBbmRyaWkgQW5pc292IDxh
bmRyaWlfYW5pc292QGVwYW0uY29tPgo+Cj4gSW50cm9kdWNlIHBlci1wY3B1IHRpbWUgYWNjb3Vu
dGluZyB3aGF0IGluY2x1ZGVzIHRoZSBmb2xsb3dpbmcgc3RhdGVzOgo+Cj4gVEFDQ19IWVAgLSB0
aGUgcGNwdSBleGVjdXRlcyBoeXBlcnZpc29yIGNvZGUgbGlrZSBzb2Z0aXJxIHByb2Nlc3NpbmcK
PiAgICAgICAgICAgIChpbmNsdWRpbmcgc2NoZWR1bGluZyksIHRhc2tsZXRzIGFuZCBjb250ZXh0
IHN3aXRjaGVzCj4gVEFDQ19HVUVTVCAtIHRoZSBwY3B1IGV4ZWN1dGVzIGd1ZXN0cyBjb2RlCj4g
VEFDQ19JRExFIC0gdGhlIGxvdy1wb3dlciBzdGF0ZSBvZiB0aGUgcGNwdQpJcyBpdCByZWFsbHkg
bG93LXBvd2VyPwoKPiBUQUNDX0lSUSAtIHRoZSBwY3B1IHBlcmZvcm1zIGludGVycnVwdHMgcHJv
Y2Vzc2luZywgd2l0aG91dCBzZXBhcmF0aW9uIHRvCj4gICAgICAgICAgICBndWVzdCBvciBoeXBl
cnZpc29yIGludGVycnVwdHMKSSB0aGluaywgd29yZCAiZGlzdGluZ3Vpc2hpbmciIHdvdWxkIGJl
IGJldHRlciB0aGFuICJzZXBhcmF0aW9uIgoKPiBUQUNDX0dTWU5DIC0gdGhlIHBjcHUgZXhlY3V0
ZXMgaHlwZXJ2aXNvciBjb2RlIHRvIHByb2Nlc3Mgc3luY2hyb25vdXMgdHJhcAo+ICAgICAgICAg
ICAgICBmcm9tIHRoZSBndWVzdC4gRS5nLiBoeXBlcmNhbGwgcHJvY2Vzc2luZyBvciBpbyBlbXVs
YXRpb24uCj4KPiBDdXJyZW50bHksIHRoZSBvbmx5IHJlZW50ZXJhbnQgc3RhdGUgaXMgVEFDQ19J
UlEuIEl0IGlzIGFzc3VtZWQsIG5vIGNoYW5nZXMKPiB0byBzdGF0ZSBvdGhlciB0aGFuIFRBQ0Nf
SVJRIGNvdWxkIGhhcHBlbiB1bnRpbCB3ZSByZXR1cm4gZnJvbSBuZXN0ZWQKPiBpbnRlcnJ1cHRz
LiBJUlEgdGltZSBpcyBhY2NvdW50ZWQgaW4gYSBkaXN0aW5jdCB3YXkgY29tcGFyaW5nIHRvIG90
aGVyIHN0YXRlcy4KPiBJdCBpcyBhY3VtdWxhdGVkIGJldHdlZW4gb3RoZXIgc3RhdGVzIHRyYW5z
aXRpb24gbW9tZW50cywgYW5kIGlzIHN1YnN0cmFjdGVkCj4gZnJvbSB0aGUgb2xkIHN0YXRlIG9u
IHN0YXRlcyB0cmFuc2lvbiBjYWxjdWxhdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gLS0tCj4gIHhlbi9jb21tb24vc2NoZWR1
bGUuYyAgIHwgODEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDI3ICsrKysrKysrKysrKysrKysrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBpbmRleCA3YjcxNTgx
Li42ZGQ2NjAzIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+ICsrKyBiL3hl
bi9jb21tb24vc2NoZWR1bGUuYwo+IEBAIC0xNTM5LDYgKzE1MzksODcgQEAgc3RhdGljIHZvaWQg
c2NoZWR1bGUodm9pZCkKPiAgICAgIGNvbnRleHRfc3dpdGNoKHByZXYsIG5leHQpOwo+ICB9Cj4g
IAo+ICtERUZJTkVfUEVSX0NQVShzdHJ1Y3QgdGFjYywgdGFjYyk7Cj4gKwo+ICtzdGF0aWMgdm9p
ZCB0YWNjX3N0YXRlX2NoYW5nZShlbnVtIFRBQ0NfU1RBVEVTIG5ld19zdGF0ZSkKPiArewo+ICsg
ICAgc190aW1lX3Qgbm93LCBkZWx0YTsKPiArICAgIHN0cnVjdCB0YWNjKiB0YWNjID0gJnRoaXNf
Y3B1KHRhY2MpOwo+ICsgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCj4gKyAgICBsb2NhbF9p
cnFfc2F2ZShmbGFncyk7Cj4gKwo+ICsgICAgbm93ID0gTk9XKCk7Cj4gKyAgICBkZWx0YSA9IG5v
dyAtIHRhY2MtPnN0YXRlX2VudHJ5X3RpbWU7Cj4gKwo+ICsgICAgLyogV2UgZG8gbm90IGV4cGVj
dCBzdGF0ZXMgcmVlbnRlcmFiaWxpdHkgKGF0IGxlYXN0IHRocm91Z2ggdGhpcyBmdW5jdGlvbikq
Lwo+ICsgICAgQVNTRVJUKG5ld19zdGF0ZSAhPSB0YWNjLT5zdGF0ZSk7Cj4gKwo+ICsgICAgdGFj
Yy0+c3RhdGVfdGltZVt0YWNjLT5zdGF0ZV0gKz0gZGVsdGEgLSB0YWNjLT5pcnFfdGltZTsKPiAr
ICAgIHRhY2MtPnN0YXRlX3RpbWVbVEFDQ19JUlFdICs9IHRhY2MtPmlycV90aW1lOwo+ICsgICAg
dGFjYy0+aXJxX3RpbWUgPSAwOwo+ICsgICAgdGFjYy0+c3RhdGUgPSBuZXdfc3RhdGU7Cj4gKyAg
ICB0YWNjLT5zdGF0ZV9lbnRyeV90aW1lID0gbm93Owo+ICsKPiArICAgIGxvY2FsX2lycV9yZXN0
b3JlKGZsYWdzKTsKPiArfQo+ICsKPiArdm9pZCB0YWNjX2h5cChpbnQgcGxhY2UpCkkgYmVsaWV2
ZSwgeW91IHdhbnQgc29tZSBlbnVtIGZvciB0aGlzICJwbGFjZSIgcGFyYW1ldGVyIHR5cGUKPiAr
ewo+ICsvLyAgICBwcmludGsoIlx0dGFjY19oeXAgJXUsIHBsYWNlICVkXG4iLCBzbXBfcHJvY2Vz
c29yX2lkKCksIHBsYWNlKTsKUGxlYXNlLCBkb24ndCBwdXNoIGNvbW1lbnRlZC1vdXQgY29kZS4g
QlRXLCBJIHRoaW5rLCBpdCBpcyBwb3NzaWJsZSB0bwphZGQgc29tZSBUQUNDX0RFQlVHIGZhY2ls
aXRpZXMgdG8gZW5hYmxlL2Rpc2FibGUgdGhpcyB0cmFjZXMgZHVyaW5nCmNvbXBpbGUtdGltZS4K
CkFsc28sIGxvb2tzIGxpa2UgeW91IGRvbid0IHVzZSAicGxhY2UiIHBhcmFtZXRlciBhdCBhbGwu
CgpMYXN0bHksIEkgYmVsaWV2ZSB0aGF0IHRoaXMgZnVuY3Rpb24gKGFuZCBvdGhlciBzaW1pbGFy
IGZ1bmN0aW9ucyBiZWxvdykKY2FuIGJlIGRlZmluZWQgYXMgInN0YXRpYyBpbmxpbmUiIGluIGEg
aGVhZGVyIGZpbGUuCgo+ICsgICAgdGFjY19zdGF0ZV9jaGFuZ2UoVEFDQ19IWVApOwo+ICt9Cj4g
Kwo+ICt2b2lkIHRhY2NfZ3Vlc3QoaW50IHBsYWNlKQo+ICt7Cj4gKy8vICAgIHByaW50aygiXHR0
YWNjX2d1ZXN0ICV1LCBwbGFjZSAlZFxuIiwgc21wX3Byb2Nlc3Nvcl9pZCgpLCBwbGFjZSk7Cj4g
KyAgICB0YWNjX3N0YXRlX2NoYW5nZShUQUNDX0dVRVNUKTsKPiArfQo+ICsKPiArdm9pZCB0YWNj
X2lkbGUoaW50IHBsYWNlKQo+ICt7Cj4gKy8vICAgIHByaW50aygiXHRpZGxlIGNwdSAldSwgcGxh
Y2UgJWRcbiIsIHNtcF9wcm9jZXNzb3JfaWQoKSwgcGxhY2UpOwo+ICsgICAgdGFjY19zdGF0ZV9j
aGFuZ2UoVEFDQ19JRExFKTsKPiArfQo+ICsKPiArdm9pZCB0YWNjX2dzeW5jKGludCBwbGFjZSkK
PiArewo+ICsvLyAgICBwcmludGsoIlx0dGFjY19nc3luYyAldSwgcGxhY2UgJWRcbiIsIHNtcF9w
cm9jZXNzb3JfaWQoKSwgcGxhY2UpOwo+ICsgICAgdGFjY19zdGF0ZV9jaGFuZ2UoVEFDQ19HU1lO
Qyk7Cj4gK30KPiArCj4gK3ZvaWQgdGFjY19pcnFfZW50ZXIoaW50IHBsYWNlKQo+ICt7Cj4gKyAg
ICBzdHJ1Y3QgdGFjYyogdGFjYyA9ICZ0aGlzX2NwdSh0YWNjKTsKPiArCj4gKy8vICAgIHByaW50
aygiXHR0YWNjX2lycV9lbnRlciAldSwgcGxhY2UgJWQsIGNudCAlZFxuIiwgc21wX3Byb2Nlc3Nv
cl9pZCgpLCBwbGFjZSwgdGhpc19jcHUodGFjYykuaXJxX2NudCk7Cj4gKyAgICBBU1NFUlQoIWxv
Y2FsX2lycV9pc19lbmFibGVkKCkpOwo+ICsgICAgQVNTRVJUKHRhY2MtPmlycV9jbnQgPj0gMCk7
CllvdSBjYW4gbWFrZSBpcnFfY250IHVuc2lnbmVkIGFuZCBkcm9wIHRoaXMgYXNzZXJ0LgoKPiAr
Cj4gKyAgICBpZiAoIHRhY2MtPmlycV9jbnQgPT0gMCApCj4gKyAgICB7Cj4gKyAgICAgICAgdGFj
Yy0+aXJxX2VudGVyX3RpbWUgPSBOT1coKTsKPiArICAgIH0KQ29kaW5nIHN0eWxlOgoKLS0tCkJy
YWNlcyBzaG91bGQgYmUgb21pdHRlZCBmb3IgYmxvY2tzIHdpdGggYSBzaW5nbGUgc3RhdGVtZW50
LiBlLmcuLAoKaWYgKCBjb25kaXRpb24gKQogICAgc2luZ2xlX3N0YXRlbWVudCgpOwotLS0KCj4g
Kwo+ICsgICAgdGFjYy0+aXJxX2NudCsrOwo+ICt9Cj4gKwo+ICt2b2lkIHRhY2NfaXJxX2V4aXQo
aW50IHBsYWNlKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgdGFjYyogdGFjYyA9ICZ0aGlzX2NwdSh0YWNj
KTsKPiArCj4gKy8vICAgIHByaW50aygiXHR0YWNjX2lycV9leGl0ICV1LCBwbGFjZSAlZCwgY250
ICVkXG4iLCBzbXBfcHJvY2Vzc29yX2lkKCksIHBsYWNlLCB0YWNjLT5pcnFfY250KTsKPiArICAg
IEFTU0VSVCghbG9jYWxfaXJxX2lzX2VuYWJsZWQoKSk7Cj4gKyAgICBBU1NFUlQodGFjYy0+aXJx
X2NudCA+IDApOwo+ICsgICAgaWYgKCB0YWNjLT5pcnFfY250ID09IDEgKQo+ICsgICAgewo+ICsg
ICAgICAgIHRhY2MtPmlycV90aW1lID0gTk9XKCkgLSB0YWNjLT5pcnFfZW50ZXJfdGltZTsKPiAr
ICAgICAgICB0YWNjLT5pcnFfZW50ZXJfdGltZSA9IDA7Cj4gKyAgICB9Cj4gKwo+ICsgICAgdGFj
Yy0+aXJxX2NudC0tOwpXaGF0IGlmLCB5b3UgSVJRIHdpbGwgYXJyaXZlIHJpZ2h0IGFmdGVyIHRo
aXM/IEkgYmVsaWV2ZSwgeW91IHdpbGwgbG9zZQpzb21lIG9mIHRoZSBhY2N1bXVsYXRlZCB0aW1l
LgoKPiArfQo+ICsKPiAgdm9pZCBjb250ZXh0X3NhdmVkKHN0cnVjdCB2Y3B1ICpwcmV2KQo+ICB7
Cj4gICAgICAvKiBDbGVhciBydW5uaW5nIGZsYWcgL2FmdGVyLyB3cml0aW5nIGNvbnRleHQgdG8g
bWVtb3J5LiAqLwo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oCj4gaW5kZXggZTM2MDFjMS4uMDRhODcyNCAxMDA2NDQKPiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
Cj4gQEAgLTEwMDIsNiArMTAwMiwzMyBAQCBleHRlcm4gdm9pZCBkdW1wX3J1bnEodW5zaWduZWQg
Y2hhciBrZXkpOwo+ICAKPiAgdm9pZCBhcmNoX2RvX3BoeXNpbmZvKHN0cnVjdCB4ZW5fc3lzY3Rs
X3BoeXNpbmZvICpwaSk7Cj4gIAo+ICtlbnVtIFRBQ0NfU1RBVEVTIHsKSWYgSSByZW1lbWJlciBj
b3JyZWN0LCBlbnVtIG5hbWVzIHNob3VsZCBpbiBsb3dlciBjYXNlCgo+ICsgICAgVEFDQ19IWVAg
PSAwLAo+ICsgICAgVEFDQ19HVUVTVCA9IDEsCj4gKyAgICBUQUNDX0lETEUgPSAyLAo+ICsgICAg
VEFDQ19JUlEgPSAzLAo+ICsgICAgVEFDQ19HU1lOQyA9IDQsCj4gKyAgICBUQUNDX1NUQVRFU19N
QVgKPiArfTsKPiArCj4gK3N0cnVjdCB0YWNjCj4gK3sKPiArICAgIHNfdGltZV90IHN0YXRlX3Rp
bWVbVEFDQ19TVEFURVNfTUFYXTsKPiArICAgIHNfdGltZV90IHN0YXRlX2VudHJ5X3RpbWU7Cj4g
KyAgICBpbnQgc3RhdGU7CmVudW0sIG1heWJlPwoKPiArCj4gKyAgICBzX3RpbWVfdCBndWVzdF90
aW1lOwo+ICsKPiArICAgIHNfdGltZV90IGlycV9lbnRlcl90aW1lOwo+ICsgICAgc190aW1lX3Qg
aXJxX3RpbWU7Cj4gKyAgICBpbnQgaXJxX2NudDsKPiArfTsKPiArCj4gK0RFQ0xBUkVfUEVSX0NQ
VShzdHJ1Y3QgdGFjYywgdGFjYyk7Cj4gKwo+ICt2b2lkIHRhY2NfaHlwKGludCBwbGFjZSk7Cj4g
K3ZvaWQgdGFjY19pZGxlKGludCBwbGFjZSk7CldoYXQgYWJvdXQgZnVuY3Rpb25zIGZyb20gc2No
ZWQuYz8gU2hvdWxkIHRoZXkgYmUgZGVjbGFyZWQgdGhlcmU/Cgo+ICsKPiAgI2VuZGlmIC8qIF9f
U0NIRURfSF9fICovCj4gIAo+ICAvKgoKCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15EB02C3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 19:36:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i86Uy-0006mj-Pf; Wed, 11 Sep 2019 17:33:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b1gu=XG=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i86Ux-0006me-R6
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 17:33:43 +0000
X-Inumbo-ID: 4c77be44-d4ba-11e9-b299-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::606])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c77be44-d4ba-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 17:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqvDv5uIIe9LgjA8Vm+Pjj9v3SZOQToVp4HlxT1YbJrqwLsCFFUSqB9QgSQ/bynRwHefq7ZWTXF7K+IPO3/Zn7xp3SP5lAT9kGCcIXqNVs8Zy6mzooR8ayqagWKddeYBNKFRRfJKTta0h3WMNusT71cus0pvuXcq2nonoczF/irxodDvLmo+6i+HVQ25Els6yQNl4oD6ULkC0IKlguCT+BxjT0jO5GrxDHi8aqnIEYiU3y8LHvuVoRm+hZAUT+iWJUjkeEPqOZJDCXuiGf+Rw0i7M28BYprxV2vRzr19ZTmnwTz/V9511Ox0XNSQPJC67kB2cClPTY8DwtRr6jp5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NigbpUrL5HMP4/yfs0p43jMb7ssjY5WhmB0o2fOLwXA=;
 b=R1CoWzyFLGQLeKCfnPpP5MYmlAHQOslSA2lsvVuGVQb6uc+nDgex/6Qm2R0hO3Cp57rj5VNpORY3RTw49b2aSL1VHTGJPp59o0TXReXCcvV9Mst13x+wf3OXsIk9UqPiE9NMB1PXIf3kHlX5KXfhiOKiV54Fb7pEqmuFugrYh35Thni8Nwa/+WBnhlMllDhb89ARwp5YM3P4e361WUSCLWNuKLyIAhgsIsTx6GqF+Kj7IHditgERu/smJ8BTDbicDwJ52QPkfk3XzE4kDu13fxRgU0Cdi2e/HWQXWDce4fxU9ftXqWEBRieA0+RnqeVDPI1DdxyslnqpaI3Aw/PBlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NigbpUrL5HMP4/yfs0p43jMb7ssjY5WhmB0o2fOLwXA=;
 b=rVY47eXZV62K/Bk3SqyMvzdXlqMXG9rwquJKI27Yf3aWcUXwYGZyV0almcRukqsyrTZqng12sjk8Q1g9f11zUN3ETvI1QZQPy2J44dGa0vLD0YqiRiP7qMyfVDH8DNIafS8qb+1OgcILNRrof4rNJiDf+NjfHqFhjCn52rF/RAM=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5121.eurprd03.prod.outlook.com (20.178.22.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Wed, 11 Sep 2019 17:33:41 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 11 Sep 2019
 17:33:41 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH] xen/arm: bootfd: Fix indentation in
 process_multiboot_node()
Thread-Index: AQHVaLRki9HO4fjSXUWIq6dkBI8peacmvLAA
Date: Wed, 11 Sep 2019 17:33:41 +0000
Message-ID: <87r24mg2kr.fsf@epam.com>
References: <20190911151942.28459-1-julien.grall@arm.com>
In-Reply-To: <20190911151942.28459-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd7f4cdd-2b52-410a-0a70-08d736de301e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5121; 
x-ms-traffictypediagnostic: AM0PR03MB5121:|AM0PR03MB5121:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB5121688C03A79A3BC101A1F7E6B10@AM0PR03MB5121.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(189003)(199004)(316002)(71200400001)(71190400001)(107886003)(66946007)(3846002)(53936002)(6246003)(4326008)(36756003)(256004)(14444005)(6436002)(229853002)(7736002)(66066001)(6486002)(8676002)(81166006)(6506007)(6916009)(186003)(26005)(55236004)(81156014)(102836004)(66446008)(478600001)(64756008)(486006)(99286004)(66556008)(476003)(6116002)(54906003)(86362001)(91956017)(76116006)(305945005)(2906002)(25786009)(5660300002)(76176011)(8936002)(446003)(80792005)(11346002)(6512007)(2616005)(14454004)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5121;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DOupwg5FmdYcgBoqu6YfwGsgAxbev09bGfpfND+XCq1QWMJ+tiMMbHP0Jrh9JnBKol/h9g0+D/mmVEdVbYB6YkW1aIpHRuu7P7jJ5kuKqJYh0Jeh5dZfaYdSMUrKSM3u/2LfaptBYzyar9Nzy/uFlyAQm8lLKmN2sQbywJklWtfV3LumsQpT2T2B8qu1dgmYOme01JiijiOUzWAr6arHZtJOHl+dqr+iNmfVUBVQvKvKuJN1pZAonR+AoWacufBs/3r3kpaD/bUruxzUpyhRHpvtNTtkdZJrW8+3uQaDlzXT9iv+en26osx7Rtp+Kn8u4mIQFnWykn2yzAk6fs91iCAZ7mRDCB/2iVSieNLBY1m3hohTqqGmkH2kqhU/057wWkEsW6jr8NUHp3K2wmNGZ2Y1kXxYoT1L/uR4XxCiXL4=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7f4cdd-2b52-410a-0a70-08d736de301e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 17:33:41.3169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UY3t5404J9BawhzgUsb1sAXZ43b3frL4pM3duuVOxy37IkauQlUdPg4yf3574FEULJnPbL5dRVTGJf7+SY3BhZ8nJRizGW/P0itKTHMJRCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5121
Subject: Re: [Xen-devel] [PATCH] xen/arm: bootfd: Fix indentation in
 process_multiboot_node()
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

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uZSBsaW5lIGluIHByb2Nlc3NfbXVsdGlib290X25v
ZGUoKSBpcyB1c2luZyBoYXJkIHRhYiByYXRoZXIgdGhhbiBzb2Z0Cj4gdGFiLiBTbyBmaXggaXQh
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpS
ZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29t
PgoKU28sIGh1bnRpbmcgdGhlbSBvbmUtYnktb25lIGlzIHRoZSBwcmVmZXJyZWQgd2F5PyBJJ20g
YXNraW5nIHRoaXMKYmVjYXVzZSB0aGVyZSBhcmUgbW9yZSBvZiB0aGVtOgoKJSBmaW5kIHhlbi9h
cmNoL2FybSAtdHlwZSBmIC1uYW1lICIqLltjaF0iIC1leGVjIGdyZXAgLWxQICJcdCIge30gXDsK
eGVuL2FyY2gvYXJtL3RyYXBzLmMKeGVuL2FyY2gvYXJtL2FjcGkvYm9vdC5jCnhlbi9hcmNoL2Fy
bS9hcm0zMi9saWIvYXNzZW1ibGVyLmgKeGVuL2FyY2gvYXJtL2FybTY0L2xpdmVwYXRjaC5jCnhl
bi9hcmNoL2FybS9hcm02NC9saWIvZmluZF9uZXh0X2JpdC5jCnhlbi9hcmNoL2FybS9hcm02NC9p
bnNuLmMKeGVuL2FyY2gvYXJtL2FsdGVybmF0aXZlLmMKeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAo
YXBwYXJlbnRseSwgSSBkb24ndCBoYXZlIHRoaXMgcGF0Y2ggYXBwbGllZCkKCgo+IC0tLQo+ICB4
ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYm9vdGZk
dC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+IGluZGV4IDI1OGIwNTdmMDAuLjYyMzE3M2Jj
N2YgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+ICsrKyBiL3hlbi9hcmNo
L2FybS9ib290ZmR0LmMKPiBAQCAtMjY0LDcgKzI2NCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBw
cm9jZXNzX211bHRpYm9vdF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCj4gICAgICAg
ICAgY2FzZSAxOiBraW5kID0gQk9PVE1PRF9SQU1ESVNLOyBicmVhazsKPiAgICAgICAgICBkZWZh
dWx0OiBicmVhazsKPiAgICAgICAgICB9Cj4gLQlpZiAoIGtpbmRfZ3Vlc3MgPiAxICYmIGhhc194
c21fbWFnaWMoc3RhcnQpICkKPiArICAgICAgICBpZiAoIGtpbmRfZ3Vlc3MgPiAxICYmIGhhc194
c21fbWFnaWMoc3RhcnQpICkKPiAgICAgICAgICAgICAga2luZCA9IEJPT1RNT0RfWFNNOwo+ICAg
ICAgfQoKCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C82B67F9
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 18:24:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAchr-0005RI-3W; Wed, 18 Sep 2019 16:21:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cKO=XN=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iAchp-0005R7-Ha
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 16:21:25 +0000
X-Inumbo-ID: 5acd27ba-da30-11e9-963c-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5acd27ba-da30-11e9-963c-12813bfff9fa;
 Wed, 18 Sep 2019 16:21:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVdUJUldf/+Cp2a8vv7K3PZ8iy88Xl51sG6Bge3ezSsg5JYPmVrYFv8fP0X2Tboi2BhYA6GZOe9Q2Cjx4Y8QxApr2bwfG8EPQesOpmLAFTgTh8WVboILhfaPuho+k9R710Et4W5Caw/oFmU7VSukDZtkWXL4ZN5Ly7LW72jv7QoZZIWxNGR6Tn6JztIH7xg8HuM6HJgMbWPFb1ni1EsA6puDWdFGJmZmM4fk3HKds8jaP6M/CYqTcVT8g79uKzknb1lw/KEjD4JG8I8q+4eXHI4Fe6GTcxZTjMLr9T0O5hoif5VPUmBFvVjbrYepE3YqzG08bPdo2IGuDxnCJNZUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YOwNOdSnX4JvSxy39YZzNmxYH1ZTl79OD2ReWDPExY=;
 b=c3sojwMg0iHZIPBoLtefD1WcId1NTBojfJB39x42DFI6/6WKb3Z9xTHXw0xBTVBRgMqzEeREaPI6ups+wXqEKhhNiazXI/uv6jIdsuFbqEqCoqKJwSDSZ5PfG2KADYOCYNDRMXYP52mFw1DgyS6tH2X0E+m7tgFcTojlBunL9Uur39EgMWdGuLWEJpLOBr2XzqiJLbM+dRswc70dqHjP6AfyHzStcrbSDmaJXz1IwWims3E964yf5D8tpMXY4aN8Yg62OfjXXyVA2QosY7nshXmKUQHNQrXi3iUt1/YmFzR9xNWiCXyPZ4oCekPT3SGbXR5o45VZZ1twvJcZW4tvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YOwNOdSnX4JvSxy39YZzNmxYH1ZTl79OD2ReWDPExY=;
 b=SG2qC5IipMv1kI3bdrHqCsVEFNLBCdcL7MLdeET3hF20ILdFzuAERHcpjeNKSWPhQB6zU7eTxcoVLs6uXVV2tVeJMffQYgGnjZekdGxunkVkGVW7ruw3sb4eCmZ45dDyn8+S0dTt0SqqRmbCQ/KQgDdGnKG6/HIgZJ+UhJYQrTU=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5554.eurprd03.prod.outlook.com (20.179.255.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 18 Sep 2019 16:21:21 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 18 Sep 2019
 16:21:21 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH for-4.13] xen/arm: livepatch: Prevent CPUs to fetch stale
 instructions after livepatching
Thread-Index: AQHVbihnGtEnz+DRBU2uPBeBBR2oJacxneQA
Date: Wed, 18 Sep 2019 16:21:21 +0000
Message-ID: <87impp60e7.fsf@epam.com>
References: <20190918135256.7287-1-julien.grall@arm.com>
In-Reply-To: <20190918135256.7287-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bca635f-9a90-40ab-1e66-08d73c543e5b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB5554; 
x-ms-traffictypediagnostic: AM0PR03MB5554:|AM0PR03MB5554:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB5554F3C01E367D79BDB0300AE68E0@AM0PR03MB5554.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(43544003)(199004)(189003)(7736002)(486006)(6916009)(54906003)(71190400001)(71200400001)(186003)(102836004)(66066001)(26005)(76176011)(99286004)(55236004)(25786009)(256004)(14444005)(11346002)(86362001)(316002)(6506007)(5660300002)(14454004)(446003)(476003)(2616005)(80792005)(8676002)(478600001)(81156014)(305945005)(4326008)(81166006)(6116002)(64756008)(66476007)(66446008)(3846002)(8936002)(6436002)(6486002)(2906002)(229853002)(6512007)(66946007)(107886003)(6246003)(76116006)(66556008)(91956017)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5554;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rLjg2RwhzCGVFXol5FG37xXUrAE7PXXsqpdqvSmgmqjn5lNPHz/ejbAahJagYeQGRR1ft1RZibFK5OT01IQ7Q4z6usxvMTsJ2k54M1tFQuKcm5Wh7Mp7XrpFaWxIRVipKwoN0Fw0Jps8RhSnA0vqG7iyXH1JB/sa1eiOOQp2JQNBScge0oQh8jfERNlUjuKOy/FXSxkQiQdmhzYVEVETxC74rzw3IPJnNruRbdDQBO0OZXeQFeo8jMQj/vKRMWcNUqI5wr1J+XmsA+ontc1B11PzPUCA6STYVVWkxToj3SHmhz2AKdYsfA/0hA6bvr9lp7Q31sDDNsBIFm5b4mUTemwshKjP2WOvblwLCqeXgK4caMsNq4IGLVqIc/+XdHXlTtgIEROg/IP3tlS5o5ZMcng2nWecf/vl8lPtFBrY88w=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bca635f-9a90-40ab-1e66-08d73c543e5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 16:21:21.5493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJKQxJTmc267gxEeEPKPKgV0nyez0WTZXB3HYpUsAjeXtsdCCvO4NQZmG+RIcDMZf+zlpSFIyQH6zmxakgLnJ8P2pYPzjyz/aUmrRQIM574=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5554
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: livepatch: Prevent CPUs
 to fetch stale instructions after livepatching
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
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IER1cmluZyBsaXZlcGF0Y2gsIGEg
c2luZ2xlIENQVSB3aWxsIHRha2UgY2FyZSBvZiBhcHBseWluZyB0aGUgcGF0Y2ggYW5kCj4gYWxs
IHRoZSBvdGhlcnMgd2lsbCB3YWl0IGZvciB0aGUgYWN0aW9uIHRvIGNvbXBsZXRlLiBUaGV5IHdp
bGwgdGhlbiBvbmNlCj4gZXhlY3V0ZSBhcmNoX2xpdmVwYXRjaF9wb3N0X2FjdGlvbigpIHRvIGZs
dXNoIHRoZSBwaXBlbGluZS4KPgo+IFBlciBCMi4yLjUgIkNvbmN1cnJlbnQgbW9kaWZpY2F0aW9u
IGFuZCBleGVjdXRpb24gb2YgaW5zdHJ1Y3Rpb25zIiBpbgo+IERESSAwNDg3RS5hLCBmbHVzaGlu
ZyB0aGUgaW5zdHJ1Y3Rpb24gY2FjaGUgaXMgbm90IGVub3VnaCB0byBlbnN1cmUgbmV3Cj4gaW5z
dHJ1Y3Rpb25zIGFyZSBzZWVuLiBBbGwgdGhlIFBFcyBzaG91bGQgYWxzbyBkbyBhbiBpc2IoKSB0
bwo+IHN5bmNocm9uaXplIHRoZSBmZXRjaGVkIGluc3RydWN0aW9uIHN0cmVhbS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5
OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cgo+IC0tLQo+
ICB4ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2xpdmVwYXRjaC5jIGIveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jCj4gaW5kZXggMjc5ZDUyY2M2
Yy4uMDBjNWUyYmM0NSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMKPiAr
KysgYi94ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMKPiBAQCAtODgsNyArODgsOCBAQCB2b2lkIGFy
Y2hfbGl2ZXBhdGNoX3JldmVydChjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgKmZ1bmMpCj4g
IAo+ICB2b2lkIGFyY2hfbGl2ZXBhdGNoX3Bvc3RfYWN0aW9uKHZvaWQpCj4gIHsKPiAtICAgIC8q
IGFyY2hfbGl2ZXBhdGNoX3Jldml2ZSBoYXMgbnVrZWQgdGhlIGluc3RydWN0aW9uIGNhY2hlLiAq
Lwo+ICsgICAgLyogRGlzY2FyZCBhbnkgc3RhbGUgaW5zdHJ1Y3Rpb25zIHRoYXQgbWF5IGhhdmUg
YmVlbiBmZXRjaGVkLiAqLwo+ICsgICAgaXNiKCk7Cj4gIH0KPiAgCj4gIHZvaWQgYXJjaF9saXZl
cGF0Y2hfbWFzayh2b2lkKQoKCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

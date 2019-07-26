Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B176F81
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 19:09:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr3f1-0001k8-WD; Fri, 26 Jul 2019 17:05:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hr3f0-0001k3-GI
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 17:05:38 +0000
X-Inumbo-ID: 9585bff0-afc7-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::628])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9585bff0-afc7-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 17:05:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYgw23qg6DfbA8ILkQSe6QTGz0BU1GOfipDxCOcom1e1YM6fEXkEVgiw/HPsYxpb8TVB2F5XBplUqi3BRoWMENWb0REHeSem/Pw75bFw9oSzFY9B4n+NnLh1qNq24ogcs/9TLtCHd1uE90YxY0xAzImQ2aFu3z0kuKfBCS9kLa25T03zwH1ff6G+NSMEAHAQAHxP3muwygTavBag+Nz5JDA6dz6E6jsMBHRdGrvFeDmIh+GGQkmYKmkdXA0s92emDVevsOmk+GKWPI0MQyhu/xzAO8DIshtOzUtq37dNjW8uSoNkM+GDP4/O3wkPqs3TGCYL0SamHnxSwMu6QqjDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXnOBv4ltfNOELn+0eR6ouBz2CvuT7iZRI4Jn38KX0c=;
 b=b+5uq/eIduBzCSnvHVPrReWWvrOs42tS6L2PZSfZ0ARAT/ZlpRtcf7HClWpLhn+irqpMa67LQv4bg53pqe9xBy24owGAQtk/kfH2txj9C8njr5T8kp3ttBuoVC36/unBSuSpJLtaUsf+E5mpdKYAl5fNmrZNCPZUP0OKxvgIfsRwa6YCLEBISFLE+dBdxeMjGmAKnEDrnKjrJF3ezOcy6AXdEljOxmqhWpcHK+LOfm7eODGjQ4jfLaHF7WHYy24tDFLktJFDleu0QGbwcPBSJ7577ZTr7X42oln+B3pKcYjTTJBmMXF9hRjIktKWztMNUzmpmXtaHHBRFRpE/SYUng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXnOBv4ltfNOELn+0eR6ouBz2CvuT7iZRI4Jn38KX0c=;
 b=GlD91UrbDQG4xWj8unDB+sEBRztm3q+v+wpat+RUFiEfnfBXmTHH/6dqrsjHUdqnLulcWP+L/Ppb3h0qdPeNnnsvBxnHgymp3h0Ca1oC8eLatud3wotgWDKaFyEhtO9iwczOy5Gt6rh5TRDhI89ORj5i1QiRzoGOj/JKPdlYeYFgnQ2U1CV3RdDIQVVXBcX2CG87ql8CZVUE9mdKRdgtvv0nobnAYf7KctGjMBWb+UDgMRkRv1eaAqlN+XYp6NnX8iilvgLdJyoXcqwkueQvOxhHY6I8/jWmjGoZ4oNkus2+YOUN+1ZdduYrW5UG3yzImQwCH+3/2opdOMtFuCbtlQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5521.eurprd03.prod.outlook.com (20.179.252.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 26 Jul 2019 17:05:33 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 17:05:33 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 7/7] xen/arm: types: Specify the zero padding in the
 definition of PRIregister
Thread-Index: AQHVQZ6lXvwm3o0b10iCA+aCZUR7cabc/YkAgAAn5AA=
Date: Fri, 26 Jul 2019 17:05:33 +0000
Message-ID: <87a7d0iv4z.fsf@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-8-julien.grall@arm.com>
 <375e98f5-3f6e-e579-acf0-8052dc15a210@arm.com>
In-Reply-To: <375e98f5-3f6e-e579-acf0-8052dc15a210@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98863a38-0d36-4698-8eec-08d711eb78b0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5521; 
x-ms-traffictypediagnostic: AM0PR03MB5521:|AM0PR03MB5521:
x-microsoft-antispam-prvs: <AM0PR03MB55214B5B97620003DB2264C6E6C00@AM0PR03MB5521.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(189003)(199004)(6506007)(25786009)(66946007)(66476007)(64756008)(66446008)(11346002)(91956017)(66556008)(76116006)(6116002)(446003)(305945005)(4744005)(7736002)(99286004)(81156014)(2616005)(81166006)(256004)(3846002)(6512007)(80792005)(6916009)(476003)(4326008)(68736007)(486006)(53546011)(54906003)(8936002)(55236004)(8676002)(76176011)(86362001)(26005)(107886003)(14454004)(6246003)(66066001)(71200400001)(71190400001)(316002)(186003)(6436002)(53936002)(36756003)(2906002)(5660300002)(229853002)(102836004)(6486002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5521;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jtwi8F3cfpeQemwumDU/H1uRFKvtl9kRgZCNSZIjSYVt1UQXHtfNG+MDEpPKAM9XY1Lyf2rpDbcKNFLPBTeSdKb+TEiWdf0lWiSMSu+miKCC6Ajv3GpKCN9vMPtmhqoeCB/XyyKC+nYjEPxSv8VMkh3U84qqXO4Q7Obw9bPEZiavBS8UmvRjbBlqdIZyGDnWyIzA22EY16ER3KsyHjWI97RWDz3GdV848mgTdu+2JRLgQVXr0sBAVB9hFVtTtHrkOr/WycttcjeJS3JDwr37lBIqTad7KfWYn1YfPfzCNXGTIVxyCwlf+8mk4SiHQaOQ/S4bTjUPrLPy8b/btDHVZI6OMdSaHB/Ogt1jdcr8yPL+LEOy4gzHxpl3YSywzGJgejd+8nh6idPUWdAlV7u4/JcF8CkduuuLURH9qYhzJh0=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98863a38-0d36-4698-8eec-08d711eb78b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 17:05:33.4439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5521
Subject: Re: [Xen-devel] [PATCH 7/7] xen/arm: types: Specify the zero
 padding in the definition of PRIregister
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

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDIzLzA3LzIwMTkgMjI6MzUsIEp1bGllbiBHcmFs
bCB3cm90ZToKPj4gVGhlIGRlZmluaXRpb24gb2YgUFJJcmVnaXN0ZXIgdmFyaWVzIGJldHdlZW4g
QXJtMzIgYW5kIEFybTY0ICgzMi1iaXQgdnMKPj4gNjQtYml0KS4gSG93ZXZlciwgc29tZSBvZiB0
aGUgdXNlcnMgdXNlcyB0aGUgd3JvbmcgcGFkZGluZy4KPj4KPj4gRm9yIG1vcmUgY29uc2lzdGVu
Y3ksIHRoZSBwYWRkaW5nIGlzIG5vdyBtb3ZlZCBpbnRvIHRoZSBQUklyZWdpc3RlciBhbmQKPj4g
dmFyaWVzIGRlcGVuZGluZyBvbiB0aGUgYXJjaGl0ZWN0dXJlLgo+Cj4gQmVsb3cgYSBzdWdnZXN0
ZWQgbmV3IGNvbW1pdCBtZXNzYWdlOgo+Cj4gIlRoZSBkZWZpbml0aW9uIG9mIFBSSXJlZ2lzdGVy
IHZhcmllcyBiZXR3ZWVuIEFybTMyIGFuZCBBcm02NCAoMzItYml0IHZzCj4gNjQtYml0KS4gSG93
ZXZlciwgc29tZSBvZiB0aGUgdXNlcnMgdXNlcyB0aGUgd3JvbmcgcGFkZGluZyBhbmQgb3RoZXJz
IGFyZQo+IG5vdCB1c2luZyBwYWRkaW5nIGF0IGFsbC4KPgo+IEZvciBtb3JlIGNvbnNpc3RlbmN5
LCB0aGUgcGFkZGluZyBpcyBub3cgbW92ZWQgaW50byB0aGUgUFJJcmVnaXN0ZXIgYW5kCj4gdmFy
aWVzIGRlcGVuZGluZyBvbiB0aGUgYXJjaGl0ZWN0dXJlLiIKV2l0aCB0aGlzIGNvbW1pdCBtZXNz
YWdlOgoKUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0Bl
cGFtLmNvbT4KCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E384A0D0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 14:31:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdDDj-0008F6-K8; Tue, 18 Jun 2019 12:28:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Civ+=UR=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1hdDDh-0008Eq-9q
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 12:28:13 +0000
X-Inumbo-ID: 88e39a01-91c4-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::604])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 88e39a01-91c4-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 12:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so50fnk9IR3ExAtZrDjgvdJyNuQK4A3tFym+nWoxRw0=;
 b=gdbL0dM7rNGB7mIkhZKNTXdJGpA+xQAosc6IcCS+rQPumG73cweWJtguLD/R9c1qY+eJHlj04IsEFd/Ij0/pPdRzYHuGsPeWIkRApG5uVPIsWZjN+Hpx4sxKn8dOVN6eTZ7XvWIK/lBoZjF7jhExndh8xSs3j7hJAblU84MLRZuGat/10YHE8grCweiTBaDdbkVt2qm6HfUKI9ALBUy86V4ptmas6B/Rl3Sq+Giy32yT9MC6sK6qC2l1+Seo0yu3q4qPyT+4SqFDJ5+ysnADq/gnNNmMINs0DbheK2rLQuau4MPm4oG+DT9PvUSPPm234q8+f4cjaMm5MuhSqxmd+Q==
Received: from AM6PR03MB4919.eurprd03.prod.outlook.com (20.178.89.32) by
 AM6PR03MB5687.eurprd03.prod.outlook.com (20.179.246.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 12:28:09 +0000
Received: from AM6PR03MB4919.eurprd03.prod.outlook.com
 ([fe80::d98a:2e18:2b92:e0e5]) by AM6PR03MB4919.eurprd03.prod.outlook.com
 ([fe80::d98a:2e18:2b92:e0e5%4]) with mapi id 15.20.1987.010; Tue, 18 Jun 2019
 12:28:09 +0000
From: Andrii Anisov <Andrii_Anisov@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: Starting to port xen on beagleboard-x15 (GSoC 2019 project)
Thread-Index: AQHVJPS/+RJmyH2GskCLnrRsANtZsqahK6YegAAPBoCAAAiPFIAAC/ud
Date: Tue, 18 Jun 2019 12:28:09 +0000
Message-ID: <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <cd936ab7-df65-1615-a03a-bea30b5814f9@arm.com>
 <f3596bd5-ede3-7299-e28f-033ad32e6c99@gmail.com>
 <62194faf-0bf8-61b8-a69f-e41934fb5a43@arm.com>
 <0c900a15-14ab-9947-bffe-2fbeed176486@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>,
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>,
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
In-Reply-To: <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Andrii_Anisov@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75f7af56-d3a3-4525-500a-08d6f3e86c65
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB5687; 
x-ms-traffictypediagnostic: AM6PR03MB5687:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR03MB568792A81B0AC984546B4D5EE6EA0@AM6PR03MB5687.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(346002)(39860400002)(376002)(38564003)(199004)(189003)(73956011)(7696005)(76176011)(5660300002)(99286004)(316002)(6506007)(55236004)(102836004)(3846002)(6116002)(256004)(8936002)(14444005)(52536014)(68736007)(2906002)(80792005)(6436002)(54906003)(478600001)(14454004)(33656002)(86362001)(55016002)(81166006)(81156014)(7736002)(8676002)(305945005)(72206003)(71200400001)(53936002)(71190400001)(9686003)(229853002)(6306002)(966005)(74316002)(6916009)(446003)(11346002)(66476007)(66556008)(25786009)(26005)(476003)(486006)(6246003)(66446008)(66946007)(76116006)(4326008)(64756008)(186003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB5687;
 H:AM6PR03MB4919.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yaI9mn9FNRzbsokK0IY/PUhMRnT5sOygkQpTalDqwDpBN5uc3zOGWPkUWDqXt5rVyGhEcdatBdtfG/7sKZL/xSKe0JjPew6Ppoy40DG7F59G627Y60xhmFwwVd0MAWjVF5/l8huY339vAXo0ixEx1D+HZe0163POvaYY1TvAW1/XiPUfcaYreJzhcp6LU539322ZxakHa5n2C3UWFDK705eCietClz/GpKG2moLqONH1TUIY4UQt7kowfFRUkstVn0h8jE8L/zuRNxBFX84ebbpA5B9wBW2KpZih3XuZeAHfKC9diNLZXSm/yMTihE+vbzhljd0Of+r0HVqx152BWr0CKKNXJ9CnYZvFCkqmGFW2k2HMKKdlcPRXny2fbt20mngAXdGNbDTdOjA9M9Ku3ZROYPTbdnIKRhvh1C1KVsw=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f7af56-d3a3-4525-500a-08d6f3e86c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 12:28:09.4196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Andrii_Anisov@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5687
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Denis Obrezkov <denisobrezkov@gmail.com>, Iain Hunter <drhunter95@gmail.com>,
 "xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

K3hlbi1kZXZlbAoKSGVsbG8gSnVsaWVuLAoKPiBJIGFtIGEgYml0IGNvbmZ1c2VkLiBMaW51eCBp
cyBhYmxlIHRvIGJyaW5nLXVwIENQVSBpbiBoeXAgbW9kZSB3aXRoIHRoZSBjdXJyZW50Cj4gVS1i
b290LiBXaHkgd291bGQgd2UgbmVlZCBtb3JlIGNoYW5nZXMgZm9yIFhlbj8KClRJJ3MgUk9NIGNv
ZGUgc3RhcnRzIGFsbCBDUFVzIGluIE5TIFBMMSwgZG9lc24ndCBtYXR0ZXIgaWYgaXQgaXMgYm9v
dCBvciBzZWNvbmRhcnkgY29yZS4KSWYgeW91IGxvb2sgYXQgTGludXggY29kZSBbMV0sIHlvdSds
bCBzZWUsIHRoYXQgYWZ0ZXIgdGhlIHNlY29uZGFyeSBjb3JlIGJyaW5ndXAgTGludXggZG9lcyBz
d2l0Y2ggdGhhdCBjb3JlIGZyb20gTlMgUEwxIHRvIFBMMiAoaHlwIG1vZGUpIHVzaW5nIFJPTSBj
b2RlIGludGVyZmFjZSAoc21jIDApLgpBdCBzb21lIG1vbWVudCBYRU4gZHJvcHBlZCBhbGwgdG8t
aHlwLW1vZGUgc3dpdGNoaW5nIGNvZGUuIFNvIEkgZGlkIHN3aXRjaCBzZWNvbmRhcmllcyB0byBo
eXAgbW9kZSBpbiB1LWJvb3Qgd2l0aCB0aGUgbG9vcCB3aGljaCByZXBsaWNhdGVzIHRoZSBST00g
Q29kZSBsb2dpYyBpbiB0ZXJtcyBvZiB3YWl0aW5nIGZvciBhbiBldmVudCBhbmQgY2hlY2tpbmcg
YXV4IHJlZ2lzdGVycy4gCgpbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUu
MS9zb3VyY2UvYXJjaC9hcm0vbWFjaC1vbWFwMi9vbWFwLWhlYWRzbXAuUyNMNjIKCkFORFJJSSBB
TklTT1YKCkxlYWQgU3lzdGVtcyBFbmdpbmVlcgoKwqAKCk9mZmljZTrCoCszODAgNDQgMzkwIDU0
NTfCoHjCoDY2NzY2wqDCoMKgQ2VsbDrCoCszODAgNTAgNTczIDg4NTLCoMKgwqBFbWFpbDrCoGFu
ZHJpaV9hbmlzb3ZAZXBhbS5jb20KCkt5aXYswqBVa3JhaW5lwqAoR01UKzMpwqDCoMKgZXBhbS5j
b20KCsKgCgpDT05GSURFTlRJQUxJVFkgQ0FVVElPTiBBTkQgRElTQ0xBSU1FUgpUaGlzIG1lc3Nh
Z2UgaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbChzKSBvciBl
bnRpdHkoaWVzKSB0byB3aGljaCBpdCBpcyBhZGRyZXNzZWQgYW5kIGNvbnRhaW5zIGluZm9ybWF0
aW9uIHRoYXQgaXMgbGVnYWxseSBwcml2aWxlZ2VkIGFuZCBjb25maWRlbnRpYWwuIElmIHlvdSBh
cmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIG9yIHRoZSBwZXJzb24gcmVzcG9uc2libGUg
Zm9yIGRlbGl2ZXJpbmcgdGhlIG1lc3NhZ2UgdG8gdGhlIGludGVuZGVkIHJlY2lwaWVudCwgeW91
IGFyZSBoZXJlYnkgbm90aWZpZWQgdGhhdCBhbnkgZGlzc2VtaW5hdGlvbiwgZGlzdHJpYnV0aW9u
IG9yIGNvcHlpbmcgb2YgdGhpcyBjb21tdW5pY2F0aW9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQu
IEFsbCB1bmludGVuZGVkIHJlY2lwaWVudHMgYXJlIG9ibGlnZWQgdG8gZGVsZXRlIHRoaXMgbWVz
c2FnZSBhbmQgZGVzdHJveSBhbnkgcHJpbnRlZCBjb3BpZXMuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

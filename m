Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6C72497E1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 10:00:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8J0o-0002rW-VO; Wed, 19 Aug 2020 07:59:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=63PW=B5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k8J0n-0002rR-AE
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 07:59:57 +0000
X-Inumbo-ID: 5f0de3b3-6aec-4a6e-8762-97ef1e2a58cf
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.61]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f0de3b3-6aec-4a6e-8762-97ef1e2a58cf;
 Wed, 19 Aug 2020 07:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CurRuO+lyqgcyDTp806G08koahxVp7OGzzywfHDMpJ8=;
 b=bhxScTTFdJ1pKeGEEapSyBtS8YxRFz5ioadD81SwcCZ/7jc3Yx6kakmBdW2sK5SSihVmMy69mmYUhlEm6OjRM3SEYSx1M1pXjcsPLpXBKJTM6eAmV6TolGhbd4m6YOnoxGRxbmImpXxMxMgDLOPxI0vnTXEmMbltgzpA3EttKVE=
Received: from DB6PR0301CA0005.eurprd03.prod.outlook.com (2603:10a6:4:3e::15)
 by VI1PR08MB3838.eurprd08.prod.outlook.com (2603:10a6:803:b8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 07:59:53 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::10) by DB6PR0301CA0005.outlook.office365.com
 (2603:10a6:4:3e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Wed, 19 Aug 2020 07:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 07:59:53 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Wed, 19 Aug 2020 07:59:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0b89b63c16758b29
X-CR-MTA-TID: 64aa7808
Received: from 1cdbd429eded.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF6A7379-9B56-46BB-8E32-2BF96664C46A.1; 
 Wed, 19 Aug 2020 07:59:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1cdbd429eded.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Aug 2020 07:59:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAhg0qxsTkhAlmnb9FBkQvvzFXFS+0+nj4Xh6JlHBG8AnK0s2lvwa6HPPFtvyT47N1aF0YzuRmZIvbxpjqWTtxSZ5rM0WfGXh+dYASk/7ZS9V/wKCn9+XICaif/85hdDQmZ8E1Z09KCTsakR/T1WUZB2e+8J4fPGb+YN+HCEOrswCVwa0w/pyhEpmg94HWc6LrfTJigTZgMSn/jkmLIk5V/PUYNCZAsGX6ZwUI6mKdmgaurwd80BGH6h9ZV/aMJ5VxswkPH7cO7rc63w/E+Vk4RzTuKwqXVTkpV8HCUafmOYublqlCXqd6reShc7OIbu8RkA9EoNAfe435LxkZ40Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CurRuO+lyqgcyDTp806G08koahxVp7OGzzywfHDMpJ8=;
 b=fOxWLfxQK8cB3Poy3iXs+0bzR945qFBX/C+qPHKNvrJYsjKsApUu1KYd3mAlKSF1/lGI6EipSz8PMHrH5ym2Oxh3SgbUVkg3mO1EqMVGO5CjAZVq+KYVIO5M2PnUDgxxgScH4d7Hygo5KBjMYPHNSIV9XfYbCDaa4LhO0bcWTNBfa8bsn+7T/0Xyx0Nx/K97/Tq5ArdpXazfHaWSJuN91nHiICwNRoOeEev/y9PPrhDB9CozHLFmN5BL8RPgqbQS87vXzOsSEZ1eC5xzOvD2AAAdeFAX4CnS4clxcMgDzXvytcdIdbX1idNuiNiYDuHCD6YV1lLAN+YkoLIShybQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CurRuO+lyqgcyDTp806G08koahxVp7OGzzywfHDMpJ8=;
 b=bhxScTTFdJ1pKeGEEapSyBtS8YxRFz5ioadD81SwcCZ/7jc3Yx6kakmBdW2sK5SSihVmMy69mmYUhlEm6OjRM3SEYSx1M1pXjcsPLpXBKJTM6eAmV6TolGhbd4m6YOnoxGRxbmImpXxMxMgDLOPxI0vnTXEmMbltgzpA3EttKVE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5323.eurprd08.prod.outlook.com (2603:10a6:10:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 07:59:14 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 07:59:14 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "security@xenproject.org"
 <security@xenproject.org>, Paul Durrant <paul@xen.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <jgrall@amazon.com>, nd <nd@arm.com>
Subject: Re: [PATCH 1/2] xen/arm: entry: Place a speculation barrier following
 an ret instruction
Thread-Topic: [PATCH 1/2] xen/arm: entry: Place a speculation barrier
 following an ret instruction
Thread-Index: AQHWRAfmStwU8wyN4kaMawtOMkuGS6jbwRUAgAE+BoCAGrNlgIBGwHmAgAACZYCAAAZwAIAAB6gAgADxu4A=
Date: Wed, 19 Aug 2020 07:59:14 +0000
Message-ID: <B2AFB28F-0D54-45D4-AFAA-8C495A6D9054@arm.com>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-2-julien@xen.org>
 <alpine.DEB.2.21.2006161422240.24982@sstabellini-ThinkPad-T480s>
 <57696b4d-da83-a4d6-4d82-41a6f6c9174c@xen.org>
 <5c3a2407-3e76-3a30-7f93-036706e00f73@xen.org>
 <9DFF73C4-5141-47AF-A0DB-331787007F37@arm.com>
 <5a406d61-293b-8dd7-44c2-d4f5dde4856f@xen.org>
 <7EAB4E0A-338C-4DCF-80A4-A426BC95C051@arm.com>
 <5dceeedf-9982-37c5-553e-76f22d9d6db2@xen.org>
In-Reply-To: <5dceeedf-9982-37c5-553e-76f22d9d6db2@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 782344bc-c1d6-400c-6ef5-08d84415db1c
x-ms-traffictypediagnostic: DB8PR08MB5323:|VI1PR08MB3838:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB38385766A843A3F21A4F83269D5D0@VI1PR08MB3838.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 82QwakDncODZDEOD3a/Z3KAGE/4tAwiWws/gIswE934mDMXfOaiXgqU++3vtSjcYJGMCF3cHEVhbpgdsZ2vq3cp66RLeQRj/hljqcXMXNVIwrec+bWEt4wiYF7lhWcEJTiJ7DX1ZC04p9JnI/hk/C8NPi9OXyV8Ax51wyHBfRsLMtmoAHfOz6gtfPSPaJ5Hy3VEnAWYhpY6WNyzR1UFeZQ2XOYSixNUsmg/fDH5Jy/O8EQXOOS0Q5IKENs7j+0VlM2lMNJg5OZiZ8Wen1wmvvLgq/ppMHnVgixsmip/k9o46UTqUMYAViz89oxETZ9JBZQFZhr/MwEFkSVvl6TSHXw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(6486002)(8676002)(54906003)(6512007)(2906002)(6916009)(53546011)(478600001)(6506007)(316002)(8936002)(4326008)(66946007)(5660300002)(71200400001)(83380400001)(2616005)(36756003)(64756008)(66446008)(186003)(66556008)(76116006)(66476007)(33656002)(86362001)(91956017)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: gnXMiIFhQBB33L/0Ex3mRk6w0+6tPYJSxagVb3W4paW0V6n5I9P5/PXIjK8BRXFYlEVOvLmmoVFT2dsWRX/VHAI1CYxzIgzhiYGywYLZjEGgqzlfcszwRXCWDobyQK39b/ReVN8SCck9Vz8fYXevT/gKl4uDmBp28rFuGWGi83414JXt/uF0Z2JmRIx/xNf2EXlRPahlqNKU3HdJwEan7rlhHwG0bThAWRWYupDbC+Dqv8+d8Cvz6WLjvVTZYF4iyHIzUq4yTELnoDSqx9DwsyKZ+l3r1goFfeRc6RRIMVyOwYuTYshuH1AcwMjwnqV1Bv+I97nw2yJsQAMrDosfMFfeFapDcU7sv5eNlh7vXCdamr8MXRPzIvkGiQJse7Qi7MHb2vvv3bVfiDD4WzCqR2A7EIDgIJbEleKeyNuKOBLFfcMRsgTSDD/tvUNcyqgpk6u8sTieOo1/ZDERAZ66av6Q9IuppKbsOhgSz4Ix5uAhl7ubIIIwTMC5mTPLIKDZVHKwqZyq3Y/zIUaFAOmVny9kRfzcTlw2fGWhUS0ftJrmFsBlqtPdjA5fSc1EvB6Z3HuLSi74612yYJFZt6kVT6TofW74aLsp2KLLG0KPvQeUcV3JEWK9H8veVgZ9g6supLBFNeTbR6bSrxlrPg95Xw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <98C8441560610149A63D57619AD07646@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5323
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 66d69965-5bcd-4f58-4375-08d84415c3b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dl0CtNpSycZccA9QZ7qljzUkWELOSEGgx1RB9xhkkW3s3KqA/r8ixNiyOHAWor1hm2iMtEyYr+V6jXuxC7iF2qYrSe9prHbO7iyA0dBAQJO6RQs7LmeMobOoWezwBLk0l5++20gxnVEYYdnanzuvsAJmE8lAa2labjG4l+qqjHCzS8Y2Fs+86CgHzD22pDkNOoCo9McI6LSKK8tdABG2c9mrQDGxNgqOiPWGx7qSfc+Z9+q6UQPfSnARd1RtLloqbLJoNSH+zOIh/ToNm5q4gNlXDgzyeV3an0NQPbsE6vyrlvqAADpc6RJ4eWdcroYvVcXG3UlVVdWpVk8uRX2UGbI/pzNnIiMNvV7upqYNfVnjSuzAYKbaPVleQZdGglHABkTHrNh8xLHqjMWNfk8qkQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(356005)(336012)(2906002)(186003)(8676002)(83380400001)(6862004)(4326008)(8936002)(70206006)(33656002)(81166007)(5660300002)(82740400003)(54906003)(316002)(82310400002)(478600001)(36756003)(6486002)(6512007)(53546011)(70586007)(86362001)(47076004)(6506007)(2616005)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 07:59:53.3930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 782344bc-c1d6-400c-6ef5-08d84415db1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3838
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTggQXVnIDIwMjAsIGF0IDE4OjM0LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiANCj4gT24gMTgvMDgvMjAyMCAxODow
NiwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBPbiAxOCBBdWcgMjAyMCwgYXQgMTc6NDMs
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0K
Pj4+IE9uIDE4LzA4LzIwMjAgMTc6MzUsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+IEhp
IEp1bGllbiwNCj4+PiANCj4+PiBIaSBCZXJ0cmFuZCwNCj4+PiANCj4+Pj4gU29tZWhvdyB3ZSBz
dG9wcGVkIG9uIHRoaXMgdGhyZWFkIGFuZCB5b3UgZGlkIGFscmVhZHkgbW9zdCBvZiB0aGUgd29y
ayBzbyBJIHRoaW5rIHdlIHNob3VsZCB0cnkgdG8gZmluaXNoIHdoYXQgeW91IHN0YXJ0ZWQNCj4+
PiANCj4+PiBTb3JyeSB0aGlzIGZlbGwtdGhyb3VnaCB0aGUgY3JhY2tzLiBJIGhhdmUgYSBuZXcg
dmVyc2lvbiBmb3IgcGF0Y2ggIzEsIGJ1dCBub3QgeWV0IHBhdGNoICMyLg0KPj4gTm8gcHJvYmxl
bSB0aGlzIGNhbWUgYmFjayB3aGlsZSB0cnlpbmcgdG8gcmVkdWNlIG15IHRvZG9saXN0IHN0YWNr
IDotKQ0KPj4+IA0KPj4+IEkgYW0gc3RpbGwgZGViYXRpbmcgd2l0aCBteXNlbGYgd2hlcmUgdGhl
IHNwZWN1bGF0aW9uIGJhcnJpZXIgc2hvdWxkIGJlIGFkZGVkIGFmdGVyIHRoZSBTTUMgOikuDQo+
PiBJIHRoaW5rIHRoYXQgd2Ugc2hvdWxkIHVubGVzcyB0aGUgU01DIGlzIGluIHRoZSBjb250ZXh0
IHN3aXRjaCBwYXRoIChhcyBhbGwgb3RoZXIgY2FsbHMgc2hvdWxkIG5vdCBoYXZlIGEgcGVyZm9y
bWFuY2UgaW1wYWN0KS4NCj4gSSB3aWxsIGludHJvZHVjZSAqX3Vuc2FmZSgpIGhlbHBlcnMgdGhh
dCB3aWxsIG5vdCBjb250YWluIHRoZSBzcGVjdWxhdGlvbiBiYXJyaWVyLiBJdCBjb3VsZCB0aGVu
IGJlIHVzZWQgaW4gcGxhY2Ugd2hlcmUgd2UgdGhpbmsgdGhlIGJhcnJpZXIgaXMgdW5uZWNlc3Nh
cnkuDQoNCmdyZWF0IGlkZWEsIHRoaXMgd2lsbCBtYWtlIGl0IGNsZWFyIGJ5IHJlYWRpbmcgdGhl
IGNvZGUgcmVkdWNpbmcgdGhlIG5lZWQgb2YgZG9jdW1lbnRhdGlvbi4NCg0KPiANCj4+PiANCj4+
Pj4+IE9uIDQgSnVsIDIwMjAsIGF0IDE3OjA3LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gT24gMTcvMDYvMjAyMCAxNzoyMywgSnVsaWVuIEdyYWxs
IHdyb3RlOg0KPj4+Pj4+IEhpLA0KPj4+Pj4+IE9uIDE2LzA2LzIwMjAgMjI6MjQsIFN0ZWZhbm8g
U3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+Pj4gT24gVHVlLCAxNiBKdW4gMjAyMCwgSnVsaWVuIEdy
YWxsIHdyb3RlOg0KPj4+Pj4+Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gU29tZSBDUFVzIGNhbiBzcGVjdWxhdGUgcGFzdCBhIFJF
VCBpbnN0cnVjdGlvbiBhbmQgcG90ZW50aWFsbHkgcGVyZm9ybQ0KPj4+Pj4+Pj4gc3BlY3VsYXRp
dmUgYWNjZXNzZXMgdG8gbWVtb3J5IGJlZm9yZSBwcm9jZXNzaW5nIHRoZSByZXR1cm4uDQo+Pj4+
Pj4+PiANCj4+Pj4+Pj4+IFRoZXJlIGlzIG5vIGtub3duIGdhZGdldCBhdmFpbGFibGUgYWZ0ZXIg
dGhlIFJFVCBpbnN0cnVjdGlvbiB0b2RheS4NCj4+Pj4+Pj4+IEhvd2V2ZXIgc29tZSBvZiB0aGUg
cmVnaXN0ZXJzIChzdWNoIGFzIGluIGNoZWNrX3BlbmRpbmdfZ3Vlc3Rfc2Vycm9yKCkpDQo+Pj4+
Pj4+PiBtYXkgY29udGFpbiBhIHZhbHVlIHByb3ZpZGVkIHRoZSBndWVzdC4NCj4+Pj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gYnkNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IA0KPj4+
Pj4+Pj4gSW4gb3JkZXIgdG8gaGFyZGVuIHRoZSBjb2RlLCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8g
YWRkIGEgc3BlY3VsYXRpb24NCj4+Pj4+Pj4+IGJhcnJpZXIgYWZ0ZXIgZWFjaCBSRVQgaW5zdHJ1
Y3Rpb24uIFRoZSBwZXJmb3JtYW5jZSBpcyBtZWFudCB0byBiZQ0KPj4+Pj4+Pj4gbmVnbGlnZWFi
bGUgYXMgdGhlIHNwZWN1bGF0aW9uIGJhcnJpZXIgaXMgbm90IG1lYW50IHRvIGJlIGFyY2hpY3R1
cmFsbHkNCj4+Pj4+Pj4+IGV4ZWN1dGVkLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBOb3RlIHRoYXQg
b24gYXJtMzIsIHRoZSBsZG1pYSBpbnN0cnVjdGlvbiB3aWxsIGFjdCBhcyBhIHJldHVybiBmcm9t
IHRoZQ0KPj4+Pj4+Pj4gZnVuY3Rpb24gX19jb250ZXh0X3N3aXRjaCgpLiBXaGlsZSB0aGUgd2hp
dGVwYXBlciBkb2Vzbid0IHN1Z2dlc3QgaXQgaXMNCj4+Pj4+Pj4+IHBvc3NpYmxlIHRvIHNwZWN1
bGF0ZSBhZnRlciB0aGUgaW5zdHJ1Y3Rpb24sIGFkZCBwcmV2ZW50aXZlbHkgYQ0KPj4+Pj4+Pj4g
c3BlY3VsYXRpb24gYmFycmllciBhZnRlciBpdCBhcyB3ZWxsLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+
PiBUaGlzIGlzIHBhcnQgb2YgdGhlIHdvcmsgdG8gbWl0aWdhdGUgc3RyYWlnaHQtbGluZSBzcGVj
dWxhdGlvbi4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4+Pj4+IA0KPj4+Pj4+
PiBJIGRpZCBhIGNvbXBpbGUtdGVzdCBvbiB0aGUgcGF0Y2ggdG9vLg0KPj4+Pj4+PiANCj4+Pj4+
Pj4gDQo+Pj4+Pj4+PiAtLS0NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gSSBhbSBzdGlsbCB1bnN1cmUg
d2hldGhlciB3ZSBwcmV2ZW50aXZlbHkgc2hvdWxkIGFkZCBhIHNwZWN1bGF0aW9uIGJhcnJpZXIN
Cj4+Pj4+Pj4+IHByZXZlbnRpdmVseSBhZnRlciBhbGwgdGhlIFJFVCBpbnN0cnVjdGlvbnMgaW4g
YXJtKi9saWIvLiBUaGUgc21jIGNhbGwgYmUNCj4+Pj4+Pj4+IHRha2VuIGNhcmUgaW4gYSBmb2xs
b3ctdXAgcGF0Y2guDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBTTUMgaXMgZ3JlYXQgdG8gaGF2ZSBidXQg
aXQgc2VlbXMgdG8gYmUgb3ZlcmtpbGwgdG8gZG8gdGhlIG9uZXMgdW5kZXINCj4+Pj4+Pj4gbGli
Ly4NCj4+Pj4+PiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBjb21waWxlciB3aWxsIGFkZCBh
IHNwZWN1bGF0aW9uIGJhcnJpZXIgcHJldmVudGl2ZWx5IGFmdGVyIGVhY2ggJ3JldCcgd2hlbiB0
aGUgbWl0aWdhdGlvbiBhcmUgdHVybmVkIG9uLlNvIGl0IGZlZWxzIHRvIG1lIHdlIHdhbnQgdG8g
Zm9sbG93IHRoZSBzYW1lIGFwcHJvYWNoLg0KPj4+Pj4+IE9idmlvdXNseSwgd2UgY2FuIGF2b2lk
IHRoZW0gYnV0IEkgd291bGQgbGlrZSB0byBoYXZlIGEganVzdGlmaWNhdGlvbiBmb3Igbm90IGFk
ZGluZyB0aGVtIChub3RoaW5nIGlzIG92ZXJraWxsZWQgYWdhaW5zdCBzcGVjdWxhdGlvbiA7KSku
DQo+Pj4+PiANCj4+Pj4+IEkgZmluYWxseSBmb3VuZCBzb21lIHRpbWUgdG8gbG9vayBhdCBhcm0q
L2xpYiBpbiBtb3JlIGRldGFpbHMuIFNvbWUgb2YgdGhlIGhlbHBlcnMgY2FuIGRlZmluaXRlbHkg
YmUgY2FsbGVkIHdpdGggZ3Vlc3QgaW5wdXRzLg0KPj4+Pj4gDQo+Pj4+PiBGb3IgaW5zdGFuY2Us
IG1lbWNocigpIGlzIGNhbGxlZCBmcm9tIGh5cGZzX2dldF9wYXRoX3VzZXIoKSB3aXRoIHRoZSAz
cmQgYXJndW1lbnQgY29udHJvbGxlZCBieSB0aGUgZ3Vlc3QuIEluIGJvdGggMzItYml0IGFuZCA2
NC1iaXQgaW1wbGVtZW50YXRpb24sIHlvdSB3aWxsIHJlYWNoIHRoZSBlbmQgb2YgdGhlIGZ1bmN0
aW9uIG1lbWNocigpIHdpdGggcjIvdzIgYW5kIHIzL3czIChpdCBjb250YWlucyBhIGNoYXJhY3Rl
ciBmcm9tIHRoZSBidWZmZXIpIGNvbnRyb2xsZWQgYnkgdGhlIGd1ZXN0Lg0KPj4+Pj4gDQo+Pj4+
PiBBcyB0aGlzIGlzIHRoZSBvbmx5IGZ1bmN0aW9uIGluIHRoZSB1bml0LCB3ZSBkb24ndCBrbm93
IHdoYXQgd2lsbCBiZSB0aGUgaW5zdHJ1Y3Rpb25zIHJpZ2h0IGFmdGVyIFJFVC4gU28gaXQgd291
bGQgYmUgc2FmZXIgdG8gYWRkIGEgc3BlY3VsYXRpb24gYmFycmllciB0aGVyZSB0b28uDQo+Pj4+
IEhvdyBhYm91dCBhZGRpbmcgYSBzcGVjdWxhdGlvbiBiYXJyaWVyIGRpcmVjdGx5IGluIHRoZSBF
TkRQUk9DIG1hY3JvID8NCj4+PiANCj4+PiBUaGlzIHdvdWxkIHVuZm9ydHVuYXRlbHkgbm90IGNv
dmVyIGFsbCB0aGUgY2FzZXMgYmVjYXVzZSB5b3UgY2FuIHJldHVybiBpbiB0aGUgbWlkZGxlIG9m
IHRoZSBmdW5jdGlvbi4gSSB3aWxsIGhhdmUgYSBsb29rIHRvIHNlZSBpZiB3ZSBjYW4gbGV2ZXJh
Z2UgaXQuDQo+PiBJIGFncmVlIHRoYXQgaXQgd291bGQgbm90IHNvbHZlIGFsbCBvZiB0aGVtIGJ1
dCBhIGJpZyBwYXJ0IHdvdWxkIGJlIHNvbHZlZCBieSBpdC4NCj4+IEFuIG90aGVyIHNvbHV0aW9u
IG1pZ2h0IGJlIHRvIGhhdmUgYSBSRVRVUk4gbWFjcm8gZW5jb2RlZCBhcyAibW92IHBjLGxyOyBz
YiIgYW5kICJyZXQ7IHNi4oCdLg0KPiANCj4gVGhpcyBpcyBhIGJpdCBtZXNzeSBvbiBBcm0zMiBi
ZWNhdXNlIG5vdCBhbGwgdGhlIHJldHVybiBhcmUgdXNpbmcgIm1vdiBwYyxsciIuICBBbnl3YXks
IEkgd2lsbCBleHBsb3JlIHRoZSB0d28gYXBwcm9hY2hlcy4NCg0KYWNrLg0KDQo+IA0KPj4gVGhl
IHBhdGNoIHNvdW5kcyBnb29kLCBpIGp1c3QgbmVlZCB0byBmaW5kIGEgd2F5IHRvIGFuYWx5c2Ug
aWYgeW91IG1pc3NlZCBhIHJldCBvciBub3Qgd2hpY2ggaXMgbm90IGVhc3kgd2l0aCBzdWNoIGEg
cGF0Y2ggOi0pDQo+IA0KPiBJIGRpZCBzdHJ1Z2dsZSB0byBmaW5kIGFsbCB0aGUgaW5zdGFuY2Vz
LiBUaGUgZGlyZWN0b3J5IGxpYi8gaXMgYWN0dWFsbHkgcXVpdGUgZGlmZmljdWx0IHRvIGdvIHRo
cm91Z2ggb24gMzItYml0IGJlY2F1c2UgdGhleSBhcmUgbXVsdGlwbGUgd2F5IHRvDQo+IGltcGxl
bWVudCBhIHJldHVybi4NCg0Kc29tZSBwYXJ0IG9mIHRoZSBhc3NlbWJsZXIgY29kZSBtaWdodCBi
ZW5lZml0IGZyb20gYSBmZXcgYnJhbmNoIGluc3RlYWQgb2YgbWlkZGxlIHJldHVybiB0byBtYWtl
IHRoZSBjb2RlIGNsZWFyZXIgYWxzbyBidXQgdGhpcyBtaWdodCBpbXBhY3QNCmEgYml0IHRoZSBw
ZXJmb3JtYW5jZXMuDQoNCj4gDQo+IEZpbmRpbmcgYSB3YXkgdG8gcmVkdWNlIG1hbnVhbCBzcGVj
dWxhdGlvbiBiYXJyaWVyIHdvdWxkIGRlZmluaXRlbHkgYmUgaGVscGZ1bC4gSSB3aWxsIHRyeSB0
byByZXZpc2UgdGhlIHBhdGNoIGR1cmluZyB0aGlzIHdlZWsuDQoNCm9rIGkgd2lsbCBvbiBteSBz
aWRlIGxpc3QgdGhlIHJldHVybnMgdG8gYmUgYWJsZSB0byByZXZpZXcgdGhlIGZpbmFsIHBhdGNo
IG1vcmUgZWFzaWx5Lg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg==


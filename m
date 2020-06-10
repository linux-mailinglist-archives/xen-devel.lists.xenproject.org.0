Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D011F506F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 10:40:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiwGb-0007bp-9f; Wed, 10 Jun 2020 08:39:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRJ8=7X=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jiwGa-0007bk-25
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 08:39:24 +0000
X-Inumbo-ID: e1c353de-aaf5-11ea-8496-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1c353de-aaf5-11ea-8496-bc764e2007e4;
 Wed, 10 Jun 2020 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO3CRl9PscQGePv4XrnVBZIHt7KDUHval1jiEEtxImg=;
 b=nsUMF9GeD0RXMn94FtUI2kc3Zu1zbCVvxXYBzcCRC19bB+bBHfNB7BErhzU5S7tp/q0xVo4Ue++T3yreqyr6tTpQcLW9w8tHq37mE3bWp5sV9XmIXUJ+U+PM6o+sbaOAX9wlHVEIUQoE4C8ddcH77ORitW3M8EiKdOQVETBVsbE=
Received: from AM6P191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::19)
 by AM6PR08MB4326.eurprd08.prod.outlook.com (2603:10a6:20b:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 08:39:20 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::ad) by AM6P191CA0042.outlook.office365.com
 (2603:10a6:209:7f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Wed, 10 Jun 2020 08:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 08:39:19 +0000
Received: ("Tessian outbound 3e82c366635e:v59");
 Wed, 10 Jun 2020 08:39:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6c3d5cb7fb34371
X-CR-MTA-TID: 64aa7808
Received: from c7125f9e284b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EB231C3E-F32E-4F01-88E9-9721C13F0107.1; 
 Wed, 10 Jun 2020 08:39:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7125f9e284b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Jun 2020 08:39:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lx8L9kjPjLXRmFDQS1qOlhcNWW40BARXstmIkU8VBi8UL2T/1Xj3FPpghDDOwEhqLUiCt1hiG+1leCByBAXr8IDa8OjwPciO8Pq96IXggOM87148VA7pkLIgU4u2oHjl9+KCyzB9YRp8A3e0auJTBzRXaQx94qJ3vnOJ1S0h6tEO/y6JNYCqOKiicRa86MbAWsC/ebiEuJR8eKvamixs+eu6imGH2l5WqD5EByQIpgxt44avRAPH5vQTpBhmRS/2cEL3Ki/34nYChL5Qh/G8I4/abBQFP20DFUKd8UoZWJiFEy6P1Out66vohC9kPo/V/18/GFcOBUH1qdvgQP+d9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO3CRl9PscQGePv4XrnVBZIHt7KDUHval1jiEEtxImg=;
 b=a5DGwZ/KHqNE2yGPnRWGCnLqi+BOxOJYcO3lJPBsbFzulFMItZNTbjMwGwrCC+F0d1/1x9ub2HK6RL4wnqCM4+JFrR0EH0zOm8CKiReGjVx+ExH2e+/J9q5HMYyUPSajgi7nO105Y8Gmx9+5hrbG8SIIfokHOXcSL8/K+pGN5H+3FJWO0Fe82JFDzrMYVSHYm7c4yHZ0JtaW1qdH6014G/TP44OaqlTVtOXE7HVU89ey26tYo4wXjwoSDl564JSgPyM6v1cn9NgqI91zi+MU82SnScNQgEVHY9qK17H9KDjgM+D6v+63VANMOeiJ1+ygCjDwcKYxoQfqhZtYL6yP6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO3CRl9PscQGePv4XrnVBZIHt7KDUHval1jiEEtxImg=;
 b=nsUMF9GeD0RXMn94FtUI2kc3Zu1zbCVvxXYBzcCRC19bB+bBHfNB7BErhzU5S7tp/q0xVo4Ue++T3yreqyr6tTpQcLW9w8tHq37mE3bWp5sV9XmIXUJ+U+PM6o+sbaOAX9wlHVEIUQoE4C8ddcH77ORitW3M8EiKdOQVETBVsbE=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB4546.eurprd08.prod.outlook.com (2603:10a6:208:148::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 08:39:11 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::b572:771:2750:14ed%5]) with mapi id 15.20.3088.019; Wed, 10 Jun 2020
 08:39:11 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34CAAFCtAIAAAUSAgAADZQCAAAGKgIAAJpOAgABE7QCABAZcAIAAQRIAgAA9oACAAXYtAIAAD3sAgAAFaoCAABUzgIAAB/uAgAAD1ICAAPCKAIAAA+YAgAAFIgA=
Date: Wed, 10 Jun 2020 08:39:11 +0000
Message-ID: <5C2DB5F7-832E-4B02-A99A-8B5C7CEC7645@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
 <32FA85C2-7685-49D2-875B-9FA1C138C92A@arm.com>
 <d16faf89f25a6183bc6cbdc6148af4b4@kernel.org>
In-Reply-To: <d16faf89f25a6183bc6cbdc6148af4b4@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 98b54938-3f7c-4f8f-69c9-08d80d19c4bb
x-ms-traffictypediagnostic: AM0PR08MB4546:|AM6PR08MB4326:
X-Microsoft-Antispam-PRVS: <AM6PR08MB432669D898029209C9E8E7F29D830@AM6PR08MB4326.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7LrZXBgRvhpi00uGTIL1kwf7eYANSke0aKjOmGH7sVUBvxRT0Idjf34stSf/K/cZGfYmFRQAcALPupA/i2569j8/MYmVO2b3zIPlIoBRhJf/pmKoPcgRacZirnFhLhElLf8qwggyC98Az6sWO4OLmeVkieYsxTdAj+rYuWzYICt/hJmegxOVCw+2Vf2DfpC+38I6GtbNWuNbxtVV/Jq4X0qzXlI4e7ml5oSu5ggFjzV/aHI9v1WyvXAaTn2q8qDyfhY8QIYo4X8VmqqNsIwaPWT8dSv2SWP9MDj2E93b5eefT7vOK3mZlIPTxFIByQs4zPXRQnBQNAxezRyTMnKgwQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3682.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(6916009)(8936002)(66446008)(64756008)(66556008)(66946007)(6486002)(76116006)(91956017)(71200400001)(66476007)(478600001)(53546011)(5660300002)(4326008)(186003)(86362001)(33656002)(26005)(6506007)(8676002)(7116003)(3480700007)(316002)(83380400001)(36756003)(6512007)(2616005)(2906002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IBI+AlGLNh4/uyzo2RGSQcBUVhutyPjXWoylPiV3ChA1l9/8RAyYNsTiHwEJyVMvxSqC4E7QtwAD1LAU9biCw/8lxfZRyFmAy9fBf3CTBoYotKiIPXMnTaNSwD9kfPoFm/4aUPQnMqy/19MXnD8+isv0BLtb3RszDy1GX9TbViYVoTvfkCR/YERPUA6t1A4r0Xz9oZ00USTmNzfwIVoMk2Fx/Gr7U5+AETVxjHYrXMRE1DH75/1KQKs1HauKEi0/ZVXhzGDa1QU97tR6AH/dL1/h4EH2y7a9el9BziZsIhTZKIFNTFq8cVyDrm34AuLQCYr8fBNK6YGcFjiudJueJPzYGjd+zNDhrL2quLc2spjYtxGBxxK3bdODEgwGXQH7RcoOeP7T40wT+//dWI6pVggIv96qQIfO3+QeeV71ymDQi6X/YhAagc11gKzXICqbr13zgfOi4K6/AWhTdzp7w+N5oKOC3Rpa9HwhWx6o9V8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <703A9DB4D97A464CA57DB67DE4131224@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4546
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(70586007)(81166007)(70206006)(2906002)(6506007)(6862004)(316002)(6512007)(26005)(54906003)(3480700007)(186003)(53546011)(6486002)(478600001)(4326008)(7116003)(47076004)(83380400001)(336012)(36756003)(33656002)(82740400003)(356005)(82310400002)(2616005)(8676002)(8936002)(36906005)(86362001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f74b02dd-d0c9-4b46-d345-08d80d19bfd6
X-Forefront-PRVS: 0430FA5CB7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vbpbCYCe70u7y15zYKjjB8jjhIMxdG5G5jaM4C/2nmOP8ve0JGim47z8hGbmyM89elPwqGGt+MBvMIE6dtB4xUTjU142giCtizPVR2ID50Y3lfNWdnKYWOJlQbPxCFa/+29MvR7B5zKaJ3fP3DeikNOIC28WW8TJFLSeJNhHKoIQgClHg5lUKoSV2stn4ujdtGtEayTsoihlYjlOwk2d30XEpl5AbB81HI4/k5hlmAvHO0y4RVeGZEi0F1SvbRWSTJjzYhqSWh9c0rsandPHjc6genIGdOazjZoHEDSgC5M4eSa9eS9XIi+AdMvgx8UnA/kwVsSzyJ7z7Axvwv3IbuCAS/ybs+l7k+99wOJxsVFelD3Wd0uG6s6mtMPgoWIzpBnOgtp3fQpDEtyHEgj14Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 08:39:19.8135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b54938-3f7c-4f8f-69c9-08d80d19c4bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4326
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 CodeWiz2280 <codewiz2280@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTAgSnVuIDIwMjAsIGF0IDA5OjIwLCBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIDIwMjAtMDYtMTAgMDk6MDYsIEJlcnRyYW5kIE1hcnF1aXMg
d3JvdGU6DQo+PiBIaSwNCj4+PiBPbiA5IEp1biAyMDIwLCBhdCAxODo0NSwgTWFyYyBaeW5naWVy
IDxtYXpAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gSGkgSnVsaWVuLA0KPj4+IE9uIDIwMjAtMDYt
MDkgMTg6MzIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4gKCsgTWFyYykNCj4+Pj4gT24gMDkv
MDYvMjAyMCAxODowMywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+IEhpDQo+Pj4+Pj4g
T24gOSBKdW4gMjAyMCwgYXQgMTY6NDcsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdy
b3RlOg0KPj4+Pj4+IE9uIDA5LzA2LzIwMjAgMTY6MjgsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6
DQo+Pj4+Pj4+IEhpLA0KPj4+Pj4+Pj4gT24gOSBKdW4gMjAyMCwgYXQgMTU6MzMsIENvZGVXaXoy
MjgwIDxjb2Rld2l6MjI4MEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4+Pj4gVGhlcmUgZG9lcyBh
cHBlYXIgdG8gYmUgYSBzZWNvbmRhcnkgKENJQykgY29udHJvbGxlciB0aGF0IGNhbiBmb3J3YXJk
DQo+Pj4+Pj4+PiBldmVudHMgdG8gdGhlIEdJQy00MDAgYW5kIEVETUEgY29udHJvbGxlcnMgZm9y
IHRoZSBrZXlzdG9uZSAyIGZhbWlseS4NCj4+Pj4+Pj4+IEFkbWl0dGVkbHksIGknbSBub3Qgc3Vy
ZSBob3cgaXQgaXMgYmVpbmcgdXNlZCB3aXRoIHJlZ2FyZHMgdG8gdGhlDQo+Pj4+Pj4+PiBwZXJp
cGhlcmFscy4gIEkgb25seSBzZWUgbWVudGlvbiBvZiB0aGUgR0lDLTQwMCBwYXJlbnQgZm9yIHRo
ZSBkZXZpY2VzDQo+Pj4+Pj4+PiBpbiB0aGUgZGV2aWNlIHRyZWUuICBNYXliZSBCZXJ0cmFuZCBo
YXMgYSBiZXR0ZXIgaWRlYSBvbiB3aGV0aGVyIGFueQ0KPj4+Pj4+Pj4gcGVyaXBoZXJhbHMgZ28g
dGhyb3VnaCB0aGUgQ0lDIGZpcnN0PyAgSSBzZWUgdGhhdCBnaWNfaW50ZXJydXB0ICgpDQo+Pj4+
Pj4+PiBmaXJlcyBvbmNlIGluIFhlbiwgd2hpY2ggY2FsbHMgZG9JUlEgdG8gcHVzaCBvdXQgdGhl
IHZpcnR1YWwgaW50ZXJydXB0DQo+Pj4+Pj4+PiB0byB0aGUgZG9tMCBrZXJuZWwuICBUaGUgZG9t
MCBrZXJuZWwgdGhlbiBoYW5kbGVzIHRoZSBpbnRlcnJ1cHQgYW5kDQo+Pj4+Pj4+PiByZXR1cm5z
LCBidXQgZ2ljX2ludGVycnVwdCgpIG5ldmVyIGZpcmVzIGFnYWluIGluIFhlbi4NCj4+Pj4+Pj4g
SSBkbyBub3QgcmVtZW1iZXIgb2YgYW55IENJQyBidXQgdGhlIGJlaGF2aW91ciBkZWZpbml0ZWx5
IGxvb2sgbGlrZSBhbiBpbnRlcnJ1cHQgYWNrbm93bGVkZ2UgcHJvYmxlbS4NCj4+Pj4+Pj4gQ291
bGQgeW91IHRyeSB0aGUgZm9sbG93aW5nOg0KPj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2lj
LXYyLmMNCj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jDQo+Pj4+Pj4+IEBAIC02
NjcsNiArNjY3LDkgQEAgc3RhdGljIHZvaWQgZ2ljdjJfZ3Vlc3RfaXJxX2VuZChzdHJ1Y3QgaXJx
X2Rlc2MgKmRlc2MpDQo+Pj4+Pj4+ICAgICAvKiBMb3dlciB0aGUgcHJpb3JpdHkgb2YgdGhlIElS
USAqLw0KPj4+Pj4+PiAgICAgZ2ljdjJfZW9pX2lycShkZXNjKTsNCj4+Pj4+Pj4gICAgIC8qIERl
YWN0aXZhdGlvbiBoYXBwZW5zIGluIG1haW50ZW5hbmNlIGludGVycnVwdCAvIHZpYSBHSUNWICov
DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICAvKiBUZXN0IGZvciBLZXlzdG9uZTIgKi8NCj4+Pj4+
Pj4gKyAgICBnaWN2Ml9kaXJfaXJxKGRlc2MpOw0KPj4+Pj4+PiB9DQo+Pj4+Pj4+IEkgdGhpbmsg
dGhlIHByb2JsZW0gSSBoYWQgd2FzIHJlbGF0ZWQgdG8gdGhlIHZnaWMgbm90IGRlYWN0aXZhdGlu
ZyBwcm9wZXJseSB0aGUgaW50ZXJydXB0Lg0KPj4+Pj4+IEFyZSB5b3Ugc3VnZ2VzdGluZyB0aGUg
Z3Vlc3QgRU9JIGlzIG5vdCBwcm9wZXJseSBmb3J3YXJkZWQgdG8gdGhlIGhhcmR3YXJlIHdoZW4g
TFIuSFcgaXMgc2V0PyBJZiBzbywgdGhpcyBjb3VsZCBwb3NzaWJseSBiZSB3b3JrYXJvdW5kIGlu
IFhlbiBieSByYWlzaW5nIGEgbWFpbnRlbmFuY2UgaW50ZXJydXB0IGV2ZXJ5IHRpbWUgYSBndWVz
dCBFT0kgYW4gaW50ZXJydXB0Lg0KPj4+Pj4gQWdyZWUgdGhlIG1haW50ZW5hbmNlIGludGVycnVw
dCB3b3VsZCBkZWZpbml0ZWx5IGJlIHRoZSByaWdodCBzb2x1dGlvbg0KPj4+PiBJIHdvdWxkIGxp
a2UgdG8gbWFrZSBzdXJlIHdlIGFyZW4ndCBtaXNzaW5nIGFueXRoaW5nIGluIFhlbiBmaXJzdC4N
Cj4+Pj4gRnJvbSB3aGF0IHlvdSBzYWlkLCB5b3UgaGF2ZSBlbmNvdW50ZXJlZCB0aGlzIGlzc3Vl
IGluIHRoZSBwYXN0IHdpdGggYQ0KPj4+PiBkaWZmZXJlbnQgaHlwZXJ2aXNvci4gU28gaXQgZG9l
c24ndCBsb29rIGxpa2UgdG8gYmUgWGVuIHJlbGF0ZWQuDQo+Pj4+IFdhcyB0aGVyZSBhbnkgb2Zm
aWNpYWwgc3RhdGVtZW50IGZyb20gVEk/IElmIG5vdCwgY2FuIHdlIHRyeSB0byBnZXQNCj4+Pj4g
c29tZSBpbnB1dCBmcm9tIHRoZW0gZmlyc3Q/DQo+Pj4+IEBNYXJjLCBJIGtub3cgeW91IGRyb3Bw
ZWQgMzItYml0IHN1cHBvcnQgaW4gS1ZNIHJlY2VudGx5IDopLiBBbHRob3VnaCwNCj4+PiBZZXMh
IFZpY3RvcnkgaXMgbWluZSEgRnJlZWRvbSBmcm9tIHRoZSBzaGFja2xlcyBvZiAzMmJpdCwgYXQg
bGFzdCEgOkQNCj4+Pj4gSSB3YXMgd29uZGVyaW5nIGlmIHlvdSBoZWFyZCBhYm91dCBhbnkgcG90
ZW50aWFsIGlzc3VlIHdpdGggZ3Vlc3QgRU9JDQo+Pj4+IG5vdCBmb3J3YXJkZWQgdG8gdGhlIGhv
c3QuIFRoaXMgaXMgb24gVEkgS2V5c3RvbmUgKENvcnRleCBBLTE1KS4NCj4+PiBOb3QgdGhhdCBJ
IGtub3cgb2YuIEEtMTUgZGVmaW5pdGVseSB3b3JrcyAoVEMyLCBUZWdyYS1LMSwgQ2FseGVkYSBN
aWR3YXkgYWxsIHJ1biBqdXN0IGZpbmUgd2l0aCBndWVzdCBFT0kpLCBhbmQgR0lDLTQwMCBpcyBh
IHByZXR0eSBzb2xpZCBwaWVjZSBvZiBraXQgKGl0IGlzIGp1c3Qgc2xvb29vb293Li4uKS4NCj4+
PiBUaGlua2luZyBvZiBpdCwgeW91IHdvdWxkIHNlZSBzb21ldGhpbmcgbGlrZSB0aGF0IGlmIHRo
ZSBHSUMgd2FzIHNlZWluZyB0aGUgd3JpdGVzIGNvbWluZyBmcm9tIHRoZSBndWVzdCBhcyBzZWN1
cmUgaW5zdGVhZCBvZiBOUyAoY3VlIHRoZSBlYXJseSBmaXJtd2FyZSBvbiBYR2VuZSB0aGF0IGV4
cG9zZWQgdGhlIHdyb25nIHNpZGUgb2YgR0lDLTQwMCkuDQo+Pj4gSXMgdGhlcmUgc29tZSBraW5k
IG9mIGZ1bmt5IGJyaWRnZSBiZXR3ZWVuIHRoZSBDUFUgYW5kIHRoZSBHSUM/DQo+PiBZZXMgdGhl
IGJlaGF2aW91ciBJIGhhZCB3YXMgY29oZXJlbnQgd2l0aCB0aGUgR0lDIHNlZWluZyB0aGUgcHJv
Y2Vzc29yDQo+PiBpbiBzZWN1cmUgbW9kZSBhbmQgbm90IGluIG5vbiBzZWN1cmUgaGVuY2UgbWFr
aW5nIHRoZSBWR0lDIGFjayBub24NCj4+IGZ1bmN0aW9uYWwuDQo+IA0KPiBDYW4geW91IHBsZWFz
ZSBjaGVjayB0aGlzIHdpdGggdGhlIFRJIGZvbGtzPyBJdCBtYXkgYmUgZml4YWJsZSBpZg0KPiB0
aGUgYnJpZGdlIGlzIFNXIGNvbmZpZ3VyYWJsZS4NCg0KQXQgdGhhdCB0aW1lIHRoZXkgZGlkIG5v
dCDigJxvZmZlcuKAnSB0aGF0IHNvbHV0aW9uIGJ1dCBkb2VzIG5vdCBtZWFuIGl0IGlzIG5vdCBw
b3NzaWJsZS4NCg0KPiANCj4+IFNvIHRoZSBvbmx5IHdheSB0byBzb2x2ZSB0aGlzIGlzIGFjdHVh
bGx5IHRvIGRvIHRoZSBpbnRlcnJ1cHQNCj4+IGRlYWN0aXZhdGUgaW5zaWRlIFhlbiAodXNpbmcg
YSBtYWludGVuYW5jZSBpbnRlcnJ1cHQpLg0KPiANCj4gVGhhdCdzIGEgdGVycmlibGUgaGFjaywg
YW5kIG9uZSB0aGF0IHdvdWxkIGVuY291cmFnZSBiYWRseSBpbnRlZ3JhdGVkIEhXLg0KPiBJIGFw
cHJlY2lhdGUgdGhlIG5lZWQgdG8gIm1ha2UgdGhpbmdzIHdvcmsiLCBidXQgSSdkIGJlIHdhcnkg
b2YgcHV0dGluZw0KPiB0aGlzIGluIHJlbGVhc2VkIFNXLiBCcm9rZW4gSFcgbXVzdCBkaWUuIEkg
aGF2ZSB3cml0dGVuIG1vcmUgdGhhbiBteSBzaGFyZQ0KPiBvZiB0aGVzZSB0ZXJyaWJsZSBoYWNr
cyAoc2VlIFRYMSBzdXBwb3J0KSwgYW5kIEkgZGVlcGx5IHJlZ3JldCBpdCwgYXMNCj4gaXQgaGFz
IG9ubHkgZ2l2ZW4gU2kgdmVuZG9ycyBhbiBleGN1c2Ugbm90IHRvIGZpeCB0aGluZ3MuDQoNCkZ1
bGx5IGFncmVlIGFuZCBJIGFsc28gaGFkIHRvIGRvIHNvbWUgaGFja3MgZm9yIHRoZSBUWDEgOy0p
DQoNCj4gDQo+PiBJIHJlbWVtYmVyIHRoYXQgSSBhbHNvIGhhZCB0byBkbyBzb21ldGhpbmcgc3Bl
Y2lmaWMgZm9yIHRoZQ0KPj4gY29uZmlndXJhdGlvbiBvZiBlZGdlL2xldmVsIGFuZCBwcmlvcml0
aWVzIHRvIGhhdmUgYW4gYWxtb3N0IHByb3Blcg0KPj4gYmVoYXZpb3VyLg0KPiANCj4gV2VsbCwg
dGhlIG1vbWVudCB0aGUgR0lDIG9ic2VydmVzIHNlY3VyZSBhY2Nlc3NlcyB3aGVuIHRoZXkgc2hv
dWxkIGJlDQo+IG5vbi1zZWN1cmUsIGFsbCBiZXRzIGFyZSBvZmYgYW5kIHlvdSBoYXZlIHRvIHJl
c29ydCB0byB0aGUgYWJvdmUgaGFja3MuDQo+IFRoZSBmdW4gcGFydCBpcyB0aGF0IGlmIHlvdSBo
YXZlIHNlY3VyZSBTVyBydW5uaW5nIG9uIHRoaXMgcGxhdGZvcm0sDQo+IHlvdSBjYW4gcHJvYmFi
bHkgRG9TIGl0IGZyb20gbm9uLXNlY3VyZS4gSXQncyBnb29kLCBpc24ndCBpdD8NCg0KRGVmaW5p
dGVseSBpcyBidXQgaWYgSSByZW1lbWJlciBjb3JyZWN0bHkgdGhleSBoYXZlIDIga2luZCBvZiBT
b0M6IG9uZSB0aGF0IGNhbiBiZSBvbmx5IHVzZWQgaW4gbm9uLXNlY3VyZSBhbmQgYW4gb3RoZXIg
d2hpY2ggaXMgbWVhbnQgdG8gYmUgdXNlIHdpdGggc2VjdXJlIGFuZCBub24gc2VjdXJlLg0KDQpC
ZXJ0cmFuZA0KDQo+IA0KPj4gU2FkbHkgSSBoYXZlIG5vIGFjY2VzcyB0byB0aGUgY29kZSBhbnlt
b3JlLCBzbyBJIHdvdWxkIG5lZWQgdG8gZ3Vlc3MNCj4+IGJhY2sgd2hhdCB0aGF0IHdhcy4uDQo+
IA0KPiBJJ2Qgc2F5IHRoaXMgKmlzKiBhIGdvb2QgdGhpbmcuDQo+IA0KPiAgICAgICAgTS4NCj4g
LS0gDQo+IEphenogaXMgbm90IGRlYWQuIEl0IGp1c3Qgc21lbGxzIGZ1bm55Li4uDQoNCg==


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF601E7839
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 10:26:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeaKC-0003gQ-Hq; Fri, 29 May 2020 08:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYAP=7L=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jeaKB-0003gL-FL
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 08:25:07 +0000
X-Inumbo-ID: e6c125e2-a185-11ea-a87e-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6c125e2-a185-11ea-a87e-12813bfff9fa;
 Fri, 29 May 2020 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M72lr6B7WmhcuhHttzb10K1jr7NGMv84WsGVXqJtps=;
 b=q02/pFqFJlV820oCwbTuboRtqqUh9daRuWPuuIw0+unWlPGtIF67ulJG+eYjcu1Cz6imFXZ4RdYMvRovDbCERDM6imd9T1vTSMKg9tJelH6qVywgBthPkWI5F/tPRUKOGwuYxx3WzSJxGMOK7ILPvQupoqUlfvo9cjMxKBvAdoU=
Received: from AM5PR0101CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::43) by DB8PR08MB3945.eurprd08.prod.outlook.com
 (2603:10a6:10:a3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 08:25:04 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::78) by AM5PR0101CA0030.outlook.office365.com
 (2603:10a6:206:16::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Fri, 29 May 2020 08:25:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 08:25:03 +0000
Received: ("Tessian outbound 14e212f6ce41:v57");
 Fri, 29 May 2020 08:25:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff69422b973bbbc5
X-CR-MTA-TID: 64aa7808
Received: from ee7413a5b539.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D4EBB9D0-BA37-416D-8EF5-7194A1343F01.1; 
 Fri, 29 May 2020 08:24:58 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee7413a5b539.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 May 2020 08:24:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuEtzreeAA0GgfqwcHnKcXrBDZCXJn2+lvCje7f0oCxggdgmAUh/8E5+V4rfXjGaKaHuH7JrrKAoJCWHIGE51wLvhI90HRw2nm9xqpwDtgkKFVAYSY/yEPdjfojPe15uFkMLg7KlssOHvUD/B+KMafOkBMfO/W+Q8aB4chBsLX7D/HyJQrFtyASh+SHUTFQQbOGzMXJmiUBUOkmGiNhPuHXCt3fqkKpGW93lgj9tuSUKe3qbenBekWLWTrSIox2xZk+Hkv4PDnDjVrYxJsxd6Wq70avXWNprKNCGMnP3o5qdWZea0w3Noj+QAEy5j3qnT16qqAMqkMuHMnI+5HgF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M72lr6B7WmhcuhHttzb10K1jr7NGMv84WsGVXqJtps=;
 b=N61acOQaO6bZp/z9chDMPX0/n+4UIImE6WwXeaM5YA/FKDGgeWEF1/mp2rUtVJ5SEcjb2tirWvO81mC77f62Dq89vHed/d9SD9+t7S5OxqGutnizXglGJUY8LIUr9mSF3GHjJ1dks7VrcARA8b+ppysmMBwidj/icWB0OZ1iqb+7Z4ToFii4zCrX8mvLFwR2WKmf+nOOtCBme1peXhEh1D9HGjbKrzfDQokE9iwCixwRm/f+kY0Xl5eO3DMQD3D1wiSb801tnwpsJNbmwtOuWHkdnu45j5VmD/pPPXB9nCAJPuuDwSuxmEFKNk/nJNFdoqTE2ImipvHIr36HwDQ8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M72lr6B7WmhcuhHttzb10K1jr7NGMv84WsGVXqJtps=;
 b=q02/pFqFJlV820oCwbTuboRtqqUh9daRuWPuuIw0+unWlPGtIF67ulJG+eYjcu1Cz6imFXZ4RdYMvRovDbCERDM6imd9T1vTSMKg9tJelH6qVywgBthPkWI5F/tPRUKOGwuYxx3WzSJxGMOK7ILPvQupoqUlfvo9cjMxKBvAdoU=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3020.eurprd08.prod.outlook.com (2603:10a6:5:1d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 08:24:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 08:24:54 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xen.org>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Topic: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Thread-Index: AQHWNP6nIxIB/r3XC025DLnqIbmaJai92N6AgADQMICAABI3AA==
Date: Fri, 29 May 2020 08:24:54 +0000
Message-ID: <9AEB63E3-8314-4D27-B837-E11BD853DD99@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <20200529071930.GI1195@Air-de-Roger>
In-Reply-To: <20200529071930.GI1195@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea2b202a-912b-4189-19a1-08d803a9c9a7
x-ms-traffictypediagnostic: DB7PR08MB3020:|DB8PR08MB3945:
X-Microsoft-Antispam-PRVS: <DB8PR08MB39456AB97707CE37D55797BA9D8F0@DB8PR08MB3945.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DJUYVcaXfvxw76XpImEcobO83d4XZEDQpHFlYV2rADydB5qETYSh3qvqY3k9ZUOCw5XqCD9FzNnpxB+mcOmN98Td0CC1f9F83vk6XDdDROcuMjawYjMnmrp3V1LZfApPEoP8JAGOFgbDbJg6VfNQNyrSvvczfZf1izll6Nh/pi/rndPv7hhbB1P+oVg3UxXDNrn6P3Hqtb8HTrDfZpQpOWt+gm66hP0cigJcUQPOeLliWzZ0el5Qxpv8CnuSVAYutpFpW/q6VkvfyrPVhtHca0FkbA2E7WKIbuKMOOcr/Sd5/ZQHFdNGnoBu1F+b3Ier1aE0aOB3uKFIzkBlfg/3ZA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(7416002)(2616005)(478600001)(71200400001)(316002)(54906003)(66556008)(33656002)(66476007)(91956017)(6916009)(66946007)(86362001)(76116006)(66446008)(83380400001)(6486002)(64756008)(8936002)(8676002)(4326008)(6506007)(5660300002)(2906002)(36756003)(53546011)(186003)(26005)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: qmUmJMngXkWeraoZEuTQ78IvDV3e6Oo2KVkljzEbhIohD1eZrpHbf6Wa3vYOCm6vRcb4LGmvh2730X0QCf04/otYDN6R4HWBZzomvIjR0RiFDzNDYIiavIQi3c1pHYe2S2yqDy2uIo21EEOKRFdRHIlfji8Te65aKEUpw0LhYkphGXYZt+SguwVzw3o3Qv7+/OTa3JRzQm/E56tLWPFKLzCpVXbNW0r8z7xiD2S9iYv3ggmKyDGRsBwapr+F3IM+ZanmCug854o5DcVCx4o+2kopKCbGqppe0/6be1M9yetzREBZ41LeZRXtLXAJ4Tmi45apMkvI82Efb6YUY9MmywMiNeaOjsjHuhwIeDkILfOgqxLixqBHiPiXJ+efOeHT0eu+Kg6U/iUhFjq+jNk3TrNwVQoo3WR6tESX//th+W8HzFzX2nTPsUwmnQ7Jv26xzXPVArAUSrxchvVOxav52e785/D1WagUNK+dVMGdRbb7u9aGv/pzuvbRlQLnZLiz
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <29B68D287AD7314D8C6E3C32AC8BC6B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3020
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966005)(83380400001)(2906002)(336012)(86362001)(6512007)(6862004)(2616005)(4326008)(54906003)(82740400003)(36756003)(47076004)(356005)(70586007)(81166007)(8936002)(70206006)(26005)(36906005)(6506007)(53546011)(33656002)(6486002)(5660300002)(8676002)(478600001)(186003)(82310400002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0b2803d7-7af1-4eba-daee-08d803a9c42e
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jhZ+U8Hsi2v5Y9H+YwDIIuv5c48oHQi1+eP8/4b5CUApaAJYYWRh+l1y9jJc2aeGYs5M7ff7m+vmDR3eaZ7kFFIYaYIsNsqmTJjs8bAofEu+QDEDvWkWr1ho0SCQpefKktDg+knCWnnQLMPWdDjCSSpP5ZW1XqLD6dG1Z6Xwwa9C3cThUvkDwyOzsdPPPatEJ9FGLniRMTVYmhpeP+tZN5M2lzVmm+W1/uIgQz/6DPYmo83yxeWN6i5Y9Mbus7SVY5344S5roxVWYb1bDhA2k5ULQdCkiK7xX4KSaxQb7Jf8TfFtUkG2mjMAbLJci30AfB4GNVRP+yqP09AVx5tIivSR0OCBRWYQLi44RCc4gSp59s2BAnOknnYdGsDvGII5/oEuw7F+5jnpT+GA274Ogg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 08:25:03.9823 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2b202a-912b-4189-19a1-08d803a9c9a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3945
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjkgTWF5IDIwMjAsIGF0IDA4OjE5LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlckB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgTWF5IDI4LCAyMDIwIGF0IDA3OjU0OjM1UE0g
KzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IEhpIEJlcnRyYW5kLA0KPj4gDQo+PiBUaGFu
ayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4+IA0KPj4gT24gMjgvMDUvMjAyMCAxNjoyNSwgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+PiArc3RhdGljIGludCBtYXBfcnVuc3RhdGVfYXJlYShzdHJ1
Y3QgdmNwdSAqdiwNCj4+PiArICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmNwdV9yZWdpc3Rl
cl9ydW5zdGF0ZV9tZW1vcnlfYXJlYSAqYXJlYSkNCj4+PiArew0KPj4+ICsgICAgdW5zaWduZWQg
bG9uZyBvZmZzZXQgPSBhcmVhLT5hZGRyLnAgJiB+UEFHRV9NQVNLOw0KPj4+ICsgICAgdm9pZCAq
bWFwcGluZzsNCj4+PiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7DQo+Pj4gKyAgICBzaXpl
X3Qgc2l6ZSA9IHNpemVvZihzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvKTsNCj4+PiArDQo+Pj4g
KyAgICBBU1NFUlQocnVuc3RhdGVfZ3Vlc3QodikgPT0gTlVMTCk7DQo+Pj4gKw0KPj4+ICsgICAg
LyogZG8gbm90IGFsbG93IGFuIGFyZWEgY3Jvc3NpbmcgMiBwYWdlcyAqLw0KPj4+ICsgICAgaWYg
KCBvZmZzZXQgPiAoUEFHRV9TSVpFIC0gc2l6ZSkgKQ0KPj4+ICsgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPj4gDQo+PiBUaGlzIGlzIGEgY2hhbmdlIGluIGJlaGF2aW9yIGZvciB0aGUgZ3Vlc3Qu
IElmIHdlIGFyZSBnb2luZyBmb3J3YXJkIHdpdGgNCj4+IHRoaXMsIHRoaXMgd2lsbCB3YW50IGEg
c2VwYXJhdGUgcGF0Y2ggd2l0aCBpdHMgb3duIGV4cGxhbmF0aW9uIHdoeSB0aGlzIGlzDQo+PiBk
b25lLg0KPiANCj4gSSBkb24ndCB0aGluayB3ZSBjYW4gZ28gdGhpcyByb3V0ZSB3aXRob3V0IHN1
cHBvcnRpbmcgY3Jvc3NpbmcgYSBwYWdlDQo+IGJvdW5kYXJ5Lg0KPiANCj4gTGludXggd2lsbCBC
VUcgaWYgVkNQVU9QX3JlZ2lzdGVyX3J1bnN0YXRlX21lbW9yeV9hcmVhIGZhaWxzLCBhbmQNCj4g
QUZBSUNUIHRoZXJlJ3Mgbm8gY2hlY2sgaW4gTGludXggdG8gYXNzdXJlIHRoZSBydW5zdGF0ZSBh
cmVhIGRvZXNuJ3QNCj4gY3Jvc3MgYSBwYWdlIGJvdW5kYXJ5LiBJZiB3ZSB3YW50IHRvIGdvIHRo
aXMgcm91dGUgd2UgbXVzdCBzdXBwb3J0IHRoZQ0KPiBhcmVhIGNyb3NzaW5nIGEgcGFnZSBib3Vu
ZGFyeSwgb3IgZWxzZSB3ZSB3aWxsIGJyZWFrIGV4aXN0aW5nDQo+IGd1ZXN0cy4NCg0KQWdyZWUs
IEkgd2lsbCBhZGQgY3Jvc3MgcGFnZSBib3VuZGFyeSBzdXBwb3J0Lg0KDQo+IA0KPj4+ICsNCj4+
PiArI2lmZGVmIENPTkZJR19BUk0NCj4+PiArICAgIHBhZ2UgPSBnZXRfcGFnZV9mcm9tX2d2YSh2
LCBhcmVhLT5hZGRyLnAsIEdWMk1fV1JJVEUpOw0KPj4gDQo+PiBBIGd1ZXN0IGlzIGFsbG93ZWQg
dG8gc2V0dXAgdGhlIHJ1bnN0YXRlIGZvciBhIGRpZmZlcmVudCB2Q1BVIHRoYW4gdGhlDQo+PiBj
dXJyZW50IG9uZS4gVGhpcyB3aWxsIGxlYWQgdG8gZ2V0X3BhZ2VfZnJvbV9ndmEoKSB0byBmYWls
IGFzIHRoZSBmdW5jdGlvbg0KPj4gY2Fubm90IHlldCB3b3JrIHdpdGggYSB2Q1BVIG90aGVyIHRo
YW4gY3VycmVudC4NCj4+IA0KPj4gQUZBSUNULCB0aGVyZSBpcyBubyByZXN0cmljdGlvbiBvbiB3
aGVuIHRoZSBydW5zdGF0ZSBoeXBlcmNhbGwgY2FuIGJlDQo+PiBjYWxsZWQuIFNvIHRoaXMgY2Fu
IGV2ZW4gYmUgY2FsbGVkIGJlZm9yZSB0aGUgdkNQVSBpcyBicm91Z2h0IHVwLg0KPj4gDQo+PiBJ
IHdhcyBnb2luZyB0byBzdWdnZXN0IHRvIHVzZSB0aGUgY3VycmVudCB2Q1BVIGZvciB0cmFuc2xh
dGluZyB0aGUgYWRkcmVzcy4NCj4+IEhvd2V2ZXIsIGl0IHdvdWxkIGJlIHJlYXNvbmFibGUgZm9y
IGFuIE9TIHRvIHVzZSB0aGUgc2FtZSB2aXJ0dWFsIGFkZHJlc3MNCj4+IGZvciBhbGwgdGhlIHZD
UFVzIGFzc3VtaW5nIHRoZSBwYWdlLXRhYmxlcyBhcmUgZGlmZmVyZW50IHBlciB2Q1BVLg0KPiAN
Cj4gSG0sIGl0J3MgYSB0cmlja3kgcXVlc3Rpb24uIFVzaW5nIHRoZSBjdXJyZW50IHZDUFUgcGFn
ZSB0YWJsZXMgd291bGQNCj4gc2VlbSBsaWtlIGEgZ29vZCBjb21wcm9taXNlLCBidXQgaXQgbmVl
ZHMgdG8gZ2V0IGFkZGVkIHRvIHRoZSBoZWFkZXINCj4gYXMgYSBub3RlLCBhbmQgdGhpcyBzaG91
bGQgaWRlYWxseSBiZSBtZXJnZWQgYXQgdGhlIHN0YXJ0IG9mIGENCj4gZGV2ZWxvcG1lbnQgY3lj
bGUgdG8gZ2V0IHBlb3BsZSB0aW1lIHRvIHRlc3QgYW5kIHJlcG9ydCBpc3N1ZXMuDQoNCkkgYWdy
ZWUgYW5kIGFzIHRoaXMgd2lsbCBub3QgZ28gaW4gNC4xNCB3ZSBjb3VsZCBnb3QgdGhpcyByb3V0
ZSB0byBoYXZlIHRoaXMgaW4gNC4xNSA/DQoNCkJlcnRyYW5kDQoNCj4gDQo+PiBSZWNlbnQgTGlu
dXggYXJlIHVzaW5nIGEgcGVyLWNwdSBhcmVhLCBzbyB0aGUgdmlydHVhbCBhZGRyZXNzIHNob3Vs
ZCBiZQ0KPj4gZGlmZmVyZW50IGZvciBlYWNoIHZDUFUuIEJ1dCBJIGRvbid0IGtub3cgaG93IHRo
ZSBvdGhlciBPU2VzIHdvcmtzLiBSb2dlcg0KPj4gc2hvdWxkIGJlIGFibGUgdG8gaGVscCBmb3Ig
RnJlZUJTRCBhdCBsZWFzdC4NCj4gDQo+IEZyZWVCU0QgZG9lc24ndCB1c2UgVkNQVU9QX3JlZ2lz
dGVyX3J1bnN0YXRlX21lbW9yeV9hcmVhIGF0IGFsbCwgc28gd2UNCj4gYXJlIHNhZmUgaW4gdGhh
dCByZWdhcmQuDQo+IA0KPiBJIG5ldmVyIGdvdCBhcm91bmQgdG8gaW1wbGVtZW50aW5nIHRoZSBy
ZXF1aXJlZCBzY2hlZHVsZXIgY2hhbmdlcyBpbg0KPiBvcmRlciB0byBzdXBwb3J0IHN0b2xlbiB0
aW1lIGFjY291bnRpbmcuICBOb3RlIHN1cmUgdGhpcyBoYXMgY2hhbmdlZA0KPiBzaW5jZSBJIGxh
c3QgY2hlY2tlZCwgdGhlIGJoeXZlIGFuZCBLVk0gZ3V5cyBhbHNvIGhhZCBpbnRlcmVzdCBpbg0K
PiBwcm9wZXJseSBhY2NvdW50aW5nIGZvciBzdG9sZW4gdGltZSBvbiBGcmVlQlNEIElJUkMuDQo+
IA0KPiBSb2dlci4NCg0K


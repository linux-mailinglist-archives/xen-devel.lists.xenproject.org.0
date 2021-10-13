Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD2242BC07
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 11:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208145.364184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maasb-0003uU-WC; Wed, 13 Oct 2021 09:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208145.364184; Wed, 13 Oct 2021 09:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maasb-0003rT-S0; Wed, 13 Oct 2021 09:48:57 +0000
Received: by outflank-mailman (input) for mailman id 208145;
 Wed, 13 Oct 2021 09:48:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0M7b=PB=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maasa-0003rN-Lb
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 09:48:56 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::60f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11609a78-5dcd-443c-8a1e-6065f8de0730;
 Wed, 13 Oct 2021 09:48:55 +0000 (UTC)
Received: from AM6P195CA0063.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::40)
 by AM9PR08MB6929.eurprd08.prod.outlook.com (2603:10a6:20b:302::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Wed, 13 Oct
 2021 09:48:51 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::2) by AM6P195CA0063.outlook.office365.com
 (2603:10a6:209:87::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Wed, 13 Oct 2021 09:48:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Wed, 13 Oct 2021 09:48:50 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Wed, 13 Oct 2021 09:48:50 +0000
Received: from 3432700502bc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 409F5B34-10DE-41BE-BB7F-DEF3B8623BAE.1; 
 Wed, 13 Oct 2021 09:48:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3432700502bc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Oct 2021 09:48:44 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBBPR08MB5961.eurprd08.prod.outlook.com (2603:10a6:10:203::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 09:48:42 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 09:48:42 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 11609a78-5dcd-443c-8a1e-6065f8de0730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=175H1M8tup36RDH1O3KJZKlC+Kg+GCkSYn0C3TWzQhQ=;
 b=gHMueHHmJyOP0ijUOgGP2Fp0WsRxft80f0zfOr09c6jkA2fBonolr6MTBryuqKF29+nVSG33x+hJYFGypuWMTyT5ovIiQVrTlFl5qLNheDaOIK/lYIitW3Zm2NPXt6Mg2XYL43x9yh2CZdIqBKoza9HvT9Gtgp16SYO2eHRxd6U=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass
 (signature was verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=temperror action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34b67f7e699b2c08
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLvpLQMNkG493WMjCVF7EBsUcumpXD0jalhILxHKTSBkdl5F2JB1CEOcQ3XuH3skIAbN8VVPVF36fihZcEJW9Mm3BFNtI/NKZUKYMwmw9sAP4ijlLD7D96/qd8G1DoOLPVpV9uSxh9D6jnmotv2ACUPiB+u3gXFAfL9318b6SVxvLnHXZlQpQQdbA1JFzTHiBq68Noib4h6EV4bBhSsJ7Oz0A80V+errZSHqWRnV5k7Ji1zBOsDPa1IWaTL4EmXH9zJbQHIXOw6+v2szqn1cd4u93uuQuNHbbeLNlE15JvHuko7x4tFXhuOcMI2TYifjTJ2XJeV2OJZ60631/9E9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=175H1M8tup36RDH1O3KJZKlC+Kg+GCkSYn0C3TWzQhQ=;
 b=g5uGbTulPlAL7MN8qOacv53lTyonyzhnu/dM2mYJgyd0Yj9AFDWbbE0g9VTVS8To46pV6OHd9G1erIuyMbqeue4DNYzTb38JD/plIGI/sRJCL75S/4hqpD5tJzHA/MyQeCZHrqeDKAlVNgrSSqK632WzkSGwm6u2QftxtFAre2cr3ZmPhC4BLkkTd0DFda/AiVr9ODhsqWp8nbeqBLwbB2OZ+GK6x2so1Op5qeUE603gOA8O1hLayocQ33Yo0YWv/UQ5DF0vQ0DLMiISbRS9JinLQleu4DkJI6yKWiNH3vmEGVShSQY191EzbqnimWStxUIpdhF1X63+LZyD+x0kvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=175H1M8tup36RDH1O3KJZKlC+Kg+GCkSYn0C3TWzQhQ=;
 b=gHMueHHmJyOP0ijUOgGP2Fp0WsRxft80f0zfOr09c6jkA2fBonolr6MTBryuqKF29+nVSG33x+hJYFGypuWMTyT5ovIiQVrTlFl5qLNheDaOIK/lYIitW3Zm2NPXt6Mg2XYL43x9yh2CZdIqBKoza9HvT9Gtgp16SYO2eHRxd6U=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXutl3YqS5dHXsYk6KpdKt4d14RavQp5+AgAARr4A=
Date: Wed, 13 Oct 2021 09:48:42 +0000
Message-ID: <7077F76D-37B0-45F6-9B0D-0D9436E23716@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
In-Reply-To: <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e7d37081-3acc-4039-936f-08d98e2ea95a
x-ms-traffictypediagnostic: DBBPR08MB5961:|AM9PR08MB6929:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6929AF5DB1E392959C2505449DB79@AM9PR08MB6929.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VEke3VJBeqzIuu3oJonnKHunaprNxP2dy4NEafoYTqNTSD7gGD2fuu5Om1eC7mS5x/Ha1HSYmU6LgeUJ0WuL94K/5uYLp2U3VA1n9wwvOZj4Kcc3IcoaTXKIjIwUwM2VAhMpqgKNg3vFzm8MtfK9EX8T/jwBtOiR9Z7qrvKxR0/5SUpA7jqMO+hWeKkKwjJv9HfGlzg+7PH4cCosQo1XJaroCpVM8CwQO59V0NJuWuPpenmLfze9eSMQGcgTi20VHv/uLip9mVD6kpxT5rWf2eCxCJvWupiSH9DFlh2qVOl2YVIyAqIWvO3hRu1mQZzx3A4CDSI3DG+lqVjorMy6bmbYHo9m1P7BLm724st9OygXGfParisiXuV89USWaDZd3Mh+b0poxy4QzZZmfhpRgBpHZu2MyAlBXbSPE9bPc8VtR39AazkRuv8uDdZwkcnxAmb0J0Mg1Bd1BHsJbH65y1hIsswVjF5uPk6iROkGF7Ydp/q9fSbru4/gjGLQppjy4VLYcbaIM3z3Rll+WohhwlmPM9LWmaXPG0jw3b0hsPweODcXbVs17yJzdK9STp5yamDb43m9xPlqyIPjrY+lmr1Ab7maf2NuBYMKJ91UXOsYWVo7tEEEHvuYA1TS1gE45KW9HPWqtMiFhj1SmTYA+agXdbwv8A0+KCk15nFX8t8MgjvqgGr+SJjDLBSai381I/0KmN30WSKtLcrbi6vtRTQWey9OXUPfUedf7/Qkfd3SZKuQQ+ZS+mLsY0nWXXlmVB8/4HmdObxLHdkzoYhc4Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2616005)(66446008)(76116006)(508600001)(36756003)(8936002)(91956017)(86362001)(6512007)(66476007)(66556008)(6486002)(316002)(6506007)(33656002)(53546011)(54906003)(66946007)(64756008)(71200400001)(38070700005)(7416002)(2906002)(26005)(8676002)(4326008)(38100700002)(122000001)(5660300002)(83380400001)(6916009)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9C4A83810998B4286A1BA366053CBA0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5961
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec98b962-43d7-4c20-0092-08d98e2ea457
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+I/0iDN54pG+AHyb3gstxXIE4x8H0VQREa2zZ0aGftMMHA62BvqepXKKevop2bOegQR79Zd6AIHcQYfqJhLuEMwzErl8aJ+O/R69erawEaCPDuHVhWCjE9hXi1zL/1JFq1VGMTw3zC8BIz0x5vKHuMfQIde50HQGj7dQph8rMxil7pynuJuaUV772JTt/VPqzmKdRVlNkKH9l+fEp6FpBTILSdwt4AVrKFA2sRgTiaBB3LKGYhdrEJJfg08nqNfCsflpUo6kcZLgTMqeGfs0Iq2ZaXwn+GtCeIO+qduelwf+sN/w8/S41+mPFp5VDuZAlx9Yk+O/pRCb34dBj41KpXt3kDo+/BpdTX2vpEOyx1OjV56BaxX+qyE4YbYKLG7Ed8J8hy2tOuGROyzHWYYs8pj73FbZvr5I5XKuyK/7CvpkT+avcvx+dnnAsJJ2v3c86dojut6dT8Ru5nR7WORuu+BDf54wRBZ9gs+hQ/UmqNvlOUui92mgZBpdkPnWn8yAEKXfiHyPBee7sqi2CsBtOrq+lnsCj2A57p9h3KpCqA5NXBY3mhJF3LwPEhXzF2X04f+x2piREoBbWNnrPx6H6o7HC8hjuyBNcPI2ZmGYI4nI5YuVR82F/5eswE14w6WcwrfK9LoThm6uWyCYrgVLh1BMwYo/OBXRR4rmWRXAd10rqbOawVO0Q4IyVz8++aeKhhj87VdZUuNBjNA6xfos4oScF+ZN+l2P6oJbabc4jDEgdq4yRf/b3X6dz4qY3IoN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(36756003)(82310400003)(5660300002)(6512007)(2906002)(54906003)(186003)(316002)(508600001)(26005)(47076005)(70586007)(36860700001)(6506007)(86362001)(4326008)(8676002)(70206006)(6862004)(336012)(53546011)(356005)(33656002)(8936002)(81166007)(2616005)(6486002)(63350400001)(63370400001)(2004002)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 09:48:50.9841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d37081-3acc-4039-936f-08d98e2ea95a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6929

SGkgUm9nZXIsDQoNCj4gT24gMTMgT2N0IDIwMjEsIGF0IDA5OjQ1LCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIE9jdCAwNiwgMjAy
MSBhdCAwNjo0MDozNFBNICswMTAwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IFRoZSBleGlzdGlu
ZyBWUENJIHN1cHBvcnQgYXZhaWxhYmxlIGZvciBYODYgaXMgYWRhcHRlZCBmb3IgQXJtLg0KPj4g
V2hlbiB0aGUgZGV2aWNlIGlzIGFkZGVkIHRvIFhFTiB2aWEgdGhlIGh5cGVyIGNhbGwNCj4+IOKA
nFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZOKAnSwgVlBDSSBoYW5kbGVyIGZvciB0aGUgY29uZmln
IHNwYWNlDQo+PiBhY2Nlc3MgaXMgYWRkZWQgdG8gdGhlIFhlbiB0byBlbXVsYXRlIHRoZSBQQ0kg
ZGV2aWNlcyBjb25maWcgc3BhY2UuDQo+PiANCj4+IEEgTU1JTyB0cmFwIGhhbmRsZXIgZm9yIHRo
ZSBQQ0kgRUNBTSBzcGFjZSBpcyByZWdpc3RlcmVkIGluIFhFTg0KPj4gc28gdGhhdCB3aGVuIGd1
ZXN0IGlzIHRyeWluZyB0byBhY2Nlc3MgdGhlIFBDSSBjb25maWcgc3BhY2UsWEVODQo+PiB3aWxs
IHRyYXAgdGhlIGFjY2VzcyBhbmQgZW11bGF0ZSByZWFkL3dyaXRlIHVzaW5nIHRoZSBWUENJIGFu
ZA0KPj4gbm90IHRoZSByZWFsIFBDSSBoYXJkd2FyZS4NCj4+IA0KPj4gRm9yIERvbTBsZXNzIHN5
c3RlbXMgc2Nhbl9wY2lfZGV2aWNlcygpIHdvdWxkIGJlIHVzZWQgdG8gZGlzY292ZXIgdGhlDQo+
PiBQQ0kgZGV2aWNlIGluIFhFTiBhbmQgVlBDSSBoYW5kbGVyIHdpbGwgYmUgYWRkZWQgZHVyaW5n
IFhFTiBib290cy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNp
bmdoQGFybS5jb20+DQo+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPg0KPj4gLS0tDQo+PiBDaGFuZ2UgaW4gdjU6DQo+PiAtIEFkZCBwY2lf
Y2xlYW51cF9tc2kocGRldikgaW4gY2xlYW51cCBwYXJ0Lg0KPj4gLSBBZGRlZCBSZXZpZXdlZC1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4gQ2hhbmdl
IGluIHY0Og0KPj4gLSBNb3ZlIGFkZGl0aW9uIG9mIFhFTl9ET01DVExfQ0RGX3ZwY2kgZmxhZyB0
byBzZXBhcmF0ZSBwYXRjaA0KPj4gQ2hhbmdlIGluIHYzOg0KPj4gLSBVc2UgaXNfcGNpX3Bhc3N0
aHJvdWdoX2VuYWJsZWQoKSBpbiBwbGFjZSBvZiBwY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCB2YXJp
YWJsZQ0KPj4gLSBSZWplY3QgWEVOX0RPTUNUTF9DREZfdnBjaSBmb3IgeDg2IGluIGFyY2hfc2Fu
aXRpc2VfZG9tYWluX2NvbmZpZygpDQo+PiAtIFJlbW92ZSBJU19FTkFCTEVEKENPTkZJR19IQVNf
VlBDSSkgZnJvbSBoYXNfdnBjaSgpDQo+PiBDaGFuZ2UgaW4gdjI6DQo+PiAtIEFkZCBuZXcgWEVO
X0RPTUNUTF9DREZfdnBjaSBmbGFnDQo+PiAtIG1vZGlmeSBoYXNfdnBjaSgpIHRvIGluY2x1ZGUg
WEVOX0RPTUNUTF9DREZfdnBjaQ0KPj4gLSBlbmFibGUgdnBjaSBzdXBwb3J0IHdoZW4gcGNpLXBh
c3N0aG91Z2ggb3B0aW9uIGlzIGVuYWJsZWQuDQo+PiAtLS0NCj4+IC0tLQ0KPj4geGVuL2FyY2gv
YXJtL01ha2VmaWxlICAgICAgICAgfCAgIDEgKw0KPj4geGVuL2FyY2gvYXJtL2RvbWFpbi5jICAg
ICAgICAgfCAgIDQgKysNCj4+IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgIHwgICAzICsN
Cj4+IHhlbi9hcmNoL2FybS92cGNpLmMgICAgICAgICAgIHwgMTAyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+IHhlbi9hcmNoL2FybS92cGNpLmggICAgICAgICAgIHwgIDM2
ICsrKysrKysrKysrKw0KPj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAgMTggKysr
KysrDQo+PiB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oICB8ICAgNyArKy0NCj4+IHhlbi9p
bmNsdWRlL2FzbS14ODYvcGNpLmggICAgIHwgICAyIC0NCj4+IHhlbi9pbmNsdWRlL3B1YmxpYy9h
cmNoLWFybS5oIHwgICA3ICsrKw0KPj4geGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgfCAg
IDIgKw0KPj4gMTAgZmlsZXMgY2hhbmdlZCwgMTc5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS92cGNpLmgNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9NYWtlZmlsZSBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPj4gaW5kZXggNDRk
N2NjODFmYS4uZmI5Yzk3NmVhMiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9NYWtlZmls
ZQ0KPj4gKysrIGIveGVuL2FyY2gvYXJtL01ha2VmaWxlDQo+PiBAQCAtNyw2ICs3LDcgQEAgaWZu
ZXEgKCQoQ09ORklHX05PX1BMQVQpLHkpDQo+PiBvYmoteSArPSBwbGF0Zm9ybXMvDQo+PiBlbmRp
Zg0KPj4gb2JqLSQoQ09ORklHX1RFRSkgKz0gdGVlLw0KPj4gK29iai0kKENPTkZJR19IQVNfVlBD
SSkgKz0gdnBjaS5vDQo+PiANCj4+IG9iai0kKENPTkZJR19IQVNfQUxURVJOQVRJVkUpICs9IGFs
dGVybmF0aXZlLm8NCj4+IG9iai15ICs9IGJvb3RmZHQuaW5pdC5vDQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+PiBpbmRleCAz
NjEzOGMxYjJlLi5mYmI1MmY3OGYxIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFp
bi5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4+IEBAIC0zOSw2ICszOSw3IEBA
DQo+PiAjaW5jbHVkZSA8YXNtL3ZnaWMuaD4NCj4+ICNpbmNsdWRlIDxhc20vdnRpbWVyLmg+DQo+
PiANCj4+ICsjaW5jbHVkZSAidnBjaS5oIg0KPj4gI2luY2x1ZGUgInZ1YXJ0LmgiDQo+PiANCj4+
IERFRklORV9QRVJfQ1BVKHN0cnVjdCB2Y3B1ICosIGN1cnJfdmNwdSk7DQo+PiBAQCAtNzY3LDYg
Kzc2OCw5IEBAIGludCBhcmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICAg
ICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSAmJiAocmMgPSBkb21haW5fdnVhcnRfaW5pdChk
KSkgKQ0KPj4gICAgICAgICBnb3RvIGZhaWw7DQo+PiANCj4+ICsgICAgaWYgKCAocmMgPSBkb21h
aW5fdnBjaV9pbml0KGQpKSAhPSAwICkNCj4+ICsgICAgICAgIGdvdG8gZmFpbDsNCj4+ICsNCj4+
ICAgICByZXR1cm4gMDsNCj4+IA0KPj4gZmFpbDoNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IGluZGV4
IGM1YWZiZTJlMDUuLmY0Yzg5YmRlOGMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4gQEAg
LTMwNTMsNiArMzA1Myw5IEBAIHZvaWQgX19pbml0IGNyZWF0ZV9kb20wKHZvaWQpDQo+PiAgICAg
aWYgKCBpb21tdV9lbmFibGVkICkNCj4+ICAgICAgICAgZG9tMF9jZmcuZmxhZ3MgfD0gWEVOX0RP
TUNUTF9DREZfaW9tbXU7DQo+PiANCj4+ICsgICAgaWYgKCBpc19wY2lfcGFzc3Rocm91Z2hfZW5h
YmxlZCgpICkNCj4+ICsgICAgICAgIGRvbTBfY2ZnLmZsYWdzIHw9IFhFTl9ET01DVExfQ0RGX3Zw
Y2k7DQo+PiArDQo+PiAgICAgZG9tMCA9IGRvbWFpbl9jcmVhdGUoMCwgJmRvbTBfY2ZnLCB0cnVl
KTsNCj4+ICAgICBpZiAoIElTX0VSUihkb20wKSB8fCAoYWxsb2NfZG9tMF92Y3B1MChkb20wKSA9
PSBOVUxMKSApDQo+PiAgICAgICAgIHBhbmljKCJFcnJvciBjcmVhdGluZyBkb21haW4gMFxuIik7
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZwY2kuYyBiL3hlbi9hcmNoL2FybS92cGNp
LmMNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi43NmMxMmI5
MjgxDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiBA
QCAtMCwwICsxLDEwMiBAQA0KPj4gKy8qDQo+PiArICogeGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4g
KyAqDQo+PiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0
cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCj4+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQ0KPj4gKyAqIHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2Us
IG9yDQo+PiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4NCj4+ICsgKg0K
Pj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdp
bGwgYmUgdXNlZnVsLA0KPj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBl
dmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+PiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJ
VE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQ0KPj4gKyAqIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+PiArICovDQo+PiArI2luY2x1
ZGUgPHhlbi9zY2hlZC5oPg0KPj4gKw0KPj4gKyNpbmNsdWRlIDxhc20vbW1pby5oPg0KPj4gKw0K
Pj4gKyNkZWZpbmUgUkVHSVNURVJfT0ZGU0VUKGFkZHIpICAoIChhZGRyKSAmIDB4MDAwMDBmZmYp
DQo+PiArDQo+PiArLyogRG8gc29tZSBzYW5pdHkgY2hlY2tzLiAqLw0KPj4gK3N0YXRpYyBib29s
IHZwY2lfbW1pb19hY2Nlc3NfYWxsb3dlZCh1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQg
bGVuKQ0KPj4gK3sNCj4+ICsgICAgLyogQ2hlY2sgYWNjZXNzIHNpemUuICovDQo+PiArICAgIGlm
ICggbGVuID4gOCApDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiArDQo+PiArICAgIC8q
IENoZWNrIHRoYXQgYWNjZXNzIGlzIHNpemUgYWxpZ25lZC4gKi8NCj4+ICsgICAgaWYgKCAocmVn
ICYgKGxlbiAtIDEpKSApDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiArDQo+PiArICAg
IHJldHVybiB0cnVlOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IHZwY2lfbW1pb19yZWFk
KHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZ2lzdGVyX3QgKnIsIHZvaWQgKnApDQo+PiArew0KPj4gKyAgICB1bnNpZ25l
ZCBpbnQgcmVnOw0KPj4gKyAgICBwY2lfc2JkZl90IHNiZGY7DQo+PiArICAgIHVuc2lnbmVkIGxv
bmcgZGF0YSA9IH4wVUw7DQo+PiArICAgIHVuc2lnbmVkIGludCBzaXplID0gMVUgPDwgaW5mby0+
ZGFidC5zaXplOw0KPj4gKw0KPj4gKyAgICBzYmRmLnNiZGYgPSBNTUNGR19CREYoaW5mby0+Z3Bh
KTsNCj4+ICsgICAgcmVnID0gUkVHSVNURVJfT0ZGU0VUKGluZm8tPmdwYSk7DQo+PiArDQo+PiAr
ICAgIGlmICggIXZwY2lfbW1pb19hY2Nlc3NfYWxsb3dlZChyZWcsIHNpemUpICkNCj4+ICsgICAg
ICAgIHJldHVybiAwOw0KPj4gKw0KPj4gKyAgICBkYXRhID0gdnBjaV9yZWFkKHNiZGYsIHJlZywg
bWluKDR1LCBzaXplKSk7DQo+PiArICAgIGlmICggc2l6ZSA9PSA4ICkNCj4+ICsgICAgICAgIGRh
dGEgfD0gKHVpbnQ2NF90KXZwY2lfcmVhZChzYmRmLCByZWcgKyA0LCA0KSA8PCAzMjsNCj4+ICsN
Cj4+ICsgICAgKnIgPSBkYXRhOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gMTsNCj4+ICt9DQo+PiAr
DQo+PiArc3RhdGljIGludCB2cGNpX21taW9fd3JpdGUoc3RydWN0IHZjcHUgKnYsIG1taW9faW5m
b190ICppbmZvLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVyX3Qgciwg
dm9pZCAqcCkNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGludCByZWc7DQo+PiArICAgIHBjaV9z
YmRmX3Qgc2JkZjsNCj4+ICsgICAgdW5zaWduZWQgbG9uZyBkYXRhID0gcjsNCj4+ICsgICAgdW5z
aWduZWQgaW50IHNpemUgPSAxVSA8PCBpbmZvLT5kYWJ0LnNpemU7DQo+PiArDQo+PiArICAgIHNi
ZGYuc2JkZiA9IE1NQ0ZHX0JERihpbmZvLT5ncGEpOw0KPj4gKyAgICByZWcgPSBSRUdJU1RFUl9P
RkZTRVQoaW5mby0+Z3BhKTsNCj4+ICsNCj4+ICsgICAgaWYgKCAhdnBjaV9tbWlvX2FjY2Vzc19h
bGxvd2VkKHJlZywgc2l6ZSkgKQ0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAg
IHZwY2lfd3JpdGUoc2JkZiwgcmVnLCBtaW4oNHUsIHNpemUpLCBkYXRhKTsNCj4+ICsgICAgaWYg
KCBzaXplID09IDggKQ0KPj4gKyAgICAgICAgdnBjaV93cml0ZShzYmRmLCByZWcgKyA0LCA0LCBk
YXRhID4+IDMyKTsNCj4gDQo+IEkgdGhpbmsgdGhvc2UgdHdvIGhlbHBlcnMgKGFuZCB2cGNpX21t
aW9fYWNjZXNzX2FsbG93ZWQpIGFyZSB2ZXJ5DQo+IHNpbWlsYXIgdG8gdGhlIGV4aXN0aW5nIHg4
NiBvbmVzIChzZWUgdnBjaV9tbWNmZ197cmVhZCx3cml0ZX0pLCB1cCB0bw0KPiB0aGUgcG9pbnQg
d2hlcmUgSSB3b3VsZCBjb25zaWRlciBtb3ZpbmcgdGhlIHNoYXJlZCBjb2RlIHRvIHZwY2kuYyBh
cw0KPiB2cGNpX2VjYW1fe3JlYWQsd3JpdGV9IGFuZCBjYWxsIHRoZW0gZnJvbSB0aGUgYXJjaCBz
cGVjaWZpYyB0cmFwDQo+IGhhbmRsZXJzLg0KDQpXb3VsZCBpdCBiZSBvayB0byBoYXZlIGVjYW0g
c3BlY2lmaWMgY29kZSBpbiB0aGUgdnBjaSBjb21tb24gY29kZSA/DQoNClRoaXMgaXMgYW4gb3B0
aW1pc2F0aW9uIGFuZCB3ZSBjb3VsZCBkbyB0aGF0IGxhdGVyIG9uIGFzIHRoaXMgaXMgYW4gb3Ro
ZXINCmNoYW5nZSB0byBiZSBkb25lIGFuZCB0ZXN0ZWQgd2hpY2ggd2lsbCBzdGFydCB0byBtYWtl
IHRoaW5ncyB2ZXJ5DQpjaGFsbGVuZ2luZyB3aXRoIHRoZSBmcmlkYXkgZGVhZGxpbmUuDQoNCkNo
ZWVycw0KQmVydHJhbmQNCg0K


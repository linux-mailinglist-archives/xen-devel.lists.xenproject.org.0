Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12026B431D0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 07:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109414.1459001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu2u6-0003oy-4A; Thu, 04 Sep 2025 05:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109414.1459001; Thu, 04 Sep 2025 05:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu2u5-0003mL-Ud; Thu, 04 Sep 2025 05:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1109414;
 Thu, 04 Sep 2025 05:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uu2u4-0003mF-6b
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 05:53:00 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 679f3291-8953-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 07:52:56 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU0PR03MB8265.eurprd03.prod.outlook.com (2603:10a6:10:31e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 4 Sep
 2025 05:52:53 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 05:52:53 +0000
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
X-Inumbo-ID: 679f3291-8953-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHkqujKG+YNIvdqUJX98mMBROvb9Qh2rb4LntMkF9pLNz42shmd71OMbuSyz28fEKJTagzvvWSG8z4Q2b0GRgDQ7F95hG/gBKleS8FobU3YxB3GosX8d+XpwtjSF96NkNivtI8t0elPfwQ1k7e3PaL91fwCgDYi9A8S0ejrLnSZgZtFVbWIHpKFtoXnsXYFKRyDu79Ko+BxWmf394whOBvCAqYn85hAV+OsKVx/G/OsC+JPu1nn4MMwR4WXYA7vwZRStj22q6MnDRJjuVSZ9iAIjF5lqMW0B/gOtfckh7+vbzIg0TZlOv+lIELm0DXwpQVdEPdM2iWfjHIJ3lNsVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJEkX+ZN5YOwXfTmzsec36wkjEKtOCnkm3E0Knpu+NY=;
 b=L7PfTIeEuAkjJcyotAO4J8PZiWCBz7aeQtTH2eE5ZrG7JCvKzGoJtemvFme3+O4DSZ1pjnCRJ7IW/vXJugKZJpDusii0WSOJNxMiGcX4MjD13HD/rjb8vpY1OKt8/dQwlhmh2GyA0s3SYIIw3TYs8HD567HN1FK/z8wE41umfkqUrUaptRrIxLADhXFsvPT2x6NkNEkuIQo7SlXUvwTUKzZltw9IXz/ly4/rNICcjl9vuV7aPgBbi3oXcnFJoc2xAHZlXrB//0BziIRuC/uXCA7+h4+dp7Wp4SzLrLVR1vQfcgaXfYXnRRl04ivDzutZKnoKvsr+IIw3yT7TWMPXTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJEkX+ZN5YOwXfTmzsec36wkjEKtOCnkm3E0Knpu+NY=;
 b=K3n611Ve+mgvngC2d7heZ21lYxjmUtRiddfCBcB2BT5TOQshftzMklQsDoFW15B/aSBeKBhGupntykRzp7iKW1uVJzWnDqjFViOrrJ7qLDgsNePYJRbERK9LiJ6wPAGzvxqW4tD0qDOYi3RJIewV3TYwdNu/FJwGXVCTRIxMYin1i7qxSckYyV55QjhNM9kyXawtc1/drq3BGQR2SolqaSPD17BY0k0ha/B3Bj/ch4gVbrDK6LqpyHtoyTqkYESoDMNhR1NTOLqQyPcp8+A3A0DsCN/ADV7pnrKJ6vs9MqLKNzrYlwb59TxvU53uJKtI7WoMmJTCg55Z4rPCUa0+vQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v6 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v6 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcHN9FrhwGrEUPyUu8gbPtoBO0RbSCFF2AgAByMgA=
Date: Thu, 4 Sep 2025 05:52:52 +0000
Message-ID: <1ec20c31-2ece-4d31-97e2-72995b6aa2b6@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
 <345da260fcb3bb400834f8a59dacfda8b37440a1.1756908472.git.leonid_komarianskyi@epam.com>
 <cb34378c-95c7-4618-8aeb-a7b7c5c97f2d@gmail.com> <87plc7tdxx.fsf@epam.com>
 <13ed364c-bec3-4c3e-a451-7bc312b2db9d@xen.org>
In-Reply-To: <13ed364c-bec3-4c3e-a451-7bc312b2db9d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU0PR03MB8265:EE_
x-ms-office365-filtering-correlation-id: 39715ff7-4c7a-4347-849d-08ddeb7749ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cmhOQm11dWxaUk0yMXZuc0dXMVhLVFQySzc0alo0VWV2a0x6S0xOUzhBdlNm?=
 =?utf-8?B?b3Ircis2S2kwNmdRMWcvck5ZS0VqOUovbDlodm14MEUrT2loSXZsTEorMlR0?=
 =?utf-8?B?eXJNL3NDL20rUmY1SGZnenlnZEVDTTNxL0F4SXp6QldJb3pZRFYyNi9KUS96?=
 =?utf-8?B?cmVFeCtHbFlyV09QYlN5bE5KQ1QvRC9JMWlab1pnaFRodXRacnZuT1NuL1d3?=
 =?utf-8?B?MTJTWXFtM0poVWVwOGs4QzVzK0IyM3VESVF4T3orclRCYllqM0lCc2NKMzAr?=
 =?utf-8?B?eXRsb05kSEcxUDQrZlNQTjlnbTNuWVhCOVhuQWZxVTl1UVQ2RUswSzM0TmdH?=
 =?utf-8?B?VGcrelRoNkZoTXdoSVNldi9lWGJnY09VNFlaVUpkQ2xSN1VKek8rd05sMmRU?=
 =?utf-8?B?RjAreUVtc0RUQ0MweW5qYitJN1AyNzZMVDlobW1QU21SUWQyMEdjblBYYmNq?=
 =?utf-8?B?RE5kTTRRaS9IRHd1amYxY2xYNGFOL29DWHk4MVU0aTZVOEpnNzJUVE5oc0Zy?=
 =?utf-8?B?YTFPWUVCbU9Tb1ErOG15TmVSYkpaYnBVYVJoTTdXcTJIL0pSSnBPbUpOMGp1?=
 =?utf-8?B?QjNSUE1rcjRUVnp3S2lya055dGRnSW5GajRKTUNFVmlRRGpzRUFZendoSko2?=
 =?utf-8?B?bm92cFhqTjVaNWlhSEVZTnRJQitQT0JadzNMMCtxS0didEV3c3RpZE9jZ1Nu?=
 =?utf-8?B?R0J5OFFPKytyNG4wUjZHcHNhWjlaQk9mZjFGUHRvcXMyanNDd01EbWt6ZkFB?=
 =?utf-8?B?MmJIR3Y5eStsSHNJLzJscWtybmhSUEE1dXg3d3lpYis1a2t5Z2pHUy9Mdmsw?=
 =?utf-8?B?b0NMVTlHNlhycjZWWmt2VHFUdytJTjQvZVJJSmtWeTFwZ0dlejRKUHBRc0p5?=
 =?utf-8?B?dWJUazFrdzR3R3haQTBNZFphY2x3a01aWGxLWkpLSTEvc0trNDJaOG16YlFa?=
 =?utf-8?B?ak9oZXNsU0ZxM1hwMUMzMjBKV0xTcWJHUFBiWlJyazVzZkgzSDhQUWxCM3ox?=
 =?utf-8?B?ZE1HdWduQ1h6Z2VqdEwyeThncEhUUHB6QkNRS014REJOT08vMWlWTEV5ZVFD?=
 =?utf-8?B?U1AxbWVZZEhpQVpIS25COU5qS1FtVnhJenlsYVVDeHVCV1ZIemxaMnA0Vkt1?=
 =?utf-8?B?elNoTGtMcVMyUzFKNlRMMGlROEYrM2kzdEdhemd0enRZdk5rdWVhTEt3SGNK?=
 =?utf-8?B?MndRc2pGZDZFTWRsS2pBREVNZmNCbHFJU1BEaGtRbUJvTVJaWVZOUCs2Njlv?=
 =?utf-8?B?RVhYR09DVE9FaWdRa2hwSzZUK3pYQWswZTZsSDl1NnVMcG1OcTY0MWtoMVVj?=
 =?utf-8?B?WXBQL0R0Mi92U0FLeEpXb3laOUkvSGJuR0VpVXVCUlJxUlBCWTBNdkhvQnNU?=
 =?utf-8?B?N0M3dk9aMnFST3hyK3NjaDU2NW9tNHRLbGtPSnBpNzlhdGd4TTNWVlZ5UWYw?=
 =?utf-8?B?cW1YWFpqY2JNRkIvKzhQTGNobWZGTzkxT293aHhEbEZTWXB0bkhHcmpvN0Rx?=
 =?utf-8?B?N2tRcmdueW9zckFrNjB0UyszRkR4OHZsb1ZLRU5wbytnYkl3NVlQNVZMY0U5?=
 =?utf-8?B?UkxpZUFJTk9hS1JJTTNVQ016YzFIOHlGNDBja2xYNFZIT2h5UmRsU0hheHVj?=
 =?utf-8?B?WVZTcUFnUmJ3MnBrSGdDMi8yTURqdjFZQUZsYzd2Z2NTQXlNOWRDQzh5L0Ex?=
 =?utf-8?B?RjRtRDFNUFpRdElhSXJRQkNYTUFVK2FOMkFDTVhoTFU3TVlDa3ZtTGs3L2tG?=
 =?utf-8?B?alBwQTdxajlwTVdycnU3RmwzTllNdG43eXFwUUVyMzZ4M0N6VzgyUlFYbUcw?=
 =?utf-8?B?MDZhTEJmdjRFeW1TVmoxQXQ0aUlWSlZhaEg5ZkwvU2NiN1FDdCtkNTlpT25j?=
 =?utf-8?B?ckVtM294QzRaVXZpVGJRdVNPL0hwdGFEUnhuelZqVm90aTRpM294b1puVWJG?=
 =?utf-8?B?TVlkMTV1dHhEUHNLazdkVGc2dVdKTXVKMjg0YXcxMHR6d3JOTXJYbHFRY09s?=
 =?utf-8?B?ZzNZLzFqbitBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGhINGdxM3NVbDJUMk14WFFFQWthbDlEL2R1dGJ5ZXVmUXBSWVllRndScUps?=
 =?utf-8?B?Z2FKL3BxazJUa3FZU203emIzNjc3ZlFYY3pEcE9IajhOKy9TczhZVmNHdXVE?=
 =?utf-8?B?YXVrdVFmTGQwMk51RVpqRGpoT0JyYkViMkROeWZIUHhIQzdlOXVuQlA3TTRI?=
 =?utf-8?B?ZGVySFVocHJSVDlZWjA4UGxoYUtYcUlBTkUrRS84emVNTkVtcDdwaXFSdXhT?=
 =?utf-8?B?NTZPMG9USnNETWhjNzM0WldHR3RPcEM5RVNhNEZTQUdweGFMSTdWM1hkSG5J?=
 =?utf-8?B?UnNQQ3c1Zzk0c2M0dk5FUXg0VW9LVDhCcm5pa1YydFpWcHFkYWZyZ203dU9N?=
 =?utf-8?B?NFhFaUZxdGQxTU9HN3JqU2hKclRla1IvM3M3aEM0RVFha1U5SEp3dlpCUzAr?=
 =?utf-8?B?SHZ4UjFBeFkvSERCUTYza0M1d3U2MlJ6NjFTZ0tWSjRsN0gwQ0h3a3dzai9W?=
 =?utf-8?B?L05WY1l6dHY2enU3bC84dUk4QzVUYXdIQ2VZY0ExSDU2bCt4dXovbVRPb0lz?=
 =?utf-8?B?VDhXcFpPbXBreXp1c3dxc1JxbTExYVA5TUpTN3hlcUQvVGxKbGFmS0sxRWxw?=
 =?utf-8?B?a1dxeFRVRmErRGJCWU5qR2l0R0l6a0lTVlBncnNTOGJYd3FNZUlJTGRPZGhm?=
 =?utf-8?B?Z05mZGRwSXlxWUQxN0FRTS9zVFdQa0FrcnMvVk0rYi9XM2VYK21rdXlPQ1J2?=
 =?utf-8?B?cDdFcnYxNmJ0ZzN4R20wWldvWlNKN0d4OVFydjlrQ244c2p5RFVkbW5VMUNn?=
 =?utf-8?B?UDU0R2dxUE1IaVl3ZlprRzM1SlhsTm5rSER4c2FGQVdlb2J1azFkZFdueTBn?=
 =?utf-8?B?bEV0bThXSStCMitYSE5FOVd1UUY1RW5JK0xMaFUvMTdmWjE2VFR5bkVRNGZi?=
 =?utf-8?B?Wmp5MWtrYzFYQUNBNTRmNTJOOVRiUmtBSU9pNG81TTRnK25QVjRCaTBkQ2JL?=
 =?utf-8?B?Q3lMaGpqajI0ZG01SlFKblhUZjlFMGQ3UmMwTHN3cm1BOUhRUi9XRzV1emdH?=
 =?utf-8?B?NW1jdE9lMzBNNHpwWTZXVGVGSTlWSG90YWJhTUVNL2NwaGFkM2tKNmZzZHE3?=
 =?utf-8?B?SCt4RnNOTTd6cTd5eG41VTVYLzR1Rmx4MjhFZHpSRUZYMC9IMXpDek1TWlRk?=
 =?utf-8?B?akxGdUlLL25YdVFjUm9Ka3NSaVRVOS9uaVBsbzVkK1kzVjNheGIyNmJyYUFT?=
 =?utf-8?B?UXJFTnFXbmtybzJVRSt5enJLdmhnaGxUcGw1SVFobUtkNmVTbHZUU1hvSG9W?=
 =?utf-8?B?dFZ1YnJWbm5PYmJZUTlzd0pML1N2QlZtOWdELzF3QVNSTGk3Mk44eVVTazhY?=
 =?utf-8?B?alp0M3A0Q1FtYW9rQktzWE9LYU55M3ZTK0tHMHFGR3NhRzNuODZ1MjVmVUtG?=
 =?utf-8?B?b3BOakNjVGVuMUFNM2JpNlRzaHJPcXVsYTVhRXZ3eUpaa05xdnF1NXF3ZjIz?=
 =?utf-8?B?OHd0dWtBTlRhQ3AxSHZzSUorbmtMQm9BeklnQ2pvNEQ1dGJPN2dQMVFCTG83?=
 =?utf-8?B?WmMzSnE0NUk5MTZBTCtGUFNxREZ0S2YvTTJ6OUR0dmVtS1h0ME10TFFlK0hQ?=
 =?utf-8?B?VUpKYTZ3K0EyaWlsL0ZWREhHY1pIOEovQVVNU2FMWm9MQ1dmNm1ZL09SQkg5?=
 =?utf-8?B?QXFDU0FuMXIvdTYxWko2NzhpbStiL2ZONzVGMWt5UjNITzJnR1ErQnFaeTQx?=
 =?utf-8?B?Q3ViK3FnS0NuclJKRU1nN290RDNjSlUrK2t2U0Z1K0IxL3NxV2FVZHhNaitM?=
 =?utf-8?B?dCtJUzRyN3QzZXZ2Y2dnS1NEbnJWcDc4bnZiSG5qZm9YRVpSTFA4cXI4NEIw?=
 =?utf-8?B?MnVFTWgxdm1KNHN1dGMxWWhDM0xWTVBpbS92bnpMcXJjSFUvc0taWHFMK09m?=
 =?utf-8?B?Y2FRSHlQVUVuRW1DZWQ2UUhvNGlZVEJjRWFjRGRidVJtVEc0Tmk3SWMxVGp5?=
 =?utf-8?B?WWFIazVDK1pCb3BNVU1DbmY0eUFwOC9SbUhLL09RSmJ5b1RNcmFoTTZ2MGhL?=
 =?utf-8?B?emRDUFNaQldGZm5aRHJmRGg1MkJWT0ZCMU50SU9nblEwak9oVWlSczVqSzU0?=
 =?utf-8?B?ZGRxZkhIVFpydXpySGluMkVmWUYvYW1Lc0xyZjBFRldwQjdjVnZWaWVWeXJm?=
 =?utf-8?B?WTZJTUJBQXZmQ3QySWNVdURqbURYUjlVVC9VV1N4aWtkdFVHNG1Gd2pOaUMr?=
 =?utf-8?Q?ZPuOPP9UIwCECQDfZ0Zt3cM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <838F5CA8963C364094DD844F04358EE2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39715ff7-4c7a-4347-849d-08ddeb7749ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 05:52:53.0038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+nw1LkNp2JQZB653t8VfNs31CprdKIXqcEubymuUZOvtKk8llRfA32U4MLQHYuwodvPf+5w22PpqYobTjgrFC9m6msfq1m3VE/oU7O8NSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8265

SGkgSnVsaWVuLCBWb2xvZHlteXIgYW5kIE9sZWtzYW5kciwNCg0KVGhhbmsgeW91IGZvciB5b3Vy
IGNvbW1lbnRzLg0KDQpPbiAwNC4wOS4yNSAwMjowNCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBI
aSwNCj4gDQo+IE9uIDAzLzA5LzIwMjUgMjI6MzcsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0K
Pj4gSGkgT2xla3NhbmRyLA0KPj4NCj4+IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc3R5c2hA
Z21haWwuY29tPiB3cml0ZXM6DQo+Pg0KPj4NCj4+IFsuLi5dDQo+Pg0KPj4+PiArc3RhdGljIGlu
bGluZSB1aW50MzJfdCB2Z2ljX2dldF9yZWdfb2Zmc2V0KHVpbnQzMl90IHJlZywgdWludDMyX3Qg
DQo+Pj4+IHNwaV9iYXNlLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQz
Ml90IGVzcGlfYmFzZSkNCj4+Pj4gK3sNCj4+Pj4gK8KgwqDCoCBpZiAoIHJlZyA8IGVzcGlfYmFz
ZSApDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmVnIC0gc3BpX2Jhc2U7DQo+Pj4+ICvC
oMKgwqAgZWxzZQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJlZyAtIGVzcGlfYmFzZTsN
Cj4+Pj4gK30NCj4+Pg0KPj4+IEkgYW0gd29uZGVyaW5nIChJIGRvIG5vdCByZXF1ZXN0IGEgY2hh
bmdlKSB3aGV0aGVyDQo+Pj4gdmdpY19nZXRfcmVnX29mZnNldCgpIGlzIHJlYWxseSBoZWxwZnVs
bCwNCj4+PiBlLmcuIGlzDQo+Pj4gwqAgb2Zmc2V0ID0gdmdpY19nZXRfcmVnX29mZnNldChyZWcs
IEdJQ0RfSVBSSU9SSVRZUiwgR0lDRF9JUFJJT1JJVFlSbkUpOw0KPj4+IG11Y2ggYmV0dGVyIHRo
YW46DQo+Pj4gwqAgb2Zmc2V0ID0gcmVnIDwgR0lDRF9JUFJJT1JJVFlSbkUgPyByZWcgLSBHSUNE
X0lQUklPUklUWVIgOiByZWcgLQ0KPj4+IMKgIEdJQ0RfSVBSSU9SSVRZUm5FOw0KPiAgPj4+DQo+
PiBJTU8sIGl0IGlzIGVhc3kgdG8gbWFrZSBhIG1pc3Rha2UsIGJlY2F1c2UgeW91IG5lZWQgdG8g
d3JpdGUgcmVnaXN0ZXINCj4+IG5hbWUgMyB0aW1lcy4gQ2FuIGNhdXNlIGVycm9ycyBkdXJpbmcg
Y29weS1wYXN0aW5nLg0KPiANCj4gKzEuDQo+IA0KPiAgwqBCdXQgSSBzYXcgY2xldmVyDQo+PiB0
cmljayBieSBNeWtvbGEgS3ZhY2gsIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+Pg0KPj4gI2RlZmlu
ZSB2Z2ljX2dldF9yZWdfb2Zmc2V0KGFkZHIsIHJlZ19uYW1lKSAoIGFkZHIgPCByZWdfbmFtZSMj
bkUgPyBcDQo+PiDCoCBhZGRyIC0gcmVnX25hbWUgOiBhZGRyIC0gcmVnX25hbWUjI25FICkNCj4+
DQo+PiBBbmQgdGhlbiB5b3UgY2FuIGp1c3QgdXNlIHRoaXMgYXMNCj4+DQo+PiBvZmZzZXQgPSB2
Z2ljX2dldF9yZWdfb2Zmc2V0KHJlZywgR0lDRF9JUFJJT1JJVFlSKQ0KPj4NCj4+IEkgZG9uJ3Qg
a25vdyB3aGF0IG1haW50YWluZXJzIHRoaW5rIGFib3V0IHRoaXMgdHlwZSBvZiBwcmVwcm9jZXNz
b3INCj4+IHRyaWNrZXJ5LCBidXQgaW4gbXkgb3BpbmlvbiBpdCBpcyBqdXN0aWZpZWQgaW4gdGhp
cyBjYXNlLCBiZWNhdXNlIGl0DQo+PiBsZWF2ZXMgbGVzcyByb29tIGZvciBhIG1pc3Rha2UuDQo+
IA0KPiBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBiZXR3ZWVuIHRoZSBtYWNybyB2ZXJz
aW9uIG9yIHRoZSBzdGF0aWMgDQo+IGlubGluZSBoZWxwZXIuIEhvd2V2ZXI6DQo+ICDCoCAqIGZv
ciB0aGUgbWFjcm8gdmVyc2lvbiwgeW91IHdhbnQgdG8gc3RvcmUgJ2FkZHInIGluIGEgbG9jYWwg
dmFyaWFibGUgDQo+IHRvIGVuc3VyZSBpdCBpcyBvbmx5IGV2YWx1YXRlZCBvbmNlLg0KPiAgwqAg
KiBmb3IgYm90aCBjYXNlLCBJIHdvdWxkIHByZWZlciBpZiB3ZSBhc3NlcnQgKGZvciB0aGUgc3Rh
dGljIGlubGluZSANCj4gaGVscGVyKSBvciB1c2UgQlVJTERfQlVHX09OKCkgdG8gY29uZmlybSB0
aGF0IHNwaV9iYXNlIDwgZXNwaV9iYXNlDQo+IA0KPiBDaGVlcnMsDQo+IA0KDQpJIHdhcyBjb25z
aWRlcmluZyBpbnRyb2R1Y2luZyB0aGlzIGtpbmQgb2YgbWFjcm8sIGJ1dCBJIHRoaW5rIGl0IG1h
eSANCmxlYWQgdG8gaXNzdWVzIGluIHRoZSBmdXR1cmUgYmVjYXVzZSBpdCByZXF1aXJlcyB1cyB0
byBhbHdheXMgbWFpbnRhaW4gDQp0aGUgcGF0dGVybiByZWdfbmFtZS9yZWdfbmFtZSMjbkUgZm9y
IGFsbCByZWdpc3RlcnMuIEkgdW5kZXJzdGFuZCB0aGF0IA0KdGhlIG5hbWVzIG9mIHRoZSBkZWZp
bmVzIGFyZSB1bmxpa2VseSB0byBjaGFuZ2UsIGJ1dCBJIHdvdWxkIHByZWZlciB0byANCnVzZSBh
biBpbmxpbmUgZnVuY3Rpb24gYWxvbmcgd2l0aCB0aGUgc3VnZ2VzdGVkIEFTU0VSVCgpLCBhcyBp
dCBzZWVtcyANCm1vcmUgdmVyc2F0aWxlIHRvIG1lLg0KDQpCZXN0IHJlZ2FyZHMsDQpMZW9uaWQN
Cg==


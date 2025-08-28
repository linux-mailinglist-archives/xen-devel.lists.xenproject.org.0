Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BB0B397F6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097874.1452044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYju-0003iz-1f; Thu, 28 Aug 2025 09:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097874.1452044; Thu, 28 Aug 2025 09:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYjt-0003hS-VD; Thu, 28 Aug 2025 09:16:13 +0000
Received: by outflank-mailman (input) for mailman id 1097874;
 Thu, 28 Aug 2025 09:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJR=3I=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urYjr-0003fF-TR
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:16:11 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a33ca7e5-83ef-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 11:16:11 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS4PR03MB8153.eurprd03.prod.outlook.com (2603:10a6:20b:4e0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Thu, 28 Aug
 2025 09:16:08 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 09:16:08 +0000
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
X-Inumbo-ID: a33ca7e5-83ef-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcFTR1aEC5TzyH0zoReMFzjka54+gF35r2yC0km6VUW3tKAMQQ26wogQ7bY7MGHJTsK5+YT7EyHlg7lpMGSxk77o8aAVYOxETXPLKr7qo7EIokXT+tu8cqVkoNU6yTcX9t/y3dUgr74tXODP+Cbh2ZnmqvqeU/LGk3KZnkhGd/TaZPbAxkAFKDDm06Je+q42MEEmSSNa+uAzUosVIx4HsEvGxVPDB8w8JkthPzVywdarYL/MfYrx6txndBKBKe3Cgz2BwZxMQESZjzuHBNKdFgCDDb81OubDpG7T2QcWoA2Hx6Ee2NYQI9iMMx7EUwtwywnjn9UbuxTWNRmXAI9jhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNlVm3BEpT3u5zlQF2L1wKKSsJoAkdl16LtfV7J6BIc=;
 b=ZNTRA4DEYGEI1mG8gKTBTDys3GKGgM+F/wfRZ2RUsRcqF9Y+r+WdmGf5RJ5Bwuxk9u6gtJxxxUe1BaS/BaZix0GUTMKN89KJIbpgOAvXWQOaTTBsc4oy5GAiJTdTphiSrE/I96kx3BE4tTTN+N0t0DanmyCEV5mPL2xRgQBRpjpQpz7DLUMnedGACfT0vY+YY+pevcRv0dr3NgLrkn+huORCe61HKwZJfxZHXGEVpIOC5yeZsoWX8xq6slSsjxQPGDpKGsrxZyWpTjYQYdrAsz91t6GtFGAiTm7b263Ulsr0Ey6Q65Xwe/LURoCfeEMTiLjoPkP9gJ6P32Mc/Dwfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNlVm3BEpT3u5zlQF2L1wKKSsJoAkdl16LtfV7J6BIc=;
 b=FsgXd9rHjpjGrHbFHuaV0Nu7aYYiycstS6T7bWXxtwZT+tQtUxSRTkmtSx/lCzqe+MR1apjrxPVD8hJWm8G+myMNUi6yprlidFh74sMUA1E45WYQMOTTH4BqkNHqB/11gXxB8RiecADKxuhMV/W+DV9oecpJ+3jwFe04D1ECbq7JUpndwaTEiBk0/n7ptYIx8Rup7XedvzI7E2ovW4hA/LLc4K/F1w2haCqh+ObIa9MFjF2DeJQuPmauJ1WH2ka/OXtBeY/8E56P/Nno+O6r4NBoogc0rDBv2i9j5M5pROf6udLolEDE6Hd0LHENbNvGDZthjnTJO7LfSj1ZMatNkA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Topic: [PATCH v4 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcF3/NodAFMh424U2CquWmKsv0JLR3ycWA
Date: Thu, 28 Aug 2025 09:16:08 +0000
Message-ID: <1e53adc2-216e-4760-a910-f62a8648911b@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <9e8a11b024833c1b91b8806e7708bf35b04a8f6e.1756317702.git.leonid_komarianskyi@epam.com>
 <87cy8g1i8p.fsf@epam.com>
In-Reply-To: <87cy8g1i8p.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS4PR03MB8153:EE_
x-ms-office365-filtering-correlation-id: 14be27f4-c8ae-4d81-73d2-08dde61385e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SDZrMUpEaFVmdlBXV0hEZW5ZZUtRZkJ0aGg2Q3lvQmxBWjBVYTVPU3BPbDQ2?=
 =?utf-8?B?RnpZNlZtWnR2Q21NNkRFTEdwdFdkLzQrTy9Rb2NCRHEyTm9FVHpWTjEwTTVE?=
 =?utf-8?B?Wmw1dHR5K0ZORVNldFZSc3ZPcGM3UjdJb2ZqNmU0VDY2U3MrbTBnUFRMaW5x?=
 =?utf-8?B?RnRWamZJMXVnclkzQjF6TEJVMEJaaW40M1NkbG9MNEtkTzkvWFA5cVZKRjl1?=
 =?utf-8?B?RjA0OVNkcm15eUtPbWRpVVM3UHBrdTROZHRJS0s2blpSWEVrMDVHbCtqbThZ?=
 =?utf-8?B?SFdCUkVWZ0g4TXVFVDNnUklaMVVycGVRM0YvVDZDV2dKNE00ZDJIbHRNUW5a?=
 =?utf-8?B?RjRBNVlBNnJ6NFRaS1FhbFR4cTk5djE4dWhJWW1RNFNRZEUzNVRVZUxKci9R?=
 =?utf-8?B?cjc5RVFJZ05lNkZPWDBHZGxBMXpVRktoTytGQkhra25XTG5Zbjc3UW5qMDh1?=
 =?utf-8?B?UVlQNFhoalNHK0hVTFZRTWlkQUkyeThTWVFyc3Mxd3pkVzMwSUtrckIrYjI1?=
 =?utf-8?B?SU5IeUYrUGFoa0pKT1RlL3VaK0puQ2MwVEVFaGhkK1VaMjNxb0hwL01WVkQv?=
 =?utf-8?B?ZlFrVGdtblVHdXR6VkVWNWswQXFTM0hjOVJJUGc0ZnUzQjcrQzNwODk4RUZ3?=
 =?utf-8?B?UHZuVW9rdmpjTFZ3YnM2U0RsREEyOWh4bXJKYmYvVnpnc3Z3TGx2cWlVM0Nk?=
 =?utf-8?B?aGZlSDVzMDR2R0s1WVZDanpJWEo5cTNPdzVUc1ByOFJaQzRqU3pRTGVIRjBY?=
 =?utf-8?B?a2JySVRCZVJtZEdRT25RSFJCY3NSUVdNWmExMWJQYWtYL2FSN1JtQ21hVUJC?=
 =?utf-8?B?UHB0VnlzTXlCMmR5by9sUFZuYmROdFQzSlhVNldXUDRZMWg1ZmYzRWxpVW1P?=
 =?utf-8?B?Q2JVbnZQRXVFdkFPOVlUVEhWc1Njd3JGZjVtUFVUOTVXazg1QUNlZG9BWTJL?=
 =?utf-8?B?dERJTFJNNitXRFlkSGhXY2hwUFZXYnlySGhrZnhTSi9XVElkb1lLOHlOUnNo?=
 =?utf-8?B?ZWRTVVBEOHczeVk0VmJJNlgxWUExN0lOSzNybWgzUS9oM1JxSGc5T0xldFdo?=
 =?utf-8?B?eGhIN0FEOG5kMGJ1ZDIyVzIxeFRRb3FWYitlTTR5QU1sajZQanhpRS9oUXNR?=
 =?utf-8?B?TFVmSHBRcWNWbVlkWTVaeExxd0Y1Rlp6V3k5LzN1N2NkMFFLZEJFdVhjVlFJ?=
 =?utf-8?B?bEFUYkdrRGFuR3dtZE1Jck5QaVgvbUFoWGVFaWtEM1NhL3dNb0RHQjNzSmht?=
 =?utf-8?B?SW1lS25kM29zT2VjUG5VVG1nc0dxOUlzaEdrbFJRU1RCaTBZeDRNSmg0b3pZ?=
 =?utf-8?B?QS94N0VJWG5UVUVLWU9CSGJ2V0hiRFZCRGswb3J2MlM5MFp1UVlIVktLNlBQ?=
 =?utf-8?B?SnA5VWlhYXVDQVJVdFVRWWZVcjJRdHVpU3FtMFg4a204UVFyeTJTZUpDZHlQ?=
 =?utf-8?B?aTFhRWp0eWtvK2hqRVphRnRkOGp1Vm9xd3ViUTB4WWhmWDc4cWZDdFhrcDhi?=
 =?utf-8?B?RmYxSUF5REhtVnF0UElKbGJIbWU1SHpLRG0rTTFoUEF6QXZZVnVmRU1xUm9S?=
 =?utf-8?B?RmV2SUNvTlFqNWJMRUNYYjYwWWNoOGQ3NFpHdzRiajlLaENtaVRhdVJURSta?=
 =?utf-8?B?M1p0bytieGhWd3JKdjdZQi9oWitnYXZFeFEwNDd6VmlJNkpIMzBOYnpURGpX?=
 =?utf-8?B?Z282bG1BUE1VM3FvY3pGUy9xUU9ndmwxRDN6UElPNER6d0VoVU9tVnJuYmVD?=
 =?utf-8?B?VUxOV1Q1WjVneG1BS1RuYzhOaEJxRzYzQU81SHV1UzZNMVY0RUw1dUNndGc1?=
 =?utf-8?B?ejBGVW5wMXFUWnppa0tya1A1Y1FBVGM3eWxXemJ5RkJVTFdoanlsbCtFakFK?=
 =?utf-8?B?a2xMTU5uR0RhK0hVaFRKZGVRWG5pVWN3d1BLZ2FzaFNFUHpEbUtFTFNVM3ky?=
 =?utf-8?Q?epteuY8peI0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cnl6cEpPbjBDUnZNeGZHZ1dMeURYRzdlZ3haYmpsNSs3dkVkbDU2UHZpN3V2?=
 =?utf-8?B?T3ZCZVNncUEwYkk1Nnkya0tRTENOQ0ZmbGliN2xHU1o5cXJCOEowbm4wSlVD?=
 =?utf-8?B?SmR4N3V6akZpdFNDSGNWOER3Ny8wakRudkUyNWNRTUtrUEZWalNlbTZIdlZS?=
 =?utf-8?B?QzRRS1RWakhoMml5UUJibzdWUENYNG5mZ3VwT3kyV1JxMXhEK0lxMlM1NjBl?=
 =?utf-8?B?UW5DdHhtUWJ3NTZLOHNFWk43N2hPeS9sbFoyRmtsRnkxeHRrTzhaa3lVWkpR?=
 =?utf-8?B?UHJHMzlpd202bkJ2RlBHWDVMMXAvQlYzbi81elNMYmxWY2M1NHhnTXRoS2NT?=
 =?utf-8?B?dWtZRTdzOWp3UTB6c0poa1FtVVJPL2ZadmlzWmp2YUx2NkRCUk96RVBCdkZ5?=
 =?utf-8?B?NUxKd3lEM1V2bWZUcGxOYlNjOGpSbEVnTElZamxjSDFqL3VjK0ZpSS96bFZ5?=
 =?utf-8?B?NEt0cFZCL3JtbHVEMmIxZlZUQ3dSbVFFdFREYXlCWDlPaVY1c2QxM0JIcklp?=
 =?utf-8?B?cnVrTkVNNmQ5Q2tyT2J3TDNyeDlIYUhTUjRYVW54STNybFg3K0VkRk1YNHlN?=
 =?utf-8?B?REJwdG5QUzB6NVRjYUt6eFN0WEk0Znk0d3FVTGQydXhrdHN4TDdseWd1cVV2?=
 =?utf-8?B?SVhXZXVKT0M2L3MzSHRESjdWeGxQbGloeDI4VGhuSXBtSU9jd1Y0ejFxREVv?=
 =?utf-8?B?ZGNoUVFjMnRBTU1vTU5uVlJUd2pnUEFuMTh0SHZmWXkxL1RqT1lTMzE5cWkx?=
 =?utf-8?B?RjlBT0l4UGdEc0xPekFVV0hGYVdYa1BVU2lnZ1kxQTlnNGhuNEFkRlFLMU5v?=
 =?utf-8?B?NVpDcitkNGV3c2wrRGZRd0hDbFZyUXROeU9ESm4waXpBNVRUbDhCcGt6bE85?=
 =?utf-8?B?Vjd0d0xXRk1qWUNzRDhQc0liT1N3a3BVR1loL3AyZ2hzRmUxaXcvR2tSbnlN?=
 =?utf-8?B?OWJkSllYRUNSekluSndsWW5jcEFWT2hUdFdxOXI0b3JpZ0gySUovd3FLeDJl?=
 =?utf-8?B?a2JHZXV5ZjNIanZ5ZVQzT1RKSWQzb0k5Z25KV3ZKQnlYTDJ4dFIvOGhQUHJv?=
 =?utf-8?B?WUJwVk8rK3kyRDNJVWZVbWZjeW91OUlodDdMblhwd1E4UXR1M0k1QUZaQjZG?=
 =?utf-8?B?Q3V6V0xJU3hXa0NybXJkSlhHZ3I5ZVdWVSt1MEYrcVJuQ0NnazNhL0g3aW96?=
 =?utf-8?B?VFhnRk1uWWJXdzV3QndCVGtDM2dXZlVad05QUlcwTHlNTGY1Sm5ydmwzNnUy?=
 =?utf-8?B?YUFEV1dhc3orYlFZYkFNeXVNUXlyL3VPMlArcUU4MEVmVzNsSmxZd000MTJm?=
 =?utf-8?B?TU5WYm9jdDA5QytyRFVGdENtSTdrOHNWc1czSXJ5UGs2RUFwMXRCSnpVTE5X?=
 =?utf-8?B?V0tWakE2L2M1N3B3UkdST2VJTlRVRU9WWVJ3anUwbW5ieFRxeUc3M2d5V2dP?=
 =?utf-8?B?UExqZVRVQkl1RmxvSVptQnJHOElYdHNiNzNZMWZOQ3ZMVnMvYzNvVU42MytV?=
 =?utf-8?B?OUltOXNRNkhuRDdEdXFJQXBpb2ptV3lpcWMxMWlTTjI1bUpwQ0FpL0dSQjJX?=
 =?utf-8?B?S0E3cm9RbTZEOVVCVWYvZGdUZFlCT0xvbjlNNzhtR0Q0aEowcTNmTVdkUGMw?=
 =?utf-8?B?NjY0d0ZWQkE1ZkFZU2tTNDhtVVpvSXVNK0hLc2lNd3RHK09ETExDT095ZXBn?=
 =?utf-8?B?eGdDbGtWc1pEcFFicGQ5dUNteTQvOU8vcVVJVDJPdWtkM2NEOXF5Sit5YTh1?=
 =?utf-8?B?WlA1SzBLV2tPcWdpVmg5UVJQN2ZrSnpYYlpYVUxBeGZPa3c2NEFodlBId2g1?=
 =?utf-8?B?Vk0yM0x0YUs1SWRCbXlzNHZKTHN3OFp5akp5UFJhZE9qWThCM2FVQmVIdnJy?=
 =?utf-8?B?aldjS3lRTFJoZmpjaHZvc0E5RzF6ano3emFDKytZcnFFeUtLck5FY2dna2F4?=
 =?utf-8?B?VzZqOEVIaXZpaGZZMjduMlVwbmM5aWVoL096RE92dDMzZmZ4akFLR1V4RUxt?=
 =?utf-8?B?dis0SFJmRHhmRVExNzNoZjM3b1loN1MxdWMwSDZ6Q3pNN2JBaHJ4SXhhQ1Rl?=
 =?utf-8?B?NlBEQXhZZFdMYU11bGFIeitsNXYwdGdlTFZZOHBUVWdaM09lZ2dNZVdhV2ZV?=
 =?utf-8?B?RTJxS0dXTFFONm5FVzBKcWdKOVgyMEVhTWtDSnJzZFE2V1RmeEJWQkVTaDNU?=
 =?utf-8?Q?DBBVzwFidPoc3QokZHiGRak=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8106EE024A6F9645BE79671BA671D2EA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14be27f4-c8ae-4d81-73d2-08dde61385e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 09:16:08.0725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iuKRkcAt/jppPzd03QjIOmSCmhvap6LKMm6oh392ju4PmEFxtp+xdJZCv/s4CS6kVZtTdJ+yMnSx79J1xWj1qfCaxA0qcT2B4X/9FpkJn9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8153

SGkgVm9sb2R5bXlyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IGNvbW1lbnQuDQoNCk9u
IDI4LjA4LjI1IDAyOjAxLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4gSGkgTGVvbmlkLA0K
PiANCj4gTGVvbmlkIEtvbWFyaWFuc2t5aTxMZW9uaWRfS29tYXJpYW5za3lpQGVwYW0uY29tPiB3
cml0ZXM6DQo+IA0KPj4gVGhpcyBjaGFuZ2UgaW50cm9kdWNlcyByZXNvdXJjZSBtYW5hZ2VtZW50
IGluIHRoZSBWR0lDIHRvIGhhbmRsZQ0KPj4gZXh0ZW5kZWQgU1BJcyBpbnRyb2R1Y2VkIGluIEdJ
Q3YzLjEuIFRoZSBwZW5kaW5nX2lycXMgYW5kDQo+PiBhbGxvY2F0ZWRfaXJxcyBhcnJheXMgYXJl
IHJlc2l6ZWQgdG8gc3VwcG9ydCB0aGUgcmVxdWlyZWQNCj4+IG51bWJlciBvZiBlU1BJcywgYmFz
ZWQgb24gd2hhdCBpcyBzdXBwb3J0ZWQgYnkgdGhlIGhhcmR3YXJlIGFuZA0KPj4gcmVxdWVzdGVk
IGJ5IHRoZSBndWVzdC4gQSBuZXcgZmllbGQsIGV4dF9zaGFyZWRfaXJxcywgaXMgYWRkZWQNCj4+
IHRvIHRoZSBWR0lDIHN0cnVjdHVyZSB0byBzdG9yZSBpbmZvcm1hdGlvbiBhYm91dCBlU1BJcywg
c2ltaWxhcg0KPj4gdG8gaG93IHNoYXJlZF9pcnFzIGlzIHVzZWQgZm9yIHJlZ3VsYXIgU1BJcy4N
Cj4+DQo+PiBTaW5jZSB0aGUgZVNQSSByYW5nZSBzdGFydHMgYXQgSU5USUQgNDA5NiBhbmQgSU5U
SURzIGJldHdlZW4gMTAyNQ0KPj4gYW5kIDQwOTUgYXJlIHJlc2VydmVkLCBoZWxwZXIgbWFjcm9z
IGFyZSBpbnRyb2R1Y2VkIHRvIHNpbXBsaWZ5IHRoZQ0KPj4gdHJhbnNmb3JtYXRpb24gb2YgaW5k
aWNlcyBhbmQgdG8gZW5hYmxlIGVhc2llciBhY2Nlc3MgdG8gZVNQSS1zcGVjaWZpYw0KPj4gcmVz
b3VyY2VzLiBUaGVzZSBjaGFuZ2VzIHByZXBhcmUgdGhlIFZHSUMgZm9yIHByb2Nlc3NpbmcgZVNQ
SXMgYXMNCj4+IHJlcXVpcmVkIGJ5IGZ1dHVyZSBmdW5jdGlvbmFsaXR5Lg0KPj4NCj4+IFRoZSBp
bml0aWFsaXphdGlvbiBhbmQgZGVpbml0aWFsaXphdGlvbiBwYXRocyBmb3IgdmdpYyBoYXZlIGJl
ZW4gdXBkYXRlZA0KPj4gdG8gYWxsb2NhdGUgYW5kIGZyZWUgdGhlc2UgcmVzb3VyY2VzIGFwcHJv
cHJpYXRlbHkuIEFkZGl0aW9uYWxseSwNCj4+IHVwZGF0ZWQgaGFuZGxpbmcgb2YgSU5USURzIGdy
ZWF0ZXIgdGhhbiAxMDI0LCBwYXNzZWQgZnJvbSB0aGUgdG9vbHN0YWNrDQo+PiBkdXJpbmcgZG9t
YWluIGNyZWF0aW9uLCBhbmQgdmVyaWZpY2F0aW9uIGxvZ2ljIGVuc3VyZXMgb25seSB2YWxpZCBT
UEkgb3INCj4+IGVTUEkgSU5USURzIGFyZSB1c2VkLg0KPj4NCj4+IFRoZSBleGlzdGluZyBTUEkg
YmVoYXZpb3IgcmVtYWlucyB1bmFmZmVjdGVkIHdoZW4gZ3Vlc3RzIGRvIG5vdCByZXF1ZXN0DQo+
PiBlU1BJcywgR0lDIGhhcmR3YXJlIGRvZXMgbm90IHN1cHBvcnQgdGhlbSwgb3IgdGhlIENPTkZJ
R19HSUNWM19FU1BJDQo+PiBvcHRpb24gaXMgZGlzYWJsZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogTGVvbmlkIEtvbWFyaWFuc2t5aTxsZW9uaWRfa29tYXJpYW5za3lpQGVwYW0uY29tPg0KPj4N
Cj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiBWNDoNCj4+IC0gYWRkZWQgaGFzX2VzcGkgZmllbGQgdG8g
c2ltcGxpZnkgZGV0ZXJtaW5pbmcgd2hldGhlciBhIGRvbWFpbiBpcyBhYmxlDQo+PiAgICB0byBv
cGVyYXRlIHdpdGggZVNQSQ0KPiBJIGRvbid0IHRoaW5rIHRoYXQgdGhpcyBpcyBhIGdvb2QgaWRl
YS4gWW91IGFscmVhZHkgaGF2ZSBhbiBpbnZhcmlhbnQgdGhhdA0KPiB0ZWxscyBpZiBkb21haW4g
aGFzIGVTUElzOiBkLT5ucl9lc3BpcyAhPSAwLiBJZiB5b3UgaW50cm9kdWNlIGEgbmV3DQo+IGZp
ZWxkLCB5b3Ugbm93IGhhdmUgdG8ga2VlcCB0aGVzZSB0d28gdmFsdWVzIGNvaGVyZW50IG9yIGRl
YWwgd2l0aCBwb3NzaWJsZSBjYXNlcw0KPiBsaWtlIGQtPm5yX2VzcGlzID09IDAgJiYgZC0+aGFz
X2VzcGkgPT0gdHJ1ZQ0KPiANCj4gQWxzbywgdGhpcyBuZXcgZmllbGQgaXMgbm90IHVzZWQgYW55
d2hlcmUsIHNvIHdoeSBhZGRpbmcgaXQgaW4gdGhlIGZpcnN0DQo+IHBsYWNlPw0KDQpJIGp1c3Qg
d2FudGVkIHRvIHNpbXBsaWZ5IHRoZSBjaGVja3MgaW4gdGhlIG5leHQgcGF0Y2g6DQpodHRwczov
L3BhdGNoZXcub3JnL1hlbi9jb3Zlci4xNzU2MzE3NzAyLmdpdC5sZW9uaWQuXzVGa29tYXJpYW5z
a3lpQGVwYW0uY29tLzZiMzEyZTE5OTdkYTVhYmRmNTkyZjY2ZDE2MDY3ZjQzMzA0MzFkZWQuMTc1
NjMxNzcwMi5naXQubGVvbmlkLl81RmtvbWFyaWFuc2t5aUBlcGFtLmNvbS8NCmUuZy46DQoNCisg
ICAgICAgIGlmICggIXYtPmRvbWFpbi0+YXJjaC52Z2ljLmhhc19lc3BpICkNCisgICAgICAgICAg
ICBnb3RvIHJlYWRfcmVzZXJ2ZWQ7DQoNCkJ1dCB5ZXMsIEkgYWdyZWUgdGhhdCBpdCBsb29rcyBy
ZWR1bmRhbnQuIFdvdWxkIGl0IGJlIG9rYXkgaWYgSSBkcm9wIA0KdGhpcyBjaGFuZ2UgaW4gVjUg
YW5kIG1vZGlmeSB0aGUgY2hlY2tzIGluIHRoZSBuZXh0IHBhdGNoIHRvIHNvbWV0aGluZyANCmxp
a2UgdGhpcz8NCg0KKyAgICAgICAgaWYgKCB2LT5kb21haW4tPmFyY2gudmdpYy5ucl9lc3BpcyA9
PSAwICkNCisgICAgICAgICAgICBnb3RvIHJlYWRfcmVzZXJ2ZWQ7DQoNCkJlc3QgcmVnYXJkcywN
Ckxlb25pZA0K


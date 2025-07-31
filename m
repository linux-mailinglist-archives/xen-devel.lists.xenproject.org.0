Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D35B171E9
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 15:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065629.1430998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhTCk-0007xJ-78; Thu, 31 Jul 2025 13:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065629.1430998; Thu, 31 Jul 2025 13:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhTCk-0007uY-3i; Thu, 31 Jul 2025 13:20:18 +0000
Received: by outflank-mailman (input) for mailman id 1065629;
 Thu, 31 Jul 2025 13:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cZdq=2M=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uhTCj-0006RL-E3
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 13:20:17 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19384815-6e11-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 15:20:16 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by VI2PR03MB10716.eurprd03.prod.outlook.com (2603:10a6:800:27f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 31 Jul
 2025 13:20:13 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 13:20:13 +0000
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
X-Inumbo-ID: 19384815-6e11-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pn2fddDduWexMVPkFsH0KVy2QEGmg2aTpN6qAfT/Z4PedGE+83ccxdzTUFTKYpMzhhXh4gIShnXyT3S/qCgRuKr8IhXLm2CdLB01uQPbV2Q841saaU4FdKjopTiw0qQmrmYLyXIP8d0RKriObqzUjjvGbo1OZuysJqF/25+ZDZbi/+AMzoFCS3C2KZR0Mq+e9Sxhg1HsbIqBiIsFIugHj4sI/cm+hQ+gaBZnTBGXZQQkOv+2V+G0Ea7OE+F6Iwvf9ikiCZEZJSLNrWN8Idb4Ml6ceR1LaTQ3Xkb05W3wE3Xa3IIgcCt77GulLMHU+lxe/njE129EUdeBnjv7V7B2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKbHKERrBKup1qIv92/sRRU77QVlek53UT8pvcFGQ48=;
 b=Af7MNcQTLuFuf5XM0/ySMrDTDBBnpLCwMeT/uiUQIGHUeA92pzexBYPGCZk4HPCLV3IzOCSR9QOM0TPrU8NQaXdIv8rwqIGEK4S//9Qt30kuej4Qmv+5PGfDHKDX6gUJQdc9PdGSyDvDVx11MHsCvyscqbM2rh/xqpVbLSk6uREOK7772QEOS68rudWLOOQVeFlIdFvZA7VVUVJf9gz2Qp+9SRWMayVRkvCeY2dEft/9x3Y49PvzrEl/9dCHaErHGKr5u3qNaG0KG3riMSDakdBA7k39AMNzhX4Ngra28p0K5NQeeaBGSCub5P6DYlLblVIIYdaegldHzs/xNLl+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKbHKERrBKup1qIv92/sRRU77QVlek53UT8pvcFGQ48=;
 b=QOIRnEbcLYU6Oc5KStSPr2Sg1e3A+UpVH6V/akTZCb7gg4nQ4DEwOfQGT3cDUDFqKbYuiFPuvaTKWy4xrLTQbKZkVDUhdDHN4KRkjhIDN732miIGoDhCfxEfYapKXztFohgH0pBMDlaEXf51UTwBMk58cY4fPqE7RLSDcTJsndaGctfdL5pd1vJP2jbICGTmIoRjILfRaQuVUv7P4IQ8rd2N7gQITEhtz2yGicsvX9sR1IvFzjL+4/N/pBw5WQxomTSoEZdugXWQE2aVfLNTc/Eo6lK3joVKIWLWwZ1lyeV+gi4ivpg3fqlcQCcuzwEMJVCX87u6Yam2d0MbAgQHPg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 04/10] xen/arm/irq: allow assignment/releasing of eSPI
 interrupts
Thread-Topic: [PATCH 04/10] xen/arm/irq: allow assignment/releasing of eSPI
 interrupts
Thread-Index: AQHb/KmxyVChbMj/DkOb8Y7w5RraGrRJJ8kAgAMalAA=
Date: Thu, 31 Jul 2025 13:20:13 +0000
Message-ID: <4352114d-41b7-4be8-9328-ece290981362@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
 <126f762aba8b0f6a4eb322c27593f574f877738c.1753367178.git.leonid_komarianskyi@epam.com>
 <052831de-84da-431f-b910-4426ed87fb63@xen.org>
In-Reply-To: <052831de-84da-431f-b910-4426ed87fb63@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|VI2PR03MB10716:EE_
x-ms-office365-filtering-correlation-id: 0f8466d2-b289-4c7b-fd9d-08ddd034fb75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WTVFSHRhNjRva1FzOUpHZVppM0t1c0NISmYrZWcrcWxnZVFwS2J6YVgrUmxp?=
 =?utf-8?B?RU1oRnhsbXlyWmdRTnNRQXdET2NuS0w2L2RDRmRSbWJhZEYyM1BCckZDVFE0?=
 =?utf-8?B?K0VMaXlYS2x3R2g3dXRGUlR5dXNXLzc3bEN3Z0RQMWxmZlhRVUFrQnpUYjAx?=
 =?utf-8?B?b0Qxd01sSU9rMFVtbTl6KzB5cUcrMXJlMk5Nd0ovWWh2T0ZQYlVQbU1FTW4v?=
 =?utf-8?B?bzhFSWFxR1VlOU10WVBtSklBN3NlbytxWGZiZTVENVJqQXZQRkVmaGZoejdm?=
 =?utf-8?B?UXRLVmNodGg3aDlsTnE4STRvTkVZUk1QaFR5OEJxR0tFY1R1emNQUlphQjJM?=
 =?utf-8?B?WERRdDdQVkNHZXlQS2JvdkNhUm9QTm92ZXNRZmo1RFkzZmJDS0NJTm1vVlB5?=
 =?utf-8?B?T05ac1BlZDZYVGtDR002S2N3djMyRDBSV3FMNmozd2NUUEkrcXR4b0p1RE9r?=
 =?utf-8?B?SHFGYjU4ZHJIRWo2TUlMbldQcnhsZFRzQjAzYUQ2b005YVBNSUZraGRYTVk5?=
 =?utf-8?B?S1VQNjZaaTVNUkxFTlBhVEw5SGhET2xhVGZVd1pNR0hCVHNsMmdGdVlXeDMz?=
 =?utf-8?B?SEliSkhjSEVyOStKMVgyZDZObVlpQ0ZhTFptSVlWdWE5MEYxbXdQdUJKZ01p?=
 =?utf-8?B?cWJpVmFqc1JDQzArSWZHMDB5YUxUcERnaXpxTytGV2tNb3lCUkJ0S2JYa2tp?=
 =?utf-8?B?QlBHeEFoRHpITEx1SzZDWFZtTjVuZFZvdGcvU1kwVzVBOXh4NUg1LzJvdDY3?=
 =?utf-8?B?dStvK1NqdDloMmpURUNDVVUvUmExK0dZdzFzMXFaU2s2VlFQSURDU2MzM0Ns?=
 =?utf-8?B?WXh6QVROYVBHdkhZdk0vOVlsSHpGSWpjZFJRbnZNelBxNDJYcldHaTk3UlY4?=
 =?utf-8?B?dzI3R0t2OEpmTmFoY1ZlUGNFcGZyMXd0WndUVlRvbUxaR1k5T3NCTFlqMUIz?=
 =?utf-8?B?NGZFRExOYVl2MUwzdWZIRFBHOWJ3VzRzd0x1c3JOK29CQW9Qc1p3TFp0dHRy?=
 =?utf-8?B?TEgzZ0lheXVlclZhM210d1RRK2NzT2tvbzRhR24rKzJycU52R1NuQlphRFly?=
 =?utf-8?B?VCs3SHJaa2Y3M0hJaGpGSUNaWnJDVkNud1VMUFZpSXc4My9wSVZ1eEN3QW01?=
 =?utf-8?B?YVdrSm5wUVk2V2xCQVhiZURxTU10YjdQUktTNHpqNzJHTWR1TkZkTFBhZnUz?=
 =?utf-8?B?MlBFSERoRXhmTlUrdzdodEZRWG9SajI4Q0kxNjVyNmdteTM4MURrWWVmakZM?=
 =?utf-8?B?TEFIS1ZjclowRzFwUWRDTi91TWs1UW5DaU84bWpwN2FKQ2pRWU8zeUxPd0Vq?=
 =?utf-8?B?d0RHVlZTTVlqMDF2cDAveGppQUFFbHE5bEd6TFNjcnZYUmIzU2c2Z2lLMFFS?=
 =?utf-8?B?N0ZEQzVWV2lTMEYwWlp2cmNKZ1ZIdmQycG90MDRxMzNDd1VXTHJ3UzB3OGM0?=
 =?utf-8?B?akwxdzNTNWszQTZjSVpFeDNOenBnRlQzcTV3eGJoRk9MQ1BTOXd4ZWxudlBN?=
 =?utf-8?B?WE5XSFRYUXlGODU1QU9YT2xYVlgwRkthazJFdzZ2dkZiOGM2cGZSUzdtYk9s?=
 =?utf-8?B?eUEzdHo4MXdEWVY5L2xReDdEaG9sdDNla2RwR3VCTE9QWWQ3bytNbnZNYVNa?=
 =?utf-8?B?bzRWU3Qrdlpyb3RqTzNOTnlLU3ZpYmlqU1dDSjg2c3hyWEgzdnBiTmlIWVcx?=
 =?utf-8?B?ekRUOEdhQ3VSY1RTem9XdHYxRnA1cmdCNG1rNTdsWE1FSkV6MEtFeVp4b1k4?=
 =?utf-8?B?emdFMEFpVGtpNjVHYWJBWi9yemNNcDMrTUlvSE1tUGYwWGRmUVZhbTZnUU9t?=
 =?utf-8?B?Zng3WmNEd2JCb3cySTIwRERmQy9vR1JCVmpTTTg4dnRYQVBVQStzZmQ5Nzln?=
 =?utf-8?B?ektHN3V0cThjVlFCRE11VmRuWml1Q0VTd1VHSnVHSFJyTXZuNEFQVE1wRVl0?=
 =?utf-8?B?SHkzUi9ia2JNTmJKOWVvYXhTT3hEVks0MlJ5cm0ybVRPYWZ3MVViK3hqaXhM?=
 =?utf-8?B?bWhGcUE5R0J3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXlRd1NOeEZlODM5ODVBZEhTcWxSSFZvUm5zanF6V2JlcWdDcktyVGYzVXBK?=
 =?utf-8?B?M1VkUzlqb3U2cEtHaWNwTHUwK2F4V0w3TVZSc3pYbEkvcEsyNE9EVnd2Sk1Y?=
 =?utf-8?B?ck9IVzdiQXYzSVg4ZjNRbjBmM2lvT21aUnRNbm9VNm94djdCbnB5WDVIbkNN?=
 =?utf-8?B?aWNoRlhrUlBXeEthUXZxcDNjSXZhM010NmxjRFlTU2I2OEJ6UTVpcTFzY0h3?=
 =?utf-8?B?Ukh2R20vdzlreCs5ZUMyVGxJRVh1bFFoVGpKejhxZ2JLRVlnRVBiVVp6WWQv?=
 =?utf-8?B?UUZzRHZZNUtwNVNBaFNrZlQrNEVRUi9aakI3TytST1JuY3V1cTRWbkczaDgy?=
 =?utf-8?B?aUM3OHJYYVNzTVc5N2JmeXBPWjNJYlFlYkgxUVpzSnZVeXRnMUVhaTBTbzUx?=
 =?utf-8?B?WHRRQUt6V0pXUFBueDBuQXFoVHNRL3UyZ0VEUUJUTTBxRVR3RzNESVR5bmk1?=
 =?utf-8?B?V3QwNUdzRlRCVWpJOTlJdUdjVXE5V1hVaGhFMTcvMkFGclN2WGVsVVBJR0x6?=
 =?utf-8?B?YklUZ25BTi82V2xhUkdkb3ZQbExCVGFFUHZIVkZ5UnZacWZZUWZKZFV6bjVs?=
 =?utf-8?B?V1htRTNYb2lEL3J2ZUw4emZWODNVam1pV0dnMTY1QWRpZWl5ci9CVHZtUTNC?=
 =?utf-8?B?dzNlWW43K0xwcWtnUlNaQVArLythQVZab1hRK2szTGg0eTlmc09RY2xPYlY0?=
 =?utf-8?B?TjIxUjIyVmV0dDJiRjk1WDZlSmZ5TCttRkxaMU1COVN0YnpCMFNFTUhyVTIw?=
 =?utf-8?B?R2tuTEFPeGxibVJRMjFqeFp6M1czT2pxMFB6Zis0WFpRZHFZM0tDZFJJVTZs?=
 =?utf-8?B?bFVld1k5WjRLWkVpVDJrUUwwbko3ZDhmVDhvL1c2OXJyL280S0RwenBQakNj?=
 =?utf-8?B?N2hpWXduNjNHeFZzUDB3MzJrbFFnSGZwb0ZVZEpQM1RxVUhucndJU3ZaejlZ?=
 =?utf-8?B?VnNpQnBjbE04UzlSbDdDc2x4amlyRTlnczYzSktmMGJ5cjJTUVRhU21WY0Yw?=
 =?utf-8?B?K1lndyswc2hqOGdOZmkrSytUMktMUzgrYlRmbVRLVXBmaWR0ZVl5aXBlNEVj?=
 =?utf-8?B?Z1JMbzlPTXZaWFF5S255VUIrL2UrUEdJdHkwNndDNVloOGRrRGI3OVgrSklX?=
 =?utf-8?B?cGpnU0UxUHR2REZpYlhIdkQ1WmtYUEd3bHF2TFJ3czJ6ZTlNL0dZSEtDU0lI?=
 =?utf-8?B?Y2ltMFR0d1o0c2ErSy9LTW5wUllYRkRxNTVSYkgxVk5zT1duL1ZHVndMYTBs?=
 =?utf-8?B?Q2hLZjlsaW51YXVpbDBjTFJta2pyZW5IZ3ZUbDF1M0hMY1BxRzRXZTk5aDNl?=
 =?utf-8?B?NVltbFFFYWFlemdDNHNocEdqNXJ5bDZwcmhaMGd1TWtZeXArT09DT1FYZ29I?=
 =?utf-8?B?b0ZjeGNwZGsrTzUzTkk5M3ZIZy9MQ1ZRNXB1TTlsQ0hsdjRYR3ovTk9SNEZG?=
 =?utf-8?B?VE44OGtlWUc3Zm1Jd3FPaWd2SzkrUjhscEhLb21kcVpZVjhlVVN6dVdUWUtq?=
 =?utf-8?B?Nk5IbUszMVhaTXZKQVNhMGU5RVlhMnRDVVpXWnM1M2V3d1lobzB5cjk4cTFZ?=
 =?utf-8?B?NXQ1bGRBbzlNQTgycUJTWFc4b0w0M3ZiZFU4TTJFbTU5OGh5V1VMSUt4bk1l?=
 =?utf-8?B?bUxpLytYTE9BRjZBUEtHNWg2ZTZScFByemxJNUI3Y1lpYWJEMUhKS2JaVWRP?=
 =?utf-8?B?dmJ4a3FTcTZGa2dDT25HWnNCbXlDSnRybTZIREJKbE9wYVp6d2Y4K0JFSGx6?=
 =?utf-8?B?T3J6bjhJZGMrTktFa3AxRkxwZTVRSDBmTk1lekxYS25hWGhHaE9zVDVjT3Vo?=
 =?utf-8?B?eDFiMkdPcTNySjRzbk9NNTJ1bmNwUzV1RVBOMllNWm55ZWhrL3ZtbkdaTUpa?=
 =?utf-8?B?bFIyNW1nbFVQOStwMzkrRVJ4OHhLQ3VwOWJEMURkWnNkS0lPV2xxUC9PdHVl?=
 =?utf-8?B?RWxFMlhpOU12Q1JLMkVEY000TmJWWFNsbW1CdHBiUWxKVWVWaXR1bjkyc3pY?=
 =?utf-8?B?NXVxaE94YkxTeUFzb29sZEZDak9mUVMvb2IvM0NobHR3VExhTnFvTUl3SzlW?=
 =?utf-8?B?bW81TW0xd2hsb0FEVzY5KzJjMWJ6RTZteC91NDdSRlFyNFJ1MnBzUzAxZ2t5?=
 =?utf-8?B?RDVsa0VCSDdZa1FpN2JzWHprS0szVk9ka2JOOFE4RkZsSFlBWXRQN0t2bGlB?=
 =?utf-8?Q?AekmTgthVOa5Ug/iaVi/7EI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <267B4829B327E4448D75EF7508E3422A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8466d2-b289-4c7b-fd9d-08ddd034fb75
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 13:20:13.1632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J1OqU10Fw+ZU2C/haeXUjBlB7zO8Puk4amAj8Y7ISj8ny51+ygv8DlSepMrKAx2NwJwqLOPiKAA3lA7hqvI7TX4ke9qzI8OH+80b7vNs674=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10716

SGkgSnVsaWVuLA0KDQpPbiAyOS4wNy4yNSAxNjo1NiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBI
aSwNCj4gDQo+IE9uIDI0LzA3LzIwMjUgMTU6NTcsIExlb25pZCBLb21hcmlhbnNreWkgd3JvdGU6
DQo+PiBUaGUgY3VycmVudCBjaGVja3MgZG9uJ3QgYWxsb3cgdXMgdG8gYXNzaWduIG9yIHJlbGVh
c2UgaW50ZXJydXB0cw0KPj4gd2l0aCBJTlRJRCBncmVhdGVyIHRoYW4gMTAyNC4gVGhpcyBwYXRj
aCBhZGRzIGFuIGFkZGl0aW9uYWwgY29uZGl0aW9uDQo+PiB0byBjaGVjayB3aGV0aGVyIHRoZSBJ
UlEgbnVtYmVyIGlzIGluIHRoZSBlU1BJIHJhbmdlIGFuZCBhbGxvd3MgaXQgdG8NCj4+IGJlIGFz
c2lnbmVkIHRvIFhlbiBhbmQgZG9tYWlucyBpZiBpdCBpcy4NCj4gID4gPiBTaWduZWQtb2ZmLWJ5
OiBMZW9uaWQgS29tYXJpYW5za3lpIDxsZW9uaWRfa29tYXJpYW5za3lpQGVwYW0uY29tPg0KPj4g
LS0tDQo+PiDCoCB4ZW4vYXJjaC9hcm0vaXJxLmMgfCA4ICsrKystLS0tDQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMNCj4+IGluZGV4IDNm
NjgyNTdmZGUuLjhjNDdlZWI3YzMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaXJxLmMN
Cj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pcnEuYw0KPj4gQEAgLTQ0NCw4ICs0NDQsOCBAQCBlcnI6
DQo+PiDCoCBib29sIGlzX2Fzc2lnbmFibGVfaXJxKHVuc2lnbmVkIGludCBpcnEpDQo+PiDCoCB7
DQo+PiAtwqDCoMKgIC8qIEZvciBub3csIHdlIGNhbiBvbmx5IHJvdXRlIFNQSXMgdG8gdGhlIGd1
ZXN0ICovDQo+PiAtwqDCoMKgIHJldHVybiAoaXJxID49IE5SX0xPQ0FMX0lSUVMpICYmIChpcnEg
PCBnaWNfbnVtYmVyX2xpbmVzKCkpOw0KPj4gK8KgwqDCoCAvKiBGb3Igbm93LCB3ZSBjYW4gb25s
eSByb3V0ZSBTUElzIGFuZCBlU1BJcyB0byB0aGUgZ3Vlc3QgKi8NCj4+ICvCoMKgwqAgcmV0dXJu
ICgoKGlycSA+PSBOUl9MT0NBTF9JUlFTKSAmJiAoaXJxIDwgZ2ljX251bWJlcl9saW5lcygpKSkg
fHwgDQo+PiBpc19lc3BpKGlycSkpOw0KPj4gwqAgfQ0KPiANCj4gaXNfYXNzaWduYWJsZV9pcnEo
KSBpcyBjYWxsZWQgYnkgcm91dGVfaXJxX3RvX2d1ZXN0KCkgd2hpY2ggZmlyc3QgY2hlY2sgDQo+
ICd2aXJxID49IHZnaWNfbnVtX2lycXMoKScuIEFGQUlDVCwgaWYgd2UgYXBwbHkgb25seSB1cCB0
byB0aGlzIHBhdGNoLCANCj4gJ3ZpcnEnIHdvdWxkIHN0aWxsIHJlcXVpcmUgdG8gPCAxMDI0LiBT
byAuLi4NCg0KVGhhdCBpcyBteSBtaXN0YWtlIHdoZW4gc3BsaXR0aW5nIHRoZSBjaGFuZ2VzIGlu
dG8gc2VwYXJhdGUgcGF0Y2hlcy4gSSANCndpbGwgYXQgbGVhc3QgcmVvcmRlciB0aGUgcGF0Y2hl
cyB0byBtYWtlIHRoZSBjaGFuZ2VzIG1vcmUgbG9naWNhbCwgb3IsIA0KYmFzZWQgb24geW91ciBj
b21tZW50cyBmb3IgdGhlIDZ0aCBwYXRjaCBpbiB0aGUgc2VyaWVzLCBJIHdpbGwgdHJ5IHRvIA0K
cmVmYWN0b3IgaXQgd2l0aCBhIGhlbHBlciBmdW5jdGlvbiBpbnN0ZWFkLg0KDQo+PiDCoCBiZQ0K
Pj4gwqAgLyoNCj4+IEBAIC01ODksOCArNTg5LDggQEAgaW50IHJlbGVhc2VfZ3Vlc3RfaXJxKHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIA0KPj4gaW50IHZpcnEpDQo+PiDCoMKgwqDCoMKgIHVu
c2lnbmVkIGxvbmcgZmxhZ3M7DQo+PiDCoMKgwqDCoMKgIGludCByZXQ7DQo+PiAtwqDCoMKgIC8q
IE9ubHkgU1BJcyBhcmUgc3VwcG9ydGVkICovDQo+PiAtwqDCoMKgIGlmICggdmlycSA8IE5SX0xP
Q0FMX0lSUVMgfHwgdmlycSA+PSB2Z2ljX251bV9pcnFzKGQpICkNCj4+ICvCoMKgwqAgLyogT25s
eSBTUElzIGFuZCBlU1BJcyBhcmUgc3VwcG9ydGVkICovDQo+PiArwqDCoMKgIGlmICggKHZpcnEg
PCBOUl9MT0NBTF9JUlFTIHx8IHZpcnEgPj0gdmdpY19udW1faXJxcyhkKSkgJiYgISANCj4+IGlz
X2VzcGkodmlycSkgKQ0KPiANCj4gLi4uIEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB3aHkgdGhp
cyAoeWV0PykgbmVlZCBhIGNoYW5nZS4gQ2FuIHlvdSANCj4gY2xhcmlmeT8gLi4uDQoNClRoaXMg
aXMgbmVjZXNzYXJ5IHRvIGFsbG93IHJlbGVhc2luZyBlU1BJIElSUXMgd2hlbiBkZXN0cm95aW5n
IHRoZSANCmRvbWFpbi4gQW5kIHllcywgdGhpcyBpcyB0aGUgc2FtZSBtaXN0YWtlIG9uIG15IHBh
cnQgLSB0aGUgcGF0Y2hlcyBhcmUgDQppbiB0aGUgd3Jvbmcgb3JkZXIsIGFuZCBJIHdpbGwgcmVm
YWN0b3IgdGhlbSB0byBmaXggdGhhdCBhbmQgbWFrZSANCmNoYW5nZXMgbW9yZSBsb2dpY2FsIGFu
ZCBzdHJhaWdodGZvcndhcmQuDQoNClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50cy4NCg0KQ2hl
ZXJzLA0KTGVvbmlkDQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F60CD1CCB7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 08:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202506.1518040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfvA9-0002wr-Ag; Wed, 14 Jan 2026 07:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202506.1518040; Wed, 14 Jan 2026 07:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfvA9-0002vK-7N; Wed, 14 Jan 2026 07:19:29 +0000
Received: by outflank-mailman (input) for mailman id 1202506;
 Wed, 14 Jan 2026 07:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skiL=7T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vfvA6-0002vE-OJ
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 07:19:27 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5661d759-f119-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 08:19:17 +0100 (CET)
Received: from AS9PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:20b:46a::28)
 by MRWPR08MB11808.eurprd08.prod.outlook.com (2603:10a6:501:9a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 07:19:13 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a:cafe::e7) by AS9PR04CA0037.outlook.office365.com
 (2603:10a6:20b:46a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 07:18:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Wed, 14 Jan 2026 07:19:13 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AM7PR08MB5301.eurprd08.prod.outlook.com (2603:10a6:20b:dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 07:18:08 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 07:18:08 +0000
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
X-Inumbo-ID: 5661d759-f119-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ct3dXnM4L90laIjQrP6wQ2mmOtS5T6Kiokdu8dMHBhIP9qodiGXpKJd9k8nBTBZTzJrK9Q4dCTUezZURqKBHoz40JfUW47ggwZkufW13Ksv68cTXojg9EOr9T2XdgnD5C7fcgdzioS2oZ+bBZtOHumOmgl5ebL1scF8Hq6399o8NCyljiZ2f22QWmugDWfxGQDwP8EAs3oJ9zBUnsBGaRHciJxA9xLI5eKCgLgsXesm4qwGHkLWrj9+IA57GzPz4p+Y5L0KEZMkt/lTpwe3G906fY9pG5/M0mpInH1tINIr6Z2Tij/IVC3fEBf/KrMhKOwCzlW+8uaor+nUZNC0Tmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOlTYnTSnWsZXgfHDSS1qm5mjToMpwCQTjJRsK5HXwY=;
 b=uz+YQX7CtFK0fOG3PwFDznXAcmIHf5izagkUXp+r3kl23/K12yp5iBe8dcymUtzln/+lQi8ZUCSWKKPuQdA6OyPJ265QDLFvYakiUh8Yk5ogYHXmhEQZN9iCv9Wuo0MyS+rk2idPMxltJxRPUxku/QvGlc8udBCkTmFglPOCc/ubAbwFYt0tjCWh8MEeNFwiVsDV5xgrfeCk4JNJBgcLO5aRwQVIPAe/92UC5LNUS880QTeFMmVy5y6Wo1KENIntnJE0yxQVcci9IYceyk8VLH9eg4zdsZdLpFjZpye2krjgU7PQ7b+tr/wr7/pO9b4PtVXh3TSqWNlp/WjKMgMi3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOlTYnTSnWsZXgfHDSS1qm5mjToMpwCQTjJRsK5HXwY=;
 b=ifXoWA5R5OuQYo3TM8ir4JfH8CQ7hRb+bf7PKNDQnrl1Lz3ff6ornApLqB5aA06t9W1Fp072y58gCTbPxCGlMHkFNdKYS/fxXkjvgn+fxN1Iw4xQFEZyTd9/yEXv2epY8nQqTyQsaSLlBYnYPRUhXRHK7aAyLdDbguL53Ymp6MA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiaXin1SAy+hIdEehbuUTnRSDp6KV+rieP6tatKIayRQ4jWXy+ZlvVkYxgvgkXMTPTMYoAiZ7bJPaaHFOEokqDsv5xWhU8S7a73mbSLuPh+7o7XIb86KbHxp8ycG2pKBvkJIS4FtwAAh763n/pOY/e24gGZsTAQnyCp6ngow/NyxtpvnWuIk59sEYV247RVM0+x2zPfGISK7nrS/y2lKSiQCyiP2TVvt8a3FT0OXYJ1NaXIeltznTQWrnOrzAe9fdyaWLjlBB94iUuyou+1sgQeXHKj2r/bcUfvDUMRkUqfNFNAgMKBkxu+i6ITUfQWZXVrjsBkcGIokgeTnSHR3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOlTYnTSnWsZXgfHDSS1qm5mjToMpwCQTjJRsK5HXwY=;
 b=XUWV5es3n4t2IPRwKXROnaf3NxXzITZgsmsj41Y4R7x1n4qC149RZfIr+ZbJntLC1wmIUjQYB7luPYyeJXKm0EiE6z1WuoEy5WIaR41wwBh+YLnBh2HpUvaendS9UO0pRo7i5tC+pqfafbwas07IHp7iigr4hsS4Kj8uDjzG0pnXOTSU5FC9d8bhQZidtSnl8Di6IzX+ENTsMwei9jtSBIuwfxCiuhlWsasrG96uVB6f7Pw3utyB5HFu1QVtpVmVoR4/MukKrD8wKmZ6FVhGsCxe6Pr6lgAucAuXOA6v36t6N7u12gplpvPu1u2mWvckIIO7Ygbq+lW3qxcJjXF6CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOlTYnTSnWsZXgfHDSS1qm5mjToMpwCQTjJRsK5HXwY=;
 b=ifXoWA5R5OuQYo3TM8ir4JfH8CQ7hRb+bf7PKNDQnrl1Lz3ff6ornApLqB5aA06t9W1Fp072y58gCTbPxCGlMHkFNdKYS/fxXkjvgn+fxN1Iw4xQFEZyTd9/yEXv2epY8nQqTyQsaSLlBYnYPRUhXRHK7aAyLdDbguL53Ymp6MA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in
 setup_irq()
Thread-Topic: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in
 setup_irq()
Thread-Index:
 AQHcHH4xsTo+MqBrSUGlzawFWy7VyrSQKKUAgAWFLACAeYuAgIAA5fEAgEHdygCAABXJAA==
Date: Wed, 14 Jan 2026 07:18:08 +0000
Message-ID: <838CA022-64B3-4E4A-9995-E51A620A643A@arm.com>
References:
 <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
 <0d0f4689-97e2-408f-91e4-dd59f47bdb95@xen.org>
 <CAGeoDV9zgfyHaHb5W6+T4F9Hjxv_R5wnGkcbwcN2xgRUhY+v2w@mail.gmail.com>
 <b3e97c6a-b93b-424f-a10e-1d3c93afbe35@xen.org>
 <8133A491-4245-4376-A00C-D6D98C10A2AC@arm.com>
 <CAGeoDV_z5SUcM1jMJmHb_J6kKrsJS_njqOcpT0A45xGAwj69nQ@mail.gmail.com>
In-Reply-To:
 <CAGeoDV_z5SUcM1jMJmHb_J6kKrsJS_njqOcpT0A45xGAwj69nQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AM7PR08MB5301:EE_|AMS1EPF00000048:EE_|MRWPR08MB11808:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c01a99-3de3-46c5-2215-08de533d3837
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dUtTZXdkRWZyYVhIM1B0LzJuMTNmdk1acFRYdURLY1daOS9DREZkS1ZGelJh?=
 =?utf-8?B?SFZNSmxMWis0RWZJTG03U1dEa0lLZENqK3BVSFdJck1MRklya2NLd2ZqTXdH?=
 =?utf-8?B?dGpSVjhpSWNNNnRHRTg1d0NROUg4bEU0ZndmWEdzMUNCVHV0UGE3ZWxMYTVB?=
 =?utf-8?B?dFgyZjRtRFdFc0RvVHd5WEx4Z1RxRTdxc3BXVzd2OUNMZUdDTExRcUdvVmsx?=
 =?utf-8?B?MER3d2JXWmUzN2NTQjVTamxhQXdXOGtETUZIU3FQVnJPRi9CZEpmNGpWazZB?=
 =?utf-8?B?aGRQRG9jM1EvNU9URkhFWWtFMWNBSHllZ1kxZkdQT05tMWpKRHRiVkJVV1Iv?=
 =?utf-8?B?UkROaGhPVEwzaVQ2aEQwa2RnQkk0aFJBYkJEVmlJQXphM21TeVd0cmNDRjN2?=
 =?utf-8?B?SVZiMnNHeXl4eVlkSVY5Yk00ckFuMk1JOGpRUi95MVk3aWhkeGtEQnVibVBl?=
 =?utf-8?B?M3QzTFhhOGpPcDAzZ3VPVWRuT2VaTktXWUkwYXVCdUtLU2RkTzZEVlRuTFpB?=
 =?utf-8?B?NDZORHl2ckNpRDJlTkUvT1RmMTcwQjIvYUk1OVQwOVRDMCtGQlpFenp5ZVlm?=
 =?utf-8?B?MUd6ZVd0TnMzNWpKMTVOVHdJWVVnQzE5Y0xQRGl1NkZpRCs3RWxPTFN6eVRY?=
 =?utf-8?B?amVOSjZyUmhZSGVjQ1J5Q3VtckJ6bFZiZ3p3SHBBcHUvSEhadTFRaUQrYjQ1?=
 =?utf-8?B?SCtWNmlNUkFwdXZUMGR2Q0VvbEUwOStiaXpqck1MQXdqN2tJTkVLOTFmZDlZ?=
 =?utf-8?B?dFlyc09tcytkL2lEd09vb2s0MVB4LzR4cU5aUzM1eElrMjdMd0FYb29NT1JE?=
 =?utf-8?B?b3BoYjZ0WlQ2a1MwVFlseVhMSG9LeXFOdGVTT1YxWUUzaE1FcDNYTVQ0Ujl4?=
 =?utf-8?B?enY0bC9ucXdNbWcyMzlEcUlHL0JEVGNYREVham11bTJlaEZCWFU0MmQ5aWR1?=
 =?utf-8?B?ZGRTalNlSVlmUzlVc3Y2UzJlaGxnLzI3b3RTVHJOWkdYQWo0eURoODl0NXVI?=
 =?utf-8?B?cWNGWVRNTlovaWQ0ZHhKT250dHI0Y2tlVU1OWlI4VUdvREhFUWtEUTFCbFFk?=
 =?utf-8?B?WU16QnpRaExqM3FTSHF2L0s3bWJDMTc0bExnR2YwNzJSZytsb2Z5M3VTSVVB?=
 =?utf-8?B?Vkl0VWdZRjJSQ0pYZEJXQmhFMTYzci9wSXg3N01yRXdMVFcyZ2pPaXloQXNa?=
 =?utf-8?B?TVArbjdCWCtWM080NlU2bjdSYi9rNk9EYVc3bjhUcDVCbm8vOWFoSy9VSGRn?=
 =?utf-8?B?aUdwQ2RubFFuVzY5NDdlMjJCYm93NkxNakg1bmNLait2VnRFWHZRTDRaVGJX?=
 =?utf-8?B?cTEvZ1oxRmFyWnVNb0NjbUEzaE81b3VEcnBFbGRpU2pGL3VDbHh6R3JpZUdi?=
 =?utf-8?B?cXloUWtFRVdaZ3V6dkJEYjZrMFlremQwTjVNQlk2YnFsbUZzQUZlcDFtTC9l?=
 =?utf-8?B?cVFjcGVJRVdsc1VZNk41UTg5SzA5bjdVU3ZrODRUTzdFWlYxZHEvcWZReWJ6?=
 =?utf-8?B?QXJidUNzV096SkdVeHJPLzFRSWdWMWVxdENWaEpiMmgxMWtWcWp1djFtVHAy?=
 =?utf-8?B?elE5Q2QxYnBQNUtpMEVLeVZ0RW0rUThYdnIvaHFUUEQ4Vjd3c24zeXJkN3E2?=
 =?utf-8?B?N2EyRDM1Sk5HVWJwcFlRaUpSanNCdVZlUEt2YnN0clVDMGJTczZEWmtWSXVr?=
 =?utf-8?B?M2J2a0dwTnBWVEM3T1pFZUZOeDd0NUs4WmJyVDUwMzRPN1Q5WUdsc3NqdFkv?=
 =?utf-8?B?Yk1vdk1FQlArSkh2VXRGODUxR2VHUWlhcUpnRDFiR3pyRC8vSnFWWUl0Qmhv?=
 =?utf-8?B?czRKczAwazFTL0NvTFJBd1kwVWZUNnJHQVRYcTdwOXFUeWpBd1hlbCtLMWx5?=
 =?utf-8?B?MndDWkIzY2ZwMjNURU9yT0VacDBBUnBUVHpFbXBXWnJUNHk0ZzNMOS85bGJY?=
 =?utf-8?B?cG5jaWt6cTJtaW5pSUdxZ3ZYRmV5RHhaK09IUXpCS0F3MHRIdVhpVUZTSVUw?=
 =?utf-8?B?ZW0yaFpvdTgvT016aHZHVEtjTzRldEhYSnJlcVNDWUZPUDJxM0ZURXl1b3hz?=
 =?utf-8?Q?uN9Hsl?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FBC35ECE1A96342BF527BB262B1F11B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5301
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91a7e3a5-2036-4f2f-56af-08de533d1194
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aU5nNmtEZE5FN01PbEI5VVBHaG5ENjN3dWVxTUREcGQwVDlkWDlSc3plclVJ?=
 =?utf-8?B?N2RCejN0M2Z0KzErcXFMdEtnOWRLMkZINzdCZ2RPTjFFOGZpM25ZQWVNcWJL?=
 =?utf-8?B?SXFkK1cyRVl1d0x6TEF6ZVhzanlhdmlGRllFRk1DVTR2d2xhWGY0N09OVmRp?=
 =?utf-8?B?TWFQZWtqQzlUODJLZUdXNTZBMjlzS3BmSUtYWENZWHJuc2V3ZWZKWnQzY29o?=
 =?utf-8?B?VVkrdlRVTGo3Z0NoOGpsUUp5RmlQbEJDQURlRUFNSFZDSzhQbzF0VWVzNVdy?=
 =?utf-8?B?b1RSUFRSdS83YXAydXpCSStsQ3VtakQrUHlLU1pSc1dvcXFjSm1LSmRDdjcr?=
 =?utf-8?B?RC9ZSlQxNTZSMXNEUFNnU1pRRXNOSjhWTTFXaysreTN4UWNYWHpVY0tWc3JC?=
 =?utf-8?B?RTJyTHdXSmN3QVZJRDdSRkdaZGFMZ3h6NDFERS9zTFpEQ1g0R3pOWWJ0T1pW?=
 =?utf-8?B?R0pNc0tmNzlBQ0JjZlo4MU1pU3V2V1FIT0NaRDhwT3EzMEVrMTZLd0NSNlhH?=
 =?utf-8?B?YWVqU3Q4YjJaemFOT1R0eURiYlRITStsS09DeWRLTzlsTlBLZHU0RU9NMzVV?=
 =?utf-8?B?VVU1YVMwZHNsb2tBRTdscm1EdFF2bEJMR2UvT1B4VEk2cVlQTFpOQk5hZkl1?=
 =?utf-8?B?WkMwRlBybk1RVE04TzQrYlVmcXRvak9sOWRaSmZqYjVjWi8zOVV2NnQrbU5E?=
 =?utf-8?B?bUZwTTZxbGM4ell1emFkcGNrenNWRjI4Yk8yT2tlQzYzYUdmOEJQendzeDIw?=
 =?utf-8?B?MXV3WE9aYmhGWWxlN3JpYXJyTmtkS2p3K3VFY3VsR0FrS0Y1YjBhNzhrbUx6?=
 =?utf-8?B?YXpoSlVFQjZMQi9mdXpSVFZFTVRHaUR2a0JWZUtObGhLazlCaFlXMlB4UTBr?=
 =?utf-8?B?TFliUFZuT2lvOTl6Nko2blQ1ZktuVlROdG9IM24zTHIzSzhycnM1c0dBaE1q?=
 =?utf-8?B?eVRKS0JHVXd4cDlGdi9ybHlDVkJXc3BMNUc0SFVnaWg5ZXJ2WkxVUTk4ZjNy?=
 =?utf-8?B?N1dyVGE5RTNEcU9NSDBHSHBRWmlGRk9MU1AvdUM1ODFWSzRqbW5Dc1IzcUhp?=
 =?utf-8?B?bmZtRkg2SEpTTVlYNU14eG5ZbVhBck0yNFJwSWMzMjZwaG1qRmlGbDBMRFBU?=
 =?utf-8?B?bkVNWmpFU3VnMXdlMjQxQ3I2bG5FSVNucm1FQ1NEbCsvWndobVR2andMSnR0?=
 =?utf-8?B?UE53RDAxVmtGYVlEYWFabUNhQURlYlV3UnViblQ4MXZSa2VGU1NHREF1V1lM?=
 =?utf-8?B?U3ZlT0ZRbDFoS2ZkdStZTkRWYXp4QkgxVHBIRUlXZUtrOFA0b2hEbFJuVDFt?=
 =?utf-8?B?K2t5RXUzczEzZDFaZXB2aDczWWtIeXhDK2Q0WWR3dTE3WUxEKzd2Rk85bFZS?=
 =?utf-8?B?TFBkcVI1aGxJbCtaVnI5YjErRWkranZuc1hIaURMK2l6OU0zeUpQdkZxbFBV?=
 =?utf-8?B?d1Fsc29wNFZVZzRQeGR5VEwzd1JWL3EwcnlVZkE0Nm1xUjVnczFIZzUyN0tZ?=
 =?utf-8?B?V2VUM1BsbXpWcDVCcnlHK3pYazI2SDhuMmJzYjdCS0lqOTdaZTdraVk4R2RB?=
 =?utf-8?B?WnVXVGJoUVBlQTNzbEg1bjBPd2M1NWNYSzZIekRCcWsvdXo3Tmg0NGZ4UnBO?=
 =?utf-8?B?VWMwdWg0aXBzRXg2N3A0bGR5ZjFPUjJCOW5tZlBvUGNzNVovSTFqaGxMUVlZ?=
 =?utf-8?B?eHdFRFF4cjkvZnc1WDFCRGZZSlNrWmZPc1pkZS9FUUdWNy9abzlxQlErQzAv?=
 =?utf-8?B?aFZYVm1DNmZTbUJ4Q0VXVmZuUEhZYW9ZbzNpRDdObmVmR0dwRERZRXVmZko3?=
 =?utf-8?B?bHh2Wmc3MmJHSThZaHg0MVJ2QnU1ZmdoeUtQcnZ1QWU0alBmbzUrMGhVQUo4?=
 =?utf-8?B?cDhkWGJwQmtHQVE2TTdnMW9NYzZxV1g1dVhzM0FoYWZqRlpVMm1xQ3BLdTRj?=
 =?utf-8?B?WHhSdEh0bjRjMURZN0lFRzNoQzhlLzZRSzdnMVh2YnJUU0VTaG50bTVrN2g2?=
 =?utf-8?B?RDhlWGxKcHlEd0JsSHV6QjlHb2FLRlNLWUxScDd4SFFIYyt3ZmNHMWVmZ09G?=
 =?utf-8?B?bkYycmExTVhBWlkySXFPTHdseTdqWXlRdlcrdlVxNkRRQXVJRGh4NDBlenFj?=
 =?utf-8?Q?yO4g=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:19:13.3543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c01a99-3de3-46c5-2215-08de533d3837
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11808

SGkgTXlrb2xhLA0KDQo+IE9uIDE0IEphbiAyMDI2LCBhdCAwNzowMCwgTXlrb2xhIEt2YWNoIDx4
YWtlcC5hbWF0b3BAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLCBKdWxpZW4s
DQo+IA0KPiBGaXJzdCBvZiBhbGwsIHBsZWFzZSBhY2NlcHQgbXkgYXBvbG9naWVzIGZvciB0aGUg
ZGVsYXllZCByZXNwb25zZS4NCj4gDQo+IE9uIFdlZCwgRGVjIDMsIDIwMjUgYXQgMTA6MTDigK9B
TSBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0K
Pj4gDQo+PiBIaSBKdWxpZW4vTXlrb2xhLA0KPj4gDQo+Pj4gT24gMiBEZWMgMjAyNSwgYXQgMTk6
MjYsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEhpLA0K
Pj4+IA0KPj4+IFNvcnJ5IGZvciB0aGUgbGF0ZSBhbnN3ZXIuDQo+Pj4gDQo+Pj4gT24gMTYvMDkv
MjAyNSAxMToxOSwgTXlrb2xhIEt2YWNoIHdyb3RlOg0KPj4+PiBPbiBTYXQsIFNlcCAxMywgMjAy
NSBhdCAxOjAx4oCvQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+DQo+
Pj4+Pj4gLS0tDQo+Pj4+Pj4gIHhlbi9hcmNoL2FybS9pcnEuYyB8IDggKysrKysrKy0NCj4+Pj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pj4+
IA0KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0v
aXJxLmMNCj4+Pj4+PiBpbmRleCAwMmNhODJjMDg5Li4xN2M3YWM5MmI1IDEwMDY0NA0KPj4+Pj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9pcnEuYw0KPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pcnEu
Yw0KPj4+Pj4+IEBAIC0zOTcsNyArMzk3LDEzIEBAIGludCBzZXR1cF9pcnEodW5zaWduZWQgaW50
IGlycSwgdW5zaWduZWQgaW50IGlycWZsYWdzLCBzdHJ1Y3QgaXJxYWN0aW9uICpuZXcpDQo+Pj4+
PiBBRkFJSywgd2UgYXJlIG5vdCB1c2luZyBzZXR1cF9pcnEoKSB0byBoYW5kbGUgU0dJcyBiZWNh
dXNlIHRoZXkgYXJlIGFsbA0KPj4+Pj4gc3RhdGljIGFuZCBhbHdheXMgZW5hYmxlZC4gQXJlIHlv
dSBwbGFubmluZyB0byBoYW5kbGUgZHluYW1pYyBTR0lzPyBJZg0KPj4+Pj4geWVzLCB0aGVuIGNh
biB5b3UgcHJvdmlkZSBtb3JlIGRldGFpbHM/QXMgZmFyIGFzIEkga25vdywgdGhlcmUgY2FuIGJl
IGF0IGxlYXN0IG9uZSDigJxkeW5hbWlj4oCdIFNHSSBpbiBYZW4uDQo+Pj4+IEFzIGZhciBhcyBJ
IGtub3csIHRoZXJlIGlzIGF0IGxlYXN0IG9uZSDigJxkeW5hbWlj4oCdIFNHSSBpbiBYZW4uIEZv
cg0KPj4+PiBleGFtcGxlLCBzZWUgZmZhX25vdGlmLmMgaW4gdGhlIGZ1bmN0aW9ucyBmZmFfbm90
aWZfaW5pdF9pbnRlcnJ1cHQNCj4+Pj4gYW5kIGZmYV9ub3RpZl9pbml0LCB3aGljaCBoYW5kbGUg
aW5pdGlhbGl6YXRpb24gb2Ygc3VjaCBTR0lzLg0KPj4+IA0KPj4+IEJlcnRyYW5kIGNhbiB5b3Ug
Y29tbWVudCBvbiB0aGlzPyBJbiBwYXJ0aWN1bGFyLCBkbyB3ZSB3YW50IHRoZSBGRkEgU0dJcyB0
byBoYXZlIHRoZSBwcmlvcml0eSBvZiB0aGUgaW50ZXJuYWwgb25lcz8NCj4+IA0KPj4gVGhlIGZv
bGxvd2luZyBpcyBvbmx5IGFuIGFkdmljZSwgZGVmaW5pdGVseSBub3QgYSByZXF1aXJlbWVudC4g
SSB3b3VsZA0KPj4gYmUgb2sgdG8gYWNrIHRoZSBjdXJyZW50IHdheSB0byBkbyB0aGluZ3MgYXMg
cmlnaHQgbm93IEZGLUEgaXMgdW5zdXBwb3J0ZWQgYW5kDQo+PiBpcyB0aGUgb25seSBjYXNlIG9m
IHVzYWdlIG9mIGR5bmFtaWMgU0dJLg0KPj4gSSB3b3VsZCB0aG91Z2ggcmVxdWlyZSB0byBoYXZl
IGEgbG9nIG1lc3NhZ2UgdG8gd2FybiB0aGUgdXNlciB0aGF0IFNHSSB4eA0KPj4gaGFzIHRoZSBz
YW1lIHByaW9yaXR5IGFzIHhlbiBpbnRlcm5hbCBpbnRlcnJ1cHRzIGR1cmluZyByZXF1ZXN0X2ly
cS4NCj4+IA0KPj4gSGVyZSBpcyB3aGF0IEkgdGhpbms6DQo+PiANCj4+IEZGQSBTR0lzIGNhbiBv
bmx5IGJlIGdlbmVyYXRlZCBieSB0aGUgc2VjdXJlIHdvcmxkIGFuZCBpbiBwcmFjdGljZSB0aGV5
IHdpbGwNCj4+IGJlIGdlbmVyYXRlZCBtb3N0bHkgd2hlbiBjb21pbmcgY29taW5nIGJhY2sgZnJv
bSB0aGUgc2VjdXJlIHdvcmxkIChlaXRoZXINCj4+IGFmdGVyIGEgcHJlZW1wdGlvbiBvciBvbiBh
IHJldHVybiB0byBhbiBzbWMgY2FsbCkgYnV0IG9uZSBjb3VsZCBhbHNvIGJlDQo+PiBnZW5lcmF0
ZWQgZnJvbSB0aGUgc2VjdXJlIHdvcmxkIGZyb20gYW5vdGhlciBjb3JlLCBwcmVlbXB0aW5nIHdo
YXRldmVyIHJ1bnMNCj4+IChidXQgc2FtZSB3b3VsZCBvY2N1ciB3aGVuIGFuIGludGVycnVwdCBp
cyBkaXJlY3RseSBoYW5kbGVkIGluIHRoZSBzZWN1cmUgd29ybGQpLg0KPj4gDQo+PiBMaW51eCBr
ZXJuZWwgaW1wbGVtZW50YXRpb24gaXMgbm90IGxvd2VyaW5nIHRoZSBGRi1BIFNHSSBpbnRlcnJ1
cHQgYXMgZmFyIGFzIEkga25vdy4NCj4+IA0KPj4gSW4gbXkgdmlldyBoYXZpbmcgdGhlIEZGQSBT
R0kgaGF2aW5nIHRoZSBzYW1lIHByaW9yaXR5IGFzIGZmYSBpbnRlcm5hbCBTR0kgd291bGQgbWVh
bg0KPj4gd2UgaGF2ZSBzb21lIHRydXN0IHRoYXQgdGhlIHNlY3VyZSB3b3JsZCB3aWxsIG5vdCBv
dmVybG9hZCB1cy4NCj4+IA0KPj4gQnV0IGluIHJlYWxpdHkgaXQgd291bGQgbWFrZSBzZW5zZSB0
byBoYXZlIGEgcHJpb3JpdHkgb3JkZXJpbmcgbGlrZToNCj4+IC0gWGVuIGludGVybmFsIFNHSXMN
Cj4+IC0gRkYtQSBTR0kgKG9yIGFueSBvdGhlciBkeW5hbWljIFNHSSkNCj4+IC0gYW55IG90aGVy
IGtpbmQgb2YgaW50ZXJydXB0DQo+PiANCj4+IFNvIHRoYXQgWGVuIGludGVybmFsIFNHSXMgaGF2
ZSB0aGUgaGlnaGVzdCBwcmlvcml0eSwgYnV0IGhhdmluZyBvdGhlciBTR0lzIHN0aWxsIGhhdmlu
Zw0KPj4gYSBiZXR0ZXIgcHJpb3JpdHkgdGhhbiBvdGhlciBpbnRlcnJ1cHRzLg0KPj4gDQo+PiBJ
biBhbnkgY2FzZSwgd2hhdGV2ZXIgd2UgZG8sIHdlIHNob3VsZCBrZWVwIGl0IHBvc3NpYmxlIHRv
IGhhdmUgb25lIHNwZWNpZmljIGR5bmFtaWMNCj4+IFNHSSBhdCB0aGUgbWF4aW11bSBsZXZlbCBv
ciBldmVuIGF0IGFuIGhpZ2hlciBsZXZlbCAoaWUgbG93ZXIgZG93biB4ZW4gaW50ZXJuYWwgU0dJ
cykNCj4+IGZvciBzcGVjaWZpYyB1c2UgY2FzZXMgKGhhbmRsaW5nIGhhcmR3YXJlIGVycm9ycyBj
b21lcyB0byBtaW5kKSBidXQgdGhpcyBpcyBvayB0byBtYWtlDQo+PiB0aGlzIHBvc3NpYmxlIG9u
bHkgYnkgY2hhbmdpbmcgeGVuIGNvZGUgb3Igd2hlbiBjcmVhdGluZyBzdWNoIGEgc3BlY2lmaWMg
ZHJpdmVyLg0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgZGV0YWlsZWQgZmVlZGJhY2sgcmVnYXJk
aW5nIHRoZSBwcmlvcml0eSBoYW5kbGluZyBmb3INCj4gZHluYW1pYyBTR0lzLiBCYXNlZCBvbiBC
ZXJ0cmFuZCdzIHN1Z2dlc3Rpb25zLCBJIHdvdWxkIGxpa2UgdG8gcHJvcG9zZQ0KPiBhIG1vcmUg
c3RydWN0dXJlZCBhcHByb2FjaCB0byBpbnRlcnJ1cHQgcHJpb3JpdGllcy4NCj4gDQo+IFRvIGF2
b2lkIGhhdmluZyBkeW5hbWljIFNHSXMgc2hhcmUgdGhlIGV4YWN0IHNhbWUgcHJpb3JpdHkgYXMg
WGVuJ3MNCj4gaW50ZXJuYWwgSVBJcywgd2hpbGUgc3RpbGwgZW5zdXJpbmcgdGhleSBjYW4gcHJl
ZW1wdCBub3JtYWwgaW50ZXJydXB0cywNCj4gSSBwcm9wb3NlIHRoZSBmb2xsb3dpbmcgaGllcmFy
Y2h5Og0KPiANCj4gI2RlZmluZSBHSUNfUFJJX0xPV0VTVCAweGYwVQ0KPiAjZGVmaW5lIEdJQ19Q
UklfSVJRIDB4YjBVDQo+ICNkZWZpbmUgR0lDX1BSSV9EWU5BTUlDX1NHSSAweGEwVQ0KPiAjZGVm
aW5lIEdJQ19QUklfSVBJIDB4OTBVIC8qIElQSXMgbXVzdCBwcmVlbXB0IG5vcm1hbCBpbnRlcnJ1
cHRzICovDQo+ICNkZWZpbmUgR0lDX1BSSV9ISUdIRVNUIDB4ODBVIC8qIEhpZ2hlciBwcmlvcml0
aWVzIGJlbG9uZyB0byBTZWN1cmUtV29ybGQgKi8NCj4gDQo+IA0KPiBLZXkgY2hhbmdlczoNCj4g
MS4gU2hpZnQgR0lDX1BSSV9JUlEgdG8gMHhiMFU6IFRoaXMgbW92ZXMgc3RhbmRhcmQgaW50ZXJy
dXB0cyBvbmUgbGV2ZWwNCj4gZG93bi4NCj4gMi4gSW50cm9kdWNlIEdJQ19QUklfRFlOQU1JQ19T
R0kgYXQgMHhhMFU6IFRoaXMgY3JlYXRlcyBhIGRlZGljYXRlZA0KPiBwcmlvcml0eSBsZXZlbCBm
b3IgZHluYW1pYyBTR0lzIChsaWtlIEZGLUEpLg0KPiANCj4gVGhpcyBzdHJ1Y3R1cmUgZW5zdXJl
cyB0aGF0Og0KPiAtIEludGVybmFsIFhlbiBJUElzICgweDkwKSByZW1haW4gdGhlIGhpZ2hlc3Qg
cHJpb3JpdHkgZm9yIHRoZQ0KPiBoeXBlcnZpc29yLg0KPiAtIER5bmFtaWMgU0dJcyAoMHhhMCkg
Y2FuIHByZWVtcHQgbm9ybWFsIGludGVycnVwdHMgYnV0IGNhbm5vdA0KPiBpbnRlcmZlcmUgd2l0
aCBpbnRlcm5hbCBYZW4gc2lnbmFsaW5nLg0KPiAtIFdlIHN0YXkgd2l0aGluIHRoZSBzYWZlIHJh
bmdlIGZvciBYZW4gKHN0YXJ0aW5nIGZyb20gMHg4MCkuDQo+IA0KPiBEb2VzIHRoaXMgYXBwcm9h
Y2ggbG9vayBhY2NlcHRhYmxlIHRvIHlvdT8gSW4gcGFydGljdWxhciwgZG8geW91IHNlZSBhbnkN
Cj4gY29uY2VybnMgd2l0aCBzaGlmdGluZyB0aGUgZGVmYXVsdCBHSUNfUFJJX0lSUSBmcm9tIDB4
YTAgdG8gMHhiMCBvbiBBUk0/DQoNClRoaXMgc291bmRzIHJlYXNvbmFibGUgYnV0IHdvdWxkIGRl
ZmluaXRlbHkgbmVlZCBzb21lIGV4dGVuc2l2ZSB0ZXN0aW5nIHRvIHZhbGlkYXRlDQp0aGF0IHdl
IGRvIG5vdCBicmVhayBleGlzdGluZyBzeXN0ZW1zIGJhc2VkIG9uIHRoZSBjdXJyZW50IHNjaGVt
ZS4NCg0KTWF5YmUgd2Ugc2hvdWxkIGhhdmUgY29tbWFuZCBsaW5lIHBhcmFtZXRlcnMgc28gdGhh
dCBhIHN5c3RlbSBzb21laG93IGRlcGVuZGVudA0Kb24gdGhlIG9sZCBwcmlvcml0eSBzY2hlbWUg
Y291bGQgaGF2ZSBhIHdheSB0byBjb25maWd1cmUgdGhlIHByaW9yaXRpZXMgd2l0aG91dCBtb2Rp
ZnlpbmcNCnhlbiBjb2RlIChnaWNfcHJpX2lycT0sIGdpY19wcmlfc2dpPSwgZ2ljX3ByaV9pcGk9
IHdpdGggdmFsdWVzIDAgdG8gOCB0byBtYWtlIHRoaW5ncyBlYXNpZXIpLA0KdGhpcyB3b3VsZCBn
aXZlIGEgd2F5IHRvIGJlIGJhY2t3YXJkIGNvbXBhdGlibGUgZWFzaWx5Lg0KDQpSZWdhcmRpbmcg
RkYtQSBpbnRlcnJ1cCBwcmlvcml0aWVzLCBJIGFtIG5vdCBjb21wbGV0ZWx5IHN1cmUgaWYgdGhh
dCBzaG91bGQgb3Igbm90IGhhdmUgaGlnaGVyDQpwcmlvcml0eSB0aGFuIG5vcm1hbCBJUlFzIGJ1
dCB0aGF0IGkgY291bGQgbWFrZSBjb25maWd1cmFibGUgdGhyb3VnaCBhIGNvbW1hbmQgbGluZSBw
YXJhbWV0ZXIuDQoNCj4gDQo+IElmIHRoaXMgbG9va3MgZ29vZCB0byB5b3UsIEkgd2lsbCBzZW5k
IGEgdjIgd2l0aCB0aGVzZSBjaGFuZ2VzLg0KDQpXb3JrcyBmb3IgbWUNCg0KQ2hlZXJzDQpCZXJ0
cmFuZA0KDQoNCg0K


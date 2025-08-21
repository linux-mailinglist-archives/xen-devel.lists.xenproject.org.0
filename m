Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5015B2F565
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088425.1446182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2c9-0007zd-D2; Thu, 21 Aug 2025 10:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088425.1446182; Thu, 21 Aug 2025 10:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2c9-0007x2-7x; Thu, 21 Aug 2025 10:33:49 +0000
Received: by outflank-mailman (input) for mailman id 1088425;
 Thu, 21 Aug 2025 10:33:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+ul=3B=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1up2c7-0007NU-JJ
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:33:47 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 519455eb-7e7a-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:33:47 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBBPR03MB7067.eurprd03.prod.outlook.com
 (2603:10a6:10:1f6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Thu, 21 Aug
 2025 10:33:44 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 10:33:44 +0000
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
X-Inumbo-ID: 519455eb-7e7a-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFZif3VQPHgbZrW+pOGyCQOtKc8bA9RZ7kZtbY97PJz/tZDii30N3Uw4755vwqjFe9KWL2iumSPYMDjnw6xVgp8NoBgn8xqwWho6+3bVEbZryrpgDIaxMU7hysFRa0J+qDejv+7CwijVXJpRnZCi4YpKQB4ci61nDR0l1jA9gAYpAcRRO3Dm7KKelgyXE0t4DmFN0LbThgbFDraRb8WNDx12Uk0akV8VPlOTZhhyg5Kzzs/FWdEzITheleEmR3zuQuou89OK5slkIUXaKEMjDfMlLksuzq6q/QqGCP7OudGaRUMg6X1tm+RrIYMCXgxwm38NTngT+7FGJRR/sa5yoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ml/82C11biSbpgv96dW4rOKQGSjknt1q9GvbECagVAg=;
 b=WFuir+9fRQlFcetE1cg8TvBMNr+2JKcAbYDTAWRRPouQInZf/p/EwM21xdpEQZxBVhitOXECQKmzJvrzHPCUJA1TLBJ60cu3jrs+x9oYQu0phfSNDgfOXkHDaVeKeUyJ5gbIUQzVG8GXSxJ1xp7GILjaZbik3sXojdgRRbnFLLkAyTEij7sPGCStEWdrHg6nVK47BqqQlV5/GtRj7i4DBQHrM9iYqBvrlEDRwW6dUIQ+zoifEZdacv88tUYo4wTnc4LjGk0mCKym0ucNedZoWTeJZYYlBLl3broiv8PNFxIkFxf95yzdWlfHUKQRMyT2LcX84T//fRVPgswZ61f4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml/82C11biSbpgv96dW4rOKQGSjknt1q9GvbECagVAg=;
 b=ZD/TtHVaNdAWu67yiQPzGMlRD0wnQrafCwwJIa3PgKDA4Tb7vsTY2y4NsFrt9zk5IMSMzY5mZ0QdPI6JQIfx+cRAs3tucZ/I3FqbDcKQLYUvsK5OuuwFn44KXDSpfHCtGp+7mGO0ZOYY1AFDOJfFueXfnIlexJ2sHpWHZP0J5m5FZ0U7BUtbG9pgK9OFUx+0tmdyQLaxURFgv1s3zNZJ5RYyE3swCLmmDmk9AZi5qJfP17y/LpxMcxHyXt2jWXfHsAvm8Ub5o6f7dMPWq4Yw1wVptvCj/5DmU+KPwU84IDuG3KtrmAGH7W3seL8X4qdeFNDBUajSdGm4PPL8Ac9n1Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 0/3] IPMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v3 0/3] IPMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHcEoWBrXdpekseCUaIjTCf7h1JwrRs6ReA
Date: Thu, 21 Aug 2025 10:33:44 +0000
Message-ID: <b3b24b23-4892-4663-9cf6-41477567c156@epam.com>
References: <cover.1755771103.git.mykyta_poturai@epam.com>
 <d0f3e8e6-fb33-49b6-9872-ea9478368be3@suse.com>
In-Reply-To: <d0f3e8e6-fb33-49b6-9872-ea9478368be3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBBPR03MB7067:EE_
x-ms-office365-filtering-correlation-id: 7969c2b5-c814-4554-80a4-08dde09e3443
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dEtVeUtzK0NaVkJBV1hzQUptZkFmNUsxR2YwS0pTejNwd05IWmVldEJ5VHkr?=
 =?utf-8?B?UVpLc2FQQmYvRlNnc09HY1psemljS1VRdUMzZWtuMlRjUnMzTVZOclpwaHZU?=
 =?utf-8?B?VDJZUnJONkxrNlhVcHFWVklDd2p0MVpOZTV6RTVwM2t4c1ZFRDRvajgvcEoz?=
 =?utf-8?B?OU50aDVlcnM5RXBaQzZoVjdCdGZSME93WEo0Syt4SG9JWHBTakJtd2thL0o2?=
 =?utf-8?B?VEdBeUNUOUllZlBnRkpwRnhWR1VwaldiZmtidGRFdlpMSDU2bVdYSDRlUlNQ?=
 =?utf-8?B?WmQvL0h0dExJV0FNM0VjenRaNkgrTzFBMDJYOFlKNS81aVQxbEZrbXFMa1pI?=
 =?utf-8?B?Q2hRZFdEU0RtZjY4MTdDQ0o0ODhqWnY5YVo2Rk1lazYrV2QydW1rNVQ2KzZC?=
 =?utf-8?B?d0k2S1MxT3o0ckNCRWN2TmsyNnIwbFRLRGZ0cS9BU3V6MVpqMko0RU4rTDY0?=
 =?utf-8?B?ZVBzV1JBNnB6dElaVEtOakJlakMrUEt0Smc0MUhtWGNJeTRMSzVzak1BUnYz?=
 =?utf-8?B?dE5hbUxtM1kzZzhITTRYNW5qdWxBZUZKNUlJalVqQXdwaWY0YlB5a3k5VUpz?=
 =?utf-8?B?Sy96eHNmd20rQWlXcjlMMWpLSlh3SS9HcVdKK3Q3RmFjVXM2NzJ2cGFBRnZo?=
 =?utf-8?B?YTFWSXlpTGw4MDRHeWUxb3dLL3liQVhMMWpnbWNlazJkM0ZJUnZqbllMOEZ3?=
 =?utf-8?B?RFBzcjZOcXlodGdPL2VITy9LaTJCYjBVUmhYRmxKM3c0VldlR3NOYW55MnBP?=
 =?utf-8?B?amg3Q1ZsOHh5d3FiSU9PRjhYQUl3ek8zM3loWFFYci9NRXdYbzNXZWhuZnph?=
 =?utf-8?B?T29PeUY1aE1JbVRkVVlUMW5XZGw2NC9YV3RWL0hBM3Vja3ZUZk1SWktKb1Vl?=
 =?utf-8?B?ZWlydTkxb3dBVEUzaEJTMWhKSTBxL3VMSmdocjNoNk5tRU1xNzhXbUhoOURZ?=
 =?utf-8?B?VmZncVRBMkY4L0NNUW4xNG1HcGVndVdjbksxcS9SK0x1QTM5dlh2SnVCWWpK?=
 =?utf-8?B?bHFKQ005OHg0Y3YrMlhVcGZBcGc0cjVvZ2hORFY1M1JodzRDLzBRazJnbERq?=
 =?utf-8?B?U1FCUk5mVHlpK1VncmZRTTJyNjlYWlVucE5pQWo2NmVzUE9ha2FuNHdTUG8r?=
 =?utf-8?B?MXB1aGNweG5uTlZ3RjgwQkQwVW9pNGlyVGROWkJaamw5Q3ExeitNOWp2R2dq?=
 =?utf-8?B?NUdHVWM5MTNQKzY0a0wvUXFOeEQxbjNYL1V0clFiY3NnRDJiZU5nUHIxU3k4?=
 =?utf-8?B?Q3hoS3dGcmlBZFd6di9UWjlKT2lMdnZCSjdLWFZmYU9MbmJOaUhzZ3FoQkVN?=
 =?utf-8?B?dDJFZFMrNm9wOTFEZjdsTE42VTJETnhZK1Q4MUVPc0VQM1ZTZmorKytGdTN0?=
 =?utf-8?B?bjZpNkNHMHlrR3RUdmduQ1oxSUJOVTR2c3M4aHhET0FWSi9LWjIvZ0pwSmNu?=
 =?utf-8?B?TTMyWHBGcmVYY2RjdlBaazZhM1dla0hCZEVlaTVsR3NmOFBmb0FDYzhPNGhK?=
 =?utf-8?B?OFo0cVNPdXlrbmI4K04xdTk1Q0l2OWI4MWl4czl4S3lvU2Rud1FQelVKMzZn?=
 =?utf-8?B?U3hScE84QVAvYUkxSzZ5NE9DSlE3Ti9ZWE9Ha2dqYWpFeFIxSXdUd1JZZU83?=
 =?utf-8?B?aUhhaWhnL0M2SS9wU3cvVnMwOW55dzRldUlYR1YySCtPRjFWNll4UkRUemd5?=
 =?utf-8?B?bkwzbHFqNTZDWVNRQVJkZmJDcTI5Y1dEbjF3YUdoalVTSkg0RGtZakUweVlJ?=
 =?utf-8?B?UHlyc09oRWgvMm9jcU9SOXNCRWNMTlVhSjBVeTdiV0xaNm41UURSWFY5SE9F?=
 =?utf-8?B?WUNWRDNHMHppYm5CSWI4ekI0UEF4dzhZUzhZTVl3Wm9NdjZmZlZXNjQ0Sk9s?=
 =?utf-8?B?NWh2bFNJVG9JYWNwdUhJKzR0WjVqZTBkanNsUWFUaHRhTDl2bFhCSTQ0dGpL?=
 =?utf-8?B?TStnTHpoVVJCdFM2VTlSTkxqQ2ZSenpzbVdhdlhMa0w3eG1sd0t6VWRnWW9M?=
 =?utf-8?B?NHlMV3ZibmlnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXJObHdiK3NjZEg4NUhNaEd6ZWlocHhza2FKRm5HZ2tJdkMxRnlwMnJzZWNo?=
 =?utf-8?B?YWV1eG4vTEd6V3lma2lKdDN1M3NObkZsUGpRdEFleHV6OTRGSUdKdFJmOWJa?=
 =?utf-8?B?QVlteXMrUTVlL3lDTVhXdS9DbmJZWVFtZ2ZzMXFPRDI5UUlzekZER1ZRUE82?=
 =?utf-8?B?UU5NaWhncFBxcFB0RWtYV1lpbXZlRHQ3a3Y1MWJzaFgwNk9iTDhkcXI1Wk1o?=
 =?utf-8?B?eGtWV2w2K2JuQUE1UFg5ZzhiS0FjaEs3NjJUYUlwRnh5bkdVZlhpOXdZWEgy?=
 =?utf-8?B?NWEyWEFRT0hmRG1aL3h2VzVRdzdObjU0MmdzMS96c2FTdkdrNEtKUGF4UW5s?=
 =?utf-8?B?blR2ZHJIc2JtaitNRVJoQnR1N3lYd0ZxNkFHYlpCb2t3alRmTGllQ3piejJq?=
 =?utf-8?B?cngvd3lmUVJ6aXNxalo3MEhzaXhYYW1pTDdHeHdyZnZXajF4T3pyaGJsTEZ5?=
 =?utf-8?B?MVQ2emxuSmlGbjFmVyt2eGRLZTBRTHgvY29aWU1wTlhzdzZtM0JBN2VSUElw?=
 =?utf-8?B?TktoeUswYWIrOEp5Mm1PQWx6NVN3V3Jmd0Q2dnJaMktDa3ZiczhGQVFkRjVX?=
 =?utf-8?B?S2RZeDFINzdrdUJvNTJlY1FPWUtRZ1dNWXQ3KzI2QmQwNkovSGVtRFFiRk1v?=
 =?utf-8?B?ZXFmbUY0cDMyU3pTU0hOWHBGemFSbU11a0FDRCtCUDJZTk1TZzlxNmQrV2Q4?=
 =?utf-8?B?SlhCeFhCcUdaMUNHTWJnR2JaWnU4Y2doR0tENVNWNlY1SnhXb1VsR2VTay81?=
 =?utf-8?B?Qi9UcFZ2REpmeXZKU28vNXd2c254dEozUlliU0YxSVpFSnRXK254WkVNN1l2?=
 =?utf-8?B?QmR4TTRMVGQ2WGlLL0QzMzcvYVhteFlOZENRUGJZYURiOXIrZ3RXeU1Kd3Rk?=
 =?utf-8?B?bHREVDJvWVRQWDdVZDN1MkpQV1hoUVlWSnJ6NFBKNlhkdUQ1RDhmQlZLOTla?=
 =?utf-8?B?aUtHelFVN1JuRHl1NEYvVXFGci8yc2NuNG5QNGZuellLMjVwY0lkeXBCNnpH?=
 =?utf-8?B?aTlKV2t4OXFWSjgxZHBXNVlEWG5ubUZPRnVDcm4zb3M0TjdGYmtNZlk4WS9F?=
 =?utf-8?B?NDRCWWdjWEp5K1JYRTJseHBHME9mNUZ2YWJETTJrWGgwamNWNWZnbDQwaWRV?=
 =?utf-8?B?OExia2QxN1FzNXVRZ3Q3c01hWTZ0ZUFKb2k1WjFCZEFIOXVZZGluUTFEWTZz?=
 =?utf-8?B?QnBPOGFCRmhyMWFFc3BEODd6OXVWbi9ubW41UGk5R29DT1JQTGYzRkNlRVpu?=
 =?utf-8?B?K1JOQ2ZML3VnZTIvc25XblFURm1NcUFCSnFTVzVzOWx3ZExiRkRGcnlyTFEr?=
 =?utf-8?B?dkR2Wlg0MFM4MjZNOE5DSEJIVmpHQnNkMHBzZGtadVE0eTZTSExOc3k5ZXFJ?=
 =?utf-8?B?WENlOGs4Ni9DUDU0cElkTXVNTHBYOVJVZjl1WXY0N2xpbHhFVnFya2xxWFk3?=
 =?utf-8?B?WUw5NFBXeFh1eTA4NjlLWUFZZXdKT0lvQk40LzlGS0dnNGJlTHNzV1p5cUpX?=
 =?utf-8?B?bW5rV2lmMXQ4VWtrekVNV3o1WkdsWGVpODVwNUUvV0tOMTFZWG5FcHl0Qitn?=
 =?utf-8?B?c3ZuVXlEbjFwVHJDVlR5dWQ0Z0pDbGgzdEVEMnNRcElaVm5BbC9SanNVa2Mr?=
 =?utf-8?B?TS9ZZ044UjBaVWt4Vjd5RVRPcml0TncySEpUdC9YY2dMblpXR0NHbklqOG9E?=
 =?utf-8?B?N25wS3FGMFBLdGEyTDMxVzNCSTVYaG1zeVMrL2l5NzBjeTBORFJsN1IwMVRq?=
 =?utf-8?B?WXhWVzc1U1hmdGZ4ZXBIYmdQSkNUWGxod3ZlcmV4bzhWcWVWbmhNeXQxaGZq?=
 =?utf-8?B?eWpIWEFzc21Oa0N5YVhKM3Q1VS9Zbldkdk5FV09UeFIwZmc3alZFdWMwOVJn?=
 =?utf-8?B?dDVFVG9henJEMk5BSDdHQ216RlJhT1h5OXFLRXkzcnkyMS9XWllwN0RSdkxO?=
 =?utf-8?B?dzBEelM0R0Nuc3FVamVxc3FQS0ZWcGRDVmZtUk51QWdoWVJERCtGbzRZNURh?=
 =?utf-8?B?bURmeiswZDYwL1lNSm4waWZlTmk5QUN1V2NVTTJoQTdqOVg2TkFON1JPRHVZ?=
 =?utf-8?B?S2d5cThLdUZYcFJWU1RLdFcwb2QrZEVDcUNJQ2lieVMrOUJPZjFMRHVQTVFq?=
 =?utf-8?B?Ukt3aVdVUmVURXJZbXJVRHhyWWl4T29nUTN4RFMvNTc4aExqZHlTd3grVFZj?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77A93EF5037DF541B6D5E31D6216581F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7969c2b5-c814-4554-80a4-08dde09e3443
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 10:33:44.2137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZV0DAj7RLzFGCMWqV/4DfqJynfnWr24U3JwWXJDwE9kwACEGt6Og1b2FNeNej9y6k8l3/dPv2bb4/R2shreMlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7067

T24gMjEuMDguMjUgMTM6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wOC4yMDI1IDEy
OjE1LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgSVBN
TVUgaGFuZGxpbmcgZm9yIFBDSWUgcGFzc3Rocm91Z2ggb24gQVJNLiBJdCBpbmNsdWRlcw0KPj4g
Y2hhbmdlcyB0byBwY2ktZGVzaWdud2FyZSwgcGNpLWhvc3QtcmNhciBhbmQgaXBtbXUtdm1zYSBk
cml2ZXJzIHRvIGVuYWJsZQ0KPj4gY29uZmlndXJpbmcgQkRGLT5PU0lELT51VExCIHRyYW5zbGF0
aW9uIGNoYWluIG5lZWRlZCB0byBwYXNzIGRpZmZlcmVudCBQQ0llDQo+PiBkZXZpY2VzIHRvIGRp
ZmZlcmVudCBkb21haW5zLg0KPj4NCj4+IFRlc3RlZCBvbiBSQ2FyIFM0IFNwaWRlciBib2FyZC4N
Cj4+DQo+PiB2Mi0+djM6DQo+PiAqIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMNCj4+DQo+PiB2MS0+
djI6DQo+PiAqIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMNCj4+DQo+PiBNeWt5dGEgUG90dXJhaSAo
Mik6DQo+PiAgICBhcm0vcGNpOiBhbGxvdyBkZXNpZ253YXJlLWJhc2VkIGhvc3RzIHRvIGhhdmUg
cHJpdmF0ZSBkYXRhDQo+PiAgICBwY2kvcmNhcjogaW1wbGVtZW50IE9TSUQgY29uZmlndXJhdGlv
biBmb3IgUmVuZXNhcyBSQ2FyIEdlbjQgUENJZSBob3N0DQo+Pg0KPj4gT2xla3NhbmRyIFR5c2hj
aGVua28gKDEpOg0KPj4gICAgaW9tbXUvaXBtbXUtdm1zYTogSW1wbGVtZW50IGJhc2ljIFBDSUUt
SVBNTVUgT1NJRCBzdXBwb3J0DQo+IA0KPiBUaGVzZSBwYXRjaGVzIHdlbnQgaW4gYWxyZWFkeSwg
b25lIGNhdXNpbmcgYSByYW5kY29uZmlnIGlzc3VlLiBXaGF0IGlzIHRoaXMNCj4gcmUtcG9zdGlu
ZyBhYm91dD8gQXJlIHlvdSBpbXBseWluZyB0aGF0IHRoZSBlbnRpcmUgc2VyaWVzIGlzIGdvaW5n
IHRvIGJlDQo+IHJldmVydGVkPyAoSSByZWFsbHkgZXhwZWN0ZWQgYW4gaW5jcmVtZW50YWwgcGF0
Y2ggdG8gZGVhbCB3aXRoIHRoZSBpc3N1ZSBDSQ0KPiByYW4gaW50by4pDQo+IA0KPiBKYW4NCg0K
T29wcyBzb3JyeSwgSSd2ZSBnb3QgYW4gaWRlYSB0aGF0IGl0IHdhcyBhIHByZS1jb21taXQgQ0kg
am9iIChhcyB0aGUgDQpwYXRjaGVzIGFyZSBub3QgeWV0IGluIHRoZSBtYXN0ZXIgYnJhbmNoKS4g
UGxlYXNlIGlnbm9yZSB0aGlzIHNlcmllcywgSSANCndpbGwgc2VuZCBhbiBpbmNyZW1lbnRhbCBw
YXRjaCBzaG9ydGx5Lg0KDQotLSANCk15a3l0YQ==


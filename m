Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11292B29FF9
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 13:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085938.1444196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unxgF-00050a-P5; Mon, 18 Aug 2025 11:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085938.1444196; Mon, 18 Aug 2025 11:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unxgF-0004xH-M3; Mon, 18 Aug 2025 11:05:35 +0000
Received: by outflank-mailman (input) for mailman id 1085938;
 Mon, 18 Aug 2025 11:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vF/Q=26=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1unxgE-0004e7-G0
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 11:05:34 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42fefa7e-7c23-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 13:05:34 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM9PR03MB7252.eurprd03.prod.outlook.com (2603:10a6:20b:261::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 11:05:31 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%5]) with mapi id 15.20.9031.018; Mon, 18 Aug 2025
 11:05:31 +0000
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
X-Inumbo-ID: 42fefa7e-7c23-11f0-a32a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WP7e2pm2qcM3QUs/pVeq2lT0B+1YyY3OlEXTpQLM3Ll+vJfJqbmQj+dLJsYVwcMpaevEIiYAQYHmyiLPKg0p4Yz42eLR+mHX1M2TukIETpoeCeo0Isr1jLKK3X2qG9y7XA/1VdSlqjA++O0HUgtmgCMNl0vjVGyY92Ov3CVwn1z31t5SF2bBQEsR//ga/xLKyROyxTZ/doNdbFSbfDZHbsfqKyW9g6zqsni+hFJoTonaOZYXNVojitt3pKivomFa9g29sTWCk+e7jMQXVD6HOqWn0kgeE1/uJ+slUhZ3X4YxJXQ3Ol4igVv6NOz6LXFbEW1jzZy48rZzdJET6l8iyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUENUuEQjChbl8u4LhrlpSG4vRnO6ZMwkiesRPYgKjk=;
 b=AeWcu25NX/1owpPQIf98drsl/pKaC0A9upJjtRPNtUwKYVYDEf9qmeVNhYKoQbCCr10YIsAabQ3ct9ODXE50xUXhHrRMp3RgiQNj5eKRPRvF57fUP8oruW8ubuOsDL9E/ZlNeuqC+euxjEiQIYer4R/G6k6RbwW+PkId/0yZhhPoh3Wp0VcusUTZ8lwRYnhYiXoLNAjDybrj8XJ+OMLtplp5nSIBc8hUsE0FHu5jCtUq3Vrnf3RUor10n/7P2obaZUTzHKNdOamZCrZMPv6kcjDPdef+99/FDa+rGEKzK6lh1p+gdbtBWjUc7MV3G/t/P6qfHehI8OboPxBeONAxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUENUuEQjChbl8u4LhrlpSG4vRnO6ZMwkiesRPYgKjk=;
 b=MYoCZ4ymgyXIMtAUKXX27LOOhfKi1aHWbp/nm4FXcBiYnaiA+0gqNzo998rV4kdKYiZ2YYlpoGN0yFUIpFM99d64KviURXOdfuY+nywUWyCTfJu9eYcZJyZA1s97bUfPaFMV4xrM/bJVfOOnpoHJK/g746Lw8IXaP7gSBKeuRGwKzOj3DcQPEqR7/OF7eZjnB0K4t4waQ/OuTcUraCkG/INYFV5znMV3F8GYGnUljx5v2VDmOYIYX7zsBpRGR1TiJ3Gtx7VOajgr8bZLmCQtbXoMVgcjaFVvy9MGC18rtJv5OYcaf1x1gRl3UPVjzr7Pc39i1JWarYMwJz7kjaxagg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8428a76e-8414-4367-9e27-65b9cb049bb3@epam.com>
Date: Mon, 18 Aug 2025 14:05:30 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xsm/flask: add AVC pre-allocation boot parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20250815102330.778749-1-Sergiy_Kibrik@epam.com>
 <37206bd7-b455-499a-9632-f435ab87888e@citrix.com>
 <0a828038-69e4-4ffb-bc88-0359213ad878@citrix.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <0a828038-69e4-4ffb-bc88-0359213ad878@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM9PR03MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7c3e99-efc1-4ba3-f5a3-08ddde4725fa
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1FrbTJCNi94T3RWVkdQQlBud2JITVBTNG9YOFhYNDg2NHNQd2IzTHJTU1A5?=
 =?utf-8?B?Ym1ONlEvUHNFS0x4U1UvaTlSNjZ1T1M2ZFlsRmw1a2EvWGNZTGpxNTZaM3No?=
 =?utf-8?B?clJ5QzdIZU1EOUw5cStYQzBCTTViOVZpTGJmUU04ZU1acGZPdkpPcmpZVVRM?=
 =?utf-8?B?TFU2b0xqWS9KMG5Nc3lObm02VUs0clRIUXBqaVZ1TXBGRGpDN3dLUVFMNTU1?=
 =?utf-8?B?TWNvK0t4UU9VSkN3NlVVUmxYNTEzcWlyVXVtUWhJQWZhNDdmQmJFUUdVN0xS?=
 =?utf-8?B?RVdTeDZ5amVFcTdWK0M3YnpMOG5zTFpDSWp2QmQ1OVhvV2F5TXVRSStvcnJN?=
 =?utf-8?B?N1RNaWtaNUJhL2RVZ1Ywd3BrSnBENlpuOHJFcEhlTEk2a2dxWCtyQVFzZlF5?=
 =?utf-8?B?WU9IQTFHSGdoOTE3TEoxZ3NTWDFZdnM4TFN0QTBKUnQvUWtjTEw4Mkl6TlVK?=
 =?utf-8?B?Y1IzbXpPZU5HK1lVN29sWEl3L21wWWFBd0pUeUVDVzdxWFFmaUc5eFFTTk53?=
 =?utf-8?B?L3NEKzd3Vm83aFZwWTUzdDQzNXRrcTZ3TitFLyt0UWJpbmYwRTNLUzZnSy9i?=
 =?utf-8?B?eDNlYks0ZWJBRWExVWw3cTZGQnJJY08wSEZYcnNTM2JrT05WRkFZdmJhSUx6?=
 =?utf-8?B?NVI4d1NXMU04MDdNRTFkVjREZHNhaEFQV3BwTTQ3c3BkQk14dFlPZk9qQ1l4?=
 =?utf-8?B?dmNzVHBWMjVaYStRR1puaWw1L3dYOFgwb3NSOThtRzhyb0w1RlRPM1NndUpX?=
 =?utf-8?B?ZTNIM1prWHpzZDUvWWVTVmhqYWJxREtmTXRDMWpQbHZmbUZiendQK0c5TExX?=
 =?utf-8?B?NnB2dmZlZmU0UU9SaXZMTWNQdFNSZ1djamdBZlM0YVBhME1tbm43Y1Frb1Jy?=
 =?utf-8?B?ZDVjSVdQYVYwcGVESzJQQWJjOVpjNGhxSUtDS0lLWVRSKzNUblVIOVBiM3pi?=
 =?utf-8?B?YjZMMm9hTS9IMFR6RTIzdVFvbklXMnlUODVNMkp5ZnRPU2tVY1dza3NNY1RD?=
 =?utf-8?B?NDdpQ0l3S21Eb0FFdXl5b2NPbThQdHlOQW9YVGI2ZFA2VGxVVVc0MFJkMDJP?=
 =?utf-8?B?aElLUFY2Q2lPenZTMzNiWGpBZlMvL0xPR01GUURyMmxyblpDTFZWYlFnYytI?=
 =?utf-8?B?ai9GcmNuanRmcCtnQjkvSzRGcWJDTzVoUjliNWZ0Z0RSWHY2VEJkckxOZVlQ?=
 =?utf-8?B?YlNaaTRUSG81RWovVHQ5a3pBMFExL28vRXc2dFZqaHhGTzVhcEFqSjZNWU9Z?=
 =?utf-8?B?a1pVVE9OY3RwSW5FVDV1MzN2bVlvTUkrdk8wZDNTRVRNY1Zyck9oZlUwRUdJ?=
 =?utf-8?B?aklYVzZOQXhvMkhqSVJyNDhIbW9LcVQ0RXAxdjQyRklkdGpwMk9LOHpTZTl0?=
 =?utf-8?B?QnBYMS9kSjAwYlM4R1YrL1psOVd5eVZIMDNUUHJ2bEdNcmRnSmZjV2tub293?=
 =?utf-8?B?cnFXb3B4VlJyaTdoeGFtUUR3SEJKQzR1OWdDQlY4b3JVczNLVGFSdVFjQmxl?=
 =?utf-8?B?MUxscnZzUVlheUp5dU9vRHQraVlmYnRxQy9kdTlWUGVwZnFHd1NyWWpKN3Rz?=
 =?utf-8?B?bWEvcVdBUjlCY3pPMmoxOGdFY3czbkE1ZUNWaDRBbDRDQTJoc0FPckJ3ZjRH?=
 =?utf-8?B?a1FSWXdKLzRtb1hCc0FCSk5FWGxhV204L01SR1UxY3JIendyWm8vOGdzVTF4?=
 =?utf-8?B?MHFIM1R0NlFIR2JEaXRNN1RKZE9KZVBPUTIvSXR6TngwSEJXVVhhR2NkcGZH?=
 =?utf-8?B?QUdFMGllaHA1eWc3bnpmNisrL2ZWc2VxOFJTYnZtNUptUWszY0pJOGl2WExR?=
 =?utf-8?B?U2tseHlhMk5BUWhGajE1aW5UTmNQdHBXNXpoTFg3T2YwWms3TDIxaEJMaE5j?=
 =?utf-8?B?M1M5bFBMeFBvRXhmbEFsSXpxZnNrajVuYVcvc3ZJemJVT3V1c2xCRmV4OVQ2?=
 =?utf-8?Q?83ppTcwNEks=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW1GbG5VZWdvMmNTZDBOYzFhWllBbXpneE1OMFc3WWIxZFJJaFlETUM1MHd0?=
 =?utf-8?B?eWpwVEs3VG9Zc2NMc2l4OWF1SGlDQnNwQW5KOEpjcjJmUXFhb2hOTTNsUzNT?=
 =?utf-8?B?dWo3eTdVMmJRY1Q0VGhnNzErMTJBQWI2MEs0ZGh2VzhyTHFzUEdneWwySXpT?=
 =?utf-8?B?WExMdU9VNm1UMXd3bmJ2bURpQmtzdVBtMG1OMTBadWE4NE9VRU0zMURoSG9w?=
 =?utf-8?B?UGpFV1V4TlYyVEpEYnlLSVVKZHlRaVh4cTcxejcxc1BqRWg4Nm1vOTlXcU5B?=
 =?utf-8?B?cTNIUUxMVE1aT0J2bUNxQVlYaFE5bUVVazlLWFdtcnBoaTRwTFp3b01jY2NB?=
 =?utf-8?B?UnZYMEJrMEdHS09lWnVjd0dPUW80RjZXY1hnMWlRWGxYbTRyN28rdU82a0NK?=
 =?utf-8?B?MkRaNmJSWlI1WEJxcitEZE9qMVNmeVJ4dmhnMWJldEo1azhvSjNyZjRyZDBs?=
 =?utf-8?B?ckcrK0YrbW9YZTFUQS80Y3ZYZjNzeEtuNFFuMHJZVVczS3p3cjZqdmluQXVu?=
 =?utf-8?B?V241TDRhN2Z5TTdQeEsvS1d3cWJ3TUpKTXhLQ0srVklJMlNUYTMvbks5cWhw?=
 =?utf-8?B?VTZ0WGRLNkgvamZwT2R0T09JYXhFMFBGSWhQWHo4NWw1STdtSXVsQXQvNDV5?=
 =?utf-8?B?OUpQZWdEMGVzZXpjbzVybnJ1Sm1oUjBUZkFZWi9DMFNZSmJ0ck1KNzVwZDZw?=
 =?utf-8?B?S2VVQy9naEJhODFrVWtwa2g3TUNBTjZwQjI2bzcxOEZBaWg5UWdCNHhpVDFY?=
 =?utf-8?B?Um81SFF1Yko0SEJGL2VGaDdGMUF2Q3N6WlBQZlR2L2I2bTllQTBSZkVocHB6?=
 =?utf-8?B?QXcwdkNlQlFRQmxxVGc5a0R4UmZ5R1dyeUJBL29reDBsQ0Y2M2R1bWhRemlt?=
 =?utf-8?B?NFA4b3NlY3U4M1NOS2JYTVoyaDZacjFVdEVvbitkbnhFT2J1aStkZ1R3YUxT?=
 =?utf-8?B?VzJaVFZ3OTBkVGgvVXNINTVGYnFqdHVNM3hWSnpWY21ac0FKOW05ZWN5UCt5?=
 =?utf-8?B?dVViNjNLNEhUR2NqV0VJVXVsQUZVYWVXNDdBY2xocy9BYUFiNVhiK043eVIx?=
 =?utf-8?B?azRFWUVIandLdEJ0OWhGQXhaYkNsdnh0WDJlY2hYM1pObFpsRi80eXk1ZFVm?=
 =?utf-8?B?UHNDK1cxSUFVK0RYMU9Iak0zekp2eFd2d1VseWNaWTI3ZjBPWnkxQ04yc2Qz?=
 =?utf-8?B?RFlMYmdSeWQvdTJwd2Q5SVZzOU9BL2Q0SUtuQ2tBN2daRTRwNE1yWVAxL3lG?=
 =?utf-8?B?aEMyai9yaThQZ083OXZ1STRGUFFzODlVOWh2c21wMytmOUZFbUZTY0xheWRV?=
 =?utf-8?B?SFMzcWFuajF2S29DcCsxVTlKYnVZbi9vbmZUWVNCbjJBMjk4TG5CQ1JhS29T?=
 =?utf-8?B?Vmw0eDFPT05XeUY5SXRYL3kxOFRMMUIrRmdZM25HOElUdnJvemJUQ2RmaDY2?=
 =?utf-8?B?UWN3c3Ftd1hST3ZxMmtyZXE3OUV2NjlFZGJXUE5VSXZQTFRwZlExRTlMMnh6?=
 =?utf-8?B?M3ZPU0F4Yk4waVF0bXk0UWNKb3MrUnBzYUpLT2pTVm44aDlhelFvTlRuZDBz?=
 =?utf-8?B?a0xoL1pMaVo1V09EWmpoTUNJZWl5YUJIeXNMVUxxYkV2cmlOSFRvSTFZSWQ0?=
 =?utf-8?B?R2MyREFvVlFPZ3p3L3NnRndEcnpVQ25XR3lNOXo1Ry9DYTQ2UTdJQlE5RUp0?=
 =?utf-8?B?MCs3Wm5WbU9WV2xIYUJ3UTdzR3JwZjh6SEQyZEd6Ty9wZUlsVFBlL0piYXVJ?=
 =?utf-8?B?RVhCRmZNZ3l2SE94dXA1ODlBemIrQTU5L1k5QXRHakFoUjhuSWZUSDFqQlpQ?=
 =?utf-8?B?RFplSmhXbDU4VnRLL1BhZTd1TWV5dFhWMS8yc1U1TVRuSW9PQlF5d25TeHcw?=
 =?utf-8?B?cWtuWm1mQ002VjllQ2VuU3ZGNVh6bjFsYzRkVU5WU01CV1ZWVy9hc29YRmoy?=
 =?utf-8?B?ZVZNVzZKdkxQd2xxYzc4ZEt2eFJYczJKdEVZNFpCMDQxbWNSZnkxZzFjYUZy?=
 =?utf-8?B?emdwM3dyV0lUNC95MUhIZEdsek1ZdURXeXlNOU44ZDIvZUFsT1FQdHdDZTU3?=
 =?utf-8?B?TXVmZGNlc2dSd0VvYnVWV0dkaDhYWnY3VkpkUnFNWERqaXgxUXZNemJHd3p5?=
 =?utf-8?Q?Hfdgt6/kHQGDyp51J/tkcHRDk?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7c3e99-efc1-4ba3-f5a3-08ddde4725fa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 11:05:31.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeoSTgvL1srEWt8MhUYaLUI6nLfs9jS2M2qMXO8r9j8U0kkIyNYBday7UjoAaMToi1MsEe4YEbqjciEk5wq3zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7252



15.08.25 14:43, Andrew Cooper:
> On 15/08/2025 12:21 pm, Andrew Cooper wrote:
>> On 15/08/2025 11:23 am, Sergiy Kibrik wrote:
>>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>>> index a75b6c9301..9044827e78 100644
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -238,6 +238,15 @@ loops for Queued Invalidation completions.**
>>>   Specify a maximum amount of available memory, to which Xen will clamp
>>>   the e820 table.
>>>   
>>> +### avc_prealloc
>>> +> `= <boolean>`
>>> +
>>> +> Default: `false`
>>> +
>>> +Allocate XSM Access Vector Cache at boot. This forbids runtime dynamic
>>> +allocation of AVC nodes from Xen heap and changing AVC size via
>>> +FLASK_SETAVC_THRESHOLD hypercall.
>> I don't have any input on memory allocation side of things, but this
>> needs to be a sub-option under the existing flask=, and it looks like
>> you're going to need to turn it into a comma separated list.
>>
>> Also, if you actually want to use Flask in a safety system, Flask needs
>> to become security supported in Xen.
> 
> Sorry, sent a little too early.  x86's dom0= is probably the closes good
> example to follow, having both comma separated booleans and a choice-of-$N.
> 

yes, I'll try to integrate that option into flask=

  -Sergiy


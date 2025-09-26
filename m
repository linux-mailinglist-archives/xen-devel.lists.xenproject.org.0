Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24DBBA2884
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 08:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131024.1470261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v220g-0003tn-MF; Fri, 26 Sep 2025 06:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131024.1470261; Fri, 26 Sep 2025 06:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v220g-0003rv-JE; Fri, 26 Sep 2025 06:32:50 +0000
Received: by outflank-mailman (input) for mailman id 1131024;
 Fri, 26 Sep 2025 06:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VvSe=4F=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1v220e-0003rn-R1
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 06:32:48 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bf3894d-9aa2-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 08:32:44 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PAXPR03MB8084.eurprd03.prod.outlook.com (2603:10a6:102:223::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 06:32:40 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::61a0:97f5:ac5f:e292%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 06:32:40 +0000
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
X-Inumbo-ID: 9bf3894d-9aa2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNLUr2yUHIVT59pl8K+2UUS3fmJJxPHm9lCtPTquEbHRLi5vRlVESlSHPDCECZn50rtqgRRSnNRoGLc/v1EHKYZkYMx/UtrXsXRHIM35TmHt8osCuMHTTGmNOGOhTOO/l+RwC2Mfomn/CQc6wculflAjnnTDCYUhWBvGGM9x99WXcefSSFiB0hQ9PB16YgYC4ZaGHJKUg3OM1TTjwYDtpuTIFyxxSLg4oFfpZl14cxqBNWjPlS8NzMA2f+tanyIR0K6eSuToVIQhKn/UoquiODuUwry0vUiCO7LrbRLwqBgB5qeGM+w74QZ62QAPOHol6QI6dFkAw8hgmHaCvHv/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4ah3Tq65ga8DUMZGxx2igrEChh0oFq2p5n4iT/UrUU=;
 b=H0n2zMMlsmAHC+Jb5z/cAKackkFngunvRiktl1q7Yf/VcobRS3Qmjeo5DmzzrqDCnWiDje06KSUD5FX3jedRYkbAGSZf0/h1dlBnrHyIFH/X2rQVnLooaS5/oErWacGOjNpg97dg7cXiFswk9KSUu6MYueLccgrEJUdB/BimeNNIFnlewSEcGAFjjcc86cjsm2GK801pnXF1zu5knko+ofZLUPc5iLsJ2fbpThxnwZ2gdl2WKdtwMAtZUntEdNAuVYJWOQF74zyP0xTS7856FBNmIHPtVta3PlvYty7BGroAkWomsQZE/3J8tX0tr+o5utKYVoT3ZA/12qvwF4EHZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4ah3Tq65ga8DUMZGxx2igrEChh0oFq2p5n4iT/UrUU=;
 b=V+uOy6442ndl+tD1lvzFRxkRLXc5XL4EI1UQLcMJ9biTSO5fit1ggoPs68L+ZeXi0TdCPAurSiEcBga6EQcg2Xg2HjTutExZ0WQLR3ntcYpSyVuKSZxVdcT7ZMDiKwpizFPa06aWgmakqhZkL4nGOMAJXAXwo9HgnJAbT0TxlNG/eXN6FjS/SgjnLamWSNxVgxZmPmGLjlkRiemHS88t0sTyVjpdk3qNqXLqitTvnH48fD6crL9XmEfYErWAaVgE8UeSkABKDU6nTp1uFFPePC3PPW8bHcDs3YivQ0Cf9NtpwoJq7mUVXiCH0E6+++bKrjFbZz4q2WWrMTLEETLMTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <aef15bee-be58-4749-95dc-3f87bc2540f8@epam.com>
Date: Fri, 26 Sep 2025 09:32:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/flask: limit sidtable size
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250901105231.1570041-1-Sergiy_Kibrik@epam.com>
 <de8380a4-cad9-4589-ae46-8649036186b2@suse.com>
 <7b36e8fe-c19d-40eb-b1d7-d869cdfb1a28@apertussolutions.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <7b36e8fe-c19d-40eb-b1d7-d869cdfb1a28@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PAXPR03MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c60487e-5c4d-4ee0-81b2-08ddfcc67de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d09xSno0bXloNFpyNHRZZ2YwNkxPS3Bqb0E2ZUt1aEtKUnVnUUVZN3dqbkJs?=
 =?utf-8?B?TVdudEtsMGhEZUdMNnpSL3QwbzRoVmxNVWpSV2R2YjhFNFZacSsvcWdEditw?=
 =?utf-8?B?aXJOaW56TlZRWUcwY3ljMndYS1QzR0hYTFI0eGlNVHAvMU5pTklva3BzZDE4?=
 =?utf-8?B?Q1BDdHErcUJ6a2VqR3FnR3FaTVRuMk5WVmluU1BxZGNncXFzdUplb2hXNmIr?=
 =?utf-8?B?M003SWZ4V2I2S3lUTFpUbEkvYXAzbDdBRmVzcEdROWZyd2JPdTlVSEx0ZFdM?=
 =?utf-8?B?akthYkdmSmwzWG9nem4zWFgxR0x2dkM2dmlkZURnUE9vRWJBdWxMdEVNL0Fo?=
 =?utf-8?B?MnkxdGMwR0t5V0Rnb3h6T0ZXb2luTUt2Wlh2WVdZUGcwTHhqZDcwdFBLL2VE?=
 =?utf-8?B?dDZSU0VESk5COUJVRnNwenRMVFJDa1Y0QjhHb2RXVEp0YWZ1S1ROY0V5MUd2?=
 =?utf-8?B?VzRjT2QvUXA1QlR4NWhZKzRsTU5OaVRSSzZxNjMzMEF2SklhWDhoY09FdnV0?=
 =?utf-8?B?Y09jUmljeU5QZVNJSks4Z2tsUFpnWUVXUnA2eURoaDY0RSt1b25sMFZta0NT?=
 =?utf-8?B?YlNmUlpEYTBHS2hob0xIeXl3Q21mWERZclEyYTRNcW5hTkNyZzBpYUFUR2hv?=
 =?utf-8?B?MnJ3ZTZxbE5WL1F5VWEwa2QvWDUvMEpmUkt3VG0wN09yR25qZytIdHhoS05R?=
 =?utf-8?B?WVFxMkc3ZHl0Q2pxckhuQVg4YlQ2RFhkbTAyZkpiSjVmOWM2Sk1oSmF4bEtj?=
 =?utf-8?B?MldrTWM0WGlIN29tbmxhZ0FNOUZkOG11Mzd6YzFMMlN1ZjJPUDFDTyt1NkdX?=
 =?utf-8?B?MVRSZ1dHSnVXb296T3BwUE0wbVcxbHBXMUg1c0JXZ2k1S3FmZzVrWWFHTG1x?=
 =?utf-8?B?aUtOc0o4ZUFiaTdhRXBDV0hxNXdCZy9QRnlDRFZKY3Q1NEQ5eHFYZzNkTkhG?=
 =?utf-8?B?Tk5JSjllM0NZRnp5RkVzVmY2UHUvTGk2VFMzVFZoRFQzbVZuSVVZM3R0UUtM?=
 =?utf-8?B?VVMzV0w4R1EwN0h5WkgwbFEra0Rxa0dUYlFKQmtsY3pWT3lTWUtaUlNpVHRk?=
 =?utf-8?B?MDZkcmNtVjFxRWZ2N3FtVlFFWWJqaDVFMklCZFVHYzFEWFJzMG9ZSmFwOTdk?=
 =?utf-8?B?WXVDdmJWUVBoS1BNVkdjUnB2aitlZUpYSDBjVEVCeEVWRFc1NTB1eUdvaXpS?=
 =?utf-8?B?SktEZTVneGFoSUFUV3MvdG5FVHJ0dWFNSTRZZFQrUGF4cWY2TVk2VEpPVzdr?=
 =?utf-8?B?ZHlrNE9iZFk3Yzg0WFhEZTNuWC9hTk56RWJiRE1nZFVCbkwyUjJZOUVYa1hO?=
 =?utf-8?B?dWFOd29uUXJJQ3MyVzJpNEFWQ1lZa1ZkMEJJMzJXNjl6TFh1V25mWWhaeXR6?=
 =?utf-8?B?Q0g2a0lETHlNVzRGNU84L29RZW10d3BMcnRxUGdpaU04aU9Ic25WYm04Qk55?=
 =?utf-8?B?S1c4b3F2bmFrR25RZGZlLzZSb200bXRNcktQaWMvdGZVMm1JaVUrMldRbEJC?=
 =?utf-8?B?c2Y2dFZaZmhUbml0SHRDRGcxdEx6emtXcWlxTW11SGNqS2ljSFhFYzFMSXZW?=
 =?utf-8?B?cER1Z1pDZWZScWNJVFhSSDNVblZWem1qZUEycUhCKzlTazM0UUJLd3RYbkNk?=
 =?utf-8?B?em1KT2RlMnYvMjZSSUd3bWdxaTc2NE1xejhVUFhpTldzM1BhUDdzUURlczUv?=
 =?utf-8?B?MngxN2R0UGp6cEkzOXdyYzZnNG96a1JzYXQxN254REczQXRNUEduQ3N4YlVj?=
 =?utf-8?B?RUxtY01mbktadmluMDVHbzY4aFFta2VpdWZXVUNQWXpDRkx5WjhYRi9UVXFa?=
 =?utf-8?B?aGc5VFJrT2draHpvRUlVNUJRbWRrMnQxT2tRNkw4MGpWWGlBcUx1WVNvVkxX?=
 =?utf-8?B?Vm1MQThpbEdDQTIvSkl1M2VlSEJIWVluV3JUbWhBODJUR2x3YjluUnc2ZWJH?=
 =?utf-8?Q?X4sttYu6BE4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWtNN1FIcG44d2lzNzVqMXd1Rkl3OFNNQjBONW5zL2dRaUIwWng5MFd4c2Vi?=
 =?utf-8?B?OURpcUJ2OWhWdTJ0aHhiU2pyMXJLMjFTM2RQVzNqdGVBNlF2MXhTTVIySlNz?=
 =?utf-8?B?Q09YVTMxS2xseE1LTHd5RkhtM040Qk4vRTBGMG5IQkF4Q3ZncEp2Qm9zOXFh?=
 =?utf-8?B?ME5ZMmF4dGY5eTBzWDdWNTRvclpaaTNwZmRsYmhTTHhRaWxqeEtvc0EzaGNw?=
 =?utf-8?B?Vitkb0NzdzRFT04wUlpKc1dyTVVsKzc2Zzd1M3FQY2pPRGxWRDFlOTcwTkdW?=
 =?utf-8?B?aWwySTdxZ1lhUHBCUUJVQm8xZ21YLzF1ZGIydFBFbGpZb2RxK2NRRTd2eEZ2?=
 =?utf-8?B?OEhpWlllaVhCZTRjMDZxZUpXT29PTnFUTTJjRkJUSngvcWYyUTRZcEFITUgv?=
 =?utf-8?B?ajdKQTVrUXdXdzBmRGRrYldYdnpFVVUyWmZBZEx3YUJpZzkvVnR4RFFieWxW?=
 =?utf-8?B?bkdNcjVHcFRrQjRYeUhYRlJJUjlsOUxxZGY5N2RjZ2VmMlpkd2RXbGxnaXJX?=
 =?utf-8?B?NlZGQ2JjcTF6b2FSNFlYWjJtTUhwNG5Vc3d5Sno0VUNjVGpranRYU2t3ZDRp?=
 =?utf-8?B?NTZtQUZDTGJ1RjdVS0JLZTBzRHRQdUhDemMzSk1GamNwcGhOZU9qeVd0OW80?=
 =?utf-8?B?VVhPbHlISUc0K0c5NnJUY1dtdVJNUkYzZzRYQXFZMXd6TmJDbklZbTVTWVYy?=
 =?utf-8?B?Z01ZOTBrKzZqY29IdGFFSStYYUovK0wrRGlWT1JHSWl0WEQxRllFcEZBVXNi?=
 =?utf-8?B?ck9qRXhndWthTkd6UklYS0c1VWZ0NFM5Mk9Qd0xsMm5DWkZaVTdoWWhXRHEw?=
 =?utf-8?B?KytxTWk2SEVmWi9UdTB5WUZsNDRrRmZKbFByUDRkR0ZOZWVVMWVNU3dwSlhI?=
 =?utf-8?B?MEV1a0phVW9LU0MzdjdmWHhvb1FTUzlZNXFZd3J1Z3FCVUI5bzZGK1V1SnBJ?=
 =?utf-8?B?eWNsUzQ3aEZjRzQzUEdhSmNPVmduazVvVTZmQTFJcVdtMUY1WisrdUVNWTc1?=
 =?utf-8?B?QVhjd2FENkxGQ1IzVzRXZEovS2xjQi9QMHdTZkkzTmsyY3liL1VyM2o4M0dL?=
 =?utf-8?B?bEFieGg1ckR5aGE0ZjlIUE9QZXJXZ1hPUStGangyV2NMOW5pZEh5NHg0RDNB?=
 =?utf-8?B?ZkFpZExRcU91MzBXNTh4TnZnUWkwL1d1WElEak4xMTFnVC9iZGc1Z254WXFx?=
 =?utf-8?B?Z09qa3QvMlo1eWhLME1JZ1pTQitDRDI1R0pWbks0MEI5RlBqQ2FPTi83TDFY?=
 =?utf-8?B?YTJWMGhyZXpZMFNLallVeWxsczRQWXhDN09ZQXFTWTNCbFBrYmlVRnRkYlg3?=
 =?utf-8?B?U0oydWgvNlc5RkpIRTFLeWRvUm1BVmpVV1dRUlpNblRpelhjNWNwSmkzWk9n?=
 =?utf-8?B?YnppWUJtWXRhWjBjMmRYRitzbCszRmhrTnEzNHNRbXlLNjN3b0FkU051UUI5?=
 =?utf-8?B?SnZ2ZmlMemtyM0FoMDdOTjBjMWdvK2tNRnJTaXQvZkVjREJ6RXFNbEZ3UmpH?=
 =?utf-8?B?THFjU0lGdTJ3c05nWHNQYURSQk9HSkFyMlQvVGlSU0I0QjJiZm9zdU5UdG95?=
 =?utf-8?B?QkE5YlZhbTFIbDY5S2c5UnMzczFFNDdXZmZRQks3V2JnQUtiS3R5QS9lYThk?=
 =?utf-8?B?ZzI3Q1lwM2ZoQ0F0cWx3L3B1ZmVjN1dYb21KNkNCanRKa3huZ2Q4bURoR3Vi?=
 =?utf-8?B?Rk5GN2hEdW1Td3BXNTl2R2VvK3QxNlN6dFY1VnJPVDZJbGxwRlBxNWVBTFRx?=
 =?utf-8?B?cHlXOWh1MTVNRFlvemFJeDN1cFRKVFI0c05WV0tqcTNGVlRXZkVNV0JWQ1h6?=
 =?utf-8?B?b2JvM2xFVXFiKzJIVjJUbEMxa3NnYWVDK0kzWVkrZi84citJNlliemxFbVg0?=
 =?utf-8?B?eEp5QkZnQVJ5eEpHVGdrY2p3Z0luSjByU3pCQXZNeDZFNUxLdEI5RzBnRGIr?=
 =?utf-8?B?aEtWcm4wSWFFUEF3TW14VDlmL0JVS1lLMzJHdmcybGxPRk5LWnBuZmdGTHBC?=
 =?utf-8?B?TmZWWjVVVURVV2xhSS9UdXNlc0pjMDVJVUNOWkw0akpUWTl4dVRCMTFUdlc5?=
 =?utf-8?B?bEVaNUs1OGREMk9Zc2NBMHhYY20vSEZTTzg3a2E5VWRNK2I5c0loRVdjZWNi?=
 =?utf-8?B?REFKVGtqRkJCaVVPWHROYWFpeHQ2dGZrMFFVUWZmZmorejFuQnloSUFZbTFI?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c60487e-5c4d-4ee0-81b2-08ddfcc67de2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 06:32:40.4887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGItNSnO4f1ouA8/C9rQgT0WsYfBYKucAhpnV9lG3O0O9ecpZxXS4zjpkEOtZ3a+gvDIRztszkszAEzwtEr3Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8084

06.09.25 01:01, Daniel P. Smith:
> Hi Sergiy,
> 
> If you don't mind, please CC me directly, as I am the only XSM 
> maintainer for which you will need my Ack. And for whatever reason, I 
> cannot find the v2 post in my xen-devel folder. If you want to resend me 
> v2, it would be greatly appreciated.
> 

yes, sure

> 
> On 9/2/25 05:41, Jan Beulich wrote:
>> On 01.09.2025 12:52, Sergiy Kibrik wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -418,6 +418,17 @@ config XSM_FLASK_AVC_STATS
>>>   
>>>   	  If unsure, say Y.
>>>   
>>> +config XSM_FLASK_SIDTABLE_ORDER
>>> +	int "Maximum number of security identifiers (base-2 exponent)" if EXPERT
>>> +	range 4 32
>>> +	default 32
>> When 32 is chosen (i.e. also the default when the prompt is hidden), ...
>>
>>> --- a/xen/xsm/flask/ss/sidtab.c
>>> +++ b/xen/xsm/flask/ss/sidtab.c
>>> @@ -14,6 +14,8 @@
>>>   #include "security.h"
>>>   #include "sidtab.h"
>>>   
>>> +#define SID_LIMIT ((1UL << CONFIG_XSM_FLASK_SIDTABLE_ORDER) - 1)
>> ... for Arm32 I expect either already the compiler will not like this construct,
>> or the latest an UBSAN checker would object.
>>

you're right, arm32 toolchain is not building this.
Would the following be acceptable then? :

#define SID_LIMIT ((1ULL << CONFIG_XSM_FLASK_SIDTABLE_ORDER) - 1)

   -Sergiy


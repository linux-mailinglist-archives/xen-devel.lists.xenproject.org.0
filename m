Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E39CA1335
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 19:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177079.1501491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQs3R-00074u-8n; Wed, 03 Dec 2025 18:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177079.1501491; Wed, 03 Dec 2025 18:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQs3R-00072l-54; Wed, 03 Dec 2025 18:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1177079;
 Wed, 03 Dec 2025 18:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh3s=6J=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vQs3P-00072f-Vo
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 18:58:20 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 074d80f0-d07a-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 19:58:18 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5034.namprd03.prod.outlook.com (2603:10b6:5:1ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 18:58:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 18:58:15 +0000
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
X-Inumbo-ID: 074d80f0-d07a-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IR1NpYpESKgEn+CKItNANiVepkD/uXHty3IsHmWmEmGIcqwcuVXzKVox2u3eUnsTS6WLS2xLiLfVxQ6z9K66rGFGkRD9sP/SfYexDRKkQffZ4cqqQLgT49OE6G12b/Rn6WAUV+D4iydtwL9gnORiA0YOPyGIyBWTgkOnin2aWqlFoKZhB64W5BAE+5CMoVLI8qnlEUL07MSamnsjfpnuCvpt+C3on0t4pLKm3yHMUEcvgBqreNsHY6JRG0UQCFVgq70EujMxXjmcRJVaFvXqO7vXs9sTWgufSB34UQEKf/8s4vgHhtI/uUhzEVQQU+nZQmO4Bbr4iBYrP95FGybWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VOw19oPxPeUS0+sH/lI69fnuoxBZpca3sCNMKXEH5U=;
 b=OA4LIV5fEH62Xo+mUHrO4KCK1LSuWjgdXEx3HYjUtINH71qwoODm/QXPrQkK5sJfSShA/+saJCzpR972dtRd2Iq0vJ5PeOVL+d4VwltUVyMx7B9hpnPFReE/sYUfyXl9ksALYJlFNbT5vrr/yO3kaFrDaZrm3tJm9hJKC04hvZ91Um1JqBmgwezVlVJZiIOM+WI+KiWocscTsQP1sHyUGUCpC/M+qhcg3Bni+ntGbm4BretNhEHGbf/P6CJzHpI3OkE3FxYxkIrMnGiiBBuF9GtF7W1DXH4sWqQmc6oDFqYSj+yTvVvbZV9TJWFuiWQve/ogJeQMU4wbiTwKKVEENg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VOw19oPxPeUS0+sH/lI69fnuoxBZpca3sCNMKXEH5U=;
 b=w3X5luYgIsv4wCVwA9khdi4cHy3Uuyxe9p1qbgKwCo2jT+oYaFGhu2S4HA+qfPPyNk5HKVmSBb5M2CGhYMqZsPoQwfpxqoyen4piruA4XnHSKtZ/bpUY2wVsKtnOLGxUNdc68k87sK9LvbCCeUu+sDTIgRFV4+33MRqAxgCyW9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9a7c8d3c-222c-46f2-ba88-cfb2b59599cc@citrix.com>
Date: Wed, 3 Dec 2025 18:58:11 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Hans van Kranenburg <hans@knorrie.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <JBeulich@suse.com>,
 Maximilian Engelhardt <maxi@daemonizer.de>
Subject: Re: [PATCH] ARM: Drop ThumbEE support
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20251203171608.1714964-1-andrew.cooper3@citrix.com>
 <f081cd84-a626-4b02-8c8b-6c0c0b723b84@xen.org>
 <875a6a6c-f81f-449e-bd57-7e720d07e8a2@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <875a6a6c-f81f-449e-bd57-7e720d07e8a2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0541.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b98d4b-bf13-46e2-fdfb-08de329de9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDVwQmo2dEpFTkw0MllHOFo4clZ2SW5aWUdWM0hEZURCQzBtQ3ZqWEE2OXhr?=
 =?utf-8?B?RnBTYXF0SDczQ3hzam10dy84OVZzU1lTQmVUQVVNSGFLT2hOUnBzK1VsSWVr?=
 =?utf-8?B?ZFhYYnpnL3RMdVhUbWt5QmRTUXFSR1dwaEEyZEhqR3RMWDlON1c5cmRGenVQ?=
 =?utf-8?B?eDUyUmM1QjF0WUk4dG5OYXJnQkxiWGVmS3FmTGk4VklmZUhvd3Q0c2xsUEoy?=
 =?utf-8?B?TFhDbXBmREMxZVA3anEybklMcjFyaFlJa1hVNnEyQ09RbENrNWlUUExES2k2?=
 =?utf-8?B?SXhyak8wbDJPRFB4a0FsWllHY1VqcmxwOEZFNW5aRjd5YlFPYTNNLzNadGtw?=
 =?utf-8?B?QWFOM282ckh5dTJxZDVDWklxeHRtdXR5YUxsc0ZVZnNEZ2E1WGxiMkh5VjY5?=
 =?utf-8?B?UUdyWkpKek9FS0VMSnBJYnNZRWZYeE1oREpYdzBhTzVCTndGLzVKa0hWR3JV?=
 =?utf-8?B?K0RnSHllNFhBamVCZDd6M1VQV1VOOFBLN3kxemFHb2FyZ0M4b3BvU3pvRGpo?=
 =?utf-8?B?RzhScVRia21JdUlPZS8xaDZmUXU3L2lrTTdRTGdOQ1hhc2JDNmg3SDlNRFVZ?=
 =?utf-8?B?Wkx2K3loZm51UEZvN0xDNVlvalNRTDhrZkpsbk1KeWRiQW1GanAyQkVzNURG?=
 =?utf-8?B?Z0Q0Vm1lYmxKUlh5ZkFnUGhGK0xRR2NYK0hHSmxSQzB1L3FpV2kzTHdicndK?=
 =?utf-8?B?UEJyS21pM0NXc0ljV24zbVJoMHZKN0hHVTdmRHc3b1ZwYmt4L1JWUHBhWmcw?=
 =?utf-8?B?c0JkUXkrV1loZTJ4Vm9qWWJiS3h3ZXBKYmc0Sm5XRVU1TFgzSkhiSUVWZ214?=
 =?utf-8?B?eDB0UUhPcHRjS2tKWk1TT2c4N3dqSzlHdmZHVG1qb01PMjUyajRUODhLazNU?=
 =?utf-8?B?LzROdTJIK3hrc1grUmRFTWQvWVdIMzFqbjhsNXBsYk5NMkJFMWMreEg4dHBM?=
 =?utf-8?B?SXYva2xVTzRyOFFNYXpiWnZ4cFFDZ0ZFc3U1ZkFENWtpSHIrbVpJMVh0a251?=
 =?utf-8?B?T0RmempkK3pEVmpNQkxZVHNEQ2xiTGs1a1NiTWV2eUR1YUtFRWcxUVZYVDFy?=
 =?utf-8?B?MUhsNHlEUkhxWDA4bUgrMHFNbW1jaVpPTDQzYjFsSm1MNXV6VTl0c0NaVXhp?=
 =?utf-8?B?eXFnN1lQY1RRZUNQMEhoQTJTS0MwandyVFpzSVNEWHZjelAxYmtreThUQjFC?=
 =?utf-8?B?UkIrSmVSc1pQZDVlRS9CSlUxbHBNbGFydHB5bFlBaTkxS2l0Wkp0dkVDczFL?=
 =?utf-8?B?MEVhSEV0WE1TQ0ZRREsxSDlIbml3aDBvempEbTRWMGxIU2R1ekN4Q05XOVZv?=
 =?utf-8?B?V0t4S2k0KzFpdkwveXR4MUZIWXdiNWNtRWFxejNJSEFYOU5qUTBiTURYamww?=
 =?utf-8?B?RStRTGt6eStuS0VEZEFIYVZ5Y1g4TU9WNmlDdUErNjdaZm40YzFWZ05sK09J?=
 =?utf-8?B?cVBEZXFlL2xabU5aRVd2ZnUrNVltUnI0KzBLajQ2aGF3d2tGUVJCSjJLa0F1?=
 =?utf-8?B?WHVKY3hvQ01DOW9xTXg2azZzM3BEci9LT1phT2xqb2RCK01hODlYT1lHRGY1?=
 =?utf-8?B?MTExS1FaOThGMVhYT3RJSWh6TVFTaTQ0eFZRbTRJK3FFdy82TXVwSlptRHMx?=
 =?utf-8?B?RGlyM08wdWxnVWhBMjcvaEFaa0tLSStlTmZKaXpvRWQweXRMcVZLS2RZbjJv?=
 =?utf-8?B?cTdCR1NzKzdCMGFSUFJLaEp6cUwvb3NPZXlwMzFZSTdUUXVLbDB0VEV5T1I5?=
 =?utf-8?B?ZGxXcTh0YjAwd3JzS2lON04wenRweGVuSEJ1S1BBb20zN05jbW5UbXdzVVRM?=
 =?utf-8?B?Y3F1WUZuV3NGUUNOOTQ1aUdMUHYvUXJNc2hNUXFyWFl5MEYvMWRvdmk4UGxS?=
 =?utf-8?B?NkpTaG9zSjNUaXVEZjU2MjFiOW1HWkFvQzBkcmNycDVYdDVud1BCQnhvQndB?=
 =?utf-8?Q?CRrCoZrp3vt1JNjk2MxLoQi+UgqSw8dK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGFVdDB0SDVhN3lxUzdGMlBqd1lLalRZVndqSCtnU2xPZWUzYm5wMGNJWjhG?=
 =?utf-8?B?SFJTNnB0bG5XbmZ3SEtDNmdSUHNWUkFPS1F2cEhoMXYrUTZPeGs5bnZGNEpL?=
 =?utf-8?B?K3RjZkhnb28yaGhicU9nWDdMcmJqaWw2WHdoVTR3MWJ6MkVPRjc5dkkxdnRn?=
 =?utf-8?B?UDE1TmVSaXhUZ1FKSEpWQzJFRzVyYUp1WE9uTVUxQUxSa1k4ZlprWlF3d1Fr?=
 =?utf-8?B?bTFndWJtTWlXOGVIa0VwQXZ0RjNUTGExNjNrQmJjd3l1VEUrNTRLZUVzVUxh?=
 =?utf-8?B?K3FLdFRSOVJrbkhPYUZRd2VJTHZRUUpYbk55R0YyRUl6cjhrWWZic0hoNDF6?=
 =?utf-8?B?dExDL2M1Q2FWWEdWNUtWWk5pd3BwNWUxRG9Db0NJYkR5SUp0cDhldFlhUUEx?=
 =?utf-8?B?alY0UHBQeEJ2VnZqS3hxMmxDd0swMitIUE5SUFRJQ0NHWnJiN0JSREpLVWhX?=
 =?utf-8?B?ZzR4MGFnOWNDRnVuTG9IVldZaURUN3lveVJRVmJmTHMwbEdsWUtwRGNhczRq?=
 =?utf-8?B?THMyc2RJd1VmZ3lCVzRhZUZKNnZJc0lYY0lhNWhLSjl5RTd2R0tBUUhYQTUv?=
 =?utf-8?B?VXUzNE5HNTJyRzAxNEl2V1R5d3B0aDJ1QzZKdmV1Z3hJVE02UDRscE83NWRx?=
 =?utf-8?B?SWVvQmg4VmhNd01lVkhXZFZGOENpSWEyRUFCdXA1cTBTR0xUdUJlVXNzZDEr?=
 =?utf-8?B?RDMvYXlCcjRHVFBBM1FielR5UHVjcHBWd1VCQUNIRkNxU3hjdUs4d2pHTTZH?=
 =?utf-8?B?WW5YMDlOcTZsU2sxc1JURXdHc3BoMUpEaFVuSWMzdWNvUFBmVk5TOEVMNDZV?=
 =?utf-8?B?dHM1UE1iamFNVDhrZXE2akhmYlJ0N0loSUR0cUZOSmxTLzFVYkNNc1l5OS9B?=
 =?utf-8?B?cmxSZFFQQ2l0eEg0UU8vbzY4WDdoSWdUZnhqbXpNNzEzWHZhWXExWFZsVFdY?=
 =?utf-8?B?WFBLWTZuU3BDOEZiYWhMemNjMzkrb0ZIZ3kwaWZlZ1RFamt5MHJ5MHhBY2Qx?=
 =?utf-8?B?dVlTYjlwdjhyeHRobmJmVS9PWG5rZ3Q0eFVFbUd6MUUyanRJc0RvNGcwK3pw?=
 =?utf-8?B?WFJnbmN5Q2V2blR1NDNnUFZOYVFoRXZvV2RUVmkwWkt1MFg3a2FTRW9WS2RI?=
 =?utf-8?B?MEh0eDU3WWEvOXo1YmNydFRuV2VObktSRXhIeWlqV2tZUFUzV0F1T3doZC8y?=
 =?utf-8?B?MDZRbVNsbGRBY0Q0cElxL1h5QU9FbURzNlZRTnAwSE9pU0dheGd4SXZHSEg3?=
 =?utf-8?B?Y01Pd0VRc1pOak5Db3d6dnhURWtNVFhobU9aeVM0ZHQxTkJ4KzU5bGRYNm1N?=
 =?utf-8?B?UzJkZVp2NkxFeEZkZHhXaDBqNmxMeWV2K3U5MjZaZXNZVWRta0VNR3RMNnpx?=
 =?utf-8?B?MzNGbnpiaUdBRTBJYmpvY2hxeUdOUzMyYktWeVR4RFIralI2Y0VIM2pvUGFS?=
 =?utf-8?B?V0x5UVNpY1ZuZEsyeDJtQmJ1ZTNrQnRKUTFHc0dzRm9JYms0VHpuTldhc0g4?=
 =?utf-8?B?QTNmVitIYk1iTVQ4bWtBbUMrWkxPeURxWFdXZ0hWRlgrOWZTdjEvMDNtaTU5?=
 =?utf-8?B?S0l6QUlBdDN0U25pS3pxd2IzUmljUGUvSnJDemE5MFVxbElrbnF5QkJ1WXV2?=
 =?utf-8?B?SUhNRGxWMmhuQndIc0JLY1BHb1lYcU9jeDk3QitDY2Z4TnowMk4rUFVZc25s?=
 =?utf-8?B?NXA1UWZ6dnhTRDFoNTlYNGExTWorVWR6eFpsbytScG5pK3lEZTltcFlIdUV5?=
 =?utf-8?B?dXJzTzRvQW9tc01pRW4xNi9rL093anZ2dHBYUXNTZVBpdTcxQ1NHcWl2aTJW?=
 =?utf-8?B?OEluYmp6QTEwS1FGOGRLby9YZUxleUtYUnVOL1EwdHJGRE9mekJTS2YxaXhI?=
 =?utf-8?B?K1YrR0lZSWNYOTkzOFhQRmw5UWJ3MENCUmU5SE1HalZkWnJYdmJsa280a0dl?=
 =?utf-8?B?UTdKTTRLS3ZKblBGZUx1OC92eWFsSHkrV3hNSkxLS0pQamtDMUNTQy9QWDZ5?=
 =?utf-8?B?ZnJ4R3lCMGdBYVVFTitRK3RpZ0Q3M3RUUUJmRk9WOXE4dUdxVlluOXJqM0lL?=
 =?utf-8?B?djFVNTk2M2I4d1E2WU9HYWlGN0RodE1idGFxUE80UC9DcEJvdHp2ZXJXUmFC?=
 =?utf-8?B?VmJFVXNKRmJnYXJYOWlsZGY5aEpZTEh4NVlTeGZYTHZZKytWVitGbXF1U3E3?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b98d4b-bf13-46e2-fdfb-08de329de9fe
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 18:58:15.1748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3Kc47EtVrrgziGUce5CefxGjTqEufJCxqNf4nT1PKGReQhC3h8oALzWXsTUNYu9wBzWllwQxLd+jxtUB+JUC2RZ2nWNyUepFy3UYvSvdqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5034

On 03/12/2025 6:49 pm, Andrew Cooper wrote:
> On 03/12/2025 6:23 pm, Julien Grall wrote:
>> Hi Andrew,
>>
>> On 03/12/2025 17:16, Andrew Cooper wrote:
>>> to keep it working, but there was apparently no use of ThumbEE
>>> outside of demo
>>> code, so simply drop it.
>> I am in favor of dropping support for ThumbEE for guest. But I am not
>> sure I understand this comment.
> There's no production use of ThumbEE known to ARM.
>
>> Are you saying there are no processors supporting ThumbEE where Xen
>> would run? Asking because below, you are removing code to context
>> switch the ThumbEE registers. But I don't see any code that would
>> ensure the registers are trapping (i.e. HSTR.TEE is set). So wouldn't
>> this result to a cross-VM leak on those processors?
>>
>> If we really don't want to support CPU where ThumbEE is available,
>> then we should check that "cpu_has_thumbee" is 0.
> The registers exist in ARM v7 only.  They do not exist in ARM v8.
>
> I suppose yes this change would result in a cross-VM leak on hardware
> supporting ThumbEE.
>
> Can HSTR.TTEE be set unilaterally, or does it need gating on
> cpu_has_thumbee?
>
> Is setting HSTR.TTEE sufficient to cause an undefined instruction
> exception to be thrown back at a guest which goes poking?  (I guess this
> is really "will the default do the right thing")
>
> I'll freely admit that I'm out of my depth here, but the build failure
> does need fixing.

e.g.

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 92c8bc1a3125..ec23fd098b63 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -411,6 +411,7 @@
 
 /* HSTR Hyp. System Trap Register */
 #define HSTR_T(x)       ((_AC(1,U)<<(x)))       /* Trap Cp15 c<x> */
+#define HSTR_TTEE       (_AC(1,U)<<16)          /* Trap ThumbEE */
 
 /* HDCR Hyp. Debug Configuration Register */
 #define HDCR_TDRA       (_AC(1,U)<<11)          /* Trap Debug ROM access */
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 2bc3e1df0416..040c0f2e0db1 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -158,8 +158,8 @@ void init_traps(void)
     WRITE_SYSREG(HDCR_TDRA|HDCR_TDOSA|HDCR_TDA|HDCR_TPM|HDCR_TPMCR,
                  MDCR_EL2);
 
-    /* Trap CP15 c15 used for implementation defined registers */
-    WRITE_SYSREG(HSTR_T(15), HSTR_EL2);
+    /* Trap CP15 c15 used for implementation defined registers, and ThumbEE. */
+    WRITE_SYSREG(HSTR_T(15) | (cpu_has_thumbee ? HSTR_TTEE : 0), HSTR_EL2);
 
     WRITE_SYSREG(get_default_cptr_flags(), CPTR_EL2);



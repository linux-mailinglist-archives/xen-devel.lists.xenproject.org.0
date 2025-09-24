Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03394B9A70D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 17:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129488.1469426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1R10-0005hT-3N; Wed, 24 Sep 2025 15:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129488.1469426; Wed, 24 Sep 2025 15:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1R10-0005fI-0e; Wed, 24 Sep 2025 15:02:42 +0000
Received: by outflank-mailman (input) for mailman id 1129488;
 Wed, 24 Sep 2025 15:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXxj=4D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1R0y-0005fC-06
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 15:02:40 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82445dff-9957-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 17:02:37 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA4PR03MB6992.eurprd03.prod.outlook.com (2603:10a6:102:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 15:02:35 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 15:02:35 +0000
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
X-Inumbo-ID: 82445dff-9957-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgpWgbl05+rFSTzyzTjig9a9otKvulS8IETKA47uKYx51qXySkNtrqrjFMSWpNt0U330LGiYpNzYaautXTlHu4LEQWJyoHolCvXklsF65w4or6D8wiPHE6I5gHftWj+/DQtSKjnz8Ry9E/uYVTJY6D4gXZHR1Y+nzlkRpdFyOAgAdKwV9/HSSeYi+aC6za6b5+AnnBx7b/7lZZx9+L+61vIdsx6wHSfqg8fN7HD9uJIl7QN5qSDxmN52Veeva/l8pd8AJrT4v9OyA5gbGrANfoNzjWNw/03rmcg3/Gxzcb5ciVXNKgTVinygwRrtNBU3mXWB3N5+S9satzEHfV1GQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVZnX4ULP295CayncxiVgpVqhfvOZOT/j+OGAfYSWww=;
 b=A22JJKvhXAEmG6wabZlPWxULj4Ie9O2X6stMFvisq6IqLdOxS2Ql/pU9SUTh3bvWNf7Wzk72rcMUqrluBvgPHbNp9opOEJqJSTFTqQw72eFewqlhdQpCbu+ahcSUozXfEZAyAhJuJ7Gp1F68IidkHgv41/1u0xCkxYuMXNgMTqdDz1jhqH1YMqKa1/pi0a/+bxhAQLWg3g84hdHeVMCXxIMiXu7Ot2D6hY6M6R0nGycayenAwMs1+xLU0dWFyFjVj2q2sTJbcND533SK/lvNufgs2ZP8g4yEBKmpHm1kHfUA0MPrMjExJubKKO3SR8apH18VfJ5IOyF1PCVE9tEMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVZnX4ULP295CayncxiVgpVqhfvOZOT/j+OGAfYSWww=;
 b=VStoRBbzwrrouIaRrRqZKOa7lK5tL1lLRDKxOpUEkkSVUhh9pAvZNma5pXJOn7KjynfGCBI6z4GiLbFjpkcERYj52k0IR6dNBVksM7bBxsYHRJ88TeEoeF4igMFVKvA6D+CfytHyHPaPib6MZ8aLF3XPnAVNGzUyL/ulDRf+hR5mH/ezTG5Cm7L4KTvMeDrNOLOx3p7zphAZv7fAFWAI9Cejd39VqNYvWoLs2BCt4+HvxddRo7szeip6aa6eXN10tEu3JUy/1a9yAN2X319QB1i33c7cA/YeqXlMrfHVUdV4rjYZQGikbBcPwHOHfZb9jx5YJBxagvwcfKJ8TdqeFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <05ac348d-b392-42ab-b769-8a1c1355a4af@epam.com>
Date: Wed, 24 Sep 2025 18:02:34 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/2] x86: hvm: vmx: fix runtime vmx presence check
 for !CONFIG_INTEL_VMX case
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Andrew Cooper <andrew@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250916103251.2144449-1-grygorii_strashko@epam.com>
 <3baf457c-d32b-4965-96bb-022a2f92bb9d@suse.com>
 <bcd7a98b-5827-4b4d-baa6-52fe24339faa@epam.com>
 <88cc4cf1-3bc9-47f5-b8f7-e04f01b027ee@xen.org>
 <DD0ZQLVE0KSS.3HHC8OHAQPL8L@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <DD0ZQLVE0KSS.3HHC8OHAQPL8L@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA4PR03MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf7aa47-94a1-4bd3-a2e8-08ddfb7b6513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|3122999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFJVd0hSeFVqcUVWY0wrWnk2THRiUDU1TUJldUpQZHdibnUvNWZvYmp3ZTBR?=
 =?utf-8?B?clBCaWo1VENaMThtZkNDQURLaE85TVdqaUt2ZGdtS1lJMHdGV0VNUVNvTlU2?=
 =?utf-8?B?V1VqTXgxUUk3VE5mREtXOCtpOUlTYVZ4YzFHUWNOUTZjZ3ZPTWZNSkY3QnBW?=
 =?utf-8?B?UkluRnRaRjRhd1pJd1hnM1NuL2YxY2hnQTB6U1RGMnRhSkhlbDN1dnBFODZG?=
 =?utf-8?B?UlM5YlZUc1pkdEpKMFlMaTk2L1dBT2RLdjNlTXlhQVRWb081ZFhsb0VSbDla?=
 =?utf-8?B?dGRnRVFpMFJ2T28xVG5wNHVJS1lYcUhCWVlMU0xuQ3hjaXFHY2kwblpTRlFw?=
 =?utf-8?B?VEtENUdpRkdweUZYM3J1RnFXV0JOTTdKYWFvUVRaZndBM3JyZ0hrZ0xmRFJM?=
 =?utf-8?B?dG4ybXB2NUFCWkNNWUQrdGRaVGx0VVppWkJFNzRneExaenpOUXB0RmVkaE1P?=
 =?utf-8?B?RlpKUE9Tc3AxRFI0aDExVnQrOW16WGZlemRQajVyNUM3cXNva1RkVFU2eGhF?=
 =?utf-8?B?V2NSZ1Y2cEExYVZ1VGtjUzJ2Ym1Xdm1PazhOTXJGNFNveXRvVHdlNUt3R1BU?=
 =?utf-8?B?VlZsZUtlbXlSREM3dkh6czRZT1hieWl2UHcxQTFMSmRHUDlmdlc2RVZhenZT?=
 =?utf-8?B?aWN5Wkt3QkhQSEo4N3dvamdGc2c1ZzRnczkvWXhPUm16YkxIb3VOOGk2WGZh?=
 =?utf-8?B?RjdFaWVoYkNzdldnbUtic2RyUmJHRWY3MnJMN3ZzTWtqTjVmcnFISjdSQzU2?=
 =?utf-8?B?dWpldWFYNEFnem5xMEJLOHhITklVdVVHRzUxaEpzQ2pkUmJDM1g5ODFWTWZl?=
 =?utf-8?B?bkhUaGFQdDIrSGZNNklMRU9iNU85TlRjaGNZcHZYeWlUUFlHRUJIOTN5ZDMz?=
 =?utf-8?B?RDZhdjBqV00wdmJHOEUxN2doNWZDWG93aDExTElWWlBPNmpPRDZSWHdDYmdC?=
 =?utf-8?B?TlBseWRpMVE5djZjUHRmcmhtMmN3L0pEd01tU1ZJNTlXdEJyeFFnWXRuNWhl?=
 =?utf-8?B?eW1ZR2pUekZEYm5CVk4rMWhQRjJUbU9IMjdnbEtaNXc2SHZxajc0eFNOQ29X?=
 =?utf-8?B?amg1S2VCall1TEwyUFZZd0kyQUkvdnRWcFhMNUtyS2twVVgvYWVtVWZsMjB2?=
 =?utf-8?B?a0tGVUhMUitpak9ndkdrckloQkFKOW5lTHgxREVEd3N6akVxKyt1UjRNMkM4?=
 =?utf-8?B?RmRRT21EMVZUa2ZkSmZ0ZEtESGU3dXZEdDgzL1czSUJtU0Q5alhUSU9CQnFz?=
 =?utf-8?B?VkxrVW5GQWdmb2NwNEhxbmJvL3lDRkhBTlg4RmhtQmI1MEpzMTdhcFRrb0Jx?=
 =?utf-8?B?cjJnU1lmdEdJMmRnWkxYdkdQZnU2VG5BQkpGcURhc0JWZS9pVWxNODlueFdZ?=
 =?utf-8?B?U0p1czYwS0hpNXdpSDVsVlVob1hRRVVJZktJNkxEVEtjcEQ0bXROM0ZoODdM?=
 =?utf-8?B?K1N4T1JzOHFkUm1Gc09FUUkzNnU5WWxzUFBESmRvVzB6Tkd6N1lweld2ZlhT?=
 =?utf-8?B?S1V2cFBkWC9RTXdqK1lXTTZBdlpNek5NdmxQQkpOQ3VsVWNDUWw4YU01Tm52?=
 =?utf-8?B?bGxsRGs3YmNoOElycEYyazVmcERnOXpXaUlDTXBPeXhYeGZ1WGJ2UTVmV1VC?=
 =?utf-8?B?WEdYZG51YTUvSDNOMzJZSkt1Nzc4K2QrcS9OMXBPVm04ak5rbmtNUHU5MnVY?=
 =?utf-8?B?Uk1RS3FqcXRWM1YwaDhkaEtDTGdJLzN4RTNIWi9rT2pHZnlkc085cU5SbzNu?=
 =?utf-8?B?bWs1bmJQY2dyNkZTd0l1K3J2cTNSMlhJcDZXVHJRUEh0RFNvcDRKYkZzV2lL?=
 =?utf-8?Q?P4cq8BFsxqzFQ9C8LGZpE35YnVnAeCQSdwzH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3122999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWFvRG1NRTZ0ZHdxNGIwZy9MNkFVMkZ0QkQ4QzE1eUVKMUZOc1JiMzFSV0Fy?=
 =?utf-8?B?L2x4d1ZxaFJsY1JoV0M4eG1xd2ZSTW91UUdqZGlSa3hhUkZxRW9tWnVZaStG?=
 =?utf-8?B?NSs2eDkyVHBkQlFlaUYxTHJNQmVIV1JLZEszTnN6SERQUFlkYUxBRFUxOGFV?=
 =?utf-8?B?RkNKS3U3Mm1leXhYT0NrOHNTQzc5TE9keFh6UkRGMTliWkVZT3pWZGsrb2tO?=
 =?utf-8?B?dXFWNG9pTnVFdjBVWTJvSEx6Q2wwQ2VZRTdjZURnc3Z4MG5RZEdYLzQ1aHZa?=
 =?utf-8?B?cm1yQnlFTjN2T3BxcTgxU1lCQXg4alJpRWdOQmFTeGloUWY3ZnJCc0RXYkds?=
 =?utf-8?B?bHZ1S0l5VlhTN05COU9ZcWxxTzRhR0s4NlZuU0Z0UGttTHQzb3g0NERZeVBh?=
 =?utf-8?B?emVCQVR1dHFZVHRzKzR3S0EwNlI2NDF2VUV1WXJIVVh4d1dua1ZNQm1GV2Vo?=
 =?utf-8?B?N3F2UXRhWUJPWWR5OHp5cWI2bDVGUXlMdThmMCt2WWdqVnVuZVVhdW9IZHdj?=
 =?utf-8?B?aTladW5TMVBrcDc0aitxUjM5ZDM1cE56Tkt2NVZzWWdNcnVwOUptQVdSemRu?=
 =?utf-8?B?ME94VDczZFVJWlo0MUxHamRqN3pCUkN0Q09RTERUVUVlWmkzN3kvYXdVTG9E?=
 =?utf-8?B?SE1KTldlSUd0V0NCRlZyZDJHcGlyeW5rNFIyVFltYzArbFVYUTVjakJJMERY?=
 =?utf-8?B?MGtpczZWQlJYYmlQUGFaKy9SL2p5WDZqZ0hOUnc5eERiaW55ZDFmb1gyQTBS?=
 =?utf-8?B?MW9jR2kvanU1K1R0NHN4ZzdabWhMSkNISklVQ3A2MXFMVXJzQ1BNaFZjSTJN?=
 =?utf-8?B?NUVBOVNEbmR3ZjRBSDRyT2FKdmk5Nmc5ZlhxYUdoRzlxTmtuemk2dlhlcEpV?=
 =?utf-8?B?QXBqNDBNTkhQUTd1V2grVlUzY1lucGg2OVFxTldpT2poUUVYMFFucXByQkY2?=
 =?utf-8?B?T21Xd2lXN2hYYkU4Ui9RaFVHcTRrcGErWmcrUEpISDk4TVJILzE4Q0dudkkv?=
 =?utf-8?B?TEpObWRxcHZ2N2dMMzgxZXRZdjBFY3hLbWFTdURyOTIwUm1sUk1RUzU4bGVa?=
 =?utf-8?B?MFBSVnF6YUZTcE1XNEsrcjg0QkZ3QW9tVjhNYk8yN0xXNTIyd1hQT1gycWxR?=
 =?utf-8?B?ajM1UGZEalE0WVp2SXpQZWZLQkY3VkVEUTlrdkphUCtXWUM5Qnk1YmQwNnhl?=
 =?utf-8?B?ZlRHUGR3T29Gbml1MFZhTWdXSXZsL2MxRGtwMUFLbkE4WnkxK1YwSi82WE9k?=
 =?utf-8?B?RG02bU5SSWl6UzZFNzIxZHlGemdySTdxWjFXYkVkVGo2dlkzNGRiM2NqL25y?=
 =?utf-8?B?aXE0MlJyUHBUN0lUWDA5TXBucUt1N1Q2aVpQbmp2MWh1aVZMKzFiLzNBUjBr?=
 =?utf-8?B?dXBndzc3dUZqeDJ6VEJ5ZE80bEpEc0xQeFJWdzRXT0NscUZTVVp1bUVFaWhm?=
 =?utf-8?B?a2NxS3ZNTDJhK09DR250TDY2cSsxVXlYOEZrL05oejVMUkpoOUFXeER3WFc0?=
 =?utf-8?B?ZmJFeXJIU2pkT3lkWFRjVFR2OE5lN1YvcWFEZ0pLbVlzZzFpVVVIbndjZzlr?=
 =?utf-8?B?a0hlV0lHUFJxaU1qNXJHVTlCMmk5TW4zejNNcmp1QXhRZ29OaWc3REExZjh3?=
 =?utf-8?B?S3gxRXJHWFF0RjZMaHZNTm5aRm9wUHFsNTZOc2NEeHRQYlpWVS81WStoUkJs?=
 =?utf-8?B?UWRvSkcrODdBeXBmVlV2L21oc1lkWWRpN2xIcHlSQytmaTdPYmJkOVFyYXdj?=
 =?utf-8?B?T25aSXJxcmM3Y0RydXRZWnk1endkd0ZTYXJGQk1oRDA0V3RxdXdyaEpEc1px?=
 =?utf-8?B?OWl5QXZHVE1MTlA0ZVM4RTdYMWZVNldxVUNMTGdNT3lyaWpyZVRCUHN4bVNP?=
 =?utf-8?B?aVdReFhYTVhvb1g5ZVg4Q2xpT29Md29CZXpWS3pyVmhmdEZOQ3ZWNzI3djZp?=
 =?utf-8?B?RVAvVWRGWXZycTBJSG1SN0FjcTlMNFNkNkxqOGJJdnNUNlU1SUdIdUkzVll2?=
 =?utf-8?B?NkZoMGtiQXhUQUd5c1JWOXg5TURMMm5KVVllYXVQQzJUUzI0R3R3S1NQRHlD?=
 =?utf-8?B?UHlLMks1bWFsVEpqQ0pBQk5EMG04WVZUQlBLMnRLV0dUYU15MVgwZlRzL2JN?=
 =?utf-8?B?UkdINitGWHdTaEdWTEpTTnpreHl1UStrOExqczJhRDlQV3hSdHA5VHA1bWZN?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf7aa47-94a1-4bd3-a2e8-08ddfb7b6513
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:02:35.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvkYLCN5EP2+qVPqPIilPxyTfIh04TuftlYv4KqRaJ9yf5BoLDWWKlII62l9E30/OKJBE6AqwxDLcFLfj/zCXKoT7Z5LLt6b0hrF7xzBYZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6992

Hi Alejandro,

On 24.09.25 14:23, Alejandro Vallejo wrote:
> On Tue Sep 16, 2025 at 7:14 PM CEST, Andrew Cooper wrote:
>> On 16/09/2025 9:57 am, Grygorii Strashko wrote:
>>> Hi Jan,
>>>
>>> On 16.09.25 17:34, Jan Beulich wrote:
>>>> On 16.09.2025 12:32, Grygorii Strashko wrote:
>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>
>>>>> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX
>>>>> dependency") the
>>>>> HVM Intel VT-x support can be gracefully disabled, but it still
>>>>> keeps VMX
>>>>> code partially built-in, because HVM code uses mix of:
>>>>>
>>>>>    - "cpu_has_vmx" macro, which doesn't account for CONFIG_INTEL_VMX cfg
>>>>>    - "using_vmx()" function, which accounts for CONFIG_INTEL_VMX cfg
>>>>>
>>>>> for runtime VMX availability checking. As result compiler DCE can't
>>>>> remove
>>>>> all, unreachable VMX code.
>>>>>
>>>>> Fix it by sticking to "cpu_has_vmx" macro usage only which is
>>>>> updated to
>>>>> account CONFIG_INTEL_VMX cfg.
>>>>>
>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>> ---
>>>>> Hi
>>>>>
>>>>> It could be good to have it in 4.21, so vmx/svm disabling
>>>>> option will be in complete state within 4.21 version.
>>>>
>>>> Imo this isn't release critical and has come too late. It's of course
>>>> Oleksii's call in the end.
>>>>
>>>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>>>> @@ -136,7 +136,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>>>    #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>>>>>    #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>>>>>    #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
>>>>> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
>>>>> +#define cpu_has_vmx             (IS_ENABLED(CONFIG_INTEL_VMX) && \
>>>>> +                                 boot_cpu_has(X86_FEATURE_VMX))
>>>>
>>>> I'm pretty sure using_vmx() was introduced precisely to avoid the use of
>>>> IS_ENABLED() here. What is completely missing from the description is a
>>>> discussion of the effect of this change on pre-existing uses of the
>>>> macro. ISTR there being at least one instance which would break with
>>>> that change. And no, I'm not looking forward to digging that out again,
>>>> when I already did at the time the using_vmx() was suggested and then
>>>> implemented. (I can't exclude it was the SVM counterpart; we want to
>>>> keep both in sync in any event, imo.)
> 
> Apologies if this has already been discussed, but I didn't participate in prior
> discussions. Targeted lookups in lore are not shedding a lot of light either.
> 
>>>
>>> Thank you for your comments and sorry for not digging into the history of
>>> the related patches.
>>>
>>> All, please ignore these patches as existing places. where
>>> cpu_has_vmx/smv
>>> are still used, need to be revised one by one.
>>>
>>
>> Off the top of my head, fixups to MSR_FEATURE_CONTROL, and AMD SKINIT
>> need cpu_has_vmx/svm not guarded by Kconfig like this.
>>
>> ~Andrew
> 
> What do you mean? AFAICS SKINIT is guarded by cpu_has_skinit, not cpu_has_svm.
> 
> And MSR_IA32_FEATURE_CONTROL tweaking seems self-contained in xen/hvm/vmx/ which
> is compiled out when !CONFIG_INTEL_VMX.
> 
> For the hypothetical case in which we might want to know the real HW value
> we can go look at the raw policy, as in "raw_cpu_policy.basic.vmx" or
> "raw_cpu_policy.extd.svm". Or what's mentioned in passing here.
> 
> https://lore.kernel.org/xen-devel/a881c6a6-2c36-4e5c-8336-21cd0e14b873@suse.com/
> 
> Forcing the common case to use a helper and leaving the rare case in the
> shorthand macro seems like a bad idea. This ought to follow what cpu_has_nx
> already does.
> 
> Is there a specific code instance in which having IS_ENABLED() in the
> cpu_has_{svm,vmx} macros would cause issues today? While there are some dubious
> choices of svm vs vmx with or without negation, they all seem to resolve
> to correct code, with less codegen after IS_ENABLED() ends up in all the
> conditionals.
> 
> IOW: I have seen fear of incorrectness, but not proof of it. Now, obviously the
> burden of proof rests on the submitter, indeed, but I'd like to know where we
> stand in terms of what that proof would look like. A naive grep shows not many
> sites to check.
> 
>    $git grep cpu_has_svm | grep -v cpu_has_svm_ | wc -l
>    6

arch/x86/flushtlb.c:    bool asid = is_hvm_domain(d) && (cpu_has_svm || shadow);
arch/x86/hvm/hvm.c:    if ( nestedhvm_enabled(v->domain) && cpu_has_svm &&
arch/x86/spec_ctrl.c:        if ( !cpu_has_svm )

not checked yet.

> 
>    $git grep cpu_has_vmx | grep -v cpu_has_vmx_ | wc -l
>    11

Here:
1) arch/x86/hvm/dom0_build.c:    if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
    arch/x86/hvm/hvm.c:        if ( !paging_mode_hap(d) || !cpu_has_vmx )

^ is safe to opt-opt. I've sent patch [1]
It gives biggest coverage benefit actually.

2) arch/x86/hvm/viridian/viridian.c:    *(u8  *)(p + 7) = (cpu_has_vmx ? 0xc1 : 0xd9);
There is strict dependency on HW. In general, viridian should never be enabled on INTEL, for example,
if !INTEL_VMX. So, could be opt out

3) arch/x86/mm/mem_sharing.c:        if ( unlikely(!is_hvm_domain(d) || !cpu_has_vmx) )
MEM_SHARING has strict dependency on INTEL_VMX, so it is "doesn't matter" case.
MEM_SHARING should never be enabled if !INTEL_VMX.

4) arch/x86/hvm/nestedhvm.c:    unsigned nr = cpu_has_vmx ? 2 : 3;
There shadow_io_bitmap pages allocated, page number to be used returned by
nestedhvm_vcpu_iomap_get(). Opt-out should be safe for !INTEL_VMX as nr==3 and
nestedhvm_vcpu_iomap_get() will never overflow shadow_io_bitmap[].

5) arch/x86/mm/mem_access.c:    return is_hvm_domain(d) && cpu_has_vmx && hap_enabled(d);
It is p2m_mem_access_sanity_check() called from mem_access_memop().
Seems like whole XENMEM_access_op (MEM_ACCESS) depends on INTEL_VMX on x86.
But there is dependency on VM_EVENT is defined already.

How to proceed???

6) arch/x86/hvm/monitor.c:    if ( cpu_has_vmx )
This is hvm_monitor_descriptor_access():
     if ( cpu_has_vmx )
     {
         req.u.desc_access.arch.vmx.instr_info = exit_info;
         req.u.desc_access.arch.vmx.exit_qualification = vmx_exit_qualification;
     }

Should be safe to opt-out.

7) arch/x86/cpu-policy.c:    if ( cpu_has_vmx )
    arch/x86/cpu-policy.c:    if ( !cpu_has_vmx )
It is calculate_hvm_max_policy()

Place (a)
     if ( cpu_has_vmx )
     {

[below features have to be cleared if !INTEL_VMX, so can't just out-out cpu_has_vmx here.
  Possible option: remove "if ( cpu_has_vmx )"]

         if ( !cpu_has_vmx_rdtscp )
             __clear_bit(X86_FEATURE_RDTSCP, fs);

         if ( !cpu_has_vmx_invpcid )
             __clear_bit(X86_FEATURE_INVPCID, fs);

         if ( !cpu_has_vmx_mpx )
             __clear_bit(X86_FEATURE_MPX, fs);

         if ( !cpu_has_vmx_xsaves )
             __clear_bit(X86_FEATURE_XSAVES, fs);
     }

Place (b)
     if ( !cpu_has_vmx )
         __clear_bit(X86_FEATURE_PKS, fs);

Should be safe to out-out


> 
> cpu_has_X_Y would be off when cpu_has_X is off, but those shouldn't matter for
> this discussion.
> 
> Am I missing something here?

[1] https://patchwork.kernel.org/project/xen-devel/patch/20250924101417.229108-1-grygorii_strashko@epam.com/

-- 
Best regards,
-grygorii



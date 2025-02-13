Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99E9A33F66
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 13:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887437.1296916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiYaN-0006Wi-HB; Thu, 13 Feb 2025 12:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887437.1296916; Thu, 13 Feb 2025 12:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiYaN-0006V5-EK; Thu, 13 Feb 2025 12:44:55 +0000
Received: by outflank-mailman (input) for mailman id 887437;
 Thu, 13 Feb 2025 12:44:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCGg=VE=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tiYaM-0006Uz-1S
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 12:44:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20629.outbound.protection.outlook.com
 [2a01:111:f403:2614::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51c3289f-ea08-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 13:44:52 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GVXPR03MB10312.eurprd03.prod.outlook.com (2603:10a6:150:155::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Thu, 13 Feb
 2025 12:44:50 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%7]) with mapi id 15.20.8445.011; Thu, 13 Feb 2025
 12:44:49 +0000
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
X-Inumbo-ID: 51c3289f-ea08-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfkwLe36EGHRf8GzP9tpAJLsN6TBzEK2XXtugYoeLSPn+/PtGclija1CgagHBjD34NoIS8erZmEXAnIArDXCcaxnjfE74rUoM3dDUwEKl7rJ7kMWycOrSm1V+IqOilYhUgrdX/4IPFICO49XUEv05aj0hCN92QEZmZjNQyFEALwvdM9aT1kQh6XrvG/r6+1PIt89N64eIOD3uYXci+uKdGpl5YwLhiuLpZ+4W1PoHWirkl59zZt+W+Bu6pQG5jfl5Dmo2fIsZuZ8gM9Drs8QeXB2GbqIOUU67qqlJ1NxNdZThLG5nTWBsSHtXIvVNdVCcKp3w6mXjCFgZ4VD3FYuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiG66uH0/z/6vqrr9eh80FHBTCFe9vyffTGTu5hp834=;
 b=ry7XuQC9qJ2YL/9vyv6g8jqAxSYpEHB6xSP7NU/dN8UDExGqvQ6RSSaqONlYRkAaTDQo8KJp0pHp+TD/IbIxoCe0tzwvXqljPy2j7YVyA2YiVCY5XVTyZnX1e0tK7dmptof+LeDT9efNdfVnCNSyKPuqwk613uSW0TNyJqYPt/a84DF+nER/SOIJtiN3Al3DBRAhrs87sXKzzYWkrmmhy5jTnO0PLK+sbfWX7iyE4U/gPLvoIuyCRR8443sBC2iJHtZaIf0nEaAvNOUE25nO3+GyEhTSeex2NBNkLFBGktNJrCvn3wNt6xHp67VnP/CsNrxHmTe4MBs0FJYgjHZKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiG66uH0/z/6vqrr9eh80FHBTCFe9vyffTGTu5hp834=;
 b=GVd8yX5H4MOTR48rmmi0nKb/DGlKpIao3lGNC1XVB+ozPKkIiazEAnnc3YLUjh6mXFdDK0j4nkDij9bhhS0830Z3iSvr6tB1IWZfYoXB3Ew/zO0J4uyhQ1w3PofrmBFcFkkr/zCLmuf6UNLv5ZXexSLrkMVtX+U7T3mdIXzfsBWqMHrmsibehrZGxyoV2O+U/rvi/2ai4ZsIDSsDvU3Gxh2YvR0h7LK/5kTdzg0Vceb3a4calWuOeCNISy1lV/fKt2YWgGcsVUBFNmJK845fhM9rJjSBOzzn3Iw/qqNKuydyGIkgY4fonrdBQ9ILEWrNZE2NoCDpeM+CPOZyW5c9KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6120fd47-7fd1-4e42-8aa3-3ee858fdc70d@epam.com>
Date: Thu, 13 Feb 2025 14:44:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm: dom0: allow static memory configuration
To: Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jason.Andryuk@amd.com
References: <20250212164724.2575624-1-grygorii_strashko@epam.com>
 <alpine.DEB.2.22.394.2502121407330.619090@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <alpine.DEB.2.22.394.2502121407330.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GVXPR03MB10312:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d3240c-c695-4fcc-3498-08dd4c2c3404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWYwa1EzeGY3V0pUM1JmSFVibG5UUlJ2bGFUQ1JmdSt2Wnlwa09iZVZ3bHBS?=
 =?utf-8?B?bmtINHpkV2RCbTBqVVh5Zi8zUnhpQW8zdWxEdDhxa1FqVG1KSzdtdkRUeGMv?=
 =?utf-8?B?cnV5Z3RFWFRNSGVZazB0eUU3UEowam1XTDJlMEpQaTNpUWlnSDZtYVMwRWJ4?=
 =?utf-8?B?YU9Va25HWVh5eUE4bXhYakFkS0EwcjlLMVVYeSt5a0JTeG5FUU5CeWU4bCtN?=
 =?utf-8?B?RzF4SzloRlFMMURFZ2ttbDhScWZlS0dkMVYxUjAwMUxQZlQ4ekdlVlBiaWMz?=
 =?utf-8?B?OFdpaFpBREdFRThBSlkwR1IxTmhEWFV4S0R1TXNkVUY0amZrb2l0bDAxUlRl?=
 =?utf-8?B?WW1KUG5XMnRiRko2ZnphenlxUndSdEpHTG5LOU5LTTF3eVRzdHgxUmxUL1FL?=
 =?utf-8?B?NFg3akk4UE4rQzJ3Z3FqZjZuK1FFY3Z1THFXQnB6Y3JVeXV4dW51dE4rdlUx?=
 =?utf-8?B?cEdCZm9YNjBmV0xiaklGYmtTalVMZXdpRUJRb29SalZpcmdqck5jd3FYQmZP?=
 =?utf-8?B?NVdjQ0t3c3NvbDlyWTVkTGZQMzMxTmZ2eWxNR1FvSmZRWHU0ZmxVQUNBeCs1?=
 =?utf-8?B?ZURlaHZqYVd5QTFDY1NvNm1iZWNkY2F3b2loL3MvWWZkQXlKS3JSNGw0Qktq?=
 =?utf-8?B?VjBxb1F0NmMxVUZrU3B3YjZMc1dURmZkaFE0dVVKMjRJaWwrTXo4Tm5tRHVG?=
 =?utf-8?B?VjdoSlFVMEFPdXNsT2c5ZTl6aE5HdTZrZ3JZdGZsZmk2bVJVTFhXeXhjLzAr?=
 =?utf-8?B?R0U1T0dDN1J1N2pUTy9uVVltZGt2c3l2c0Zzd2RWWktUVUpUd1pjT0pBZ2lp?=
 =?utf-8?B?ZDhlTnNUQSs1QitwSS9vR1dlMWtzaHdkUlF0WU5qOTc2U29YR3Y1YkE2TUxi?=
 =?utf-8?B?bzVKWmVKWkJyVFM4TFNncnBDWDlnMkc0UDFkY3N0d3l2a1hZWWFJTzZ1dUNS?=
 =?utf-8?B?Qk1GQnF5bFgxdlNzTnROQWh4bXFEa0paZk1KZG9oaDY4NXk0VzRVYUNuZTZE?=
 =?utf-8?B?ZW01QW1wLzBkZUxHRlU5NUtOUFVrb0cwaTZGS0FZV25yQVZxODRTK1Vndkxv?=
 =?utf-8?B?Z2N0bmJyUXZVYUV2K1JERjhMT1VxR0duTXJzbXFPciswajhNUEQ2aU96M0Mx?=
 =?utf-8?B?cDdJYWxKN25zQnBCR3ZidnNkcFdwZEM5VUhvTTlUS0FJTE9sUDVaVFNBUTRs?=
 =?utf-8?B?RmJrcUpWUDlkWHNkTkpEY055WFBDU3RmS21xMUhPNjVwcDJucG0xaGxpZW9a?=
 =?utf-8?B?a3Z5eWg5dVBEb01DNHZNK1JnU1FpSUVJdVNsakxNS2dxWkh0eTA4dkNLQVln?=
 =?utf-8?B?RkwyT3lTMDA4ekFMUnpOclNMdWljaGsxK3ZkaVdlanlOVzlnak9DVDMra1FP?=
 =?utf-8?B?Y0lHRHorMVJqWXlBcEw3K0x6MnR2UDNrdUZLUlVrc2JDQ2dhK08wVGd6dVJF?=
 =?utf-8?B?alZkMmdyOTZENVdPT1l6eTk5WVJOd2dUU3hRdENvQzkwZThhTGh0M0l4eTRm?=
 =?utf-8?B?a1pnMVM4TW9aWnZnSkJVR3d3Z05IclFkYzVmMzdTck9aZkh1aXgyL29SVDMv?=
 =?utf-8?B?SWlrZjVmNzl4bXp1SE5abUpNNFAzRktJSXE4RlV1UVpOUnZmT0ZoOU9wNlBE?=
 =?utf-8?B?eDJOb0YvT1BKVTJySGlKTW1PdUU5VTRKcHVEdHE5NG5ONEZ6TWNLRGJQQXhn?=
 =?utf-8?B?RG83QVNLNGNmakhjR0d6KzE3WXplT3BJZ2xwR0ZEcWhLUmpOV0M0SXNhZFVV?=
 =?utf-8?B?NUhqTUVFY0l3WUd2YzlWZzF2WWtxblZpOG9HTHJhMW1IT1dhT0tpY1FidGxp?=
 =?utf-8?B?My93SWZaeEFZbktrUEFPaEdWUzRJSUphK2NFbWg2dkVIdlNzSGIvbjdObHJV?=
 =?utf-8?Q?Zxcryf5LWHay4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGpTSloydERvd3AzUHJ1RU53WWdWc05HN2dwK3k2ZmwySXVhRzhCaERVYVJq?=
 =?utf-8?B?MkxoVTBXQTBNQy92cXRxVGdtMW9zQ253QmZld09JOFJ2Wmd0RGo4d014ck1F?=
 =?utf-8?B?eGFKUytPWUV5VFB2VjM4d3dzY1d0L2N2V0I1VzFaczk2WmxqSWU0TjNCWVRq?=
 =?utf-8?B?WWs4eUQ4ckdOR2JISy9rbHB0TzNOYkhyMjFmSG5FcE9QZTY2a0oxZHZnQ3U1?=
 =?utf-8?B?YzQ1eHdmUGR4NjNBVWRkMk1ncnpXTjlDTmdBdjdCQ1FLR2NuSXRRYXVBYkFN?=
 =?utf-8?B?WmYzQVl4c00zbTRzVGFDczhZR3pISUt4R1BEV01uT0hjcUVCMG1ZQkNrTEc3?=
 =?utf-8?B?eGo1MmM3V0hpVTZFYW84a0E1dk1ld2l4RG4yQkVIWTlJN0FIRU1nVEZXTDdh?=
 =?utf-8?B?NWxFM1cyY1dHcUwxR1BxS09xb09aY1A3MThjTXdVSTNQRnlmRWpZY25udmFU?=
 =?utf-8?B?eEp2cmpXTlBZckJXYkpSMzhJcXQ5ZkZUanppUEluSlh4VGhCc0V5MEptWVlu?=
 =?utf-8?B?ZUxnTDZaY2o4VmUrVXFxTlowZE5URXRQamI0NDF4UGowUWZIUzlhQmNaT1lq?=
 =?utf-8?B?WkQxemVId3diY3FGOVQxZ2kxU2lWNkZ2NzhSOHNGSXlLTkx2RWtNbnY1YW91?=
 =?utf-8?B?VzB5cTA4QUtCT1ZYSk55L1FHM3RyMVA5eUZSMzdlcWVXdVVFYVovT3ViTFVj?=
 =?utf-8?B?eW9jU3lDWC9EejNQUzJDUDlQWGFNbElKUHpzdFlVdGFJZG9ERlZDcnVBZDZs?=
 =?utf-8?B?cW1QNGJhZ3ViWDdlTWxvWjM2aFpOOXErOHYzM29sSE1PV3ZseFVjTS8wRTI5?=
 =?utf-8?B?UTVGMkFNaVpRUWF2b29jUWg5WWtnc2RWNjA2V1VGYzNyNENVUzVHaHFmb092?=
 =?utf-8?B?QkQrSmpEcVRMUUgxNVJGQWlNVXYzUWJiOUZuMUd5UFRtZ0RCNHdORW5LNDlz?=
 =?utf-8?B?dkw1L285SDZFMVZDZ3BPZE0zNzdDRXdZbGlRY3dXbUg5STE5Y09FTVBKeXZY?=
 =?utf-8?B?Q0ptMHZXajlGeGExd1NpY0dEbzhMcGFsRFpIc0VhZ3lRSnVYeTFiZWN3Z2hO?=
 =?utf-8?B?Y2NtTFNGaXhIUzZFaEU4dktycm9VVS9xVVN6UE9CdjlsMFdKTW1oTTRoby95?=
 =?utf-8?B?N0MrZWRlZmJhWGFqeXJmdnZGUXVjU0EvZ2lYWit0TGJtRTJwaFBsVzZPYTRI?=
 =?utf-8?B?eTlCWTZTU0JSc2t4d0pYSVFjbjg4WFpqQVVOMXlJZlJNMXJaSnJ2ME1XVHRE?=
 =?utf-8?B?S3o2cjVUUFF5TjZ6dW1CRHQzM3FwalM2OGM5NzZNMmVmZ1Qva2tER1pxTXZC?=
 =?utf-8?B?dkVLNklYVXNIZE1rekdSUm4vVFhwR3dLb0RlNFZubmZzU3Z6MFZYcm1zQTNl?=
 =?utf-8?B?TjVjNFozRHRuRjduYi84dU9LUDBmUlJmVHM2V0dFbW1HS2RaY2xmN1J3T0Zv?=
 =?utf-8?B?NG42M1BtU21ISG5RTndVUFhCVmo4VGVyMzhZU2N5aFhYYlZGNlBWVXZ2TENT?=
 =?utf-8?B?WDZoNXdmdU0rSnVOYms0WjBkWFhrTmZxMVVaR1JjZmdaWFhVM3BaSVJRM2Z4?=
 =?utf-8?B?cGdGQkRIWXp4akh3SjdiUE1YWDNjNGwzTzh6NXF1dGw2b2svNkJQVmt4R2VN?=
 =?utf-8?B?NkpTOURyOHEvZ2VYejk1QlppTXBISFZ0Z3BMWDc3Z1owUVR6NGhpc0tEK2Fq?=
 =?utf-8?B?aWJnZFYwQmNtVE9vbGl2d3RNdmM4eS91c2RpZ2h1T0Z3WlZEQ2hWb2QyckQ5?=
 =?utf-8?B?TmNWZnBaY2l0dmM0WEwzTmt4SzIxb3h3WkNsOHBVRU5jLzJ6ck8zL0tJaSs0?=
 =?utf-8?B?bjMwaVBjek5ENVFIZldqYVIyalNVS2d5Q1Y4NS8yL0Q4ZlJGaDhIWW1zZEQy?=
 =?utf-8?B?TjQxaDhWK2pDNHh1U0c1b0toZUNkWkxMYmVhdGFXVjdXaEJ0cGtEMnkrUGdE?=
 =?utf-8?B?akJ3OGRuNitTN2s2RjZxUmc3bit1bDZ2RXhnMlhGc084cVVJS0dxQUJVNFVL?=
 =?utf-8?B?eFp2dnYrc2V1akpJb05vd2QxUnBlVlNKZy9zY1g5RDcydEROVmJ6M0tVRUN4?=
 =?utf-8?B?TmVTdEJPU2pQdDZhTjU5SWtuaE50R1JoZ0VOZHNlZ1d4dWlFNnRyWjd2Z1kx?=
 =?utf-8?B?RlcvYjNubmdMaE9HS1dHOE0vVHZEMFlJT29oSDcySWt3KzNqblZOR092b09v?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d3240c-c695-4fcc-3498-08dd4c2c3404
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 12:44:49.3050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjT49LRfoX0m1A6Dl4DnNnEb+A+Cv0Ku5q0r9UwcangEdLGVpnW+/rcz989MDqZpHKYU+Hpxj0LfE73KpYuoFHZZL+TLcbYs3gUBYt+MzE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10312

Hi Stefano,

On 13.02.25 00:11, Stefano Stabellini wrote:
> On Wed, 12 Feb 2025, Grygorii Strashko wrote:
>> The Arm Xen allocates memory to place Dom0 following the logic described in
>> allocate_memory_11() function which is a bit complicated with major
>> requirement to place Dom0 within the first 128MB of RAM and below 4G. But
>> this doesn't guarantee it will be placed at the same physical base address
>> even between two boots with different configuration (changing the Kernel
>> image size or Initrd size may cause Dom0 base address to change).
>>
>> In case of "thin Dom0" use case, when Dom0 implemented with RTOS like
>> Zephyr, which doesn't use dynamic device-tree parsing, such behavior
>> causes a lot of inconvenience as it is required to perform modification and
>> recompiling of Zephyr image to adjust memory layout.
>>
>> It also prevents from using Initrd with Zephyr, for example, as it's
>> expected to be placed at known, fixed address in memory.
>>
>> This RFC patch introduces the possibility to place Dom0 at fixed physical
>> base address, by checking if "chosen" node contains property
>> "xen,static-mem" and places Dom0 exactly at the specified memory chunk.
>>
>> The implementation follows the same approach as for the static, direct-mapped
>> guest domain in case of dom0less boot.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> I fully support this idea and the addition of static memory support to
> Dom0. However, I would suggest a different approach regarding the device
> tree binding. Specifically, I would prefer to avoid introducing
> additional top-level properties for Dom0 under /chosen.

That's was major point declaring it RFC.

> 
> Instead, we should create a domain node for Dom0 under /chosen, like we
> do for other DomUs. Jason is currently working on adding a capability
> properties to the Dom0less domain nodes, allowing us to specify whether
> a domain is the hardware domain, the control domain, or both
> (effectively making it Dom0). Once this is in place, we can use
> static-mem for Dom0 in the same way as always.

Good to here that, I assume it can wait (a bit) then.

But please note that our requirement here to allow static memory for both dom0less and
non-dom0less boot, so here is the question - will bindings and dom0/hwdom/control
domain setup be generic?

Honestly, for ARM, the discrepancies between boot modes and Xen DT definitions
(and actually toolstack) are very confusing :( And now there is also
hyperlaunch on the horizon :(

[...]

BR,
-grygorii


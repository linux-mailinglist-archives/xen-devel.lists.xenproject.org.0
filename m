Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DD1ADA993
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 09:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016798.1393731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4Qk-0001GG-UY; Mon, 16 Jun 2025 07:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016798.1393731; Mon, 16 Jun 2025 07:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4Qk-0001DE-RX; Mon, 16 Jun 2025 07:38:58 +0000
Received: by outflank-mailman (input) for mailman id 1016798;
 Mon, 16 Jun 2025 07:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJcO=Y7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uR4Qj-0001D8-LQ
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 07:38:57 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2409::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3fc8996-4a84-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 09:38:55 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH2PR12MB4085.namprd12.prod.outlook.com (2603:10b6:610:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Mon, 16 Jun
 2025 07:38:51 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 07:38:51 +0000
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
X-Inumbo-ID: f3fc8996-4a84-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvRu9TFyPKCgnPMeflae0wu0y2Lgb+S4sJq1h2FNBtBPO6/fNR1/kvl3VF83bJP/8DgORSskZWqQEUGimjWy/ssf1mPZnTsuUVeILCy4zum19QNQFNA0Dsnk5jvtYzMT3mNnrflkOQfMEMNC/OGuQHn/kP8tP3xwUZhMXbJUe0rKysu1HRPuhK2B1FWido1v7Vt+i+bBSsojvJM18AuU57WAy16PezB5lSwoLy2hYEoLWakVzX+i+JKGwT/AjOZ7uZnsxxudpwNdIl/By7s7W0qth2iLNZX7LC8ARRElSAkmcD+tRFl1bVoie8Q/spjPqgayR5Yj4jylGjD9RCHxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYPssxpM01uvcl1obr7ERAD+Jpn7E9jmoJc7gDu1iTA=;
 b=E2mh4TfkfdD8oaY+IJtVeUOzueCUniAkCvL5kb7M8WIFER4rH+UNI+1w2V1YIw3vduRo+khONUd8la2NQrl3zmRGgdAN9YDcn7tacN9lLO/itxDEYwcVanY3zIgdeM6K6gQCiKZeHEFBP9gyYDCr5s8DxPXi38z7/mQj4seBQYznRVic4YZxwmHvIS4/yzK5eVSkX9AFdMBT+TD06gizY13X8TxJHGwD9g4X135+0YO+wN1ojeXVXJdqy1byoOVmpfazVxQlPFOZx2Q0+Ryan9n26UKM7g2Vn6j8gNH1XTpT5k9040ZndOFMVOMO4nWM+SlfnSQythZ2UjxYritJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYPssxpM01uvcl1obr7ERAD+Jpn7E9jmoJc7gDu1iTA=;
 b=Ax0v+YRCY4rUvGVL8YBcZV1hS7Dq8fPAz0jQZIKoHA7keqQ2s72cpT7okxbA9QmeJzTdEnUmTUTaIePYlGevmo2+/fMGR9Mvkb8XQNzi4S7JG9Z0iGO1TZWYdakAqBC578OQE1N2kzAYDv+xNPpeVu6K/6xFbNTkDhNz/Ek9mUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9ed81c2c-d9b4-4941-a512-f4785a637652@amd.com>
Date: Mon, 16 Jun 2025 09:38:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix P2M root page tables invalidation
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250616065648.17517-1-michal.orzel@amd.com>
 <51d57968-0060-4c53-9c7e-3cabd84c0a4a@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <51d57968-0060-4c53-9c7e-3cabd84c0a4a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH2PR12MB4085:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b136f4-632c-464e-c568-08ddaca8d6c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWZZZ3hNWSt6ZlRkazRTV3QyQXVXZm1XRlB4aTcxeTZrd29yZmRKWHlBUzg2?=
 =?utf-8?B?amJhTmZ2azBaeU5sdmRHSnBPQkNyYXJBZ1cxejFEd0ZOZ0UvMUcwMVVzMW1y?=
 =?utf-8?B?c1VCMnNjQm56Ymt0OHozK3lZWWRJKzRSR1FMQXJSWHNmbHl0L3l3UUF5NFF4?=
 =?utf-8?B?MXIzUmZOZGFHK1oxTDVhREJqWUlDTngzTnlwdmtWS0lrdFhJQ2FmK25oSTc0?=
 =?utf-8?B?bWwxQTlhTzFnVzFOUkJ2Y0lveW5aNHF4VkZjcDlXUXhLc3pjdm5maTdGc2Zy?=
 =?utf-8?B?UC9kM1NTZ2N1SXhtU0JiWFA4SytlM3hlQ0pxeWVSMHVHYVZIU0pXb2Q3ejJv?=
 =?utf-8?B?TnBML2l3YitIMG5rbW5zZ0RrVkxtMjdzY2UyNlBBYmw5NytOVWk3R3hPTVJH?=
 =?utf-8?B?MTM2RmRFRGs5aW1vU29oRlAwcklreXB4UGRPelFxTHd2OWxQQzJ2eElQTTRS?=
 =?utf-8?B?dXQ3elh2Q0MwZlllQ1ZIQnRKMkRIMHptRkw5SnM2TXNEWk5tdzF3L3RrK3JY?=
 =?utf-8?B?bTR0MDNLUUVkUis1TDVrQ3dNOEU5RHR1c2U3aXgzMEw0aWw1aURQMCtDV1Q3?=
 =?utf-8?B?YmJRcGhnTytwLzlzdk9yQ1h2UnZMR2owa3o1STBoODUxdmsyODEzU29nZHlN?=
 =?utf-8?B?eVpyUXhuRFJGMXl6Wm0rOFhMWDhxS0VFTmpjZzllZEMvRkMzNUVkWCtIVXgx?=
 =?utf-8?B?SEZ6M2M1cGZlSHc1a2dLQUtrV3hXbHliVnhzeGlRbWVqZytydUxBUDNUVzY1?=
 =?utf-8?B?UUh5QXl5amtUOXpKczdGR2txN3pFeFY4TXJDNXhyU3kzOGhSRGhyOGtYSllI?=
 =?utf-8?B?Z3E1SDJnQjVuM2NtTWNOMG9wVFNUcWZobVdZMmhiYkVCQmhldUE4dkpyWmRl?=
 =?utf-8?B?RWNtQzNQbEtjVnZLS05DUm0vSUIrZG5pZmpIckxmSkVkWVpSRGJVYUFzaWlv?=
 =?utf-8?B?eHFYRVNMRHh0K0FNc1MyZ1ZLV2NkV3pVTm8rM0hyVXFxbGlpRlhsVzRQYlFB?=
 =?utf-8?B?TnBucmZLeDBSa0s4cGFCRTdheG5YZHR5N2tJTktYcjl3WUdLR0cxSGxZTHo0?=
 =?utf-8?B?bDBXQlp6alA5SFpOU0ZVWmMyeWRNZGM5MG5laG5aaG9TZUFiV0hqVko2czRl?=
 =?utf-8?B?MUh6TElEdlZmZ1FuVEdSR3dGQ2l5T2N3NmZPU1NHU2tyUFAwbHFiRXhuQXdC?=
 =?utf-8?B?NjNKc3I4TUc0VC81ZVVuRncyUGU5R1ByZTVKbmo4aEVuMXdEQXR5ekNTc1JG?=
 =?utf-8?B?MlAyZ0U2K0lsVjBucG9ialR5bW0wd1RwSjdjYWlXWWo0Z0tYWmlTU0VORkVj?=
 =?utf-8?B?TDJKRjZxb3h4MWxYd0E5c2RmVDZPMTVyUTh2OFg2czREdzc3S1JRclhtekdF?=
 =?utf-8?B?REJZZjlXRktBeU05NW5NdWpqVVFzRnI5cUNDTnkyZXgwVWFhZG5sRllvOUhJ?=
 =?utf-8?B?QS9jSFZMRkU0NzhQeXFDLzU1UjV5SFNzR3VGK1VzVlhxaUh6NDJjTm5UbE04?=
 =?utf-8?B?NTRUMFN2cXgvbVpsNU5qT0QwcEtrQldVNGpwTStTNUZmbTVXa0RrZ0tYR05q?=
 =?utf-8?B?dHJmeHVSWGFvS3NoZE9ZSnMxb3drUWdmc1lOdFJWUC9Wamk2YnIxTjFZZTFj?=
 =?utf-8?B?N2x5RGtlK2lBbFo2OW42eStFbkQ0bmltMU1QUUE1L2sreTJDa2dkZ1ZtTXZK?=
 =?utf-8?B?VFk4ZzAyZFBVODVEdnRzZ0N2ZnZOVUYzdytXcmZOZmZ6MUI5eW0yMEprVG9k?=
 =?utf-8?B?WElSVEFnMXhPUHovRUtsbmhKWko2OTRFWXZ1aTF4aDI5WWtyYVJXK0dGWHRv?=
 =?utf-8?B?a3VnVnJXa1ZOVGJYdnc2bWhRZTd6dGdIUWZGN1dXc21Ibm1EaEo4NWQ0bDMx?=
 =?utf-8?B?dWFnQ2pWRjB5VENubFlYZzNkanUrc2xUdXg0NHZoZERHaEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkViTnVneGx6TjlBRnBGZXR1TFZKTzRrWGZzWjVabGY4SWdFL2kxcVpBYkE4?=
 =?utf-8?B?SlVGaGZUVXdwUXdHcHF2U0s3dEZaYnMzOUdPTHVFaVVXUXZGTzJxT2lhR00x?=
 =?utf-8?B?cTJSSXd0Ujg4emFQbHV1QzliRW1sTHNUSmpKK1hTem91STh0bjZhSXU1b1ZP?=
 =?utf-8?B?c2gwYVVNRXhsQlNnWWtKakhzRzY1ekE1UGRNWUNVY1pGanNkSFdHYTdNZ2JJ?=
 =?utf-8?B?WWQ2bmNLUFhmaG4wenlUTmRSSjJDM2tpY25UM1Bvc3RFTmdPZGxrZmNPV01I?=
 =?utf-8?B?NFVkdXVEc29TYlZUTXlQSjZUMnl5V01jWHVSSDJEaDEwa0Fpc1lCa3BsN1hJ?=
 =?utf-8?B?SWdSVEttUVVoYWI0UzRyeWlPUjVEc09kdVZsNFJYcG40Nk5aWVdiT0k1MUtW?=
 =?utf-8?B?RTZZbGFqN3hWeUdleC9qeVlPaHkzZjRKdXozdzNOWUY0dE1VQ2o1V05qRHRn?=
 =?utf-8?B?YklsL1JYUlNpSlJWUmpMREpUWUtVYjI3MXhwN1B6NjM1TE5nRS9GMU9oNnZL?=
 =?utf-8?B?UG1RVW9VVjVGRndLU2FsaXBRaHcwTU9QZHZ5RkNVRGlUQ1I3aG9HQ1BkZCtL?=
 =?utf-8?B?RjA4ZllGZXZ2dWVPN0FJbXNIWFZtdXBsZ0hwOWlFZGNYM1d0Qis0czZSWWMx?=
 =?utf-8?B?S2pUZ0ZkZGlyb3p5aFRMUzdzbEY2STd1cnRmcUs2cUpJOFpEOENsOHZOVjEr?=
 =?utf-8?B?ZWhrZzhsUjMrcFlJRElmbVE2RllsdE5BZXl2OFJLYWRyRlN0b2h5MDBQd3BE?=
 =?utf-8?B?WFpRcVgrNEtiVHAvQTlVd1RuUzU1ZU1waUhQVjRnQTEvNllLWURYOGY0WWdy?=
 =?utf-8?B?OUc1bDZBbk1nRGh6bkFzcGNFS0JWWWJjVVgzUTdFT1BiKzJEM1dodXhBVXRW?=
 =?utf-8?B?Nlo3Y2F2bHZTQ3BBWmpGWmtVdUR5YkY2U1AzYUtUSzdLbC93MjBkejFUUi9Q?=
 =?utf-8?B?VVdhZGxHOVRUS1BVaGJKejl0M1RCR1VaYWo1WWVNcHViNTR3TUNOZzFndHln?=
 =?utf-8?B?MjArU01zR01PZnZFUS9qR0RaeTJJQW9DM24raEVQSjc0WkVrZVFWY1VLK0sy?=
 =?utf-8?B?ejZhVlkvbTdSL0lhZjhTejMzOEREWXFDRW4xWGhZdFR1a0dXclV0L2s2YWJN?=
 =?utf-8?B?bWwwWnhIZjBCLysyUnBDazlVeVJUb3YrNHdTNnpmK0tUY0R6K3N6Ri8zcCts?=
 =?utf-8?B?MlpPTjBGNjlnZEFBaGpOZDBKVVdGcWdURDRXcER4MFJPZFdJRE1WY0owVmoy?=
 =?utf-8?B?QVVrR094bjlHb0E2cHFzajdvQ0hJN011SW9oVmxMSEdrNHlPRXo5VDlYYWF3?=
 =?utf-8?B?Y0hBTEplQ3BhdGo0bFJYN0FuZUZEUDc0cjRQSGNYb0R1Mlh4R24vcXlrWXFL?=
 =?utf-8?B?K1RyK21wYVIrLzMyRnZ3TXNkSktXaG9INS9XRldoRDFhaXYwV2kyOC9vK0ww?=
 =?utf-8?B?Zk5uQmFDQ21qSU5DdWROa3FrbVNvV2dvV0hwaktSLy9Zak44MmZydjRMbzFK?=
 =?utf-8?B?WTFYSTl1R3ZadmlmT3lWZXIrSVhBVTlEVDBjZm5uVno0TWU0NkFWTkZweFZz?=
 =?utf-8?B?WkdQdWxwVkhZR3ZkelJBdklQS1lLTE1BRXdWdER5Sm90c2F4NUd3cjNOQS9O?=
 =?utf-8?B?QUFhNW4vRTZjSGY3SWk2L1RYTStqZGN0MUZPSGxqdFR3ekw0UEZOM2o5bG8w?=
 =?utf-8?B?dE1QbzNTOWpocjNUckpBZGZudVVSaTZ5YWNzeE1KOEVUUWQzZzdDM0xaRXhP?=
 =?utf-8?B?SDFQVDNOUFk4UGY4eTVqRUk0bkIvV0pzNldKV0pLbFBPQlUwOE96c0ppVWlp?=
 =?utf-8?B?N2IwcGhmM0hrdVUzZXJJVkxrYk1GMktIYkdUbTg5ZVNmTDk1S0h6VmZTb2Jp?=
 =?utf-8?B?QUZlWHkwaVd0V3Q1YTNYZkhHQXlrZGpPOU1lcG9BaGZObk9VSThtZHhFa3E0?=
 =?utf-8?B?bkNTYVNGVHc1L1lSaUlHb1hYYk45UkpHRkZ3RlJZeUc5MmNzWk82TWFJcEpx?=
 =?utf-8?B?RS9obllZTzdWZi9uWUp6L05Hd3FXWnl2cjYwYlVHM2JTZDNRa1JxRVNyRVA4?=
 =?utf-8?B?UkdncWYxUS92am1vSUJHMm43SkRRN0t4WmMvMVpFMjRHem1lQUNVclkwM0lt?=
 =?utf-8?Q?mJrE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b136f4-632c-464e-c568-08ddaca8d6c4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:38:51.5790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFAFDJVODt+eqv0QO4Fpom8h/qaY/BGRSAL2Y4nZ5TNF7vegqD/8Ey26125UNMxh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4085



On 16/06/2025 09:35, Jan Beulich wrote:
> On 16.06.2025 08:56, Michal Orzel wrote:
>> Fix the condition part of the for loop in p2m_invalidate_root() that
>> uses P2M_ROOT_LEVEL instead of P2M_ROOT_PAGES. The goal here is to
>> invalidate all root page tables (that can be concatenated), so the loop
>> must iterate through all these pages. Root level can be 0 or 1, whereas
>> there can be 1,2,8,16 root pages. The issue may lead to some pages
>> not being invalidated and therefore the guest access won't be trapped.
>> We use it to track pages accessed by guest for set/way emulation provided
>> no IOMMU, IOMMU not enabled for the domain or P2M not shared with IOMMU.
> 
> IOW no security concerns?
I discussed this with Julien and we don't think there are any.

> 
>> Fixes: 2148a125b73b ("xen/arm: Track page accessed between batch of Set/Way operations")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Credit Oleksii with a Reported-by?
Sure thing:
Reported-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~Michal



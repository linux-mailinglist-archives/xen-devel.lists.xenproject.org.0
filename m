Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD32A68C1B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 12:49:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920348.1324549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turup-0008VU-44; Wed, 19 Mar 2025 11:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920348.1324549; Wed, 19 Mar 2025 11:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turup-0008Sy-16; Wed, 19 Mar 2025 11:48:55 +0000
Received: by outflank-mailman (input) for mailman id 920348;
 Wed, 19 Mar 2025 11:48:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAjd=WG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1turun-0008Sq-IF
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 11:48:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2416::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f8e2619-04b8-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 12:48:51 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA1PR12MB6332.namprd12.prod.outlook.com (2603:10b6:208:3e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 11:48:47 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 11:48:47 +0000
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
X-Inumbo-ID: 1f8e2619-04b8-11f0-9ea0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZIinYoN3Q0UtdgBa1JRZHjNrIRI3j+8P4OUtrqp8afcN+nRi7VUJUe8qVHzJnSqMXtPnv9VS5+GjVD8bp9Grs+/7fJ3GRL6SO4xZS/h0zP0qvBV0DGRrs2Lf0/HJuIMLcZ9mTqkBgC4TwBvRHttUpa9rQUq+JyzQWOSicKMzB9cjWtBOA57eVqfJgJJ+v+OGYdr8CNZ7NL2LujDuBIKYkIUrgsBQ2VXqBVP4qvHhvlAMvrR+OfyQaMh3ugcSfOJ7/EtK+JSN+nsnDUEoe8vVXEcybOelZcOWyfKBBzQzNsFI/FWlzKL0efOlc+o6diOZ/W0vkw+lNsb7pogPPchCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaUxsZV2Kqkz7OapRlotvfkUK3nXafZqZpX9PagiCrk=;
 b=E13RvvvfZMoSxQ0yrcpJ1PwBKuKLTjtc5bkV5pdZzRbgf1V6aXaIzfotGZiO/7D+5J1dQRYKF6wdW6CrDjmxaj+Y8xCzkSJKzCSn/LrnjcU8btjFrCHEL4vwxqWJpMym21mzRTs4ovMxRx1eFSkQP2Yp/+dB98SonBly5yAjukaGUnTj43Qwq5ZIWuA0xF12E1jLLU3TwIr8LqIFOCJ6Rdqaz7Ns84hweCdGXSLRWMC492SDDh7rGIBU9QPnZcc0bTBT4TFKrtPHjZxfTfwqOM5MDHQZ/dHkhBlExX6mQ1frQyUll1GVK6JLtUwYl/ibqHGbQVOJLNfhRp/myy+1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaUxsZV2Kqkz7OapRlotvfkUK3nXafZqZpX9PagiCrk=;
 b=MYnmTrus27npYFvNJXu8hP5QUdYCDO74qS4IQ4+tRSO8EQEfWHi/EjsImhJzu6m+Bl+hTCgITcoM7lGgT4t3HJBdLR2C01aacpDy5K0uYxFkW23xF5ptdBOR6YFaag/AfBkJiNpexeLmhIUTKV9vgqbnh+G5SwsSKCS+n+NtyNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8bd1efae-cd39-4e6f-9194-80d7f6cd22e1@amd.com>
Date: Wed, 19 Mar 2025 11:48:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm32: Initialize MM specific registers in
 enable_mmu
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
 <20250313182850.1527052-2-ayan.kumar.halder@amd.com>
 <cd2526bd-9dfe-4c74-8083-0bdbadc42ec6@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <cd2526bd-9dfe-4c74-8083-0bdbadc42ec6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DO3P289CA0013.QATP289.PROD.OUTLOOK.COM
 (2603:1096:790:1f::16) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA1PR12MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fbacf42-e4d5-4853-e74e-08dd66dc01e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTltbGhPSitHOG03amVGVlRYaDN3UEhBZkFpU25uNU9oYXVRVGJVM1RrcFJI?=
 =?utf-8?B?TWw0MDhXZkhkbFFtdWdVazJWWW1uR0FSRXRacUhhdi92RHhWTVJwV2VGd0l1?=
 =?utf-8?B?eWhHM2trS2RGQTF2eFpWYlNmNmdQSkNnWXprNjN3OWlSSldlNG1sWk5xek9m?=
 =?utf-8?B?a0U4K1BZS254TExYbmdCbzNZZ216OTd0cnEweG1QWWRtR3RGa0hEZEVVQUFQ?=
 =?utf-8?B?WmZjYXZ5dndDWm5ESzNHVjVNK3lKUXZ3SjlKNHJJM0ErY0F3VFBiVUVRUGU2?=
 =?utf-8?B?UmU0V3Z5ZzZlV05lQW9TNU1aclp2L3NvZHR1K1NWeXI4MXBlV1JsZ2o0RTdr?=
 =?utf-8?B?QXhpNGhOeDU5Z2libSs5YmRwOUhISEhQU091ZlI0bzlDSXJzcTIyeXZJWGxQ?=
 =?utf-8?B?amlmS0pZVmczVXNQR05mcmN5c2VLaEk0ZmdSWFZIYjBLSFg0bzFUWXRjOS8z?=
 =?utf-8?B?Syt3bGwrSEVFaGZMQzd3cjFadnUyUVpSZWZKMTVVQWpOeklrQUtPektJUmhX?=
 =?utf-8?B?OTd2eVI1TGl2djNsWDlFalJZSE1WWS96S0lhRlFBVUgraGJ0UHNJMWtHcGFP?=
 =?utf-8?B?Nk5Xa0pCTkloUnRUOEQzWEFpdXhER21NTEFUZjhxVmVEcjRwQlRVa2JDb004?=
 =?utf-8?B?QnBjTVpGekYxTWtkbWNQYUZnMUVjY2tHZU1ZcEFIdHdiaVB5RDdnd1B4eFgw?=
 =?utf-8?B?NS9JMDFTOTFQMk5pZU93L2JtK1dpV0tlbXFDLzNjMjRQdVpSV1FQNW5acU9Q?=
 =?utf-8?B?dldzVnNsY2lLZnZWbGp4UFVLR2R3aW5IdlUwc2gvSGZzZHp5cVdEQmdlck5T?=
 =?utf-8?B?UUtWcCtZWG5OendVNGdGcENSRlB3Ui9yc0piYVhBb1ZVbFk0OU4rOUJYMENI?=
 =?utf-8?B?L0ZidGorYW8rVjI1T01hWnRXKzRQUllOSGNYUXVRcktCY0FNNTNGTGQyRzN5?=
 =?utf-8?B?RkpCTmJtVlRpN0k1RFJQSnpuSGN5bDFzd0tBTUZkeWprUFNacVROTHNDNFpZ?=
 =?utf-8?B?TFdtRzFtR3h5c0hvQzc3aVk0emhmMWpWSE9lRENhd013bjMrQ1ZVKysrblIr?=
 =?utf-8?B?bjFUQy9sVTJ1M3Voa3BUNlc0TjRsN3RLV09OcWEraEV3ZDVWVnN0aDhYZDhX?=
 =?utf-8?B?WkdwcXRIaDZIT3hYdVN3eG1OclBHTk9ScVVsaUU0Rk5wR3hsWWlWbzJ6MzRY?=
 =?utf-8?B?Z3FaSzUwelNwTHgwTXZYUlFqR3F2Zm16c0ZYdUQ5OWVORDNWZWIrVGNMbEVY?=
 =?utf-8?B?dzBxaXFXc2RRWXdBTmNodWJUTmRIYUpvOWgzZTA0a3VSUFhlTkFTU1lDV3hT?=
 =?utf-8?B?TnZuU2YvamlKUHFBYWt0Qm9WaURNOWh2N0p3U3RZWjczNlFLTEhLYWFBWHJG?=
 =?utf-8?B?Unhua3FRYm9ScnREdHpuM2tBU1M1YmZlY0ppVGRZTlRPM014YldIWEhuU2tm?=
 =?utf-8?B?M2J6bEZnY2YvWENmZkZ6c3VSUXpnb0MrazF5TloybzcxY0ZYNjhybVplN01W?=
 =?utf-8?B?RDYyNzN5K3JBSmdWTmlla2ZRMnYrTkdGTzR6M3IydEQxTlRCOTFGbEN4SU5N?=
 =?utf-8?B?U09vNGVmWW10Z1UrVEplMTgvcklUUzlyWC9qOHVuSDV0TGlXQmpVU0pKdlB0?=
 =?utf-8?B?Z2RSRWJBK2kyTExvejloRVFtb0lheWh1bm1NN29FSm90MkFndDY5QjE3K1NZ?=
 =?utf-8?B?NEZkcTVUamZybW9oeUN1RTl5MEc5UDFVNzVNUExQUGpQUk13aWtwUml1MVRD?=
 =?utf-8?B?QlNVMkd4anlDYU5VSDdhNXlsemNKVjl4MjhZNUhUY1hka1BhUldZN01haWpz?=
 =?utf-8?B?VUZudUxoa0xSUUFXSGgySmRwVFdTQnZhTmlhVzgxeFFrODRrUWt5OTA5elhy?=
 =?utf-8?Q?2W+zY3Y4jeqD/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTB4cGhjK3hNNDdXSFFJZlVKa3R0R3VJemR1MlNHbDFqYmQwZE1tZDhXZzBl?=
 =?utf-8?B?SzF5aGhhZjZBdkowSlY1RzFFN21MY091Z1NyYzROajErRmpmcVJTTnZZSTBQ?=
 =?utf-8?B?VG8xcXIzVjRyeDNjRHkvMUxZVUFJMm1IZDdwS0EvOHdIYVJtV3F5YVYrd2JN?=
 =?utf-8?B?c1l2SncrMGlOaHhadmZIT2QrYzlFOTRpdUpYbFhZYVVpMTNiTkl3Tlk5MGJx?=
 =?utf-8?B?TXRCL1NVMjNXWHFqb2ZoMFNrd0tRQVgyZlF2T0pTMzZwMzBQMFh0c25iV1h6?=
 =?utf-8?B?b0tCdWVnM2lUenV6TWJOS3JpVlZRSDhmWEtKMzRVSU53U3RqTldsOHY4Yzd3?=
 =?utf-8?B?UEtzUTQ2ZTNXM1hZSU8rZnZ6dEY1OEZjQ29CcGh6bzYwSEFXUG9NZ0FCbEFZ?=
 =?utf-8?B?dllJdXpydlN0MGZlL3Y4ditlb3RhU1YyUU9VaTBIei9wODFXRVUxVWNYUXRw?=
 =?utf-8?B?Vy9lbUNOZHhQQ1JxeXBNVFQ2TU5qMzZpOTFxNENnM2NUd3JPeFBPcHh5aHF3?=
 =?utf-8?B?NEtSS0cxajdwTFlPWEVGaEtRNSs4TGM1a21POUpNOGtUYlh4N0pNL0tHZzBJ?=
 =?utf-8?B?UXVUNm81ME5yYzJTaHk0Z2RLd3NaLy9KTnpIbzJjZlZXQWViMy9wVzQ2Q0ZO?=
 =?utf-8?B?dUVOOGY5Y0E4cGU5YmZOc3hLMmNZdTNFU3g4YmhpWFB1eStzNDFIUDBTK2xo?=
 =?utf-8?B?Rm45dDVXR3BRblRvT0VFWmVxTDdBbVF3RWlxdlFWODk1RVRzVmRoNTJPMHkx?=
 =?utf-8?B?b1pUeVdiNDZmaXBidTJmVWtHQkgzc1MweExIamwxTm1SRzl6Z3Y3aXhFaUpC?=
 =?utf-8?B?bjFvVlEySTk2Q0xwQTlUTnZrOTdXK0lzS1cybExESWtzc1VueDZBNHFnbCts?=
 =?utf-8?B?NjV1S2tMUXhTcmVxR21VOHpQTnRscUwxNGU0cDg3NGlhLzRzT1B0VWpoK2ht?=
 =?utf-8?B?NURhdEk4SHNVNUV0eFMwSEF2NGxKZXUzdGo0VGNQYzFTYVpXM1d5S081aDVu?=
 =?utf-8?B?ZlB3UlNSUjRGb2dBQVhsZ1BLWjVTVDRkalo4dzdrTDVackk1cldac3NMV2FS?=
 =?utf-8?B?Tmk1WlpvWVNranl5QXFaSXdwK1NNSHo1WTkvcEhQcTcvcUV6VXp4RXVqVG9i?=
 =?utf-8?B?aGxpdU1UL0xlZ3ROcXdJb1F1NUc3VXptZnhPZ3dyS2M3dC80ZnI5bXRUMDE2?=
 =?utf-8?B?dTF5ZjhHYVdGaW0vUEZURGhoRTVGNUxMc1BXY3drbysveGovK0NRMGJQczJp?=
 =?utf-8?B?VHR5S3JaT3JqcExDek5hYWVqbTZUc3RLSm50OXlJaDBSL0o5YldKT1ZlMlIr?=
 =?utf-8?B?eGkwa1NaMk02NW1lQmlMZmN2NmVsUGN0UEpkSW5HVGVNSWkrTDNSUHZCampp?=
 =?utf-8?B?RlEwQ1Evc1c0Q2ttaXNBZ0UwUmdTeERKbjhnaXF6OXpiYnVINVo3UzR1YlIr?=
 =?utf-8?B?Y0NRb2JLVGlXcDhuWXh3SFlOaHhSWUNodE1lK1F2NE5DRHRuOC91azdDaUFl?=
 =?utf-8?B?Vi9RN0lBc2oxMkYxeXRTM2tvODBFUjVBcTVvUGdQanJsZVlMZnVMcWtWSTRO?=
 =?utf-8?B?SURPUXRvS04xK0piY0R0S3QvOWQ1bDU4WEl3blBYeDlqV013MG1YRXY5ZWRH?=
 =?utf-8?B?dGh3cnVMS05ZL2NPRVNtamcvY0c0cFo2Nk5IVGFZZXBWWk9kNFFON2hYcXpk?=
 =?utf-8?B?ayt6Wm1JODV5MXpUVG8yWURCeUxhTUZTZTk0WTFka3V4ei91QVFMQ0NYUGZK?=
 =?utf-8?B?bFk2TnVGVlFXVUo0dGtVQnlDWFYxL3BTeDJxdG1KSHBVRGFNVGRGTjY3VjBK?=
 =?utf-8?B?dW9wY2svWjVQNTk0WE80QkU4aGFVRDc2VkNZVng3dnJHK0pIK3J1R3VIUlpp?=
 =?utf-8?B?YkFkMy92NzZmY0ZDWExpOFF3WUtIeDZuQ3hjTEtteWdZWU1xNW1RMVpKVzd2?=
 =?utf-8?B?L3liWm5jN1EvK1kzelVuYlVNNW5CVXNrL0ZxelNWcUdERmkrY0hjRCtFN2tF?=
 =?utf-8?B?clZmbjhtajl4RVRRdjN1S3ZaOGV5bDl4MzlGcHVRck1hK05UQ1JjWjlKenUx?=
 =?utf-8?B?d0F6V2FuUXhzQXlIUjVCRU1WY1hQVHpaRVRGekxZblN1bjJCZmZXRzRKMkxW?=
 =?utf-8?Q?qPbBXuwXZQgO7kHiE/ME/coZZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbacf42-e4d5-4853-e74e-08dd66dc01e1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 11:48:47.0912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RU9FUUOAmBnWvGDWEiOrFKM5/bMBvISJZ18tXSR+Rq8/nOwDem1auGqz5eoN/FrGFPa1kH0Rdpl64OfNL25+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6332

Hi Michal,

On 17/03/2025 11:40, Orzel, Michal wrote:
>
> On 13/03/2025 19:28, Ayan Kumar Halder wrote:
>> All the memory management specific registers are initialized in enable_mmu.
> The title is a bit misleading (description does not help too). It's a pure code
> movement, yet it's not mentioned at all. This can be fixed by changing title:
> "Move MM specific registers to enable_mmu"
I will fix this in v3.
>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> With the title changed:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

thnx

- Ayan

>
> ~Michal
>


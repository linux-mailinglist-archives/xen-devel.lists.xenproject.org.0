Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA2A4DD9B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 13:13:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901038.1309018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpR9G-0006DJ-Ig; Tue, 04 Mar 2025 12:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901038.1309018; Tue, 04 Mar 2025 12:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpR9G-0006AM-Ex; Tue, 04 Mar 2025 12:13:22 +0000
Received: by outflank-mailman (input) for mailman id 901038;
 Tue, 04 Mar 2025 12:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XUS=VX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tpR9E-0006AG-S7
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 12:13:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2412::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d6c4e0d-f8f2-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 13:13:17 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CYYPR12MB8872.namprd12.prod.outlook.com (2603:10b6:930:c8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 12:13:13 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 12:13:13 +0000
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
X-Inumbo-ID: 0d6c4e0d-f8f2-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axa8aDI0yrjKq+EYEeQiSJcBLjBoNlEJUeYXNHPxAf2vbc7jw2oZbffeCYOxms6MmR99BjvIPPgzr+ymHlU6e2Zr/mZ5ahba4faYXhHQV5oejvNOWaqE5MJdMceW0hPoTJyDJq4oJ8jEXJrA9KncX5SnESc/sxvaNznythEjLoofRpUySpm89FMUYg4Nhw3CpAIg8TQZfLXNpvExyDAe9H8JlAbl6vhpvgT20hC9aICpQGy5CXqOXJEAGKN0ah31RoAOPJSBeOvyMqFvgkllcG+3x1DDswv41EbNHW/kQz+3MMkfdKf2JEF1ai/pxwCBVHm3w12cfmTf0Bnf6RHvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+3essZ37Cpxt7Jm0bTbt18HNALTbquTbV5uhEl/P2s=;
 b=KAZLKgBxe+p65towoNolkOPHqIvVKTDYsvKb1JZ0tyQva5PA4K/UK3KsP+nQZ1x1Yk01ykU30zHrlz1arC1Kfrx7q7pRVeKQPwaebvrKzWGWXTGCOaiVzqv7zlRFR7RFovtjzz6r8ctxPsSPmhSi1FOzySyDA/RDt225pdPebUNq+IXkFP0k/gLa9zLYCGIV5HQ3zKcv9QkLoqLheOfSKN1K7q/OtVitQuZ9EM4crOrB86amRuU2e3pGy2Nfcn0a2ve/IWT9fuBMN6b7lSFUlvIf6OOmkYGDQZEN6L2f9CTGTkVvYacnMKfIzHguzETLSParzYlCa1IoHLdvjhsNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+3essZ37Cpxt7Jm0bTbt18HNALTbquTbV5uhEl/P2s=;
 b=N1CD6K6Skp1qmnK9TyDK4qDJCHhgDclO8GB/j7KJOSpil/XVdLLvBlQvxRG8QVRRRZCrgZy4o0dYG2tX9ZgUjZMZPN3KgoEk18xz699/lQ1CsKhegZ+5w3qZvsb4rJqGBiX7Q349kOdeEM0wgVX+PO7ylZbQnJ2wFNxWXa2NLe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3a2051df-7669-4d0c-a974-699e3026f98a@amd.com>
Date: Tue, 4 Mar 2025 12:13:08 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm/mpu: Implement early_fdt_map support in MPU
 systems
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
 <20250228161817.3342443-9-luca.fancellu@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250228161817.3342443-9-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0274.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::19) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CYYPR12MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab8bef7-f3f1-4cf6-b7e4-08dd5b15efa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXoraGN6cmxVSUxhb3BKeVUwcmJIdDJpRDZHejd4R3pnWitvSk8yUjRlUnMv?=
 =?utf-8?B?dThqMlcxaVByS0o2Ny82RThtb3Mya0F1MDNWVnZCNHBwK2FNeE9CWE10QlhT?=
 =?utf-8?B?Z3hLQ3R0Z2NGRTlBcTBpRWt4elBjRGl1M2p0Y2VqQ3dTRFI0SDMyT2JWUDBO?=
 =?utf-8?B?SlNobzVCbTlvd2VlVWUyUGFEcHF3cnBkMTVkOUZqSjRjVTVtYlJlM2pwU2No?=
 =?utf-8?B?MzBxVzgxMDR4Y2Y4Q0RoTnZHeVZ1aDl5Q0pLU1h3MTFDVmNwRnZieWY4Q2ow?=
 =?utf-8?B?dCtzMGk3SnJmQW9tY1hmcDZtTUNudzVUbEVpNjR5YnFvcW1IY21jSFVTYmhQ?=
 =?utf-8?B?bkNBYmR5K2pHUDZkVzMyb2dqREdVY3dXc0UwVTZzU1N6STR4Y1N0YVdtWWdT?=
 =?utf-8?B?RHRQaWR1NDJldUZ4LzlVWDlNUmJqUTQwSzBBUzFxektWdzB6NWNCbHRqaFln?=
 =?utf-8?B?aHpxUHRhblhUTzFmQU9GSzFuVTU2RXI5TmJuTU9KeWpHVjg5TU1KV29ITE1Q?=
 =?utf-8?B?Y2lSM3BhTDJsQ1NhWnV6QU9xK1VqMzlyL1JYSDE0eEdsUHlLQ0I4R3pXWFNh?=
 =?utf-8?B?a2pIQXdxdG9mcEwydnpwQSsvam9GY0s5aUx1WkE2VVlMUS9DK1NzR2lQcnpL?=
 =?utf-8?B?TDZvcDExcytkQ1BNZTZZV3ZGUGF4bkZzSGYremRIY1cxbFdEY1J2SGhtdXcw?=
 =?utf-8?B?Y3NLWkJDMnFOdHMxM003TzF0aENQZkJiVDRoWkoySXV1bmYvT1BLdWd5MmZJ?=
 =?utf-8?B?VTlLOFVsQkdTS1BjTHFrOE5tdHhqa1dJQ0M0b3NtUUcvSi9JdFlaRVczYlFN?=
 =?utf-8?B?TDFKRXB0bCtqTEczOEJRWEI5dUVjdmRGNjhJQ0NaQ3FubE1rNEVPWDJ4ZzNW?=
 =?utf-8?B?Witybm1CeUxvOTZTT2xIc1U3YnVzSERsL2tqTVlDNWtTUThvSDQ1SVhDUDNp?=
 =?utf-8?B?amQ4ek0zL21kMEJJVTBGMDIvZ21IbTZmeTRobVhHWUlqZ25vRFdoalZYNVk4?=
 =?utf-8?B?amhFZWR5eGxYRDdLSStmbVlwSnIyUjdxYXR2KzloV1gyRmtMM2NyQXpMcVNE?=
 =?utf-8?B?VzkrNUlqb0hJcUJQY2lYcEJGQmpYVW1BS3BmcFJPdkJyWDRPbW90R0hZZjU4?=
 =?utf-8?B?ZjZHR2NEdDhKcGxudDhLTmQ3VURSNHUvanRDcGppZE5XeUZiQjA3TGhCUkxD?=
 =?utf-8?B?R3JFQTUvRlRKRFN3VDFJWUE0RFJXV255MTczRGhVSTNmZzM1TWczQ0h0MXVo?=
 =?utf-8?B?OThWcFdLY0hLem5IZmVvM1BpZi9sdHU2YktOcGhiVldaWm4xRlI4UGd5S0ow?=
 =?utf-8?B?WkZ5b0JqUkt4SmVFYjNjRy9LWHNocjJvVUx6MjdJQnNna2hWVkNpSjVUS3dJ?=
 =?utf-8?B?b1p1S0pOKy82YStlQ3YzWUFMakdaanJNUW4xRFhlNVRETUZjYzhlK1NWaU12?=
 =?utf-8?B?THF6V3Q5MVFqWU9sdWxwaUxKSlJJL2dzVWNqRkI5ZmNlZGh0aU5mNkFVd0g3?=
 =?utf-8?B?VFVlbzROSTFjYlJRRS9EdzRmSHcxY1cwZmprbjNSZEZiZGNuMWpuNGttRWtM?=
 =?utf-8?B?ZHF3VXhodjJ3NzR3Vkd3NmcrOXA4YnlzM3EyaE05SVZQZW4wK0R3SnhRbnRD?=
 =?utf-8?B?VkpBc3hzclRDNTcxU1JYaUhCL3VTdzV5TjhLRlFVSWNPOEFHWWZPSVFTbFJx?=
 =?utf-8?B?aUtGZHZLbWxiS2lkOTN5VFJqWDlRZVBRUy9MS3FraGVJZjJEaitONUo4QTJq?=
 =?utf-8?B?WndVWXlWSkw2bCtFakhrVkpWSGRWbzIrZ3U1Q1l0cld3ODVja1gwY2ZQdWxn?=
 =?utf-8?B?STduVjlPdjFHRjRtdFI5YURPK0dzWEI2d3VoNDhwOEFvVHNVbWJTc2xEZzhu?=
 =?utf-8?Q?B+ZztA4/t7lGF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1lvTXVRcm12V052dk5DUXB0V1FiS0gzS1Y5YVZ0b2locU5nOXFuVTBrRUJC?=
 =?utf-8?B?bThoYUU4VS94dTR1bXpzSlZVSWRCQmgvQ0U5cjBGYUVydFF3cDRla3VHN1dR?=
 =?utf-8?B?S21BdHp5UndRdE5LOGI2WmhQQy90K0FINENZdjIxQU10UHlpNFNWbzdyU04w?=
 =?utf-8?B?RUJKV1N2di84YnlqWGJjWE8xWlA1Q1BIVjI4R0hiY1BTS3E2Z2piTUdUN081?=
 =?utf-8?B?V1hCb2NzTlNkTS80R3JOSFJPcnJLUUd4SXRNU0pXc2NYYTRWNWN3WDlyQjVk?=
 =?utf-8?B?bk03Y29ZajJuYVc0OEo5MUhaSndrNys4Vm50RmZRNnZaMnpYekI2NWpGNThV?=
 =?utf-8?B?VlN4eVIrVGtQR1JGRVBpSks3NlY5blNuc1dBenVUb2Ewd2NjRE52OUFXcUhF?=
 =?utf-8?B?NzNCSkZPVWFnUHlqK3lEc3R5VUoyNXVoeC9DeWZ4dkg5RnRIbXY4TTZoUTR6?=
 =?utf-8?B?cTUxWXVnY09EVWRadTAzamQxdy9ldmR0YjNEbFBxYUpBYnBTQ2N6L2Rha00z?=
 =?utf-8?B?VFUxSHFjMnd1cWhLYlhvOW1oazgwZDFIbkxOZGxUaDZjYlVZTTZIeHU1Q0xy?=
 =?utf-8?B?REtHN3NMekZ3UE5jRjduOFkzRkxlM3VqeG1iQnZsVll6dGFuM1ZyMU9hMFhN?=
 =?utf-8?B?aGtsUVAyd2tHTnZkZWF1a29oSElWN2hOdTBDalFJcmsrc1lXN05QMVpiSGJa?=
 =?utf-8?B?RVBjS0UrdFh6MzlKLzRqU3FSNXJuR3lIR2FvbVYzaW5PQWc4K3VVaTZIQndx?=
 =?utf-8?B?cG8rMXlTR1JhU0kweFFUWkV6aHJYYk8xNW5Kakw5V3N0QzN5cDErM2ozbFlz?=
 =?utf-8?B?SzQ4d2FISXcvQzNYcTZKb21vaGpZZ21kWnpXL2dmTGdiQTJRS25pUnVFNEwz?=
 =?utf-8?B?YTNKczJXaUx6VXBLT05kSm1jWjFTdmhYaTFwblRyV05rZTI1VEtpeUpucFVj?=
 =?utf-8?B?Y0tZcE9nbXVpV29JT240NDUwbEg1VC9HL3RpZVhxcDAwR1cvbDBUcnZrQVcy?=
 =?utf-8?B?aVFLVkFkcTBIMDBzdWYyZVpPNjBKRzZURUtYRmRxS01TK0tVdmk3RHV4bElL?=
 =?utf-8?B?bDZwU0crUzQvRGFmTXRRYUxlSTRURGduSE1yQ1dOUDJPaytFR3V2WEF5RjNY?=
 =?utf-8?B?OVlPb2IvR0E4WCtiVUVWcDF4T1YrbktKeWpFbWpKcVVLVE5hSTZKS1N0VTZO?=
 =?utf-8?B?aEdUWTVuMm5mNDlEWFNORXQzL3BtbldpZDFtbk5hNThVVmJkTGoxR09sSVBJ?=
 =?utf-8?B?UlVmL2RMQWNQOVdHY2hZU1gyQ3dkT3NydHNYNXVpcGxWbE5CQkNQeFdjMTQ1?=
 =?utf-8?B?VCt0S2JERk82NlBqZ1YyK0dyOENiQnNtNld4OWY0QXhEWG5KeDFjZWtFa1Bq?=
 =?utf-8?B?cVZ2WjlWVkhxUEZtUXp0cEN4NVVvY1Y1SXJzTWx2bE43M0dVbSsxWHVxMTZM?=
 =?utf-8?B?cWRSaTd3ZzRoU0FrT29oazR1amFLRng5cmZLS1p4aUN0bmhTWWhXbGVMZk9h?=
 =?utf-8?B?cEJVM1BCNGw4TVExUGlPbmIwODNQVEZ0cC82WWQ3cmZNRDBXZjM1bVJYSkV0?=
 =?utf-8?B?YUlMY3FLejk1SkFlWW5VNkw2My8xaFFzbEthRWx5R2wwV0xmQ2JqWGdpd200?=
 =?utf-8?B?SWlkdkZ5YVFDM0dlTTFHWWFuTTZ6YTJkYWgvVFQvRGZtdjRxNzkxbXVucE56?=
 =?utf-8?B?UW5oMDJIcUl0Y3IxNDMvQmJmRmFva1p0ODY3MXFWTzU4NGgrR3Jhb0hTRy8y?=
 =?utf-8?B?VVhTK2dWaS9YVmFEa0RNVHRUUGtTdG5Ibnd2UGE4M0ZwOHcyUURubzBLRGp1?=
 =?utf-8?B?cnNpM1dURDlmQlVBVzdBS3lXazNZNW0zdHNpRHVLZjhkOHRmRkM4aHpSbzV3?=
 =?utf-8?B?UUVsa1IyOXoyeGdqTWd1OUFZdVpvZ1FxNDVINUt4dm43VllseW44MTBETGFE?=
 =?utf-8?B?b2pIOWVBZmFSZHNaZGhXb2NnS0ozajluOEJqNGxzRFhVUnhDMndmMCtlV0VE?=
 =?utf-8?B?WndsTDZQNWhtUWxuczYyUXFQZ0xGT2liQU5XQnpFTko0aTkwUXZUNmJTZDhY?=
 =?utf-8?B?dnFXY3o5cGcyOTFudlBSeXNQMUl6R3NJWldhbFhsbXRMVGVqTTlYTjVFazJl?=
 =?utf-8?Q?2GG6mcKuCWWi03r8tR71ClCO3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab8bef7-f3f1-4cf6-b7e4-08dd5b15efa9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 12:13:13.2078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7oNgG6k7jCrjFt235BN1Z/PMQDBsmV4J6OzQXGpznIKsyCAR8K7aivihVUvRAPdXMgMup3BXv5CReQy7YjQTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8872

Hi Luca,

On 28/02/2025 16:18, Luca Fancellu wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Implement early_fdt_map() function, that is responsible to map the
> device tree blob in the early stages of the boot process, since at
> this stage the MPU C data structure are not yet initialised, it is
> using low level APIs to write into the MPU registers at a fixed
> MPU region number.
>
> The MPU memory management is designed to work on pages of PAGE_SIZE
> in order to reuse helpers and macros already available on the Xen
> memory management system.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/mpu/Makefile |  1 +
>   xen/arch/arm/mpu/setup.c  | 72 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 73 insertions(+)
>   create mode 100644 xen/arch/arm/mpu/setup.c
>
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> index b18cec483671..04df0b2ee760 100644
> --- a/xen/arch/arm/mpu/Makefile
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -1 +1,2 @@
>   obj-y += mm.o
> +obj-y += setup.init.o
> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
> new file mode 100644
> index 000000000000..290baaca9fd7
> --- /dev/null
> +++ b/xen/arch/arm/mpu/setup.c
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/arch/arm/mpu/setup.c
> + *
> + * MPU system boot code for Armv8-R AArch64.
> + *
> + */
> +
> +#include <xen/bootfdt.h>
> +#include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/mm.h>
> +
> +/* Needs to be kept in sync with the regions programmed in arm64/mpu/head.S */
> +#define EARLY_FDT_MAP_REGION_NUMBER 6
> +
> +void * __init early_fdt_map(paddr_t fdt_paddr)
> +{
> +    /* Map at least a page containing the DTB address, exclusive range */
> +    paddr_t base_paddr = round_pgdown(fdt_paddr);
> +    paddr_t end_paddr = round_pgup(fdt_paddr + sizeof(struct fdt_header));
> +    unsigned int flags = PAGE_HYPERVISOR_RO;
> +    void *fdt_virt = (void *)fdt_paddr; /* virt == paddr for MPU */
> +    pr_t fdt_region;
> +
> +    /*
> +     * Check whether the physical FDT address is set and meets the minimum
> +     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
> +     * least 8 bytes so that we always access the magic and size fields
> +     * of the FDT header after mapping the first chunk, double check if
> +     * that is indeed the case.
> +     */
> +    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> +    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> +        return NULL;
> +
> +    /* Map the device tree blob header  */
> +    fdt_region = pr_of_xenaddr(base_paddr, end_paddr, PAGE_AI_MASK(flags));
Instead of this new macro (PAGE_AI_MASK(flags)), can I reuse the 
existing one (ie MT_NORMAL) ?
> +    fdt_region.prbar.reg.ap = PAGE_AP_MASK(flags);

May be somethng like

s/PAGE_AP_MASK(flags)/AP_RO_EL2

And define this in the common mpu.h

/* Read-only at EL2, No Access at EL1/EL0. */ #define AP_RO_EL2 0x2

> +    fdt_region.prbar.reg.xn = PAGE_XN_MASK(flags);
Similar comment as before.
> +
> +    write_protection_region(&fdt_region, EARLY_FDT_MAP_REGION_NUMBER);
> +    context_sync_mpu();
> +
> +    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
> +        return NULL;
> +
> +    end_paddr = round_pgup(fdt_paddr + fdt_totalsize(fdt_virt));
> +
> +    /*
> +     * If the mapped range is not enough, map the rest of the DTB, pr_get_limit
> +     * returns an inclusive address of the range, hence the increment.
Can you explain this a bit more ? Why do we need to create 2 MPU regions 
for mapping DTB.
> +     */
> +    if ( end_paddr > (pr_get_limit(&fdt_region) + 1) )
> +    {
> +        pr_set_limit(&fdt_region, end_paddr);
> +
> +        write_protection_region(&fdt_region, EARLY_FDT_MAP_REGION_NUMBER);
> +        context_sync_mpu();
> +    }
> +
> +    return fdt_virt;
> +}
- Ayan
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.34.1
>
>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E0A7DED5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 15:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940095.1339976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1mNe-0000nc-PD; Mon, 07 Apr 2025 13:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940095.1339976; Mon, 07 Apr 2025 13:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1mNe-0000lN-MS; Mon, 07 Apr 2025 13:19:14 +0000
Received: by outflank-mailman (input) for mailman id 940095;
 Mon, 07 Apr 2025 13:19:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xyMQ=WZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u1mNc-0000lH-Rz
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 13:19:13 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2407::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de415ac0-13b2-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 15:19:01 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 13:18:57 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8534.045; Mon, 7 Apr 2025
 13:18:56 +0000
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
X-Inumbo-ID: de415ac0-13b2-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoyZ1shOJyGXgDXqz0qh5L+BO5ABrbYmuKw4538558mcTnCAoYkS+R1XPGbr5uKna1ymcQvQJaNTSF/5xe0rPkjsrRssj140dlr2czlrfWHf7nbTGvPG9biMqtW1Pz+97KReaBLhPJazibMIPMrGCtkCKHwEoI/r0cCiQMd+m8psT04Jqo3FEgQIO5fWIaJIRd5QPDy/HrUo5RrJqoI+1UkYDaaEUdMeSgo4u06jZGGpb2N5DUVVvH05H1zmwRh0eGregUvVqeVbILDnVp77VcIRR1PB9q690vu9Y1UI6xenQQ8N+1+D6UcAFSlDnBp398+uiBP32pPCUAyC1y7HlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZ6/LOFjefTGrm3j8n8RlL29yYD154ZWaaSVmydopgo=;
 b=WdqPDKEcN0QmC0ZkdRmCDNBj4wGlQFXv+EkRBf3UYwM22Q0d17gT13BN+Lx8E24w4rOIbV/t0IfnHyQ22U20Wkxgr03D4O8i7ptMYRv2KdF++kVDMfncy/7YOwseVqfEm45kYIuhRQG50W1f3vEUgkBeqZnU+0fP8AKhPRY50eYwrStBNEidpxm0VNPa+8iZ9Uhu06yZzuzPOvfHolaT+afKMOxXqT7ElqfrdHGThAKtEt4BhSFhRRMo9/3eyfE6RNxhrssOYVoQZYzPatNroJOSQqWP19BsLPmlyxVuDy5DjhYy4FEe6H5zESX1ieGy4gU7kDwUqAjrqb6hhOwk1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZ6/LOFjefTGrm3j8n8RlL29yYD154ZWaaSVmydopgo=;
 b=at0v/qCNDseZkem+0fH8j+pTRzWlvYXIa4Dh0SYPO5YOHAf9OhusgQszH1YCl+amIrZ/wjGcIx+Z9lB5d+CzvRc7LYdzOs0q9v0BfFyw9F2s9wv5/UYDCkX8cVIDglcNbttZbmexLiEjEqI1typzMS5QilTVK+ZD8RJjE8SS2Wc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0ed34b41-0cf8-4bab-9304-d6c3f2ec276d@amd.com>
Date: Mon, 7 Apr 2025 14:18:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Move some of the functions to common file
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-2-ayan.kumar.halder@amd.com>
 <45d47205-409c-492a-9841-3b162c05ec09@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <45d47205-409c-492a-9841-3b162c05ec09@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::12) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e77c85d-a13f-40f7-f9fd-08dd75d6c028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHJhdEFBUmRDWnNBdWg0dFZ6SXJsaXVMN3JJTU5iaHZad1IzbUgzVHdWWW1y?=
 =?utf-8?B?TkJjak9GK3RyZE1Ja0ZyUGN2U0dVSGhMQnRzemdmaHRWM2RUa0VvUjBrb3Jz?=
 =?utf-8?B?Q05WVmJ2bjVNSEUvWmNKTXhybHNxY0pLSUcrOTZkajhvYjVaZll1WUJGQ0pS?=
 =?utf-8?B?SnZkSkN4aWcwL253YStvQkorUXZxeGdLd0trYW1GYkdEdWNxT2RXWDdsaUdL?=
 =?utf-8?B?Rno5R00wRjYxQVgyelNUUldpZzVSZFJxdUZRUGlBTWZjNnVMK3BacS92V2Nv?=
 =?utf-8?B?ak9yNTRLalI3Skh5emFXZVMvSW5DTUpwTzdjVEV4MjhQR2Z1SU90RWhkcDFz?=
 =?utf-8?B?NU0rMjNpL2M1RXRma0Q5ajdTcEFyVGc5VlhzSjVMb1VsOEc5Ym5MQnVUU1dH?=
 =?utf-8?B?aG1oempkVGt0elF5Mzh0TzZkcXdYV1ZGL1Jwcmt1RWgyNkJjY1hVeVpBaWpV?=
 =?utf-8?B?U1FocytncDZPUGFzSEpmTjdwaHE0bHo3K2ZkaHUxNXlqUzlabXJJK3RlL2FY?=
 =?utf-8?B?WHV0ZUVIdUpqTUdjM0xBcFIyZWFMTXNoaUtoclNFdDd2U3RUQUQxdC8rUmFW?=
 =?utf-8?B?WjVmTytrOVA0czNVU3libi9VVVYza2Znck4vWllaMzF1WEpPTk9oLzhSTFBI?=
 =?utf-8?B?TWttcmlDQ01LcUJicDcvSXNpN3I5MEdKZngza1lncVhwaWJDZDJaVjNyU3Bo?=
 =?utf-8?B?bkRHRThKbmVNM2haKy9QL0tlL1EvUS9iVGVHaDNmU3QxUlF2UFA4ZXdQTURk?=
 =?utf-8?B?N3Q4OUFFOTFPU0hTV0NTN2kxdVJZdkhacGkzZVFqbWtqelBpMEg2R1NuV1Nh?=
 =?utf-8?B?RDFsSTN0eGJIbzkyUjNybnVhSGtOSkRKem0zWEJuRmpSWENvNnR4aitkSEhF?=
 =?utf-8?B?c2FoRDJoN0duUVFQemJXOE5lRTc0N041OTk3VitYTlFNY08wRm55eVdZdndD?=
 =?utf-8?B?c3prc1lqUTY2Zkpnbi9ibnRHL0kydDhIbXpweUFMbDBGWmZNY1g5M0t0VDAz?=
 =?utf-8?B?L3FEYTg0Yi90cGJrckhyckd2RzdVcnpjVjRCK1IvQ2dxY0M2MXlyTlV2OER2?=
 =?utf-8?B?N2R6eU8zYktrUUJIdEFWbkRNUXo4UTNtNFpsbldmOXVEcGNFbFBEYzhMNnQv?=
 =?utf-8?B?YWtkZU1ZWmx3M2FXZkRWRDQvZVhjc2dvZHA0ZGJVNmFodkJaQ2FhSnllc2pa?=
 =?utf-8?B?TitnYU1pajhSZnFpNnFZcnBSbE9JTGVUbmVkQW11OGhkNlVITnNadlVDQWp2?=
 =?utf-8?B?aTJGd3BKN2FPYnRtbEdMMDZoRHNhMTF2VnZYQ3cwdDdsUDJTbmxkS2hOdDNh?=
 =?utf-8?B?TUdiOG1OaDZiOFoxZ3VNYVpxTWtFNEJJcXdhSkMzNmp6RWY2SzRGOHhJN2Fz?=
 =?utf-8?B?eHVZNG5NaDNMY0N2amZHUmN6OC9qUURob3NDUzRKczMranNpSXhESW1saGRF?=
 =?utf-8?B?alZHS3JycWM4Smh1Sm8vNm5yZDE5bUFZNnpYRlJtS045YU5ORXFVWDhwZFdT?=
 =?utf-8?B?SzloY2E5VnJRTDVXdzNlSkcyb09wSTBvdDBFN0FncDlFcjhYTEJzTER6TVpB?=
 =?utf-8?B?SlN2USt4Q052djJ0NllZU2VnVnY0ZnZnZFhDUk1XZXpkZk1SYTExd1ZNbTBS?=
 =?utf-8?B?T0w2eXljVERabWUzWHR2NlZmRTVQcWpIRkVaSWlQaDBlSGhGUjBFL3BMR1lG?=
 =?utf-8?B?U1lhUEhGbG4xdGhIemNWQ1JGSmNMVG9ablhob3FRa2I5SFVteGxBdFNwRnZx?=
 =?utf-8?B?SHdkb2F0MGF5WXVBM0VqWk52b0g1VHdSTlZrVnRZT0Z2cUZuQVdPUjBoMmFk?=
 =?utf-8?B?Z2NUZjV0c0k2dFVtT3BoUE5NZzBzeEVEZVRkSCtGKzc4WWNVd0tkaFplM2ZS?=
 =?utf-8?Q?qSrWc5YMcb/gU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vmc3dXZTQ1NDeVZlemovVmJ6b1VpWDRLS2Z1QkRRNTA4UWRrd2hVbXhWakFX?=
 =?utf-8?B?RU9kZnRTZnBJaXo3Q1JkZFkxRTZaYy9nenlQaGVJeFZlM3Y3ZHhUT0F3Q1ow?=
 =?utf-8?B?Mm1kTEh1T3FYb0lIVVN1NElCUG1xa3ZveVdZZDI1djdIczNRNWJoa1l4TnIw?=
 =?utf-8?B?MFZZbW55WGxNUXBCRnZVOVVoL215QjRETDlTT05uazlOQkRoWTBGWm9MbXBs?=
 =?utf-8?B?RmdIVTZYOHByQ2wzVjFRKzhZT0JYM0hOSXpuODVYRnVYSE1YK1B4V1RlU2tQ?=
 =?utf-8?B?V3Zpa3l6a2d2bjV4dFVhQlViMmxTTE9ZRWQxdFRZNTNsaEpUUno3RWYwVmFS?=
 =?utf-8?B?QXV4WmZ0emZEN0tiWTlxeDQ0S0FzekhWK1plVkF3RmRITFB4RXF4cmlidGY3?=
 =?utf-8?B?KzFMOHYwQ1c2b1R1OXAwMmhUM0dOWjhoR2ptTVJMQmlyWTJxWWxNUzV2Y2RI?=
 =?utf-8?B?YVhybWZUOE5rK0lKc0ZNTk9FVkhCUlhIODVSdW4yV0ppK1lUcHVMUmdEdnRF?=
 =?utf-8?B?SVhaeE16eG0xczRkVXlYbEZJZ3Rma2VYNnBtVUVlSGFiQTgyaGZ3bU5tSzFw?=
 =?utf-8?B?cHRVaWF4SngvMWRjYkhTSDl5WFpmSUJLSFR3UTRKbFZRMnhoeTdQSWN3b3FG?=
 =?utf-8?B?aUk2amRjdDE3cTk2Mk9wczNldjBCRWp6MHowM2xlOFAzb3ZNZkQ4TURhVzNW?=
 =?utf-8?B?SnBuQ1A1aDdwQ1BJcW10UnZxZjg2NXVaT0pqa1ltdnVaZlNBOFk4cmhEMWNN?=
 =?utf-8?B?ZGM0eGViWVk0VUQwZ0k0WGJYUmNsT3lJVWhhb1ZMYzNOTHlGZ3ljMVNGU1lD?=
 =?utf-8?B?L1hXWmZQNkdjdEJ3SXZDNVUvNTNLeHovWVFSWUNuS3VrWC82b2tDcFJDbEtp?=
 =?utf-8?B?V2hQRGJYTDZmaTFWaUcrYk5aUGFYK25ST2FpVEZudkhhWnh4UjJuT1dwcFQ0?=
 =?utf-8?B?YkUyaE5QVy9EVU5HUjZ3QmhFRUx2Ylh6Z0ZxVVN1VE1mYnBnRzBDV0M4MVRE?=
 =?utf-8?B?NTMrOUovWm5OQzRsVnZOa3VKTWpHdDhQSXV4RmhJQUFBT0JlblpzVk5XSTRU?=
 =?utf-8?B?UHlndnZnN29IbGliTENPRER0NVlvY3NreUxDTThWeFB0UUNjdWhUL08veVNo?=
 =?utf-8?B?aFUzOHFESDNIZ1N6S0VMckluTEwwT3BkcW8rSG1TUmthVUJHc2dabjkwY3Bn?=
 =?utf-8?B?WUYwazFsa0pWdlJkUnAyT05rb3AyTHE2Q2tvZU5aZnV3aXV0aXFrSndYdGpV?=
 =?utf-8?B?UEs0V1JWQkF4QWc1R2tEUWVQWFNqNWs1b2laSy8xNEw4MHM5WlJsejhPckNw?=
 =?utf-8?B?L0lGV2dHeFZlelI4dG1IdlhCU3R6MFAxOGdidTYzRzZvem5VbzhObkVLVWtr?=
 =?utf-8?B?TDZzRkVLSnZZdWhYUTJtZVMyUzViUVI5MmVHcmJBS2MzbkNGNUd5QTE3Unc3?=
 =?utf-8?B?Rk5KWGFCNGFTbldHT3BjQWhiQVY5OUV1elFiZnZHWnk2MFhoUUVnK0lHOVdw?=
 =?utf-8?B?NnF4TU5DR0xYcFlMQlRvckZYaXMwSnVlWXFqT3UxSkxPQ2NBUVNEN3VlMzhP?=
 =?utf-8?B?SUxSMDY3bFlxd2NZdjBKMTNlUFJlYkF3RWV6YVdhTkhSQU5wRzRaQ1ZQNk5M?=
 =?utf-8?B?QXNGVnpIYkNyVTBmMXdZbDJSWldpZ0ROa1VPTm9nTzFBTEdDMXREejZUeXNE?=
 =?utf-8?B?dlVDekFLb1RQZy9jM1h5cmZnd1dyQjZpRzNzSFNSMW9waVlGV2pLTnRGWUNY?=
 =?utf-8?B?TjZtdWJtOUhZWFh3bUtZWGZpOUJuKytLV0REaUhXbllvSXdIUC9uS09NWG5I?=
 =?utf-8?B?c0I5TjRpOEdmZVVUU0F4M1M5YlpnVkFLMFpvRWVDbVJ0U0lXZ1RmT3N6RkYw?=
 =?utf-8?B?Qmo1bFBNOHBFQ1MvQzNjdUdJcDdteVlUYTFLTTFzOERWQmZQVzdrVk1vd0x3?=
 =?utf-8?B?Z1RYbVBTazFRMmx6TUd1WDlkbmh5YVNEbEh1VmN5cVFiSFJTb0owcndSblFF?=
 =?utf-8?B?T2FMRms1Q0gyR2d6ejhiSHRTaDlzbE8xSVR1VVY3SnZKRjJ2N2kwSzhnNGE3?=
 =?utf-8?B?Q3ZwY1lBWHUyYzZBZGpJTUpSRjE0SlUxRFhCYk5tdmwvcEc2Q2dWU0lPNWpY?=
 =?utf-8?Q?BUHb4IkvsiVkBmu5GImqVFHfl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e77c85d-a13f-40f7-f9fd-08dd75d6c028
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:18:56.6829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YnpouL7kiFqOuBYBIhLdrLA8NtMdYQJE8LPafOgEZHoRQffaD+K8vtJ+gckQgLSLiu906syCrYUXGX4QPxMRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5765

Hi Michal,

On 07/04/2025 10:04, Orzel, Michal wrote:
>
> On 03/04/2025 19:12, Ayan Kumar Halder wrote:
>> Added a new file prepare_xen_region.inc to hold the common earlyboot MPU regions
>> configurations across arm64 and arm32.
>>
>> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
>> arm64. Thus, they have been moved to prepare_xen_region.inc.
>>
>> enable_secondary_cpu_mm() is a stub which is moved to prepare_xen_region.inc as
>> SMP is currently not supported for MPU.
> This does not sound right. If you want a place to keep some common MPU stuff
> between Arm64 and Arm32, you need to come up with better name for a file. SMP
> has nothing to do here with preparing regions so it feels odd to have
> enable_secondary_cpu_mm stub there.

Can I rename prepare-xen-region.inc to mpu.inc ?

Julien/Luca - any thoughts ?

>
> Also, new files should use dashes '-' and not underscores '_'.

Ack

- Ayan

>
> ~Michal
>


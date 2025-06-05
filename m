Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1BAACF0EB
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 15:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006903.1386163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAp0-0002Xm-Fo; Thu, 05 Jun 2025 13:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006903.1386163; Thu, 05 Jun 2025 13:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAp0-0002Vr-Ck; Thu, 05 Jun 2025 13:39:54 +0000
Received: by outflank-mailman (input) for mailman id 1006903;
 Thu, 05 Jun 2025 13:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsQq=YU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNAoz-0002Vk-Om
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 13:39:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2415::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d63a341-4212-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 15:39:51 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH0PR12MB7863.namprd12.prod.outlook.com (2603:10b6:510:28b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 5 Jun
 2025 13:39:45 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8792.035; Thu, 5 Jun 2025
 13:39:45 +0000
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
X-Inumbo-ID: 8d63a341-4212-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joiX8cbpeZtGFbfbBqnTLKCHWDxUoHZ53IAmXuvLIFwHJxArL7vQT22YHzonzWDoZ/LBuviICGy1bRTYL8kxJjFGZY6HELDudw50MbmZ3ffPW6ORpnjovh1BxOoo69q1nlnWvKeP6udLrWQ/VB2C/UeL54ChN3mJysByWF/0S98qByXxvhZL/uHgRnE+w00NYmXLm/pKVXeQ1BKnRTXpltjqLkX74B1HnQ9rW1dK7u2O+PDIjk+lF14oGLDxD6Acs2D02U1U6vPbHd5yU6JQ4ixrmQqlsqI4bS3ECYgrS5u93rD2MQHddkGDzIQ531iqT5l9jhoYJ0q3+rstx49eaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3GLrIAh+ueQVINWLFF4tU/zqXrndxrvyjSzTP+6QRA=;
 b=qfX3NKoN4RESow6ELwriqSTbjAfpX1Gz0X3Jt4ZRnOdNI+yaeNYGcdKC8Eu0Qudpz2GjALcS3griPxP5QnPPKot4hUx6PXBMMqxwbenKpRi+o5O4Ji0hZ4HcuU+z7EfGy4DExlL/weMIjDtidZPBIjBK1vtRTsdQb3c6l9Y+3KSGyFfnltGGscHMClEHpY9hJoLbbBxHh7kbE/v0oRvW0GgOAYg3V0jrDy6fJsQe/Le2fXr9w7L8Nhfqd1WpT57YtBz4HwJlLXbx5MIIP5YI8L1Tc3K7ukMmOcPPAGFbKPW7HkmsM3E81sEfFnNpWNo/kDPtLqpZ1x+NhEbVeiJFjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3GLrIAh+ueQVINWLFF4tU/zqXrndxrvyjSzTP+6QRA=;
 b=gtMC5NwN0pZB6OrnCow5zu2/N67dTNmzKxYHFy4WjMoANrbvu6nAjpvQrSa2eXuq/exMzz0W0djrIfncheG2osetjg6xAutc2/nrgb3jxfRb7ZIsIgMYUrouhpgliLT/HyDSR+XabUMsqyypG0xNVV+YIYoXwut05sUqxdZQcmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bb3ce203-de59-41b7-ad7d-3b1f3f1c9833@amd.com>
Date: Thu, 5 Jun 2025 14:39:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map structure
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-2-ayan.kumar.halder@amd.com>
 <a2f337f2-1f34-41f1-9728-5f87ef2c7420@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <a2f337f2-1f34-41f1-9728-5f87ef2c7420@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0013.eurprd03.prod.outlook.com
 (2603:10a6:208:14::26) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH0PR12MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0f4fa3-5835-484a-fe19-08dda4366ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yi9DcFFRZjNxQnU3V3Z6QWNYRGF0cjcvbmZxQjZtWjNzMG1BcENjdTBrQTl5?=
 =?utf-8?B?N2c2aFQzazRrNlZmTXJSUzIrN1E2Rzh2dzNZRnlzSTR2SVdWYUZjNnAvWVMr?=
 =?utf-8?B?RENrUUxxeVZWbi9KbWgyMlE1bW9FRjZwQ1k5eGJSY1ZQZTB1eVovNStxOURG?=
 =?utf-8?B?TlZkdnZvYURENlFHOTVYVmtVbUk3bUYyMzBQN3ZKREMrUlUzYlMyV3N3Z015?=
 =?utf-8?B?L01ERlRRSTA2eUdweEsyZFJkNDFYQW1OWEhaaXZoaXlqVjFLc2tkVDlJWDhw?=
 =?utf-8?B?a3kxTUpuMFNlVFphcFVIN1E0dWpqcFQ3RzlBUW10ZjZ6dG4rS1ZhZEZLV295?=
 =?utf-8?B?OXVPMzFKWU5QZXA3bndDWXBTRWo2OUhLOXE2Mlg1b0RQdXRFc1JGby9HRVd2?=
 =?utf-8?B?cTg5ak5hSlJkYlBlYXRJNk5SSS9tNUZLcmgxMWZMcWR0YmwrSGNVK3lzcE1B?=
 =?utf-8?B?aFBmbjFlSkw1dTEvVWRUTm5sOVJWU3Nsa1BySEFkanJNRDhna1RwWGwyRUNJ?=
 =?utf-8?B?OHA2R01YdjFhb1dUWFk1RG1xelNEL1V4MTlmMjB0RDJkNHZIdG5QZHdlbjBL?=
 =?utf-8?B?QTB3WjZDRVViLysxYkY5VWpDUkFCNFlJNlY4ckVMamt5OHc3d3Jqc0gzcGQw?=
 =?utf-8?B?Ym5xWVZCT3c0VnVOSHVEQ0ZKdXBPZWVoclkvaDVpZG8rVTMrSlAxL1gvODIv?=
 =?utf-8?B?NUpoeEJqOERpSFJQMnF1bzJ0RldMdVhvNy9ZQlBKbm9NVnRCSC9yL2U4Nkd3?=
 =?utf-8?B?ME03V0kzeU81S3I0dHg0OXRzZDJqZ2haYWJ0SVJmUzA0TTNVVTBjSllULzBY?=
 =?utf-8?B?U1EzUHRJVVRyWjFva3ZaY0c2dW5rWmM1akp0N3VtTkJvSTNVOWFQSWJkZEVG?=
 =?utf-8?B?bHo0UmpSbWVPSmxPa1VlZVV3KzZMNE1hS0pIWEsvZ1c4ZVZBbjdWdG0zM0xi?=
 =?utf-8?B?OFFJU2VQWEg4bzBCL25EVSszTUdnbVdzRDFIekxLZ1pnT3NiYkFuZTRSNzZj?=
 =?utf-8?B?VkJQOFZBRUFwQ2xURFVPYnUyUWdnbjlKKzhpaUN5VWd6VUpPNnVQQWNEbkU1?=
 =?utf-8?B?dVpTS1UxdUR0OGIyQjBoK3lhRnlvY29lTXZ6ZlZpV0ZyM2hIT0FYVGZKclhI?=
 =?utf-8?B?RGJ6amovMlJoaWcyaEI5ajZEeG1MMVZSYWVCUU1XNmNVNnEyQSs2eGVJb0xM?=
 =?utf-8?B?UGwzWWFRV2s4QWFJdnJ3TW9IWTRTY2s5ekhXVkxSa0FCQXVCRzhqcWtUQ1RD?=
 =?utf-8?B?N0FJWXFTcFFqV1pOT0hKMTZXNGlxeGFuZ1N1c0tFc0Y0REhLNDB1OEUrUTRC?=
 =?utf-8?B?SXl3MlBGOW9FNTVkUVJsc2RiTEhaYjhGVk9LeXNHVjF5bVF4VHgxcThUNlFZ?=
 =?utf-8?B?azMwRHNwVGZUOTVlNGlUMTl3WTVVNksvK3gwWnA4R1M4VTBPRHFrYVFsbG9q?=
 =?utf-8?B?VFg3TVUySEkyNFVFbDdsR3RJOVE4dk9JR3VkZkRrVVBYMGdZVTg4dFZpbEJI?=
 =?utf-8?B?bnQ2TndPVjhtQnNLeVBSQXUzbUdDV2x3aXN6d3dxb1BkQkdUM0pXK3ArNGN6?=
 =?utf-8?B?VjZzbzBMOXpwcFlpaHhXemtKQjhWbTFOTnhqYWd6dHVuQm5Nb3RSRTcxU0Er?=
 =?utf-8?B?ZGh5dVRpSFdSRkxhVStERUI5YzRNU0xaajcrV2VIeWxxSkNwZllsZjROMS9j?=
 =?utf-8?B?ZzFGTU4yQW5nc2xKQlNQcTZXWVpLSnBWM2c0WnBHZXBvd1hsang5bytjZTJo?=
 =?utf-8?B?NkIrNDV4RFNCckJJVW9QMGphbUJDRmdKR2JsMWZXR0FjUFZGcjd4UjFhTWJw?=
 =?utf-8?B?SDdIVmR1cTRXSXdRb1lES3l1YmhwdzB2Y2Nwdzg1QkU3NUcrb214Vmd1VEhv?=
 =?utf-8?B?Z3VqL0Z2eDY5VHhOYTErc2QzSXVSYkc1WTNhWFFONEFqZWxpSlFzelFBK3dQ?=
 =?utf-8?Q?pte5PWEdE4U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmtIejU2MzJLam96RkVKQ1p1TWhVeU5KSmo2VW81UVUrNmdpY2tOSFhNOEIr?=
 =?utf-8?B?VG5qVWJyL25nRnZCWm83M05yY1RNWUJlVjhUMDVZKzdDMysvSW1tOGNHTWEw?=
 =?utf-8?B?UTVFb1BHOUl5cmZmaVdSemNqZFdoMkNRZnNBZWJCRVk2V1lEZ2owQ093WWIr?=
 =?utf-8?B?UytZalQ1UThHYzlKZFJTeHhJb2MyNitEL3JtVXEyVnY5YjduVFVLMUdCSUlu?=
 =?utf-8?B?RHJyYVU5TDJSdFpuMzg3Slh5TGMrZmg5N1VtdXM1QklrSmtDS0N3eERnUVVh?=
 =?utf-8?B?T2pSUUd6RXJDZjh2Lzk3MlpicGk3dVA1d1VSeEhFdDZaWjV3ZGgyNjl4emQr?=
 =?utf-8?B?QTVzd2xCRHVjTEJqVkkvYWhvR0FiVUtUeU1INkVZc29JazJaa2IxY1JVRVps?=
 =?utf-8?B?VWt2NVY4WWRyVnpITEIzcHgrR0ZOaEpLYlk1blNUQThMVXE5LzUrSkcvdlpF?=
 =?utf-8?B?UmtWZENrL0lMVndLemxJeE0vdFVZMnhCZnFoSUwrbVdrVlpISFh5cmNkeDFy?=
 =?utf-8?B?ZlAzeUNkTmYrN0Y3MklsSFBucXNoQTNnZkx0UWcxUklHZ3IwNUpvaXN0ekxX?=
 =?utf-8?B?S2lMclgxOXdDdDNxRkEybWhncmsvWFZSV2xHNVEzRjJ2ZjZwdHl0QmhhNDJY?=
 =?utf-8?B?MCt2L3p0UjloK3dXT2JRb3MrMDFsMUVGTlBrbEVic0FiYk5qbE5TRXh4RFVn?=
 =?utf-8?B?bnFNOGd1eTkrdUxyMThNYWpkMUJjTVBrcktRQXVqbkhCa0JSMmdCNXF2Tmw3?=
 =?utf-8?B?QmQrN0Y2ZXJ5K1lBMnRTdWU0ejhNdnJhRjZCRG51S0QwcmY0TUd2RlpLbzBD?=
 =?utf-8?B?cVJyYjA0VDlRNkxsOHpTWThubjN1blo4dDh3WlNQVzEza1R0cmk3dE5sc3dL?=
 =?utf-8?B?RmRSU1FGNk9vZU1Dd3ZuS09Kay8xSTE4UFJCZDF6V1dpTkZpZklKWFFkSWxS?=
 =?utf-8?B?Vk91ak1NbktRUFhBNGwvRXh1TGlJMXlabGR6T3FuaGdNRFRZcHh2V3BtNCtx?=
 =?utf-8?B?Q2NORXZJQzcwM0RiYzNaL1dITzV0UWhrYzAyWXZYaVpjcEFRREtwZlNsbWxz?=
 =?utf-8?B?U1pGcVlyT1JaQ1FUbEIyeGFIYXE4R0YyNTdNMGdvRm9HSEMzTTNLZExhalBK?=
 =?utf-8?B?RlI5Yitjc1pmVHFVRnJ4VmU2cHFuOGFnSFErS1EwR2pSWkN6U1BLd29RbHUr?=
 =?utf-8?B?VGc5Z1IzblF2dHRmVlRGeHQzaWEvNldKQ1NyUEs5bys2TlBINnZPNWhXNFF4?=
 =?utf-8?B?YmRGTUZkOTRQUitRWGpEWXFvbVZva3RZQ2pweTkyWE1mSFV6SHhuQ2NGS2Vj?=
 =?utf-8?B?R0JKVFlKcG5CbFlEVDFYQmFZbU9rWmc0Nk1EMGF3NDRVOEMzZ0tGbFpacTRq?=
 =?utf-8?B?OGdTTEFZdmdjNWsyMUJmcms2cHY2K1NxTXpYMGFWc1dqeFRtSmg1b2JQZEZK?=
 =?utf-8?B?bFJMem9kZklsSXFRL00zcVpYMFhJSkNBejlPTk5ZOVBoOEFWUHNtMC9KTWI4?=
 =?utf-8?B?MWlHRUtER2RObzNUSjArWTFPSThRbTVUdDFDTDFGVzcxUGxrbzFMeVlvdWM0?=
 =?utf-8?B?ZEZaUkoxWTArNjA5S2NEVDhUSVVKVFpXbnQ5S2M2NXBTaVl2N2E3bkxXVkZx?=
 =?utf-8?B?RkRTYVJYNC9mQSt3c3Z5MUxTR0hocWowTkF2cE9kRlUxcDYyMWN5RXlPUm15?=
 =?utf-8?B?Ni91NDRHNDMzT0tnMk45WTNqT0dUZWZGWVN4dFl2ZzZ6R1VBdkEzMit4eWFz?=
 =?utf-8?B?dks5ZzlPRnJ3eitUZzlTMjFpNFhobE5HRHpENktXMXltUVhCbU1XZDc4L0Jh?=
 =?utf-8?B?dk42TnFOZG5kWTV6RWtzZG1uSFY2SW1aWThjdmNGNHhOTG9Bd0t4MmhGZG05?=
 =?utf-8?B?bHZQUHl6V0N6TzRRQkZPSW9CTjlvSHZubmx2OU5LS2Jady9YbkVoQmlnOE9B?=
 =?utf-8?B?ZVcrTWgzSHZBcXZFdEJkU09PeWJ4MXdmT0JFMk9JRVFWMHpHS0dsUmNMWlEz?=
 =?utf-8?B?N0pwYzFmR3dDdEE2Q3FoMXN2Z2dXVHE5TlVsdTJhdHhyVmpRcVVERmdnTGhS?=
 =?utf-8?B?dnJrZWNHS3pMOC94QzBhaG1hYmhEY09XVGJLbWRTaUdwaTBsZXc5bm92VGNq?=
 =?utf-8?Q?IG3bMCHDBa5xHy8m1qIyTZ3wB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0f4fa3-5835-484a-fe19-08dda4366ee2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:39:45.5190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RhbYHd63zU7pELQCRF17fglTFltIXYtJgp6Xv7KghEEekkrKg0zpgalHaBfLVYfZORrM1kngjP+xjWGu9f7UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7863

Hi Michal,

On 05/06/2025 08:06, Orzel, Michal wrote:
>
> On 04/06/2025 19:43, Ayan Kumar Halder wrote:
>> Introduce pr_t typedef which is a structure having the prbar and prlar members,
>> each being structured as the registers of the AArch32 Armv8-R architecture.
>>
>> Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits beyond the
>> BASE or LIMIT bitfields in prbar or prlar respectively.
>>
>> Move pr_t definition to common code.
>> Also, enclose xn_0 within ARM64 as it is not present for ARM32.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/include/asm/arm32/mpu.h | 30 +++++++++++++++++++++++-----
>>   xen/arch/arm/include/asm/arm64/mpu.h |  6 ------
>>   xen/arch/arm/include/asm/mpu.h       |  6 ++++++
>>   xen/arch/arm/mpu/mm.c                |  2 ++
>>   4 files changed, 33 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
>> index f0d4d4055c..ae3b661fde 100644
>> --- a/xen/arch/arm/include/asm/arm32/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
>> @@ -5,11 +5,31 @@
>>   
>>   #ifndef __ASSEMBLY__
>>   
>> -/* MPU Protection Region */
>> -typedef struct {
>> -    uint32_t prbar;
>> -    uint32_t prlar;
>> -} pr_t;
>> +#define MPU_REGION_RES0       0x0
> The name of the macro does not make a lot of sense in AArch32 context
> and can create a confusion for the reader.

I know, but I want to avoid introducing ifdef or have separate 
implementation (for arm32 and arm64) for the following

Refer xen/arch/arm/include/asm/mpu.h

static inline void pr_set_base(pr_t *pr, paddr_t base)
{
     pr->prbar.reg.base = ((base & ~MPU_REGION_RES0) >> MPU_REGION_SHIFT);
}

Let me know your preference.

>
>> +
>> +/* Hypervisor Protection Region Base Address Register */
>> +typedef union {
>> +    struct {
>> +        unsigned int xn:1;       /* Execute-Never */
>> +        unsigned int ap_0:1;     /* Acess Permission */
> If you write AP[1] below, I would expect here AP[0]

Again same reason as before, let me know if you want to have additional 
ifdef in pr_of_addr() or separate functions for arm32 and arm64

pr_t pr_of_addr(...)

{...

     prbar = (prbar_t) {
         .reg = {
#ifdef CONFIG_ARM64
             .xn_0 = 0,
#endif
             .xn = PAGE_XN_MASK(flags),
             .ap_0 = 0,
             .ro = PAGE_RO_MASK(flags)
         }};

...

}

> Also s/acess/access/
Ack.
>
>> +        unsigned long ro:1;      /* Access Permission AP[1] */
>> +        unsigned int sh:2;       /* Sharebility */
>> +        unsigned int res0:1;     /* Reserved as 0 */
> Here your comment for RES0 (which IMO could be just RES0) does not match...
I will remove the comment here and ..
>
>> +        unsigned int base:26;    /* Base Address */
>> +    } reg;
>> +    uint32_t bits;
>> +} prbar_t;
>> +
>> +/* Hypervisor Protection Region Limit Address Register */
>> +typedef union {
>> +    struct {
>> +        unsigned int en:1;     /* Region enable */
>> +        unsigned int ai:3;     /* Memory Attribute Index */
>> +        unsigned int res0:2;   /* Reserved 0 by hardware */
> this one. I don't think you need to explain what RES0 means.

here.

- Ayan

>
> ~Michal
>


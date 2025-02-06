Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E559CA2A29B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 08:47:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882524.1292632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfwao-000165-3g; Thu, 06 Feb 2025 07:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882524.1292632; Thu, 06 Feb 2025 07:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfwao-00013w-04; Thu, 06 Feb 2025 07:46:34 +0000
Received: by outflank-mailman (input) for mailman id 882524;
 Thu, 06 Feb 2025 07:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GaX0=U5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tfwam-00013q-Ob
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 07:46:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2009::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 790c8cda-e45e-11ef-a0e7-8be0dac302b0;
 Thu, 06 Feb 2025 08:46:31 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Thu, 6 Feb
 2025 07:46:25 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 07:46:25 +0000
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
X-Inumbo-ID: 790c8cda-e45e-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqvkLroljLmEbcCyk8w7o/w/OhlirEtNPU1JBOmWr6ry70KdXnUsQwTRcvIWxuJu5kX655aKtt6unvwMf41DSstIB1PYrkabGlv0XHJl0KVcNr3ui3cMSVk8Ch5xsk4/PmEn80MTETGCzvI1+XFb363KsyloLT8r+Qn+0VAK6eZUTlFPQyWdyZsjFX9BG3hVeUoOvsF1XilkKxumZoNZPOZerNa/kuPmGuZ22H3U9YsEDAkWFS7EfklNrjxVyBOddmwtuJ2v3LSzzQUR5mo/lNpv6yhZh8x+9tacJ7VGdsJhomuVHI1sKtPLj8u9aqg95uqm2bN3SjDfqeSIrGzZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vX/ADCp5NI/eqBSjqhIu4aoLyxarXdCzJVc57mebPs=;
 b=JfewmF5hDBmaJeOo/rXkejWAJSjxjIVXtoYSD+Q3X6fU6jt7zJ8N8RV9iEuUfB79bh0aiZbQj14D1aV0VGML4LRJbh+t/xRqZHQzRu/oTukU/DrBoi5Jjodv57lyvm5Yp/8M24h6lc8OFmOBw7I54paw09FZurNdFmm+Uv9LBJKvBPekAOp4UeXBpdH098N/LxvYVnpkbevme+p4YVCQWMbwbDWLGWOyqrRqfwkXdyEQ+4uwrjdk/xKEtySdzlQtFB+VHDtBZHH/rLx3kAuCyDza7fpuWHkyTTaDLwGN6OYnJ/tJZIScOtzOr9z4ys8OY/0U4xhkpJx3URXEfn0OLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vX/ADCp5NI/eqBSjqhIu4aoLyxarXdCzJVc57mebPs=;
 b=eArl27uhQnBhUWJM9CFDnKmzZEDWwDOUk1fARLtdfMboDkIb19R4mKasNNxsTejPPY/5Ao4wRnYBxSV/kn+lLC4j8p8YfbJC29DJDr16iowei//FwnozNxn3BfwJoQkMaOA0GsL5qFwMmSPay13D3MabqtLEMDPlE6KKaNOHEdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5053348a-b02e-42b0-b35e-46f087d0d007@amd.com>
Date: Thu, 6 Feb 2025 08:46:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: enable UBSAN for debug tests
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: cardoe@cardoe.com, alejandro.vallejo@cloud.com,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com
References: <alpine.DEB.2.22.394.2502051756210.619090@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: "Orzel, Michal" <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2502051756210.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BL1PR12MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8d575a-7e59-4ff4-20b7-08dd46825b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YS9HTWpLcnZsdzZWK3pqOHRQQ3phYk1Zc0FibXBVbXh5WFJhUW9ndGN2dGNn?=
 =?utf-8?B?Y1BiQk91TmVheHJYbkxGdG9ycjllTkRpVW13TDUyaWNkYS9MSGMyLytpVnVC?=
 =?utf-8?B?NVYxL25vUzVCOGt2NERXT2hjS3FSZWsyYkNLREk5U3lza2NOK05WdittMVNv?=
 =?utf-8?B?ZmJESUtXZFU5d3ZDTHlIb21pay82Zzl1YVJmaUcrRTRLOVI5ZGNtZktnSFVT?=
 =?utf-8?B?Uk5sWXN2cHlqcGIyYlQwbWV2R1YwY2RsV0JQSzhsYWRMblRRR21oQ3FyVG5W?=
 =?utf-8?B?RlRQZFZLNWlMVnI5NkhvOWFINk83NUNmVVZwdjJhNEFpdUQzMlBlazRoeDE1?=
 =?utf-8?B?L24rVjhhNUtnTXY0QzVwMlNieTBwY01QZ1kwczR1QlMzZjlKMHU0d055NlVw?=
 =?utf-8?B?ejluaUlBeFppeFkrUDdncWNjNDRzZTJQOElKdXRiSHhZcytGVzZaTS91TldL?=
 =?utf-8?B?WGlxbWlVZzF1Mjh4dFg3NHBVTC9uWm1raGdoVE16VExEaytPSzdualQ2QW16?=
 =?utf-8?B?OVhMbmg2cnZtQkFqM1YyaUxWMHVvTk5SMzdDcisrQ3puSXFYNWZVT1F5dkFa?=
 =?utf-8?B?aU9KWThLSy9yYUttWmZ1R2FxejZ4aEd5eDkzRmhjN1pCdG1WTGtpMEtDTTNU?=
 =?utf-8?B?SXhwSlBINUxNdWlWOUFGODdnZU9MNGptK0Myb2gyMk5xcDdmVW9sZGpXbEhF?=
 =?utf-8?B?eHhoSmRzVk54MnFodWxIT2JFb25XaWNCbkovOXZLbWhjRUFsalVzbE4xMTBJ?=
 =?utf-8?B?bGNCb2h0V2xVdGcydUxRdDZ1eDFqODNaRGZkcDkzYzVOQytVOE9TZjhoQ2hu?=
 =?utf-8?B?NnFTVEpDOTNjVm94alZQK3l4VkcySzdmem14ZFl1NmlHOWJnOEZuSW9ieDlp?=
 =?utf-8?B?bnJjanlSREVOZmlBT085bUw4N1M5MVZFWVd4MjJSVElKanJ4bHVSUEhXa2NM?=
 =?utf-8?B?b0plWVV0K1Q4c3lnOTFNcW9ockQxbVJFV3RrN25VZGJiM1dSam9mOVlYdFph?=
 =?utf-8?B?R3RiSzBWTWR2d3ZwN1JCRWpZdzU3d3RrcDdicy9BWHB0a1djaTROYXRnOFp3?=
 =?utf-8?B?alZjSkRXNW5MQkhpcmloa0piOTFQZHlueWxrUDBWSXhhLy9HSExYeTJ5c1lz?=
 =?utf-8?B?Y003VDU5SStJd2t4QnRjZG9nMnBNdlRVenpwL3QzNEZsRlMxcXE0QXc3SWZ4?=
 =?utf-8?B?R0tOSXJ3dmpid0ZxL3lsemJuLzJrQk5Bd1JpV281WGJpYlBUQ3FwQm9ncEQx?=
 =?utf-8?B?WWcvS0RuRy9abElNekN5S0JSVzduaWNVdG9Md2RldjFmdFdlZkVTWWVodGF4?=
 =?utf-8?B?UU9INUN0czVrb3ZMT3R2cUhCT2w2ZVlFbEJ4cThqZHU1Z1FQelhQU2o0RUVu?=
 =?utf-8?B?ZzU2OUdrK0lRRlAyRTUwckVPaTdVYmQ2MGRJbHg2c09VSnVlQ3R0d0FNVDBs?=
 =?utf-8?B?Rk5VbTRZelFJRzVvbzN2OFZGNVBmbTlHbXJ1RUI4dXZLQ0pWNEtNdWhES0k5?=
 =?utf-8?B?NlBvT3FJV09vRW5jSXpqdkRHVS9XVGlnczBNUm1ndFBtaVBPa09zREJoZHhR?=
 =?utf-8?B?WVF4RlJhTk51amdBY3BkZzAvSVc1cjZVRVU5RmYvR0YxdVBNUEYzTXdwdHNO?=
 =?utf-8?B?a0JkZ04wQ040SUJTTTlJRldYTXJuRXN5NEM5SnRrV1NFR1VrcnNyRnRNYVhL?=
 =?utf-8?B?eGVsQWhKczFtTU40R25mMHJYRi9sNmpmTDZOWmszeHRuMS9mMUMxbWJQK2p0?=
 =?utf-8?B?bzc1Qy80eUVJOVV2aHZUTU4yYitUS3JNWmt5UlJ5Zmg3NXFZWm1TbTk3Z29z?=
 =?utf-8?B?SXZodGM2SmdHR3JKdzBQVGxkQVFQMEs3MTFXdUJJenhtV0lRU0F5V3JrSzNH?=
 =?utf-8?Q?gG+jY4Y3vGPnK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2pQdTdQNXVuWGVzV3E1RFlaYW1xV2d1N1BKMFBrdkthOUNhQzF0MHlJVzl2?=
 =?utf-8?B?a3hpTEUvalZkcW1IdVJrYWZlTmMvY0IzQ3ZJWHdVTGdWNkFsRzgwM1hST0FP?=
 =?utf-8?B?Q0dweHMvdnlhVzN5M2FFbDA3T3JOSXl6bzRscUtVeVMxZzFQY1BjQmpubDFB?=
 =?utf-8?B?bUFmNGZXZzRrY3VhVVhmaUozbWt1ZUZnbGg4QkxSaFdxTUxsTUxaWWtGWFh5?=
 =?utf-8?B?U0VwNmJLTGRyekpnbTJRU2docU15N2JnTVFqS1l5WnZvSTI4WjdHdTFsTUxZ?=
 =?utf-8?B?YjFoaHZ4NGMrMFY5Rlg3N3BOdFl3alBMUURoUzhXbmtHR2llRnpENVZVbzd0?=
 =?utf-8?B?cHJVc2h6ZDRWSk5LUjNVUzR0dW5jME1zbVNiakxiSFNHWENEMURVVmRGMG9o?=
 =?utf-8?B?a25qZGlhbFZ6d0dMcVV2TzRpNzRzR1crSWViM1dIU1hJSnpGNXdiRjgxTGp0?=
 =?utf-8?B?a3ZDZG5SdkNOUlNhL2RKeVhKUHVBYWNTa0ZIbWJPSVF5bCs0VS9USUtWdE1S?=
 =?utf-8?B?V0phV2RrYnR2NU5rRjFHNVh2ZlRBenYrMnJHclJqQi9zNXV5cC9NM1V5NU1m?=
 =?utf-8?B?ZmRwVkcwNnJ1WjhqMDh5OFRIamVNNk5BcTVEVFUrTHF1NndHd3JBZFppVWNB?=
 =?utf-8?B?Rk1TZU80a0x5WExGU3F1TGlQTFVDZmw0RHVaUHBLYTBQMXNHamxyNGJzVGdk?=
 =?utf-8?B?b3F2MjZ3TU4zNVRUdTNqMkEwaEs4TERFcU5zT3hiZUt6ZXIwT09hTS8yZmQ5?=
 =?utf-8?B?WExhWWgvOXdQTmg2a1RKRFNyZVZWUGlWZE1tRjE4Ty9BQzFNcDJIUFFpYXRW?=
 =?utf-8?B?SGR3WlN0LzdGMDB1SXljdnVpd0c1OUxES0YvdXQ2R3g1ZWlqQmVSVzZsMXF5?=
 =?utf-8?B?WFZrN0NvNkpSdGlYQy83RWtUalpCYTZuSG5RZXVBUVRySDJYR0ttLzBORzhw?=
 =?utf-8?B?UUJDV1NvRzZzb2dlbUVnQ3NoSXR6V2x2V296K2ROdkdzaCtwY0o4WHVrdVo3?=
 =?utf-8?B?WUx6NEd1UzR6WWs4THZXUlc5TGVvaGlKTk5WblNEZHl4VXR1c2RzSjVjUUZj?=
 =?utf-8?B?cnFhcUcwRXJVbTg2YlZFc1hBZjVMMXcwd1RqSGw0bUpaWUhGNXRyUWQ5YXNq?=
 =?utf-8?B?T08vanMxUnY2RHYvT1ZkdmhJRnBjWnkrMFRKdyszaVhkcWJEb0ZKcVZLeXRt?=
 =?utf-8?B?QnhQMVppblFWYlBDY0RHbmtqaUprTm9pOU01cVlqVXpIWGhiQktMREpMWXRl?=
 =?utf-8?B?UXptTzB2SWFTRi9qM0I5azVrWjIwanZ6ZTJMdGFhcnVOeThTd3k2dngzVHhO?=
 =?utf-8?B?SkN6TGRoSFo2Q3lra2tBUlE2Zm0rMzk2THlBZHJGU1E3aU9YSE16VGw1RHhx?=
 =?utf-8?B?UElDcjZKbDdsUkF4Qm9zLzlIZXlNbTlUVkcrSUFyZnNqNjdSekFTWXo5R0sz?=
 =?utf-8?B?NTVISTNhVDI3cURpNTh6TFZLOUpkQ3VMWXU2Mk55dkNBZlZ2VEU3ckFxMDk5?=
 =?utf-8?B?OVpzOXlJRzVFTEhzakZOMk50OVBmUHR3SmNydWtabTFBQjRPQXBZVmVsa2Rr?=
 =?utf-8?B?RHl1QlZmR3N5by9Wek9MbENzVVQzWXNuWHFxUGtUa2FURGZoWmova2NmaDBJ?=
 =?utf-8?B?NENacW82bG1xbGVwUEYxNlUrRFpXbTViVVluNVVCQ1RBWk1kZU82QjBVT0pk?=
 =?utf-8?B?cCtudHoyMWpvTFhUQXArSURDb0tjZWNwYlhtdG10OEk2aFBOSzE2WjFpMXlr?=
 =?utf-8?B?eTA5b2JyWEswRnYxQkVaQURiZGFUY0tNbUFmak5HelQyNlRGZHVCdms5Zkxi?=
 =?utf-8?B?YTFYZlhVb3FCdzZpNlhkcmhTOGgydXF2K1VRL0JIS2JiTVZBQStZSnBTNk81?=
 =?utf-8?B?Z3dHKzFWZnpWcXFyeWpqMlhuR09oQXlqNVNlUDFMSWRSOHgvcERiR2c4ek9i?=
 =?utf-8?B?YVdmTG9LRFRKZk04MFJ5azNVOW92MWM2VzJJbVZUUFFtelVqcnMvWjI3ZG5w?=
 =?utf-8?B?VFgrcVU3T3pLbHdmSHFNTkMxekxKVlZGVmtHVzE5Wk1ROHdOenp4OUk5YVpV?=
 =?utf-8?B?R3hsTWwzSXMvYWsyRTJFVFlkeldHYzd2RmtJMm9McWtqTFVUZHA0Vk0zZU5M?=
 =?utf-8?Q?Vy1w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8d575a-7e59-4ff4-20b7-08dd46825b99
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 07:46:25.5368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgd6WuZ/opMEU7zgsO0Q/qv9r5AK4qIbm08b79S5EtWl4yOCXVMBrzD/O507vLMG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778



On 06/02/2025 03:37, Stefano Stabellini wrote:
> 
> 
> automation: enable UBSAN for debug tests
> 
> Enable CONFIG_UBSAN and CONFIG_UBSAN_FATAL for the ARM64 and x86_64
> build jobs, with debug enabled, which are later used for Xen tests on
> QEMU and/or real hardware.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

However, I do remember Julien being opposed to this approach in the past, mostly because he did not like
the idea of failing on first UB that can possibly hide next UBs (I don't see this as a problem because other
UBs will simply be found on the next pipeline or locally when testing the fix).

~Michal



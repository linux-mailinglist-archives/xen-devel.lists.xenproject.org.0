Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40864BB427A
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 16:23:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135963.1472870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4KCm-0008Of-TN; Thu, 02 Oct 2025 14:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135963.1472870; Thu, 02 Oct 2025 14:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4KCm-0008NE-QY; Thu, 02 Oct 2025 14:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1135963;
 Thu, 02 Oct 2025 14:22:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddTC=4L=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v4KCl-0008N8-Ty
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 14:22:47 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 441709a4-9f9b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 16:22:47 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SJ0PR03MB5648.namprd03.prod.outlook.com (2603:10b6:a03:288::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.14; Thu, 2 Oct
 2025 14:22:39 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.015; Thu, 2 Oct 2025
 14:22:39 +0000
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
X-Inumbo-ID: 441709a4-9f9b-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BT7WNOF9+fJOI3p6YYjtYeSYoY1g7UhWidoHo8xNxwHBDWbOH9Ep/BICgf+Y1NGpzzj5oJmpwrJTqys9tGPZKXVWFQVGfjt9EXhtcdC77DJ4FFeGn3K2BZ3IU0a/ZUI8cKcJWEN0+gW1hJk8aJbZMiw+cgWuGQ153fLSG1RVVrkSafx71b72XiOlPF2ZugrGyRSaOFlxQP1aahJWlOuui+OcIMyh8D/15xw/7pcIKsxP2bb9Cs8+pE6KNk8NsF73pM4vy3Qiw6YG2vSdxi8rG7gAhrZQE7u3ML4DJ3iWRRwlmFItOv3rfoHvRxfZlGy2sE++4IrlvxxlB/yz1ZOFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B39u6vWf36fBC6j/NoGl2hqaTwuGiTh64pHOMIfnQsk=;
 b=Nc4qk6WUWPbSOImYQEeXAaqPDoYHjBjrERdB7ENtHi9+pKX40lYo5jAQc8XLMqS2FWxGdqUuddCEs99IYZfuAmtcC0plqdx1umB1GJTtmEFQdOiWtZbw83vpjU+40y6nyE8f8zXcaMkDOJKGpKuF1T28R5j5JJBlpWnni0DoOYS/vbpl0lSh2XlvvywJit7YDbWTt6Sg6xXv3hMztLBoWpqbHOwFmbQcVIe+fdXhzpKeGvGTv6L1ePDiHoUDy0pjFgo2xWwRjnJ+agHw6nwkhPHFqyTrv+JaiuQ23Dsr5VZl9l2T5GzWDFBYp4MewJBrqINreAZchr3Zo8hCSArwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B39u6vWf36fBC6j/NoGl2hqaTwuGiTh64pHOMIfnQsk=;
 b=B2FsPRbo2uhZgYI3tpWMUo45EjXXjPm/Dg4g6uwO04kZXGurrJd1hdiQWK1aZMu2qvEH9kx8GPGYnTTSEnKslMJ8qLHepzR2ncQmnxBY4A+3lBEjT335gpin453BXlDrxeUTm/ctg5jdfI4MKcv2jLPM0d0Wq4bJjJ1mhIhBwoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 2 Oct 2025 16:22:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XTF PATCH v2 2/2] x86: Allow exiting QEMU in TCG/QEMU
Message-ID: <aN6KrO6LPPJFK17M@Mac.lan>
References: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
 <20251002135542.28076-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251002135542.28076-3-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: BL0PR0102CA0009.prod.exchangelabs.com
 (2603:10b6:207:18::22) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SJ0PR03MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: c468fe44-71b0-46cc-abe8-08de01bf2445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZThnaEIrZWxLT0FWUHlFdGJUNS9GWkRoOUhzdGRaVmJpYzIyQmdlTHZvRUhy?=
 =?utf-8?B?dHJDcWlnWlhyVU5hUWw5amZGbFh5T0EzRkFuOHU3biszZEdqenFPL1ZWQm5p?=
 =?utf-8?B?bFhaQ3dGdi80WHluYk9JZ1N4MHVsdUsyc3RyUThVZVE5L2RWQVZ6QjNhd1dB?=
 =?utf-8?B?Qi9HbHlMbHp1TkZDNkphM3lmenVCMlAxeVlJbEVxZEdYNUY5WmZrVnQyZDk5?=
 =?utf-8?B?ajBVRUtSNXJkQVY3ZjBnNGdqYVR4Y0x1b0xpa1FWYnZCQVRjK3BRTk1lcUpk?=
 =?utf-8?B?VjRPVEtRamtBWERHZ3hOTU1vMmU2Z05BalZFK1laTFhtOUp6QzA4aUpUampD?=
 =?utf-8?B?Y0Z5S2RzKzFVcElONm5YWW1XRFBZZjVVV1ZaVmdTY2kyRlVGR1lNSmhPS0pD?=
 =?utf-8?B?NmE0TDRKSCtLM2pXWmVrd281Uk5SRGpjWkJZdlFESlkyMVR4Y3p4WjlIOVJm?=
 =?utf-8?B?WVFOK212RDRuVmhZQjkyVzF2ZjRTMi9waTVhd0tPVkRMdFJVNDdvMXZMcEJG?=
 =?utf-8?B?dUxUWU1UTTBrTUVoeW40TitVUnR1bDh4bFM0eXlWWjR5SXRCamdIc214dUtR?=
 =?utf-8?B?NjFJSDY2aUNud3U3dlpvOXREYS9Gak11QVBWa3BneTF0QVhWUXJaRkJXQ0hv?=
 =?utf-8?B?azB5aUlSMHBtcHNtSnk2M1FSN0lQK2ZuWGtJa1V6RkJaaVhGSzEycEJPc040?=
 =?utf-8?B?NkhHNXlhL2xJb0xzUzdMd1VHa2NGTUgxcWFMN29CMXlVRkZOVmJnbG5leFBC?=
 =?utf-8?B?MG10WFdpT3BmZmlXRlVHWElSUHZFbHJpMHpEdnpHN24wOTdLSkZWOUNweE1z?=
 =?utf-8?B?NUMzNUxXUHk1MkVBdHNHQnNraXYyaW5IaFZxZCtJYjN0Wk9Wa2ZuYVdma2xQ?=
 =?utf-8?B?VUJjYmc0azBWemlwZGMzN0ZzaFIxZEo0d0ZUN3paZzF5cDZYaVoxK0hHbHJu?=
 =?utf-8?B?aWNJdnZ4a2d1Q21GYU1tcWljYVhhRXZDbVkvSHduVGxOM2FIczBteE9DRkNJ?=
 =?utf-8?B?RkxyN1NGcDd1dktRTUNsa1dubGtrWW8xSXBGZU5zWUpiV3JUZ1FObng0WkR1?=
 =?utf-8?B?emdzOE5DN3Vwdy8zQkRHRUVUd3pXMFdTa1lnNmZNbUpma0ZiN3htSmpIcE5C?=
 =?utf-8?B?T3BwdS9HeFVzdWsrUWNoOXM4UXdGSkIyWnovSUtsVGZWM0ZEUmh2RHNBdXd0?=
 =?utf-8?B?czdrOCtZQ2wxdzhZUXNKUm0vMnVSeEg3Z0ZaMS95UUVzdWNRWWYzK2xKdDhI?=
 =?utf-8?B?Q0t2NjNGS05MVTZJMitmaklkMlBGcU9LakFjUWV0WWdjcndHcVVwZGVoZGQ2?=
 =?utf-8?B?eGNjRjdjaG9kR0xaQW5LVzM5MDg0dUVDVkpMMEJxTm9neDF3aVI1WVVhTnNG?=
 =?utf-8?B?cTBqdHlXNFdRR2lJU25UWFYwb2ZzbXdOT2dXZFd1RUJEdHBQOWxmNEEyWVVu?=
 =?utf-8?B?TWlrZXRYa1FaZUZTUmt3aGQwbjZKMGtCNlQxWSt5ZGxPeW9uL1NpWk1YNTB4?=
 =?utf-8?B?ZXdkQ1V5VVlSWDVlYVptL2JqcS9uS29mazJBcVVxa2MzNW50WmplK0R0RXpX?=
 =?utf-8?B?VFJScU5YU2V1TTdLcFNqUFkwRnoxY0NFaW94NnRKd09XYjVORlQxZHZ1U3Qv?=
 =?utf-8?B?R1FBQllLSTFkRVhpalVIN2hPSm0rNVliSFd0ZXFUSDJHSGlnU3VCeGlLNUE1?=
 =?utf-8?B?UGgxVmJUQjNnOGRjV0JpalBhNlhRYWxETzQ5RThjWTJ4WUlieHgvWUFOM0dK?=
 =?utf-8?B?WUtNZ2J4dEIycE5wcjdPczdoWlEwMHJ6VlJ5REpycnEvdGtjWVVtTGV4ditL?=
 =?utf-8?B?NjdESjc5Y01qcFFraGJETkJaM0FqdURiTjZjSmc0Q0tBNE9QN3F2WW5kcUtT?=
 =?utf-8?B?N2xhVU5ZQm1TWEZvcVoxQWhRRU14RGdycVUxTk1CVTNNOWJVMkNScXBwTmZB?=
 =?utf-8?Q?tTYNvT3hjC58x+K7Dt8ocwf7XpYWv3Ei?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE5DK3VmMlNtdmdiYjR0YW1tUXF1NWs0dXBwYzV6OTlGaU4veVovZ2Jia0dF?=
 =?utf-8?B?TEJYWmtDOUJRZEJ1Smw1NWJlTnpLcTJyVnU0U1V2QTF6K2xQRkE2T2lhQ2RR?=
 =?utf-8?B?V2NWVkRGdzNtNm9rQ0pTUmhFZU9yTE1ndkFRVlJHS1VZVGl1UnFwVkhrTXE3?=
 =?utf-8?B?cUtLTExKcGIvd2pSV1JoQkU0S000Ump5TGhyeFZDa3lzWm11TzJ2RkdtcTc0?=
 =?utf-8?B?KzJIa1JHWlU5bXZVemxrYlRPWjdtendNQU02eng0TU1kU0FsRWlXS3Q5aERi?=
 =?utf-8?B?cGxJemNmdFMwS1lFc0FRM2ZIQk5sdkFXOHVSb1poUTZEQ3pGcm9aYmo2QStz?=
 =?utf-8?B?UEhVSDRFZS80UmZ3MkE1VjB5anZMMGpkYll4Z0NqNW4zT2RhUWdmWmlpVEw1?=
 =?utf-8?B?SC92dzBzYTdqQ2E0VmN6dGhCQnBHdVBKcm10MzhGcjdicG94WHkyaGxITGNS?=
 =?utf-8?B?M0RrZHExbVJTc2dlT1hDTjlvVEMvVkl5WmNKaFhrU1A5bG1qZXZOVVBLWlo3?=
 =?utf-8?B?TW1JSHNiVndXMFpWMHJIYjhyeG1yc0MrMXB0Q0Q0b2psemhCUGRaOHpUeG9I?=
 =?utf-8?B?cGxHdHdURjk4VXd1a0ZvUzIrZlhiMllmQTRlQm1oWWVEc0pDN010Y1VMb3NU?=
 =?utf-8?B?UHYxUm16YjVtekNhenVneG5DbEVvZ1hweVdZV01IeEJmQ2d4Y254bW5iSnQ4?=
 =?utf-8?B?YW04TFE3bTYzZ1ptbGZUellZQ0wxU2tUUG9DczNBeTZRcXFSQ0RPNzVWTXRC?=
 =?utf-8?B?bytEQVF0NzNNdGorNjRhYmo4bEc2SzBiTkduSFVJMmVIQzVnUFpTdTNaLzBO?=
 =?utf-8?B?aUJjQk9ZNStaUWl5REV6Y0FYS28wcVBJT3NDcHBtbFlDZWwrWU5SWDhmOHJo?=
 =?utf-8?B?d0laYVNZT2dEZUY0NlVEUThFVEVVbFg3NDZKVUVmd2kxRTEwQmhiWU9sZytB?=
 =?utf-8?B?V0hlNFFXZGVwQ3RBdUczQkgzb2lkbCtuRkhuOEtlSnNadGJsNExqSE1zWUcr?=
 =?utf-8?B?QU5RdG1qQkpJWTdyQkJqNDE1YjZzZlZqUVJrSUdKMmdVTGdCOEk0cldNN0sy?=
 =?utf-8?B?RkVVZ1UzSkVrclRFWG9XYjB6YzlJUS9KSUErWWpSdE9HWTFwU3ZBbm5GbjBs?=
 =?utf-8?B?L0EzK2NXWVpZYUNtSUhXU3VoVXlMeVdyYUdHTm9CNjhxS041VHFoS21pc1Mx?=
 =?utf-8?B?aDQwYVROMnhEME1WWk9yWWEvcWFjWHlEQmJhV0w4ZDlUMHFIMUgyeTBsQlhC?=
 =?utf-8?B?Y0ZHVUswOHR4YXBrYXpVSjFuSkc1azZ3VlZjSTdkNC80UEtCT0NlOVRzUS9G?=
 =?utf-8?B?TWVYRGJnVDRuVVJBNzlCeklRbjlPTkdLSVZqMkVnWFJjUGFJVHlCNVdNV1Yr?=
 =?utf-8?B?ZDB6alpWajhEWmpVWWkvNm9ZSWY1MHpsMHJRbUM3cE4wb053Vm1zM2w2NkFD?=
 =?utf-8?B?Wnlwa0hJZlpZU1UxdmRHaVNnTjhxeFFpZ0dJbzBRMVJtaHZMSm4zYksxYStO?=
 =?utf-8?B?N3F6QmhoK2VnM0V0NGwrVmc2ZkRVZmh6QnJvN1E4bnBLOWhjUmtlYjBUZHBx?=
 =?utf-8?B?a2F5MWgzaXZwVFNyQ0RvU0U1WnRJbS9JUGJRV2ZBYUhZMlgxNTZTYnY5eGNH?=
 =?utf-8?B?NmtlL1hEZ1FxSTRqZFZWUjNvTmZlR1IrRi81SHRYNk5LWHc5Ly9zRkhyTDk2?=
 =?utf-8?B?TGE4NVZJQitvcmxmd20ybU5jUXMrYVgzN1FLZE1vSU9USnZvZCsvcWR5STBC?=
 =?utf-8?B?UlhMQlVLZHVCelBubDdYSXNDclpiNko0QUs1bnFmMjU2eXBFVkRDVDBxcGF0?=
 =?utf-8?B?TjVjS3pNZkIrSXp1bUswdWxsMFhMamV4dzNNeFcwUlhpUFJsdVpGeVZHSktB?=
 =?utf-8?B?dzNQeFNHcVFQbXJiZGwvQVQwaTZOSE9LRVpGeUpoYkZvdFBBTnBjRWRyTWx4?=
 =?utf-8?B?NmhOQk5TekM5TFk5NWQ4V0J6T0hnZkpDdGU5bVl4VXVGZTdWMlpUQ09DMHZ5?=
 =?utf-8?B?SG1Ea285UGsvNFhNLzhyTlpLQlpzL2ZGb0VWaEFGQ0VXWXM5a2FXaGdjajBI?=
 =?utf-8?B?ZWREaGI2WmRrYmFRaWc4eTVTQ2dWcVZ4REoyZEN4QUlrMU4vcGpCTkZoc2Vu?=
 =?utf-8?Q?MjOyPqW/BFL3Hxv2jU9q1d0E8?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c468fe44-71b0-46cc-abe8-08de01bf2445
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:22:39.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPY5kdUKRvXPOsLNpxHwkZTo3Idi1Z6QxR/0IbJzTn9nUg/WKmR/aa1QeZfcnN1+uUEN2CEK/scBXwC2FCdHlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5648

On Thu, Oct 02, 2025 at 03:55:34PM +0200, Alejandro Vallejo wrote:
> If QEMU has a debug isa-debug-exit device, we can simply write to it
> to exit rather than spinning after a failed hypercall.
> 
> While at it, reorder an out-of-order include.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  arch/x86/hvm/traps.c    | 16 +++++++++++++++-
>  arch/x86/pv/traps.c     |  5 +++++
>  common/lib.c            |  2 +-
>  common/report.c         |  8 +++++---
>  include/xtf/framework.h |  3 +++
>  5 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/hvm/traps.c b/arch/x86/hvm/traps.c
> index ad7b8cb..b8c4d0c 100644
> --- a/arch/x86/hvm/traps.c
> +++ b/arch/x86/hvm/traps.c
> @@ -1,5 +1,6 @@
> -#include <xtf/traps.h>
> +#include <xtf/hypercall.h>
>  #include <xtf/lib.h>
> +#include <xtf/traps.h>
>  
>  #include <arch/idt.h>
>  #include <arch/lib.h>
> @@ -139,6 +140,19 @@ void arch_init_traps(void)
>                 virt_to_gfn(__end_user_bss));
>  }
>  
> +void arch_shutdown(unsigned int reason)
> +{
> +    hypercall_shutdown(reason);

This relies on the hypercall page being poised with `ret`, which is
IMO fragile.  I would rather have it poisoned with `int3` and prevent
such stray accesses in the first place.

> +
> +    /*
> +     * Not running under Xen. Attempt exit via the QEMU ISA debug exit device on
> +     * its default port.
> +     *
> +     * QEMU's rc is (reason << 1) | 1, if "-device isa-debug-exit" is set.
> +     */
> +    outb(reason, 0x501);

That's kind of weird?  So even if we pass reason == 0, the exit code
from QEMU will be 1 (and error)?

Isn't there anyway to signal a clean shutdown, and hence QEMU exit
code being 0?

Thanks, Roger.


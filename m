Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96671AB6500
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 10:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984020.1370193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF71w-0002m9-Sf; Wed, 14 May 2025 07:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984020.1370193; Wed, 14 May 2025 07:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF71w-0002ju-Pm; Wed, 14 May 2025 07:59:56 +0000
Received: by outflank-mailman (input) for mailman id 984020;
 Wed, 14 May 2025 07:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjT3=X6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uF71v-0002jj-E3
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:59:55 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2407::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a5ef98f-3099-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 09:59:53 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SA1PR12MB8986.namprd12.prod.outlook.com (2603:10b6:806:375::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Wed, 14 May 2025 07:59:48 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 07:59:48 +0000
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
X-Inumbo-ID: 6a5ef98f-3099-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsuZRKs89S2qSUO2xPZmRvD0QEKtKs1hZaFV4v2geDLnhnSdxfOuQh4DT5NHbGYxV33QYDUk6DuJEERpcA8L7FgPU/R2mrwVOfj3JaleYTBcmK3YgI2khpJpRpgwGRmUCB4ZxRIwzmUl7K6WeYstpyHjC9yZDlL+H/mASacKdByTLXpfCM25l7NJzAp6lJogpNT1INhQz6kCVqskGr0nTbgOdIAvnsTcRccI7V5FiXYJopVGcxy+TlOgp5ihg6RV5dVQLfHHWRUJRqs3/DqlaoZ1YM7O1RSwMwhijoKveETVxLUh9SiR1sdwmlr88xBAoqp4uhyma6NuX/UWWVymVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYGQKwvDMibWlZyTnauyqqfrjFM0hj1b3c2yT7Z/Eeg=;
 b=Xi2KWf2Lv5VJTIm7DzuxfCKK2Yda//4zvuFABJR05p/iOXrk0e55070vtJisbvhLtuLYxXIi0jZ13PaDxk7rPxCgYVIjXfoPLnLoPBPAqhmPl7VUM2K/FA74AL0ezcWhOiN9FVCj99hA8qnOOM108w71jMSwTHY+vYpJ/RqSBmwWp1y339hpJMnCUd2GI81u0QPLLRqMK64VGKge+8DRJ30HPbjg6IyPkknFeVSuHcHjbNX+hKATxkuAacnq5VC8S7hNPN7GTKgZs78KLGP01JIDSzUjjPFhyjvsPOa63RJNT5i2GgOhO/iBv3Vn6RFXEfR+xrKO0b10JsVhXB1JqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYGQKwvDMibWlZyTnauyqqfrjFM0hj1b3c2yT7Z/Eeg=;
 b=ooyNsAUHPGDA4sibd/xBofF3hvpQkeHSxM1c0hVWpfSYdvRmfqKhebszXRGkNzNTs+m/yDfvQtoHywVXJOuuFqKBhUCcsl5urEL0MR+TTO5uac2Xi5KfQ4uE01FP1kIIewRrG0ceAF9tCGZjLlhUyqiGkDjTjWQD6CYf0hjCvTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <61f60a77-637b-488b-b101-1ac0296a7e96@amd.com>
Date: Wed, 14 May 2025 09:59:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/dom0less: mark domain_p2m_set_allocation __init
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20250513171810.668370-1-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2505131707020.368682@ubuntu-linux-20-04-desktop>
 <cacb0002-dd6b-49e5-8019-2d323771e3e7@amd.com>
 <4e684e38-ed64-4731-8f00-afba938a28a0@suse.com>
 <369ccaf5-5c17-4601-88b0-eb32af8608d6@amd.com>
 <ade0c506-089a-47e6-b4a5-5498311ae38d@xen.org>
 <ec9f265f-f33b-4b03-8139-dab0f9ad7aae@amd.com>
 <00cc8940-9a6d-44b9-ba8b-18fe34e6d6d1@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <00cc8940-9a6d-44b9-ba8b-18fe34e6d6d1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SA1PR12MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: 203ff0ed-9ec3-4c42-e220-08dd92bd4c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjFGRy9FWk5UeEQzeEN4Y3lRVUJxMEllUmREV25pSVpNU0VHaFJjRUFqZUpB?=
 =?utf-8?B?VS9kOUNST3h0cG45SWdlVTE4MjJWWUU0SXRwTHRTZHQzaEpqaEd1ZWFtak5D?=
 =?utf-8?B?akRsMjlKcmxMME9GZkxpUXMxa1ZGRW5rZmtocDBRWWFpTkpjUkczMmp2M0xt?=
 =?utf-8?B?cGJCZTltQ2Q0Um9NZkliajRLaVdiV1UvcG1TbXZ5bTNsd0ZJZHFEV3Rmcm81?=
 =?utf-8?B?ZVJNeUc5dWpiMWZiUUczL1FnQ0tEOW0zblA1ZVIwWmRmbmRJd00zbEhHMnA3?=
 =?utf-8?B?L3JaaG10SmtiSmNrRWNTTVhGWUVHaDZhdTVtMXJhTnVRSXd2TzFia0EwdEFM?=
 =?utf-8?B?VHR3dlh5Ym92eVZvWWdLSTZkb2FBWmdsQTBUUVZTdVR5MFJoVGgvaUY0cTRp?=
 =?utf-8?B?ZkJseWNHczhZQmtEZXFzU3BvZzI1S3ZEVHQzZytaMFhjZFFjSnJFRFFqOGlH?=
 =?utf-8?B?QTU0d0pUREpzT2huUm9HcnRyb0p6QzdTTnZweVZKMkdFaEJXU0RNTkhadmNW?=
 =?utf-8?B?dlRKbExUcFBwWDJFMkJ2YVVKUXlJUERpOFl6RktseTZVTjJ3QzZqdWt3Y1Ju?=
 =?utf-8?B?VW5jU3pJUnJDMm43K3BsSHdBbmZBMXpYSHhSZmpkR0NoYzR6UmhJbjcxQWp6?=
 =?utf-8?B?VmM5a0JwR2JTM2FMcVNrcjY3NnN3cUJLcEtOZmhLVFRNWU40emQ5V0ZqS3k1?=
 =?utf-8?B?TzhWdTFtbVRhK2xGSFhZWGk0SlIvbnBOMFlXZ2lsb2w2cTliRWZqUVM5OUxV?=
 =?utf-8?B?cWdPMDhiOTNjaFFySkJrM0cyMmVpOEU2eS9NVGdrUTJtUkdWYmRWQk91SFF2?=
 =?utf-8?B?UW1XeE5BL3RndkMvOWJwdzNMMEo4VHJseThZckxuVGNGR3JWM0JldWhjOW9n?=
 =?utf-8?B?cjFKcnlQZTczK3NrMVlWOWJEQUs3YUVadXRPb0RzRnhWR21UbmdSMGtjd3Nl?=
 =?utf-8?B?QmFWTW9IUmpTNm40RndxSGJyb2VBcWl2Y1pPQTFZajZnVHA3Q2R4OTg5Vm9P?=
 =?utf-8?B?anNBd3VMQndCY0diUVl2TFZRaHF4Q0hJU3JQSHgvMzNqSDBYT1hhWWpkYlFQ?=
 =?utf-8?B?OVpuQVdOVE9pRjJFNDNSaTJyZC9JaTdWYXdidDFMUEcvRGhqbGN3cWZqMzl1?=
 =?utf-8?B?OVpVWUFSSHh0WVBwdDhTRlhvbXF1OHNhZFpxWWNFNHAzcjh1cVRackFoeGZ6?=
 =?utf-8?B?T01vYzg4bHhKeTUxdlJneFpZeVNWVklneDBKaG1zMGtLZytSRktuRlhUSVFC?=
 =?utf-8?B?VlVKTXF5MDVCb0M0Q0dDUzZYeWk4eEFmTjV1MGVHNk1FVW9FWTVQeWxlNktm?=
 =?utf-8?B?dVM4NmZkTThXKzVFQWI5bjBkM0JLbGV0eHIrMFNLMm1XY1NqbDBrd1U2MlYv?=
 =?utf-8?B?bVp0dlZoQzdKaWhiRS8zKzNEalpoK3ZpTGxZdE5iSlZGUWZ3NkRZNjhsZWd4?=
 =?utf-8?B?OVVpSVVwZU5obXBpeTdTdWxmTG1kaGtCQ1ZESU4yVDFvNWMwMzlqSkxZSGpZ?=
 =?utf-8?B?bnJGN1pzQU4zQU1RYzVDK3BERk5QVW5BdXJjTy9wbnFTdU1vN0tlZ2M1S2Vy?=
 =?utf-8?B?SEpZaEZ0VWR2SXBwR2h4cE1KVThjcWZJbXFwN004MnFKYUZjOGlCQzROazVT?=
 =?utf-8?B?RVUyRlFBcWRpQmluYUNxV0hYaC9DMkU1Rm5hU0FITXRoZlJtWUFNUWdhQUw5?=
 =?utf-8?B?NFcrbEJZTWJ5UlFSZ09QTDBjd1lud0VqK1BuZnphZ09IdWRKeTh2VkJpQUgz?=
 =?utf-8?B?V0xKbHNBSkRrcWVuTXVmQUdvbmNzN05wR3djVTZwWW9ockZlb2lFbm5CQW1a?=
 =?utf-8?B?TW9iZG56SWpmTEt4TTI0ckgyZEltcmZFVEtwV2llQllJUEFnUTNNeWNWZ2JD?=
 =?utf-8?B?M3lXU1VUN3RGQlRRZlFTL2dRUkN6VEgvNFJvdEtPVC92VVJ6L0c0ZnZ0NzBX?=
 =?utf-8?Q?4KdTI8x14M4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1BsUDJicjZTRVhxYUttZHVBQWJ5U1VWWFMrdEZZK29uRWd2Ukl1c3YvZ0F2?=
 =?utf-8?B?c2tuSUtWZVNNV0JCVUtqaGdQSnhKYTM4TVd4ZXZnM0k5dzNLMWFZUWVDYzVL?=
 =?utf-8?B?NG1zOC9HUEVPYWRLQjMwRW1YRVhKY0x0eGp0RlNZaW5NU1d3UW1YVTM0T2ti?=
 =?utf-8?B?SmhsOWRldlYydXdvQmVXcFUyL3JCQ0FCb1hhZUVZcnZDTWVhYXg1bTd2aFpl?=
 =?utf-8?B?UHkrRGY3VW96eUVZMEtCVzBNZmVoampndnByenl2MmJ6NXNUb3M1a1FCLzM1?=
 =?utf-8?B?dkZxTlJ3REYvWStkRkFKbHpwdmVJZmJpU0szTWVEcm5TQ29CUkRTN0RHOW8w?=
 =?utf-8?B?eHhHNStvNDFEQW5KbVFKRFNXZDJUT3YvU1hSa3B0YTlWU2ZkNGp6dG1Ua1Bp?=
 =?utf-8?B?TXFTL0VmdHBFbEhZNFlGTTBVWXZKdERKVi9PaWYzSWc1YkNrUDhRSGNWUXVB?=
 =?utf-8?B?UTI0ZnRJblBqWjc5TzZueldOYnQ1a3RaMmhkZUlkWnpkTVVpVEVyQlFHdG9P?=
 =?utf-8?B?eVk2YlpZYkZiU1Jqa2R3UXhtUS9HUTNCYzZ0SlBRR3ZWSm1oVjNuVVl0d0lG?=
 =?utf-8?B?K25VbXJoZnkvcTZ5MHRrekFxUFM5NURlRSt4Umw4aTdoc1hZUXZlZ1VJQ2lF?=
 =?utf-8?B?YlZjV2RIaXJPc2ZQK2VtZVlCMVM3SXViclpXKzJKR1RDOTN4R0h1NXRWKzRp?=
 =?utf-8?B?TUhHN0kxK0RHODU1eGkvdEZjZUlCdGU5UVYreHF3NVhCenlhQnkyeWpsckVl?=
 =?utf-8?B?Tzl4a1F2bGNsc01KSGV1a3pNMkFQS2tPUHNxaWl2ajY5a09EUUhFR1hPd3lp?=
 =?utf-8?B?bnpKMW44MnpsR3VaV2s4dTloNG40WVBYZ2NBYUlzdklXUXVmSERLN2JvalB0?=
 =?utf-8?B?eGFqS2RGSmZiNEkwKzRvbG1CNG80bE0rZ1QwaFhBb2JkVTNiQzFKbTlMMzV4?=
 =?utf-8?B?NUNYc2lxUUNUTHpnVGJsaUZXdFZlQ29FSWxlalg5UUxWdUFsQU0yVk5FbjlV?=
 =?utf-8?B?Z21IZ1ExUDVOZURRTVlRSEF1UGtTVGdmZWt1Y3h0aUUySXJrdkdsbGxDcGJT?=
 =?utf-8?B?WUg3ejIvNjBoOHl1VHU4MzEzR2E0c1RMWmdPWkVOemRWdHozQmY0Yit1QVl6?=
 =?utf-8?B?TXRHQ252MWttV1FYTmI1TG1vTFlkM3ZaWVhEUC9tQ1pXNGNzSFYwTk9IN1Vm?=
 =?utf-8?B?NnJWOEFCSFlMOE56eVg3TEJIaG1WYndKcmcxbEdIbUQ4OHdBemZ2V1QvTnMy?=
 =?utf-8?B?TGlHUlMxaHQwOURCQ1NtbnExNlRZSzJGQzYwWDFnRUUxelBHSjQxVVBNM1E2?=
 =?utf-8?B?YjBabnZHa0VvQ25pcWZjejJjMGIxVS83VTQwQkJQMlZzZWlSbUhqemp0Tkdx?=
 =?utf-8?B?TmpLUTRpSmgxVWtTc2I2ck1QWnBWVzg5aXVyRmpJSUUyQjRlUkpNWmxPWXU2?=
 =?utf-8?B?TllxSm5OeXM4RWZLeXlrU2x5R2dzVzBVSlRqdkl6bzJqRDVhSjI0SDNuZGt3?=
 =?utf-8?B?NDdaUHBMdzNwQ2pxUE8rNUZXZFM1eVBEZEpJNDZ5WHBKbHE1YldtK1NmbnBL?=
 =?utf-8?B?MDZDZWdoQjNFcWFWYkZ0cDU2THo1WHJDSDJjcG1kTFpkTGhNWEJvOEdWanhv?=
 =?utf-8?B?Wm9BNUJJckZDb0xSWTZtQ0VsNG5Za3MwODR5V0d5eE5TZytiN2xFWFZJMlIw?=
 =?utf-8?B?QmozbzRtU2VMK0JxOWdRcjN3aCsvRFdsZ1N2UXNHa0o0ZnBvQWhKSS8rRy9P?=
 =?utf-8?B?NFl4NHpoeVBNc3BEcFdDT1JTeU56VGxCRVM0NzlKb0VHUGQ0d2NobE1DbjJT?=
 =?utf-8?B?ZzdER2FaTFBkQWpHTmN3NlRFbUQ5N0szdjhBK0M0WHJxMEhIcllodlFybmF6?=
 =?utf-8?B?MlV6eDdNUytQTE96YXY1M0l2ckpUMnVndzNwVU9JcEJwZjdBUlZ1Slh5em1T?=
 =?utf-8?B?U0tsSkllWk5OUWtqbXluYTBvS3JWMWdLT3Z1aGxIcXZzNkVtV2JTTmNiRHNN?=
 =?utf-8?B?ZitUbS9BTjBORnk2MEFQRFl1L2Erb2lKREVMaUlPdS9tVkZwVktWRE9sWTdh?=
 =?utf-8?B?Zm5GTUs3L1NjZGRCNTZQWEk1aFpUYTBjdnJJZ0pwTFZ2T1gzcUZ1aGtuTGoy?=
 =?utf-8?Q?vqDAGefvohBolGMJaCwJpSmYN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203ff0ed-9ec3-4c42-e220-08dd92bd4c11
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 07:59:48.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zFjkjvYOGjJdAW4v3cRS8C+eAKPRgiuZmLIjnCdQ+ca/HawHQFhk5o0AML1LwNr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8986



On 14/05/2025 09:55, Julien Grall wrote:
> 
> 
> On 14/05/2025 08:52, Orzel, Michal wrote:
>>
>>
>> On 14/05/2025 09:37, Julien Grall wrote:
>>> Hi Michal,
>>>
>>> On 14/05/2025 08:04, Orzel, Michal wrote:
>>>>
>>>>
>>>> On 14/05/2025 08:56, Jan Beulich wrote:
>>>>> On 14.05.2025 08:31, Orzel, Michal wrote:
>>>>>> On 14/05/2025 02:07, Stefano Stabellini wrote:
>>>>>>> On Tue, 13 May 2025, Stewart Hildebrand wrote:
>>>>>>>> All functions in dom0less-build.c should be __init.
>>>>>> Why? This patch is first in your series and by that time there is no build time
>>>>>> enforcement. Together with the Fixes tag it implies that this is somehow an
>>>>>> issue (i.e. build/runtime issue) other than inconsistency for which we surely
>>>>>> don't need Fixes tag.
>>>>>
>>>>> I disagree: Code not called post-init should be in .init.*. While not formally
>>>>> a Misra violation (and wrongly so, I think), it imo effectively is: Such code
>>>>> is otherwise unreachable post-init.
>>>> You have a point here, I agree. Although I don't think MISRA differentiates
>>>> between unreachable in general vs pre or post init. It defines it as code that
>>>> cannot be executed. It does not go into stages of runtime execution.
>>>>
>>>> I'm thinking how this is different from a function that is called e.g. only once
>>>> at specific point at runtime execution for which we did not come up with a
>>>> separate section?
>>>
>>> Along with what Jan said, in general there is some relaxation for the
>>> boot code. For instance, we could accept if it panic.
>>>
>>> There is at least one of the place in domain_build.c which panic() and
>>> the parsing is not meant to be fully robust. So this code either need to
>>> be __init (as this was the intention from when the feature was created)
>>> or you need to fully harden the code.
>> What is this place?
> 
> static void __init initialize_domU_xenstore(void)
> {
> [...]
>          rc = alloc_xenstore_evtchn(d);
>          if ( rc < 0 )
>              panic("%pd: Failed to allocate xenstore_evtchn\n", d);
> }
Sorry, I am a bit lost, maybe I don't understand your reply. Do you mean we need
to do sth about it (I can see it's __init and we have panic) or this is just an
example?

~Michal



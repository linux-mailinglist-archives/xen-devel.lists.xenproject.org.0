Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F97FA64D07
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 12:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916597.1321662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8pd-000740-1o; Mon, 17 Mar 2025 11:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916597.1321662; Mon, 17 Mar 2025 11:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8pc-00071m-Ub; Mon, 17 Mar 2025 11:40:32 +0000
Received: by outflank-mailman (input) for mailman id 916597;
 Mon, 17 Mar 2025 11:40:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WXuz=WE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tu8pb-0006yt-Ft
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 11:40:31 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:2417::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eca4002-0324-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 12:40:28 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM4PR12MB9071.namprd12.prod.outlook.com (2603:10b6:8:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:40:23 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:40:23 +0000
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
X-Inumbo-ID: 9eca4002-0324-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njsVUm8dbs4R5tuRnshAzmEcBiCJn0yDHpw4Mpa4gCSmukJ4PpbrN8Mtw0nqhgRzbaeNtcNimekQkhECDHFaYdq1mQiAD+OyjU7fxdF7ofjvtXA6gPAIZpEP249Bi1Hah5iBGCwJzrtJLjJQ9i30XqdNy3hKjVI60nznUgrHADECg9ZqsFUcD0lXEYo9rpXBb4K6nUYqoWqgAvkbFJykMZxQQ4Q7ItVA+t5UtqjUSk/4MetXke/mdUwFHYW+dWPcU7mkyL98N7WRxdi4xR6oc11vfVkcfYMrbqWlKvzdh23K2WJoUrdDuDltmNbmgGnyMKpdYs19LdMPi5C4dzo7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvAypX9LKH2YFLrvCQEuzHy/RBe+PbYCg/ScSw2rc74=;
 b=bpgeW5BcwJVfkdxktJlpanYz3bIoGBhIAS3kGHJReHzstN8eXgxFTfYvWJtz0su7PvSa4u/FROEfRPx9EpK0neRNjknDzc/TzGRknaM9TM4ldYeaNcCd06iUU1CmBxIiAB7ksvnIGVivBgPI4aAbCTmXRkfX1YR1XPq7CHsbQnaJL6KgGuhN8kPam3edLGRND3rTbuL+KAsOFhtYqu/tWATkgpczTQ7Pdm4gpTr6TyLxQUY49QoymBB8kzRI76WB/07H0g4LVfS+HQlzXY1grVXVnmF6LOxl3xQeNUGk9sn7wynF5co4RY6FM+eknY284GvkLAwrnw6OwN46UgjWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvAypX9LKH2YFLrvCQEuzHy/RBe+PbYCg/ScSw2rc74=;
 b=qDzr146g4E4i9tQOr2vifBBqRSvATY/lruQKsmATL+JloP6rp6nMBtvxP4PgdaumNTkRAlCvNyAUHeiaX/Qn5Xd0PY5ocZ+1+txbsRlc8UfOUcETDhqULuC8LFDjK279FfAlyhYeM2VvwQZsXwS9MTQrYJzIp+yVOCCFWB6ATL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cd2526bd-9dfe-4c74-8083-0bdbadc42ec6@amd.com>
Date: Mon, 17 Mar 2025 12:40:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm32: Initialize MM specific registers in
 enable_mmu
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
 <20250313182850.1527052-2-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250313182850.1527052-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::14) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM4PR12MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: cb50e120-904f-43a0-0fb4-08dd654880a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGZZMitnOEdWVEJMNDFPMU53RDRsSmxTUm1KUkRpT3ZKanZwVlBUdVdUcVJV?=
 =?utf-8?B?dENzM3J1SGZLMnNtbkx5dVp3SmZhNW9ocThwbDBGMGlicW82NXNGQXdNbmNr?=
 =?utf-8?B?SEc0Rms1bUROdTZyZnN0R1F5Wk1nK1VwRmxYZ0tXNEFsVHN6WXpySElMQzZL?=
 =?utf-8?B?N2orWlh3a0hjVjVieHI2NG5lOHBTbHVyVXJpS0dubDg3M0s4UnJ5c2tpR2Ux?=
 =?utf-8?B?YWxianY5M2tMQXVXYlg2MkVvSWdzT29lcEhObkNCZ0RCdHZUOEdWY3U0a0FW?=
 =?utf-8?B?VFd0dmxZcXZLaDQ0bDR6NFNMM3cydzA3c1N3UHByUTBRdXJZVXNnUmlFRWhv?=
 =?utf-8?B?VmVaNWtRRzRkaXcycDBJNzE4bmV2ME9XZUhUS0lvWGs4NVZmMGt2TG52eDc1?=
 =?utf-8?B?NyswZ1VzbTd0NmhiOWVvWlloaDhUcHp0Mk1mQWlsSDNJTWxzY1RnaGNEODZq?=
 =?utf-8?B?aUU2eDlHbENOcVVEdU5YNTV6VHdNZ1VwQU84TzZ1OFhzL29VNzBkcVA2N0xQ?=
 =?utf-8?B?SHpDRVR1SEhNNHlzS1N3dXF1WGtGODhiSWMxQXV3UzhSZmNwSnVmZUFmT1BW?=
 =?utf-8?B?d044bnQ0MHd1N1ZNOGVUUWZTZit5ODlPanlpbndjZHltZnFscjNtdGRITnpW?=
 =?utf-8?B?bHJrK1NmSmI1T3NYUFEzM3hzWVZoK1YrVXFMKzBtUFlOVnI5dWloY2g4bDlh?=
 =?utf-8?B?RDVpRURJcmV0SmdXUDIxNHlIM3J6dW9vZ1RReUZlbEFMb05kRVpxQkc1WWgw?=
 =?utf-8?B?dSs5UDE0cWh6dTU4QlBCcFNKYzkyNnd1QUZUUHMrbDlBK1FKRjRHMjNVVHl4?=
 =?utf-8?B?QzU0ZG1PbE56bHpuUjBxS3pvNlZqcUV1T29LUFpRL1FFaVNjTS9NeURURXQ4?=
 =?utf-8?B?dGJWRUVpUGE4OWpGckxtTlBMVUlsSlQxbXBIZERiOUtKVnNGM2lpWkNEVHdR?=
 =?utf-8?B?TmJpN2MwUWFhL0NPeTlRUThqbkM1MkZZMDNmMjI1MmFnaG5sSVkxa1Y0d2Rr?=
 =?utf-8?B?WHo3NTQyOEdINGtlalNqV1JzLzBRb29XSWlpMW5mVXNMc2FlcThZbTFKR3Jw?=
 =?utf-8?B?NVV2Ny90THcyb0lVcnUzc1FwN1QzakxwTlNlYlByZkVFYWhmNGRzUlFuYVhq?=
 =?utf-8?B?YURLRGdCU0txY2hUS2c0ZlhzQW8rVVc3L0tKM1hFajFQUzVYb3BTSlpJRnRl?=
 =?utf-8?B?OXpjdGY3SExXYUl3SS9TNVB6dVZsZE4zV2c1QldaY0RieldZL3pieWNqZ0dV?=
 =?utf-8?B?bkJmbzNXMlFyVzhBQ2RNVVlrM1NVUk5PU0xmek1lVDRRb2lmRjVHbGdjdzBO?=
 =?utf-8?B?Y1g3bnpiR1Vobm85UjRVellueW9TVDJ5VVk5aktRNUFCcTF6ZWcvclZ5Q0U4?=
 =?utf-8?B?UE1VY0R6OVNDNGlpT2F6MnhvYjkrZkI2Q0pUWmZJakJ4QWlpZlBKakt0Qitp?=
 =?utf-8?B?RCt6VTNyWi8xS2svZUdCWkc0TGZFY2c5b1N5bXQwcTZLT0FMbm5Ec0tJY1lZ?=
 =?utf-8?B?TkxoT0tvNlpiRU5va2dsZ2taZzZMU1lGT296WWtONXRlSzU3Z0JJYUpudGR6?=
 =?utf-8?B?R2haQjZ0NW11NXRMd1RGdHREejJWN3l4bWI2SDk1SE9YVHhiSFAvSkE2VW4z?=
 =?utf-8?B?YVBmcE9iaEZPNmxlcUV2ZXdlcWJidkJQbnphK1gvUTNRY3l4dDN2cmtIOHp0?=
 =?utf-8?B?T0JpQTVJbEtqWEQvckUvZ0kra0hWSFkwazNKTHhJZlVxQnNPWU1JeTdSejRm?=
 =?utf-8?B?M2VxUHZiSWg3aWdBa0xvR0djUjZ1K3JRdFBUMlJPbHZwQmJoNTlxQVY4bnh0?=
 =?utf-8?B?aU9jczRjS09TRElSSzNPQ01ycXR4R25Vbzdra3JIQVVqMFF0SE1qZW5Kc0VO?=
 =?utf-8?Q?zpMMsAYkopRjW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUwyQXAycnkyQkl1eUgzWitxSlo0ZkZPd0Q3OE9EK29oRytGcUhjUU45WUFW?=
 =?utf-8?B?Wktrb0dVOXFFSXd6VUNYMHJYcFZiUTJTK1VEU2Jqek9XQVVpWS9CcVJMS2NS?=
 =?utf-8?B?VEowWHNFOU1BWCtRSVVzZjBNOVhLNlZQNkFYVDZjOWwzYXZMQlYxZFVWQ1o5?=
 =?utf-8?B?c2FWMC9xSmlaa3hsZzBXeldhNzM0QndyMkFaUk1GRGx6RTZJSVRlMnJ1VWNK?=
 =?utf-8?B?a20ydzNQdFdsQ1dlWkltTWtXMjNFbytXTmRIZEM1NSt4RzlqY0tTN0RqMUF0?=
 =?utf-8?B?Mk81VVo3WVllc0FxaXVjaWxzeDR4WDZob2RwcU56aldYZm5XSEY5NzRxMzFh?=
 =?utf-8?B?K2pBbWRRdWpuNlRzdUZJeXhpajFqeEE3MDAvQ3FqSUhCajBLRUpuWWpzN3hy?=
 =?utf-8?B?UjNJTW5yRGJKT21FN21acWRXM0JoengrUjkyb2I1Y2FJWTVzd3FORnBtQ2I0?=
 =?utf-8?B?c2R5Tk8xUjFRbi9hcm5KK1JBU2RpWVJjWlZJSldXMEkyS0o4TmMwM1libHZS?=
 =?utf-8?B?MzRPTXovSGdpOHpVQUc0TmJhV01SQWFQRyszVEpmak52WnBLZ3FIQkcwV1or?=
 =?utf-8?B?Zm5ZaFdoa2ZmL2dkREdFS3JqUUQyUllhVjVjR0xRY1BpdmdldGMxSkRPdjZU?=
 =?utf-8?B?WE16MlF4VkpMOHhBbFkxMzNkcnZsRWYxYmtXRFdWeTRnL05hRkYvZVZFTGFX?=
 =?utf-8?B?WXhhdEZINCs4MThSQWc5QmVLZUQrL0JLb3VLUlFiaTU4V0xwK2dEd1Z2L21v?=
 =?utf-8?B?ZVd6L1NMbm1iQkY0NXZybEI2TkE1TGpBWFN6TnhEZU1XdEFPTk03ZzFRM0NW?=
 =?utf-8?B?MXViSXQzb1hhSkxRZUw3U2V2aE10S1dmSk5EellSRVBoS014eGZacTRieDBq?=
 =?utf-8?B?WUtIMmdPYStVM2d6VTZXNVZIZEtMYldHbTlLZmErMFFBamdQU3QwYmFOSEJU?=
 =?utf-8?B?QWhzVVdIdnVua0JsaDlvUERYVytzQzdjU09NYm93QXVqaVlPdU13czhOSEZ2?=
 =?utf-8?B?NTRaRmJBTnN1Ykw3VG5ZNnNQRXc4YUFKMm5sSUozdkFYNlNxeXhvTzRCL1FI?=
 =?utf-8?B?bE9HSjZvaGx6KzRrR2N5ZUVIN2o3ZjlMekJoYStDN1hMS2xvQ2Z4TlNWRzJu?=
 =?utf-8?B?clk4ZkZZdGhUTEt0RWNVWVo5bmpyMlgxck42MTFtakhqNjRKaGNUWkx0TGM5?=
 =?utf-8?B?a1FMSGRjU0Z5SnpEVVFUTDYzV214UUhGdFRETDY0aGlMaTc1V3ZNNVBIcmdV?=
 =?utf-8?B?UHRVMHp4cmtrYnV0ckk4MlRRR3VoMGltSTBiVjkzekFFZnQrdW1TcVNSalR0?=
 =?utf-8?B?Y2lPdndyTS8vSytPNFpnOVdwcU5iVm11SVlmNlBLN1BuZ2ZQaFBTWEdySkR3?=
 =?utf-8?B?TmJhNDFya3hTbTJza1o3KzloSURMYnVyZmhXSk5DTThsRVl5aFZBYlhSUFRF?=
 =?utf-8?B?bkNvQ21rdXJaTkN0c1lIdmhRNzNJYzNlcFFBbzdDS05NRXpqblBINVBSYVhk?=
 =?utf-8?B?R2tNZXZkeHZNWU54UTI4VFlTM0sxbE9QQWdRUkZZYUlrVUs2VXowSGRFb1Rw?=
 =?utf-8?B?a3l4ZFpDMEpvSGFqTW9zU3h4aWZVdVU5RWo2YjRPb1JPaDdGRFJXUC9Ib1hR?=
 =?utf-8?B?UWUzTkhZQlNmK1VVV05wd0ZvanNIT3F3c3l3NGhUeVIybFY0ZllaazlCWGdB?=
 =?utf-8?B?STdWOEdocFJqUkFYL1R4eGVlcmpWTDh4RllIRmMvckI1K0ZYcGRTS3gvRnNJ?=
 =?utf-8?B?UGRUUmswcjUwRVdROE1ydEFHQkoxWmFaUnpleGZMUFNiUUJHbDhPWHFhcmZr?=
 =?utf-8?B?bFFUcjQyZXlRMXFIa3ljeHNTNnpOYVdYazBqK3NvZnJzRjRlQlB5cGNnMHpt?=
 =?utf-8?B?M0U1WjI1NjZ0MW1sUDRMZGNPalczKys0Y1JWU240VVovUkhDY3dPdlRyUHl4?=
 =?utf-8?B?RE13cWRiS2g0RytzT3JGenJ0WmxUTTd3dU9kQkJVMHhrdW9laWZTODJuSVo4?=
 =?utf-8?B?VmJaUDJkMkc0YmVMdWkzdThLdVhWQUtWMWphUmNqUVJhZjRselQ4eW01K3k1?=
 =?utf-8?B?MHZnUVJxQi9KeEt0djZyczIxemlBYUxmVkhMcm1UTHpiM2V0OGRwbGtLdXZM?=
 =?utf-8?Q?yMt0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb50e120-904f-43a0-0fb4-08dd654880a4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:40:22.9737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGVAt49y+vMM4cQ8mEMTnZ2pFZsLJhAvNB0WSHq5ajPDmgYa2Vj5x5BLhv8g2w4m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9071



On 13/03/2025 19:28, Ayan Kumar Halder wrote:
> All the memory management specific registers are initialized in enable_mmu.
The title is a bit misleading (description does not help too). It's a pure code
movement, yet it's not mentioned at all. This can be fixed by changing title:
"Move MM specific registers to enable_mmu"

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
With the title changed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



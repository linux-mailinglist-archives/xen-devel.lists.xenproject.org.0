Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B34AAF7D0
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979222.1365906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyXX-0002ad-OJ; Thu, 08 May 2025 10:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979222.1365906; Thu, 08 May 2025 10:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyXX-0002Xa-LZ; Thu, 08 May 2025 10:31:43 +0000
Received: by outflank-mailman (input) for mailman id 979222;
 Thu, 08 May 2025 10:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiTB=XY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uCyXW-0001eT-58
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:31:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2416::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0068604-2bf7-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 12:31:40 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 10:31:30 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 10:31:30 +0000
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
X-Inumbo-ID: a0068604-2bf7-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REzgv6u9G2RNQtZYZzF59zOklK2IMaqcC0LQVSb/XiaO8sSI+VDBJS++2gzMPQdBusPCUJjZon7QNr9Nu/xGvDHAbxs7B6rq0mOAE90vW2Qh77vrym/9b1R/llQ3syjwj05V1Tn3iZaZUbpzv4TguK607VYQIXxF4WEwtKMsN2Hli//FE+xY/cgm904atlhyh/T5GGnvKjVC5V4uwtvtvdoY3yi1p0LjtsbqPdtN20lpEOHqyGlLJs9aMtXLyRvY50olAaBLOGaBj4Oj9Is7tmI41EFZY/qbOFF7uDEDL5q4lWQzrTjpES1u39mL7KH4GFqTH2jtjzxz744dNZuteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLJSAeSEkFj08J/5xstB9W4q1+Zy/X/z15JAixrIQSo=;
 b=kHUCRCzFgS5zpWFeJXQBE8x1CM4Kg3/4OOqKp6JcnEpLNweG0i0X60KayohOsi0qIdRGTBcD+WN/gxmCdPzBS0cCHYDh1Hz00SlMdwW0MpOWG/LvXUdYzMSYVihXTAR/66G2yh/OT6z+QABmNjuPHgfQOmv0xjrKQWPXyzDoI/5nWOdLwDTaFuSpZ6TqKY0ST9C1irBi3fyEwg1EW8UfJJgCtcM2vsuRia/KdY522EN3G9S7HRAcXRkwSNYPEd6HgMiUqcLzhAeCf3GYdTgO+KpXsIUnWYh3KwU+465l/ksLgJGm6lZgzffmnvVkOcQ8wmfTWsM9QF5uGfV29uex+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLJSAeSEkFj08J/5xstB9W4q1+Zy/X/z15JAixrIQSo=;
 b=3nyQm0zl488BqNbmqskgfjVmawFwcYArxLKNSY6cW8yIlC++Lq+bwE6RUF8MpJLdWzMj611Q+3oa5FwBBTabvQ3wuYKiZqmqhEPYjXLibcfOAILkZ6iadj9xXYNuIOouyKuDF5+6zyfRM82iU/cG0Q2Ix8lozGW9k0PJLoEN7d8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f1c1da65-d516-4b7b-9ed3-b890ba2ab113@amd.com>
Date: Thu, 8 May 2025 12:31:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen/arm: fix math in add_hwdom_free_regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
 <20250505025631.207529-3-stewart.hildebrand@amd.com>
 <fa800ffa-eec3-4496-b157-f89d10b3650b@amd.com>
 <7ad1dde2-0af3-4a8c-a67e-3eafdea5822f@amd.com>
 <309dc9f0-3938-4b84-b772-e0044763f52a@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <309dc9f0-3938-4b84-b772-e0044763f52a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: aee61445-d58e-4bc3-b458-08dd8e1b7f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWkzTW9wc3FNNlBHUlJqWWNYcGtHK0tWdkEvUk1uUUdpaEFxOWxaYmJ2bWhQ?=
 =?utf-8?B?aVp0cit1T3Z2M1lTZ0VTUEVROC94dXNlOG1QZURubExXZWp5UzVIZXhqTUJ2?=
 =?utf-8?B?OGhWZ1lRcDR2Qkp6WXNUUk5HTFgzSzB4RHZtWHZ5cGFCelAzbzNQSVRhckx5?=
 =?utf-8?B?bTAvdDNTQmtUTlN4MTIvSXdXUmJMbnVHRU5KSEZ1S09udDA5RFBZN1ZJQjVP?=
 =?utf-8?B?UDVValFvMDExdEx6S05ZRFE4UFFUNVN4TCtkVmt5dDhzQUpmU0ZGb2hQQ2ZI?=
 =?utf-8?B?TUtIMHBQS0VzNzNwQlE3N0dNaXRQUW1IZStyVC9NbnV0bENCSGtrdEFrMmla?=
 =?utf-8?B?M2d0NFA3TjFpME1DaTJ1U2k5SDBmV3BIb2Y4YjlQYnQ5dkZQdHhjWjkyWVdP?=
 =?utf-8?B?VnBVbVBBMmo5bWlQaWlCdVp5ZkFydkxXblZVQ2ZPckV6MjdwSmdyN2c4ODZJ?=
 =?utf-8?B?NjEvQjJ0MHI3ejRQb00xSEc2bHlPaTVQTkt4a2VxRGdEcSt5bFYvMHJaMlZC?=
 =?utf-8?B?K2RjUEhRWHFjd2pCUm1iWndKRVpXYm9SWnN4bEp6UURuYVdvNTEvRkVmcGdz?=
 =?utf-8?B?Um9LdndLQTVmR3ZLaC9VZnFlVytoN2YzT3hidUVKVEdjNlBFUVJNQTVLOUI1?=
 =?utf-8?B?WDZRYUdLTnlHbjRaV2NZcGo3N3VNQWpiWmF5QjZtUmhkMm1OSURGdXR4YUJN?=
 =?utf-8?B?NDEyMEh3S0lQc3dDR2d1K0tlMlE5WUV0WGNDSW1YR2tRWVY1R3Jyc3F0TnZ5?=
 =?utf-8?B?SW1JSTd5RkJQSks4WVBxRFBUcERCakNrdktYUitwaXRkZHpjbkRIN2lzWVIx?=
 =?utf-8?B?dndUaUQ5V08yQ0pyTWdrUnlKd2hzaTlHSHVoVTNVUzY4bHRZcWR2b2FLS0sw?=
 =?utf-8?B?SDRNN0x6T1NBUmlDREY1WjJSeDd4OSt4aEU5d01lTmJIZUJ4K0dnejhsUENu?=
 =?utf-8?B?TnRvNGJiQnJiNjloazd6cThSZ28wTDNzQXVZR1FjcUNFbHNlU1lXUkVvd2ww?=
 =?utf-8?B?c2ExZmdKTURRSUIyb2tJNDY2WHFxSGcwNktoSm81dURsUVh4Rm0wQzNxNlRJ?=
 =?utf-8?B?b1RoM0I5NFhMcFJMUHh1Ti9qTkUrbWtPSkRHY2RVR0NEMVY0dGZ1UTZFa1ln?=
 =?utf-8?B?VFBwbXB1YmVLSzA0MTNoL21iTGRBTW9WVTkrTHVXSmtIUlB0UHJDakVaMDRu?=
 =?utf-8?B?NmE2TmJjblFYdUc5akdnbW9qbExHUW84bFZkMy8wTjFxeVZTcmErZmE1YTNu?=
 =?utf-8?B?cUlLOWxndjMwU2d0U1U1TzI4c1NVbHJDQjdYeGJYNVovV09ZVXhrd1BZU1FY?=
 =?utf-8?B?eFdVYmlXYVZaeWltdWtPOEtBM2hvS0tseHNCOVdleU5aeUZTWktJTVd5UUp1?=
 =?utf-8?B?SThPWllzeUJkNk9ybWpRMytsanQ1RWw3U0dCbUFHYnROaHdGVVR3RFNiYnVz?=
 =?utf-8?B?SzF4SWlPVnFkNzQ1VHFGUnRMV1VTMDRGbnExa2NYS2s3WEM3bUpTdlZOMi9J?=
 =?utf-8?B?ZGNBQlgxb0Z4aWh5cWFlSml4cUxibFJ6UTBrbVpzcU1BSVdMNTdnSVhEQTZa?=
 =?utf-8?B?T3RXbFdmZ1JUZ2U4a21ldzlpSFJHM2JtczYrdEtQajF4bUdONlZNZ0VwOXpy?=
 =?utf-8?B?NnVkMnRvVW8rUDhVTFBVZWptTDR3Ui90WnlqcEY3TkN2RlpoYUNBTXdYUHU1?=
 =?utf-8?B?STNQT0VZMHN4bkVNSVgySFJsRkF0M1kwZE81R3dPeU1wWThLSmtiU1VvUXJF?=
 =?utf-8?B?bitNZjFOMzZLaFZIU05yRy9TdWlJaXRkMlZzRkFHcVNYVFBZaW9LbW1oSFdk?=
 =?utf-8?B?Tk5aaFVIK2FjcXFsbmRtUE9BVllMaDZEZlRDU2JZRDR1bHY1Y1dYaWZOV1g5?=
 =?utf-8?B?VTVucU9NYThTRlNaY3c0R1RaVEIycVpDSUZQMHA4bDVUeE1OZTNJNktQa0RK?=
 =?utf-8?Q?Yh2eJSFHZjw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzRlL1YvbFhuQzIwSS9ZZStvNVNwcEpxMVdBRmNwM0dib3g4VmlSZGlQL0hv?=
 =?utf-8?B?cEpobmpqc3V3RzRHKzArY0V1ZlkvU0JTeHRXemlkcFFkZ3pKVVFUL1dBRGRW?=
 =?utf-8?B?NkNoRWM5OFg4YUNNVnR3R29KU1dBU2JVUGswaEtzekVBNVhyRFRYSHI1UkNB?=
 =?utf-8?B?ODVER1UydTc2QkI5ZE1OcDlaaFlTVWJTd29kOG5yVE8xeHV6V3FkUlpDRklm?=
 =?utf-8?B?R2NseXdMYkdhVDE3U3RJWHZhQ0I5THcxdkU0ck5GV3phUGgzRUs5R052dCtW?=
 =?utf-8?B?a3dnRHR5djQzTEZ2VXVKY3VsUVkyRUdwYUgzeURpTDMrVC9KZ2ZFSnhMc1M3?=
 =?utf-8?B?UzVOOG00OUYySmhVRGhDcU0wdnVzSHRmelI0L2NieC9uVzgzU3NROG40cG1z?=
 =?utf-8?B?Z0R0TzQ5NVh0dHRDUCtmRURNWk9tckFnb3FrUGhqNEYwMFFrQ2wvSjFtQlUx?=
 =?utf-8?B?UFl3S1pQaUVweUx6SGsxSERkeWlldWU1dCsrSUZIYXd6dUFJTGxiZEY2Y2Q5?=
 =?utf-8?B?YXg0VzVkMXdsWGtBUDRod0wwc2x3MlJKRmxpemFTNTluWG9RdzdUSlgycStj?=
 =?utf-8?B?Vzhwc2FGVXNUYVB3RXFxbzVVNEtQSXFNSk80bzZvSmx2Y2ltcytrUkhZclNC?=
 =?utf-8?B?Z2QvMGVVaFZUckxlTVpaMjd4RzNlS0paek5LS0lSUTFicVNOdVl2dy80Wjc0?=
 =?utf-8?B?SEdaZEVyT0tHWmkwY1JZVWhhb1RzU2FxT3NkMDllU1dOZ05rT0xoMU90VFVl?=
 =?utf-8?B?WkxXSENPVklBZklsU29zdmZmTmF6UkRkdnpMT0NQN1RKZVJtM1gwcVN2Nkhm?=
 =?utf-8?B?K3pKSmhPU0RpbGgvZ1JzQlNzcE0zNyttbmdydmNtVHNIcHdYVlRVR3lWWkFL?=
 =?utf-8?B?OERHZVVEb2tRR0ZpOG9UUkxhSTJmYzZZNGFoTE9lYnZ3R1EveW1OMXUrcGor?=
 =?utf-8?B?WkRPVkxRK2hKWmxacmRhWkJyNzRnejJyZ0V5ODFiOGpCWjI5bDV3ZmJMYlVY?=
 =?utf-8?B?OElUZkJnajVHNlg1bVV4Qi9Tc0duSTV2aDE3WEhLZUo4WnNVWWkzV0NmM0pl?=
 =?utf-8?B?UGV6WUE3MDJVRldmMkNOQXRyTXpEa2YxbTY2R0RnMnVsbzlXS3NneEZ0bmVn?=
 =?utf-8?B?b01BSVhtdysvVi95d3lweGtnV3Nod2RrRHlkRWxydmx1UXhpeU13anZOMFJp?=
 =?utf-8?B?aEFaYjNZY2tzalNlL3VSOThpNTRsazBhalBVMFFkYWFTZUszS2UrWmVaVmt0?=
 =?utf-8?B?ZkNkbEF6ZnhxQ09ybkJIMXFFbWVURzdxMUhqOEFhaDArSExFTEZHNmVzSVA4?=
 =?utf-8?B?eGs3azVJY1BpeFA0Z1VwQnpIY0cvZlBvZ0tFSnF5dnNrMGVobjc2K1dBTFBr?=
 =?utf-8?B?cTFXTU1Vd0FlZ3E4REkrbVFmaTBjVVo0Mi9KbVJqaHhSdENFazBTTU9LZnUy?=
 =?utf-8?B?cERKcjByTmdFY05KSG5VdUxDcG5WZktrRWV4aEtwZWlFd1ZNMUtZa3NuNXVz?=
 =?utf-8?B?WFVneEJpQWppTCs0NkZoZUtOeHozRlpoVHBQZXBJaDRUMitZVGwzWFN1YXlE?=
 =?utf-8?B?eW5ndG9WMWhTRjlTQ0x0U2s1ZVRYaWJDblZtUEx5eDBOTGpDeDlibkI1MXNU?=
 =?utf-8?B?RjhCdE95dktYWEFBamdTSVhGQkh3MVRTTm41clJSYi9DV3ZsNFBOMkM2SHkv?=
 =?utf-8?B?YUI4VldFQ2U0UDB3UkE1K1BGR1JsMC95ZllINGpxU3UrazZaN3d0N1JJNnVN?=
 =?utf-8?B?NkVHZGtPRzZnRFBuRTdwSyt5eExST2FwQmkrK2tMalNTQXB2WHFEYXpCVytH?=
 =?utf-8?B?SmRJSGZ1VitmbFk4TlJFQmxQVzNWL24zRDAvMXkwSEdPWmxIbGwya0JRbk5t?=
 =?utf-8?B?QkREa3N4UlY2U2lxaW8vejNnMGhHam1QRXZQNUNNeEZWMzdidVNwSk1JY3BV?=
 =?utf-8?B?bnNyQ3NpeU5xRm9tVjdXZTRlRkJyT0w4ZHJMNXR2UzZQWFJ6Vm5CTGNtdDls?=
 =?utf-8?B?Z00zYUNuYmdiNFZDT2orOEhEcHd0NDVjNmdBaVlFcXYxb1ZOL29ERHFsRmxM?=
 =?utf-8?B?YVhiMnNXcFhtUU1OT1BaYmdlMjgxUXRoQ0tRY0VxZUo4WHgrbkx3cndGdXl2?=
 =?utf-8?Q?2c+k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee61445-d58e-4bc3-b458-08dd8e1b7f02
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 10:31:30.5446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4Cn+OknnJryY9xNP39AfY2RxvzEm3RDFgfXEWhLvveou05E3lVWUhHzC/NWAC96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230



On 08/05/2025 12:30, Stewart Hildebrand wrote:
> On 5/8/25 02:56, Orzel, Michal wrote:
>> On 05/05/2025 09:52, Orzel, Michal wrote:
>>>
>>>
>>> On 05/05/2025 04:56, Stewart Hildebrand wrote:
>>>> Erroneous logic was duplicated from add_ext_regions() into
>>>> add_hwdom_free_regions(). Frame numbers are converted to addresses, but
>>>> the end address (e) is rounded down to page size alignment. The logic to
>>>> calculate the size assumes e points to the last address, not page,
>>>> effectively leading to the region size being erroneously calculated to
>>>> be 2M smaller than the actual size of the region.
>>>>
>>>> Fix by adding 1 to the frame number before converting back to address.
>>>>
>>>> Fixes: 02975cc38389 ("xen/arm: permit non direct-mapped Dom0 construction")
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Acked-by: Michal Orzel <michal.orzel@amd.com>
>>
>> I wanted to commit your fixes but rebase is required after recent dom0less code
>> movement. Please do.
> 
> Yes, I have already rebased locally. I'll send later today. Is it okay
> to keep your A-b tag?
Yes, of course.

~Michal



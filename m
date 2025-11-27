Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07664C9001B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 20:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174337.1499285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOhcI-0003B6-Fc; Thu, 27 Nov 2025 19:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174337.1499285; Thu, 27 Nov 2025 19:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOhcI-00039e-CV; Thu, 27 Nov 2025 19:25:22 +0000
Received: by outflank-mailman (input) for mailman id 1174337;
 Thu, 27 Nov 2025 19:25:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOhcG-00039Y-MX
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 19:25:20 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdff7a1e-cbc6-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 20:25:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB5961.namprd03.prod.outlook.com (2603:10b6:408:132::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 19:25:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 19:25:09 +0000
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
X-Inumbo-ID: cdff7a1e-cbc6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k84rRTzUGWKsKUsf5wB8gU7e0AAjJZHv1El2eJfq/iT1g6Rwr9zJTy3vqZg7LVg7xXwG/SiZ438Fn9NIT1L3xlBRxYy9yIe3O/8CLFO3uwfCH2klb90v/5J1pUaIvarUQlJVxoAXGh+OneOcpoaFwT7xbqpbWCyrbd08vPsJKMRZKThv8FqtS4p/F/1BqjVt9Mcc1RTcUGDQb6EpTJ7NhNwP47zKArOZCBtaUunZsXXAAfpMGJ812Kzhj8GmwWHvSDNIn3LzcZeyy9VzZv4Vh+K/V/dfIi6GlY0njN6LmybIQcheXPjdezuIZXj2SDAzcLVKioo38JcfVFORlgLsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HNCP5jAwcxGyO2UM6DcXNhG3jcYtke2rCMfTOwjTsM=;
 b=Py+aBuPF/7RRov4aTDmX9r72sp6oHsq9NRkOcc8wzWVLGh9Co4+5Cr6uHjRtStY5KZdgK3gRlTjvvBaDDigxnEpJbVcMdRxkcHYjhKap1bSIbtjBL4x1iLn5RpDizA7a8zvqaFq2w+bmrrx5E0zdcW0j58ksPc6efp9sWV5d6qG4DpgcNuQLSaqHMnqpHg56zBtF3z6iiqEzcPfs1nOLN26MB/Q5QqTXAKWIIGEKBd/FCSqBQB3u0dArFZH+PjqiTmNliWlXgNbU/KWRs0UyTVQgf6Ii5cI2lZlfz5telhbqjvYuo72iAaXN9Lm6p+Lz9dZU81huqFHqfR2VNBCK5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HNCP5jAwcxGyO2UM6DcXNhG3jcYtke2rCMfTOwjTsM=;
 b=s+LY+noI5WEgyQA35grfo4YtxBaDckzYIJwPYOcFSf8V4cu60A9G/Z4h9NScyUJ/imrYhhLjyc46XctuX/WsPlJ8GiQf4A7wlL6cAeJ7UylJMIpzAu+L2qjbUknGtye9TpWhg564o+NzV7v9E0JijLftk5aR3jcnFIbd2sxO1lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7b03017a-139e-465d-ab3b-4a504dc8c8d9@citrix.com>
Date: Thu, 27 Nov 2025 19:25:05 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH 7/8] symbols: drop symbols-dummy.c
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <639fb816-c2f6-45d6-9081-238a6b3c5c08@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <639fb816-c2f6-45d6-9081-238a6b3c5c08@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 228e8d0b-af91-44cc-7c37-08de2deaad9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFVEMkFsblhCa1I0WTh6MlRnS0FhTUY4SWNxQWdpT3MrRlhDazVMeW5TSk4w?=
 =?utf-8?B?Z2xXQTA2VTJEbW9pM3FZbERUSDJWMElZNkJvbXZuQUNMaVJlTDV4bUdYbDlG?=
 =?utf-8?B?eEhoUm4vRHR1ZytHdWRKL2ZRUjFHdGYvOC95L0V5YzdYK2xRdzlMQjdjejFy?=
 =?utf-8?B?bldsSXFYSGlGTks1Vk5yYlFZNHlpTDlaZnZxY3cyZ2V0TkJ1QUhKdzh5eVUv?=
 =?utf-8?B?ZW9kZFJhMmtHRjhJd2o0UzNSY1hJZ1ZqN3ZNZlF5SjVteHNqNVM5K1NESXlC?=
 =?utf-8?B?dVROSTBjQVUvYlhiYzhxczA3VUdVNGFSakZjUTY1V0lucDNFSjdjVXZyL0Uv?=
 =?utf-8?B?MGhRTG5Tbm9SQThTQVppTjVsbE5PdHB3cGkyQkZOOUl1L29IOGJNSUtaWXE2?=
 =?utf-8?B?TUVnaTNzeWgxUFZNWUY4YzNKN3FHNkhaY013Si83ODZEM252cEdMYUxlVkhs?=
 =?utf-8?B?b2NRMnREMTZZektoajFQOFdkN0MwdWdCNG1MTEg1eWJlRWRBYkxSQzRDcXNy?=
 =?utf-8?B?OWF4WHllL1A3anZjNGl2QndRSjlzZDFTaFE3SXRYZmlnUGFTd0ZkQ09YTHky?=
 =?utf-8?B?UkpDZjRDU0pGYWYxM2czTXAzMkdCaVJ1TGFFUldNQWg3Y2xITWphODFoTzZI?=
 =?utf-8?B?aGZ6a0pGdVRnZ0tDV3ZZdXBrekxxc3htaVRGaXYveTdzdy9ta2plUnQ1NVIv?=
 =?utf-8?B?U2xsNFdlcHRsa2RjTG0rZk1xQ2xJWGxVSEtlelN3dk40UVFVNDhuQXIrL1BZ?=
 =?utf-8?B?QXA0b01KbUhEajRIaHByMFc1N0dEcXM5bVA2UDIrUmp6UE14T0ZIWjMvY3ly?=
 =?utf-8?B?TTJiMWcwU0phekg0VHRVOHJKeGt0QXdKWE9nUmdjY3V2TWVFTDBMMTY3M3pS?=
 =?utf-8?B?R2tuY1pJbXdQWUUzSmZXS25XelJhOHFuS1p4TVJmb1k0WHZaMFNWVGQ5dTNr?=
 =?utf-8?B?N1FEVldWemVpeEliUWdwZTdiWkxwa285OWtuL3R2M2VPZzlycVp2b1dZSExa?=
 =?utf-8?B?SE9ZaVBmT01RaFlrWGlCbDMwOGYzMUg1TUhTa3hCcnFzYTB0UGhKN0NodTZM?=
 =?utf-8?B?SWtwWkVlblFTMm9SY3pWLzUxU3BMbzJVdGEvNnpGVldjTEpWT3p1Z0EvM2Vr?=
 =?utf-8?B?bzRSRiszYURnVmVVT2tldHY4aUZnTnJPK0RLcTZRQWlobkt1RHJtd3NoN1Uy?=
 =?utf-8?B?YjVnZGRQejRxQjJjMUpMbm5IUCtxVmV4WGptU0V1UEc3dEEzRGJOdnhRWk81?=
 =?utf-8?B?a211dGhpWklBeEhkS3VWdFBFMjlVMWJYTVhaN0FLQU10THIrKzdSdDgrWnZJ?=
 =?utf-8?B?Zms3Y1N6WUordWplNjd4UUV5UUZMcGNEQ3lyNHFaSUljc3ppQTl5aTRiTWV1?=
 =?utf-8?B?Rk5zOUFvVUVoOE92UWFsWTdQZ1pnVWkwSFdZNUV5K1BBUlRmTERRN0RNaWJl?=
 =?utf-8?B?MjRvdEtUSEgyeFMxMlo4SUVGUmd0S2dLL0MwWk83clprVXk3WlZFL1NoWVE3?=
 =?utf-8?B?Uk9Ua2pvZTV5SUNYSTJNd0JRU2dENURzVzRhRXhYQnhVT0JWUENOWlJZYnhV?=
 =?utf-8?B?QVAvU0ZkYy9yRnBKWk9jTDhDNUNCcGIrbEQyRVZRc1F2Y3IzVEpXRXgrdFBs?=
 =?utf-8?B?SWZqcFkxRVE0UHJLQmc5QVBpS3djempOUDAyQzQ3L0NkZTA4eU1zRVNUZXdi?=
 =?utf-8?B?KzRucWRjSEI3L0czT0NRc3dBb0VZOWNsZkpMKzFZQy9NYW4ybDdTV3FBNFp0?=
 =?utf-8?B?dHl0VlNXVzFYRE5CZVdIVk83bHhYQm1KbnVVczloMlVXeUNyQ2ZXcXV6NUtu?=
 =?utf-8?B?MDQ1cVFHOVhoYnV3NmJ6ZTBnZFQ3RFlaRE1RSEZVbGRSSnJHNHMwS2RiQ2hk?=
 =?utf-8?B?NmszOG9DOHBsSUxYSENGOXVwWmdoazFqRFRCYlVXNXlqUjd0dHgrbVRRVmhL?=
 =?utf-8?Q?U/hrCEqPjfqBEUouLkS7VKOALI3jxMJM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWd2QWx5MDBvTFNiK3pGSVBPRVpXbHA2NkxQU0NCNUdHQ0lmNEVjMlFEKzdj?=
 =?utf-8?B?Y0dRSExqNXplY05vZ09yRTh5dFh0d0QreDc2cFExNjJxQ1BCMGZmQ2IvZ1hh?=
 =?utf-8?B?QnQ1bzZMTWZUWEhvOXlYSDB1dWJ3Y28rSGVoZTZTSWxUNDRZSytmZ2pYZTVK?=
 =?utf-8?B?UFVMN2tJQlY1TTRpMHJ0ZmhZUHNKSWFyMVB1eFNTMXVHZWE5NnRPUlkzVjBL?=
 =?utf-8?B?UmEwcHRFaFpSWVN2V1NpcUk0NU1lNnNMUWpzb0kyUVlyMmhuRitlNHRXSTNy?=
 =?utf-8?B?aDdUYjZxVWZvU1hxV0VJSmtSMll3OE1XVWhmUk13RHZBMDNNcVhRZkxyL3I0?=
 =?utf-8?B?SFFHd2tYRWJjSk1ZZVZ5c3lWTzQvMkYxOCtjMDM1elpmRnJybm1IcTFzR2lX?=
 =?utf-8?B?YmJuWk1lc3J2UkhwV3FjbHNEaGg2dklsa1FGTzdlenJVYnF6MEF0WExvc2tG?=
 =?utf-8?B?dC9VQ2NhUmhmRTVvZzJrUXk1R3VjWWp6Sk1GSEhWQW16UG1rMk1FeDlHTGVZ?=
 =?utf-8?B?Mlh5N1FoS0w0bjkyTzlzbk53UHNXVWZUbDBzU3MvaTVNOFY3R0VkRmFEQWVS?=
 =?utf-8?B?TGRBZzJvQ0ZrWnVSUjB0YXBxeW1uOGYvNFRuMGx6TGJUNHlRS3hEUmRRN1JS?=
 =?utf-8?B?YWJrbEhkb1o0UFRDOHhJQXlJcmwvQ0VOUXFtUHJLNk13Ti9DTHNPaVFSM0Ra?=
 =?utf-8?B?M09CQm0vckZBNWpCemJDSk1jSE1pSndWT0RjWmdsMXE3a25HRGx6aTRuanZH?=
 =?utf-8?B?TlJYSDJuUzNkL2ZMVGI3UjFGYTlDV1MxWklMNjRub3N1UlBwWnJpT3ZjQWpq?=
 =?utf-8?B?VlA1UU5DVXY1VCtXdXJYNlR6NEhUTnZSZlB0eHgyMHhINnI5b2h6eUdSV2hh?=
 =?utf-8?B?bXZqenhhcDlIa2I5V2l1c3VyN05uZVFqaUczZFU1WmY0K25FWVZMVHVrN0dO?=
 =?utf-8?B?dVlDRm1VemIrcy9pWVZtVlV2TCt6SGp1cHBaTmhMTnpCUWdLbjZwSTZtallZ?=
 =?utf-8?B?Rkp3d2cvWll3N1NFMHZiNUVMS3h5czl2SXVzckE5OEpvRmZIa1FGcVlQN3gr?=
 =?utf-8?B?Tm9EVHRqQ2lNemo2dXFCYm5wZnAyWTJJTWdUYWVaV3RhU1hqSHRxb3RVbHQ3?=
 =?utf-8?B?WG1xVVJEUGx6UVB3RjQrN05HWXhCREo4YUxaT0lwZjZXdmhKeTZjaDV1OUFP?=
 =?utf-8?B?RmxxcW4vRDBsQlBSbXZsM3gxWnl3Mm51bmM4d2doTVdXeWZ1N2V6bUM1Q3B0?=
 =?utf-8?B?TCs4MVFVZ3RrcmRoUnkyNlVxSlRqVnM5SlBLWnliZkFmQlQvak9BNHA4M2p2?=
 =?utf-8?B?cFVYWmlBdGZIMEQwYjZ1UjFmbUpTVkRSRGhvYUlDT2psT3pwQWFpZFBwQVlj?=
 =?utf-8?B?bmZ3UUpQY2xWaUpCRkk4cUdyNytWNHZXUWdvbnhJVnhRaWNVMG9xRUhaNVdz?=
 =?utf-8?B?eEQ4LzFSc3NxM3BhUXFtdTI0TzZNV3Q1WUxGMmhvZ1gxcXBEUDBGRnEyNHRJ?=
 =?utf-8?B?ZlFrNjhCQ3Q4NUMvYmtBWVdBQ1ppUVdxOTRhdTNYcWtwZ3ZtZCtYWWsvLzhO?=
 =?utf-8?B?RGo5MzFpTEVScGh5TVFiQUFYcG1UdzI0WEZ1NGNueDhocnZDNXc0SXVXbWdW?=
 =?utf-8?B?aDdpWHM4djFlenFOZXJhN3ZNUVpPb1dSRWhvYUhaSldaQ1RxU0dzZmo5U1Ur?=
 =?utf-8?B?Q3BadTZMdUFpUlBja3hCUkdadWs0U0QzY0FYR05oTTB6aUNoMWtGaUloRk15?=
 =?utf-8?B?WVB2blFMZmgzK3c1Y2pxNUVsQVJLTXRoRkdwem1sVGdjWXVOYk5kb2VMMm9v?=
 =?utf-8?B?eFppeDU2aXJrTjFDWU1ybVJXdGdPaDV1WE5rbm4yRlRhWUZzSFkrMXNVekRk?=
 =?utf-8?B?RXd3aFlReTBoN0thZEZaaDY0Z1VHZTViR21iZ2NhUUFUeFJwQk44RXk4UVAr?=
 =?utf-8?B?R3pQZStQdjNYWmpHa0IzYUU3WC92TDlmMlhTR0pPQ0JrS1dLdDN2cXZxQVBq?=
 =?utf-8?B?alM4UFh3OGlSakkwWWtCcGVRVDVwdGJrN055T1haN3NsSWtjTFhFSjVvdlhn?=
 =?utf-8?B?cnY0TlFaR0ZzaDRZWnRZaml4eHBlSnpNdTd2cy9BSEFyNVpKc2M5OU5SSmhm?=
 =?utf-8?B?U0RzRGk2MXZaZ09iMHZtYTNWUm9iOWkyUVpsSWlZdjVwUnZ6eHhjZ3l1Rlk0?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228e8d0b-af91-44cc-7c37-08de2deaad9f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 19:25:09.3945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwKzyjSiFJp1YIWkv2aFR5PnLa8Cipl2gv0ADIQj7js7AQB0VdMVYtpSl73s17bHsKbfFnYpZMqKR5Yc9DnEXvkCCuV0XARlP3UMv7qSBww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5961

On 26/11/2025 1:47 pm, Jan Beulich wrote:
> No architecture using it anymore, we can as well get rid of it.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Should we also drop common/symbols.h again then, by moving its contents
> back into common/symbols.c?

Probably.

~Andrew


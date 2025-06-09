Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC208AD192F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 09:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010121.1388246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOXB6-0000uL-Bm; Mon, 09 Jun 2025 07:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010121.1388246; Mon, 09 Jun 2025 07:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOXB6-0000sS-92; Mon, 09 Jun 2025 07:44:20 +0000
Received: by outflank-mailman (input) for mailman id 1010121;
 Mon, 09 Jun 2025 07:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1N5q=YY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uOXB4-0000sM-VL
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 07:44:18 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:2418::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 861f0378-4505-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 09:44:08 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH8PR12MB7205.namprd12.prod.outlook.com (2603:10b6:510:227::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Mon, 9 Jun
 2025 07:44:04 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Mon, 9 Jun 2025
 07:44:04 +0000
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
X-Inumbo-ID: 861f0378-4505-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OojlPjAIyureiYJdgeLVSLIlhCiKfYjYeIfzHstzYlrNhu2Bap5SGHTYFKKfMn1gcILBnBIzvEct48czcrln8LPeFdL8zyFXWzsTyHr3k2hxHVqXhsmvtt8iaMit9ptvcgfoqwwAAwwiZlTF/Wm+BgGJ3h92Dxj1kAPtwFcfx5KiVRQMkFHUclYGDyLW8keuosGX2oR8zK7937Bm9FcvEWT26w58BPFUuZ/sEUWjPUwZgYgc6g6NFNFjvcVe9u8YLCd45y7BrXiNKtn3leASIcoNYGpSNlffHhZncqUkn4iLyiuLtbb00PNrVtEnEnS67Hcn1XK1NJfnY7N9bDjMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbZq1FlxOZLsXAQgS6CVyajnSwlb5nFirlVj6n4k11U=;
 b=CPkpb5FThayMWbhg2up+z3A3AbnxHGsNqTNqm8nS2ods3b2fdA5bacuL00lB7r90KBg6dsMx6Zgw+5gXT0Q1yfvnDdj7YPCdXO6dDBwnyb+5FBHpMemYtMslKGexQN+Bi4bRrU+NfnMzF8RaEs7j4dve9QWjRKM2zyX25x01S03HhKzkcZvqM0d9sr4mFkue4X++bdB85hGmQSM0/FESZkExUP3jdyLdeyh6COjreMi23lQmEWoY3piuBHk2x2rEEF6LBXbDIZJUBfBSfLTAzEszANtERXnt2gSoIvic3vTkN+NPetMTY4/IoDWE49fwC3kH/Y41hm8yOkk+D6LdHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbZq1FlxOZLsXAQgS6CVyajnSwlb5nFirlVj6n4k11U=;
 b=GrmXp6fSJePqWybEbE74og6acNWWW4xyWPhCYrKibVVlEyx/S9xLcEZqOssz9PgdI4pP/7tgRet2X1ELryuISEsRw1c68R+X9qUoMSl0ZtCWyrTryjj1jERDyQNOhWhJLaABQyXqZlnz28oA2ULNMEx9o9AM13x3UEKM1Z2rnic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <976f7d40-c8fb-45a6-a7d1-1e5cfd36fb24@amd.com>
Date: Mon, 9 Jun 2025 09:44:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm/mpu: Provide access to the MPU region from the
 C code
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
 <20250606164854.1551148-4-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250606164854.1551148-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH8PR12MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a086494-5f0a-4841-0e58-08dda729681d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTZNbzhIL0ZKaytEQ1lIU01VZGtUNzRYbHV3aGhmMWlwb3Nxd3RiVHUveW5L?=
 =?utf-8?B?RHlPY3pGcW0yeDFrVDYrKzlCMkNZcjJvT212VnU0SlV2SWFNa3M3Tmk3K0NO?=
 =?utf-8?B?TU81ZDd2YTU4M201eXhFWnVDWWZQSWRISjRlcVFnblRFWWNtamptRFRYcEJB?=
 =?utf-8?B?WG05b0FtTUFvVjgxdkN0M0FrZzFKS0N6dGd0S2dqWlloU3pqaTFjRlBaMG0z?=
 =?utf-8?B?RnEvQzFFUXFJM1pHaVluTE5SRkhjRG5FQmVsdGgwaUVWNWVyVGdqWHpwUjM3?=
 =?utf-8?B?Z0FxMEliRmR3RjNZUjl2RmsyS0JHYXZJamFudG9zek00RXFVOXdDdEtGYzlr?=
 =?utf-8?B?cVlwdTMxUWtQaHpDRHBXOUVtMjQvYUhZeHFicHRRMVlXZk1GbE5UTTVzWWtu?=
 =?utf-8?B?cFhyUlZSOC95MjhRaVNUSE41UlN5SlVNdDBvMWtsajFMR1h5NlcxOGxTWEVT?=
 =?utf-8?B?TncwUDJnaVU4dmRrWGkvZ1BsV0hEUWxVczUzd0FYeFlWc3N3WHo0RktsNjE3?=
 =?utf-8?B?OE5iK1RISXRjamZPTkR6Mm1xazBlNmtKOUxOelhXNG8wQzhQMDdrY0J4NDY4?=
 =?utf-8?B?TzREQXNDQzRFVURPUHZBYkdnN2pGL2tCVzZnTUgzTWNoajRnb1hLZUYwNGlo?=
 =?utf-8?B?eVhOYUJydHZpek5iYTh0YWRJK3VLdTZzRTc5eXc3bW9RVTJGSWF5eVlObmxT?=
 =?utf-8?B?S1djSjlLUjZJaVh0ODhkaXJWM2VGcGVqWFV6T3BDWEtJTUVDdFhGdlZuWlhK?=
 =?utf-8?B?VnlBMGlQczF3RndYZ1RXcUN1Z2VPVWllU3RwelU0WjB6NW1walRTaUcvUU1G?=
 =?utf-8?B?bmVPVmpTRVRBZEw4RXpnT2poMU9TUFVob01JRTRXcWs2M0N1Sm5GMU5odDRM?=
 =?utf-8?B?elJ1VXlZRDVNVmlOaVdXZmNoN1Nhek1xMUl6VlNhV1E5ZUVLenZmd3M4T2Vo?=
 =?utf-8?B?YVhrSURaOUJZUUN3dGJRVmRDWjFEalh0QWJQNHNMKzlhbUdhakhCOG5DVkNP?=
 =?utf-8?B?cGJnaWc0UnlYMklTZUlZV0tlZ0Jsb0FjYStKL21GcS9kOXFXQnJNWWYzd29v?=
 =?utf-8?B?MDdEQjljOU9XWkdhbGcyU3ZNTXgyT1RaNndUMzlxekRSYkJkWldwSzF2ZXJI?=
 =?utf-8?B?QVpVcmVrazRTY2xKSjhNaEQ5QmFpZklQMXJnSGJIWDIyUWcvdncxR0dyQTJC?=
 =?utf-8?B?czhoY0hTWGE1a1gydktsNytHQ3EySmE0TUJJc0RHUzJzQjlJeGlVd1FtUG9L?=
 =?utf-8?B?MStKZUpDajUxQkEzZFNKam1vWDZRODIwRTVVY2V6bkJKVUxDTFhXTEVuVnZZ?=
 =?utf-8?B?OWNqV0lZcFNTMHJsczk3WGlGcGRwYnB0bW1QREdHOThEMjhiK3NIR3lUcU9R?=
 =?utf-8?B?TjRKTU1BY29MUnY5Uzh2dFpVUzFtWXFpVDBHRUVTeUN2MUI1K2hQaXVDOTNS?=
 =?utf-8?B?bU5IdzgrbEhWeWVVRlUvcnIvQVVWVWovelROeGpqcERuQUV1bDVKTHlZd0NF?=
 =?utf-8?B?Wkp0RXp5amJuSjJuOEhuZHpZQkRoQUx5MXRsd0U2dkJHZjJ6dVcycWxnVE41?=
 =?utf-8?B?QXB4NjBqOUVjTExsMWNwTWx1VFRUZDdpMHB6UGROeVI3U3o5Q2xjSzkyVmVs?=
 =?utf-8?B?TWh1UHJ2L0IwblczQUdTR2tFRGJkeG5PYVVBWlMvbzQ0bWd0UVdqeUlTMi9S?=
 =?utf-8?B?cjI2MFNMU0xWc1JMK2FNNjU0bTJ5T3RnVEp5R1N4OHNsOHlJNzhZSGFIL0hl?=
 =?utf-8?B?QkhjL1lrb0xabkNDb3ZDc2dxdDNuQUNaYlcvYktZMFppb3ZGQThVUUhROUVH?=
 =?utf-8?B?RmZMTXRUVnhyclRIZkZjNzRNWEduOW9QME5DSXUyUGpFVU1nRVBmcjJabWF2?=
 =?utf-8?B?MUxQRm85TEpjbXFtRFV4WnVXUWdOOFZqTkgyMklYNk04ek1jbTlLZG43M2l2?=
 =?utf-8?Q?cWvVS9f1pK8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzBOZEpNZDcwd09mQkN0QzhSTGtWYmZKcFFXT2x3U3RoSDcwMjBDMlMvdmpL?=
 =?utf-8?B?M09sNmNCQkJjUHNxWTFTTXNQZnA3cFljZ3V6dnBKUmllZTQwSmdocWFoZnZr?=
 =?utf-8?B?elk0c2VvNnkvMGpicVNUblJ3b2dKMDNuYmZTRzZMV1dqaDZBVWdWdnFOZFND?=
 =?utf-8?B?MDJ1RTB4YWh4eWVrM1ZKblJRUVdGaFBBVVJrNzdJTDhrR3gwS1VHWEpXaWhp?=
 =?utf-8?B?MFRvekRsanhZaC9IRjZtNGhJMGV5bTdQdWNpbjV4YXZVV091eWVBa2NMcllL?=
 =?utf-8?B?anJtSWtzbUdTUkxIMXQzaUtWRFJNeTNVa2VDQkJkenJkTXdxWE1ZNW9xWDJL?=
 =?utf-8?B?Z0ZVbWJJUHlOUVpJNk41SU1RanFkU1NOc0pWVnlwelg4alBPSXFJVk0rNmFq?=
 =?utf-8?B?YUFFMUc0b0hRRHdSNGJaYmhMRkFFQzRLMm9BbzlXZ1RRTUxmVE4vVVFqNmRU?=
 =?utf-8?B?Tkl2c1ZzRWVCcHlrU1NNU0VnUXpGUUVFeVNLMUFXZTJzak51NkVCZVVmdlI2?=
 =?utf-8?B?NUFRdWMwVEE1TDZOaVY5M014TmlqNTh2NDRDUTR1VkRBKzBhcDdMeHBSZGo3?=
 =?utf-8?B?aVB4OGM2QkN1bFlDd1B4bVBPVjY4MDRaNlRtWk9uTnViWVdwNE9Fa2ZvV1Zv?=
 =?utf-8?B?L3lwaE1uR1hLVVRPNGhQVzlMb0MxczVERDFBblRPNldZTGJhZzVNemlITHJT?=
 =?utf-8?B?S1B5d3Y0WEV3T09pQ2lzWGt4N1hXbUtRMzVzRlFtRjJRN2dxTlhZSkJDS1Ex?=
 =?utf-8?B?SW5PRkgrcHRvd1dnZlQyS0IwRHVJY1J0TlhMS0JhR052ME1aOUJKbituUlpk?=
 =?utf-8?B?UjRjOHQyZ1pmTmVGOGRyV1JzZVIvUmZhaU9nRXpiTUtydG5nQkdVcnZLblp0?=
 =?utf-8?B?K044bWdTSDEzZWhCYkJGOHdRa1BjbHFQTE1FU3dsYVRyRnNNUGs3MitPeHlL?=
 =?utf-8?B?MzQ4UlJnR1VvNEQ5WlRzbnE1M3VvUmFVQ3VGZGM1cHdiOEwzVHhCY3FFNGZT?=
 =?utf-8?B?K2d3aTF6V1BvdHdXQUR6SmtPb3dTMFp5RGNIaTJ5ZldQUXQva2w1YitqRDRS?=
 =?utf-8?B?ZTJBdXR2Qng1akZaSDVLcWU3Y3ZmNkdhR01VY3BaU2EwU3dGVVlKL1MwMVBO?=
 =?utf-8?B?NVVhUE1hQkFURXdJMjJXakFjTFphN2dISTZHN2hxVEVGeFhST2JvaGhqMFZj?=
 =?utf-8?B?U01SWlJ5V2NYcjJ3N054Qlp2YU11a2VjMnNVTnFNOFVZckJ5RmJXMUlBMUJK?=
 =?utf-8?B?U0ladmQrdm5Yb0U1VmNSU2t4QXYydVZBZ3YxRmM3QVFJdkxxV2ZJd1h2OUhm?=
 =?utf-8?B?ZDRWdjk5eGNYMVlwclU4WW5FTWNoOFZYUlVJU3BZMERlU2NpeWpJbzlMK2kr?=
 =?utf-8?B?ZEZvMG1MYlRsMkN4STU2TjJLTndJUTVMYjVwRGl6dWdUMlFCMnIrSzBQaGZQ?=
 =?utf-8?B?bkZHTW5tV1dtbnZJU2h4cVYxT3d3UnRXRWFkMVI0UVRBRkJBSkc2Y1dPNjJ5?=
 =?utf-8?B?T2ZDLzhkTm1uRVJ1bmh6Yjk3L2RDOE94UU44c3A4LzNBUXZhUGRYWFAwSW1H?=
 =?utf-8?B?eHVJSWEyWHdIQnc2ekUzN3lCSjA0aTVTNVZTdTFaUEtQNkZJNmZKQWIrV2ZQ?=
 =?utf-8?B?UTZ5VGpyWXk2VFZKY0l1V3NlMHp2MWpzc0pHbFVQRnZEUzU4bXlZNzZ2d1hS?=
 =?utf-8?B?WVhLKzBZMXdQQkFQeWliaFVhMXhFYXl0WXliYkViOS9wK3hINWlycTFNSjZO?=
 =?utf-8?B?Z2xGOWpJWmJjdUM2dktsazZlWmRvd2d1NDdPS0M0TWd1aE02Uy9UbE52MG9K?=
 =?utf-8?B?RDRUSHdwd0ZueFVrVURCd1ZlY005dHdHNkRZV1N3WXhLUVhpR3IyamIxNkRh?=
 =?utf-8?B?SGVWV2JFM1dHZlNqQ09ORXIyVnRuNEtNaElINGc0QW5kcm1HV2k3OFN0VjRk?=
 =?utf-8?B?TmxtbG5YUkNZdkloN21pcktGbzdCU2dBKytuT1c0TVNFVXIxaUZVR0lxVEhM?=
 =?utf-8?B?bUhlVG5YTmxodFh5VDFWT3JkSllpZVpjRjdsODQ2aHQwOEtxbEpSRGdvYVZF?=
 =?utf-8?B?SDFuSXdJRTBUV09JbHJjS2VIY3JsYkd3SjJkL0xDNDk0Vy9SODNUTGRkWjBR?=
 =?utf-8?Q?ab3GTw1cqaPTrMeGrQ1ZfoQth?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a086494-5f0a-4841-0e58-08dda729681d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 07:44:04.0456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FE5qBOPJ3gmRXm8R6N2CkROlq1l2k8X3z3cHmbDIPUtrU0PhHpS04xhB1ww+CtwT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7205



On 06/06/2025 18:48, Ayan Kumar Halder wrote:
> Enable the helper functions defined in mpu/mm.c and asm/mpu.h for ARM32.
> Define the register definitions for HPRBAR{0..31} and HPRLAR{0..31}.
> One can directly access the first 32 MPU regions using the above registers
> without the use of PRSELR.
> 
> Also fix the register definition for HPRLAR.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
It looks good apart from ...

[snip]

> @@ -98,7 +101,8 @@ static void prepare_selector(uint8_t *sel)
>          WRITE_SYSREG(cur_sel, PRSELR_EL2);
>          isb();
>      }
> -    *sel &= 0xFU;
> +    *sel = *sel & 0xFU;
this change. Why?

Apart from that:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOZrFtYXimmsGwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 18:22:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46B0113015
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 18:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225944.1532560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUxd-0006uS-HH; Mon, 09 Feb 2026 17:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225944.1532560; Mon, 09 Feb 2026 17:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUxd-0006rK-DV; Mon, 09 Feb 2026 17:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1225944;
 Mon, 09 Feb 2026 17:22:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dId=AN=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vpUxb-0006rE-K7
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 17:22:07 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d840ece7-05db-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 18:22:02 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB4962.namprd03.prod.outlook.com (2603:10b6:408:7b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Mon, 9 Feb
 2026 17:21:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 17:21:59 +0000
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
X-Inumbo-ID: d840ece7-05db-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/tu++OCsJpAoT9ktrFqMcVYrpmTPjvbLae/G+/r05mhfvBOerMnYPJAqxgOLDg9x17MiTBrQFiMba7Hfp4EC44SNiZlgHPD7eOykKt/xEoD1zt6fIhdrOREWxaWKjXGJvKXOshgV/mXRTssKYzmzTtWzfvKFAMD6NI7PB2wdFyND7j+I7E/zkaDzEc1KVpeUrVodr8wMCvmwVo5il60lNFlbjTBxmh3btIR5cYIE+oJCxEmZuOLzcnFOVACQeG0O6xjXzKSZL6Suo9oEbT5Kq2nETH2FX6/PDJiz2LB7VJhq1oPCzX3+HT8uBnL4m3yqb/xk9sx+G9JyaJbwWklsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HApS45dSd9cfOXWF5pJL07A/YdVE7EWdCUhex1T1wwU=;
 b=h0drqIPZFGjkcbVzgttDl3vFCa4my2jjxOmsvtEWu/FZMbSM9TmrmTZ4r6nvkDinfx3uRBosyoEJgOyU1Ngf/XpCBf7w5ybhXlgtiu26uOpIB1a7XjcbYkKVE91CVf/nxlX+HBkyUnZ2hm/ytcnqE2ZntoviCY5QS9OLi+PTB9fenBTLb0PXBQnxXpwtxONk9rT/Fx9nLBlr0NHCuD5VHqkpSiCL54iJbGtdKtRJdaBuBYwwEhsKsNlsLhsMl2TQUU1TMdTkpX0bUfdnG+SQvKGuNdsOYp1UKVTqsLoWEelVtGkUlFihtZLet8kKVn1Zwm0WrwcLUV1unUmVO2B//Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HApS45dSd9cfOXWF5pJL07A/YdVE7EWdCUhex1T1wwU=;
 b=s7rNDbzfIvgflVhWmXb6qrnDwugv5tpJ0B2jy8lJO4FyZZ5l20Tsd+n86Iq3yt7Hcgws0miM5DUBrs9UnIpN4N6MLYUZ5qQn6Ie0C+qTiyocf456+Qqjys3Hp0V97Xk7yHZdkL/cqsulnT/nRe0RsNlV/ZZwgobe6rEN6GLj2cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <650406ae-37a2-4752-b539-cc66535c77af@citrix.com>
Date: Mon, 9 Feb 2026 17:21:55 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/ioreq: Extend ioreq server to support multiple ioreq
 pages
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260209123025.2628513-1-julian.vetter@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260209123025.2628513-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB4962:EE_
X-MS-Office365-Filtering-Correlation-Id: b2fcc7d1-6cb0-4b42-fdeb-08de67ffbb42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDNEaXhBT0xDNzV4WXBHNlovazZ4RWg0clF5NiszN2ZCVm1qcFgyb2ZZMFdK?=
 =?utf-8?B?RUFhUWg5Y2wxc1lzelpaaGZ1Rm4rMjZld09TOWdZVFhwWHR0anc3cGNPUHlT?=
 =?utf-8?B?dnZVb2lpUTRzdUt0aWpuOENaQ1V6MTZlZStFR1NKY0xIOVBDYlFaTWIrUGV0?=
 =?utf-8?B?OU9IT0ptUmZYS2sxVFRxcEFxUmdoRG1uSDRsRmhxUWl4UkhuS2VONHZBQkZx?=
 =?utf-8?B?NmJoeTBMWFM3cnl2cTFVN0t3RUszODJtdmk4K0xCdFkzNUN1MFN3QVNIdTRq?=
 =?utf-8?B?SHRjeVBMTTVYRUZpN2FMazh6WWpmWkpTMEhVZWF6L002eGNQSXdHWVRVelFa?=
 =?utf-8?B?Rk0vSURPUGw3Kys5R01yeE5QRmVmK2tDQ05HZFFjUEVWd1ZRYlYwWHVPb2ZR?=
 =?utf-8?B?NWU0aXZzK0F2ckh4MjJMakc4M0xwaXVpVGdNQkNPOFBMUW1YTjFvQVQ1cDJX?=
 =?utf-8?B?ZGJZemJ6ZUtRZGFNd0hnVTFaelhRL0VkZFFYSmFxQjFQN3hFS3djaG1GdlZX?=
 =?utf-8?B?VkVnMTIzcG1sWVR0ZThBSVVVVjZUTGdOWDBkUnRjQjBZUnJyZnpINFJVa3BQ?=
 =?utf-8?B?U2p1Z21YK2VqMk00b0pQUWx4MHV5dEtWc1MrSC9FVTYvL3hEaHczQUJGbCtm?=
 =?utf-8?B?dTdUMFVzRitFVjZBeFUwTUhtMGZEM1ZpWWhsa0IyQnp6OXMvTm1jNDJrOE1B?=
 =?utf-8?B?QW9SZmc5eUFrYkYxNHNiMUZYWU9wcG1IWktnd2k1cGl2Vm5oakNqZmRWZ3Fx?=
 =?utf-8?B?bW1WV2QzL2tNdWlnZUpUaENZU280d2MxY1Z3MCsyU0krT2R2eTBPQkFZcWkx?=
 =?utf-8?B?YXg1TzV5ZUVEVmFTRmFnYStyam1MY1ArOUgwM1JtWlBQUDZaa01lR2VjcVlR?=
 =?utf-8?B?anZLL1VIaXFxMlFraTFzUDNCNzdXczRJSHFRajRQOU5pMGg1dm9CMHB2UUps?=
 =?utf-8?B?Snk0NEJzZEN1SHFDcnRpNXJBTW9PdU12eERsWXJhMzVIV1lyYWFydEh0Skl0?=
 =?utf-8?B?RlZ0NlduUDYwVUtkYUduQUVDQUVmd25yWkJsdnVnZG1qZ2FUeFdnMVNjNmpv?=
 =?utf-8?B?NUx0MTdmcWZjVkx4ZGFtQjZWQ0FZL3RUcnlhc1BXN2Y1UWY2dDhjMXJDOHhZ?=
 =?utf-8?B?U2REWDBhdlZzTHA1MFJxb0ZHQkdHMU4xdUdGb1NPb2hqeFVybGZPSmx1aTJw?=
 =?utf-8?B?Mm9GeUFPbXJzLy9JdUI1cVNJcUVGeEErU05rTU95bUF2T0lQa2dBUXkyb25r?=
 =?utf-8?B?NC9nK2FMMHEwaUp6cS9YL25VNjVvQktwaTFCRkNQbzRNRlo0Y1F4alcreDhZ?=
 =?utf-8?B?UUVibkVaK1F1cnpmOTdKSG0xMllkazVEenJNMEhXSWthZHY2T1YvcXQ1Z1Uy?=
 =?utf-8?B?UVY0amRNSjNlZHY0blZNMG1zVkM5bTBJQlpBS1drQUVqNmhiUlFRUFR2Q2RT?=
 =?utf-8?B?VWlJUTJtWkNmUHV3V3ZPejNHdzFBRm1IUUhsWVUwckUrNFNka3FiaW9yb0k5?=
 =?utf-8?B?K1QwbmxOVVJZVTBiUkFaRXhVNERZWXlaaEljQU9xMVB6b0h6ZnhWZEVBekZQ?=
 =?utf-8?B?ZFhLUm5XejBPVFBvc1lHTkVQZlB2ZWY1UmdLWWRHNXFDWTgyc0F6OGVLK2Jw?=
 =?utf-8?B?TDZQVlgzanNuNGRsUTk5RnNSRGdhaDlXZWtCOGN3SmF1ckdCMGUxRDBRdHcx?=
 =?utf-8?B?NjREc3oxQjBaVUdTcHhRMFQ2d2lzUzRKVW53b2ZsYVJIUncrMnpOS2dUeXJq?=
 =?utf-8?B?ZVFqUkpaT1BpWDl1eVdsei9sZHlGQmZnb1FiZHc2K2ErZUd1cW91VTdXZXFx?=
 =?utf-8?B?bFJMREJGUElvb0JCQlBvYStnZjdjNFBqaHRIVUpUTGRqYkE0d0VpSC92Zkkr?=
 =?utf-8?B?N1VIeTdNZUJadCtpVlNTVDlWblV3SXRFM1lpQnBGWHNoeHVYampuNEpYc21L?=
 =?utf-8?B?dlBvRklzQnZyRlcvdkI5OTd6cGp2U0JHZ01xd0ZST25Fa2NVbm5NYXRkSkQr?=
 =?utf-8?B?NXZBLy9KenhOQjFpNjdoR1hhTFJqUzN3dzA3YlhxL3FZZU56YmZYVHRlcW9Q?=
 =?utf-8?B?cFQwK0piSktwUEdTMVVIZEhaZ09NRkUyejFLRlJoWHdLMUhaQ3hLc2ZOYjNn?=
 =?utf-8?Q?VKSA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXdTUGJTbEZndHBWNDVTZjRVOWVKOENhSTU4dEF0clpWWEtOMUxJR2NRWkZn?=
 =?utf-8?B?NURvSzhJZHkwbWdObm9KM0hyRC9BdFRXM0M2NWk1YURFbVcvRys1cVNZZjBn?=
 =?utf-8?B?RWZWZ205aVFyd2hudVVaWHREUXBCaWd6Y2hYaXMzM0FTWWlBajBTS3YwSjBx?=
 =?utf-8?B?Y3h1THJ0d0hzNHFmYXVISDZWVmtTanBXby9qSDF1MzBvYjhJcjVEbVB6dVB5?=
 =?utf-8?B?bHNpakpVVTA5cGcvVE1OT0dmbXdYUDMwUnhta0Y2UmRSRzN5R0hMajVxQzE4?=
 =?utf-8?B?TUNZS0svU1d2ZlVDOS8xcGdsQk1PUVRkdmxhb2xreEpVNFRrQWZQTGpPOEk4?=
 =?utf-8?B?MmRSb1E1ZWVNTFF2enlEbTZnZk90bGgzS1UyQitKUjkzRUtRaHNOZEVRVXdO?=
 =?utf-8?B?aTFKdHd5T0xaTGp5Qm9JWFJOb2JGRlhyTkVtSWlsRXVCOVFmVWNCc3pLUlYz?=
 =?utf-8?B?MUg3aEt1ZjA2eHI2OGFnbnQ0N1BrSjUzWXZxMkZNRDd2ZTdnNXA2ZllxOWIy?=
 =?utf-8?B?YzBEdnBZd3FWZGZWek5RSG9zbG14SXR3LzdsUVgrSktmVWc5dFpoSjJTM2FN?=
 =?utf-8?B?QVhUYzR5MlF3ZHk3dE1qR1RVSXlxNVlyYWN1TUZtY3V4NzZwWmZjVVRMSU5C?=
 =?utf-8?B?cUNhL2Z4b2l0L3pyMGNoZGVqSDc4QldLbzAzZDJPWm1Nb004Y2xIL1RvRnNo?=
 =?utf-8?B?QVdrVnh1d2RlSzBxYXpVL3MwMmo2b081eWY1MGRxSWlzdk5KZ2JLZEhaYVFx?=
 =?utf-8?B?OVdSU3FnUlFCYmFoWm5RdFV6ZzViaXFUUm1KZTJYdmdVSEJoSExkVFlZSzhO?=
 =?utf-8?B?RnFMcHdpQkxxL3J5VTlibUF4ZUVCVFloemtucjlHTTU0NFJvZm9FaTFMWStl?=
 =?utf-8?B?TlV4dFNHci8xYmJaQWtpTWhVY2hvbm5MOFZnaUg5NTRoL2EwUk1sWmpXTktO?=
 =?utf-8?B?MktqajY2a25kTk8zbTF5R0RxVU9BMFVRWC8veCs0OERIbXhFZjkyRnV0bm1T?=
 =?utf-8?B?YWpkRUhKNUhaYlRhVnc5V1Zxei95Y1dPbGE2OS9MQTJBaDZUSlB2SnNCZnZG?=
 =?utf-8?B?aFFFd2lQQTRaZGNGaEs2Y29BbndseHAxck9hdTBoNitqLzFYbEw0NEtxM3g1?=
 =?utf-8?B?Wm5KQjcwcjIxYVZCMjJsVmYzcTRWRnhuWkI4RGFmOGpTVU5WaFkvRzFmREdQ?=
 =?utf-8?B?QzREQXhYZXFobi85Z05ZSGxMeWdTSGlybVNlUEFKSGQ0WUFOK3dHZlNCS0dx?=
 =?utf-8?B?MlVackxweU4ra1RjWnVWRWtaNGlFUHRLK0dvZTFneWZkdW42SEJZdGdMUDc4?=
 =?utf-8?B?REdGRzByU2craHNkbVFSTExGWU9TaFpUWEZMQXRITU1iUVUyaktDMmlIVExi?=
 =?utf-8?B?SWN0TEEzejZjNzFvNDltd1VyYXNTd1piVk5XeE85a1h2VGxzYWNScmZOTHVM?=
 =?utf-8?B?djZVSFFRbzcyOEZFRDFuUTdhT3RwOWY2Z1ZxVmhwYjI1NXd5S2ZuVE5rNXd2?=
 =?utf-8?B?YjVCVGYxY2c1ZkV0MVc4QU1WaHcya0NRU2JXNVJkZzhKU0plMXRaR0M1ZWt3?=
 =?utf-8?B?QlVYTnUyeEpvQ3FLSWVFOFByZXU1YnZlYkZVZUhCZW5tQU1jQWhTTU5DNDVk?=
 =?utf-8?B?eGlPTHFoWGtINDVSSVpBU2FaQmpHaHN6Zm5ZS3U2RkkrY2tFQVhRWjhvd3BJ?=
 =?utf-8?B?N2VWRWdwcStrbzF1Y0RpSDdackdzeHBGUjhHR2NoRi95S0ZyZXh1c3lDWmxO?=
 =?utf-8?B?SlJXNHFIelFHUkJkbEZSd3JqcmdpandZUFRKNDhEZGpwdDBPbkFGbXlpODFq?=
 =?utf-8?B?Ky94eWR1dGRoYVVNdmRJMm9aUWdHV1g3ZUxuM3pIenhEVTJmamsyd3lGZU5K?=
 =?utf-8?B?aFFybmlESGJvZWlPS20rVzJRM1REUVBwZFJaS0MyNjlpanlMa0hsazZjb25w?=
 =?utf-8?B?K280VGdUWTBVOHlrT29Qblo4cEdkT3l1UW5NOUx0ZVBCZnhONVBBYlJrSncz?=
 =?utf-8?B?dXdKRTd3Qldrd2xVUXN4ZnNNdDAzcVNuT2diRzJPdHN4NERnTlZQcEM2eXhS?=
 =?utf-8?B?ZWNCdVVnY1FZa0pJUmNEUnBxWDIzK3ZUK1ZnRnBIS0NFMVVMVkR3ZkRYWUhp?=
 =?utf-8?B?ZXlid0piR1NjNUNSRmxNaHFGQW9RRjlSVGhmR1dYUVcvV1lJVlZCYmI4THRN?=
 =?utf-8?B?anI2VTU0ejVDSEdFMVN4c3ZyaWFudmlid0VKak00aU9KWlduQXRLMDFJSlFE?=
 =?utf-8?B?WmtucmFVMlo5Q0p0M0g5RVZDM21oT1lSWDFvR0gxRVJVS2Qvekt1bUU3TFJn?=
 =?utf-8?B?ZGtqWDczTjM1cFdOMGpVMTlKTWJ0VGlIY2tsZEVsSTlVcE44b3hsdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fcc7d1-6cb0-4b42-fdeb-08de67ffbb42
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 17:21:59.0200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXDGIUEzDm8W2MWaUp9YjMN9AERjB5J3GIADbxPOX3yhEl46s80+p14e3s+HeYlGRdtvKlEnrENFSFCnUvpqOti57Hs265MDjiBsEp39s2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4962
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A46B0113015
X-Rspamd-Action: no action

On 09/02/2026 12:30 pm, Julian Vetter wrote:
> A single shared ioreq page provides PAGE_SIZE/sizeof(struct ioreq) = 128
> slots, limiting HVM guests to 128 vCPUs. To support more vCPUs, extend
> the ioreq server to allocate multiple contiguous ioreq pages based on
> the max number of vCPUs.

This statement about the upper bound is correct, but it doesn't appear
to be what you implement.

> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index f5fd30ce12..13c638db53 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -95,12 +95,15 @@ static struct ioreq_server *get_ioreq_server(const struct domain *d,
>  
>  static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
>  {
> -    shared_iopage_t *p = s->ioreq.va;
> +    unsigned int vcpu_id = v->vcpu_id;
> +    unsigned int page_idx = vcpu_id / IOREQS_PER_PAGE;
> +    unsigned int slot_idx = vcpu_id % IOREQS_PER_PAGE;
> +    shared_iopage_t *p = s->ioreqs.page[page_idx].va;
>  
>      ASSERT((v == current) || !vcpu_runnable(v));
>      ASSERT(p != NULL);
>  
> -    return &p->vcpu_ioreq[v->vcpu_id];
> +    return &p->vcpu_ioreq[slot_idx];

Use xvmalloc_array().  It gives you contiguous VAs in Xen even if the
underlying memory is non-contiguous.

Notably it means you don't need to store the intermediate VAs, and this
final line stays the same.

>  }
>  
>  /*
> @@ -260,84 +263,120 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
>  
>  static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>  {
> -    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
>      struct page_info *page;
> +    unsigned int i, j, nr_pages = buf ? 1 : NR_IOREQ_PAGES;

This NR_IOREQ_PAGES needs to not be a constant.  From below, it's:

    DIV_ROUND_UP(HVM_MAX_VCPUS, IOREQS_PER_PAGE)

but wants to be:

    DIV_ROUND_UP(d->max_vcpus, IOREQS_PER_PAGE)

This way, small VMs only allocate one page, and only larger VMs allocate
more.

You probably want a predicate taking d as a parameter, to avoid
opencoding it everywhere.

>  
> -    if ( iorp->page )
> +    for ( i = 0; i < nr_pages; i++ )
>      {
> -        /*
> -         * If a guest frame has already been mapped (which may happen
> -         * on demand if ioreq_server_get_info() is called), then
> -         * allocating a page is not permitted.
> -         */
> -        if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
> -            return -EPERM;
> +        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
>  
> -        return 0;
> -    }
> +        if ( iorp->page )
> +        {
> +            /*
> +             * If a guest frame has already been mapped (which may happen
> +             * on demand if ioreq_server_get_info() is called), then
> +             * allocating a page is not permitted.
> +             */
> +            if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
> +                return -EPERM;
> +            continue;  /* Already allocated */

Allocation should be done in one location only, and should allocate
everything needed.

I suspect that most of this complexity will disappear when switching to
xvmalloc_array().

> +        }
>  
> -    page = alloc_domheap_page(s->target, MEMF_no_refcount);
> +        page = alloc_domheap_page(s->target, MEMF_no_refcount);
> +        if ( !page )
> +            goto fail;
>  
> -    if ( !page )
> -        return -ENOMEM;
> +        if ( !get_page_and_type(page, s->target, PGT_writable_page) )
> +        {
> +            /*
> +             * The domain can't possibly know about this page yet, so failure
> +             * here is a clear indication of something fishy going on.
> +             */
> +            put_page_alloc_ref(page);
> +            domain_crash(s->emulator);
> +            return -ENODATA;
> +        }
>  
> -    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
> -    {
> -        /*
> -         * The domain can't possibly know about this page yet, so failure
> -         * here is a clear indication of something fishy going on.
> -         */
> -        domain_crash(s->emulator);
> -        return -ENODATA;
> -    }
> +        /* Assign early so cleanup can find it */
> +        iorp->page = page;
>  
> -    iorp->va = __map_domain_page_global(page);
> -    if ( !iorp->va )
> -        goto fail;
> +        iorp->va = __map_domain_page_global(page);
> +        if ( !iorp->va )
> +            goto fail;
> +
> +        clear_page(iorp->va);
> +    }

As a note for the future, if you are doing a bulk indent/deindent, it's
generally better to do that in a prep patch.  Such patches are trivial
to review (git diff --ignore-all-space returns empty), and it makes the
subsequent change in logic legible.

> - fail:
> -    put_page_alloc_ref(page);
> -    put_page_and_type(page);
> +fail:

For reasons of differing tooling, labels have a minimum of one space
before them.

> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
> index e86f0869fa..8604311cb4 100644
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -19,9 +19,16 @@
>  #ifndef __XEN_IOREQ_H__
>  #define __XEN_IOREQ_H__
>  
> +#include <xen/lib.h>

xen/macros.h please.  We're trying to remove lib.h

>  #include <xen/sched.h>
>  
>  #include <public/hvm/dm_op.h>
> +#include <public/hvm/hvm_info_table.h>
> +#include <public/hvm/ioreq.h>

Why all 3?

> +
> +/* 4096 / 32 = 128 ioreq slots per page */
> +#define IOREQS_PER_PAGE  (PAGE_SIZE / sizeof(struct ioreq))
> +#define NR_IOREQ_PAGES   DIV_ROUND_UP(HVM_MAX_VCPUS, IOREQS_PER_PAGE)

IOERQS_PER_PAGE is fine to stay, but as indicated, NR_IOREQ_PAGES needs
adjusting.

~Andrew


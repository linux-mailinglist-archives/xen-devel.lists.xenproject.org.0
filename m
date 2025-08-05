Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AAAB1BA53
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 20:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070856.1434465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMYO-0001ZA-IU; Tue, 05 Aug 2025 18:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070856.1434465; Tue, 05 Aug 2025 18:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMYO-0001Xl-F3; Tue, 05 Aug 2025 18:38:28 +0000
Received: by outflank-mailman (input) for mailman id 1070856;
 Tue, 05 Aug 2025 18:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kSf=2R=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujMYM-0001Xf-TD
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 18:38:26 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ee692e4-722b-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 20:38:25 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9561.eurprd03.prod.outlook.com (2603:10a6:20b:59a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 18:38:21 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 18:38:21 +0000
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
X-Inumbo-ID: 5ee692e4-722b-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtvAXMesZBJFFvO4IZ6UBqQ3hbgoIO7oJlTEzVJCk8ZlWSiTDoIsDiWisknpOLMf3fEINcq82Z5VUM9oIE+GL4gnOwVrGAry23YgKpJ9wXM69yitBGLXXiypTViEV3pMHSyAwCfWIf11R3cxCoYphqO+yxyyBAXsCytGG1RDO9Vom6kOu4+ksvNmbVDtmheuUiFU+er+wuLATM4br0OC2LrZdeVTY0FywOxbBzq+A/6+0yTHAGW0g6p3EbLm4+OJAg0GfCMxbByvonaZ+LIGalyjk2JKWg/FUOAOwmb17HCexe5s9iB03joWcxtZpZFEGmWr2R27F9obDBUPAAN5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iA7n9sbPzi96niBfSOn2Vx2h/mbvxcfxyCsxxpvUEJk=;
 b=k8Nv9KL41KPs4SXIjWtcehRTs8IGI2nbZj6kJPWq2dhJRUJfPwIraJh0UBTfAxF8tYyvpMFHybGir7Nykro5XGzaI7Gjg3QF7gAWG/62Zwb+ytp168dhrIHoo/miqhnb5ce6YCvxrZ9e+Om/aaAkPWecVGcOD64/UcdM1vu2/0wx5TPDB+klllklLYrvpsFArZBLDx1URS+r/oHkQElbuzEMInl+rkwT7/nGBEx41QtxV2KBFn7rfOg0XwQen0EhMqbqZJT4XUzHlUDBXX0yGR3fP0sXbw5lWDzYpfvcqhlWEDWdI4dWZut7C2dAClnw7/BiTzIdckmdvK4at755cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iA7n9sbPzi96niBfSOn2Vx2h/mbvxcfxyCsxxpvUEJk=;
 b=p6yMu7gapZx+f87NOJs4Xx5WBTgFazLjKr991ihdQfdWDaVtkq2awzjJCDwTqSIA223p/QNTuPsMOuP70q4EHsP5AKTt6PML+7OZgQfVCRpHscpqDK68DTxlDpycKlT6MqdxSIkcSjg01yxEiTcbtYNsH086wVuAn/maR8KwDqDOdfWpSNSJk4sxG3xtTaglGHsycE6yM29NP2ncTjbIA0b5hqN/qNBySLkmtCvDI0JxBNASGABf6rE2O4Cdit5JWSnXJUT8q3aVoRfcC5g+vtXC0fwSTS2NLAYCX9WusuDi/7zxoOL60foj5/NdHx/9LTsCA106HL8o3Ioi8j8l0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <47e51e6d-ea3a-464e-9442-fa5f4329eabc@epam.com>
Date: Tue, 5 Aug 2025 21:38:19 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/dom0less: arm: fix hwdom 1:1 low memory
 allocation
To: Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250801155429.1402395-1-grygorii_strashko@epam.com>
 <7c867f77-3846-4b2a-a028-4dfb248a4fc2@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <7c867f77-3846-4b2a-a028-4dfb248a4fc2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS2PR03MB9561:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a416c46-d8c0-415b-5b21-08ddd44f40d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTVYb3hxaFVMa1BzRkdpajllMERVSkhnNWQwQUU1ZHo0YU4wa2RLeC9nVXM1?=
 =?utf-8?B?ZGJUakZFMWVIbVN3WjUzaW1WZjZIV3VxWTVFSkFsNEVGaGU0SkZxeGowMVdj?=
 =?utf-8?B?b0s1WE43ejhoNWNmWVdMZHJLQ2N0UlN2NDJoYVg2Z25aeFFHWDRlSVBBMTNQ?=
 =?utf-8?B?dzhOeVBOQmU5aFpiQUlCd1JPY3JaM3EyVk8xZEY5SDNsZjZEc0JUK0dsdGl6?=
 =?utf-8?B?N2x1VnI2QUk4bUk0cG12OG1hanhNaXUyT2NzOFViQzcwcm9hV0RsWlFjT3E1?=
 =?utf-8?B?MkNUR1o0S2NRU2dKODhGemE1UFZrcmpiYXRUVEFmR1ZxWHRiYjRVb0JzYW90?=
 =?utf-8?B?QTJoa0I5SzllWTl5WDVCcDNGNExVUkNjVTJ0aWJRZjRBdW1YSlFYVDNmaWJL?=
 =?utf-8?B?SGx1b2tOc2Z2WkJ0Q2dkZS9lOFp6Ull3amc4dmp3MCtpOGpLSWEzTFdEdHdI?=
 =?utf-8?B?VlJZcENUTmtiS1djOS9JYTdrbW00NjNWUGhBTVNYRVBDUFB1OE9wS2ZKN0JE?=
 =?utf-8?B?bG1hMlhZNGRsL0tZR0NDQlltZmhGSjU3MkE2dEtZaStRei94NThpME5pcFVM?=
 =?utf-8?B?SVVxWGlncGpjaFI2eDFZSXR4dlRValliYzlKUmlSYjZ4bU1wZzFIYmJvRzk3?=
 =?utf-8?B?ek1rUFlBdDh2NnJkNnJJQ2NkNWlIVkVPbVJSWDdrbkFYbGdGd2tiYVc2ZlJ0?=
 =?utf-8?B?d3pHMXZpM043M25aQVkvUStoY1h2bzRHZGJTMTdhK0VhNXZuUFJacFFCMGRR?=
 =?utf-8?B?VW1aZ1B5REpDYXZxL3QzZEZ5dmFiOWNuZytHcHJVN3VBZDRNUktRY2VYUkd3?=
 =?utf-8?B?UEVQQnlOeUdnVWdVMnZPSTJrNmJMSEhjbjVTOWVMTEtndW9pQm5WRkRyS294?=
 =?utf-8?B?M3hna3hPYjB2S2QrSTErWWVCbFVpUE51WTFYNEpUaFN6N2FpS080UFVxVno4?=
 =?utf-8?B?N2tFMDdkWEhNakdFMnQ2d2lNMG11K2c1MjFOYVF2N1YxMGlDeitFOGkzQ0F4?=
 =?utf-8?B?R0Q3UFlkUzhHajhCN00rQjErbTlHU3lJRzlqMEZBb2xLOEIxQW81K2twUkNM?=
 =?utf-8?B?NHZIMWF3cTcwU3JKVzkzL1pOY2ZrMkJSaTh1QkFXTU5BZENpbDN1SUwxdkdP?=
 =?utf-8?B?NDluOFBUWGw2UHllY0hnNzlteTN4OFlLeEpPTU9RRTlVOWx0cDNBTkIyY3pP?=
 =?utf-8?B?eWhsZkRrVnpiZmlhMXBhZ3Jxb2o2d0paTTEvQlcwOFUwRXhWZS9KbUhMZVhX?=
 =?utf-8?B?STRnYndZWTM4WVhZQy9aK0laTG1UNWw4OFBMYlZLWG1FQ0x2YTllejFseTJB?=
 =?utf-8?B?V1M5TktGRHRTQTRrUDF6a2dDcENpak85RHRJeEZ1d1BFT1JZK3laMG1oMCs0?=
 =?utf-8?B?Z0g5MHJrWGNCNjRCUjZ3MWFFSmdnK0tZaHRkRFc1S2J0eE84dU9henEzell3?=
 =?utf-8?B?QWxUWElNUk5iMEltM1h0Q2RKaFF4b2lwWGU3RU5jclN3dDRsQkkzN0tIMUFa?=
 =?utf-8?B?STViRUhlc1FQRXB5SWZMT1pUbC9taGRhU1pNMC9GL3NBQjltRzEzVVk5OUI3?=
 =?utf-8?B?cFdPalQxa0FTV3VPV3JKU2dTRnRQdG5melFLUXNkei9jRXp3TTZGa0FxT0RE?=
 =?utf-8?B?WWczcE0vd0RIM1pkenpqMEZ4eTRFU3hiU3Jxd0lXOFlLMS9ZbXY3bG96cGFj?=
 =?utf-8?B?N1Q2NjV0L28vSXk1QWRWUG10V25OWmJXRC9PT0VpeGxURll4a0FrMktnVE5V?=
 =?utf-8?B?bitGbjM0cVZMSHdLbWFsZ1M4cEpTeTNTOENzQ3RzRVBoUHQwcTBJY242TTRh?=
 =?utf-8?B?RWd2VVZDdlBTVXprMkU0NnFJOTIweCtuaTBtdlVhczljV05tclBZYkp5VlMw?=
 =?utf-8?B?QjhRdHd5cEhkTlZIZjdoZW4zNCtmTy8rdDRyVkcxUjdaV0VyVEk4UWg5MFFQ?=
 =?utf-8?Q?ekt45EMlQNc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TThZTy9JZ2lDdkZvdVJMMlNBTXVZWGZiTFlPWW1Wb1drNVpCSWI2a3pvelhE?=
 =?utf-8?B?U0t5cTd3TUUxRHFzRGQ4SDNueVVLTWVqbnF1R1ZhRWltSEFzQ0JGQ2pzUGpl?=
 =?utf-8?B?ODVpbjZ0aFhMU3JOTFZjSEdCVDRPbjRJa1R5eXBad1pveTJaUzJtaXdDK3I4?=
 =?utf-8?B?a2hqa1NFTDF3UllWY2w2MHpUTnRkVDl3ZDBGeU9MWHp4UG5Ya2s0VC9mZlpJ?=
 =?utf-8?B?L1l6TUlpMjFHczllS3VpMjQrVE9JRTNjRGpac1FtYWYrdU1QQzN5QmVQNDQ5?=
 =?utf-8?B?cTZtcWQxYk9FMERzQ1JwYUhFekpVemVvOXdmaW51VThrZUMySkJObU1kdDl3?=
 =?utf-8?B?cU9UdlM0SXNhZldzbVdocmFPZG9qR1NlSGdjc2lGTEFGQUZjb3dJSXFDY1Ny?=
 =?utf-8?B?MytWMWV5Q1VIS0l5WmtrZE50N2lMN1RXK3BVdXRYWXYzUkZBRDJ2Q2I1UUQy?=
 =?utf-8?B?L1pKWHlLUGVqM3VlZ1RQeVA4a3poK0I0VWVBTHJYZStNUnBkeDk4Z1BsNGxU?=
 =?utf-8?B?YXFoSzVGNnBOOUpsTW5UcVQyY2RrVXVObHhGeHdvUDRUQ3BOM1dyZGhQamZu?=
 =?utf-8?B?ZVZTaTk1L1BsRkE5a296Y1dablU2RE1QdGVaQ0ZXWXR0d3hOMkdoZG1SVGE5?=
 =?utf-8?B?VHZQSTQ1ZTdTclQ4aEZtb2Y1WHBhYW44aUkwVDdiSnJYVm8rWTdZZSs0UlFu?=
 =?utf-8?B?UmdESDFrdEMxWGpYVk93VDY5eWdJV1VIOTBNaXIwNjgxSEpyYXJHaDFaVHhO?=
 =?utf-8?B?OHc2UCs5K0ZBbFVGc2lVL0dma2ppOGNHWDRpTzRKZFlkNlljeHBwdHRvREVV?=
 =?utf-8?B?dG9VdzI3UFMxVTJHVUZJalVWMjUwNDRuY2NlS2ZHeG5SVW1XVUpTdEJHQnN6?=
 =?utf-8?B?STBiNnZHbnB5Wml3Q0hKY3RDYTVYREFpV1BGUmRXOXhVRm04L0l3elgrQWVq?=
 =?utf-8?B?Z1VHVC9oQWV0a0I1WVNJbHNrbUlPby9ncE5uR0RCLy9QRlV3bU9wYWp5OWpU?=
 =?utf-8?B?Mi84YTYyQW14d3RqREt1SlhBYTRwTlBIOVBoQlhpaWdodGJvUTZWc2RMN1p0?=
 =?utf-8?B?NG1LVXlDN1ZXcjVNTFdlMEY5UTJaNGVHNGxmM1dsU3BNRkhiVnpxbXRiZUJX?=
 =?utf-8?B?Z1Yvd2FSUUt5UGFaNVpTSjlTelJLQ1cvYStldXhsdklPOERsZ1FyVkZJeExX?=
 =?utf-8?B?SjhTWFc0UWZIU2wrOHlMc29mVitnMkxtNC9EalppdDVUTnZqcG5INVQ3d20v?=
 =?utf-8?B?MFdjMkVIZExoV1V3YWh2bE1aNDN2OTNNUlNleXduRk9wSXg2VFMvZTZBMzFF?=
 =?utf-8?B?S1E1OXdyNDNzSFJJNGlESEwvUEo4R0Y4azJXb1NBbkd5OXExcnROMzVtWlJ5?=
 =?utf-8?B?WDBaQlg1ejk0d0RudDkrMG1nNElvRUw2cHFVMWV0bUdEKzFna3RKQlE4U21n?=
 =?utf-8?B?UlNLQys1cFczcU5CZWNERzBGOERkYWl5RVVQb0tPeDBOZUFZaVA3anBxakpU?=
 =?utf-8?B?bThiV2U4TUpYaEhad2FRaHBCM0Z2WmpITUxrTGRBMTVKdGVlemlpVEtxb0FS?=
 =?utf-8?B?WE1lQXYyME9TaVdxTk8vWjZjR3JKMnRMbENFWCttbFp0bkJrdlczYW9uNW5R?=
 =?utf-8?B?TVZSZ0VHM1pXWmFVYmI4WVlRcjVTNlFmbUNSWWI3NG9DL3N2cTJLUzNKa3Nu?=
 =?utf-8?B?ZzdJL2dMOEd3MmU3QW5IQzU0aUthbEMzUmJLNE5oVXFpRUpxQWw4OVo2QUxF?=
 =?utf-8?B?VllXOERmYjBwVlMwNnRpRmFqRFpRV2hSS1BXNERUTm56U1pidDB2M1d3Zk9D?=
 =?utf-8?B?UnpxbThEQVpUT0NxN0JsR1FZME14ejJoQXUwRGg0ckYwbjRtcTB1dHJYL3lp?=
 =?utf-8?B?dEVub0tUZ1k3bVJkbXIzY0VidWZNSmlLUE85eWFOZjI0YjJEYkl2cndFRmpy?=
 =?utf-8?B?SnEwaVd5WkFEWEZwSGRkVDgrbDREWmg3SEd5TUozRmwzS1d6QkhIM28wSWJo?=
 =?utf-8?B?Uk1nVnJCYUJ4UDJ4UnFEMGFRZWJ0ZzZyTmsvYWpXMUJWNmg3MUlaZWhhd3FW?=
 =?utf-8?B?MmcwRS9wZ1pIeXZvZkN1eDNLUGRkOHFMc3BWbzhVV1ArYitrNmJEbWpJZDB5?=
 =?utf-8?B?SDhvWlEwaG1lMnFEcHRlVWUwbWdKWjJCY211bm05cUR6UWh2MWszSklYc0py?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a416c46-d8c0-415b-5b21-08ddd44f40d8
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:38:21.3780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ebu7M8wZ/qxQK6e+uhpJUcMd6cNNYvAyMkJulFWorR8GYR0hDVmHxC0dUeuJwaoRBZ2mg+pRhPwB/Jj/X6KeIs2ZiE1b8TTlHFAxcDQ8HZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9561

Hi Jason,

On 05.08.25 20:21, Jason Andryuk wrote:
> On 2025-08-01 11:54, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Call stack for dom0less hwdom case (1:1) memory:
>> create_domUs
>> |-construct_domU
>>    |-construct_hwdom()
>>      |-allocate_memory_11()
>>
>> And allocate_memory_11() uses "dom0_mem" as:
>> min_low_order =
>>    get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
>>
>> In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
>> which causes min_low_order to get high value > order and so no allocations
>> happens from low memory.
>>
>> Fix it, by using kinfo->unassigned_mem instead of "dom0_mem" has correct
>> memory size in both cases: regular dom0 boot and dom0less boot.
>>
>> Fixes: 43afe6f030244 ("xen/common: dom0less: introduce common dom0less-build.c")
> 
> I think I introduced this bug with the dom0less hwdom support, and the correct fixes is:
> 
> Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")
> 
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> dom0_mem is also mentioned in the comment on line 252.  With that changed as well:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


Will smth like below be ok?

   * We first allocate the largest allocation we can as low as we
   * can. This then becomes the first bank. This bank must be at least
- * 128MB (or dom0_mem if that is smaller).
+ * 128MB (or memory size requested for domain if that is smaller).


-- 
Best regards,
-grygorii



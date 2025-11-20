Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED20DC73D2E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:51:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167092.1493474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3CP-00029u-0I; Thu, 20 Nov 2025 11:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167092.1493474; Thu, 20 Nov 2025 11:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3CO-00028F-S6; Thu, 20 Nov 2025 11:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1167092;
 Thu, 20 Nov 2025 11:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM3CN-00027f-5U
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:51:39 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 422ed38d-c607-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 12:51:33 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7732.namprd03.prod.outlook.com (2603:10b6:408:281::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 11:51:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 11:51:30 +0000
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
X-Inumbo-ID: 422ed38d-c607-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcpfkAbCuc1Pk7d899DjKfnbBDE+lJqj0HS6/NtX9Pa50pzqoLMT4tNJljGetM5bqZFNAAhErlbnMvLrnyauR81VGIjQKLAKuRsoFcks5GxG7E72c8ziXnx9uuWOJzyewva820o+i69KQM19ssKo+nZ0OlC8H0ZrI0wIMIRrbHdpQack5HQcjE2bVQODZDzQ5pS1BpgvcD9Jhjb/miIFDWU5Jn7kUCaLRgpL+8+oLyBpsk6knOmowA17Y/7W52V/oZqOJ+LS4P7WnNdOPI6mUysFachBPI9jUnU3Li0N5FK31b+N45Ao8fwy+c/PV6B6IFVhsNhzLYUb3zoLo6vP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLDy/hNapsmpu1OpM9WWzd1VD35jURq8F+6HLtaztI8=;
 b=njcQStlz677iotuhV267CqRkiLcrGCxC6prIhGF1+5I5K/ih3JWhRqD0p9ITAeEjp38tnHVuX8opSyR3De0lFh7CmwahdzGav3hkliKygh1RPiR/Y7SrgN5fYCT08HyFzXnPdnXx/Jzj1czFldbBxv/Cj5Q0MK2sbmjl7qpbjDaAfB8e/VxgI2AwmO8v3aAabLgGe5pg4HS8d6i8zKbn/b/X/KF+MWXM1WTz5ZzUSz+Dc+DfD7pRFtAXChX9YQ7Rz6TkAyx7GytqwQ8X/rYZb70O22vPQCUrB4ZY3h+xFJpaD+Cgu7KSL5j6kxfZHxb1vDTg9vh2ok8LeWw+boPe3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLDy/hNapsmpu1OpM9WWzd1VD35jURq8F+6HLtaztI8=;
 b=OSGgMFkZRF8B+JdK4DEkyjiJE7WhMY3uRqLp64MHqpfUtsJytEPqPmPHMduBbs4uajgkFkOxZ3qbRuK/9rg1fDxQAPHO7mCAHCHBVZ9tajbzkYytACO+VKVjXlxdk0lWCkoEcgrz4ywc1/xIEYFKvDC7kA9N9vhfyqJVgvBhYfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ed2f44ce-b28d-482f-b6bb-5ef40149f2b2@citrix.com>
Date: Thu, 20 Nov 2025 11:51:26 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/MCE: restrict allocation of thermal and CMCI
 vector to BSP
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <638d0954-e889-41ee-b277-282f83170c69@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <638d0954-e889-41ee-b277-282f83170c69@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0477.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 8344804a-2f60-47c0-ede7-08de282b24c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk1zVEcrc0t3MUpjaVM4YU9PZHcrUjZkcnlNQnpaU1Vqem5sNGtWT1NCTDVO?=
 =?utf-8?B?ZllneFk3eExjUEtVWEtTSFk2NkhkQ3l4bVR1VXF4ZURWMmo0MW5iQXV6Z0NL?=
 =?utf-8?B?R1ZtNXRDNlI3RisrU2twZzhXS2plTHV6U0ladTVVQVhnK2EyVGYvbEpiZDlB?=
 =?utf-8?B?dS9FNUZNRUx3ZWVwVXBoaXF3QUF6UEYxWlNoWGNHblpQQ252Z1BELysyOFNG?=
 =?utf-8?B?MTJweDJxRVNtR1JKTitaMkxKd1o0SDYzRnQwN0xXekhHWU03YmVRTnErV0Zh?=
 =?utf-8?B?M21FeUd1WWh2OFdBc0MvTzNDV2ptTE1wZVJ0cEZad0ZqeXhMSEdLNXBxTzhw?=
 =?utf-8?B?MWdkWnBJVkl4ZjNOK0U5SG1lOVlyN0JzVTNDMWIrcnhtMDBNUEpqVmt0ZHpk?=
 =?utf-8?B?SHpXSWhJSGcrUGszbnVVNzQxZDRSWXpmb01vd0RIV0xYTGNseDArMTl2TXlI?=
 =?utf-8?B?KzJWTy9UNlpmUmNDaFAyOGI3VGRSNGFFRk9iSjBrOUdMMmhnSnZEcHZOcC9u?=
 =?utf-8?B?NlBIZHc5cDBVekFQWnJ5WnFQV2VJQVBmYXpjT01MTHVxZ1Z6MWpOTngrc0sy?=
 =?utf-8?B?WS9FUlRqcHBWZ3phOEhtUExrRENNWVY1emJvMnAwb2xGMlZUN0RSdmI4UHYr?=
 =?utf-8?B?VkFpQ0lXTXJVVzFXa1pNcFdzSGYvVFZZbzdqckdkWnBMK1pNNGl2bzgxZTZ2?=
 =?utf-8?B?OWk4VGF0VHVIRDNCR2NYellmR3psajhkSGxtd2RBa2FKeTk0MG1jeFVEeE5S?=
 =?utf-8?B?MTFQOEJ4UXdmQlM3bmw0QXpyVWhKT0kyaTRRQjlreDBuaytjOTdnQnBjNEhm?=
 =?utf-8?B?M2xCNEN5MWp3R1ArbEFFMC92djV4c0VXaExQeFJsYXdjaGxWVlo5ZzNTYmJz?=
 =?utf-8?B?WHc1L3FLdGRKYkJsWGlxUmFYTlYxNC9xZndTWXFJRWpqNHJEaHh0NWhqOVpQ?=
 =?utf-8?B?bFFicU9MSjE4cDVwZ0FSNnlyRTA1VTZVNDgrQVpqMDBtU2NwYnZ3QmsraDJ6?=
 =?utf-8?B?SUMrZm5oZ2VXYzVydElGdTRWdkdRTXNoRDJkTk1GRUQ2aHFaTFdFVVBBYVky?=
 =?utf-8?B?KzRCbFdrM1M3dFc1SnYvWEN6NjQxYi9DenlOd0xGL3hvcURaR3NVYkhjMnBh?=
 =?utf-8?B?cGFJL3NGYzEraThFUkxFZ0VUUDJjYm1uYzBuYzlFWjZPZnJxdGl4ejZ4cjdz?=
 =?utf-8?B?bjVVM0Npdmx5cUtqbjEzYWhxNk9RWHFCZGE0WXM5bHJPV0Jsc3NtbnBxNzM3?=
 =?utf-8?B?aEZoTjlvZzRkN0Qyb05QMUZnNzdMMG9CVXJkYmRDaEg4ZjdXaCtPcnpyd0tQ?=
 =?utf-8?B?OTRMRFEvbklMQks4M3ZtUytuSjdOaWlnQzdDYVd3Rk5YaEk0bW9pZURlaDN2?=
 =?utf-8?B?cStjSDgzVDJ4ZXVjdVlqM0RvSUQ2Zm1kQnFzSlRtM2ZNRW5xdjR3VHl5UWs1?=
 =?utf-8?B?clhtZ0N0c2lFYXBDRy85b2tuRHloNzFRajJMamdnZ1FjeHRsNUZ6UlBWUVcz?=
 =?utf-8?B?cXhmUWxGdGVia3FhaExSNG1DNW13a2d6bXREVmNReC9VTjhMME4wRWVUQ0dQ?=
 =?utf-8?B?aE5nTzdWYnhLWnhYSitvTnpCS3JEQ1JUMjQ2KzhvTkUyUk1uYkZKUXdsT1Ji?=
 =?utf-8?B?T1hCVzBpaFR2ajR2djZWNTVqeGkwOTZLWHpvNW1HUExXQWhCczM0bUpmaVBS?=
 =?utf-8?B?NElWV2F2T2d2bGxoVmhZVXRTWTZrekRkQnFNSFB4a01EMzFJKzhLeHoxVUdY?=
 =?utf-8?B?cVY2Zy9QWkVkQ3dVVUl1OURHV0dPQ3R4Y2JlK1VhQnBIVldxOE9Rd3FHY01D?=
 =?utf-8?B?SmNDVzVkaFJGaGlhZjl1NktKNGFQZGNyeDJnZll1SHVhVEtSTnlRWXI5OElM?=
 =?utf-8?B?a21JOTU3L2lmc2Rab0RPeVIzNHZPS0VWbWVIN2FyS1RhUnZzYlpzR3BVVURr?=
 =?utf-8?Q?jAsety47ZSaXLZHAOwIsbRVD1xiVN3c4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGErOW1lVVlQZXEzdEh5bTBqU3BuOUlmYWMySDd5cTlpbXJrbXEyS0NjWUtG?=
 =?utf-8?B?aXp6eS92RW5lcmY5b29sbXlzaW1Bd1VDbWhDMktCdXRzR254OXROYUJIZnJP?=
 =?utf-8?B?RlJ0cFNOSEp0czNCQ1UyZDRBbSs5dm1NY1F2bGk0ZGJ0ZTlvUG1OYzJtbEZF?=
 =?utf-8?B?b29NaSttNG94Q1hyTUtUZDJ0amh5VzM5dVVkZGFzbEtxelBLRTlNdXJ0eGV6?=
 =?utf-8?B?Qk01NHVLUWRkdENuNndjMHpNZDd0cmM4eUVDUTZ5cHZreVlHWHg1UFVaN2Zo?=
 =?utf-8?B?aWQxemhDaDZGTWlRQUVoNm5vWC8zQisrc0FKSTBpbDFjM2NFcGpsZnQ0ME44?=
 =?utf-8?B?WUdZWjlyakNmNjNqSWlwN1N0cUk5UTZlTkVYR05oK01wdXVZTXJZcGJralR5?=
 =?utf-8?B?QkpVNGRGdWo4TWQ1bFZNQU1TbUlrTVUzVUxLbEhpaURSS2RaVnJha2xmTFFX?=
 =?utf-8?B?ZTRjTGdIVTM2OERLVXA0SkcrbEkzeXVaL1M0djg1VnluMmc3VlVUYnErZWY4?=
 =?utf-8?B?ZkZoK0YvQ2tJQ1Vya0lEc05BQnFxbi9SUmZLbXdwZUsxYVl2clV0dVVXSmRu?=
 =?utf-8?B?cm9Nc1Njek9JeER5UXJqaEo0YTdndGtTOFU1c3ptaS9EYjBhUjljVHpEeWtw?=
 =?utf-8?B?LzlTeE5UUE9VZGptL2RHSDlnb1c0OWE5NGdFQVJhN21EQ1gvRXNpZ3dxV1Er?=
 =?utf-8?B?dnV2aEVKaWxkK2F5Mjh4MWczeGRHTUNPajZRRFZhUlZsVzE1dEJ1TzUwdzhq?=
 =?utf-8?B?TmRiUFpsajUzd0VjS2NYekkvanhNWEhYeHF5RzRmQUxGMmczNDI2YXZ5Ulgx?=
 =?utf-8?B?cUVDaUV5TUlqdTZqRVBUM3c1MFdHakRWemxPQmpuWElBcDI0MFBKaWhDSXhP?=
 =?utf-8?B?STRsajBHa05NMm4vMEFrOGhmc0lNUm1aRVFYYlRQbjNNMmhNejJkWHByNUtx?=
 =?utf-8?B?V3E0T1RxcUptTXVQcXlkMTBDaVg0Z0NOS3I2SFFJenVIWFRQY0IrOUJDckFH?=
 =?utf-8?B?dkNmMkdIODJDRUcxcTVISURiNlhKWTdydW1PM0FwWWFRZDBXS3RnMnM3UW8x?=
 =?utf-8?B?MG1HM1IwdFlaYUJGZ29xblhybVo2MGRLUzNzb2F0VUZjOERNN09SQWJHUkMx?=
 =?utf-8?B?Ym5udS9ic0x1SEdCOUhkWmt5NDdVNXR6OWxCZmI5aUE3RWtIL1ByRjBmRlY1?=
 =?utf-8?B?eUVPRXNuV1Nub2Z1c3lRZHJ5UkR1RTVwWTh3aXVSS0xEUVA1OWlib21UWnJu?=
 =?utf-8?B?L3RNT1pCZXNNU2RFYno3aUdoS1QzdExHaGRrMEMvODYxdVgzbTVOSnRwaFpv?=
 =?utf-8?B?dXY1NXRaQUJudUlyTXV5c0dTdFQ0Y1VyT0xOKzF0RFJ1cHhEMmNYTGRzK3Vl?=
 =?utf-8?B?cHRpUVhFNFU3QWxSK1dDbGZ0SWhIMkhHSWJtL0hHcHJlcG1LbFhXTWdGUTR3?=
 =?utf-8?B?dXN2S1pQVFhLVEI2bHBJSGtxY3UvM1ZsU0c3TDA5VXI3b0xhNXR3aDNCZkRT?=
 =?utf-8?B?Y1krSmFSZWJUU214WXIwQ1lwbURkcWRnWStDZnlmTm5xOXdsSGx5YjNRcGdQ?=
 =?utf-8?B?L3h3M3NSc2ZPY2dHek5ZUTMxTE1pS3V2SEZIWU0rNmtPOFdORG9sZGlDSllh?=
 =?utf-8?B?bVN1ejZTdHRjV2JxMGtDZC9pREI2SCtyMTI5TURrRit6TG5kRmozS05oQ1cv?=
 =?utf-8?B?bDd1ME9IOTQ3VlRQWjVJbHBXWlhQZFQzbHhlaktDTmdZcERnRU82OE1naWxD?=
 =?utf-8?B?ekl0bnJpa29YRWM5eFlrZE5NSmhxMWx3RzRmY285YU85MG1Da0ZOd2FkWUdx?=
 =?utf-8?B?VjRxM1l1RE1PTGt1dU5ka0xpd2FadzZwRXR4U1IzMU5hc2hndW9Ya1VYR1Fq?=
 =?utf-8?B?U0I5M21BV3BSbXJsc2MzVDJIOHhnSHZPa1dvQjJ1eVRXbUpVcVJzY1JPNzVy?=
 =?utf-8?B?bWJoWHdpbDYwU2MveTV2bVNhcHkvR1VTa0xFajgyQXc2V1pSQklWRWs1VjZ4?=
 =?utf-8?B?cHY1QlVzczJaaGVkSDlaUDZpMERvWmdlSjRMWHVHbS9UV1AzK0sxWE1iVGJR?=
 =?utf-8?B?c1oxMmxjT2hpZnI1bjB5Wm9pY2VBU3Nnb0ZTNTlkN3VCZEQ0Zzl1VGtqenFE?=
 =?utf-8?B?Q3BFZ2NkWGZKTUVtRGNaYXQzb2dodGRhTk5IRmNYdzZXeHJ0YzJsaTBDTmZF?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8344804a-2f60-47c0-ede7-08de282b24c6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 11:51:30.0527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bL2Q4SffAEOu/VyzuEfGh4qa3INxHvGU7jrnm7oJLu6UuuKJVtqQmck8HJREgMDrecPPUAt4PpBTinDSihus6JktggalZODRxPP8zR4MBl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7732

On 19/11/2025 10:50 am, Jan Beulich wrote:
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -110,13 +110,13 @@ static void __init mcheck_intel_therm_in
>  }
>  
>  /* P4/Xeon Thermal regulation detect and init */
> -static void intel_init_thermal(struct cpuinfo_x86 *c)
> +static void intel_init_thermal(const struct cpuinfo_x86 *c, bool bsp)
>  {
>      uint64_t msr_content;
>      uint32_t val;
>      int tm2 = 0;
>      unsigned int cpu = smp_processor_id();
> -    static uint8_t thermal_apic_vector;
> +    static uint8_t __ro_after_init thermal_apic_vector;
>  
>      if ( !intel_thermal_supported(c) )
>          return; /* -ENODEV */
> @@ -160,7 +160,8 @@ static void intel_init_thermal(struct cp
>          return; /* -EBUSY */
>      }
>  
> -    alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
> +    if ( bsp )
> +        alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);

We really don't want both c and bsp passed in.  That can only go wrong.

Furthermore, this function has 2 other examples generating bsp locally.

The function is in desperate need of cleanup (MSRs, variable and
constant names), but right now this makes it worse.

Please either use c == &boot_cpu_data, and I'll do some cleanup later,
or generate bsp = c == &boot_cpu_data and fix up all users in the function.

~Andrew


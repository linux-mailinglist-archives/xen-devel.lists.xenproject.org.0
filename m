Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F8C46191
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 12:02:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158271.1486631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIPes-0004ik-AQ; Mon, 10 Nov 2025 11:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158271.1486631; Mon, 10 Nov 2025 11:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIPes-0004gJ-7A; Mon, 10 Nov 2025 11:02:02 +0000
Received: by outflank-mailman (input) for mailman id 1158271;
 Mon, 10 Nov 2025 11:02:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s4d+=5S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIPer-0004gC-5G
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 11:02:01 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad9914fd-be24-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 12:01:59 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8167.eurprd03.prod.outlook.com (2603:10a6:102:2bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 11:01:56 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.012; Mon, 10 Nov 2025
 11:01:56 +0000
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
X-Inumbo-ID: ad9914fd-be24-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkmlvFMcw7DVVfxA0Hm3qvBqwFMaPgp8mU80SCi7fmdyQzDQDLxjvKACz0E/plZXz4CmVjXYN54yZjH42wbXE3mo/l5/+5V7JfC5ZfEVp5wZtA+ohH18e1uRKeLa3PiWJAN1dDDV/QCE5a2fwqaqbA1ycU6PKry1h1TPheN5/PMNLE6a4bSNLUJk8oi5gqqX6AQ27RbLaM/c+FqN3Vv8lCej9GGCRGUET5vvHdpujLkIT5QHSP/3lxTuNTgygQFxFhbuqsPdlpwzbD4VhtC7vhA376hSfJsjzNI4QCC+14Z/ENN1bFszRXRuhF6T4D81kaz3TlKVoj9t+/VyowsiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWIYH+15wnvPD7WivJa06typUWtIly1q6nY68T6q9x8=;
 b=JTzI3T7MBYvucHKtMbi6NBKIXf8Iua6KdcV61q5I2vWlTGjO8Sjgheir4KwUQqwMWNKGwzrSayH2wR3gvMXN4t+bekdFaJ8PYlc/ZoL34SSuq87c3eXWKv3XIbfP9rLVj4lMFEOqHO0anizrvpTtealWKMvRecCaZoVG07XI+tQSpacv8j9VKouRRG5mrVcrb8eq96AtRyxIvSSldRDnKCnb6EiQIhRjDjbm6H0ksopMWtgMV8VHI4IeAKuFU/8AH3Ipvx+Kk+0FOlMpx7z/m0tWStrXvN4YO7W3QviyGA2cs6O+Hb6hfxcSV8paZ7dQ+HFBMAJ1NX4rT+VbPJbxAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWIYH+15wnvPD7WivJa06typUWtIly1q6nY68T6q9x8=;
 b=puaE2ZlHZMGU00iKdHhYSwlZdBWflE7G8ZKOPPEIolxPYhcsLQ6EABcuyj2O1pA8VZpgXda0dpgF0ax356vNT/xwIqpE9sOCNRbhfJCzJanbH/lNVSpBLbNwzhKkn/e580D9CLQZbaJPC7tR4j2bhuTK7TvfstY/KO/pILLYCoS2flDrXTdQPdgn8H7UqlBtL8+4y52poNg5j6coKgWxN4M8HSvUSQuLo7s1GcmNZi91lRokmHHzN4dBPwiECmXNGXacxUcj9Vg0vKP+lyp7JGM45ubgqsXhZZkM615F/7cC3FMwYQ1zSawJsuTps9DxW4nULhxkv+XBujI27lYseA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <5667432c-718a-4c8f-8fa7-982deabfdd57@epam.com>
Date: Mon, 10 Nov 2025 13:01:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 0/3] x86/hvm: vmx: refactor cache disable mode
 code
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20251107150456.2965906-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251107150456.2965906-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BE1P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::19) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PAXPR03MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 0adb556a-d633-47a5-aa30-08de20489003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2doS2ZOUkhRYzYzOENHTjJvdDhVN2RWMWRlMFg5K0lIV3cyd2hEU3RqcWRi?=
 =?utf-8?B?V1duRkpQTnFLNXNvN1pnR2FwNThlN2psdW1GKzQ2dnlqcjlSOWg0dWZHMGhM?=
 =?utf-8?B?blJxQnBvODJ3K1JzSnAzTkZHZXA0cjZOSm9heE9ZcE8yNTgzMENFTjFyUklB?=
 =?utf-8?B?VHpOMnhHMGE4dkRwR0RITjZlWDByeDNZOGQxNlZLU1VVYjIyeVp4YXAzNzlx?=
 =?utf-8?B?ZjNlMGwzdnRKWW92QzZWWjZXb3RuK1JCQzhvdXE1VHprUDM0anlKTCtCM0Yy?=
 =?utf-8?B?U040ZHhiYWtJVHVDdzNqUm9IRHZ3cmVFbDJtazR0dkZyR2pNRjZnMEFCTStS?=
 =?utf-8?B?ZlcwMk05c3pORXByODIwYU1yQ3o5Qmo1ZXNJc0Q2M1dZbUxNc3BreEVEcDhk?=
 =?utf-8?B?RlZYajFwN3JJb1c0elJMQzN4U3QzSHVKWWcwcnZLQkVhK2N6bzdpQjVQcVBE?=
 =?utf-8?B?ZGZSVjJEOXRxTWRGTjdVaVJaSHRtUloyN0pIaklXMlhya05DTm03OVNMeksy?=
 =?utf-8?B?dnIrZTJlaFFVK3pCSzlhQUNYZjVZQ0FSam4rVHd1L3F4ejF6TnR3ay9RaFFj?=
 =?utf-8?B?SmxTTjZXNjE1RUt0anpEWDE3UWVlV2dqV0pYSTBVQ09ZNHhuR0p3UHByVzF5?=
 =?utf-8?B?YkJIdENZNnVaMFJkTzZiQk90V0IxSU1nTklRd0JPbjNqV1pTQ0J0Q01HZGJL?=
 =?utf-8?B?ZGQ2Q2ZkdjY0NWF5TXVUanhKTVF5SGVkYW5CNVR1b3dlTlVsaDcxazRQVjBr?=
 =?utf-8?B?aVJ2R04xZXVTak96WlFpZjd1aXFzdFlPcUNTZ0JJWXJsOElJVFdpN2cyWWRR?=
 =?utf-8?B?QUFjR3ptY2ZEdit4VmJ2WWVObTJXd2lQOVJxbDlDUGNrMFVlWFgyRUNrd2Qw?=
 =?utf-8?B?WGVCeE10V3E2NFFMQTVjcy94Y21mTytFMVRYTWE0YWNtQkNzZlJ4N01zYkpa?=
 =?utf-8?B?ZERGUUlUKzNmSUdLNEpRMXl1NjJDb01xME50ZUZ4UGlNa2MzTDFCUGxXSjA1?=
 =?utf-8?B?MWJpYWk2OHZRR3p6alFBQ0dqSFE5YTJKR2hQNVdnNGpUUmxCeTh2V3FwOS9l?=
 =?utf-8?B?Y1FJWmlTREUvVndXKzcxdVZKT0pFNjlQeHRGQ2daTEx4b3BGdUlLd0pDZFZU?=
 =?utf-8?B?b0twc0FITndnbFRKVjB4TGRwb1dFV0lmdE9qeVJxQWx4Yk9ScWRlV01ycE5X?=
 =?utf-8?B?TVhDcEtacUdibWVLWnJ0SkErZVZWWHB0VC9MNzZHSU8zU0xKVTc4N2YvczRl?=
 =?utf-8?B?VVFCMWVkN2hLUjJROVRmTmNkUW5Oa1dWVkthL2t0bmwyY0R0dXplMHY1UkxU?=
 =?utf-8?B?TnF5MHg1b2l4RldYcGpOK3hOS2hXYkJhbWhYSUFIdWhBaW04QXJUUlZNTU9K?=
 =?utf-8?B?M0VvYlAzMFc1bFRhclFIazVzTDR6N0hLL1VudTUrT0oreHN5VEhEeGxMWjdy?=
 =?utf-8?B?bGgyUDVscldGM3dZSUw4Z1Q1ZHBkR0svV1RWUlV6a1VPZzFKSktDalRSdHVo?=
 =?utf-8?B?Lzc3L00rN3QyZWN6bWhCNkdxcW1xa0hUdmhucGlZNkt6a2QxdlRac3VSRDZ4?=
 =?utf-8?B?RU14Y1hoWUhFV0FlWmxoQlVucFdPSE5iRVg2ZGNwaW8wazUrUHI4czRIQWkx?=
 =?utf-8?B?TUZhbEtvdS9ETUhWeGdxZUdvT2xMSG9kRk1uenNNZGZrQnh5Y3ZYUVBRTU9y?=
 =?utf-8?B?VjFkZnBmKzdBSHFTZ0t2QlR0WHdBbXpGcmZHdjhRUXpDSTc1UFV4amlEcWhW?=
 =?utf-8?B?RTlLWGdpQnM3K1AxMU5hY3FtVGdmMDF2M0NaZm1HeVBwZ0ZwRFBMZm9TSkNV?=
 =?utf-8?B?WUQvSnlmdjA2dkNESVFNM1NKS3dDaHFiN0VUWXR4ZHNhRTgxQXM2UFlNOWdX?=
 =?utf-8?B?cm9wWElieTlUQU1hRG54THphbHVDL2EvQVNLd01ML2pWc1RwQW5zVkl3UVoz?=
 =?utf-8?B?dS85NUVXUE1uM1ZROGtOV1BQZ2Nxa0krK3RwVUxFdVdENW9USHh6Tmo2Nnh6?=
 =?utf-8?B?bjVRNmJSQkV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0lXVkpZOUZpa1dhYlF5SEo4RnZ3UlpubVpXdVFZbHoxU3Zoc0VxeTZ3QmJi?=
 =?utf-8?B?SnduZG1iMXA5UDkwZTFPK1Nib2Vza3lkUC93OEdPRzVSSGlPTTBjekR2M0Rq?=
 =?utf-8?B?SkR0R1hJSVgwcEluK3IzYm81SmwxUC9uZGlReFA3TUhsY0paS3hqSXZLV1BM?=
 =?utf-8?B?NnlaMDFsYnpCelhjMnI5NXliM0NjdGs1dHBwWWVIdEpOTWJ3SEJvUzdqbkZT?=
 =?utf-8?B?ZXY2UG9CSjUraS9vY1R1WFFKbHg2eWk2VWc0Q3RRSXRrZWdRdy9BSEVoZUh5?=
 =?utf-8?B?c1lzU1RuNkRVV3VCWi9mcmE5ZGMwb1ZhcEZSZXRwSktYbGJyNzNwMFprSGVE?=
 =?utf-8?B?V2hlWjF4V2JDMkRkTURsMjJGMmtWRkVwOFJpUllvUmR0bGNOMjJ3aGt6WVBs?=
 =?utf-8?B?cFhGZnZXRUlFUFNyOFlpZVRPZTlTQmczZmtsZmUwbjJJTzB1MUptazVnVHpw?=
 =?utf-8?B?YnUxTnkyL0xrT2w2OXdlOWlJelVvWFRwRml2R09wcHhyNFg0Y05RdzhWSmxS?=
 =?utf-8?B?R1JnVjcrZ2JTUlpOaG1IM1dkK3pmRU5BQlkxQ2szRUh3Rzdha05BVTNqRmZS?=
 =?utf-8?B?KzdRQm5Qd05NVUZXVU5PZHRtMUlIZ2ZLVGtlL3VJa0dmQzZGRUtxd1J1MHAx?=
 =?utf-8?B?bGRJUEt1NFRoNFRhcFArVkdTWG1PZ3hId1oyWjM2SzNHSGVINWVCSmtSMVAx?=
 =?utf-8?B?azlFam5HOXJ3Q0Fmb0NyajdhUlRQSXNFK3p4T2xTZ0tqR0RIeXdxVU1JWC9V?=
 =?utf-8?B?Ujk5UEVhVDlzMktJZURwa3ZFby96UnlQUjZ6K2hRMmM2enpFZnoramt6RUla?=
 =?utf-8?B?STZESFdyMjdDQzErbnh6VWFuVkVNZC9Ndm1SZlhLT0E5bzBzTkJXVWNjQkdO?=
 =?utf-8?B?VmJqbFZ5NE9rUFpxUFZSb0hIT2JyOERSOU9DM3dYYm5TcldYbTRnSFd4MWRv?=
 =?utf-8?B?NHZ0VUNUbnZqU0txQStqUzJNV0ViWHAwUk4zaXVENG96bUtDWldpVWZtQ3U4?=
 =?utf-8?B?TkN0WmlLTUU0c0tVNFo4cmd0Qk9CWDFIeUJURE1MNkFLUTBld290MlpnRG5m?=
 =?utf-8?B?TExGUDhyYUtlemtKSVRMQS9IR1VWYUlHU1BYYUF3YVFqMU04YmRrdEFBRDVZ?=
 =?utf-8?B?T3Z4QTFWSjFnbzdRa2F3MXhSaHpsRXBLYUR5S1llL0l5Nng1MEtxcXBsendT?=
 =?utf-8?B?UEt3WjhER2lMbmtOM0RvZVZ5R0psUTdySVdVNVFVK3NiNUFvZlRtN3Q2RTJJ?=
 =?utf-8?B?bXVid1hxRGtkNWZQNlo0MmI3LzJ0K3dEOGxnNjlMK3VmTTd5dlZRcnJSNFZQ?=
 =?utf-8?B?bW5oaTQ2QkkvVS9GdldKVkZzVlQ0TmhhRDBUeWdXa1gvcTFPZ01Oa2t6MDRL?=
 =?utf-8?B?OHZmRDBoT2pESEJJZWZrV0xrY3FJei8yWkcxSzdSRTVWaUNTdENDNGUzY0s2?=
 =?utf-8?B?YnM2YysxMFNDbVFBcVVCTVBVekxyY1pkbVJPaFNWdWg3OWFPSmJuaXNrU2dZ?=
 =?utf-8?B?aS81anVDSVIxWUxoOTFsYzRrOEIwWStDWkZUcWt2M1BVM1pCWVZlZ2RaRlZY?=
 =?utf-8?B?R3czUVNXTzhWVzBnVzM2WStzWG9tdmxrdTQ1VDBZV1B6blh1anRRMUlHUTNx?=
 =?utf-8?B?R3ZOZDM4aXVFV3JNRXZhRXF2SVFXaVV3MDBNTHg1SDFLWkdNQWZ1ZXlHeGY2?=
 =?utf-8?B?aVBrdEdnK29qU2UvelJ5ZU81NllaSzduOXBBYTYwZFh0MnVOWk5xWWx5SW1B?=
 =?utf-8?B?cVpMT1NqSnU4OEp6UDhBcUFHMFlHVGxIeG5GejlFY2tDa2VjRlFLdjJjMm93?=
 =?utf-8?B?RkhlWUl4OHo4d1dMZjlIZVhiTTRTQktMNXBkd1ZqMHRmUGIzNit6dGlBNGNm?=
 =?utf-8?B?Uk5zbHBBQUJPQXdYTEZuek0zb0QwazNGWkx6RkhrRnMrV1hTZUxmSFQvL1gz?=
 =?utf-8?B?RnJCVEp4TGVnRUxwYk5nRDQwTVZKYWFCMmhZS1JnY090aDRwWVo5cHRPQ1dv?=
 =?utf-8?B?eFlueU9NOWRYcXVNc1dSZEpJYnk2S0ZxMjM4TzFrQnN6RzFDRkg1S1JqV0ho?=
 =?utf-8?B?TjVUQktLWkVjYnRMaTRCaHFYcUI1VEc1clRRMXA5ZVBQTW41WUlpcEFpYk44?=
 =?utf-8?B?SG1XUjIwQmVtVFllU2crbFp0eWExckg3ZUF0dzc3aEthcVQ0ZW4xMUxqMklF?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adb556a-d633-47a5-aa30-08de20489003
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 11:01:56.0904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMnZmF2meLuXod7lPyQDqOBc3PwZhqKpucwu5DOFR5pvttSMdjNnwTQDGvepT7sf4j3aIHomOFUxFYf5FSVz+uEKLAjhtCnEpxkkXMe3K00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8167

Hi All,

Please, ignore this submission.
It was sent incomplete, by mistake.
Sorry for that.

On 07.11.25 17:04, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The cache disable mode code (hvm_shadow_handle_cd()) is relevant only for Intel VT-x (VMX),
> hence:
> - move hvm_shadow_handle_cd()/ hvm_set_uc_mode()/domain_exit_uc_mode() in VMX code
> - account for SHADOW_PAGING when use hvm_shadow_handle_cd()
> - move cache disable mode data into VMX specific structures
> 
> Based on discussion [1].
> 
> [1] https://patchwork.kernel.org/project/xen-devel/patch/20251023151903.560947-1-grygorii_strashko@epam.com/
> 
> v1: https://patchwork.kernel.org/project/xen-devel/cover/20251029235448.602380-1-grygorii_strashko@epam.com/
> 
> Grygorii Strashko (3):
>    x86/hvm: move hvm_shadow_handle_cd() to vmx code
>    x86/hvm: vmx: account for SHADOW_PAGING when use
>      hvm_shadow_handle_cd()
>    x86/hvm: vmx: refactor cache disable mode data
> 
>   xen/arch/x86/hvm/hvm.c                  | 59 --------------------
>   xen/arch/x86/hvm/vmx/vmx.c              | 73 +++++++++++++++++++++++--
>   xen/arch/x86/include/asm/hvm/domain.h   |  6 --
>   xen/arch/x86/include/asm/hvm/hvm.h      |  3 +
>   xen/arch/x86/include/asm/hvm/support.h  |  2 -
>   xen/arch/x86/include/asm/hvm/vcpu.h     |  3 -
>   xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 13 +++++
>   xen/arch/x86/include/asm/mtrr.h         |  3 -
>   xen/arch/x86/mm/shadow/multi.c          |  2 +-
>   9 files changed, 85 insertions(+), 79 deletions(-)
> 

-- 
Best regards,
-grygorii



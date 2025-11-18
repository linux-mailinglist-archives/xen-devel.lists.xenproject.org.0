Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA10C6A514
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165041.1491868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNfz-0003aK-JF; Tue, 18 Nov 2025 15:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165041.1491868; Tue, 18 Nov 2025 15:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNfz-0003Y1-GV; Tue, 18 Nov 2025 15:31:27 +0000
Received: by outflank-mailman (input) for mailman id 1165041;
 Tue, 18 Nov 2025 15:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLNfy-0003Xp-CE
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:31:26 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a41a590d-c493-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 16:31:25 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7868.namprd03.prod.outlook.com (2603:10b6:303:276::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 15:31:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 15:31:21 +0000
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
X-Inumbo-ID: a41a590d-c493-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cE6rZbVYMn4y6SXt5Q69yjUOZHnHyEkyTm8KdgMgKBetdvRYVKIc39WorUtL2GYcag7azx7P/eqAByYAKTbUz3kkVHCsIkJH2cQ2fQveld+ka+Hy3CqQ/4t0HJgXOLYJYCq8a53EOD3FRwEON8R6QTudDrl56v4hiATGN2bemDQxlmYfq/xKMIZFgSLBWZe7L7+4GkxqJhihDTA+IE24fFR2U4pltCxbNp/l/+FmQdiqKPKc3/CRGtojqAlU6H96avYV9haxBa0MSSGDhA4meVzETXagBnKfeknwOYWObxheRDvsq+l1sY9G+Q8+IkrR8EwFCLjK2HwmuD+B3jc8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArLD0qneHy4X1jXz6gR8L85yEGeyl9hzO/1MtMKT5xQ=;
 b=IfV8gpKNki2N6dleDY+7svkTbM1ekrMYW3+lBsfb93HO2RG5Xp1IDj22L9eZJvtMY52UWt1Qj7QHpDgBQ7SI1QU39RXrM9bwq/PBhaG6qd6+69kCNYk4FBfeK33w0Cc56jTCydTnyZub8u7+aIIZ1UQWywFzYmD8Fmupn4wHKILFWb/w7vTy4bOPDVQLHium3+qV3UXqSYLstbJDY2xa8eccHSlfzKxRNwDiuQ0ks9+dcdZsZE3v5485pUICrOuC4e0zl9SyzjYrJjgSx66euSL/ttWO75xuZzTV4zgNFuNEBdb0Dn1Z7N+1Vt2pdGPhKnHqs8MugSW6IYi2EYLxmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArLD0qneHy4X1jXz6gR8L85yEGeyl9hzO/1MtMKT5xQ=;
 b=vQ7zWY+BLWu9X9e5qSA0l1tVsSrmAdM2k1ECDD8x9fpW4+f9B/3P4D7ESHOPxbdnwMuQmRRWHNGsNioc38AarQU5M5sJpe7Az64btFSK2AbG7fx13ff2JPawM+9uO+olVb5iCEWg6tP8+28gHtsV7opZFaIAIXtp4Sx1YrtYsCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <73fbea03-9dde-4d3f-bcd4-69ebe6f65c06@citrix.com>
Date: Tue, 18 Nov 2025 15:31:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] x86/include: de-assemblify cpuid.h
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <6525306d-aebd-47a2-b17f-918d7989798a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6525306d-aebd-47a2-b17f-918d7989798a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::24) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9c6933-b355-44c8-ae53-08de26b78683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1BVRzZFNXJKRTlKaWVkMlRIcWtEMHJaYWhLQkp5NjlPbTdGbTBPMzFXOW41?=
 =?utf-8?B?U2s5YWJqc05LdWV3a0FHT0ZJUG5lM2lJcEJsd0xvNkcrZERzMmdlanUybzNl?=
 =?utf-8?B?eitNYVdKUGlBekFhNkNFMlByY2VkV0J4cml0OTQ4ei8zWEZoVVV0ZTdGVERW?=
 =?utf-8?B?bm91aUtSeGw1RnE4OXNHTVBxNjVla2ZBOTZJcVlHY2dDd09WQnc0SHVYWTkv?=
 =?utf-8?B?V1FJeTNaeWltbUxtVVpXdlpac0JtZkJDQ2ZzNnJnUVphL250SmF2dWxRRTJ3?=
 =?utf-8?B?TFgxZERQQlU0WnVTalNZMG1wNWpJd0FHSlhZaXNzZHVCRlM3eVVHdzE0QzJr?=
 =?utf-8?B?YldGNkloOUswV0JUYUZYM1pZYlE2ZFRlUUh0c3M0YW5CeVptYkU2MHhCVDha?=
 =?utf-8?B?akFDRDZWdHdjc2cyZ1prKzdBSzc3cGZLZnNUeGxOSm04eDdLSzJzUTdTNEdF?=
 =?utf-8?B?TVV5NDRpZkZEaFQyMnU1MmI2VDBuME5FNUd5aVJBbTVQemlvWllQYjBST0Ny?=
 =?utf-8?B?L2RxN29UT21NKzhjR0lsUXUzWldkWlJjdHlQa3h0a3pTb1dpQmg3bVE4UGRR?=
 =?utf-8?B?STZtaGplRnFwMmNiSlRVTkZFdWFUL0ZjK1VzdVJtVHlBTUo2V3ZNOFJNbWxT?=
 =?utf-8?B?K2lEUzhPQnphWEpZcmVsSHlKc2JmVmlUMU1vUmY3SVdxYXlFbnJCWjZZVDl3?=
 =?utf-8?B?SXJIZGdZS3diUm5LejVqN0t3K1AwV1V2ZUlxVUd6eGo4bUxQcFlGWFBSU0cz?=
 =?utf-8?B?aVFSS0FTZFpxNWRuZWg4R00wRmIrNXFMYUltc0VpN2c3dVF4aG1tVms4bFlI?=
 =?utf-8?B?bnlQK21mL2dhdFpaanJ2dDVOZTZ1dC9KRStuY2RmVEVxRTN6NW9kUEVMNkJP?=
 =?utf-8?B?VWVWa1hXVjhJQ3RBeHBUaVV4RDlNWTdvcUJZNlVTcUNPYjI4Q29pczgvUEVP?=
 =?utf-8?B?bVZQdGhObGR6RmtiTS9jQytHY1liV3JsSDJxZ2pqNXNGaGthMnBDQnZ3Ym81?=
 =?utf-8?B?MVQwL3owTWtkZXBManByM1lsU1I5WmwvZXpkeklncWNPbXMzWGtWdk9LM0la?=
 =?utf-8?B?c2F2SUwvanhNcEJrYnlhTjVkZXU3bDFEdXhvWU4vYmZ5K0RHMEtrQWthRWth?=
 =?utf-8?B?TnJheTRPQ2c1MUE0KzY2bFV0aHpETWUzQ0wrMEMwby9HRjVCMDlvN3lyYzB4?=
 =?utf-8?B?UFB3Z1JtWTlad1N5U1UvMVAvYUltS1BSRWlNbGtxcXQxelN5d0dDQUxvTmYw?=
 =?utf-8?B?QVFpN1hxRTN6d1gvNHNrTlFzRUV4S0c5Y3c0L0VWNW5TM3pRTDcwYTVjMm5M?=
 =?utf-8?B?WVpzaTlUWXNudUUwdlhEODJQd1IwcFd3OXRKSmIxTkNKUUVVMFRBanAxTkJU?=
 =?utf-8?B?VEhtVWg3UCttdUlqWXNqS0VPT3Y3TkJmelpLODRQVjBsc0U2MjNTeDhFTVlu?=
 =?utf-8?B?WUVUbjYwejkrbWVFaDRKSitmV1FvbDZFeFJZazBGKzZFei80TkNubXljajFu?=
 =?utf-8?B?OXVkTm4xSDRPbmQyZzdsV01FcFBFVituUmxZQnQrQTltc2NaVHlQQldQQUI2?=
 =?utf-8?B?bkQzMWNyNXNCNEVxYzhQb2lHNEpmdWFoeWN5ZjQ5NWZnSHZkZEw0M3NLOWRv?=
 =?utf-8?B?aGdTMjdjOWlHRC93UlpFZlZsWSt3QUYySGlpZ0dYajdCTkt0QmUyam0yUUVN?=
 =?utf-8?B?VSs5N3lSU1NKZHkvWUdnZnNFQVNDRU91ZGNvQ0wvQ05MaE91S0t0OHNzU1Fl?=
 =?utf-8?B?Q3BjWXFIVjNYMncrQldEVlVGNTRGKzZNUk01RVR4QmsrTGVJblY0cDJPa0VC?=
 =?utf-8?B?TnhSVWNMcWtiYjd0N29YbmZxZUlhOTl6aE1uSHhVTnJiUGI1bzVCSjFHRkM5?=
 =?utf-8?B?Um15ZGZMdEZCdW1oTFRQUGRJYWQzSDl2Z1Q3cnFiZHQ4Tk1FRDZ6TmM0b3lj?=
 =?utf-8?Q?hEutQUUMuy2V1kCYR6/S0x5JdUcDkg57?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWNidE9CL0p2TVA0SDZBT3pyM2VTK1ZoRldlTFhRRnplM1U4anpvZEg1RTMv?=
 =?utf-8?B?OTZ3UVhOdWlMTXpiVFFJcnNlK09rTVFQZTZ6dWZVNHUrc0lvT1ZRWjlyVitm?=
 =?utf-8?B?VDFETGRRVklJQU9SblpZM2xIaXdyVndueEw5U0NEU2g0OSt2MGthVkJhbVNR?=
 =?utf-8?B?eUV4bW5vSWxzR2xJMTlFQXFYS2YxV0NDRVVDaE9mQ28rR2x3V0lmMmFaSng4?=
 =?utf-8?B?NVpUNUdmVXZFWVlUYWxEY3BrZEFUbklBUDFDZVZmUFJVQ1pvYjc5SG9yS1lw?=
 =?utf-8?B?NytYbnpZd3FlREdUblZicmVOQUlmUXY5RnRIWmpNSHdzak9yZDk1dGFhYnFL?=
 =?utf-8?B?MjNBcnFOaEQ2Z0VJVFVWeC9VNnVMVEtGRi9jYzRCTy9CUVZwWGtlRnNlSFNu?=
 =?utf-8?B?ejNtanlYTUpFL3lSYVFDMXU3RzhINWtmUGVialZIS2dTbG0vQ3Bia2ZISlVT?=
 =?utf-8?B?bVR2WmdUaDBNcTUyYzAzLzhKZjFUQytIWHVvbldYRDF0Rzk0VHhaMHZLUU1l?=
 =?utf-8?B?bDJURDFQekJDZE4xM2Z2aG9mUXpoNCtiZlNTekJNaHc5a2dxR0d6VGsvb3Rh?=
 =?utf-8?B?OHZldXM0NWlnZVBsQytxd3ZYbzFGcllNczZUU0RPNC9ZdStoKzlySzdmazI4?=
 =?utf-8?B?aXhqcm5JTUxFdDQxbzhabkdCSTBZeDNhaUlYbDB5TXlGQ0xvVEtqRU4yNkRL?=
 =?utf-8?B?UkVMbVF5UDZqaEdKSXJSaDJodHBCT2NsanQyTHJKRzAxUkFpMS9EWktPSXNI?=
 =?utf-8?B?NVJYTXhzUWQ4ckVRTnFhTUNNVUt0M2pIaUd4aVF5ZHB4OU1LRXp0M2xkTlkr?=
 =?utf-8?B?UnlsY21QdkFpaVFyNkhyVTJNMFFmYnU5aENRMnZhNzZmMEFwNzgrNzQybGJX?=
 =?utf-8?B?QlBVTU5DUGdXanZhQU1LMGx0UUwxaWpTaURyeUJEM0tqdS9rOEhQYzZ5ZFJv?=
 =?utf-8?B?b3Y0bEpYZGZiVzFheFU1YVdpRSs5WE9HTWFRZWRpWlYrR0FDMnhqZzJMSmtm?=
 =?utf-8?B?L3M1MENkaVd4cXhya3VXdS9XZlRxVnlLN09rWmhJMHJMY2RQVkdhQ21veDBn?=
 =?utf-8?B?aTBCM3pucCt0U2dYcy8xUTROSTNYb2QzYUc5Q3JjUkIwOEtnMU9ZZ1llNFFv?=
 =?utf-8?B?MzBGb0VXR2hrckpwYjdEQ053cDNCa09UTkQ0OGV2NHVHdVlmQUxsTzMydWxP?=
 =?utf-8?B?ZGU5eW5zTTVKbnZhQkpnWE1wQUFsN016dTZxQ1NuRFJ6UXFzNXZUbEFyNDBH?=
 =?utf-8?B?b3J1RmxvRnBrN2JmOWpLeTZXNktpTE95emYxeEVjQUFWbHpxeGZ6bWMwejd2?=
 =?utf-8?B?V1BKSitsSDVNU2drN1UvM2YrOEpRMlBjL1lWeHQraktMdkoxUXFHSGlMQlp0?=
 =?utf-8?B?a3VBVnUxd3RkcGJSSTlCOUMycU1kSFNHTWkwU3lSM2V1TnlLblF0NWdkK0Yx?=
 =?utf-8?B?b1ZwMm1VU2xkQmFrZFpLbHE1RDMyTmphb0c4cWJ1L2lpR0ZjcDU4bkJHM2Q1?=
 =?utf-8?B?YWVsS0huMDVXTVNYSnA5ci9Va3MxTVNtd2N6bmxCVXVUbS9KcWJvVjVWQjlj?=
 =?utf-8?B?NEZEbnhXeWhTVWJrWFlaOTNEUEJVVHBHdEZ4TGQycmxlaXRCcnBpOVNGTnk4?=
 =?utf-8?B?cHRHVjd5TWxpeXZ0WnpLeEFrYWJ0MkZpd0xGVzFGQTV5b0dYZjhXQ3UyVDJV?=
 =?utf-8?B?MGlHUm1lUDlxcmZEUWRPUWY4a1c4S3ZxUXdHMjUzU1luakhxbDd5S3BtTnN5?=
 =?utf-8?B?NDBiS1k3RGZXV2VqWXdXdnVTYVRNa0NUUUNOM0lVSVNwaTdaZXhxSC9DV2kw?=
 =?utf-8?B?dW13S21ZempNMlVVTzVuTmtDaFNBZ1VyWVc5MGZUSUhoOGw2eDJGVXh4ME12?=
 =?utf-8?B?dk5VWm9WQUovSFZMb2RwdkNQWWp4YUlWSFZhS1NOWkdjRFJIcXNHenY0Mndt?=
 =?utf-8?B?OWlqbmxuM1Znd05uRDUyWHByeUV6bjBJY3RGZE12Wk1ibXl4STJzb3JMcGds?=
 =?utf-8?B?ZlIxbzIydkw5b2tYS0lWS0FjVlhnYVJKSVB2TE4zdzBMT3d1WFhHSStyM3hD?=
 =?utf-8?B?ZWt4N0pTYUlwcHRkanhyTnM0bXJGbjlyczhUM1hhT01PeXkzODJvRWZrL1RK?=
 =?utf-8?B?c0FubzJPYkh4MVRKOXF5cHdxMWFGQ1BQRDNQVDVOcEk2dEF6TGR1dG5qL2pq?=
 =?utf-8?B?eUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9c6933-b355-44c8-ae53-08de26b78683
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:31:21.2820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7xfdgujPTWsKQH3XxcJ74EdfmPENxMoNS8KJB80AeFaZ0gEdYDWaPdE+UZ6Mp/MhNOGpQCWySNbJsTgkuNXxuXrRNhmYm2fSPFB+6XOdMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7868

On 18/11/2025 3:06 pm, Jan Beulich wrote:
> There's nothing in that header which assembly files would need. Arrange
> for cpufeatureset.h to be included directly by cpufeature.h in that case,
> allowing respective guarding to be dropped

Missing full stop.

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


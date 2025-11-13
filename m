Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53284C587D0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 16:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161829.1489675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZZo-0003kN-Uj; Thu, 13 Nov 2025 15:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161829.1489675; Thu, 13 Nov 2025 15:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZZo-0003i2-R3; Thu, 13 Nov 2025 15:49:36 +0000
Received: by outflank-mailman (input) for mailman id 1161829;
 Thu, 13 Nov 2025 15:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbc0=5V=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJZZn-0003hw-69
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 15:49:35 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5973c41c-c0a8-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 16:49:34 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GVXPR03MB10635.eurprd03.prod.outlook.com (2603:10a6:150:220::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 15:49:30 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 15:49:30 +0000
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
X-Inumbo-ID: 5973c41c-c0a8-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmTU7y+AjFdRVNhmOD1masQSx3fVQl/SovaNlD5j8MaGJKB3vJZfS2nmCcN7xkgAy2WXueFaqnpVPG5VOLyrN23tUqT5xw2GoOSr6gApCac4D9jZ3r+ozVAfj/sl0MhsSV6Bk2ChGBrLUL+tXsXxn70R57DtYhkcLNf0t4JIq6Zz3y1JxNjugqeP6r3G2mp2n8kkRqMxZ3Qb3Xrw8w2Xv7KVlTCPIc/pR8wn0ekDiy2BbmdoVRzg0Yc1fJOaipT+LU1enF0h499nZUummu8ZwUv5pF21w/yA1vpI2JYzZQIBfHDnA05skfDCUFjLpuvbJw5WhPyGBBgqVsHK32zaww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BTLe24zyhgN7TPU4Vo4apGxqyibwRLw7bikjIC6hT8=;
 b=Xbgt9ys7RUIqtDMGdjyqCOtDYqLHBjIynjUoRVlQ5UkOyGATcobqJgUo0G47PBRwXWh4jaaAAHpPjIT2sXLs/2J9OswtjxRHT1n+bleWuESRPBLX6tnQi0dG9dOOKpvOWP1UF7gQlpKTa1QCjJd82x2xUbhTyXPuXhezJyVxw7KV+nU66IaruLNYIn85FXEzW4clrhv6B96mjMSVS/qrJTHshKTHK6mQvQta756mxAUZkeXkXIUTRbbSheuTtY7hbzuoro060vHTxQUN25OKcd0veDyMDwIk5TTMZ71/DFcYAJMfuye7l7tUmvyyWbbD81tK3K4nsZ/8vPV9ISixOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BTLe24zyhgN7TPU4Vo4apGxqyibwRLw7bikjIC6hT8=;
 b=bELt+4k8La4xN3kkXJ2VlI4QTTVI3p2PQOgtJ8d7C8Yz1QU29FYcAGANutUO2BQh88DTkIyGlzkPbrmir0D1VVC5pD7toYDBws/sk8gVuT1Ql6vcBRCoBn5z1y3vr/0+9dHSyNxFhTuWIDq9fnvW/MA8cmdVIV893nyAvk/Mael/2BRRe9jssJuhb66ozkoX4sCQ1swriRA5WqJJPRr7w9H+dKedLxD3AWI4X1G2eOms7zeJDFvx/aAthCeIsCqbTvv0qNNqrx2wtGKnv4aUS0b/cZEV3oG36yg+A6W0AzTGqpSWTxk2tBYqb4M/FA1ysHm3tRkP4Uz5XbtrN6S1ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a3628426-cc6c-4bfb-892f-895195d5d87d@epam.com>
Date: Thu, 13 Nov 2025 17:49:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "Alejandro.GarciaVallejo@amd.com" <Alejandro.GarciaVallejo@amd.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <656cb01061f2ec726eb23784d01517a94117618e.1762939773.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <656cb01061f2ec726eb23784d01517a94117618e.1762939773.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GVXPR03MB10635:EE_
X-MS-Office365-Filtering-Correlation-Id: e1dab770-4ac8-4ded-4952-08de22cc3b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUxTM2Z0UFhhdVlRZzRFUXhBbW04Yzh2NmY2Y2hQNjFNNThQZHlQc25TRVpC?=
 =?utf-8?B?akFXWG9uTTZSQ3pYL1lVZ3NsMGVlK1RDdkFjQUhEUWYrL2FEVFV6K3RmWHl0?=
 =?utf-8?B?My9pSWdaTDJyQkt1cis0ZVdnTFdjaDkxcEU5VVZCT1NyZi9PMC9odVpLbi85?=
 =?utf-8?B?RXNWV3o0aHBBRHNiSlFhM3NqZTlENUhCOFFFSkplL3Vrd0RkRFdpbWlJNVNF?=
 =?utf-8?B?MFhJZmJwb2Z4VU1WUWYwclQ5SGFIdjFZOHRpOXFYallGRTZZeUtjcmhDTVll?=
 =?utf-8?B?d3huY2hnOUI5aVlQcXk1ZUpwd0xFelA1LzlVZ05raVFOZEN4Sm9lVUZ1b0g3?=
 =?utf-8?B?NTV2OFdqWHl3dUt6TnVmS0lTNHNMYTBXRWZ3d1BEQzZRUnpQZTIrVTd3dkR2?=
 =?utf-8?B?V3Jqd29UNGtBNG51YXozUml4eHVyeW5xUnp4T3duRGlxbVJBenc1M0VvZFNW?=
 =?utf-8?B?Z0pUamhUUzFINWhGMVI1bWpGdkhjdGIwbHFsK2NUb0Mya2NQVDFLY214VE41?=
 =?utf-8?B?Mmhla1VrNEFYNFdnQmxoeHZEKzA2YTVoa3FSa1RNZ1pFenlDdDdveHhxRzN3?=
 =?utf-8?B?UjZpdlk5TnVENE4ra0dCQ0U4U2pwZXNnSFZZQjFtLzMvMEdSa2xQdG9qUFJL?=
 =?utf-8?B?Y3JiODJGYjE1VXB5Ny96aXVhUzVQMWVZRkZOUk90QmdvbWxVU3drcUVBblNs?=
 =?utf-8?B?TnBlNGFWdlRraldVd3AzZVA3dFI5QWN1TlBoelQ2Q3lld1hJWU1ZOUJqckty?=
 =?utf-8?B?WnB1eXhocm9NR1M0UnYwMTdoOW5TR0pLdlNhT25ObmtjdVQ5cC9PTGNuYS9x?=
 =?utf-8?B?WlNFaWtGRVhMYzNhcmRsVU9ITGpHOHFKZHhZMnYxTUlwUzNwbHZ3dUlXSUtu?=
 =?utf-8?B?U3ZNSy91REg5eUtvR2VPV0c1dVA5UVBXdGZTNlYvZFQ0czJPTUhHL1Y4VXpI?=
 =?utf-8?B?Q0JtY0lNM25qekpZeU8vMWF6WU1wb0djZG85MlYxTU5ZT0lRcStnWUZnbWNM?=
 =?utf-8?B?ZVAvczBYZjEyTTY2K1RaUFhMOXYxWmZDUmkyQVVTSUpvVDd0czhscFh6RjYy?=
 =?utf-8?B?OEhsK0FodkRkdmZ6V0pMcURGRks3OUlGVm1RcmJhdmZyeGdhRWpqQlJNaCsx?=
 =?utf-8?B?MUR2bGNkUW1rMG11N3JrYnNMeE55OGJ4UUQybFg3anRoalByRGlQSk9RVHJt?=
 =?utf-8?B?ejd4NUMzMW82eDVyUm9yRy9aancxZ05GQkFIdVB1VWduWHJ3M2EwV2RldUdL?=
 =?utf-8?B?dDZVa2RVY3FTdXFXMTBTRlp0WWsxVG14eHJsbFFQQWlNd2tXeHIxM2ErVisv?=
 =?utf-8?B?cm1oZlBDaklsV0hLNDNtcjZWQ0FueU9IQTd4VExlV3RmS1hRdU1EZmhhTXhH?=
 =?utf-8?B?a2dkRWZjY05LenhiY1JBdG95U3N4ODc5L2ZJT1RUd0dXS0kvMGNyRi9WS2VW?=
 =?utf-8?B?dGZJazZKM1g5MUdoYnBUNEJpbWFGRk4va0ZvVmRNVGphU0t2SytUTHd1YlBJ?=
 =?utf-8?B?bmRPWXc3anpZR1NaMVlJYWI0Unh6ZDdEczFJU1VNRC90R2VNeksvM3BpWEJv?=
 =?utf-8?B?Nisxdzh3VWJLVHB5Sit6QVlxb3VTVTVCZG9sakJKZW5UZUIrWlhVckRRbHN2?=
 =?utf-8?B?aDgrYUVucFlBMGVJTVJOKzIxVlQrWGF4cmZOYjV5aG4xOWhPWXJ2Y25ZbGtX?=
 =?utf-8?B?SXFreGlheGhLNlFXSUgxL3lWeUdxM1pRV3hrU2RHT25WMkFwZkNtakhmQnNr?=
 =?utf-8?B?cno3dGEzem5SVTVYcW1uKzd4ZDRDNTVUODY0dW9USW93M0xsVmpKVTYzdEs4?=
 =?utf-8?B?ZFVHditEMjF4YlYrbUdwRmluZ084K1VaaW9ldzZXS1NLUVZSMGhnT0dyaHZG?=
 =?utf-8?B?eVh6SkZaQjB5QlVNaUhmdmk5LzNvQWk1NFhjbkxlUXUxOFhHSVY4bDNPWWQ1?=
 =?utf-8?Q?i5b2gpg9WNFuQ6Sco5YQtBUQ4zIu0gkB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2x2R2NuTCtGOVFFRktiNGdKYmZjc29FV3RaODlUeXdMUU02cHFZYXlnVE0v?=
 =?utf-8?B?djFrOWxIVTNiUEZyK1kwK21od2RycDQ0SHJaQWxZS0U1TVFmamxRY3Z1Z3Z2?=
 =?utf-8?B?Q3VPQTdwcjg3aUNFanRlOFJyUHo5aDNDTUM3b01FcTlQdWNHWXNMa1NTTFMx?=
 =?utf-8?B?NUo5MnhmVVZQTzh3WjUvQXBHb2tZN1JtOHpLYkhpbmFjYzVFMmNwZHRvQmpx?=
 =?utf-8?B?Zi9sMGxpeVdYdEFCcFRXTEwxMHd4QWVKR3FYQlFpdDdSekwzQmMwUjkrNXVj?=
 =?utf-8?B?aXNXY3NBK3JCTmNFUnN0UnRQMzRGS0dkbVM5bVJRbjBtTHpMMXRaeTdaV1ZD?=
 =?utf-8?B?WHg2d0UrM2M5NmJETHFmZ3M5d2dXQW85WHRkU0x1d0dhV1V6eVhESndNRWIv?=
 =?utf-8?B?TE1zZE1adGtoVHJXRHRxNXNUbEFrU0FYTWpRd0U1Wm1BeS9yVUxJcUdpNmo0?=
 =?utf-8?B?bFNDRW54RWp0bEFrMXNzNFpVRnJESmVELzNBSkRMY3cwQWRkWnB5OExXZHZI?=
 =?utf-8?B?cndpaDFEbDYyYUpVdS9Nd3pIdXlxS0h0NldQMjk2aW9xak1KSC9XMnVNVFpj?=
 =?utf-8?B?N0lQbTg0NDNSaHgxU3R5TEZ5U0phTnFQcG9HTVhSVExDcXk0SlZUTUVielZK?=
 =?utf-8?B?cy9JRDJaZHVmUkM3ZG1yd1kwZFZnVEUyc1kwQ0lzSFgzSWZ1dWVJQldvR012?=
 =?utf-8?B?UUFZOWpsZ1M1blJsMmd2VFI1anBheTZGNTc5MkQ1L2JiVy9XOGFWcnp3WDc0?=
 =?utf-8?B?U1czQ1QrSG9MaFRXbkMzb2piSjFGM2hLdG1PSy84WFRic1c0VVBmQzBOZDIx?=
 =?utf-8?B?OFJIV3FINnJFQlZna093a0xPQVA1c2s4OXc5SWhQS1lOYXZsN1lUMkNHeEFO?=
 =?utf-8?B?VWhZd2RBckhFbk5JaXdxZlRPZ0VISG9Wd2F3VGQ5Z3V3SHpqNjNteVNkQWo5?=
 =?utf-8?B?ZW5OenZkaWs0VXhqb0ZnY3Uvd0ZqNyt2UUdxUkFKeGF1Q2xpWjViUkNlV01w?=
 =?utf-8?B?QTJMQlNjWXQyUytZc0hMam5WUm8yVjkrNVlFdGNJSEdkRGtMSURaa3lKSjIz?=
 =?utf-8?B?UzYzekkwb0M4eThFYmRrczVIRlBJTXRITFM0bjVoenZiRnNDMUFEQldoMjVE?=
 =?utf-8?B?TkF1VWZ2cGt1Q3gveW9LaElpVzFNMGZrS0Rha1ZEREVKcWFMUlVVQ3hPT0Vo?=
 =?utf-8?B?cHhwTlVHRGgxamNKbUwzbWhZTGgwYjVaaXp4cGVPVE9vcm80TVZaVEN4Vk43?=
 =?utf-8?B?RmpuOHJ5YTdQMTN1TFBDS1pQSmtmZmhHUDgvdlVkOTN6YmhhYjdYc0VCNTJM?=
 =?utf-8?B?VWpLRE1KM1ptUnZUS2pJY3RaMjExRlR5bGZPaVVNNDJiZE93ekR4WkhHTWVr?=
 =?utf-8?B?SnY3cUROKzg5TWpBTGdVU3ltQkFZM3ZsUVJHbEZZRlVEQ3FTQkNwS3Fpd1Ns?=
 =?utf-8?B?b3Z6U0ttaEw0L2RNU3RRL3dnRzQvSWJiYXlWYUJLNXY5V0wrWUFqckV6bktF?=
 =?utf-8?B?VjVtZzFvaEhKa2JBRkhna2krOE5JbFAvNE9HUGw0YVVFZGsyelRkV2pVNEdE?=
 =?utf-8?B?cUp3QUJJNy9mVkE1WGVRajdodHliZGJPT3lSZzIzWldrQW53b2R5b0o0Rlcv?=
 =?utf-8?B?MzlVMEhldGJveHB6ZnN4NlIvR0NNbXFjYnk1d0tkeFkvVTNrV0pQeTkvYWd2?=
 =?utf-8?B?M0FQODJOazFKNTM5ZUt6amV4bG5HUGdTLyt3YTI3ZmhIa3JqeE5oTCt4YXln?=
 =?utf-8?B?MDRtLzVkV3lrd3V6WkVybUxYdjUweWdIQWcyZDZySS9OQ1BqZEVEUmV3UGhD?=
 =?utf-8?B?TFhRMWQyeXFVRlRmako0L1BrK243VUdZUktPcTJlNzhIV2liUFBuOGdPNWdY?=
 =?utf-8?B?RS94TEpZWkNQZThSVUFhU09sNGIrQ2EwYVBubnc2Ky9OUjlnZmZYYVIyOE1E?=
 =?utf-8?B?YUtkNTFwQnBhalhRc25JUDNqL2xFMWZXdnMyNFJuY1JscWhaSlBWZHp3ZHJw?=
 =?utf-8?B?TWRWc2wwRkFmOGpJWlR1bS9PL1Z3dTkxR0RmcjNTVHIwWWNVODJybkg5WkpV?=
 =?utf-8?B?MkYzeEZ1U2JUSEM2dWtRMDZwZk9JcGNteEE4R0ZkUE5lNUtlK0FyQjhzcXEx?=
 =?utf-8?B?TTBWd1FRMHJuMnZTTFNwRmxDSno5TmtubTMyTlg3ZFpmWEVBYzI1ZDdldDFl?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1dab770-4ac8-4ded-4952-08de22cc3b88
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:49:30.1896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaCl2QQ5oy13A1odYvWs8iLo7KTDP8NtuWoPmfERATtSm+H3/vHUSQpBNrP94PwDD9sCM2YOfIjojcIbTgz+CdVoAcoydzJ7pv/V5Tq90MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10635



On 12.11.25 12:51, Mykyta Poturai wrote:
> Implement XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} calls to allow for
> enabling/disabling CPU cores in runtime.
> 
> For now this operations only support Arm64. For proper Arm32 support,
> there needs to be a mechanism to free per-cpu page tables, allocated in
> init_domheap_mappings.
> Also, hotplug is not supported if ITS, FFA, or TEE is enabled, as they
> use non-static IRQ actions.
> 
> Create a Kconfig option RUNTIME_CPU_CONTROL that reflects this
> constraints.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> v3->v4:
> * don't reimplement cpu_up/down helpers
> * add Kconfig option
> * fixup formatting
> 
> v2->v3:
> * no changes
> 
> v1->v2:
> * remove SMT ops
> * remove cpu == 0 checks
> * add XSM hooks
> * only implement for 64bit Arm
> ---
>   xen/arch/arm/Kconfig  |  4 ++++
>   xen/arch/arm/sysctl.c | 32 ++++++++++++++++++++++++++++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index cf6af68299..931ae51575 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -274,6 +274,10 @@ config PCI_PASSTHROUGH
>   	help
>   	  This option enables PCI device passthrough
>   
> +config RUNTIME_CPU_CONTROL
> +    def_bool y
> +    depends on ARM_64 && !TEE && !FFA && !HAS_ITS
> +

Having it in arch code I think right as Arch can have own deps
(Linux does it this way), but name has to be fixed and documented (docs).

may be more common name HOTPLUG_CPU (like in linux)?
naming is up to you.

>   endmenu
>   
>   menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 32cab4feff..3c4e29d82c 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -12,6 +12,7 @@
>   #include <xen/dt-overlay.h>
>   #include <xen/errno.h>
>   #include <xen/hypercall.h>
> +#include <xsm/xsm.h>
>   #include <asm/arm64/sve.h>
>   #include <public/sysctl.h>
>   
> @@ -23,6 +24,33 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>                                          XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>   }
>   
> +static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
> +{
> +#ifdef CONFIG_RUNTIME_CPU_CONTROL
> +    int ret;
> +
> +    switch ( hotplug->op )
> +    {
> +    case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> +        ret = xsm_resource_plug_core(XSM_HOOK);
> +        if ( ret )
> +            return ret;
> +        return continue_hypercall_on_cpu(0, cpu_up_helper, _p(hotplug->cpu));
> +
> +    case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
> +        ret = xsm_resource_unplug_core(XSM_HOOK);
> +        if ( ret )
> +            return ret;
> +        return continue_hypercall_on_cpu(0, cpu_down_helper, _p(hotplug->cpu));
> +
> +    default:
> +        return -EOPNOTSUPP;
> +    }
> +#else
> +    return -EOPNOTSUPP;
> +#endif
> +}
> +
>   long arch_do_sysctl(struct xen_sysctl *sysctl,
>                       XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>   {
> @@ -34,6 +62,10 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
>           ret = dt_overlay_sysctl(&sysctl->u.dt_overlay);
>           break;
>   
> +    case XEN_SYSCTL_cpu_hotplug:
> +        ret = cpu_hotplug_sysctl(&sysctl->u.cpu_hotplug);
> +        break;
> +
>       default:
>           ret = -ENOSYS;
>           break;

Common code need to be placed under same config guards.

-- 
Best regards,
-grygorii



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B262BA69644
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 18:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921031.1325057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tux6i-00047e-Rb; Wed, 19 Mar 2025 17:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921031.1325057; Wed, 19 Mar 2025 17:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tux6i-00046C-Oi; Wed, 19 Mar 2025 17:21:32 +0000
Received: by outflank-mailman (input) for mailman id 921031;
 Wed, 19 Mar 2025 17:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19Ti=WG=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tux6i-0003Ed-2Z
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 17:21:32 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20612.outbound.protection.outlook.com
 [2a01:111:f403:2607::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 995d3e00-04e6-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 18:21:31 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB8020.eurprd03.prod.outlook.com (2603:10a6:20b:42b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 17:21:29 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 17:21:29 +0000
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
X-Inumbo-ID: 995d3e00-04e6-11f0-9ea0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQn2sP+p9VjrzNTWVoXsy4xaasdJMPnO899AWWXL+ZRYCgMG1xHsH51j9DtiydwWQS9NL3OvF4DxFJlhwJtBCMhVcVS9QcDhq91FLS8TAMUpNSoF3EfpK5TltNRwdYGJyUQS6d+fQgNbWbecRWX88eHJtVFmVPHFTAKPtBglV234Fe6z6wXyGDoOUGL0yV5vU+bm9LM3mEDtx2J37C0vMNmGuSxMXZpkjCaBNHmDXIYuwURu+93a8rmv2nh8J0Q1hwfTcVxuKJybThRH6PvNSd9L1WKysWnKDjtu8gpI2Mko9UMRZVmJIzjuT0+9KXzXvQtNBZQ0iqogIGixh94GpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfN9l2LZfv70+xw8IcdoD2HbsQlJ7ZXEg9TVBCrEC1g=;
 b=NPLzbxo1k9kidvR8rRfLZefS82xz4S0t5RikdAYe/89NlbGLInlnH6yo97TpHdA6dl0Un5zMTPoTh87QJ2DDpJJoDsQx4bOVygw/JV+rv+BOnfdGQOyd+3dG2caWDB2VcTNxWRVv5xFemH1Dcn1U2a+uOc5CHb2DPW4Kzu8LQtG35uoaQSi4jHvsr6ItTFWBTqsw5dSDyLCKxaGGLRsCTCW0ULv35AU4SkxA2cP5m0U7O41dV13oClqe/c96WMjWmdOLvln2Lhn5im5PPxYpPvvutceXfR/Q2KEXbUr7I55cahouiuLU8iw/QvyePZml3grGXOBXwTHZBY3LT7QEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfN9l2LZfv70+xw8IcdoD2HbsQlJ7ZXEg9TVBCrEC1g=;
 b=MIZIKtEm8d9MwxdIie/MFuZLRqdRtRjTuwfuB6B5yoWXjY3ZdYXlLX24HPg/oywv8I3xvzo5a86nTy8d0wQRBc18UN0PSfSeh5HMJ1NdCdo5qAiGxwx0f0ZkoSTyQHdOx9RFHNm9j0Ts4miICN7a5mFg5rZNMTbJ7UXpozw8TnZytba//xpEGHWccoV3MzXH44ChvsQRfto/7eOvngkbLH3VReL9bZGkIUzxyHUx81MynXVeHGMpfQFANSsImhk/3p6a9ePZlsrs2/pyh2EopPKmlWyuf3z4t1AWTIhKPGgYpXdZE3OmukAwCke8ezLxzr5tqTVBEYoQEfyEKtYH1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <13ed6492-9677-40b7-a4ac-e6516f7ed130@epam.com>
Date: Wed, 19 Mar 2025 19:21:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] xen/char: implement suspend/resume calls for SCIF
 driver
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <503edd5fb277699aaeb87507bb39fbb52e81f168.1741164138.git.xakep.amatop@gmail.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <503edd5fb277699aaeb87507bb39fbb52e81f168.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::18) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0bb407-c03f-49fa-73e1-08dd670a7c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkVoUEJZNTJMZGFSM0RGeDhRNDVHQXM5RXJZME1WVzVESjNPS1E2c2VUQXhU?=
 =?utf-8?B?dmx5MjNSVnZDVllGRmhZOUpudzgrWEJ3aGl2bUpmMVg4TUQzNkJoeE1ISDk1?=
 =?utf-8?B?aTdja1Zza2VJVFBMcVFxKzNITWswMXh3cVROZlNEUWQrdmpidjRpVlArM28r?=
 =?utf-8?B?MWQwMEVpcXFpRjljK0RuUmFwTHlFeHdQZ0lIUEJhdWxkV1dhRjlFRmZCV1lP?=
 =?utf-8?B?aFFmVFdYQUVnMndtc3Q3NEFxU0VNZE0xOWs2NkhZSi9tRVJ5K3c3cVZWTWdM?=
 =?utf-8?B?ekl3cFA3dUtid1Jvbzgrb0hyZ2pUcnIvdkk1VEdhZ0tvWTF6N2d3LzNPWFdz?=
 =?utf-8?B?ZzNsNEI4SEFweitQUExSZjFOeHJ5bTFtV2FHakcySDNYaEdKTVhwVDNTbGk3?=
 =?utf-8?B?dkFtZk9HSnROVGpONEp3UjkxV291bGE0aXdBSlZSdFhXRTNUTnZIYnlJV1RH?=
 =?utf-8?B?R241SlRmRC9kMmdiODFWTEJXdldGS0lldzlwR1I1bGhiT0tUek5HaWo1dVZF?=
 =?utf-8?B?VzQ1dzQ1L2IwNTA3YzRWQS90anlzYWtoN3FhNll2c1NiYVJLVDVOTWdkckRL?=
 =?utf-8?B?eHBJYnhtSDIwelFqdEplVCtuTXRsTmhSS2w0Q2s1RXJLVTR2Rk1PakI0Tmp1?=
 =?utf-8?B?UVVFYkZaWGkxb3Z0QkxQUGs4WVFBTk1EZnJSQUtQTGU0ODFkbjArR1MrYWNY?=
 =?utf-8?B?S3R2bWx1Y2FxelRsMG9oR1VNMk1lVHRkQXlEVHowWVZZb2pzTExISTc2Ymdx?=
 =?utf-8?B?ZUJLeGpFVGtvU3BwZU5XYkJkZHNMMmhCUDdydVBkeUNMZUE0R3dManpEVm9D?=
 =?utf-8?B?OWxmRzJ5OFg0MEdjR2xGNXF1QXJ5SHA2TkROTURmTVh2UTZabXMwWEQ2YzBR?=
 =?utf-8?B?enhuaVV3ZmFFMU9lQnlIOVRyb2JkUzhIZ1d0MEpQSDQ3VlpQZ2MrY2xXSU16?=
 =?utf-8?B?Mmd4c3E5VkttK3RERTZhRXpQdXZEUTU1RDRsdHRRUUNkLzFOWS9jT3p1K3FL?=
 =?utf-8?B?M2FqQ3NhazhPREFyekF1ZjdMZjJlTHBnYXZtUUdkdkErRWJiZ1FtVyttQlVz?=
 =?utf-8?B?SFd2ek1pL2JaTlRtZDh6bmxwaTh0MnhLeGdWdWwvQjNWTXRxYS9zZDduNTYx?=
 =?utf-8?B?TlJKOGk2MjVBVytwU2NWNTZoRDFqK1VqeGxKYXFNaTdDSFZ5QzVoanE5WW5U?=
 =?utf-8?B?b2plWGMzK3VjOVNNOFpzT2NmaXlYZE1YT2xOeWpNT2xZdzlDUWRWb0lWaXBt?=
 =?utf-8?B?ZFVISXloRHNGRE5JVWExT0pyRjZ0QzZvTi8rMThWaWR0T2JjRHZ5bWxhTDc2?=
 =?utf-8?B?SksxUVVhVTdOcE5GSU1SSzBjUGJ5ZkkyM1JGZjNyc1cvekFnb016cWIyb0dN?=
 =?utf-8?B?a3A2MFRzWkxKUkEwMitWb0pSbnlYNlhzOHc3S2I1b2FjYmZlSFVvNWZUdG8v?=
 =?utf-8?B?MVR1ZndVR3RYQkRYQzZUZjhUOUg5QUo3VE1MSlozUzY1RklwOE93aEVpS0xx?=
 =?utf-8?B?YXM0QWV0SHFuRUNmVUZZbURlSmtieTJqZTN0RlBxV2h2MjdBMENPNFVRaGtj?=
 =?utf-8?B?QmNHNVBoQ0U2MGpwemFUYlQvbEcwc25xVE5CYmp6WjlEejZOd0JOcmpMYkFq?=
 =?utf-8?B?WUJheE1VMkVIQ1RNKzcrb0RZMWxJemVXaGhPVjBBWnpyRnFjOWJvWm40LzZF?=
 =?utf-8?B?Qy9ISTQ1ZnJpbStEVG1odXdTTnJ5LzdWREI4bC9zNFVnVkw1MzFVWi9Kcm8w?=
 =?utf-8?B?UWhBOFRlbVhKdVhTUm92ZGRCZDZGNGQxSEhqYS9RK0tkcmNad1JZT05iaDll?=
 =?utf-8?B?ajc0YzNiSTAvUk40WkdYWkJ6TjhiV0lFZjh6WUlWbWJJbFpYSnpqMExGdld5?=
 =?utf-8?Q?YFKeQxWEhhTWA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW1EdEhPZE16cTBCWXpNN0dudEVTNEJ2MDNFSlZJcjcrcCtlM1BUVE1zcERJ?=
 =?utf-8?B?VjRJOHVVT09sZ2NTQTZxN1JDODZHaFB5aGF3ZTZySkxWL1dzdC9YcUZnRnE3?=
 =?utf-8?B?STEyaUp2Y09zUmRUYlg4eUl4UXVZc1dXdTBVZDJPb1lobW16SDgwdUI3TWk5?=
 =?utf-8?B?VDJvVFV1cTJDK3hoenBCbDYrZGlqZ3VhWjhESnF3T2M5OUhVSEs4blowMzJM?=
 =?utf-8?B?SW81cjVxR3BWbXdnTGtmWk44SDVuTXBVSGIybG0wenNkMFh0WkkrQ09CVFFU?=
 =?utf-8?B?ckNwUmZ3cG9SMFR3c1R0cUtOM3lBQzhFakRrQzZFWlJieXJsalI3Q3AvaWlz?=
 =?utf-8?B?TGI2NGY3alBhbjNZSnBDbk04Q2tHb25wWDkrOW9QZTdWOHMxYlR2V0JqeHBU?=
 =?utf-8?B?MVpXTUlrb0IrN3lnWFozSnR2Y3FPdXFCL3pYRWZDWlorL3NGd2NBWWtzUzdo?=
 =?utf-8?B?S3B3L2RUSzAvVDBFa0dnd29kSXlpNWxlUjJrNzZybEFvbjBocTkvMUFwNGp2?=
 =?utf-8?B?Z1hhQnExWTBvbzNFM3dCdWVHTURpeEJWVkhnWGt4MWFoU0ozZTJJc3phT2dZ?=
 =?utf-8?B?cHJ3VXY5dG9WaDNsU2ROSEhmSWRyTlBOck9iaGtjNDMvV0F3YjloeUx5RTdv?=
 =?utf-8?B?K2JTeXJHakpTaCsrRXloSklCU211ajRjVEdSVzRJWVRFYXV6Z0hFaEJJY0VD?=
 =?utf-8?B?bHduVExOQTdrbXllMUFtV05MVlE4VTFMaFdGUFFlMGpKcHBIdmVGWTlwY3g1?=
 =?utf-8?B?M3Z5N1RaVi96RDFzZHZJc1NCUmJZUy9ucnBUZjRkRUI4RFF3R25MSUFuMm1E?=
 =?utf-8?B?dmRFdWZVbERmdHZOaUNvMXZJR0tlL0pVZFU0NFBwRVhsMHZPY2lIYWVwV0pu?=
 =?utf-8?B?Tlp2czh6bGJJek1FUWNuRVpJTVBQdGE2azNVS1NPWk1Pb29Fam5RcXluRTFX?=
 =?utf-8?B?elVZU1B1ZXBtK2Fkb2x6Mm41UmxLRlhUZFQ5VFR4TlYrcDhadXlTbGkycGM1?=
 =?utf-8?B?SWxnMEJ0SzBqTEMxK2lwSm5adzM0WnJSSnBtVHR6UUlwL0lDbmJ6am9SdHdD?=
 =?utf-8?B?MDkxb2J2NEo2SXY2cnBIM244c292TC9WU3JreVNReDlHaG9qTE5rb3Q5aGxp?=
 =?utf-8?B?UUk3TUoxTnVNYkFOazdFTVJNSnZQN2hHV05PdVp1K2dMalpxTnJPZm1NSXFL?=
 =?utf-8?B?elQvZC9tTVZ2TTg5a29odmRTajhWaUNnQjZtZHgweEs5NHNueVhkdEZFSlNN?=
 =?utf-8?B?VjNxTkdjZDNySDROekNTMUdsRXB4c0tWWEJGN1g4NjJidUpnYkdrZE5jTzJK?=
 =?utf-8?B?enYvcGtmNlB6bHpEcjFvVEFrVEtVMG1uck9YZVlMRnE0VCtSTkJSVUdXNGFj?=
 =?utf-8?B?dWZFWGFaM3pwOHVpTmNwcStDa3BBd3J5YlNBN2hlNFhIb1FNNzBSSzIySDhQ?=
 =?utf-8?B?b0xYOGlxTFIxV1VLbzVzVmZpditONnZPSjlnYnBoV0lMSG5OeVZrMmJhVGxO?=
 =?utf-8?B?cFprRThEaDdKR2Y1b2RqekJCK3lkNG5CYTBZMDZsMWxiWFF2dGppdm00MWV1?=
 =?utf-8?B?M3B3bks2bHpSR2JFZWtJWmszbWhGYVVSUTVpN3A3cEVkTE5tZkc2UGtJU3Fu?=
 =?utf-8?B?VWdJVFUxSGJVQjFna3pjL1Zrb2RldXFnUmpxZmNNUVFTT1FNNVlQbkU0UCtZ?=
 =?utf-8?B?Q0MzeUpyRzczcnEzL1hldlZWMWRKRzZzT1B1RU9KNDdGMExXOXdnMmIyZGtk?=
 =?utf-8?B?QkhxNHBxVkxtQmFoSjd6K2lvc2VXamdiUVh6K25RbUozV3hJZXltRFZhbXlX?=
 =?utf-8?B?d1RTd1dpcDJwNmZPVjVhcUZjcXBrQm44RGVCQyt4ZEJzUEo5czVsV2gwc1A2?=
 =?utf-8?B?N2gxclZqUVJEczhBQkNzWXRtUmZXU0NvNEkzdkJDZVB6dzN2Y0ZKcCt1R0hR?=
 =?utf-8?B?RTdPL0M2UzErVnV5NFkvSEY2anJGTWcwRHdTT3pKZlpleGUwblZ4KzZQazhS?=
 =?utf-8?B?R1podVpJK3o2VGhqaG9HREdaTWR1RVkvbFRwcitMejU4QVJYTnNURDk4S3Nw?=
 =?utf-8?B?SGp1eFVYSUwwM0R1OFVLWHRuWlUwTklnK25USW51eWxPemplZEFuMndkYmZX?=
 =?utf-8?B?NkZlS3hSK1I0dCtkQTl5cWR0a1JtZ2s4WThZVk5SeTY2ZFdIOWp2bXBGWUFz?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0bb407-c03f-49fa-73e1-08dd670a7c5f
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 17:21:29.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1DrItzJxOkXHdztmR83NLQgTdd+5lKyjAhu8Y4aQTjBSU0DNxO2XXAdmM87MAUuwXiyI8mwfGhkyjJRCfddGO8lqBXD38DdpUUdaNWsjp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8020



On 05.03.25 11:11, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The changes have been tested only on the Renesas R-Car-H3 Starter Kit board.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>   xen/drivers/char/scif-uart.c | 31 ++++++++++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
> index 757793ca45..e166fb0f36 100644
> --- a/xen/drivers/char/scif-uart.c
> +++ b/xen/drivers/char/scif-uart.c
> @@ -139,7 +139,7 @@ static void scif_uart_interrupt(int irq, void *data)
>       }
>   }
>   
> -static void __init scif_uart_init_preirq(struct serial_port *port)
> +static void scif_uart_init_preirq(struct serial_port *port)
>   {
>       struct scif_uart *uart = port->uart;
>       const struct port_params *params = uart->params;
> @@ -271,6 +271,33 @@ static void scif_uart_stop_tx(struct serial_port *port)
>       scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCSCR_TIE);
>   }
>   

I assume you want ifdef CONFIG_SYSTEM_SUSPEND here also


> +static void scif_uart_suspend(struct serial_port *port)
> +{
> +    struct scif_uart *uart = port->uart;
> +
> +    scif_uart_stop_tx(port);
> +
> +    /* Wait until last bit has been transmitted. */
> +    while ( !(scif_readw(uart, SCIF_SCFSR) & SCFSR_TEND) );
> +
> +    /* Disable TX/RX parts and all interrupts */
> +    scif_writew(uart, SCIF_SCSCR, 0);
> +
> +    /* Reset TX/RX FIFOs */
> +    scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
> +}
> +
> +static void scif_uart_resume(struct serial_port *port)
> +{
> +    struct scif_uart *uart = port->uart;
> +
> +    scif_uart_init_preirq(port);
> +
> +    /* Enable TX/RX and Error Interrupts  */
> +    scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) |
> +                SCSCR_TIE | SCSCR_RIE | SCSCR_REIE);
> +}
> +
>   static struct uart_driver __read_mostly scif_uart_driver = {
>       .init_preirq  = scif_uart_init_preirq,
>       .init_postirq = scif_uart_init_postirq,
> @@ -281,6 +308,8 @@ static struct uart_driver __read_mostly scif_uart_driver = {
>       .start_tx     = scif_uart_start_tx,
>       .stop_tx      = scif_uart_stop_tx,
>       .vuart_info   = scif_vuart_info,
> +    .suspend      = scif_uart_suspend,
> +    .resume       = scif_uart_resume,
>   };
>   
>   static const struct dt_device_match scif_uart_dt_match[] __initconst =

-- 
Best regards,
-grygorii


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B7BBF78F2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 18:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147470.1479791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBEmb-00010s-9L; Tue, 21 Oct 2025 16:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147470.1479791; Tue, 21 Oct 2025 16:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBEmb-0000zS-6f; Tue, 21 Oct 2025 16:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1147470;
 Tue, 21 Oct 2025 16:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3pTU=46=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBEmZ-0000zM-Rl
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 16:00:19 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06e60a0d-ae97-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 18:00:14 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SJ2PR03MB7404.namprd03.prod.outlook.com (2603:10b6:a03:559::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 16:00:09 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 16:00:09 +0000
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
X-Inumbo-ID: 06e60a0d-ae97-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pp06OFXHyIi4P7rCsZvQvtqgdur8lyMN3wDvrnRTZv2WOa2wta1RJJ29cuEKIR0fghA89Z1yi42qWQbXM/IuM4srNrxxAN//7Fd4LXXvMXh+jzreF+rkBCQv1qm9xxasAQ3nkGhS75Iu8U6vrmMexrlhtNv6YDihhLJLHvHPDzMrOXafdbP4IA635Pgjxn3avSFjKH81Uy2/gqs5cv/4k8349eCfxpamyCYxGeLjYWbkHegGqZ2DGHNtgrvW+nP2KruPBUWM8gGhMlM6Xve45zoPa5nZKM6eq5WSdq3dRgKTS/wHFZazrqtIbt1YkfPiTBmYR5ASzdGEMW2ZcMtcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbIGtqr9eh8EqJk1Tm5rtipz030C7YccW48lvbw4m9w=;
 b=PwvJ2Uh+nzCaQgP0lzs1xP4a8pOc0wwzcKtWytCHE9xOyfhBH6WQJbaU2IVZi5g0KTQt9TrFapXEbqsc95KLSs8mInHGJbj5RzpltNAGTft2Y5Beeq0/28woTm22p2edheWBiGiEywDx1xKoXdi+IFZgKvAY3OVvws4382ehtsHJf8HoYTw3ecoeOtXAjsWhpZU6qqPvQ3/KR4+C911mRdWd8h41ih1Zj3nueyLUpLcLs9rc1kgN/w6iVU1+vAkD5sNo78EF7e822DUcFAxRxxg/5bJaERw+ouj/39ImJpDVbUHJ2DsSs5iAXz1tD8kPJNELRmWBwTIzNB6ss140+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbIGtqr9eh8EqJk1Tm5rtipz030C7YccW48lvbw4m9w=;
 b=W1ZGchLsX0gWwbfbIaDEez4ZzNr5z7+1CqHwwsKKT85Q2z2Ulf7SC+fT17EE3VMgmGaxmKvYm44LLM1rdp6Xfw91H/08rhP1+t1W7tE6Tqd+26FyShh+yPdRVYpxebqbysiEMopHPczSmcedRYq8WP2bg2CpMcbMqlnujDYgFGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ddf70bc3-b5c5-49e0-9f70-33d436737dcd@citrix.com>
Date: Tue, 21 Oct 2025 17:00:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: Make gentypes.py compatible with older
 Python
To: Jason Andryuk <jason.andryuk@amd.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper@citrix.com>,
 "anthony.perard@vates.tech" <anthony.perard@vates.tech>,
 "jgross@suse.com" <jgross@suse.com>,
 "oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <81c56c9c-882e-4433-b41a-6952315efa25@suse.com>
 <0a78d0993fc44d6cae0a363cc875b6da@DM4PR03MB7015.namprd03.prod.outlook.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0a78d0993fc44d6cae0a363cc875b6da@DM4PR03MB7015.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::18) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SJ2PR03MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ac618b-e6f6-485c-8aec-08de10bae884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THpWOXEvVGhsODA1RlR2TjNaVHZ6eGMzdHdReG1JcWZ4MTJhckpIbzhBMEUw?=
 =?utf-8?B?NEJkU2t3aVBralIvWTY4QmNpRHJWUkV3OXVReUdFbkErYS8zVkZ3cG0ySTZO?=
 =?utf-8?B?UkdFN3Rra3JLV3d5dmpKYzdmVnJubXY0QUZsWGUyRnlVMGxsaXhUNHdGR0ZE?=
 =?utf-8?B?VFhYZzY2VjBVS1EvTUplM3lyWDJmc2xmZDFDbE1nVXVhZHI1VHQ5SnpIZWZH?=
 =?utf-8?B?Um5HZFdWelNOTitIZVRZbFZvMmx4NVZOOVNnVGZXTVlWcEIzb3M1YnNCVXZV?=
 =?utf-8?B?dzc0d3JGR2FuYUFwS0tlM2p2OG53d1ZkRmtEak1TNjhKMVNMdFkwZnRybnlH?=
 =?utf-8?B?RE5qSGZJelZQTDdNV2cwbjlZdUp4bDRhL0tUdVBkRHh6QjBlaUxvTWk0ODdu?=
 =?utf-8?B?VGVweDd2bFpRTk91QUc5Y2VxSldIUjdVK1RJQVdOeDF0VUJVYkk0WXBvdGd2?=
 =?utf-8?B?blRUbGVETG52SXlua2dWUSs1dEozSFo0YURXK3ZmZXo5NTljdVZ2OVhyUXBr?=
 =?utf-8?B?VnNJb3ozZENwaFNMeUI3MUtwOWJyMU5lSHBLT25JZUFBNzBVcHA3UWF0eENv?=
 =?utf-8?B?aFRkUUsrd2k1eWp5d3BiTFB2SHBzTENnVHEvTWlnVmhrT3Focm9ja1l5MWhu?=
 =?utf-8?B?NENYVXdrM0FMNjE5QU02K2dJb0s4R1JGYVdsTlU5Sk40WXhzQTBjckVpdHdl?=
 =?utf-8?B?UEJVdnVVN2p2ZjZmMEZsYW5UenlpRnFYSFBQdXFhR0pNTkd0VHVpWFYxY3dB?=
 =?utf-8?B?aloyYjFwek95VjRaM1d5QkcwSkZZM3dHUVdaU01aQXcrbzYwaXNza2pSMG5F?=
 =?utf-8?B?WnI1SW9uV0laOElISnVmc04vczdRT2tpQUx5ZDMwanJ1dWtHMFoxTEVrRVBy?=
 =?utf-8?B?QVlpeVBkYlhKQXlaaG4vYlNqTW1tZzMrUlFBbE4yRzlQdkFORXRwWTdiTm8w?=
 =?utf-8?B?ZWNIVVJIQnNVVHpscjRQWDZ6ZjFBb1dHckorbDhFcnJzL1ZGejFVMHh6Nndn?=
 =?utf-8?B?Y3VLYVJDYUFiMXF3WFhFYnlpOWgwZ29NdWI0WTBabHhDbktDdm91bWZBdzZ5?=
 =?utf-8?B?ZTZDcXE3clFOWGRicjA2WVdtM2hUWXRSSHdCVG5lanhhWSs1NHB1eVMyRSt3?=
 =?utf-8?B?amxEZm05VmdkQW5ZSFdPMnpObXpYM2hGSHBzWG13ckU1YTNMemZEd01tZXVQ?=
 =?utf-8?B?NmNHM0p4K1NnL1VwVDVkZHdRQnJFZGdrLzdxeVoxcmV1aTZMeW00UmNLVEND?=
 =?utf-8?B?VSsvRmU2OXVLTTJJS3ZvZDNMcjN1MGlyYURvcTkzeitlTWhYZ2wxYXFsbzEx?=
 =?utf-8?B?V3FqdU5ncURVcGxnRno3WVVqNm14emh0OUFISkFuQVFjYnNiTk5Hd2dqcWZL?=
 =?utf-8?B?RXBIRVoyajBGTUhvT0RnMk45YzFqMndYaGpMckFuclowN0d4UzJaMUdnWW5B?=
 =?utf-8?B?SHQ2R2ZSQUpLTFB6bnczNzBsUUpwcTYxSnBJcG1KR0lzcDRBYU1UY3VtbkQr?=
 =?utf-8?B?ZUt6RUZKOUV6S3ExWjRRdmpNWHlIREIvdjF2M0lVSXFpejVzdzlHU0RSYURl?=
 =?utf-8?B?Z0lwaEYrS1MxdnVzSDF2ekhlQXJEOXoyc1lhbDRhbS80VHBuRW9RSHNkYVZu?=
 =?utf-8?B?by9YbW52Z3haZUhDY1B6YUNqckpLWmFiN3l6S3RlaGtCTzlxWDVDLzJJd0Jm?=
 =?utf-8?B?QjMrS2tzR2ZaOXdmUUcxblYzOHpwMVNKeHhINzB1VDNBZ3VaWXJJSTN4RlBG?=
 =?utf-8?B?VWdwSGlDYUpiQW1HdFFDNUhQbHozS2RzQk8xWlFLb01FVlpIZGFQa3FoUTMv?=
 =?utf-8?B?TVV5a3ZVUjR2QVNaVDcwZTllNnVPMWtNM29Ma3NDOEVKWlFtOTRjcnBPTVEr?=
 =?utf-8?B?RFlxd0UyUlN4SkZySDZDOXdnZy9wdndoMUJkVFcvVEJvb25jZ01wUVlCMC84?=
 =?utf-8?Q?9lAWRChvgYuiLGbtWtS52rfyKXEk5b5A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHZGcC9xWFEyWlJ4WWZXdHhGbjdSMzdxM3MvZXRIdGx1RDAzN2M1czdXMnFt?=
 =?utf-8?B?b1g0NmNER2d4Q1ZUSWVoNVFXVDluYVl0a2RIRVpEbllKSkRYcWZneHZmS3RP?=
 =?utf-8?B?Q1NDbTVEbHlOczB3L2Yrb0RhVEUycTlnQUFGNDY2VWZ4ZUgrTWluTVdqN21z?=
 =?utf-8?B?by9LaDgxZ2pIR2s3bEgvanRTeWc3V3k5K2lMNE1QNTBJSDF0NW1uK0oyc1BN?=
 =?utf-8?B?K1lMc2NlUW16U2huckpaTTVtbGgyQnR2Q2FOWXJkckxEaTZtdGV6K2pOSit6?=
 =?utf-8?B?Q2owVldmdjBVeEhZbzBTTVI4NzFNRDR1YlNBY3lEMDVHb2hVdTVGeTcxM1pQ?=
 =?utf-8?B?dm10NU9PUVNFa3MvOXRSbEtkd21vTzdUZDFsUHVKdFdBRG5ObWN1MWVuU3lv?=
 =?utf-8?B?TTlpdXN3RFVFTitCa2VJbDk3OEVmeXFoeFBwVHNRZVRrajRmbXg3UGd1WEJi?=
 =?utf-8?B?ZmlZYSttWVhRR2ROV0tvRnVqMXk1VGlNbTQyVDhFRExTOXBMV09QU2d0bFNp?=
 =?utf-8?B?UHpaVkVQZzFodzNpSzdCOEJXUTg0R0E3VVRCWEgwUHNRQ0FWRGJIcTFrbzBN?=
 =?utf-8?B?OGZyYWVNYXAzdExhTUlqN1Y1b2s1eDhXaFErOGJSNXVyMWh0ekc0SEp6TmND?=
 =?utf-8?B?QkV5VVphNWF6dXB5TlFuSWZXNmcxOWFyRVRqZlVpbEIra3BkVHJYZDh4YzNj?=
 =?utf-8?B?c0F3bVBGZ0NQQ0FQTGpMZmVMWVJvemJnTmZYbEg5MjN5Rlc5TEdnbjltV3VQ?=
 =?utf-8?B?b2VSbHZ6clJlSTdySEYxNnFjbDNXWmhuNjdxMU1paWNHQmZzVlVvYjFwM2Fv?=
 =?utf-8?B?YlVKVXRtMzc5R0NXZEVtcG5zTlVNajVKdnlQZkNUaSsvamFSeGI1N1YxU2Vx?=
 =?utf-8?B?Zkoxai9OTzUzSitDVmlYWlN2TnQ4czVRazhZbXU4MjZPYy9iS2lVc2t5VzRE?=
 =?utf-8?B?czdrR0xHSmV5T0t1eWlBeVNXL2RPNTBRdDNjeW9zbmY4cGgrZThERTFuV1pT?=
 =?utf-8?B?U2tMS09uTkd0SXBCZGJsOUJ1dExRdzVLU0hpT3FJNVNXREswVzIzQmw4UndF?=
 =?utf-8?B?ZDRNRjIvZDlNOXNYNGtqcmRGSklXNUtpK0N0dmowWjllcHdiVllqNkRoMlEw?=
 =?utf-8?B?dTU4NlFPazVOejk1ZXRjVWF5eEZxdWdxbVJVWjJnblZQMUZLWW5vY2k4d3pP?=
 =?utf-8?B?TEF0RkJiRFFCNHRZMWJPbDJjMHF2c3pFaVM0TGlJcnJUWnAyRWg5Sjk1Vytv?=
 =?utf-8?B?ckc2cDBvMGVHbXBQTHFSSW12TzlGbDVkR1lORmY1M1NFUzJHSGRhby96Zlgr?=
 =?utf-8?B?MGlkeXU2MjhreC9ya0N2RzM0dCtEcHN6c1Nac0M3WXFpYTdOWXkrWE9EQm1Q?=
 =?utf-8?B?WXRLM0dWUW0zR0tKS0liN0NDajBxdmk2b2cwMjU3bDVQOWFRVExjeXI5NHYw?=
 =?utf-8?B?dE5lSlpYeUhXWjNoWWIyZFl1WGhoaVJZeERNTUlYeUJiNFZnZ1ZvQTJkeTcz?=
 =?utf-8?B?UTVBamVYZ1NHWENFcjhvNk5LWTVKcW1nUC9UTElJc3Rscys3T0ZNUUZvaVJE?=
 =?utf-8?B?eVA2ek5YejdzWUxVVGNLcnFZYVRscTdTalBSOGN5MTI1Snoxc0hRS2RLb3Qv?=
 =?utf-8?B?WkgvVjVWa3RGWXprYlRWbThsa0crYkk5YjV6Z3krM3hDQXVDR2hFWWJ1UWRS?=
 =?utf-8?B?MFNmTFJ5VXp5RFBiczI2b0RTem01TlBJUzk2Z0JSSTJuUFFWUU9QTkg1NWRF?=
 =?utf-8?B?dzAwNHArODBhRmZoZTJUNm5Ca0I0d3JhVXN3Zy9aTXBkdWFJWkxyOStGTmsr?=
 =?utf-8?B?eXl3MzVTWThqcjBaQUZ0MUFIU2JQWGlpUGRuYWtybnZDb0FKYjF1dzNtNFBx?=
 =?utf-8?B?eXE3VzNOa1pzK3FYZmwzMVNuMkV4R1c5M2psZnVTUnRhT2dIclRmbzlqTWZk?=
 =?utf-8?B?ZC9LWFpVWVpHUnYvQUxFM3Rsb0wvY3d5WW9nNGdaWnlkY1lVUXVFU2hhS01n?=
 =?utf-8?B?aGRvQjJSNWJFQllxS0JubnFYY2IrY3FXN09CVVJHK0JaL1RsSkpKclNvaXQ2?=
 =?utf-8?B?akEyR0hDZEtFMStVWDVTT2ZzTlRHQTNEcWg5TkxvSHYzOFV0NjZBQzYwdllO?=
 =?utf-8?B?VFdzamlWb1V6dnkrNTVCTmswS0RVZWhJd2RBczgzZEFJVndvaVlwaGtKNngy?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ac618b-e6f6-485c-8aec-08de10bae884
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 16:00:09.1593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtcYfSGLewH+rxQMy4ShUGJF3zYHbEUi06qX8q14OgJYKgs/YKl2CYV8D0T0Tx+R0ysQ7LryKOA8aKmd/WgwMgPHDBIo/vFF2vWoiC1azJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7404

On 17/10/2025 3:06 am, Jason Andryuk wrote:
> removeprefix is only added in Python 3.9.
>
> Instead of the prefix removal, switch to passing in a "depth" parameter,
> and incrementing it for each level.
>
> There is a slight change in the generated _libxl_types.c.  instances of
> KeyedUnion increment depth without outputing any code.  The net result
> is some cases where jso_sub_1 is followed by jso_sub_3.  As an example:
>
> _libxl_types.c
> _libxl_types.c
> @@ -5535,12 +5535,12 @@
>                  if (!jso_sub_1)
>                      goto out;
>                  if (!libxl__string_is_default(&p->u.pty.path)) {
> -                    json_object *jso_sub_2 = NULL;
> -                    rc = libxl__string_gen_jso(&jso_sub_2, p->u.pty.path);
> +                    json_object *jso_sub_3 = NULL;
> +                    rc = libxl__string_gen_jso(&jso_sub_3, p->u.pty.path);
>                      if (rc)
>                          goto out;
> -                    if (json_object_object_add(jso_sub_1, "path", jso_sub_2)) {
> -                        json_object_put(jso_sub_2);
> +                    if (json_object_object_add(jso_sub_1, "path", jso_sub_3)) {
> +                        json_object_put(jso_sub_3);
>                          goto out;
>                      }
>                  }
>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Personally, I think this is the nicest of the options posted.


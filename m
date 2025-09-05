Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C9B46249
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 20:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112283.1460628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uubDR-0007g2-1Y; Fri, 05 Sep 2025 18:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112283.1460628; Fri, 05 Sep 2025 18:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uubDQ-0007dC-Uw; Fri, 05 Sep 2025 18:31:16 +0000
Received: by outflank-mailman (input) for mailman id 1112283;
 Fri, 05 Sep 2025 18:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPPU=3Q=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uubDO-0007d5-KA
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 18:31:14 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78bb5216-8a86-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 20:31:00 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB8551.eurprd03.prod.outlook.com (2603:10a6:10:3e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 18:30:58 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 18:30:58 +0000
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
X-Inumbo-ID: 78bb5216-8a86-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grw8OoeqFWzY2kWJhdx43YBJH1IZ297GbluVT7aLdfXUnr+jr5qAFyGl1NAT6YogwCbucpk+9ScNA/SOVgIdS6Q1NV+H/bLHBTqkNdwUcr1l71rsylEnH+yExqe7nSXOaakOVEWu6Q6LoawvXMZPJ7RMj1NWA3QC3Rd2kKxKN6ss1NNUkkYe+Ika6Ny07S5PJrI68oNZqIlLHCOZvaHQk5eF4eljsC3pWWL9KrlSngchLke/5u3aULUxLax+Yjcc0j16zPOm+m1S0fltHn4R3PfzfmYT5eQ0yd9wQ9vIhnfesqzjTC/+gzrubWkcKEpnawE5nA+qihc/yvd9ETr6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcedgvUfzEoVTbTnQolZsWuqm45lXszulgJq2t5d1UY=;
 b=s94zzmFV++hbBoclP8t+OMu7BrOLqY94vMwaBxLj9zZTWX5aXbu0v4/vTQX87l//358y9j/Plocz1IS3jVUX3T0mBhxQQIUfMi7k6dWM0q639UOGuCIwB1FG7EsZCgC9kCp0XKrLUtiRmeRyKDs/5JhWwJC9neFSGys+1rydyWgqu2jD4uRfFEHCx5/CKmdg2rN4zlAbbfvcEc6cHx1DeAbS3gIuDWaWPlg8Z6T2tXd2iH1DNbBtEH3pUMxQP7goSR5T4Ro+BGlKGK9iS1JRUQnZIqjuFPITvFJuYahyGU2qtMurFAJShsWIUb2r7XLlr/SNd8mFY+bbSVmOdOg2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcedgvUfzEoVTbTnQolZsWuqm45lXszulgJq2t5d1UY=;
 b=Ao+xuiioEw7MLRPD6J2vv6wNvSVBhGJ13XjxucjzXGwQZqVR/YKwYSuN/0Lnbdlr0njeCyJSQsdZQWPUW1qiJ3aWuR8GDN6sCfuk8FBkvvDPi4xhExtb2Qktw28k2VcYykGse/IsILEaPdNrvgy5kGNK53xilNGOFAFO12+IWafOWAgfUseoL9/Ie0aegZET8eW2qRMFruJbeLsVqNvEknnxptBiVy9RMzOE8fNpQUzph7CJhx/uJdic3VPjwS9NdXhMBYRpBiT42+RugPKGx44d7G1b3DQ+7Qxip5KMuSNrhW2N0RhanoSpK08CcQX5eKsY17LxhxYv1syrw89wOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <99fd1f8c-03b5-482b-b421-ba17f4b17e17@epam.com>
Date: Fri, 5 Sep 2025 21:30:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
To: Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
 <20250806094929.293658-4-grygorii_strashko@epam.com>
 <87ms7l39gl.fsf@epam.com> <540abaa2-9946-40b8-bf49-b54e4f7a1393@epam.com>
 <87o6rpqent.fsf@epam.com> <1b27dc46-4d5c-4c6d-8976-0f9b98d11d6b@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <1b27dc46-4d5c-4c6d-8976-0f9b98d11d6b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: 830199fe-8712-427f-ceec-08ddecaa5b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3lSbzNmQi82SHRPWG9FS2VZb1BCZlUzNGlKQkRTdDRFMzI3eWFPZHNJMk5h?=
 =?utf-8?B?djdMaURoa3llOVFyVnhuOGVyNVpVZStrR1JvTVVSOTBuWW9MRWpuaGFqRW43?=
 =?utf-8?B?ZmhRQnNDNWRWR1NxcmVkMWEzc0dVbjhjZS9EWWhwOUxhSFBXeVVhWCtJSVhl?=
 =?utf-8?B?TUZ6ek1oWnJKZEE3VGxwd09mNzNrT2RVUW1PQjVDVmwzeHU2eXlhTmdDNmlr?=
 =?utf-8?B?NW4xN2thQXpCbWZvZFlhWi93VjNneGU3MHg1VjZVWnYzaVZoZWFQaWNSODJY?=
 =?utf-8?B?OThMMjVGOVZMSVAyakxDK2YwR25QMStmWUdkR3NoN1JSajVUUllIY01MT1dy?=
 =?utf-8?B?VWIwdTA3UkxocVpIUlpRakhHVHhHK0J1QXRibnMwV0RORGs3aU9KaTFHNDBP?=
 =?utf-8?B?d2Erc2dBcXpxU044MUVwWXpOMW5hRmFYa3pubDR1ZVVpU3dIUytlZnVjaUhv?=
 =?utf-8?B?U0JLam1OUXNiZThzWnNMV2hSclJiSHdHRFoxV0cvTWEzZDMwczZWQm5pR0VD?=
 =?utf-8?B?cmoxMTFsenhvMkh2UmNRc3FCZ21BQ1N0UmMzMlk3Z05GNnVPYjRNdXE3cWp0?=
 =?utf-8?B?RFR0S21lVnlENW05TVBvOEw1TUdXbzJQZE9HU1JCU3ZaL3dPaS85NXBoU2JQ?=
 =?utf-8?B?RDR2eFdpeEo2NC8xOG1iL21jWEdUd1A3cjdjcDZNNzNLWk5QVmZPaGEwTmtp?=
 =?utf-8?B?aHdJVTRhdVhZaUJ1NlZpTFdyY2pEQ0xCSkljak9DODBFanBHWm1MMDI5blhQ?=
 =?utf-8?B?em05SEJzWlR3QXNqV3FtNWQ1K1hIaUVpRGlyWHNHMDJ2MHNqVDdaWTM2TkxJ?=
 =?utf-8?B?TGs2NnJDRW9PeXplcFpGUXBMQ2FtaVQvdFd5dGNpSzZLcHd6VThCcWNmTDZ4?=
 =?utf-8?B?OTRsRHpFTW5BUEhRTG96QnIyUFl5aDFmSGlZRk1ERHl3aEF2ZzA2YmFGSjhE?=
 =?utf-8?B?K0Ntb29aQ2V1bjVVT0xDSklTdmtiamdUeHU1RXpNVXphbkhvYzc2a0ZDMlda?=
 =?utf-8?B?T0QwejVpdWtBTGREMy92RldYMWo2NWcxQTR0R3Z3V00wSUt6enhTTlBvVC9y?=
 =?utf-8?B?ZlU2OEY1cXRQdFVSK1U1NTc3SzhreC9VTXMzekxUNW9WR2x4QmRWUlhTNFBM?=
 =?utf-8?B?K3BZNlpYZTl2UUtYTXYxUGRWSEZpdTEyR2cyVSthRE53TXY2NnhRZ1Q3UGhQ?=
 =?utf-8?B?ajIxL3UwbklkbWRPekVmcVFlRnpqSWQyVjhSbDZLVkJZTnpnTE01Z0pYWjh2?=
 =?utf-8?B?S3ZlWlVQMi9UL3hlUUh5d2swRXdzYlBiU05JZFpzSHZLWTdHcHp6NFE1Mzdj?=
 =?utf-8?B?Q09TK3pheVh1OE5QV2xlTExDbHVHVnA4bFFGd0s5U3A3aDlQMVp1UkVnYVpX?=
 =?utf-8?B?MFNOeGFmSjVORUwxNW5QeDRnVndkbmN3QXJCcnZhVXVyN2pGOUNPOHZ5VmQ4?=
 =?utf-8?B?VnRzK3M0SFBXTmlpVzdmUkprTytWbWE5aGdURTBtSWQ1cHVIQXVMeHJDdVM5?=
 =?utf-8?B?VU9oMEM3ZEpVY0tvWkhKaTdnVGU1VldjQVNGZGRNaGdSbXBvRFQ0NWFhQkFs?=
 =?utf-8?B?N2NydkFJNDlEckU2dGRxVm03S2RiUmtvWGM5U3RYWnRHc2xGUjBJMnhtSVMz?=
 =?utf-8?B?c05Zek9ESlZCNlFUYnhHVUoxUWhXZGJDZ2ptVmZqa2VKRFV4cVN5MUlrcmlz?=
 =?utf-8?B?NnlGOXpLOEZvMnQ3T0pGREdrVFlPczRlS1FzZDB4SlFsV3FGdUF4bG1mTEtq?=
 =?utf-8?B?VHlWQ2xKVGdZSmdHd3Rab1J2L0tnM1ZzQktlRkxreTFxMndGa1JBMktXMDdm?=
 =?utf-8?B?Y09zU0MvUlVOb1liTlp5NTdzMW5BcEt4TEpsTG1QUWRVaFNKdlNETEtQVzlK?=
 =?utf-8?B?UXVhTXNjTHljemJsNUQycXpjWUhSeUx3c2xxWXlIQlJUMHEwZWFJRzQ3ZDRs?=
 =?utf-8?Q?xp/oTWg2268=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0xRb1RhTnhmbkprbWtHMjQ0R3czcjVQMG9RUWxqaFZFeWcyTEtiVmQzL0w2?=
 =?utf-8?B?K1BUQVBWZTFDYzl4a25lV1M5REJ1VVNVM0liSE1LbVJSbXdXYXlTa25DTkVN?=
 =?utf-8?B?SG5nZU1QS3RYSWlMaGFmT29sdmh3QUI0T2lVVnRWUyt1UVdxM05ra1g3RzQ2?=
 =?utf-8?B?UG5Wb1I4ZlNzNnJwaGpaYWxvaDl0UjlJOVlRTnBRSXE2R0JqOUt1QkR0NHVZ?=
 =?utf-8?B?WGUweURwSXRicm8wVG9Hb0ZvNzVPRDR1Wnh6c1drdUJLTnRHUW94Y2pTRkZu?=
 =?utf-8?B?djdlVHBESFUwcDNTWUtyM090S3RjUGlpcHNnRGMxWCtKVnMxTzNiMGJGTWUy?=
 =?utf-8?B?MFUzOGNHTm9SU0J3UHdRejVKZzBRcEovUTNFaVVEVnB5RzcyZU1KUG80akJU?=
 =?utf-8?B?TWNpMkp6bE92MDdoVGgzNm90RU11Z1N6WnR6NnE0WDFCcFFCaTNDTm4vSDRY?=
 =?utf-8?B?YllsYkNhTzR3d0JpSm1CZVEvalZ2cUR1Z2FFNzZkNHF4N3NNZ3ZuQzFpdHox?=
 =?utf-8?B?VllQNzBBeGtZSXJMZDhxZTRoQUg3ckJzcGFFMHBWeHJ1QTZuM0FBajQ3UzZo?=
 =?utf-8?B?LzNkeGNteGJMeFVjMjBlK3lTUWVmb0phUHV2U00wcHdwYVdpQ2pjQmVqTUZt?=
 =?utf-8?B?UUVLM3lHRWExQW9uVDVObHRmdGhndVpCUlJhYTRwNFUyYTlJWXRLZllUSisv?=
 =?utf-8?B?cGNkNFkzMzRBRG9uc21WMkVmTmZlbWxVQ1BIQ0JrbU9hT0tiSjFBVSt5MzJS?=
 =?utf-8?B?Q1k2SXZyNlRMeHZTcE01cDdUOXdjZVJyYWo1NEhoUCtWWjExRmJzbmpUS3BX?=
 =?utf-8?B?dWdhcXlneE5BUkxMS29lZlY3cWQ5LzBYd0NnVldidEFKeGllWmNSLzBIWE1T?=
 =?utf-8?B?Mm94NWl3NFA1dEJtMGplb2o3UFpoeE93U3ZzT0gzWmtKc2ZIdDhGVVJTcnlG?=
 =?utf-8?B?OEZSbTRmS0NYSnNEcGhaNW9LM1hUNjRPbnZybmpZREt3dExmRDRyUG9TclBu?=
 =?utf-8?B?dlhtWWR3azZRcHVBRzNISkVqd0puSk1ZWVN0a1NFYUpNN3BJYVEzZWRWWVNq?=
 =?utf-8?B?dVl5NWhRRFdTekNEUEhFcmMzNkkzWlZlUFdacVkwYXpCaHduYytlOHgxSllS?=
 =?utf-8?B?Y0pucEhEakpHYU5vd1JiRFZFK3A0MTJsRVIySnZmLy80amlzNmZSMnM5OUNX?=
 =?utf-8?B?RWdxdnNIR3FsY3BNaVYyV0FBaWtLYTBZeG5pdXQyenNtb3dkOGVuZWhXbjhN?=
 =?utf-8?B?bTBodFVHOVRtbXVGT3JTQUllY2t6M1R3V1MxWmp5a2ZMTUIrWVduN0tSY3No?=
 =?utf-8?B?NUc2Wk83TnVmRDdHc3c3MHBNL2RJaTMra3VSS1ZCQ1NyYXczZHdPdFZyOTdZ?=
 =?utf-8?B?YmtuYS8wVmF5YXByNnZiRkdiMldqaFV0SytVeENtc0pwaXBaZGJ0c3lzS2Rm?=
 =?utf-8?B?WWNrMUVFTHFERUlRQU5WOTBJVnluaFV6enZRRGNBcHFKY0ZTZzJYSjJDN2Fw?=
 =?utf-8?B?M2xZYXJSNjQrNGp6TTRBaUlOVEtRZHl4YzhMSFpXb0phZmNWYXRraklRSHp6?=
 =?utf-8?B?amZxTUl6cU5CU3hWTnJzcnRJajBhMDVnQWE2YWZSRWluYVNnU01tbXEzSlVk?=
 =?utf-8?B?TWNNZG9XSng2ZDdlRU5VM1I4dmR4WWFpblZjMUVZVFlNQlBVSWlrZlVXbEtm?=
 =?utf-8?B?aXRtcjRXYjJCN1dUVitkb2h4MlRtL2txcFZnUnBOb3BaSTB4MlBtN3I0MUpl?=
 =?utf-8?B?YmdGQmlSbFhFbHFhOWlhTm9FbkNhMlhGTHJhSStaVEhNU080QjR0NDY2L29Y?=
 =?utf-8?B?dDlubjJkSUtWczFIanlhYkFkTUlZeWE3UGFpYzVTa2NWbnJZYzRZa29HM0dt?=
 =?utf-8?B?TkJNVnZJRHh1bDNuMVNJUjFnTUY3ZmlsV0xYbm9nUzM0Z0FIeGt3TmdhZkFE?=
 =?utf-8?B?UmxDMzR3Zi9UM1A1MGdvNFNFbjh5MkFmQnZ6M1JyTktWTkhWUHEwK2NLYUNp?=
 =?utf-8?B?NXlPN1MrNU1td1lxT05xNGJwWi93STY5alhFZGRxbmFVak1lV3BtVHdDd2NS?=
 =?utf-8?B?alp4SlltZThTanNqOVZXQ1p6Rnh6UzVUaUg1NE1kSUtycFJROEVsSUJWS3Z2?=
 =?utf-8?B?clplb3VzQTN5UmRldEJjUnVrelpIc0Z4V0tsN0ViYXRpSFk2cE1wVVRDanFx?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830199fe-8712-427f-ceec-08ddecaa5b5c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 18:30:57.9989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gq7oHEB5a1bXOTVUzouWnK10mdneXaSpGZsqzCkqFCrpuDmZA+Gf4Wo8ZkNJB9fWJ7MUMSTh4U+fCVePhdu03mzxsCmYaiJw7V1bZN1z4aQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8551

Hi

On 05.09.25 16:07, Julien Grall wrote:
> 
> 
> On 05/09/2025 13:15, Volodymyr Babchuk wrote:
>> Hi,
>>
>> Grygorii Strashko <grygorii_strashko@epam.com> writes:
>>
>>> On 27.08.25 03:16, Volodymyr Babchuk wrote:
>>>> Hi Grygorii,
>>>> Grygorii Strashko <grygorii_strashko@epam.com> writes:
>>>>
>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>
>>>>> Now Arm64 AArch32 guest support is always enabled and built-in while not
>>>>> all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this
>>>>> support might not be needed (Arm64 AArch32 is used quite rarely in embedded
>>>>> systems). More over, when focusing on safety certification, AArch32 related
>>>>> code in Xen leaves a gap in terms of coverage that cannot really be
>>>>> justified in words. This leaves two options: either support it (lots of
>>>>> additional testing, requirements and documents would be needed) or compile
>>>>> it out.
>>>>>
>>>>> Hence, this patch introduces basic support to allow make Arm64
>>>>> AArch32 guest support optional. The following changes are introduced:
>>>>>
>>>>> - Introduce Kconfig option CONFIG_ARM64_AARCH32 to allow enable/disable
>>>>>     Arm64 AArch32 guest support (default y)
>>>>>
>>>>> - Introduce is_aarch32_enabled() helper which accounts Arm64 HW capability
>>>>>     and CONFIG_ARM64_AARCH32 setting
>>>>>
>>>>> - Introduce arm64_set_domain_type() to configure Arm64 domain type in
>>>>>     unified way instead of open coding (d)->arch.type, and account
>>>>>     CONFIG_ARM64_AARCH32 configuration.
>>>>>
>>>>> - toolstack: do not advertise "xen-3.0-armv7l " capability if AArch32 is
>>>>>     disabled.
>>>>>
>>>>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>>>>     AArch32 is disabled.
>>>>>
>>>>> - Set Arm64 domain type to DOMAIN_64BIT by default.
>>>>>     - the Arm Xen boot code is handling this case properly already;
>>>>>     - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
>>>>>       updated to forcibly configure domain type regardless of current domain
>>>>>       type configuration, so toolstack behavior is unchanged.
>>>>>
>>>>> With CONFIG_ARM64_AARCH32=n the Xen will reject AArch32 guests (kernels) if
>>>>> configured by user in the following way:
>>>>> - Xen boot will fail with panic during dom0 or dom0less domains creation
>>>>> - toolstack domain creation will be rejected due to xc_dom_compat_check()
>>>>>     failure.
>>>>>
>>>>> Making Arm64 AArch32 guest support open further possibilities for build
>>>>> optimizations of Arm64 AArch32 guest support code.
>>>>>
>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>> ---
>>>>> changes in v2:
>>>>> - use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 support
>>>>> - rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work with any
>>>>>     initial domain type set (32bit or 64 bit)
>>>>> - fix comments related to macro parameters evaluation issues
>>>>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>>>>     AArch32 is disabled
>>>>>
>>>>>    xen/arch/arm/Kconfig                    |  7 ++++
>>>>>    xen/arch/arm/arm64/domain-build.c       | 46 +++++++++++++++++++++++--
>>>>>    xen/arch/arm/arm64/domctl.c             | 16 +++++----
>>>>>    xen/arch/arm/arm64/vsysreg.c            |  9 +++++
>>>>>    xen/arch/arm/domain.c                   |  9 +++++
>>>>>    xen/arch/arm/domain_build.c             | 21 +++--------
>>>>>    xen/arch/arm/include/asm/arm32/domain.h | 12 +++++++
>>>>>    xen/arch/arm/include/asm/arm64/domain.h | 23 +++++++++++++
>>>>>    xen/arch/arm/setup.c                    |  2 +-
>>>>>    9 files changed, 119 insertions(+), 26 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>>> index a0c816047427..bf6dd73caf73 100644
>>>>> --- a/xen/arch/arm/Kconfig
>>>>> +++ b/xen/arch/arm/Kconfig
>>>>> @@ -266,6 +266,13 @@ config PCI_PASSTHROUGH
>>>>>        help
>>>>>          This option enables PCI device passthrough
>>>>>    +config ARM64_AARCH32
>>>>> +    bool "AArch32 Guests support on on ARM64 (UNSUPPORTED)" if UNSUPPORTED
>>>> But aarch32 guests are supported... I understand that you wanted to
>>>> say
>>>> "Disabling aarch32 support is unsupported". But currently this entry
>>>> reads backwards. I think it should be reworded better. But I have no
>>>> idea - how to do this.
>>>
>>> I think "(UNSUPPORTED)" can be just dropped. Is it ok?
>>
>> As I understand, If you want this feature to be eventually certified, it
>> should not be UNSUPPORTED nor EXPERIMENTAL.
> 
> The certification is somewhat irrelevant to the decision of the state of the feature. 
> Instead, the decision should be based on the criteria based in SUPPORT.MD (see "Status"). 
> If it is experimental/unsupported, then what's missing to make it supported?
> 
> In addition to that, there is the "EXPERT" mode. This was introduced mainly to allow the user
> to tailor the Kconfig but also limit to what we security support. This is to reduce the amount
> of workload on the security team when it comes to decide on whether we need to issue an XSA
> (the more possibility, the more difficult it becomes).

If I understood comments about Kconfig option correctly (which I might not be):
- Not sure if it can be called a "feature" it rather optimization (enabled optionally)
- From my point of view it's basically completed
- The "Arm64 AArch32 guest support" is not mentioned SUPPORT.MD

I'm not sure what support level can be considered for "Arm64 AArch32 guest support"
hence there was no related Kconfig option before.

if treat "Arm64 AArch32 guest support" as : "Supported"
(a) by default ARM64_AARCH32=y, so no changes in Xen default behavior or interfaces
(b) switching to ARM64_AARCH32=n might change status and seems fall under
    "EXPERT and DEBUG Kconfig options are not security supported."

if treat status other than "Supported" - probably no need to depend from EXPERT.

I'm going to change dependency to EXPERT in the next version.

> 
> There has been discussion on providing a small set of config (one could be for certification purpose)
> that would be security supported. But I don't think we come to a conclusion yet.

Thanks a lot for your comments.

-- 
Best regards,
-grygorii



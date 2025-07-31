Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE1CB176C7
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 21:50:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066364.1431579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZHw-0007T7-8X; Thu, 31 Jul 2025 19:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066364.1431579; Thu, 31 Jul 2025 19:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhZHw-0007P8-5T; Thu, 31 Jul 2025 19:50:04 +0000
Received: by outflank-mailman (input) for mailman id 1066364;
 Thu, 31 Jul 2025 19:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhZHv-0007By-5y
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 19:50:03 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 872ba516-6e47-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 21:49:54 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB6776.eurprd03.prod.outlook.com (2603:10a6:20b:29c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 19:49:51 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 19:49:51 +0000
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
X-Inumbo-ID: 872ba516-6e47-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivT/R/ySzG0cegYgFf07emTDWaxi+mJVKMqkkkxmBwdPDhSpcW/359VfTEni3oS25glSyI7MiKez/WYdDY6aRDA1Lt0UaY3s7OFIreU3Grc+gASIuR6pCJfvTL3zcNcwIdjJER2X3ox6Nln8pBopcLYLx+7LW5UUL0+KwFAYU9iXWzRYkAI1QZr89AaBCFzmshBdPuJFdMuu6PNzc+ZDO++aP8VSNwYXd+DK7Z2z/yjRh2Q0Lipq7mEyhhAUsWCbCCgXj3LwVJ0XkQSgr+bXj8SBfQdDZDArBrIAWyHRe2ATsdtGT4lr8VM/pewwyWMCK3wnf7SFl26PSzF/7KXvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+BXB9JHtS3exQvWJhL4OM5/vBuEunZW7VhovC5VFu8=;
 b=lU5kgAbX98ZBwQrf/2lSOgWuHpEnI0sr9EdaXJOcSkJP+xUQZDNecqs/GU1kL4EMPb1yHP04WBzDwOxpkQHgMUmZQpa3XcCk8t9MuEsoxuAZ4UX/BghsQxYHAU7MBlI1zGvujNN2OGFzjSAqwEN2AKSnODHu+TBESfgGxm2TwjJRKbdWt9Lbzeb49UzIYotHQucFIlrH2zvDeKVgcgLSE3w5V8Loo7HqTNvK/8hp8RG7/zYtvaaVDfLkKcqI3MUXHskVDWP3eunEHx3bFbIKvQ6EVrhbPMySUVMS5eHNUEaVKWsRbbbjPzb9L4cRo6rMZDbBdN5tLtq9QDZwRtTWmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+BXB9JHtS3exQvWJhL4OM5/vBuEunZW7VhovC5VFu8=;
 b=C182wZSUQl+bWkkdjOExT1nGTBdz1IIzLppQtC0Ygj06PeeN96A7atSaHDtdqQsFpQoskD/45hR2QlzdmDID/pSE617cklG3Fl0v4+8LzBQyjpc13W88+UTM5GET/Xg7uVvSrcGI+Yht38x4+WTZh9/OHja4Wj9Tybn3eU4RqLwuWKcGBG/3tKvNz372PtmWy7670d0qTA2za35oaHKX9IOZsL5cxQbdqd4/LFtJ4Cgx3BG13kO4vrFtJauGZRCrd9PZd1coJFru5vbKpnUtxjfdS/hyjl98E4moRKufjRBEKx2+EwZV0VORuUMn0L4D5XRz3TlimdUelEc/UOf3RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <54c8bf09-918b-4c57-a00f-92a773ae5099@epam.com>
Date: Thu, 31 Jul 2025 22:49:49 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/7] xen/domctl: introduce XEN_DOMCTL_CDF_is_32bits
To: Julien Grall <julien@xen.org>, Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
 <20250731094234.996684-3-grygorii_strashko@epam.com>
 <3288f8dc-55a2-4c58-b77c-3e24ffe0c657@vates.tech>
 <53c59368-1338-4406-847c-c71ced042293@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <53c59368-1338-4406-847c-c71ced042293@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 78407af4-126b-4cdd-547f-08ddd06b69be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEZKRGovSGU1MnllWjdYVWovNHRySUxyOTdvdngvSHJDQTBIeHRSTlBHNyt0?=
 =?utf-8?B?QXhPelR1dzlWajhvaG5sRmhDOHY4cnRyWFBCSHFFLzJhcHRxRnRsZk9GWXd5?=
 =?utf-8?B?dHpJTEFRUkJSbFgxNmRMQ1JjU24vZ0ErbzBQNnlxRmtZRXltUWJPeTUvMldr?=
 =?utf-8?B?VXFJSUVOOTZVYTB3NlJzZ2RoaXcySkNNbUVaZEk3N3FON2lJUTZOejJqK2Q3?=
 =?utf-8?B?czgrZnhMZGxQaGU3N21Udy9KdjdtME50QWFUSjVOQk9TYk9XQ3gyMGxNbXV2?=
 =?utf-8?B?SHBVNUFocWpGNEVudm10djJuVG05aitMbGlKcVVacWE1NWltRkxaZHRqNDFU?=
 =?utf-8?B?SFdHcHFEc010M0tNdTdKTUtZQU96QjhRVHJ0aW9vWHJCcWJwT0hpd0hxMHJC?=
 =?utf-8?B?Ymd1NEFEM2hDQTh5MWtYcFU3Z2EzOXFocU9DZnZwak8rYy8xTW4yTVl4ckNv?=
 =?utf-8?B?WlJ3QS9xWFplNTFjSEdyaTl5SFF2NWlUL05KOTU2QmdRNnZ3NnNHQ0dlNGYz?=
 =?utf-8?B?ak9OZm9vbGMvQUJUL2ZYWnMxVzdmYnE4bk9SK01BUlgwVXdNeW53MHlDWUVN?=
 =?utf-8?B?TGR2Vm8vd0gweHV6QmtjYkEyQ1lYblNhZ1YweC9kaTFCeGpKUzBDelRZMExV?=
 =?utf-8?B?bG5lcHN6L3VuMHBac3RCU3RBZlpTL1QwaFdFbmNSWE9ocWRoYkh2VjhicWNW?=
 =?utf-8?B?RG1VYlVneklRZFZrdEtZcVZXaVhRNUlhb2hiaGl5azU1MmhuQzB2TkFxd0Qw?=
 =?utf-8?B?RXZCby9WeGpwQXYwZDlsSlNMeXJuRkh1M2lDKzRWbVFJMWh3U2pPZ25WRGFj?=
 =?utf-8?B?SjFZbG9OalJmbjdWTDI0ejBzK041SWcrcC81emxsRmR3N3FvRGtHUlIzR2JR?=
 =?utf-8?B?eG9TZnMybmZGakc5a1NVT0U5cHY2OFRwQ29GZmh1WXY4NHZOdUNxaGNadmtK?=
 =?utf-8?B?YllxRU1sMjNOREt6VWl5Y3lQYnlQNzFrMlJ0cm0xOXludnNOSUtaeXI5d0Zj?=
 =?utf-8?B?cTRnbTQzUnBQdW0rS0hFZTg5WlBCS1AxcU9yUmFpWUFSQkFIdTdZZDU5ZWkw?=
 =?utf-8?B?SVNTdzVNdGVhUzYzRDhwVXlLNTY3L2UyU0ZrQ2wyMFMyRVA1eVdBQjhxWENu?=
 =?utf-8?B?NmRlWEFUcGNtcXE3bmNhVjloV2NXOTRqc0hVcXBySVRJaGRqYnpVUWV1cXZi?=
 =?utf-8?B?YWZYRmYycHlpUVJxKzZtNFc4QkJqb2xSMVRxZWkzUERxMndJdE9JQlVWdUVR?=
 =?utf-8?B?Mm5iOGR6N2p0UGRPWlFmNjJDRmY2cTNRWGlTcXhEWFZWN1RpQ2ZXQytBNW8z?=
 =?utf-8?B?eG11ZklaeGhYRGJRdzBsSUVRc29RdnM5M0xPZlBuL1dqNnFYTE52OGF5M1Z3?=
 =?utf-8?B?TENnM1Z6SW1QUGNCV2NuOFZOTGRoaWxuaFVCdjVxL1p0dVVENXpTQWFIZXdH?=
 =?utf-8?B?OGlBVEllY05PWmpUaHhMWXFMcGlFNnNVMGJGZlZlZ21SOW55NUtWZXIrRFhm?=
 =?utf-8?B?NWgwakVCNjBENWdQSEhzRjE5dlhsTCtETC9JVzNDQjFjRFdnWC84ZllIZnA5?=
 =?utf-8?B?RmFNTjBmMnlGc25Ca1poWlo3ZXRhU2Zlbld1TkJ6L2Nhd3RmVnpQUHpDRXI4?=
 =?utf-8?B?WXBMQ294YzZvdFU0bkxReXUyMjBrZDF1UkttVHNtcDdkMzhaNHZuNWg1U0ZS?=
 =?utf-8?B?b2xMOXpFZXl1aytCZG1nMUw3MXF4aVc2dDZBeG1DRTRnQ09NTzF4aVVBRlAv?=
 =?utf-8?B?SS8zNUJOSjFHVEJtSE5PODFBMlYvL0cycXRId3FuSTlKWWJqZTJoOFVUNnlR?=
 =?utf-8?Q?0LpjgR9oS2qMHk0jy/QKfPaOtz9ZIZbNa4Ldk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXhwbDFYY0IzcU1WVndKRkRvRmVHcGFVSkJGOGlWTjZOLzRhTXRNMWl4aDVy?=
 =?utf-8?B?T0VuaWNWakJTM3lsRTB2cHU1Vmc1eGdQYmJMNlVoSHVZVnppazgwekNmaEc4?=
 =?utf-8?B?UkMxeUFuWTZjOGsvMHBEYUJnbW5DVzZDZm11THN6WUJyY3JVRnhFa2JWYlNu?=
 =?utf-8?B?WmpwZGY5VE9idnVlbFY1NFFobzRLa0dQcWgycWVwMy8yMG8wSVBDR0pDQytZ?=
 =?utf-8?B?aVA5ajFwVDRnOE1oWFNNRGV0SURxRkpuSmlRSzdPYnJSTDBPSG5rZUp0a2Jm?=
 =?utf-8?B?MDJlelRUdkNkVG9yT04xWTlPd29KMG8yTGxoTmRIRDgxb3BtMllpQXJmUVc3?=
 =?utf-8?B?YXJISktSbVVjYStldTlMRzRiaDlpbHM2dGxheXJnQ3BzcGZsYm9OUUwzYW9L?=
 =?utf-8?B?K3ArUHZET0pVQ25ETGVyNVhZejNtMnlLVFJiOFdHUGZXWEp2QjlVa0lObnp6?=
 =?utf-8?B?a0x1cE5mRCtNK0tGM1BQRUJ4cW5GOUFoTVFzL2VnTEZic0M4ZGhxT2JKNlp0?=
 =?utf-8?B?ZXpiQ01ndk00cUhLNFd1eUlCNFNlNUI5aGROQTVPVXo1bzdMUURISVRJOFJT?=
 =?utf-8?B?cStKaFZYZ1RkcUxxUXBJZmdtOWs3OWhLSXR6dTRvU0x6dXhBM3pYZ2FGQXpC?=
 =?utf-8?B?NGc4K0JXY3BxalNmeUNZd1VOT3ZicnBKMzJOWlFaMnpvT0NLNDVtYzJ4Nmwy?=
 =?utf-8?B?aTliSkJFTzl5ZkIrNGNSZjkrd1lNK2p6WTNhZ0Ewanl4aGprUXpxc09UL3o0?=
 =?utf-8?B?SkpGN21MWjZEeDlaWHc4TnZ0NmNFTUpMSHNMTUhjSFgzWHlRamo5U004US9V?=
 =?utf-8?B?a3Z2ZGROaEhadElsUkp6T3NxZ3NVV0VUdkgrMmlibVNYcWI4ZU0yV3lwYTBk?=
 =?utf-8?B?QXFXQlBBM3htYi8yV2diZmVXTStjTjExYVQ5NHdSeWNjb2hSc2pyWU42WHRO?=
 =?utf-8?B?Y2ZFUTZFN0FIMllKNEJZbi84bDZjODNYUjc0N3Jsd1BMZE9oV3NFNjJTN2Jl?=
 =?utf-8?B?dElKbTJCS0xkMUt5SXZ5K0tzbjBLK0FlSzVYandtdUd5bUFjOUttUXJvZjFC?=
 =?utf-8?B?L3pFeURDRFhiN1ZoQmh5ZGE2Y09vRzVsODJKVjd1R1laZy9nd0tyeXVHdmZI?=
 =?utf-8?B?RWx3K1l2dzd4bjliYjdsQXpjZTZXUXdyVU1FYmc2Z2hFMXVnSlhGNUVyTkxS?=
 =?utf-8?B?UUpBZWY1alNMbUpoR21JcTlvOVZvTmFELzhVWTBySkRiVEtoWnBCdlhvM1NE?=
 =?utf-8?B?Qlh3cDY4TC9uWVE5MmUrTm16V0VERVlBQVJsVTE3cjcvMjM0aHhTNG0wdXNk?=
 =?utf-8?B?enhSTnBQWUtkOVRXRTJPcDRJSUowaEtGQUNoUnJYaFo1aUdqLzFyMGYzdDQ2?=
 =?utf-8?B?bTRXSEE4Y3B0ZUpieStNa1BIU1JDMzhQU3NOWnl4Wjd2eEhKVWxwNjRnRVhN?=
 =?utf-8?B?WTNiejhuc09IcTZ1Z0NzUm1BV0JUbWxDNDhPTndEaWZTbkNINDNaN2RzVEpj?=
 =?utf-8?B?OEpuNnNBWEFEb2lXRC9xa0dNQWFIMzdFOXRyZ2FhY3BuSDFidXZEZWsrMlNF?=
 =?utf-8?B?R0o0OFlOT1NIVW5sWmUybzEyNzJSZVpwbXVqVCtYQUtKWERXM3g5RTRiUlRj?=
 =?utf-8?B?RC94eUttQjNEL2lUdVYxVW5NVTM0U0hSZXduV3drQUhEcEtING1Xb1BKaEsx?=
 =?utf-8?B?YUdzc1NYRXkxR2FzSVo4UHJZMEcvRTk3cVJ4RkxCWE4zMXZwTjd1Uy96TXNR?=
 =?utf-8?B?UnhsY1RHU3NaVFFxMmZBdlM4THljS2VBRUhvOEcyK2hkaXR6N0tKZTNqUmZQ?=
 =?utf-8?B?NVN1dzBiaEE1K29xaXV6em90TWYwYjR2SU55cm1sVUdGQWt3SVRLVXg2MGJD?=
 =?utf-8?B?djhqeWMwSmR2RDZuK3k2WmhWbUZvand4L1ZIWTNzcjFYQzdwaFNhUzlkalNI?=
 =?utf-8?B?ZHl5T3ZEZVJVeUF3bzlHaW5hM1VMWk1VQnJvYTB5djFYcm5FdWVibzNMN28y?=
 =?utf-8?B?WCtxRFZ6eFczcWQ4QkcyblhVSE9VWGVIYk16eGFtUXh4cTl6M29vOTZmSnp0?=
 =?utf-8?B?QUEzRXY0dittdjhNM09weFRBTkdjQ0NXN3RyNVRhYnVYRkxoVjBNRnhERUo5?=
 =?utf-8?B?SFZ3elVta0lvV0lKNTJZRU9WVzJxcjNGWFRsT1VHeG5ZZWhETkd6OS8rN3la?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78407af4-126b-4cdd-547f-08ddd06b69be
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 19:49:51.1886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbfV0kndg7SDBlQ9AzE4oMgO4qXhuv7dTmkrcUPB5SN53Ra/ZdqbY5IdkxEPBs4yncIOhBk18CpZDVNnDLFEhhNgvJuqdVJ6jflTagEZI/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6776



On 31.07.25 18:19, Julien Grall wrote:
> Hi Teddy,
> 
> On 31/07/2025 15:02, Teddy Astie wrote:
>> Hello,
>>
>> Le 31/07/2025 à 11:44, Grygorii Strashko a écrit :
>>> Hence, this patch introduces extra "XEN_DOMCTL_CDF_is_32bits" flag which is
>>> intended to be used by 64bit Arches for proper configuration of domain type
>>> when domain is created.
>>>
>>> Now it adds initial support for this flag for Arm64 arch only. The default
>>> Arm64 domain type is changed to 64bit:
>>> - the Arm Xen boot code is handling this case properly already;
>>> - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
>>> updated to forcibly configure domain type regardless of current domain type
>>> configuration. Hence toolstack configures vcpus and memory after
>>> configuring domain type it allows to start with domain default AArch64 type
>>> and then switch to requested domain type and ensures all required domain
>>> settings applied.
>>>
>>> For Arm32 this flag is ignored.
>>>
>>> Note. For Arm64, Once toolstack is updated to probe guest binary before
>>> creating domain the XEN_DOMCTL_set_address_size will become obsolete.
>>>
>>> [1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01647.html
>>> [2] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01648.html
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>
>> I would prefer it be better presented as a platform-specific enum.
>> Something like
>>
>> ```
>> enum xen_arch_subarch {
> 
> We need to be cautious when using enum in the public interface because, if I am not mistaken, the size of the enum if not stable.
> 
>>     XEN_ARM_SUBARCH_NATIVE = 0,
> 
> "native" is a bit ambiguous when a platform is able to support 32-bit and 64-bit. Does this refer to the bitness of the hypervisor (EL2)? Firmware (EL3)?
> 
> That said, I am not entirely sure I see the value of native because EL1 (the kernel exception level) has to be known at boot. So it is better to explicitly mention whether the kernel is 32-bit or 64-bit.
> 
>>     XEN_ARM_SUBARCH_ARMV7 = 1,
> 
> This name would not be correct. You can have a 32-bit Armv8 guest. A better name is SUBARCH_AARCH32.
> 
>>     XEN_ARM_SUBARCH_AARCH64 = 2,

I've been thinking how about using ELF "e_machine" to identify guest?

It defines all arch ids already (no need to invent anything custom),
plus supports EM_NONE which can be treated as default value or indicate that
guest type is not set - arch specific handling.


config/domain structs:
    uint16_t e_machine;

Arch code can define and check number of supported ids, for example:
  arm: EM_NONE, EM_ARM (32bit), EM_AARCH64 (64bit)
  x86: EM_NONE [, EM_386 (32bit), EM_X86_64 (64bit) ]



-- 
Best regards,
-grygorii


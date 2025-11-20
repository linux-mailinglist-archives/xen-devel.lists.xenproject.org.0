Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F03C7357B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166703.1493177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RM-000317-Et; Thu, 20 Nov 2025 09:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166703.1493177; Thu, 20 Nov 2025 09:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RM-0002yZ-BY; Thu, 20 Nov 2025 09:59:00 +0000
Received: by outflank-mailman (input) for mailman id 1166703;
 Thu, 20 Nov 2025 09:58:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM1RK-0002vx-H6
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:58:58 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84a27077-c5f7-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 10:58:53 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by BY5PR03MB5125.namprd03.prod.outlook.com (2603:10b6:a03:1ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:58:49 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:58:49 +0000
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
X-Inumbo-ID: 84a27077-c5f7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRr+B4yTgNvcy0gCJUFMcqQ9qmTL/iHxAx6Od2OS4gMFoJ6gjFPGtC1z7kBKNbRrqLRYd/uBMOYjHlHAM2vh1D9Tj9rOefp/Shc8uGJ4uur7cMdtjH4LPYbhm7DIwoFUhvochst2FKSbahm5XMQ+qd2hVOtOk6isvNNgsN6j/x/LfQQfU9CxL5UV4TMwaB/o6CUrl6neCkvuxAtr9Br5wZZ7w5+08HBJLpnd/bKEpfykvurcG6GlnjVgnjHbKTNrQMAutleotRhOIEgI5i39VZMei8JHEymcotixvPfLrUAkydyo3Z3FO9SPf6kpaeYjr62CpPECvdxQcOzfmxQIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNaJa5GtJOvNp5LIJxWkZEHm+c3C8n4cxyZ0oxNQnlc=;
 b=eGfrSFjYNQbU9JZAwPXynmnNbvD/Upon7UiqYEzU8gWb0COtB883iDORBZftKGEo4IGuWur3HG0n4D60ushvtZVp72jFWZmD1bFFvwYvzaQPHMXhPWVL5GoDAsvzMGv9ts+uPg6oy0taCmpV2+YM3qd1pNYgail6CTmnoVyA5r0Iz5Ah6IYPItd5MU6Zu6r3CD6Oc1yItIlW055rpsSxmNx4gWjHyNU0rsx1RT6jEmeQSpAKfrLiVxzfr4JEsdY3ENa0dGSQrDffcoH0LjWHBL8KZhmT/7uP0dPwXyROFI2cejHfzjulD6v9mz4+BlA6Bjc8eOnJStUoXRi0NPR4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNaJa5GtJOvNp5LIJxWkZEHm+c3C8n4cxyZ0oxNQnlc=;
 b=VTNplej0dCbWGCxqeU6Anwpg9k/Hi+Qcpy75RDlWlZ+Jo5Gt/MtFQs+LaOQWt9vbQlSLzL3oinNMBNDR1Ia8BQCkpdOVShas75xSdCyPdHY9thGVthJxj70jI0NTfuvISDlQ064of5rKybqwL45DQmdjT5YZLqNK6/CgssVvYIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 08/12] x86/irq: adjust bind_irq_vector() to take a single CPU as parameter
Date: Thu, 20 Nov 2025 10:58:22 +0100
Message-ID: <20251120095826.25782-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120095826.25782-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::7) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|BY5PR03MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 82673d05-f1ca-4f00-0986-08de281b66df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk5ZUVl3UFNDdjNrSE5ETGFZbEhDNnZ6SGMyeDJOMjZUWGxzUWVsNWR2MEFE?=
 =?utf-8?B?MXZVSi83SThWdk1RQVNjVlgwMVRsK3ZDeHNvUlpqL3V2cUQ2NTh6Y3FpRDJB?=
 =?utf-8?B?R2RqNGIzWEpNQThzY1AxTy9HUGFMOXg4MFF0Vi9wWE0yRjdzWlU1OTFuaGt5?=
 =?utf-8?B?ckpmcnN6UDQzZlM5cWVIbURGQ2EzaUZmeWdkc2tlckczZXVJMndFQzN4SkVa?=
 =?utf-8?B?RWNNUTdLdm5IZFZldEYrdWVGRVdMQllRM1NDTUxlT3VQbUZrODFlN1hpc0d6?=
 =?utf-8?B?L2RUcVpmUWtoVEwxVXR2dmZvbUJuK0FQbVRYVUNPRytLcjF2aWVxQ2U2cEZM?=
 =?utf-8?B?dUpKaW0zYnJOVzRYUVBadmNkalZVYkR0WWFQU3lzc1QyQ2ZmZlJLZ3dzZWF1?=
 =?utf-8?B?NHlZRk9WUXJFeUgxWG1zZGprUHFlVFp1K2lFcnhVTWpsOHB2ak1kVlEwenQy?=
 =?utf-8?B?N3BqYVI3SmlyYUgrL0I4T0NuR25qaDNFS2VwamtseU9CT3E3bTYrQWtnTi9R?=
 =?utf-8?B?dnFUbER5eHlTWU5JZXRoVDNFRnZnRGN4eUFjb1RhamVmOW9Ub2RBTEhPbGF0?=
 =?utf-8?B?b2ZhbGhPZFN4OTYrd0RoYlhzOWJndWxSWWRMRU51cFJuSDArdjlkN0g5dkVS?=
 =?utf-8?B?SCthWkRXSGoxNy9FK3VrY2V4bTBNb3NoajVoanpsUHNnUVpsWGNNQnV4Qk4v?=
 =?utf-8?B?NGF6dnlocWZyWHQ3a2ZraXV2c1pnUXFyd2pOVjZNcTdNaExFTDlURTFVeEps?=
 =?utf-8?B?R3ZxUHJ6YThsZzdPQzFNVUI5eCtVWnNHN3JaR0tDOTl1REE1Z2szVjJtdVUr?=
 =?utf-8?B?d3ZpRHZDSytIcndlT3pacGRibk55QzdoRWtkUDVaN0Z6MzluYXk1Z3RSaFVn?=
 =?utf-8?B?TDQ1bnhkOFpaUzM5bEw5TlhHS0JHMU8yK0plN3RlR05sNlNuaDFUZzdmbWZO?=
 =?utf-8?B?TlhzMXR1V0hKM1Z3dUtMcG9FS0gvLzRxSk1rWkJ5aWNEL3JJeWcyVkZhdHU1?=
 =?utf-8?B?bk82dmNFV1psdDM0Ynl2M3JuZk9vM1ZLTUNzYVlibzFKYmRUK1l5WllhRjRD?=
 =?utf-8?B?UXdSTXJoMmkvMFB3dktXaVRBb1ZGdTlod01CbUJJRzlGV3Vxd0J4Wk5iQnRQ?=
 =?utf-8?B?Z3p2QXJ0aE9ibUJVMXUweVRiYmhGUnMzZG0zVm5wMXlKQk1LaXNGSWk5Q3VR?=
 =?utf-8?B?WW9jOTBIVGRrR0RGQ1RHRDRta1p2VFZMU0VXOVhEaHdPQWVZQTZXMnJrSUZm?=
 =?utf-8?B?alZLZkVZaDQwRmJRVDdwUWY2bXBZLzhhODl0TkJjcCtqMTFGdVdRdnI0WHJ2?=
 =?utf-8?B?S1lRanNMb3hNeEhjMzMvOXVpTDN5bE0zeHJackI0MGE2Q05yc3UzRTFoeEdM?=
 =?utf-8?B?a1NucDlvZmlzN3ZCb1lPWHc5c1YxdnZmdTZjSmZvU0xJUlRDT3FSdmhuMzlK?=
 =?utf-8?B?bU5GKzJmYU42c3BqQm9obUxYcVBNdGZLVFV6aHRCUUNNc25ldVNMUnlCN2ZY?=
 =?utf-8?B?d3ZqdVh0YlE3bXV3M0l2SGc5WFBYT1dBZS9PRnNOaThoZytBcTJJa3F6SUtn?=
 =?utf-8?B?bWZHSHpZcXQ0T2UrV25UNVU2cERoNjlnNUtLcE5uNDRXSVNyRTdUTlFkeGto?=
 =?utf-8?B?aVArZzB4ZkhYZzREUmI2SlFDY2JZNFNBQlBmRS93d1pSZ29idEFxK1NacGlt?=
 =?utf-8?B?b0NKSU0vNStMRlVMV0lkTDRUREhIOFFFWTg3endBblM4NFo4cEhoQVRvRlRS?=
 =?utf-8?B?b2ZzazA4MGtZanJkMk5Gbk1lSDYwMWhkL1NIank5OGJLSklFeFJwTUFYSWl4?=
 =?utf-8?B?QXdkREpkbGw2OEhhaDVuNHIyRFRnQU5SRUN4UHRwZ3plSURLcFZteEhQdVNv?=
 =?utf-8?B?blRlbnYvTlN4VjBVanNDT2gwR1ZMeWVyUXBCTjNxbzZqdzVTZVMwSEVmT1VT?=
 =?utf-8?Q?uFokc/9KITKZaixSJvCJcw6xxD5tVp5A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnpnWFE3cFlyTGJtOGdUY095SzVCZUppZVIwSkxUenNPbGZFR043NVlNbE1P?=
 =?utf-8?B?ZEZzK0lVd0pabS9UeVJZM2pSaTkzZmF6Qis0alo1Vk8rcU5aaitJVU9Hbmw3?=
 =?utf-8?B?T0N6KzVGNmFaZk8ybjh2UzhCM2hySS80SFdZK0pQSXR6bUM3RGZTenVBNDFN?=
 =?utf-8?B?ZTJVemxRK2dQOGQ3THpiTDE3WDRrV1lIV2RPbkdKZkNoN0xURWlRZStCQi81?=
 =?utf-8?B?aUgxR2F6VkhGcFBocHlCRXFoc1M3all4VEc0M3pBa2NFNzFDZjg2WlZFRHRN?=
 =?utf-8?B?cmtHUHRtQXNEbEVUZDJWQjg2ZzBYTVlDUlMwNktVNGZPbktIV0g3OFF4WWs0?=
 =?utf-8?B?emRoUElzTFllMVBBeFdCa1Z0QkFuMkVHSkVLMHdLeUR1N25ML3JyUEZGTysy?=
 =?utf-8?B?ZkZQVXY5bm4vWS9HOW1NTHdzTGk4bU92S2FOU2RtVzVoak5SY05ORDA1RThh?=
 =?utf-8?B?dkFLd25MaWJGbzMxVVlpK1c3K0hxcjU0cDg1Zk5nR0NETGJ3eUFua1pReUlM?=
 =?utf-8?B?T2gzOHhpUW9rU1VjeEVBR0xPVE5uSiswYkV3TDZPWG9OdElkU2MvdmdwVWlU?=
 =?utf-8?B?SFVQUU9rcTBLQkdoY0s1bjZoOWJoWXE0N3UyM2svSzlHcDZuRnA4U2VJK08z?=
 =?utf-8?B?VHRDdFBXZWtTdjV1V3E3RWdSaC9zTVNaYkxJbzljb0p1Tnl1NWR6ZUFHWUpq?=
 =?utf-8?B?VCtmYzVwWTJhKzgvb1lzMTVaOVZ4bXFTNnpScnNLandNa2QvQ2ZjS2VCZVZR?=
 =?utf-8?B?MEVlY2M4TWc3VnNJTlBSSC8xYTJ1UGdPdjlsYVhRYkRGQXB4b1Z2TVdMSEd4?=
 =?utf-8?B?WVFZc1JwSGcvUWgwNHZEblg2VmFQVHQ5clVFY3dQS2ZYbUxXQ0djdCsxeDJJ?=
 =?utf-8?B?OFpvVnZxdjd2bHljRTZheWZOdzFQSkNTU2E2UFZTTERTMkU1TllwOVQwZ2g0?=
 =?utf-8?B?WTdSK2NENy8zdUlNRkNTalBPWXk0OWJPUEttRk9sWktZY1U5bis4UEx4bDlG?=
 =?utf-8?B?aFVmRW9vY3F0V1pWS1ExY0J4R0lmMUZid1BFQitXN240eDFlN29UdkZpTFQ4?=
 =?utf-8?B?T0VjNnU2RFFMQ0gwNWpmeDJKaHRJK2Uydk5PaDhYcSttemt6V2x1QlRuTWpa?=
 =?utf-8?B?eUQyeEJkR1ZaN004cmRpTFNralJaSzg2dnI2TjEvV29iZHdmd2JZdzNMd3Iv?=
 =?utf-8?B?QldPQnk5cDNkRjB3NDlub0liOFU0SFNQK01nUkdJV20zeXRaT01SVUJsOXYr?=
 =?utf-8?B?aFlKNGJNVmRRdFc1T2I0ZlJtY3FpcE1iZkxtV3BoeXQxTlRHdjQ4ek9kc2J5?=
 =?utf-8?B?YzZSd2thOXB2RHdWZzBJeCtWYWI1Z2RQdUMrVHBvTDF6K0FUYmxOWWY1YS83?=
 =?utf-8?B?cTcwclRXYVI3OXQ1RzR2bGtQQkpqU25CT3dHSHVaeHZHOXlVMWNqdTdOTWFF?=
 =?utf-8?B?bWtvRWpuK1ErdXRqOXdmbFVpOEsrVnRQNGNmbDlzblNDS0FLK1N5MDBhKzNy?=
 =?utf-8?B?UmFCZWFuUmcxWUVIOFg3ell1bXRJSFlvUVp4NDA0V0FDcnJMVDJHNFdnZXFa?=
 =?utf-8?B?NE0zWWVEbDNxbkdndlFpeEplQ0NQbjdXT2xyQ0ZlZlNxMDBoOFRtUmdUOXhs?=
 =?utf-8?B?QjNobjQ1RjZhb21ueFVxV2thWmx5UTJGamF5RCs2VlBJU2JxVS9COFg5WEh0?=
 =?utf-8?B?NzVvWm1JanpUaDZSRkVZbzdFRVVlVEl3bXcwQzIrZFV0SUZFMW9VUkxkNGhH?=
 =?utf-8?B?UmpPQlVjcnBlKytLeG1UbFpYMTdFcm15L21BWlVlbGhpR2hzdFRlWnJybExL?=
 =?utf-8?B?R0k2ZWd3MVdDcEJ3bS82R0JoM1E2aUE5djJrL0JDNUZueCtxcUdqSm8rQUtq?=
 =?utf-8?B?by9SVjREalFsYWJRbXlaWit6bjIxcy84OU4xQjVNbWFMUVhCZDFVOWgwaE1h?=
 =?utf-8?B?bGk5eHozYTNrak5uQTBIRnY5KzFPRWZEMlJPcEJIeThqeklxcFUram5haFFL?=
 =?utf-8?B?RVlqVndDK29DTkdUaFZPU3pXQlhDdnp5eDVBRllKY1AxR3Q3SThhOHk1S3ZT?=
 =?utf-8?B?NTVpcjlNOUlzSEI4NzgySlI4VFFFNWdnSU5DWGg0RXNuQUsvMGJIdGtWb3hI?=
 =?utf-8?Q?tOZqX0qryNBtSZtEbmsROtrRh?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82673d05-f1ca-4f00-0986-08de281b66df
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:58:48.9801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmZ45QmXhVw6ISnre0K1BBc6EOteiV54YSY9esemtS0VaSACDJ0pPBHOEk2M3LJZdZqqRaPhHlqO88jHI5QrPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5125

The vector will be targeting a single CPU at a time, so passing a mask is
not needed.  Simplify the interface and adjust callers to make use of it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hpet.c            |  2 +-
 xen/arch/x86/include/asm/irq.h |  2 +-
 xen/arch/x86/io_apic.c         |  2 +-
 xen/arch/x86/irq.c             | 23 ++++++++++-------------
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index a69abe2650a8..abf4eaf86db1 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -352,7 +352,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
      * Technically we don't want to bind the IRQ to any CPU yet, but we need to
      * specify at least one online one here.  Use the BSP.
      */
-    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, cpumask_of(0));
+    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, 0);
     if ( ret )
         return ret;
     cpumask_setall(desc->affinity);
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index df7b48c8653e..355332188932 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -199,7 +199,7 @@ void setup_vector_irq(unsigned int cpu);
 void move_native_irq(struct irq_desc *desc);
 void move_masked_irq(struct irq_desc *desc);
 
-int bind_irq_vector(int irq, int vector, const cpumask_t *mask);
+int bind_irq_vector(int irq, int vector, unsigned int cpu);
 
 void cf_check end_nonmaskable_irq(struct irq_desc *desc, uint8_t vector);
 void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask);
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 19960d291c47..dfbe27b12d54 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1859,7 +1859,7 @@ static void __init check_timer(void)
     vector = IRQ0_VECTOR;
     clear_irq_vector(0);
 
-    if ((ret = bind_irq_vector(0, vector, &cpumask_all)))
+    if ((ret = bind_irq_vector(0, vector, smp_processor_id())))
         printk(KERN_ERR"..IRQ0 is not set correctly with ioapic!!!, err:%d\n", ret);
     
     irq_desc[0].status &= ~IRQ_DISABLED;
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 5cd934ea2a32..e09559fce856 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -150,26 +150,23 @@ static void trace_irq_mask(uint32_t event, int irq, int vector,
 }
 
 static int __init _bind_irq_vector(struct irq_desc *desc, int vector,
-                                   const cpumask_t *cpu_mask)
+                                   unsigned int cpu)
 {
-    cpumask_t online_mask;
-    int cpu;
-
     BUG_ON((unsigned)vector >= X86_IDT_VECTORS);
 
-    cpumask_and(&online_mask, cpu_mask, &cpu_online_map);
-    if (cpumask_empty(&online_mask))
+    if ( !cpu_online(cpu) )
         return -EINVAL;
     if ( (desc->arch.vector == vector) &&
-         cpumask_equal(desc->arch.cpu_mask, &online_mask) )
+         cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
         return 0;
     if ( desc->arch.vector != IRQ_VECTOR_UNASSIGNED )
         return -EBUSY;
-    trace_irq_mask(TRC_HW_IRQ_BIND_VECTOR, desc->irq, vector, &online_mask);
-    for_each_cpu(cpu, &online_mask)
-        per_cpu(vector_irq, cpu)[vector] = desc->irq;
+
+    trace_irq_mask(TRC_HW_IRQ_BIND_VECTOR, desc->irq, vector, cpumask_of(cpu));
+    per_cpu(vector_irq, cpu)[vector] = desc->irq;
     desc->arch.vector = vector;
-    cpumask_copy(desc->arch.cpu_mask, &online_mask);
+    cpumask_clear(desc->arch.cpu_mask);
+    cpumask_set_cpu(cpu, desc->arch.cpu_mask);
     if ( desc->arch.used_vectors )
     {
         ASSERT(!test_bit(vector, desc->arch.used_vectors));
@@ -179,7 +176,7 @@ static int __init _bind_irq_vector(struct irq_desc *desc, int vector,
     return 0;
 }
 
-int __init bind_irq_vector(int irq, int vector, const cpumask_t *mask)
+int __init bind_irq_vector(int irq, int vector, unsigned int cpu)
 {
     struct irq_desc *desc = irq_to_desc(irq);
     unsigned long flags;
@@ -189,7 +186,7 @@ int __init bind_irq_vector(int irq, int vector, const cpumask_t *mask)
 
     spin_lock_irqsave(&desc->lock, flags);
     spin_lock(&vector_lock);
-    ret = _bind_irq_vector(desc, vector, mask);
+    ret = _bind_irq_vector(desc, vector, cpu);
     spin_unlock(&vector_lock);
     spin_unlock_irqrestore(&desc->lock, flags);
 
-- 
2.51.0



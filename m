Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720309FB8FF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 04:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862976.1274483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPvo4-0001oO-NM; Tue, 24 Dec 2024 03:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862976.1274483; Tue, 24 Dec 2024 03:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPvo4-0001mk-Gn; Tue, 24 Dec 2024 03:42:04 +0000
Received: by outflank-mailman (input) for mailman id 862976;
 Tue, 24 Dec 2024 03:42:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VW/X=TR=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tPvo3-0001me-B9
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 03:42:03 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20610.outbound.protection.outlook.com
 [2a01:111:f403:260d::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05e46d45-c1a9-11ef-99a3-01e77a169b0f;
 Tue, 24 Dec 2024 04:41:58 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS2PR03MB9877.eurprd03.prod.outlook.com (2603:10a6:20b:546::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 03:41:50 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8251.008; Tue, 24 Dec 2024
 03:41:50 +0000
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
X-Inumbo-ID: 05e46d45-c1a9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxOX8w1FmHS1g/xM0nxnGZ8catj3+6Zmj/zUm+IPCYFNyesvr2ZZc9xdOBoEuZKuJMMZAaM9EdCULwCky8vMYyfl12MxCXC064qlppgpBRcetJ3o6Ozt/aTPv0QrFEfsSCDG04enAeUvOhws72BAkVzlzqGAV8n3AGfCvxkFHpnAloPCucb8G85Kgpvbtn7mXPUbdsAgDDzdo7wJpumfM7cvHlqMNjPov5CbqL1V3s8uPAbWwoDbNnh/jn08fz7QnHD7Z/hmwuA+0IA4PvU4e/crW8bxhQyAMJ+cjRilG6hIW6m54WTCkyGOUb5gv1V0f64vTAQkT7BT3Frtx4Tonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O93J0ZE6UWqtpepxBvByThnj1/RZPaYNApUG1BgiA6s=;
 b=X3eF+4+JFtphdgdKApOUiMpd9YjJd2LBv63vVHNoBa/ZRHrDaL5ltoO/38/E6jVszp1hfA4VtlMNTlcBo86ri6Y62P3OI/3qjKE+N57/irPs8ZBYJx4Gn7Advrocp7qhlJ8H4GXh8r8MD+5L/T6lpdycbv0oB8raBuQMjXwhK2gQiZI2oDbgBUYqLvVGTHsoKx+XDCmSKuyG3xUHCvWGM6E2Od2HF1wOfDsU/zx+oe9kWttIMaTPzIrwB9mXhBH0/7RqGtmd2NJED+9XeE1NSOaE3eILI5UKIsaK05aUtxBYMjbip3pKIsX9+F/pqruGe0lQQcXEVDhUQ8WId78hcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O93J0ZE6UWqtpepxBvByThnj1/RZPaYNApUG1BgiA6s=;
 b=jEsCQvRTtIYQpSjgoZnnew/FFdUIvB8+XdMjBy3mLRfw2OZgpUqd8GkDld/IzzvCRPC7vVygadJ7xisblspGV/FKv6qgkhety/E4prBsF0Nf6HcXctJgRKo83XPXOvZoCldNqKEnb9Trio2gYC3e7MXjZvGvG/OPh/GE/TDf1aygQCqGDZFOG7xLYWwqrZdtWUg39D7G387VrgbfSMXWOTcMyU+k7C8XnscwycIJMzmv7wh40cPGyzp0mndU1zhf9QGdmHxxfIECGXl0R6x0DP5CYORoe77ywx9/A4f+pX3WfB8nNW5NpyfTQQvQaSNw09z5PLNfHiW/BSkWD1APwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <16694707-ce8b-4c4e-a6ec-2190b8124735@epam.com>
Date: Tue, 24 Dec 2024 05:41:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
 <5246aa98-d23c-41d5-ba14-c12b0a2ee9af@epam.com>
 <baac9d61-f4bf-4de9-a58c-b354111e3c0c@xen.org>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <baac9d61-f4bf-4de9-a58c-b354111e3c0c@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::17) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS2PR03MB9877:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfb939f-6125-4838-7c4c-08dd23cce677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUhPbmpxT0pDR1l2M3EzRG5xL0xiNEJzYjdBWjNVUVRhMUh3Tm16YzYxQW1L?=
 =?utf-8?B?ME5ZNjFUaEJxaGcvQytIUmJ5ZDRSMmhTSm8vRDVmbFBlK3hYaDZRUkl6SnhE?=
 =?utf-8?B?ekV2TUJ1NTVFWGNKNUMzU0J3R2J4VUJWbklZWnZZN2NFVEVCVXltdnovQW5w?=
 =?utf-8?B?VjBlUDhocFYvUWVTREFUNEM5VGxJV0h3VWFiSFFhU3VDSzV2NW1oL3lJMmdK?=
 =?utf-8?B?SmtyMVVFdHVjalFCblFHNnpMajRkSk5nUnYva2hOSGFrQjN6WGFaK3lwS0xh?=
 =?utf-8?B?ek8zQlZXcjh4bERiNm55ajFVK2dDbG1rWjRvSHBOWk11VDh5cXZPb0h6emdv?=
 =?utf-8?B?c1cwcHRMLzhabmtkQ2RlbUUrRC92bFA0UDlSMVQzU2ppSksyVWhWQThSUW9k?=
 =?utf-8?B?SjJWaUVYNk1qS0VueVNhbHc2N1lucEcyRVVYbjd5QTB2MEFQL0dkZVZISE1Y?=
 =?utf-8?B?MndOMGt1eVZja1F6WDBFR3NLOVdJUDA5eDZ4aG5SSi9iVTlQcXFuTWVKcWx4?=
 =?utf-8?B?TDNRc0dRWHgyTWtIUUVpZ1p4YkNaclRiS1BLcUs5TTByTnIzMVh1T3A4U1c4?=
 =?utf-8?B?cHBMbTIxT0kwam8ybnMxOC9uT3VFMXlnOTEzUjdZd2g2dXljSEUxa1BFdWt0?=
 =?utf-8?B?TklGZjRBeUVkS3hJRDF4NzQwcWlycWJVcHAwSmIrZFh4THlWVi9kVTI0Skt6?=
 =?utf-8?B?S2QwZDFwVktxNUhKVndzZncwRjNaWXl1UENxTTgrNWVjOXhHNE9Odkh0cTZ0?=
 =?utf-8?B?bUpVdCtNVHlPcndrMUx5b3ppYXRYNEV0VjNteWl4Rm9jZ3A5RHViVEVRNkxU?=
 =?utf-8?B?QnA0eWI5VFVqc25JQU5QWlovK1ZCVXRDenY4VnBoeEYvK0FoUUFkMWoyK3RU?=
 =?utf-8?B?T3d0cnE3ejgvRXdnTVN6Y2NCdmc4aGJVcEdhVDFnVmYwNHQvMDhSUG0reHpI?=
 =?utf-8?B?TDJENCtpK1JjUU5hbWRaQmhxa1hTZVVDdjhBdUZpNXV2L0xDQUdYWUNmaE1V?=
 =?utf-8?B?djYzR0hnNDJiVEZock56b0VSemlHUjVDS1d6Vm5Fd0ZmSkJrWHprVWtQdllk?=
 =?utf-8?B?REMxMHBoZHRJMmJTVFJLMFJZQmc5eklUMjJIT09mVzZzU2w4Q09QNmw0YzJZ?=
 =?utf-8?B?QWx2dlZ2elJieDFZMm9keTdJamMwbElDRE5yclJJOG8xMkJHK2psNkdHdUlh?=
 =?utf-8?B?Y2wwakk5UlZOd05zeUlVam52K0Y5OWppc09lb2xHTUlLYzFCUUR1NUtGdkZJ?=
 =?utf-8?B?clVvWlhZWSsrVEphMy9sdVlXUW1aNmZSTVhLZ2lmS0E0RlliZ1RqM2ZUMjhm?=
 =?utf-8?B?b0doL1Vic0FHbDU1VkxiNkk1a2p3T1JhVFhkOWUzeTJJalkwN0V4c2tmd3Rm?=
 =?utf-8?B?V1FreWlSMHpaUUdTeTR2YlJ6RVIzRUlsekhoYXJOMjh4ajgrYzltOVVSU2dj?=
 =?utf-8?B?RjZ3Rkk1Q3ZSa0pWTEhOSkl5aE9LREhidHpzNmFsenJhK0RZNEVkU0F6cHgv?=
 =?utf-8?B?UWdsVnBsOXBPRkNKNm9iSUljamRHeTZJaUlMNE5uNDcxam1wRFFVY0FYcHZo?=
 =?utf-8?B?T1pRRDA4Qm9KS1VrM1h5UFVSMnVWdmJ4ZEhHREMyRXNrYXNTYjBCUUpYaTJo?=
 =?utf-8?B?RlNPQmJHKzhHckJtMlM4Wnk3NVBnUVd5Zmc1dUlGMnYzMWE0NjA5bEtLUkw4?=
 =?utf-8?B?UERLM2F6aGRMRGxjNDNXT0t6NEF5SHBLdkNZUzE3RS93UHcyM1hvWUVqSFlo?=
 =?utf-8?B?SEZKSWNyVllodEFQUWlLN2pmbEtSZk9DcVQvSWZrOTlNQ3h5amN0MVBoaHps?=
 =?utf-8?B?bVVSRWxGeEtsenF6Vy9BN284U2ZDay9mZkcxMkhMVWdlcFI0eHNIbWczK3Bs?=
 =?utf-8?Q?EnaIzWPka7NEz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU1oN0wzV2ZGN0FJemo2SE5iSkp6Tzh0WlF5TzU1UnpjY0Y5OFVHTTR0bjZm?=
 =?utf-8?B?dTliQm4xN2lOYjJuSVl2UFE2THdRV1F3T3ZsK294ckMybDZNbzd6bUE3RTRi?=
 =?utf-8?B?Mm1ham1ZR1FIZFU0WnpVRTFEckM4UTBYeEM5RXN2eGJKSDBOaEtwd2hwVmZt?=
 =?utf-8?B?KzFzbU91dE5nUDQwem5iQ1g2U0IzcTJKOGR0NHo3R3NaRTcxNUljSmZCMmZw?=
 =?utf-8?B?Q1ZqREw3bnZyTmlHL01NcDJQUExScFB1Y2ZzcVBzQmxUZWZ4YXQ0RjRlWC95?=
 =?utf-8?B?ME1aa3N0N25NUCszWm9LNVkvV3dNME1KbUJrWEwwUFkyWUdGSWwxeERYbzB6?=
 =?utf-8?B?L0s0NThJTzl4Y3c3T3JLZWZTT2lLdk0xM2FBTjhuNGs1a1ZDTE90MGpUS0JE?=
 =?utf-8?B?ODZvNG03OGhuaXZqM2NNbjduZkRtRHIrUlFhRjZFWXJWU1dCNVZRbkRhK3l4?=
 =?utf-8?B?QlQ3Z285UHRKQXhCVkRJeWgzWE5wMkVEazlDNVZtRkFNOTBEYVZwZkhXSDJC?=
 =?utf-8?B?V1NBOXk5R3gzeVJGZEhjSjEvQzlBRksxTm9RMGNETzhLa1RlVm93ektBRits?=
 =?utf-8?B?Yzd2T1V1bUVoeVpRcHMwc2RZZUtyVVpCR2ZTbXQvZmZOOUFIcVhSbnJpdzRm?=
 =?utf-8?B?WDZzRktsdlNLRFhZa2twbWhYWE94NWhFdmV2WmsyZWw0MFdKNHlkQ1FSM20r?=
 =?utf-8?B?T1JIT0pmTjAwenJwUjNUNk1ESVVqWnJmT3VVc0RrZnowdU5kdUxaK1A0SFNE?=
 =?utf-8?B?L2dJSS95M1ZuVjlsZERkcWkxVzU3bE8yQ1ZRREJKeTBsQmVISHFTNEFvMGtB?=
 =?utf-8?B?dnNVbGpJNkt4MmRyaDBhejlrNTVSN1UwQkJCUzJxQUlPUEhwTENWYSttM2pq?=
 =?utf-8?B?ZVhJc25XM1hkMFA0ckgvUVJaUFNyMTlOYTluc01qODZwcm1LSVViUTlFOWhL?=
 =?utf-8?B?Q0RkbUlzelVwVTMxWjkxRHBZVTVPZnhPWGppWlIvQy9SWDBMRlVvQkREQzFq?=
 =?utf-8?B?RFZTNzFqcUw5eExTbVBwUXdpWENqSnFENnFYek9oeW5wK3dNU2ZqOVdWZVdJ?=
 =?utf-8?B?TWdxYkhiN2dFanhxaTZMMDhVYURZRE9QWEFjdDJaSEhkZFA1OFJ5eEo5d1NJ?=
 =?utf-8?B?cTl3NUljQ1FUTlhBakNLMGNJNExnbExndHNlaVlWZ2NGaEJHaEt2aWt6Y2JU?=
 =?utf-8?B?TnBQWHAzUDZmM3grcFgzK0ZXSUVzUkcvaG5mY1AwOVVSL1dFanVvcGluSThh?=
 =?utf-8?B?WUJJWFRLZEx4eG9pQlVVRVRRUXYxWVVnenRGcUtvOVZTeTVOYUZtTWQ2cks1?=
 =?utf-8?B?Lzg0ZzBtdEFLZ3hiVlVIKytVd3BOZW9aaW44UU1wcHZBRTlBL1lRczRCbXE3?=
 =?utf-8?B?STRQSjRtbkprYXA5dko5Sm9pWWJRQXdQd0RqM21IMGk5L0Z3TjZrVzFJQVdX?=
 =?utf-8?B?c2pCL3dFR0dUYUhqb1ppWFJjb29pNFQ1c2hjR0ozekE0MlhwV2RJV1hYNWdY?=
 =?utf-8?B?bGZmNnNGa3hnYjg3cHppUVlQN0gzVDlMa3IrM25BVXV3YUhtNEhlanVQK1V5?=
 =?utf-8?B?Tm15WmIreDRXNUVhTW1HT2ZoTHdPTzVMSjdVclNJNW9TMFppcWJ2NURyaE5H?=
 =?utf-8?B?aG41N0pSNTZXNFdLcU85U1FrRlp3MzFjeWp3L3hkVGlBSS9vL1FvY2p2KzVU?=
 =?utf-8?B?NURTVlAzS2hSdUluUlhBbGhKOHY1amtSMlNEamlvMFAxcUpTeGhneGplUkVy?=
 =?utf-8?B?VkVxR3JZUEcxNi90bitVaGlBRmVoaTdhbWQzR3JSK2syd0w1NVF5cW95UVZK?=
 =?utf-8?B?dEdMRmRycGdXVUR2Zmkyay9VdHVlZnlOWUxJT2wyUXljcU1SYXlSTXVqTW9T?=
 =?utf-8?B?NVBLUDMxWnUwUFplR24rREZIYm01TWEyNTdQQXhVNE9JUXNUVGlnMnpXL0Vz?=
 =?utf-8?B?VTNIWFhuM0FqWHpkancyM3IwamFJMCtEaG1qT0x1MUdBUG5qaUx1Vzh0L3Qr?=
 =?utf-8?B?aVBqZUFxOFh1blFHY1VkWXl5M2NENURHVFJCcVNZeEg4ZTMyRmlaaTFSd2NM?=
 =?utf-8?B?Qjh0dHI4NWw5VlhKOS9JK2pVODRLSkJxR0dIaWpYZGpVZVJoY0xOWnptd3gr?=
 =?utf-8?B?ZHZOZ1FhTHRvUmkxM2pZY0piYmg2TlcxSkhydjBxQXhyRW5uOVRnaE9hS0Rp?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfb939f-6125-4838-7c4c-08dd23cce677
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 03:41:50.4636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3xsODEj9+BcNto82rK2/ny8Cd8dg2KqU0PnTxYZJ/u7BY2AeyOhZ6q1BBUJPcNMsMLo9baiJf8WRMAJvjgZ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9877

18.12.24 12:05, Julien Grall:
> 
> 
> On 18/12/2024 09:52, Sergiy Kibrik wrote:
>> hi Julien,
>>
>> 17.12.24 14:42, Julien Grall:
>>> Hi,
>>>
>>> Can you clarify why this is an RFC?
>>>
>>
>> The code for LATE_HWDOM support on ARM seems to be already in place 
>> and working, yet I'm not sure that such configuration is ready to be 
>> exposed for users (well, probably not ready yet, considering Daniel's 
>> comments regarding XSM later in this thread).
> 
> Thanks. In the future, for RFCs, I would suggest to add a section after 
> your commit message (generally after ---) to describe a bit more what 
> you input you expect from the reviewers.
> 

yes, sure

>>> On 17/12/2024 11:47, Sergiy Kibrik wrote:
>>>> Allow to build ARM configuration with support for initializing 
>>>> hardware domain.
>>>> On ARM it is only possible to start hardware domain in multiboot 
>>>> mode, so
>>>> dom0less support is required. This is reflected by dependency on 
>>>> DOM0LESS_BOOT
>>>> instead of directly depending on ARM config option.
>>>
>>> I am a bit confused with the explanation. We already have an hardware 
>>> domain on Arm. It is dom0. So what are you trying to achieve? Is this 
>>> remove some permissions from the hardware domain?
>>
>> I agree, it should have better description.
>> This is to split dom0 permissions into control-only and hardware-only 
>> domains, much like it can be done in x86.
> 
> I don't believe you need the late_hwdom feature to do that on Arm. In 
> the case of dom0less, you are creating the domains at boot, so at the 
> point you can decide who does what.

I'm not sure which mechanism to use for this. Can it be done by XSM 
policy management?

>>
>>>
>>> If so, why can't the hardware domain stay as dom0 and you remove the 
>>> feature you don't want (e.g. control domain)?
>>
>> control domain is still needed, but as a separate instance & without 
>> hardware access.
> 
> Sure. But the control domain doesn't need to be dom0, it could be dom1, 
> right?
> 

I suppose it can. But again -- how do I make dom1 (or any other) a 
control domain instead of dom0?

>>
>>>
>>> Are you sure this patch is sufficient to use the late hwdom feature? 
>>> Looking at the code, to enable the late hwdom, the user needs to 
>>> provide a domid on the command line. But AFAICT, there is no way to 
>>> provide a domain ID in the DOM0LESS case...
>>>
>>
>> I append "hardware_dom=1" to xen,xen-bootargs in host's device tree 
>> and it works.
> 
> AFAIU, the domain needs to be explicitely created. How do you do that? 
> Is it just describing the domain in the DT? If so, how does it work if 
> there are multiple domain described in the DT?
> 

Indeed, in my case it works only because there's single domain 
description in DT.
If there're many domains in DT, we can't be sure which domain ID each of 
them would receive at boot, right?

  -Sergiy


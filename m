Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3197BD23
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 15:36:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800296.1210231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1squqD-0001uX-0m; Wed, 18 Sep 2024 13:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800296.1210231; Wed, 18 Sep 2024 13:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1squqC-0001t2-UF; Wed, 18 Sep 2024 13:35:32 +0000
Received: by outflank-mailman (input) for mailman id 800296;
 Wed, 18 Sep 2024 13:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=le+6=QQ=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1squqB-0001sw-6Z
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 13:35:31 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id defa3be8-75c2-11ef-a0b8-8be0dac302b0;
 Wed, 18 Sep 2024 15:35:30 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by GV1PR03MB8766.eurprd03.prod.outlook.com (2603:10a6:150:89::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 13:35:24 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 13:35:23 +0000
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
X-Inumbo-ID: defa3be8-75c2-11ef-a0b8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOCEJOR7IxPoF5eKg396n3Y/NHAG28j4VmRqCBKRRIKKu5DKRJJjWApYfFCPX5ui2BFymymvAZIuvDvVC0m5mxybGTDe7bZBrGppmyjG3Rb1ftoB+1haEWRKwiJEWdOSxyDuz+DMRysVUWzqewPwWk8zfwPfHhsNqyHZWNkBRORPNAk8bXj5pZWqWvBOoov+22oh77BTU+sa7r+SEr+gYi10bOv5lADVcHUvqDgyaM9zLzKDxtqWwkcbkSDbmfCqrGzyiBvZjv5e9qHywh/jJcQikYf3YBRfvdMcUUzwONF55Chz0FWpdYNV2t4YuAXg+6O9VIF8C19SiGi6GBp8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EOGQDSzYXk+kSXxAViXAZ0X7rG79VhW1xjTfHDgKog=;
 b=HKWAguM7IzFaXAF5K/riBmuuIYWySRh3OjjMpJdekG0Kl9P0IViz3aCHKUV61aA9s88uEl0A4HX7pmaIepNnsuxZH8epCjGjHga1tXOv0gRPDZIH2rkPIfzaZhY7SQgHBvj+wI7NJd7hNOuNbmcyFmvUajPFQpUAHIYv+vdNARMvMwly0qqQmzpQ9TGUmBMi+Iyz4+yWf88IwKn3o9AzrPIP7Ncn9P92Ee93qpTV8+TaSkgvSH5SMg021F45qJ3VMWf6120B/CiyK3/JvIk8aFLWOcYqBqfwnZ0gwg3t3EIUUY7Yh0lAOnNxWZPiG+jHV+ljZPHtck5YyEJ8/4/Gtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EOGQDSzYXk+kSXxAViXAZ0X7rG79VhW1xjTfHDgKog=;
 b=TfDMuPYIOQzIunFzOYp1d6ZfEkmbvkB2CC+Qvt5d6Hs4UjbPtrDsgLcV2q6TIJMUQNibqKT5UjEfmppAlddVYgtdWPYvhoruCfDqsiHPm+rbHtIuqSacDK91QU5IkEMRz6VqiVL6wQOVSsRvBaGkkv+w6G5v/MAZXqoVy5YGqBVXF0OFe9yINJmpafBG+mhVm+ObCXN0WifCxUYuYTZqoutKw51W1h3DUKSNqsQV4j0ePoX7Jl2Ey1hIC0Mj4Bon5TAflcTlxW1XysKwnBxbE+1CQjKvq/Y5IQAY5xhlNcTwHWw8+mfB3J6nEQAgahfP5UOdIrvWyjYOoVakbu/3rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>
Date: Wed, 18 Sep 2024 16:35:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
 <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
 <ZuqgTKqaUDWC_I-u@macbook.local>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <ZuqgTKqaUDWC_I-u@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|GV1PR03MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d01c87-3c8e-49e5-f86b-08dcd7e6bf85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWk5UlNNb2hna2gzcnVhc2ViV0NPeWIyVlZHN2p4RlNEeUx4eWxHWmdLZUp1?=
 =?utf-8?B?dkZYMXFhYk5Xc2R5Z25JdzRyUFV1NU51NXZnTkZjVFZEQVdCUVJDRkVQNEdy?=
 =?utf-8?B?dno2SmVBN1kvdS84b1lhbEJBZlZwcC9XNGo5M25jRnJzay9QWmlNc3Z6MVFD?=
 =?utf-8?B?MmppSkZZRkpucDlZYnI5S1dNSGZzT1Z6bW5BSmorZno2ZUcxc0g4RzhmanJC?=
 =?utf-8?B?REFuVVptbnJkc0U0aXhaYzNVN3dJaEdpSlNONGVJWTRTbzRHOUJiNVdXQWFq?=
 =?utf-8?B?N0tzQmZ2eFh2cFFrdnpqOGMzZXYydGR0NlJOdjZtc2taMnl1Rmw4ZFJLZlAr?=
 =?utf-8?B?bGV3WG5lOEdPNGhyazMrR0JMUkhQbVk0QXpCNjhvelM5ZjJxTnExTTlGaWFD?=
 =?utf-8?B?UVVOSkJ2b1g4dXB4RU4waVByYzcxaXJCdmlwRC9Nd3pnVUtyUFpGWkRjeC83?=
 =?utf-8?B?M0lVRHpFSDBTUDFLdEFBWU5kdmNHU1Z0M0xCWWRYNTlOaGJSUDRtdUE2Wnhw?=
 =?utf-8?B?cmxVd291ZWY3Q1BkNGt3di9adEZGYXB2VmVKQU5LM09pK1B6ekpzMWtmTHlm?=
 =?utf-8?B?QW5xUTROZDFnVHR5d3dvY1JSSkRxcG8wSTBBUlljeXBmUXNwNkpINVBuQ3d2?=
 =?utf-8?B?UUNPOHdYMmx2T3drUFdnWVkzaWpyVkdpM1h2ek5MWUt1T24rZ3k3Qm55N3NN?=
 =?utf-8?B?NEF0USt5dy9sckxQTmZkM0RpK1pFTzJncFpWam5NVVZoeE1kb3JyM2tTd253?=
 =?utf-8?B?cm41Q2ZUeEYwZHZYU29BTS9Rc201R1pzUG41U2V1WlFKcXZWYkxrZUlkbXZN?=
 =?utf-8?B?MUZtZDZqWVpaQVUvNkY1bFp6Qm5UN2lEdWtpbm1xU1B2UjU1bFR1bkpuN3dP?=
 =?utf-8?B?MkJGN1BxcERRaWRNc1lONk1LNVBXYUNNR1YwTVB4UzFYSFJyL2FNZkVna0N3?=
 =?utf-8?B?WERZN050YXprWWg3ZXBEK2dXZkVzY3gwK3ArdFYyRmE2dm1Qak1XU1htRnJX?=
 =?utf-8?B?QW1VSmRSa0FRQ0NlbSsrZ2diMWFDeE0xOTk2L3hxS3d1SHd3Skwrc0RBaEZJ?=
 =?utf-8?B?ZXNNVzV3Q0Z0eTBEQXJrRHQ4L0g5dXNGTnNtenY5NEZnckxDMDM1ZFg4ZXJp?=
 =?utf-8?B?ZTBXcXNnZHRMM2tLc0EzSzA2eG9nVW1tcWJoQXpLYTVMMW8rc0R6QVI1YnJI?=
 =?utf-8?B?MDdBaUtteGxLcjUzTVRXMGFrT0RGdkxocWg4dWlpTFMva2FsaHBnYjcyWWRx?=
 =?utf-8?B?YWZ2VUJSWithQ2VWWUtyT3BlWi8rWUMyMUt6VXVqWDViWkRDTkRkUFUxV0tK?=
 =?utf-8?B?bmlzUWp1SjJXeHQxK0hKdkIzeGNuZmxjTi9qQ2FlVGFYVy9SeTcwTmg0V3l6?=
 =?utf-8?B?ejR3MVRRdSs1OWZPdm5Db1AyYjZUNWR1SXp1WWpkL0E4aDBxU0hsOEt4ZDBP?=
 =?utf-8?B?NkhwQ1hIRnl5LzczdHVZMzAvNGlHM1k4YzFKMytaMEZLelR3d2docEpqYjh4?=
 =?utf-8?B?ZUZCbGNSKzQ2SVg1S2RoaHN2aDNrNWlJSm5pbm5mYU05NnZCQmxyUktQZnFC?=
 =?utf-8?B?bHFORmxoZi8rTStNU25FKzBiRVNtTVd5WmZrc3BGV3g5TVJYVzlCbUxkbUJ2?=
 =?utf-8?B?SkJiZTFqUEVNUk02WHppVTN3K3VyWmZPSGtrNnpoR2lWdlJTcjFrMSs3UE92?=
 =?utf-8?B?RWNTNmN5cGNNSHpJblJaT05JQUtrbWdhQUxTcDVxLzhZemhxYVFreWR3UzNk?=
 =?utf-8?B?WFVrYzRIdjR4OWh2a3VTQmVUcmdsRitGRzg3YitIM2N4ZVdnb01hbkRtOE9X?=
 =?utf-8?B?Q1l4dnRzS3NTL1UxNzlzQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWNzaEY4WjNQN2pMR09VTFdPNFBBczJjdWhOTk9iRmtiSW5YWVJCV29tMGRG?=
 =?utf-8?B?RDRWS2xzV1VYN2RkWFF5d2dQTThnbmF3RlRuSE4zL3F1RThWVGVuZVJ3R2lq?=
 =?utf-8?B?ZkNkbVZveFpPV0sxM0dRT0pZMjlkbUdyMWlmRVhQMk0yc0FTN2hIUjVGa0Nk?=
 =?utf-8?B?SGVvaHUyalRUOEpacWlja0dzYlFWQXJhazZjbFRmWkFxUnY2MzNpREJvZktn?=
 =?utf-8?B?SHZjTmJIY00xVFd1ZDFNYWVkT29WdDlMK0s5Z2Z0ZUxhZFdaU0hVYWdSL3B2?=
 =?utf-8?B?VVdFQ3A5ZGx5WlZ6T0pENHFud2ZpODFMdVFtU29FY0hVV0YwTytjcjJUVFBv?=
 =?utf-8?B?UHppaFZpR0dDZHV6Sm1qSXpHSE5xcXpWcVJRckIvalRPUEhLd0diVTlRWUhW?=
 =?utf-8?B?UW4rUnhIQklBTmRMK0p1NjJKMW9WMnZUbXgyWjhRZjNNMW9TV1krYUJycEtT?=
 =?utf-8?B?QmZXUWVSVnhXNnZPampwVTZBUUtXL0wra2NScVppWU9QMm5TTXEzRnIySzVm?=
 =?utf-8?B?MCtYTnU4bktVWlNNOEtaQk5xYVBrb1hjV3pib1FLNGxnVlExRkt0cFVidTcz?=
 =?utf-8?B?NWZXNXhWbU9XbmR4c0p6b3czd1dmc0lleHlBMzlGSXpkcVNSM1VYUVpQSjJ5?=
 =?utf-8?B?YTRLZTk1VzlYNVdvYTd4YW9rMkl5UFRoVmZOSDBUMVJ3VlRsQTY2WXBwMHF1?=
 =?utf-8?B?ZFZwMTBEL1VYTTVIMm1FMXFxMTNlMkdwa2RwUWxGTWhZZENFckh1NXZLVXZZ?=
 =?utf-8?B?cC95RmxndUJ0Y1ZvL3h2TlFHcExnVVB4SjZPR011NjBqaEY3dkR3WGRtZEFG?=
 =?utf-8?B?a0tTc2FlOExPVTFQYURUc1NOYW5Qbk0vRXkxeGNXdmxWSzVFNkVIQTNtT2l0?=
 =?utf-8?B?QndBWHFFdVlxSXlPcSsxQWsyVWNRRzNnaHBWTldiUS9yWHZOU2FaZ3NFZHB5?=
 =?utf-8?B?T3ZUQ2xVMnpnOTFCMzFNNHQ5aTlVd010SHlCSjkwQ2hNVFF0RkNkVmU2c2NS?=
 =?utf-8?B?RDhQcllsVGRrN2lMY0Y5QmtCak5zdGR3U3BuVEdXVlU3b09LTHR1UitpMERo?=
 =?utf-8?B?L0pLS2xDMjlva1FlUXNiQzlZUnhVMEd0cU5PN085VXV0WlJ4VjBxaHFVYUxw?=
 =?utf-8?B?Mzc4TFNtcm9GYWg2QXI5U1pkYjk4NDArbWlXakh0UUN6WlFuWmlTRVpYOG1T?=
 =?utf-8?B?TTlDdXZYRzM5RVhSanJGR3g2OGhGcEpHTm13dHZhYnQzcHpDNE0wejN0V0ha?=
 =?utf-8?B?aU95cGRyUCtRbDdMVkpRczRScEI0N3FMME8wUldaLzB5TlVNSjJXeWU4NW1O?=
 =?utf-8?B?elQxSFI4Z1AzSEZ0bUpPZVpMTS8xSXNXZ0JRT2Jva1pJc25NZ2JuUWJvWHJ2?=
 =?utf-8?B?eDVDTkZmNUVWM2ZRNFdqSUp3cFI4UGJzb2p4SWoySE5jOVNEZ2lNREhTbVRB?=
 =?utf-8?B?UkZDMGx4N1dUbGFLai9GQmw2aG4rMWx6b2FlNm9iVWQxbzBVRUpWMEhGS2d5?=
 =?utf-8?B?M3k1eGdacmQwNVhOT1BaVkZkbmVUUVlaY0VSdlhROFE1bTl6d2t0MUV5TkJu?=
 =?utf-8?B?djBaVi9FTjZvbjQ1QjRDZ3VMRm5sSFRkSDhOMUYwSnN5cHo4NGZjTFVaWVZD?=
 =?utf-8?B?dEY5YjErNGppVVE5NFBnVllSN1dnc1VvOVFtZUpLYWNld3lPVXYxRmNwWDBn?=
 =?utf-8?B?MFdRK1YvRmN4ZXh5OEVWTkZhSjVjclFrN3hFNURRdi9wNHNtOGxEQXJTTDFP?=
 =?utf-8?B?Rk5CQ2dBTDBQenlEbmxMOCt0SElDRmlNZ0l1TGNMcGVyenVhYmpjWHBla1FC?=
 =?utf-8?B?dWNkSTRGR1l1dFdQMURDcnhsRzRqN1pOdDhCZG8rOG5pS0VJUFY0N3I5ekk5?=
 =?utf-8?B?YmMvR2xSM0crZkd5dEdRRXVteTNsQ2dxWTdma01uMDJBOHBOUWpKaSs4SW4z?=
 =?utf-8?B?ZFQ3dDdvTHpiNEd0MEtSZ1ZSUXBTT0dEOTNuUTl4VHR5K2w3OTVhZTl1ckpX?=
 =?utf-8?B?aFdQZ01FSUtLdVdSbUxpckRraDRwdzd0NHNjRzcrZFdkQlljZ3k4ZzFMNUNz?=
 =?utf-8?B?Mzg0QVk1anZxQ0xaRTVKTUlsa09hMy9CKzcveWNJMWhhaWdoQTFuZzBwZWJn?=
 =?utf-8?Q?bVV7GmARen1w/fEG3Gbc6eZ/q?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d01c87-3c8e-49e5-f86b-08dcd7e6bf85
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 13:35:23.7822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNLHG16C8b9Vn9k3OaStrGc0hNuq4N39+kdQ2d7e2W9+QCG6HBLnqMp0AGgeSyzCaaFoX5y3WLWDuBiuBZmLtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8766

18.09.24 12:41, Roger Pau Monné:
> On Wed, Sep 18, 2024 at 12:29:39PM +0300, Sergiy Kibrik wrote:
>> 16.09.24 22:57, Stefano Stabellini:
>>> On Mon, 16 Sep 2024, Roger Pau Monné wrote:
>>>> On Mon, Sep 16, 2024 at 09:37:57AM +0300, Sergiy Kibrik wrote:
>>>>> Introduce config option X86_PMTIMER so that pmtimer driver can be disabled on
>>>>> systems that don't need it.
>>>>
>>>> Same comment as in the VGA patch, you need to handle the user passing
>>>> X86_EMU_PM.  It's not OK to just ignore the flag if the hypervisor is
>>>> built without ACPI PM timer support.
>>>
>>> I also think that the flag should not be ignored. I think that Xen
>>> should return error if a user is passing a domain feature not supported
>>> by a particular version of the Xen build. I don't think that libxl needs
>>> to be changed as part of this patch necessarily.
>>
>> It looks like toolstack always leaves X86_EMU_PM bit enabled, so that part
>> may also require changes.
> 
> I think you will be unable to create HVM guests, but that's kind of
> expected if ACPI PM emulation is removed from the hypervisor (it won't
> be an HVM guest anymore if it doesn't have ACPI PM).
> 
> PVH guest don't set X86_EMU_PM so you should be able to create those
> fine.
> 

would the check like this be enough?:

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -758,6 +758,9 @@ static bool emulation_flags_ok(const struct domain 
*d, uint32_t emflags)
               (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
               emflags != X86_EMU_LAPIC )
              return false;
+        if ( !is_hardware_domain(d) &&
+             (emflags & X86_EMU_PM) && !IS_ENABLED(CONFIG_X86_PMTIMER))
+            return false;
      }
      else if ( emflags != 0 && emflags != X86_EMU_PIT )
      {


(probably with X86_PMTIMER option depending on PV)

   -Sergiy


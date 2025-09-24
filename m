Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387CFB99858
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 13:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129283.1469305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1NFB-000592-My; Wed, 24 Sep 2025 11:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129283.1469305; Wed, 24 Sep 2025 11:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1NFB-00055z-KD; Wed, 24 Sep 2025 11:01:05 +0000
Received: by outflank-mailman (input) for mailman id 1129283;
 Wed, 24 Sep 2025 11:01:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPfF=4D=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v1NF9-00055t-FS
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 11:01:03 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1aded1a-9935-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 13:01:01 +0200 (CEST)
Received: from CH2PR03MB5223.namprd03.prod.outlook.com (2603:10b6:610:9c::21)
 by DM8PR03MB6231.namprd03.prod.outlook.com (2603:10b6:8:32::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 11:00:58 +0000
Received: from CH2PR03MB5223.namprd03.prod.outlook.com
 ([fe80::64db:a9da:5b27:8665]) by CH2PR03MB5223.namprd03.prod.outlook.com
 ([fe80::64db:a9da:5b27:8665%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 11:00:58 +0000
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
X-Inumbo-ID: c1aded1a-9935-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1bt6fDV12qlGhftPfp74ZjENhnLbRO2GgOzDND3c6ZiLfvSKjT0Bgp/hFsv7tvKHM8nRG8HbyfiXPqWU6c0ivFWetuM2Aa/vLV5V/9TQ6p23/Mp2q3LzSroHOKI05Q1dcmUaFZBLVm5Iu+rs0+5PC7XoLoHxdhdJ8KjWECpSG9lohNPIbIyOMUgg7LM6nu/JWwtoSX/e4QbKJB277sOYIHIerf688GBqWQ0of8sOX2CMGl0KwOPGtHNUk5RR9o7HCumPjgTBHuKS9L82Uksyer1iZ0KnPuj5nLgHH+fWr4ERe1+e861xFhHsaVZzMfomig85z9sXyz1JsAuYT3eTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bJS5bgeabBkmkOmKmzz/bgIFX1Wj9kkd8dwy01iarU=;
 b=SxEYAduI49iv0IrlA3Wgp8O0EV/vds8TIsXg7aNOffdX8BtbEqFHdTAaaAt7pZ/7MjYIAcUOD7Xwh/xCsHVo0JnrGNjHmwOQcMtP9WWY8mWEzMdj49VnAU8MGcEo/+sSoS26WZIco51ItrX8fYGY4S6poC/3M53ACHJYQwMB+zz3c9OvJIYu/mWxPtLgoHP/Py5cCoYX7rodi7ITmrjBYkGNnXwogp2n0jTo/UX7LPpDy0OL7WiU/Mo/H4UQXmxhZgNMVA0Q13yrHnBGmd0+d+o+/xkG4zF/jmobwGmo6Pghx65ezk+XQA6mMW5//3eETzAswn7CBlI0vuz4Eb0EIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bJS5bgeabBkmkOmKmzz/bgIFX1Wj9kkd8dwy01iarU=;
 b=ClGNfZKxVnYniSz+Xk1PtKvJKipePSosW+MBYyo1tv91E8cb9UBRHf4KLQhe3orj2FVKU+q6sAC13FyK7CY6VtrsZi/42bD8eCiIccyNlELxm4F1Ty57TtRyDaE86wU/BgaRoFbR+LTg4Mg17LRTem/mZ+88UshpILT0Elb9+Zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.21] x86/cpu: populate CPUID 0x1.edx features early for self-snoop detection
Date: Wed, 24 Sep 2025 13:00:51 +0200
Message-ID: <20250924110051.2160-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0027.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::16)
 To CH2PR03MB5223.namprd03.prod.outlook.com (2603:10b6:610:9c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR03MB5223:EE_|DM8PR03MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 47df74dd-9450-46e5-e5fb-08ddfb59a3d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGo0eWNlcW1LQkpncWVQajZzL0lNWk1nNjZmM24wRkJ3M3hyOHd6cjNZTWsw?=
 =?utf-8?B?NW9ndmRMWjFKL09TMFhRTEFHT2U4U0l3OGlvUERVL0VidVcyYk9SS2I4SDcy?=
 =?utf-8?B?RW8rbnY3Wi9uVFVXeGVsL0NxUFRVcmVKWlMrWGRLRE9OZXFmZ3ljcWJLKzJW?=
 =?utf-8?B?bERNU3BZQUkrSFg1aXg4T0hDMG8zQjBKQ2JVSWxWSkhKZEgzQTAwV1RoWTU5?=
 =?utf-8?B?bGVsaFJLSHFTdk5IQStXN2wxZTVZMkRabWJLbklkd2lNWUk0ajNLYmpaaE9V?=
 =?utf-8?B?Nlk2R0VJRmE2djU0emFmRm9zd3VTSDFEeE1EOWtCUkF1UzlSQ0Rrc3BYb2hl?=
 =?utf-8?B?VURPMEsxa2ZqZEtDeVFudmFDNE9icFY5M3FNd1dYcyttZTBSRzVCT0hkSXNP?=
 =?utf-8?B?M1dRS2cxR00zQnl6SW15R3FnL25UT2t4bU9jdGF5SEJIS1JhSWU1OUNsdWd2?=
 =?utf-8?B?RU9IaUJ1TWVIcUpGZ0N2K0VQb0Q1Z2pFSUQ1aDZkNUZhdkdGWWNKQjNBZ1VT?=
 =?utf-8?B?VTZqWlNoRmN1aHFQQzE5ODZQUkRabmxFTG51cTZvNHpsTjhNTlpUalRrVHRI?=
 =?utf-8?B?ekpRVE5pajZ4ZXEweHZTQzdqcnZZL2h1M1dpTXBRSEpFT1BDNVI4Y3VkSUVG?=
 =?utf-8?B?KzFpQlVoM3pCSFAzakxMM3ZRdGxReUZJNlBPQWNrUmRjVHkxTjBSQ0pxenh5?=
 =?utf-8?B?bHlWbzlTK2NQZ3ZpRTEvcG0vWjVHOVUvWkx3aW1CZEtzcjNKVGJVYVYrTVo5?=
 =?utf-8?B?c1pGNVVBdnlXTFc0NmFDcHBFclc4T01MLzVYUmRZNnRTWC9wMGZhbzlIZHd2?=
 =?utf-8?B?TGhNTkZSYjgva0o1UXlERmdJYXBVSUhhWS9PT2JOZ0JEamxBUUZMcU9yTWx5?=
 =?utf-8?B?TldGNHd1YThXRS9mSXYyRjJtVHFZY1dRNS8vUk9CQnlTU081SVBNSUhrU0Yv?=
 =?utf-8?B?R1RVN2FzVXJyaGFqaVhyZGZ1dkl5UHFKMzRDK015cDRZOEZkS2hqQjFjbmNZ?=
 =?utf-8?B?aDdmUWlWN1NXaElZWUozV043MTN3RVQ0Z0RPcmlpUVJyS0ZROVdKVVFIOWtl?=
 =?utf-8?B?L1VvdWN4bTBjdTl2QnFHWTh3MXp4Q290MGphVDhpakp1REw3OU9zSmR2eEZF?=
 =?utf-8?B?T3UvMUpFRk16SkxsWDMyb1Y3RkVIdUFwM1RVaXREenh5UFRQV09pbzArU3hN?=
 =?utf-8?B?c3VkVW1ROGhTLysxempBRzBrem9WTnBDUFZzSnJkQmpvbjdrL2p0cmFid2pq?=
 =?utf-8?B?ZkNlMElaZlNWZWhZT1RtOWpvamlyZUFzbGtCdlRNdEVyOEVmN0VhdlVNSTlr?=
 =?utf-8?B?RkhaVkxyUllYTVR6VnFoelZ2U2UxendUOEJQeHRiMklmalB4a2tUdmxqc0lp?=
 =?utf-8?B?cFZhMUlUVFZnSSszWXdvMXEyUGJVMEhpZFNPaHpPbTdqOGxqdWphb0xjTkdZ?=
 =?utf-8?B?NmxnSi95N2N5ekRqejRvY3dpd3JYRitTRFdudi9hdW5VZGR4aEdsNDlmM0Nl?=
 =?utf-8?B?WUxEZEtDVnpYdTVya3dlcHZwSTdFK2VQTVBPMmdxV2JNbkhVamtZTm00eDFy?=
 =?utf-8?B?TFpLOXZJTVZKNFphaUdpbVpYYnNyUmVnNnFWL01rMHlUNjlEOXd1Q0I3OHlW?=
 =?utf-8?B?OHlQL2hUaU80dFk3M0dqUDBjbjErcGVUbW9OWmJqdjRIV1RCWVFkTWMwNnB2?=
 =?utf-8?B?dDRUVXRBYUwrUzlydldxMmtRb3EweDRwWnFUZGx4dW05bHhiZDhXTVBUOXVV?=
 =?utf-8?B?Z0phSWhYb2VTWEdCc2hSUzEwYmxVdjl4Z0pueFRYSkZlSms5U0pCRVpqcHU0?=
 =?utf-8?B?QXNIcW1oNHF5TmxUYmU5MkRkUUpRNlNzczNPaUZ4UzVBUUs2T3puKzcrU2Fl?=
 =?utf-8?B?NUJjUTU0MEZST3ZrTFFNUzFIdGJPdTZZVzE3NU9vcGEzYnc5NXRqS0d4Ris4?=
 =?utf-8?Q?WY9q9PmSuPM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR03MB5223.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW90RTVvcG4wc01RNG1veFNZMUtQSXlLMEF0MjBWYXJIWHhldzlNcFZuM2M1?=
 =?utf-8?B?WUp5QldTTjZBb1JSUkxBZFZMaWRqNklwMW9PMGpkMDZYdTlHQkFyZ3owdUlM?=
 =?utf-8?B?eE9HR0ExMUhCa2h5SEVwQjNZUS9jOE1aN1QrbzNJaXJTVWZKMGRnYU90TWxX?=
 =?utf-8?B?VEJoL1JIQUhlOFhBanN2UktSY2pnUWttbTdmclJiYzIrUnh2WkVkRVl2d2t6?=
 =?utf-8?B?U3VuRW5IODBqTDA3THB0aTNqQ2E2dnhQK2xCc2Z1OUZrOGozUThpN3d3VElt?=
 =?utf-8?B?L2hBN29rSnlUL0lUaFRPclZoZXVKalpxRmFWcGljTGg2WGpJMll4Um55NVgy?=
 =?utf-8?B?M3FQSllzYWtoZmQxZ2VMa25oSzQrVlRJa3k3cjg3cmZoV3labHkzYklNZ1FM?=
 =?utf-8?B?K0EzUW9qSjNxcEl6Tjd3Z2p3eTBoblBVZnlqSm90N09ZUWVjS2s1NWltT3Jx?=
 =?utf-8?B?eEpYUFNlS0dZU2F6M1NxaGUwamg3a1F3TTVxK3pwcU9RTmhEY3ZTYWEzNHY5?=
 =?utf-8?B?Q1lHZlFLNDJwb2VwOVdEYkhXK2hLN0VoRUJXQUdtU1d0cFNUWTlLYmxqVVZx?=
 =?utf-8?B?Z2F0WFlqM1gxMURuemZGeWdTMFd5NnMxQ0lmOHB0WGFlb2txWHdkb2QzYUNX?=
 =?utf-8?B?Mkp4SWxBZkcxdkN6WThQU1RUd0RydTF2bE5ISTlBbTZIUTd0N2NLMStnNXVz?=
 =?utf-8?B?UjN5MmVodWVvVnQ2Unl5VndJMEFTTzZnUUpMNUx6dTRTb1RPNk9ZYlVDbnRE?=
 =?utf-8?B?MDNVWUlZdllvN1N0c0VkK1R3OXZBZGhkKzJydCtqaVZnZWtmNEdKUU5NQ25Q?=
 =?utf-8?B?NktBc3NzR1pqSUZYY052bDhzcnU4a0RyUmJRR3pLbituN2REQUlVV1d2UXMr?=
 =?utf-8?B?cEJOeElLOWJkN0tKeGJoMDhpMFhoZnJjckVkQkpoL0dGeTA2VmliU1NWeW4x?=
 =?utf-8?B?L2tBTk1HZkFVZHV6Vitqb0RTdW9CQnRsUE9mYUJ3T2hQZmtzUFZMd0t5N1FZ?=
 =?utf-8?B?MGZRVWhGTHIrWTU4a3kvM3Q1OGdWNXFpaEdkREgvUXVYMzNuMEJGSTBZU3ZU?=
 =?utf-8?B?WnAzZUJydjFvK0FvL0p3TEFoWXVwdGVFb0djNXlqZzZNamdKanZCSHJ6VkpM?=
 =?utf-8?B?NnhhWlQxRDRCMUdwbU9aVlY5SEI2eVVyZGFBdGszL1FMY250NnpNWnNUZDlv?=
 =?utf-8?B?eDJ4MVZORUh4YUo2SVhZSURKcjhFNFliMC8yRGNTSUpISWlVREU2eUdsei9O?=
 =?utf-8?B?YlF3Y09ZNGRjTnE3ZEcwbkQyN0xXT3Z6dHZZQmk5cVdDaDVYbFN2V2c3eEtj?=
 =?utf-8?B?bmhQalppKzFnSHJJSk5vNzliTEErU2hKRTBCVUI3QXhCWndKV2oxOTdzMjhT?=
 =?utf-8?B?MHBobjBiV256Z2hGZmwyYVJWODc5VVNDOGViQVJiVUZhcExlNjUzQkFGTXNH?=
 =?utf-8?B?VmIxUDRJQ0pHeGxRYkpDOGJCR1UzQWZhVmg5bjhESjgwU0ExOE5hcmtPM3B2?=
 =?utf-8?B?TmZUeUxUTHgwVm1IWThMSVdsWnFRbVlmakVESnAzVzJ6ejdiT3JTUCtlb3ZD?=
 =?utf-8?B?Y1dqK0RINXBkc0pNNW8xOE1OTGhzaWJpU0NmK1NFZm1NYlQ2dm9sd2dyZWN1?=
 =?utf-8?B?bzFCbkdZenhzWElSNS9acU9aWjBTRUNEa0UyZ1NaZzhBM0VPVU9RZVhBazNS?=
 =?utf-8?B?NWZkWEVGTytNM2pjcE9aTWZWQndmdVorTGZ0RTdhUkh2V3RpbTUrbDk4TDFk?=
 =?utf-8?B?c050eHA2bG03KytxQWVNVlFnTktYUmJDSStCRndKSGFuMGpqWlBXSDAvaFNC?=
 =?utf-8?B?V3A5Q01lL0g1QnVyRXRDQWV4YW1WcUZnSWVEY1lTb0hkWUQwb2N3MnVjaXdC?=
 =?utf-8?B?ejlmM1oyd3lGT2I2V1c2T2tsK2JvOWVXbHl3Ujl1aDZaZ2sxUTJpbytoczdv?=
 =?utf-8?B?clpjUGZXNWplT1hmUXpJNFRCNzlJZkkvNFg5bXZBRzJMSWp5WS91ak5YT2JL?=
 =?utf-8?B?UmFpT2JDdFg2WHlSUjAyN3p2SVVUTmx3c0R1UXliM1RRSHhGNlk2bWw4VU9t?=
 =?utf-8?B?UTZQZmNJY2tFZzArNEcvdmZwLy8yN0M4T2RKYVlBb2EvSm9OazcyM1VxNk9P?=
 =?utf-8?Q?m3iMmg8AYhFsdYaO/I1GFUZaI?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47df74dd-9450-46e5-e5fb-08ddfb59a3d8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5223.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 11:00:57.8637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdp37mX3uC55JY6cpvZdBMP0w/eEpwNUdlCOYx9hwgX89RYaobZvmFXaEcPdBndekg/B3mcRdfCxvnzMLqU5cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6231

Otherwise the check for the SS feature in
check_memory_type_self_snoop_errata() fails unconditionally, which leads to
X86_FEATURE_XEN_SELFSNOOP never being set.

We could also avoid this by not doing the reset_cpuinfo() for the BSP in
identify_cpu(), because SS detection uses boot_cpu_data.  However that
creates an imbalance on the state of the BSP versus the APs in the
identify_cpu() code.

I've opted for the less controversial solution of populating FEATURESET_1d
in generic_identify(), as the value is already there.  The same is done for
the AMD faulting probe code.

Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 530b9eb39abc..35dcdf0c8801 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -490,6 +490,9 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	c->apicid = phys_pkg_id((ebx >> 24) & 0xFF, 0);
 	c->phys_proc_id = c->apicid;
 
+	/* Early init of Self Snoop support requires 0x1.edx. */
+	c->x86_capability[FEATURESET_1d] = edx;
+
 	eax = cpuid_eax(0x80000000);
 	if ((eax >> 16) == 0x8000)
 		c->extended_cpuid_level = eax;
-- 
2.51.0



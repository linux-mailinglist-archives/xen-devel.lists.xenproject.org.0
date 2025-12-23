Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC1CD8707
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 09:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192403.1511643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXxY8-0004Dz-NM; Tue, 23 Dec 2025 08:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192403.1511643; Tue, 23 Dec 2025 08:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXxY8-0004CA-Jz; Tue, 23 Dec 2025 08:15:20 +0000
Received: by outflank-mailman (input) for mailman id 1192403;
 Tue, 23 Dec 2025 08:15:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vXxY7-0004C4-0q
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 08:15:19 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8327db84-dfd7-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 09:15:17 +0100 (CET)
Received: from DS1PR03MB7871.namprd03.prod.outlook.com (2603:10b6:8:21f::17)
 by SA2PR03MB5913.namprd03.prod.outlook.com (2603:10b6:806:11d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 08:15:13 +0000
Received: from DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3]) by DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3%7]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 08:15:13 +0000
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
X-Inumbo-ID: 8327db84-dfd7-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUhFDWBK8ZFmjmCNbe0gjAxPljluajQxUTTToHrMcqG2VEcscnm6QMYWUmg+QviuaH6onvW/Yju9QTf6vRZ1UFZWitsvrEEZt+EnUZENcpnRy2wGSxKtW/EtwyjsJg/fE//giWTx1B6Yhi0Ev36RFFOLqm1OIq/EmBH+TVsxwqqyxXedYmi580/F26izA36vjYh0nEX2X8hfT9p/SqIZgghJiTDOc7sz2tcmrZXYxq/POT4wWYAp3gErPazppRvXRr0L5Hq4VRu4lbpEQEc795gntk4XLDwyFQafaS6DHhh46U5nuQLDslU6Vz8DvLodqFw4K3XZqCP74d2X/LRCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Lg6YZh7pE0TJ+LHAdARxWRraAx+sb0tnkDjhERzLs8=;
 b=Sinp5HVgDxB4vyIHOSalOutCrkUn9TsAYqlinez/QfheqLpCjzJRT3kUdj1Jec8sWwIdxCFUI+jhSwpxviPMA+MelHcybWA1I/gRDSbg+fSKwogO9VOc2/PQ65H+fLR2ihlgVmao05QxMoEQwVsTC0xxRUtZjAnBTQzM2qCPCYU2wWSrp9W+hTKvc2xNv1FfAqfv4UaiW85hCbYX0tpDItc1SxPY04uHD59qRFNapLzvmZPut7G1r3WhTanC5BqopzVCDp5Wm09rXJSjL3+zr+lQucFfX5evckRwixqahxt+WUd9xd2XNqXsRN0NJWCIzkwHYS/2+YlY6UMaZFuDTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Lg6YZh7pE0TJ+LHAdARxWRraAx+sb0tnkDjhERzLs8=;
 b=Myw+M+Ef0LTVMUWkwcj5I2+p0ZbQ3dB3jNOEs3q4Wrn0D06hY1igANOHl7wBn6q6FbVE2zBV7RMkLGV9rlUSrbnQ0XZ0npibgU1VEUsy12uQzsetP3lJ30ziUsMHfWPnuynIvPbMXRN5ygS0iccfha1F7XC+G15rPbbM8IpJVKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/mm: move adjustment of claimed pages counters on allocation
Date: Tue, 23 Dec 2025 09:15:07 +0100
Message-ID: <20251223081507.29325-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAYP264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11f::16) To DS1PR03MB7871.namprd03.prod.outlook.com
 (2603:10b6:8:21f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PR03MB7871:EE_|SA2PR03MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: ea090cec-c62a-42ff-1ca7-08de41fb65dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUpJRUd0ek44SkR0dmd5TGN3R0IwNzVZYVE5SFYxSGt5QzBDSHc0YW1RMDAx?=
 =?utf-8?B?czd3Q2xacHlUTnc1QjFDNHFyU1BxZE5tZGRsNHVvRlpIeDRPMytmQTVHc3d0?=
 =?utf-8?B?VlFwdXdMRUdweURrOWNBWGU3U09BcVpnbHlpQ2VHRmIyeEFsUUNEVXovU1g5?=
 =?utf-8?B?UDg1RTBUWm1jOVZadmtxT3MyVFhHWGJpYUlmWGZORHdNQzR1UVRvUkZLQk5R?=
 =?utf-8?B?czRRWFBydGpJM3RJNHFxZk9BYmQyTDRoalBHMDRzYW42Tm9nUDhwR1lNdThT?=
 =?utf-8?B?K21BaGlRcE5YUzhLamgxVjRsZ2N0NlkvWXRIVjBCaldZcTFKc2FkeG5leHdX?=
 =?utf-8?B?eTl3eDQ1ZzExS2dmK2RqUmVWU0VVS2ozYlFtTXNWQWl4ajhicTNMMXVPVmdz?=
 =?utf-8?B?LzJjRGN3RlpSWDdyckVpdzZ6SnQ1T2NzNDI1TkhySHdKdGc3MDIreWFoTXVB?=
 =?utf-8?B?dzIwSWNxc1ZNNjhuMFlucDgyWUxyQm9Od0VJTm9xMDhFb0U2RkdEVXJ0VFho?=
 =?utf-8?B?aTIrb0JNOFY1NGFUL3Z0cHRPWm81SytSNHc5Y1BNdkNQdURvU1FmSGdTU2FR?=
 =?utf-8?B?VXdrbDRqVHcreXFjcnJ0MmpMNU9BYVgrWW1EbklHK0krMnE1ekJiTlN4NjZK?=
 =?utf-8?B?QzlRNzA5ZDRoZEVzZzFqRUgwcXltUHltQ0ZNcTh6RUx1OG5VWDFqMXpHVkZU?=
 =?utf-8?B?TWZNdFBQc2NrNGlCbHIwbWFrT3hPV1NLMHVCWE44MnFGZUR3b0xaVnJYQVQ3?=
 =?utf-8?B?Z1h2TnlzcmJETDhrRm90QWwyNmVOMVE0RjJFM3NTRVZxV1dGckk1R3dudW1q?=
 =?utf-8?B?OFQ3L1FkQ2RvVE1BNlBqTlRVOW5xRTZKY3NXYXhRTVNJZFBVWjJoUWJsbGdW?=
 =?utf-8?B?ZEY1b3JoSTdhSG1EMzdpaUlUVjdDSXc0OFA0R21XSG5jQmQzd1prZ0t0NkVL?=
 =?utf-8?B?cGNwYzQ4SXdvbU1XcDY1c0N3akFjYkdHMzlVT1gyeUpNYWk3TmVNWVNuU3B3?=
 =?utf-8?B?eDhXOTVLTzJxcU81MXYwR3IvRno1enBNQ04weVZ2RTRDWHRnd25qU2pJTDNs?=
 =?utf-8?B?ZE5ib0VDTUVBN0xDNkxaYlJ1dVJWb2NadDdXZkZkam5RcWNWZ29yRXZhTmd3?=
 =?utf-8?B?amZrNnJyanZxNEZVRU5keDBhK1hWV0ltZkp4L3U4OHBVb2luQnZYMHcrbld6?=
 =?utf-8?B?RHpNYlNROHNqS1FPZWZRa25pejZzZ1c5RlJIb1BNeUhEL3R2WmJXb1htaXJy?=
 =?utf-8?B?dnl5emlGNU9IRW1lbVVLVlVpMWxEbGhtNGtvSmhFbEpPWStOUlpWMjlVOHF6?=
 =?utf-8?B?U0RlbFZ5M0YvdEZqL3dNUHduYXVINEdwc0FXbU4zOURKVDdaOHRjNlE0NDFh?=
 =?utf-8?B?c0drbnRWVWpxbHpVcVQwZFFtNFZYY05zdlN2aGw5SEo4V1JGN3QzdHRCVWQx?=
 =?utf-8?B?b0pjQTZXQTRCTnVaR21iVXBZNHJuWndVNEJiRlVTUThrQXp5VkFUKzViVXVP?=
 =?utf-8?B?aWFCZmpXRWNsNmJxeDYvalBlVEYyeTBmYnJHT1BiNUNrRUNqVnVCdWlsbFBB?=
 =?utf-8?B?K2dNdVlyVlorSko4WHdsMUJiUmJsamthck1tZHJGbU5BZythRUd2UjVGOFRv?=
 =?utf-8?B?Ti82ZHhJaW9DV0t2Q1VwbitNeFVqTGoyb05KcWNYZ21rNHlNa1hvSm1TNUxB?=
 =?utf-8?B?N2FIdllHTE9LOUdJMHZ2MEVoekhlQU5LRkxtOGhsaVI2cEdHcXhURkVpMlJw?=
 =?utf-8?B?dFBIRmlwREpGR09nd1RaSmI2UXZPa2pQU0FwbER5UUtEQmZwZS83a2Fxd0Rk?=
 =?utf-8?B?SW5iR01WZHZHWnd0VE5LRFZhWE9hWlQ4Y284MWpWQUVsVW92VHZ5K01Xd3RQ?=
 =?utf-8?B?dzdLaG1XVEIwdEZ6UkhlbExES0JJTlJzem9kRzZoZU5zdG9HUU1PSU4wREFG?=
 =?utf-8?Q?rrmYQDGQHthuQg3w9owR9GAi8xYuNYp4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS1PR03MB7871.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzIzSHZWRWkrS2dwbEZHVW92V3VFWWxTMUsrbkdDRnJRZ0V0Vk4wb0p5NHFY?=
 =?utf-8?B?UTNmTDhUc1hMS2F4ZGEzOG0ySW5oUmVuUDRjVVNiN3JWdXM4MnZtSmhjM2tP?=
 =?utf-8?B?S2ZUalF4Q055UVQ3TG0xNTRkcUlObDRQcVVrL1hhNUdYOE1XOVMraTgrNFJh?=
 =?utf-8?B?bFNGMjNmemRnVGkwZWxWcWs5MDN0RXlCanZySVJBdG43RWxJQ3NjOU5yQVBC?=
 =?utf-8?B?Mm8wR0l3TnFkNzZhMFJBMy85ak1QRFY1R2tJZkpFZGp5eFVGdDhiM0pTYzJV?=
 =?utf-8?B?aE82b2hya2o1bDBCOVUzUWw5c2N0SS9aNXBNN2FjQmtYcEtDTmg5OVRwV2h5?=
 =?utf-8?B?TVptd0xWcGNROWpqMzBHZkNVNXllaVREWDdEajdhVVhxc1lCNnJqRlYzS0xB?=
 =?utf-8?B?MzVpVk9RTjJraTYxcjZEcnNKL1BSVHA3T2VUanRDRXdSSHVjdkRGY013Z2Y2?=
 =?utf-8?B?bVprMFBwMWhnNm0yWGwyMHNLeDh6ZU9MMDRWSURhYnlUVUs0ZmMrbHoyeHp1?=
 =?utf-8?B?Vy9DQzkwNW93YnVzUGU3OWI3dFlqbHMvT1Nvcm9MTHBkYTJTZ0xUNzhRSjN3?=
 =?utf-8?B?THVzaEVTOFNtQzVaMVNKd3Zjd0JqV0RCRzNkS1doUS96SmRTTTBFTmo1SVZV?=
 =?utf-8?B?NUxYYlRvYTQxNXA2eHpHMDExcTZza1RWbk5mdG1ONmVkb0JBY1RoTno2T1Vy?=
 =?utf-8?B?eFE3VXZrN09DMUJMUDVnQmtvU01jcmcwOExpcVc3d1hLcElQS2k4Y3FLMW5G?=
 =?utf-8?B?cFphdUZPa3d2OVB1c2pwKzJkWGpFZi9POXRXUnZTL2p1Nm9vWkliSXFaMkRw?=
 =?utf-8?B?TTdtRXAvbEQrekI5K1Q4dVlBV2k3ODZqblR6REJMNC96ZGxzUzlzZDd2Uklo?=
 =?utf-8?B?M1FMalhKZ09WUWhCc0piUlkxZmU3OWhLMm5wQ1MySWxmZW5DT29uKzUzQXFX?=
 =?utf-8?B?TlZxUXUrS3JpYkVNd3dmL0M2bzFpbWtlN2cwbzVtQWJISlBYUHo1YTRwc2VY?=
 =?utf-8?B?d0VaMjBPaEZwd1U1ZXNwWFd4cjNnaFRiNjIxNTdpRmVpZDdpTUtzd0pPWU9v?=
 =?utf-8?B?NnZURWpyOW81TzcvMzZsVGxTNTd0L3FsT1NweXBtUGR5eGJiQTROMk8zQTg2?=
 =?utf-8?B?NWJBTW9DWklybllRMDNXMC80ZTBxaFZqZ0lvZXREencrdCtxdklhZ3BQbDBN?=
 =?utf-8?B?R0lyWGRIb3U4Y2xFbXhpUzZQMzhNSm12dkZiT3BmNHdNR1BnVU9qZjFyMG94?=
 =?utf-8?B?dUF3ZjVBbVRmUXFYV2xVOFU2WGVZTTE4am9WWXFYcExZcHgwSmNrSU1ZVUx3?=
 =?utf-8?B?ZFRaOGsyZ1NQdXNiZ2szL1VGdnQ2bnVCaUVwMVV0Ujd5dU15Um9oazgrRUNO?=
 =?utf-8?B?OVNsaTRRZis4ZmJXWTdzY1BlQlRRNXJMa1JLSDFReHVGa3dMb1pCdU9jVDd1?=
 =?utf-8?B?NjVZb01YaFlQOEx2ZHhwclBBTFNnS2V2RUE1RElsSlozZmVSVlhxL0ZSc3hZ?=
 =?utf-8?B?QytIZ2MrTkUvQU5UM0I4M0xrN1c4R3JnL3ZEYS9kMWRmNlBHVDBDYlU1a0Vl?=
 =?utf-8?B?ZkFlY08rNmJtaDhPMFVqVnVGRW5POWFtNlN5QzFrdHJUUS9aQ0hJV3RnVFV4?=
 =?utf-8?B?aExQbk9BSXAvQW9jbE42Wm5BVUVaY09TNjcrWUVpUE10TU5SNUdsL2RjWFNS?=
 =?utf-8?B?Rkx4SGhVOGdqc3VJdHd0dmFVR2hFcXZkQzRsRTczMklLNklLc2V4QlJiMzV3?=
 =?utf-8?B?ZEJLMDZvbnVrcVZkZkdSdmNjOEhrMENQYmpQdzdnKzZhc1kySWVja3FweHl3?=
 =?utf-8?B?TlBTMlNqUWdPM0gzWk9tTW1BRUo5RlBrSjJHd3l4SXkvR2RtSlpTdFMvcFFq?=
 =?utf-8?B?dWJzSlBldzRSQTV0Vi9OZGZzU29aUU1IRDdYbitaM0lNOVBDbTlPREpBcXdB?=
 =?utf-8?B?RDdMWWgrdG00b3hlODZDWEFHZXRpWm9iWUgydThDb1N6ck1INnp6NG44TC82?=
 =?utf-8?B?Nm82cGRJMG8wTkR6ZVVSVnhnYkRlZnB4Ymk3RE1xNHB4dEd1M1BxV2s2WFB5?=
 =?utf-8?B?eTZvR1hEanB0TkZkRWtzTXNHMnp1VkhhZkhaSnV5UTM3Zmc0VUJkRG4yWTBT?=
 =?utf-8?B?a0JaOGVOM2ViUjl0YmsvYWVheVJGYi9SZ2VTZXpTeXRyOHZORVVrZzBneG5F?=
 =?utf-8?B?SjhWS2R5aWs2aHFGVHRLaVBmWjR0WkpJT3lPRklGWVJLNDhuUVNOWE9lWUl0?=
 =?utf-8?B?KzZDK1JvY09CeWt2N0M2ZXRSbnduUjhIOEl3dG03TFRUa3B2WW5UcnFuaTA4?=
 =?utf-8?B?clgxZHFHK0hMWWN6cjZwT2pMQ080S2dlc3l4YzBQTEhjYXZVYm9iQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea090cec-c62a-42ff-1ca7-08de41fb65dd
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 08:15:13.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgVFhlLWjtoj4BNaTD/T4LMu/gZCWzbxwzEhb1R45U6Mfy6ZpjZdGHKZOtAES7TnIk0aqTkmdZRauvQHcPHQHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5913

The current logic splits the update of the amount of available memory in
the system (total_avail_pages) and pending claims into two separately
locked regions.  This leads to a window between counters adjustments where
the result of total_avail_pages - outstanding_claims doesn't reflect the
real amount of free memory available, and can return a negative value due
to total_avail_pages having been updated ahead of outstanding_claims.

Fix by adjusting outstanding_claims and d->outstanding_pages in the same
place where total_avail_pages is updated.  This can possibly lead to the
pages failing to be assigned to the domain later, after they have already
been subtracted from the claimed amount.  Ultimately this would result in a
domain losing part of it's claim, but that's better than the current skew
between total_avail_pages and outstanding_claims.

Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Arguably we could also get rid of domain_adjust_tot_pages() given what it
currently does, which will be a revert of:

1c3b9dd61dab xen: centralize accounting for domain tot_pages

Opinions?  Should it be done in a separate commit, possibly as a clear
revert?  Maybe it's worth keeping the helper in case we need to add more
content there, and it's already introduced anyway.
---
 xen/common/page_alloc.c | 44 +++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1f67b88a8933..f550b1219f87 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -515,30 +515,6 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
     ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
-    /*
-     * can test d->outstanding_pages race-free because it can only change
-     * if d->page_alloc_lock and heap_lock are both held, see also
-     * domain_set_outstanding_pages below
-     */
-    if ( !d->outstanding_pages || pages <= 0 )
-        goto out;
-
-    spin_lock(&heap_lock);
-    BUG_ON(outstanding_claims < d->outstanding_pages);
-    if ( d->outstanding_pages < pages )
-    {
-        /* `pages` exceeds the domain's outstanding count. Zero it out. */
-        outstanding_claims -= d->outstanding_pages;
-        d->outstanding_pages = 0;
-    }
-    else
-    {
-        outstanding_claims -= pages;
-        d->outstanding_pages -= pages;
-    }
-    spin_unlock(&heap_lock);
-
-out:
     return d->tot_pages;
 }
 
@@ -1071,6 +1047,26 @@ static struct page_info *alloc_heap_pages(
     total_avail_pages -= request;
     ASSERT(total_avail_pages >= 0);
 
+    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
+    {
+        /*
+         * Adjust claims in the same locked region where total_avail_pages is
+         * adjusted, not doing so would lead to a window where the amount of
+         * free memory (avail - claimed) would be incorrect.
+         *
+         * Note that by adjusting the claimed amount here it's possible for
+         * pages to fail to be assigned to the claiming domain while already
+         * having been subtracted from d->outstanding_pages.  Such claimed
+         * amount is then lost, as the pages that fail to be assigned to the
+         * domain are freed without replenishing the claim.
+         */
+        unsigned long outstanding = min(outstanding_claims, request);
+
+        outstanding_claims -= outstanding;
+        BUG_ON(outstanding > d->outstanding_pages);
+        d->outstanding_pages -= outstanding;
+    }
+
     check_low_mem_virq();
 
     if ( d != NULL )
-- 
2.51.0



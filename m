Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MGXAhNgnGnsFQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 15:11:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E13177D09
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 15:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239076.1540515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuWeS-0006NA-Av; Mon, 23 Feb 2026 14:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239076.1540515; Mon, 23 Feb 2026 14:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuWeS-0006KR-7x; Mon, 23 Feb 2026 14:11:08 +0000
Received: by outflank-mailman (input) for mailman id 1239076;
 Mon, 23 Feb 2026 14:11:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2fJ=A3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vuWeR-0006KL-0r
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 14:11:07 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cfa8d07-10c1-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 15:11:05 +0100 (CET)
Received: from BN0PR04CA0199.namprd04.prod.outlook.com (2603:10b6:408:e9::24)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:10:54 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::e3) by BN0PR04CA0199.outlook.office365.com
 (2603:10b6:408:e9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 14:10:46 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 14:10:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 08:10:53 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 08:10:52 -0600
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
X-Inumbo-ID: 7cfa8d07-10c1-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3GNDrviK/tOrF6ZKjOx055w6U+d7O9IVdB3JZqie/g3FzRWO/mpA07zYsLvPN7hSiy5i3h88u7a9+jYXN77ccBXRl4g8kTmgVPe4QOsGwng7rKlECEBjqt+H/dt3yBmF/5w8Mh1e/24kRu+dKLVG8OyTkJz2E29C4zMAfNLzaW9MDZyPpow1Y6SDuiNvJhS0vlQS/di2h3dNb9IX9VjZmTobT982f3vPW4Blw4RSeYSngXRoQhsLvbhEIo/u/wW7dzFwDfnY7uwQLvv3B2lb8c2roTszdWcB+yxWwBQiLi3TBgOHNDWSh0GeAoZHNJSYjO36O3TH2p8pfGE3ebepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=756NZahArBvqwXdNq0dxxbzz7GU9H99mmF8CPKq/pxo=;
 b=zJAAdwoPJMSdstv4tO07NdamZt7drbb1KpNo4NyjHZTjHCc8kQGL8bpaVVUyON37sFfHERpRnFpANgklB9IBfcLTKVrxJwUeZONSUBwRgZcLei7oQP6L+XqqqCcvzlILGQQv5jKR314hMttQu91LStqstH2R3KMnen4mHBDYtyDjxjteuFgxdDdede3ezBYBsJiAXP1Nj8ycG6pBKqh5FQBIHlfwKB8Pp1j/y5L6+lGtgWWBj2pz1WAWnG5O8+VVswaMSTlXZEK0px+tSNRPu86nBArAO3db5A+FHhgMljStT5ZMNA0s5MVig0GVAHXGTvYi5Q7MUxc/CCspmskDiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=756NZahArBvqwXdNq0dxxbzz7GU9H99mmF8CPKq/pxo=;
 b=W9cgUsFmpv+hPSvnUXQ1L7ldBBbMPuyf5np/spvOqRltKzzpz/gqta/AySrenDkXQdqedUmbGhrIuliaromunvvaf2N0qxcYKi8RCPjNTZkLVIu+2IFLq2DmtbYeE/YuhlmOrqOcqipY2pu1XHzJlHJ5uaRVq0xCyXa7gas4tKY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d39f3b0f-45f7-43e6-a260-0f53f5b1515d@amd.com>
Date: Mon, 23 Feb 2026 15:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix memory leak in xenmem_add_to_physmap_one
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
References: <20260205125820.116555-1-michal.orzel@amd.com>
 <f9996237-760b-4be5-be90-e935ff71284e@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f9996237-760b-4be5-be90-e935ff71284e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5784b1-b3e4-4f8c-ce25-08de72e55b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmROTzVreTJkU2RDYWVlYzFxVmoyenZxQ25xOElteWhFR0VmSS9UejBqWUxO?=
 =?utf-8?B?QnNIRlB6WUJzSmg4RjFJZHVXWldHS3BFTEgyclprMnlrMFNMMTBxOHpDSENE?=
 =?utf-8?B?RmNtWW5sTEpGTmRSRXBaYi9ieHN0d1FPODZ6Zm9Ga1ZvZ2grVUppYkRDdlAz?=
 =?utf-8?B?OTlDUTluaFVXT3N0K1ZUWlVmZzc3SUFmS2dZZEZsRW0xMEdmUGRBZGcxTXl6?=
 =?utf-8?B?bnhlbDRYNVU0aU5tTEtIK3paMWpWR1dvaS9HYzBrVFFMTlNKM01hUzArN3Zv?=
 =?utf-8?B?Ry9ZellOZ0lGaXgvdkVUSVluVm4wdVpiSmNWVTkwZ3JLZXZRaTJoS3UvN2dm?=
 =?utf-8?B?ZUVTMHlCME5MekM3TVBYUmZOMEFVR1JmYnVXYnR0ZW9XL2luMGxteGRqQW1G?=
 =?utf-8?B?SmhpTnkwNVAwZjJRMFpUQnVVMldZajRsOGV4TmVBVGFUS0hwckMxbzlKeXJy?=
 =?utf-8?B?SVBLbUFYTXRsS0srcSs0Y0kvbXNUR0Z6S05ucEJXeUJlQnYrT0JMeG01NlhF?=
 =?utf-8?B?TEExWlArUkI0bHk5YXVaZmQzSUZqMjNDaHZsU3k3SnpGZGNaWFVWVUJrOUlM?=
 =?utf-8?B?Sk1PSUUzL0pKcXJlclgwdkx3MlZGZDdUV2VpUTQ4U0VxcXdLcmQrVGI4b3lx?=
 =?utf-8?B?YWpOT28zWjMyN3pZUktQZ1BzYStJUkhGK3haM1d0U1VBYTgvSDRaeTB1TW1s?=
 =?utf-8?B?UHAzL2RrMXJIZ2tpeUhGcnJEMU9ScVFrL3Q3Tmphc29PNkQraUh0Z3B2VTdt?=
 =?utf-8?B?K2xoYzIrbzhQU2pENElrdWE5eDNmMi9pZmpjZUt6M28xdmVxVUJXdTI1VU9C?=
 =?utf-8?B?SEZDd1JIUms4ZHNsaDZWL2V5S1BBVG5qcVdzNHR5TWtLUHY1Tzk1eXZCK3RI?=
 =?utf-8?B?U25KZGVZMGNUTWVDNXpXcUo1ZWErRkNJRlZoZzB6c1RNUEpnelhjWmMvR01V?=
 =?utf-8?B?Z1ZNMm54Tk5tYlBPZDNoRnFSbzRlVk1DMVlNbFd6ei9XZzdQNDdhMGdFOE5P?=
 =?utf-8?B?b00waGVHdVkrdGxSTUNpdUphengwZ01GaElKRFdHbU5NdFMyRFZ4MXAvMUM0?=
 =?utf-8?B?amRORDF1N2xEQmVMbmhGNzdYaXhnY3E2SmNiVEpKenhwSEhoSVJ3alAyUWQr?=
 =?utf-8?B?ekdyZU1YOXBxamNjOWNwMXNGbXZ3cU9mb1dSTWxZNHlqVXpqWXpha2xwMFdG?=
 =?utf-8?B?SGlSQys0cXFMV0xaU2kvQmhwVmpDdnE1d3o1emdrUGFVdFdza1VRSTZucTM1?=
 =?utf-8?B?UTVTMjlSYUlOM1dOSE9CbkcydzNuVDhUam1IN1g3bjZFdHFWUUlVcU5FNjZ0?=
 =?utf-8?B?QzY3eXZJUDdKU1k0VlhhdkJjT0M5cmhsTmFzSzFJOWpMUWVua0Vid1JVejhr?=
 =?utf-8?B?dmtoOHBiRnRhaEJEb2EwbDZXQlNKYTFsdlV2ajFJdktuUm10YTU5ZTJKeFBP?=
 =?utf-8?B?VWloeVlzbFVkMEhsYjlJN0c5NFgyblBkYVVvcW1oRVdvZkVNYy9KZFBnaENX?=
 =?utf-8?B?QlRGT29LVHh3QUxYL282Z2JKR1djNUwwdE9XbHFIVjY1QTgxZFJFQnNTcmdK?=
 =?utf-8?B?cGV5NkRqdjVOSFVrZ04zZ0pkelVtTnBaNE53M3Z3NHlQdWFIZzJzTCt5UUc1?=
 =?utf-8?B?YVRvcWNibE1SSlk2dlV3bEJ5VHIzYVR5cmVvY0RkV1RWa2l0QTA1eVBQUmUy?=
 =?utf-8?B?alp1eVpCMEdHQmYwbGRxbzd3UDkxb1E5Y0F1MUdpdDQ0YlI0RDZvVEZWREJt?=
 =?utf-8?B?bmF2cUhUV1JqeGdVTVBEMUs4eHYzZTFoWlYzbnV3Y1QySU9vUlJpbVMxNW90?=
 =?utf-8?B?T21PSmxpUExFMjU4Rmhnbkx4T3lEMXliOWxPTGFpb3FEeHlabmZRdXlnUXpT?=
 =?utf-8?B?SHBsdWNuL3ZHYnZIWXZRYS9jSzRNN1FiaHVidXJpL0R0cjBOVjIzZ3VDVTVU?=
 =?utf-8?B?aUNraUxEUU1WSDdCTUREbWtGbGJNczFFRS84dWpsTWlIUFBVNnVzUkNsUWFQ?=
 =?utf-8?B?Vm5QcG9Uak44bWRxWFRkSHkxeFd0UmZRTEJIVHdjUnlyTytLZlVwSWRGUFpO?=
 =?utf-8?B?K0phdnZpdnRrSkUxTDE2U0UzeDNGSGtyTHZGN1VSQ0t5THFaeVpzc2s5R0g3?=
 =?utf-8?B?Z2NBWFRSWUgxOUlyeTF3NG5XY3IwZGpYR2dZRzBaL0k4ZmpBZGV5b2RKV2pR?=
 =?utf-8?B?L01UUDhtYS8xbnZSQUFEdHMvZGx6eXJCUDI3RnFPL0ZnR2ZmQmo5YTd5Vmxo?=
 =?utf-8?B?VUkyNnVOb1Z2d1R1bWhHMGQ3UFN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EGPMJTGQX7ommCRhbeCN27/xYgiw/vRxCoK+Daekii5UCh9L2ik+olEOXokaxIVVbUz44fE1D6snGC3dFtUSnbKnGwv/sa4PABLdl5yOeKq1UQHMxztuT5d9d9/79JTkJejKB0/cyJrlyyOsi3rhtg/bXJlrhAdmtiA7BFE8qD4ftYW/SlUcG2/exOXKCcFwtEOa/R5MzrYnVcPaL9iR5yfOSfg5+lPX7JRb5EsiO5/Rb02zwYI2+HHMS2GB0Qx5iY1q43z+wobeaxcipDUI3QUq8oAcCoUuAdbtiJTZlvbEQd6cdb0smehK2rxPVMqkZ0G9deecNS/Chc9Q11pZshfHwNTH7EK7/0xu7ordxaPnjHCNS0QWDZJrgHmO2CmcmxIoa3QMU1GsDmW6mKkYtttecxHn37IqR0Yy1RI3AS8TlESYPP8nfBW9/l5rexff
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:10:54.1469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5784b1-b3e4-4f8c-ce25-08de72e55b87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Xenia.Ragiadakou@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 62E13177D09
X-Rspamd-Action: no action



On 21/02/2026 12:57, Julien Grall wrote:
> Hi Michal,
> 
> For the subject title and part of the code, "memory leak" tends to imply 
> the memory is lost forever and therefore can never be recovered. AFAIU, 
> in your case, the memory will be freed when the domain is destroyed. I 
> would suggest to clarify it so it doesn't sound like a security issue.
> 
> What about:
> 
> "xen/arm: mm: Release the old page reference in xenmem_add_to_physmap_one()"
Reads ok.

> 
> On 05/02/2026 12:58, Michal Orzel wrote:
>> When a guest maps pages via XENMEM_add_to_physmap to a GFN that already
>> has an existing mapping, the old page at that GFN was not being removed,
>> causing a memory leak. This affects all mapping spaces including
>> XENMAPSPACE_shared_info, XENMAPSPACE_grant_table, and
>> XENMAPSPACE_gmfn_foreign. The memory would be reclaimed on domain
>> destruction.
>>
>> Add logic to remove the previously mapped page before creating the new
>> mapping, matching the x86 implementation approach.
>>
>> Additionally, skip removal if the same MFN is being remapped.
> 
> Can you explain why we skip the removal but not the insertion in this case?
Hmm, I must have missed that the type is always fixed. In that case, we can skip
the insertion/removal.

> 
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> I'm not sure where to point the Fixes tag to.
>> ---
>>   xen/arch/arm/mm.c | 32 +++++++++++++++++++++++++++++---
>>   1 file changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 6df8b616e464..b9f1a493dcd7 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -166,10 +166,11 @@ int xenmem_add_to_physmap_one(
>>       unsigned long idx,
>>       gfn_t gfn)
>>   {
>> -    mfn_t mfn = INVALID_MFN;
>> +    mfn_t mfn = INVALID_MFN, mfn_old;
>>       int rc;
>>       p2m_type_t t;
>>       struct page_info *page = NULL;
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>   
>>       switch ( space )
>>       {
>> @@ -244,6 +245,33 @@ int xenmem_add_to_physmap_one(
>>           return -ENOSYS;
>>       }
>>   
>> +    /*
>> +     * Remove previously mapped page if it was present, to avoid leaking
>> +     * memory.
>> +     */
>> +    mfn_old = gfn_to_mfn(d, gfn);
> 
> I saw Jan mentionned the fact that we have two section with the P2M lock 
> taken. But isn't it in fact 3 sections as gfn_to_mfn(d, gfn) also take a 
> lock?
> 
> I am not against the idea of not solving the locking right now. But I 
> think it would at least be good to document it so this doesn't come as a 
> surprise.
I'll prepare a v2 with a comment and better explanation.

> 
>> +
>> +    if ( mfn_valid(mfn_old) )
>> +    {
>> +        if ( is_special_page(mfn_to_page(mfn_old)) )
>> +        {
>> +            /* Just unmap, don't free */
>> +            p2m_write_lock(p2m);
>> +            rc = p2m_set_entry(p2m, gfn, 1, INVALID_MFN,
>> +                               p2m_invalid, p2m->default_access);
>> +            p2m_write_unlock(p2m);
>> +            if ( rc )
>> +                return rc;
> 
> For here and the second "return" statement below. Above callers may have 
> taken a reference on the new page. So shouldn't we drop it like this is 
> done at the end of the function?
Yes, we should.

> 
>> +        }
>> +        else if ( !mfn_eq(mfn, mfn_old) )
>> +        {
>> +            /* Normal domain memory is freed, to avoid leaking memory */
> 
> Based on the thread with Jan, is this statement actually correct? Could 
> we reach this call with an MMIO (or event foreign mapping). In which 
> case, I am guessing we could fail? If so, is this the intended behavior 
> change?
I wanted to leave MMIO case for a separate change but I can try to fit it all
together.

Let's discuss on v2. I'll try to prepare it taking all the remarks into account.

~Michal



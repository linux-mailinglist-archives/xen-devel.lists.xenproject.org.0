Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFiaGyVrnWnhPwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:11:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C999F1844D0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 10:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239569.1540977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoRQ-0005hn-5R; Tue, 24 Feb 2026 09:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239569.1540977; Tue, 24 Feb 2026 09:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuoRQ-0005f3-0W; Tue, 24 Feb 2026 09:10:52 +0000
Received: by outflank-mailman (input) for mailman id 1239569;
 Tue, 24 Feb 2026 09:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A/i=A4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vuoRO-0005eQ-6l
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 09:10:50 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2545d27-1160-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 10:10:44 +0100 (CET)
Received: from MW4PR04CA0064.namprd04.prod.outlook.com (2603:10b6:303:6b::9)
 by CY8PR12MB7171.namprd12.prod.outlook.com (2603:10b6:930:5c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Tue, 24 Feb
 2026 09:10:39 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:303:6b:cafe::9e) by MW4PR04CA0064.outlook.office365.com
 (2603:10b6:303:6b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:10:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 24 Feb 2026 09:10:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 03:10:38 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 24 Feb 2026 03:10:37 -0600
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
X-Inumbo-ID: b2545d27-1160-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYp7OPJ7IAgZZLABcYKpguXUZvkbn6bsu6WLPxbaNP8sM8asy9ZI5RltTMUFQIUdwI1MGAiw/0MIZZ2cTY11feI0I84KRXeq9Igu0U6rA/To8L6tA4r8uCA35tEScUUHlNGaoLoqs6NsZfCJzEfl3HXocEngjKl0Mypn5npRUNP5J7/WoDgcVkyDY8OsdEEITgQ8BXXYun++Vb/a8bVT8xM1m9aQjpO5bV4noli1/APVQuIohYpcMmWdlS0+RbaJhFyKptfzXSxqjpPSVCM3vdmGfjLItc3vHhxqsPymTjZs5Qo7ERefjMgfkIsXieQntXthiEuFPH8U8wUB/JyAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIwRK5E90pY6ZFVP6iSXQ1JpCUqaEvUscBz2B+kHKNQ=;
 b=n4sqQkVMyNwzhkZ2eFUcMZREBUUm/xJAnid67GBS3G5de2oUuyPo9y80pRADxTwAtbkxv0UcP1LKBZQU+02dvjf34Pi6Sh1CyB/+VG4QpCJeYOlctx5DEMPjBrDVNTbUMhLh/RyZZ1yn9YZ8hKaFm/egspdyHvqIEPjOQk2ApfRNrYQ9jXiQFVGjIDNd8oXbv4bTQ+G4EpirZMeIcJf+OY1i5seUnIGR6TOhcd2bJkmDQR/kBltyFF9jZFCbeUBoZoJy0Ga37pYLzVZfUUCLTaLklUh3DSorl84rjFU3H0/VjKE4ryK/5P+20he0RJ3Y1xDb2SMmMbEWfQbLk/s3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIwRK5E90pY6ZFVP6iSXQ1JpCUqaEvUscBz2B+kHKNQ=;
 b=jgbSKsohiKeupE4g5sklSb+5PUw7fsQTxOqHVI20NjfOVdmEE0P8XmBNY+jJk1cM0IvgNgkmr2/HWC9kH+Odb4LkzW6WUPtoN5IufNsPCvElHHOT4oWWZ0QCcl+B09yTafTOeGivzpfPeRnQZ/U8xg7WBUZEqBmsUqVZl3QxSTg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <55537978-fc5a-435d-a199-3f78adf39161@amd.com>
Date: Tue, 24 Feb 2026 10:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: smccc: Preserve argument types in v1.1 SMC
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <0e2ba0af683fa5e53a3d2b4b625703751cf7ce54.1771228001.git.bertrand.marquis@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0e2ba0af683fa5e53a3d2b4b625703751cf7ce54.1771228001.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|CY8PR12MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 681e894c-7b58-4d20-3714-08de73849427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHd6a2pibmkyanU0Y044UGN3MTRaSlFOeU9GYnJOUHlieUhnL2lQalRDckJP?=
 =?utf-8?B?dGJLMTI1c0Q3Wm9nRmlUL3lRc1EyT1UrNzJlMktHNGxPTkRYL2Z4SWJhVGNH?=
 =?utf-8?B?d3k0c0xYVGQrNFhMb1MvdHJZNnpSeXUvODJaR0FDcThQNlAweDkxUzdnRjV6?=
 =?utf-8?B?a09ITkhkRjlPVVZRbzYxQ1FMdTJQQnFqMWRGVVlYU3hxaFBhZkVGWGN3T2F0?=
 =?utf-8?B?OFpFTlJObkoyS3VuUnRkMlJia2hHM0trS3U5Y3BBQzRnQlRZa2szR1F0anFY?=
 =?utf-8?B?d0JlY2wrVGtwNEIrUDdZNlAwMTVZVk1TMitBOGpmdlo4aHpEV3I3TTBpZTdu?=
 =?utf-8?B?ODZkd0tFMWU2NjVua2hGeUw3S1FvNEFGQTZrZk5YcTdIM0dxVWoyMGRlWjc3?=
 =?utf-8?B?eFk4TjZnc2VtZjR3bW1DcWt2Ry9NbGNRV1pmU2diUW9hZUk0V1RyVFJEOVdM?=
 =?utf-8?B?b0owb2ZWSHhhb1dYTFhBSTdsajgwUndwbGJwUDdCMVpvQTlETXg3RlFxMlpC?=
 =?utf-8?B?Mk12bzlncmIxcjhYMTZTeWpvekhHaWFqQXdONUhDUjF3SmduY2hTRGpzb21I?=
 =?utf-8?B?M1crQzFqM1h5c29Rb0IvVmlQZW4rUFJJUStENlhidlhxbW9GU0J5dUtYakNW?=
 =?utf-8?B?WUJOY1MwektFVmMxMFRNMEkwS2VndERlejJ5V1FhL3R6ampvRzByamVnVFB0?=
 =?utf-8?B?SkFKc2ZsRGlsb3IxRC9oOWFMNllvZzRhVTlraUVQd1BFWEF6N2EzN2VaSTVP?=
 =?utf-8?B?WmVDNnl0MkowQzhYcWo3ZGd6emNKeENLbCtnNTJsNURIK1lxRHJXeE1NTVhk?=
 =?utf-8?B?Tjd4Slg0KzgrSkovc2xJejlVZTBMNXJpZU9jWHNWOEJvUXdmYmhWaEtTSlp6?=
 =?utf-8?B?dkpyMjBRUUQwc2M4TjFUc1FqQVNBanVhaUtPMVBaWWN4TGxSUFJQSXkvVnVh?=
 =?utf-8?B?TlZWbFBmcU9hWnQ4RTdnMWI1N3lubjIwV2hvNmhxSjMyaDFaYU5wNytZM3NH?=
 =?utf-8?B?ckIyVTdIbmM2dDFrb0RwcFZTOXplOGRnTERUakh1ZlFQcUh0ZG9pOUlWWGpV?=
 =?utf-8?B?REpRME9nNlF4ZWZJTlFiQVVUTWpLSTJrQmoyNDBvOXV6bStkWWxSNm05bzI0?=
 =?utf-8?B?Z1lpL0I4VHBKOGR2bHNuNzVNNFdaakdXSFVRdlVKUDZHRHdadjd5RzhKT0NS?=
 =?utf-8?B?YUZ0R1QxTFA1OEJ3K3F1dHlBcGViK0oyVUxXbE9US3lBUGszeUhwNVBvTkJj?=
 =?utf-8?B?K2t4dmx4eEIzeDA1TWJ1VmpNUVNEcHVQZTN3bFJPVDh4NGJELzBnbFBGa2Jm?=
 =?utf-8?B?OU5HWG4vTVdyZGQ2WEpCeVVzSCtqRG9rOVNpVEFpcDdkaHphU3NaNk5TWWRq?=
 =?utf-8?B?dVhwb2x0bXV3UHBJbWdNQWtmemt6UFZHVkRGNXRJUkNGZTZtVC9EUVFVWHFC?=
 =?utf-8?B?Zk4wcXBZMVd5bjdSOW5VR0crOUlscitJZ1lZSHFpcUZ6elE3QUdSTjFqM1dE?=
 =?utf-8?B?VjkwVkRoUzNGTjlsTk5YWVlzWDM2UVM1VUdDSWZrTzNObE1qTnpiZlVBSkVB?=
 =?utf-8?B?Ynd0REdaUDFrckozWkl5cjhjNlQ2V3FvK1ZFdHpmN0RaV3orRVd2ZW9vTC9l?=
 =?utf-8?B?TG9Zb0MwOHh3M0VtaU93NDZRRVRYOFNaTFdtTUxLL3hTd3VSeVJaVWNSR2RQ?=
 =?utf-8?B?U2Y2OWFHYWYrSWx2Y1I1UndabTYrU3oxTEZSSzV6MXFBL0FlS1JKV21WM2FL?=
 =?utf-8?B?cndRSnZJUGJBMyt2NGJSVTZkazNYdko4NFBHcllYTzBJUTVpUVZGN25IUnpF?=
 =?utf-8?B?dkNoS0dwQ1BpNUJ5dzJERTEwOStkZXRxQjhyaUJPS3MxeHB6VFl5a0tlS0RY?=
 =?utf-8?B?ZHg3SVVkOXNBcUEwOFk1RFJUa2ZLZEY4WWxRNlVoMzFtTU85cTI0MGdKWmJu?=
 =?utf-8?B?c21hbTFPc0Z1ajlSYUlPa0wyYUdTaGpFVHRYckxlcHpEeGt3b3ZCMk5wK1Zq?=
 =?utf-8?B?T1dBSm9zYXlOOXVMTzV6SUFGbFBBTWxUZlY1c2t0R3lRczFTbmxlS2pHNEFk?=
 =?utf-8?B?aXZCTGdLOTQzMldyb253T09lU3BWeWdyaDk2Qk50S2RMbVZEK0VNRlVzaEpy?=
 =?utf-8?B?SjB4OXdLN3EyRmF3ZnMyNStvVEljTTFoMXpwRUV1L0lNTmVHTWJzZm1HcERR?=
 =?utf-8?B?SDkvTk9zL3VKSnFDM0NKZjBWS05LcHI2QVVhUmh3WHNBUVJpVm1jSDg5bWVV?=
 =?utf-8?B?S0FnU2VKaHFaU0FDc1R5RTVHMFN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/gUDc1YFqOzT6KVlCORA8pHgC7AyMPAIgQreet8oCl/oNWfEsPAFHBWJHt13sa5zHe/UNk4vkgub877GgKamrcVcaKUvSCS9nDMkkRICJ9JkN7ZNHyB0gypy16cnfgq/ReRgBbqtfw20COUSgsLVYk++FYW5oZMDVeoKcg3odbJvazWpZGzJAi7cgUntdsc6LfvgEn9xSb8WnV+Y7RKVAh7SMNPS7SRczhBH9gTcUuRbgZK1bhMXowxRbCZDoxXA/3BrDMZr3UU4K3gBkoNVTjvYq1ZQM0FGZsKZC/REOee89hPyOabZc4ZoAK+P7opw+PNpKHd2jyxauRGPcpk69ZeFFvu2wE2GjupW1tm42GMmn4TuieEIeXxfULdMW6LQWsc2IS1FemaqLB1QKW6ZHxG90Qlv1NIbMth+OZzl29kekpSGPkLgrHG84prQG8PI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:10:39.0825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 681e894c-7b58-4d20-3714-08de73849427
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7171
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C999F1844D0
X-Rspamd-Action: no action



On 16/02/2026 08:47, Bertrand Marquis wrote:
> The SMCCC v1.1 inline helper currently forces a1-a4 into
> unsigned long and uses in/out constraints for r0-r3. In
> contrast, a5-a7 are passed with their original types via
> read-only constraints. On arm64 this means a 32-bit signed
> value in a1-a4 is converted to a 64-bit unsigned value, while
> the same value in a5-a7 keeps its signed 32-bit form. For
> example, a negative int in a2 is widened to unsigned long, but
> a negative int in a5 is passed as a 32-bit signed value, so the
> SMC sees different encodings depending on argument position.
> 
> Switch the helper to use typed input registers arg0-arg7
> derived from the call arguments (keeping a0 cast to u32) and
> separate output registers r0-r3. This preserves argument types
> consistently across all positions. Argument evaluation order
> is unchanged, so we do not reintroduce the issue fixed in
> "e00dc325bd9e" ("xen/arm: smccc-1.1: Handle function result as
> parameters").
> 
> This also aligns Xen's SMCCC parameter handling with Linux's type-
> preserving behavior (same externally visible argument handling,
> independent implementation) to avoid surprising differences
> between a1-a4 and a5-a7.
> 
> Current callers (PSCI, SCMI, platform SMC pass-through, OP-TEE,
> and exynos5) pass unsigned values; exynos5 passes an int CPU id
> which should always be > 0.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



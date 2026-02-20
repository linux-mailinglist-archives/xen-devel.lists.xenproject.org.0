Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dxAVOoYTmWktQQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 21 Feb 2026 03:08:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC9016BCBC
	for <lists+xen-devel@lfdr.de>; Sat, 21 Feb 2026 03:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237814.1540021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtcOK-0005x6-QT; Sat, 21 Feb 2026 02:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237814.1540021; Sat, 21 Feb 2026 02:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtcOK-0005vi-MP; Sat, 21 Feb 2026 02:06:44 +0000
Received: by outflank-mailman (input) for mailman id 1237814;
 Sat, 21 Feb 2026 02:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5Ej=AZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vtcOJ-0005vJ-VO
 for xen-devel@lists.xenproject.org; Sat, 21 Feb 2026 02:06:44 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6196430-0ec9-11f1-9ccf-f158ae23cfc8;
 Sat, 21 Feb 2026 03:06:40 +0100 (CET)
Received: from BY5PR04CA0018.namprd04.prod.outlook.com (2603:10b6:a03:1d0::28)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 21 Feb
 2026 02:06:32 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::14) by BY5PR04CA0018.outlook.office365.com
 (2603:10b6:a03:1d0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.17 via Frontend Transport; Sat,
 21 Feb 2026 02:06:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Sat, 21 Feb 2026 02:06:32 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Feb
 2026 20:06:30 -0600
Received: from [172.24.149.13] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 20 Feb 2026 20:06:30 -0600
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
X-Inumbo-ID: f6196430-0ec9-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8KTUQdCDTk+Wq56rvICn9Dq4hAjlr+TNkkwtJlCA3Ei7s3EYdjZ5Sn+fXRfZheTEnVVYS2TT+l9PpgaM5q6Ne8huU42YPqdxBEHF/dJKbFMrl18gepshNJg3hNzfECVdzUxWpVI4Cc6mU19m6oWWntrPVPRH4Pf/XJ2sIhEfAR0clfVw8u2R4MxbzdYl1bAWzqLr53famhM/NmNaBS/xV84tZG5xlVio37Rw/yQNgRTFK7PsCJWghWeUGCc0adJnostQAAi5pzgeRT9r4IbW01+sabCLKIy9m99cnzetNWaLI4afDLm8IG5daLh9xWEAIlSeKk3qJc7Uoa0GIb2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMVkQW/g1vf/54tsJu16Zdri07MuBcunTO+snDXFCfk=;
 b=YGXHjysH/nVM/WGHBtJBWnCCoI23UnC1XIe2HDYoH/Ymh4jzkrhf/Jl+P3Xxf5TcOH90Sf8X66aN0cWMaiowq28ZZr5E60SN2KSXqiepMD+UYkbxyu7m/eO9q7rvlbL/AnFDcFKnx348Dj5iqDWQlzW1eK4dP6DaN7NJ8NtEJDHT8v5eJmvljIpmw1JxdfQzWheuZCde3+yxzp6rPJ7gH1DVNL3dYF7yoLlf0TnSD/aJXWTxuI1GCv7pUuKmiOV62ZVQz8xL7l5neZALnsvcqFl2oC/9v5MqM5TzxsEKMJH6SdhoI4Qvhz2P6+kPpW3+RyiJLi+DeKsc8YWvxATl1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMVkQW/g1vf/54tsJu16Zdri07MuBcunTO+snDXFCfk=;
 b=aGUAbBZuhH07TahSpD9IrcmCA5yb4Ia60SD7Ll/dYknW/zfydlo5MMQVczsjd8CWcWW/SNOBGCza4pgcInymDQlRdgfvHU2tRUiVrmzr4FKX4P22NNkEamhaeQCHV8uCLpRZF3UCSj0u0OA5mNZSyDk8Q9HtmN4plF4uZ1xoMHg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <73dc93bb-210e-4de4-8401-313595f11c96@amd.com>
Date: Fri, 20 Feb 2026 17:51:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE: restore CPU vendor reporting to the outside
 world
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <561865f9-cd0f-40c9-86b8-98a3ac070b65@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <561865f9-cd0f-40c9-86b8-98a3ac070b65@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: bea8cbcb-3bda-4499-2d29-08de70edd553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWZTK3J5cXZ5M2t2THkydWVocDlwUDl3TzczNVlkbm93SzNQdGR4QXgwbER4?=
 =?utf-8?B?R2E0QnBiY0EyUE84WkVyNXFSdHZpK3JhRFdWZVczT29HOUw1RVNYb1B5aFlv?=
 =?utf-8?B?ZHowR01Dc3lKeWZ3QTI0dlZBOUNoaGFEaDhTTXROMEI0dnFLcmd6VGtZSDFi?=
 =?utf-8?B?S0o5bHVxZk1Vck5JV1RONUsrZXAyOHVQMStEcFYydXRydjQyN05QUmViSWQw?=
 =?utf-8?B?YzNsMVloWUtIMXFCemMxcTduNnV0bVBHbkNCY2pCdm9nR3lnaWIxVEMrNWwv?=
 =?utf-8?B?ZDJVdXl6UGN3OWJUM2o3emVJTXZRZmxlbDNjOGdkZnhZd2ZVdkFkdnRtanZz?=
 =?utf-8?B?YXdaMHBIdlBxcUVYblppZGU4bmpNeFZtZHZLYVBFNUlDY0NuUDVubEVDdFVi?=
 =?utf-8?B?TVM4QVl0cTdzTkhoTnFmU1dndytqTW54YTNrcXF5RTJQV3l1Mlp0UUU2ZjF3?=
 =?utf-8?B?UEpxbzM3MXZwck5KZW0vWmxpckdPMWhnamVLTU85SytDYUZQS0JXNE80WkF0?=
 =?utf-8?B?dEhjcGFXRjBQV21uc1RMdFRrT2dwOHJYQkF2MzBRd2ZBak00VFhLRkQzR1Aw?=
 =?utf-8?B?d3VvV1pRUW4rbWFXYlR1VDRLUFZKWS9OQllSWkVKeUhPczkzR2k5czIvQjhN?=
 =?utf-8?B?UEZLYVZsU1BGUVAwZjZ5QnB5Y2wzOFF4SW1qVWpsb0tvNlduZTg5UGxYNmMx?=
 =?utf-8?B?Yk91MUtZUjZRT2RnU2hWNHJYcjNvb0hTamRiUWI1RmhwcGR5Rkw1Z2VHeDNV?=
 =?utf-8?B?NTFDb1hUVkpqTXVja3JVTGxWOU9EcEpwam9ZZ2NuZ1k1VUxmNXZkWjNJUXEz?=
 =?utf-8?B?Mnk3bzJ2OG9KY3pxUGp1NHF0aVhkeHFaZTFwV0Vnck0zbWZkRFRuY3JLMmNj?=
 =?utf-8?B?S3dZZkIxZUx5ZlE0U1pXb2hPNEJsVVM2UzV6SkFHdWFYNFVOZmtqZ1ltbERC?=
 =?utf-8?B?L0p6dGZqdHA0Q1I4NWQxdW9FM2E0cDA5dVIzL2RJME1KRk9uUnNQL0NmQVF4?=
 =?utf-8?B?T3ZaQnBDdkxiejFmVjgzUDhrMXUyckszZ3g1N1ZJZ2pSU1pKUDYwRng1UnB1?=
 =?utf-8?B?VU5iNlpZTkxubXFqSGNRbFRpNGxpeHA1ckRmdFVJd00zakhTa0ZoRmNtQW1s?=
 =?utf-8?B?WWN6cnltcGtTZEplTVIzZnltQVJZSFhNd2dUNzFYSFV2OU9zclkzMTdKckp3?=
 =?utf-8?B?QWwzdFE0a2FLakU4ZXJiZjBGdFc3T0xUUVJEVTFES2h2b3BZUmc0M3ROZFBm?=
 =?utf-8?B?TWp6bWRqZXdDdGF0RFZDR0lyUHdtcUtrbTVjQ08yMlV1QzA3MU5ydEkxbHVZ?=
 =?utf-8?B?c2pobUFMOVZqdUJrYWRZdEpBRHVscFBSa0NYc3FLTWV0VDl0YmVKMXhicVVC?=
 =?utf-8?B?RUl3QjRrV2Z0RG9FditMRjRPUnJjRWxkVFFtT2dMUGoxRE5uWU1hWWxTUHFr?=
 =?utf-8?B?SG93VE1JWDIrM1B2UU90WGRCbE92OGx3LzZnUERRU1pwQ2JYM2I3clRxVnJh?=
 =?utf-8?B?RzZaQ0dnQ1h3WkVMRzRkKy9obUNHbVhOcFN6cC9wTTJEZWxlRjJySWN3eUxM?=
 =?utf-8?B?MnZ1OUg3TzFmSStSY21wV0NJNC9uOGFycXhMUFgva2tpYmRDMHJlNU5FU2d0?=
 =?utf-8?B?N3Q1SllESFpCZ3Z4NU83OUllY2NDbWxZREN0WXRoRUpTT051ZzV2K0drZDVj?=
 =?utf-8?B?V0luM1BPYW1ENlU5RWlUMTZSRGErVWFMUUl3a1R0ZDVoc091THBtYWpjRnk2?=
 =?utf-8?B?V0tCWm92RGRLN1o1c09ueTNXUkpyMmRKdnBaVDVTaTM5Nk95S2dsSi9tcXVM?=
 =?utf-8?B?NVVySVlBQ1BpRnlYRWwwdVF1OGt1a0tXSlNjUWNsWFcxZjNCb1BXRUpXd1VK?=
 =?utf-8?B?azJRRGJNNE5rdnhJZ1FMdDU0MEs5SmJLb0RxOFo2Nlc3Sncyam1oWUx6OWdD?=
 =?utf-8?B?aGN1akJmZm5zb2dCcXBjM0JXV00zS0puQWdqRkYvekpJY0l4VThFNlVXOHNR?=
 =?utf-8?B?T3Vwa3RjQjczNWEzNmF4Um41dTBKV2lTSjhua1Q4YTdpUUttT2gzUTB0Y21o?=
 =?utf-8?B?V0xVb3RZZjl1clUya05DZmtpQXRHSmswV2JkLzRPZG5qa0p1SnlqWjk5QTJU?=
 =?utf-8?B?dnJUSlhrdlhST2VBSzdOay9ndGQxdmxSNXNhbFpsM2ttcHNPMVljc2RuSUhk?=
 =?utf-8?B?ZDVJTnplOXRXZkpZVHdqR2Zqb0tYc2dYS0NXSXZCREEwbHNQeEJqbTNwajB5?=
 =?utf-8?B?anhldTNjVDBPSGVUOEV2S0FFeTFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PpCVcIp7D+mGl/T9fsvF3Qn0JK1LK02JSrC+RyzhZ2RG+82Jqq7FDE37riW5t1hko3VAsbXqHGjTqXU1AnZsesZqDJdkPq50pYu7K3E6zQGABA8F782i7Ds/bYm8wYzJOvAa+U1ZdlSrOWpcNqneOVU0MSmeaikFaxk+p1K2UUHw5MRnix+uLMR6wRK0Ms6O/pUVCH7esKFaUScmvsd+VhBbGZsfLrQEy9oeSXzdc7uemCi4pgvaCG3VwhXFFmyCvvj6bRXtZDconf1ZmLOUm3ycslemhTM6Nge8hdyXKuZTm4vBsVNBfN2KzKXbEira/hmEXXvsAZkGrWoDiwAg1W8PE+xp/YoGzmSKUgcKkEq+++M5D6FgRuiyGeENXAvQozDB19cMiKfaQVMVpeqXc9C1vMh0f069j+x5Ptlt7iB7xVjRU/I/bl2LOdnEEObe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:06:32.0970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bea8cbcb-3bda-4499-2d29-08de70edd553
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 3BC9016BCBC
X-Rspamd-Action: no action

On 2026-02-16 06:56, Jan Beulich wrote:
> The records reported used to contain Linux enumerators. We first broke
> that connection when purging unused ones, and then again when switching to
> the bit mask forms.
> 
> Fixes: 408413051144 ("x86/cpu: Drop unused X86_VENDOR_* values")
> Fixes: 0cd074144cbb ("x86/cpu: Renumber X86_VENDOR_* to form a bitmap")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


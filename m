Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667759B0680
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 16:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.826064.1240408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Ll5-0005Jl-Vm; Fri, 25 Oct 2024 14:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826064.1240408; Fri, 25 Oct 2024 14:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Ll5-0005Hj-SP; Fri, 25 Oct 2024 14:57:47 +0000
Received: by outflank-mailman (input) for mailman id 826064;
 Fri, 25 Oct 2024 14:57:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jrJ=RV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t4Ll4-0005Hd-O9
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 14:57:46 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2415::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ca60bfb-92e1-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 16:57:44 +0200 (CEST)
Received: from BL1PR13CA0174.namprd13.prod.outlook.com (2603:10b6:208:2bd::29)
 by PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 14:57:40 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::aa) by BL1PR13CA0174.outlook.office365.com
 (2603:10b6:208:2bd::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.9 via Frontend
 Transport; Fri, 25 Oct 2024 14:57:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 14:57:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 09:57:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 09:57:38 -0500
Received: from [172.26.85.121] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Oct 2024 09:57:38 -0500
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
X-Inumbo-ID: 7ca60bfb-92e1-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahuwk3ZieauClX9fR5aOupq5BmFz/rySETv/nwHI2sna2pNcLWIB+Q6YOP/2p5sn/jc5mcrxbqZdbbc4kUYFw8eFgKuKv9TgkJRjIAu52YyVUrKlvlZt/N/HrGfnN3JqnkJBGf+QI9ebg8tqyxaxC6b5DkarspHR4BswNOSn33u0QS67c9IQ8z93NaQPUNhzqKX3JSvgk1GQ6iRtDymAaAKr90NjfD12HsXMI3h649Xw7DkXL/72u4tQPKK6Tk9VZKO2r2Ar9bjVT77t5ZEitzjaQUMCR5aGoeLayrW6YGWZ7Xl5mphXDQIXg0h2cLzJsLXxUp9T1pillQo7c0mIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLyMYn52sPfZNm0Dj4m+aGP4ZfMxUsqGK4QAWI0VqxI=;
 b=pdxvvz6ao2NUYLbEtmcjVAFSMi+OYGIQCJsLu6IFJjzDvh4Jvz4OYAYlcnO4zZIba+9gJUt7XgJPwAQJd5OVRv4rJOdxnQdKSt3gbh2WsvfYWlysNjdrB41hnerBR97RYiFHgJ1f9UIKQ6kPToebWNNeRCRWxEpePhQIR9gSBEPf26qus9OAH813cpRnTIs/cPwgFgX0J2oQc519nJ7rgFkiMsbwDUa4PVq8E6YyII9unCm5bXASR3KJ/lvnQsQPim7iZ9YOwrLIwGCqUSHLS0NePz2mDkZd3eMn/sZFMRBUZcrfb94bl2IETXuCO1tg9RL7xT6LkJUdGI9laJBt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLyMYn52sPfZNm0Dj4m+aGP4ZfMxUsqGK4QAWI0VqxI=;
 b=p5tH2Jv37a3MtRGandrPsEKIfIyZ0zRGLwIMasDQCk9aa/RnDUj0v1kkq0buSrmlX6o8M1WUceauO9Q/XZ65nS6B2vgmMsFmupqGuC4cHfxgN3BI/fhHvQjhBlB/FxtJZw0Aqj2dKQups/E4/Af4DGOxmzQ1kYCyLKDR2WIebT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9c38195b-400c-47f9-862d-a98be814cb9e@amd.com>
Date: Fri, 25 Oct 2024 10:57:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/ucode: Rename hypercall-context functions
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
 <20241024132205.987042-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241024132205.987042-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|PH7PR12MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 01aee780-b02c-48b3-c942-08dcf5055ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzFsdXRhSEhYN0JLT21FOGZURVBhV2dhSjdLMitqU1orMituL0RiaEJiczdF?=
 =?utf-8?B?S3E1c0xoTUFYN2tLUVhsVmtxYnlESno3WmI4UnFlYUlnM29tN1NNdXdiajRh?=
 =?utf-8?B?RnlQMnBKd1k0ZDFmc0VXTS9CbXpCRmRvcjJTelN1THRJN2pTZ3hGSE92bUdE?=
 =?utf-8?B?ODFxdzBTRXpNSllWSlR0NDlVZThSbjRRd2Fnbm5ldTQ2V045K3VGY0JVV3hJ?=
 =?utf-8?B?Tm8zdGxHR1d0aUNmaWIvS0MvSXFDWUdRam14TGNLU1hUZ1JzZmJxYVp4bi9G?=
 =?utf-8?B?b2w2T2NZdW1oTFduUUZqQXF0eXFsVXlPZnJYakJpcVIrTDhNSk8vcTY5bXhN?=
 =?utf-8?B?R1hYMzVlK25LcjAvNjNNU1JkNXMvWStFbWMrM2dlb2hweHljZDJEVmd5NjBv?=
 =?utf-8?B?SEtaWmU0OUY5WXVIRlJXZTZRQ2hmMU1Ea3hWaVh4YkZzczI0N29aeitWM0Zl?=
 =?utf-8?B?ZTYvOVlYNmpSUm01Rlpyd05OYkh2cUFNRVREOTNzY1g2QlBuM3lZY2JIek5S?=
 =?utf-8?B?UmdlWjZuZnhoQ0hWRDFTNkkyajAxRi8yczQwNnhkeU1hTjEzc0NJdHJONmpJ?=
 =?utf-8?B?NzJ4ZHFjR29LNmF6OVJFSytOQVQvaHMrYXc3R0d1MHJEZWJMcXZuZDBPTEFW?=
 =?utf-8?B?amVucHNDQXdVTWNwclhMSWt2NGxEZG5NQ2VySUNUMzNFUUxpMm4zQ243c3lx?=
 =?utf-8?B?MDJDd295U1VjS3o0N3ByMUU5dXVuYnB1N0VTZUliTTVLcVRZemp3VUFhM3hV?=
 =?utf-8?B?SnZHWWZyTVVDMTFJYVF0VFY4azkzQTF5N0dlOGUvUzhiU0hTak9YeDdjN3pE?=
 =?utf-8?B?RXdEdzloYzZlNUgyMjZnb2UxSXpPU0JSdTcydDhsMW1iWEpmZzRTaEhZZmhk?=
 =?utf-8?B?UzdxNXZFN2ZPSVZqdjkvM1g1ZEFrUFdFamFteVoyRVRXTk5QRGs2Tm5mWjhW?=
 =?utf-8?B?aHBDNy83TVZzem5WQVNmdWhxL0tjbHpkOGdjWE52eXZMSXc0Z0JkUEtFRUtE?=
 =?utf-8?B?ZGpITEIyQVE2N2FQemxmNFpqckhUcGphcFVpYnlmU0IvQVJUbTZZRGRCdkpC?=
 =?utf-8?B?NllmbERNYWhDSTl2dnBWblRDRi9ZM3k0N2FvWE5ldEhTWHdJZVZqdUlKSTlP?=
 =?utf-8?B?cHdzT255a1hiUnpLeXFHejJMWGNHWE1wTm5rWE1yeVVZSExGWjlpWkR3dTEx?=
 =?utf-8?B?aVd5TWdnNGZtbmZ2cVgybTM3K2x1VlpJNDhuQ2wvTU9LamhwY0pjYkJQNGJj?=
 =?utf-8?B?NHBhOWJkbElocGVyUEhRTDEvU0x4c1ZIbjVDcjNBSDRsWmUvd2VkZWo0K0JO?=
 =?utf-8?B?ZmNjUldiSzlDdDhoTE96QXRhcGo5dXVSRFpNWVhCallLWnFlMmloYXVRQTZv?=
 =?utf-8?B?NTd3TXVyN1I4ZTIzVitnUmpuVzYxWWlYaGhQQUtqM1NMZjBybjRMaWNmT05m?=
 =?utf-8?B?UHo5L1poWUNsa2Iyb0FZN3JxR08ybnc0L04rUUhLcWdnZUhUd1ZMQ2F4bHNu?=
 =?utf-8?B?Z2RMRThiN0VLcmNLcGd2c3o4dG13NEhpbFh5QTkrdUN5RENYNmZFZHdFQ0Ns?=
 =?utf-8?B?bDBKazl6QXoxVk05aC9GMUpmdmtURkJOUy9FTnlMNGNiR0lPY3o1S0xOZGg0?=
 =?utf-8?B?aTBkMVlrWGZObDlRZGVNSW51cXBlUEN3UmtsUVFUdzBNWWFhVzlWRWh2N2RE?=
 =?utf-8?B?d2JmY2hsa01rWXNpTnR5emlGTTBxaS90OVhYbm4xUGRFbGxPb05UNXh2eUVQ?=
 =?utf-8?B?Y0xEdHMra0tWY2kybEFqdmhLMks2UGc5ZFFTdEQyeG9ZVkZDdklZWHErYWxi?=
 =?utf-8?B?Mld0WWg1WnBLOW5BNVZGRm5sckZMNzI4aXNVeks3cDhpSTU2b3V6elU3N0VC?=
 =?utf-8?B?K2lJclBGYjRjeTVMZzRqVmVJMng5d1FJS0dGRVNsZHJHcVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 14:57:39.4639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01aee780-b02c-48b3-c942-08dcf5055ee1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9076

On 2024-10-24 09:22, Andrew Cooper wrote:
> microcode_update{,_helper}() are overly generic names in a file that has
> multiple update routines and helper functions contexts.
> 
> Rename microcode_update() to ucode_update_hcall() so it explicitly identifies
> itself as hypercall context, and rename microcode_update_helper() to
> ucode_update_hcall_cont() to make it clear it is in continuation context.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


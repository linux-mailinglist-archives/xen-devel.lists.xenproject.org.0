Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44881C5FBFD
	for <lists+xen-devel@lfdr.de>; Sat, 15 Nov 2025 01:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162898.1490367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vK4Jv-0006b7-HY; Sat, 15 Nov 2025 00:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162898.1490367; Sat, 15 Nov 2025 00:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vK4Jv-0006Yo-DP; Sat, 15 Nov 2025 00:39:15 +0000
Received: by outflank-mailman (input) for mailman id 1162898;
 Sat, 15 Nov 2025 00:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oktg=5X=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vK4Jt-0006Yi-0q
 for xen-devel@lists.xenproject.org; Sat, 15 Nov 2025 00:39:13 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e902bf0-c1bb-11f0-980a-7dc792cee155;
 Sat, 15 Nov 2025 01:39:09 +0100 (CET)
Received: from PH7P220CA0104.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::26)
 by LV2PR12MB5967.namprd12.prod.outlook.com (2603:10b6:408:170::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:39:02 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:510:32d:cafe::40) by PH7P220CA0104.outlook.office365.com
 (2603:10b6:510:32d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:39:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Sat, 15 Nov 2025 00:39:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 14 Nov
 2025 16:39:00 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Nov
 2025 18:39:00 -0600
Received: from [172.28.100.6] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 14 Nov 2025 16:38:59 -0800
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
X-Inumbo-ID: 7e902bf0-c1bb-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTY35LWkMYKq0EgktfczgZ6ogN3Zn5vXVCvgJVaaoqs2xIYA/qny/DDSwh9FrpKqaEhtGam9kTN4WT+DlAyCUn6re+hHoJba8oQeIPi48Y8Db1jklbBWs0gAVIR7TZ2kiqEBRzm1YfoTrXfD5CbfYeIZ5AeLy+h3ckIbY82bmNIFMCx5IecDfSPac5yIgNW15ZJkzt+PIdK8JimLD1PgvnemXiL7QlKTXqlmOEyYSwcYICMr9l60sw23b/yqZ9ItnfsfUASdV//VSPbBvA97F4257x6pJYHzAztxQGEgXM53tbYje3O+njoCFtXuN66NJ0+IUbhlr6JzayJXHMdtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QrBhMJvFc9AU5l8tuxzY/KBXfv9uFBDoGcf0mObcf4=;
 b=UFim9dZfctSMk5h1+5ZvibKoGkW4nIrAn7It+6JgJHxIF7Bpt0I/JSVx1ZHD2QO/0dhxQd37q6IIel7tlug07nC69vO7qfz6W5Wn8KgHf3NTVcn5tmpV/TSofmRUqjwLw6bQTTkQRgbjQ+TLC1L1q36pAk4nD11Cdz0fBj+0ZCNXauMlMMF9xB+Y/TCK6LHtr0sQmRncLeyHqfaE/pLJRuUP3U3Q2J0hn2USgvu56IcqEO9hfyMhiORgJJnjebtKPNPJquWL/pokc2ajE+ISGSFnayng6eXTSBp483BOG2R18mD6D5Lrg3khuUsRIfk7ZS1aHzlYjMIQbHhAeL0sig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QrBhMJvFc9AU5l8tuxzY/KBXfv9uFBDoGcf0mObcf4=;
 b=e3296XobzMhaoJ0MnmhwxZS1g2UY6lE/w85uVfsnZIAbUNTSHdQK9JEVUBJq3UOow7qE2E5qyk09MLJ3y1Xv9R3RJ7mVYqA7zLBxJsYvE6fIKPSxmZ5aGAbMZ7sUB8R0u0a4yOJGOpLONl0jzxldO2fjLB8egR5I83NtlcmYG7g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a34a7aa7-53da-4925-8428-cc20e1135f7f@amd.com>
Date: Fri, 14 Nov 2025 18:21:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/paging: replace !paging_mode_hap() with
 paging_mode_shadow()
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20251114144454.287224-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251114144454.287224-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|LV2PR12MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: b28aea71-c1f9-4a94-4bc3-08de23df5f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFpONVFQTVVEMVFpMkZWM283V0VFenNhaHhvZmQyVlprSWEyVUovNXExKzhD?=
 =?utf-8?B?SmZvbzI5blhOWm9uNVF6Q1RDMlE0c2hOTDhmbElGT0l3VU13NG5zUTcvMzFs?=
 =?utf-8?B?R2xGRnNtaHYxWE1rbjJRQnJac21jd3FEdDlCRm96SGZWQnlDOFEyZXhTeVBE?=
 =?utf-8?B?SkhsVXNlbzF4YjY0VHF2eWJXYjE5NFVQUFdDRTBXenZadnFjUHNOVjJRQ2U2?=
 =?utf-8?B?VWdQMytnK2xGSzQ5Y2VoQnptYm02OFdWU3RUYUxkMjM4ZFQrd1UvQkRtcXZa?=
 =?utf-8?B?a2E5NHBZcHdDVEtuWEJ4ckxHTmQ5K3JMRDg5ZUxVQ3ltZDQ4YmU5d3FwanRj?=
 =?utf-8?B?RERKVEc2SVczWXhNSVd2UFhYeGtoZm5WdXJXa1hlZnFPMnhTdzBQSEJrRmhT?=
 =?utf-8?B?THlkSEpPQUQyYTU3b0xhTk02Mk9TWWFUSEUwcUdBS05NbUFaR09KeXlybkt3?=
 =?utf-8?B?WVRyOS8waXc2SFI3SjdMdWRkMGIxR0tKcml6MmExYVlSTUROYlZTdVJXaUw3?=
 =?utf-8?B?YTNKOWdIOERCM1JZQm1ta3duT3prYmwxSUVrTWhqUXJ0RTBOdDVFMUVHWnVx?=
 =?utf-8?B?R01sTVRZUkFQNVJ6RnBnRE02WmRWOVR4MzZUVHVSSlZzN3ltYlV6VHpUZ09U?=
 =?utf-8?B?OUFEWVdmMnVOTEQ3dHhnL1o3M2g3WG5ZT0lTemxYU1BuZVphUG5YNFc1UFJK?=
 =?utf-8?B?YUVxdGhSVlQ0WDJ2VDFEVCtza2dVL1lhQUlic1NqR1lpaGNCWHE4R0xBUnFO?=
 =?utf-8?B?VGYwSC8zSjZHRE9jMlQ4SUp4SEp0NlFsMkJtYVJNTEFxT1FIenZtMUdZcjJy?=
 =?utf-8?B?US9lWnp0QXlUaG04REpMYlM5cWdkYTZsSFg4eEpNNjNoMTQ0R1JNbEt2MFk2?=
 =?utf-8?B?eGtHQ2RtWHVVOEJiL0FMOEhVb0ozTkxSTHdzZ3JBQ2o2SEh3U0VzTU9MOXBU?=
 =?utf-8?B?UjFnc2R6ZXpLTUpWejdKaU5nUGR5dlMrN2k3SHpBSkVuRUt6S3VTdW9OTU5Y?=
 =?utf-8?B?blU5Z0t6N2hjZkRKU3AzYU85Sm1zZ1V5OTFMdllXOUxJdk1FeGJuS3NLcjhK?=
 =?utf-8?B?a0w1T0oxU1BBdlpXSzhXL0FZdG5aOEtoMXRtV2U2YnFlK3d5aGlHNUFsV1p2?=
 =?utf-8?B?SXd5a2xRSUxMZ0ZPamllYkdCM3lLcTlCdkVXVjZ0djF3MmFnRHZwOElmQ01E?=
 =?utf-8?B?WWV5RWtxeG5JNjNPSXRXSEhUeGVpQVdtaWw2Rk9qQUJtdzBuNGNIOVdPL2F0?=
 =?utf-8?B?VlhvUHRQTmUwSHU2NFk1SjE4MFhXWTYrS1NXSE85c1Q0ZWk2aEo4SHQycllG?=
 =?utf-8?B?UHdlTU5pMEI4Sm9BSmpoUGZOQzByWWZQNHBjcWRzbWRuOGZmZXdFZUROcUk0?=
 =?utf-8?B?VW93SldWZms4QTZ4RjdibjdTNEJ2c3VsVCtTN04rc2Rpc2ltaGlqY2lUbldp?=
 =?utf-8?B?dXNoTjN4VWluNmFuZlRkcHBDaDdFcmk5dC9yYlZZNjdwdlFHV2tyZkEvVHhW?=
 =?utf-8?B?YzYycU1NeTBzbE1GRG0zMGNGUU1pLzJjYUpTTzc0b2hOTys4d2hTSW9ISW9O?=
 =?utf-8?B?TklPTjdGd3BMQUdWQkFubE8wNXRYUnYrUkVkdEtBVkM4QWdKN2svTm05TTN2?=
 =?utf-8?B?R25mOERvcW1YMXM3SzN4ZnA0RGZ0K0F3SmhZVHcvK2RMYTBTeU1LZWdodFRC?=
 =?utf-8?B?eTFhc0tuL1hvM0lDMDh5ekc4dXBrOVhCTTl1RHdJS0srTHN0OXVHTVZTNVlx?=
 =?utf-8?B?dHZrR0QzUm5aTFZlUWlLaEwrRFYya05Ib2RZZTRPSDdnN0hEakpScnJTVVVJ?=
 =?utf-8?B?Y1FzYzhiclJGUlVOVmFNRy9zcXorak8wWE1xWGFKM29FbXdYZEFwekNheFNn?=
 =?utf-8?B?Q0hUYWNOSnU3eGlKczR5WGttNWNaZ2k5bGJKSHFEQy9wZUltdDFYN3luYnVa?=
 =?utf-8?B?MEdsUGNlWW4xWGN4ZDdWSlU3dXQzbmt0Qk16c09OeTI1b1kvWnJGTGpnS2VL?=
 =?utf-8?B?cTR3SldsWXBJb201R3RoZFR3YmNuZkZYakdJMURLNFU2R1o5MHdFWXlXSFdn?=
 =?utf-8?B?d0N3WXZNMlVGbFRYMEFGZElsR1ZFZW5vZzhBVCsxNXZnMUZBVFoxNjdER3RB?=
 =?utf-8?Q?3vlH5sHA6zORmnKpJcpChawAF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:39:01.3204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b28aea71-c1f9-4a94-4bc3-08de23df5f2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5967

On 2025-11-14 09:44, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Now Xen supports only two paging modes: HAP and SHADOW, so
> !paging_mode_hap() is actually means paging_mode_shadow().
> 
> For an abstract, future case of there being a 3rd paging mode it is also
> better to explicitly mention checked paging mode (SHADOW) instead of using
> negative check of another paging mode (HAP).
> 
> Hence, s/!paging_mode_hap()/paging_mode_shadow() which also allows DCE drop
> unused code when SHADOW_PAGING=n.
> The !paging_mode_hap() in hap.c not changed as HAP is checking for itself
> to be enabled.
> 
> Inspired by [1].
> 
> [1] https://patchwork.kernel.org/project/xen-devel/patch/20251111200958.3576341-3-grygorii_strashko@epam.com/
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


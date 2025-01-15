Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430C1A12E5A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 23:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873173.1284150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYC2n-0004bX-Jm; Wed, 15 Jan 2025 22:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873173.1284150; Wed, 15 Jan 2025 22:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYC2n-0004Zq-H3; Wed, 15 Jan 2025 22:39:25 +0000
Received: by outflank-mailman (input) for mailman id 873173;
 Wed, 15 Jan 2025 22:39:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZO=UH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tYC2l-0004Zk-KT
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 22:39:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2413::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f456c6f-d391-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 23:39:21 +0100 (CET)
Received: from DM6PR11CA0054.namprd11.prod.outlook.com (2603:10b6:5:14c::31)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 22:39:17 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:14c:cafe::50) by DM6PR11CA0054.outlook.office365.com
 (2603:10b6:5:14c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 22:39:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 22:39:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 16:39:16 -0600
Received: from [172.27.3.102] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 16:39:15 -0600
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
X-Inumbo-ID: 8f456c6f-d391-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4KC35UOV7Yz71w8Rkohp2rhCHRH+ERCdutMsqT0ukp6b7dJ8jYqLVLWbCauAdjlYiymlKGdENe9YNHoApIiXYbFU7J3Tf7m5gGCB7sxXt3F+gNJU3ABccl43Ypi1uTAGDh2ExpYpFlHk7ZkkNTpbqpAqt5korZi1EwVSxOm+ukryDo4tNUGmA7jCDvzKkX+8UuCKCu9Dv1KpRKQwvj+KKh9tOsFKyHnGlMOffY3HzPe2i08hPeuYlKa5QxrAjsH107vyrkhnFKzsrDKX0uZOkjSVC55FY6iLPVJAzcRigw5nMKyH9lZiIbuZJhA4h5zTbZnNBxGOQO51Ie250cWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qyh+kwTWXZitFLG254D8m7l/ECF0ZTZ2RmGeERoGQNU=;
 b=Q3lr4oGEORtD3sDU5c/rJS6Ny1+1Q+OrBNlR2Zq3TOwoSTyNQ9a+zpRKLey37Zc1b9LDwOBgneUyzw68Z2ORMxYmcLThyy3mV1UwcnYy9zlQ4NuapxxtN76FpMCY032o2CUStk/Lz65jBeDnfOEY51wE11IiQr4hAMZgxI7+p5QTLM4jQrvzGSKsht7j/TO33OzjXA715/yCR4hgfrvupuM8d98+btobjtLMofiKbJPKBnsqKOMjDeEle5zVyiG5usu9i+WJjX12G71XvnLfoAwCOzm8Cx7i5jtKDXzi8W2BerNAjfwQNoVK6/K+veoEdXXmymJfLk4WMGB77zFg+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qyh+kwTWXZitFLG254D8m7l/ECF0ZTZ2RmGeERoGQNU=;
 b=JLLKkDSi0XHyGulaeS+Goinfuht73EvjaZ6x0pX6wOtQB+KFKTTY+Ap/D3wQw5LjJ/FLGco+GysjtKAIlWTuuXMgQixKI/Q++C9CXFk+++Nn861AOcfGQ8Ol4aJeD6SCiQvzJAEZy/RJRNW+a9qn+T5Ox3HkjZdmr8sMP9gFtnw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8e7bca41-46cd-4143-90cb-d3361e865522@amd.com>
Date: Wed, 15 Jan 2025 17:39:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/cppc: get xen-required cppc perf caps data
To: Penny Zheng <Penny.Zheng@amd.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Ray Huang <Ray.Huang@amd.com>, Xenia Ragiadakou
	<Xenia.Ragiadakou@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
References: <20241205054252.471761-1-Penny.Zheng@amd.com>
 <20241205054252.471761-4-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241205054252.471761-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e0772b-d94f-4b5a-32ca-08dd35b571c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkV4R0FuVzQvQUxROGVqc0FmemFFMVBaZkU5d2lHNDBZR2l4SGZ6NG5LNUw1?=
 =?utf-8?B?QmJWaTNpUEZiZFVWclMrUHJueU1tZnQ1T1lUa3A0Zm9aNngyYlQ2dElVY1k1?=
 =?utf-8?B?RmlPZExkQ2VwUjFqQi9hK3VaSHlzUHlxUzV4all0WG11eFhZV2NiZi8rN2RK?=
 =?utf-8?B?K0ZuNGJxeWlRS3JPdVIxeitQNmgweUZvVEdiNkdPU1pJdGlkaU1FYkpwY0Zq?=
 =?utf-8?B?TCsyVjZOeUZQZ0I4V2R5d1lPdVBsMDdtT1FEak5iK09zZldydDhDU2NYUTlB?=
 =?utf-8?B?NHV6MzlIbHdxVk9ZMFFPWnJ0TWJLb2c3Q05KK010dmJybnJiRU1QTXlzd1N0?=
 =?utf-8?B?NFpjSDZ3RVhCK3p1SDBvVlh4TEE5SEVyZ2g1L2E5SndnanY1TUJSc0FhdzZk?=
 =?utf-8?B?OFNLdGtCdGJQUGhzUms5SVVldUtyN2owSlI2L2ZRU1JkYThPMUZvakhzejkw?=
 =?utf-8?B?cXJhSHE2eDVWNDFCWWxwbkZ6ZUQvdVVJTlpPZ1BHbFVqMzRpbFlHb1JVNzJE?=
 =?utf-8?B?UktEV1NSelk1bEVQYk03cTZGUkF3a0c5WjdPOEt1aEFhOEI5MFQyZXdhSGsv?=
 =?utf-8?B?ekJSTklKRngrbERZMXFIc3pnQVpoUGoyeFdOQW5jWmtqemtsc0lPTitKeXFr?=
 =?utf-8?B?YnlXZTc0cm9hZm1FMEllanVMKy9hSHVXVnhXbkEybzdLKzlHbWllQWlUemUr?=
 =?utf-8?B?a0JoZUpPNHhTVHZQWTc1cDZaTG5XRllPc2c5ZE9ONUV6UHo0QzdDVVFBd3hl?=
 =?utf-8?B?WmdORFZ2SDJ6QnB2ei9qZysrNnRJYTJKbDFHTE1HNUxaZkwxOXlraTVwd2Rr?=
 =?utf-8?B?akk2bHpFcGd5OHBGaTBTbDB0V3duN0hGUlVjOWx3TmJMTWVKalFGNzNYV3Vi?=
 =?utf-8?B?bzdjQ0h6VlR3UnR0OTlRL2I1dGNvZ00rSnI2a0s4TmNVMmZVbzZVa1p5Ymx5?=
 =?utf-8?B?UjVXMFo4eFBJS0ZpU1I0aXc4KzY0OW1wVndLUUtFRzZQdTVtVnNEQXo3UXE3?=
 =?utf-8?B?elY3dTlrZnl0eGtnYzFqZXZVSjNwQXdldjFDc21Nd3l1LytlMm1TT3h2d05s?=
 =?utf-8?B?aWlwK2hEblRuODZNT2taMDJTOHd5K2JULytqQS9JdjJ1UnlSM25ycWZ2Q1pj?=
 =?utf-8?B?Smh6Z091UUplb0FaUnp1TEh4VjNRRmJ2N2NwVjdSSE43QS9GVzhaT2dVdXMx?=
 =?utf-8?B?L3dVL2xnRHZjUm1SSnFyTXREWWJ0YjZLbkZaN25lNDJCQnZVVW83a3dFY2xn?=
 =?utf-8?B?bTVYd1RycG9GY2ZyRk0rdmpiTkY0NDg0bGJBR3RVWTlxNXQ2cjdOMHJsY2w4?=
 =?utf-8?B?WjNNMC9UKytnTHNuWDdneCtVOXFENG5TRDFneUFQRGUxL2ZzRzVUbmdHc0M0?=
 =?utf-8?B?Sk9LRTR3OXMyc2tyZ3VQK1o0NTFyNlNHV3piWU5hV0ZVRWQxMzVCa0Z1WC9p?=
 =?utf-8?B?ZlpLTExEcXpDK1QwYkNWeW1ITmN1TjJGVU80WG95TVkwTWlXQUZUcWhKRExq?=
 =?utf-8?B?ZXlaYVhycmNUUFViZFd5LzJ0NjE2dWZWc0tUUFUxMDVjZVJ1N0VxajdnT3RZ?=
 =?utf-8?B?SnVXRXg3Znk1NkFOL3NicytTR0xJY1AxTjU3RTdDQTdudWxkYTBQY0dzUjRu?=
 =?utf-8?B?eU9hbFNtbVFtZDk3R3pQZmFEQ2ZXR3pzMW5XSWF1cXVic0hXNWdZZC85VU02?=
 =?utf-8?B?RkJINHQ1TFRQNjRzcHBHUzBON2ErdmxFTlNvMlBMZVd1Q3NERzlJV0VRZS9a?=
 =?utf-8?B?Wkd2dlBTUCswZHY0cXFEcUNyOEhZU3gzRUN1SnpKQVRBUXNlTWkxdXZocDdI?=
 =?utf-8?B?aGtvNlF5NnBhY1FDTzIyMG5zc0hwdlNkdG1OaXQyVHpSSFYycEdQQUtDOFVR?=
 =?utf-8?B?a2pvWUtTVTJvZ3Jma05BUE1MbUtvRkl4ejVuOFl2d0FqTFNtemEreFJhaG1m?=
 =?utf-8?B?YTBLY25waVBxTFhwaFovV3ZMQTRCQkpxTEJCQXNMRThxazM0ODdOSkJsUXZ6?=
 =?utf-8?Q?/AgoIIFEZYVCAIrAoujTfrCLON/oBA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 22:39:16.9486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e0772b-d94f-4b5a-32ca-08dd35b571c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397

Hi Penny,

On 2024-12-05 00:42, Penny Zheng wrote:

> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> index 13d6ff84a1e9..3a436591da07 100644
> --- a/drivers/acpi/cppc_acpi.c
> +++ b/drivers/acpi/cppc_acpi.c

> +	if (!high || !low || !nom || !min_nonlinear)
> +		pr_warn("CPPC: read zero cpc register value for Xen Processor %d"
> +			"highest_reg: %llu, lowest_reg: %llu"
> +			"nominal_reg: %llu, lowest_non_linear_reg: %llu\n",

The string lacks separation before highest and nominal and the preceding 
number.  Also, I think it could probably be consolidated to:

pr_warn("zero register for Xen CPU %d highest: %llu"
         " lowest: %llu nominal: %llu, non_linear: %llu\n,

pr_fmt is already "ACPI CPPC: ", and "_reg" doesn't add much value.

Regards,
Jason



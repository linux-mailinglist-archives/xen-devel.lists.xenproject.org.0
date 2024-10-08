Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3CB99546E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 18:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813346.1226249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syD6O-0007Zu-Cc; Tue, 08 Oct 2024 16:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813346.1226249; Tue, 08 Oct 2024 16:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syD6O-0007XM-9p; Tue, 08 Oct 2024 16:30:24 +0000
Received: by outflank-mailman (input) for mailman id 813346;
 Tue, 08 Oct 2024 16:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syD6M-0007Sr-CG
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 16:30:22 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2405::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bad5147-8592-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 18:30:20 +0200 (CEST)
Received: from BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::16)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 16:30:14 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::6a) by BY1P220CA0008.outlook.office365.com
 (2603:10b6:a03:59d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 16:30:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 16:30:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 11:30:12 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 11:30:11 -0500
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
X-Inumbo-ID: 9bad5147-8592-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY0xgKxYkkKPtDglhENBgDQeUeH3RF90m9AJP71EehYgsTvL26YqS+zG22paDSDsfI0i8VuJdoWrfjKNvRh1bfAyEzGVC0llwjapqlbEh/JwrEltEEgfTiGjmhJ7XxbZ9TE+xDfgeHLRTGSOXzRyu9qGZdSgeXxFpxD+tkKy6YLC5ym6tMXrw4QwfD0h2djADOeaAFE93KRARprV0a80ceFSlnq4hAD3+Ec1fqazOgMdH6ETCRwk4Z2Xnx2jhQJYyl5OmEsoK21+ZQFfzCXnhwsiL92bFTcK4AsMq9z9BQZIWuokNd08txMdZTljKkZ+Uyyo4QAFPSHfhuRXY8HkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMUvyLVe2kMup0AIem0Loc5lmXdKnOLYU10xBVXeBcg=;
 b=sB+Q0sA2aobpQn+fNg5E319Iyn7CNL6C1lGscDvC1PkLMKJyotLMJervNz0POzFmUG6iG8HfFepW+d6qZKXjFAKv0XbMkinlumRFTzcBE/bzSa6XG4zDABo9PrC0AdPxRyJEoTwD+DcJ2dHhazj8/Y7FQ+0pFEiTrUKSKihLyVnlZ1sWwHUDDoQPtEfjzz1ROTgSQWBEpBalwHxgzpaEmeNjyfv/0DtVF4p3+rzI46z6HnrREta/6IbW3PoxlmacDZ3OKgqasxhVC06CgOhyabTw0RnrVrZpQDYsbxSyP9kiMT6q+xxNZAvXQLV4S/LqL7nb8w08kIJbLUV8zZwdog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMUvyLVe2kMup0AIem0Loc5lmXdKnOLYU10xBVXeBcg=;
 b=F7g0SVaOODNmTSqB4DeNtGCr/zUiWvAJ68TP2JjM84uBICFntNwds7gngsBBaBdCngstTYCmR/cXOfSb29zO2cxfxTf3aoSEZ/vr8VqOOZ0acwCH0kSFtL91v7kWG2TQbFyuiMNcbgZdhxog3CMkSBi17rbpV+XOfkyTXAspPlE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <66738e0d-2a66-4547-8674-043b54b50ae6@amd.com>
Date: Tue, 8 Oct 2024 12:30:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/44] x86/boot: remove module_map usage from microcode
 loading
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-23-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-23-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a1d92cb-2db3-412a-6355-08dce7b67c76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2piS3VidWhXKzVLRmkrUHV5amJDMHJzWWpKRmtCZ1ZTQ1NydGhXbWFtbWpj?=
 =?utf-8?B?VXVibXBuK1kvdmdsWk5QTnBjTlUyUENHVGpWZzZydEJEaER2RjdUTDZDeExq?=
 =?utf-8?B?ZkFPL3RqdWU4Q1ZpZlVISjlqL1VQMUNGNlYxckNnck9PVUREdWxVY3JTQ2Fv?=
 =?utf-8?B?dldaQ1NMc1UvTmYzamFzZGU0RlZjbDAvQ2Y1RXRIWVpWWmRCZUlQcVZMdTVB?=
 =?utf-8?B?MENUcHprVEFIRThmNDEycFVSYndQSnRJU0NlaVR1UWhJdWJBaVpYWFNyV3Y3?=
 =?utf-8?B?OG5YRVhJK3AzYlhQbGl6WDQvWDh2d3dNUWo4ME9EUzlTSjhuRGxnNWRVN1JG?=
 =?utf-8?B?T0RJNU43Tyt2c3B2akZJampVdjJaZDkyUERZR015S0w5Q2p1M2JNY2tGRFBG?=
 =?utf-8?B?WXJLVUl6YUVLYytDb3FHUkwvUUhETkdzOXFnb1ZXeVI3UTB6Z0ZDQk44Y3Ft?=
 =?utf-8?B?WkRWZGM2MXhNN3ZLbW5MVW1zZDdOMHFsOGd2eW9xRlFJbnBzcGxwYlFzTkEw?=
 =?utf-8?B?QkNtOVk3eHQxSVF4YXdEWVFvRlBlTW82cUJuM2FUaUVSekFETUhNamY2ZlVm?=
 =?utf-8?B?VSt0RmVTZUVKWExXM2ZFckZId1lvb2Z4eWMxZHE3YmdYcDlBS3YxOVNQZTNu?=
 =?utf-8?B?UWlINGRYYlduTVRTakJjckdOeU5admZwLyt1RVhGckxVSU9tUUNZUldvZzk1?=
 =?utf-8?B?bXR2RUt6THU4bjFaL0MzeXg2dGhTZk5ad3JrSlVjTThVNW1MRE1hRTlFWkxZ?=
 =?utf-8?B?TnhjSUlCbWhobzdhVytCeGZMRElJVnpxVGpkQUZxUlFDRzJHbDdvdlZhVjJ3?=
 =?utf-8?B?amg4NS9rYjRtVWtxaEU5RUl1dGdZVXUxQ0E1enRnZ2tDMFlud0tZWWJQVHcy?=
 =?utf-8?B?ZXNSUlBxUkhxQVdGeEM5c2J5Ly8rdzA2dmhTeDJjUklxVEVBRTA4UXd0NTlL?=
 =?utf-8?B?ekZKN1I3VGtHS29tMnZUbTBxb04vK2pVM2FJMDVtSk4zY2lOQzVvc2U4L08w?=
 =?utf-8?B?akFGNCtuZkJpRWs2RWFocTM0ZTdnVHk4YS9GQWFwbzBHNHo1ZlRTWUR0ejda?=
 =?utf-8?B?S00vQWhXWHRwVXR5ZVRHSllkVXQ1dGxLV2NiNUUvMHMxdEJ5emhoVm1nN1FD?=
 =?utf-8?B?bEM3K09KTXhlYlZaZW9tZkVKN0NISXp0NCtvZkQ2RWQ2Q1lOUFhTdWVVS2Zw?=
 =?utf-8?B?TjRwTmZhUy9kQlc1VWdDWVU1N0RxZmJmcXMvek14RzNBRjFpN0JoZUMrdk5l?=
 =?utf-8?B?NFU4YUR5UDhOQXliUWRBQjVFaFNOdkplREFTZU9Pb0JoZGduTFBtdk5TY0dJ?=
 =?utf-8?B?RGthamZ1SGxpbmxqa2ZWM1FiYkI0SkVoWWx3NmR4emVtcjhXUDFlcjBraHRM?=
 =?utf-8?B?OW9tZllkamdzNWFxZ1FjYkxjMjhLdG1rN0hObERTUEJMTGhpaUFlQ0FjajN6?=
 =?utf-8?B?ZEVCTXBhekN1eVdzMVQxaUxPWm1LMXI4NEtibkZpYkNUOUdaaURMR1Fwb0Nz?=
 =?utf-8?B?L1d5WStCQkpQeXR0TnZlZ29QZ09zQVorL0piSTQxNUliUlU3Nnp4NEhtUCtu?=
 =?utf-8?B?ejdLbU1iUE9wSmhvbXM3TUdqMjh3ZlNwSmhKcEUzVkd3c0dmZWhVN1BVSFcr?=
 =?utf-8?B?ZVRiaEZEZ3VlYlRZV0NRSXF6Nk0wR2VqK2kzcnhJM3d2VTVFM0VBNU4wUG92?=
 =?utf-8?B?c2hiOXVVUUtYZGoyR1pNRzBMaUUwWGlZZDhxd0orOWNzSDZWNEJlT21PZzIw?=
 =?utf-8?B?ekE4WUg3RXpaZ3B2cUVDMXE1bVRRZ3BrZlVsRFAvR083ZHpNVFVKL2tzYTRQ?=
 =?utf-8?B?UG1QWWozcHBiNHVpOVRWellLVWRHSlpNYllVYkUwaGJaK2tEOUFmaFNLNllu?=
 =?utf-8?Q?EuF3hSmYm5Bcu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:30:13.6871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1d92cb-2db3-412a-6355-08dce7b67c76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230

On 2024-10-06 17:49, Daniel P. Smith wrote:
> With all consumers of module_map converted, remove usage of it
> by the microcode loading logic.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> @@ -202,19 +201,18 @@ static void __init microcode_scan_module(
>       }
>   }
>   
> -static void __init microcode_grab_module(
> -    unsigned long *module_map, struct boot_info *bi)
> +static void __init microcode_grab_module(struct boot_info *bi)
>   {
>       if ( ucode_mod_idx < 0 )
>           ucode_mod_idx += bi->nr_modules;
>       if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
> -         !__test_and_clear_bit(ucode_mod_idx, module_map) )
> +         (bi->mods[ucode_mod_idx].type != BOOTMOD_UNKNOWN) )

Just
          bi->mods[ucode_mod_idx].type != BOOTMOD_UNKNOWN )

With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason


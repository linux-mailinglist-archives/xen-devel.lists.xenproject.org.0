Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB474C810E6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171207.1496228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXfY-0007kd-6m; Mon, 24 Nov 2025 14:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171207.1496228; Mon, 24 Nov 2025 14:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXfY-0007iF-3j; Mon, 24 Nov 2025 14:35:56 +0000
Received: by outflank-mailman (input) for mailman id 1171207;
 Mon, 24 Nov 2025 14:35:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvF/=6A=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vNXfV-0007i9-UQ
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:35:54 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df2ab895-c942-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 15:35:52 +0100 (CET)
Received: from BN0PR04CA0140.namprd04.prod.outlook.com (2603:10b6:408:ed::25)
 by DM4PR12MB5889.namprd12.prod.outlook.com (2603:10b6:8:65::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 14:35:46 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::b8) by BN0PR04CA0140.outlook.office365.com
 (2603:10b6:408:ed::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 14:35:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 14:35:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 08:35:45 -0600
Received: from [172.31.118.135] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 24 Nov 2025 06:35:45 -0800
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
X-Inumbo-ID: df2ab895-c942-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9KhbzyP6XwenB6qJ+x0NtBLAX4NCOaW/ESVE17CBgiX1Yq3RddNquSsjUt7P3WEcsNxqBjarPX6G+zhgz0fTuxdPiKIUDcS2bqGLyZLz4FPbIFsb1z0R54kYImNm2AQWdhmM/XM/bH6v+jVO3wCxBd1BiYIeO7qXYGpFZwiojk3hBPdKhPdfgQcTwoV+oIBz/jgpo2rw/DSsFdID9SYnCh9sspOEG0hyKAQneNLBW8FmbwcdemM/0g9BGIYQhxXjrGcYR865g46B171JOzkAc+hE+uAc1lEPVVHkmw4Zuh2TfQ4T5R5fNjh8nphWcFXrJ4JN5qQSgCa+77jyoQiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTPwPA51pdpKbZ9WeYPyvala1S8NXW2Pnvok26N6YHg=;
 b=Q5arzE5mr1bOySIk1+0lXCkJno0TNykqatGsYOp98Dt5S4GinZdDZj9RnlfQUzWOkhypBdx2viTKAW1fRs4wflO5/fehn3hDg+CnJ8f/s2xlNckArMsGokDxYtT+tlFHAmuRGSxF1jo0KZ9pHF5PM9p/n0xYtkHVYEaWddSslmSm6EbSfNHInfMIRtb+HyqlXcXWtCpxsO34KgjYBgEFyJOeGV+E6nv8fVKSqWO0durwIp7oP0sebMs0vB6Fd08sKAf7dmZ8aEzQgBLGUtXdN18D2sjjlMw6IKEYwGXF7B9rSmeUzibMjH84NJZ8yzt35jN2nVFVcxXN5Z5eIv5QTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTPwPA51pdpKbZ9WeYPyvala1S8NXW2Pnvok26N6YHg=;
 b=qZzxrIQ1tl1WBNr+x6jdLY+ZqvlOepgqJtzcRA8CahsUyixI9JJnZHEI/SYpzs1i+lMD0AgOrHzVSjNYh40CYNgwv4lHSUq4tIK5OjDTP6yH/yA8PMS8QeeU0RFSEbV4bsgPsPqVJ/5/EDB5+Gc7zfnE4VKvTaEoDXrOkNhfauE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <bf1f22ae-11d0-4ac4-9b64-72c3c83c2ef1@amd.com>
Date: Mon, 24 Nov 2025 09:35:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/cpufreq: use host CPU policy in HWP driver
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
 <bacee005-8ba3-468e-8de4-681af1cc4856@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <bacee005-8ba3-468e-8de4-681af1cc4856@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|DM4PR12MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f05159-827e-4162-e131-08de2b66c12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmt1RFVIWkxjMnR4WXdOeTMwUXBVa3RQQnBBdVN2dDluZTdxc1JPTmZIVFZ3?=
 =?utf-8?B?KzFIVi9SRnY1Rm5WQWdLNmw3VjFIa0hzMGRrZEgzL09saHRBSTNUWk5QbG1S?=
 =?utf-8?B?bnR3enQzbm80eFRtQm41eXU2dndLcDI0SlFVQ3JhcFRrRmcrT2s3SDJUeVVu?=
 =?utf-8?B?RUFXZnBXbjlYakpqZWR2WnBCdU40RzJtN1A5dlpGVHZkcUwzcjA4akdTTDdU?=
 =?utf-8?B?TnJ0akNuTDNzdWFFZWQyZ2o4U0FwOW1WV0l4cVV3NXZBY01YZ1Y5Qk1FZmZS?=
 =?utf-8?B?dlJsZkFGVXFheENERjc2NXFWNVVYbDNpaGRNQ0hrVGRDMWJqSGRZWXhRUTli?=
 =?utf-8?B?Zm5ZWklaRzdkN3hxUkpqc3F5U25tWFRTWlcxYTdUWjVrMHpSeVlNSXZTVFE5?=
 =?utf-8?B?N2hWZm9kdzBxSFdnRThlSlp1TWtUTm5MZU9kUnhYNjhjdDg1cGtxQlZ4RzBn?=
 =?utf-8?B?T0FRVytNNzhDVmhuVlA3Z3F6NzBwc1JhWU5sN2prYnlnUU84T2t5ODIvNTZQ?=
 =?utf-8?B?L216UHlIR3pDN1ErbGoxYW9pU1dPNlJEckF4anlFNnZnWmNKNDNuRHMwbnhM?=
 =?utf-8?B?MmFKdGRCQWpnSU9ZcDl6YUs1dzE2dkpTYmRrUllRbE5kVW05UzN1U2tBUWVV?=
 =?utf-8?B?VHNxbEd4bHE3K3NmNVdOdUh3akt5d0c4Q1VxYXJjMXFNUjJtbVY1ZkFEdzN5?=
 =?utf-8?B?WG5aVXZTbndPZFRvOWVhd29Zd0RmOUxZM0w4Wk11S0tqZDZyUDdEQzYrOFlk?=
 =?utf-8?B?OEpwZDN1dmsrU2pjQ1BEVlFzZHhyRWJ2a2loemU0bklVcnhoM09sU1pjZnQ1?=
 =?utf-8?B?YVZxeWlzcjBqa0N3dVFsVW5ENlkwbCsxT3dWdmxqWTREemNLbHJmdW9QNUxm?=
 =?utf-8?B?L0NmR0lEUStaK0liZlRNbjcxOEc3blNtNjliQ3J4TnlHdHp5OHkyR3BOdWJY?=
 =?utf-8?B?VHIwSURieWVIVVo1QUFhakFxRHBPUUFOZzdHMkZLbW45MWNmd2RvMHZpck03?=
 =?utf-8?B?MXZVSlRVZUEwYkZLQjE0TlVVNmtlUUtGUkJITTJKRGlhWTBFMUhhbEVVbGFw?=
 =?utf-8?B?YzJYU1I0a2R0R2R6Q0lobWhZemtOQ2FZZ2pCMHlkWlgveW16RVdQeko4UjlV?=
 =?utf-8?B?MmZFYUJlMG1PaFlyNmZpY3JyUjBqdS9UbmIwWXVNRG5LQ2hCZWc1OHpjYkNJ?=
 =?utf-8?B?UkMwQXZINkdDaVpNdkhidkZkN1B5ekRoQXc4MUpyNnBOZS9UYSsxQlhIdXZD?=
 =?utf-8?B?V1oySmZYeTdLd1BpSFQ2djhNY3lMQXdMNnRNU0NhYWswSTRwSTdtRTh0Uksx?=
 =?utf-8?B?WTd1UEFoQWtMMkVvSXBteWVzY0FzMVZJcUpOZzRQSHBUZXFBVFVpS0hMVVJv?=
 =?utf-8?B?NTJRRU9qa203MTRsVEY0a3NLeUlqK2pFT2w3WVlFRVVGNlFVT3cyV1hlVnVV?=
 =?utf-8?B?SjFBTHE1b0wxWGczUFNvcFIwSmI5c29EMmxHYS81OTI1VUJZQ3JENmkwcE9H?=
 =?utf-8?B?ejlKcTd6NTVCcGltVTRBcGduUS8wVTFNdW5OVFNiQ3lEQXRIRXUzMkVtWE5Y?=
 =?utf-8?B?ZUxIMVVoY1VNdzFwNm04N2ZXZ0l1VDNDZmlWV2xwQkNjalFlbXhzYnl0ZTJz?=
 =?utf-8?B?dVdsTVJ6MjZ6YWtmN2gvcFhhaGxpY3U2aFBreGsvVCtTQmFNMnBVbExBOXN5?=
 =?utf-8?B?L3RUVjZhenlPME1pNGZqbkdEV1liQTJhZkEzeElFWHdDL29GUHpaTzR0Nm1V?=
 =?utf-8?B?VzNzNFc3dGxBLzBLcXdiMjk5S0pYbW9rem5vWHR6YnNNRU1qaE16Wm9JeXls?=
 =?utf-8?B?NCtXelc3NERJZllGWHlnemJ4bzVHaTh4WmtXRXZTYk5YMDRSdERwNWFPQXFW?=
 =?utf-8?B?Q1ZaWWNzaDRrOXZORk1pWisvTE44Umc3UWhMVDNjU01PYUlHVlozNzZxNEFl?=
 =?utf-8?B?eUZlYlJCWVY4dGJibWJPT0FqZENTbTZleEthbDUvMW45cktqV3BjT2drb0N5?=
 =?utf-8?B?Q1FwVXU5T3BZQkhvTmE1UlNUK0hzVGUvWkRiUVFKRkdHaXAyMnNnWElQSmsy?=
 =?utf-8?B?LzVJR1h5T3lwMm5TYk5SOFhqQ1BjZ2I3VTlQYkRlQ05MVkVnMkMyLzBjL25r?=
 =?utf-8?Q?SVcY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 14:35:46.0287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f05159-827e-4162-e131-08de2b66c12b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5889

On 2025-11-24 07:25, Jan Beulich wrote:
> There's no need to invoke CPUID yet another time. This way two of the
> static booleans can also go away.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Introduce cpu_has_*.
> 
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c

> @@ -226,7 +214,8 @@ static int cf_check hwp_cpufreq_verify(s
>   {
>       struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
>   
> -    if ( !feature_hwp_activity_window && data->activity_window )
> +    if ( !cpu_has_hwp_activity_window &&
> +         data->activity_window )

This ...
>       {
>           hwp_verbose("HWP activity window not supported\n");
>   

> @@ -537,7 +526,8 @@ int get_hwp_para(unsigned int cpu,
>           return -ENODATA;
>   
>       cppc_para->features         =
> -        (feature_hwp_activity_window ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);
> +        (cpu_has_hwp_activity_window
> +         ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);

...and this can still be on one line.

Preferably with that fixed:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

>       cppc_para->lowest           = data->hw.lowest;
>       cppc_para->lowest_nonlinear = data->hw.most_efficient;
>       cppc_para->nominal          = data->hw.guaranteed;


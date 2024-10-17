Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E029A3138
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 01:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821430.1235248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Zie-0000q2-29; Thu, 17 Oct 2024 23:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821430.1235248; Thu, 17 Oct 2024 23:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Zid-0000ns-V3; Thu, 17 Oct 2024 23:15:47 +0000
Received: by outflank-mailman (input) for mailman id 821430;
 Thu, 17 Oct 2024 23:15:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QiKY=RN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t1Zid-0000nm-0Q
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 23:15:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2413::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb595829-8cdd-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 01:15:44 +0200 (CEST)
Received: from DM6PR12CA0003.namprd12.prod.outlook.com (2603:10b6:5:1c0::16)
 by LV3PR12MB9411.namprd12.prod.outlook.com (2603:10b6:408:215::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 23:15:40 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::32) by DM6PR12CA0003.outlook.office365.com
 (2603:10b6:5:1c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20 via Frontend
 Transport; Thu, 17 Oct 2024 23:15:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Thu, 17 Oct 2024 23:15:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 18:15:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 18:15:36 -0500
Received: from [172.21.242.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 18:15:36 -0500
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
X-Inumbo-ID: bb595829-8cdd-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lug5XigQCcVBR8kGpMoKW+lXVleHfGXBPnCHRM+SroTsL08Ce0ccG1+tBYCMbm0BxYC62vmuvW7u1MqMRz5heUpGT+HOMH4PfpTb4vVfp7R+3F4WxrJuGiYWtbOdEVlN7xs0GLiA8T/5FHX1HjXRpy8kGZxsBmMoYT7NkqxHaw1qe/H2YOE7KOV8rsAlpOevDTFxVRn4l+Q5qQ4CqjngsoiVw+fzs3HhhHVqSfGxcpSlSoIz+ID/xSz9fq/HMx3Hg8qqCodLN4fOA1sM+eacJWYNcZG9G3ItLel4nwh3dDHs+LH4wO6t/FOJM0BO3D39jqFPLQMVw7fbG5iNfHTRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4lPJHl433fjvn7gzT0sSSZbiDYLuToYof3A5FZAJUU=;
 b=a6lsbsb+xhfPUO41O3R9/ugLzR4CyowpWoYaGpKHxs6T7r8VFY/SPcVCQpzTIc5ZpKwpHejzlKH3j1YULqlF01j/PWYsCDDnnlQJWkRS95EapLzS8/kf1CQyOIOLPJyfOAqg41hbRxjghG7CyX9gxU+o7xJ5TrlfvI917rGynkB7DBvxumrOdmxPIGY2a1QGopQwJlSaS02R3ahBkm1RANmfwNnDXUwvxgS0/ihdXrOy9D6djLC7z4TmFOiZrOnjTG90FIcHTBUHgsTbWFVE7V354Yr04zfGDRP2Qdics0a+zLX+CqJUnOLchkV+vmvFhBNuw8uzkw06xYqzNprsHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4lPJHl433fjvn7gzT0sSSZbiDYLuToYof3A5FZAJUU=;
 b=Scma5jmix2HGFaJZnl++/quF1yMT7FX0kFEskYVgDJbwpeBPez/kcLl9bvEX+Lmul9hlbJbeOu7H+LGTksUaxztZNu4EqbmtPDIy4ExNu1p0WazxwCF6kuTDL8qmTO0VBTTEBTzdzx12dly1NYRDW8LQ5Yv2cXIki/xVJV0r8gM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2133207a-88a0-4b92-a389-39259e649269@amd.com>
Date: Thu, 17 Oct 2024 19:15:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/44] x86/boot: update struct boot_module on module
 relocation
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-13-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241017170325.3842-13-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|LV3PR12MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a831a8-59ae-47bd-2509-08dcef019c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVQxZDkzT1VwUU1OUUFjRTlOb2VsQnY0OUl1a2xSL1RJdlpSSHNUYkRCNk92?=
 =?utf-8?B?OUUxUk96NkJ0TFNwUnhmSU9TOVdyeTNEeEZHUE5yUzZLdFBCQ0lIODF5Q2t5?=
 =?utf-8?B?ZjE5dHBzQ1BFc0ZNd1orTkNFckowWlRYMmJJYWZXeUFFYlJlUVNKbFBrb3lq?=
 =?utf-8?B?TTErM1lzdnNlUjZnWWMvY2ZVS0o2M2QvYnArS3Awc1FQRHUybGk1a0oxUFdt?=
 =?utf-8?B?M3Mxb0lmNEdMdE9NOExnUzFqbVJQeE12UHVHREpuUmk0R0NFNTNtMGd3cXJs?=
 =?utf-8?B?ZGtKbUZ5V0xIQndjSjF6RVVkZjF4eHlGdEJNa0NKV25GcTJCU29TRkFNQ056?=
 =?utf-8?B?ZTFIcTd4R2dtSnoyQXpGbUZBMERqZzdONk9oN0FGVUVvU1dZTWVNbjZObGxW?=
 =?utf-8?B?d3ZSYjcycUxsTkFPVWk0b2JaZ1VWWFNFSVljTmNaRGthSTUrTTYwa00wOWE0?=
 =?utf-8?B?THZyRTNRbGJEQWd0aXc3dzdvaXlGOGIyNmNWVFlJSGNHT0RxRUttSXJJeUs2?=
 =?utf-8?B?cXJDTGtDOFJRSStHQlByRnhIcEErRysrYWZwdys0VU1yR3lpTU92a2ZIVUtx?=
 =?utf-8?B?WVNmenVQeUtFNGRFRlA4aHkwSytULzlVWmFsYjZXK0wzeWdyTGlETXZ5NmtD?=
 =?utf-8?B?V25Yb3VqVkkyYStRZzRXZzJuMU5rOXB6elJRRE54Vml4QzZwWi8yS0w1b0di?=
 =?utf-8?B?Nml3VGFNVUc0anhiMkFFMEJJTnozbW42bjU0ajVuQURoSWtKeTFBMUhoekFv?=
 =?utf-8?B?S2JvMmNTVWVFNDJDamo4cG1VOWFMcWFGZzd5Mmp3bHU5amdTSnB1a29nUjlr?=
 =?utf-8?B?YmZtOXorL3VVWGxIYlZROWhLMW84OFRMbDByYWxzQmxkNEN2bitDVW1FSWpV?=
 =?utf-8?B?ZkpXdDZ0SDNVV29NRzVzTkFJNkZsMTlrODFWblY3YSt6QmRkeGE0d2JrWW4y?=
 =?utf-8?B?d2JmK1RHMDQ3ZUFKTmNrdllGU0hQbTVBRkF3MXprSElxNE1VVFJoZ2o4cVFW?=
 =?utf-8?B?VWV0UjFtVEtwS3JXaGhTdHk1VFZuNlR3a050OWs3bFRoZStwTVNjWEFRVVRX?=
 =?utf-8?B?d2lXYVJKLzdUaHR5KzJOaXBjTy9FSjNUTmNReVlVUXcweThSTU94YWZIWlJh?=
 =?utf-8?B?MUtYeVhXcUpXVzRaU080TDdzYnFDelRJK2NHMksvWHl1REhybms2V2I4QTBs?=
 =?utf-8?B?V2o2SW4wWTV5M3hISFdBN1pHOUdwb0tlNnZXTFh0ekZHL2lTSXgwd2ZsR09T?=
 =?utf-8?B?MUVuTmlFZHpjRGNRRncxdUJMREdQTVJLMlpVMThsWXdvM0tBRzAvd21NYWJZ?=
 =?utf-8?B?MXM1VFVQZS82bFlIZ3dudVpSTkEzVHlIT05xM25Dd29PQTdhdFZib1BYQ0FH?=
 =?utf-8?B?M0lIMkJ6akl3QStaMGR2RXJjY0lTTTREcHJ1RVRqd1hYcVlaV1grM2pqTXEr?=
 =?utf-8?B?NnBlSEFaNXMxNkxodWN5UU9lUUFhRVgyMExMZHl3eEFwSUpNQXA2Um1PUVJ6?=
 =?utf-8?B?V1F1NytFN2QrRnRvN0ZXZEhacTU3Y1lZc3dBQ2o0MGpxb3NRWlJKeDBIalhh?=
 =?utf-8?B?UkNHYjlyeXZib25KUG8xVEV6YXZsbUFCbTlqQ2ZLaVFMQjhhRm5kT2ZGZ3Bx?=
 =?utf-8?B?dWgyZGU3MVVrbmU1aG5vdVNGL2IxNStVMTNHSVpMdXBsUWxTZ01vY3prY1BT?=
 =?utf-8?B?U1RQeDlwcEZqT213R25mSFk0eFdwbjNFd0xxT0xQaUFBM0U5L05ORVpIT0Jn?=
 =?utf-8?B?Ymp0cko4bGdzTHRYTjBUN0thb3c3anB3bE1la1FFbk5DR0tnb1FpVWFnUHpv?=
 =?utf-8?B?MnFDYkovSkpjOERXRlRaeXJRVDRvbDRaai9XSXE2M0YvQ3JKUDhhbzgxbGFB?=
 =?utf-8?B?b3I5WENiN1dCOHJlMXNLV3phWjdYVmJzd3BhNlYxRDVLV1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 23:15:37.5636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a831a8-59ae-47bd-2509-08dcef019c57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9411

On 2024-10-17 13:02, Daniel P. Smith wrote:
> When a boot module is relocated, ensure struct boot_module start and size
> fields are updated along with early_mod.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v5:
> - corrected conversion function for a missed switch from mfn to maddr/paddr
> ---
>   xen/arch/x86/setup.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 6ee352fc0cde..d51b0b03bc97 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1380,8 +1380,11 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>            * respective reserve_e820_ram() invocation below. No need to
>            * query efi_boot_mem_unused() here, though.
>            */
> -        bi->mods[xen].mod->mod_start = virt_to_mfn(_stext);
> -        bi->mods[xen].mod->mod_end = __2M_rwdata_end - _stext;
> +        bi->mods[xen].start = virt_to_maddr(_stext);
> +        bi->mods[xen].size = __2M_rwdata_end - _stext;
> +
> +        bi->mods[xen].mod->mod_start = bi->mods[xen].start;

But now this line needs to be converted to an mfn?

Regards,
Jason

> +        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
>       }
>   
>       bi->mods[0].headroom =


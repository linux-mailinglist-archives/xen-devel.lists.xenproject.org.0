Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6DA8CA299
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 21:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726340.1130614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s98S9-0001fS-Vv; Mon, 20 May 2024 19:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726340.1130614; Mon, 20 May 2024 19:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s98S9-0001dt-Sp; Mon, 20 May 2024 19:13:45 +0000
Received: by outflank-mailman (input) for mailman id 726340;
 Mon, 20 May 2024 19:13:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l4Ei=MX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s98S8-0001dl-Dw
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 19:13:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 120150e0-16dd-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 21:13:42 +0200 (CEST)
Received: from CH2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:610:57::33)
 by IA1PR12MB6188.namprd12.prod.outlook.com (2603:10b6:208:3e4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 19:13:34 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::d4) by CH2PR12CA0023.outlook.office365.com
 (2603:10b6:610:57::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 19:13:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 19:13:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 14:13:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 14:13:33 -0500
Received: from [172.21.89.32] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 14:13:32 -0500
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
X-Inumbo-ID: 120150e0-16dd-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRC8qGBWc36axJGli4EB9px/eJ8j/7cy5yWnrJKG9C6rDX0pcdiOPVecwK5L0wv+4qTA9OTIZDKfTEU2uplQGXCJ09E1lqLiHTUHtBMi9KNmngGR6W4SkdFNTPQ+rNGTRhOcfPICKcVa0PJyKXlmzi0sr4xyfcmk8rFPJqnUZXz4W3S/4IiGaEzGk0qvq/mfbzILWaShQk8y+TlNQ115RFI6IRJujHZQuYpYCOXcv+psCtnDhoRqvnAG8Q1xEuFQcz6UH2uSiSx29HYdHdbK1X2z61C0ddhhyA3ozm8How2LrYCeT8+HkoVJ4k4nh3JqAZ9i7rQ1dZzMmNZj+jkFyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSHdhrWZj36bM4yAP74lblruAnRUdBDhdc4mQG0lj0w=;
 b=b8h+K1CHvp/btt5eHscxyG98dhSNu3oCAz4FlxMFES07DAb8znebm7k+pLUf6/+EswNg5qLL7xKtn1updwUW1kYnXC8vdmkpV2V/SVfBL7gpxe8cmpv2Ge4Da4RlkuPN/LUaT/QakowXjRGo6IAmsnbSot3cq85iu4qiy4DHNFxB7JezjeVEXGr0v0uUb2MTSLgX2PONbsCfbId8rtiJ9/4RUm3yZbvAL0/SbrmyaJlR5wH3qtVBwLkSNrb3isLv8wvJ9k/j/GAkvgNshZvqoOS/q+tH8amSdQeahIp6mesM0liJi/yWnUSiGQFhc481dEvst9vM8PhaYLcVwkqHXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSHdhrWZj36bM4yAP74lblruAnRUdBDhdc4mQG0lj0w=;
 b=Xe0BD/5Mlq9IXsNGrWXKiPusAuGX5Vig3FCX8WIeZK0oF4K04+dAaadgTgENrb/9P50cWB5JwuV7HdKHM97nHEAIQ8gsqZYOXMz6ZWH4XnWLkCciQul+tztZCVNcQN/yMZSTwppRBw8FvHoSoPQ6C0t+7YGKaTkY096pqEpAGpk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0a87ccc8-4262-4122-8142-2f64a174bab2@amd.com>
Date: Mon, 20 May 2024 15:13:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] tools/arm: Introduce the "nr_spis" xl config entry
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-5-xin.wang2@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240516100330.1433265-5-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|IA1PR12MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bba8075-8f5f-4773-0c40-08dc7900f1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFZRaTNYbExZMlUvdkYwWVkzWWRJTWZMZlBxWkhQMXVUWHFId0kveDZkd2lI?=
 =?utf-8?B?cjhTUXA0T1piOFJQUVc2VWR0SGNlNW5odk1Rd2QvNWFacDBidzc3amcreU54?=
 =?utf-8?B?SE5RS2NFbEJyVVFFQjErT1M4Rm5meXpKMUtxMkF1MDZQQlVUalpwNEcyM1gx?=
 =?utf-8?B?NWl4dC9sc3hkZ00zQ3ozRy8zdzVqU3Z4NkVSVGpwU25ORDBPSkkycXBZQTY1?=
 =?utf-8?B?QjZCclhXMVlmMDVZS3owZ3orNFNWTGxnUVpGU29kL1pUckl2S0NsbjZJMUhr?=
 =?utf-8?B?WDAwWHVjYWFmVU1uRlRHdm81N2ZPdnZhUHlvUjVoN1pmdU5YUlh4SEQvRFFo?=
 =?utf-8?B?cmVJZmdiT3hUL1kzRDJOalQ5OW1pY0N2T2tGckFCakpUY0hHUWZYdWZURDBG?=
 =?utf-8?B?NWZPSUN3VlJOTXE2T1YxTjVmV3dFcHcrcnh3N0pOa0Uyb1R4a1VOTk1rM25K?=
 =?utf-8?B?SGVZMlNFMm9PZ3FuQmg5c0dIOFJwUU1oRyt6bEh6endpZFNTbVJ3SjJKUEdQ?=
 =?utf-8?B?NUM1QjhlL2Z6d0ZPWWdWYnVHcExWRUptR2tHbHJxTnBSbTFlM0tNT3g5cENj?=
 =?utf-8?B?ZWJlNDJwWFZwbTIrcGN0TjhnVXBEN21lVnMvbzdHa1RGUDZSeG51MjNjOVl1?=
 =?utf-8?B?dnZuVE9hcDNuWmpDWDRQa0FxbENEUERzWHZaUndvZDN2MFJCYzFiNXhrYVRt?=
 =?utf-8?B?WjZwdno4NnVVSlV4QnJ4UDBBRmVET08wazJocmlZMEJrVTJKc2VIUzFZQVJq?=
 =?utf-8?B?VVB5akViYldqSllrL29udHltMzNmN3JZZStYWFV0N1o0SDlNWXRhVzY5d1d5?=
 =?utf-8?B?UVRzZDJMYWVJbDg1ckRTZU1iOENNaVRpVFR1eThrcTZQMS9iMVdlYjdXekxQ?=
 =?utf-8?B?bGNER2t0ZnVMeUpHYUdZb2RpcVpFeHl5VHFMTEJQTUFvVldMcUVMTUNONDdW?=
 =?utf-8?B?SWhZajNlVHpnQ292YjEzaGdXeGQ1eis2NjRINWdqWHlnbzZlT0gxeTl4T2g4?=
 =?utf-8?B?WFRFd3l3d0FsVFEzT3pPS3RKZ2RwZVdGTVFYZWVQdE51djdiRzlzVjJ1OGs3?=
 =?utf-8?B?dG5IczdJR0FUMlV3NytYYVM1R3FkcmMxazBwSy9Nc0FmbU40aHUvTWR6T1Az?=
 =?utf-8?B?Z3JVVXViT2dCVndwU3NCL0U2alo2bDVnSEwrQXFSajdCQjZvL2dMTHJHMlhS?=
 =?utf-8?B?LzZsYTJwWXBRK0tpTFRrYVpiejNoV0hsdU54emZMdTg5dGRiaFQ4bWdRbTQw?=
 =?utf-8?B?Z1VIZlNrU0taMnpDY0lJcVpmZ2E3U1pBWituLzduOXVGTDVDRG5hMEd5UzFj?=
 =?utf-8?B?YTFFeWpNOCtndU01WVBFMjVmRW1vWEtRWk5xd0c1U1lUakRUbHMycm1KNUVL?=
 =?utf-8?B?cTd6cmJIMERFTnM0bGJwTm44aDV2L00rdEZzaCtUUUs1dk1RYkhQWUUxcW9Y?=
 =?utf-8?B?ZWR4Vm5FUXd2Vm4ySnQzOGtLSDVSRnc5cTM2TEhQVXFodjNEelV2dTZJd2Yr?=
 =?utf-8?B?Z2RNTlpmZFFWWmtXV0NVRVRRalQ4alNGSENVRitNYlJBbHAyRU5sTUx0dGYz?=
 =?utf-8?B?NHJwVWUrODR3TVdrQXVsaVR5RUVTZjZJaGtHTHlqNHFKNjBrNUs1ZHlYdStl?=
 =?utf-8?B?bXFtdVVnTUt0UWtKTGZ2WVd3dzY4OWtNeEVld1N0S1RkbVR4T1BhSTEycW0x?=
 =?utf-8?B?c1VrWGFXbjhRRFU2dVovRnVpY2FwZnptNERkdnovdUM3Z2tkMWxKNHNXOS84?=
 =?utf-8?B?VmZoTFB5ZklLcitzSmhIdFl1cDVkbFlHOUNxVFd2MnZTdjB3elJDcFhsVUZM?=
 =?utf-8?B?ZnQzNmU0aEFNQkx1TXVYSlVZZEVmSllwN00wNms5SitrOWlIZmp5M2owbUFs?=
 =?utf-8?Q?k68g1k6hUi0Ww?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:13:34.0032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bba8075-8f5f-4773-0c40-08dc7900f1a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6188

On 2024-05-16 06:03, Henry Wang wrote:
> Currently, the number of SPIs allocated to the domain is only
> configurable for Dom0less DomUs. Xen domains are supposed to be
> platform agnostics and therefore the numbers of SPIs for libxl
> guests should not be based on the hardware.
> 
> Introduce a new xl config entry for Arm to provide a method for
> user to decide the number of SPIs. This would help to avoid
> bumping the `config->arch.nr_spis` in libxl everytime there is a
> new platform with increased SPI numbers.
> 
> Update the doc and the golang bindings accordingly.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v2:
> - New patch to replace the original patch in v1:
>    "[PATCH 05/15] tools/libs/light: Increase nr_spi to 160"
> ---
>   docs/man/xl.cfg.5.pod.in             | 11 +++++++++++
>   tools/golang/xenlight/helpers.gen.go |  2 ++
>   tools/golang/xenlight/types.gen.go   |  1 +
>   tools/libs/light/libxl_arm.c         |  4 ++--
>   tools/libs/light/libxl_types.idl     |  1 +
>   tools/xl/xl_parse.c                  |  3 +++
>   6 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 8f2b375ce9..6a2d86065e 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3072,6 +3072,17 @@ raised.
>   
>   =back
>   
> +=over 4
> +
> +=item B<nr_spis="NR_SPIS">
> +
> +A 32-bit optional integer parameter specifying the number of SPIs (Shared

I'd phrase it "An optional 32-but integer"

> +Peripheral Interrupts) to allocate for the domain. If the `nr_spis` parameter
> +is missing, the max number of SPIs calculated by the toolstack based on the
> +devices allocated for the domain will be used.

This text says the maximum only applies if xl.cfg nr_spis is not setup.

> +
> +=back
> +
>   =head3 x86
>   
>   =over 4

> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 1cb89fa584..a4029e3ac8 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -181,8 +181,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>   
>       LOG(DEBUG, "Configure the domain");
>   
> -    config->arch.nr_spis = nr_spis;
> -    LOG(DEBUG, " - Allocate %u SPIs", nr_spis);
> +    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
> +    LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);

But this is always taking the max.  Should it instead be:

config->arch.nr_spis = d_config->b_info.arch_arm.nr_spis ?: nr_spis;

However, I don't know if that makes sense for ARM.  Does the hardware 
nr_spis need to be a minimum for a domain?

Really, we just want the documentation to match the code.

Thanks,
Jason


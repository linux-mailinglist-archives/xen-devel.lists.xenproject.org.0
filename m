Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3CC9CC39
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 20:27:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176325.1500827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQW1G-0003vR-Ic; Tue, 02 Dec 2025 19:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176325.1500827; Tue, 02 Dec 2025 19:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQW1G-0003t5-Es; Tue, 02 Dec 2025 19:26:38 +0000
Received: by outflank-mailman (input) for mailman id 1176325;
 Tue, 02 Dec 2025 19:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/vY=6I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vQW1E-0003sz-QD
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 19:26:36 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf2513bf-cfb4-11f0-9d1a-b5c5bf9af7f9;
 Tue, 02 Dec 2025 20:26:33 +0100 (CET)
Received: from BN9PR03CA0146.namprd03.prod.outlook.com (2603:10b6:408:fe::31)
 by DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 19:26:25 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::b7) by BN9PR03CA0146.outlook.office365.com
 (2603:10b6:408:fe::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 19:26:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.0 via Frontend Transport; Tue, 2 Dec 2025 19:26:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 13:26:24 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 13:26:24 -0600
Received: from [172.31.77.70] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 11:26:23 -0800
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
X-Inumbo-ID: cf2513bf-cfb4-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WV2N2grsz8pt37pBITipn92C8I9w4HjuCP53xbDastfDmpHaWecdiKGXKJRLhcOrpBT88x17hDTLQ3BCWWaBsqB+8PPu4cwKkxKauff/MNMOxg3wzi36o/XLKJjoDVZZpSdvOAKhUML88FryJCD/UBCBIIoqk6wckm/60X0SKsMhA6GPcgJ/ASXahbb8ugIvvITuFCYtdvyXV2ud2v7Fgw3bh13tnNdboNYbxAIf7sKi+2JgEPLqZpTMMg2o6gqZoXxub9XDiM/MX/aupFsATpPD6NqOXPgbAulI6uA4ZB0KIPAEZkcAh1PSkudxgkgq9Y0w7pdOrfO4wZhg94IXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1D1uoybhF9d7OkIjgFCgPM+f3eVGpi7FVEjaq/W9ISY=;
 b=eaI43s2YrkOIyBK0nAULZq0ubOSHz+u800cFUk92XFf/RRxE8racXLAgLYN0I4q0OsB88ygXbWx7CANfG4XeY0+BxLRDOWWv+L1qozdVK7D6r8apf5RSpZfwsF/yQTM5HW6Luf+wRDJH2pdoDC49zWrpZlyQco4WI1D3BAt6dl7UPM/Z5MxjvL9xYQtphfjBbKeKn7iHdrq0elstq69qINRGvo2YNXFeLYtGly3SLGvyOZKtfAvCLrXx92FftEvZbSeeqQ+BIklUmLWrPMcTpgn49w1wL92m8DtJcjWdTUBXN7sPbbqHS+01yaWbK0wLVNk2PywbqmKnXWXY2RnBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D1uoybhF9d7OkIjgFCgPM+f3eVGpi7FVEjaq/W9ISY=;
 b=fqFDMv5nIyRbJf47bBgTvczXisWdmSlVoMq/70qX9FtJfWPSoMo96jn2+UTQBFj2PF4KUq2qzGiZcDwnweSaEUZ4KFmOwPV9OJKQ/jI3dUH1BjEGutEZkjztaluAYnvE1OUWQ6Xse9M+WOTVwSYNsXK637VfMwb+Lv9FszeqsNo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <88f06355-b49d-4ac1-a7e2-5665d4901618@amd.com>
Date: Tue, 2 Dec 2025 14:26:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 3/4] x86: hvm: factor out COMPAT code under ifdefs
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
 <20251119192916.1009549-4-grygorii_strashko@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251119192916.1009549-4-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c45bac-4f9f-4835-7e33-08de31d8af18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUJBOUZHWGplRG00dXlZRy9CdHhWOVR3dDhuc29ZcDBwRTg2ODdvSkE2SDBU?=
 =?utf-8?B?VC9GWndxRFV4VnRTaW83Mi94SHQwcEpWTXVoc0preDROcFdxMkJBa1Q3OTF2?=
 =?utf-8?B?SDdMS0V1TExNUDZaVDZNYVh5bFg4QUhISXgxcDhaN0dRa2hIbFhpOHh3Zm5a?=
 =?utf-8?B?RENqTW9EYVFLVERVNldIYW1pRlZ6NXlFSlJjeEoyaEIwUVRKOWFLOVVKR0tO?=
 =?utf-8?B?N2FCY013RnQ3eFRzS3MrNTF5anpmVkROZWF5Ukl1Y05mcTR4Q2lBaWNoWFMy?=
 =?utf-8?B?M3cxT2E0OS95ZU1jbWpQVmRhcEQrQkxPR3M1STl6WVNLOHo4OUhETVVQa2xT?=
 =?utf-8?B?Qnk3aXJndWk5MHhtQWNuYko5Nmt1T3JBQ3ViK0ZyUklVOEVJSVQ2ZnBMbEhH?=
 =?utf-8?B?SXVCbEZQQjdKbC9FNHZINkc5NWVaUW51cmROZWt2STM0MGluNk5ZeDIwOG1l?=
 =?utf-8?B?aFlMZjlRZ00rYUR5a3NnMlo1elVhaEtGUHZFSHJQMXByQVNDNW51dzZoaGJn?=
 =?utf-8?B?aG1PODl3ZlJ0d3NhOWx1cVdQRkhueXUyaWhQUjhJU3o4SkRBdkVGUm1QdlZi?=
 =?utf-8?B?cHlIZEtBdkRsZENJSkZtbEpwQm84dGo0VDJqczhEV2ZxdFlWZDVkZ1pQWlRG?=
 =?utf-8?B?OURDOXF1TTd4T3JESGozcjROcXYzNW94aFVXMDQwL1B3NDRVeWhac0JtUTRa?=
 =?utf-8?B?Yml1VjFYT0dZclEyQzJGVDJLbXFJb0ZFYkNhMjZ6ZkhIMklBSXN3NHFNRkhF?=
 =?utf-8?B?elhHN2ExWDNZTUV2aFkvQmFGOGFUaWZ0Qjl1QWdjaHcvR2oyaXBlOTBiVVFs?=
 =?utf-8?B?MmdiLzh5dFR6aGNnc0JjazNBaUU1eDN3d0FodFVOY0hmMGg1Qkp1Z1dSWHpN?=
 =?utf-8?B?dzcwSjJFMHdmRzZWSmhnSkd2UU1xU0RQaDg1clJZVk95ZXdXV1EySEp3T1F1?=
 =?utf-8?B?UFdzZU9uUVBDV1VGbHJEaFJZUkxub1lBdlB4dCtuODU4UC9KcjBTOG5Sc2Ns?=
 =?utf-8?B?S1BtQWUwQkdSa1Y0T1Evb0VvTDZqVXpWbGgvRU5yOE41WE96b3d6b3lGWjZU?=
 =?utf-8?B?K09WR1U2Nzk1L3BNSUJ4Z0tTR243ZVdxVFZhOWowYVkyT2NrdG5mR2QvcHRP?=
 =?utf-8?B?ZWJSNkllY1VFQ2QyQ1VLMVBiSUlmaVdRRlptOThNSEtjTjh6OGFjZ29vSUlX?=
 =?utf-8?B?QXpuSVR6d0Z5S0hDSFdiMS9HV0NzUDVmMkRTSWNLRlczeGpGcS8yeEZSUjR1?=
 =?utf-8?B?NlZSTlZqQmVwZ05JemdvYU1uZng0UlRWSnFVZTF3UkJDd2VxL1Z1eW43N0FQ?=
 =?utf-8?B?RTF1OWN4MlEyVG92b0grZmtmTEJxdDAxL1RrZ1cySFlNWUxVSTRHUFhDQkdv?=
 =?utf-8?B?R1hoNkVRTUJOTnZNeVhWcm5FWDM4WHZVU09jZ0lGL3ZlbWx0SmNFNEZDNUxy?=
 =?utf-8?B?T3ZMc29HSFFURytROUNtelVFWlR0VVcxQ2RVTFpFYlZ6MXlQL25XZDBKdzI0?=
 =?utf-8?B?UTQ4d3dPOVVyZFdZbDFJeitjU2xVdHpjaXpscnowRkJMNThiOUpySUtRbllV?=
 =?utf-8?B?SnVkYzQybExQQWRya0V1dlBWMkhjdkgvODZTTENlN2x4ck54aEVCeEN3TnVZ?=
 =?utf-8?B?aDdxanNNUlZISjBHRUR5Szgyc21VOUtjek00ZEl4Y0xwTHZodVpXRHgwQ1lv?=
 =?utf-8?B?S3lCaWo4cmZYUUxyVTZTTUtQT1g3eTBTSjRBTzNsNWl4VlNVVjhTVUZrMjlu?=
 =?utf-8?B?VXdLMDF2emJLUW9MQitBM29UNUdvQTg0ZE16YjRlMk5UenFHczhZM3I1bCsy?=
 =?utf-8?B?M3d4blBRSHdOUUdjWmhsWU9uWEdzKzRGWFY3eERVTVVrdzNmTk5tR2pDRmFP?=
 =?utf-8?B?U24wUm01V1lTRE9pQ1dVaTZtYktJSENsekUxbS94Z252V0czNlNnRkFXTUph?=
 =?utf-8?B?QWlSa1lkdFp6REdid05WVDg2YTVKenhQWmJkckhxUkxaVkZFTHkvZWVjTUxB?=
 =?utf-8?B?VUk1bmZORzZGRzNQaUN6R25ReWxOTGlnQTFnU2N4Y0pZZlUyS2xCa1ZZZVBp?=
 =?utf-8?B?dmFTand2aXpZSlZjYm1YWTRxYjc3RTQ0ZzZLRVppT3k1dXBXVDhOeUJNNms4?=
 =?utf-8?Q?paQk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 19:26:25.3087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c45bac-4f9f-4835-7e33-08de31d8af18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391

On 2025-11-19 14:30, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Factor out COMPAT HVM code under ifdefs in preparation for making HVM
> COMPAT code optional.
> 
> - hypercall-defs.c updated to always provide compat declaration for:
> physdev_op, grant_table_op, grant_table_op. This reduces number of COMPAT
> ifdefs in HVM code and lets compiler DCE do the job.
> 
> - Only 64-bit shinfo is supported with COMPAT=n, so struct
> arch_domain->has_32bit_shinfo field is moved under COMPAT ifdef and
> has_32bit_shinfo() is updated to account for COMPAT=n.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 5df8c7825333..0005f4450931 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -12,8 +12,11 @@
>   #include <public/vcpu.h>
>   #include <public/hvm/hvm_info_table.h>
>   
> -#define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
> -
> +#ifdef CONFIG_COMPAT
> +#define has_32bit_shinfo(d) ((d)->arch.has_32bit_shinfo)
> +#else
> +#define has_32bit_shinfo(d) ((void)(d), false)

(void)(d) is to avoid an any potential unreferenced 'd' messages?

Just using false builds for me, but your way is a little more robust.

> +#endif
>   /*
>    * Set to true if either the global vector-type callback or per-vCPU
>    * LAPIC vectors are used. Assume all vCPUs will use
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason


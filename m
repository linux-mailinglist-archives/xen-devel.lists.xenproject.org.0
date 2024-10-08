Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E5995889
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813544.1226533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGwz-0003C9-LZ; Tue, 08 Oct 2024 20:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813544.1226533; Tue, 08 Oct 2024 20:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGwz-0003A2-IE; Tue, 08 Oct 2024 20:36:57 +0000
Received: by outflank-mailman (input) for mailman id 813544;
 Tue, 08 Oct 2024 20:36:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1syGwy-00033N-HQ
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:36:56 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20623.outbound.protection.outlook.com
 [2a01:111:f403:2408::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e421c1d-85b5-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 22:36:55 +0200 (CEST)
Received: from MW4PR03CA0069.namprd03.prod.outlook.com (2603:10b6:303:b6::14)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 20:36:51 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:303:b6:cafe::dd) by MW4PR03CA0069.outlook.office365.com
 (2603:10b6:303:b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20 via Frontend
 Transport; Tue, 8 Oct 2024 20:36:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 20:36:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:36:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:36:50 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:36:50 -0500
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
X-Inumbo-ID: 0e421c1d-85b5-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9eTmfkeJt+O6nfuf2b7hv2hO6LclnhlE+OkRymuwDy2S1dUT4kpnVLyRCoItjQjzdujWW5VEa4zvXC34LKgVKll2molxs25WR+hisyNCWwpAuoWYxwe1/WWAE9jzHixSjg0jKCmXSccGiWt+BlOOc2kBhqwEm96NnYYkSe7KaI63J946v/cUOJCbPQG3K147tbypjTKOIhHwsoZxT9YtnBDHjrpR3NIK1EzpTs++8KXs+9z8vSO+1hqG26v7kJjBPF/N8aM/ShP+DCd6mDVj9go6AaHUekm8PNjgUpfbBdpCX24Vo/fSY+b/SOfHRO0ITiarjniuVlugnEiEIJkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErtetIz3haHJAxSSfmR+mWVjEXTEeTCPGz12pCQEB1E=;
 b=wmN0ef22AiKRRXaDKf2LdmZDyPuxbb03YxSdHAG5R3H93x0y3nfYvGYToby2/c/iqNjA0muh8bDhw+6g3HB+W4AGDwDIDPwp9vew7X+ZwziNR3UC83FuUeP/I8P2jd6beQFZUoYH+Dt07r34FnCrZcOP5ezYaTiy6TlJxYX4H/hS+jywRt54CkOBD9pVx3dIUjRhSKr46qgPv571rDNAsnPLRzt7Aa/GSTsTG95aNWF58rRmNizgymY0bsvVMmQiwo1AceQNyQYJbFEjES6siya9AEwetPHoWEH1egwv+o0GqwyuCJd/T80CIQodDdPMGUwzPFkMLHq94JZGtd6pBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErtetIz3haHJAxSSfmR+mWVjEXTEeTCPGz12pCQEB1E=;
 b=xN75WPS5Vhq7WfNL5i0xVQiGmCUs7air1ZvQ1Syr0CyPeuXZeuoyRaEsJ3ynj2+V4NDzxq3KfClcy+XcwWk2T6vW+IFLSlo0fhYpeGi2Gcs67so36H9CJ/HwSqJd3SMoEtCNhKncw5FoYKMNZZFkgqE85WSYda5Wr+Su+NWoW1A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a51d0a6e-7050-44af-9a66-edbfba67bab1@amd.com>
Date: Tue, 8 Oct 2024 15:36:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 39/44] x86/boot: introduce domid field to struct
 boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-40-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-40-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: d43d2a05-caa8-4555-51f1-08dce7d8f0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlgzcEUzTm51TDlJSkFKdWxGWmQ4ZjQ5SkZ2eGdxSlV3YU9VSENTMVVpNTNO?=
 =?utf-8?B?dzRrc0FYVzRzS3Z5USs2enM4WVFwZXhwNnB5bHZtMi9TdEg0MjQwUWdsTzJX?=
 =?utf-8?B?QnJGR0hlUzVSQzhsWm1pakpJRENISm9sREJjVDNqYW5JMmJLc1oreTdsMWZQ?=
 =?utf-8?B?MU53bHJkb1FOZmdTWlFtVCtjZ1RYYitvSXF5dExFdHpwZ2VtVktMUWdsOUNG?=
 =?utf-8?B?L25sQUc4a1JQZWFuVVlLU1dBM2NnRTdzdmRaQURNWnlkSWR0eUZneUt4RW5S?=
 =?utf-8?B?azR2MnloTnY5VWgxZDdPeUVlK2xpTDdNakoxTHE5ckJOc1pvM1EzcnMzU0F3?=
 =?utf-8?B?cGNTM0tzcE9UbnAvZEZoSVN5NXRSSi9IQTN5b1BodUQ2YkZuRTg0VnpLNnBK?=
 =?utf-8?B?bVZmVmxvSWhNR0tiSDJDUE5MM0hXRmNucEFzQXkxRis1OG15R0t4cEtMVnRU?=
 =?utf-8?B?VTdFeFp6K1BVT3dPaHUzU290UDY0UHR4a1JReVIyNllra2FoL1RNcXpXMDdL?=
 =?utf-8?B?YWlVWWliL0llYXhrS0lzMTBHdEFWa3BUUXJTTHZKNWp5dVJOR2k2NHRxcU1l?=
 =?utf-8?B?eWZJODNidCtLckk1U3Q4aVlTZGN6TkM2ZjcrRkQwRVRNeWJBVHptM3dCaUZn?=
 =?utf-8?B?MWEvV2tTWmhBN2hUSlA4SlJka2tOZU9uRVFPRG0zUlNoSks2WEZDQy95K2VI?=
 =?utf-8?B?Mjc2QnJ3RlNYemRlYjFPR2RrQjY5dE1ENjVveUN3eUpNSVdNdTErR3A2YVRJ?=
 =?utf-8?B?UEI4VjlYdVpmMnovVHpSeEJaZUhxYTdmb3BZK29OWVo5K0tsUFhwQXRXYkpl?=
 =?utf-8?B?QU9yZmx6VUlybmJQNnRXM2pSazNpS3BPdHEyekQzeWs5dncrTEtidXNHSEpC?=
 =?utf-8?B?WUQzcUxTRE1lU0k3M1VRbi9uRENaa0dzWmlzL3p2T2tHVVVKSzMwTzZ5S3dN?=
 =?utf-8?B?VjBoVVhCV1ZYdWxyUVRBd3JYaHRLTnhjaU9RcFlhWUxjTm4vQ3FYcC8xdTBi?=
 =?utf-8?B?c1VjeHFGSjI2eGk3NUJaSjZXTEFhOXNzRTRZTDYxdW1POFhlWEdFT2xNTVpP?=
 =?utf-8?B?TGZhcXdSUWJ5dVJHMUFkSVo0ZjlmS1BFeTFnTmNnc2ErcWsxVXNrLzJ2VzVZ?=
 =?utf-8?B?SndIdXJJOXdkYkh2Z0FZV3QyVnlFMStzRzVYSm1JMUdiMGtzSmN5R0gwa0py?=
 =?utf-8?B?QmZmaHVwQklqNmFSZ2d6QUl3Z1BhNVhyM1AvN3h2QzJwaFYxd2pCbTR5amw0?=
 =?utf-8?B?NXJtZEJuMzhkTnlGbUhyeFZVZUNrNkxBc3BhSmp0Mm9qaXRUK2UzY2JYdFpy?=
 =?utf-8?B?UTJwRUZPQm5DS1RHNFRaQmgwdXhsbE5YSHpyaGZNS0VicW1XQkorTW9SaXJ1?=
 =?utf-8?B?OVdHTDhhaU5FOUdwY2tlblBWWFA5cGhPVklZUHNhQW16b3NSemRRdW1ISDFy?=
 =?utf-8?B?eTdFZXlqTUpISXJwVnRBMjJXSTZQWi8yOUZORWIrWSs3bUJBOVNFQ0lia21u?=
 =?utf-8?B?VEFhUWpKOW1NVXZDOU5rc3lrU2dwWXhwYzU4VmpDdjhRSkR5MUVPQklIclZj?=
 =?utf-8?B?MXRGcWJia0hTcDJPOWNLSGlsZ3RXZXZxY2ZoQm5sWjUxYVdiUGRUbFR0NC81?=
 =?utf-8?B?am5uMUJQSktVQzYyQzFHd2gyazlaYXp5K3NOeUNDM2dwSkZJR2pCd0xqbnFl?=
 =?utf-8?B?ZGlGcEYxSEc0WUpWNWFUSFdkR0V1NVhxMzh5bitleXJLakUxK2FOY3N2Zkky?=
 =?utf-8?B?VE5LMkdBd1ViK0R2dm56QmY1L2t4SnZTd3JOcFBOKzgyVk1tYzZKSWpPSGFu?=
 =?utf-8?B?RytsRHE3WW9uNmJFSUpBeW4ydmEzcUhQZnA5bEtVMkFycVBBcElMc1BJYkdI?=
 =?utf-8?Q?iTSk68G8XYE4O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:36:51.6661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d43d2a05-caa8-4555-51f1-08dce7d8f0c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Add a domid field to struct boot_domain to hold the assigned domain id for the
> domain. During initialization, ensure all instances of struct boot_domain have
> the invalid domid to ensure that the domid must be set either by convention or
> configuration.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/include/asm/bootdomain.h |  2 ++
>   xen/arch/x86/setup.c                  | 12 +++++++-----
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
> index 4285223ac5ab..d6264d554dba 100644
> --- a/xen/arch/x86/include/asm/bootdomain.h
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -11,6 +11,8 @@
>   struct boot_module;
>   
>   struct boot_domain {
> +    domid_t domid;
> +
>       struct boot_module *kernel;
>       struct boot_module *ramdisk;
>   };

Oh, you should probably move domid after the pointers to avoid a hole.

Regards,
Jason


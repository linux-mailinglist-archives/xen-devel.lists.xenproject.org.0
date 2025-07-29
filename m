Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30010B14908
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 09:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062094.1427712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugefR-0001VQ-11; Tue, 29 Jul 2025 07:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062094.1427712; Tue, 29 Jul 2025 07:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugefQ-0001SZ-TW; Tue, 29 Jul 2025 07:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1062094;
 Tue, 29 Jul 2025 07:22:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZ3B=2K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ugefP-0001ST-7d
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 07:22:31 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2406::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c83b2fe5-6c4c-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 09:22:29 +0200 (CEST)
Received: from DM6PR11CA0037.namprd11.prod.outlook.com (2603:10b6:5:14c::14)
 by SA1PR12MB5671.namprd12.prod.outlook.com (2603:10b6:806:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 07:22:23 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:5:14c:cafe::c7) by DM6PR11CA0037.outlook.office365.com
 (2603:10b6:5:14c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Tue,
 29 Jul 2025 07:22:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Tue, 29 Jul 2025 07:22:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 02:22:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 02:22:21 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 29 Jul 2025 02:22:19 -0500
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
X-Inumbo-ID: c83b2fe5-6c4c-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQ8OYO30nVXnok6uM3i+jeChpwYmaSUV2zc3F/xi7ls3iGtRmRiClf+oSKy4rYMA6AT9nmwXe4KQrHmFpREFWvDCy0nohqgHMBQuRCdmWG1z04gD6CeIHtfDtpRwbtG1Jfc+sSaycXsmyQMW4/V2WrI67boIkmd/rI4Dfv4l7lG8uULnHL3F2gMkiQGp6PwrrQ2KNkrH2/tO1tmD5T2P2MWZ/nEnp/fickgzwcMQU/RrmdtaQL/xNNdjHTnlc1x92iIA9vCVv0wSxUQVva1Ayr2USG2e4OT8Emr0PTq0H3MM5m+m8y/PY2Isl4ykmkkURMw1WnJleCtHGn8gGByuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ6QKgrIHlC2HSO7pDKr8rLb5vtqO1a4dsr56XMeRgI=;
 b=KuIGOBd8c+a0qvCZIjVFg/B808AedFYGRjUBnl5ylhT6cNmSPe6mZZirlQHZwF8WBDeq2FkTHtDJc8IkJyzmF4C2WdQmNfwEtDnYiVBSgxAPev/oUUG0Kv4t2DgFHetTu19HuYjLKv+eNHiOKnAKGBG0cZJYo3FBDx2Bo04/9koJBxSqDYsZYEUNMfKJmiAp5YHDPAZYPcC1tevq9AC2UJxQr5vCnl6ElibbAVwNQHpPxLooVsKRfUv7RBbMw9B8isz1mL9WUIUdm8NziZpXROuc6gE63EWIOfFoqfZ1+7YgExr0dsAHCIBS72jXwBGbwREc2djnE3zwOBodUt/qAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ6QKgrIHlC2HSO7pDKr8rLb5vtqO1a4dsr56XMeRgI=;
 b=1G01iSp7f7cr1pVTkjMUjlw5riWlHxNSpyKeb9BndizKD/jFRxc3KXs9DA/6PZz3kNf1/WF2l6oUiPCK9GFYbwnC8ac5XmezQB1fF4I6jh6F5fgQo0ttArYZ7aEp7FIXfJBilA1u+ZWlJtSM4BvwAWlINhZfM/CEZaJVrObBqK4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ccaf6efb-3372-4fb7-8084-51d23b3fcc21@amd.com>
Date: Tue, 29 Jul 2025 09:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|SA1PR12MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d87857-e124-47d2-9714-08ddce70a973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZitDSmRqS2NoczFlZkdCcXhOeUNSdHdYNEg4T2VzdmEvK3ZBVkovU3NjT3RL?=
 =?utf-8?B?R3pTeVV6RStKUXArZzZ0QitnRVE3R3JFa0ZGZlN5YXVEKzhvZ1Bzd2ZicHVz?=
 =?utf-8?B?UXIrc3BFV2xnczQ5bSsyemZDSVFoTnhRTCsyVXFadHFpVjBEM2hPTDZTNGI2?=
 =?utf-8?B?dVZoMysrWm1JQXc2RE1mNlR6czYrSCs3V0ZJUzRqUEszSzdMMVRxdnpBRDdS?=
 =?utf-8?B?Nk52aGtVd0FGTjJLL2s2TlZTQnY2c1k5ei9aclV1SjQxczdGaThhZElsRllr?=
 =?utf-8?B?UUdDZzBoSUdpbnRLSmUwcEVndU1OSEt6QmkrMkFjZXpWU3RsRjNVejRCSnN4?=
 =?utf-8?B?SWNUMzR1VWNrV1ArcnM4NVV0TTN2aGtCbDBUdnl3UXVVK1Y5Q1VldmQ4SXNr?=
 =?utf-8?B?TnJCQ3lLYWlpVGxFTFNaaUZXakVod3lPRHYzdWdVNUZDZ0M5NUVFOG8yN3d4?=
 =?utf-8?B?L2xpWCtKWGJYV0FEMTNHQkg3TWVoMXpwbFNoSjV2MDFSYXBKdS9pbitZUnQx?=
 =?utf-8?B?Y0xOcnNuTUx5U0JoRjgxV016UkE0cmxJNzdaR0wvajlYb1lCUXJ6Y2pKZENu?=
 =?utf-8?B?M0s3c1FhNE45OFZPOCtnM3ZxVngyTkNHWWQ3V3p5NURmSTRqYTdTU2xTOU9a?=
 =?utf-8?B?b0FRZE9MRXdLT3N5Rm9FUkFaQkNCcVEzOVJkK1ZVbUZWc0htaTlrcFFyOFE3?=
 =?utf-8?B?V2kxVTdSM0Q5R2gxY1VEMWhXM29PNkE5dE5mQ3NEMzdiaDNYbENmdHB3OGto?=
 =?utf-8?B?THN3YmxOb1NsWTlqaGNxcExWeENFOWovRVZxb2praWpyYnNTQTc1RlYvRzJP?=
 =?utf-8?B?MmR6ZHltZHBFQmVjU0hKNW8veUphRzNFR2l4aE5mYitNMXFTZmxBL2lvQTM0?=
 =?utf-8?B?NHZqdllRS0xvR1pHa0dScXBuRVpqd0ZVS3o3a0s4bnBlMmQ1SG95ckdKV0lz?=
 =?utf-8?B?OG85SG82aG9hS3JTcXQrdkdOTW83UTlBZzNRVU5rZzg3RnZMbERBTXpuZGJ4?=
 =?utf-8?B?aDJJK1pmcmNOMW83bWxXWkx1eGtmN3U4QlVqMU9ydk1acCtFbnBpUkVzOC9l?=
 =?utf-8?B?dVRUN2YxOUk1b3hSd2RvSnJUOVNUWjJBTUc2YnB3U3o1MWJSbjFZYmVJSS9B?=
 =?utf-8?B?YlVlZnlXYzRJRkhyQm5mMDgyTHRUYWU4R0NWdHdzejlsYWFIUnB4T1VrSU4x?=
 =?utf-8?B?STVSMEN4T2tOaWxQemkwTzMwVWYvWnBwb3RhT01qak1ZdzVDNWZJTEswVW9o?=
 =?utf-8?B?UStDUEd6czd4Sm00V053LzBTVUZaSndLVmNUSiswNzB3ZjByT2tzMThiWHdU?=
 =?utf-8?B?b3BZVUh5OWwxMk1WVzVYOUpOMmhHbDd1ZTlaSXBqUzFUQmdWYmhTQjZmODlR?=
 =?utf-8?B?MVplbTZtYWF0TnNTSTlIZHZTbnR5QnlwS3pBeElXVE9PRGx5SHNKVUl3eDRt?=
 =?utf-8?B?WXdaM05XTUFzR3M1YU8vd3VTb3VLMkcrdzNHZ3lGYzFaaVBNNTUvRktQYkZO?=
 =?utf-8?B?ejhzWFNleEZTeVZ3dEJBL2RqS0tzdzBCbTRUWGU2bnEyeUNFeTJjb0xLVkJF?=
 =?utf-8?B?bDNSYXVtbGNLWEZVcnZOUy9qYU54eW1Ca3JPaUY1bzhFMHdYd0ZCT29oK1oy?=
 =?utf-8?B?Q1NIODdVdFFIY25kN2tGN0JCdXJSRDZWOHlyaS9nRWgzWm1aeDAyTm9pWlNF?=
 =?utf-8?B?U1NlZ2xMdExsS0VLd3AyNkVCTG5PRTcxU0MrZVJ1MVlPbFArV2hpU3MxcnZS?=
 =?utf-8?B?clplU2lESzVBWFFEWGl3YTdOV1JUZTR1YllRdTZjWVlEamRVeFhWQVdCQWNP?=
 =?utf-8?B?d1pCVko0dXpEelY3VGZDZkpkU1oxTzRwR3BCT0dna0JYTHNkbFZMT3BuR1dK?=
 =?utf-8?B?S3JUbDlhZVB3Z2QzUDl0L0Fydy85czdaWlRyOUkzeTAvQmJLUmIyRUx6L2pB?=
 =?utf-8?B?aHJERk9tRG1CT0xvS3JucDhxaWx5MllGSVRhYzVRa0NndmQrc2RnWGo2WFg1?=
 =?utf-8?B?WERZcVRaandpNFExVnZYT0lIcnpUdVdJTHlYRmRGVThGV1haaWgrejFxY2hR?=
 =?utf-8?Q?zzSCzd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 07:22:22.9415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d87857-e124-47d2-9714-08ddce70a973
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5671



On 28/07/2025 19:07, Oleksii Moisieiev wrote:
> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
> allow for building Xen without support for booting a regular domain (Dom0).
> This functionality is primarily intended for the ARM architecture.
> 
> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
> default for ARM and X86 architecture. This symbol signifies that an
> architecture has the capability to support a Dom0.
> 
> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
> expert users, this option can be disabled (`CONFIG_EXPERT=y` and no
> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
> creation code on ARM. This is useful for embedded or dom0less-only
> scenarios to reduce binary size and complexity.
> 
> The ARM boot path has been updated to panic if it detects a non-dom0less
> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
> boot.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> 
> ---
> 
> Changes in v2:
> - decided not to rename HAS_DOM0 (HAS_OPTIONAL_DOM0 was another option
> suggested in ML) because in this case HAS_DOM0LESS should be renamed
> either.
> - fix order of HAS_DOM0 config parameter
> - add HAS_DOM0 option to x86 architecture.
> 
> CONFIG_DOM0_BOOT Kconfig option was introduced to make the Dom0
> regular (legacy) domain an optional feature that can be compiled out
> from the Xen hypervisor build.
> 
> The primary motivation for this change is to enhance modularity and
> produce a cleaner, more specialized hypervisor binary when a control
> domain is not needed. In many embedded or dedicated systems, Xen is
> used in a "dom0less" configuration where guests are pre-configured and
> launched directly by the hypervisor. In these scenarios, the entire
> subsystem for booting and managing Dom0 is unnecessary.
> 
> This approach aligns with software quality standards like MISRA C,
> which advocate for the removal of unreachable or unnecessary code to
> improve safety and maintainability. Specifically, this change helps adhere to:
> 
> MISRA C:2012, Rule 2.2: "There shall be no dead code"
> 
> In a build configured for a dom0less environment, the code responsible
> for creating Dom0 would be considered "dead code" as it would never be
> executed. By using the preprocessor to remove it before compilation,
> we ensure that the final executable is free from this unreachable
> code. This simplifies static analysis, reduces the attack surface,
> and makes the codebase easier to verify, which is critical for
> systems requiring high levels of safety and security.
> 
> ---
>  xen/arch/arm/Kconfig        |  1 +
>  xen/arch/arm/domain_build.c |  8 ++++++++
>  xen/arch/arm/setup.c        | 14 ++++++++++----
>  xen/arch/x86/Kconfig        |  1 +
>  xen/common/Kconfig          | 11 +++++++++++
>  5 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index bf6d1cf88e..74da544925 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -18,6 +18,7 @@ config ARM
>  	select GENERIC_UART_INIT
>  	select HAS_ALTERNATIVE if HAS_VMAP
>  	select HAS_DEVICE_TREE
> +	select HAS_DOM0
>  	select HAS_DOM0LESS
>  	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>  	select HAS_STACK_PROTECTOR
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index ed668bd61c..9b8993df80 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -40,8 +40,10 @@
>  #include <asm/grant_table.h>
>  #include <xen/serial.h>
>  
> +#ifdef CONFIG_DOM0_BOOT
>  static unsigned int __initdata opt_dom0_max_vcpus;
>  integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
> +#endif
>  
>  /*
>   * If true, the extended regions support is enabled for dom0 and
> @@ -102,6 +104,7 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
Why is this and other dom0 cmdline parsing functions not disabled?
What is your method of deciding what to compile out or not?

>   */
>  #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
>  
> +#ifdef CONFIG_DOM0_BOOT
>  unsigned int __init dom0_max_vcpus(void)
>  {
>      if ( opt_dom0_max_vcpus == 0 )
> @@ -114,6 +117,7 @@ unsigned int __init dom0_max_vcpus(void)
>  
>      return opt_dom0_max_vcpus;
>  }
> +#endif
>  
>  /*
>   * Insert the given pages into a memory bank, banks are ordered by address.
> @@ -1953,6 +1957,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>      return 0;
>  }
>  
> +#ifdef CONFIG_DOM0_BOOT
>  static int __init construct_dom0(struct domain *d)
>  {
>      struct kernel_info kinfo = KERNEL_INFO_INIT;
> @@ -1984,6 +1989,7 @@ static int __init construct_dom0(struct domain *d)
>  
>      return construct_hwdom(&kinfo, NULL);
>  }
> +#endif
>  
>  int __init construct_hwdom(struct kernel_info *kinfo,
>                             const struct dt_device_node *node)
> @@ -2037,6 +2043,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
>      return construct_domain(d, kinfo);
>  }
>  
> +#ifdef CONFIG_DOM0_BOOT
>  void __init create_dom0(void)
>  {
>      struct domain *dom0;
> @@ -2089,6 +2096,7 @@ void __init create_dom0(void)
>  
>      set_xs_domain(dom0);
>  }
> +#endif /* CONFIG_DOM0_BOOT */
>  
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 12b76a0a98..c1463d647a 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -480,12 +480,18 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>      enable_errata_workarounds();
>      enable_cpu_features();
>  
> -    /* Create initial domain 0. */
> -    if ( !is_dom0less_mode() )
> +    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )
> +    {
> +        /* Create initial domain 0. */
>          create_dom0();
> +    }
>      else
> -        printk(XENLOG_INFO "Xen dom0less mode detected\n");
> -
> +    {
> +        if ( is_dom0less_mode())
> +            printk(XENLOG_INFO "Xen dom0less mode detected\n");
> +        else
> +            panic("Xen dom0less mode not detected, aborting boot\n");
I think it should mention that neither dom0 nor dom0less mode not detected

> +    }
>      if ( acpi_disabled )
>      {
>          create_domUs();
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index a45ce106e2..06e2888707 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -18,6 +18,7 @@ config X86
>  	select HAS_COMPAT
>  	select HAS_CPUFREQ
>  	select HAS_DIT
> +	select HAS_DOM0
>  	select HAS_EHCI
>  	select HAS_EX_TABLE
>  	select HAS_FAST_MULTIPLY
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 64865112a1..22e8192a7d 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -21,6 +21,14 @@ config DOM0LESS_BOOT
>  	  Xen boot without the need of a control domain (Dom0), which could be
>  	  present anyway.
>  
> +config DOM0_BOOT
> +	bool "Dom0 boot support" if EXPERT
> +	depends on HAS_DOM0 && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
> +	default y
> +	help
> +	  Dom0 boot support enables Xen to boot to the control domain (Dom0) and
dom0 is also a hardware and xenstore domain if you want to list all
capabilities. That said, dom0 is a very known concept, so you could just write
all-powerful domain.

> +	  manage domU guests using the Xen toolstack with provided configurations.
I'm not sure we need this line. Why would we make assumption what user wants to
use dom0 for?

~Michal



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAD36E0AD6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 11:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520598.808347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmtib-0001Bi-Mo; Thu, 13 Apr 2023 09:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520598.808347; Thu, 13 Apr 2023 09:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmtib-00018n-IU; Thu, 13 Apr 2023 09:58:17 +0000
Received: by outflank-mailman (input) for mailman id 520598;
 Thu, 13 Apr 2023 09:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czPd=AE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pmtia-00018h-NY
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 09:58:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b367ec3a-d9e1-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 11:58:13 +0200 (CEST)
Received: from BN6PR17CA0038.namprd17.prod.outlook.com (2603:10b6:405:75::27)
 by MW4PR12MB7440.namprd12.prod.outlook.com (2603:10b6:303:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 09:58:10 +0000
Received: from BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::29) by BN6PR17CA0038.outlook.office365.com
 (2603:10b6:405:75::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.33 via Frontend
 Transport; Thu, 13 Apr 2023 09:58:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT078.mail.protection.outlook.com (10.13.176.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 09:58:09 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 04:58:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 02:58:08 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 13 Apr 2023 04:58:07 -0500
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
X-Inumbo-ID: b367ec3a-d9e1-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdmCoO3i0uOWdS5tE2iX6csiz103s+ES9/P7W8pL8UVqCVu5MA7+cZ0SeKxVtbguyHRQGByHw5ICRQSgmw4/Ph0RdsoouRs/G7n6cg1+8dgAEoevWzk+9N/ZwMDN+wob372C0XRtFaEYy6sDq6fjYNt7/s84pNQHS0KRwdydkCnW2d0PfGuo6lNqQb9XGEH8KvklEVdVSZO5vkVrkJf6JRX8iTITz/WG9Vcq8LYh3gGOd7SFgpt1EYtVLo5N6Djyalw0CDMDq391Vxaz+/v83+Y7fYCCUiNgsbCrZLtLfqd7gvary2augLNs3VtB1yazeLEczFDXdLI/IqfGCmh5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7hXF7uogdRLXdoz4J9okqV8ECVMCAycJUpqZlbPpR0=;
 b=frUgQpfv5ZZDlnfLjv1Wg4goY2RiR4OKPdFX4WZEim8PoZkKvuBXG9HDZyNV97IwNvpliw5f3mICS0CHp8bwdyMjgAonXjEIg8JhcF3y9hHQmb4MTu5i+k18Tc4Z5Jv8sevBcJ372zddHnFHaUa7Es9TvpDa/Mb8LQ+3we7BQXwephPmhnh7AHCAD23pJjn86TMG2zrnSZkB1RdAd3Q+Sbe4sNsJ2efXLRq3MFjdQxJqwPNPD38Mj6SZjF6XRAW027/aVow1jLnNB2oAuE7kikFmo6/Y9+G7CjoWrx3ayDoZKa3rJklq5uIsplB8Wavrund7rCokHt+xNCh8khjW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7hXF7uogdRLXdoz4J9okqV8ECVMCAycJUpqZlbPpR0=;
 b=pyQ+Gcn37YLFnaHc9oeV6toAmVZ9nOB7yCnRy7TqqyD+WZF47xf+JKZgoJuT2nERs0AZVLDuXQKwKj5xVQd//4zWRr6Q9bDbnt/5PM4DPkj5ebnJjJiSfYu54CrwJqFdgWM1QIEZlvLanUHjKnX36a0IPQI0q+zON08Lo9khQnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e40e323b-6eec-2cdc-62ac-d7c6eff59bd8@amd.com>
Date: Thu, 13 Apr 2023 11:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [XEN][PATCH v5 03/17] xen/arm: Add CONFIG_OVERLAY_DTB
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-4-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-4-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT078:EE_|MW4PR12MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d35228e-0865-42e8-e1f5-08db3c059624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K6bFRhAp3Jj9muTMjbZRkaGPHRroE40YOyRvmA9QZbqq4sZ7/WBXV3p8mapAUIlRd9sk/eOJWbYclZ5CZkRaa1InDGz4Oxm9SxcD8uw4asILUIQJPyeOGEO+tzG2Rj86J1gbR82iH3DwBaHIUlL1i84Svu6sLk0lbXKIJT2ACHYjDHRI3hfEGzNNSjjJ3Uq+tNZgCszEJFiyj+3MyFRVlka7visOKikbfvjRHhb68deuDW64hmzS/O7Oc27NN8ZTnaAjOsYcHK5plwKzZukx3hw+ECoG8Ts3+JgSMnVp1Q94S8ExeW39QTklvueSuQaXXResbiS0ydPtvW4I+a3kTAuCghI74r5Agk62CqoLZE+l33SMAEpJAuV7E2ZK3Ii9S4OgaPd+VoQTdybT0/UPwTfBzf9kCW2qx8W5O96VC16xRCvKQMCha916XfjtntEMYunGIKloGxUTQPvj6g3HHIUd7uIwIlKJsCp2oaTeV7MtWSYGSgrPR7mmLFouyU/aLwCFBNsCxuwG+WStnqZPM8VVpEFcvvgKZRnStpu1lS4pdh/obmO1uihU2NslTH9nS+Z1XEkmHOqAWMgMkVEPS1iliuh/lXwXaA02MnvkixDTFOf44+XjQOMmBpilKT1XiiXi9fHaQ+2tE40MQVLMgbWg0QSmvMrz2PVPy97v2n6JPdVLoXvXGh05EEF/MV8P2mK27zT87ZbQhOvx5jHx7TWdJ9NTFUbL0n2I9ocgfXrgs36Fw/g8uEEbRWtw/yP47HPMEUUx7DkcL+5KgxtA5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(31686004)(8676002)(70586007)(70206006)(8936002)(5660300002)(44832011)(478600001)(41300700001)(40460700003)(316002)(40480700001)(82740400003)(426003)(336012)(36756003)(16576012)(54906003)(110136005)(4326008)(186003)(86362001)(26005)(81166007)(53546011)(2616005)(36860700001)(82310400005)(356005)(47076005)(31696002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 09:58:09.4091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d35228e-0865-42e8-e1f5-08db3c059624
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7440

Hi Vikram,

On 11/04/2023 21:16, Vikram Garhwal wrote:
> 
> 
> Introduce a config option where the user can enable support for adding/removing
> device tree nodes using a device tree binary overlay.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  SUPPORT.md           | 6 ++++++
>  xen/arch/arm/Kconfig | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index aa1940e55f..0a31f40af4 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -822,6 +822,12 @@ No support for QEMU backends in a 16K or 64K domain.
> 
>      Status: Supported
> 
> +### Device Tree Overlays
> +
> +Add/Remove device tree nodes using a device tree overlay binary(.dtbo).
> +
> +    Status: Supported for ARM
Hmm, so here you say supported but in Kconfig - unsupported.
I think, this should be:
Status, ARM: Tech Preview
or Experimental

> +
>  ### ARM: Guest ACPI support
> 
>      Status: Supported
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 239d3aed3c..1fe3d698a5 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -53,6 +53,11 @@ config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>          depends on GICV3 && !NEW_VGIC && !ARM_32
> 
> +config OVERLAY_DTB
> +       bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
> +       help
> +         Dynamic addition/removal of Xen device tree nodes using a dtbo.
> +
>  config HVM
>          def_bool y
> 
> --
> 2.17.1
> 
> 

~Michal


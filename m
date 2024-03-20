Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DF5881020
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 11:42:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695849.1086052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtOK-000404-4k; Wed, 20 Mar 2024 10:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695849.1086052; Wed, 20 Mar 2024 10:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtOK-0003xN-1E; Wed, 20 Mar 2024 10:41:52 +0000
Received: by outflank-mailman (input) for mailman id 695849;
 Wed, 20 Mar 2024 10:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxfT=K2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rmtOI-0003xG-7B
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 10:41:50 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72de5813-e6a6-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 11:41:47 +0100 (CET)
Received: from MN2PR18CA0005.namprd18.prod.outlook.com (2603:10b6:208:23c::10)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Wed, 20 Mar
 2024 10:41:44 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::e) by MN2PR18CA0005.outlook.office365.com
 (2603:10b6:208:23c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Wed, 20 Mar 2024 10:41:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 20 Mar 2024 10:41:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 20 Mar
 2024 05:41:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 20 Mar
 2024 03:41:43 -0700
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 20 Mar 2024 05:41:42 -0500
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
X-Inumbo-ID: 72de5813-e6a6-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXSmWGDpHWVU4QTneCknMpgRneWlzchX+EXwawKACnDViuF/0GfLeI9cusFkr3MmPABT+2XxYDJaICk51SZFR0GjFMq1cbSn1kqaP57XsneH2+Hrl5jeZX5/j6MOVPgeensebTUa2ctbUeDLAjZFpBm2QPYOz+9mjsi5BinI7BEKxJRn2GnXIrqyD6uNhU4Bnjb+k8sFnXAwden3DjcdCN1k+AGwH8VvmDt0PUbeItroQ+7Zw8RVcuXPvWmpFYSW/oyhkdXJmlizetubLHmaZHomPuYz4TEXxw2kZkAG28jEdtr0BaNVJxSFqtcd29yE1fciq9ziytrf/+BQsJH9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ahkl+so/vWN4QFLNrbnQu94+YQ9o6SWrby7EpEPkVQA=;
 b=EuQi8uWEmdXww4xwwNbBdOftpAAhkEo8wrJw91DPXCbxqvt8GXn7N/PXyI9IHzLc5/Nu5s/l01nSsSCKgm8dpXRamEd8l0fnNH+knhZ9QF6p3Ozfmc2ZL1bg2m6Pk1//wq3VmQAM78btVMfYs4+W6rBBeYKzMztA3EcFVmIZDpinCiSOXi3AyLyc73Y04qF5SurudUZ0NvgukPbuXkUsusfz9XNw55bw6otNFnLh8ukQwVObFF7Ypbo+ZLnVNBFtV2yxhuYpebMQG/t3vw8OLUzjldL6MDeRZsNRNxozMlJ5BiwJAJ14Z6On2RfsoF+5V1dUZtdVDTovAhE9sDGb3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ahkl+so/vWN4QFLNrbnQu94+YQ9o6SWrby7EpEPkVQA=;
 b=zBnLxSAEe89KikQ+/pi6E5auYwi85DSCcAp6Z+QKJrni2JrlTvGn5YdSLznsTdrknR9cQFogEuxBRlOFlYVFirmXmqWTIwC70erjA249f9XCtLZFoK23fRn188qiUxX1vXmI+K3CXjY31fyJbpTLfgPyn3viAxno0xsJuPvHiMs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0254141f-7751-41e0-a460-343cc500bc47@amd.com>
Date: Wed, 20 Mar 2024 11:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] xen/arm: Introduce helper for static memory pages
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-6-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240312130331.78418-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|CY8PR12MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7993ac-7c4d-4083-8506-08dc48ca55d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QBXRbuluRXh7Y/K+mvC2kdgWPQiv00TozZYqGbxi9TRSPceJiVfKSh1yBKDKv6IfBoU6/7jo1pENXC/LNALRo4g8ZQXR98+4XV74XZgyZ+F+aymJUz46VosxgFQ8AhYhHIe0NrpfHBdYnq3dCTplII9IfhfCcrq4xKUOLFpXCCVlz9QeSs8pTHYujR7qIc1VufntQ1eXT2sFXKpYZRTTY0zO4jbPNXaVXXhMk0+avzcdaIqQAxWwed8TI48J34HKkUAdAzxYw34EmvZ2LpzONbuviQ4UTVcdGzt3gKgAPt59YzsOQbVi7Q5W8ED+Lj8PSDSj2/4vC+Dxx7ImVZMWgW/W7akZLAFW21bnJuZOq9GiOL40CQv/P62u757g87pJACleF0an3qyBZOn+z5XdQ9svkDVui1M17II93oahEPAGfhDrrzqnNuuwKIOlYRCJ/aZZQIWvPynPhSPgT0bJMzL++lKB0JpHUCbmCO568QrhIx4+pmcewVYX7jpyFZJ9yQ/fHb3hhRxb9khBBqrcl18D+5vsrMTh1hx3fXrrqqZaNxTGs8nWUmU/drd5PCKu5PKeS52tMDWHJVV9ri5xdrMnToo7hwvL8XVQbK8mFyGv+rpG+oQ+Gy44WUY3ze95RvibKWKKNQb+9soSps+vj2F+KjbEPLszDNWCs7QIHbPQ34q869W790AOnRbLWrxZcFiekbdQ0Au+tWgq9bgTQzISa4zAI0AgvVsYxPp3pjoh8rycwqAxpskjtu2/S4xv
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 10:41:43.9777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7993ac-7c4d-4083-8506-08dc48ca55d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635

Hi Luca,

On 12/03/2024 14:03, Luca Fancellu wrote:
> 
> 
> Introduce a new helper function in the static-memory module
> that can be called to manage static memory banks, this is
> done to reuse the code when other modules would like to
> manage static memory banks that are not part of the
> reserved_mem structure.
The placement of this patch in a series is a bit strange given no use of init_staticmem_bank()
in the subsequent patch. I would move it right before patch #8.

Also, you could mention that this is because the information about shared memory regions
will no longer be stored in reserved_mem.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/include/asm/static-memory.h | 12 ++++++++++++
>  xen/arch/arm/static-memory.c             | 12 +-----------
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/arch/arm/include/asm/static-memory.h
> index 3e3efd70c38d..665d4df50eda 100644
> --- a/xen/arch/arm/include/asm/static-memory.h
> +++ b/xen/arch/arm/include/asm/static-memory.h
> @@ -7,6 +7,18 @@
> 
>  #ifdef CONFIG_STATIC_MEMORY
> 
> +static inline void init_staticmem_bank(const struct membank *bank)
> +{
> +    mfn_t bank_start = _mfn(PFN_UP(bank->start));
The header should be self-contained so you should add <xen/pfn.h> that is not included in asm/kernel.h path.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957B5617CB6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 13:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436479.690600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqZRj-0005FQ-9K; Thu, 03 Nov 2022 12:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436479.690600; Thu, 03 Nov 2022 12:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqZRj-0005Cw-6X; Thu, 03 Nov 2022 12:35:47 +0000
Received: by outflank-mailman (input) for mailman id 436479;
 Thu, 03 Nov 2022 12:35:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeB9=3D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oqZRh-0004w1-M6
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 12:35:45 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0548106c-5b74-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 13:35:39 +0100 (CET)
Received: from MW4PR04CA0110.namprd04.prod.outlook.com (2603:10b6:303:83::25)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 12:35:40 +0000
Received: from CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::4) by MW4PR04CA0110.outlook.office365.com
 (2603:10b6:303:83::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 12:35:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT078.mail.protection.outlook.com (10.13.175.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 12:35:40 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 07:35:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 05:35:38 -0700
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 3 Nov 2022 07:35:37 -0500
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
X-Inumbo-ID: 0548106c-5b74-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZMcwA8oxN0cAJYfDfkPa0hUBiz8sE2AHEaTZNBwNnd+yDvGP+V+QylfletvCVmxH9r787O7y8lEMHP5kYpF+gE/j6Knl6LfUwC1nHHd39g/cfFAQMq9CJMaqwYCbiM880RsblBFQyG4pZemndVaE5y9AmDf0LlDWVxZGu0hgqRgoZGVEae9UBnA+27cnPDWrM+dkJ6l0rfYcZCJ7NkWhDVN+rBctI/LnxtibbwS8kUBr/aRit2u/Y2hCa72g540oDMgxOecXHw0iM0FcX++H3KAI2LvhhWFvQ7T+56aQNN0y0kqdZx2Vr5MGMrlmfFwEKgylh9aK9ico+pUdBVGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZFsm3BApYRO9hcpsGrRitwNhBice3gGcWc2UUbeIiY=;
 b=JsaL1GC3LA7Ak2vv306u4hwZR97DlBdcbvPqOHpZD6aBoqaGnbukpsDl8bnOao1lq+ANDTOQ4mcDs8ABKxhDnpoANOhZ7/pPJdYpxu5K2XVTt4C11jnVSYGSaPEpeX0ag/GP14z7WUNeUTtKGwsRdtIhwjtiq9ZrfEPwG8mJAnPdzBwOSeYezxG/fKZxNMOYds5glpYLQUa3Kip+VuezTj21DUjMxkAUSOF5MrQflw3bueuVdQ1lsHvhO2FBmX2SDRGKO6ieeIz4XGmpV9gh1Da3wE+XmKgXj4ReHuat6jzftKSRycrjYatPK50QpDhk69Ox12SHBq+eTeSoemZr6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZFsm3BApYRO9hcpsGrRitwNhBice3gGcWc2UUbeIiY=;
 b=IqzrUkdP//d2d0Nm3TXF+RQYSprrgVgllZ82MajCeof/T394V+jr4cU/y8aHqKM2ckx9puk9hjpwNtbtq8BYLmnjtd0xET4QWIdjx5Qoo3tsuTsytjd/bgeVEYz6y+2bHoB/V0aPBJY85yozuZSWd1SfHJBtBNpIX0NeYq8lktE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <64dbd0a2-3629-ff88-0b23-0fc8b087ada2@amd.com>
Date: Thu, 3 Nov 2022 13:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v2 08/12] xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n>
 for AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-9-ayankuma@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221031151326.22634-9-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT078:EE_|MN2PR12MB4304:EE_
X-MS-Office365-Filtering-Correlation-Id: 88aea126-0a05-43ec-262c-08dabd97eabf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aNZjes1XhIZLjBaw/G0k4W9AdY/HSnhHPGhyqKzlV6qar2nXT7B3mXtTFxhgi/q9p4WrXL6/FBOnluRtY2Ulp/1Qc1+nRwsBbWVnWFgw/xvWwks67oiak765ldnuG2a66OUbGLQK4Sm/UNbsM4i3b62CBFg832Lx0MMvQPCbjC8M/uJKHpMzu+T219s5EKXYsXltR+ewOLT2ZwvvLn9q7czzJRmQK6MRfVN9K6u5fh7cokfJ/1+VHH/sb6MId0Fzrspdnjp1iNKYckGXTEijOdE4I+469aDvtqTTOStHKdaBA2IcuQdMTP0LLb53HTs4diCgHnNG3AjoFPKpBx+YUgHMUXUutfLM6gzO/OlI043sTqvPT5qz+XWbgOgidOPLxV78GADTgqmgoinrlwZhHcm5ex16SMLC1vI8C3JvzhtVTxW/UeSsF0Fvd+iwOkKE+6lcFN7J1Jr4h9SoO98xmnak0oxNKDTOL/EpgdS+DSMsfe7Mfn4N3QuIHVwH2fdiH/y4ozx8bUBt+uyDHEE/KdC+8feAjhujw0j+CcsnijM/5GKJ951W4EENZc+rr2ddNpNLgiVO/8Xppj+gvI9dLtfE8TVO4OCvlaw4LmwdTVayWLgCRnG8DLGhI6T0t2yZ5UF5Trpc/MkhOTblnMmlF4CZ1veJ+3cQX+nfcKX/MZCMKeOCXtqIve6DbjGYQRVFWY2EZnlf45iRJ02uQSRZY7zgTqegwfK+5v8gfUjkwmFHndn4QlsO8fm+BsCNeUET6mGEwt/LfRqpBFh6qxCwxrJtuR4k5P1Ra2cECdT6Kwzb5RZrF3tP4CcGlhK/ujb6Jkf0jOk2ItSKroLoNu6nIA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(40460700003)(31686004)(36756003)(40480700001)(426003)(336012)(36860700001)(82740400003)(2906002)(5660300002)(83380400001)(47076005)(44832011)(81166007)(86362001)(356005)(31696002)(26005)(110136005)(2616005)(316002)(478600001)(41300700001)(4326008)(54906003)(16576012)(70586007)(53546011)(70206006)(186003)(8676002)(8936002)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 12:35:40.0734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88aea126-0a05-43ec-262c-08dabd97eabf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304

Hi Ayan,

On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> 
> 
> Refer "Arm IHI 0069H ID020922",
> 12.7.1 - Interrupt Controller Hyp Active Priorities Group0 Registers 0-3
> 12.7.2 - Interrupt Controller Hyp Active Priorities Group1 Registers 0-3
> 
Commit msg like this is not really beneficial as it requires someone to have
this spec and only tells that such registers exist on AArch32. It is missing some
information e.g. what is the purpose of defining them.

> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Moved coproc register definition to asm/cpregs.h.
> 
>  xen/arch/arm/include/asm/arm32/sysregs.h |  1 -
>  xen/arch/arm/include/asm/cpregs.h        | 11 +++++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index 8a9a014bef..1b2915a526 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
> @@ -81,7 +81,6 @@
> 
>  /* MVFR2 is not defined on ARMv7 */
>  #define MVFR2_MAYBE_UNDEFINED
> -
>  #endif /* __ASSEMBLY__ */
> 
>  #endif /* __ASM_ARM_ARM32_SYSREGS_H */
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 4421dd49ac..bfabee0bc3 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -404,6 +404,17 @@
>  #define ICH_LRC14_EL2              __LRC8_EL2(6)
>  #define ICH_LRC15_EL2              __LRC8_EL2(7)
> 
> +#define __AP0Rx_EL2(x)            ___CP32(p15,4,c12,c8,x)
> +#define ICH_AP0R0_EL2             __AP0Rx_EL2(0)
> +#define ICH_AP0R1_EL2             __AP0Rx_EL2(1)
> +#define ICH_AP0R2_EL2             __AP0Rx_EL2(2)
> +#define ICH_AP0R3_EL2             __AP0Rx_EL2(3)
> +
> +#define __AP1Rx_EL2(x)            ___CP32(p15,4,c12,c9,x)
> +#define ICH_AP1R0_EL2             __AP1Rx_EL2(0)
> +#define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
> +#define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
> +#define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
This might need to be re-aligned after you fix patch no. 7.
Then, you can add:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


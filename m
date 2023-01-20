Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0DE6754C9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 13:41:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481741.746830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIqhq-0007jf-Ls; Fri, 20 Jan 2023 12:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481741.746830; Fri, 20 Jan 2023 12:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIqhq-0007hD-IN; Fri, 20 Jan 2023 12:41:18 +0000
Received: by outflank-mailman (input) for mailman id 481741;
 Fri, 20 Jan 2023 12:41:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUaQ=5R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pIqho-0007h3-Pz
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 12:41:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b92cd37a-98bf-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 13:41:14 +0100 (CET)
Received: from BN9PR03CA0726.namprd03.prod.outlook.com (2603:10b6:408:110::11)
 by SN7PR12MB7346.namprd12.prod.outlook.com (2603:10b6:806:299::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 20 Jan
 2023 12:41:11 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::d7) by BN9PR03CA0726.outlook.office365.com
 (2603:10b6:408:110::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26 via Frontend
 Transport; Fri, 20 Jan 2023 12:41:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 20 Jan 2023 12:41:10 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 06:41:09 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 04:41:09 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 20 Jan 2023 06:41:08 -0600
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
X-Inumbo-ID: b92cd37a-98bf-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsjh7NlFYCdpSPT9rWvWt3pWpsub3Lpcm7XBFwleY6NvlBIbczBuBeeUBtPlmsHPhsilJ/UUkVwqx1OGIlkjDnOZEuTZXD2fA5jP2Ijt2RvogRd4DlavFUN1NSJckda952nwqa1sCBuL2Hf2mqhhDKwgtP/j+KbdqGK9iuv1y3OOojznsq3xBkPqGxZ0ud4d/hRnrfkTYRc1NtqgiJLoA8/KrHjQOYBcb4T7ON+vi54PgaIwX6GByjXJvlkBgHuDA6zmIGWQMZPwgHPbJIAWW+hM23KnWI7bfEGhhn+U7zcUL45JbtuLyGfcdYTtIt/2Kpgpt3yUx30xB+ZFntymTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtKChU3iccf56959COJY4jcxhHIUCtrIhSBaGsCJg+Q=;
 b=aYEWjJl5k4DHDw+Ui8LxeVkQPlyZzcPilFTxZ4pn6fK/Kd3XWukhd8vmahcXPafJYoRFaedR2h4kk7wko1LqWLCPzs5juRROsOdDtAz+Vr7bpQHBkw3SYtly6aMkzQaAlLVwmD8Md0EepSUWFAN/Ktlt36oTPEWuEhejyNsM7427JvPScGR2JSyAHecI+dzLiGYwhXrpeXf1pZqH/ixOe16G7+GXfkAwHDxaLnCni3xszvEQI0BKb9wSmmzpdLUleVHUt0MfQDhEUXtAQ3H4NAUa2AJ/XUvazqgjkuYOWEym/VWGpdSb1j/FCRvnSc2WLLnlgsLVUQA4pHZ0KjLG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtKChU3iccf56959COJY4jcxhHIUCtrIhSBaGsCJg+Q=;
 b=yvDdZHGhUfLn8r6jYl3Ab4WI6M5zMQZDq+RF/TXAeAUdhXN+OxroMFaJoRGViUVuzuMSQaXuqtd6bRpHPB4fk5KDZBfdeEU279SkvnBnupb94xmlWLZU1kraIJxMgqCvJHVdcJOre0K24SUi/xZLxVNEwAsdEIqwek9ljZSOTRc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c24ecaa1-2b55-2ba9-25b1-ff18b15f2d1c@amd.com>
Date: Fri, 20 Jan 2023 13:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 02/16] xen/arm: Add CONFIG_OVERLAY_DTB
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
 <20221207061537.7266-3-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221207061537.7266-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|SN7PR12MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f80213-cb9d-4a35-d954-08dafae39be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L0yNUJUjB9knflPZ3mlMguFHTmUbSc31/xV7KtH/1c5FCzDAfqV+Dh2RvbzsWCqIFTRRGeXtyJX1JoQnWV9JjIR+j3vfg9ucMeYBd95bww6COErAHxO+8qtrOOner0BDiQWWMPfMuyJAT/vbib1kfERf6q9ABiCZHguhajkYKHwZKBG2PdlFiI1kkOvf7yhBBvCD0zwLL0OhQFAZU3yzlMdRYU1Hs4RHwk925aExYPi/HehblilralWVHQsc7Uqnv+a2B3DsqbDZND2dDAmSmQq9bFksbs2GkrH114rXDr4/Cq2JLg/5YQmGdjM5GY61iqftjOhJfk+SU5H7XYOAl7CuYH5LA/k+CB1+88oWUbq1zueaYKWJ3DZp/toflJKREcnKkldawceVNztJnV+q9DNdNmQaJEJu1UH6NLWRuHAZ1IbeOUP4QeBbWr+QAU1AI8mCZUbIje/HSK+ZjXIaN4E/VczER6odtFGzfxTnrBfgSAuILoIxQbSrvuXWjGhxndEEz9/LWX6K1y+r7Q1XQ84GRuS+QchISyk03nrHSBdi4lNLwgYeTnQVIiufGE3zSPH3LJq4XuHrV9e5uF4yrzbcTZzBjv+uV9CL3fpw5sCb+lF7ZndkYOZ5LnVz+uMYMr7N+ikQKtsUd2j5pUPn8x2CboTI7Lk2nSEQd+fkWAi8VbeY3H9d4+C+DeBBDoAiu72O9dA4sXZeqGZOKJzZEoKGl60zfJH30t5c7K2QmJacVzwZx6ZX7UdzhDIl+ohV4qFOPeBMEW0+y1WzxzoABw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(478600001)(54906003)(53546011)(31686004)(110136005)(6666004)(16576012)(8676002)(316002)(186003)(26005)(70206006)(70586007)(336012)(8936002)(36756003)(41300700001)(2616005)(4744005)(5660300002)(44832011)(86362001)(426003)(2906002)(36860700001)(47076005)(4326008)(40460700003)(82740400003)(81166007)(82310400005)(356005)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 12:41:10.6060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f80213-cb9d-4a35-d954-08dafae39be7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7346

Hi Vikram,

On 07/12/2022 07:15, Vikram Garhwal wrote:
> 
> 
> Introduce a config option where the user can enable support for adding/removing
> device tree nodes using a device tree binary overlay.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/arch/arm/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 1fe5faf847..ae2ebf1697 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -52,6 +52,11 @@ config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>          depends on GICV3 && !NEW_VGIC
> 
> +config OVERLAY_DTB
> +    bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
> +    help
> +    Dynamic addition/removal of Xen device tree nodes using a dtbo.
help text should be indented by a tab and 2 spaces.

> +
>  config HVM
>          def_bool y
> 
> --
> 2.17.1
> 
> 

~Michal


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E12808680
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 12:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649794.1014708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBCLZ-00085u-B1; Thu, 07 Dec 2023 11:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649794.1014708; Thu, 07 Dec 2023 11:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBCLZ-00083V-7H; Thu, 07 Dec 2023 11:15:13 +0000
Received: by outflank-mailman (input) for mailman id 649794;
 Thu, 07 Dec 2023 11:15:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3y0a=HS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBCLX-00083P-JB
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 11:15:11 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20609.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1c813ca-94f1-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 12:15:10 +0100 (CET)
Received: from BLAPR03CA0151.namprd03.prod.outlook.com (2603:10b6:208:32f::15)
 by SA3PR12MB9129.namprd12.prod.outlook.com (2603:10b6:806:397::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 11:15:06 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:32f:cafe::20) by BLAPR03CA0151.outlook.office365.com
 (2603:10b6:208:32f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27 via Frontend
 Transport; Thu, 7 Dec 2023 11:15:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 11:15:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 05:14:31 -0600
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 7 Dec 2023 05:14:29 -0600
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
X-Inumbo-ID: e1c813ca-94f1-11ee-98e7-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daDGcZYMG9xRyEOm3Pk/1xq4JrME9usqwpfA6dua4SZKAXU4j9q3YP4BvXmEGDy/Z5ur/MNLlw8cHwtX02MWNUK1llZzOtN7L/TFaMzD9N8uqj6JRV61kPKr8AWhDNz7otz83D6DGobgEgpuBJp7IyLHOWhFeNCYUHdulRIfiFMc7udKqoHsq6XnE9cKkPh+Hsi2aXuVUQ87K4Z4wtrwrU67ugzh9ndYtv5pbT5C+xrPb9QF8IMYBabwFSO0Hfy8G6oengIjFyHjdejoqRcPvFiV/Ay3Pz79RJA3qpvVDxy0R6f+Oq1PgWlUaV9rT6dqa/YUVsG1mNX4t5P0v64t0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SauPA79bymWKrMvjTmM2TMRpZe9pqSp1BuXurZZVn6U=;
 b=II5bkTC/JkDaHQ5gZDv6yeCL6JPlTY6O1qjZGIWWyfhFqXShbCX5Q8ac/52ATBpDtWVkNHG7yuVk7UPtRwVEIsvmP7+/0Jyp8keh6alRgg/aox9K+D3sKdZjiRIhS7f2wKBnq9Fcufhq9Ap7dQTQw84txfVQGOWBHFZyRT0ihpwV8vugrc7iLlUOlJnDoP0uF1mP/q8kXgQ7INq5ONyGNXUzWsj5lqSjSFfqYXne6Gk41IbNHMYEIWX6kNYc6W8RSNtZfYoOTZC/qRAjo3WmSTjapwgbRODwb/Goc3aIbJQwZ84qij1E+Wv55idDtrgzgIfYcJUYtPP+H2jU/Zk/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SauPA79bymWKrMvjTmM2TMRpZe9pqSp1BuXurZZVn6U=;
 b=3Nv8H4powlm1TyaHyfLpPU0jUWUIXl6epiNsw3YWXrT7b98XC4X2IQ0B1/KTy7RQJ+qpQi2HwATtssnIDTdvoTr1kBGc5DyCNIz1OiOZcqtqCcngRHNvql3/1vOVvMXi/flG2kQgBHSpT2NUH5NReickYrKJTIrqt/BJx458Z90=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6b2696de-c70a-438b-9053-3bfab5cffead@amd.com>
Date: Thu, 7 Dec 2023 12:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] xen/arm: fix duplicate /reserved-memory node in
 Dom0
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
 <20231206090623.1932275-11-Penny.Zheng@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231206090623.1932275-11-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|SA3PR12MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 115b278a-53ee-4406-ce1b-08dbf715c47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T+mjCaWaH52iSqI7kVwmlAbijbMqTazZLL6sTfpzrfezJv1feIkr8V8xQdafU30jULFwzSoZF7x18WguHEBPs2q1anJ7xgJOY8SjReCbewD09UgVmyFd5OwCWG7DOKOnUkOW+qBV1poqtJlq+RVMwszcCzpB38PRuaebF+cSyiNPh29E80/OusrjF3iTNHHLcXrE/t9upySPs394Nufh0hZl7VHLq5EBdL11++4ANZPbco4SbEcu1p3pF9z5K4PCxCpdvh29Y7/H3+oH41OmAjBxtC1rP4ui3cjU6wjCdIoc6FnoFcbS1BSTUYhtd4UzTI75plpxEz6b2cMYyuEsTFEJ3Ji4DsCZD8bxcvoq2GTvzJpaAaBvB/r8uBVaYoy9SHA40R0K1M42dIVVCCgQ6op5XdXol1WVaX/v+7UcPlqhVFZvIBFqb/K3DXt+xTkwpI6+5prLsqaCfzsb7n4Xj1JTNQ5NPJO1qSbeG2UXzQNnMZdyEnRP1lS6SExFKtxzRBDpmLYSYsBHUNa9RltfF15NHhRSm6UhX0GijPCCK8PsmYjiBfvYa5UgQLVg1Y5KzGorFTh6Kofqmyx6Rey5p9FKgZc2zlL5dAprUKaw8jJ5lel6iK6iqn0tMwUJoSqwFZLwU5IU0RoBIIBftAgRMm0iRjBIytWLBQ6G4mu18fEZx2SbmH3B875hpAkpnKFfCDQpl8Gv/9vsNA56WK4ldNZOYhQWSPez5vcIdEtDPu0kt2adS7u9nXzQ/F1JgZsOUXswa4T4ypty93k7hmFZ+73GlEZzWQp0FnIzZbkJOHqbJe3uIsTQQ0yi7ghjefVX
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(2906002)(5660300002)(31686004)(40480700001)(44832011)(8936002)(8676002)(4326008)(16576012)(316002)(70586007)(54906003)(70206006)(40460700003)(110136005)(47076005)(36860700001)(478600001)(2616005)(53546011)(36756003)(41300700001)(26005)(336012)(83380400001)(82740400003)(426003)(356005)(81166007)(86362001)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 11:15:06.5541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 115b278a-53ee-4406-ce1b-08dbf715c47d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9129

Hi Penny,

On 06/12/2023 10:06, Penny Zheng wrote:
> 
> 
> In case there is a /reserved-memory node already present in the host dtb,
> current Xen codes would create yet another /reserved-memory node specially
> for the static shm in Dom0 Device Tree.
Rational missing:
This would result in an incorrect device tree generation and guest would not be able
to detect the static shared memory region.

> 
> Xen will use write_properties() to copy the reserved memory nodes from host dtb
> to Dom0 FDT, so we want to insert the shm node along with the copying.
> And avoiding duplication, we add a checking before make_resv_memory_node().
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> 
> ---
> v3 -> v4:
> new commit
> ---
> v4 -> v5:
> rebase and no change
> ---
>  xen/arch/arm/domain_build.c             | 27 ++++++++++++++++++++++---
>  xen/arch/arm/include/asm/kernel.h       |  2 ++
>  xen/arch/arm/include/asm/static-shmem.h | 14 +++++++++++++
>  xen/arch/arm/static-shmem.c             |  6 +++---
>  4 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index e040f8a6d9..f098678ea3 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -752,6 +752,23 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>          }
>      }
> 
> +    if ( dt_node_path_is_equal(node, "/reserved-memory") )
> +    {
> +        kinfo->resv_mem = true;
I think I raised this concern last time. kinfo is used to store per-domain configuration.
Information whether the reserved memory is present in host dtb or not does not fit there.
Therefore, I would move this flag to bootinfo.

> +
> +        /* shared memory provided. */
> +        if ( kinfo->shminfo.nr_banks != 0 )
> +        {
> +            uint32_t addrcells = dt_n_addr_cells(node),
> +                     sizecells = dt_n_size_cells(node);
I find this always a bit odd. Just uint32_t sizecells on the next line, just like you did in all the other patches.

~Michal



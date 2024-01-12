Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFD582BC01
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 08:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666675.1037465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOCFE-0001rv-LC; Fri, 12 Jan 2024 07:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666675.1037465; Fri, 12 Jan 2024 07:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOCFE-0001oj-IU; Fri, 12 Jan 2024 07:46:24 +0000
Received: by outflank-mailman (input) for mailman id 666675;
 Fri, 12 Jan 2024 07:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=12w8=IW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rOCFD-0001oY-JW
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 07:46:23 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac3a7c06-b11e-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 08:46:20 +0100 (CET)
Received: from SJ0PR05CA0103.namprd05.prod.outlook.com (2603:10b6:a03:334::18)
 by BL1PR12MB5192.namprd12.prod.outlook.com (2603:10b6:208:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Fri, 12 Jan
 2024 07:46:16 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::bb) by SJ0PR05CA0103.outlook.office365.com
 (2603:10b6:a03:334::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.14 via Frontend
 Transport; Fri, 12 Jan 2024 07:46:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 07:46:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 01:46:15 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 12 Jan 2024 01:46:13 -0600
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
X-Inumbo-ID: ac3a7c06-b11e-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKdHEDxHvKJkvaFl8rAcLP4AYLywqpJEq8RMx94YQZNvNgoUUm/A0TxqX2RO8r0l/tp/xhxGdpNMlLypTTIW4DPpWtM6UT4p06FacAl//7sZxJ7B15b6GWSlKycXrUxT3rJ75aKDs3cCwGk74aarjSVBopmYgi7VR3NExaC64trjZrLLFhDBz03Owp/o6pTY0FkPsZWpGyq5yr/h+PzH9TUr9CAuueYU6/twLak8FeD9zRBRybdJiuyn/Z/ToMKvxMyUlpp6J4SvvqnunvU3RNcNIIYQp7UEc2K0Zu8hy+sqSJZOfeJreueQC92j3WlcGQXwKoXkbDzH+WkeKHSrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnd7J5FANgzq3NBtty+tCjcs0vY7BqLpDfokzVuEKQE=;
 b=JmmsOjP5BhvSiOPX2Bt0UuO/0yivVjXBVp3iyt18gClog7ngikDEjmgejpmC/ZH5VntPxrqRO0GNU7uJuVDOyPtLDffH3EG2jGfV28YG3SsGb/ScfkqTrQjfX3ww83puzXKAbfJpv9Eu2CUS1lrppP/jwE+YwqhYZmzx70amxxG/isWHulUtFbuGNmysbT19HPqR7fd9Z3a1mdI8rHM3AiPc85Qq23UUpO9iBoixA0VWyv9V/6h3AM7soMWey1Cb+NU10HsdvkjjpP9YU+iaSVntY/0zI/W3gHrWJxU73LzhX2eSIc2JNv8aAWYSrjdQmAHvKuyy2DSTU0ycT9IGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnd7J5FANgzq3NBtty+tCjcs0vY7BqLpDfokzVuEKQE=;
 b=NTzIT+JTcPucuS7BuPOIT+eFAOM1mW790WrWyzEaBO5yzlDcQn93TdYlvRSpJdnTmcE0sKEzC5QM/y4XnL0Ko+60pwd/b9paLAWW3jJOcQ3DvA8H8hjm+5Sq07YUbZnnl6E6ZkMTd7rwkU0HINZqL1RZ88vCDJSjfocJ/spsmiA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a079dabf-b938-431b-bbde-1f15b3a9a757@amd.com>
Date: Fri, 12 Jan 2024 08:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm32: head: Rework how the fixmap and early
 UART mapping are prepared
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240111183410.45566-1-julien@xen.org>
 <20240111183410.45566-2-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240111183410.45566-2-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|BL1PR12MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: f9df7123-c163-47b0-7efb-08dc13428e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZNeaqI16V/HhwGM0T19PhB9UBXEkOV1B+E7+KcZfuqV6P5hQ3zJLC5N3SYp4vGeCi1rAQCLuZbeVj5QfUtXk+V/ZRqFtnAT1dhfz7o57Sxs32mXkyQ4PjmXXHas32JMoG3cEFWXFsAZigNfcs3AaexkQ+5+cxjFhSqr99YxIDkfHTtqibEEX88HKFKpqoNPIUddjT5+2J9CFiAV9672SOB81Dfbao/VZVvLYFVFazKI8CvMElxTuVJigIkpTAgdZ+cV7Q9ViYpxGMighJY6xHtAZCU9dsHV7obvX5vRFpa5+lAj+ZFTjtMQDShSNnUT7JRAkSEs6rxQvQTviCMfX6ZnjTniQeYeDI+IZPuUeMhOapdMxlzi4HE5Gn02LlH6m6axQ8xGSP0cqwpX4/6moqypCOUcToEaPWUZtdHdG6Da5KHh0bjnYMyKJIqP8SXz6WSoL5AIzXpdOeGHtx1k7JksG38hPLj6RJSMfL26lsoI4CAsaNnhOTNlYMYJYiKTbxKeAb2kf+k9iP+hO3525TGW6vjF5hB8BtOVs8fkk6TWJqWh0VPaSPU6XVOpQIrBza5NlO9FCankjMUpZlmGAiNM614UR3rVio5CdsWMRP1Uhe/Zs7KCQzBIb5aDoU/cTmFOcIhqAmMlCshPiqsfnVIZjb9wCslDvlg/JpUFBMK0u8OgEGneJUEECsyiwyI7PpXgmPCGaqcdyHjdA82xg0Bv0F0MNSsJ3ajIe+RgZSetlcK2SZ1AMEOGKnk75D4nQbfI4UCopBTgVUluOA2SDzOzoD1yod0UG3YP0UC6Ytzi4pJkDM+52WelFqpUQTVag
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(186009)(1800799012)(82310400011)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(83380400001)(316002)(16576012)(47076005)(70206006)(54906003)(70586007)(110136005)(53546011)(31696002)(44832011)(5660300002)(26005)(426003)(336012)(2616005)(81166007)(8676002)(8936002)(40480700001)(40460700003)(4326008)(82740400003)(356005)(36756003)(86362001)(31686004)(36860700001)(45080400002)(41300700001)(478600001)(2906002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 07:46:15.9252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9df7123-c163-47b0-7efb-08dc13428e92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5192

Hi Julien,

On 11/01/2024 19:34, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 5e213f0f4d2c ("xen/arm32: head: Widen the use of the
> temporary mapping"), boot_second (used to cover regions like Xen and
> the fixmap) will not be mapped if the identity mapping overlap.
> 
> So it is ok to prepare the fixmap table and link it in boot_second
> earlier. With that, the fixmap can also be used earlier via the
> temporary mapping.
> 
> Therefore split setup_fixmap() in two:
>     * The table is now linked in create_page_tables() because
>       the boot page tables needs to be recreated for every CPU.
>     * The early UART mapping is only added for the boot CPU0 as the
>       fixmap table is not cleared when secondary CPUs boot.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with below 2 adjustments:
> 
> ----
> 
>     Changelog since v1:
>         * Rebase
>         * Move the UART mapping enable_mm_boot_cpu()
> ---
>  xen/arch/arm/arm32/mmu/head.S | 61 ++++++++---------------------------
>  1 file changed, 14 insertions(+), 47 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/mmu/head.S b/xen/arch/arm/arm32/mmu/head.S
> index 4e6395e7876d..a90799ad5451 100644
> --- a/xen/arch/arm/arm32/mmu/head.S
> +++ b/xen/arch/arm/arm32/mmu/head.S
> @@ -165,11 +165,6 @@
>   * Rebuild the boot pagetable's first-level entries. The structure
>   * is described in mm.c.
>   *
> - * After the CPU enables paging it will add the fixmap mapping
> - * to these page tables, however this may clash with the 1:1
> - * mapping. So each CPU must rebuild the page tables here with
> - * the 1:1 in place.
> - *
>   * Inputs:
>   *   r9 : paddr(start)
>   *   r10: phys offset
> @@ -197,6 +192,10 @@ create_page_tables:
>          add   r5, r5, #PAGE_SIZE            /* r5 := Next table */
>  .endr
> 
> +        /* Map the fixmap into boot_second */
> +        mov_w r0, FIXMAP_ADDR(0)
> +        create_table_entry boot_second, xen_fixmap, r0, 2
> +
>          /*
>           * Find the size of Xen in pages and multiply by the size of a
>           * PTE. This will then be compared in the mapping loop below.
> @@ -442,19 +441,20 @@ ENDPROC(enable_secondary_cpu_mm)
>  ENTRY(enable_boot_cpu_mm)
>          mov   r6, lr
> 
> +#ifdef CONFIG_EARLY_PRINTK
> +        /*
> +         * Add the UART mapping to the fixmap so the UART can be used
> +         * as the MMU is on. This only need to do done on the boot CPU.
s/need to do done/needs to be done/

> +         */
> +        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
> +        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
Would you mind listing r11 in the Input section of a comment?

~Michal


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950AF6E442B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 11:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521893.810888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLNG-0004jK-JC; Mon, 17 Apr 2023 09:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521893.810888; Mon, 17 Apr 2023 09:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLNG-0004gk-GL; Mon, 17 Apr 2023 09:42:14 +0000
Received: by outflank-mailman (input) for mailman id 521893;
 Mon, 17 Apr 2023 09:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncOi=AI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1poLNE-0004gc-Hn
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 09:42:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fc76888-dd04-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 11:42:11 +0200 (CEST)
Received: from MW4PR04CA0050.namprd04.prod.outlook.com (2603:10b6:303:6a::25)
 by IA0PR12MB7628.namprd12.prod.outlook.com (2603:10b6:208:436::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 17 Apr
 2023 09:42:07 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::de) by MW4PR04CA0050.outlook.office365.com
 (2603:10b6:303:6a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 09:42:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.19 via Frontend Transport; Mon, 17 Apr 2023 09:42:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 04:42:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 04:42:06 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 17 Apr 2023 04:42:04 -0500
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
X-Inumbo-ID: 1fc76888-dd04-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEi8DUJjviYeEcDBk3mkvqlkEtQA9Sxt+CuiJhCyQtopQutGoRTcLXa+nFl89XBfjwK1FMjG0AF8H8l5FZzKXavRAVM+C1iKV9n1Fj6997New7XKMxsFv1lwMgDPtWTZePDJnJC1fAbIOuS6L7Ut7zxcc4uZbLN0I+eqAfZa1bnEVU3RBxOfAe0zdHvqqxgrPX2UJOEYailALXfqPn3HeHA9ZiRdibDuO812Nz9LVjnqWX7AnSkZqeO3NywljibBt02/YURt/uZEFGry8Z06Ior36FVWIR/bIldD+FMbIdWl7ed5JjSneAJc9rUuvdyZJxNMqbAMGRqSs1nMoYNmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwxDBkwwAOkhG7T9g8ihpMC8ekDPONtAy2podrYq4lA=;
 b=ZXBSUpWHOEtHhrf7Q01jx6J5XqIvSXr1Qvxw4mWHECTKyTnOZ7+TBoskA3TES/awPJmQieqtXcWFMtuMTDfTi+xu6mCAx51Hk6hWg/h6vnERqbjJQ0PB2Fl21jFPyIS+Rj6owL+BeADJdlH4SaTTgVO7l9np9OQQGpRn2cQ5dQG0mxMHctJJnT7jxGYu324kbuPBUi5j5MfdARqjfHsBkM57ThDVhx85Jk5XWFZ1FZwHegO0luIRujYMn9uOf3m8Ah6jXLoAjZF3VzSJVeCOkA89oFYBHnr90+LdFxe/tXKkHjo5HAV7IiYp8nfCQnR6W2BhDc42AbjmL3ORvfAlcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwxDBkwwAOkhG7T9g8ihpMC8ekDPONtAy2podrYq4lA=;
 b=YfeM1460YhiObjo/TbuXYi4xFA+yrdwLZLZTQ6kOjfeGYuNQ6U4UI5PKFllHlUKJf2Vk4Zkivw0TnWR+pEDigSKc0FOlfN7PkBKrjyeOiQk3q3XDZHxkYRFSFKNouN6KPOLtU016abGNkIuMKUZWuIe19tsrDJRG7rhyfl5JObo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <70a79d55-3f16-d371-23e9-e3650e47b00d@amd.com>
Date: Mon, 17 Apr 2023 11:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 11/17] asm/smp.h: Fix circular dependency for
 device_tree.h and rwlock.h
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-12-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-12-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT035:EE_|IA0PR12MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 9034ea9f-76d7-4a54-dc55-08db3f280247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WkBPvT910YlzhLPopo3ylZMOvWsIipjVApDdeuLc1Omvp+1oaPpFoxGKUfo6TrpoMg2OGw5gRVZNyFQ1EaidIJ1d8kdEyuQQIq+rWiBLZtJsDJ+oBiyw98wXR4A7YfNsQmhDYDKaPAjFE6shLf3ZV0fRlY18yBRd9hTcbzYSeDQMs9Dpau9MhFRHtV9pkG+r/Qvm2mhwlFHFT2LlflRCiwXS9k6WOq/S7N/YGc136BYYEw5nEWGKa0ZitTx7zohxt6sV+KzqQbrBHQAHt06uciRO9ZN00E7u198DbvRkz0ZHgL4h1lmpvfCY1SghJgAQEdYd728p2UOr1uJ0t/+hOQYeA1wowUM49ylBDCY1Iltv2YaPRUVNyXrY/5yU1oDpX/qaPv45AQVJscIUhL9KvBxnLC3t3tflOFxpu/7D46MMzXG5GLayjFAWJlAeuWg8H46Vru1konosAPFLnxZSD283V8ltp7jRhUr0WgxJK6ql2Fpex14d2hbScLfK1/Fp0ybaaL1fu2Hg6NGzl5o6byBGp12cUFGez//v11ePnbPqMbcM4MGgtoM8b1Qkc0x/oSe4sU70pCa3kUdRUTqv+OhCg1/nU2taHHt+uJQ06oAlx0FvwET2A2V29vTIYHo19q9bE0Nhlfg+RvuOe63N0F/eaAtg6wfHTNdFrnzlLNnGVfEnyrjIuv//UMXgH9ZF2lpVcBN2tkZ/6P6Xxt2uA+TKzfZ+Ka061ggXrwL8FyQdDYzZwYBBcYwZMFw4/6KS7e4bnFY16mYH5zs/OrIdJA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(36840700001)(40470700004)(46966006)(31686004)(8676002)(4326008)(54906003)(70206006)(70586007)(5660300002)(8936002)(40480700001)(110136005)(16576012)(316002)(478600001)(40460700003)(41300700001)(86362001)(47076005)(426003)(31696002)(83380400001)(2616005)(82310400005)(336012)(82740400003)(36860700001)(81166007)(356005)(6666004)(36756003)(44832011)(53546011)(26005)(186003)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 09:42:07.0844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9034ea9f-76d7-4a54-dc55-08db3f280247
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7628

Hi Vikram,

On 11/04/2023 21:16, Vikram Garhwal wrote:
> 
> 
> Dynamic programming ops will modify the dt_host and there might be other
> function which are browsing the dt_host at the same time. To avoid the race
> conditions, adding rwlock for browsing the dt_host. But adding rwlock in
> device_tree.h causes following circular dependency:
>     device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h
> 
> To fix this, removed the "#include <xen/device_tree.h> and forward declared
> "struct dt_device_node".
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/arch/arm/include/asm/smp.h | 3 ++-
>  xen/arch/arm/smpboot.c         | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
> index 8133d5c295..afe6129276 100644
> --- a/xen/arch/arm/include/asm/smp.h
> +++ b/xen/arch/arm/include/asm/smp.h
> @@ -3,13 +3,14 @@
> 
>  #ifndef __ASSEMBLY__
>  #include <xen/cpumask.h>
> -#include <xen/device_tree.h>
>  #include <asm/current.h>
>  #endif
> 
>  DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
>  DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> 
> +struct dt_device_node;
> +
>  #define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
> 
>  #define smp_processor_id() get_processor_id()
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 412ae22869..336a7d418b 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -11,6 +11,7 @@
>  #include <xen/cpumask.h>
>  #include <xen/delay.h>
>  #include <xen/domain_page.h>
> +#include <xen/device_tree.h>
Headers should be listed in alphabetical order, so device_tree.h goes before domain_page.h

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


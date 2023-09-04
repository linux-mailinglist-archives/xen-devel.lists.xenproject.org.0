Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735AB791612
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 13:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595063.928549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd7T4-0004RY-Aa; Mon, 04 Sep 2023 11:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595063.928549; Mon, 04 Sep 2023 11:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd7T4-0004Ml-7d; Mon, 04 Sep 2023 11:10:06 +0000
Received: by outflank-mailman (input) for mailman id 595063;
 Mon, 04 Sep 2023 11:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ceyR=EU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qd7T1-0003vt-TY
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 11:10:03 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9789a2ca-4b13-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 13:10:02 +0200 (CEST)
Received: from DS7PR03CA0251.namprd03.prod.outlook.com (2603:10b6:5:3b3::16)
 by PH7PR12MB8779.namprd12.prod.outlook.com (2603:10b6:510:26b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 11:09:57 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::35) by DS7PR03CA0251.outlook.office365.com
 (2603:10b6:5:3b3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Mon, 4 Sep 2023 11:09:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 11:09:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 06:09:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 06:09:53 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 06:09:52 -0500
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
X-Inumbo-ID: 9789a2ca-4b13-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvEFVMxV+WtcG7I+db9k46EH9BugIPAsywS/t+ep25jqfbyhAJp9cbMTVRXxFgEKJONzy3OCQtK3Z4Tu4Pwz+63kla0HLErlhfyUqS38E+lsMQIVh/W+juqJr8IoUaeL3r86PEPSGW577nkgTfC+NGr7f4A6LZHJtWMIZDgsSrWX/6mHyYC7r5OXKR1fKKid3FBHma6TequOWBJZFekKtg3f/wHIF4CBuwx7shm22zCOdn8gUZaiIQVVwHp/I0NbevztFISzyHWkJ7XSPjcwd1d6LTe2nrR4OjvO9zxhlhYxOHQP7cCtx6tcxAqAg0aVTiwtX6NP4ylY7ehF3pY/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sGROfzvEVePyKFycxc70YFM7l53m46UweqOf7/QWGw=;
 b=ZTp0sCmllkUvqHZDKzaxcdqbOzd7hCGUwat6/LJv9lMPKQKorVlH+WO5inQvsO9txdskpF7YTUxks3a4OlaLDUkxwQ3//elXWCtxOKycLy4RpewM2VYm1ZxiWRPrt8fSi1oSyAUvSTuKNL+JvWcL2+c/a1r1nUPdZgF8Wxgk+uAc5kMMXLkHkRGvXh6qUO04vgoiLh0koDlxYmWnpS5cNq309KzVF84dWS4BzmNUIBNmkI00hVkO7amWKje7GC1jZA/hsFCllUk4LQS3IuKAZzR4TtARcryYkST3mqKRmgQr0AN9xhxMgHb+phLHMNi/Jy8XHq/V7TnDPExJpJ/N9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sGROfzvEVePyKFycxc70YFM7l53m46UweqOf7/QWGw=;
 b=4BuaLzbXgLxOZLf0/NSKTvh07x5xyQUFtPHpzwqG+gaEz8a9il7Bf3aF4ZJGBle2Ack51u51gmvE/u2uG7e2zyWOC/aO7/U5KPl0soKWX+i34KZqBbvyv3iWYqLi1+2WgJsw9JI+9sJBR7RYSuJMXLc3eD6OKihS+YVWy6OETAo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <227d9107-5f5c-b773-639e-ee59a7047a27@amd.com>
Date: Mon, 4 Sep 2023 13:09:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN][PATCH v11 14/20] common/device_tree: Add rwlock for dt_host
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <sstabellini@kernel.org>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
 <20230901045947.32351-15-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230901045947.32351-15-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|PH7PR12MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: c0150d69-2e85-47e4-77ef-08dbad377912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MlV9mE0UZ1MMLRVdl7XiNpYXb73tQPy3FVBNj89IqCZb1a14oGVPnZmIIkMw8XaBpjhVsTS7r7UyC2dUX4pK+4olQsB6xSZe5WG70t6ovWyGVvcLX7VeITZ4BcPgNBxz6+CVpgzZThf4WV8g5szT1uW2Nw1eHCCK2gHSXuSvM+F2EDbuklynhLkbFV0+DbjaNHsH6QbFmTQDvSVQiWQODq5xOJUmXi+ASdMl+z6skLtSoNcvG7+EPQ0pJOyDW2LE0s7xwkX18aAHMr2/FOQ0k8JO8SnxdwnicsYK+Ey3cPIkDNKFZ2S+jWPM7jlB2AaDJim00EjMY/0SSl4wsGCn5ug3qQwGhlNISZIAnERe3kjgdzO/N2Kj28GyCBhi2sO6ShaClfHS0FbHVaF4wGks6Msh6Q9eLS4DCOqzG8x14JJ9oXbavsSMYLNQcFx34ZFkyzvkMptVmXeXQEnlgmZsxLbWVoCQCImlq+VTutjNSrTQOpvWKh7oE/8GN7W4+qkXt25/wLlKZ1JauIWQxm5td86LPmUJ1jAmZIfehNaLqRW/Fva8wBup2iATyUwAB2vkAdTX631bOBbVkGNEvqm00JKWeHuBiwsAqLEAz7EkAOQXtIvRBsAcRthqljypSYidhpl9SW4JZh1wmcASRXdFoBl57TRPT0AL6wuSNqF3Zy/2meIn/6UyD9jTDef1sQM5tfdSQG+2RIqUVliZiJBU/CXNuujju7IDOxsbm56A+cUlPqgfpO+P3rMFa0Etu5jTUCDhaAx36zU798XV2Q3JZlAyjbbJfoz1+6IIqLim1qOD6wbBu7RvVPq9MrjUxYvu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199024)(186009)(1800799009)(82310400011)(36840700001)(46966006)(40470700004)(8936002)(41300700001)(40480700001)(83380400001)(44832011)(478600001)(2906002)(70586007)(5660300002)(70206006)(31686004)(110136005)(8676002)(16576012)(54906003)(316002)(4326008)(53546011)(2616005)(40460700003)(26005)(36860700001)(336012)(426003)(356005)(36756003)(81166007)(82740400003)(31696002)(47076005)(86362001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 11:09:56.8335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0150d69-2e85-47e4-77ef-08dbad377912
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8779



On 01/09/2023 06:59, Vikram Garhwal wrote:
> Dynamic programming ops will modify the dt_host and there might be other
> functions which are browsing the dt_host at the same time. To avoid the race
> conditions, adding rwlock for browsing the dt_host during runtime. dt_host
> writer will be added in the follow-up patch for device tree overlay
> functionalities.
> 
> Reason behind adding rwlock instead of spinlock:
>     For now, dynamic programming is the sole modifier of dt_host in Xen during
>     run time. All other access functions like iommu_release_dt_device() are
>     just reading the dt_host during run-time. So, there is a need to protect
>     others from browsing the dt_host while dynamic programming is modifying
>     it. rwlock is better suitable for this task as spinlock won't be able to
>     differentiate between read and write access.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes from v10:
>     Add ASSERT for iommu_assign_dt_device() and iommu_add_dt_device().
> Changes from v9:
>     Update commit message and fix indentation.
>     Add ASSERT() for iommu_deassign_dt_device() and iommu_remove_dt_device().
>     Fix code styles.
>     Remove rwlock_init in unflatten_device_tree() and do DEFINE_RWLOCK in
>         device-tree.c
> Changes from v7:
>     Keep one lock for dt_host instead of lock for each node under dt_host.
> ---
> ---
>  xen/common/device_tree.c              |  1 +
>  xen/drivers/passthrough/device_tree.c | 28 +++++++++++++++++++++++++--
>  xen/include/xen/device_tree.h         |  7 +++++++
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index f38f51ec0b..b1c2952951 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
>  struct dt_device_node *dt_host;
>  /* Interrupt controller node*/
>  const struct dt_device_node *dt_interrupt_controller;
> +DEFINE_RWLOCK(dt_host_lock);
>  
>  /**
>   * struct dt_alias_prop - Alias property in 'aliases' node
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 80f6efc606..1f9cfccf95 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -31,6 +31,8 @@ int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>      int rc = -EBUSY;
>      struct domain_iommu *hd = dom_iommu(d);
>  
> +    ASSERT(system_state <= SYS_STATE_active || rw_is_locked(&dt_host_lock));
This looks not right (I know Julien suggested this). The second part will be checked only if state > active i.e. suspend/resume.
I think this wants to be:
ASSERT(system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock));
so that once the state is >= active, we require dt_host_lock to be locked.

~Michal


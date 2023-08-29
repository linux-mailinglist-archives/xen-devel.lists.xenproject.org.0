Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6EA78C0CC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 10:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592062.924690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qauS8-00049u-Ql; Tue, 29 Aug 2023 08:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592062.924690; Tue, 29 Aug 2023 08:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qauS8-000474-Na; Tue, 29 Aug 2023 08:52:00 +0000
Received: by outflank-mailman (input) for mailman id 592062;
 Tue, 29 Aug 2023 08:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKbG=EO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qauS7-00046f-ML
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 08:51:59 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ec133a1-4649-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 10:51:57 +0200 (CEST)
Received: from SN6PR05CA0028.namprd05.prod.outlook.com (2603:10b6:805:de::41)
 by CY8PR12MB7267.namprd12.prod.outlook.com (2603:10b6:930:55::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 08:51:52 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:805:de:cafe::d9) by SN6PR05CA0028.outlook.office365.com
 (2603:10b6:805:de::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.17 via Frontend
 Transport; Tue, 29 Aug 2023 08:51:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Tue, 29 Aug 2023 08:51:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 03:51:49 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 29 Aug 2023 03:51:48 -0500
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
X-Inumbo-ID: 4ec133a1-4649-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5597FGTP94/zrbo0rMA+X6BPXiP+fPME47rGWKFSB26u9y3t9MN9ezNaZzEH/SniMzzQ9Tg2jqjLm31jJEwlXcwNCGKHF2xWMzAEPb9t9VEI0KMdfbCJjpeUjAr+YZ6Bnu89sD3fLtqcsoiLO86p4I28u5h8GiAH0+TrdlZ4WWS1sAwXEN4DeHFu5J8mXvHwvKTlYTqxm9sk9laJnvFIWImS6iQa1eq+0baAqEhFd8vlCWHeeCTNkJmjoEBdNJyMsXV+2Lu7gvnoS1j6mbKTFP8YlgmwWxN+/ohf0eIqnnm61RfS0cafQTY/5Q98Rv62TODAyJ06G9ykPd7t5ITOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nm6YW6JUwJ6SW1eI3SE7Slvyou/+82LoRoln6JIDqzI=;
 b=En29RvTPN1Hke033f9SvGV7mD3qeI+eEhVf7WFvnEYEISGrwOGXBsVJtQDy1Uw4Lpmxn/uAWZ1XP5KcNvg3X4iD9KCyfL9bQZFAzXfpiebylMJ9nei2/5MRKLKe/CqaLZSLA+CMrCtgs5ZItz6mlfJB5b0ScIiKbPDzSbG5LymdW1ZFUrOPRrw3HTxrbGXkjT5d+l9ouIpHUit+T1W5+hxYqky12AzSH3vvIyYSOSXubxmWieopd9icO7foWMFvhAVjv51Y6bs0eNK5eqDVjQubtRz6Ty9XXVvtMhKZLsOlNFKMHZblzLbXCqb/uc7QuYPI2P+KJ72o1cK1VE6+GEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nm6YW6JUwJ6SW1eI3SE7Slvyou/+82LoRoln6JIDqzI=;
 b=jhkciKPHpJluZ3O1/YKh9+7cjHaL4f6SjrAHw1GEMNqnSZTGyHN27wSnMpxtqqT9rAmaDLphN0HeEGh+IP9ddiuzKc1I+KWJeNljULPScszTCXFxnNd1qkYbhiQt3ZCbnRBJXi+n/Zdf7gN9ZEWJ8wMLsDMPKl4qE06VoRsY3II=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <32922c58-b9b4-26a1-42ef-426fb9a4b8af@amd.com>
Date: Tue, 29 Aug 2023 10:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 12/20] xen/smmu: Add remove_device callback for
 smmu_iommu ops
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-13-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230825080222.14247-13-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|CY8PR12MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: acb444ca-b8a5-45ea-5e4e-08dba86d304c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tdlpNMGI4x4tEcsPP1UeVq3QB6XGlt31mozLqmtfpE9GnVeCiU/ibim3B/uDCnIqsqs4C9K8pLYOQs9zJduexTu6xtqtuKow5Ew9GmBJVr+D6l3gru/c1xEYWeWl0V7dLfgh27IgGaln9G7H7exYamSCh5uHO+Of/wSabmKtBkQhHcDF8pwM/1JiJyhDLG+WOlZe+cU7WkAZHtt3wSEmKytI8kPWFCSJLtzmpMYS4Won5JrJyI5P0iLCXIzxECySdyNFKSkTe7UvuHqX7uyCQuQRxz5DMliXshDgk8YRoqPbwlagSHr27WcFnM/b/c9fZBW5CJ9s97Nniu4GIfmXCHaFW2iEUTlEqSPYe5nsNOHbz2splTPm77UGO//XbatwYL006g3FSx5Z6HudU7QM7A4AgavAgfE6hpFQEiH/BN3QeEhcCdoKJvGvKS0fFKDrmpO5VgXWAdVnL3rom0WPGo9VSKaczDNd+glC19B3Ouks6vqpNAr5daEw59CCjUsd76VkkgiYLwPix72D1Qwm18v5m/O1iuXY3ycsiwnRjZ4Z8uiZ4TYtbCWMkI6DiZMWsIfJJZd6CHV2jEgK9PJ/Xu7gtUUyInJeBIld6zZXiNrHgRHNnC86o8sSnyOYuhHbBj5MiZ+kiuHJE4MdEXjRVjMvbL3t/MbpuMNLxSQxDrsJ3vCBbXtymdAr2qQS8yCiEbMXy8j/bbcIJneF7fuqJi2V3Z1T4s9rE3iEXL46hrtwiYAMGhugDyFk9CbbwiQjZXt71Taq1s8LWhIFeEVJe/JcRAboemE9OWWpgPmzULCF+3ejM/NUW1IuNF0FnDvC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(53546011)(83380400001)(478600001)(336012)(426003)(26005)(2906002)(4744005)(54906003)(70586007)(16576012)(2616005)(316002)(41300700001)(110136005)(70206006)(44832011)(5660300002)(4326008)(8936002)(8676002)(40460700003)(36756003)(40480700001)(356005)(36860700001)(47076005)(31696002)(86362001)(81166007)(31686004)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 08:51:51.7645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acb444ca-b8a5-45ea-5e4e-08dba86d304c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7267



On 25/08/2023 10:02, Vikram Garhwal wrote:
> 
> 
> Add remove_device callback for removing the device entry from smmu-master using
> following steps:
> 1. Find if SMMU master exists for the device node.
> 2. Check if device is currently in use.
Since you removed a call to iommu_dt_device_is_assigned_locked(), you do not check it from SMMU, right?
You are relying on a check done in iommu_remove_dt_device().
This wants to be mentioned. However, Julien suggested to do the check for internal SMMU state.
Looking at the code, when the device is assigned, we do:
dev_iommu_domain(dev) = domain;
and when de-assigned:
dev_iommu_domain(dev) = NULL;

This means that before calling remove_smmu_master() you could do:

/* Make sure device is not assigned */
if (dev_iommu_domain(dev))
    return -EBUSY;

@Julien, @Stefano?

~Michal


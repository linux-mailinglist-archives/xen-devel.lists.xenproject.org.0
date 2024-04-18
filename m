Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B7E8A9A41
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 14:47:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708342.1107190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRAe-0004CF-0y; Thu, 18 Apr 2024 12:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708342.1107190; Thu, 18 Apr 2024 12:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRAd-0004Ae-UT; Thu, 18 Apr 2024 12:47:19 +0000
Received: by outflank-mailman (input) for mailman id 708342;
 Thu, 18 Apr 2024 12:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qd9Q=LX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rxRAb-0004AY-TP
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 12:47:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c80d2931-fd81-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 14:47:15 +0200 (CEST)
Received: from SJ0PR03CA0158.namprd03.prod.outlook.com (2603:10b6:a03:338::13)
 by PH7PR12MB7426.namprd12.prod.outlook.com (2603:10b6:510:201::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Thu, 18 Apr
 2024 12:47:09 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::8c) by SJ0PR03CA0158.outlook.office365.com
 (2603:10b6:a03:338::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Thu, 18 Apr 2024 12:47:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 18 Apr 2024 12:47:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 07:47:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 05:47:08 -0700
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 07:47:07 -0500
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
X-Inumbo-ID: c80d2931-fd81-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZo6vVvQonx601Mmr0GOsSrpLZuyWgIlmBpqu2fy7VyqzsZMrxwTD8m5/mk0rH0vGwVE7J6+P20KSjjlv1AARNPuT0ntoCnX83BZ/b5PUhb0Cyk54jfkQJYGnabPMtC+Zw+OrhTUzlMnm6KHpB/Qhyn2db6dOEDJiu+eP04J8i5z/9djp3q+QjJLP8vP6DaYQkHqEUBdfuiNTPvOV6MTnysh+M3iztpFzaN5qb9lQZ+v/Rit/SQk1kveUJljTvYp2qZEmY+BpSwWqfXtALvW0XXHqIQ73o4IWHrozP/HjD2rNyrG9j5eq3p0Rnd+UaZcacp4VD6Dv6GzNz46+oOzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDyEEaV5Lf1BiJBWQCo2jUmXJFLi9fJ044Ska+F/z1k=;
 b=EEVEOctchLCDz9upDTc30zuhdeeC0+UqzdaGbH3U9JIwaVA2j/jeQsDoM8/NbnhTbc5C9zHAqfywCaWLL99PIXJoH0a1w56ZFber1llwirBaoIQ05maP1zZxlN/DfJDGcjdslL5iqlJ5xutL1cr0ApL2oYdnW6FCEGQ2sYqnvyK6hEClK6tO2gvOJQvzdN0aMxYTwYUf7Kg53LSqmIequw5Qc40RB5uzS1BDDg/r65wzxGvUvys3AjwyKQVDDEEbrClB+6W72fJt8oe0hNXlSFNxeBxKLPA4ij/t5xCfnfbpUVnoGQh58dF0/OGB1EOlbyp5mfaivFHR6aTbnY8kiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDyEEaV5Lf1BiJBWQCo2jUmXJFLi9fJ044Ska+F/z1k=;
 b=bOVd9+Ol59WX3D98XmuzdZxETKgQExUv5lbVBLgQMSwHqVtgmYHmbkDCtY02nDZESOyblzBNxl+5BwYMUZEHpEPLgj2ZEJskOIUBXH3I7JOzqQ+sk7MCJ24uAd7IpjUOvtfJ+6gDcg3/KAJ9dCv/TBDOpWtWPJlaSbVyj/kiQYk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <abb6817c-c31a-491e-9be6-748dd1daac81@amd.com>
Date: Thu, 18 Apr 2024 14:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] xen/arm: remove shm holes from extended regions
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
 <20240418073652.3622828-11-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240418073652.3622828-11-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH7PR12MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: a060ae8f-e09c-4f92-1432-08dc5fa5a930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tj5TUNLSFON+n4tl5Cwulk+PG2yptqbCFN5qDdITyQy2KSUryaCWSNuyCrwIfvJ5HKFeww98yU7NI4lO86f0WfUrzglU5TVYhM9Mf7YETABdf/81ewsUiX5CiLVd4GazZKO+k109if7T+grZT4QCHgdNAPb5wG8Y3p5QO3WPNkaqp7t/ueQFsIZoIqL3LlqXkRVJJ9bhT1oJzwruOd8bvqbDCvyoFRWuzHZQQWJRRVTYmgKhsJpuBwXZ9Jba7j5DubxA/wBOumRuVlbeLYMVscllxZZUjoPBZ/prCFHEu9jZAjSNZXBYQEBNLxdV36re/LQE/y7c8hC06M5Mo3JSO00oX+ykzhZOnnCUeCIkSLakLzeNeiicXfkkn7Jg+b0H6vbjad9EbKD0gH1wyNh7sZ6aMR+hJYUp/qZbeQYPTDJFvGUzslC+US7/O09neryTOalsZ9F97xfUKByEzbs917Y/CkWFUvs4k4BHejsSaM65P8zSpQvTrp5lqAmnaDNV5aBfhiiXk91PL+pUwDvPvD+0HM7WBMTTqoITScLkmkGgeJoZqWoT6HDLVxkljTDw+l6TkS9sn0kN7FMG7E00PE6X1cTsnfISTjOVvdNK+vUImePEBuWe0Bi6SNI36e0xaLHn1h1G1rE9m1SxlZrH3v4vs32E/gbHSUI6AEpsXHfXcmN4SO83rQj3okvpEZTNqlXPam+9gASyjhrRGDY6K4tgDJIxIBr22exU23YCgWFsM9P1Co2417xUEHcpRjCY
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 12:47:09.1573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a060ae8f-e09c-4f92-1432-08dc5fa5a930
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7426



On 18/04/2024 09:36, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Static shared memory acts as reserved memory in guest, so it shall be
> excluded from extended regions.
> 
> Extended regions are taken care of under three different scenarios:
> normal DomU, direct-map domain with iommu on, and direct-map domain
> with iommu off.
> 
> For normal DomU, we create a new function "remove_shm_holes_for_domU",
> to firstly transfer original outputs into the format of
> "struct rangeset", then use "remove_shm_from_rangeset" to remove static
> shm from them.
> 
> For direct-map domain with iommu on, after we get guest shm info from "kinfo",
> we use "remove_shm_from_rangeset" to remove static shm.
> 
> For direct-map domain with iommu off, as static shm has already been taken
> care of through find_unallocated_memory, we do nothing.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



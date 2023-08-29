Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565DD78BF5A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 09:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592027.924650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qatLn-0002lg-Gk; Tue, 29 Aug 2023 07:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592027.924650; Tue, 29 Aug 2023 07:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qatLn-0002jC-Dt; Tue, 29 Aug 2023 07:41:23 +0000
Received: by outflank-mailman (input) for mailman id 592027;
 Tue, 29 Aug 2023 07:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKbG=EO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qatLm-0002j6-V3
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 07:41:22 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 708978a3-463f-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 09:41:19 +0200 (CEST)
Received: from DM6PR03CA0027.namprd03.prod.outlook.com (2603:10b6:5:40::40) by
 CH0PR12MB8577.namprd12.prod.outlook.com (2603:10b6:610:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 07:41:14 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:5:40:cafe::a4) by DM6PR03CA0027.outlook.office365.com
 (2603:10b6:5:40::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18 via Frontend
 Transport; Tue, 29 Aug 2023 07:41:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 07:41:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 02:41:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 02:41:12 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 29 Aug 2023 02:41:11 -0500
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
X-Inumbo-ID: 708978a3-463f-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFu8JmKvZXsFk71A5SPL7qUSJZG2B2qZlvXGTiOSWUIHgWpJyXl5uDvEYBx1GAb7ubC48A+EzN/dwHHXXQW0ej4pcxbirdnwDewcWJqOWSC7o/6sLh5t+AtB6paG0KSjisTfbxeQNlfN3Xwvmcm/v396nbVdmikac67JMNz/oRxO0X6InN1KkZrkXSjlnmdiZU+CPS47Yn54XgALL8DPSP1qBuW17SbvVCBayrZAyJO/GjcJ+OkhaL/Esc4HNXe1pCd81LncijXXKBI3GArvgckC2sGttLPztX7skAo4CdO+d+kNV0g9UCIC3OHRrrOF3U96ETUUFiWtiNxjzeKM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/Ew64MZX3WcrpMkh21UO9lEiTgFg85st2io3A5TiHM=;
 b=dinOE8JDLAql4Rbb3zKb7T3BpelM7u1UFXhWK6dFgrVR/5eMQIZ1cwM7uR8qApCBrkqvcQfpvyJ2IuVkc+DdCjhDeJkUivxAsqc+zqUWU9u1RoXk8FHbrctz8tV5Hdp8mdyBWhrfEdukjowXc6Szui8Jp4qsJfT6rx/ay/887s1UDG9rtUtAYisnRkm7lcQHGcEze6szeLjrF1NWKh6HIXVO6ks49f68I9EnjSOMB4ifYhARQRdDMbIfIeEBhmpZ86jFycU8wGek/lC9V2QN+xPtjIFgyIcNHb7O66T+cCWYBwU5Y3lEcGViiomG0gLGsecVx+35mDUPuFyTctLXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/Ew64MZX3WcrpMkh21UO9lEiTgFg85st2io3A5TiHM=;
 b=tZ0DGwlWtdeDV4G6qWKhnF30/ik4PSk+miOvF7wNvpDZ02Qo8IKTKABPB85Bl38UveTJKrJRU4VdxX5WLAA24atLEb5licl6OX6px1geL2zSZBIZd8imO9V64JRd8rN/eCoo7jQgZ6K7clPxZwBLYXpsbrxZGFwih+InxU1lpG8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2fd90109-acbd-109c-c635-ab318028450f@amd.com>
Date: Tue, 29 Aug 2023 09:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 08/20] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-9-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230825080222.14247-9-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|CH0PR12MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: e2caa390-20c7-41e4-73c8-08dba8635210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Flp7zwJ4IJguXtd5T7S0IttfHcTz8Ft/vuEpUtUDqylizUoPga2mg9nY9puE6+vaT7KL+gV9qoVlO/uEyGDNwBdYYC93UsPUHDvM8yvn11IlBXtj5Fmxo/4E2ub5jw0Ub7gAXU4WBppLPTmEHYtz+rU1Fr6wmI/YbfRglF41N9HeffoqRxvArynCvbgykSnO2CTDaIGAmb7oQVqzXVwEKG4/3zHC2zIra0j5d0J7qD490jiPitfv0Yc4kxnHldrwAJF38p5srhdQXJcCKzzq7V5/SwKLlKrS7GV5WjKL6BFrtiOI0qtqCdODvLLzdrxKTZBzM8c5V9++/2A3YB2wsE/PsubVgNkCCHiZFRZSpJmGePut0jgVlTi9XFdUT4V6U248zjhLb84D1/AY4uqdUXhgs0prWPttpqm9zGUqwNw6uJI3Y4l2Q866ehxf9pAMR9+7Yl7Nc4dgTdiyYr+gc1fLlJBbqdFoHXUTUY1wuPezVztmQDR2UqKvCcWJKOzNAt3PEv6YCKZOizppE2Cbx7CGV2a5EsQY42BQXo1+vfEanknBSzMsn+SYf4E5emdHuyCDY8ktDKdBI1xlYTndQh2wrlbZezmmv8xYuyAVFIN/+qa/9Gyk04NP1Ndje5I7EhQPnksDuT+UYCFVjsjTAzy8r+lyrIL1OE+kL7XGGDQgF0pk3NUra66KlqNtO1miwPVlD2rI45KIl7aSdRo7gCr5SSyqgloabpRyXvzlDGj6CZeSisEPDPTD0NVQGfxZ8uezsMyx5DQeFjZXXhXL/2SYOIXsBimqqSZownS0RjbWmtnbmUwbXEv3cP0h+nPSP09+yZDr66MgsiFrTXUeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199024)(82310400011)(186009)(1800799009)(36840700001)(46966006)(40470700004)(31686004)(82740400003)(356005)(40460700003)(36756003)(86362001)(81166007)(31696002)(40480700001)(36860700001)(47076005)(2616005)(478600001)(2906002)(4744005)(426003)(336012)(26005)(53546011)(83380400001)(110136005)(70206006)(70586007)(8936002)(4326008)(8676002)(5660300002)(44832011)(41300700001)(54906003)(16576012)(316002)(37363002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 07:41:13.4158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2caa390-20c7-41e4-73c8-08dba8635210
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8577



On 25/08/2023 10:02, Vikram Garhwal wrote:
> 
> 
> Add device_tree_find_node_by_path() to find a matching node with path for a
You renamed it in v8 so both here and in commit title: s/device_tree_find_node_by_path/dt_find_node_by_path_from/

> dt_device_node.
> 
> Reason behind this function:
>     Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
As Julien requested: add space between fdt and (

>     device_tree_flattened) is created and updated with overlay nodes. This
>     updated fdt is further unflattened to a dt_host_new. Next, we need to find
>     the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
>     and add the nodes as child under their parent in the dt_host. Thus we need
>     this function to search for node in different unflattened device trees.
> 
> Also, make dt_find_node_by_path() static inline.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
With the remarks addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



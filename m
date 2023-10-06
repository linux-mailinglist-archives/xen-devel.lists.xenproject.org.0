Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543617BB824
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 14:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613589.954207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokKg-0005Zb-J8; Fri, 06 Oct 2023 12:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613589.954207; Fri, 06 Oct 2023 12:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokKg-0005X4-GO; Fri, 06 Oct 2023 12:53:30 +0000
Received: by outflank-mailman (input) for mailman id 613589;
 Fri, 06 Oct 2023 12:53:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5b7L=FU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qokKf-0005Wy-9b
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 12:53:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe59::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56d4afac-6447-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 14:53:27 +0200 (CEST)
Received: from CY5PR15CA0146.namprd15.prod.outlook.com (2603:10b6:930:67::15)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Fri, 6 Oct
 2023 12:53:23 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:67:cafe::9e) by CY5PR15CA0146.outlook.office365.com
 (2603:10b6:930:67::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Fri, 6 Oct 2023 12:53:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 6 Oct 2023 12:53:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 07:53:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 05:53:21 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Fri, 6 Oct 2023 07:53:19 -0500
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
X-Inumbo-ID: 56d4afac-6447-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHDDM6c2zGUKHIUJFcSX6jrb65Ot3iP0XnMmMn77NY299NQHkNq12nDYGyQimmHztUaejuCDly9ZlDCZ0npdzHZJwOBSRyKIGf8sEkgPH/XtMDQ9MdUrd1x75w9g5R1L0/+QpdcxT7c7/qBD7DOaEUwPzbztx9oknQqb75HYEu42vDAhjLtCocNIRkDqPHWO/3OIdpmpGiqNLK0EWzLfV1SyaSihOO83zDEaS4n7OSzTqamVv0qaMzE8aTE1BS2apL9ftMcrhFP3CXxkYT6hyo6VmLz7+KuyYsFzUOOSCYfbB7RtIOf7vqey+RE+o12WDzwUAhH2TXMjovdnCL1Fog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH9OYO/IeEV5lYK8tXvnW2zlCqA4ION4doAauhDkWL8=;
 b=QTuiKcrdcBGnqMiQkYkz9WS+XfENcnonBsJCou5VdnasdeH27Qe6tV9NjyFPT4YlTAq8nFT5Y85rEhQxbbqtwy8SrcEkU6msWouSrEGU9GMWl7p+e0RaZBBmxStKh29yEWjGcYE4pmJbnDF8On/B3rXmqdsT6CTkLg3ssr5hhNQZObFYgchc0M8PxCw9OggjTf0w38hbkX7Y+JVBPmya7voDu5E3PmUMDbumOQWXx7BSY48VHLqYgsxEKJcgyePB1fE/Re7COCByJx3c1ze9nOYfgObwri71a/dTUiOPEfx1rNoGWWTJT6+EJuYgaWsOZ/mAjtOesuCQb2estWgJ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH9OYO/IeEV5lYK8tXvnW2zlCqA4ION4doAauhDkWL8=;
 b=oSGnN1v7YaS0gPv7z0xp4+0P4NcmBZ73JghcVWArzebV7BTTVfi8xr8bssJsZ+tWwKCyT/8Obh3t9BGg8kwdRO6xkY0f5lx0Uqp9RwTKo4+WbVFYVY/QyrD7FZy5maYiJ0p8g+0NgH6n8PJXECzqzSZcwWKZTcTUAIBp7CFhuto=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Henry Wang
	<Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: [for-4.18][PATCH v2] xen/public: arch-arm: Update list of supported hypercalls
Date: Fri, 6 Oct 2023 14:52:20 +0200
Message-ID: <20231006125220.23140-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|MN2PR12MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e221564-5bf5-43b5-9862-08dbc66b395c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E8TUYJCLcHVgPHpsM+jx7RIxQ+jkIjmg0jaovQUGltY9xmsBzkafm6Ai7fswDBkI4Yph1gGxpb4i9iaEtydvVnbVhxVmIuj6MWkjvMd3kPmmfi5jiuuFHVFsc+SLbHpX4Pv0IHK7sioGDnM+gAwE/metuKUIssgFYisPHZJ/k4z4vdKDEPqxELhid2UziLVPhXnI6HuMtITbGUKGtagWOLWI2flLERu+NPibDhhtyxwlapbG3rlUDHTvomcRmzK3cKVlANY9Zu2XpcaM/SqlCtioX54DtQIcQ+KyfHW9sP1y7wVOdZkqWKDayAdSYTi7niqXEibjALoIGAXlQdl5f28agqGy2tlD9/KK0jcbhBoq4LNcCYfFyH79+MUghgMUliKTYJRpHgvieDTZB4wOmyNon7Akf3bL4dh0EtaltpeE8doLS/3jUKzllTCcuqsBTXZhdzbQYsYaZ7xz9oUFM7Uvh0Z+Lzsx99Kmnetu1FPhHGuoTaregNEBbOwu/kc+3DiXZ7rm9+yDZWO/gHRXNn0fu45PQg+t31xXRJl1SPzzoJ7lsN01frmR1KyPtMebmL6UX43qLwJT1Yg9IWZwS5cP65CIyQlNeox67uy0hyPLK70jsb0y88qY0lWmDiZWdQysskzkBwTKJMKSagyYtMFHP8rF8fRLCgcLzhaDynkvfts2UU6Kt9sDlP8N0NLj89eyvOTYLoC23AQgBcUAtlZIA0b7Cg94FmJipLEMay+dZy+8aasDgCnSkgrpXvqTDfEGcYTlt5tu6Jup5ajcoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(81166007)(6666004)(1076003)(2616005)(8936002)(5660300002)(4326008)(26005)(2906002)(478600001)(8676002)(15650500001)(44832011)(316002)(54906003)(70206006)(336012)(86362001)(41300700001)(6916009)(70586007)(40460700003)(426003)(36860700001)(82740400003)(40480700001)(356005)(36756003)(83380400001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 12:53:22.8133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e221564-5bf5-43b5-9862-08dbc66b395c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125

The list is out of date and does not specify all the hypercalls/sub-ops
we support, so update it.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v2:
 - explicitly list dm_op sub-ops
 - add Julien's Ab, Henry's Rab
---
 xen/include/public/arch-arm.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 6a4467e8f5d1..a25e87dbda3a 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -104,6 +104,7 @@
  *   Exactly these sub-operations are supported:
  *    * HVMOP_set_param
  *    * HVMOP_get_param
+ *    * HVMOP_guest_request_vm_event
  *
  *  HYPERVISOR_grant_table_op
  *   All generic sub-operations
@@ -116,6 +117,32 @@
  *  HYPERVISOR_argo_op
  *   All generic sub-operations
  *
+ *  HYPERVISOR_hypfs_op
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_platform_op
+ *   Exactly these sub-operations are supported:
+ *    * XENPF_settime64
+ *
+ *  HYPERVISOR_vm_assist
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_dm_op
+ *   Exactly these sub-operations are supported:
+ *    * XEN_DMOP_create_ioreq_server
+ *    * XEN_DMOP_get_ioreq_server_info
+ *    * XEN_DMOP_map_io_range_to_ioreq_server
+ *    * XEN_DMOP_unmap_io_range_from_ioreq_server
+ *    * XEN_DMOP_set_ioreq_server_state
+ *    * XEN_DMOP_destroy_ioreq_server
+ *    * XEN_DMOP_set_irq_level
+ *    * XEN_DMOP_nr_vcpus
+ *
+ *  HYPERVISOR_xsm_op
+ *   All generic sub-operations
+ *
+ *  HYPERVISOR_multicall
+ *
  * Other notes on the ARM ABI:
  *
  * - struct start_info is not exported to ARM guests.
-- 
2.25.1



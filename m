Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4E1700A6E
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 16:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533844.830799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxTs9-0008Sp-Gh; Fri, 12 May 2023 14:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533844.830799; Fri, 12 May 2023 14:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxTs9-0008Qz-C4; Fri, 12 May 2023 14:35:53 +0000
Received: by outflank-mailman (input) for mailman id 533844;
 Fri, 12 May 2023 14:35:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iM5+=BB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pxTs6-0008Qm-Tl
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 14:35:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47dd7626-f0d2-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 16:35:46 +0200 (CEST)
Received: from MW4PR03CA0329.namprd03.prod.outlook.com (2603:10b6:303:dd::34)
 by CH3PR12MB9025.namprd12.prod.outlook.com (2603:10b6:610:129::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 14:35:44 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::2b) by MW4PR03CA0329.outlook.office365.com
 (2603:10b6:303:dd::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24 via Frontend
 Transport; Fri, 12 May 2023 14:35:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.24 via Frontend Transport; Fri, 12 May 2023 14:35:43 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 May
 2023 09:35:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 May
 2023 07:35:42 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 12 May 2023 09:35:41 -0500
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
X-Inumbo-ID: 47dd7626-f0d2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5zHy2fZgZP7Zab2idBBOh+wAGtvokifu+k2p1p14sfuGFczqJr4gfBekRzWMACYf8Kh0+yOIRdREnWuXEvd36tWhvF/QmztdVgSw1Uh+u+loWG63iIUD5EIqjEjq7YhLMyGAHEi7u1xwXyKs7CRFSvW+DUuTrDfH+cNivbY8M7kv4umr51PLaq2C5sfsgnUt5SON+XdMFCWgbM93p5SykZ5tjCr0DQPUlqB7m2GQttsZUxRsNH5mojN9+JIiX9kSlUol1a2LPS1u7iV5LkDcBRO5OX5DiF7RVbt+2I6jabCR3T84UGCBhd5NqjQx2b9wKFRr0vDdZ79gjnJyOun4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6zWCj0pfBOh+0Xh2L/OjheKNQMni1Q3R+HvQiATYJI=;
 b=GHjI84pCUIxLt/fXNapHLsu7Dyz7DRdB2D7szX0AzdxeYeXBuk/hh8ykH8bHIV7IM7s7e5FTgfdVDX4EJ0+FfVpsEzEZwma4AqB4eR4Mlaw6ypnSiHJbN59kOaRhBfvDuASFHgewTg1vwZxEhNOXuCaZPXXZUjoCZSN8kUul6HcfVBezTC5X0eQD3bRh5/6h8X9gq4JU1IIfWwEIxNlOkqOYR1kZO9MMqvNPEWSB6PyoiQYH1I6UB/UYTV7/8ID33Mqbs5i/7hsqhY19XAQmGEsUPT5s5jOuRC5lLHU3W27twUAJO3YEm6enKHJ2S8Gsu4mxLGsZU0QUum3Xf6uNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6zWCj0pfBOh+0Xh2L/OjheKNQMni1Q3R+HvQiATYJI=;
 b=yqGvyC6OMSDaw0mIGyAclNg3Nxq6tufycV9/+hroiVEThSanda8giz81BKcM4FNtprgoyIckoGIKrYi9lJQwlYiYm59Fm8qe7oUqgnqCfWVmDzJmxufAANq+EsoE+aM0ZlZIjrhqWMUEHhKmDsczCCH7/5u0YcWJ9J7FSxe1I/k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/arm: smmuv3: Advertise coherent table walk
Date: Fri, 12 May 2023 16:35:33 +0200
Message-ID: <20230512143535.29679-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT039:EE_|CH3PR12MB9025:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e8324d-69b3-4236-61fc-08db52f62ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dJM/ZEWvuCO6cza77a6RW4YhGSdEHB3U4X24svcTKxcduNi7ihl0k7Yy6+rjrGnfTzibHQAwGi8LJjM4RQXcfZG/65jj/SRNmGKT1YnN+jsan1rka9tmIqw5xFqZePtWK43tzqXdFm0OBgTs1qt+bVHMzKn8y502xLcFbxYaudhci4zUdCUmbXKu/9BblxFDsS5Kr32CTdm+bfwnY1+KyV8+jzjGMkh6/uldlAgo2AGmbluTZ7MKIi+vlyLIkZMthLLqWhkMMnNSU19DgOubsYG8HBjnotHP9rpqwSCNPuCRqtgxP7L9xxoAZFncZ3eSP0jgM7F33EBLgIYzAMK8KBqH4eI7T44k9RTx2SPHeMfuOSYL2jbkyB4JX2rn7ecckp2UcARdSL0MvIB9KgDE0MqEKEF5jpvCSKJ0/epD8pMDi8Ei626yIVg+K5myz0E3jj9jVdFIZPtmp5rPq+uWdaDRLe9W2m4CBlywz4fZTsCKUeFX0sDDwvhjRtuQLWK42vpQfyV2zIEEKBWjdeapc7hGdHPnyhmljl2lbzTGS6/KFeTpZYnglASk0TkMvDIqp6vddJnonU5jL4lySr9vbSpGs6XzL6/lEIEDLXjOyXwKpzYkzYhp+eySKEcDqkIZsI27NnDI1R+Fis1MjfW0cc2NiclLRVP6JrNP/yp5QEHtoAZnjYgoTrtdi4GDB9yuo0dhPr7SW+gp+A+TwrG9PAvvXPy6z4Pe0whgXN09tmTn86tDI2cfzEJbki/gI9/6ze53agk7esktCzcVMciNGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(46966006)(36840700001)(40470700004)(82310400005)(40460700003)(54906003)(316002)(41300700001)(6666004)(36756003)(478600001)(86362001)(70206006)(70586007)(6916009)(40480700001)(1076003)(26005)(2616005)(186003)(83380400001)(4326008)(82740400003)(336012)(426003)(81166007)(356005)(5660300002)(8676002)(8936002)(44832011)(47076005)(36860700001)(4744005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:35:43.5725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e8324d-69b3-4236-61fc-08db52f62ada
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9025

Based on the work done for SMMU v1,v2 by commit:
080dcb781e1bc3bb22f55a9dfdecb830ccbabe88

Michal Orzel (2):
  xen/arm: smmuv3: Constify arm_smmu_get_by_dev() parameter
  xen/arm: smmuv3: Advertise coherent table walk if supported

 xen/drivers/passthrough/arm/smmu-v3.c | 28 ++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

-- 
2.25.1



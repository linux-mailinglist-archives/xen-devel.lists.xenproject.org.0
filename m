Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A474A896
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 03:48:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560135.875790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHaa9-0001c6-5d; Fri, 07 Jul 2023 01:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560135.875790; Fri, 07 Jul 2023 01:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHaa9-0001ZE-2G; Fri, 07 Jul 2023 01:48:25 +0000
Received: by outflank-mailman (input) for mailman id 560135;
 Fri, 07 Jul 2023 01:48:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40UB=CZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qHaa7-0001Z8-Qz
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 01:48:23 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59971f21-1c68-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 03:48:22 +0200 (CEST)
Received: from BN0PR04CA0045.namprd04.prod.outlook.com (2603:10b6:408:e8::20)
 by SN7PR12MB6982.namprd12.prod.outlook.com (2603:10b6:806:262::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Fri, 7 Jul
 2023 01:48:16 +0000
Received: from BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::11) by BN0PR04CA0045.outlook.office365.com
 (2603:10b6:408:e8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24 via Frontend
 Transport; Fri, 7 Jul 2023 01:48:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT042.mail.protection.outlook.com (10.13.177.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 01:48:15 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 20:48:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 6 Jul 2023
 18:48:15 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 6 Jul 2023 20:48:14 -0500
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
X-Inumbo-ID: 59971f21-1c68-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2hgPdRw4yvgKiIhfGAMF9oMHRSh+t7OFJVHD+kY8zBz2K3Otc7689ikUptFA6io3R63BS8KMZGxVGYJunVfs7TzpWCadCfAovH3DAuWfPYKVadGqYwvMc4E+itT5ogAPE3yhDBo3s8SQVQDb+klVsJ/5vKg8UdkDoe79dsg5j+7fQdfq/w26chJwUB/PZbqp2Q1cqlEL3RdBpBLhEtBmitk3VxMDQ8KYJys9brMfjnVGKB/A/um+MVfeE5BFRUpYAZzdNJvHE/+SioYfCLLXHLrsLGMB5LdG0jPg0qS6M+Q38aZrH5OanESrrdOKqCn8exJojzw/mL6VsgGOoo4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgGLXbtA3xfE7ZCQQ92uKBOImtcSm/roRVOADpjeKok=;
 b=WDIODJG25+NFNRYZ1vF+7i2kHTRR85toi8UzudGRJSKRnEBuBUNJdpP4ZSQCMiG0hRJ4I3v1PFMs1AU/cnM9pv70h4HvuvfiKiiQDlJvszEtP/gAQ7itPedeYpb+l0gbhnZBHlEnVUo2iERiIm6IprsmSKQ4hXv701ePdkTvrR6gpd/Tp9KcMRY1muqUXiUDChxojmJO3px+8SMG4IAUWhBwLSElgr2mXYwb+XhDvUaqO/2XYTZQNaoXaUXixe8BCupbj1/vJ0oxJVr2L2EdCmIHmuP+YYtvr3CjdCqawACax1JkG1ILyUg1ykz9OvHqPJCdMLG/Gc/g3rwFihWU1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgGLXbtA3xfE7ZCQQ92uKBOImtcSm/roRVOADpjeKok=;
 b=WwFlBsgfy6kfG9SotmKSYPjoZnafqJ+/K1x5fNCsF0+u3lbYxJfOuZPe2WXKt3598HUWbSGsZhY56Db6Ud5NslphtHXRqjAvCEaY8/J5UTLVo32kLRIIaUH8qt2CbfyZXnVlGO7Zs/KQM6nJrQpSO1ILRjk+qtbquff3xMYfMrc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>
Subject: [PATCH v2 0/3] Kconfig for PCI passthrough on ARM
Date: Thu, 6 Jul 2023 21:47:47 -0400
Message-ID: <20230707014754.51333-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT042:EE_|SN7PR12MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 9820241f-df69-4e93-cca6-08db7e8c3b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ZO6CiqqeFsxATNl5/DKGrvZH8JKG3maQ/OwhjGJh5et6BdJO+g/2Jp1U8sJjXf9RWkE+G1GGHWUNbtSagSmX4jidUYKpEHeOPc4RpK+Y1NK9nFGtZLY2dBahB1jAFf/rfYA1J6MTk+Q0v/n/NEIMmMLOMzhvlvep3gb8/x4hAbXUojKOrxBCrlbI/ZyFoaECwMztlRfD8QbS3Ga2fxo97FXY0Bgr7NFYH6IDzs1lMSJqncJ7cSp8Hw3G3/svDl9KDdTCOQzN3n4JRvWTwo3fLIK3up0pvJ1y+3sifkJHu/A/SfO6cJ6aKm33Hbec8nbFDPsI1Jgaj5B5A70Uc3l6s0YgW03EyAB6biFSaO9QaQOFCzubX8etiGS24Su3oYeWkxIvmYQIomNonl45YvKDpgDVbJ/H7UOx2igSNaocfnYy/R1qvExnyNVJE9gfe2RvSOLVrw4OH7Qls0vVSSoZttC9vpa4t9RMzpKCLD1pLKmPFPPhOUWbhrbjpvnPXeYi4guftob18Ej7r6CzS59tWQyhDf/HVgi4HeajSOIQoUyewUkQ3JfPBY8uXyjtqWwHR0MYgQ3sZFAsESFdbIc1CvAibks5sftUb3KrilSp6f8gWVtfYLBjuyI1LOQ+4vYxV1EYNyG0+9N9J/KnT5JM/1dGdNUjIbL0M6T+vfF0yWLyf5EHDirOTplMz8GgfRw4vpqE/+4vtLBX/cfT7slQOYuW0M/El0CdSch52Isor82t0Jkf+ICvl7NTgOFvbXZd8uymf4ED2bnsogXW/8N4AyM+XlvAWgCE6ZU0O0aaSM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(83380400001)(1076003)(26005)(186003)(336012)(426003)(6666004)(36860700001)(54906003)(47076005)(81166007)(356005)(82740400003)(478600001)(2616005)(966005)(8936002)(316002)(8676002)(41300700001)(40460700003)(5660300002)(70586007)(44832011)(70206006)(4326008)(6916009)(40480700001)(4744005)(2906002)(86362001)(36756003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 01:48:15.7801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9820241f-df69-4e93-cca6-08db7e8c3b49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6982

There are multiple series in development/review [1], [2] that will benefit from
having a Kconfig option for PCI passthrough on ARM. Hence I have sent this
series independent from any other series.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00353.html

Oleksandr Andrushchenko (1):
  xen/arm: make has_vpci depend on CONFIG_HAS_VPCI

Rahul Singh (1):
  xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option

Stewart Hildebrand (1):
  [FUTURE] xen/arm: enable vPCI for domUs

 xen/arch/arm/Kconfig              | 10 ++++++++++
 xen/arch/arm/include/asm/domain.h |  3 +--
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.41.0



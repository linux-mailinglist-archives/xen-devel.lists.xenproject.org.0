Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5037B82E6
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 16:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612635.952646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3Iq-0003SX-6y; Wed, 04 Oct 2023 14:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612635.952646; Wed, 04 Oct 2023 14:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3Iq-0003Ph-3p; Wed, 04 Oct 2023 14:56:44 +0000
Received: by outflank-mailman (input) for mailman id 612635;
 Wed, 04 Oct 2023 14:56:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo3Ip-0003A6-1D
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:56:43 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39cfd221-62c6-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 16:56:42 +0200 (CEST)
Received: from MN2PR06CA0016.namprd06.prod.outlook.com (2603:10b6:208:23d::21)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Wed, 4 Oct
 2023 14:56:38 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::40) by MN2PR06CA0016.outlook.office365.com
 (2603:10b6:208:23d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Wed, 4 Oct 2023 14:56:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 14:56:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:56:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:56:37 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 09:56:36 -0500
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
X-Inumbo-ID: 39cfd221-62c6-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcbYzwZHnoD+k53KhGZAdxWRj6gNkyIXmxxvKxZrkj73ns5LPmMmnuRvHTd/zYt5JDS278LBCrU0UdCPw0K9oDG/GjuUalihoyfX8yhNLex3/LkhuMw/K+uvxWsmoKL5I/rR1eP6miokM5c7xW0rPwS7OHBEocZSj5B8/4QClMmUpmk3+L4zF2OYTprI0Dj9/yKfGqDeV+G+BXjQYTvLQOed/7utGSmmhBjKg0iqSycPQQzPDydi3t3xi8+HtvIvKX3nq0AgUiixs/dSmENLKJIC/XGAMRYJ7uM5f7DkhzeHhNts7rRxMSlMmQiLDw2fRJtth1Bxu/mLn1u9WJB6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5240fKG5hTdjcdqqDr0qDzDhspiWQ9+ulXYYN4kHfg=;
 b=YSkVCqJEX4shC03ReXzIwW08wzMzf9jR1LFQAXVse5bZ5th3L9Zdd203eGvxTCHOqPaigBS66YnxHGukb8aifIv76/IUsv1JSKM988UOE/h1elKbW6+0Aw8hxVJH8OhfyI/YyF9lSShxZHO31g9p2hq4aNrX6sJnowkzd/ZvNUOpZq47nhs8tN8rQNKZqffh0EJNwAvZSsaKhcNgow4/TwXYfdOuwHypbtdD9E+OqD7k16eTEsai5zmaCNzjZ+wjxbC4J/Qc7k7axdLfBzTDZIkDV7Nl9CueSI+luKH5Ex7WTCBGsPmF2Av0oPLz//MIlJRK7GyWOFXTzMm+t5Heqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5240fKG5hTdjcdqqDr0qDzDhspiWQ9+ulXYYN4kHfg=;
 b=LdJeKG8AIxTQW/PVPvE8mGQAZuk28neKyqaBKOmbGFdOBrE+iulbuLqRAR5BHg78zDHb2LRBLRdzFLdkawfwxXd3pjGuG6voo2ZhN0hLbyXHouPjTC8h93Yvp29+RZHDhkHL/CUNp0Lx0ERehIoUJdUJDWTj1hKxJqgdeBl2nrc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v5 1/9] xen/arm: don't pass iommu properties to hwdom for iommu-map
Date: Wed, 4 Oct 2023 10:55:45 -0400
Message-ID: <20231004145604.1085358-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c7348a-a5a0-4eb4-416a-08dbc4ea1c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TSQZI9tFww1+FZxV9J9PZATFYKdGe54UnezLiVluLrVV8JICZSniVGFu6fsCc5vhW0lW7uz2csS6TSDsTY4ninFPEPTw1OEXa2Tzn8oUq08jWkfKZULskEL+zSr7q9kcWgmygRYCOzCQ8aNlS5se5aIlM3d08fYbFngtLhjfcuXbh6Ymhn32/Upmyeww0tS4dPusginR8napWGeFCva+w2BnacvEvVAUr9wkssJ1hZkQwiuaJ20Oneeg8Fzq8JvI2eFe9X9LKgwairjD4ISaVX8iJBJDQWJJSxi8ApI7GCExvoEnkNU+uaYIPzZHNEV3PJQGJnksRbW6LVJm5ZXBvB8tQ/E1bZJPFDg3MADEMNva3F9eWeQC3QKGBraSgQnbkeHrCr1ZclWfqHCJveCIdp4yGLyKKQDlu3a0RuBJoSpGyk+dCHo5ml+Lo7UY/l1Rl2uNO4/t/0bRF5JkLTEGC7/85Xr1Y29mczcBoyreFNtk4pXcfQyoAs62VHeAzOiEg9MNpz3UAlHPS4dErAjYk4xdJhXa1we60nFq1eBrgXWaIh+DSYXSrCKln3gcovRVSPgCaoEz/izs/6RqLgEdiqvM+XTQUmdfcIutLaH4gcoLHYfIgSwYYFhK/GZBbMiRFMuf+IGhbJVPV/d1VpTqbYn79TsqeS/MXH3EbxQX4v2Y8j+3TU/QF09M6Mx98Z5PRz/s4BBMNAhd9jYbC8WbzJLsBiNifjlbPFAvmqNfaRjNF5Diyo276A93Cw66ls0E6VFp9Wry6Brsp4PTAVsQmA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(82740400003)(1076003)(40480700001)(40460700003)(36756003)(2616005)(6666004)(356005)(81166007)(336012)(426003)(26005)(36860700001)(2906002)(4326008)(86362001)(8676002)(5660300002)(8936002)(41300700001)(6916009)(316002)(44832011)(54906003)(70586007)(478600001)(47076005)(966005)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:56:38.0836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c7348a-a5a0-4eb4-416a-08dbc4ea1c6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028

A device tree node for a PCIe root controller may have an iommu-map property [1]
with a phandle reference to the SMMU node, but not necessarily an iommus
property. In this case, we want to treat it the same as we currently handle
devices with an iommus property: don't pass the iommu related properties to
hwdom.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

Reported-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v4->v5:
* new patch
---
 xen/arch/arm/domain_build.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 24c9019cc43c..7da254709d17 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1135,6 +1135,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
      * should be skipped.
      */
     iommu_node = dt_parse_phandle(node, "iommus", 0);
+    if ( !iommu_node )
+        iommu_node = dt_parse_phandle(node, "iommu-map", 1);
     if ( iommu_node && device_get_class(iommu_node) != DEVICE_IOMMU )
         iommu_node = NULL;
 
-- 
2.42.0



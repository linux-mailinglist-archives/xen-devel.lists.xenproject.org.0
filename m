Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143987E7180
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 19:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629769.982207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19lV-0000Qo-E0; Thu, 09 Nov 2023 18:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629769.982207; Thu, 09 Nov 2023 18:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19lV-0000NG-A6; Thu, 09 Nov 2023 18:28:29 +0000
Received: by outflank-mailman (input) for mailman id 629769;
 Thu, 09 Nov 2023 18:28:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS/w=GW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r19lT-00005n-Lw
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 18:28:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4f199e2-7f2d-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 19:28:26 +0100 (CET)
Received: from SN6PR05CA0008.namprd05.prod.outlook.com (2603:10b6:805:de::21)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.33; Thu, 9 Nov
 2023 18:28:22 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::38) by SN6PR05CA0008.outlook.office365.com
 (2603:10b6:805:de::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Thu, 9 Nov 2023 18:28:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 18:28:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:28:20 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:28:20 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 12:28:19 -0600
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
X-Inumbo-ID: c4f199e2-7f2d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWMUMYn/YAmcZvdoQVoCE0n+K/etFh87TFf7Y9lVOqyrmHxn3ZjdEt1e30D0OAhesixHS6C3eFZYeaTs22B4SvgsoVTATTmRKBnkwgifqFX6ovRxDJN6L3ui1oS5iK6v79GUSyHwF9awTfP8wgXTjTUGQeF4KmMl3/mlR/54itX0uvWtw6yDkPxDRSjJUtToUFGbT7CEhlzPXKOBjK3n2oAAdKC6h1tCxlnnf4vIl8sDgJ02gA8k+oTcHqmFYJe7hqAoYa5G3hrBV8gw7gYLLpvKYGfTeMnga7I1yiEZ81MRelb4Ok+0hvJ5QoOXqeQ7tpjld90KAteOWDkLhjc8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TljtmAPXpOARb72aidPv0e1JYIofy9OHEYlbfwFC73k=;
 b=GD/0Z0nZKZwqgXYDJGLkpCm1eCX2AmmU5ig7DWw1HZhfFrdMqvE2LT+AkZsgKFKIxmkM8gMMfArxjXTAcBgPcyrC/kbyeQh09kjf84HLBWDGLqHOrwEYYM7pfcHLMsqzjzZ5OyXn0bNqIiwom1voltw9qwqaL4Yd6qZ+l0dmvPOU1BAsQH0uIM227WKMDDadsuWCJ7TEO81f8njpN7MLiYvODTBolt0ozwUzLVGvhR8LrnepCIbo0IIcXRCdXOzuZE8zUvGr8LflRM2e72i2vlNjU7WyGUvZqlXRhy2sRm9JZiTFuuOSyyXKR29j2D8iZFSZeaTjPqrvgxSwx41u2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TljtmAPXpOARb72aidPv0e1JYIofy9OHEYlbfwFC73k=;
 b=aq98z2U9kTEJplZkNszlWE6Rj3ngviRi0f+L1drvP9GWo+R0fnUJ/XeE73RKozbnc6HOBpFE0ozeWs2yT8PdZmhYpf8Y4UYjaLokrbaaGvL5LA6kkTUrB+Qi6B/9QHxedCWUl4IgH8yvZBrADn/0t4tJsj2vKTPI0llg8B3AaWc=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 1/9] xen/arm: don't pass iommu properties to hwdom for iommu-map
Date: Thu, 9 Nov 2023 13:27:04 -0500
Message-ID: <20231109182716.367119-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109182716.367119-1-stewart.hildebrand@amd.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: cc82205d-a271-4535-a816-08dbe151a6dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JXwiHmn91oleBrJtrLO5Bw8DdrFEMZBmiWxVrnIu4MzE0lVL4/PUbnDnRmTygMfS7DnqRdKauqrtNHPgD5DkTh+a++nZIWKBxxwlntwX+WzVspL5SVgnCFrb8l60N/kKmKCkegcw38KV5CypPnmA/Yyxo0eTkc1FdpQwhJBNPL80qI0p1ebsRMQmSk/86G3ZnNxLD0ZM4iXYMYLjN+yf3J0JAfH4wBDKBbZhwhLEYT9yrKM1Hg1xBmjZWBCqaiKAuw/T4SuDzO/GtPQs8jG8yDX0xpnYGmw8nu2Dl35+5uWmDLrFJsCxdV7j38bKAKrYPp6qbvIA+1y1X288Mf/5zpY0fqy8BAmIJc/voIr6m+fQTxssLlk+KWWxuSCugXacbL3Evbuf5GQ8pz3AP8S0JgtcvZxYtzCmG0x3hpxQCRQ1vRKsSLZ8ky4JOfMnjNNRWDC+pU/uOAv0Mb0Ff8mbtOrqG+WdZUXL5LDzVU1GptozAqy0VsmSd9qA3Dh/4DuGkIL3Rg4RTLQVsaUpyF6Y04YNzpAVSJaXXOR7eOZykV4IK1JeaN2MG6ChN8zL4qHHHi0pji9+n5vHvBeQJfCglkLSU55UJJFg7KayJLqGt4BVzOUjoW7621IEwx0pOvb9Ew+THeJcgnBqKru3mb/xgCxJ1StqJtKqf6z2M9qezUfoNTPq83JMiZHWOEI96JADj1hiobs3txLuA/kOjbhiO0puWUYfMTrqkxhplzf3zthXTrGdsMQgEhJu+90RkJfHkV2cIK6EE8cZg5KVXe5tGg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(82310400011)(186009)(1800799009)(451199024)(64100799003)(36840700001)(40470700004)(46966006)(426003)(336012)(47076005)(2616005)(6666004)(36860700001)(966005)(26005)(70206006)(40480700001)(70586007)(6916009)(316002)(54906003)(1076003)(478600001)(4326008)(44832011)(82740400003)(40460700003)(2906002)(8676002)(8936002)(81166007)(356005)(36756003)(41300700001)(86362001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:28:21.0511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc82205d-a271-4535-a816-08dbe151a6dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396

A device tree node for a PCIe root controller may have an iommu-map property [1]
with a phandle reference to the SMMU node, but not necessarily an iommus
property. In this case, we want to treat it the same as we currently handle
devices with an iommus property: don't pass the iommu related properties to
hwdom.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

Reported-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v5->v6:
* add Julien's A-b

v4->v5:
* new patch
---
 xen/arch/arm/domain_build.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 49792dd590ee..ca7d0f5ffde5 100644
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



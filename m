Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F46F5F08
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 21:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529465.823917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puHzq-0005Cx-Ql; Wed, 03 May 2023 19:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529465.823917; Wed, 03 May 2023 19:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puHzq-0005A1-Nf; Wed, 03 May 2023 19:18:38 +0000
Received: by outflank-mailman (input) for mailman id 529465;
 Wed, 03 May 2023 19:18:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNfr=AY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1puHzp-00059b-7E
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 19:18:37 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a27939c-e9e7-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 21:18:32 +0200 (CEST)
Received: from DS7PR05CA0005.namprd05.prod.outlook.com (2603:10b6:5:3b9::10)
 by SA1PR12MB7224.namprd12.prod.outlook.com (2603:10b6:806:2bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 19:18:28 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::62) by DS7PR05CA0005.outlook.office365.com
 (2603:10b6:5:3b9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20 via Frontend
 Transport; Wed, 3 May 2023 19:18:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.26 via Frontend Transport; Wed, 3 May 2023 19:18:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 3 May
 2023 14:18:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 3 May
 2023 12:18:27 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 3 May 2023 14:18:26 -0500
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
X-Inumbo-ID: 4a27939c-e9e7-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awTPgLlZQFHMVZe1jqiHifPCm8RPkQCeWRvL5+7vFylfx/Qc4fHKrVoYF4MT7t902wAO/JZ8nCAQJFDiZ5PuRlA0tIJ1aFslSWdI46ZYUjfW74J2iVSXooFf0sckF3x2LkpUod/o1cgN4cExgGEtQ1XNjev1Te88h9yAvm7jM9kDBsjwNXva+RPSUii3Vq46VUhKWIVvjcP3h5fH3jWpQ4nsHzMFuwlTsZqkFmea2lfQlquGNwaZ6ZUMb0IJcdi7wrKvlFA75knPMusqAGTGvSFomprvILqORQD62VNGT/ZTeMl5qPT9pASJ1vJG/Eo/euGT6igFJCJn+eSAIJeeZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJnGX5ULMa6JNgalgwK8aS04dIdQBzShnRt2jL2i2WM=;
 b=dBGkZW3uDEYItZiwXENNMuP29NYyArq044dWcsaIBOk30Gcyyq6Sm8hgJe+igvXrI5syczxZW6bmbpJ48qEE5MJK9K48RvjCJHWm07Nn42X9y+XkyPvjpAaWHlGLmgM+P4zmqZJkD+zAuH51eFrZ5KRG8OWtvwWAEco35P5SOCmD4/AjPCOkpY+XaIMRfVjckhHlJ3kUuxoUNak7PrQk7Z+K6wc9wYlQaLca6nidah77CngF6Euy6rteU41NoXI/1GCgqMeqxX6YxiXWM56Dd3+tsTFLxTv5gpjIfuUmUx14bIb4Tejy+Y/hyLbNz3qoy1LVyEATLC1/7ozHZ1JSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJnGX5ULMa6JNgalgwK8aS04dIdQBzShnRt2jL2i2WM=;
 b=iVbfvjiGf990ikhmQSB62zpx9UFqw45spyGC5sr8jyqgNTgss+pwDvXiOzzlc2WP7Ztmgi1qPtKFhZ2hKviw/2vkPfF+CMnj8kLPT5eN3tVieGNCA5ULz63MeSStz+k+htK+EoPSLSJtfPI2LkWrgf52eo07FnaC8qXPa+nIm94=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: pci: fix -Wtype-limits warning in pci-host-common.c
Date: Wed, 3 May 2023 15:18:20 -0400
Message-ID: <20230503191820.78322-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT012:EE_|SA1PR12MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: c09f3d0e-ee97-443d-94ff-08db4c0b2ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xgbjipOMaSEIiUtsJGDiIr0b5vaSw45Yifz+cwzKOVYRvB+pb4qlCRBZXphO3BoBtFZDHwD3VKLhevAwIr4m/x+fDxezlXV6sBiVRaxrnQm9WSrGWOzqNqnORhUASH60wcyRNo52QqSnupVdSR0hjT/y3XdDdDCmF/S0XinxoZ513z8wl0UaptjksxLaGkZVH7iqBVOrVS5KiFUvfZfo9T+fElYr3h/Kr1af0iWnoEcvMqUAvqME993AmQaCHdBbRQF/SI0Ny2nU7jUta76MqZ/hh7O+tDvmz8Vrcx+gswLe0dStVXaFmVCpthu2U8XMFWUBZeAz5QvYxREffijn3bLQ8uzFL78UQYUwgU1tiqDx5RAqJh+2yd+NC4+00B4eEJPxpmPKmCItNEGr9SWe87CYWVZwpi+VrFkHSA9kgAjkc9mSMFbZ2qKE+s+c6Ap9HvLEddg43ktzwiaO4/oVfrVwQxfQBrETlgIXDVQyWyl4UGk8yG6sOCo4pGSsJ4f/SzrW4Re6w8lTHdoAlBwuDw9Z0RIRan3MRQlQ/SbKpJ1nxyT4ZjdIMyOhcpsJwi8Z6WqN5VQ94lRWsHfddfs754hF+D79AIroXViI5afBjtkA2Ghxv9I77Yl9JGvENXIPOZ8kS03yFTA543dAVdGr8jfz3aja9IifGK9cis0J1mXySKI2hJOfpcj3k6Lmw/zH6bhwYTLt82a6e0wEureT32bsFUig/d7qavteNMOTi4M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(36756003)(86362001)(54906003)(316002)(6916009)(4326008)(70206006)(70586007)(6666004)(478600001)(41300700001)(40480700001)(82310400005)(2906002)(5660300002)(8936002)(82740400003)(8676002)(44832011)(81166007)(186003)(356005)(26005)(36860700001)(1076003)(426003)(336012)(47076005)(83380400001)(2616005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 19:18:27.9807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c09f3d0e-ee97-443d-94ff-08db4c0b2ca7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7224

When building with EXTRA_CFLAGS_XEN_CORE="-Wtype-limits", we observe the
following warning:

arch/arm/pci/pci-host-common.c: In function ‘pci_host_common_probe’:
arch/arm/pci/pci-host-common.c:238:26: warning: comparison is always false due to limited range of data type [-Wtype-limits]
  238 |     if ( bridge->segment < 0 )
      |                          ^

This is due to bridge->segment being an unsigned type. Fix it by introducing a
new variable of signed type to use in the condition.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/pci/pci-host-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index a8ece94303ca..7474d877deb8 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -214,6 +214,7 @@ int pci_host_common_probe(struct dt_device_node *dev,
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
     int err;
+    int domain;
 
     if ( dt_device_for_passthrough(dev) )
         return 0;
@@ -234,12 +235,13 @@ int pci_host_common_probe(struct dt_device_node *dev,
     bridge->cfg = cfg;
     bridge->ops = &ops->pci_ops;
 
-    bridge->segment = pci_bus_find_domain_nr(dev);
-    if ( bridge->segment < 0 )
+    domain = pci_bus_find_domain_nr(dev);
+    if ( domain < 0 )
     {
         printk(XENLOG_ERR "Inconsistent \"linux,pci-domain\" property in DT\n");
         BUG();
     }
+    bridge->segment = domain;
     pci_add_host_bridge(bridge);
 
     return 0;
-- 
2.40.1



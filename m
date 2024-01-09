Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A89828F4F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665050.1035264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK3q-0003w6-81; Tue, 09 Jan 2024 21:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665050.1035264; Tue, 09 Jan 2024 21:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK3q-0003tg-3c; Tue, 09 Jan 2024 21:55:02 +0000
Received: by outflank-mailman (input) for mailman id 665050;
 Tue, 09 Jan 2024 21:55:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK3o-0003SZ-Qy
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:55:00 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb6fe35c-af39-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 22:55:00 +0100 (CET)
Received: from SJ0PR05CA0188.namprd05.prod.outlook.com (2603:10b6:a03:330::13)
 by PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 21:54:54 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::cb) by SJ0PR05CA0188.outlook.office365.com
 (2603:10b6:a03:330::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Tue, 9 Jan 2024 21:54:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:54:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:54:50 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:54:44 -0600
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
X-Inumbo-ID: bb6fe35c-af39-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiBl8ClfkYnTxi/Xyj8Ga5UXNGV/baEq5apBTm36tQiOpxa1C8ohnoDpWyWlT62vrmiwsUa566Idg4vDHl8MWq2Tujf60V4D5QGdFSz19gHGQxiTyp6n+Jxzz7M3UoTcfi9kMesPtoiRIcvWSFVvr/Zn8XgPuHGT2KB5SRpezY8zpCRNYvsGp7bB2ESJT2kJTt3kanRjqp5UwBqcoYuuvQoaXZpxeGV03PA5gWBPPCMRUf2hIOmtifBG/IxCwYlvJtYDUEUodVooMBWDE1yvtP+EZ1BV3O9Dsx5uWtcdjiRzga5bU8DxMVMbXotNWAmnK7seszn4sEEHmQJhmV/6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsoOL/G8DIgXV37+ao0tajW6v6ZQDcdP8FQCKLy06D4=;
 b=S1ytKzBBBuRm/e9Ea9bFI4XiicMcIx/YHQFCKg8tw4gaH+KErmHoIxJQWM0RPreYG3FI7FUk3h9IrWI6AiwIC3kWLH1SpFGjPzmo9EKiAe8iohKLo7TCCfBKvuO9KvfgAeHYy6iUOvNc1wZtgvELtxjUL0YZaPs/hAsPHlhdwuAmy714ePS5egRFCm9wkg1lg0wblzOAIRgBpfYBL2m0JqXnZtWw+qW6iO1S/H7E7Hz2thGfB9gLgOpeyhpw7da+2PwzMhl8Lzi+XUp5cz2xy5s4scJ558/wboqVspBwvarkEy1sCNxo2+k9KCsiOobRo55RIieUUpUZSxkZZ0YJuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsoOL/G8DIgXV37+ao0tajW6v6ZQDcdP8FQCKLy06D4=;
 b=EMUPFIapm7SX2CZwngMiuUbU8sSFWQO/3WmL/bkEpCucvt1HdA3ISwSAi3Nbh2QDlc5OEOnFV6KzrSGG5dUs8WZKLdtlgtlYgu/3GIC7q7L+Mxi55csLeZOY5FLCCt3LqJv4XdIzBwUpMNRrxb+31/W9YQ+7GGG1J2HlBP91nfQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, "Stewart Hildebrand"
	<stewart.hildebrand@amd.com>
Subject: [PATCH v12 13/15] xen/arm: account IO handlers for emulated PCI MSI-X
Date: Tue, 9 Jan 2024 16:51:28 -0500
Message-ID: <20240109215145.430207-14-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|PH0PR12MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 670b2910-6897-4576-99ce-08dc115d9c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xbttFXelL7degQf26Jl6Kd01+Kx1dejBkgh0Rnlei0Q1P0CrFRAytzXQmoAeWWFcuKE2uNxATcJ8dHPD/GiMYdXi+8x9V5e8+XRFIX+2GkDIBYQao4JQ8/n4pxnUkBpK+a+r0eYQJwQVg41tMOm6qn1JFfdEWzIKiD/I/BsQVONnpG+RZW/AnZOm4rO6LYxBQc23Q1n+ueOUopNUNzVdmAlUQ52V1MP7N7/UKLX2D2J/TpXfOHSX5Gxoq/qVnyXt+lEkrGCac8iJCwE2hM6uwbLs6irWtiOqdRscMBA3F4m1rXh4g5My57iBu2YXKZfn5qw8Tr9a2tdec0UaMNxsCL3MGNiyekZSrK53yagI35tW50q2+/XmyMUhmPwhij5fRQkRos0IMZlAQZaGnF0gPlSVLKwvNeI2lf3XAyurlU+T00wpTAYPnBrwkKQOAVSimnmVnNy2EmSk++o5THw6iSzeL9uRKbaif2yn2rbRUl5xwqn7ATdgW1wwBPquVf0m+VfHu8pm2OE3i8QPr8mc1mQCXPjiEcOwA57+5I1IC7Owm3prObNh1VRqj16XUbEyr8svWSP/FJS1okPBFu5O7PJyJa241BtoYfxV+gq2mOV+Sa89zRYvohoagmEmWsh2N8SDNSKMVRZNBgwEOEKmw+FzaVxwUWf67/6XWkE+LBjHqfRa87eVETm4mKDwIP1f39V9WCdf4dpIPlS9ERGBsKmj6a0tn94QgKJYh/SFOP6mK/qpvoJC0iTy2URJx+n+Y0stmlWDZ6Zjqt2MboB/Ow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(186009)(82310400011)(64100799003)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(83380400001)(426003)(1076003)(336012)(26005)(2616005)(36860700001)(82740400003)(47076005)(4326008)(8676002)(8936002)(44832011)(15650500001)(6916009)(5660300002)(2906002)(6666004)(478600001)(316002)(70586007)(70206006)(86362001)(41300700001)(54906003)(356005)(36756003)(81166007)(40480700001)(66899024)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:54:53.4280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 670b2910-6897-4576-99ce-08dc115d9c87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This actually moved here from the part 2 of the prep work for PCI
passthrough on Arm as it seems to be the proper place for it.

Since v5:
- optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
  defined unconditionally
New in v5
---
 xen/arch/arm/vpci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 7a6a0017d132..348ba0fbc860 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -130,6 +130,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
 
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
 
@@ -150,7 +152,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host bridge.
      */
-    return 1;
+    count = 1;
+
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        count += VPCI_MAX_VIRT_DEV;
+
+    return count;
 }
 
 /*
-- 
2.43.0



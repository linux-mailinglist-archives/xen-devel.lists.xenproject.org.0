Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746907BEB1C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 21:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614471.955569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwP7-00059q-EM; Mon, 09 Oct 2023 19:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614471.955569; Mon, 09 Oct 2023 19:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwP7-00056s-B0; Mon, 09 Oct 2023 19:59:01 +0000
Received: by outflank-mailman (input) for mailman id 614471;
 Mon, 09 Oct 2023 19:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjZ2=FX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qpwP6-0003Ue-08
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:59:00 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eab::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48871664-66de-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 21:58:58 +0200 (CEST)
Received: from MN2PR13CA0008.namprd13.prod.outlook.com (2603:10b6:208:160::21)
 by SA1PR12MB6680.namprd12.prod.outlook.com (2603:10b6:806:253::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Mon, 9 Oct
 2023 19:58:53 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:160:cafe::da) by MN2PR13CA0008.outlook.office365.com
 (2603:10b6:208:160::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.20 via Frontend
 Transport; Mon, 9 Oct 2023 19:58:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 19:58:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:58:52 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 9 Oct 2023 14:58:51 -0500
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
X-Inumbo-ID: 48871664-66de-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQuDWzum0CuhmzM7egEHV7OjwogQRjxtzGaO5JaKbbcfkzZkKCIR4YsM9odwy5zmgiHf7iOg48+fvlbVxL5pfBjTMUj2C/0IJhTugrsQvKv7Yt1IJ9taDKr3skc5fD/31T/MEbGJC9qTe0id6xZlU2HsaWgO4sKxvBlF4LXvZY7ls4+BgT9o/S4mPWXxbo7w7yEzJos0Kpo5G/Ai+l0QHUGG/lpiDAba3JF+tYRxJuq4cKIUoH82xVEqElrwneteYRE1zsmW2sk6mxnfP+YDEGam6fqFZTJpn9XWsw38UTo3s7c0mWWDiHWDc/cIkZ51g4Msh0sri88T2AFhAjjw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6WEOoMs+pzdjzi1jL0lpLVB/53RytXMX+c0QXchhzI=;
 b=AspjglAjvn3niV+v2naQZ8tQ3Y29rJdAa6Dx43duQoygJJ224fk6se8Vhh8dxdwH+69L2qKRAp1tDU7KLH9TLFrnkbpXAAeDHu1nwcZOcdJAPH5lsCDrwBNMQf5hwpG61fPCYrMcbSpiA2MLntkA2jH+h3ECP98B/1wWGtyM6T24zC66HYBePB/+XeSTZ04NAKmcdT3lq4mYxZzBwlwITW+NGHvg4/r4cUgmpA2JUFFDacsnPR+LvFx3PlJm+2SriE/XVqyHQQdvsgaOfnRkWpqsTMVLHOxo/Qbt6jkkNXHF/baOOxJGo4nBKrg/H9efOb1DpTyruOMumQ+uyrSJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6WEOoMs+pzdjzi1jL0lpLVB/53RytXMX+c0QXchhzI=;
 b=KXwNpb13M2p6gkH/DuwsaWqyoIiEiPQcFW2pfbuOOomco6fFD9IHmlvh0eW+OWfm+ZZhrhVSCqYiwPiuySp8s0SomFukRaAaqLlRyTYexL8eRu6ePvANY5bKtmA6QzXutv2P1TBha+My0M6RbtXb3VKVOWRQD+oHsJQ6Oeu+bgo=
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
Subject: [PATCH v3 4/5] xen/arm: enable vPCI for dom0
Date: Mon, 9 Oct 2023 15:57:43 -0400
Message-ID: <20231009195747.889326-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009195747.889326-1-stewart.hildebrand@amd.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|SA1PR12MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: bf522a57-67e7-4c2a-149d-08dbc90229e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	px2o0iB+6/+jM6kCe48/vmf50l1tVLUGgXBHhbdXe4IEOGcRo2BeRtozkbCIIVw2HOLC1LWZ1w2z9PytOKzGe+g3hE0ymtU/Gw2tEsC0LEDxQNwtX0/0PjeZ+ELn6NsKql1VQPtClRYuuTVH83PWgQiYXR/LQvmSW07mLDYve49qFU4yCMI97Ajuso66Lf8KeO8S7LdZIsjB9sB0Hvkwtn2w5ZXMvcwuPLnCLKYOP+G7WkMI4VI04wzts2yLNCOCAayNlS43os4RptKmbUz0EZQg0D/6RwaMCp4N5MWwlSrNGV93o4BxhqYdtLyRGoErXlKts7i1rsGNmwno84l+N3uJW1CMh18Gce53k4rP+0p88BxhsdHTbbpQ1LPtad222Talir723pyiDDwmw7XMxT02YMxX195HA8rL1OYzRvnV+6P+dMEtALAnhpgZdZG98Ur5lDfR4TbEXVQh1VNUHaxcaelMMF3Rma3QXCi9HKXa+kxdj0mphfA3fIfuOOGRgFjS9WS6Oia2cEv09fFmb6Pn7J+LXcAPG1E0LRk6kdAgr3+aoHdzq2TcrZENjuY5gHfciwlTG7lSqddfDAigrIn2WeS15xDbYxvSu2hdqH135bBzhWb2By7jtFgozK3XgWIPOI1ERcmv/3+q/2AKEEURiMRm7xdUHbZHKGM6oGBTzh6fE1o6WkNEzKDb82G7fCsJAjEDatKd3xKmHw+QXqs4m6ErzpXn9wPUSUW5bS0I4e74cMZInOuOQ3tXv0/w
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(36860700001)(41300700001)(81166007)(2616005)(356005)(70206006)(316002)(6916009)(54906003)(70586007)(966005)(2906002)(44832011)(5660300002)(8936002)(4326008)(8676002)(478600001)(40460700003)(86362001)(47076005)(40480700001)(1076003)(426003)(336012)(26005)(6666004)(82740400003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:58:53.2388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf522a57-67e7-4c2a-149d-08dbc90229e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6680

Set the pci flags in xen_arch_domainconfig to enable vPCI for dom0.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Julien had a suggestion to make this conditional on pci_passthrough_enabled [1].
However, in v5 of the PCI ARM SMMU series [2], we propose removing the
pci_passthrough_enabled flag. If pci_passthrough_enabled is gone, the conditions
under which vPCI should be enabled for dom0 aren't entirely clear to me (other
than CONFIG_HAS_VPCI=y).

v2->v3:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00475.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00210.html
---
 xen/arch/arm/domain_build.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 24c9019cc43c..c1174535f430 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3912,6 +3912,9 @@ void __init create_dom0(void)
             panic("SVE vector length error\n");
     }
 
+    if ( IS_ENABLED(CONFIG_HAS_VPCI) )
+        dom0_cfg.arch.pci_flags = XEN_DOMCTL_CONFIG_PCI_VPCI;
+
     dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
-- 
2.42.0



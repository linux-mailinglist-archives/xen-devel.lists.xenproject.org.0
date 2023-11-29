Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD5B7FDB93
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:34:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644035.1004661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Ma4-0000p6-Ef; Wed, 29 Nov 2023 15:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644035.1004661; Wed, 29 Nov 2023 15:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Ma4-0000nS-Bg; Wed, 29 Nov 2023 15:34:28 +0000
Received: by outflank-mailman (input) for mailman id 644035;
 Wed, 29 Nov 2023 15:34:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rgXt=HK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r8Ma3-0000nM-2L
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:34:27 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6315a53-8ecc-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 16:34:25 +0100 (CET)
Received: from SN4PR0501CA0062.namprd05.prod.outlook.com
 (2603:10b6:803:41::39) by SA1PR12MB8118.namprd12.prod.outlook.com
 (2603:10b6:806:333::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 15:34:21 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::12) by SN4PR0501CA0062.outlook.office365.com
 (2603:10b6:803:41::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Wed, 29 Nov 2023 15:34:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 15:34:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 29 Nov
 2023 09:34:20 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Wed, 29 Nov 2023 09:34:19 -0600
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
X-Inumbo-ID: c6315a53-8ecc-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ps1qrGnOFyEjHLVzsUeDOblO6UCTIMRncrn1FfAE9lD70/QGmPCdaQJbpWpqw00dLaQndc9BUWTZKgAVIrI7gt7KX/pmBBSXXVKIC5jt6mRoZ12xT7vfUQXI2da18wFca5mvluVYpvYQGOK36Kzw2qNp3pp93HPsUym/QW4rZbUGFkPMLgsalzduOy4VpSUZiwa2EDxlpn2Y2w7T/bD+6/91a2KjX/FyAxWISlNS80ym2ucyXDiUzWvBJ2b81n5O1zP8hgBEJ/9cQuh2Bp7xa+qhWT3bPHfblXEqWg7eWpyLHnZKb6ShmxElO0q/ZAykBFCqmA2ap8K4IqyBsSeN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DT403CQkFTD8W2wGghmWDzaAZbK5S9TTD71FwAtwAh8=;
 b=b0uAjD8faPC+ahJACDqXhIdYzG90FetZTx1Byo8B7ruq3nPax2hmrAe2LfewaUWJExrgAlM3uVin61o52i0MenBkB9Vse7ax9Dk13d/APmmuRnd540qMtXVLBap5YZANv32zZMEIw8hnAqK4djrjgNazxKxdiwsA5lSNUAgO8zAD42W0/99fD5KcsckYZoSCmMKfWsTZ7+DmXRNuVhqw34BqHdCO3PZF8QGIRK928A5zEWDvhfOI5dAlw5sG4RGpPnMlHf0O5eyZPh1elKzgHS/6umzVRm+/tyTqz0Rda4ZqCXipNciLflC2U6DVxbWRpwn7XdoM2FngDgGyHgrUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT403CQkFTD8W2wGghmWDzaAZbK5S9TTD71FwAtwAh8=;
 b=KFy3b8MDBKkUIcTzsBnZ+qVgzYoYP+JON7NW02ruCHKzQR5jCKNBCfcBXE5SrXIYBkHmCvsgF499J81f/aOJpcyTF3OZGfuAMiK1eha+jRL6OX5LWmKKZXiCzSjDkXnqE1b5zGe5dEfZTap3+OK5Ve4CA3I/xEkVpSekPPEeteI=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Move static event channel feature to a separate module
Date: Wed, 29 Nov 2023 16:34:17 +0100
Message-ID: <20231129153417.84421-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|SA1PR12MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 867c895b-4d5a-4108-8735-08dbf0f0a881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jBYtCBRF66HxUu0Zm7q+KClf3aJkDAJ5D2KGSIjDmtk1zsyi6UX5Okxz9cDG6z9NW7aeM26xcobbuiMVWleahHjZBk/NPmNvsNCN4Daxb4WIHXcHgN49tIG1CXgdSrnFSJSvVXZGT1PA5Zcf+9evk+dKvHYTakXVoZ7PrG5DM+IBc1NGWkGqp4/HLjRxqlIb6HHU3FbEMzg+BEPQPptvEyP7KWHP5kMCIFUStlgGVMvt51JwlubJkoywXxfLQvg/jLE0CbUx8gGPGttLqUHF0kNeqIqVSxfoNwPGN9ye8/AUiC2K/6ci3BWhN2AN2MZSNJLopnAiF2HVa4hBSEvRlKalmqtMW+KxkYPl4CVtWRM+/0TAN6lQ4TgNR3MvgZmkT7r8kidw43dUHu+cIFNNbUUz4MLg5nMkrp3KdBSWcJM4zrBM1Wna/xbFn+6Wm72K2k7TB5iEBGltBWmhI9bR2IftaWA0WBTOSl+jefVJ4jqOvFNhsy4Sc9eDgh1htTxjxgEP8GkZReTCL8UDipvQFN8hiYySsP0dp0kEUMkv9zViZ+USGABgg6WMsGyp3exdAz673ES7NDtuSPGafJ4j94nHGp4Sr9nqyOwZEQKgoDGS7yHAvjGQF1anTNrmDBlP0OdJTHkZjEP6fx+EOfYBMMF5bih5PLRRDMCx60CLnh6mOp9sARoRornFmiCL+e7s6pBPYNMW4xlPhItnXLWgacfgXIV+qn6S8JJmISXtJ6GyfOvBQU5OYLxOB5HtUXTFPsNEzAa5GjfJIjCLnprDLV/byVLhLHzWWV/Ih/itfmP696uqD/ldJN45DLci7B9J
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(451199024)(1800799012)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(82740400003)(336012)(426003)(36860700001)(40480700001)(81166007)(40460700003)(83380400001)(47076005)(356005)(2906002)(30864003)(86362001)(44832011)(5660300002)(8936002)(8676002)(4326008)(6916009)(316002)(70586007)(54906003)(70206006)(478600001)(41300700001)(36756003)(26005)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:34:21.2310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867c895b-4d5a-4108-8735-08dbf0f0a881
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8118

Move static event channel feature related code to a separate module
(static-evtchn.{c,h}) in the spirit of fine granular configuration, so
that the feature can be disabled if not needed.

Introduce Kconfig option CONFIG_STATIC_EVTCHN, enabled by default (to
keep the current behavior) dependent on CONFIG_DOM0LESS. While it could
be possible to create a loopback connection for dom0 only, this use case
does not really need this feature and all the docs and commit messages
refer explicitly to the use in dom0less system.

The only function visible externally is alloc_static_evtchn(), so move
the prototype to static-evtchn.h and provide a stub in case a feature
is disabled. Guard static_evtchn_created in struct dt_device_node and
move its helpers to static-evtchn.h.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This is a follow up to Luca's dom0less features modularization.
I'm not sure what's the best strategy for static_evtchn_created helpers.
We could also guard them in device_tree.h for ease of removal when we find
a better way for handling the flag.
---
 xen/arch/arm/Kconfig                     |   8 ++
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/domain_build.c              | 146 ---------------------
 xen/arch/arm/include/asm/setup.h         |   1 -
 xen/arch/arm/include/asm/static-evtchn.h |  41 ++++++
 xen/arch/arm/setup.c                     |   1 +
 xen/arch/arm/static-evtchn.c             | 159 +++++++++++++++++++++++
 xen/include/xen/device_tree.h            |  14 +-
 8 files changed, 212 insertions(+), 159 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/static-evtchn.h
 create mode 100644 xen/arch/arm/static-evtchn.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index f73b62e50d00..50e9bfae1ac8 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -217,6 +217,14 @@ config STATIC_SHM
 	help
 	  This option enables statically shared memory on a dom0less system.
 
+config STATIC_EVTCHN
+	bool "Static event channel support on a dom0less system"
+	depends on DOM0LESS_BOOT
+	default y
+	help
+	  This option enables establishing static event channel communication
+	  between domains on a dom0less system (domU-domU as well as domU-dom0).
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 809772417c14..33c677672fe6 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,6 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
+obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
 obj-y += sysctl.o
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index df66fb88d8ec..613b2885cebb 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -38,8 +38,6 @@
 #include <xen/grant_table.h>
 #include <xen/serial.h>
 
-#define STATIC_EVTCHN_NODE_SIZE_CELLS 2
-
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
 
@@ -1919,150 +1917,6 @@ void __init evtchn_allocate(struct domain *d)
     d->arch.hvm.params[HVM_PARAM_CALLBACK_IRQ] = val;
 }
 
-static int __init get_evtchn_dt_property(const struct dt_device_node *np,
-                                         uint32_t *port, uint32_t *phandle)
-{
-    const __be32 *prop = NULL;
-    uint32_t len;
-
-    prop = dt_get_property(np, "xen,evtchn", &len);
-    if ( !prop )
-    {
-        printk(XENLOG_ERR "xen,evtchn property should not be empty.\n");
-        return -EINVAL;
-    }
-
-    if ( !len || len < dt_cells_to_size(STATIC_EVTCHN_NODE_SIZE_CELLS) )
-    {
-        printk(XENLOG_ERR "xen,evtchn property value is not valid.\n");
-        return -EINVAL;
-    }
-
-    *port = dt_next_cell(1, &prop);
-    *phandle = dt_next_cell(1, &prop);
-
-    return 0;
-}
-
-static int __init alloc_domain_evtchn(struct dt_device_node *node)
-{
-    int rc;
-    uint32_t domU1_port, domU2_port, remote_phandle;
-    struct dt_device_node *remote_node;
-    const struct dt_device_node *p1_node, *p2_node;
-    struct evtchn_alloc_unbound alloc_unbound;
-    struct evtchn_bind_interdomain bind_interdomain;
-    struct domain *d1 = NULL, *d2 = NULL;
-
-    if ( !dt_device_is_compatible(node, "xen,evtchn-v1") )
-        return 0;
-
-    /*
-     * Event channel is already created while parsing the other side of
-     * evtchn node.
-     */
-    if ( dt_device_static_evtchn_created(node) )
-        return 0;
-
-    rc = get_evtchn_dt_property(node, &domU1_port, &remote_phandle);
-    if ( rc )
-        return rc;
-
-    remote_node = dt_find_node_by_phandle(remote_phandle);
-    if ( !remote_node )
-    {
-        printk(XENLOG_ERR
-                "evtchn: could not find remote evtchn phandle\n");
-        return -EINVAL;
-    }
-
-    rc = get_evtchn_dt_property(remote_node, &domU2_port, &remote_phandle);
-    if ( rc )
-        return rc;
-
-    if ( node->phandle != remote_phandle )
-    {
-        printk(XENLOG_ERR "xen,evtchn property is not setup correctly.\n");
-        return -EINVAL;
-    }
-
-    p1_node = dt_get_parent(node);
-    if ( !p1_node )
-    {
-        printk(XENLOG_ERR "evtchn: evtchn parent node is NULL\n" );
-        return -EINVAL;
-    }
-
-    p2_node = dt_get_parent(remote_node);
-    if ( !p2_node )
-    {
-        printk(XENLOG_ERR "evtchn: remote parent node is NULL\n" );
-        return -EINVAL;
-    }
-
-    d1 = get_domain_by_id(p1_node->used_by);
-    d2 = get_domain_by_id(p2_node->used_by);
-
-    if ( !d1 || !d2 )
-    {
-        printk(XENLOG_ERR "evtchn: could not find domains\n" );
-        return -EINVAL;
-    }
-
-    alloc_unbound.dom = d1->domain_id;
-    alloc_unbound.remote_dom = d2->domain_id;
-
-    rc = evtchn_alloc_unbound(&alloc_unbound, domU1_port);
-    if ( rc < 0 )
-    {
-        printk(XENLOG_ERR
-                "evtchn_alloc_unbound() failure (Error %d) \n", rc);
-        return rc;
-    }
-
-    bind_interdomain.remote_dom  = d1->domain_id;
-    bind_interdomain.remote_port = domU1_port;
-
-    rc = evtchn_bind_interdomain(&bind_interdomain, d2, domU2_port);
-    if ( rc < 0 )
-    {
-        printk(XENLOG_ERR
-                "evtchn_bind_interdomain() failure (Error %d) \n", rc);
-        return rc;
-    }
-
-    dt_device_set_static_evtchn_created(node);
-    dt_device_set_static_evtchn_created(remote_node);
-
-    return 0;
-}
-
-void __init alloc_static_evtchn(void)
-{
-    struct dt_device_node *node, *evtchn_node;
-    struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
-
-    BUG_ON(chosen == NULL);
-
-    if ( hardware_domain )
-        dt_device_set_used_by(chosen, hardware_domain->domain_id);
-
-    dt_for_each_child_node(chosen, node)
-    {
-        if ( hardware_domain )
-        {
-            if ( alloc_domain_evtchn(node) != 0 )
-                panic("Could not set up domains evtchn\n");
-        }
-
-        dt_for_each_child_node(node, evtchn_node)
-        {
-            if ( alloc_domain_evtchn(evtchn_node) != 0 )
-                panic("Could not set up domains evtchn\n");
-        }
-    }
-}
-
 static void __init find_gnttab_region(struct domain *d,
                                       struct kernel_info *kinfo)
 {
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index bda3c07b8797..d15a88d2e0d1 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -136,7 +136,6 @@ void acpi_create_efi_mmap_table(struct domain *d,
 int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
 
 void create_dom0(void);
-void alloc_static_evtchn(void);
 
 void discard_initial_modules(void);
 void fw_unreserved_regions(paddr_t s, paddr_t e,
diff --git a/xen/arch/arm/include/asm/static-evtchn.h b/xen/arch/arm/include/asm/static-evtchn.h
new file mode 100644
index 000000000000..472673fae345
--- /dev/null
+++ b/xen/arch/arm/include/asm/static-evtchn.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_STATIC_EVTCHN_H_
+#define __ASM_STATIC_EVTCHN_H_
+
+#ifdef CONFIG_STATIC_EVTCHN
+
+#include <xen/device_tree.h>
+
+#define STATIC_EVTCHN_NODE_SIZE_CELLS 2
+
+void alloc_static_evtchn(void);
+
+static inline void
+dt_device_set_static_evtchn_created(struct dt_device_node *device)
+{
+    device->static_evtchn_created = true;
+}
+
+static inline bool
+dt_device_static_evtchn_created(const struct dt_device_node *device)
+{
+    return device->static_evtchn_created;
+}
+
+#else /* !CONFIG_STATIC_EVTCHN */
+
+static inline void alloc_static_evtchn(void) {};
+
+#endif /* CONFIG_STATIC_EVTCHN */
+
+#endif /* __ASM_STATIC_EVTCHN_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d07ea044db48..59dd9bb25a9f 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -36,6 +36,7 @@
 #include <asm/alternative.h>
 #include <asm/dom0less-build.h>
 #include <asm/page.h>
+#include <asm/static-evtchn.h>
 #include <asm/current.h>
 #include <asm/setup.h>
 #include <asm/gic.h>
diff --git a/xen/arch/arm/static-evtchn.c b/xen/arch/arm/static-evtchn.c
new file mode 100644
index 000000000000..b824694762ec
--- /dev/null
+++ b/xen/arch/arm/static-evtchn.c
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/event.h>
+
+#include <asm/static-evtchn.h>
+
+static int __init get_evtchn_dt_property(const struct dt_device_node *np,
+                                         uint32_t *port, uint32_t *phandle)
+{
+    const __be32 *prop = NULL;
+    uint32_t len;
+
+    prop = dt_get_property(np, "xen,evtchn", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_ERR "xen,evtchn property should not be empty.\n");
+        return -EINVAL;
+    }
+
+    if ( !len || len < dt_cells_to_size(STATIC_EVTCHN_NODE_SIZE_CELLS) )
+    {
+        printk(XENLOG_ERR "xen,evtchn property value is not valid.\n");
+        return -EINVAL;
+    }
+
+    *port = dt_next_cell(1, &prop);
+    *phandle = dt_next_cell(1, &prop);
+
+    return 0;
+}
+
+static int __init alloc_domain_evtchn(struct dt_device_node *node)
+{
+    int rc;
+    uint32_t domU1_port, domU2_port, remote_phandle;
+    struct dt_device_node *remote_node;
+    const struct dt_device_node *p1_node, *p2_node;
+    struct evtchn_alloc_unbound alloc_unbound;
+    struct evtchn_bind_interdomain bind_interdomain;
+    struct domain *d1 = NULL, *d2 = NULL;
+
+    if ( !dt_device_is_compatible(node, "xen,evtchn-v1") )
+        return 0;
+
+    /*
+     * Event channel is already created while parsing the other side of
+     * evtchn node.
+     */
+    if ( dt_device_static_evtchn_created(node) )
+        return 0;
+
+    rc = get_evtchn_dt_property(node, &domU1_port, &remote_phandle);
+    if ( rc )
+        return rc;
+
+    remote_node = dt_find_node_by_phandle(remote_phandle);
+    if ( !remote_node )
+    {
+        printk(XENLOG_ERR
+                "evtchn: could not find remote evtchn phandle\n");
+        return -EINVAL;
+    }
+
+    rc = get_evtchn_dt_property(remote_node, &domU2_port, &remote_phandle);
+    if ( rc )
+        return rc;
+
+    if ( node->phandle != remote_phandle )
+    {
+        printk(XENLOG_ERR "xen,evtchn property is not setup correctly.\n");
+        return -EINVAL;
+    }
+
+    p1_node = dt_get_parent(node);
+    if ( !p1_node )
+    {
+        printk(XENLOG_ERR "evtchn: evtchn parent node is NULL\n" );
+        return -EINVAL;
+    }
+
+    p2_node = dt_get_parent(remote_node);
+    if ( !p2_node )
+    {
+        printk(XENLOG_ERR "evtchn: remote parent node is NULL\n" );
+        return -EINVAL;
+    }
+
+    d1 = get_domain_by_id(p1_node->used_by);
+    d2 = get_domain_by_id(p2_node->used_by);
+
+    if ( !d1 || !d2 )
+    {
+        printk(XENLOG_ERR "evtchn: could not find domains\n" );
+        return -EINVAL;
+    }
+
+    alloc_unbound.dom = d1->domain_id;
+    alloc_unbound.remote_dom = d2->domain_id;
+
+    rc = evtchn_alloc_unbound(&alloc_unbound, domU1_port);
+    if ( rc < 0 )
+    {
+        printk(XENLOG_ERR
+                "evtchn_alloc_unbound() failure (Error %d) \n", rc);
+        return rc;
+    }
+
+    bind_interdomain.remote_dom  = d1->domain_id;
+    bind_interdomain.remote_port = domU1_port;
+
+    rc = evtchn_bind_interdomain(&bind_interdomain, d2, domU2_port);
+    if ( rc < 0 )
+    {
+        printk(XENLOG_ERR
+                "evtchn_bind_interdomain() failure (Error %d) \n", rc);
+        return rc;
+    }
+
+    dt_device_set_static_evtchn_created(node);
+    dt_device_set_static_evtchn_created(remote_node);
+
+    return 0;
+}
+
+void __init alloc_static_evtchn(void)
+{
+    struct dt_device_node *node, *evtchn_node;
+    struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+
+    BUG_ON(chosen == NULL);
+
+    if ( hardware_domain )
+        dt_device_set_used_by(chosen, hardware_domain->domain_id);
+
+    dt_for_each_child_node(chosen, node)
+    {
+        if ( hardware_domain )
+        {
+            if ( alloc_domain_evtchn(node) != 0 )
+                panic("Could not set up domains evtchn\n");
+        }
+
+        dt_for_each_child_node(node, evtchn_node)
+        {
+            if ( alloc_domain_evtchn(evtchn_node) != 0 )
+                panic("Could not set up domains evtchn\n");
+        }
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 3ae7b45429b6..492363bcde10 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -94,8 +94,10 @@ struct dt_device_node {
     /* IOMMU specific fields */
     bool is_protected;
 
+#ifdef CONFIG_STATIC_EVTCHN
     /* HACK: Remove this if there is a need of space */
     bool static_evtchn_created;
+#endif
 
     /*
      * The main purpose of this list is to link the structure in the list
@@ -366,18 +368,6 @@ static inline bool dt_property_name_is_equal(const struct dt_property *pp,
     return !dt_prop_cmp(pp->name, name);
 }
 
-static inline void
-dt_device_set_static_evtchn_created(struct dt_device_node *device)
-{
-    device->static_evtchn_created = true;
-}
-
-static inline bool
-dt_device_static_evtchn_created(const struct dt_device_node *device)
-{
-    return device->static_evtchn_created;
-}
-
 /**
  * dt_find_compatible_node - Find a node based on type and one of the
  *                           tokens in its "compatible" property
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082B7FEC67
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 10:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644516.1005626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8doG-0001TS-DY; Thu, 30 Nov 2023 09:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644516.1005626; Thu, 30 Nov 2023 09:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8doG-0001PE-AV; Thu, 30 Nov 2023 09:58:16 +0000
Received: by outflank-mailman (input) for mailman id 644516;
 Thu, 30 Nov 2023 09:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u2PQ=HL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r8doE-0001Oo-Su
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 09:58:15 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8a969a8-8f66-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 10:58:12 +0100 (CET)
Received: from SA1P222CA0185.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::11)
 by DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 09:58:05 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::3d) by SA1P222CA0185.outlook.office365.com
 (2603:10b6:806:3c4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24 via Frontend
 Transport; Thu, 30 Nov 2023 09:58:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 09:58:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 30 Nov
 2023 03:58:03 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Thu, 30 Nov 2023 03:58:02 -0600
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
X-Inumbo-ID: f8a969a8-8f66-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4gz+UBjzCQD1a7KpT0/v/ShmqsdGiM9hYWHhsKUVhnnp+lHYetmQMnj/nAUIqUbFH6UDVw/bYCN37XXGZg+3oDlxdBXkdp+G7Ai4WidVxP+24cRXk2GBDlwjBgy9rdStmPyMqzuT/XDMo+hyWXnpy8Z3patjkFJS2tZ3oIZwJm4Kfi10XKrEwvXM29P4utcpM8AHj6K1VJf5Qj0uSdiFsoL6BMjA1etJnlXjAItJSzkh4j1AmbJx8sx2md6NmurNklf7FW9zYLNaSyrN9ndDHXcl/qAb563TPEm2q9MrxtZXRUkHgiMcH/ei0UWEvDM9+AecDoWtb0hOV1lfzyOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoQndq1anzKRidOd2oPbDOq5osBwmkGhUifF7TFstiU=;
 b=ci4AppeeqhgSl7IMYj3sfmCciv2CJ1eLHCbMUFZcgALyhQUTuHy1jE7PwU5x1DsolaV1bxPbpnm7kRqV3xpzmId2czBsp4JwwHl5IJXvTubQVHO5wcQUwkQI9kmtU+mlyjlpZnekKA9esSUQHxGmCzmm0mV38ZHBTkd18Qi4qviDEPjuaUH0qc7QHMMhN9Hu0wDkCNLKtgceRjgCIfreV/Q8c3g7qWcImv23qV0hD/KjaiImU3iaMcD7GygKm+PkN6m2QelldFZy6iIPCYXiHoKi9vvVEiPIcbDoIofP55zRATZ+FyUeb8yBYI/7AK4Srtufy3qzgU+/YUQOla6oYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoQndq1anzKRidOd2oPbDOq5osBwmkGhUifF7TFstiU=;
 b=MkVerIAGOBSFBGxUP/jXyLgDvtrXnJBJibjXdgVnjXGMoESxHe6wFP3eO9fAVGp2yPJ006llgyP1T8x8oxk8LjjpkZRB9icamWiMp6LyzBRi54C9vhtpdxZHgsArOaw2HMLAS7mz/LzAvzHIbVlObZSpQ97bDH4GVPKT05Zn1X0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Move static event channel feature to a separate module
Date: Thu, 30 Nov 2023 10:57:57 +0100
Message-ID: <20231130095757.11162-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|DM6PR12MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d0bff1-f337-403b-5f7f-08dbf18ad90f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ieu8j0dX8iYtdvWlxL9+Loay1I8MeeCfCIcQrsyt4lGOPWzgpsIYlzvwcZsLwpcwQW6x8LUw+yO72gTOrG3swvGFJodJ/HAe53MyB4D7wq3NzIkdD/gPsCM90121nXZfbAJvkcK5TW/gwyXaXiX38KCGaVqHgNB0ymcHxepoXXLV5lBPHumYNfMrN7DVexeKq8NeVhlT/T0gBFdUvgWEpTFvIvAJ1YEffq81jotYEitYcuQmOevfCTHhVCSXtgyg/iceCL6IY2xiOtIiDwE27W86IXn4aL43Ci3DjATzMMxZRtsnC+SyZbGJ4XIyhOkutczG4ggJmgJY8tJWa2dv1zTZdfWtSFTvSo0CG6hExhUmIjxHDd6rvkkuxzvfar6+XgWUUQ5oexKUfqJCzYWrVDjXx1NT7nxUe2hJGxZxm/YSVfz8Ym2OawHuEWZhiksfTDKAKiPjAPQiUc0nvrfI8T4k8TY/m5cKxCeDu8BPvrP1UfMNGqXejJ6ynOyRPQObuSd3e77WgoIakq5x+eyvnZyFZg6E2R6mD/JUYB49SqSCnKTevLm+7AZ0slwZeGVjjzpz5QQlpAeZxAwe7rZjjxMsPjRFDeQ4dSrpuY/q3m4Q2Z7stSzq5iI6VzROSsXvyWf0lxuwZQqT2YAWVa1376plhul6jfBLwclDHKVD1SLp4G6uvWxi6JlRryWp5bG6fcOJbG7DGeMJYAqpyKvQBXUQVQX0PLT/FxhigFCjdvvCxA4fV9KjOYY9FqnwCdWv8bYSJ7KW+dNE2NSIbOMWM4WdClE9ZROHVfaHG0wjFewJYie9L8wbCqqeZMWdt+jmVSSIOHnK+yjnuHEk3wrpHic3QAvRFgWF6Xv841N7Pns=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(1076003)(26005)(336012)(83380400001)(426003)(6666004)(2616005)(36860700001)(47076005)(44832011)(5660300002)(4326008)(8676002)(8936002)(41300700001)(30864003)(478600001)(2906002)(316002)(6916009)(54906003)(70206006)(70586007)(202311291699003)(86362001)(36756003)(81166007)(82740400003)(356005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 09:58:05.1720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d0bff1-f337-403b-5f7f-08dbf18ad90f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251

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
is disabled. Guard static_evtchn_created in struct dt_device_node as
well as its helpers.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This is a follow up to Luca's dom0less features modularization.

Changes in v2:
 - keep static_evtchn_created helpers in device_tree.h, move macro to *.c
---
 xen/arch/arm/Kconfig                     |   8 ++
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/domain_build.c              | 146 --------------------
 xen/arch/arm/include/asm/setup.h         |   1 -
 xen/arch/arm/include/asm/static-evtchn.h |  25 ++++
 xen/arch/arm/setup.c                     |   1 +
 xen/arch/arm/static-evtchn.c             | 161 +++++++++++++++++++++++
 xen/include/xen/device_tree.h            |   4 +
 8 files changed, 200 insertions(+), 147 deletions(-)
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
index 000000000000..f964522f6a62
--- /dev/null
+++ b/xen/arch/arm/include/asm/static-evtchn.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_STATIC_EVTCHN_H_
+#define __ASM_STATIC_EVTCHN_H_
+
+#ifdef CONFIG_STATIC_EVTCHN
+
+void alloc_static_evtchn(void);
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
index 000000000000..49db08d5c6fc
--- /dev/null
+++ b/xen/arch/arm/static-evtchn.c
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/event.h>
+
+#include <asm/static-evtchn.h>
+
+#define STATIC_EVTCHN_NODE_SIZE_CELLS 2
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
index 3ae7b45429b6..94a836cb4e38 100644
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
@@ -366,6 +368,7 @@ static inline bool dt_property_name_is_equal(const struct dt_property *pp,
     return !dt_prop_cmp(pp->name, name);
 }
 
+#ifdef CONFIG_STATIC_EVTCHN
 static inline void
 dt_device_set_static_evtchn_created(struct dt_device_node *device)
 {
@@ -377,6 +380,7 @@ dt_device_static_evtchn_created(const struct dt_device_node *device)
 {
     return device->static_evtchn_created;
 }
+#endif /* CONFIG_STATIC_EVTCHN */
 
 /**
  * dt_find_compatible_node - Find a node based on type and one of the
-- 
2.25.1



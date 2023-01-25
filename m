Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A802767ACB9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483903.750369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbQL-0003A2-UU; Wed, 25 Jan 2023 08:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483903.750369; Wed, 25 Jan 2023 08:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbQL-0002zL-NC; Wed, 25 Jan 2023 08:46:29 +0000
Received: by outflank-mailman (input) for mailman id 483903;
 Wed, 25 Jan 2023 08:46:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbQJ-0001qZ-IG
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:46:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c107994c-9c8c-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 09:46:26 +0100 (CET)
Received: from DM6PR08CA0043.namprd08.prod.outlook.com (2603:10b6:5:1e0::17)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 08:44:55 +0000
Received: from DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::50) by DM6PR08CA0043.outlook.office365.com
 (2603:10b6:5:1e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17 via Frontend
 Transport; Wed, 25 Jan 2023 08:44:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT115.mail.protection.outlook.com (10.13.173.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 08:44:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:44:53 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:44:52 -0600
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
X-Inumbo-ID: c107994c-9c8c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZKJ+r++xbLiJS/zYGFJP+fHkvEOBIMEkKfYQoukd5vtKLjDV4CJX2Z4fLEIGpzy0BqIKu6gKqYeHieGF1N1aoczy+XCEJZ0S5f3DXVN+ICaoVlK+Kvqtcc+CKbKNjTDuNYq4B07NxrnFnpbPYtdTXCqKOwb8NSat/wk8IQv6VzILXZIh0zr56et1eP7soRtwCb02QHA+p+ouIlXDFl6H1pvCyyknsv17aHYdXMfGLR12rzhK3/oEamKnieSEtjKbSvQu6H3PYp8pJfYJI/J8ftrzIse3zrn0z0GJ/uwS/yQiEbZqxLFx+3Y4/k7CvyGARSvkReOLrLRO+/r9OpLAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6RMYIuXur/hQizPdgkR79Juo1RH5cFqlOnZ0Xl8lqo=;
 b=gnf3Dn4Wk+B3G4Iz1BSqftFRfMkfnbb3ZWoUhPtRJfjktF9tiaW1hHhomY19+lu5H8C1KBIcr3oXhmuN8K0E+teANIjx5O93BwXqdnzOexzaLe31Hl5ESzp9MlttjqeNppvOj+Q7IJm4JvVBpgKv5ddClOLTLGVcNxn4j6r/rCw0IG5HfgfjUqFssnj0MUxCMhG+7T+qwNW+9N4UYA37Jsm4jCpd2/kzCtR7jgEQhIYLX3Wkvk6X97qYcB0H94edxntwdXsOAN7awuskVb8HbgmYl1RUIyde0yb6OeaSrz0fY5F50cv1v5Vt3YwHlyD2gXNrRGJvq/rjEDYDruOnaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6RMYIuXur/hQizPdgkR79Juo1RH5cFqlOnZ0Xl8lqo=;
 b=vldVUt1KH+Mo6Rt3OeV85C4wKPj+I3uIcNFji1GmSnOBl1xCfVIgN+rCzLW4bVRjplysDmhGkRfGttqxjxXdjI97AE974GxcANT2bS8DNvNA1F6aq95y7I5IF7Dmrr1tKUGmbXEITGA8zCkUAxz0MpA2a+WX5RMl1ZA81En4m4c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: [QEMU][PATCH v3 04/12] xen_arm: Add "accel = xen" and drop extra interface openings
Date: Wed, 25 Jan 2023 00:43:49 -0800
Message-ID: <20230125084356.6684-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125084356.6684-1-vikram.garhwal@amd.com>
References: <20230125084356.6684-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT115:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: 73687c1e-53a1-42a7-fe2f-08dafeb06e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oUtmTJ7y1AgSEHl6PkRSX8s2dmFNxi1Qja0LHx7oFtqtUemcwrD6RwisYgTFnSt5wjX9Ti199ItD9AE6uP9VklJCXtKwa46ODq4EG9mRhDuqUGJB5LCMK2n0+MYlWfgei6gEk8P5uf0NbXYb8JyLDKTJ8WKyeiVSSmE1D1COWs8+ZJwNjWb9LqYi7UNTWAiQhKHCUYNjioAsqHQMazjNS6zZt5p8TajUvqn3j5SM0DjhwkUPyqr9eqCkuzBGGgsM7en6WjuxDMBnGwR1nI0fRWqqKXdIDhDiCkS2kfFit6C8y/k4CE0XRUIRuI06xZo+U+PNj3CfICxDUaoqY2bpze8hP9o8s/tCRzkMxP3bwModvzFhXyF/oiFGD7osKj5kS+jAK5fyqrbHcB3t34wx63uYr6AOFA2mcG0d0QdF3VuXTITBESiEIpH3VnDB9t3MxjOMxXvK5d6aLibiqLd+2TQPjguR/mmKhoAIQo4zlJRBjLsT2WfZ4qtSWCEdpXcPKOgb4fBxwyveWS0Sly8kqLngXvKAILlBURXVBTy+fhCzS4kdH10BvcgHtBrlxASH97xfw9gnll4txiyJ1M8JLIbnE+SgMOZyK5azgwy+NSLThvAtMvalm1K4w+pAvXz8qUXv1mIEyX2licxUuoNy+ISl+wbgsvcqY7M2Uq1iGp5FnitYot42op4pVIewgRF62XhX+aspcFaHvy+G4DYgcQrATkTYyEpnf9BqgsNhJvk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(47076005)(36756003)(8676002)(40460700003)(40480700001)(81166007)(36860700001)(356005)(54906003)(2616005)(426003)(83380400001)(336012)(86362001)(26005)(82310400005)(186003)(44832011)(478600001)(5660300002)(6666004)(316002)(1076003)(82740400003)(70206006)(41300700001)(8936002)(70586007)(6916009)(2906002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:44:54.5966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73687c1e-53a1-42a7-fe2f-08dafeb06e6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674

In order to use virtio backends we need to make sure that Xen accelerator
is enabled (xen_enabled() returns true) as the memory/cache systems
check for xen_enabled() to perform specific actions. Without that
the xen-mapcache (which is needed for mapping guest memory) is not in use.

Also drop extra interface opening as this is already done in xen-all.c
(so drop xen_init_ioreq() completely) and skip virtio/tpm initialization
if device emulation is not available.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 hw/arm/xen_arm.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index fde919df29..4ac425a3c5 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -137,30 +137,6 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
 {
 }
 
-static int xen_init_ioreq(XenIOState *state, unsigned int max_cpus)
-{
-    xen_dmod = xendevicemodel_open(0, 0);
-    xen_xc = xc_interface_open(0, 0, 0);
-
-    if (xen_xc == NULL) {
-        perror("xen: can't open xen interface\n");
-        return -1;
-    }
-
-    xen_fmem = xenforeignmemory_open(0, 0);
-    if (xen_fmem == NULL) {
-        perror("xen: can't open xen fmem interface\n");
-        xc_interface_close(xen_xc);
-        return -1;
-    }
-
-    xen_register_ioreq(state, max_cpus, xen_memory_listener);
-
-    xenstore_record_dm_state(xenstore, "running");
-
-    return 0;
-}
-
 static void xen_enable_tpm(void)
 {
 #ifdef CONFIG_TPM
@@ -198,9 +174,7 @@ static void xen_arm_init(MachineState *machine)
 
     xen_init_ram(machine);
 
-    if (xen_init_ioreq(xam->state, machine->smp.cpus)) {
-        return;
-    }
+    xen_register_ioreq(xam->state, machine->smp.cpus, xen_memory_listener);
 
     xen_create_virtio_mmio_devices(xam);
 
@@ -218,6 +192,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 1;
     /* Set explicitly here to make sure that real ram_size is passed */
     mc->default_ram_size = 0;
+    mc->default_machine_opts = "accel=xen";
 
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 }
-- 
2.17.0



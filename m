Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0838777EE6E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:41:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585008.916014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR4I-0006Da-2Z; Thu, 17 Aug 2023 00:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585008.916014; Thu, 17 Aug 2023 00:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR4H-00067a-PN; Thu, 17 Aug 2023 00:40:53 +0000
Received: by outflank-mailman (input) for mailman id 585008;
 Thu, 17 Aug 2023 00:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4F-0002YP-RX
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20618.outbound.protection.outlook.com
 [2a01:111:f400:7eab::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b63fafcf-3c96-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:40:51 +0200 (CEST)
Received: from SN4PR0501CA0038.namprd05.prod.outlook.com
 (2603:10b6:803:41::15) by DM4PR12MB5342.namprd12.prod.outlook.com
 (2603:10b6:5:39f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 00:40:45 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:803:41:cafe::ad) by SN4PR0501CA0038.outlook.office365.com
 (2603:10b6:803:41::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:45 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 17:40:39 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:38 -0500
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
X-Inumbo-ID: b63fafcf-3c96-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbwwDRYMB7jKx1IE8X+OAIPS2u5ztJ8uyQd/qLPWHQPJA5JHkvXzIBAovceYRSCoXURwc0u3RYgW0xPPONLJ/q6cRGY8DWvKN7mPDe+FA96lRgjvR06b3WM9GUIv4T4YhOGPADIbpYM0OB6Hh4Mkbv+DJpMuM4CsiWji/g1Sk+tqOLi1cRVJwh/uuG/wJcsQDcCnRAzIxvsY4m8hN8b/rcS1sg2mzhLaABZMdOy0HPA+dbR8qTwDYg995kkrn/85jTcsu9OKgm8Z1HG5cdZ+/6QlWXSsV1Dn34FpBXUsN3VifojUFszNs3wVV3ebTv7UeCWMGrQvqX1I+/p+HATaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umzmBwETsxaXneMYshLnsO55s0EVvWX81Jc1LOTJ0Nk=;
 b=mijolHuY58UYTL2imLiMQIpVVVuhP9uUoFLDHg1M756Dh8cyyFLuwyzUWK6/VmQwuUNSexOdD5xpoBEKCbxzH4LTRrInTLSR483KQw8QKymcS7OZL2zrgYQNKWVYG6EnjmmN4zvxdDLU7ouZ8HuXmkTryMJL138dzsqOt8JHpWkzuH0bARk/UhTfWZZbT1XJentcwbeC73DkuYZyMawZm0ouE/JxsoGNtuLe2FXUA3ve4iGdfnnwVZxBU010aE9FisWg8c5eYAw8BYpjJAerdla+O4oFiak48bJKvv5gryo4r/8HCl0LUONEBceajWfQcWj7+4FR92SPl0vFxyuUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umzmBwETsxaXneMYshLnsO55s0EVvWX81Jc1LOTJ0Nk=;
 b=L5uR+qyDIxtjXS0mO64+QEm2td0/Hrvqh4sjZ7qNHFlYQE5u8hXiKCEIT8DXT+llL9yYAxHAIyeorm4OKUsm+NgC0FrTxFlBi6vvK9M35C4VfTg67dK3Wg1G7K/oPGWAXdfGEGo2q6VX0/dCgfN+4eYadOIzi41I4rofZPNK1bw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH v8 11/19] xen/iommu: Introduce iommu_remove_dt_device()
Date: Wed, 16 Aug 2023 17:39:39 -0700
Message-ID: <20230817003947.3849-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DM4PR12MB5342:EE_
X-MS-Office365-Filtering-Correlation-Id: 017010e9-a2aa-4511-ba25-08db9eba97e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hgfa5qlBXpYW4u97Y06Wj3pnQy7ZN3AI9i+ZMBYWTgD3yV3cC6mziKcAkKi9j2UKTesdH9MKnXmvTYPJ7Ddg06+lTy+xSJFetNtH5OnOM7YvtYWi0x8nlYaJ0KLKONyKdufN9O0yMBWfbEYGBAeJgrJEhMiKGgKEQ188ukbBwaTPrNl6k4eJWMnibCxG85yUyu9YRWPl6tZR1U1PnoHZ5z+Ska4dkAYIBN9o/Aq0tytPMa1l/85q4MgvLFHuCx4wh0eP/1xTalcNLaJmY/g1JWu7sdJ99HaPK5lzN9t7SUJ9+o8xuyG5GaLWTDylzEpgQYsoBJLw7srnFg03sobe9CrIlO38IPlBY/Sy4AK6rTVg3H0gzFiAmvVYTJIm4lrE05DivxWVolPPd8RRUc/vsMnycGAa/zteBaBZXKIIYi3J+NUwBSAT/xEL/gDZJYlVrYir4MOpgV2eNym+Ou9bKCO4LJCNaeLnY5JTmZjfapOA+6BF3uXVK+8dQw1ezmwygL8YipnggLhhfc5tE9EoUeZ2zppAJ+lpBxvuFjtE+zoJ5sU7y5mPYYJNv5ITZGQUuqc0UD9HfSX0X5SX7kxTbe+xpIRmPXdP13yjWI8gsYb4sMVhaww47MJbVsTFWee0evVuEQvPJAY5jak77PDmLEm0hJy1aRvu/biJ68MCu7DW4fILR+DVr2RrdYIwOVLejC9za25e5wzjjPQbQBpnMI4eo7nfjf1dijaVm+JQFy5uY78cCdzsXj+Zfcf7h+MZY7kKQpiVFQykxPtmwGwdDg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(186009)(451199024)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(36756003)(86362001)(40480700001)(40460700003)(83380400001)(8936002)(4326008)(8676002)(5660300002)(2906002)(41300700001)(1076003)(26005)(2616005)(44832011)(426003)(36860700001)(336012)(47076005)(478600001)(316002)(82740400003)(356005)(81166007)(70586007)(54906003)(6916009)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:45.1599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 017010e9-a2aa-4511-ba25-08db9eba97e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5342

Remove master device from the IOMMU. This will be helpful when removing the
overlay nodes using dynamic programming during run time.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v7:
    Add check if IOMMU is enabled.
    Fix indentation of fail.
---
---
 xen/drivers/passthrough/device_tree.c | 44 +++++++++++++++++++++++++++
 xen/include/xen/iommu.h               |  1 +
 2 files changed, 45 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 096ef2dd68..4cb32dc0b3 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -128,6 +128,50 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc;
+
+    if ( !iommu_enabled )
+        return 1;
+
+    if ( !ops )
+        return -EOPNOTSUPP;
+
+    spin_lock(&dtdevs_lock);
+
+    if ( iommu_dt_device_is_assigned_locked(np) )
+    {
+        rc = -EBUSY;
+        goto fail;
+    }
+
+    /*
+     * The driver which supports generic IOMMU DT bindings must have this
+     * callback implemented.
+     */
+    if ( !ops->remove_device )
+    {
+        rc = -EOPNOTSUPP;
+        goto fail;
+    }
+
+    /*
+     * Remove master device from the IOMMU if latter is present and available.
+     * The driver is responsible for removing is_protected flag.
+     */
+    rc = ops->remove_device(0, dev);
+
+    if ( !rc )
+        iommu_fwspec_free(dev);
+
+ fail:
+    spin_unlock(&dtdevs_lock);
+    return rc;
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 110693c59f..a8e9bc9a2d 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -233,6 +233,7 @@ int iommu_add_dt_device(struct dt_device_node *np);
 
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
+int iommu_remove_dt_device(struct dt_device_node *np);
 
 #endif /* HAS_DEVICE_TREE */
 
-- 
2.17.1



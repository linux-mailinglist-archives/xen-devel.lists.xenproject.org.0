Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29C271F752
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542798.847162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syY-0003QU-Ig; Fri, 02 Jun 2023 00:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542798.847162; Fri, 02 Jun 2023 00:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syY-0003C0-2O; Fri, 02 Jun 2023 00:49:06 +0000
Received: by outflank-mailman (input) for mailman id 542798;
 Fri, 02 Jun 2023 00:49:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syT-00018B-9y
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:01 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42925077-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:48:59 +0200 (CEST)
Received: from MW4PR04CA0097.namprd04.prod.outlook.com (2603:10b6:303:83::12)
 by MN2PR12MB4582.namprd12.prod.outlook.com (2603:10b6:208:26b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 00:48:56 +0000
Received: from CO1NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::ca) by MW4PR04CA0097.outlook.office365.com
 (2603:10b6:303:83::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT112.mail.protection.outlook.com (10.13.174.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:55 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:54 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:53 -0500
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
X-Inumbo-ID: 42925077-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbdfTIhNv4OLVWrNP5mYWLnmWofmDkgClqNefvtthr79xyZ28ZsxXCnY4kcldDZEf8yM1qq89z3IbzJ+X3y+XUVuLHaL1RotX8X1wpROsprrFEHwRPA5Gr0yq2fyRUjmFQvhGWnqRWwyHQcqVxxti4dRiG7WR4SxXp1bmBek0AdGSFk4aMKhSgkm8Z6V0bK307l82o4rN0f239mWUx8oHwJhJGLOrrlr1cFOVF1HuNnsAGc52FQcgulF3KPzWdnwlzWjPCIBC7Omo8Lfk88N6WGe5IagPqiw7sdEm7SvyZvKomJS3AFtjp5cbiqgzeqvQj/Mk1nAwbC+kQfdMXUDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyXqOAFxYRECrwE1b2BNmdAgZBkIMTgn0iP+i+1WDJY=;
 b=mzxWwgBMuYOdSW4Nhj0pGETvue30ztZlHlSdBVGkmzn1M1unGKnb7WweFKCErXnwWMyXu/et2ZXRsik8tVwp2ZQIkHaxtxSHmmvTF7XAGpZxaq4Ay5G8eDLvPy59XZhgc8n/Pda2lKoonToqPu/GaeLtnhZ5CxknKMAH0raojAfKYVqfmbPA4/OvrVzn7tGkm6RgUGQ910HnqVOSWOfo9HX289x1vUpxwjr4RSOkpC/vCvI9Ab/5I5m1jVqMV0Kx+r37JYFYsyW6diWNO89faeg5colfidl2gFVVfp5eUbJjP1Qm1VxhUSrERHi7x+wyd6xDCFjgbX4m/EiJrrdf0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyXqOAFxYRECrwE1b2BNmdAgZBkIMTgn0iP+i+1WDJY=;
 b=UOO0h68uhzaEulaqDNYowPGBsD6CpGzSxt/9iZSUiuoWY1fH9w6QcEMpsauG/uEev2Q5Dff9tza128cHgm+mH8kTd/HP10oFyEFgUf2F4gzFARvk5grBsUKMwYwbeUMWK4xDltoueHOn0uNHDc0/blZaZAftBvaqNCA4Ilae+Cw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Paul Durrant <paul@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN][PATCH v7 11/19] xen/iommu: Introduce iommu_remove_dt_device()
Date: Thu, 1 Jun 2023 17:48:16 -0700
Message-ID: <20230602004824.20731-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT112:EE_|MN2PR12MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f3fd61-e29e-416e-f561-08db630324c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RAFsIcHVmsqwTvrA2ibNNgBwwG/WvKLzhRa6ZoKASaEMTgwCHMuY559yXcLx7LLzzx+juoWkHXpnZuFVp60Ui7yRaPX+OVtHSh4+qCCfzobnm/KABYZ8arMzbLdDCFi+IHL7uDVzWDR7ObN7A2wJ9Vc2Znt3HtWYLp6wQ0QYQV6s9B97GV6sHc043YT6gSaWO0ant9mtHfMo5zNpCRRt5hyK/H2Vq7LZ8RS8Duo3NilpRhqsCliGExSsEClnID76Ia7rhMnkbxpp3DY97mWZ00w+r8jDItIXzN1Tz7MCZg5IzdCLlA1zukhDQ3ENIgoio+uz+SRXSkhq2SNHNn7y3ZjEsLf7G4L+GRdA9BALrzLG3m0Lp5XfWVwLwsV5xpHFifrKPgBqmAT2zEKfb+1S+LKt0Ano0ZQlUTTmg/rZFXJnu1UtF6YwXKMgbruqGw6TPh7zxeLyZjFmjVajRGozgCY2dQQXMzMi4lFFAAkrY/3rlkeLW5SRHeWbT4yBEpj6Xvk1/s0ffux7zlV96AwFmeEzMGWl1q2L3qdUI/6qnIn+KqKcEzBUUYN4xL0sTWP+om3q5ORCSmRt1cWsgc8RLTwGDNQfQ0yQULtGmI4C8BVzdx4Y/n8dsxCBbg55ah6VZ9ZvTcrNi48t4F4T4ody8uX1Z6XS55E8vHzGQdX03c6FNxOU5kwNUbEWseLkveeUHo+7GA7uS8zSVYE0kZcbmXURVFaGL0WqQyX0k/W+S75V445h/yELsF5OES7LqOzYdaGMA9lfPKlOQzFgn/zvzw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(36860700001)(82740400003)(5660300002)(81166007)(356005)(8676002)(8936002)(1076003)(426003)(336012)(83380400001)(2906002)(26005)(2616005)(47076005)(44832011)(40480700001)(6916009)(6666004)(316002)(70206006)(4326008)(41300700001)(70586007)(86362001)(82310400005)(36756003)(186003)(478600001)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:55.4590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f3fd61-e29e-416e-f561-08db630324c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4582

Remove master device from the IOMMU. This will be helpful when removing the
overlay nodes using dynamic programming during run time.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/drivers/passthrough/device_tree.c | 41 +++++++++++++++++++++++++++
 xen/include/xen/iommu.h               |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 8cc413f867..301a5bcd97 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -126,6 +126,47 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc;
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
+fail:
+    spin_unlock(&dtdevs_lock);
+    return rc;
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971..0d7924821b 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -229,6 +229,8 @@ int iommu_release_dt_devices(struct domain *d);
  */
 int iommu_add_dt_device(struct dt_device_node *np);
 
+int iommu_remove_dt_device(struct dt_device_node *np);
+
 int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
 
-- 
2.17.1



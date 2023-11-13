Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0587EA604
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632041.985954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fKi-0005js-5r; Mon, 13 Nov 2023 22:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632041.985954; Mon, 13 Nov 2023 22:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fKi-0005h9-2t; Mon, 13 Nov 2023 22:23:04 +0000
Received: by outflank-mailman (input) for mailman id 632041;
 Mon, 13 Nov 2023 22:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGJv=G2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r2fKg-0003AY-Vd
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 22:23:02 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33f74631-8273-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 23:23:01 +0100 (CET)
Received: from BL0PR02CA0070.namprd02.prod.outlook.com (2603:10b6:207:3d::47)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 22:22:56 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:207:3d:cafe::4a) by BL0PR02CA0070.outlook.office365.com
 (2603:10b6:207:3d::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Mon, 13 Nov 2023 22:22:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 22:22:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 16:22:53 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 16:22:52 -0600
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
X-Inumbo-ID: 33f74631-8273-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxjqhUtRdNSsue6WKx5PE+QP0EGEUYU85GIElfpcJsiU+Lgz5GcxruZnexjKdm0sI9CzghpPKYgeJSyQdG13mBai09ll2pM+/ZhUqyZhp/vKeymkmETCls8L//qBRblbUEFIm+fy7HoU0pTxoAzjyr+qfQk20TFLmCGcTUGPSTf9BE0bnvpOMKo7E/uigFuHjDFy9HcjbovaLr+nneGgcF1qAYxKzTf4sFXflYEcgMA6zS0Dsi+5e8onwVt+M1rQ/OiP651qcrOWUxJBcWOnmSk/tKo2kufyZHwYd222uMk++DwgrPfuCXQK+Z5/j4xRc7GTMrZw6mks6hWwRw9MWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1ygEMRNlCIyFbC9uBsJtxb9vimpr+FuY6Zv4K74hIw=;
 b=GT4uKT7Bln/91OJY9+eTYzRqT4zElnQjFNoCQHlZNdpYqM22QX5tywYeVdNyGj6Uy5evBL6IpI3NuLwKdN/fbjEnCnMUt4yVich+EXDrZhftwbqD81s4Ig+CM3hQjRYWko0DL1aBxQFsWHTSOrXkgJfIgZGjWpjJl6pjxBvxivnCu2jUZqDw1PIbYGuKSzEBPCeRkFJW13ESqvmd6VXI9rKhqE7MzsvagG7s53kQO95Yk5jiO33GkINjm4Q2sMAcYTn3SSO1MDsozZw/l14GttLqjvm+6+32jQvrKrNAtGo7hX3ZfV00fhYEA/C8ev5gsAdw0NuQcY1FvPGz6oR3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1ygEMRNlCIyFbC9uBsJtxb9vimpr+FuY6Zv4K74hIw=;
 b=oLlpepXzkqkkoNms1hpbu1yFgFdUysSPmiOyqRoPSjQKphhbjhWGz5Ix9+Bx5YDyDnWbgG2/rrNpNAxgk+/fGy/mFGQQY1PGWvt6x5LIzOq1EqnWpbSmDCfcIo45RZxCQREgWMUCuzhpsRwURCzvDnBsSWZM09A6Mx+PymXZQsk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 5/5] [FUTURE] tools/arm: enable vPCI for domUs
Date: Mon, 13 Nov 2023 17:21:14 -0500
Message-ID: <20231113222118.825758-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113222118.825758-1-stewart.hildebrand@amd.com>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4e231c-d4b9-4b9c-3899-08dbe497158d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gVcWFUd6BeU9Kw00LyP/JHH23ye9MWx07xdwzPhJSm/kc0IetilhCORNQxNpUCZ6E6Z25eRn697zCnN3ooSs6Fhm1MzSHTbH5rSlIw0/YmP+j8eSIRiL5m9Ep2TGCLko7kWTVeE2AHjwXA8MMj2bECUP2emlEbZNI6AIUxc3hbdnuk4BxmEEar8NBwIVBrVYURU9Nr/kkfc2UqtAeGnH5dQvYsziWMAMiI7YIbT/SAiErBBlTTIgHwhiH3n2iHohaJe+9RQpmhB2r+riyr0bHoIdoAPRDZK+HpTo0hc7dPCc5zg9gmvuTYkmArURWbTlMS+rKnTaYN43EnCqUjnoFDavE9tUk9ykbx2buwpkQ47npayEXQgi9qbbSmSRnOwEq0QzYnzhw2U5LjwORLPe/1/bcYehkVrULHwfWt76v+2JUZ6bpCfAtUJ6QV8ZZWspobFs1S+mi7UWf5xCL3tYderClAMuWfy45WAM8PuJjUDc/VhfCEO4oOrOjv25lkWH6B2aelE24+wodJ8lTPWUUO+NM+o22moNCjud97Q3yqlqt1+yWcuuQFirEf4nymni924/A9RwSLtunHemJRV5J+cpMYqAfeQX0dxirVDnap9L2VNeMh6Vs0RpTbOhED9X2tW6fpMLdxG9v19/ey+YU9Sa5IYMBi8zCoiJT1RCQc/3XM29PcFdGjdt5S8qptKWPcLuoTgp7fGH84zpmoD0DY8TmOF9Q1frYHKmP7uveE88WuMPOHxGAGIF6vRZDrYV5Gc5X/E7OQOqr0wSYzACJA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(40460700003)(4326008)(8676002)(8936002)(70206006)(316002)(70586007)(6916009)(54906003)(41300700001)(44832011)(4744005)(2906002)(86362001)(5660300002)(81166007)(47076005)(356005)(2616005)(82740400003)(426003)(336012)(1076003)(26005)(36860700001)(478600001)(36756003)(6666004)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 22:22:55.5359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4e231c-d4b9-4b9c-3899-08dbe497158d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042

Set the vPCI flag in xen_domctl_createdomain to enable vPCI if a pci
device has been specified in the xl domain config file.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Same story as the patch before this regarding the [FUTURE] tag.

v5->v6:
* no change

v4->v5:
* no change

v3->v4:
* split from ("xen/arm: enable vPCI for domUs")
---
 tools/libs/light/libxl_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 15391917748c..6daed958e598 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -222,6 +222,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
     }
 
+    if (d_config->num_pcidevs)
+        config->flags |= XEN_DOMCTL_CDF_vpci;
+
     return 0;
 }
 
-- 
2.42.0



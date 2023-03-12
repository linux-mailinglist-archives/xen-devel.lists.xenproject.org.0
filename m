Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E716B63C0
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 08:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508863.783747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYK-0003AJ-Hv; Sun, 12 Mar 2023 07:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508863.783747; Sun, 12 Mar 2023 07:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYK-00037L-Eb; Sun, 12 Mar 2023 07:55:36 +0000
Received: by outflank-mailman (input) for mailman id 508863;
 Sun, 12 Mar 2023 07:55:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbGYI-0002sM-SW
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 07:55:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 448869a4-c0ab-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 08:55:34 +0100 (CET)
Received: from MW4PR03CA0085.namprd03.prod.outlook.com (2603:10b6:303:b6::30)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sun, 12 Mar
 2023 07:55:30 +0000
Received: from CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::1) by MW4PR03CA0085.outlook.office365.com
 (2603:10b6:303:b6::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 07:55:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT110.mail.protection.outlook.com (10.13.175.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 07:55:29 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 01:55:23 -0600
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
X-Inumbo-ID: 448869a4-c0ab-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAtrnwMBp86T0ilaYFk0bkIo37Ro78zjPbLzDxxNTsxsKdE+qIiYDZnnIZN/YLNZLFZ7F5rp8AVnh8Qn7ncfynL+7Dit2/5QK2C3bX7mswn6fAu30JG4TKS0sbBFOvvoNo7ZWCoWo1Ru7uIWKZn1ea8M8C9ztWXnI7KU1s0CD0KIWK9XC8QjvZBiLq3zdaZH5zczS1+0kUGgjntu7tQbtj6p1unDQmSQlVnYjp7kTZUGjmsssemzObZ7aOLe3MBoVXi4lHJJgustjsNk1S5IU2rs3ObvaJLTsI7OWaXDggsrQldJYcsPRqBHMqzbrJgIqdiBxfpVrerJcAhg1yIcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSsk+unJ+UA4cANT7Yy0K6RnN7xVbxCSxOE+YUngzIw=;
 b=mZqXYDeSLJi+oOBOX7nEX/W7qP5+BoH9epGMHY7PX19Cb1W1ob7RSMWCow2bxXTD7n0BPTsyj2FzygHSz3fuFZy+r7irZ8ytJjn91q7ndb6iytfcLE9Z5T8JAc01tC02vOfbTYx6iUYOF+niCPFMoVAEpET/S3xYzc8iNkp3AU9hPVv8whGAh2QnMCzziuVK35b7KXjTK5D2fb6+IprhN6vnUqLWb5IuWBom/RjyG3KQG3ueilObb6hR7YEUxxPXCLpRZdiXYgYAy/Zk6WCAuoUJMSZ7n2kfABQwW4i9pLjcm9yfpxnWYK0Hmz4cigS7mfHcwcuBABfTKRgwnHie9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSsk+unJ+UA4cANT7Yy0K6RnN7xVbxCSxOE+YUngzIw=;
 b=jcnhKMCv9wqh5KPC7K89FBtVKvpntxaFns6UE5Dh8f7hk9cWPIvr4pJZzImNZNEn4t5gM9axn7ZK9gb2ZTF5I/cmTBE+42VnCEmcDKzJ2ZfOzMuQLwW11ConENavZ8kov2gH+Q79K3BipDOGPHUn50aOfC+V2/SNmJXI6vK+ni8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [RFC XEN PATCH 1/6] x86/pvh: report ACPI VFCT table to dom0 if present
Date: Sun, 12 Mar 2023 15:54:50 +0800
Message-ID: <20230312075455.450187-2-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312075455.450187-1-ray.huang@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT110:EE_|SA1PR12MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 031bf81d-ec27-4ce0-4fe0-08db22cf2657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ilnTUZnKsc9aWoyP8jvCtRLBo+6Vi+Cf3UmmR+JbEz4kuestn6CY5rRCU0rCXfqfRj8C4rRalE+B4rX2kiKVAHGpSJQXEaW6A45SNmv3/ndGzsa9lb4JYTz/hdX669AoIZ3pV4z11h52Ek27YqA9IV+Akul82wwhjaiAOge++vxZiLE6nph+frjDVdVs0OtVkaIxGhY8C0GFQiNtGLgkQWi79PcUe2zSEdD2RFa9A1CJXH95jyElh9zi7cMZdzhFUqhUpbhrFlI6QwZ6XGlDRQDHlR0Nspw/n2WDOHhv8Wy+TcrJfOO4thbHB+6DAlWuwIp2bBMrPH4GTERHozfQ/8mlj50XMLei+JoVHFZv1sZLsdnFF4EOnq63EH/ynfaY5dWcUQzbzLa+8SLSa+Lp+pCcK9fD9vMltCKVng8tqm7GfIZmmfkqP38jTSUiYwU5ahffITU2ensJIQBF1+k5C1Ra3sVjnRhATqexqnibcqxRhOIu6s+FzJSQC7i1/qz5vx74zx1bLqmLY5KvK8ggwBQR0eEROm27toSPdyPCGjvQA19oU/4SJUoIoL9Ba6VrQpjAoxWJEYNT73OKqAGoefjAx4se8PDRsb0akrAiFMud18+Qm2BnWb90MzywwVFYSpuIT8hiR4lLv2OSzMJNaajg8Q7+F+xdZStrykqK6zX/4hMsHQ3JNX3pXkNxLxuZxDhkuA8aR7jIBUtnFBLIS6vdmBcnX/s16yuYXOGvYSE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199018)(40470700004)(46966006)(36840700001)(110136005)(2906002)(5660300002)(26005)(1076003)(8676002)(36756003)(70206006)(8936002)(356005)(4326008)(45080400002)(40460700003)(86362001)(316002)(54906003)(40480700001)(7696005)(478600001)(81166007)(426003)(6666004)(47076005)(82740400003)(36860700001)(41300700001)(336012)(16526019)(186003)(2616005)(52230400001)(82310400005)(83380400001)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 07:55:29.8325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 031bf81d-ec27-4ce0-4fe0-08db22cf2657
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038

From: Roger Pau Monne <roger.pau@citrix.com>

The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
from the firmware instead of doing it on the PCI ROM on the physical
device.

As such, this needs to be available for PVH dom0 to access, or else
the GPU won't work.

Reported-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-and-Tested-by: Huang Rui <ray.huang@amd.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 xen/arch/x86/hvm/dom0_build.c | 1 +
 xen/include/acpi/actbl3.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 3ac6b7b423..d44de7f2b2 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -892,6 +892,7 @@ static bool __init pvh_acpi_table_allowed(const char *sig,
         ACPI_SIG_DSDT, ACPI_SIG_FADT, ACPI_SIG_FACS, ACPI_SIG_PSDT,
         ACPI_SIG_SSDT, ACPI_SIG_SBST, ACPI_SIG_MCFG, ACPI_SIG_SLIC,
         ACPI_SIG_MSDM, ACPI_SIG_WDAT, ACPI_SIG_FPDT, ACPI_SIG_S3PT,
+        ACPI_SIG_VFCT,
     };
     unsigned int i;
 
diff --git a/xen/include/acpi/actbl3.h b/xen/include/acpi/actbl3.h
index 0a6778421f..6858d3e60f 100644
--- a/xen/include/acpi/actbl3.h
+++ b/xen/include/acpi/actbl3.h
@@ -79,6 +79,7 @@
 #define ACPI_SIG_MATR           "MATR"	/* Memory Address Translation Table */
 #define ACPI_SIG_MSDM           "MSDM"	/* Microsoft Data Management Table */
 #define ACPI_SIG_WPBT           "WPBT"	/* Windows Platform Binary Table */
+#define ACPI_SIG_VFCT           "VFCT"	/* AMD Video BIOS */
 
 /*
  * All tables must be byte-packed to match the ACPI specification, since
-- 
2.25.1



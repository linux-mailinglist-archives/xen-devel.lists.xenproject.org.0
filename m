Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125EC7CA851
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 14:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617522.960168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsMzF-0005d8-KH; Mon, 16 Oct 2023 12:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617522.960168; Mon, 16 Oct 2023 12:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsMzF-0005bL-GD; Mon, 16 Oct 2023 12:46:21 +0000
Received: by outflank-mailman (input) for mailman id 617522;
 Mon, 16 Oct 2023 12:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsVN=F6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qsMzD-0005bD-8U
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 12:46:19 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff34a416-6c21-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 14:46:17 +0200 (CEST)
Received: from SA1P222CA0103.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::7)
 by SJ2PR12MB8691.namprd12.prod.outlook.com (2603:10b6:a03:541::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 12:46:14 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:3c5:cafe::1e) by SA1P222CA0103.outlook.office365.com
 (2603:10b6:806:3c5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 12:46:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Mon, 16 Oct 2023 12:46:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 16 Oct
 2023 07:46:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 16 Oct
 2023 07:46:10 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Mon, 16 Oct 2023 07:46:10 -0500
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
X-Inumbo-ID: ff34a416-6c21-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCBb7gAn8unjsJKXgdHiM0H/bJ3XrfQuT6lEXQqlBw+CKrmP5XvliYBMVwGcb6OoK26pcj8PKNzNCIl0gHpAUUKLdhMbGdF+wq5LCru5Y8nysC5B1brGKIQqFfbF2LaLBQaJ8MX+72zEHI330GZJJ4fYHECgoYxkHrjur5PBbU80X3Rc16FZbY1p3WOlnwhvGc9YuBEzPXtR5NyIUJ+OvhhIvV7Ru+u4fAkFbIBJjVxgAWYcPKWB4HANY9J8/dq/DZpsGiaIC2UlFU86eC5TRko7R43WhAFxQtAnFQ35Gb24eu4ut9RvRaDuC1sxAUjJDXX9f7ddMo2Wodw84EXVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiCrYxdKyFBWS67/6ZzkitTMejEeK2oP06ZKxoPdFHc=;
 b=lAvtUReoTlAK4tktAf/yvrhe6uMfsfeouv5HMjIurYyo9UbOSUCj4Ju7E6a9ZJW/5N7FFJrsKJl2PPzXdNjGi0a0DzRAiLABj9rSZgr54bUDqwwm0I9QdqZGdfajoeUVYZdsUoQjCBgYqpnyPKOUIyHyIK87BCxLDPppQcHNxtqEbLChESwE6HtQhaSeDLpYIYvWxOZzfEK9ac2++qXFCR6de6xYmaBNGzp5h4yjCGQltcmZX7jSNpHQDPM4Hko60fIlr3K1IyymJJRAWSBG/UNcvB2GL4XR2kSXA1sb0gvw0DdaqcU/5tfr2kP6VWn47lVBlZO/kEul7NtautEj/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiCrYxdKyFBWS67/6ZzkitTMejEeK2oP06ZKxoPdFHc=;
 b=U8VatHDytlbfbUg11tK5E0N9dKdEvCnCvIcB6HcCPpLyzgDZyqNK1cuIR0p4W5zKT2nCZx2NqQs9xEVtCjAmseIrgHAevofFiIFSQ7YR/ljlARJM71A35W9vJ5BC+9MI4DG/0cpZcmRREmvmV/pgRnzfdRICY7eCV+un9HZ0LIQ=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<Henry.Wang@arm.com>
Subject: [for-4.18][PATCH] xen/arm: Check return code from recursive calls to scan_pfdt_node()
Date: Mon, 16 Oct 2023 14:45:59 +0200
Message-ID: <20231016124559.8220-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|SJ2PR12MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 491a2d64-b0a8-416c-e14b-08dbce45e192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rLhbLGf9jh2/niZVqMAX8h7asSxlMcyo8C4ljZ6IfnY+kjE9AMjWv7e8c8CdQkEL298UtFslWwKEvJ7hP3sCAEb1kqh+jzRiDDMn8FuwEWScZ5AJmNSmYYOtT3uGIjYNXvqIy3Q5C2qpTiIfcHPDDpGAdQDrH8ccFse75GiArlGlHx4wBuRX6K13Dri627ukY8VlJ0quHpf2fihys76RJymkrEin3O0OUuZQHUbqQrqor5dPaqELks6h0ldcawc8FW0yHaUxjyB8qA3mTlbBMW9M+M9Dpt1Rhp9DQaUYp052IYoV7YeWB3wKIfPdMEt1ANvBvxbq9+SHyvn5KAFsfh0ragGT71v/Ld6FYkRePKtcL9X+TQrynHg0RC1buxvQ9GiAr4jJCmZncwRhVawv7hSOykhhSbHgB2h2QDzucI7nI4c7VAxpwb1oX3QKy+5hlA15vFcJ0p87CPoAGHi674zLqQplOjrGA10k4RAbES9Q7j8WGzxfhaMeVlS4NEkoANVc67+Xs1kP5KQpQkNBp3zTOZW+aUjFUS0kWCSuHSDPYQXJ0dip2SLmSkjDpMedIy0bev70OtC2Wmb9LfhiS9JMvhJ+LsaF6+N4BI6TtTz37nePEPF/EFKbfALy1ncWcfrn14PZBqaoxUKO5NjzDePg0G4vwjS2Lid8DFN9mRtowPbUSoltcdqX5hgXHLwdStGpzWQzWTKaeq/ZYLGI3kNjRjGGHX3Sdqq4PW5UFxzUyfsYli6686/NqZQo+yyynCdq6fn3/ovmqsv8cRXTWQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(70206006)(70586007)(2616005)(6916009)(54906003)(478600001)(316002)(426003)(1076003)(336012)(26005)(5660300002)(8676002)(8936002)(4326008)(44832011)(2906002)(41300700001)(86362001)(6666004)(36756003)(82740400003)(356005)(47076005)(83380400001)(36860700001)(81166007)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 12:46:13.5153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 491a2d64-b0a8-416c-e14b-08dbce45e192
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8691

At the moment, we do not check a return code from scan_pfdt_node()
called recursively. This means that any issue that may occur while
parsing and copying the passthrough nodes is hidden and Xen continues
to boot a domain despite errors. This may lead to incorrect device tree
generation and various guest issues (e.g. trap on attempt to access MMIO
not mapped in P2M). Fix it.

Fixes: 669ecdf8d6cd ("xen/arm: copy dtb fragment to guest dtb")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
@Henry:
This is a bug fix, so I think we should have it in 4.18 given the possible
consequences I described in the commit msg. I don't see any risks as this change
only checks the return code for an error.
---
 xen/arch/arm/domain_build.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 24c9019cc43c..49792dd590ee 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2872,8 +2872,11 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
     node_next = fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
-        scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
-                       scan_passthrough_prop);
+        rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
+                            scan_passthrough_prop);
+        if ( rc )
+            return rc;
+
         node_next = fdt_next_subnode(pfdt, node_next);
     }
 
-- 
2.25.1



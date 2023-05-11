Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864C86FF211
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 15:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533369.829973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5wR-00046R-L4; Thu, 11 May 2023 13:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533369.829973; Thu, 11 May 2023 13:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5wR-00044s-I5; Thu, 11 May 2023 13:02:43 +0000
Received: by outflank-mailman (input) for mailman id 533369;
 Thu, 11 May 2023 13:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/UO=BA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1px5wP-00044h-OI
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 13:02:41 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eab::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b77a21d-effc-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 15:02:39 +0200 (CEST)
Received: from SJ0PR13CA0059.namprd13.prod.outlook.com (2603:10b6:a03:2c2::34)
 by SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Thu, 11 May
 2023 13:02:29 +0000
Received: from DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2c2:cafe::fc) by SJ0PR13CA0059.outlook.office365.com
 (2603:10b6:a03:2c2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.6 via Frontend
 Transport; Thu, 11 May 2023 13:02:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT073.mail.protection.outlook.com (10.13.173.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.21 via Frontend Transport; Thu, 11 May 2023 13:02:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 08:02:28 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 11 May 2023 08:02:27 -0500
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
X-Inumbo-ID: 1b77a21d-effc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5FtknzW03Kqa87K3qF+TS8sv/koEI1cHw7wfCwRVZ+NUFZuh+yzxa5M3sxp7LyPmypTixxh04VPFpbk6S+8UqoWEbca3dwk/u5ZTaXqTWcf7DJ03waUfh2nOQcLUjeC/BpMPQUyB3bli64KStOYoQA+OTU9VM3b094r0elCiZ+rsns5lpwBcNE9M1+I4xo/M5eIzeC8QyJwmPmTYNqYk+CucVFUuFGC4yBBZacPhFzZH8f5fQYJrhJbPU/8d241QN9Q6uMMOV7q5zgzgWj7A67DQu04wI6HnCkr7vEWkR1YXJudJcSnRYpfYVyPdAvLHM6m2Q7dXj67IW1q6+E5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFV3Thk556fIvO/E1qIqL45bP3uNbQnb7E7Joekqvfg=;
 b=Hu6q5z5DVrWtFAcQ+1I4MriYell5NNsFq7YMK9PImtPxKu89y5qyGkasWtjlmSSIRSortYRtng0ra8tEVyskoVdDeA2HW1aAUTLkjWZVHk3XTOCy7tv6eAsCqO0FQRoHXzJcb05uciJBAJsg9KgAdZJGitToo+sd2p5aEPag6pNl/9jfiCjJ62TrSq+kXo8HyBu9hvXLqc0QH7aGa0vDyjIGvW9Jsndfy36an7js8/NdG95Gu7FXmPUKgwhCoFS7P9A6OPkbWV3/gpPa9VYe4gOVNIhporNOm3g8rIl+QavDD3UNAL0KgR91xSPuLUhOyfZtwp1/eNKP6vdaJTcUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFV3Thk556fIvO/E1qIqL45bP3uNbQnb7E7Joekqvfg=;
 b=fUpCWYbleyXv4Ja3Xrv/x9EOAJMlBM6itJQ+IEtAfcW8Uwts5dauYk8vCiDuISpFLKE368PD5pDr3FGk3HNUM5I2XfQZbc3zWxHK7ZM6kmXOyxppO1hKqtbsy5Tqlf6CBrcob6BsZ4rizdaZt3SBMhQeqzZ8/b+VYwcJCqNOZrc=
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
Subject: [PATCH v2 2/2] xen/arm: domain_build: Fix format specifiers in map_{dt_}irq_to_domain()
Date: Thu, 11 May 2023 15:02:18 +0200
Message-ID: <20230511130218.22606-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230511130218.22606-1-michal.orzel@amd.com>
References: <20230511130218.22606-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT073:EE_|SJ1PR12MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: d69ada42-f431-4e9e-641f-08db521ffa08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pd9tXstX0+fYxXEqUp4cFD93UaLTYVt6FbOGWbp0JtB2YFa0ZxW6K2Tj+65MfW5LfvvNH+rCaTD94ajoXQnfp+qsljpNb9rq5NEjnCXMCvNURMSoLA7a9Xc3xxx702g2SWYREiYHZc9ByRcygrW/LymxTCDRalwTiKdGqw/QrdaJiVmRpZgNGgkNPZHEFFqm/0j2EO1xoO+TxUyOX891owPw8lN1lJd6QjlH93KjAnUWLSS6XOLdW599Aw0t9KGILQJBQ1H0ACewit1CaNkpCju2AgV3okp1Uq2FpT1i4nIGViog7HNWwmjKnpyab/mqOS+4lnm/KcVCV8rhxdjYwHkIbMofd8AIILFPH1OLnY+L/Io0imgG3Z49pS2u/Ryy0U+RrdKuMSMcvQYKQ6qWC4trFKMTZWOWrTXdg/8/IqZuF2CS5QS2Yk5DtiKwDXG+XtIZSfjRo1BSsrXOUlpYbjK8ufgVVfeQGt4FwY9pMYJ+iBS04BEUw6CwHwzk2kdh3UdEfJAQLedx8ZIG/CoCSoliDrAjDRdHL/jKPKrQC/HjYbd9gyWgrp67ZxSqCAW/zQGVScqrwOPIRAEGlJrylYXr412kJg3gimEUwyo/HnEJcgIMpgaOREqEtRgGxW5/YCWvl5GtLD41/rbf6sVkHawYArYXB5gQWM4Lt6s4AlF5rvG1YU4lZUdJeLME+K2ecfJt1dbJECA4GrJO58/RCe7ZvQpFDrKnLtMh0MGle83+2BPlIMlV9zZ1lM1uO+zKliF7Mbc22NT5jyImki4Zug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(46966006)(36840700001)(40470700004)(40480700001)(8676002)(8936002)(82740400003)(26005)(186003)(1076003)(47076005)(2616005)(356005)(426003)(336012)(2906002)(81166007)(40460700003)(83380400001)(6666004)(70586007)(70206006)(6916009)(4326008)(54906003)(478600001)(316002)(82310400005)(36756003)(86362001)(36860700001)(44832011)(5660300002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 13:02:29.4593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d69ada42-f431-4e9e-641f-08db521ffa08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313

IRQ is of unsigned type so %u should be used. When printing domain id,
%pd should be the correct format to maintain the consistency.

Also, wherever possible, reduce the number of splitted lines for printk().

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - split the v1 patch so that the format specifiers are handled separately
 - also fix map_irq_to_domain()
---
 xen/arch/arm/domain_build.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9dee1bb8f21c..71f307a572e9 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2265,8 +2265,7 @@ int __init map_irq_to_domain(struct domain *d, unsigned int irq,
     res = irq_permit_access(d, irq);
     if ( res )
     {
-        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
-               d->domain_id, irq);
+        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
         return res;
     }
 
@@ -2282,8 +2281,7 @@ int __init map_irq_to_domain(struct domain *d, unsigned int irq,
         res = route_irq_to_guest(d, irq, irq, devname);
         if ( res < 0 )
         {
-            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
-                   irq, d->domain_id);
+            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
             return res;
         }
     }
@@ -2303,8 +2301,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
 
     if ( irq < NR_LOCAL_IRQS )
     {
-        printk(XENLOG_ERR "%s: IRQ%"PRId32" is not a SPI\n",
-               dt_node_name(dev), irq);
+        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n", dt_node_name(dev), irq);
         return -EINVAL;
     }
 
@@ -2312,9 +2309,8 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
     res = irq_set_spi_type(irq, dt_irq->type);
     if ( res )
     {
-        printk(XENLOG_ERR
-               "%s: Unable to setup IRQ%"PRId32" to dom%d\n",
-               dt_node_name(dev), irq, d->domain_id);
+        printk(XENLOG_ERR "%s: Unable to setup IRQ%u to %pd\n",
+               dt_node_name(dev), irq, d);
         return res;
     }
 
-- 
2.25.1



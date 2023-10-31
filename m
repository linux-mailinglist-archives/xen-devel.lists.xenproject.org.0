Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FA97DCDE4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625759.975377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxopv-0003os-EN; Tue, 31 Oct 2023 13:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625759.975377; Tue, 31 Oct 2023 13:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxopv-0003mO-Bk; Tue, 31 Oct 2023 13:31:15 +0000
Received: by outflank-mailman (input) for mailman id 625759;
 Tue, 31 Oct 2023 13:31:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZpMf=GN=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qxopu-0003mI-Et
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:31:14 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c24c3b7e-77f1-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 14:31:13 +0100 (CET)
Received: from CH2PR18CA0036.namprd18.prod.outlook.com (2603:10b6:610:55::16)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 13:31:08 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:610:55:cafe::87) by CH2PR18CA0036.outlook.office365.com
 (2603:10b6:610:55::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 13:31:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 13:31:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 31 Oct
 2023 08:31:06 -0500
Received: from 10.0.2.15 (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Tue, 31 Oct 2023 08:31:04 -0500
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
X-Inumbo-ID: c24c3b7e-77f1-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHbXwyVAS6hxjYDnCYh6drtCNELAG0hNJ9KPD9f5yNCJ7UanHlw+R7Od0uQyJdiAZn178CSv1vJZHXEM49rxN9q/4lcj4jS2b6XaoCHf1tQLqLtTEXw968zm5JnhJMbrY84ROY3bRJgTtRm2Co+zilVxEujuOj5W9qTKwRH9nMMbBIRq+DW0pkTpO5Xpa/scqwUT3uFW1Q3Tz25xIvCw4iHMtbUDZA6kTMHrG40ZFY89Ab8cR0HTJL6popDf7IseerUIhWsq/IFuJlkaglxJ4laZY+JEBRkXK1pvsiUqaBG2Mxbg8MaUUN80sWqhXz5b3lB5hBixJTeCCrug5/GTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ke8d4plNGJuIwSSfw+nKl5cBA307t6eSU88RthCIEY=;
 b=e8GL2dMJqKOFoJOI8nwOmxzm/06p1DfP+IKX5k15++30qG+fsLeG2ZUQUSu5znQJt9BNBP93MaYtb0MPxHP+yYkQovyG8a39age1zdFZLRi0mibTIAnCiE30RFflBE1mzwSYYPnMjNMcwYZ5mT5LdfDB24O+3h3Z02awHyJsFFAfnce3sdjn0SMvIRKvC8OYX0EJtRBso2jPCGB9vpGaFitI10xnrr1+oTXv/iThlVJxcR1+QVbUQQg2OY0bi8p2G9QH2XJvvdmLF9U5cIhnwXnRXX3SdIyGudn5eceEq2/e/c45mozm+tBVjpis1W8I9WmTx8iceR/WD/rJa9gJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ke8d4plNGJuIwSSfw+nKl5cBA307t6eSU88RthCIEY=;
 b=W9kTUoMzqirDJoAdTAlhunIS01m6xXU6TZBGAlXBhVO8/MUJ3KorGw4rj6WVVmKDBvAyQeeUyjGmNRt3j0VFDUMhXse/GCJb9gZz9cJJBA1vEI8zrqgI6tw19WSOWXmwwXvWgyRfspd1e3+0k/U7rcqRjInLekSjF/xfM6SJ6Q0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/irq: do not insert IRQ_MSI_EMU in emuirq mappings
Date: Tue, 31 Oct 2023 15:30:37 +0200
Message-ID: <20231031133037.157936-1-xenia.ragiadakou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 458000a9-794d-4a97-8ddb-08dbda15a3a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/bL15/L8L9JHe2dVf1MLfNvrSRUfDwASHzC7aUq+uAtaVUlsmI6iJWSqG+9mCliK+HS3PLKhOVZrB5Gv2W3ADe8qZaZ4NNoi2nxw3LC0tQau/leRM8QQoKQ1iitEd+pkufc8zZf5P4z/dzftBVrisTtda6iQsOgLE3KpF3NjFTUbcXn+KzHmibEuLyeXL43ejp3tY18pE5NlsKuechsShT3Dfp48/fcvq8iJ4nw9BxnTuM/ynOy7vHIms98/RGSnsxEjnzRzD+GT70rwj/83IxqRkQUAN79qL8PKeoKw6chpMRZbMxzRw6U71/A6NS9xKzxWRTCYLelOsmin7LRh8/KUEiJZkkQbWxQ3l7SpWPVCCtGU69PhP/ZX7nr2+83c3epy7y4lIqYeW9EPNL29XBFGZ7w9xhFVtc4eaJAyVT6VscJE45tBQ+kK8wTM9x2LNZnelBrNDtvJ8Oa9nhn3svZyRCs4P6X6bnhoh/rIc4n9tgbu6gjfNKqvvM9MLjtPGunZHC+yBKhnSgK6iF/VttsNuoiUW0ViJUbUbi1036lQQ/0DP7G+X++oMCcqMB4BsghevcnQOgU4UGYyAxLu4x/r/6uT00HrxPAhMnzuJmttJ3h5lt2dmwxHumlAZoCHudQWe+C3Tuzxj7uZCzS5qQQ9EZUxypZOO6ENSio0ALfMuiL4epVTUvnfy3wnJjvT49CAPQDzcSoQxrysadMVDvldpI+TYp27tXc0nSsYWpEzII2krQFR2VwR+VC7W4QAjVywN/lXqFtWM1uOoRYZnA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(82310400011)(64100799003)(1800799009)(186009)(451199024)(40470700004)(46966006)(36840700001)(70206006)(70586007)(316002)(54906003)(6916009)(16576012)(2906002)(5660300002)(8676002)(40480700001)(41300700001)(478600001)(44832011)(4326008)(8936002)(6666004)(40460700003)(2616005)(1076003)(26005)(83380400001)(36860700001)(336012)(426003)(82740400003)(36756003)(86362001)(356005)(81166007)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 13:31:07.6652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 458000a9-794d-4a97-8ddb-08dbda15a3a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802

Do not use emuirq mappings for MSIs injected by emulated devices.
This kind of pirq shares the same emuirq value and is not remapped.

Fixes: 88fccdd11ca0 ('xen: event channel remapping for emulated MSIs')
Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
---

Question: is there any strong reason why Linux HVM guests still use pirqs?

 xen/arch/x86/irq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index f42ad539dc..cdc8dc5a55 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2684,7 +2684,7 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
     }
 
     old_emuirq = domain_pirq_to_emuirq(d, pirq);
-    if ( emuirq != IRQ_PT )
+    if ( (emuirq != IRQ_PT) && (emuirq != IRQ_MSI_EMU) )
         old_pirq = domain_emuirq_to_pirq(d, emuirq);
 
     if ( (old_emuirq != IRQ_UNBOUND && (old_emuirq != emuirq) ) ||
@@ -2699,8 +2699,8 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
     if ( !info )
         return -ENOMEM;
 
-    /* do not store emuirq mappings for pt devices */
-    if ( emuirq != IRQ_PT )
+    /* do not store emuirq mappings for pt devices and emulated MSIs */
+    if ( (emuirq != IRQ_PT) && (emuirq != IRQ_MSI_EMU) )
     {
         int err = radix_tree_insert(&d->arch.hvm.emuirq_pirq, emuirq,
                                     radix_tree_int_to_ptr(pirq));
@@ -2753,7 +2753,7 @@ int unmap_domain_pirq_emuirq(struct domain *d, int pirq)
         info->arch.hvm.emuirq = IRQ_UNBOUND;
         pirq_cleanup_check(info, d);
     }
-    if ( emuirq != IRQ_PT )
+    if ( (emuirq != IRQ_PT) && (emuirq != IRQ_MSI_EMU) )
         radix_tree_delete(&d->arch.hvm.emuirq_pirq, emuirq);
 
  done:
-- 
2.34.1



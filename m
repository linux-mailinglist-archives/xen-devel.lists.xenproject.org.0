Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767315E63E1
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410155.653196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSB-0005BF-L4; Thu, 22 Sep 2022 13:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410155.653196; Thu, 22 Sep 2022 13:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSB-00056q-G2; Thu, 22 Sep 2022 13:41:23 +0000
Received: by outflank-mailman (input) for mailman id 410155;
 Thu, 22 Sep 2022 13:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiOI=ZZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obMS8-0004DO-Vq
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:41:21 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c14dbd5-3a7c-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 15:41:19 +0200 (CEST)
Received: from BN9PR03CA0190.namprd03.prod.outlook.com (2603:10b6:408:f9::15)
 by CY5PR12MB6225.namprd12.prod.outlook.com (2603:10b6:930:23::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Thu, 22 Sep
 2022 13:41:15 +0000
Received: from BN8NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::65) by BN9PR03CA0190.outlook.office365.com
 (2603:10b6:408:f9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 13:41:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT088.mail.protection.outlook.com (10.13.177.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:41:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:14 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 22 Sep 2022 08:41:13 -0500
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
X-Inumbo-ID: 3c14dbd5-3a7c-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNpkkAz/BiqTXZsPbfiJ1Lj5EHooMz9h2Faw3mliwvKogbBO6pUlPtSORo6nM5RXZXeBbZn8alBPrA63ksrCX0mwpMwDr2E7WkfdJpoEeK1SlKU1jvXkQqS//Q3gkBhAJuFIBG+gmGnuajLvmRzjcQf1pRzZefujUDERuA+LtN4oM1HrFMTAq6y9+h3YDV4lkcZSWhleCGKLG4recWkV6GNGQe8Ul5BO2PXZX4qaqfcGX9y1ZTAeNP7ed927BNZ+bE0Dw5zJxH/tPjn2uecQs8hEkJv5vVUIXWWZRhen0NGdgJmnr2XaWzG87OMXgR84P24EalUDRm+wDyRIc07x8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4r2IqG5noer3R27Px3k/yK/ec0pnYo0SQkuP5is3Mt4=;
 b=X7KGUkr7avVzl6qe2wGWCbcZMCU9DIhbeRXff2syhi5hqVKsQQOBl7I0OHmJob4R6a08cruQ/DZy99I21UKFYy1kp95Q+KL0ayaOUlpZFb0gPsErshvdQLk+s0xMHPISsVAp7LnLqKp1ZBSbi1BnlKtX9SaLylfHLQO/DyHOYdiFZa47ZZpoInZZQ6Jq4ZNzzIZFWMk1BJgzjxxGYJ/wJcKiosceax9sebMc2nPCF39xTMZlEJbrfej2ujhOj3ZCCzcAQQWyJB+OYVBx1lGsSS+He8DcJZoBfvzrw+ljkybHjLMky4bv+FUSId/ACcPkFDfnQl1eV3LWjQKxxFsRkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4r2IqG5noer3R27Px3k/yK/ec0pnYo0SQkuP5is3Mt4=;
 b=Q5D+HyiRXhgKhYTjqrVYBLriiG9UtWP64IIUzTFJ4kYIOYL8066iKaLRRP55ZLJIUV59+I9jn+NJyOmpIIZfhsmpCA8oZsQh6aRcVUecDokgL2KYq/gS1pzlHAx0aUjxqpMI5V7srvDDcrTtDtNNTdBOgZpQ6f9AqqNcf9FQ/XI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/9] automation: Add Arm containers to containerize script
Date: Thu, 22 Sep 2022 15:40:53 +0200
Message-ID: <20220922134058.1410-5-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922134058.1410-1-michal.orzel@amd.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT088:EE_|CY5PR12MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: ada0dd3b-f784-4ab6-7bd5-08da9ca01eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	azcwZdwOPJYc5TPdwawEdEdb1tDuLeRDvywFi8pzc9eue2rbAfDcxPUIyB06pwLG4uhDYm/uIuZf2f8JshBQRadPEKR68Jz9h98dCFSzpyQfAB1oeZ0/r5M0aolF2BUVbE9DAudZxXfqpXGViBdMxu9WDkknNhYpmbLnE7V3DDCUsNHKTM+wY2KhtlHfQgZuExDcNnSmSvu7pGSU3UI+n1iwclN8iCVCDq/w3qntZ9xuJNMAyHrR5TP7XA6w3iIgPBFRBxSs5LfQs4mNknN3BuJyO9dRSO+btEWIeX6IdWA4oWEZ1vhFRO5pmkVVZGOd2IhV54bmbYvyjTuZJPWD1IMdLbGPdN1Bdoting5TiiUkyzfEGJirsWJ60eVziBlTxyK1nKgorxZwfbKItOgNlJuzqzyuHFOW2pzQr9ob8ED5njeehPKrImTgRNUxsueRg2dpBooXOO+fZ+4TfkPudJhpzU+7R9SlS9v7fRJlMJdNXIe4xYotM+r9g5qlINAbAO4sDiInJPMq/XkE2wz3SKGp8NWG4rpDcTjOD9+t1dNUbLNp1byChBBHdkJYP84b6vDYh4NtQNU8HX6Uig0tBLpKyiNlhEdrAz5bOxTQ3LbPjuoMVIjlCac4giP8nHDRL/if6fXj1DeTPirikpycHUho1TZ5D27n/gVDGOkCfYoyTm6ZztMzK3RH5UetSjkSgSJeO/afdx0Z3ZbIqTpm8kywx2cdVrPainwjEFDSrYD0zniBD6Gi58gy3d4GqQY/Z2jZ1P2kqUjzHSok2gGWcf1T3sUp9usG3G6azubweZYI0YRzteCAhlbEMk8W7Z0X
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(44832011)(186003)(1076003)(82740400003)(54906003)(26005)(47076005)(6916009)(81166007)(356005)(82310400005)(2616005)(426003)(336012)(5660300002)(86362001)(40480700001)(8936002)(4326008)(8676002)(6666004)(41300700001)(70586007)(2906002)(36756003)(316002)(478600001)(40460700003)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:41:14.9632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ada0dd3b-f784-4ab6-7bd5-08da9ca01eb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6225

Script automation/scripts/containerize makes it easy to build Xen within
predefined containers from gitlab container registry. However, it is
currently not possible to use it with Arm containers because they are not
listed in the script. Populate the necessary entries.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/scripts/containerize | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 9d4beca4fa4b..0f4645c4cccb 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -25,6 +25,7 @@ die() {
 BASE="registry.gitlab.com/xen-project/xen"
 case "_${CONTAINER}" in
     _alpine) CONTAINER="${BASE}/alpine:3.12" ;;
+    _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.12-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
     _riscv64) CONTAINER="${BASE}/archlinux:riscv64" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
@@ -35,6 +36,8 @@ case "_${CONTAINER}" in
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
     _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
     _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
+    _unstable-arm32-gcc) CONTAINER="${BASE}/debian:unstable-arm32-gcc" ;;
+    _unstable-arm64v8) CONTAINER="${BASE}/debian:unstable-arm64v8" ;;
     _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/suse:opensuse-leap" ;;
-- 
2.25.1



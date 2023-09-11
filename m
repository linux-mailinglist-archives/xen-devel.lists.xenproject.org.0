Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34479A871
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599435.934868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhSy-0005jI-CA; Mon, 11 Sep 2023 14:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599435.934868; Mon, 11 Sep 2023 14:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhSy-0005gp-8i; Mon, 11 Sep 2023 14:00:40 +0000
Received: by outflank-mailman (input) for mailman id 599435;
 Mon, 11 Sep 2023 14:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S94K=E3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qfhSw-0005N8-Na
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:00:38 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 957a18bc-50ab-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 16:00:38 +0200 (CEST)
Received: from CH2PR20CA0009.namprd20.prod.outlook.com (2603:10b6:610:58::19)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 14:00:33 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::ab) by CH2PR20CA0009.outlook.office365.com
 (2603:10b6:610:58::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 14:00:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 14:00:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 09:00:30 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via
 Frontend Transport; Mon, 11 Sep 2023 09:00:27 -0500
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
X-Inumbo-ID: 957a18bc-50ab-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQATQon54Un8o115gnezS4f6Mh0PUs8zKbUxSeBVL1cHQjIHXyT9wKYbV6JpErgrEMux6N0z97OKgpeyWl1eUX51BLlqiuJeE9jOu+y6h9NMwdPrBm5ndZ7PUIsaXPcZc9bPa7oI3T/5FkkfHaKhSDVKlPMMdmKqw+9+9sNszVnUlFDJeg/pMaxS8k+ZKt7KmWQ33QfeuDfJe61x2xOHUOxoDtrCbhmqs0n68Ywh1uIXoL9rZUGpOyPkEQGHFXvuoY3amsmHn5l0oIUrqB+hqo3/w7YoB5XVtp6y07W9t6YGEt3RrNhUck3zFJ/uWnbAkeaN9AlNdVi09DN+tFTXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmqowAx24OOOJpsd+S0aluwjNaHIyEOrBq4/krDyslU=;
 b=lcHWLIcN7iLuDKg9TRU2YdtboHNwv9GI7VsNHyk/5H3JKQQ0bBQ0Vfvyv43pct6oBzJDT8cdhQvwdgn9ZUkPckI4VtHQ0S9SZY2t2DajAYYh6pgztuLO2tlmfIYeSeaNHP/rcXRS37OnD5kduTv7HRIggOM8tN+pbAs6+25kcJi/iw3A5g1/5yOZoa/w3V7vrqKDeuwOwEXD4O1/lh66iuR0kXN+7kqhsIOXv2hGRMdZtU0NumXwx5TuPKGCpoz08CnDrX7v/SGz786N+Rz4yoXol+PBgWC0Y6HcELQO+vnDcD/Z9OJMtt5elPa01czG9yE1lxSVir7euQ6my73CWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmqowAx24OOOJpsd+S0aluwjNaHIyEOrBq4/krDyslU=;
 b=SWBERPDTKhdYc2VxczkT/Hx5JLZmPLs8ikpyOdrNHptJxA4Nf0yUv+pqd3xwdD/WP4JXPU992qTAZG4wmENPIqSlPvqYGmM5PQ6RsK99iAbYJSAxRENXSazSta5If9ttxEU8onb4Q09YnzZcw0V9vUyaUy05E8A16nbGdyF5y/8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, <wei.chen@arm.com>,
	<penny.zheng@arm.com>, <henry.wang@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 1/4] xen/arm: arm32: Move pt_enforce_wxn() so that it can be bundled with other MMU functionality
Date: Mon, 11 Sep 2023 14:59:39 +0100
Message-ID: <20230911135942.791206-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
References: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|PH8PR12MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf0bd6f-988c-4cd3-2564-08dbb2cf76f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VIbAHOJkt6eWHotY3vePWYxqmDkyPs+5vOfEtmssDw/U2GHiwM+r7EBenZoe8AIwV01HXjbGedbEJIpBfZwQOtAiRGKO7zhSagCOifnMnzUmp9A+6jCaO5ioWg7ipfCVF3vaLPJlyrA0DuJUPDRdhM6sxBy+PHVD+Y1dn/mX67IcvW3NESjV7BJP0PolmLtiRlsGwuQimrxgqM4OKAjjtfJLiL7YBGIxlHVB4X1q8ULCGXQ8/ZsPbXbm6iAMFSZbElJdtZdU4uv/fc2AJPlZkUwAckXAmMsX6bx5n82bOHnuw6nGCgPZQgex8HzJtj20LQoGIqFQNPVDmlR/N3xdPD43bl/jj6xAG306Tezg47iOXqiZVYe5NVsDZ9PuHyo8a4KjcSORJW5jRx909dPvZKMlHT+sYwoxGp/kqeIvrDdG9wfe4PI8CEwqRWugea8hjiqPI+cjHDL1pqCQ2DNhuQFED4aHrMtHGZkUAcwQQn4yAdLhUV7zwyJj2GTyaStXnlnqNQ/o1vwAMb/YUHZ9b0xot8lnh0ytImgYbFFqRkl6PnJsaFbKPnCASScS0cfuZAKPkbZtD/gPaCkmUhfMDdskhjHnccwacSyaH2g8rZ750znNGuw1mSKY6lbdC8lesBD6inrRtksK93lpry+n0rtvOwBQLFcrxNr/AK6LQDHTEkkFoXo6k5CFsIa8BUOfcCy6ctvIiWRQl8uUD02spWe+Aul8N45r0IG+WW+zF/b58StWUkUJSZtnNiBcMBDnS0JKYwgRfqVn+fXEZCEumQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(186009)(451199024)(82310400011)(1800799009)(46966006)(40470700004)(36840700001)(70586007)(70206006)(40460700003)(336012)(83380400001)(1076003)(4744005)(86362001)(2906002)(26005)(426003)(2616005)(103116003)(40480700001)(6666004)(36860700001)(356005)(82740400003)(81166007)(47076005)(36756003)(478600001)(5660300002)(8676002)(8936002)(316002)(6916009)(54906003)(4326008)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:00:32.5765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf0bd6f-988c-4cd3-2564-08dbb2cf76f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842

pt_enforce_wxn() is moved up (as the previous instruction ie mov_w has
no effect on this). This way it is grouped with other MMU related
functions so that they can be moved together in the subsequent patch.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
This is based on my comment on
"[PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to head.S".
This patch can be ignored if the comment is addressed.

 xen/arch/arm/arm32/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index c7b2efb8f0..057c44a5a2 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -268,12 +268,12 @@ secondary_switched:
         dsb
         isb
         flush_xen_tlb_local r0
+        pt_enforce_wxn r0
 
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
         mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
 #endif
-        pt_enforce_wxn r0
         PRINT("- Ready -\r\n")
         /* Jump to C world */
         mov_w r2, start_secondary
-- 
2.25.1



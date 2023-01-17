Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F82B66DCC4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 12:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479342.743143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkNU-0007Qc-Iu; Tue, 17 Jan 2023 11:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479342.743143; Tue, 17 Jan 2023 11:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkNU-0007Jc-Em; Tue, 17 Jan 2023 11:43:44 +0000
Received: by outflank-mailman (input) for mailman id 479342;
 Tue, 17 Jan 2023 11:43:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwid=5O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHkNT-0007AO-68
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 11:43:43 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 304a4461-965c-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 12:43:42 +0100 (CET)
Received: from DS7PR05CA0059.namprd05.prod.outlook.com (2603:10b6:8:2f::32) by
 BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 11:43:39 +0000
Received: from DS1PEPF0000E62F.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::6) by DS7PR05CA0059.outlook.office365.com
 (2603:10b6:8:2f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Tue, 17 Jan 2023 11:43:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E62F.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Tue, 17 Jan 2023 11:43:39 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 05:43:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 03:43:38 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 05:43:37 -0600
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
X-Inumbo-ID: 304a4461-965c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8P4fWeSrJtDfaKx2FdXjDKzBtdx5AnwvjjdyL+EtL7BqgTFycXK1Xp0Xmmjasp1MnHs4LxLzFlYNnuOY5ESHoNDp4+2U6qHJ/s5SFNyVmWkRt8F+volDgkLq+rLnLtUfIwzXqLTszNzCruYEvGQkUP9mn2psq7Be2xx3bq54EoiJy2+sj03whdcXdQz1YaVNyf1hH60srpkpkFGaBeM5VJIn/rk4RdvTF8z8cj7fm5lYkwtSbJi+oPfO0g+VpRq+pALcHaqbq5kDNUm9sXhW9zTcZNv3y1ZGxSaCRriaknePyJs7VDpF7USwCO0Fu7qFFsfHu9CHMjgFNgAibJcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1fBAnuXoU+4MFAl8nEfyIsVLvgTGQN8PGjh9Nb+57k=;
 b=nZnSP2IbBdz6Lfk8VS/wBYhB8M2NtKr0y0UmWZqAGO2Xa0xbjI/Py9Piwab8d/zDBmFhxH3ahKu6vDjBle4kAFArTerJPB2RfXgMUNH2W+BcPutZDvKf1X0ktpWUuOu80EtAmngrPBO7nrEj0zEmClyLQ3inzhw1HhEr/RagGMGkm+tAXa4ryUZB+f2TSsnrnVFIq+fk8VCGvE4BGyBk6/KdbxZbgSasNBoGMaiAroXYXvz8HJLcEacMRu8wEl8N4/jRPpBt7vZU3CNXqqneK5fJjP9mwnV7n7Kin+oCdTw5QSVpdkPTf6XLplJyQ2mdUBl4j0m96Y5y38MLmK0aEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1fBAnuXoU+4MFAl8nEfyIsVLvgTGQN8PGjh9Nb+57k=;
 b=NhydvpAILfrSbSNiglqAU7nW/MVK6aSDKxUcek0wHhP/inZpIEkPZPeIVvEOYDvEsSsuLEt6AfFAQo0ZI8YbF0UNPkGJowzXEysYpxIHSfB0qL3usDbNfzrf05pOFVNcjq2noO6IYSZF0dLrQ5DG3Aw3k64e5+JD5DyjdjCE+Mc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/3] xen/arm32: Remove unused macro FRAMETABLE_VIRT_END
Date: Tue, 17 Jan 2023 12:43:31 +0100
Message-ID: <20230117114332.25863-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117114332.25863-1-michal.orzel@amd.com>
References: <20230117114332.25863-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E62F:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd8a623-83ad-4af9-fa16-08daf8801367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Hx8lleiCoJ+gN328j5QyD2wwLBMtc31KLL5vmkXa9cuvED1SN+u55bxPLDo1h4fW/47W1M7uykY9R/3Py+82ZXKs2c/aX/rD1T2M9TiMuVfnVa+SUdWThwj36kfmjOZrfgVO8Zge4UjHtX029T9Lj9wX45SyoXWqK6oXex5stMTDe5r2XgysPi6mN40d7KZdg6rVoKbvjWICachAEqj2KjraxipbuwYXHBQBgDQoU41l5mvYDjv7KWHTipqB8JeHFi7y0/+ScUKltZ5qj7g1CWexD3zICmZQxsL2YklWP2P7vyktZ4QVABFRynsLyx/b4jm5BsL04TQw/BRzn8qU0kaYbUtRE2Gav7QcS2DFHW+IMdTnkDi1zqgJMF3YTiOHvu2EEiknAvx7h/FAr3agsAz0JqzmQS75NXiYUn4prw+SvzsZGIJgMGB6KZd9KzNiNjtYiNmYiGc12GQ4yULQEpqs2uCZpbtOq74Jjlp3cj3B/b6HHcb04iMwdr6NOV0FYcWA7sw7E+v3dZ7LO9ZTdMCruJI4KZqA0/WJKMJLjrqpqMhvJu0LRVYJnuIl9sYekCBxOyh4biqijU6wr28Hc62Vep3fhW0axk8dCRPG5GPiyDRe1fLMZENn+PEwEjBKF7m/SuikBQW/bIfHa5PHXlQGfMWNR6DUBmgNwge9Ww390U78IWQ9sFjo0IzUOWNC4fXTWQ/F+GK7zadzzauv0svRJ2EmcpMyIGWfmi3n98=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(356005)(86362001)(6916009)(8936002)(70586007)(44832011)(8676002)(70206006)(2906002)(4326008)(4744005)(81166007)(82740400003)(36860700001)(83380400001)(5660300002)(40460700003)(316002)(6666004)(54906003)(41300700001)(40480700001)(82310400005)(478600001)(426003)(2616005)(336012)(1076003)(47076005)(26005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 11:43:39.0648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd8a623-83ad-4af9-fa16-08daf8801367
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E62F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082

This macro is unused and the corresponding one for arm64 has already
been removed as part of the commit 6dc9a1fe982f ("xen/arm: Remove most
of the *_VIRT_END defines").

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - move a change to a separate patch
---
 xen/arch/arm/include/asm/config.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 16213c8b677f..6661a41583c6 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -127,7 +127,6 @@
 #define FRAMETABLE_VIRT_START  _AT(vaddr_t,0x02000000)
 #define FRAMETABLE_SIZE        MB(128-32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
-#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
 
 #define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
 #define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
-- 
2.25.1



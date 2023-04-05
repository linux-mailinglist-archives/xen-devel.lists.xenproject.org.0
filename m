Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7F6D7B00
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 13:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518467.805057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk19k-00030y-3q; Wed, 05 Apr 2023 11:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518467.805057; Wed, 05 Apr 2023 11:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk19j-0002x0-V6; Wed, 05 Apr 2023 11:18:23 +0000
Received: by outflank-mailman (input) for mailman id 518467;
 Wed, 05 Apr 2023 11:18:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btvB=74=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pk19i-0002uD-JG
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 11:18:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92183f78-d3a3-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 13:18:21 +0200 (CEST)
Received: from DM6PR06CA0034.namprd06.prod.outlook.com (2603:10b6:5:120::47)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 11:18:18 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::5d) by DM6PR06CA0034.outlook.office365.com
 (2603:10b6:5:120::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.44 via Frontend
 Transport; Wed, 5 Apr 2023 11:18:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.28 via Frontend Transport; Wed, 5 Apr 2023 11:18:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 5 Apr
 2023 06:18:17 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 5 Apr 2023 06:18:16 -0500
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
X-Inumbo-ID: 92183f78-d3a3-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaV+HV0ycyoxTc4dkHTLNG3K/5Lf8Nrp6RWQmY7xY/RCfHl5wjPN6xLzuACwqAB8LXSj4+l4lQu+ZdOJJYzgJBYwTIIqBWlAiTO5set3uLlIWptzeYAYbTcNr9ET4OSqAR/NTYXftoAqHkOxCUfr497FQLyTir1c3cNidabbBUg1MgoQklCzmc9bEVCTl0izAjlUBALj1p6Ri8Q41wegJoVSjVrcF68eIfuQFavsZUx9cMSVrwHLPvtkAhzf0y/2hYX5pA2Io3pskB+in6gnGQQFsrM4ux17AFxeqmr+bX7dItVsciPcSCjzJmvL5AL5zQHeh/yauswQAikgVCAiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faFuTvjumdAB2CRmAM9G85/4bLPNgqkuwbkGeX5rngE=;
 b=kjcKQVGukCECjqOvmwnNyPf0gBTADZsQJvmNCJaJdAlX8+ngV4qh8nmRmOiZ+RrnbRVTaAZn99vRWxz32iEejmTqhncYyTuOVMjFxOobagQ6GYp4LAxlAIuiBWrPLsEVUz3rLkhDQL1dkvxLNAc7jg9jJCfEKGKd2U0QZJaQDR4LhhIlFOmtlSb/SsssxgGPaFGHSDywdTiiSSXpGEXJpzAyiElsoXVg5p0rvQTlfHljVnIgZI1DFINedb4OuUeH73wSC+5GPumTRTOaqK5rze63t0/LDz3leVeapXIgCWZi3cTurBab/D4huHCQa9FsT33fbwhyC7dR7KD96VHH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faFuTvjumdAB2CRmAM9G85/4bLPNgqkuwbkGeX5rngE=;
 b=RGWTlBzc/JICUHm5hSlDVNLdIDkoqasILDgwRVjJy8Wy5VyTTNIMvLeCRi90OU3dKuueFx5BfRhTFQMoytkKVLLpx8TeRepO1Ht2sFp9EREclTMnzchUyjPPaVnwJOg6GHyhDqYIsuXawjCJvA645nPaTIT6Qp2aa0cFrGZq+8E=
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
Subject: [PATCH 2/3] xen/arm: vpl011: Handle correctly TXFE when backend in Xen
Date: Wed, 5 Apr 2023 13:17:49 +0200
Message-ID: <20230405111750.12491-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405111750.12491-1-michal.orzel@amd.com>
References: <20230405111750.12491-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT049:EE_|DM4PR12MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ee4a16-6e8e-45a1-6a0d-08db35c77563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	673hHt9abvZww3bon2Kv6waImqCn0qsquHbGnmusaOu7iVAKUuPp5cX6+6AoDjbO58/zapfGBe7PKWVcNp1zpMIG8Gjy9Tvdcor/6L/iAf8vgPbI2mOQ2ME8tODBjmNyP51Dho96jUFa3eBTG338ii166a4b+m3/eutD+i6Se6O2tdEscxiXIbn7MnDDPfyV0JsVbwHNfeoaZAvhBZUGnGuDl5qbgmi1ZBKaU6AViSlG6J9t6V888PSVNr8dXYWOG6q7d4qmCkO8IzesWXsbXMJBWST/eaPiJ99LLnsYwMtDr+4X177Q5svIQqIC9mCpLT3FEY7VGJD/BkfkdbMn7F33bFWxPa0uysUp9RSO+/AzOeh5+584GxNZPbVn4vixHuSpPk4mZH5hBF53dhWiW0x1iGw4Oa1+RaegIrA/aQKzte7qrCDx6Gc9pmEAYpzaoc3/ZizLqiOgOl/MZcsKaKK7R7PKPfgTlE8Y8nhi/5kghqkRlPIaPWt0lQlhjVC5n8hiBF3DdIpRe8valZsvV3xE8JlBkbHKst7SJePziBKVNs/eXI8uUgYg7ASq3ttqb5fHOSMfsVWjfV4RcDxFEJjIbRyRD/dDY0OVWgpVVb5WDvfqIkdJ25ruz/HLURA0CFnkHHgM3a706skgYR19XL3we5x/Lhfc8P6E0LvgOiSz4MWwdzSnhq85LI+eOuo9ealmotnfaUpcEPp5qmgvpYa1222kEq3j0Wve0Y4v/tM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(40470700004)(36840700001)(46966006)(86362001)(426003)(70206006)(70586007)(41300700001)(4326008)(6666004)(316002)(6916009)(54906003)(8676002)(40480700001)(82310400005)(186003)(44832011)(8936002)(36860700001)(5660300002)(2906002)(356005)(82740400003)(81166007)(478600001)(83380400001)(47076005)(336012)(1076003)(2616005)(26005)(36756003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 11:18:18.6489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ee4a16-6e8e-45a1-6a0d-08db35c77563
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669

When backend is in Xen, the handling of data written to DR register is a
bit special because we want to tell guest that we are always ready for new
data to be written (i.e. no real FIFO, TXFF/BUSY never set and TXI always
set). This conflicts with the current handling of TXFE bit, which we
always clear and never set on a write path (we happen to set it when we
receive char from serial input due to use of vpl011_data_avail() but this
might never be called). This can lead to issues if a guest driver makes
use of TXFE bit to check for TX transmission completion (such guest could
then wait endlessly). Fix it by keeping TXFE always set to match the
current emulation logic.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
We don't have to look far for an example of a PL011/SBSA driver relying on TXFE.
If a guest had a driver like we have in Xen, we would end up with no messages
being printed.
---
 xen/arch/arm/vpl011.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 0186d8a31834..ff06deeb645c 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -112,8 +112,14 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
         }
     }
 
+    /*
+     * When backend is in Xen, we tell guest we are always ready for new data
+     * to be written. This is fulfilled by having:
+     * - TXI/TXFE -> always set,
+     * - TXFF/BUSY -> never set.
+     */
     vpl011->uartris |= TXI;
-    vpl011->uartfr &= ~TXFE;
+    vpl011->uartfr |= TXFE;
     vpl011_update_interrupt_status(d);
 
     VPL011_UNLOCK(d, flags);
-- 
2.25.1



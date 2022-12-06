Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01B6441BB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454620.712142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VgQ-0000tK-Be; Tue, 06 Dec 2022 11:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454620.712142; Tue, 06 Dec 2022 11:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VgQ-0000r1-8a; Tue, 06 Dec 2022 11:00:18 +0000
Received: by outflank-mailman (input) for mailman id 454620;
 Tue, 06 Dec 2022 11:00:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WiLW=4E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2VgO-0008Lp-Dl
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:00:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e88::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 283d67ce-7555-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 12:00:14 +0100 (CET)
Received: from DM6PR18CA0021.namprd18.prod.outlook.com (2603:10b6:5:15b::34)
 by IA1PR12MB6185.namprd12.prod.outlook.com (2603:10b6:208:3e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 11:00:11 +0000
Received: from DS1PEPF0000E653.namprd02.prod.outlook.com
 (2603:10b6:5:15b:cafe::f0) by DM6PR18CA0021.outlook.office365.com
 (2603:10b6:5:15b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Tue, 6 Dec 2022 11:00:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E653.mail.protection.outlook.com (10.167.18.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Tue, 6 Dec 2022 11:00:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 05:00:08 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 03:00:08 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 6 Dec 2022 05:00:06 -0600
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
X-Inumbo-ID: 283d67ce-7555-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6BEw25Fb1Suhxtxf3v8I4nRwBCTSss3mrBHyA81NtbMEuNwSJ6wH7VeJzUfVYxUiIsk20Cotnt+39LSSeJp0ZC1vG2J9Y+UtVrEq0PH2R2bPD9bbeWSxtnBsMksYx6FcnGhJ54jZIRYXB3FOda7yj+ZZ35YQqJVbmT3z6VJCZru/gtlP7FugWeFumxXrHUJG5HjPvRSCXK6fdb/NeS+k6nzZr9n++uviKxWBWixKxRz1ECBjJ3Gsnohm8v5c8NrYLt76Uaj4W8nrFAU4zyJmswLvSjAR9D9uBPmOyHocfNw47yThDNq2oUyslU0zcXthEJWb3xpywWeW+GgydgKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQlsIuPGflrfKCFCyLL4FnXhfAoqAKmZs+EZWtXsvIE=;
 b=W6s3PmQUxUhTtv0Wnsnt/0gxBvKQdhGZF1jMzUkPe/S5WPYmyrmyS3Qv6ZFzYvGd/WtHX3upntvnN0nqxh0vD0QQEoSY3mOjw1mokyhyvaNzKiJ7jtahRJYGdJpNAIi+cE3Cy2oEOZDxJw9PHozF+wJsjkwyD9s7gwc4rG8mlEitmLscnndEwol6KJkoMZDthSTo8XxEfrZcIZTbZwE6yFguFYei65TI57uNWhgPKdMQdgiM1/ju2MMGLUWGU/uTkHqPeJQ4Lg6vo61AslHxmRCK9UOy1e0yD5Vi6qN8SL/lOnpsqSSSsKeQ+ly8JPq63oubX9PNSUrvEHjomG2Mag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQlsIuPGflrfKCFCyLL4FnXhfAoqAKmZs+EZWtXsvIE=;
 b=Y+eYVjs8ImxnWvjUZAdip1lHjVgpSnDli5bsHvmsls213+lJxkHKyRBEnwvJdDgocduDC0KuSKJZxeajxXBrVJM2xl2A049TM1mw9GlirrsT5XN9t++uR06mmednmJtBTIKa2KJGKkrBesPWZomXp2NozAI0ymtECdrJq/nIkBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: Remove trigraphs from comments
Date: Tue, 6 Dec 2022 11:59:32 +0100
Message-ID: <20221206105932.11855-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E653:EE_|IA1PR12MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: f79398e9-ab25-4ac0-237e-08dad7790b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lF1yN+DXSRi5cMIcUZYtwmyJLg7+/uYJ1yzzddbXIipqPeFVNwj6+zLdauOxRlpE/PFLTEOWmvP3wEpkSInBQv6XDzgfzR7zDVDAw4ilUsT34rN4q+KRxp6r3zNOf7tvBgQMvkZivBR49wkQOx2Lfa4M5p012sPXNm4WfVjd9rsJhPf8Usd/pI9V58t6+LfR40n/iM+mHn3O0D9IzVmgsrP0rqvcHaLAhG9lXLnWFj4TDDT/YFBfthH4+wc/BiEWQmM/rGjdQPwWivpn/JAwF4g67RPaAc33o0ZO0uQdOBTLrKhxsoOo0pokhgwJbUOFNfbz0GvzusYUBESkdRK1hgQxObbhaWjK+hgKB4rv6sM8tCCBvFiHjFWqw4iw9pZBIkKeaYiE57Q80F3jNVwTWfZy6g6f+3scSfSoeJBwh+5+VoViUr1m/CstwvXRdxIcBvIItwPwfcKSvVT16bxIvOxV6PUitDPOAAOtpkxcwqZZDvu5ceEK1zVSeX9Y1eZicdt75cwK1F+AOgKyrBonMADnQxCs9sIm3+8phrtY5xu06MEuDh9bvaHdhaS2jY6aXLOtKzMNpyGcftErYoL+oenzytgMrgJJRCjqwHrOy9h82dqp3TWT8MVZI69VNbV7rLgv5ui/hxGZ6wXRxU+BBUCPWemWy7oNBLnssWedF704Cce2ThhKxdUBU8YS4y9azwSkqKzGe7Ktkbl2Me/uHmKkZZuFPodQetCsGkh0BEk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(478600001)(6666004)(40480700001)(86362001)(70586007)(70206006)(26005)(186003)(54906003)(316002)(6916009)(8676002)(4326008)(2616005)(356005)(81166007)(36756003)(36860700001)(1076003)(41300700001)(5660300002)(44832011)(426003)(47076005)(40460700003)(82740400003)(83380400001)(2906002)(8936002)(336012)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:00:09.7640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f79398e9-ab25-4ac0-237e-08dad7790b0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E653.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6185

MISRA C rule 4.2 states that trigraphs (sequences of two question marks
followed by a specified third character [=/'()!<>-]) should not be used.
This applies to both code and comments. Thankfully, we do not use them
in the code, but still there are some comments where they are
accidentally used. Fix it.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.h |  2 +-
 xen/include/public/arch-x86_64.h       |  2 +-
 xen/include/xen/pci_regs.h             | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 4732855c40ed..bb7af967ffee 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -228,7 +228,7 @@ struct x86_emulate_ops
      * All functions:
      *  @ctxt:  [IN ] Emulation context info as passed to the emulator.
      * All memory-access functions:
-     *  @seg:   [IN ] Segment being dereferenced (specified as x86_seg_??).
+     *  @seg:   [IN ] Segment being dereferenced (specified as x86_seg_?).
      *  @offset:[IN ] Offset within segment.
      *  @p_data:[IN ] Pointer to i/o data buffer (length is @bytes)
      * Read functions:
diff --git a/xen/include/public/arch-x86_64.h b/xen/include/public/arch-x86_64.h
index 5db52de69584..1c3567a20217 100644
--- a/xen/include/public/arch-x86_64.h
+++ b/xen/include/public/arch-x86_64.h
@@ -22,5 +22,5 @@
  * A similar callback occurs if the segment selectors are invalid.
  * failsafe_address is used as the value of eip.
  *
- * On x86_64, event_selector and failsafe_selector are ignored (???).
+ * On x86_64, event_selector and failsafe_selector are ignored (?).
  */
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index ee8e82be36b4..a90aff1712ba 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -246,13 +246,13 @@
 #define  PCI_PM_CTRL_STATE_MASK	0x0003	/* Current power state (D0 to D3) */
 #define  PCI_PM_CTRL_NO_SOFT_RESET	0x0008	/* No reset for D3hot->D0 */
 #define  PCI_PM_CTRL_PME_ENABLE	0x0100	/* PME pin enable */
-#define  PCI_PM_CTRL_DATA_SEL_MASK	0x1e00	/* Data select (??) */
-#define  PCI_PM_CTRL_DATA_SCALE_MASK	0x6000	/* Data scale (??) */
+#define  PCI_PM_CTRL_DATA_SEL_MASK	0x1e00	/* Data select (?) */
+#define  PCI_PM_CTRL_DATA_SCALE_MASK	0x6000	/* Data scale (?) */
 #define  PCI_PM_CTRL_PME_STATUS	0x8000	/* PME pin status */
-#define PCI_PM_PPB_EXTENSIONS	6	/* PPB support extensions (??) */
-#define  PCI_PM_PPB_B2_B3	0x40	/* Stop clock when in D3hot (??) */
-#define  PCI_PM_BPCC_ENABLE	0x80	/* Bus power/clock control enable (??) */
-#define PCI_PM_DATA_REGISTER	7	/* (??) */
+#define PCI_PM_PPB_EXTENSIONS	6	/* PPB support extensions (?) */
+#define  PCI_PM_PPB_B2_B3	0x40	/* Stop clock when in D3hot (?) */
+#define  PCI_PM_BPCC_ENABLE	0x80	/* Bus power/clock control enable (?) */
+#define PCI_PM_DATA_REGISTER	7	/* (?) */
 #define PCI_PM_SIZEOF		8
 
 /* AGP registers */
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D764460C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455017.712627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ZF8-0004KX-KB; Tue, 06 Dec 2022 14:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455017.712627; Tue, 06 Dec 2022 14:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ZF8-0004Hc-FJ; Tue, 06 Dec 2022 14:48:22 +0000
Received: by outflank-mailman (input) for mailman id 455017;
 Tue, 06 Dec 2022 14:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WiLW=4E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2ZF7-0004HW-BM
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 14:48:21 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 053adf4a-7575-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 15:48:19 +0100 (CET)
Received: from MW4PR04CA0368.namprd04.prod.outlook.com (2603:10b6:303:81::13)
 by PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 14:48:13 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::bb) by MW4PR04CA0368.outlook.office365.com
 (2603:10b6:303:81::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Tue, 6 Dec 2022 14:48:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Tue, 6 Dec 2022 14:48:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 08:48:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 08:48:10 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 6 Dec 2022 08:48:09 -0600
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
X-Inumbo-ID: 053adf4a-7575-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCZNoB8n3kwWwc1NFUNzBUd4SrgD8SDX5LEURpHo9E2gcFyMaJStfW7ZOhlhtPq2WaDobCRlwsPlGklUyHClM5kwsSvLWcKK/lleWewLu2KogiUZhcWe1QDoInBFn7sbfeNKPZz1zdaHtq6pHOUly6E1WqHZ6aLjHc5TCcglns7SQf4XzybzYRWVde9+E33/UDRj0jAluHq/zby8S4fSF4annZYHntZD4pDKKetesXDZd0Ipn5jlZZFuReGlJi1W9tAalNir3k2n3MEU812Fa4XUJ4Cb47L3ArZqKXHSAb/4H1FBuR9dW6UCGK62/FuibHeG1jRp7UU4a3PLQ5jSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMgsUGZcTH9H1zLR51QtRCIVqYFpPya6BUzh8wnlwzI=;
 b=jQWzJD/8cz98sAMQCmndnHpHfi/72xNwQQ9hAfGB6RWiV6Mb4inWSGcyiNsnpypF7OHJ0iRoJbrKoilOhesHyrtyvfbjw6m3KDl7hUbP527tz6AwUP8kNQErP1aup91M1auR0gvuY03cDpbeOwSc1hNU08bGZbpaXadrhg9WJwy0ld8dU2Bk8OFl7SrKjJGUA01+3f+F4c5bKq2+BaBWnjhKny+ZJjaT3vQ+Rx107YW2rtgeHms/AsuB+OcMynw2vPC4Yzas+iNSqveiKDaLQqFvz/Lw4u/MkER8RgDMp3/isJ7KPm1Su/QXlcFv4eOlmCv2vKUP4nylpzcfASpDTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMgsUGZcTH9H1zLR51QtRCIVqYFpPya6BUzh8wnlwzI=;
 b=Fq4uz7thbcKlEM2fLTGdxasYk++6o9jrJHfdJV1CZMHxjg9pGmj5qEuPxUMMbIFLnlaSsFL7lNv9LzDZv9ZO5xBgW11x0dwSgRlVSRjVvs8PSeJPJHE5HCaJDr/PE5AH6//lfv1OLDR+SQIQMVBmDIT0tsuGejzUGaB0pIuzlkA=
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
Subject: [PATCH v2] xen: Remove trigraphs from comments
Date: Tue, 6 Dec 2022 15:48:06 +0100
Message-ID: <20221206144806.23139-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT016:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 083068e9-b53b-47b8-36b1-08dad798e62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DLZ5nGal5R2cm0BfFwA3gpvxastLujcXlEOGJflm4e7ibqM7srAFpul8yWMFM5m93ON+hrXrKFEBSVLr6Co25bUuuEayyGP33PjyYUUSJdMAB7fnmo7NLwssUVN5YcuclItBDVJf0dj3eDIXetNsR3Uo4wZMT1ePfRGm0pHzlenyWWcPDs2WRlLzvZgCh6JmIz2xSOoKDqam5ZNRW8U8V+OZSo8KoHI2Yi+kfMsVH+bwRetWZwOUcgN18ehCoSeIZ1mh6acXSrDrwoQI9S7RuKiCro2Q17SztBH9js3DlpclyhhHpqpD4lpNjHFFhJ/7jdwUCYvsZ9zNyJipKQCziF92LiPCvyBeECreQGCaYwFcGadgRrLqv9QgBCsNU8vfkUpBuex1SSMoxzC7EYd6jpFFMg1Ea8/1OAooFQk+6XbfIcEzm2LAcvV0lDuHUgJiMr9UVxpD9pqLCGejA980R3a6r8VTVsBQ1nXxV/9n2UOrnmvFOs3rs/IgYpc6soWyKsG/sVBdxPeJgha5ZjlAnq35QzTsaCnekBdrexi5OQFl1nxYHucwQwoIz0prqP8thlWbP0579D1bIJaEmlXqdoRXjojqQutCWVyIVKonLOCiVyRDfmoAnE+4DBWJ9d0IDqweK3yLb+6XBATIfzBHOfw4XY9TISVMBHD5cJ28Rb4rpJjnihSdAZw4cfOplrPtpzf34OsDZCsqtlQrVAzFjeuIQq6iXaFdYEiW807wrng=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(4326008)(70206006)(6916009)(26005)(40460700003)(2616005)(8676002)(82740400003)(70586007)(478600001)(36860700001)(86362001)(40480700001)(356005)(81166007)(316002)(54906003)(82310400005)(36756003)(6666004)(2906002)(83380400001)(44832011)(336012)(1076003)(8936002)(426003)(41300700001)(47076005)(5660300002)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 14:48:12.1532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 083068e9-b53b-47b8-36b1-08dad798e62b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809

MISRA C rule 4.2 states that trigraphs (sequences of two question marks
followed by a specified third character [=/'()!<>-]) should not be used.
This applies to both code and comments. Thankfully, we do not use them
in the code, but still there are some comments where they are
accidentally used. Fix it.

With regards to the comments and respective macros in pci_regs.h, these
were inherited from Linux. Let's knowingly accept the divergence.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - use (?!?) for arch-x86_64.h
 - add a note in commit msg that pci_regs.h originated from Linux and we
   knowingly accept the divergence
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
index 5db52de69584..acf705f25e7a 100644
--- a/xen/include/public/arch-x86_64.h
+++ b/xen/include/public/arch-x86_64.h
@@ -22,5 +22,5 @@
  * A similar callback occurs if the segment selectors are invalid.
  * failsafe_address is used as the value of eip.
  *
- * On x86_64, event_selector and failsafe_selector are ignored (???).
+ * On x86_64, event_selector and failsafe_selector are ignored (?!?).
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



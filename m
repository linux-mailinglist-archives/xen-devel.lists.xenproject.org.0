Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC70817BEF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 21:31:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656377.1024471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFKFm-0002VJ-P0; Mon, 18 Dec 2023 20:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656377.1024471; Mon, 18 Dec 2023 20:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFKFm-0002SJ-M1; Mon, 18 Dec 2023 20:30:18 +0000
Received: by outflank-mailman (input) for mailman id 656377;
 Mon, 18 Dec 2023 20:30:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wqZ=H5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rFKFl-0002S4-Ef
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 20:30:17 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d6e390e-9de4-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 21:30:12 +0100 (CET)
Received: from SJ0PR05CA0134.namprd05.prod.outlook.com (2603:10b6:a03:33d::19)
 by BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 20:30:06 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::2) by SJ0PR05CA0134.outlook.office365.com
 (2603:10b6:a03:33d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.17 via Frontend
 Transport; Mon, 18 Dec 2023 20:30:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Mon, 18 Dec 2023 20:30:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 18 Dec
 2023 14:30:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 18 Dec
 2023 14:30:04 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Mon, 18 Dec 2023 14:30:03 -0600
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
X-Inumbo-ID: 3d6e390e-9de4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abkLoiVVAi2+4uQ+Gh0LnPG+R9vlzBw87FvpFORgrzNCfmLRJ5zXQAHzmQ0y3pxW/4rFKJVMAFToSFkhG92+KeXo7JxEIvvC/GDG21fWE4owc8XSbDdg2s4ItGYdSIYhM3V16axxr7B7d6qTPBmuzjqT9NDicF0gGz5YSb+mSzuleCvh0hDkkPyhXsNQcWhYUd4Za656x66gWkONp1IQGXxfKDdTVKryrwImZSSP9ZWCQgYwQ3MSlLBUIjaMYv77keLxse6OfQWZfQtcKANTa1zDb2YZPVGnE5parr/dt264CKNjnv1F1yfvSKI/5Ix3tI5vQ7ZmBHXaM4vNholdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emm9AHUxGT2h2crnvTq5uuboYEI/mRi4yey+GWpR4Sc=;
 b=dQdN/+7Fqo7WEtP/I7QPoLYcWAAfebM9bVHHh8O47HzHxENBOdHpHVpL12ve4oyv8n7ZTDrurYLn4xVni/nGj7ZWtLv8Bl/kgLJnXmASNpogWacrJUJ49uFmnC+NO1pJuAtpZ+G+2Somjcd9U7s23fT59RH324ZYNFNFuGXPcEoqJ8a1SwyZJqKrpCYnRfoQj2V2A3dT9u9rZ04iNBcg0lfdJZlFWXm2/vcWeNTk4UFxPHsiTOIpWmnfAYezAosNlLiBRP3X8246kK9Xi/XiiYo89ZU0SutWIvX8vtz7EQcjJt+Ady6UDbFQ7kR29rcNOQHRT4wEPr7n6fBmMGh/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emm9AHUxGT2h2crnvTq5uuboYEI/mRi4yey+GWpR4Sc=;
 b=sl3OuY+3JYNLjM/mIlfAaRr1WPpUd/Iy0sQyYxjioJjGQatSrEbSRaNhm9z9QTWfL/s4rZZbtOwG+U+Jm8LfHm7uylvLSvwNZrd/UAx1jJ+THpQSSUGFJUz730OVVc42mJZwOXKcjyYfyc7N5adafcGkTTaPvEAiX+V2xK7cr2A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <julien@xen.org>, <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <stefano.stabellini@amd.com>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 0/3] xen/arm: Add emulation of Debug Data Transfer Registers
Date: Mon, 18 Dec 2023 20:29:56 +0000
Message-ID: <20231218202959.1390114-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|BN9PR12MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: a66869c7-fb15-428e-5f8f-08dc00081eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RpwHl6g8GUrGe5J5oz3auIxrhINLIBKH87zblZX6R7L0PC27/pNi844qQUadc45BPQdkJlYKZhTODgPIt4u55RZBTW+jF9K8yetSmCjrYoFwYmMhM9y6+cG6r9xIE9pTqd6Kc3CnLEqCt9iqnnlV/a0sRjHR3LGo+KF3qOImc7YFgc3gif0cRvfv1np5weZuRXxX7B5/2ypO0zlF0ovFwv6lIMmMKyc+g89zTtrkipSzNCsRkT34ruth2R4zbp3ARLEbdPRpp6MfoAOwVhErgF1urGmYG8GB51NtUAitYyNrlsTuXOJgSSVZgA3i3l23C6fN94wLOqWOeqSEvE513tgQrpO94ECOcsujBssPDmQlMIiDk0ID3pSePaVXV9+1XQsxzy8vLiafIOo8NhjTB86DKQjdBMGS/difQMGMYezpqjSYCb++wJIIVBW+YKI5v01VuZluS0YVHnvLJ4SiDmj1nlIShO4GM+e3HYLrh/PzzXbdz4yuAB3ZCP2ALQw7NlWjNIAikBylpkgept7F9uRbMNTpSYQ4rZAMVlDagy1QLTFw+gwJ43SaYrxTvnC1jodqXytY69aiVwhCTz1g9RhcVKquCxlJoKYA8SiL4sCDWjL0qgdPUJ7ymkKFJ8/Vaqzit8OpaYq80RVA7vV1CF9OpmLovPKfwTalHkgzUFFfUFMfmOR8TiyvEPB7tGbPlAL+SWu4tSMD5/Slkon+dtGxkC6unejwhfM1tGL484YCnqnSvRYPfitqRjk+pJ59zQdyDUSYwu7X1ORKc5sRzsBVwa1jETpzKl6dD6b96/Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(82310400011)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(47076005)(336012)(2906002)(86362001)(103116003)(70586007)(426003)(81166007)(1076003)(2616005)(26005)(83380400001)(356005)(36860700001)(82740400003)(6666004)(5660300002)(316002)(110136005)(41300700001)(36756003)(6636002)(966005)(8936002)(8676002)(478600001)(70206006)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 20:30:05.3343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a66869c7-fb15-428e-5f8f-08dc00081eb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5052

Hi,

Refer https://lore.kernel.org/all/alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop/T/
for the previous discussion on this issue.

Also, the linux earlycon hvc driver has been fixed.
See https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=0ec058ece2f933aed66b76bd5cb9b5e6764853c3

Changes from v1:-
1. Split the change across 3 patches as per the design consensus.

Ayan Kumar Halder (3):
  xen/arm: Add emulation of Debug Data Transfer Registers
  xen: arm: Introduce CONFIG_PARTIAL_EMULATION
  xen/arm: Introduce "partial-emulation" xen command line option

 docs/misc/xen-command-line.pandoc    |  7 +++++
 xen/arch/arm/Kconfig                 |  8 +++++
 xen/arch/arm/arm64/vsysreg.c         | 32 ++++++++++++++++---
 xen/arch/arm/include/asm/arm64/hsr.h |  3 ++
 xen/arch/arm/include/asm/cpregs.h    |  2 ++
 xen/arch/arm/include/asm/regs.h      |  6 ++++
 xen/arch/arm/include/asm/traps.h     |  4 +++
 xen/arch/arm/traps.c                 | 21 +++++++++++++
 xen/arch/arm/vcpreg.c                | 47 +++++++++++++++++++++++-----
 9 files changed, 117 insertions(+), 13 deletions(-)

-- 
2.25.1



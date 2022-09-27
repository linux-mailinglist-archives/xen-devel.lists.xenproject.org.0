Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7287E5EBEF3
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412366.655649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bp-0006As-OU; Tue, 27 Sep 2022 09:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412366.655649; Tue, 27 Sep 2022 09:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bp-000648-JM; Tue, 27 Sep 2022 09:47:45 +0000
Received: by outflank-mailman (input) for mailman id 412366;
 Tue, 27 Sep 2022 09:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7Bo-00061O-Mr
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:44 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e73fb65-3e49-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 11:47:42 +0200 (CEST)
Received: from BN0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:408:e6::29)
 by CO6PR12MB5393.namprd12.prod.outlook.com (2603:10b6:5:356::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 27 Sep
 2022 09:47:36 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::5d) by BN0PR03CA0024.outlook.office365.com
 (2603:10b6:408:e6::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:35 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:34 -0500
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
X-Inumbo-ID: 6e73fb65-3e49-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fasb06A/PZTFUZNfItDs3GAg6X5niKPL/WKfuuDVPVjGcwl9Ey5xGYQetwwTnXDiQ7GWMTuhBE605BpvYsDL90CWwLX8K4oCWcEGsow21LWXbYhrfWgQm9f5k292A8iQt1Xvf3AKzrvt3gfiKKDgPeT3Mz4H4sJY6pg+6eoj9BsD0RE6rq2zx7zJPb/oKn+2ESLRElhiqE9EJ19Dgy0W/XKphPJ1ZRtE31/oaffc0MgSrepLo6q/HgfaHgSs5Ud1PwZnn7SA/+ix1uehwb/G4X3siFfoFCfuMwYWmgLufpypVQ7/2nZS+TB8TvdW81lMOG0Xt3xI6rdvEorSneMLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMRTS94bP5mzTyp0C3TVUX3OC0p29wzVci5VOZBrKaU=;
 b=BUU+cet6U020TPLzgUzpTImJiszwaWHPGTHvrL/CpdAANvFc1qMpwF0MjpDuMQxGoO5lG/0z1O6Th29SiZnzFnMlr2ulTv1M0/sManDN7fhIBoWXACN5MPOgvgdWYQ2h0zUaon9apmthTkr2pgSIH2N5XQ7u1aYrteUocftkAgpM1a9NmIfc9xZaUyKxMOZP7ZWPuJcYjgwFq201kQv/ydbyyDUlksYA5MP/+XF0gSrSxhxKw7x49ogvVNDyDHGIaL029nEAKptfHZGi5/7svCY9VTdh7m+pLa/MHEJOpjfxSxcd+1xDYkEYzm6Q0QNHjdi5A4QjiepXLSjwttLRsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMRTS94bP5mzTyp0C3TVUX3OC0p29wzVci5VOZBrKaU=;
 b=WmnHfXxewfXz1KLHRO5UqEVneMgRhgYgiBb3/GcGISBAYv69cu2Wm8zU2UAhxyV5HGcb4rFSco/zOCyeks/EbyQ1BuvfPepodYedk4UPUwUh8uvELBkQ7JpKxHqatP5z5IMMMyUs1uCTTkuHYxdIENAwmJxhJE5xsQPBFxThTzU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 00/10] GitLab CI cleanup & improvements for Arm
Date: Tue, 27 Sep 2022 11:47:17 +0200
Message-ID: <20220927094727.12762-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|CO6PR12MB5393:EE_
X-MS-Office365-Filtering-Correlation-Id: 3985efc7-e83f-4ccf-456a-08daa06d4f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZETgDIUOiBhzjRSSjhMOwrdJeJ99ZG0xLZrgfWzmIQuidX9HZMfXmIaJGc1sD7GaHIYyRBHpeH1VRIit18f5cXsYyz7aThJsOy1t4exDMDWB2EU6erChj6qLEV8uusgNAClE5OjpDdItTPB02gS9grxRT75olaL5yYVW6kxGNKmPeOLXxFnyIVIvIFheHgk7RfibDRM7BMvaB0h4Xa2Xh4QdXm6mHMOQXUTbyT2vcgQppx4Paj/9joVx25n1CDKXw02CT5ADSI/biGjqZwOJ3Og4wDzQ4FyQv7YLqmEiWrAAYvL9vj7VNo3TsnAjZotcuSU0XJY7tRZlm2+z8fHrNcokvYMxRKXOBHgHxGW4XTEzfK1Zx7S9GWELGPhejL5VKirdUqctgzt9KgjuCcyeeR+0wS6INsICpZAYRtMdiJPwXh4T0AsKi32Nq0Wj0NVGCl7hEEfzHX0ceUBe5TEm+nWMPVHWhWJQmyNq/+fIuAMyEvKuMtjPnQEf86k1+Qe33c0T6xXVRtQxkojhCP7PJ4SNAMh8uDi3f8DoxD7G7Ghds2gI0/6lIpsAyiB+aIRQnxPwiYdel1UTogr1i/gS5WP5HmMLrw2NZwVAgZZ15HH3Ocqo89HPUrrlX2khKRTUXh35HQoRU+zoNMOF+uIkcdNe/lBWfD1MEeWmRuuVGwDHD/uu4/bXQvtXhR3VGpeqkQ7JIgu4AhbQt6R2FC9r3lcpgkQ0cz0I3b4huhRXvlw39QiWlcDz/GQ4uXKJ8A3/CKF71UenuxPtPT/Bar8XPrskOySqvT1f8TfDZCqORqN8LZH2fw6jWZa8lQgwgXny
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(5660300002)(47076005)(426003)(8936002)(83380400001)(70586007)(70206006)(4326008)(8676002)(54906003)(40460700003)(478600001)(316002)(86362001)(40480700001)(6916009)(36756003)(6666004)(356005)(82310400005)(81166007)(41300700001)(82740400003)(1076003)(186003)(44832011)(26005)(2616005)(2906002)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:36.3346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3985efc7-e83f-4ccf-456a-08daa06d4f05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5393

This patch series performs necessary cleanup and improvements in our
GitLab CI automation for Arm. This is crucial so that in the future
we can focus on adding new tests instead of spending time to fix
issues, making the behavior consistent, removing ambiguity, etc.

With the increased interest in gitlab-ci and using it locally, there
is still some work to do mainly to improve documentation. This however,
will be handled in the future series.

Michal Orzel (10):
  automation: qemu-smoke-arm{32/64}.sh: Fix typo in DEBIAN_FRONTENT
  automation: Add randconfig build jobs for arm64 alpine container
  automation: qemu-smoke-arm64.sh: Increase RAM size
  automation: Add debug versions of Arm tests
  automation: Add Arm containers to containerize script
  automation: qemu-smoke-arm32.sh: Modify script to use ImageBuilder
  automation: qemu-alpine-arm64: Cleanup and fixes
  automation: Rename qemu-smoke-arm64.sh to qemu-smoke-dom0less-arm64.sh
  automation: Rename qemu-alpine-arm64.sh to qemu-smoke-dom0-arm64.sh
  automation: Rename qemu-smoke-arm32.sh to qemu-smoke-dom0-arm32.sh

 automation/gitlab-ci/build.yaml               |  28 +++++
 automation/gitlab-ci/test.yaml                | 113 ++++++++++++++++--
 automation/scripts/containerize               |   3 +
 ...moke-arm32.sh => qemu-smoke-dom0-arm32.sh} |  59 +++++----
 ...pine-arm64.sh => qemu-smoke-dom0-arm64.sh} |  14 +--
 ...-arm64.sh => qemu-smoke-dom0less-arm64.sh} |   8 +-
 6 files changed, 173 insertions(+), 52 deletions(-)
 rename automation/scripts/{qemu-smoke-arm32.sh => qemu-smoke-dom0-arm32.sh} (54%)
 rename automation/scripts/{qemu-alpine-arm64.sh => qemu-smoke-dom0-arm64.sh} (88%)
 rename automation/scripts/{qemu-smoke-arm64.sh => qemu-smoke-dom0less-arm64.sh} (96%)

-- 
2.25.1



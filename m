Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C26164DDC6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 16:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463504.721706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5q7N-00030t-As; Thu, 15 Dec 2022 15:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463504.721706; Thu, 15 Dec 2022 15:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5q7N-0002yK-8C; Thu, 15 Dec 2022 15:25:53 +0000
Received: by outflank-mailman (input) for mailman id 463504;
 Thu, 15 Dec 2022 15:25:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GeMf=4N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p5q7M-0002YW-2u
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 15:25:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c12b7c2b-7c8c-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 16:25:50 +0100 (CET)
Received: from BN9PR03CA0058.namprd03.prod.outlook.com (2603:10b6:408:fb::33)
 by SN7PR12MB7322.namprd12.prod.outlook.com (2603:10b6:806:299::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 15:25:48 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::df) by BN9PR03CA0058.outlook.office365.com
 (2603:10b6:408:fb::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 15:25:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 15:25:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 09:25:46 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 09:25:45 -0600
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
X-Inumbo-ID: c12b7c2b-7c8c-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhNGdLZovLS5LIN1EzCrL7DBCoRn2p5oHVpcDQCv9KulcI4IdVdUY59v3I4U1BPercqPH97D4AsWVyi9wV+yYQSyLh4FdvR+o+NZNr4ka1Ln/fE+0FDMOMrIT60Gy0rSEngzUN7zEyer/POjLK0NPkkCWMSpiBeKDvb2EKvaiewCgm/b0kVhT5X5ofq+oL4ejYWEN20rmhCQMjexFgpgFvs4uL0WwI1qEZlRt0ekVbu93XS7Fx7dZpAoJZOZ5u1ie7vibl1jAqEl4sgqfy9m+wbh4WGG6ciHHqkvO7pacMommbdBo9G3qbt7uA7UuxQG7awk52YdeE9KbJPOI/7hqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uU9JPh2iYFFZ8oKN75dKK4N8ZhhkM/5KS9Tvu+1WoZE=;
 b=TZdT7VADR/uARiEBMDmNlVlMf8beg7hyS0+PJdz2Bvphnxnvquv1JQZ2Q8gdNNfoEjx1r9ada/+sg0b3R6pDOFGXbTPxb9tpLICm5YlMs3O7Po3UtA/eEU22Q/BA5lLZuh6RTqb0oX9/7TyUtmhY6DJV/Ta26ZNl3+pFSnQ4MpDAEchFWsm/aytVrzk5ZtcGAku2v15LYDIVEZtquiCQMcbeXK45mpuHpLRgu4t+RJUbGAOzZM+QJT7KM+dZ5lwxlToduWkNlqCMLlhpPBs040vU6/AQXLdv94Bu8KVAWiS+IuMErsfUZtnVa8os2Vm6b994f/B9DO7OiKOmidnukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uU9JPh2iYFFZ8oKN75dKK4N8ZhhkM/5KS9Tvu+1WoZE=;
 b=hI0LaqBbUcyNxUc8l2G2bKG91iQUW5Bvrg9HUNTs4bdhMA141Gfa0cVot/820VdRLo9h9RO1wK7if2iIR0XAfr+Kotx6ZqLbGSbHEqwhJA0GGQp0fhHvtziQ/pAbGNv6nwrusvV2LC+L1gWk9szKyoWdKQ0nkGqu2SbbjT1q/Y4=
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
Subject: [PATCH 0/2] XTF on arm64 support in CI
Date: Thu, 15 Dec 2022 16:25:36 +0100
Message-ID: <20221215152538.10266-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|SN7PR12MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: b60d4333-4eed-4559-b87e-08dadeb0a406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mg8pr/Eo1JnTQ9+Lv+QKrRP8km9VuRP5Ht3p32O23Y60TLM9IETW4icLlobZOU5onXjLF4EmS80PTY6CkjT/YFu8BjDab9FhkVuOecwdL5Hw1Nq7w/x8+0iMhyIc97wSPfA1vUe/iurUseNvQ1qq147hYiXogsGuoub7npiBgAvMIxeXzg6nPwFPdcZNJoFyj9HfWaBdlqh5a6w17+XFM5VPhWK97OpqUe2+qqdtxLdN6QZHTtZ3ig9n2Dx32rjGe4s3AS2DuRBsegxg4Q6Czg3ooDaLpIB6G51CndFuxpnDn75fHhbCQQmjNEadIZTLK/rUhyGktm0x/s47ht5z8egjyRj1Sx8OOK708h4f6Eq9BeH/FBIfFPXx7BtRkxkfvKUGyBGXGz9i2oeI1fS+9H/S3cswvUmOch398Vcdx0dEZ6oAuI8u/U4H1HkwcFyOsPTjJz3/+0OA9AlkkS3U2e1rKo9LT5qg80CWS7zrNFSTwfTH/AmlwPLFiFOOv1Mbx1oosG3FwbXHjjuNKf+brQZWeDbHlGsv2/7y6Y32vXfk16iD+Rs7RlkHMMpfVomEkMCauq2NXI8Ukf1m9gu5obZokNG0a7L917bGpKRLJusIyDzqV8KZonHq1qV2SH8xAgprbg3SEa0gvcJdOb9VgBP7KjRdj9F8Aw8g8fMOq60Op7PwvEMHQNoPDAGncJ/8R+XfqT2hDSv9sF4PP6RnOaQ5o2h2cUlxwVIhRZFH2WY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(316002)(186003)(26005)(82740400003)(478600001)(6916009)(54906003)(6666004)(1076003)(426003)(336012)(41300700001)(47076005)(8936002)(83380400001)(4744005)(5660300002)(2616005)(8676002)(2906002)(4326008)(44832011)(36756003)(70206006)(70586007)(36860700001)(40460700003)(81166007)(356005)(40480700001)(82310400005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 15:25:47.3392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b60d4333-4eed-4559-b87e-08dadeb0a406
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7322

This series adds support into our CI for using XTF to perform low-level
testing on arm64 (dom0less use case for now). For the purpose of the CI
testing, we are going to use XTF fork with implemented arm64 support.

This series populates the CI jobs to run hyp-xen-version XTF test to validate
some of the xen_version hypercall operations.

Michal Orzel (2):
  automation: Add support for using XTF for arm64 testing
  automation: Add test jobs to run XTF hypercall xen_version test

 automation/gitlab-ci/test.yaml                | 16 +++
 automation/scripts/qemu-xtf-dom0less-arm64.sh | 97 +++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh

-- 
2.25.1



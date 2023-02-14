Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E045696843
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 16:39:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495215.765509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOU-0001o7-GJ; Tue, 14 Feb 2023 15:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495215.765509; Tue, 14 Feb 2023 15:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOU-0001hm-A6; Tue, 14 Feb 2023 15:38:58 +0000
Received: by outflank-mailman (input) for mailman id 495215;
 Tue, 14 Feb 2023 15:38:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRxOS-0001Wn-71
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 15:38:56 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae3d67da-ac7d-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 16:38:53 +0100 (CET)
Received: from MW4PR03CA0320.namprd03.prod.outlook.com (2603:10b6:303:dd::25)
 by PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Tue, 14 Feb
 2023 15:38:47 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::c6) by MW4PR03CA0320.outlook.office365.com
 (2603:10b6:303:dd::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Tue, 14 Feb 2023 15:38:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.10 via Frontend Transport; Tue, 14 Feb 2023 15:38:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 09:38:45 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 14 Feb 2023 09:38:44 -0600
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
X-Inumbo-ID: ae3d67da-ac7d-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjgjpTEHlCqZJps126iT/LYemc31bd+qk+mIqjEQ663gUot1seDNVG8VZcN90EgRgwzhN9p1XsWZspqAiTyxIIv3CZypgOXKpEMaOjVCM52bt7Ro/kRWbRayThPhekgWuxGPdo07SRssJqf2ak7w9sN50tgctJrF8Xysn01FhBIyBhL69h4K5HCAwz8ka5LDpZ/76KmSGcvJkACba/qLvoEcF1mvzlGNJyzHpZTuIW9EaK9w7jdIOMMaBCiomM0sfkr9QHIlRimOie5O/r2b2yJuyL63DJgMAFrmhsgOsqwk/0+25GPJp2bqai5MAKxLhVC30dnbE2IbIbCtEFZywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XI/+Q/H0hC3+0B3P5aQlm8k2GZbJADIABnvkZNJtFk=;
 b=WenY5yBxXoCz5G4VeWYHtQmGGisLCY9hXjUsJXXkvFKWg+sNID/oGulopaIzgglIdZ57HMX5pICo/kI7duYn35TooYHLaodITCsEUKsTxIIGyeZSLxs1qKU/Y95oWMAyG+Ce/2Hl7DlM4RBDIQQzHUtoujwspiU6lToaN4/YnveH2jbqi6Bjz+84cZUpMUao604ajGNWVO9y6z9USiPi7V+2oE2Dt3RTwFWagQecu5Zoh8wLHAwyB12kdZuUORA0Z5U6FzbsKo3aTig/ICUYN7Ns7QfDUNx9qBpkZRWVA4bExxmEaGWv+E890tgRQTrnUilg4Msm5v86RwsnIHCkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XI/+Q/H0hC3+0B3P5aQlm8k2GZbJADIABnvkZNJtFk=;
 b=w+hjcxgKuR8g5tT2iBSA6khlxyFbJHKLqfWpXlouE9jQwzQd5qwRJnGj490vrVokQxQdttSz3xqL1BXziIPDk9fG+ZoodShWimaePqgDTB0I1qcpE0NFKlguL6YRxxZ9tmDp/2Ugez26M4W9HgkilQKY6yBsh0m4Ec+eHkrsljE=
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
Subject: [PATCH v2 0/5] automation: dom0less arm32 testing
Date: Tue, 14 Feb 2023 16:38:37 +0100
Message-ID: <20230214153842.15637-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|PH8PR12MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6e551b-5cba-48bb-ea0c-08db0ea18fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HKD7kY2zJjkmb76SCnZnjF8fE433fVYoAgMaNznaWNUZyXoO0TmRB6E/jvdcknjnTM0XrS3BXO1OnjmzFp2nSOuyNZ9pBYVFX6nShxqijgVDsgDzRJBsUW4BczeKAwj5/aV0pUcOemPlo4Y14Y4KgSpNCvGua9sE4FInIHXYC764q1eGuxUXEDjvITCHRxtVEAtt67YTmxxz4hkKJyPbeaU2j4INd6b6QggUBIpNta7xt9LKUHTPtSXNSHxqhibcpXi9d3TIeRalIi0iD3c9rok4rXiEZ9Un0gF9rOsRP7GcKd3dd6fOAT5NKIQrjcQAOfrJtefIfumSI+UOZ6snh31bZQWpHwKhnGxR+EL6RkK1wkX+OSn2woiOGzwueJ2E3YA9+4kz1yDqIEYvFn2iKa8bXlb2I0gcOTNd0a91CTKDfMN+jJKDKH89RTCyepIIkJH5Ags7wttnUknXv8v64Q/plIX9d3W9ENoVCs28rv9qvhDtBGM32IeEnhGdSEo5DvC6zTsp2WwgyWuFwcR/Xar3yLlcmuukWbzqvv1oNgPgzVGr1YzHsuWmE0PE03SRp1bjhYeWJF1iKwLJiHV1YYxJlcJ/00r46EZT2K5D0+C43SRr1eHOGUPuzul28LzV/0/pGlHE7ocmAW8/5XHGTUTJVe8mT1mM08MhO6LqugZ5UbEfcsK1gQdBsH1stWS56PQLFJDTd/QvUtNyWvUgLIEybGJIAX4br77937/RD7+RJDXkZmN+vLNn3SFe8oSF
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199018)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(426003)(47076005)(5660300002)(8936002)(40480700001)(40460700003)(81166007)(82740400003)(41300700001)(2906002)(36756003)(8676002)(36860700001)(6666004)(70206006)(44832011)(82310400005)(83380400001)(86362001)(966005)(478600001)(26005)(6916009)(186003)(1076003)(70586007)(4326008)(2616005)(336012)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 15:38:46.9039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6e551b-5cba-48bb-ea0c-08db0ea18fef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6914

This patch series aims at improving the arm32 CI testing by introducing
the dom0less-based tests. It creates a foundation for further test expansion.
This is particularly important now, when OSSTEST arm32 stuff is down and we
need to have at least some coverage in gitlab CI.

Note:
First patch is added to the series for convenience. It switches the arm32
cross builds to be executed on arm64 instead of x86, as the latter has a lot
less resources resulting in slowing down the whole pipeline.

CI pipeline performed on top of this series + cppcheck patch:
https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/777181033

Michal Orzel (5):
  automation: Switch arm32 cross builds to run on arm64
  automation: Add arm32 dom0less testing
  automation: Add a static memory allocation test on arm32
  automation: Add a gzip compressed kernel image test on arm32
  automation: Add a true dom0less test on arm32

 ... => unstable-arm64v8-arm32-gcc.dockerfile} |   3 +-
 automation/gitlab-ci/build.yaml               |  30 +++-
 automation/gitlab-ci/test.yaml                |  64 ++++++++
 .../scripts/qemu-smoke-dom0less-arm32.sh      | 142 ++++++++++++++++++
 4 files changed, 232 insertions(+), 7 deletions(-)
 rename automation/build/debian/{unstable-arm32-gcc.dockerfile => unstable-arm64v8-arm32-gcc.dockerfile} (94%)
 create mode 100755 automation/scripts/qemu-smoke-dom0less-arm32.sh

-- 
2.25.1



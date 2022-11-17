Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638C862E15B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 17:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445283.700409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhZk-0001xG-EG; Thu, 17 Nov 2022 16:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445283.700409; Thu, 17 Nov 2022 16:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhZk-0001qu-8g; Thu, 17 Nov 2022 16:17:16 +0000
Received: by outflank-mailman (input) for mailman id 445283;
 Thu, 17 Nov 2022 16:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovhZj-0001oG-6c
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 16:17:15 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b6020ac-6693-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 17:17:14 +0100 (CET)
Received: from DM6PR02CA0136.namprd02.prod.outlook.com (2603:10b6:5:1b4::38)
 by MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Thu, 17 Nov
 2022 16:17:10 +0000
Received: from DS1PEPF0000E640.namprd02.prod.outlook.com
 (2603:10b6:5:1b4:cafe::3e) by DM6PR02CA0136.outlook.office365.com
 (2603:10b6:5:1b4::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 16:17:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E640.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Thu, 17 Nov 2022 16:17:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 10:17:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 10:17:07 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 17 Nov 2022 10:17:06 -0600
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
X-Inumbo-ID: 4b6020ac-6693-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhdjIXyWJIe9I8YepD6KBql5zVqA+Jg0kASJ6viWmy3Gq3v1IDBCCe6yLh9OKpI9vBSnuD3J6Qo9cekBpQam8e0QvbwPv1c55f7v1vacU6d4raESyiRR8tLRVgDhoBuCIXgVaTesm0K/fb7zXEw5sZuwA9lwO0thDzZrx8uDohWorrMuGu11PPfSeREtgOBiLV1+7Umdi2kIvVes0uBs302Dx5/p9I0Kuc/Gb3mIvn2HCwi8JQfAfHyXwQAWKnuLDvM/7EpRVkrsLgKV0s5Qpe38MBCRoksMelf18f7lOsVEJ9K510/gx/9NPqtz4ApCU0/mu7H7CFDD1/3fi/4lJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWv10e40OF9Taz123R7TXGCwIFoVSKUwP5lR9GD++mo=;
 b=RbI5IfRwKOCTXroz79XmOaH6W2piymZnDM+vszePTkU9xcYtoRFsw4qj06lRBKX95vW3cPANQJPywSF3WTmnEC3oDKDjh7SO3RUYX6RRKB9wHqWEf/CykLI+hUK4cyPwAO3VYl+iWlKF57inmXauAz2XXiz+Z5p8ReOcZDifvW71ThNSrsTYYA6g3m086cM6qf8FvQYjV67ZiEnmi4640UtX2L53I5wRR1Bd9kEB5NLR4++06bwhLNSSCG0EvKPnwVC3tkKYH+YMX8BaWrgq2aLqN+88ZtfHE+EL2JKqd1D6jKflYzafora6vWphm95hzUgq+epc9kwDXHH2sP5Huw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWv10e40OF9Taz123R7TXGCwIFoVSKUwP5lR9GD++mo=;
 b=cuW7M1gqIpMENWwfL1YGXm5yrQWo/H4FWfi7whuSunl6CmshJWc68B4ue2bJIjl9/dPoRm1RpLW6dWYPTloIIyo2E68TxQEEk1/yU4dS6HVVS5xy8bIo3L2olObf2U4Cob2ygCugzupNSfCG19kJKBydedmK8eAxwMMZA9dB4Oc=
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
Subject: [PATCH 1/2] automation: Install packages required by tests in containers
Date: Thu, 17 Nov 2022 17:16:42 +0100
Message-ID: <20221117161643.3351-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117161643.3351-1-michal.orzel@amd.com>
References: <20221117161643.3351-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E640:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cce6a79-beac-47c9-0afe-08dac8b72dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3o8A7PosccTmPcoW2prHh94+dcqaaHFIWxdDxoRyVQaXwBV1uXTlJXSVaVk4zqGT16gldVCgjJwpS06QfdnGKUeiy5Z5fx8iQOtOKgnio5JNTGvPGIsHwzOL+rKcBM5JYnzHq2/enlGH0a8vh1KYEQmay2o7JX4QemmsExbwEx2/jgNGiyZbAown2KRWMFDtsBC5bE8Z7M+L0hO31hFZQW2aMbsc/Yd/CSQDCdjPXlzqDdrZtz/BzWDYyvpAhebLKcGLvJRVQNvlT4xNaJumwXFYx0ASfHw9wSb6QMbQ+8RwPoPqt6hlNlyLt618vxae891NstHjgd6AN6AOM4KqJyV2T9aO3H0Op6pUSVBsosVEb2mRMS/Hz9N9scGbMwcU2uEAYy+huqm4zc5KiDj54nN2ZxHjRFuDQqJMrCQTyIzScFnFeVFq7HKlJ3Jkk3jC7SVzjV7OPbHiNJyD0zwUvaq0QF2AIo8sApU+66MD43mNe+DImeHYzUKO/D2teQ5mrwvtD0JHmtDYzeFVe2bAQAg7APq2MY66JWKxktj3RpRLUvDUBLYK/iAuXvs5uq/5YPb/1O7y8AZqvOUi61G99pZzIrrdZe7p1o5k2E/mutdq4bZxJRKvNyS7ASaV9ZOT8llQhl6L08BsU5hLhCvPpz3B9ZUTQ4k3x0Ha0gMvJEqFnwgBNQ0gZAif9SQ3ZHL3sK5CwU/Ap7nP3QXSXtUE6YiqR32XZbosu+GbPKgdTl0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199015)(40470700004)(46966006)(36840700001)(70206006)(2906002)(8936002)(81166007)(36860700001)(82740400003)(36756003)(70586007)(44832011)(356005)(4326008)(40460700003)(8676002)(41300700001)(83380400001)(5660300002)(478600001)(40480700001)(6666004)(26005)(186003)(426003)(1076003)(86362001)(54906003)(2616005)(82310400005)(47076005)(316002)(336012)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 16:17:09.8875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cce6a79-beac-47c9-0afe-08dac8b72dd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E640.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900

Installation of additional packages from the test scripts when running
the tests has some drawbacks. It is slower than cloning containers and can
fail due to some network issues (apparently it often happens on x86
rackspace). This patch is adding the packages required by the tests to be
installed when building the containers.

From qemu-alpine-x86_64.sh into debian:stretch:
 - cpio,
 - busybox-static.

From qemu-smoke-*-{arm,arm64}.sh into debian:unstable-arm64v8:
 - u-boot-qemu,
 - u-boot-tools,
 - device-tree-compiler,
 - curl,
 - cpio,
 - busybox-static.

The follow-up patch will remove installation of these packages from the
test scripts. This is done in order not to break the CI in-between.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/build/debian/stretch.dockerfile          | 3 +++
 automation/build/debian/unstable-arm64v8.dockerfile | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index da6aa874dd70..30fcc5288dee 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -49,6 +49,9 @@ RUN apt-get update && \
         apt-transport-https \
         # for test phase, qemu-smoke-* jobs
         qemu-system-x86 \
+        # for test phase, qemu-alpine-* jobs
+        cpio \
+        busybox-static \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/build/debian/unstable-arm64v8.dockerfile b/automation/build/debian/unstable-arm64v8.dockerfile
index 5c73458d9d19..0080c22ba21f 100644
--- a/automation/build/debian/unstable-arm64v8.dockerfile
+++ b/automation/build/debian/unstable-arm64v8.dockerfile
@@ -43,6 +43,13 @@ RUN apt-get update && \
         wget \
         git \
         nasm \
+        # for test phase, qemu-smoke-* jobs
+        u-boot-qemu \
+        u-boot-tools \
+        device-tree-compiler \
+        curl \
+        cpio \
+        busybox-static \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
-- 
2.25.1



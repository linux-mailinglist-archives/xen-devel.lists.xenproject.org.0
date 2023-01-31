Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776106839A0
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 23:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487907.755769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUL-0002N5-WA; Tue, 31 Jan 2023 22:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487907.755769; Tue, 31 Jan 2023 22:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUL-0002Gk-S7; Tue, 31 Jan 2023 22:52:29 +0000
Received: by outflank-mailman (input) for mailman id 487907;
 Tue, 31 Jan 2023 22:52:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skZt=54=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pMzUK-0008Hj-Hd
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 22:52:28 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eec783b7-a1b9-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 23:52:28 +0100 (CET)
Received: from DS7PR03CA0044.namprd03.prod.outlook.com (2603:10b6:5:3b5::19)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Tue, 31 Jan
 2023 22:52:24 +0000
Received: from DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::8b) by DS7PR03CA0044.outlook.office365.com
 (2603:10b6:5:3b5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 22:52:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT101.mail.protection.outlook.com (10.13.172.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.36 via Frontend Transport; Tue, 31 Jan 2023 22:52:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:23 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Jan 2023 16:52:22 -0600
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
X-Inumbo-ID: eec783b7-a1b9-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5wBSUyeOZ8rQDdxXb23NmYmVJH4DF1HgPBAEzUdKxFAZVjaz7y0Um+OIdqY/9PU9wehBvLFN65Db6jwdIoxo4CEAYRfGeqJFLWXrwRzk7XXq6Ap865TqnuCa0CpjHbjqyPxxZxCt715XONUxbcNGUgCVP/kyZl521CKbWCHENVMUFyVXNzGbQE8Y9QsSOTl29G3owo9lIf/U6x+pPPqkAfsMOhxho8xccKA1FPlM4nr3BACQEFigjcj7B7/KgG2LpgQRF2afCnargFP+YJjNd9RVGcc0UB9N/mPw43KBSiCCH7S+EXpve07MTp3bPhJgn8CLX3P1ADdcKTuAyfMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c1IzY0YQxuTPTSwy7UvS0mMbpPve8RkE4gupE88sNQ=;
 b=S1QUAKgpMq5V7y6K6fIXooUpM3nj/UyU7jWZMgNO6tAGBTQm1axO5OvmSeHcDokwk4YE+UxAn5bBjp80lfkYU6gLQ2GP+yV3o6A/kavZztKVhSfvDTRjOJo1d2vzuY6BYXVp/9j4HqgEZNMUnU8/zq+3vWpFOj7pT38o5lVVztv+NqvD/ThIAdqnw3tqjj/17De8Ncn18y2MqH/DJvluv/1f4m6FWL746jRi0xVZMtc9owSkF3AUlzEv60cWf8Kef88vF0Okk3iqPFeH8EzWkLIVuXbpVlruY54E8DNvkP+iba+plKiIzkLHZR635pwxKNWQdupppwETttCpCB0IKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c1IzY0YQxuTPTSwy7UvS0mMbpPve8RkE4gupE88sNQ=;
 b=UMRryyixogad2mWzeOT0OucBvl14YgzhAImM1krSWAiO9iqxLEy432VQVmHAX6/jQZr2KFvMf+wZz17a+QdLtG9UXqCvE/iEZH80NOZKe9bV3g0AP1txPa3wMDLW4LZ6Jh6SiUs00zLim1WRNstcei5agNot7UKp7tYlfbkX7v8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
	<berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [QEMU][PATCH v5 10/10] meson.build: enable xenpv machine build for ARM
Date: Tue, 31 Jan 2023 14:51:49 -0800
Message-ID: <20230131225149.14764-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225149.14764-1-vikram.garhwal@amd.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT101:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba9ab4a-a739-4ca2-e485-08db03ddd16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CRHApirmURZUasY1yQQUrk3rGjD1IRLKcXSSZ99ty3v/koBoUmzhBeEIsOjwGTmpeJiF/5rh6fkCzT56jZGmPLRMNBpN72EDiDmCyKhKEvqtxvxmXc0Hu3Y3pDTR0Bsla8/O6TjDBDyyQonz/BSsa8WaCg1u1N6akFgPyjinzZIuc6jhiMx/LyTi7JtUks8AylZz/zSfSQid4kPpF5VcEJ0pz6L1b88DYZS0YE1QOEZx0cI0D9OVkgcGkODOF2ge2AAaVI+qCVtdu3tZ6mcMGttUyIeXYfRzckoQoENuMdLEHVycYVv2+cU8j2y62OdP3LdeKrMhe585lE4ziUviCTiMDLcH5bg9DKyVBva/unm7u0fIABKLS7zPHJZMyDckyAS5QXLOhm+54NhR8UjM8J10n7R+fV6Q2lJ3YpzUpoJgI27TSGGR138IlGMq0UMs8MalzETyOLdX7pdBMnPPVC5CZXOlt3NFe37PcHnmYRH5EIt1rUpsUpF9UXqtl/LTvuDTUHptZKjNFUPgNJvX8VUpK5/LCuDh+/IYM62+auTk6TrEwxj7C+gy0m1p7Lu2Cte/VVFCGZowpfH/QkWJRV9l7PkTii0R0F00XBAVEVWKqtHEDgrJvLfOdEwZ9kgnU0la/SE+HAKRAkyM/2MyMFxPqhxPByVigU0THoeP59dNuAcl+oMenwgYWF+956VCyLKiL8xOwwG1Z9PCoat2BUXmAP6ZyHlOkPFIKpEj4hM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199018)(36840700001)(46966006)(40470700004)(316002)(66574015)(426003)(356005)(54906003)(41300700001)(44832011)(2906002)(4744005)(36860700001)(36756003)(5660300002)(8936002)(81166007)(40480700001)(47076005)(83380400001)(82740400003)(40460700003)(6916009)(8676002)(4326008)(70586007)(70206006)(6666004)(2616005)(478600001)(26005)(186003)(86362001)(1076003)(82310400005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 22:52:23.8571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba9ab4a-a739-4ca2-e485-08db03ddd16d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306

Add CONFIG_XEN for aarch64 device to support build for ARM targets.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 693802adb2..13c4ad1017 100644
--- a/meson.build
+++ b/meson.build
@@ -135,7 +135,7 @@ endif
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
   # i386 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu'],
   }
 endif
 if cpu in ['x86', 'x86_64']
-- 
2.17.0



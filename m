Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3741D74E91F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 10:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561602.878041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ8kk-0001fO-MQ; Tue, 11 Jul 2023 08:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561602.878041; Tue, 11 Jul 2023 08:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ8kk-0001cv-JR; Tue, 11 Jul 2023 08:29:46 +0000
Received: by outflank-mailman (input) for mailman id 561602;
 Tue, 11 Jul 2023 08:29:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGx4=C5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qJ8ki-0001cj-IF
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 08:29:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14662140-1fc5-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 10:29:41 +0200 (CEST)
Received: from BN0PR04CA0172.namprd04.prod.outlook.com (2603:10b6:408:eb::27)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 08:29:37 +0000
Received: from BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::f0) by BN0PR04CA0172.outlook.office365.com
 (2603:10b6:408:eb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Tue, 11 Jul 2023 08:29:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT089.mail.protection.outlook.com (10.13.176.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Tue, 11 Jul 2023 08:29:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 03:29:35 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Tue, 11 Jul 2023 03:29:34 -0500
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
X-Inumbo-ID: 14662140-1fc5-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSjTlZtlRBcNVhF8pjgSZll1sCsjqtcBc58lVZSdnFwa4CvcBk3wpFZxZTC7tqcO+B979IV3izeGdEoeDkNCgYYvfVlG+w1Yafp+RLxCtmjBCiC1aKf9g4cprg9avawZVxwjuMTDSkY6iHKLD8N7zSLlp+tKmB2wzQKD+L7nIe3iSkkvpBPAXchynP6B20nZAQZywkthHru/KvavPLUoHgXUZKUU91vo6DmzhvOI7w4KEheoUe3rz5/kdYxOgdvzwbE/f7TJSvA7n5BLLFURa1jEvkjQ5LOuB7EFjSCRcAoPNUFykpfd9x9nDMLuUQZn4CcuYGMJ66KqWGdfT3dasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myHZUIRXbht0/I9oaq8R1oWGSnjo01WXF/m1o3C9/VY=;
 b=XJLhsZBYpBz9Ha4IG1JSDfjibPC/IZ69Vdd0OswIhG2Kh7E8T1co9aAEzKF+S+/HH6NXTPwN4A26j+XW5kZsKlTeg411DWGMB7IZbS/OnrESCvz/wrEIwcuPNADsgTEeNU1ePt3bTgYFqNl1rWoRbVwLczB6oJZw3S6HqZohUOXSsiveXWElECbeyspV0NyzHdp7CHziMYUQNG9VypbEWRwt8bkl37l2nGjZHjLpJlY7QtPJvQhv92kjXyhuoCoP+RR3rqxP6eBs3dm35llKYolwEivGGDAv00AwOAlNpwMnexyKR/EE58GOi9KEeSUnzp0oT77RBjV9AWetAP1tzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myHZUIRXbht0/I9oaq8R1oWGSnjo01WXF/m1o3C9/VY=;
 b=yhCyXw6j67nohET7IBG5Fo9h9u4rt+4N/XVfRPfjbPTA8a0B2dpd+U18T7J3GFW6pficWh25s21+faCwjg3hf61TJk1/Q4ILomOrFg4/3lfBbjalgjMuOZ4qQJjonLg7tGWaqkt9klYg5WuHXK/VM+LcExph/T3M+EZjvJGaPZU=
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
Subject: [PATCH 0/2] xen/arm: Support for bigger domU passthrough dtbs
Date: Tue, 11 Jul 2023 10:29:29 +0200
Message-ID: <20230711082931.5402-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT089:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e868db1-dbdd-458f-3ebc-08db81e8f62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U/WwtYyJHvPAwvYfcH5Ss7BfUmOwYj29ki3gk8OYpanmKAv0geAAn2sVwh1exkMZGbPChIwDWy5NYqUt6hpyxenEhZ8etsKg4VUpHwH1cxvi2HPc+NoE9rh18frHttmMcR2jSHA3oXphrd8ORWFP0Lp+YSjjKEf0RJH6YyvHjMucRaeH6skoLyRBnCenlpYtT0RnJqzTz9QV4u7Uf5l3xRgIF/AQJdvEdsJyEbrojWjL47AECCIliYYIr3hsN4a91IddtKXu17nEI3VQoVfY2Hvwu797DdwDLWO0HgeAZBGstec/wV1SHIGAyByOXcPT0JqO16zZmL2MA5p9FmrxbdUTY3KOXZOGTe4DSqMsSNbooSQzk4bYXG9vJSFo/wPLdGpGOmuumw2IuTxr8qx6t2WZlKgo6jkYf9Y7sSYKfOTeIJuzGvSrJ1PKIo5BpMl2zOE95Ikojiv7jU9J5VMUxWtWecSlm7Gh+esgj+8d0/c3nhqKzB13VB38VN7iv7ckslvqpTDKegAFLgmggWNb0MXLmQrSSPzbtPsYXJxk6e7IwRE/LVdOv1zlFMrBlI/An+giHOGNF4ydKliM1ljypV15AekXKMYmVUUmX0AqcUaSWZKaOkcR8b/mTWrlDmujMH8PCRw0oKHhpscn5a9UmSnpiOVyPU2RAbY0yfUFFnuWFsyUmZNUpsA+8vb7kN90+G2dTpHqpnXEbP9KEKuLOEmh7dync1YzItpPFCJbq93uFMfsVedgfJ4tfTt3VsifMNSkkloDV/corcuX2r0Rn7xz8UumarUKSfeCLU8+PRs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(44832011)(316002)(70586007)(70206006)(41300700001)(8936002)(2906002)(6916009)(4326008)(8676002)(6666004)(54906003)(47076005)(26005)(1076003)(186003)(83380400001)(4744005)(2616005)(426003)(336012)(36860700001)(40460700003)(478600001)(82740400003)(81166007)(356005)(82310400005)(36756003)(86362001)(40480700001)(135533001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 08:29:36.5013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e868db1-dbdd-458f-3ebc-08db81e8f62b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443

First patch with a fix (more for a logic than a bug) added to series for
ease of merging.

Michal Orzel (2):
  xen/arm: Fix domain_handle_dtb_bootmodule() error path
  xen/arm: Account for domU dtb bootmodule size separately

 xen/arch/arm/domain_build.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)


base-commit: b831326ee2f9ed94523b3d8b0fb2da2a82113e9e
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34DD6C6A21
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 14:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513894.795604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLRh-0001KC-74; Thu, 23 Mar 2023 13:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513894.795604; Thu, 23 Mar 2023 13:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLRh-0001IE-3H; Thu, 23 Mar 2023 13:57:37 +0000
Received: by outflank-mailman (input) for mailman id 513894;
 Thu, 23 Mar 2023 13:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ZVY=7P=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pfLRf-0000G6-1F
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 13:57:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8781d9d-c982-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 14:57:33 +0100 (CET)
Received: from CY5PR17CA0026.namprd17.prod.outlook.com (2603:10b6:930:17::13)
 by SN7PR12MB8025.namprd12.prod.outlook.com (2603:10b6:806:340::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 13:57:29 +0000
Received: from CY4PEPF0000C964.namprd02.prod.outlook.com
 (2603:10b6:930:17:cafe::56) by CY5PR17CA0026.outlook.office365.com
 (2603:10b6:930:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Thu, 23 Mar 2023 13:57:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C964.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Thu, 23 Mar 2023 13:57:28 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 08:57:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 06:56:43 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 23 Mar 2023 08:56:41 -0500
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
X-Inumbo-ID: a8781d9d-c982-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c44u3tkQ4sAq7K/v2c2pW3rvH31Oy/IW+QYVUDE+3MjBnf+kSGc+x7KRFrM7uMo8v5i4U+u1MryKthuGaCZiX5YhaXAPT/ZY+xVQndQ0NIjYhh0O/fUiHhbJRaY1mL3bVMka1aewGry2SNDkMeBk7SIRWUzYldmcal1Tz6aUpapN/SP/KdGbus8ajJ9pVJK9HRt9zRGb3T4ZW7I2/CClfglviBrgdUX8/2IqqV47dUPl1h+zk3etI+RcR1ersbXRsPcPH8DtJWy3PwFpEJZWm3jNFeViqPhLoGEs6pZ+SErhHBSII0TSO36PEn74HiwnKtfn7q9zTATmJkWF+sp4ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmNW2YSwGjsXUWkmZKPlxX9Or+/rmqmnfsh/twK5JG0=;
 b=MbTqiOU++R/b4S38rbXtWe8S+BexB73SLZM8miiZJv9eR0o1WwvSUIegfzS+AzLar32Gaqgzj94jYL6EDmEYIfMeUjywYECp4o6b/SxI0U13b2RhULG1me1/ePopKybqgMB4q6Mvq7jYoANgkP0nr6E1lE7HxNGvXZ2LfVkEDLyyJKjDW4Vi1hwlUOtskgl7mAlt/n2c4ovxSiKBGw5G2xSNNGeroPPGCJaWygtWe9OTH3H89I20NDoQdVS74PbkuZimJEWOcaBfWRNGI6cMZMqUFLEUmReNEt2vaLo8isLCgWcZRpj+FfwqoKP/ZQMGtHgNlX9cZ98bK1hI8E1vjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmNW2YSwGjsXUWkmZKPlxX9Or+/rmqmnfsh/twK5JG0=;
 b=HkpJgH3y1gKZ8gLJKywjWLqbPP9dU98GuWmNWUoytj7vkRX504dmJU6UC6B2kZTTRMJ/3fNVkg2RAbFA8rrNfLy+0mbYPNLVknDFJr4BFxLfijZZ3KbFY0Umd/xqrU7gncHl92TUMp0jObsTkSYNbI1Lwq0ylOSoOS3h4J2hYvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/2] xen/arm: fixes around domain_vpl011_init
Date: Thu, 23 Mar 2023 14:56:34 +0100
Message-ID: <20230323135636.25318-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C964:EE_|SN7PR12MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: f2892116-6ab5-4d6b-1dbe-08db2ba68a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4xa7ABI+uOTA2blUMYiaLnHx7Cx/VphJmzp22og3GUIP3sSahFVeDhZ1uzbQlvaPK+XzP128XcnyswwGOK3ZA5spqp/52rNAAuF5EjkLAsWn9ugRPPytPN2duBtpNjsf+S3fFtkad/otktXdwznF5BY435n/IUxNpB4nZ8vOpER7rRwRjhv3kKENi2bj+AXmgj1Fu2bGgTpbzRi+8SpKb13mWWh7EVOreqeArYWRlNv7vv5weArqMLrD9gBfHEIG4dm6ykw3nWGWEB2VrUF9PY9LbrCfEN+OIjPADVn3b2hAs1uvzgSCJSXqw8jFLv4wWjmNaz7NhK9rZFzcvDwOCRBy1Me2Xc+ts7ta3EsBAnqz7oz4z5EFZKNt/TBRiks8v75FJL4NLGWoxdMkllTT8kp5oDsYyFJ6ly4V9ZxNaz2tJNE7PJlhd4yeG7bUb8mrPmMmxFErBtgDoP00F1Qp0FZ1OpKd9dCJaBa+bKYvLOL4636UtldobyFTHunfb/z/IRjL+YjDSdSGKEPH6bSgWBpxMGx9puumFWNADrl0xxbDGB8C+cYfVLlt1fx5FmPrY3BJgJlmLssfv0NFk/jT7FnPgvFA9VEF8EmH8Q8haGPBpidx4P6gRi0oRxWBs3Wx6i1ns2e1o/9kyfPFELeckNZInG9A5UmzZ4PRY04aPF7yVT3e0OTJnz/wdHP6idvKKxFp3BZF1bmyl+wf4qee3Tw/dLW7wQQrT0m5ct2vrJ0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(36756003)(2906002)(40460700003)(82310400005)(36860700001)(478600001)(82740400003)(186003)(47076005)(336012)(2616005)(426003)(1076003)(26005)(6666004)(83380400001)(5660300002)(40480700001)(41300700001)(8936002)(86362001)(4744005)(44832011)(54906003)(81166007)(4326008)(6916009)(356005)(8676002)(70206006)(70586007)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:57:28.7060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2892116-6ab5-4d6b-1dbe-08db2ba68a4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C964.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8025

This series contains fixes around domain_vpl011_init().

Michal Orzel (2):
  xen/arm: domain_build: Check return code of domain_vpl011_init
  xen/arm: vpl011: Fix domain_vpl011_init error path

 xen/arch/arm/domain_build.c |  4 ++++
 xen/arch/arm/vpl011.c       | 47 +++++++++++++++++++++++--------------
 2 files changed, 34 insertions(+), 17 deletions(-)

-- 
2.25.1



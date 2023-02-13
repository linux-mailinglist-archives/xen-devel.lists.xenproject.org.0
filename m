Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251DF6947DF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:22:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494551.764644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZip-0001sw-Fa; Mon, 13 Feb 2023 14:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494551.764644; Mon, 13 Feb 2023 14:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZip-0001qL-Cq; Mon, 13 Feb 2023 14:22:23 +0000
Received: by outflank-mailman (input) for mailman id 494551;
 Mon, 13 Feb 2023 14:22:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfrU=6J=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRZin-0001q4-BN
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:22:21 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1de0962-aba9-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 15:22:18 +0100 (CET)
Received: from DM6PR17CA0029.namprd17.prod.outlook.com (2603:10b6:5:1b3::42)
 by BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 14:22:15 +0000
Received: from DS1PEPF0000B073.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::17) by DM6PR17CA0029.outlook.office365.com
 (2603:10b6:5:1b3::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Mon, 13 Feb 2023 14:22:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B073.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.8 via Frontend Transport; Mon, 13 Feb 2023 14:22:15 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 08:22:14 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 06:22:14 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 13 Feb 2023 08:22:13 -0600
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
X-Inumbo-ID: d1de0962-aba9-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDS5nCPhT0UCsTM3zsSfPjp1IFm2+0vCo77+QqlBEiPpUQ+461TYVqpNOKKgHR/GJ4cT5RcM520tU5b5atH7JPE1G4giSqeRqbSOPE4/tbwT85HL19Kvf1/JAP5jnpfjTSEpDzUuPd5NHYd5i4URhKvd6GgA5+0aHjAyQx72XjaqkzlHWDmFj41ttXBmdSoBqcFP3OYBpFnG7xa5Xlv/wZGs9v6Srlf/Wiz3GX6PH9FSkB2n8ZE0849hTQRRsOoQu2XcvXyUlMdT22GiPxTDdVvOFqGni+ulmS+DZo210gMeVWII37egmNZ635vu3znjEklT+sboCGfmRiszY+Um7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uryp0FBeOVB3D/UsJiltpcmedQ/Z3ksaraSj5aZ5Sjo=;
 b=X6t7n7LNG8VGESG4j+iFb6lJTzLr0TekGLRnxTYhqBOMlO8iMkHCkh8QtZJSO0U/QgUQgSnoAstCq4rIawi738w4ou/f5k6sKnVVDQoRi1ZeuaDUoKz1abCwBVJExpPeKJ4i7YW9C3zEQxTBQxw1E1+bJh4CECRMKLfItPDjvDUbmZ3sLqox/HOjXTJzjmT1yInYBu4gmFlUFjyQghQdU1CgpKXTuer855qo+ySvGiJUWsJfUlMI+mQ7Et94me21XP/wwppXwTd6gsbKhXXkPwAkfzov3BjwGb8xswbw5ijUgUIFubAVcdEaXj7gf2h8/EesYe1XVQhAb5pEk62PmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uryp0FBeOVB3D/UsJiltpcmedQ/Z3ksaraSj5aZ5Sjo=;
 b=gXs1rYn7s9Io/lV7EahCZPp9onAsgRvRLs7zxlkL/OIVCrmgNtv/S4xCRDkt4qYeGHkUWMXQByz+1wXX7VWGx76Ru2gEL35srPKOgoSD1yUU3RNpmWIAzD43v7SryNxjVM2tUBcoXltoGK94SDhZ+orQtb0pX0PCcMlvdQrMPfs=
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
Subject: [PATCH 0/3] automation: dom0less arm32 testing
Date: Mon, 13 Feb 2023 15:22:07 +0100
Message-ID: <20230213142210.11728-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B073:EE_|BN9PR12MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3d5da6-f5d3-4b62-23bb-08db0dcdb48c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	obwmYGB//Nw3u6tRirNOLwhfX03WwXVzDFMXtwoRd3mgAw8ontwbCi81gVGIQOr+gm4OhgJDgip/pLBY3VWpqnCubzN68J8T87NhZn/4C1JcSyGbi4HW7Ipqo/scQc8BTExHvkzFpmcON6MOcjzWCzxRq97IjES+C6GR4pTKuomByfw7nlTJrJmVFNjPpqGAyoA2BqjCV/Jm7DszEfJSHXWR3LNNJod7gR8DxARF3qQO6qHNdMrlLNVZhgyWgCeW1d8NKGi/gHxLc4EDzi1RqHZpX9mfqsut8bYvc59WaoX3NmUqITqeHGq/VC1f2lg3c1WX21i2XSGgw9UbF22uhAvjztXGyAbEBgoDbJU/zuDJkxNgeBl3asSxFrts4PA2/NSxH4mcK/ZWyHfSpErBOaGVwvXvWvQID8OzpxeS5shDYS82AecPy8lfYDzyxZGNU4GtBWe9JlESIi83LTdQwzH4VX7qcS66EhkhvaoXOg0PyFoOwxbyQ11ac9XcjhjZfiMK9YeWYIVeSgnWdYMdWmj48GUN6g96tz1ic5JjgRcZxFjmu3e63xk8JR6ZsaivI6wkAAoaa+l+4UrTpFvWvQAWCbGphFtPPFrSVyklcHm1oX9oXCA2eAhA50qOgBA0CAqnJYppzC1XHOOCfPjO3dV0UfjWBW9EbKcDJcIb7WlCQ661+od8wPPPKn36AaV2Eou0ISkgH2vd+/5nDSYzwC8Fkjy5CFikcNM6qdXkFEcS1DHjXzKIryWX4gP+38XAZ+blFh6i7r9sQMDOuoBGpA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(86362001)(40480700001)(36860700001)(82310400005)(81166007)(82740400003)(40460700003)(36756003)(4326008)(70586007)(70206006)(8676002)(356005)(41300700001)(316002)(54906003)(6916009)(4744005)(8936002)(5660300002)(2906002)(2616005)(44832011)(336012)(47076005)(426003)(478600001)(6666004)(26005)(186003)(1076003)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:22:15.0819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3d5da6-f5d3-4b62-23bb-08db0dcdb48c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B073.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5129

This patch series aims at improving the arm32 CI testing by introducing
the true dom0less-based tests that do not require dom0 with a toolstack.
It creates a foundation for further test expansion.

Michal Orzel (3):
  automation: Add arm32 dom0less testing
  automation: Add a static memory allocation test on arm32
  automation: Add a gzip compressed kernel image test on arm32

 automation/gitlab-ci/build.yaml               |  20 +++
 automation/gitlab-ci/test.yaml                |  48 +++++++
 .../scripts/qemu-smoke-dom0less-arm32.sh      | 119 ++++++++++++++++++
 3 files changed, 187 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-dom0less-arm32.sh

-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5426C6FF212
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 15:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533371.829994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5wX-0004dC-9q; Thu, 11 May 2023 13:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533371.829994; Thu, 11 May 2023 13:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5wX-0004an-60; Thu, 11 May 2023 13:02:49 +0000
Received: by outflank-mailman (input) for mailman id 533371;
 Thu, 11 May 2023 13:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/UO=BA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1px5wW-0004aL-7V
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 13:02:48 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fb5c0b5-effc-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 15:02:47 +0200 (CEST)
Received: from SJ0PR13CA0050.namprd13.prod.outlook.com (2603:10b6:a03:2c2::25)
 by SA3PR12MB9158.namprd12.prod.outlook.com (2603:10b6:806:380::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Thu, 11 May
 2023 13:02:27 +0000
Received: from DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2c2:cafe::e5) by SJ0PR13CA0050.outlook.office365.com
 (2603:10b6:a03:2c2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Thu, 11 May 2023 13:02:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT073.mail.protection.outlook.com (10.13.173.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.21 via Frontend Transport; Thu, 11 May 2023 13:02:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 08:02:25 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 11 May 2023 08:02:24 -0500
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
X-Inumbo-ID: 1fb5c0b5-effc-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1nAQtKBXuOd3xRIAzEjDsOoKJe6RQOE0deRKw+8r/ojZIsRPQyeVH+kM4DYNnDR57ygYqlZbWIqOzn22pJPfWS/ARVdIoG39hZNg7zsgMkqPO7bRo4+G1CN8P6JoQuCs5Zk8ENF8gQKrqIcwIZciw5uw0QsYy0OCYsAU4J9vjcNkNoaXCg7tshMjamodjk+rAA5BdjWQdjIuFHs09gOnZTJOJBQKHpG/x6T3LmCZ1SQQWCnYgZ8gbQwFoAQizkaO/VEAyq4Rd0exu4ttPdoLnsVWF3ti/h4UZXtnPpslB9VzQXFhCFDyMoik0IYToae8kdlhYJyMRLd6WK5cygf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bY1B3vA6JWcnz+nsPstgyoxa2lCfFZtRYM2UkDNGy0k=;
 b=e7JzJ1rWSZOr6D62TtkPoFh1RvROOjslZ2Wm/X6LzowAmwdV+oWkBE2vA3qWRL73yzsvcOm3nk91fZWPL+wq4+PlqdeQPgMv6s6I0R44k3hSlTGtgNodLAfwa3ba2M3UFNBAHvQV6Y20Z9d0uf2PrRIdlg9HmNdT4cdLHgBAxNHbbKpcr8ISJztsQ5GX4dhYAEZT9ZPwH+3jHBuER6P3+Gw4M+A+TYIq+px9z3j5MTyz6ByyFI5GVjL5rWSf/S8A2yy3+TXDhONs+9pUI/+K4Ao2FXZJw9FpVG85tcx7Lz7ZW23G8rlSuGdHcguGzURH682PrJw9w/1eQATg69gWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY1B3vA6JWcnz+nsPstgyoxa2lCfFZtRYM2UkDNGy0k=;
 b=ggWhYb5hk/8itS6EJmF9Lhgk7YHWZ/8ldsQbBp05HAh2aRt1d+I4m481Y+w7v0lfvWm3XEBCg7uVrI2NqvMD6gp5juX8afsuk0rJVXWgbzoQAIduXRTTV8G6xLVO6Icp5/qls0rmC3JO2p75kblRc23S5NhGCvODbobbTUPkVHs=
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
Subject: [PATCH v2 0/2] xen/arm: domain_build: map_{dt_}irq_to_domain() fixes
Date: Thu, 11 May 2023 15:02:16 +0200
Message-ID: <20230511130218.22606-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT073:EE_|SA3PR12MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fab323e-6a5a-444b-abcb-08db521ff81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uC2c0/WaKm+jiSqFHdvAWDH8llij7kMlNK/ZE6Nc41AyWn5QAPeR4clAQVGyc5OKtscmm5AeSrZ1wN9YDORJqneknUud1AqRGCm+5kGgh4IYO4yHSmwLCzbJAy84SuDTSX5NRkCdJ9zPnkBvSbstqgaBN7MA+2TdifMKIp3Y+Upeg+ifh2bU/spRZEjQlmc5xG72/oT/liEDKmXokkkafsbut8kWs+3/o22Al6Vh4JWRmJZg3caRZyteXBVgwSgkk57FFYWwy/0jPNqmuggx51LhqSpyQPzOknMzpCW2Lp7l3Qq5Gq7BPRA5xLj1fGs//7+HSwGRXXzmUq0XfNe/3f9k68SNIUVUaOlQWNmHqCZ0a6rthr+tm5u3m8mMhV6tfnuPKmX7Z4L78/yF1/YnL1/1w3kuUHrM3eyY2hz1DFAovX13035XuOEODMOS/+iMWLlCfORbr9q2rc1jdJrp8DVA7Vjx7w2ImtB6TvzC+kjhGsKl18rCAFZQmKQnJj0DnJ46+dNz+pWtpOriU36DNc6tSY5xVLHLFoIJy3/T6I58XBI5ZPCn9y2UGPtkQAb+zEvv0Czr4pTx71KtnkcZzPa7FpaSmbHeCZJwyPCfpR1rnxiDlTZkHGcPnddRxu8S93HAI54pJPHLagYaVe941L13Cafo0D4WGx/89tNSNMq0vYaQBso4//MiC/fq+9+9rmspPiNiAT4R4ne7flEPfFZuWUocLwr/+XzZho5cmSI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(336012)(40460700003)(426003)(83380400001)(2616005)(36860700001)(186003)(36756003)(82310400005)(86362001)(40480700001)(356005)(82740400003)(81166007)(2906002)(47076005)(316002)(8676002)(41300700001)(6666004)(4744005)(8936002)(54906003)(5660300002)(4326008)(70206006)(478600001)(6916009)(70586007)(26005)(1076003)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 13:02:26.1627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fab323e-6a5a-444b-abcb-08db521ff81f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9158

Propagate return code correctly + fix the format specifiers.

Michal Orzel (2):
  xen/arm: domain_build: Propagate return code of map_irq_to_domain()
  xen/arm: domain_build: Fix format specifiers in
    map_{dt_}irq_to_domain()

 xen/arch/arm/domain_build.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

-- 
2.25.1



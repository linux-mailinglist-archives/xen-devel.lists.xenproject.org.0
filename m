Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3614D7BB2B4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 09:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613259.953682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qofcr-0002e2-O3; Fri, 06 Oct 2023 07:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613259.953682; Fri, 06 Oct 2023 07:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qofcr-0002bU-KL; Fri, 06 Oct 2023 07:51:57 +0000
Received: by outflank-mailman (input) for mailman id 613259;
 Fri, 06 Oct 2023 07:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5b7L=FU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qofcq-0002bN-B1
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 07:51:56 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 364662e5-641d-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 09:51:53 +0200 (CEST)
Received: from MN2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:208:a8::43)
 by SJ0PR12MB8116.namprd12.prod.outlook.com (2603:10b6:a03:4ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Fri, 6 Oct
 2023 07:51:49 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:a8:cafe::a4) by MN2PR12CA0030.outlook.office365.com
 (2603:10b6:208:a8::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Fri, 6 Oct 2023 07:51:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 6 Oct 2023 07:51:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 02:51:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 6 Oct
 2023 02:51:47 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Fri, 6 Oct 2023 02:51:45 -0500
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
X-Inumbo-ID: 364662e5-641d-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYzzBlPoTmK8aeiwMseeDcoSInLgbo915CQbCvts4Z8miQO8F062c0P/rilCnAov5BYL/mqGGg98EdSs7wonjhPyqleIQaao/56JamwRmLFJOzW3/4VRw7m9U7CZDYm4JAvI9Ia6mHRkDEiVKimy8Nhj0SCYhqN3TyoTSw5bWq9T0/IV7mZc+7srHNl1dXA9YKflpyn0XQQAllle0XKiQtka1CmydNLMfIdQuZUjSA7UMNi+rxybD3xxTEZYxsxCefvuPjuI4QNjENuj/8NlrXYkEOGlD6gvVRaqIlNx0docU9unwn717ZaZ1b/3q3cfkJqRdC6WJ/bEkwii574W8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDcWG+emq8BoQntBuz9fj8sdUx56DafqqN4Oo8Y2L2o=;
 b=MtT9zCHdP2uaFw6qT7yN/9V/WnAc9RG5PQB/a39V81fCc0i28M13mV2EpOa6vFf+gCqjFFo8qqwX/pt19nsyQBNgNeyQyox1KV4MdXYUQQXqpZpP2bHYrUPqEFFPx4TmS+3100oe67QRCxUnknL+slkhrJ2wjIL+6/rS9KuzMXPu1UffH3FNt2s/R+nHDVeW+oCmYlxzM+O/ufAyYHUbuE8KLtEQryBbT50sTyESWZGHkB3lOVw6uiT9dQM2iD3fid8/SBa6zvNyX3AYJkoe+iFTA63V2JsxCD1Llc049I15kriHT/2jY5JbC4f2vA+DtT653XwI6TobPUpIWE0iBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDcWG+emq8BoQntBuz9fj8sdUx56DafqqN4Oo8Y2L2o=;
 b=Plw48e86ncU7FiCy6/n9zT5ULBjtvoUX3anQg0DAB5uHRMFAI4XQ540jBqEtVwboRH0ji0QBYx3B5OZnnqUdMlEJX1h7l1Lw7yhIV5SGSMsff4/capOOFNkDmrH2zdASpQPu9+P6moxvMkjcQdt07hktdfea4PyJIZQi5pXpmmY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, <Henry.Wang@arm.com>
Subject: [for-4.18][PATCH 0/2] xen: hypercalls doc update
Date: Fri, 6 Oct 2023 09:51:40 +0200
Message-ID: <20231006075142.9803-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|SJ0PR12MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b94a167-719c-48cb-a115-08dbc6411852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uSMM3slm7DibqGvqSoNSJaoVkuIm1uyisZXPO3cgDXg7/Iz8QBYNm+kYabYqrYqKFS88n79M7ehDjmH5NDbKkbshczBTE+BaAO2uexG8VSMb/IDSyFeg51fGLM7mtWLnd4gMFzAIig/lWVmaA7jY9PCJTNmtOPd/fxFBLkwEKN5WRZ2gRuqi597DRBETAZK5OE10x5s6n4XCUjLZx2oYCdMo2S3qQROxi2ynBULn7YPt8miE2OU7rOi2SYG72snwK4zmBMk8jNTRqK+/5JohAtuLQbtLl8PNhxdRQmjwjYsBoshCqacsQHuHW/xk27CHNRuiDSnV3yKRdXtb2duTVB5JHocSXZZhlDSILm3HmOILBEHHqAxOh34rJPjvleMknj9JiwMlFiDcH2emasP/wJGbaEdfL4n3N5BhiQsiNjlKCmtU6qtnugsJ1Zssvx1W/tymfspnCYZiMFWOl6iLVkjaBQE0vFRDVd2UYihKZrXhomOB6lR7DH86YFqqD9lQjbmYKn4M+gPcZ/0Tbzi/YvefUM21YhfcF5ytMxypR6lKkEwZ+1cmVR1aMDq2jKlvtbdnnVYbPTGzUauJbs040eStWPNf0XY9cvJ5h2bTH7FsHby/2/oc9tctsfF+swV5kRuoGGjkj5Gr1l8Atfz9oN7HgFMQQFXwGZhESQctF7R420GRwtv95DPM5bqSyayLK69PYcE0A0cjujRPlZiqI4s+q4HMwr1O34UPHJGUuxjgJaF8weAIYje62ZQWI4bpvZ2vp+1WDQvvcWmrnx7OBA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(82310400011)(1800799009)(64100799003)(186009)(451199024)(36840700001)(46966006)(40470700004)(4326008)(7416002)(40480700001)(2906002)(316002)(41300700001)(5660300002)(54906003)(6916009)(44832011)(70206006)(70586007)(4744005)(15650500001)(8676002)(40460700003)(36756003)(8936002)(36860700001)(2616005)(81166007)(47076005)(356005)(6666004)(82740400003)(83380400001)(336012)(426003)(86362001)(26005)(478600001)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 07:51:48.5830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b94a167-719c-48cb-a115-08dbc6411852
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8116

Update hypercalls related docs before the release to avoid confusion.

@Henry:
Updating docs has no risks and is beneficial for the users, so it would be
good to have it in 4.18.

Michal Orzel (2):
  x86: Clarify that up to 5 hypercall parameters are supported
  xen/public: arch-arm: Update list of supported hypercalls

 docs/guest-guide/x86/hypercall-abi.rst   |  8 ++++----
 xen/include/public/arch-arm.h            | 21 +++++++++++++++++++++
 xen/include/public/arch-x86/xen-x86_32.h |  2 +-
 xen/include/public/arch-x86/xen-x86_64.h |  2 +-
 4 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.25.1



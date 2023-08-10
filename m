Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D14778115
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 21:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582173.911786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUB6F-0003d4-Pk; Thu, 10 Aug 2023 19:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582173.911786; Thu, 10 Aug 2023 19:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUB6F-0003Zo-N4; Thu, 10 Aug 2023 19:13:35 +0000
Received: by outflank-mailman (input) for mailman id 582173;
 Thu, 10 Aug 2023 19:13:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFdC=D3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qUB6E-0003Ze-30
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 19:13:34 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcfebe1d-37b1-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 21:13:30 +0200 (CEST)
Received: from CY5PR15CA0219.namprd15.prod.outlook.com (2603:10b6:930:88::18)
 by BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 19:13:26 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:930:88:cafe::a) by CY5PR15CA0219.outlook.office365.com
 (2603:10b6:930:88::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 19:13:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.206) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Thu, 10 Aug 2023 19:13:25 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 14:13:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 12:13:24 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 10 Aug 2023 14:13:24 -0500
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
X-Inumbo-ID: fcfebe1d-37b1-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y08H5BOauLvq7pBlXvMs0+bChBLa2sexR/kI4Xx27Jo68wxoud+bL9MEtDdPGm18l7+rwlog9it5cLAYJc+gWIVXRGzCSzdrQqNoXU3xQKDojBIpQNSto3lD3ndVoXE598sOSRIv5ULC6SjBq/dByCKELOilyG7tdkZcZ4xZVYSHHZ55KETyGyPDsBfPrvrqBHhUi/Rtv+uKkISRXrQV4s6PooPyv+hlZJR+rcx+2QqDdR1bJ4+Cfz3Tek6MoZWc04ae/mEzc2UyUbii2UlJdV3N7z2CJyPVr9HtrNsXyZUTaBGOTAI/g7ogyCaF42EjWGivBMKpMj8VYU94rnYfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRNrOjRzH+p+vR5qGxvK+DfrbcxqF7sGm8KJMpyIBfM=;
 b=XCkv/7gIz46NiFAIM+btP5A+A/LD/O56mafsEHJqfFjh8jk3zQURb2oeWTf5iBT6H7dOcAlaozNLXU9PtvSuu1Plga2KHfCgvs8CPHuXRYvXs69VV+dZ8dO/B65Cgt9w9k9t8anZLXRyRx59LsQuleUOfPKoZ7CWrWr3qco7pxGU8ncKdEB4HnDVJyrRkTNGYVzoX3dsfqq66hXkNbZISp1SfDPY9diL9iOnkF0DlI9xbkJ0GO1q6YD2VUdiYKjZQcWvXZ7UicJCW5cUDzji3XNkA2szIyGklVLeYh39Lm4ROTMYRVZ0vee19Tf3KQvo9G8z0zb7ImnDfidD5xtiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRNrOjRzH+p+vR5qGxvK+DfrbcxqF7sGm8KJMpyIBfM=;
 b=JxtiPr8rDPZPOL+Ke+DSqQ+IC1U4oQIdodxIRPcIGyzWfE4rqQm89X9eRj4vn/FpGMhQKcKkY3gJcS1fFufnZBBvD2fLJq+d/wfdks1ei1i+sj2n2sne2Xgv8h25F/HA4Y9ISunbwn+HxS9a9BP0uws9vFBdjhgew3q/tFGgSQY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 0/3] vPCI capabilities filtering
Date: Thu, 10 Aug 2023 15:12:56 -0400
Message-ID: <20230810191312.644235-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|BL1PR12MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: 9829e620-2ad0-482b-cbd6-08db99d5df6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RYw01VGg91O9AVltpsTgXafe/iNMRnV/tz9nKuMR0ul4nMqzOobfHBKO/2JCD/Sgx027wLjTq2ecZlrq9aUcNZ7Rh/PUw2VCGKBYwjWAUAfjMUu/fTkcn2y8sEBmvONKpuCzuhRQLPxsnLDeAWU+72TyxvzAyXtPJxn/sZRg8cNtW4zgOgiKL4VdFa1yX1/sbClPsDh59DCZ4QVTuWU76LVI4L4jRb4sOhd79eK9MerA//oGyLg/2BB2vqhVXbkZxTMWmrUikkIdFDvbxlsn0yJKItYBcGmx43Xsg18a6vdpouTspbYyE/rzA+K+xmpJUnCQhlksrrtFC0f7o1CotQe9QAygwE763FKWxXx/LdTGWJn3VuiI/E/Ou4JXx87R7Uut8FizGuw2ZtKV7594GgFXFDzls7vb9U2cDcRXm0Rz6Sqh5KkCL9gmhItBMhZrNbEiZYIWtxNVq1ystBM6Ghzj7WGnsfo+hVK1lyAHMjAokQkBkOzLeJmbBXA4aFrwH1Z40H5TDs8CYP2RgxEOcGFGbRaGl6msbO3ippYo8fv9bB79HOeduZ2Isus/YdB9CClAG78b3T51scHAUeaot2OlFrkb/7JkSIpSF0iC2s32WvdlofqvpWEfLIP5SN1R7DK4pbzr2kDd10uyjxCz9wA4R/xdMtkVGz4LTUmubaAqqddscIVON6CuRL/fK0VU4Yby8Y7fOQpSFxgLPP4OlRao8wCIEhW+DyOmCD2BF6nq1So4I4srZFEpQwZ2XhQ47mo8hhrLqrwYFn0Inzgcfw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(82310400008)(1800799006)(186006)(451199021)(36840700001)(40470700004)(46966006)(478600001)(54906003)(81166007)(356005)(2616005)(70586007)(70206006)(336012)(6916009)(82740400003)(316002)(41300700001)(36756003)(6666004)(8936002)(8676002)(36860700001)(44832011)(4326008)(5660300002)(66899021)(40480700001)(83380400001)(1076003)(26005)(2906002)(966005)(47076005)(40460700003)(426003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 19:13:25.7561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9829e620-2ad0-482b-cbd6-08db99d5df6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5286

This small series enables vPCI to filter which PCI capabilites we expose to a
domU. This series adds vPCI register handlers within
xen/drivers/vpci/header.c:init_bars(), along with some supporting functions.

Note there are minor rebase conflicts with the in-progress vPCI series [1].
These conflicts fall into the category of functions and code being added
adjacent to one another, so are easily resolved. I did not identify any
dependency on the vPCI locking work, and the two series deal with different
aspects of emulating the PCI header.

Future work may involve adding handlers for more registers in the vPCI header,
such as STATUS, VID/DID, etc.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg01281.html

Stewart Hildebrand (3):
  xen/vpci: add vpci_hw_read8 helper
  xen/vpci: add vpci_read_val helper
  xen/vpci: header: filter PCI capabilities

 xen/drivers/vpci/header.c | 78 +++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c   | 12 ++++++
 xen/include/xen/vpci.h    |  5 +++
 3 files changed, 95 insertions(+)


base-commit: b70ffd23865e6c320fe2e8931f0d0366d7e03cac
-- 
2.41.0



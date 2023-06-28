Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC7740BB5
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 10:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556358.868820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQgx-0001dB-TO; Wed, 28 Jun 2023 08:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556358.868820; Wed, 28 Jun 2023 08:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQgx-0001ak-P8; Wed, 28 Jun 2023 08:38:23 +0000
Received: by outflank-mailman (input) for mailman id 556358;
 Wed, 28 Jun 2023 08:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJDg=CQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qEQgv-0001ae-AX
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 08:38:21 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f9dc448-158f-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 10:38:16 +0200 (CEST)
Received: from BN9PR03CA0721.namprd03.prod.outlook.com (2603:10b6:408:110::6)
 by PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Wed, 28 Jun
 2023 08:37:11 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::26) by BN9PR03CA0721.outlook.office365.com
 (2603:10b6:408:110::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.20 via Frontend
 Transport; Wed, 28 Jun 2023 08:37:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT104.mail.protection.outlook.com (10.13.177.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Wed, 28 Jun 2023 08:37:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 28 Jun
 2023 03:37:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 28 Jun
 2023 03:37:09 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Wed, 28 Jun 2023 03:37:07 -0500
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
X-Inumbo-ID: 1f9dc448-158f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZgt1ob4RSQ+hWP1uBK+YQUzf0exwGEafpcNBS0oNp60osuYzQo8hI2YRXDOTJVomG0TZqacc8j9uyexrdgGIro+lbaHg3gR2qvExDCTjcZ4JwqsvxgpzZGGNPsqP0fV1hGsApLUpz9LOkjyNAAA0PTRZVWGFU8imL39OPp1Yr/zz+D2vQ6RTKmGk0eMFq/ej9x/9wXkoPOkPJsndGNwO1J5TOnZj+w/ZCpSMXWJ1ZzcFXUwBZBxP8K0CaT9NIhGsI3+IRHHhwefigVPRpu31eZRUFq9s0YXe0agYB9z0BEnGX7uCgoX0cliF0Q8VEPghhLmuzAa4U5M5nj1isSp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAv1sXZBHR7pPNer3e1bTfvINX9ZNhIBLaSL2gGt88s=;
 b=mFeLtSCziXyPV4nYDal0oAPiVpBlNvpDD5i+asrIzzTFv9b0WhFDpI3jWmWqb59aFdBH0enXU0WgWm0OL283pubX1cJea0CPRLqieEeUFGPuMTqxJbnfjG87g7nQLhfUa8t8zU76SKIVyPYVxaXwWqydhMcK8zEh1p3EjibSBN0X0O0lmL3l+v+YGc/rtuyGC6NiXIny3zoWuTwWbdatZ29bWikE8GeUSjYXcJ7YJ1V7FtoVx0dnCbwDmUrGtZK0Iils9E2TCSc/lzFrhKsZX4pj+mkEoUXfxzQBB18mlDkrvwxcZ2WitbLIoHFbGSPZaTRvxT6ljQqKZoTN9aLl/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAv1sXZBHR7pPNer3e1bTfvINX9ZNhIBLaSL2gGt88s=;
 b=nWt9rxxXOa3ypd4bY9rGB1OtCFZ1X69dJewHmJygJ/M/3lwVYPgSDDCVhXVg5X1GgTv6J4iI87UbQhiS+YnMXkXcXz6NcepXXzKO1KSKV2nxi0VoxP8UATs/lIWsNcEciX4zeNvnnvh93Af2Q7kATZQM2THUqY5NywNVTF1cLv8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] docs/misra: rules: Remove incorrect deviation guidance
Date: Wed, 28 Jun 2023 10:37:01 +0200
Message-ID: <20230628083701.5489-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT104:EE_|PH0PR12MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b0c9fe-9ec7-41f9-f7a5-08db77b2dd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2RGsi/SmHZ0cUPuJPP1B5RXuAJGId2aqoHSi7Q2HYyZmTnyiNcQCe7cw0d/9jKeb79wywagDywP5GUDxrcSnoBrUCVpzM3ODu2yRVo4+fETuOtHvqvZyC7bjuVXuQUAnIhZVrjCXp0J3mMu6Oj9ctYOIGuGiPT+QKZd6vcuVCH8YphbSWfKnuO+3Sa5cc3xu+ipYOocS9gCv9mqC5caWPAexKrL6hl9Nii2WAjbZpICm4ygCr/H140QEAbKKg4O60ldCH41c0HGlvZ678hY2mOmFf9K2idD2HIVqQJ6ggrpPP1xlsrO8RICV9pBwhozvcpF8N4aWKVZhWh0LoL6XcBosioCVE+X7NTIKqiXHkeG8RbZMp9bptQsUy8GA26qZdTNL1an3aZuIZW7BjWejtbbT4IM/HhUxVUR9ncp5eLKTGfoG2TC+rzqJt++NX5oLWDzGgfsrTlEN/MmH7tiOQg+qlJNxGxpg3nxRuSty46z5EA27gYefpjkzZ+MBAsWr5atTKfXAECwONkRFOsFUC/F7b5iFwzocJzgmjSUK75ZBNVpRgAP6zfvTmG6IE7OU1BoEBb3otn4deXFSBN3JQYY/0cxawLNvmyrwYO6C9xMSLzAFIOAftC7iPpq9cg9yyq40rCxV+VkkpRUdwm3Ux4BhrHqvjrQ1naPGAdzaJc04spZZxV657v+hP8m6S2dzSpqgR7+MEz2BHJBzdG0h40V7nsdQDuv1kEimyVcScvYch5v1dcPasstXefXfRrrgtxXPivvJtfDeO5Rp8pfwOg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(36860700001)(478600001)(6666004)(83380400001)(2616005)(426003)(336012)(54906003)(1076003)(2906002)(186003)(47076005)(4744005)(26005)(70206006)(4326008)(86362001)(44832011)(41300700001)(356005)(36756003)(5660300002)(40460700003)(40480700001)(70586007)(81166007)(82740400003)(6916009)(316002)(8936002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 08:37:10.7410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b0c9fe-9ec7-41f9-f7a5-08db77b2dd8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888

It creates confusion since the new format of documenting violations can
be found in: docs/misra/documenting-violations.rst.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misra/rules.rst | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 11b9c42b70e6..6244598665e2 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -17,13 +17,8 @@ hypervisor.
 It is possible that in specific circumstances it is best not to follow a
 rule because it is not possible or because the alternative leads to
 better code quality. Those cases are called "deviations". They are
-permissible as long as they are documented as an in-code comment using
-the following format::
-
-    /*
-     * MISRA_DEV: Rule ID
-     * Justification text.
-     */
+permissible as long as they are documented. For details, please refer to
+docs/misra/documenting-violations.rst
 
 Other documentation mechanisms are work-in-progress.
 
-- 
2.25.1



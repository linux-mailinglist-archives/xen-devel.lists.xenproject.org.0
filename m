Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605606A979B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 13:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505984.778989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY4vD-0002MB-S5; Fri, 03 Mar 2023 12:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505984.778989; Fri, 03 Mar 2023 12:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY4vD-0002JF-NW; Fri, 03 Mar 2023 12:54:03 +0000
Received: by outflank-mailman (input) for mailman id 505984;
 Fri, 03 Mar 2023 12:54:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DvcW=63=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pY4vC-0002J8-Kj
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 12:54:02 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76f47935-b9c2-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 13:54:00 +0100 (CET)
Received: from BN9PR03CA0499.namprd03.prod.outlook.com (2603:10b6:408:130::24)
 by DS0PR12MB8564.namprd12.prod.outlook.com (2603:10b6:8:167::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 12:53:56 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::e9) by BN9PR03CA0499.outlook.office365.com
 (2603:10b6:408:130::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21 via Frontend
 Transport; Fri, 3 Mar 2023 12:53:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 12:53:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 06:53:55 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 06:53:55 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 3 Mar 2023 06:53:54 -0600
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
X-Inumbo-ID: 76f47935-b9c2-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMJ18OZ8OKViudsJpoieeXKu8H7TANddLkuMiEZIMKy10K3UuxSRhE85EfG1ZRxpJqmrGtFMotSbV7comNBAIyWpP39pRxlMfO7ydKIczXcPy2H2OTSrQ5oLs6ByWXZd50AEYrx1oDHpz00UKeSiwSdQRW6tXZrNomhEql/Jse+oO8WcTcvr3A4Jbnr+0a9AL7mh+glabhF/LAX+typgxiB/IGxIrNMDNBBynKbpth1CerMDz2DFJIkLwgpoaIACp+gus+j4JOUr5tLwoXAbVLUzzddX5bpIlICxtkQRIojOxqcXB8sBwfxYpylbQFoiLvV76YTxKJlhN/el62K+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzbBRJucnsol2Xi1ihRMZI1tMlBsoA8t76S/TPyzWJY=;
 b=HjifBhAHLgLUF5vKgkvFJuOtBuuptxJY+iL0s4s7cq8QvCeNqsW1fyUKyvvVTKPI5JPXZCVOCyEDVDRTX4OlOekuuiQO9ynMl26nVIxiO+20ek+7pih2x7Vc0ypjOcON7MF8pR51A+Vkj7FGTx2Oz+zHBrLIgrICcwPPhzr4ghqTIGuuJjDB3jJydFAr2RnQwuH+WcCHldmGQAOJ0AIS981JEYgfmvvwt9qnzI1O+GuBktfbI3fE/zkcwcKPCOYnIlC8d3GVn0QxiZnwP9+oNos6dCvwK6rXhvxHfgOq1z0jQdqalvhzDVbJ0UnzQ8Syr5ijJz71WE+AoLV+UTD0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzbBRJucnsol2Xi1ihRMZI1tMlBsoA8t76S/TPyzWJY=;
 b=bAhtdZqhTqE/leJg7qvkuYTJ56DqFr7IU5SZ/evyla7zOlYIZClVScCYbHUOGT/YpSbF8EF+bMz84sV0lauVN7zUpZvFw+n7C5j/4bOnx+sfKwlJ9LLnrpfddOQx55P0/b9YuwlVyPMZ+H9l97QfLORJsIDJLd/sP2xgs7Qq3TU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH] automation: Drop sles11sp4 dockerfile
Date: Fri, 3 Mar 2023 13:53:46 +0100
Message-ID: <20230303125346.20620-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT044:EE_|DS0PR12MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ae82a5-bcf3-4add-8e81-08db1be6599e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ot7w2zyMZMAqFG772n4GFt6Kod1OgGk9C79UaZ6MvMbsO/QrpbSHyO7/8VRaDgbn3ne/utAmguOiavVR7YRsvvZpqboZzjhthaz3b0gN6Vau74BrkX2sZwVCs5iwmU2Y933EgbMWHt4ZBA5fRx6o3+Bj54io+/tsuIxxUBt2YzSkrETWGrQk1cvBLQI/pRqEXQMGqKY12wyyI2pyGuxrD8BCdHVYFVIDOErzwRyE3delEPnpy+J/557MKJNaKcSSs8TvEZJ5C1pScQ+Z5mGi0OuS+ltw6SKXWxvJGqdCSYR1bdFNCBUcAhKS747GGEEKPWPR8lYXo7vRirLuMrGL62ftZ8iRQaWMYJlLQwFUSLiMUxCm2HUOTy8omOPf5NHKj3wsFi/rUQLrWy6cnq6rT9m8DhN+0OODhJ3qAwKZ6JmASjC/+MgFZgpEbsWfnhyuus138LdUC0+ReMz/ajEjcfqbGjkJm+246hJP40RKoPpBN2vQcpt4Ph4idlsvTBLFmuldhGkG4TpmsAe7o11AZ4kYHfirlbSDqX0ail3CRBtGM/WLsZ+35X1ZlwlpLvZcpeWiFJCDvVtBh3EgFZSAtI0JpLYG32RQ41fqrLVlP8KFYsGJsr/gsVrzL9VfENSRNVY5XL1N8q/I2ee92eBofposKjmq7GRoAVJiHQj2hloOkD0TZ/gMP+7zyR8HbMMzBASXQp+DUC5GUWiccYvuLLiUe+F8N+5bpCtf8osTV88=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(336012)(36860700001)(8936002)(84970400001)(26005)(1076003)(2616005)(6666004)(186003)(47076005)(426003)(478600001)(54906003)(83380400001)(41300700001)(316002)(4326008)(356005)(8676002)(6916009)(40480700001)(40460700003)(70206006)(70586007)(81166007)(82310400005)(86362001)(82740400003)(5660300002)(44832011)(2906002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 12:53:56.2579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ae82a5-bcf3-4add-8e81-08db1be6599e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8564

It has reached EOL and there are no jobs using it on any branch.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
We can also safely remove sles containers from registry.
---
 automation/build/suse/sles11sp4.dockerfile | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 automation/build/suse/sles11sp4.dockerfile

diff --git a/automation/build/suse/sles11sp4.dockerfile b/automation/build/suse/sles11sp4.dockerfile
deleted file mode 100644
index ff69a99afc71..000000000000
--- a/automation/build/suse/sles11sp4.dockerfile
+++ /dev/null
@@ -1,20 +0,0 @@
-FROM registry.gitlab.com/xen-project/xen/suse:sles11sp4-base
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# Nothing else is needed -- base image already contain everything.
-
-# Note:
-#
-# SLES11 SP4 runs pre-2.13 glibc, which requires vsyscall support.  Most
-# distros nowadays disable vsyscall. To run this container, the host needs to
-# have vsyscall=emulate in its kernel command line.
-#
-# Due to various issues in SLES11 SP4, you might want to disable building
-# certain components. Known *not bulding* components include OVMF, SEABIOS
-# and upstream QEMU.
-- 
2.25.1



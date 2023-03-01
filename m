Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3A6A6977
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503889.776271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIQQ-0004m1-7V; Wed, 01 Mar 2023 09:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503889.776271; Wed, 01 Mar 2023 09:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIQQ-0004ix-4W; Wed, 01 Mar 2023 09:07:02 +0000
Received: by outflank-mailman (input) for mailman id 503889;
 Wed, 01 Mar 2023 09:07:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idmm=6Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pXIQO-0004iY-4g
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:07:00 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68970ca9-b810-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 10:06:54 +0100 (CET)
Received: from DS7PR03CA0081.namprd03.prod.outlook.com (2603:10b6:5:3bb::26)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 09:06:51 +0000
Received: from DS1PEPF0000E64E.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::c3) by DS7PR03CA0081.outlook.office365.com
 (2603:10b6:5:3bb::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Wed, 1 Mar 2023 09:06:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E64E.mail.protection.outlook.com (10.167.18.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.12 via Frontend Transport; Wed, 1 Mar 2023 09:06:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Mar
 2023 03:06:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Mar
 2023 01:06:48 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 1 Mar 2023 03:06:47 -0600
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
X-Inumbo-ID: 68970ca9-b810-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ccn1mBAIdFxXQ0N/jZlJpzmRj/kxzgATunyvifU/DMEKdghpM5f4pVlvvS44O7l1zPiobuPC8A40ePgNXAcSbFRdqz0SubThEive5vti7zOOwB2tH6CgBSO6yN0zhAmCA0Lhf9W62iKNu/DeoMC4BzLYXCFC7a7fBh4dO4Z6CkM14odKD/MmI/vHoqlyx+UAfey9kBesaTkrRVU7T26+kTcSHLxlV65TuxBfwW7z6cXLpv+milQufJC233Rq0RBMfyscK/KG+cGXhyXZQKgP145FH+t7ot/An2ZP4K8r6PUbeDnxD/U8suC1v5L1/e7D9pf99xsqe9m4b53snhxLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNzotBiqNXcBqDEI4ApmK0dfHEIQW4U2qjSz+XmUtEk=;
 b=Z8wuDZCqrGP0Y8hbYBuo9bD9pdPSALdiv5IahWx8sQm0Kn6rkC7/yyoBIsp2jTUkcZ/tikbgDCrtB2IOTzDTyKcM35Lo86w3WL6aBAMh+XBvRwkzRe5SpyuIrJOD3QUBaS9Pr2NHdCiWLveJN7DJgyYHEgX8IU3B2POTcCAqvMSJ+FzJ/W04V7hzg7Ae812ZJcNyNoET98OuhR8/3QRAE4u25DL85S34cSf0oicZxcWXoY8TKc0QYoOMLo+Ht6VthiqD0+evdTT3ZJqHyx6zieQTalh72Uv61Bz60LEmz5UWPLcW7WzfOT0ZSawmxZVnmJ0CadecoP6O+RkHZinykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNzotBiqNXcBqDEI4ApmK0dfHEIQW4U2qjSz+XmUtEk=;
 b=4jW3btxtJsZeOuHAm4zKAzwgCwZyYKCBKBkQ+w+3srW01zgzCw6boR6D9+yIY7ZR/ScIxwRCnQm173KpqT9CC2f3GlB8EC2clNt7EVnnFkW9UDSKTdqEBkynOU8SPyPtH08Wg5LDuLgE+o1wCYqDMIlGMBYG6ybPolY98GY1btc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] automation: Add missing and drop obsoleted aliases from containerize
Date: Wed, 1 Mar 2023 10:06:44 +0100
Message-ID: <20230301090644.4452-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64E:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f0b54a-422d-4299-cca0-08db1a344b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SwdlKTnPSZ6vWtYilPMrRJjykC+C9kQYULjMq+EvDfldFxNr7ytqONYTyrfV5etlyqf7Xh04kjMtYmcsVB/h4K/clUQ7TpE0RDgWl0b6wcGHP0Nr21afCLzgx2pdTZ0QyrZfQc31HpyEYGmQFE0/eTQo6fhbZkPJinK3mhAszXg7xIPXtxKsXhFWGwjBfnyHqgng9O81tj3pv1Vcy7XepOn7YLuG1aEfIH1VrB5o3DJeFZcrtrGJOgVH5GZmCEQah+FyCmFYywCLMgLOZNOhR7BofBuNz+KTceIJDVXZzh8ibPjW1ellk9vWaSBsB/MYV//7BgUqcHZm0F0/1c5ukDcn/dJiJqQt5QPYhuSjHu3ChB3qDOPxvLmouy8Ezg+CpO1NslQzVdCUAvlk54xST/IIkU9jTAM6nakqhO1hpUOGGHpH1AAEp7vl7uoIsSqg5hNC70590U6bUer1c3jizMdBtyUapogmq9tqFzVtJ0jWidTvLta0P5RR2uH81qHDVBBp4LkjU1SEwRyyMChZiMCpXXWIJUQIS0rrdWgPU2zACs5Mj4/ZEJ3Wjqi97aJxtKHiANVIQMcIFO4TbC8GsmUoFW/QKdmQh50Sb4bKnBmZWR7JAzb50dEHcz6QVKh1/6fCDGr6Xyo7LaVjTz+ezduZo19s7Leaw+v9GDwboB4DqV3lDg0mdwQ8w3xoXbdOw5yP52Tio+6EBn9VOATUW2+ZM/jOJ/TFt6BY1ar0KeM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(356005)(36860700001)(81166007)(82740400003)(8676002)(6916009)(36756003)(86362001)(40480700001)(2906002)(44832011)(41300700001)(5660300002)(8936002)(4326008)(82310400005)(70206006)(70586007)(40460700003)(2616005)(1076003)(186003)(336012)(83380400001)(426003)(47076005)(26005)(478600001)(316002)(54906003)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:06:51.0511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f0b54a-422d-4299-cca0-08db1a344b97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E64E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772

Add missing aliases for:
 - debian:unstable-cppcheck
 - debian:unstable-arm64v8-arm32-gcc
 - ubuntu:bionic

Remove aliases for no longer used containers:
 - centos:7.2
 - debian:unstable-arm32-gcc

Modify docs to refer to CentOS 7 instead of 7.2 not to create confusion.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Open questions related to the CI cleanup (@Andrew, @Anthony):
 - Why do we keep suse:sles11sp4 dockerfile?
 - Why do we keep jessie dockefiles?
---
 automation/build/README.md      | 4 ++--
 automation/scripts/containerize | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/automation/build/README.md b/automation/build/README.md
index 4cc1acb6b41c..2d07cafe0eaa 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -44,10 +44,10 @@ understands.
   DOCKER_CMD=podman ./automation/scripts/containerize make
   ```
 
-- CONTAINER: This overrides the container to use. For CentOS 7.2, use:
+- CONTAINER: This overrides the container to use. For CentOS 7, use:
 
   ```
-  CONTAINER=centos72 ./automation/scripts/containerize make
+  CONTAINER=centos7 ./automation/scripts/containerize make
   ```
 
 - CONTAINER_PATH: This overrides the path that will be available under the
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 9b1a302d0565..5476ff0ea10d 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -29,7 +29,6 @@ case "_${CONTAINER}" in
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
     _riscv64) CONTAINER="${BASE}/archlinux:current-riscv64" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
-    _centos72) CONTAINER="${BASE}/centos:7.2" ;;
     _fedora) CONTAINER="${BASE}/fedora:29";;
     _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _jessie) CONTAINER="${BASE}/debian:jessie" ;;
@@ -39,8 +38,10 @@ case "_${CONTAINER}" in
     _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
     _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
     _unstable-i386) CONTAINER="${BASE}/debian:unstable-i386" ;;
-    _unstable-arm32-gcc) CONTAINER="${BASE}/debian:unstable-arm32-gcc" ;;
+    _unstable-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:unstable-arm64v8-arm32-gcc" ;;
     _unstable-arm64v8) CONTAINER="${BASE}/debian:unstable-arm64v8" ;;
+    _unstable-cppcheck) CONTAINER="${BASE}/debian:unstable-cppcheck" ;;
+    _bionic) CONTAINER="${BASE}/ubuntu:bionic" ;;
     _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/suse:opensuse-leap" ;;
-- 
2.25.1



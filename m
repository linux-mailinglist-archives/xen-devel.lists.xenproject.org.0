Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA84294DB2D
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2024 09:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775038.1185415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scg4f-0007gm-Pf; Sat, 10 Aug 2024 06:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775038.1185415; Sat, 10 Aug 2024 06:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scg4f-0007c8-L7; Sat, 10 Aug 2024 06:59:37 +0000
Received: by outflank-mailman (input) for mailman id 775038;
 Sat, 10 Aug 2024 06:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jkHu=PJ=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1scg4e-0007ZQ-Iy
 for xen-devel@lists.xenproject.org; Sat, 10 Aug 2024 06:59:36 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18ef3b80-56e6-11ef-8776-851b0ebba9a2;
 Sat, 10 Aug 2024 08:59:33 +0200 (CEST)
Received: from CH5PR05CA0020.namprd05.prod.outlook.com (2603:10b6:610:1f0::13)
 by SJ0PR12MB5664.namprd12.prod.outlook.com (2603:10b6:a03:42b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Sat, 10 Aug
 2024 06:59:28 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::10) by CH5PR05CA0020.outlook.office365.com
 (2603:10b6:610:1f0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.10 via Frontend
 Transport; Sat, 10 Aug 2024 06:59:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Sat, 10 Aug 2024 06:59:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 10 Aug
 2024 01:59:25 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 10 Aug 2024 01:59:24 -0500
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
X-Inumbo-ID: 18ef3b80-56e6-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V95WD4fjCFUM2vHV58SzfkMRhSegNnjut6c1Alkgk6xJo/daxOuAT2KChAapfofaaQduOoM7Pnd8DzESQx0Y3t0piaU5/BKhzH0927ptSV04ApIyefkffsprifVa++KGHDRJkehzAW6vijpgPiz6njcqmjOWBDOSVC4ydUyfjghPgqDn1HS8cuyZCqmYBR0tSY0JGkXftxE0mcqKYgLTOxUYH8CyuPzblLA68rkbPjkv5SUanAP9LqGuPdb0V0tIeHX5+qgLhOC5tbOHlXIPenBSJ1o8N8iwF9U98KhnM/hOuCRPzC3ymUTgxP5qCEXZRDELT4oJ6GtUKUoSbUS90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhV9SNmCmqV3CEmvdRVQ2xzdM7v4lWF5RK7xW812IoI=;
 b=L59SnjZJvwsRS+AAU80GOeNRUIrooBTouNZDaxPElGaDRJBaG1N7Dgo2Q5mxqBl/fcm9Ftu+h6cCF6F09LK0LetXkhVKHyFbZFHDmybd43DC7xllKvgyw4YWWzBvTwV7nC8h8J/N0+cWGuz18nfQtk/3Xcu5yDwAB5RWg9rSlUMeqU5dbGyPlSEsOHR8TVEuhFrAey1VJQQdI2ld9xbyyIQRtE6rYITv35zK8et87SZ3/j4lgMKRRkIQkXZyyfPooxOtZOAkJyBDVqe8ECqnVYGTCp2tYKLMwrpeb2TNLZ+Yx+pejNPbYMa1Pz5m7xIJK1aykdEiHKLksSfjmnaLpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhV9SNmCmqV3CEmvdRVQ2xzdM7v4lWF5RK7xW812IoI=;
 b=tWqb73wuDp4OQJWIgSwr1Rp7B7jX8yQmRpnwsThZnYSYKBeLPZHS7TWV33401msWZPV3hr+v0MuVCJDYUxTYD6PlkozCxV72mWVR/IcLW3LeUFJq/qRzya/X8p6OqW+ksh0hnXTtAKEeCXDdUCw2aKQxixCwMdUvNQ9ZS2wIMrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <cardoe@cardoe.com>, <michal.orzel@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 2/3] automation: add "expect" to containers used to run QEMU tests
Date: Fri, 9 Aug 2024 23:59:19 -0700
Message-ID: <20240810065920.415345-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SJ0PR12MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a1acdd-c34c-4d1f-7016-08dcb909fa0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EnQJJHPsar1JFgEtABVsjoD+xShwbl3LiA5/3+sbQhbBMcX84AgwbygmeU2S?=
 =?us-ascii?Q?l0l2WNZRHHBFo6VcNygNakAt00wNSzZbROA/XIQzQvfm5Lpa33v0HP3q/7/J?=
 =?us-ascii?Q?ZYpdst+r5Rd5SQ5sNPOpb1jnaVkgZm73KeE9yt5ibb8q6ccOkXyXM83NzuAK?=
 =?us-ascii?Q?qb+ALbEkPu20R8meSme/Qh4FLPzemTaXZRAES4RaI9w35clX4TPwEYlGC9JR?=
 =?us-ascii?Q?6y5P8B/sKfLZcM1IxGbmH2f+52n6PE/Pol2BjdFxP+yfshF7oscaCQ+Mj3yW?=
 =?us-ascii?Q?Z5+zsuM41lrq4OUent57JpJsQE9pDLaZC3fRLYEGmTR2Xxd7Dr9KHko7uel4?=
 =?us-ascii?Q?HBcCF4GCRnkC+oqJ/HWugwkR5q7EvIxlO5D6az7RgRpTAPLp1xsgzyOb2f/g?=
 =?us-ascii?Q?gTDQZxOCp66mMennaPzDhwH+Dnutw+X6FOc0rqqY+rdKbglseEqmCi/2Seux?=
 =?us-ascii?Q?FzqyLYD/MPP0NbdnlmEva9vSEgcDORsBDnHvJ0qKAbKrpRb+ibYjyQkAtFrw?=
 =?us-ascii?Q?6OismDVoNpzv+fm06aMn2hVRra9K6r2yRy9ZApdTv9+U+8eNqQD8+y0QXnwn?=
 =?us-ascii?Q?AgkmgqBuI3xNsvp8lhavLoN0KCwFTJfIuKz4HlFBstoxbGxw4F4vSC7YuPPm?=
 =?us-ascii?Q?vi7dHQH4rq0/DtfJz8sDCYqpfnG+K1NTUAudNMaMzv2UIljqDwe97k61IOoV?=
 =?us-ascii?Q?yH//TanOeDTs8wnT6/qg47mKsvhvaycsTMN6Qoeez36WY126A67S7O8AFDp5?=
 =?us-ascii?Q?IrMTJdWqR/NHDNe08r0TpBwnE+hFONJXsjgdWKX+j+oPoH0hcnGmz4qI1f7k?=
 =?us-ascii?Q?+JvI4TCq5OiZPs/SJkeZR/3yQygUNkXIZZ8uk7+e8UG0yyyRu7ld6sp7wuxZ?=
 =?us-ascii?Q?EEVYth0K5rI5o/zSin/7NkqEYP/qxcPn+J7QMT/uUybNxxbuz1W63PxtDAMv?=
 =?us-ascii?Q?i5KUmz4uzEqctnMbpCzyGBhR78zSqreRSmvfus3SxzthKE9w6w7AOUuvej1H?=
 =?us-ascii?Q?AvbNyYWXT9EzuGk/yLFIqG5b/TDEAO57DfOWJ8L8w7SjSom2WsKQfRDqz5jN?=
 =?us-ascii?Q?VM+Wd7vpBl+yxjlZlgkdKkiBUo4EMlDFyNtuFoGTq35Ygw6sb17ru4LtS3Xa?=
 =?us-ascii?Q?A9LoXWUAUHGie33mGjMreS6Cl+oxZeqHZbhbZdgAjrE/+frdP7AZa5Pg6SnL?=
 =?us-ascii?Q?zCLoDFaGoJEzkriF3duu79aulvuF7spDq/E91NO3bOoAOWg0GplEu1hwuY2h?=
 =?us-ascii?Q?b+wACbnmiR2Yl3CzC9KDn6G4Qg+ilcGv+VaykKrok8zUl98emwhSfquRr+EI?=
 =?us-ascii?Q?LwL8pbM8mOxIbAAet/8jjVDJXSnoMHUFNlO0tjTuQXeaC9drgooe2EvG9n61?=
 =?us-ascii?Q?WyCjhZZtgmHdCH1HorMptkxk2XWJVyb7p08gvvw9RjxmeDszaqV0/l/k19zi?=
 =?us-ascii?Q?4nLssmzVzZrJJFy0qqgsDTIMTcRM49Eg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 06:59:28.0146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a1acdd-c34c-4d1f-7016-08dcb909fa0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5664

It will be used for QEMU tests.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/build/debian/12-ppc64le.dockerfile       | 1 +
 automation/build/debian/12-riscv64.dockerfile       | 1 +
 automation/build/debian/bookworm-arm64v8.dockerfile | 1 +
 automation/build/debian/bookworm.dockerfile         | 1 +
 4 files changed, 4 insertions(+)

diff --git a/automation/build/debian/12-ppc64le.dockerfile b/automation/build/debian/12-ppc64le.dockerfile
index 3b311e675e..1d5b486bb4 100644
--- a/automation/build/debian/12-ppc64le.dockerfile
+++ b/automation/build/debian/12-ppc64le.dockerfile
@@ -26,6 +26,7 @@ RUN <<EOF
 
         # Qemu for test phase
         qemu-system-ppc
+        expect
     )
 
     apt-get -y --no-install-recommends install "${DEPS[@]}"
diff --git a/automation/build/debian/12-riscv64.dockerfile b/automation/build/debian/12-riscv64.dockerfile
index 03fd4b0305..8d7233d675 100644
--- a/automation/build/debian/12-riscv64.dockerfile
+++ b/automation/build/debian/12-riscv64.dockerfile
@@ -26,6 +26,7 @@ RUN <<EOF
 
         # Qemu for test phase
         qemu-system-riscv64
+        expect
     )
 
     apt-get -y --no-install-recommends install "${DEPS[@]}"
diff --git a/automation/build/debian/bookworm-arm64v8.dockerfile b/automation/build/debian/bookworm-arm64v8.dockerfile
index 11acc07bff..da8ae75125 100644
--- a/automation/build/debian/bookworm-arm64v8.dockerfile
+++ b/automation/build/debian/bookworm-arm64v8.dockerfile
@@ -48,6 +48,7 @@ RUN apt-get update && \
         curl \
         cpio \
         busybox-static \
+        expect \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
index db866fde30..3dd70cb6b2 100644
--- a/automation/build/debian/bookworm.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -45,6 +45,7 @@ RUN apt-get update && \
         golang \
         # for test phase, qemu-smoke-* jobs
         qemu-system-x86 \
+        expect \
         # for test phase, qemu-alpine-* jobs
         cpio \
         busybox-static \
-- 
2.25.1



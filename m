Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52028ADD786
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 18:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018374.1395279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRZR3-0007Qo-C0; Tue, 17 Jun 2025 16:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018374.1395279; Tue, 17 Jun 2025 16:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRZR3-0007Oi-9L; Tue, 17 Jun 2025 16:45:21 +0000
Received: by outflank-mailman (input) for mailman id 1018374;
 Tue, 17 Jun 2025 16:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZiF2=ZA=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uRZR2-0007Oc-Lg
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 16:45:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2009::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72c5d71a-4b9a-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 18:45:18 +0200 (CEST)
Received: from PH7P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::29)
 by BN7PPF28614436A.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 16:45:13 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::32) by PH7P221CA0012.outlook.office365.com
 (2603:10b6:510:32a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.30 via Frontend Transport; Tue,
 17 Jun 2025 16:45:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 16:45:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 11:45:08 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 11:45:07 -0500
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
X-Inumbo-ID: 72c5d71a-4b9a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scrrEFDC7mhkoUDHz5fjKTr/QcYHlktVMlwtolK/6ZQmDO9P+vNjKnAevwxokdPkPAMjwdxJWy2pZ+/+jdK8NrLxf2+41nVKllKInXNfUXuzVKtTl3lHV8VrMVLssweHZbinFHeN4gzNpiJe/8uqk+5toCtYr9BLd9j2slw4Dg9KLHZTdq/9AE4G7XXQY9+ekeGthHtSNOHeZoLQLqB0/nw6zlfzbCwAnL9iSB8egqzDcDsf44Kec9tojr7XKFKd4VAuPSr847A+bJFEZMVv5+gTDFggdzYj0Dux1lx21WkafLU0p8D+jVm0Q6RYk+hSPDQlGScxhfb67JrWFhfk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0QV8ndC6NFKGSOtPHxZFmAQtmqwxkUGIhEfBRv68F4=;
 b=JVsPWKBpE5WZ3X7t6Smn3Yagp+AIQWpqTcClsZPHjfYOb/8SbrxgFSGX/tQWdGqoSFzSLReCCxxbXHws558IJWASUBBVFNkf3bvgvNQ+ctcclqvJIUL7v5xWCX0KgrcB+wshWK1uyVopafwa8RfN1BhplEz2ZC3qVy3NP9Gs/QNBVMquX1+lywZLwaEYyvJw/bSnb4LVU1anl+obR6aYBSgs7PU/TIcVmnGE0fTwYnREIq4D66bcOaJRMld1B7NTLW6Oklu9X6Cph/zMqDrJTbaYysX970s1V3PTpL9TKI/RI6j4E0pp6uitpF3jdAcu1Xu+c984I7Zx1GAdTe25Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0QV8ndC6NFKGSOtPHxZFmAQtmqwxkUGIhEfBRv68F4=;
 b=IXaPOutaHXLV3GuXnhcvSHYXOlAVjzjK+nOM1+NvUwub00OMGPYR8C7iuB8+Ol9r7KouWeQVA31rZ71lgtIpr/s/YqZ4aN2K6ET+IcQ/tfU1zy7gkWjuzgkr9G9vNngtOUorBTM1XSslfXKOc9UsKjfH/Z5E52sWGJ4En5ISmSE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: disable terminal echo in xilinx test scripts
Date: Tue, 17 Jun 2025 09:44:49 -0700
Message-ID: <20250617164449.3925765-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|BN7PPF28614436A:EE_
X-MS-Office365-Filtering-Correlation-Id: e741fa61-40f3-4a44-82ee-08ddadbe53e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ROE5mg/6ESEycPQ+G9y9G9hsTHXfGvyLk4naoisIa1yotCXzeSgeQhW0FJhR?=
 =?us-ascii?Q?BCdJGyh7kbgYdnVP2ufbqtEq9uOD2Z8o5lSR+dl0qGPUB8lumusw245cEjmW?=
 =?us-ascii?Q?fcvGivJeM8k1DOsKCtbeiFrw3H82vKR9fZ+qmdkhZW3JBCE0J9hka4GIwUqv?=
 =?us-ascii?Q?p5zyBOz733g2GBQsStnn5A7osNJbW/bvpe79h0Jgg1Q2bVQSJdXJCo3n3cPt?=
 =?us-ascii?Q?JsUJ7XUfOpicOlYlAK37072bbNQeZSElAD2Rc2tqJAx9xuwxmcLcCNwoV5vu?=
 =?us-ascii?Q?NGgr1L7Ozxty3LhnoSHhrs2hkqXkzszZwhNC89nQwD7yMbiPrQ2ON+23ZDBx?=
 =?us-ascii?Q?X1Zfsy5Hj17yFrnCyexzACQTRIQ6WOWTiAw+PW4VWzTvsMLKII8QZEV0DC3E?=
 =?us-ascii?Q?hacjLvFkupzorzq7cEZN8FJ8ZJjYu1/AcR2y4i7qKO7PqKG/pZjPr4+tJ9iJ?=
 =?us-ascii?Q?BB96Y2zDhgYJSgvq892C1qGYg+5ry9bUZQdFsN5aq9yxgUsZnZvt8ko4ewUq?=
 =?us-ascii?Q?muwT5PjwCAvaPPiOFx28Z6Rvp3BWyUId74iFq2onbInvUaeh95eFDHkRQ0jl?=
 =?us-ascii?Q?R/aZ2Foe5pI+gGdLjobZGxN9pQGVrp6nES2pawBaIoDx0kbUSlDRQvyBSKWo?=
 =?us-ascii?Q?d44lOzE9DxfCfq4UcYV540W3qXGAsLZuEz5U4fkDVzOiubWmdG6zSjj47rrX?=
 =?us-ascii?Q?k9X/PP5CsNk/2lQftSpDALhjLuS+FEcd4EXB3K7XEZdIj1eJJ9DMIHO8K0l+?=
 =?us-ascii?Q?d4C20crBy/y/omIInIlFo8SuzK8X26RgvzhFltpfOnFJkZXo5wWoZ1R/4gAz?=
 =?us-ascii?Q?YN1wqviNkHTvZexgpdfYhndkLmyccu8PFAczxn6CeCRPF8JgjVeXXZk62uPQ?=
 =?us-ascii?Q?Fh76boLBooGXbIory9BjvkLRuZIp3+60J3VoYBvu1IwL4VWybHDmKsldifw5?=
 =?us-ascii?Q?T3ITOJV7+ID3Z6vqQhUj6UzVHsTk2cK6xrcU/dH8DolsyAphnOxI8pZ8gmsX?=
 =?us-ascii?Q?e7eJDEs7VtT3DtXXQtUIHFQ3b61lW78MwOaBDF/Q9YqNvrs292SqZvjd3S48?=
 =?us-ascii?Q?Cj/k5wrICcdDNga1BZ14cGQg3CXRk+ra6k04sc1ts/bdK0PJbh4NKEBsYegn?=
 =?us-ascii?Q?UzHu9qgxk7o7nvbpaSDkGXZ5Po5DomwbMOpftw0sPIEjlT+jF0op5fhHgOz+?=
 =?us-ascii?Q?JSwnRQq4fH8AF+Z+smESLhN5djCiLxZVMGShoq7QyTKScEPiOJ2u1gwLXvqN?=
 =?us-ascii?Q?eAmt0ggPHdsKKldfC16wG/3NDp6AjNwd96Kv5sy0nv/h1Ch0+FWSSEe/HotF?=
 =?us-ascii?Q?6aXy53/ocXr7UlYM1RVP9imyEIhyEwVyv6OwNMUTGcaseFRL1ZpKgdU27bPJ?=
 =?us-ascii?Q?TUowXToquCLzNKK0rVmWBLxprccfIFgjXYvvwaSCM+LJKrsUrzhVzUhcJi9g?=
 =?us-ascii?Q?g5Mnh/B83H3V0vZFfIyHAzFQCRaaL0OY+4g4Et0rKWYpLjjZnKijqE/UgbVN?=
 =?us-ascii?Q?GNv9e0GDsk6mLbcQO7Griv1xNr4QAMIXXTqd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 16:45:11.8415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e741fa61-40f3-4a44-82ee-08ddadbe53e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF28614436A

From: Victor Lira <victorm.lira@amd.com>

The default terminal settings in Linux will enable echo which interferes with
these tests. Set the value in the script to avoid failure caused by a settings
reset.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 2 +-
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 71cdb295b2..6970a8658d 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -165,7 +165,7 @@ sleep 5
 sh /scratch/gitlab-runner/${TEST_BOARD}.sh 1
 sleep 5
 set +e
-stty -F ${SERIAL_DEV} 57600
+stty -F ${SERIAL_DEV} 57600 -echo

 # Capture test result and power off board before exiting.
 export PASSED="${PASS_MSG}"
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 293232eebf..1d7162f1b3 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -128,7 +128,7 @@ cd $START
 # connect to serial
 SERIAL_DEV="/dev/serial/zynq"
 set +e
-stty -F ${SERIAL_DEV} 115200
+stty -F ${SERIAL_DEV} 115200 -echo

 # Capture test result and power off board before exiting.
 export PASSED="${passed}"
--
2.34.1


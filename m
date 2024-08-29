Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93C965301
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 00:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786136.1195680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjnjG-00036B-Fd; Thu, 29 Aug 2024 22:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786136.1195680; Thu, 29 Aug 2024 22:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjnjG-00033V-CU; Thu, 29 Aug 2024 22:34:58 +0000
Received: by outflank-mailman (input) for mailman id 786136;
 Thu, 29 Aug 2024 22:34:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N580=P4=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sjnjE-000330-FS
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 22:34:56 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20627.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8b95f59-6656-11ef-99a0-01e77a169b0f;
 Fri, 30 Aug 2024 00:34:54 +0200 (CEST)
Received: from SA0PR11CA0201.namprd11.prod.outlook.com (2603:10b6:806:1bc::26)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 22:34:47 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:1bc:cafe::4f) by SA0PR11CA0201.outlook.office365.com
 (2603:10b6:806:1bc::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Thu, 29 Aug 2024 22:34:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 22:34:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 17:34:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 17:34:45 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 29 Aug 2024 17:34:44 -0500
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
X-Inumbo-ID: e8b95f59-6656-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iy9pa/B4RtQH+pJnJvocQdzo6x6PA+eZRU9SC2j6IdOgqRZXZ5jcJzrJlvK+R7292GOmToqo20mvbnfNP3r8mmTBf8otuL0g3BdVcZRe0iWpveQNjKCxmdk8KvHZZ+rVeMJLNxWkFx0dKEZ/ttU8GUOyEa80pwPQETMsNRGFgs1HXBg34emAgueC7ksBeu0+8IGTlTMn2fxeUGKBeAgSMOo2wki1/FShVwcSMJf0OF7/KNwgi+iFUgjtBj88SaunLTyTk/UTlNXB6uU3hZ5ATtlKAdhYnDMhlwVCSe1NvQOXyE13ioYKZSxZ+lA5d0VAxBPOwWWyyDEKUneOIMP0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1jgTNWGwPI6xz2FmLlpvUZAIaWeP7Yy8H0GhG+UJYc=;
 b=Xe1Z3YR6KkwLeFZvJiquEPqp/qBZugLgQkVZn1ab9l/vG+q3c2ViPKVe8z1FWd7Y8zrk/EgKr2lPvgS5Jx+giKnlnDOhf5u2L3RSgYuS1eMPVJq92fcZWmV2bAQmGhzA46Pa1mVzJikqSOn+VkrrdFlG8aZZb1j8rbnTWf2zUg7LQ5qBezYfSpR9a7AjPW8JSnOp3L/gQ5/r4aCeE7vf4ELwurMSUhw0RBaXqsvZFbmWtzATLDr1YZWlgLtkX4+vYL2ChF9OVtn0XJA0J90AvKuOJLgjbyGvSO0dIrj8kcbtRhXwupzDOmAvt25Ds4ysNhJfypgNofeIpkUbTTSRrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1jgTNWGwPI6xz2FmLlpvUZAIaWeP7Yy8H0GhG+UJYc=;
 b=ZPrKYbQGVeXlZ5Te40i/8y4K1McoP/mfnrY177vOHUuzdxxQJLteRZlhkk+qFllOKZ3RMp6NxFuAEmC26VQP1m0wblae6FMwGeXm38SDZ/AtpmTU5KcZUziIB8osU7VrqPsJz+Gj/XZe1LZQ8HvgYqNhGGFkqAlJYS8lJuTyAgM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH v2 1/2] automation: fix false success in qemu tests
Date: Thu, 29 Aug 2024 15:34:22 -0700
Message-ID: <9b60c6473aa084e4e47c64aa2347db6e3ca9ac91.1724967614.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1724967614.git.victorm.lira@amd.com>
References: <cover.1724967614.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e62a679-f183-4ccc-d13f-08dcc87ac95b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NLMFrx89MS2Sx93VZzOxKLxaPSQg5C7zR0cKesafOCKIQMJdA2tNR58M2XsO?=
 =?us-ascii?Q?MMS7Am+qNyN5AvwpcASUNsz9LJwUEKWxXlvWXmkbzd1sEJOBBLsxydhS4C/y?=
 =?us-ascii?Q?yTB6eTC5F5VJcd/8TzKVme8fBDpAkH0lBtvraoauwHDu3dzmv8QZGcCBamqo?=
 =?us-ascii?Q?YWEPLJCegu+qQavZHlBNDxZ7OIQKbjPeLpX0t+k4kphT87NO+ogFkdC+9xEd?=
 =?us-ascii?Q?8ELpiDzqzjjty5TEfp2dlH22p+mA8Ipeofc3oEB0iwap0JZ3js5+QH0M6S5y?=
 =?us-ascii?Q?+/OPnFXCYEe008rQANfsSuxNTOhxn6WT7ave2hqxQ5tPSdJtWZkZWwjCn5Lc?=
 =?us-ascii?Q?nsPDs3CeYgChTbUfNY9IUhH+/RXVN3NSJ0AvrkObl7YbSW542o8TAl8irRNR?=
 =?us-ascii?Q?RYJxbHi6fWtVthjEdAWBTcviuL1fIAsqYmldj21KUlD5zKXA9uU7cWmZMAvQ?=
 =?us-ascii?Q?paMRt10vvvgsUB3wseG89ytQiBLy3a+0bBQlalfx3bgRzImJJ7cFIgponVgH?=
 =?us-ascii?Q?/PLxWU9bAHrW1A4MppcVXefZ8FpZOYgxZ/wjpQUeeeCDBJIqaQh/9LtdmYXa?=
 =?us-ascii?Q?c8dmHDU7y5LwHgSmZLNDA0mr9dvtiNL79uWAvVpMbXXkoytYD8Poj/cyHf4Q?=
 =?us-ascii?Q?eMijae5JqHUciQGPiY4JtEg3Bp51j/APM/sIkGl9WLNHBm2tMFzb3K9HRkFc?=
 =?us-ascii?Q?sUuK5XKvlhCRuQ5NblLhMpvCoNoomPOGVy+Tn7U2FZt3ldmTDflZ6BCUTG2R?=
 =?us-ascii?Q?eECKmvFMWCVfpqTVG95hKYlILa25MGFrk9PYsiGjHPU6o/hRETfzR8aRwX5l?=
 =?us-ascii?Q?tn/U/UReVVbudG4M1nwoyAK4BdguYgYm2ou0AooxY7bH5LE1hOPZHM2jcBY7?=
 =?us-ascii?Q?VkTcFEPXkTgocKHyQIa0CXSl5K24nqLuDid+xAJWeriw62VAqmS3VpFj360P?=
 =?us-ascii?Q?Lsdz2qcADpZD0/IL5g+A4HGNhG+O9oq/4r0Jn68Fy807ppS3dh6R7622e1l0?=
 =?us-ascii?Q?+6HX2tN4nzkDk043KBL+u5wLdn6VemYZOvRSFn85/tVfGr7FUgJOy+payKzu?=
 =?us-ascii?Q?5iDzWnifJ6oMnfLhk4ojI8lyAlV3lQhoCf0CwqBwJgUtCY21acYs9C6i8iMb?=
 =?us-ascii?Q?SLVrIeNSgjDrAu394L4lmoqTYTXEKhW5rRdklCM3H+P+dxBiiZnO63cVZIdL?=
 =?us-ascii?Q?VG6C7UGWDismXVbhMlSqyQ64G1OHbdEld6ahJN0/6NftuTxTBombNL3bGuZB?=
 =?us-ascii?Q?fr8dBQsJZHQsKaPgtsYAPdZw6TWK2O0KhJt3Jyvdep34UacRMbmonEa6DhiV?=
 =?us-ascii?Q?neWN/+dYZCTS/gr4Qj7o1EQ/mV6wQdpCSRCHW/l4H4VGiQXdTsCgg6nsLLsX?=
 =?us-ascii?Q?JdixlOiAtCdDZmXzz4ySSDxbGPh6hxbBF79fWLce4ZhH1iwaCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 22:34:46.6914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e62a679-f183-4ccc-d13f-08dcc87ac95b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573

From: Victor Lira <victorm.lira@amd.com>

Fix flaw in qemu-*.sh tests that producess a false success. The following
lines produces success despite the "expect" script producing nonzero exit
status:

    set +e
...
    ./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
    (end of file)

The default exit status for a pipeline using "|" operator is that of the
rightmost command. Fix this by setting the "pipefail" option in the shell,
and removing "set +e" allowing the expect script to determine the result.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org
---
 automation/scripts/qemu-alpine-x86_64.sh        | 3 +--
 automation/scripts/qemu-key.exp                 | 2 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh     | 3 +--
 automation/scripts/qemu-smoke-dom0-arm64.sh     | 3 +--
 automation/scripts/qemu-smoke-dom0less-arm32.sh | 3 +--
 automation/scripts/qemu-smoke-dom0less-arm64.sh | 3 +--
 automation/scripts/qemu-smoke-ppc64le.sh        | 3 +--
 automation/scripts/qemu-smoke-riscv64.sh        | 3 +--
 automation/scripts/qemu-smoke-x86-64.sh         | 3 +--
 automation/scripts/qemu-xtf-dom0less-arm64.sh   | 3 +--
 10 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 42a89e86b021..93914c41bc24 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -1,6 +1,6 @@
 #!/bin/bash

-set -ex
+set -ex -o pipefail

 # DomU Busybox
 cd binaries
@@ -76,7 +76,6 @@ EOF

 # Run the test
 rm -f smoke.serial
-set +e
 export QEMU_CMD="qemu-system-x86_64 \
     -cpu qemu64,+svm \
     -m 2G -smp 2 \
diff --git a/automation/scripts/qemu-key.exp b/automation/scripts/qemu-key.exp
index 787f1f08cb96..66c416483146 100755
--- a/automation/scripts/qemu-key.exp
+++ b/automation/scripts/qemu-key.exp
@@ -14,7 +14,7 @@ eval spawn $env(QEMU_CMD)

 expect_after {
     -re "(.*)\r" {
-        exp_continue
+        exp_continue -continue_timer
     }
     timeout {send_error "ERROR-Timeout!\n"; exit 1}
     eof {send_error "ERROR-EOF!\n"; exit 1}
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index fd64b19358ae..7c282eff3a58 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -1,6 +1,6 @@
 #!/bin/bash

-set -ex
+set -ex -o pipefail

 serial_log="$(pwd)/smoke.serial"

@@ -77,7 +77,6 @@ git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config

 rm -f ${serial_log}
-set +e
 export QEMU_CMD="./qemu-system-arm \
    -machine virt \
    -machine virtualization=true \
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index e0cea742b0a0..81f210f7f50e 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -1,6 +1,6 @@
 #!/bin/bash

-set -ex
+set -ex -o pipefail

 # DomU Busybox
 cd binaries
@@ -93,7 +93,6 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf

 # Run the test
 rm -f smoke.serial
-set +e
 export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index e824cb7c2a3d..38e8a0b0bd7d 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -1,6 +1,6 @@
 #!/bin/bash

-set -ex
+set -ex -o pipefail

 test_variant=$1

@@ -130,7 +130,6 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config

 # Run the test
 rm -f ${serial_log}
-set +e
 export QEMU_CMD="./qemu-system-arm \
     -machine virt \
     -machine virtualization=true \
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index f42ba5d196bc..ea67650e17da 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -1,6 +1,6 @@
 #!/bin/bash

-set -ex
+set -ex -o pipefail

 test_variant=$1

@@ -204,7 +204,6 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf

 # Run the test
 rm -f smoke.serial
-set +e
 export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index 594f92c19cc2..49e189c37058 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -1,6 +1,6 @@
 #!/bin/bash

-set -ex
+set -ex -o pipefail

 serial_log="$(pwd)/smoke.serial"

@@ -9,7 +9,6 @@ machine=$1

 # Run the test
 rm -f ${serial_log}
-set +e

 export QEMU_CMD="qemu-system-ppc64 \
     -bios skiboot.lid \
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index c2595f657ff3..422ee03e0d26 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -1,10 +1,9 @@
 #!/bin/bash

-set -ex
+set -ex -o pipefail

 # Run the test
 rm -f smoke.serial
-set +e

 export QEMU_CMD="qemu-system-riscv64 \
     -M virt \
diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 3440b1761db4..7495185d9fc6 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -1,6 +1,6 @@
 #!/bin/bash

-set -ex
+set -ex -o pipefail

 # variant should be either pv or pvh
 variant=$1
@@ -15,7 +15,6 @@ case $variant in
 esac

 rm -f smoke.serial
-set +e
 export QEMU_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
         -initrd xtf/tests/example/$k \
         -append \"loglvl=all console=com1 noreboot console_timestamps=boot $extra\" \
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index 4042fe50602b..acef1637e25b 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -1,6 +1,6 @@
 #!/bin/bash

-set -ex
+set -ex -o pipefail

 # Name of the XTF test
 xtf_test=$1
@@ -50,7 +50,6 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf

 # Run the test
 rm -f smoke.serial
-set +e
 export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
--
2.25.1



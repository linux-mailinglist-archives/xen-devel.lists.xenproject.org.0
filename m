Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB13A62B65D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 10:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444237.699227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovEbc-0003pK-T2; Wed, 16 Nov 2022 09:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444237.699227; Wed, 16 Nov 2022 09:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovEbc-0003mn-QI; Wed, 16 Nov 2022 09:21:16 +0000
Received: by outflank-mailman (input) for mailman id 444237;
 Wed, 16 Nov 2022 09:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ql+j=3Q=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovEba-0003mg-Do
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 09:21:14 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e89::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 027bcebd-6590-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 10:21:11 +0100 (CET)
Received: from BN9PR03CA0191.namprd03.prod.outlook.com (2603:10b6:408:f9::16)
 by DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 09:21:07 +0000
Received: from BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::ed) by BN9PR03CA0191.outlook.office365.com
 (2603:10b6:408:f9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Wed, 16 Nov 2022 09:21:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT112.mail.protection.outlook.com (10.13.176.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 09:21:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 16 Nov
 2022 03:21:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 16 Nov
 2022 03:20:42 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 16 Nov 2022 03:20:41 -0600
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
X-Inumbo-ID: 027bcebd-6590-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTNkVwe4HgFYv3qipJJbk6BUjQOXudIDzI0uaf1Pcpu6nORoQnVfuHLNsEGpL01Xp52uC/Udx76CnSijSm/ou39ce3PG4xb10SqYQg36raGy2VDVgDatTDHlNqNlH6sVxPvKoQZlihScPqPvOoQyf4nrJ8Qer8JSU0Vob0MfNNih1LHuIqPAfxov4Y0lgzdujeeRTe5+pkAI3j9z3qWbnYQJQpchiJoXol2PSNcCjVkdp9q1OWlDF+0eaSsyxFaPnUP8E3VSpdy7nL5eA0+Tl2jwz+MRIhiEcbx+ECCZK+Je7DsBSBDyndor7mhhMqsQ58A7V2bROn+t8NsdGEaB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOwDmJvCjiDYiJNfQiLc7IvHjVQ6McFOol/qyIJ4h+E=;
 b=MG0Eoq7nLamc19thMXIh64YoVrnqMNhRw1rc6Q5Vzc/9VBYdKTSoKXjTWpBfdQJMa7+TVOmjdtIyHIqEaGH7UZW/Eiyw7BkRMmTt9gdCrv/aIrzISbmUyFlOIPH1uMMJf7P4y5g32V+6flb5h3Hci8/jdceagY0M8vqMdA4p9gjKiqDy4BcMKXiuDlwxJpPstV6W5HRy75ECgpiDiQBl24vxhKgefYWQf4Gq96GOEDWXMyCJwLstjuimyfnqq9GBAPebR3vTkSu3Tda5Ps6YMdBeZMNw2DtvfuWIKxPRzrK3/ZQCW+B82SKqRfUqi5dFFPDqSpCPTW8rS6YKvcc3oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOwDmJvCjiDYiJNfQiLc7IvHjVQ6McFOol/qyIJ4h+E=;
 b=n+CgrxODPapRFWCjoRJ+w0I5i7F2h1J96T2OTqglQ7VIG5CDRWhtajpJOcqWIPnvGHtRvGW8BrFBcu8Xz25wfwDJ+1pAu0GqzCzCd69bozMtnClHtmOkuY1fTm0SdWFbowLIPq5bWhdoqOgnUap2tpsPbzz6v3D+HTO578jjOrM=
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
Subject: [RFC] docs/misra: List files in Xen originated from external sources
Date: Wed, 16 Nov 2022 10:20:32 +0100
Message-ID: <20221116092032.4423-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT112:EE_|DM4PR12MB5182:EE_
X-MS-Office365-Filtering-Correlation-Id: 791fbbbe-3b95-4860-600e-08dac7b3e451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XnwL4otAVl3iNQUP/tyNSsn18JWLuHzs8fbp4msHFN33k3ag40lESmIh6TiG+/ZMPyPG1k4RYcnseOZ7SYaHVZrUnubLJ2vexMZ7UWLNd3/2HpSryqxsgL3uP6vOdyP2Rfn/gYRGUGUWH6ksWf6Pze1IhbeBb/f1GE2tqoDYks8wsh/P9MEv/azW7jYvABEmjSviR61RGSYB/JgG9tKBtTgGSvwS9cTDk/mHGMo0pdPXzcnOGmYffT/ci2DeYK/VF+SXBU3PbtxPWKI/tTKRS02Bk8IXS8MSBnYWfSqNV+aZn1MScJvlsr/SGPUyi4qB68CUz+CvlbbuVqWmqV35gBkzdS2Be5W2vfrsNSDrnRUMVvBhKCPy/P/F8XNZpfym4h5RK6/Te+ivUT/6XeWgB7a10JDIuwHC4hulSWAjzvycBwAjnc9exG+HyfZH/+QIXhqkAzzEeDE7faMoYhle9AZ3JphcBe8zOw2gV6EuROM8U/P/MO7/E/9PptjzaZ8/t0BIDZ1uxO9+UsTI8dZHVGrwTODWIAXaXm6RgdyGL8tPy47Cnvy+5r4AoMUiZhUoL8JQbo3VYeXvnLks8+lr10sHDadbQmzb00VibSDA/bwjES7hUQgzufBzlYzIaU0cvWIU3SOd19mhtX0G734XosyoqaMT0WS0FsHa0o/PYoRZP2iFc07pxLEPt1I6506/v7W5WLx2/ym7gbEFnOWt4sYARGzx7yM3AFC70VP5gldpWw7M2bMOnZiHSCXTEEBLU5h8EkBpkcgNJ/aQwAQm8gLX+/BtALc/41ioHaQFiQq0VRqyjkB604ZCLb5D9yTWRejR3u5Tkox3NjuIUTtBiQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(36860700001)(2906002)(36756003)(40460700003)(41300700001)(70206006)(8676002)(2616005)(40480700001)(82310400005)(70586007)(86362001)(82740400003)(54906003)(6916009)(356005)(81166007)(186003)(5660300002)(1076003)(336012)(44832011)(47076005)(426003)(4326008)(966005)(26005)(8936002)(316002)(6666004)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 09:21:06.9645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 791fbbbe-3b95-4860-600e-08dac7b3e451
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5182

Add a file with a table listing files in the Xen codebase that originated
from external sources (e.g. Linux kernel). This is done in order to
improve traceability, help with the review process and act as a base for
listing files to exclude from MISRA checkers.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Some time ago, together with Stefano, we shared a spreadsheet [1] to gather
a feedback about external files in Xen. This RFC patch is moving this
discussion to the mailing list to gather some more comments. The main request
for the maintainers is to check if there are any files missing, check for the
correctness of the already populated entries and decide what to do with the
entries with a question mark.

[1] https://cryptpad.fr/sheet/#/2/sheet/edit/G5WWo5TI71n58OLEG9TCu95j/
---
 docs/misra/external-files.txt | 70 +++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 docs/misra/external-files.txt

diff --git a/docs/misra/external-files.txt b/docs/misra/external-files.txt
new file mode 100644
index 000000000000..69ff233da456
--- /dev/null
+++ b/docs/misra/external-files.txt
@@ -0,0 +1,70 @@
+External files in Xen
+=====================
+
+The following table lists files present in the Xen codebase that originated
+from external sources e.g. Linux kernel. The purpose of this table is to:
+ - keep track of the external files in the Xen codebase,
+ - help with the review process (e.g. changes done to the files that did not
+   diverge, shall be first submitted to the external projects and then
+   backported to Xen),
+ - act as a base for listing files to exclude from MISRA checkers.
+
+NOTES:
+1) The files shall be listed in alphabetical order.
+2) The origin of the files derived from the projects other than Linux, shall
+   be specified within the () placed next to the path.
+3) The table shall be updated when importing new files from external projects.
+4) At the moment, only the source files are listed in the table.
+
+| Relative path to xen/                     | Diverged from | Subject to       |
+|                                           | origin? [Y/N] | backports? [Y/N] |
++-------------------------------------------+---------------+------------------+
+| arch/arm/arm64/cpufeature.c               | N             | Y                |
+| arch/arm/arm64/insn.c                     | N             | Y                |
+| arch/arm/arm64/lib/find_next_bit.c        | N             | Y                |
+| arch/x86/acpi/boot.c                      | Y             | ?                |
+| arch/x86/acpi/lib.c                       | ?             | ?                |
+| arch/x86/cpu/mcheck/mce-apei.c            | N             | Y                |
+| arch/x86/cpu/mcheck/non-fatal.c           | ?             | Y                |
+| arch/x86/cpu/mtrr/*                       | Y             | N                |
+| arch/x86/cpu/amd.c                        | Y             | N                |
+| arch/x86/cpu/centaur.c                    | Y             | N                |
+| arch/x86/cpu/common.c                     | Y             | N                |
+| arch/x86/cpu/hygon.c                      | Y             | N                |
+| arch/x86/cpu/intel_cacheinfo.c            | Y             | Y                |
+| arch/x86/cpu/intel.c                      | Y             | N                |
+| arch/x86/cpu/mwait-idle.c                 | Y             | Y                |
+| arch/x86/genapic/*                        | Y             | N                |
+| arch/x86/x86_64/mmconf-fam10h.c           | N             | Y                |
+| arch/x86/dmi_scan.c                       | Y             | ?                |
+| arch/x86/mpparse.c                        | Y             | ?                |
+| arch/x86/srat.c                           | Y             | N                |
+| common/libfdt/* (libfdt)                  | N             | Y                |
+| common/lz4/decompress.c                   | N             | Y                |
+| common/ubsan/ubsan.c                      | Y             | Y                |
+| common/xz/*                               | N             | Y                |
+| common/zstd/*                             | N             | Y                |
+| common/bitmap.c                           | N             | Y                |
+| common/bunzip2.c                          | N             | Y                |
+| common/earlycpio.c                        | N             | Y                |
+| common/inflate.c                          | N             | Y                |
+| common/radix-tree.c                       | N             | Y                |
+| common/un*.c                              | N             | Y                |
+| crypto/rijndael.c (OpenBSD)               | N             | Y                |
+| crypto/vmac.c (public domain)             | N             | Y                |
+| drivers/acpi/apei/*                       | N             | Y                |
+| drivers/acpi/tables/*                     | N             | Y                |
+| drivers/acpi/utilities/*                  | N             | Y                |
+| drivers/acpi/hwregs.c                     | N             | Y                |
+| drivers/acpi/numa.c                       | ?             | Y                |
+| drivers/acpi/osl.c                        | Y             | Y                |
+| drivers/acpi/reboot.c                     | N             | Y                |
+| drivers/acpi/tables.c                     | ?             | Y                |
+| drivers/passthrough/arm/smmu.c            | Y             | N                |
+| drivers/passthrough/arm/smmu-v3.c         | Y             | N                |
+| lib/list-sort.c                           | N             | Y                |
+| lib/mem*.c                                | N             | Y                |
+| lib/rbtree.c                              | N             | Y                |
+| lib/str*.c                                | N             | Y                |
+| lib/xxhash32.c                            | N             | Y                |
+| lib/xxhash64.c                            | N             | Y                |
-- 
2.25.1



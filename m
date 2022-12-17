Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8832964FC1E
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 20:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465384.724040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6d0l-0001o9-67; Sat, 17 Dec 2022 19:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465384.724040; Sat, 17 Dec 2022 19:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6d0l-0001lT-2d; Sat, 17 Dec 2022 19:38:19 +0000
Received: by outflank-mailman (input) for mailman id 465384;
 Sat, 17 Dec 2022 19:38:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8IE=4P=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p6d0j-0001l4-6b
 for xen-devel@lists.xenproject.org; Sat, 17 Dec 2022 19:38:17 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2085.outbound.protection.outlook.com [40.107.212.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58a9c833-7e42-11ed-8fd4-01056ac49cbb;
 Sat, 17 Dec 2022 20:38:15 +0100 (CET)
Received: from BN0PR04CA0145.namprd04.prod.outlook.com (2603:10b6:408:ed::30)
 by PH8PR12MB6699.namprd12.prod.outlook.com (2603:10b6:510:1ce::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Sat, 17 Dec
 2022 19:38:06 +0000
Received: from BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::25) by BN0PR04CA0145.outlook.office365.com
 (2603:10b6:408:ed::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.17 via Frontend
 Transport; Sat, 17 Dec 2022 19:38:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT069.mail.protection.outlook.com (10.13.176.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.16 via Frontend Transport; Sat, 17 Dec 2022 19:38:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 17 Dec
 2022 13:38:05 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Sat, 17 Dec 2022 13:38:04 -0600
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
X-Inumbo-ID: 58a9c833-7e42-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzeIRamDFdn4jfS8PMxZpOcQ2bnWx65slsc0pWdxKuRxLmUyY3JA19ih1+un4IQtAAkqnIXM23/YXYBA/Bwt33dUh8klEqOFBC2s0hHHvKc+NcITVY00F5lcmT3qVJtIpAteTQy3IgKDMvEJCsQ9WLCH0/90SX22U6uqYUS4cbPOmzqqEE3xZVLH3RZ4kGaWmnXBHnX3uMyT8BKrZ1Ox9rW3V25igrB4CAs4muviGTevSqyVSBimVfH4VjDOcnpTYGTU01ngnTHFj6q/myNz3etGiuv4eBKXXgvCGLyxmiLLDrLc9E3vSWrCascm0IhjSSsz4Auv+FAGEIFk2KYPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxrEckySseDqNM3yijpt0yeiEh3OC0iLEBwLUAlgwWk=;
 b=M1rprKZn2TnJJc+a2wnz0mp1pkXThD8S2atXZkCpL3FMzEHReXBVKQxIsy6heoas++FUO+IPenWI18q4YndvEZuItzB1prVnf5ctS6l9shj0IK7VxdJ4Z7a4Ljs6nsjh46LrBrX4Lrb5shT5P7EDyWIu/itLOQnvPUTozc0ZmDYFwKVdUd6TA3lV+bfSiXDrO5V2GxQibOhQreiN1C3lc57HfrUGWoUKcBZjyjgW2BdDBZE1QtwVAfX4HjVaercBt/xhGGE2caNueieeeu+nnqBZ4791s1Ga3j9KJc11ZkBUhuiuoqbFBbRrpc5Y9Ebu/oM/p/jJawlNvSon4uY6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxrEckySseDqNM3yijpt0yeiEh3OC0iLEBwLUAlgwWk=;
 b=0Q90QcrxMorYRhDr+OP6vE613WkaHC28ItfDRnqSHpscNrX5dWYGzUrW6YLq0dWjrz+0cNkETRMqcy7lfZRv8I4oBsajiTntpWCUTJF5MhGsPnK/iLyz50JYmD/jYXrJiuzmkPm8FD4bvgRvyw5j2nJ9pFWGUgnmgREbpvSqujc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v3] xen/arm: Probe the entry point address of an uImage correctly
Date: Sat, 17 Dec 2022 19:38:01 +0000
Message-ID: <20221217193801.19485-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT069:EE_|PH8PR12MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0ffbb3-28ab-4976-2edc-08dae0663847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gVKNNRADv/LFtA0/boKawbcj57e3OCcWcYBBbrFBqBj6OqhW7sRpHIgeHBwRlQCp70+YRkAdA0bAwihg1wo5GcB7heb7Q4yrQUc1PxCSjeNpBGGax0U5jfeU/pTTcvG/DbEG0srwtapprdMsqrxs8o1A3IYtvpeO3eAkJ4PcEaPRk/iNAbXkh2bF/W2S8Juhz/kEV0hD07oY10bxBs4xDHSz5MEniGyIUTWmbtdhnInoZtMlnhijKVy2LPCxaLK4Mt2j/Rh8h+o+IZO2IKo9uIukvCzUvIWBUdI90kZP0VqedeUTjDWJPwyl/Lj+1G4VF4/j0VFjfHbLolYTawg/U4jYHx3pul5c6VJgqEowR4G77sLsuIXowUKjNCfO8sVUs3X94vYPvJsOSM95KB93Yx3laEk4qXq0aW8NVr0WLwkcrTBQLrdrquIMcWcRd6lwo1wjYGMFEOFPkrt61zGafRItaceNyH6TXKcXvjNL/6jKwcqnVAMGV32yWOnmKvrJkEIq0sUg9jRAfiZIGEKsosIMGnX0dUEqLiyCFubmpu1msYOrpsIDJpTwRHh8ynB4cOKeXeIWUgEfPcBVKF3Ov3eR47EKJmmnyIXh3egDE8J3wM6qW3N1Hoah+F3pehipk1rzC7l9DXnBfN5zfZBz2cMqs7JbYx6kcbQoovFv2WrxSSseJTBlBzznD3MwkhfujeOBA6SD6gmzuVi+FdtZaKlocdPA1DuV6Im5s6nq/qjSt6JI9Y8BpBREJApB1YqObCoWPV7k4lieuw25895xl5yuP5O+H/gF7RGKgF+bjCg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(54906003)(82740400003)(6916009)(40480700001)(966005)(478600001)(81166007)(2906002)(316002)(8936002)(36756003)(5660300002)(40460700003)(70206006)(70586007)(86362001)(8676002)(4326008)(83380400001)(36860700001)(426003)(47076005)(356005)(336012)(103116003)(41300700001)(2616005)(6666004)(26005)(186003)(1076003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2022 19:38:06.1352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0ffbb3-28ab-4976-2edc-08dae0663847
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6699

Currently, kernel_uimage_probe() does not set info->zimage.start. As a
result, it contains the default value (ie 0). This causes,
kernel_zimage_place() to treat the binary (contained within uImage) as
position independent executable. Thus, it loads it at an incorrect address.

The correct approach would be to read "uimage.ep" and set
info->zimage.start. This will ensure that the binary is loaded at the
correct address. Also, it checks that the load address and entry address
are the same. The reason being we currently support non compressed images
for uImage header. And as seen in uboot sources(image_decomp(), case
IH_COMP_NONE), load address and entry address can be the same.

This behavior is applicable for both arm and arm64 platforms.

Earlier for arm32 and arm64 platforms, Xen was ignoring the entry point
address set in the uImage header. With this commit, Xen will use the
kernel entry point address as specified in the header. This makes the
behavior of Xen consistent with uboot for uimage headers.

Users who want to use Xen with statically partitioned domains, can
provide the fixed non zero load address for the dom0/domU kernel.

A deviation from uboot behaviour is that we consider load address == 0x0,
to denote that the image supports position independent execution. This
is to make the behavior consistent across uImage and zImage.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from v1 :-
1. Added a check to ensure load address and entry address are the same.
2. Considered load address == 0x0 as position independent execution.
3. Ensured that the uImage header interpretation is consistent across
arm32 and arm64.

v2 :-
1. Mentioned the change in existing behavior in booting.txt.
2. Updated booting.txt with a new section to document "Booting Guests".

 docs/misc/arm/booting.txt         | 21 +++++++++++++++++++++
 xen/arch/arm/include/asm/kernel.h |  2 +-
 xen/arch/arm/kernel.c             | 27 ++++++++++++++++++++++++++-
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 3e0c03e065..01b12b49a5 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -23,6 +23,24 @@ The exceptions to this on 32-bit ARM are as follows:
 
 There are no exception on 64-bit ARM.
 
+Booting Guests
+--------------
+
+Xen supports the legacy image protocol[3], zImage protocol for 32-bit ARM
+Linux[1] and Image protocol defined for ARM64[2].
+
+Earlier for legacy image protocol, Xen ignored the load address and entry
+point specified in the header. This has now changed.
+
+Now, it loads the image at the load address provided in the header.
+For now, it supports images where load address is same as entry point.
+
+A deviation from uboot is that, Xen treats "load address == 0x0" as
+position independent execution. Thus, Xen will load such an image at an
+address it considers appropriate.
+
+Users who want to use Xen with statically partitioned domains, can provide
+the fixed non zero load address for the dom0/domU kernel.
 
 Firmware/bootloader requirements
 --------------------------------
@@ -39,3 +57,6 @@ Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
 
 [2] linux/Documentation/arm64/booting.rst
 Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
+
+[3] legacy format header
+Latest version: https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 5bb30c3f2f..4617cdc83b 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -72,7 +72,7 @@ struct kernel_info {
 #ifdef CONFIG_ARM_64
             paddr_t text_offset; /* 64-bit Image only */
 #endif
-            paddr_t start; /* 32-bit zImage only */
+            paddr_t start; /* Must be 0 for 64-bit Image */
         } zimage;
     };
 };
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 23b840ea9e..e9c18993ef 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     paddr_t load_addr;
 
 #ifdef CONFIG_ARM_64
-    if ( info->type == DOMAIN_64BIT )
+    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
         return info->mem.bank[0].start + info->zimage.text_offset;
 #endif
 
@@ -223,6 +223,31 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
     if ( len > size - sizeof(uimage) )
         return -EINVAL;
 
+    info->zimage.start = be32_to_cpu(uimage.ep);
+
+    /*
+     * Currently, we support uImage headers for uncompressed images only.
+     * Thus, it is valid for the load address and start address to be the
+     * same. This is consistent with the uboot behavior (Refer
+     * "case IH_COMP_NONE" in image_decomp().
+     */
+    if ( info->zimage.start != be32_to_cpu(uimage.load) )
+    {
+        panic("Unable to support mismatching load address and entry address\n");
+        return -EINVAL;
+    }
+
+    /*
+     * While uboot considers 0x0 to be a valid load/start address, for Xen
+     * to mantain parity with zimage, we consider 0x0 to denote position
+     * independent image. That means Xen is free to load such an image at
+     * any valid address.
+     * Thus, we will print an appropriate message.
+     */
+    if ( info->zimage.start == 0 )
+        printk(XENLOG_INFO
+               "No load address provided. Xen will decide where to load it\n");
+
     info->zimage.kernel_addr = addr + sizeof(uimage);
     info->zimage.len = len;
 
-- 
2.17.1



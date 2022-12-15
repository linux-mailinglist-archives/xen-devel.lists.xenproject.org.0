Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF964DB5C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 13:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463379.721529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5nVd-0000Se-1F; Thu, 15 Dec 2022 12:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463379.721529; Thu, 15 Dec 2022 12:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5nVc-0000R3-UY; Thu, 15 Dec 2022 12:38:44 +0000
Received: by outflank-mailman (input) for mailman id 463379;
 Thu, 15 Dec 2022 12:38:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5nVa-0000Qx-LH
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 12:38:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66b1edf0-7c75-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 13:38:40 +0100 (CET)
Received: from BN9PR03CA0768.namprd03.prod.outlook.com (2603:10b6:408:13a::23)
 by BN9PR12MB5291.namprd12.prod.outlook.com (2603:10b6:408:104::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 12:38:35 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::17) by BN9PR03CA0768.outlook.office365.com
 (2603:10b6:408:13a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 12:38:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 12:38:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 06:38:34 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 06:38:33 -0600
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
X-Inumbo-ID: 66b1edf0-7c75-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FefE7iR77SuSCleiPvRdQxvR9je6Y96y3CqEkQ3pG6dDIFV5rncHAxhw7Vez1J0EXo70PKbJ4QA35OGPGcYfLB8KoMpi2yO8+flW/v5Id4tJdhapU3LyBfo51NlzjIgOFOupHoYSjYY275cmXxKka4P0vAQ76vPVPfEGiLqt7UIv8mXrZrWdG8BIeI6epDQ/qA4y9vxdoVCJnMJXoQ3Sx2PmStPq7EwNVFg4/xsgmgOmT2JflS6Hg4mLLRNbqX2MD0d2wE9rQ7ecmixbQm1Q7IkAbepST0xpo9Q/UwETrO4ogPmlTTwUXO8PpBScOMCHKZ0b4h16h7hH9xW8/C2VfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMKgISDRc9J9yaWWalrknuiSdDKhceDtSJerFxaajQo=;
 b=GOCiOaXGAJ/E9RPW5EVyN8QBr9ufoCLS3xyvrd+h6imJZIg/zzzt1KvdWBSBhM6ro+rkNzhBT4en5WfiiSevJg/UgEPay5Whcxke/SZhns/B+sqftcBZDS8jRsr69TmJJewJet3ulbBnww5LRZVxEu84lbLWCIyAkFdjPTOWeUMtE/b5Aj+xn4WmSsYjv9YZR/u+EYk+a0djnhuX1GpHGR/J2o3iJVislsbpCwycbH6tLaqv6aHndoHD/+WxEMyhcKpovYv3OMbN0JFP3uzqvDNfvpJSjaECaW8ainTKN/y/oDfLWMmsTrsNl7YPfDkmFg4GVwroZCT2ny1JlSi8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMKgISDRc9J9yaWWalrknuiSdDKhceDtSJerFxaajQo=;
 b=aKKaVXX3KeD9SOuW/EzcyrVTqF2Ls8H0TAPQHbouAqfcFWYiQmTHKTKnxaPSWROzMPwAR13TdQhPHc2PjRNzh3qUhqLPk+yln3XmAySRVgVg1od5IWZIu/hbyniv80R+n3pjWTO/p4NEb/lQ69ArsqhXkPp4XN1VEOqnQZZ9Tqc=
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
Subject: [XEN v2] xen/arm: Probe the entry point address of an uImage correctly
Date: Thu, 15 Dec 2022 12:38:26 +0000
Message-ID: <20221215123826.24145-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT055:EE_|BN9PR12MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a9e509-6ff8-4322-f957-08dade99487b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8CDsVV2w9UPADXtmyK1DqCVprrDLRH5q3qQwVOihiHWVVpUogML9/F3R1d+Js5JbsyGuuoDgsztuobQ1gau+T22J9M07kbdwmi3ID98AGqV3wddzMwsARNd//olp5vEFDLcEmjAf0lsBWM2+wHepzRgINzyNukyefa9YkR5UQb7AtHZpNrKngqPKpDvjbBEFlb4gXFHo8lLVJn6RTuOom7IUB5nSAIU4VqaT61vjWqI7qXnQScxdRoRNZobjGQmDE3H23e4RMRQG0NCr/93UtdI/38kW2ZwZaOkoyatSR2r8NW8mWE4rLNFrsx2ULd1W2gYumpG15MKH+5QoGhS1dfrBKkUk0TFjnMvnWKYgQLhIHGrOEpZmGp3i1pkAAevhixTDOaTKjPa4bStxebO4H8h4I53ONQUTOG6RrTqeCY272J9vm1tpUe1e+dyaqq67N+q5Z1HTd00rK3CNbikohv5nIXxBUwDY4pKfK8VcI3q87exqpWTj9XujZHURs/kUiwggatiBXvgXLGrHUt1Cuiuvj3frL2aWusTMKsHY1cCh9KW7El4ypLQ0Nzux0E+Qk7lE7/Mo0I5Mf8LXIxyhNtDOPmHS2boL42bOoY30JRycbaKOVjyYubY06emv5VMS1O+cbFzSoqvuyr4DchfPB2GFWbABw3PXwx9/QhQfzqGa7zNlMX7fMMZqXWGgdEODnt3nnaZaAwxTvFPo1P5+duXAaxq20qN3crTE0yJ8+OafR3ixz5YahfuW/pz+AyI8Lt2BHhfFw8lGli/lyowqKYV0cryjT42ZubPUAPxkROU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(46966006)(36840700001)(40470700004)(5660300002)(86362001)(316002)(6916009)(54906003)(8936002)(36860700001)(8676002)(4326008)(70206006)(41300700001)(36756003)(70586007)(82310400005)(336012)(6666004)(47076005)(40460700003)(103116003)(186003)(1076003)(2616005)(478600001)(426003)(83380400001)(966005)(2906002)(26005)(356005)(40480700001)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 12:38:35.3324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a9e509-6ff8-4322-f957-08dade99487b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5291

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

A deviation from uboot behaviour is that we consider load address == 0x0,
to denote that the image supports position independent execution. This
is to make the behavior consistent across uImage and zImage.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from v1:-
1. Added a check to ensure load address and entry address are the same.
2. Considered load address == 0x0 as position independent execution.
3. Ensured that the uImage header interpretation is consistent across
arm32 and arm64.

Some unanswered queries from v1 :-

Q1. "In non-statically allocated setup, a user doesn't know where the memory
for dom0/domU will be allocated.So I think this was correct to ignore the
address."
A. I am not sure the best way to handle this. Can we make the uImage probe
dependent on STATIC_MEMORY ? Currently, I have mentioned that user should
use load address = 0x0 if they want Xen to ignore it.

Q2. Zephyr or any other RTOS have different requirements, then we may need
to modify Xen and document it.
A. I will take it in a separate email/patch where we can list the
requirements for booting Zephyr.

 docs/misc/arm/booting.txt         | 11 ++++++++++-
 xen/arch/arm/include/asm/kernel.h |  2 +-
 xen/arch/arm/kernel.c             | 26 +++++++++++++++++++++++++-
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 3e0c03e065..872262686a 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -4,7 +4,13 @@ Booting Xen
 Xen follows the zImage protocol defined for 32-bit ARM Linux[1] and the
 Image protocol defined for ARM64 Linux[2].
 
-In both cases the recommendation to boot in HYP/EL2 mode is a strict
+Xen also supports the legacy image protocol[3] for 32-bit ARM and ARM64.
+For now, it supports images where load address is same as entry address.
+A deviation from uboot is that, Xen treats "load address == 0x0" as
+position independent execution. Thus, Xen will load such an image at an
+address it considers appropriate.
+
+In all cases the recommendation to boot in HYP/EL2 mode is a strict
 requirement for Xen.
 
 The exceptions to this on 32-bit ARM are as follows:
@@ -39,3 +45,6 @@ Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
 
 [2] linux/Documentation/arm64/booting.rst
 Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
+
+[3] legacy format header
+Latest version: https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 5bb30c3f2f..ee69a47052 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -72,7 +72,7 @@ struct kernel_info {
 #ifdef CONFIG_ARM_64
             paddr_t text_offset; /* 64-bit Image only */
 #endif
-            paddr_t start; /* 32-bit zImage only */
+            paddr_t start;
         } zimage;
     };
 };
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 23b840ea9e..81ac945f5b 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     paddr_t load_addr;
 
 #ifdef CONFIG_ARM_64
-    if ( info->type == DOMAIN_64BIT )
+    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
         return info->mem.bank[0].start + info->zimage.text_offset;
 #endif
 
@@ -223,6 +223,30 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
     if ( len > size - sizeof(uimage) )
         return -EINVAL;
 
+    info->zimage.start = be32_to_cpu(uimage.ep);
+
+    /*
+     * Currently, we support uImage headers for uncompressed images only.
+     * Thus, it is valid for the load address and start address to be the
+     * same. This is consistent with the uboot behavior (Refer
+     * "case IH_COMP_NONE" in image_decomp()).
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
+     * Thus, we will print an appropriate warning.
+     */
+    if ( info->zimage.start == 0 )
+        printk(XENLOG_WARNING "No valid load address provided\n");
+
     info->zimage.kernel_addr = addr + sizeof(uimage);
     info->zimage.len = len;
 
-- 
2.17.1



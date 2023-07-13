Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18E3751F49
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 12:48:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563092.880071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJts1-0000qd-Pc; Thu, 13 Jul 2023 10:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563092.880071; Thu, 13 Jul 2023 10:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJts1-0000oR-LV; Thu, 13 Jul 2023 10:48:25 +0000
Received: by outflank-mailman (input) for mailman id 563092;
 Thu, 13 Jul 2023 10:48:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0yHZ=C7=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qJtrz-0000oL-Qq
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 10:48:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c84fea2a-216a-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 12:48:21 +0200 (CEST)
Received: from DM5PR08CA0057.namprd08.prod.outlook.com (2603:10b6:4:60::46) by
 CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20; Thu, 13 Jul 2023 10:48:17 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::a3) by DM5PR08CA0057.outlook.office365.com
 (2603:10b6:4:60::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Thu, 13 Jul 2023 10:48:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Thu, 13 Jul 2023 10:48:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Jul
 2023 05:48:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Jul
 2023 05:48:16 -0500
Received: from 10.0.2.15 (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 13 Jul 2023 05:48:14 -0500
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
X-Inumbo-ID: c84fea2a-216a-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAyXxHTvSdqzH3BpepE0v7KHbb5IeAAm+Gfk8tEtBCCvBPuk1S4rLNaGDYbad3B7ZqggGGnLbcwlKI47esxc5xRZFniEAfR+OmqoWgyARwWJV48dpXM3DMW7mcRKOTKIKBGbJe7ZWcv8Z+QFSGnAEo46LPHcSF7CiMv+d5aiK3XEiRaIeG44Q2Tw7wjpzdypDREh3SfzGsJ39Kinc6zNBaYhRaX/iku5/Mh+CPycuYY1zddUfm5CcWg7fPafPriB9Og0sArAK8iQpyNb1k7NizMkzpPZ+7Do5EJoNKD2XFuUUw/GaKPqf/0PvJXaR82ycz6tjiMU4O6YZYAZDRSmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYJ17GsHkvf3wzt1JRROVoT4+2yfsQVmFXOSjlfBPiM=;
 b=aog1K4YF/xyIbgR9DwskjEM7XnG0vfcvplVFUn3Wrik2SzLP7syjz5uZLYIaalvVKZviUSwjSruduWRcW7Jl7Haj0pI8aV44rey/jZTNR9XNtU04l9BcHEQ9ZREu+Jl1x23E0QEVhdt6NwxcEJjsjCUScl3mkiHU/nB1Z/lavJ9Ef7JpHYcy4/v/KOaxps2gJVcB5rkl7sDKCUmHes5pi76eiOIgQ9GHh/eIweeCy9L4fDngu+CUmUflFssBou/DEKPzqFqdBWs8L+i45BNIdGhBaK5RmzenFzByBvwtDrC5LBzqeHBhsupZbMZAUNVHjOZ9IO654LiWIqtJXGF8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=edk2.groups.io smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYJ17GsHkvf3wzt1JRROVoT4+2yfsQVmFXOSjlfBPiM=;
 b=aWbZB5YgnL1IRzWEGp7XaNyc8pr0hZHwb6wM3DXiCJWddthPJwrSjzZWuUDpYpHbNe081mjx5334xifux9B0NfEytofRjQPZzQBOEqahpcGCQ2FmQeD8BOTdgB7TCIDkj+VEGYA+Ztllm6lrSd5Qs+nm7Kku3K2MzNvGiu875ME=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
To: <devel@edk2.groups.io>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Ard Biesheuvel
	<ardb+tianocore@kernel.org>, Jiewen Yao <jiewen.yao@intel.com>, Jordan Justen
	<jordan.l.justen@intel.com>, Gerd Hoffmann <kraxel@redhat.com>, "Anthony
 Perard" <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH] OvmfPkg/OvmfXen: Fix S3
Date: Thu, 13 Jul 2023 13:47:12 +0300
Message-ID: <c79e568e0d1c85bef9a2efc4c854de8f80ea1487.1689244868.git.xenia.ragiadakou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT050:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4bc75a-0e66-4e36-4d84-08db838eaaa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x5K9rcAeMqL33oug1dkj/87yvNCmnA3SLr4+mhtkujkITsdUWiIFCxohXMPSTmzDAACgt9YGpGuom5i/ExWNPyRkucbnqXaK1AZ5W7xytv+s4wsaUO90wyGhhtU7Ia5CJ7zAtq7KcEHvye35sHY31DxOmQvxYgXKSWLFBcxDsshFZwnJRCyVR+giFDppKD79sPi96kNZM8ufEXb6hJD579TPAF+PsQIX5lpAeeZB3To3wpV3YlMQWR3fCC/30Jrob1a0QwIdQ/FYYL/RsHoho8ZZpHtjvVY4+q60KURIudoA5+c6Musg3nAs6BCTR1ycQU313tv2bymZ9tQURQbqs1223sP4JnABLjX5LYNR6INltbRYnSpJKHIbvm61af4xzBBACOzJPpUDVpPWsHo7TTQHPsJbJ0HaFxbrFWPKinS073RG8jMO6m61vo8sry6ebL1n0uwNkaYzEAExD1C6XM+uW/qm9+lcrqNWH1g5CBbfBiomtQHpfVybJ4KD8NQoe6qQucJ0ty0kCyJJ3mH+naoSdxsQ6K4iochW1olCHt/VbJs9oorMJnaceqS+qQgLLyFr4xjRsjohARBsVGM/B+PQ7zlatzlYpC9prUGjYucB/kl4NIKERKgcO5KSLx5sf2tpQsna6gQJLRbh+CicBqtvEWG4xmTqhjZOR3IxvksNaf0Pxig0RiTgPUMhP4rtC6qizddPsRzIswqWq2lGdkDqH8g2r1uqWLJlqLh1s4itbi8OjFlDX+3cLddcmfPXjflA45j9Vdpmpsy5IxIotw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(478600001)(47076005)(83380400001)(86362001)(81166007)(70586007)(70206006)(6916009)(4326008)(16576012)(82740400003)(356005)(26005)(186003)(336012)(36860700001)(19627235002)(54906003)(2616005)(426003)(5660300002)(44832011)(8676002)(8936002)(40460700003)(316002)(2906002)(41300700001)(40480700001)(36756003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 10:48:17.3634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4bc75a-0e66-4e36-4d84-08db838eaaa2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432

Currently, resuming an S3 suspended guest results in the following
assertion failure:
ASSERT MdePkg/Library/PeiResourcePublicationLib/PeiResourcePublicationLib.c=
(41): MemoryLength > 0
This happens because some parts of the S3 suspend and resume paths
are missing in order for S3 to work. For instance, the variables
mS3AcpiReservedMemoryBase and mS3AcpiReservedMemoryBase are not
initialized, regions that are used on S3 resume are either missing
or not marked as ACPI NVS memory and can be corrupted by the OS.
This patch adds the missing parts based heavily on the existing S3
implementation of other virtual platforms.

For S3 support, the provision of fw_cfg is required in order for
suspend states to be retrieved.

Another issue noticed is that when CalibrateLapicTimer() is called
on S3 resume path, the shared info page is remapped to a different
guest physical address. This remapping happens under guest's feet,
so any subsequent attempt of the guest to access the shared info
page results in nested page faults. This patch removes any local
APIC timer initializion and calibration from S3 resume path.

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
---
 OvmfPkg/XenPlatformPei/Fv.c               |  2 +-
 OvmfPkg/XenPlatformPei/MemDetect.c        | 60 ++++++++++++++++++++++-
 OvmfPkg/XenPlatformPei/Platform.c         | 11 ++++-
 OvmfPkg/XenPlatformPei/Platform.h         |  2 +
 OvmfPkg/XenPlatformPei/XenPlatformPei.inf |  7 +++
 5 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/OvmfPkg/XenPlatformPei/Fv.c b/OvmfPkg/XenPlatformPei/Fv.c
index 871a2c1c5b..37ecb3cfee 100644
--- a/OvmfPkg/XenPlatformPei/Fv.c
+++ b/OvmfPkg/XenPlatformPei/Fv.c
@@ -37,7 +37,7 @@ PeiFvInitialization (
   BuildMemoryAllocationHob (=0D
     PcdGet32 (PcdOvmfPeiMemFvBase),=0D
     PcdGet32 (PcdOvmfPeiMemFvSize),=0D
-    EfiBootServicesData=0D
+    mS3Supported ? EfiACPIMemoryNVS : EfiBootServicesData=0D
     );=0D
 =0D
   //=0D
diff --git a/OvmfPkg/XenPlatformPei/MemDetect.c b/OvmfPkg/XenPlatformPei/Me=
mDetect.c
index e552e7a55e..1724a4988f 100644
--- a/OvmfPkg/XenPlatformPei/MemDetect.c
+++ b/OvmfPkg/XenPlatformPei/MemDetect.c
@@ -283,6 +283,19 @@ PublishPeiMemory (
 =0D
   LowerMemorySize =3D GetSystemMemorySizeBelow4gb ();=0D
 =0D
+  //=0D
+  // If S3 is supported, then the S3 permanent PEI memory is placed next,=
=0D
+  // downwards. Its size is primarily dictated by CpuMpPei. The formula be=
low=0D
+  // is an approximation.=0D
+  //=0D
+  if (mS3Supported) {=0D
+    mS3AcpiReservedMemorySize =3D SIZE_512KB +=0D
+                                PcdGet32 (PcdCpuMaxLogicalProcessorNumber)=
 *=0D
+                                PcdGet32 (PcdCpuApStackSize);=0D
+    mS3AcpiReservedMemoryBase =3D LowerMemorySize - mS3AcpiReservedMemoryS=
ize;=0D
+    LowerMemorySize           =3D mS3AcpiReservedMemoryBase;=0D
+  }=0D
+=0D
   if (mBootMode =3D=3D BOOT_ON_S3_RESUME) {=0D
     MemoryBase =3D mS3AcpiReservedMemoryBase;=0D
     MemorySize =3D mS3AcpiReservedMemorySize;=0D
@@ -328,6 +341,51 @@ InitializeRamRegions (
 {=0D
   XenPublishRamRegions ();=0D
 =0D
+  if (mS3Supported && (mBootMode !=3D BOOT_ON_S3_RESUME)) {=0D
+    //=0D
+    // This is the memory range that will be used for PEI on S3 resume=0D
+    //=0D
+    BuildMemoryAllocationHob (=0D
+      mS3AcpiReservedMemoryBase,=0D
+      mS3AcpiReservedMemorySize,=0D
+      EfiACPIMemoryNVS=0D
+      );=0D
+=0D
+    //=0D
+    // Cover the initial RAM area used as stack and temporary PEI heap.=0D
+    //=0D
+    // This is reserved as ACPI NVS so it can be used on S3 resume.=0D
+    //=0D
+    BuildMemoryAllocationHob (=0D
+      PcdGet32 (PcdOvmfSecPeiTempRamBase),=0D
+      PcdGet32 (PcdOvmfSecPeiTempRamSize),=0D
+      EfiACPIMemoryNVS=0D
+      );=0D
+=0D
+    //=0D
+    // SEC stores its table of GUIDed section handlers here.=0D
+    //=0D
+    BuildMemoryAllocationHob (=0D
+      PcdGet64 (PcdGuidedExtractHandlerTableAddress),=0D
+      PcdGet32 (PcdGuidedExtractHandlerTableSize),=0D
+      EfiACPIMemoryNVS=0D
+      );=0D
+=0D
+ #ifdef MDE_CPU_X64=0D
+    //=0D
+    // Reserve the initial page tables built by the reset vector code.=0D
+    //=0D
+    // Since this memory range will be used by the Reset Vector on S3=0D
+    // resume, it must be reserved as ACPI NVS.=0D
+    //=0D
+    BuildMemoryAllocationHob (=0D
+      (EFI_PHYSICAL_ADDRESS)(UINTN)PcdGet32 (PcdOvmfSecPageTablesBase),=0D
+      (UINT64)(UINTN)PcdGet32 (PcdOvmfSecPageTablesSize),=0D
+      EfiACPIMemoryNVS=0D
+      );=0D
+ #endif=0D
+  }=0D
+=0D
   if (mBootMode !=3D BOOT_ON_S3_RESUME) {=0D
     //=0D
     // Reserve the lock box storage area=0D
@@ -346,7 +404,7 @@ InitializeRamRegions (
     BuildMemoryAllocationHob (=0D
       (EFI_PHYSICAL_ADDRESS)(UINTN)PcdGet32 (PcdOvmfLockBoxStorageBase),=0D
       (UINT64)(UINTN)PcdGet32 (PcdOvmfLockBoxStorageSize),=0D
-      EfiBootServicesData=0D
+      mS3Supported ? EfiACPIMemoryNVS : EfiBootServicesData=0D
       );=0D
   }=0D
 }=0D
diff --git a/OvmfPkg/XenPlatformPei/Platform.c b/OvmfPkg/XenPlatformPei/Pla=
tform.c
index c3fdf3d0b8..1b074cff33 100644
--- a/OvmfPkg/XenPlatformPei/Platform.c
+++ b/OvmfPkg/XenPlatformPei/Platform.c
@@ -60,6 +60,8 @@ UINT16  mHostBridgeDevId;
 =0D
 EFI_BOOT_MODE  mBootMode =3D BOOT_WITH_FULL_CONFIGURATION;=0D
 =0D
+BOOLEAN  mS3Supported =3D FALSE;=0D
+=0D
 VOID=0D
 AddIoMemoryBaseSizeHob (=0D
   EFI_PHYSICAL_ADDRESS  MemoryBase,=0D
@@ -350,6 +352,11 @@ BootModeInitialization (
 =0D
   if (CmosRead8 (0xF) =3D=3D 0xFE) {=0D
     mBootMode =3D BOOT_ON_S3_RESUME;=0D
+    if (!mS3Supported) {=0D
+      DEBUG ((DEBUG_ERROR, "ERROR: S3 not supported\n"));=0D
+      ASSERT (FALSE);=0D
+      CpuDeadLoop ();=0D
+    }=0D
   }=0D
 =0D
   CmosWrite8 (0xF, 0x00);=0D
@@ -463,6 +470,7 @@ InitializeXenPlatform (
   //=0D
   if (QemuFwCfgS3Enabled ()) {=0D
     DEBUG ((DEBUG_INFO, "S3 support was detected on QEMU\n"));=0D
+    mS3Supported =3D TRUE;=0D
     Status =3D PcdSetBoolS (PcdAcpiS3Enable, TRUE);=0D
     ASSERT_EFI_ERROR (Status);=0D
   }=0D
@@ -481,9 +489,8 @@ InitializeXenPlatform (
 =0D
   InitializeRamRegions ();=0D
 =0D
-  CalibrateLapicTimer ();=0D
-=0D
   if (mBootMode !=3D BOOT_ON_S3_RESUME) {=0D
+    CalibrateLapicTimer ();=0D
     ReserveEmuVariableNvStore ();=0D
     PeiFvInitialization ();=0D
     MemMapInitialization ();=0D
diff --git a/OvmfPkg/XenPlatformPei/Platform.h b/OvmfPkg/XenPlatformPei/Pla=
tform.h
index 7b4de128e7..fda66747cc 100644
--- a/OvmfPkg/XenPlatformPei/Platform.h
+++ b/OvmfPkg/XenPlatformPei/Platform.h
@@ -139,4 +139,6 @@ extern UINT8  mPhysMemAddressWidth;
 =0D
 extern UINT16  mHostBridgeDevId;=0D
 =0D
+extern BOOLEAN  mS3Supported;=0D
+=0D
 #endif // _PLATFORM_PEI_H_INCLUDED_=0D
diff --git a/OvmfPkg/XenPlatformPei/XenPlatformPei.inf b/OvmfPkg/XenPlatfor=
mPei/XenPlatformPei.inf
index 20c27ff34b..a359cf60ca 100644
--- a/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
+++ b/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
@@ -69,9 +69,13 @@
   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfPeiMemFvSize=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfDxeMemFvBase=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfDxeMemFvSize=0D
+  gUefiOvmfPkgTokenSpaceGuid.PcdOvmfSecPeiTempRamBase=0D
+  gUefiOvmfPkgTokenSpaceGuid.PcdOvmfSecPeiTempRamSize=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfSecPageTablesBase=0D
+  gUefiOvmfPkgTokenSpaceGuid.PcdOvmfSecPageTablesSize=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfLockBoxStorageBase=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfLockBoxStorageSize=0D
+  gUefiOvmfPkgTokenSpaceGuid.PcdGuidedExtractHandlerTableSize=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdOvmfHostBridgePciDevId=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdPciIoBase=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdPciIoSize=0D
@@ -80,6 +84,7 @@
   gUefiOvmfPkgTokenSpaceGuid.PcdPciMmio64Base=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdPciMmio64Size=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdQ35TsegMbytes=0D
+  gEfiMdePkgTokenSpaceGuid.PcdGuidedExtractHandlerTableAddress=0D
   gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiS3Enable=0D
   gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize=0D
   gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvStoreReserved=0D
@@ -89,6 +94,8 @@
   gEfiMdePkgTokenSpaceGuid.PcdFSBClock=0D
   gEfiSecurityPkgTokenSpaceGuid.PcdOptionRomImageVerificationPolicy=0D
   gUefiCpuPkgTokenSpaceGuid.PcdCpuLocalApicBaseAddress=0D
+  gUefiCpuPkgTokenSpaceGuid.PcdCpuApStackSize=0D
+  gUefiCpuPkgTokenSpaceGuid.PcdCpuMaxLogicalProcessorNumber=0D
 =0D
   gUefiOvmfPkgTokenSpaceGuid.PcdXenPvhStartOfDayStructPtr=0D
   gUefiOvmfPkgTokenSpaceGuid.PcdXenPvhStartOfDayStructPtrSize=0D
--=20
2.34.1



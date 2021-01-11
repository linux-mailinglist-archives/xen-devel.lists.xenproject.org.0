Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7413F2F0B90
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 04:46:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64564.114054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyo9O-0003GD-Pz; Mon, 11 Jan 2021 03:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64564.114054; Mon, 11 Jan 2021 03:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyo9O-0003Fq-Mt; Mon, 11 Jan 2021 03:45:50 +0000
Received: by outflank-mailman (input) for mailman id 64564;
 Mon, 11 Jan 2021 03:45:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/gp=GO=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kyo9M-0003Fl-RQ
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 03:45:48 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a592978e-e943-47ca-8982-6cdec3ff514c;
 Mon, 11 Jan 2021 03:45:44 +0000 (UTC)
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
X-Inumbo-ID: a592978e-e943-47ca-8982-6cdec3ff514c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610336744;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=1C5lPKrm3JJgTidx9/nVfzAzXQv5xpOODqJzGEvbfyY=;
  b=OiX3YAx3a+BPUUUw3ksyIhQaGy/fC/hsEhd4PlkQ0GtW2oRIdn3df5F2
   e1o3om6Gm1GZw2PHmdKWnIEsLgBBHRffeFWJSzAV/7Znei+Rtp3kQ5RCM
   r6HGab4/SRsgu8jMVyJwLHvGLqMKteKNLkPnplaAqYBmwZa1cK997Kdlu
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 88uf2VZ6iKuZoAnejL2Z/V1MqM88PAnkiVS+VsCXYYouC5CiIMsQtKD9TDOrlpJLeRryuwFcBm
 +YJ8sg8mXqpVaLBfKApdbOEwRNKrf5ucHGOGznlJLD891uaXNXEnjJ+B1Udk8ehuiHOCaa/xOi
 xpaMrkgbIH2v3QoHEWEtjYrk5Y06nslp8WAxIR3vp4b/nc4Sl94OQWcQNIQuK50yS2nkJYrPlX
 lwXEjlMSeyGXDhg1fTvJPj8jueHOhY/Yk12v6eLOi512r3IPTOqb3tJGyxuY4w6cqmZtJK04yz
 kT4=
X-SBRS: 5.2
X-MesageID: 35011952
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,337,1602561600"; 
   d="scan'208";a="35011952"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <devel@edk2.groups.io>, <xen-devel@lists.xenproject.org>
CC: <jordan.l.justen@intel.com>, <lersek@redhat.com>,
	<ard.biesheuvel@arm.com>, <anthony.perard@citrix.com>, <julien@xen.org>,
	"Igor Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH] OvmfPkg/XenPlatformPei: Grab 64-bit PCI MMIO hole size from OVMF info table
Date: Mon, 11 Jan 2021 03:45:18 +0000
Message-ID: <1610336718-7064-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

We faced a problem with passing through a PCI device with 64GB BAR to UEFI
guest. The BAR is expectedly programmed into 64-bit PCI aperture at
64G address which pushes physical address space to 37 bits. That is above
36-bit width that OVMF exposes currently to a guest without tweaking
PcdPciMmio64Size knob.

We can't really set this knob to a very high value and expect that to work
on all CPUs as the max physical address width varies singnificantly between
models. We also can't simply take CPU address width at runtime and use that
as we need to cover all of that with indentity pages for DXE phase.

The exact size of upper PCI MMIO hole is only known after hvmloader placed
all of the BARs and calculated the necessary aperture which is exposed
through ACPI. This information is not readily available to OVMF at PEI phase.
So let's expose it using the existing extensible binary interface between
OVMF and hvmloader preserving compatibility.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---

The change is backward compatible and has a companion change for hvmloader.

Are we still waiting to clean up Xen stuff from QEMU platform? Or I need
to duplicate my changed there (I hope not)?

---
 OvmfPkg/XenPlatformPei/MemDetect.c |  6 ++++-
 OvmfPkg/XenPlatformPei/Platform.h  |  8 +++++++
 OvmfPkg/XenPlatformPei/Xen.c       | 47 ++++++++++++++++++++++++++++++++++++++
 OvmfPkg/XenPlatformPei/Xen.h       | 12 +++++++++-
 4 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/OvmfPkg/XenPlatformPei/MemDetect.c b/OvmfPkg/XenPlatformPei/MemDetect.c
index 1f81eee..4175a2f 100644
--- a/OvmfPkg/XenPlatformPei/MemDetect.c
+++ b/OvmfPkg/XenPlatformPei/MemDetect.c
@@ -227,6 +227,7 @@ GetFirstNonAddress (
   UINT64               FirstNonAddress;
   UINT64               Pci64Base, Pci64Size;
   RETURN_STATUS        PcdStatus;
+  EFI_STATUS           Status;
 
   FirstNonAddress = BASE_4GB + GetSystemMemorySizeAbove4gb ();
 
@@ -245,7 +246,10 @@ GetFirstNonAddress (
   // Otherwise, in order to calculate the highest address plus one, we must
   // consider the 64-bit PCI host aperture too. Fetch the default size.
   //
-  Pci64Size = PcdGet64 (PcdPciMmio64Size);
+  Status = XenGetPciMmioInfo (NULL, NULL, &Pci64Base, &Pci64Size);
+  if (EFI_ERROR (Status)) {
+    Pci64Size = PcdGet64 (PcdPciMmio64Size);
+  }
 
   if (Pci64Size == 0) {
     if (mBootMode != BOOT_ON_S3_RESUME) {
diff --git a/OvmfPkg/XenPlatformPei/Platform.h b/OvmfPkg/XenPlatformPei/Platform.h
index 7661f4a..6024cae 100644
--- a/OvmfPkg/XenPlatformPei/Platform.h
+++ b/OvmfPkg/XenPlatformPei/Platform.h
@@ -127,6 +127,14 @@ XenGetE820Map (
   UINT32 *Count
   );
 
+EFI_STATUS
+XenGetPciMmioInfo (
+  UINT64 *PciBase,
+  UINT64 *PciSize,
+  UINT64 *Pci64Base,
+  UINT64 *Pci64Size
+  );
+
 extern EFI_BOOT_MODE mBootMode;
 
 extern UINT8 mPhysMemAddressWidth;
diff --git a/OvmfPkg/XenPlatformPei/Xen.c b/OvmfPkg/XenPlatformPei/Xen.c
index c41fecd..3c1970d 100644
--- a/OvmfPkg/XenPlatformPei/Xen.c
+++ b/OvmfPkg/XenPlatformPei/Xen.c
@@ -114,6 +114,53 @@ XenGetE820Map (
 }
 
 /**
+  Returns layouts of PCI MMIO holes provided by hvmloader
+
+  @param PciBase      Pointer to MMIO hole base address
+  @param PciSize      Pointer to MMIO hole size
+  @param Pci64Base    Pointer to upper MMIO hole base address
+  @param Pci64Size    Pointer to upper MMIO hole size
+
+  @return EFI_STATUS
+**/
+EFI_STATUS
+XenGetPciMmioInfo (
+  UINT64 *PciBase,
+  UINT64 *PciSize,
+  UINT64 *Pci64Base,
+  UINT64 *Pci64Size
+  )
+{
+  UINT64 *Tables;
+  EFI_XEN_OVMF_PCI_INFO *PciInfo;
+
+  if (mXenHvmloaderInfo == NULL) {
+    return EFI_NOT_FOUND;
+  }
+
+  if (mXenHvmloaderInfo->TablesCount < OVMF_INFO_PCI_TABLE + 1) {
+    return EFI_UNSUPPORTED;
+  }
+
+  ASSERT (mXenHvmloaderInfo->Tables &&
+          mXenHvmloaderInfo->Tables < MAX_ADDRESS);
+  Tables = (UINT64 *) mXenHvmloaderInfo->Tables;
+  PciInfo = (EFI_XEN_OVMF_PCI_INFO *) Tables[OVMF_INFO_PCI_TABLE];
+
+  ASSERT (PciInfo && (EFI_PHYSICAL_ADDRESS) PciInfo < MAX_ADDRESS);
+  if (PciBase && PciSize) {
+    *PciBase = (UINT64) PciInfo->LowStart;
+    *PciSize = (UINT64) (PciInfo->LowEnd - PciInfo->LowStart);
+  }
+  if (Pci64Base && Pci64Size) {
+    *Pci64Base = (UINT64) PciInfo->HiStart;
+    *Pci64Size = (UINT64) (PciInfo->HiEnd - PciInfo->HiStart);
+  }
+
+  return EFI_SUCCESS;
+}
+
+/**
   Connects to the Hypervisor.
 
   @return EFI_STATUS
diff --git a/OvmfPkg/XenPlatformPei/Xen.h b/OvmfPkg/XenPlatformPei/Xen.h
index 2605481..c6e5fbb 100644
--- a/OvmfPkg/XenPlatformPei/Xen.h
+++ b/OvmfPkg/XenPlatformPei/Xen.h
@@ -15,7 +15,7 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
 // Physical address of OVMF info
 #define OVMF_INFO_PHYSICAL_ADDRESS 0x00001000
 
-// This structure must match the definition on Xen side
+// These structures must match the definition on Xen side
 #pragma pack(1)
 typedef struct {
   CHAR8 Signature[14]; // XenHVMOVMF\0
@@ -34,6 +34,16 @@ typedef struct {
   EFI_PHYSICAL_ADDRESS E820;
   UINT32 E820EntriesCount;
 } EFI_XEN_OVMF_INFO;
+
+// This extra table gives layout of PCI apertures in a Xen guest
+#define OVMF_INFO_PCI_TABLE 0
+
+typedef struct {
+  EFI_PHYSICAL_ADDRESS LowStart;
+  EFI_PHYSICAL_ADDRESS LowEnd;
+  EFI_PHYSICAL_ADDRESS HiStart;
+  EFI_PHYSICAL_ADDRESS HiEnd;
+} EFI_XEN_OVMF_PCI_INFO;
 #pragma pack()
 
 #endif /* __XEN_H__ */
-- 
2.7.4



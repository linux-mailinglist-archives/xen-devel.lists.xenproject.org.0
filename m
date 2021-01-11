Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23342F0DA3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 09:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64638.114213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kysHb-0003Wd-N0; Mon, 11 Jan 2021 08:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64638.114213; Mon, 11 Jan 2021 08:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kysHb-0003WE-K1; Mon, 11 Jan 2021 08:10:35 +0000
Received: by outflank-mailman (input) for mailman id 64638;
 Mon, 11 Jan 2021 08:10:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BX5B=GO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1kysHZ-0003W9-K9
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 08:10:33 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6c11db04-1c05-4695-a34c-3e8ae3f24c05;
 Mon, 11 Jan 2021 08:10:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-xZf6r_AXN1K6LbQDAjJQDw-1; Mon, 11 Jan 2021 03:10:24 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDD5618C89C4;
 Mon, 11 Jan 2021 08:10:22 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-91.ams2.redhat.com
 [10.36.113.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 435D219D9D;
 Mon, 11 Jan 2021 08:10:20 +0000 (UTC)
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
X-Inumbo-ID: 6c11db04-1c05-4695-a34c-3e8ae3f24c05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610352630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEGE2CW9O+xWKFII5oHeZYXI7lYqQ+f33NJeXJj5SpQ=;
	b=B92CsUx1NnT7fkS+7T3xO9hX1w5P6caw0SgGQmL27ydkzMbRoN3FxmXDEgk3JWprI08Gfk
	SeRkfb/pG5FMmnW8W8Yk36lWcQtMOlHb6KdINGC28sT9MkDur7dXMA24TY/Qbvn4VgCNQW
	vfL/lXVMV5o9giaF4yiRMOOE1xcECxk=
X-MC-Unique: xZf6r_AXN1K6LbQDAjJQDw-1
Subject: Re: [PATCH] OvmfPkg/XenPlatformPei: Grab 64-bit PCI MMIO hole size
 from OVMF info table
To: Igor Druzhinin <igor.druzhinin@citrix.com>, devel@edk2.groups.io,
 xen-devel@lists.xenproject.org
Cc: jordan.l.justen@intel.com, ard.biesheuvel@arm.com,
 anthony.perard@citrix.com, julien@xen.org
References: <1610336718-7064-1-git-send-email-igor.druzhinin@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <1bf69ab6-a183-f6d6-293b-1db2bea78fdc@redhat.com>
Date: Mon, 11 Jan 2021 09:10:19 +0100
MIME-Version: 1.0
In-Reply-To: <1610336718-7064-1-git-send-email-igor.druzhinin@citrix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/21 04:45, Igor Druzhinin wrote:
> We faced a problem with passing through a PCI device with 64GB BAR to UEFI
> guest. The BAR is expectedly programmed into 64-bit PCI aperture at
> 64G address which pushes physical address space to 37 bits. That is above
> 36-bit width that OVMF exposes currently to a guest without tweaking
> PcdPciMmio64Size knob.
> 
> We can't really set this knob to a very high value and expect that to work
> on all CPUs as the max physical address width varies singnificantly between
> models. We also can't simply take CPU address width at runtime and use that
> as we need to cover all of that with indentity pages for DXE phase.
> 
> The exact size of upper PCI MMIO hole is only known after hvmloader placed
> all of the BARs and calculated the necessary aperture which is exposed
> through ACPI. This information is not readily available to OVMF at PEI phase.
> So let's expose it using the existing extensible binary interface between
> OVMF and hvmloader preserving compatibility.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
> 
> The change is backward compatible and has a companion change for hvmloader.
> 
> Are we still waiting to clean up Xen stuff from QEMU platform?

Yes, this BZ is still open:

  https://bugzilla.tianocore.org/show_bug.cgi?id=2122

That said...

> Or I need to duplicate my changed there (I hope not)?

... I hope not, as well.

(The automated solution of this issue remains unsolved for QEMU; we
sometimes revise it, but it's a very tough nut to crack. Users have been
able to tweak the aperture size with the experimental (no support
promised) fw_cfg file "opt/ovmf/X-PciMmio64Mb". But Xen has no fw_cfg,
so this patch certainly looks justified.)

Some style comments:

> 
> ---
>  OvmfPkg/XenPlatformPei/MemDetect.c |  6 ++++-
>  OvmfPkg/XenPlatformPei/Platform.h  |  8 +++++++
>  OvmfPkg/XenPlatformPei/Xen.c       | 47 ++++++++++++++++++++++++++++++++++++++
>  OvmfPkg/XenPlatformPei/Xen.h       | 12 +++++++++-
>  4 files changed, 71 insertions(+), 2 deletions(-)
> 
> diff --git a/OvmfPkg/XenPlatformPei/MemDetect.c b/OvmfPkg/XenPlatformPei/MemDetect.c
> index 1f81eee..4175a2f 100644
> --- a/OvmfPkg/XenPlatformPei/MemDetect.c
> +++ b/OvmfPkg/XenPlatformPei/MemDetect.c
> @@ -227,6 +227,7 @@ GetFirstNonAddress (
>    UINT64               FirstNonAddress;
>    UINT64               Pci64Base, Pci64Size;
>    RETURN_STATUS        PcdStatus;
> +  EFI_STATUS           Status;
>  
>    FirstNonAddress = BASE_4GB + GetSystemMemorySizeAbove4gb ();
>  
> @@ -245,7 +246,10 @@ GetFirstNonAddress (
>    // Otherwise, in order to calculate the highest address plus one, we must
>    // consider the 64-bit PCI host aperture too. Fetch the default size.
>    //
> -  Pci64Size = PcdGet64 (PcdPciMmio64Size);
> +  Status = XenGetPciMmioInfo (NULL, NULL, &Pci64Base, &Pci64Size);
> +  if (EFI_ERROR (Status)) {
> +    Pci64Size = PcdGet64 (PcdPciMmio64Size);
> +  }
>  
>    if (Pci64Size == 0) {
>      if (mBootMode != BOOT_ON_S3_RESUME) {
> diff --git a/OvmfPkg/XenPlatformPei/Platform.h b/OvmfPkg/XenPlatformPei/Platform.h
> index 7661f4a..6024cae 100644
> --- a/OvmfPkg/XenPlatformPei/Platform.h
> +++ b/OvmfPkg/XenPlatformPei/Platform.h
> @@ -127,6 +127,14 @@ XenGetE820Map (
>    UINT32 *Count
>    );
>  
> +EFI_STATUS
> +XenGetPciMmioInfo (
> +  UINT64 *PciBase,
> +  UINT64 *PciSize,
> +  UINT64 *Pci64Base,
> +  UINT64 *Pci64Size
> +  );
> +
>  extern EFI_BOOT_MODE mBootMode;
>  
>  extern UINT8 mPhysMemAddressWidth;
> diff --git a/OvmfPkg/XenPlatformPei/Xen.c b/OvmfPkg/XenPlatformPei/Xen.c
> index c41fecd..3c1970d 100644
> --- a/OvmfPkg/XenPlatformPei/Xen.c
> +++ b/OvmfPkg/XenPlatformPei/Xen.c
> @@ -114,6 +114,53 @@ XenGetE820Map (
>  }
>  
>  /**
> +  Returns layouts of PCI MMIO holes provided by hvmloader
> +
> +  @param PciBase      Pointer to MMIO hole base address
> +  @param PciSize      Pointer to MMIO hole size
> +  @param Pci64Base    Pointer to upper MMIO hole base address
> +  @param Pci64Size    Pointer to upper MMIO hole size
> +
> +  @return EFI_STATUS
> +**/
> +EFI_STATUS
> +XenGetPciMmioInfo (
> +  UINT64 *PciBase,
> +  UINT64 *PciSize,
> +  UINT64 *Pci64Base,
> +  UINT64 *Pci64Size
> +  )
> +{
> +  UINT64 *Tables;
> +  EFI_XEN_OVMF_PCI_INFO *PciInfo;
> +
> +  if (mXenHvmloaderInfo == NULL) {
> +    return EFI_NOT_FOUND;
> +  }
> +
> +  if (mXenHvmloaderInfo->TablesCount < OVMF_INFO_PCI_TABLE + 1) {
> +    return EFI_UNSUPPORTED;
> +  }
> +
> +  ASSERT (mXenHvmloaderInfo->Tables &&

(1) Please spell out:

  mXenHvmloaderInfo->Tables != 0

> +          mXenHvmloaderInfo->Tables < MAX_ADDRESS);
> +  Tables = (UINT64 *) mXenHvmloaderInfo->Tables;
> +  PciInfo = (EFI_XEN_OVMF_PCI_INFO *) Tables[OVMF_INFO_PCI_TABLE];
> +
> +  ASSERT (PciInfo && (EFI_PHYSICAL_ADDRESS) PciInfo < MAX_ADDRESS);

(2) Please spell out

  PciInfo != NULL

> +  if (PciBase && PciSize) {

(3) Same here -- please use explicit comparisons.

> +    *PciBase = (UINT64) PciInfo->LowStart;
> +    *PciSize = (UINT64) (PciInfo->LowEnd - PciInfo->LowStart);
> +  }
> +  if (Pci64Base && Pci64Size) {

(4) Ditto

I'll wait for feedback from the OvmfPkg Xen reviewers; from my side,
with the style warts fixed:

Acked-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo

> +    *Pci64Base = (UINT64) PciInfo->HiStart;
> +    *Pci64Size = (UINT64) (PciInfo->HiEnd - PciInfo->HiStart);
> +  }
> +
> +  return EFI_SUCCESS;
> +}
> +
> +/**
>    Connects to the Hypervisor.
>  
>    @return EFI_STATUS
> diff --git a/OvmfPkg/XenPlatformPei/Xen.h b/OvmfPkg/XenPlatformPei/Xen.h
> index 2605481..c6e5fbb 100644
> --- a/OvmfPkg/XenPlatformPei/Xen.h
> +++ b/OvmfPkg/XenPlatformPei/Xen.h
> @@ -15,7 +15,7 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
>  // Physical address of OVMF info
>  #define OVMF_INFO_PHYSICAL_ADDRESS 0x00001000
>  
> -// This structure must match the definition on Xen side
> +// These structures must match the definition on Xen side
>  #pragma pack(1)
>  typedef struct {
>    CHAR8 Signature[14]; // XenHVMOVMF\0
> @@ -34,6 +34,16 @@ typedef struct {
>    EFI_PHYSICAL_ADDRESS E820;
>    UINT32 E820EntriesCount;
>  } EFI_XEN_OVMF_INFO;
> +
> +// This extra table gives layout of PCI apertures in a Xen guest
> +#define OVMF_INFO_PCI_TABLE 0
> +
> +typedef struct {
> +  EFI_PHYSICAL_ADDRESS LowStart;
> +  EFI_PHYSICAL_ADDRESS LowEnd;
> +  EFI_PHYSICAL_ADDRESS HiStart;
> +  EFI_PHYSICAL_ADDRESS HiEnd;
> +} EFI_XEN_OVMF_PCI_INFO;
>  #pragma pack()
>  
>  #endif /* __XEN_H__ */
> 



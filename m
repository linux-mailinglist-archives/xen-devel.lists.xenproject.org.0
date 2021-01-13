Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD32F42A8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 04:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66277.117647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzXFr-0004vb-Cq; Wed, 13 Jan 2021 03:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66277.117647; Wed, 13 Jan 2021 03:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzXFr-0004vC-9V; Wed, 13 Jan 2021 03:55:31 +0000
Received: by outflank-mailman (input) for mailman id 66277;
 Wed, 13 Jan 2021 03:55:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=voKE=GQ=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1kzXFp-0004v7-SO
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 03:55:29 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3053d8c9-b79b-424f-81ae-e0cbafba3864;
 Wed, 13 Jan 2021 03:55:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-o5b6ravYNPC3f8dX6H_reg-1; Tue, 12 Jan 2021 22:55:23 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01C3AA0CA0;
 Wed, 13 Jan 2021 03:55:22 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-31.ams2.redhat.com
 [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D07FD60BFA;
 Wed, 13 Jan 2021 03:55:19 +0000 (UTC)
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
X-Inumbo-ID: 3053d8c9-b79b-424f-81ae-e0cbafba3864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610510127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDnfR6i4+wclQoN2h/NzWF1XfqOwAxtIMR+PA+ZgZ4U=;
	b=LP9DkW0ZK2SPRpAysExqv/LHA7kEruS34eFGQw2bdYyM1QDBh7cxeCM9nqvkPFe8tuQ5Jm
	OohxqIBnPQkfz24Y1wSWyGfnHfA5lLV8hJgSU+eRhpXtVREopi/XQJj/GcSTRbuTEJa3CE
	452+CZHqc7xtMUp7p6MghKK5BfB3an8=
X-MC-Unique: o5b6ravYNPC3f8dX6H_reg-1
Subject: Re: [PATCH] OvmfPkg/XenPlatformPei: Use CPUID to get physical address
 width on Xen
To: Igor Druzhinin <igor.druzhinin@citrix.com>, devel@edk2.groups.io,
 xen-devel@lists.xenproject.org
Cc: jordan.l.justen@intel.com, ard.biesheuvel@arm.com,
 anthony.perard@citrix.com, julien@xen.org
References: <1610509335-23314-1-git-send-email-igor.druzhinin@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <7d64e987-e24a-e017-92e0-fcca01999438@redhat.com>
Date: Wed, 13 Jan 2021 04:55:18 +0100
MIME-Version: 1.0
In-Reply-To: <1610509335-23314-1-git-send-email-igor.druzhinin@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/13/21 04:42, Igor Druzhinin wrote:
> We faced a problem with passing through a PCI device with 64GB BAR to
> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
> 64G address which pushes physical address space to 37 bits. That is above
> 36-bit width that OVMF exposes currently to a guest without tweaking
> PcdPciMmio64Size knob.
> 
> The reverse calculation using this knob was inhereted from QEMU-KVM platform
> code where it serves the purpose of finding max accessible physical
> address without necessary trusting emulated CPUID physbits value (that could
> be different from host physbits). On Xen we expect to use CPUID policy
> to level the data correctly to prevent situations with guest physbits >
> host physbits e.g. across migrations.
> 
> The next aspect raising concern - resource consumption for DXE IPL page tables
> and time required to map the whole address space in case of using CPUID
> bits directly. That could be mitigated by enabling support for 1G pages
> in DXE IPL configuration. 1G pages are available on most CPUs produced in
> the last 10 years and those without don't have many phys bits.
> 
> Remove all the redundant code now (including PcdPciMmio64.. handling that's
> not used on Xen anyway) and grab physbits directly from CPUID that should
> be what baremetal UEFI systems do.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
>  OvmfPkg/OvmfXen.dsc                |   3 +
>  OvmfPkg/XenPlatformPei/MemDetect.c | 166 +++----------------------------------
>  2 files changed, 15 insertions(+), 154 deletions(-)

Acked-by: Laszlo Ersek <lersek@redhat.com>

Anthony and/or Julien should also approve this patch (and anyone from
the Xen community is welcome to comment of course, as always).

Thanks
Laszlo


> diff --git a/OvmfPkg/OvmfXen.dsc b/OvmfPkg/OvmfXen.dsc
> index 7d31e88..8ae6ed0 100644
> --- a/OvmfPkg/OvmfXen.dsc
> +++ b/OvmfPkg/OvmfXen.dsc
> @@ -444,6 +444,9 @@
>    ## Xen vlapic's frequence is 100 MHz
>    gEfiMdePkgTokenSpaceGuid.PcdFSBClock|100000000
>  
> +  # We populate DXE IPL tables with 1G pages preferably on Xen
> +  gEfiMdeModulePkgTokenSpaceGuid.PcdUse1GPageTable|TRUE
> +
>  ################################################################################
>  #
>  # Pcd Dynamic Section - list of all EDK II PCD Entries defined by this Platform
> diff --git a/OvmfPkg/XenPlatformPei/MemDetect.c b/OvmfPkg/XenPlatformPei/MemDetect.c
> index 1f81eee..1970b63 100644
> --- a/OvmfPkg/XenPlatformPei/MemDetect.c
> +++ b/OvmfPkg/XenPlatformPei/MemDetect.c
> @@ -172,175 +172,33 @@ GetSystemMemorySizeBelow4gb (
>    return (UINT32) (((UINTN)((Cmos0x35 << 8) + Cmos0x34) << 16) + SIZE_16MB);
>  }
>  
> -
> -STATIC
> -UINT64
> -GetSystemMemorySizeAbove4gb (
> -  )
> -{
> -  UINT32 Size;
> -  UINTN  CmosIndex;
> -
> -  //
> -  // In PVH case, there is no CMOS, we have to calculate the memory size
> -  // from parsing the E820
> -  //
> -  if (XenPvhDetected ()) {
> -    UINT64  HighestAddress;
> -
> -    HighestAddress = GetHighestSystemMemoryAddress (FALSE);
> -    ASSERT (HighestAddress == 0 || HighestAddress >= BASE_4GB);
> -
> -    if (HighestAddress >= BASE_4GB) {
> -      HighestAddress -= BASE_4GB;
> -    }
> -
> -    return HighestAddress;
> -  }
> -
> -  //
> -  // CMOS 0x5b-0x5d specifies the system memory above 4GB MB.
> -  // * CMOS(0x5d) is the most significant size byte
> -  // * CMOS(0x5c) is the middle size byte
> -  // * CMOS(0x5b) is the least significant size byte
> -  // * The size is specified in 64kb chunks
> -  //
> -
> -  Size = 0;
> -  for (CmosIndex = 0x5d; CmosIndex >= 0x5b; CmosIndex--) {
> -    Size = (UINT32) (Size << 8) + (UINT32) CmosRead8 (CmosIndex);
> -  }
> -
> -  return LShiftU64 (Size, 16);
> -}
> -
> -
> -/**
> -  Return the highest address that DXE could possibly use, plus one.
> -**/
> -STATIC
> -UINT64
> -GetFirstNonAddress (
> -  VOID
> -  )
> -{
> -  UINT64               FirstNonAddress;
> -  UINT64               Pci64Base, Pci64Size;
> -  RETURN_STATUS        PcdStatus;
> -
> -  FirstNonAddress = BASE_4GB + GetSystemMemorySizeAbove4gb ();
> -
> -  //
> -  // If DXE is 32-bit, then we're done; PciBusDxe will degrade 64-bit MMIO
> -  // resources to 32-bit anyway. See DegradeResource() in
> -  // "PciResourceSupport.c".
> -  //
> -#ifdef MDE_CPU_IA32
> -  if (!FeaturePcdGet (PcdDxeIplSwitchToLongMode)) {
> -    return FirstNonAddress;
> -  }
> -#endif
> -
> -  //
> -  // Otherwise, in order to calculate the highest address plus one, we must
> -  // consider the 64-bit PCI host aperture too. Fetch the default size.
> -  //
> -  Pci64Size = PcdGet64 (PcdPciMmio64Size);
> -
> -  if (Pci64Size == 0) {
> -    if (mBootMode != BOOT_ON_S3_RESUME) {
> -      DEBUG ((DEBUG_INFO, "%a: disabling 64-bit PCI host aperture\n",
> -        __FUNCTION__));
> -      PcdStatus = PcdSet64S (PcdPciMmio64Size, 0);
> -      ASSERT_RETURN_ERROR (PcdStatus);
> -    }
> -
> -    //
> -    // There's nothing more to do; the amount of memory above 4GB fully
> -    // determines the highest address plus one. The memory hotplug area (see
> -    // below) plays no role for the firmware in this case.
> -    //
> -    return FirstNonAddress;
> -  }
> -
> -  //
> -  // SeaBIOS aligns both boundaries of the 64-bit PCI host aperture to 1GB, so
> -  // that the host can map it with 1GB hugepages. Follow suit.
> -  //
> -  Pci64Base = ALIGN_VALUE (FirstNonAddress, (UINT64)SIZE_1GB);
> -  Pci64Size = ALIGN_VALUE (Pci64Size, (UINT64)SIZE_1GB);
> -
> -  //
> -  // The 64-bit PCI host aperture should also be "naturally" aligned. The
> -  // alignment is determined by rounding the size of the aperture down to the
> -  // next smaller or equal power of two. That is, align the aperture by the
> -  // largest BAR size that can fit into it.
> -  //
> -  Pci64Base = ALIGN_VALUE (Pci64Base, GetPowerOfTwo64 (Pci64Size));
> -
> -  if (mBootMode != BOOT_ON_S3_RESUME) {
> -    //
> -    // The core PciHostBridgeDxe driver will automatically add this range to
> -    // the GCD memory space map through our PciHostBridgeLib instance; here we
> -    // only need to set the PCDs.
> -    //
> -    PcdStatus = PcdSet64S (PcdPciMmio64Base, Pci64Base);
> -    ASSERT_RETURN_ERROR (PcdStatus);
> -    PcdStatus = PcdSet64S (PcdPciMmio64Size, Pci64Size);
> -    ASSERT_RETURN_ERROR (PcdStatus);
> -
> -    DEBUG ((DEBUG_INFO, "%a: Pci64Base=0x%Lx Pci64Size=0x%Lx\n",
> -      __FUNCTION__, Pci64Base, Pci64Size));
> -  }
> -
> -  //
> -  // The useful address space ends with the 64-bit PCI host aperture.
> -  //
> -  FirstNonAddress = Pci64Base + Pci64Size;
> -  return FirstNonAddress;
> -}
> -
> -
>  /**
> -  Initialize the mPhysMemAddressWidth variable, based on guest RAM size.
> +  Initialize the mPhysMemAddressWidth variable, based on CPUID data.
>  **/
>  VOID
>  AddressWidthInitialization (
>    VOID
>    )
>  {
> -  UINT64 FirstNonAddress;
> +  UINT32 RegEax;
>  
> -  //
> -  // As guest-physical memory size grows, the permanent PEI RAM requirements
> -  // are dominated by the identity-mapping page tables built by the DXE IPL.
> -  // The DXL IPL keys off of the physical address bits advertized in the CPU
> -  // HOB. To conserve memory, we calculate the minimum address width here.
> -  //
> -  FirstNonAddress      = GetFirstNonAddress ();
> -  mPhysMemAddressWidth = (UINT8)HighBitSet64 (FirstNonAddress);
> -
> -  //
> -  // If FirstNonAddress is not an integral power of two, then we need an
> -  // additional bit.
> -  //
> -  if ((FirstNonAddress & (FirstNonAddress - 1)) != 0) {
> -    ++mPhysMemAddressWidth;
> +  AsmCpuid (0x80000000, &RegEax, NULL, NULL, NULL);
> +  if (RegEax >= 0x80000008) {
> +    AsmCpuid (0x80000008, &RegEax, NULL, NULL, NULL);
> +    mPhysMemAddressWidth = (UINT8) RegEax;
> +  } else {
> +    mPhysMemAddressWidth = 36;
>    }
>  
>    //
> -  // The minimum address width is 36 (covers up to and excluding 64 GB, which
> -  // is the maximum for Ia32 + PAE). The theoretical architecture maximum for
> -  // X64 long mode is 52 bits, but the DXE IPL clamps that down to 48 bits. We
> -  // can simply assert that here, since 48 bits are good enough for 256 TB.
> +  // IA-32e paging translates 48-bit linear addresses to 52-bit physical addresses.
>    //
> -  if (mPhysMemAddressWidth <= 36) {
> -    mPhysMemAddressWidth = 36;
> +  ASSERT (mPhysMemAddressWidth <= 52);
> +  if (mPhysMemAddressWidth > 48) {
> +    mPhysMemAddressWidth = 48;
>    }
> -  ASSERT (mPhysMemAddressWidth <= 48);
>  }
>  
> -
>  /**
>    Calculate the cap for the permanent PEI memory.
>  **/
> 



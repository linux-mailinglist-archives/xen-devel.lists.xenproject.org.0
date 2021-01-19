Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750152FB9C8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 15:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70437.126394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sKL-0000Z2-31; Tue, 19 Jan 2021 14:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70437.126394; Tue, 19 Jan 2021 14:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sKK-0000Yd-Vv; Tue, 19 Jan 2021 14:49:48 +0000
Received: by outflank-mailman (input) for mailman id 70437;
 Tue, 19 Jan 2021 14:49:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNnx=GW=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1l1sKJ-0000YY-At
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:49:47 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6ba696d7-4307-42c4-992e-06758c4d2a92;
 Tue, 19 Jan 2021 14:49:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-gyd7HH2fNwmbz6id3ru8nQ-1; Tue, 19 Jan 2021 09:49:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A56559;
 Tue, 19 Jan 2021 14:49:38 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-176.ams2.redhat.com
 [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86489627DC;
 Tue, 19 Jan 2021 14:49:35 +0000 (UTC)
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
X-Inumbo-ID: 6ba696d7-4307-42c4-992e-06758c4d2a92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611067785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBZ8bO2JubL3/58XeZTNbiFuEBmJ4SeD5P9xjBx42pk=;
	b=CpohqDW2+eOFraltbBNyfYmrts6O6uMewQe44eEIg4eCqKEZP/oG+HhmJcJ7DFewjZAO6l
	MlRxyjy9UjZnxm/MdcsPJ/PK/7YAulo+qZc0p3m3e3S4fc8yVQzmTRuSalbxkildwx9E8k
	35fl/RkNnDcVWCGqmrF5XEgvAB+TPE8=
X-MC-Unique: gyd7HH2fNwmbz6id3ru8nQ-1
Subject: Re: [edk2-devel] [PATCH] OvmfPkg/XenPlatformPei: Use CPUID to get
 physical address width on Xen
To: devel@edk2.groups.io, julien@xen.org,
 Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Cc: jordan.l.justen@intel.com, ard.biesheuvel@arm.com,
 anthony.perard@citrix.com
References: <1610509335-23314-1-git-send-email-igor.druzhinin@citrix.com>
 <2a806f26-04f7-a96b-522c-118ac94df8c0@xen.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0d7ad7aa-cfa9-5f2c-26e3-6b371737f6bc@redhat.com>
Date: Tue, 19 Jan 2021 15:49:34 +0100
MIME-Version: 1.0
In-Reply-To: <2a806f26-04f7-a96b-522c-118ac94df8c0@xen.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/19/21 10:37, Julien Grall wrote:
> Hi Igor,
> 
> On 13/01/2021 03:42, Igor Druzhinin wrote:
>> We faced a problem with passing through a PCI device with 64GB BAR to
>> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
>> 64G address which pushes physical address space to 37 bits. That is above
>> 36-bit width that OVMF exposes currently to a guest without tweaking
>> PcdPciMmio64Size knob.
>>
>> The reverse calculation using this knob was inhereted from QEMU-KVM
>> platform
>> code where it serves the purpose of finding max accessible physical
>> address without necessary trusting emulated CPUID physbits value (that
>> could
>> be different from host physbits). On Xen we expect to use CPUID policy
>> to level the data correctly to prevent situations with guest physbits >
>> host physbits e.g. across migrations.
>>
>> The next aspect raising concern - resource consumption for DXE IPL
>> page tables
>> and time required to map the whole address space in case of using CPUID
>> bits directly. That could be mitigated by enabling support for 1G pages
>> in DXE IPL configuration. 1G pages are available on most CPUs produced in
>> the last 10 years and those without don't have many phys bits.
>>
>> Remove all the redundant code now (including PcdPciMmio64.. handling
>> that's
>> not used on Xen anyway) and grab physbits directly from CPUID that should
>> be what baremetal UEFI systems do.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> 
> Reviewed-by: Julien Grall <julien@xen.org>

I'm going to hold this patch until Anthony responds in this thread as well:

http://mid.mail-archive.com/63cf6053-9787-d8cf-db18-982ebcab1780@citrix.com
https://edk2.groups.io/g/devel/message/70541

Thanks
Laszlo

> 
> Cheers,
> 
>> ---
>>   OvmfPkg/OvmfXen.dsc                |   3 +
>>   OvmfPkg/XenPlatformPei/MemDetect.c | 166
>> +++----------------------------------
>>   2 files changed, 15 insertions(+), 154 deletions(-)
>>
>> diff --git a/OvmfPkg/OvmfXen.dsc b/OvmfPkg/OvmfXen.dsc
>> index 7d31e88..8ae6ed0 100644
>> --- a/OvmfPkg/OvmfXen.dsc
>> +++ b/OvmfPkg/OvmfXen.dsc
>> @@ -444,6 +444,9 @@
>>     ## Xen vlapic's frequence is 100 MHz
>>     gEfiMdePkgTokenSpaceGuid.PcdFSBClock|100000000
>>   +  # We populate DXE IPL tables with 1G pages preferably on Xen
>> +  gEfiMdeModulePkgTokenSpaceGuid.PcdUse1GPageTable|TRUE
>> +
>>  
>> ################################################################################
>>
>>   #
>>   # Pcd Dynamic Section - list of all EDK II PCD Entries defined by
>> this Platform
>> diff --git a/OvmfPkg/XenPlatformPei/MemDetect.c
>> b/OvmfPkg/XenPlatformPei/MemDetect.c
>> index 1f81eee..1970b63 100644
>> --- a/OvmfPkg/XenPlatformPei/MemDetect.c
>> +++ b/OvmfPkg/XenPlatformPei/MemDetect.c
>> @@ -172,175 +172,33 @@ GetSystemMemorySizeBelow4gb (
>>     return (UINT32) (((UINTN)((Cmos0x35 << 8) + Cmos0x34) << 16) +
>> SIZE_16MB);
>>   }
>>   -
>> -STATIC
>> -UINT64
>> -GetSystemMemorySizeAbove4gb (
>> -  )
>> -{
>> -  UINT32 Size;
>> -  UINTN  CmosIndex;
>> -
>> -  //
>> -  // In PVH case, there is no CMOS, we have to calculate the memory size
>> -  // from parsing the E820
>> -  //
>> -  if (XenPvhDetected ()) {
>> -    UINT64  HighestAddress;
>> -
>> -    HighestAddress = GetHighestSystemMemoryAddress (FALSE);
>> -    ASSERT (HighestAddress == 0 || HighestAddress >= BASE_4GB);
>> -
>> -    if (HighestAddress >= BASE_4GB) {
>> -      HighestAddress -= BASE_4GB;
>> -    }
>> -
>> -    return HighestAddress;
>> -  }
>> -
>> -  //
>> -  // CMOS 0x5b-0x5d specifies the system memory above 4GB MB.
>> -  // * CMOS(0x5d) is the most significant size byte
>> -  // * CMOS(0x5c) is the middle size byte
>> -  // * CMOS(0x5b) is the least significant size byte
>> -  // * The size is specified in 64kb chunks
>> -  //
>> -
>> -  Size = 0;
>> -  for (CmosIndex = 0x5d; CmosIndex >= 0x5b; CmosIndex--) {
>> -    Size = (UINT32) (Size << 8) + (UINT32) CmosRead8 (CmosIndex);
>> -  }
>> -
>> -  return LShiftU64 (Size, 16);
>> -}
>> -
>> -
>> -/**
>> -  Return the highest address that DXE could possibly use, plus one.
>> -**/
>> -STATIC
>> -UINT64
>> -GetFirstNonAddress (
>> -  VOID
>> -  )
>> -{
>> -  UINT64               FirstNonAddress;
>> -  UINT64               Pci64Base, Pci64Size;
>> -  RETURN_STATUS        PcdStatus;
>> -
>> -  FirstNonAddress = BASE_4GB + GetSystemMemorySizeAbove4gb ();
>> -
>> -  //
>> -  // If DXE is 32-bit, then we're done; PciBusDxe will degrade 64-bit
>> MMIO
>> -  // resources to 32-bit anyway. See DegradeResource() in
>> -  // "PciResourceSupport.c".
>> -  //
>> -#ifdef MDE_CPU_IA32
>> -  if (!FeaturePcdGet (PcdDxeIplSwitchToLongMode)) {
>> -    return FirstNonAddress;
>> -  }
>> -#endif
>> -
>> -  //
>> -  // Otherwise, in order to calculate the highest address plus one,
>> we must
>> -  // consider the 64-bit PCI host aperture too. Fetch the default size.
>> -  //
>> -  Pci64Size = PcdGet64 (PcdPciMmio64Size);
>> -
>> -  if (Pci64Size == 0) {
>> -    if (mBootMode != BOOT_ON_S3_RESUME) {
>> -      DEBUG ((DEBUG_INFO, "%a: disabling 64-bit PCI host aperture\n",
>> -        __FUNCTION__));
>> -      PcdStatus = PcdSet64S (PcdPciMmio64Size, 0);
>> -      ASSERT_RETURN_ERROR (PcdStatus);
>> -    }
>> -
>> -    //
>> -    // There's nothing more to do; the amount of memory above 4GB fully
>> -    // determines the highest address plus one. The memory hotplug
>> area (see
>> -    // below) plays no role for the firmware in this case.
>> -    //
>> -    return FirstNonAddress;
>> -  }
>> -
>> -  //
>> -  // SeaBIOS aligns both boundaries of the 64-bit PCI host aperture
>> to 1GB, so
>> -  // that the host can map it with 1GB hugepages. Follow suit.
>> -  //
>> -  Pci64Base = ALIGN_VALUE (FirstNonAddress, (UINT64)SIZE_1GB);
>> -  Pci64Size = ALIGN_VALUE (Pci64Size, (UINT64)SIZE_1GB);
>> -
>> -  //
>> -  // The 64-bit PCI host aperture should also be "naturally" aligned.
>> The
>> -  // alignment is determined by rounding the size of the aperture
>> down to the
>> -  // next smaller or equal power of two. That is, align the aperture
>> by the
>> -  // largest BAR size that can fit into it.
>> -  //
>> -  Pci64Base = ALIGN_VALUE (Pci64Base, GetPowerOfTwo64 (Pci64Size));
>> -
>> -  if (mBootMode != BOOT_ON_S3_RESUME) {
>> -    //
>> -    // The core PciHostBridgeDxe driver will automatically add this
>> range to
>> -    // the GCD memory space map through our PciHostBridgeLib
>> instance; here we
>> -    // only need to set the PCDs.
>> -    //
>> -    PcdStatus = PcdSet64S (PcdPciMmio64Base, Pci64Base);
>> -    ASSERT_RETURN_ERROR (PcdStatus);
>> -    PcdStatus = PcdSet64S (PcdPciMmio64Size, Pci64Size);
>> -    ASSERT_RETURN_ERROR (PcdStatus);
>> -
>> -    DEBUG ((DEBUG_INFO, "%a: Pci64Base=0x%Lx Pci64Size=0x%Lx\n",
>> -      __FUNCTION__, Pci64Base, Pci64Size));
>> -  }
>> -
>> -  //
>> -  // The useful address space ends with the 64-bit PCI host aperture.
>> -  //
>> -  FirstNonAddress = Pci64Base + Pci64Size;
>> -  return FirstNonAddress;
>> -}
>> -
>> -
>>   /**
>> -  Initialize the mPhysMemAddressWidth variable, based on guest RAM size.
>> +  Initialize the mPhysMemAddressWidth variable, based on CPUID data.
>>   **/
>>   VOID
>>   AddressWidthInitialization (
>>     VOID
>>     )
>>   {
>> -  UINT64 FirstNonAddress;
>> +  UINT32 RegEax;
>>   -  //
>> -  // As guest-physical memory size grows, the permanent PEI RAM
>> requirements
>> -  // are dominated by the identity-mapping page tables built by the
>> DXE IPL.
>> -  // The DXL IPL keys off of the physical address bits advertized in
>> the CPU
>> -  // HOB. To conserve memory, we calculate the minimum address width
>> here.
>> -  //
>> -  FirstNonAddress      = GetFirstNonAddress ();
>> -  mPhysMemAddressWidth = (UINT8)HighBitSet64 (FirstNonAddress);
>> -
>> -  //
>> -  // If FirstNonAddress is not an integral power of two, then we need an
>> -  // additional bit.
>> -  //
>> -  if ((FirstNonAddress & (FirstNonAddress - 1)) != 0) {
>> -    ++mPhysMemAddressWidth;
>> +  AsmCpuid (0x80000000, &RegEax, NULL, NULL, NULL);
>> +  if (RegEax >= 0x80000008) {
>> +    AsmCpuid (0x80000008, &RegEax, NULL, NULL, NULL);
>> +    mPhysMemAddressWidth = (UINT8) RegEax;
>> +  } else {
>> +    mPhysMemAddressWidth = 36;
>>     }
>>       //
>> -  // The minimum address width is 36 (covers up to and excluding 64
>> GB, which
>> -  // is the maximum for Ia32 + PAE). The theoretical architecture
>> maximum for
>> -  // X64 long mode is 52 bits, but the DXE IPL clamps that down to 48
>> bits. We
>> -  // can simply assert that here, since 48 bits are good enough for
>> 256 TB.
>> +  // IA-32e paging translates 48-bit linear addresses to 52-bit
>> physical addresses.
>>     //
>> -  if (mPhysMemAddressWidth <= 36) {
>> -    mPhysMemAddressWidth = 36;
>> +  ASSERT (mPhysMemAddressWidth <= 52);
>> +  if (mPhysMemAddressWidth > 48) {
>> +    mPhysMemAddressWidth = 48;
>>     }
>> -  ASSERT (mPhysMemAddressWidth <= 48);
>>   }
>>   -
>>   /**
>>     Calculate the cap for the permanent PEI memory.
>>   **/
>>
> 



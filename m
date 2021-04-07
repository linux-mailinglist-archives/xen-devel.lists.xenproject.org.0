Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7137435660E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 10:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106473.203606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3DP-0004Fc-Hl; Wed, 07 Apr 2021 08:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106473.203606; Wed, 07 Apr 2021 08:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3DP-0004FD-E9; Wed, 07 Apr 2021 08:07:07 +0000
Received: by outflank-mailman (input) for mailman id 106473;
 Wed, 07 Apr 2021 08:07:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dICN=JE=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lU3DN-0004F6-4Y
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 08:07:05 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0a1d9167-eec6-4301-9703-f8b74984b7e9;
 Wed, 07 Apr 2021 08:07:03 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-WRTpvZedOoivA-J0LtspUw-1; Wed, 07 Apr 2021 04:06:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3266A6D581;
 Wed,  7 Apr 2021 08:06:58 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9123D5D741;
 Wed,  7 Apr 2021 08:06:56 +0000 (UTC)
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
X-Inumbo-ID: 0a1d9167-eec6-4301-9703-f8b74984b7e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617782823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIgI5t2tSBrrkuCORu9Ievvg2djrabuQwl03488kG6o=;
	b=iWaPgNM49yfCcS697qHcuhXuoBO/k0A8H0VNqKY3iYK8CLIXPX0199i+d2x8VHhhX0+baf
	iY9d68LsyVAj/NBlCeD3P6JBwQWmJmvUbHU80IEFTP9h/2zda8JbfQZx/ThiV1o0bs6uTD
	VCOoVWLME1l6krjX2DAYYKKLWbCy//k=
X-MC-Unique: WRTpvZedOoivA-J0LtspUw-1
Subject: Re: [edk2-devel] [PATCH v2 5/7] OvmfPkg/XenPlatformPei: Map extra
 physical address
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org, Jordan Justen
 <jordan.l.justen@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Julien Grall <julien@xen.org>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
 <20210325154713.670104-6-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <9942168e-a882-67d2-a0d5-00b511d55aad@redhat.com>
Date: Wed, 7 Apr 2021 10:06:55 +0200
MIME-Version: 1.0
In-Reply-To: <20210325154713.670104-6-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/25/21 16:47, Anthony PERARD via groups.io wrote:
> Some information available in a Xen guest can be mapped anywhere in
> the physical address space and they don't need to be backed by RAM.
> For example, the shared info page.
> 
> While it's easier to put those pages anywhere, it is better to avoid
> mapping it where the RAM is. It might split a nice 1G guest page table
> into 4k pages and thus reducing performance of the guest when it
> access its memory. Also mapping a page like the shared info page and

s/access/accesses/

> then unmapping it or mapping it somewhere else would live a hole in

s/live/leave/

> the RAM that the guest would propably not been able to use anymore.

s/been/be/

> 
> So the patch introduce a new function which can be used to 1:1

s/introduce/introduces/

> mapping of guest physical memory above 4G during the PEI phase so we
> can map the Xen shared pages outside of memory that can be used by
> guest, and as high as possible.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Notes:
>     v2:
>     - new patch

With the typo fixes:

Acked-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo

> 
>  OvmfPkg/XenPlatformPei/XenPlatformPei.inf |  1 +
>  OvmfPkg/XenPlatformPei/Platform.h         |  5 ++
>  OvmfPkg/XenPlatformPei/Xen.c              | 71 +++++++++++++++++++++++
>  3 files changed, 77 insertions(+)
> 
> diff --git a/OvmfPkg/XenPlatformPei/XenPlatformPei.inf b/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> index 0ef77db92c03..8790d907d3ec 100644
> --- a/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> +++ b/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> @@ -66,6 +66,7 @@ [Pcd]
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfPeiMemFvSize
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfDxeMemFvBase
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfDxeMemFvSize
> +  gUefiOvmfPkgTokenSpaceGuid.PcdOvmfSecPageTablesBase
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfLockBoxStorageBase
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfLockBoxStorageSize
>    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfHostBridgePciDevId
> diff --git a/OvmfPkg/XenPlatformPei/Platform.h b/OvmfPkg/XenPlatformPei/Platform.h
> index 7661f4a8de0a..e70ca58078eb 100644
> --- a/OvmfPkg/XenPlatformPei/Platform.h
> +++ b/OvmfPkg/XenPlatformPei/Platform.h
> @@ -127,6 +127,11 @@ XenGetE820Map (
>    UINT32 *Count
>    );
>  
> +EFI_STATUS
> +PhysicalAddressIdentityMapping (
> +  IN EFI_PHYSICAL_ADDRESS AddressToMap
> +  );
> +
>  extern EFI_BOOT_MODE mBootMode;
>  
>  extern UINT8 mPhysMemAddressWidth;
> diff --git a/OvmfPkg/XenPlatformPei/Xen.c b/OvmfPkg/XenPlatformPei/Xen.c
> index c41fecdc486e..b2a7d1c21dac 100644
> --- a/OvmfPkg/XenPlatformPei/Xen.c
> +++ b/OvmfPkg/XenPlatformPei/Xen.c
> @@ -17,6 +17,8 @@
>  //
>  // The Library classes this module consumes
>  //
> +#include <Library/BaseMemoryLib.h>
> +#include <Library/CpuLib.h>
>  #include <Library/DebugLib.h>
>  #include <Library/HobLib.h>
>  #include <Library/MemoryAllocationLib.h>
> @@ -25,6 +27,7 @@
>  #include <IndustryStandard/E820.h>
>  #include <Library/ResourcePublicationLib.h>
>  #include <Library/MtrrLib.h>
> +#include <IndustryStandard/PageTable.h>
>  #include <IndustryStandard/Xen/arch-x86/hvm/start_info.h>
>  #include <Library/XenHypercallLib.h>
>  #include <IndustryStandard/Xen/memory.h>
> @@ -386,3 +389,71 @@ InitializeXen (
>  
>    return EFI_SUCCESS;
>  }
> +
> +EFI_STATUS
> +PhysicalAddressIdentityMapping (
> +  IN EFI_PHYSICAL_ADDRESS   AddressToMap
> +  )
> +{
> +  INTN                            Index;
> +  PAGE_MAP_AND_DIRECTORY_POINTER  *L4, *L3;
> +  PAGE_TABLE_ENTRY                *PageTable;
> +
> +  DEBUG ((DEBUG_INFO, "Mapping 1:1 of address 0x%lx\n", (UINT64)AddressToMap));
> +
> +  // L4 / Top level Page Directory Pointers
> +
> +  L4 = (VOID*)(UINTN)PcdGet32 (PcdOvmfSecPageTablesBase);
> +  Index = PML4_OFFSET (AddressToMap);
> +
> +  if (!L4[Index].Bits.Present) {
> +    L3 = AllocatePages (1);
> +    if (L3 == NULL) {
> +      return EFI_OUT_OF_RESOURCES;
> +    }
> +
> +    ZeroMem (L3, EFI_PAGE_SIZE);
> +
> +    L4[Index].Bits.ReadWrite = 1;
> +    L4[Index].Bits.Accessed = 1;
> +    L4[Index].Bits.PageTableBaseAddress = (EFI_PHYSICAL_ADDRESS)L3 >> 12;
> +    L4[Index].Bits.Present = 1;
> +  }
> +
> +  // L3 / Next level Page Directory Pointers
> +
> +  L3 = (VOID*)(EFI_PHYSICAL_ADDRESS)(L4[Index].Bits.PageTableBaseAddress << 12);
> +  Index = PDP_OFFSET (AddressToMap);
> +
> +  if (!L3[Index].Bits.Present) {
> +    PageTable = AllocatePages (1);
> +    if (PageTable == NULL) {
> +      return EFI_OUT_OF_RESOURCES;
> +    }
> +
> +    ZeroMem (PageTable, EFI_PAGE_SIZE);
> +
> +    L3[Index].Bits.ReadWrite = 1;
> +    L3[Index].Bits.Accessed = 1;
> +    L3[Index].Bits.PageTableBaseAddress = (EFI_PHYSICAL_ADDRESS)PageTable >> 12;
> +    L3[Index].Bits.Present = 1;
> +  }
> +
> +  // L2 / Page Table Entries
> +
> +  PageTable = (VOID*)(EFI_PHYSICAL_ADDRESS)(L3[Index].Bits.PageTableBaseAddress << 12);
> +  Index = PDE_OFFSET (AddressToMap);
> +
> +  if (!PageTable[Index].Bits.Present) {
> +    PageTable[Index].Bits.ReadWrite = 1;
> +    PageTable[Index].Bits.Accessed = 1;
> +    PageTable[Index].Bits.Dirty = 1;
> +    PageTable[Index].Bits.MustBe1 = 1;
> +    PageTable[Index].Bits.PageTableBaseAddress = AddressToMap >> 21;
> +    PageTable[Index].Bits.Present = 1;
> +  }
> +
> +  CpuFlushTlb ();
> +
> +  return EFI_SUCCESS;
> +}
> 



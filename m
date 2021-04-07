Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAF03566D2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 10:29:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106495.203654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3YL-0006S8-3w; Wed, 07 Apr 2021 08:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106495.203654; Wed, 07 Apr 2021 08:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3YL-0006Ri-0R; Wed, 07 Apr 2021 08:28:45 +0000
Received: by outflank-mailman (input) for mailman id 106495;
 Wed, 07 Apr 2021 08:28:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dICN=JE=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lU3YJ-0006Rb-DG
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 08:28:43 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 57a528ad-e0ed-4df1-a0c5-1b46a3d2652d;
 Wed, 07 Apr 2021 08:28:42 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-j-kNhAiXNcOeRT8qHxs-Mw-1; Wed, 07 Apr 2021 04:28:38 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 909B083DD28;
 Wed,  7 Apr 2021 08:28:35 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E01811000324;
 Wed,  7 Apr 2021 08:28:32 +0000 (UTC)
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
X-Inumbo-ID: 57a528ad-e0ed-4df1-a0c5-1b46a3d2652d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617784122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7HUH1x5+MoSwp/VfzV/dAKQtcPehrQ++8gqxTBqpwhw=;
	b=KzuA/Tijl2iz9DQlGDVfSpoMz84svdNCN0e0MSf72vbLhzzIAoiCvJTTzB7ah1FxYGAk9U
	6rA5Tod1OpJ3Uml96i3W21EKxDhZ95tTDmTVIzvUgoQ8KERK3dZcPuvxkwVst9SGkFYKsG
	tyae2WvKQSQnhE4zLNV5aj6fIin69E8=
X-MC-Unique: j-kNhAiXNcOeRT8qHxs-Mw-1
Subject: Re: [edk2-devel] [PATCH v2 6/7] OvmfPkg/XenPlatformPei: Calibrate
 APIC timer frequency
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org, Jordan Justen
 <jordan.l.justen@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
 <20210325154713.670104-7-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <960d873d-582c-0ea8-462a-03583c014cb6@redhat.com>
Date: Wed, 7 Apr 2021 10:28:31 +0200
MIME-Version: 1.0
In-Reply-To: <20210325154713.670104-7-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03/25/21 16:47, Anthony PERARD via groups.io wrote:
> Calculate the frequency of the APIC timer that Xen provides.
> 
> Even though the frequency is currently hard-coded, it isn't part of
> the public ABI that Xen provides and thus may change at any time. OVMF
> needs to determine the frequency by an other mean.
> 
> Fortunately, Xen provides a way to determines the frequency of the
> TSC, so we can use TSC to calibrate the frequency of the APIC timer.
> That information is found in the shared_info page which we map and
> unmap once done (XenBusDxe is going to map the page somewhere else).
> 
> The shared_info page is map at the highest physical address allowed as

(1) s/map/mapped/


> it doesn't need to be in the RAM, thus there's a call to update the
> page table.
> 
> The calculated frequency is only logged in this patch, it will be used
> in a following patch.
> 
> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2490
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
> 
> Notes:
>     v2:
>     - fix CamelCases
>     - Use U64 multiplication and division helpers
>     - don't read TscShift from the SharedInfo page again
>     - change the location of the shared info page to be outside of the ram
>     - check for overflow in XenDelay
>     - check for overflow when calculating the calculating APIC frequency
> 
>  OvmfPkg/XenPlatformPei/XenPlatformPei.inf |   2 +
>  OvmfPkg/XenPlatformPei/Platform.h         |   5 +
>  OvmfPkg/XenPlatformPei/Platform.c         |   1 +
>  OvmfPkg/XenPlatformPei/Xen.c              | 177 ++++++++++++++++++++++
>  4 files changed, 185 insertions(+)
> 
> diff --git a/OvmfPkg/XenPlatformPei/XenPlatformPei.inf b/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> index 8790d907d3ec..5732d2188871 100644
> --- a/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> +++ b/OvmfPkg/XenPlatformPei/XenPlatformPei.inf
> @@ -52,6 +52,7 @@ [LibraryClasses]
>    DebugLib
>    HobLib
>    IoLib
> +  LocalApicLib
>    PciLib
>    ResourcePublicationLib
>    PeiServicesLib
> @@ -59,6 +60,7 @@ [LibraryClasses]
>    MtrrLib
>    MemEncryptSevLib
>    PcdLib
> +  SafeIntLib
>    XenHypercallLib
>  
>  [Pcd]
> diff --git a/OvmfPkg/XenPlatformPei/Platform.h b/OvmfPkg/XenPlatformPei/Platform.h
> index e70ca58078eb..77d88fc159d7 100644
> --- a/OvmfPkg/XenPlatformPei/Platform.h
> +++ b/OvmfPkg/XenPlatformPei/Platform.h
> @@ -132,6 +132,11 @@ PhysicalAddressIdentityMapping (
>    IN EFI_PHYSICAL_ADDRESS AddressToMap
>    );
>  
> +VOID
> +CalibrateLapicTimer (
> +  VOID
> +  );
> +
>  extern EFI_BOOT_MODE mBootMode;
>  
>  extern UINT8 mPhysMemAddressWidth;
> diff --git a/OvmfPkg/XenPlatformPei/Platform.c b/OvmfPkg/XenPlatformPei/Platform.c
> index 717fd0ab1a45..e9511eb40c62 100644
> --- a/OvmfPkg/XenPlatformPei/Platform.c
> +++ b/OvmfPkg/XenPlatformPei/Platform.c
> @@ -448,6 +448,7 @@ InitializeXenPlatform (
>    InitializeRamRegions ();
>  
>    InitializeXen ();
> +  CalibrateLapicTimer ();
>  
>    if (mBootMode != BOOT_ON_S3_RESUME) {
>      ReserveEmuVariableNvStore ();
> diff --git a/OvmfPkg/XenPlatformPei/Xen.c b/OvmfPkg/XenPlatformPei/Xen.c
> index b2a7d1c21dac..7524aaa11a29 100644
> --- a/OvmfPkg/XenPlatformPei/Xen.c
> +++ b/OvmfPkg/XenPlatformPei/Xen.c
> @@ -21,8 +21,10 @@
>  #include <Library/CpuLib.h>
>  #include <Library/DebugLib.h>
>  #include <Library/HobLib.h>
> +#include <Library/LocalApicLib.h>
>  #include <Library/MemoryAllocationLib.h>
>  #include <Library/PcdLib.h>
> +#include <Library/SafeIntLib.h>
>  #include <Guid/XenInfo.h>
>  #include <IndustryStandard/E820.h>
>  #include <Library/ResourcePublicationLib.h>
> @@ -457,3 +459,178 @@ PhysicalAddressIdentityMapping (
>  
>    return EFI_SUCCESS;
>  }
> +
> +STATIC
> +EFI_STATUS
> +MapSharedInfoPage (
> +  IN VOID *PagePtr
> +  )
> +{
> +  xen_add_to_physmap_t  Parameters;
> +  INTN                  ReturnCode;
> +
> +  Parameters.domid = DOMID_SELF;
> +  Parameters.space = XENMAPSPACE_shared_info;
> +  Parameters.idx = 0;
> +  Parameters.gpfn = (UINTN)PagePtr >> EFI_PAGE_SHIFT;
> +  ReturnCode = XenHypercallMemoryOp (XENMEM_add_to_physmap, &Parameters);
> +  if (ReturnCode != 0) {
> +    return EFI_NO_MAPPING;
> +  }
> +  return EFI_SUCCESS;
> +}
> +
> +STATIC
> +VOID
> +UnmapXenPage (
> +  IN VOID *PagePtr
> +  )
> +{
> +  xen_remove_from_physmap_t Parameters;
> +  INTN                      ReturnCode;
> +
> +  Parameters.domid = DOMID_SELF;
> +  Parameters.gpfn = (UINTN)PagePtr >> EFI_PAGE_SHIFT;
> +  ReturnCode = XenHypercallMemoryOp (XENMEM_remove_from_physmap, &Parameters);
> +  ASSERT (ReturnCode == 0);
> +}
> +
> +
> +STATIC
> +UINT64
> +GetCpuFreq (
> +  IN XEN_VCPU_TIME_INFO *VcpuTime
> +  )
> +{
> +  UINT32 Version;
> +  UINT32 TscToSystemMultiplier;
> +  INT8   TscShift;
> +  UINT64 CpuFreq;
> +
> +  do {
> +    Version = VcpuTime->Version;
> +    MemoryFence ();
> +    TscToSystemMultiplier = VcpuTime->TscToSystemMultiplier;
> +    TscShift = VcpuTime->TscShift;
> +    MemoryFence ();
> +  } while (((Version & 1) != 0) && (Version != VcpuTime->Version));
> +
> +  CpuFreq = DivU64x32 (LShiftU64 (1000000000ULL, 32), TscToSystemMultiplier);
> +  if (TscShift >= 0) {
> +      CpuFreq = RShiftU64 (CpuFreq, TscShift);
> +  } else {
> +      CpuFreq = LShiftU64 (CpuFreq, -TscShift);
> +  }
> +  return CpuFreq;
> +}
> +
> +STATIC
> +VOID
> +XenDelay (
> +  IN XEN_VCPU_TIME_INFO *VcpuTimeInfo,
> +  IN UINT64             DelayNs
> +  )
> +{
> +  UINT64        Tick;
> +  UINT64        CpuFreq;
> +  UINT64        Delay;
> +  UINT64        DelayTick;
> +  UINT64        NewTick;
> +  RETURN_STATUS Status;
> +
> +  Tick = AsmReadTsc ();
> +
> +  CpuFreq = GetCpuFreq (VcpuTimeInfo);
> +  Status = SafeUint64Mult (DelayNs, CpuFreq, &Delay);
> +  ASSERT_EFI_ERROR (Status);
> +  if (EFI_ERROR (Status)) {
> +    DEBUG ((DEBUG_ERROR,
> +        "XenDelay (%ld ns): delay too big in relation to CPU freq %ld Hz\n",
> +        DelayNs, CpuFreq));
> +    CpuDeadLoop ();
> +  }

(2) I suggest moving the ASSERT_EFI_ERROR() into the EFI_ERROR() branch,
namely between the DEBUG message and the CpuDeadLoop() call.

Applies to the rest of the ASSERT_EFI_ERROR() invocations in this patch.


(3) DelayNs and CpuFreq are of type UINT64, they should be logged with
%lu, not %ld.


(4) The indentation of the DEBUG macro arguments is incorrect; should be
2 spaces rather than 4.

Applies to the rest of the DEBUG() invocations in this patch.

> +
> +  DelayTick = DivU64x32 (Delay, 1000000000UL);

(5) The UL suffix on the constant is wasteful / misleading IMO;
DivU64x32 clearly takes a UINT32 as second parameter ("Divisor").


> +
> +  NewTick = Tick + DelayTick;
> +
> +  //
> +  // Check for overflow
> +  //
> +  if (NewTick < Tick) {
> +    //
> +    // Overflow, wait for TSC to also overflow
> +    //
> +    while (AsmReadTsc () >= Tick) {
> +      CpuPause ();
> +    }
> +  }
> +
> +  while (AsmReadTsc () <= NewTick) {
> +    CpuPause ();
> +  }
> +}
> +
> +
> +/**
> +  Calculate the frequency of the Local Apic Timer
> +**/
> +VOID
> +CalibrateLapicTimer (
> +  VOID
> +  )
> +{
> +  XEN_SHARED_INFO       *SharedInfo;
> +  XEN_VCPU_TIME_INFO    *VcpuTimeInfo;
> +  UINT32                TimerTick, TimerTick2, DiffTimer;
> +  UINT64                TscTick, TscTick2;
> +  UINT64                Freq;
> +  UINT64                Dividend;
> +  EFI_STATUS            Status;
> +
> +
> +  SharedInfo = (VOID*)((1ULL << mPhysMemAddressWidth) - EFI_PAGE_SIZE);

(I'm keeping in mind that this code is X64 only.)

> +  Status = PhysicalAddressIdentityMapping ((EFI_PHYSICAL_ADDRESS)SharedInfo);
> +  ASSERT_EFI_ERROR (Status);
> +  if (EFI_ERROR (Status)) {
> +    DEBUG ((DEBUG_ERROR,
> +        "Failed to add page table entry for Xen shared info page: %r\n",
> +        Status));
> +    return;
> +  }
> +
> +  Status = MapSharedInfoPage (SharedInfo);
> +  ASSERT_EFI_ERROR (Status);
> +  if (EFI_ERROR (Status)) {
> +    DEBUG ((DEBUG_ERROR, "Failed to map Xen's shared info page: %r\n",
> +        Status));
> +    return;
> +  }
> +
> +  VcpuTimeInfo = &SharedInfo->VcpuInfo[0].Time;
> +
> +  InitializeApicTimer (1, MAX_UINT32, TRUE, 0);
> +  DisableApicTimerInterrupt ();
> +
> +  TimerTick = GetApicTimerCurrentCount ();
> +  TscTick = AsmReadTsc ();
> +  XenDelay (VcpuTimeInfo, 1000000ULL);
> +  TimerTick2 = GetApicTimerCurrentCount ();
> +  TscTick2 = AsmReadTsc ();
> +
> +
> +  DiffTimer = TimerTick - TimerTick2;
> +  Status = SafeUint64Mult (GetCpuFreq (VcpuTimeInfo), DiffTimer, &Dividend);
> +  ASSERT_EFI_ERROR (Status);
> +  if (EFI_ERROR (Status)) {
> +    DEBUG ((DEBUG_ERROR, "overflow while calculating APIC frequency\n"));
> +    DEBUG ((DEBUG_ERROR, "CPU freq: %ld Hz; APIC timer tick count for 1 ms: %d\n",
> +        GetCpuFreq (VcpuTimeInfo), DiffTimer));

(6) Please use %lu and %u for formatting the UINT64 retval of
GetCpuFreq(), and the UINT32 variable DiffTimer, respectively.

All trivial feedback of course, so:

Acked-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo

> +    CpuDeadLoop ();
> +  }
> +
> +  Freq = DivU64x64Remainder (Dividend, TscTick2 - TscTick, NULL);
> +  DEBUG ((DEBUG_INFO, "APIC Freq % 8lu Hz\n", Freq));
> +
> +  UnmapXenPage (SharedInfo);
> +}
> 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A62FB64E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 14:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70372.126280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qvp-0000Pg-0d; Tue, 19 Jan 2021 13:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70372.126280; Tue, 19 Jan 2021 13:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qvo-0000PH-TW; Tue, 19 Jan 2021 13:20:24 +0000
Received: by outflank-mailman (input) for mailman id 70372;
 Tue, 19 Jan 2021 13:20:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXsN=GW=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1l1qvo-0000PC-3R
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 13:20:24 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cfa7b3b-bfa5-42c4-8a18-8e0ffcfa7c68;
 Tue, 19 Jan 2021 13:20:21 +0000 (UTC)
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
X-Inumbo-ID: 6cfa7b3b-bfa5-42c4-8a18-8e0ffcfa7c68
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611062421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZBpkdIKunsFtYq2qhusrh4u6spCJo14KF7b3hJ3SVek=;
  b=WJ3fg5wUkNAGc3JZOCdehC0A2cgCsjxClhjlYkIMCZIGqL0CCxgLITjz
   6qZSHC1mX+rj8iBzSLOUn8TlxxqzPTAWWtNPFsvz8dLVBsTGbvlGph36j
   2atwZA392Uk2rMisBR9qu2fy/a8Nrr7+k3Rn+hA2orRhwj2K4C6Ga1POW
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Y7JP5Uw5CoXFFDm8xpMVtDrpIO6kGj0vTm2S7QAW8LVqF7CxYgMVmRo6q/5ST1Rl8TryWySSES
 SwjaVwZ3RZPaTVHkEuqUlUmkJdZK6pUMqVQjaosGeWQl2o1RWIeb1VmO4QHaghVW6xFgr9bCZF
 9sLdyc6ph9HIfl94jCbvdhirGhR95mvLEuIWjeQ2ifYbC50oePuKelfsS4wythASaIyjbT3pQJ
 aBPBmYaL6o2XfxuK0XddnqupgZehyybW+4d8zOd7jS3LhbyOF6DyY4tQn/RdwJ5fZezG6BfQrS
 lH8=
X-SBRS: 5.1
X-MesageID: 35418157
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35418157"
Date: Tue, 19 Jan 2021 13:20:17 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: <devel@edk2.groups.io>, <xen-devel@lists.xenproject.org>,
	<jordan.l.justen@intel.com>, <lersek@redhat.com>, <ard.biesheuvel@arm.com>,
	<julien@xen.org>
Subject: Re: [PATCH] OvmfPkg/XenPlatformPei: Grab 64-bit PCI MMIO hole size
 from OVMF info table
Message-ID: <YAbckZdzHFcnH7ea@perard.uk.xensource.com>
References: <1610336718-7064-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1610336718-7064-1-git-send-email-igor.druzhinin@citrix.com>

On Mon, Jan 11, 2021 at 03:45:18AM +0000, Igor Druzhinin wrote:
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

Pci64Base is overridden later (25 line bellow) by the value from
FirstNonAddress, shouldn't this be avoided?
    Pci64Base = ALIGN_VALUE (FirstNonAddress, (UINT64)SIZE_1GB);

> diff --git a/OvmfPkg/XenPlatformPei/Xen.h b/OvmfPkg/XenPlatformPei/Xen.h
> index 2605481..c6e5fbb 100644
> --- a/OvmfPkg/XenPlatformPei/Xen.h
> +++ b/OvmfPkg/XenPlatformPei/Xen.h
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

In the hvmloader patch, these are uint64. It doesn't seems like a good
idea to use the type EFI_PHYSICAL_ADDRESS here. Could you change to
UINT64 here?

(even if EFI_PHYSICAL_ADDRESS seems to always be UINT64, in the source
code.)

> +} EFI_XEN_OVMF_PCI_INFO;
>  #pragma pack()
>  
>  #endif /* __XEN_H__ */

Thanks,

-- 
Anthony PERARD


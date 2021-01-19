Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379EC2FB656
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 14:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70377.126295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1r0n-0000at-Ly; Tue, 19 Jan 2021 13:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70377.126295; Tue, 19 Jan 2021 13:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1r0n-0000aU-Id; Tue, 19 Jan 2021 13:25:33 +0000
Received: by outflank-mailman (input) for mailman id 70377;
 Tue, 19 Jan 2021 13:25:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUgV=GW=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1l1r0l-0000aP-VI
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 13:25:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19e9d592-ca3c-4643-a7cc-0c5fb99ac9e8;
 Tue, 19 Jan 2021 13:25:30 +0000 (UTC)
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
X-Inumbo-ID: 19e9d592-ca3c-4643-a7cc-0c5fb99ac9e8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611062731;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=5x7isCg/9PcIbvBydMy4aNUwtIF8ckQjMRxr1pDjym0=;
  b=Ci8EcKyZX9IHwjkejBaK11G1A4s3DjdV8vF7atBdsebnCqZzOTHAI7Q9
   2Xzv2DwirIgbLfo1xYzyPa1YjE/dtGkVotlcF8C78HkMrTusYs099JIBw
   datHq+x944BEu2FJDiliiauFrEKfyLiH6IrHa3WDVCd0Mt9V1GxwCSKHx
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: v6dkuy+u1hfmXCSb201o5A8Thhl705SUDGx+WesqPsjcYRBTgLQTzCzICvD0KMbChwjjlmG0E4
 MFDvns+QsQQ5cNjB9yjfMvHCDI2tJSkL8j3j5nckHsQhm7ni90DbX77N0yk23cjxxprjtT27bI
 iVgvvW5xT/5ZRpwnS/E6UgtxmhBnmMKogi/w0owti2ZswXQwzhwEyD2144Ebhpo7qbh+NmMox7
 i/jJzp5RzZ4d0ugPAQey/O72vhW8ZvUbAgP7YU0ZmnRvP5hNGX9JeFAjodto48wz90Wh0Wom/m
 BfE=
X-SBRS: 5.1
X-MesageID: 35744034
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35744034"
Subject: Re: [PATCH] OvmfPkg/XenPlatformPei: Grab 64-bit PCI MMIO hole size
 from OVMF info table
To: Anthony PERARD <anthony.perard@citrix.com>
CC: <devel@edk2.groups.io>, <xen-devel@lists.xenproject.org>,
	<jordan.l.justen@intel.com>, <lersek@redhat.com>, <ard.biesheuvel@arm.com>,
	<julien@xen.org>
References: <1610336718-7064-1-git-send-email-igor.druzhinin@citrix.com>
 <YAbckZdzHFcnH7ea@perard.uk.xensource.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <63cf6053-9787-d8cf-db18-982ebcab1780@citrix.com>
Date: Tue, 19 Jan 2021 13:25:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YAbckZdzHFcnH7ea@perard.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19/01/2021 13:20, Anthony PERARD wrote:
> On Mon, Jan 11, 2021 at 03:45:18AM +0000, Igor Druzhinin wrote:
>> diff --git a/OvmfPkg/XenPlatformPei/MemDetect.c b/OvmfPkg/XenPlatformPei/MemDetect.c
>> index 1f81eee..4175a2f 100644
>> --- a/OvmfPkg/XenPlatformPei/MemDetect.c
>> +++ b/OvmfPkg/XenPlatformPei/MemDetect.c
>> @@ -227,6 +227,7 @@ GetFirstNonAddress (
>>    UINT64               FirstNonAddress;
>>    UINT64               Pci64Base, Pci64Size;
>>    RETURN_STATUS        PcdStatus;
>> +  EFI_STATUS           Status;
>>  
>>    FirstNonAddress = BASE_4GB + GetSystemMemorySizeAbove4gb ();
>>  
>> @@ -245,7 +246,10 @@ GetFirstNonAddress (
>>    // Otherwise, in order to calculate the highest address plus one, we must
>>    // consider the 64-bit PCI host aperture too. Fetch the default size.
>>    //
>> -  Pci64Size = PcdGet64 (PcdPciMmio64Size);
>> +  Status = XenGetPciMmioInfo (NULL, NULL, &Pci64Base, &Pci64Size);
> 
> Pci64Base is overridden later (25 line bellow) by the value from
> FirstNonAddress, shouldn't this be avoided?
>     Pci64Base = ALIGN_VALUE (FirstNonAddress, (UINT64)SIZE_1GB);
> 
>> diff --git a/OvmfPkg/XenPlatformPei/Xen.h b/OvmfPkg/XenPlatformPei/Xen.h
>> index 2605481..c6e5fbb 100644
>> --- a/OvmfPkg/XenPlatformPei/Xen.h
>> +++ b/OvmfPkg/XenPlatformPei/Xen.h
>> @@ -34,6 +34,16 @@ typedef struct {
>>    EFI_PHYSICAL_ADDRESS E820;
>>    UINT32 E820EntriesCount;
>>  } EFI_XEN_OVMF_INFO;
>> +
>> +// This extra table gives layout of PCI apertures in a Xen guest
>> +#define OVMF_INFO_PCI_TABLE 0
>> +
>> +typedef struct {
>> +  EFI_PHYSICAL_ADDRESS LowStart;
>> +  EFI_PHYSICAL_ADDRESS LowEnd;
>> +  EFI_PHYSICAL_ADDRESS HiStart;
>> +  EFI_PHYSICAL_ADDRESS HiEnd;
> 
> In the hvmloader patch, these are uint64. It doesn't seems like a good
> idea to use the type EFI_PHYSICAL_ADDRESS here. Could you change to
> UINT64 here?
> 
> (even if EFI_PHYSICAL_ADDRESS seems to always be UINT64, in the source
> code.)
> 

Anthony, this patch is obsolete now - see discussion between Jan and Laszlo.
The new patch is:
https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg00789.html

Igor



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4223E680DA7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 13:30:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486978.754440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMTIW-000332-7C; Mon, 30 Jan 2023 12:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486978.754440; Mon, 30 Jan 2023 12:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMTIW-00032G-2U; Mon, 30 Jan 2023 12:30:08 +0000
Received: by outflank-mailman (input) for mailman id 486978;
 Mon, 30 Jan 2023 12:30:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMTIU-00032A-6f
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 12:30:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMTIT-00006r-RD; Mon, 30 Jan 2023 12:30:05 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMTIT-0008DS-Jl; Mon, 30 Jan 2023 12:30:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=G7+tPAKAB4bS/r8HAFALygiFB07by+WZrw9qhPOucd8=; b=SRumM8LqEaF+oKmXSme0NPiTJv
	sB0nZlzVYYJShXDODItf3ZYJ1XRzdJaRagymomONb7LdTGHlrPtxB035ae+v03VQYaUe9NlaOMINl
	2Fm6luOS81ABEYxbHmB0zTrlyoymkuk4n8icMdR/Fxs/FWKnIPo2Qrn7pm+Ozb/D0C8o=;
Message-ID: <cd184a58-426e-4249-c635-504509734262@xen.org>
Date: Mon, 30 Jan 2023 12:30:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v6] xen/arm: Probe the load/entry point address of an uImage
 correctly
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230125112131.19682-1-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301251302360.1978264@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301251302360.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25/01/2023 21:06, Stefano Stabellini wrote:
> On Wed, 25 Jan 2023, Ayan Kumar Halder wrote:
>> Currently, kernel_uimage_probe() does not read the load/entry point address
>> set in the uImge header. Thus, info->zimage.start is 0 (default value). This
>> causes, kernel_zimage_place() to treat the binary (contained within uImage)
>> as position independent executable. Thus, it loads it at an incorrect
>> address.
>>
>> The correct approach would be to read "uimage.load" and set
>> info->zimage.start. This will ensure that the binary is loaded at the
>> correct address. Also, read "uimage.ep" and set info->entry (ie kernel entry
>> address).
>>
>> If user provides load address (ie "uimage.load") as 0x0, then the image is
>> treated as position independent executable. Xen can load such an image at
>> any address it considers appropriate. A position independent executable
>> cannot have a fixed entry point address.
>>
>> This behavior is applicable for both arm32 and arm64 platforms.
>>
>> Earlier for arm32 and arm64 platforms, Xen was ignoring the load and entry
>> point address set in the uImage header. With this commit, Xen will use them.
>> This makes the behavior of Xen consistent with uboot for uimage headers.
>>
>> Users who want to use Xen with statically partitioned domains, can provide
>> non zero load address and entry address for the dom0/domU kernel. It is
>> required that the load and entry address provided must be within the memory
>> region allocated by Xen.
>>
>> A deviation from uboot behaviour is that we consider load address == 0x0,
>> to denote that the image supports position independent execution. This
>> is to make the behavior consistent across uImage and zImage.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from v1 :-
>> 1. Added a check to ensure load address and entry address are the same.
>> 2. Considered load address == 0x0 as position independent execution.
>> 3. Ensured that the uImage header interpretation is consistent across
>> arm32 and arm64.
>>
>> v2 :-
>> 1. Mentioned the change in existing behavior in booting.txt.
>> 2. Updated booting.txt with a new section to document "Booting Guests".
>>
>> v3 :-
>> 1. Removed the constraint that the entry point should be same as the load
>> address. Thus, Xen uses both the load address and entry point to determine
>> where the image is to be copied and the start address.
>> 2. Updated documentation to denote that load address and start address
>> should be within the memory region allocated by Xen.
>> 3. Added constraint that user cannot provide entry point for a position
>> independent executable (PIE) image.
>>
>> v4 :-
>> 1. Explicitly mentioned the version in booting.txt from when the uImage
>> probing behavior has changed.
>> 2. Logged the requested load address and entry point parsed from the uImage
>> header.
>> 3. Some style issues.
>>
>> v5 :-
>> 1. Set info->zimage.text_offset = 0 in kernel_uimage_probe().
>> 2. Mention that if the kernel has a legacy image header on top of zImage/zImage64
>> header, then the attrbutes from legacy image header is used to determine the load
>> address, entry point, etc. Thus, zImage/zImage64 header is effectively ignored.
>>
>> This is true because Xen currently does not support recursive probing of kernel
>> headers ie if uImage header is probed, then Xen will not attempt to see if there
>> is an underlying zImage/zImage64 header.
>>
>>   docs/misc/arm/booting.txt         | 30 ++++++++++++++++
>>   xen/arch/arm/include/asm/kernel.h |  2 +-
>>   xen/arch/arm/kernel.c             | 58 +++++++++++++++++++++++++++++--
>>   3 files changed, 86 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>> index 3e0c03e065..1837579aef 100644
>> --- a/docs/misc/arm/booting.txt
>> +++ b/docs/misc/arm/booting.txt
>> @@ -23,6 +23,32 @@ The exceptions to this on 32-bit ARM are as follows:
>>   
>>   There are no exception on 64-bit ARM.
>>   
>> +Booting Guests
>> +--------------
>> +
>> +Xen supports the legacy image header[3], zImage protocol for 32-bit
>> +ARM Linux[1] and Image protocol defined for ARM64[2].
>> +
>> +Until Xen 4.17, in case of legacy image protocol, Xen ignored the load
>> +address and entry point specified in the header. This has now changed.
>> +
>> +Now, it loads the image at the load address provided in the header.
>> +And the entry point is used as the kernel start address.
>> +
>> +A deviation from uboot is that, Xen treats "load address == 0x0" as
>> +position independent execution (PIE). Thus, Xen will load such an image
>> +at an address it considers appropriate. Also, user cannot specify the
>> +entry point of a PIE image since the start address cennot be
>> +predetermined.
>> +
>> +Users who want to use Xen with statically partitioned domains, can provide
>> +the fixed non zero load address and start address for the dom0/domU kernel.
>> +The load address and start address specified by the user in the header must
>> +be within the memory region allocated by Xen.
>> +
>> +Also, it is to be noted that if user provides the legacy image header on top of
>> +zImage or Image header, then Xen uses the attrbutes of legacy image header only
>                                               ^ attributes                    ^ remove only
> 
>> +to determine the load address, entry point, etc.
> 
> Also add:
> 
> """
> Known limitation: compressed kernels with a uboot headers are not
> working.
> """

I am not entirely sure where you want this sentence to be added. So...

> 
> These few minor changes to the documentation can be done on commit:

... can you take care of committing it?

Cheers,

-- 
Julien Grall


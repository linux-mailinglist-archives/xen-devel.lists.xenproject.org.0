Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F3A9D54F
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968690.1358180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8RLR-0008Pp-MB; Fri, 25 Apr 2025 22:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968690.1358180; Fri, 25 Apr 2025 22:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8RLR-0008Ns-IH; Fri, 25 Apr 2025 22:16:29 +0000
Received: by outflank-mailman (input) for mailman id 968690;
 Fri, 25 Apr 2025 22:16:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u8RLP-0008Nm-7i
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:16:27 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebbcfed5-2222-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 00:16:24 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745619374713179.9886556327998;
 Fri, 25 Apr 2025 15:16:14 -0700 (PDT)
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
X-Inumbo-ID: ebbcfed5-2222-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745619378; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A0sY1mR5tqHNKPtOL+r8GDJY3jQ0ml7tGRwrQNVV+dMsTYaheZchwEVE7k00axLNhAsS6U237P1rBx866/uZBx0a08csH9bjYPOeAXaRuHzkayDDv1tcOBC3lDwX+aMnooYyDMsMKczcgEqwLEYiY7D9pTSb4D45opPX2S+jeEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745619378; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ttq38HvTskzJ2SQ59jHZkXUmMKOHtPyJY2psnXrCVU0=; 
	b=TKJHD1q1dbS1tnClYeLDyglI1TCLgTldPoXmLNpfcB6Mko2P5MVyvGUwEakO4h1ZzevHPuCgJD/CnBC3GcYWZbvNLsx6U2QiSxm4L3xpMtueIlmb1picrTlisa6raU45j+LZaN6zUo0lcjBPILTxdoketszDG1DVPaO0pei/Ri4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745619377;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ttq38HvTskzJ2SQ59jHZkXUmMKOHtPyJY2psnXrCVU0=;
	b=A9UdJJ7ddo33banBThuVHxw6blkIUJx6xWGP9LVOse1e+pAhQb8LwyknSK9+o4B3
	/p2XrJa4h8yrTOL38nsxZSkeUq9oJ4uLCmokKd/Lugp0Yh9x+6fETxfL6C320dzZQU6
	jpnlFnNkvjEupPHvMHN4d/6CNmS0cE8YyW9ng5q0=
Message-ID: <9614ad42-2188-4013-9aef-a2b9af60002d@apertussolutions.com>
Date: Fri, 25 Apr 2025 18:16:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 33/38] x86/boot: refactor bzimage parser to be re-enterant
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: stefano.stabellini@amd.com, agarciav@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-34-dpsmith@apertussolutions.com>
 <bba25fca-171a-47dd-881b-4746d76bd16a@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <bba25fca-171a-47dd-881b-4746d76bd16a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/23/25 15:27, Jason Andryuk wrote:
> On 2025-04-19 18:08, Daniel P. Smith wrote:
>> The bzimage logic uses the unit global orig_image_len to hold the 
>> original
>> module length for the kernel when the headroom is calculated. It then 
>> uses
>> orig_image_len to locate the start of the bzimage when the expansion 
>> is done.
>> This is an issue when more than one bzimage is processed by the headroom
>> calculation logic, as it will leave orig_image_len set to the length 
>> of the
>> last bzimage it processed.
>>
>> The boot module work introduced storing the headroom size on a per module
>> basis. By passing in the headroom from the boot module, orig_image_len 
>> is no
>> longer needed to locate the beginning of the bzimage after the allocated
>> headroom. The bzimage functions are reworked as such, allowing the 
>> removal of
>> orig_image_len and enabling them to be reused by multiple kernel boot 
>> modules.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/bzimage.c             | 38 ++++++++++++++++++------------
>>   xen/arch/x86/hvm/dom_build.c       |  3 ++-
>>   xen/arch/x86/include/asm/bzimage.h |  5 ++--
>>   xen/arch/x86/pv/dom0_build.c       |  3 ++-
>>   4 files changed, 30 insertions(+), 19 deletions(-)
>>
>> diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
>> index 66f648f311e4..32f0360d25b4 100644
> 
>> @@ -103,13 +100,20 @@ unsigned long __init bzimage_headroom(void 
>> *image_start,
>>       return headroom;
>>   }
>> -int __init bzimage_parse(void *image_base, void **image_start,
>> -                         unsigned long *image_len)
>> +int __init bzimage_parse(
>> +    void *image_base, void **image_start, unsigned long headroom,
>> +    unsigned long *image_len)
>>   {
>>       struct setup_header *hdr = (struct setup_header *)(*image_start);
>>       int err = bzimage_check(hdr, *image_len);
>> -    unsigned long output_len;
>> -
>> +    unsigned long module_len = *image_len;
>> +
>> +    /*
>> +     * Variable err will have one of three values:
>> +     *   -  < 0: a error occurred trying to inspect the contents
>> +     *   -  > 0: the image is a bzImage
>> +     *   - == 0: not a bzImage, could be raw elf or elf.gz (vmlinuz.gz)
>> +     */
> 
> This comment seems a little independent of this change, so maybe it 
> should be submitted separately.  Also, I think a better placement would 
> be next to bzimage_check().
> 
>>       if ( err < 0 )
>>           return err;
>> @@ -118,21 +122,25 @@ int __init bzimage_parse(void *image_base, void 
>> **image_start,
>>           *image_start += (hdr->setup_sects + 1) * 512 + hdr- 
>> >payload_offset;
>>           *image_len = hdr->payload_length;
> 
> @here
> 
>>       }
>> -
>> -    if ( elf_is_elfbinary(*image_start, *image_len) )
>> -        return 0;
>> +    else
>> +    {
>> +        if ( elf_is_elfbinary(*image_start, *image_len) )
>> +            return 0;
>> +        else
>> +            *image_len = *image_len - headroom;
>> +    }
> 
> I don't like this extra indention which includes the return.  If you 
> retain orig_image_len as a local variable, and set it above at "@here", 
> you can have a smaller diff and leave cleaner logic.
> 
> orig_image_len previously was set as a static variable, so the correct
> value was set after bzimage_headroom.  Now that it is no longer static,
> we need to grab the hdr->payload_length value when we have a bzImage.
> Otherwise output_length will read past the end of the module.
> 
> Below is the diff for bzimage.c with the change I suggest.
> 

I will review it again when as I rebase it.

v/r,
dps


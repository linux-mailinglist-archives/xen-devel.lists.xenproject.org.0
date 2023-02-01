Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1185168637E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 11:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488248.756243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNA7e-0003hm-AR; Wed, 01 Feb 2023 10:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488248.756243; Wed, 01 Feb 2023 10:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNA7e-0003f2-74; Wed, 01 Feb 2023 10:13:46 +0000
Received: by outflank-mailman (input) for mailman id 488248;
 Wed, 01 Feb 2023 10:13:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pNA7c-0003ew-La
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 10:13:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNA7c-000437-7l; Wed, 01 Feb 2023 10:13:44 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.6.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNA7c-000613-1A; Wed, 01 Feb 2023 10:13:44 +0000
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
	bh=yFgcVU7yIt0jV6VMzqw7JlDsUdET62UioCDmcwDUnO0=; b=aJ/0CSHpQReevYbqpysqTln4VS
	5u6DNuvG7DJqLY4y/mngtETDbk9XKuhalbmRgYIJG5DwLHwqXGa72Pk3UA9axY864rZJ1W8pndiqc
	fAO/TrJDbcxPN98fUxxOfW8P1uQtdfe+y/0Jkh38eWp3CfEbHOgUO2ZC/C8VvZJqrFg4=;
Message-ID: <f45dfe55-ca51-7aa0-ef9a-2788cfead470@xen.org>
Date: Wed, 1 Feb 2023 10:13:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] xen/arm: Add support for booting gzip compressed
 uImages
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, ayankuma@amd.com
References: <20230131151354.25943-1-michal.orzel@amd.com>
 <20230131151354.25943-3-michal.orzel@amd.com>
 <653d05c1-a860-052c-4ce2-55998c77db42@xen.org>
 <442d7e6b-9b51-69bc-48ea-c844427a4a97@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <442d7e6b-9b51-69bc-48ea-c844427a4a97@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/02/2023 09:48, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 31/01/2023 21:20, Julien Grall wrote:
>>
>>
>> Hi,
>>
>> On 31/01/2023 15:13, Michal Orzel wrote:
>>> At the moment, Xen does not support booting gzip compressed uImages.
>>> This is because we are trying to decompress the kernel before probing
>>> the u-boot header. This leads to a failure as the header always appears
>>> at the top of the image (and therefore obscuring the gzip header).
>>>
>>> Move the call to kernel_uimage_probe before kernel_decompress and make
>>> the function self-containing by taking the following actions:
>>>    - take a pointer to struct bootmodule as a parameter,
>>>    - check the comp field of a u-boot header to determine compression type,
>>>    - in case of compressed image, modify boot module start address and size
>>>      by taking the header size into account and call kernel_decompress,
>>>    - set up zimage.{kernel_addr,len} accordingly,
>>>    - return -ENOENT in case of a u-boot header not found to distinguish it
>>>      amongst other return values and make it the only case for falling
>>>      through to try to probe other image types.
>>>
>>> This is done to avoid splitting the uImage probing into 2 stages (executed
>>> before and after decompression) which otherwise would be necessary to
>>> properly update boot module start and size before decompression and
>>> zimage.{kernel_addr,len} afterwards.
>>
>> AFAIU, it would be possible to have a zImage/Image header embedded in
>> the uImage. So any reason to only handle a compressed binary?
> Not sure if I understand you correctly as what you say is already supported.
> The split or moving decompression is only needed in case of compressed uImage,
> as u-boot header (not being part of compression) appears before gzip header.
> This is not the case for zImage/Image header that is embedded into image
> and gzip header is at the top.

[...]

> 
> In case of uImage added on top of zImage/Image, the load address/entry point are taken
> from uImage header so basically the zImage/Image header is not parsed (this is
> documented in our booting.txt).

This is the case I am talking about. I think we need to parrse 
zImage/Image because it may contain additional information about the 
placement (for instance Image has a field to indicate the real size in 
memory).

> 
> This patch makes the uImage compression works as the other combinations work fine already.
> You can boot what you can already:
> - zImage/Image
> - compressed zImage/Image
> - zImage/Image,raw with u-boot header
> + this patch allows to boot:
> - compressed uImage (i.e. zImage/Image/raw compressed with u-boot header)
> 
>>
>>>
>>> Remove the limitation from the booting.txt documentation.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>    docs/misc/arm/booting.txt |  3 ---
>>>    xen/arch/arm/kernel.c     | 51 ++++++++++++++++++++++++++++++++++-----
>>>    2 files changed, 45 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>>> index bd7bfe7f284a..02f7bb65ec6d 100644
>>> --- a/docs/misc/arm/booting.txt
>>> +++ b/docs/misc/arm/booting.txt
>>> @@ -50,9 +50,6 @@ Also, it is to be noted that if user provides the legacy image header on
>>>    top of zImage or Image header, then Xen uses the attributes of legacy
>>>    image header to determine the load address, entry point, etc.
>>>
>>> -Known limitation: compressed kernels with a uboot headers are not
>>> -working.
>>> -
>>>
>>>    Firmware/bootloader requirements
>>>    --------------------------------
>>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>>> index 068fbf88e492..ea5f9618169e 100644
>>> --- a/xen/arch/arm/kernel.c
>>> +++ b/xen/arch/arm/kernel.c
>>> @@ -265,11 +265,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
>>>    #define IH_ARCH_ARM             2       /* ARM          */
>>>    #define IH_ARCH_ARM64           22      /* ARM64        */
>>>
>>> +/* uImage Compression Types */
>>> +#define IH_COMP_GZIP            1
>>> +
>>>    /*
>>>     * Check if the image is a uImage and setup kernel_info
>>>     */
>>>    static int __init kernel_uimage_probe(struct kernel_info *info,
>>> -                                      paddr_t addr, paddr_t size)
>>> +                                      struct bootmodule *mod)
>>>    {
>>>        struct {
>>>            __be32 magic;   /* Image Header Magic Number */
>>> @@ -287,6 +290,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>>        } uimage;
>>>
>>>        uint32_t len;
>>> +    paddr_t addr = mod->start;
>>> +    paddr_t size = mod->size;
>>>
>>>        if ( size < sizeof(uimage) )
>>>            return -EINVAL;
>>> @@ -294,13 +299,21 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>>        copy_from_paddr(&uimage, addr, sizeof(uimage));
>>>
>>>        if ( be32_to_cpu(uimage.magic) != UIMAGE_MAGIC )
>>> -        return -EINVAL;
>>> +        return -ENOENT;
>>>
>>>        len = be32_to_cpu(uimage.size);
>>>
>>>        if ( len > size - sizeof(uimage) )
>>>            return -EINVAL;
>>>
>>> +    /* Only gzip compression is supported. */
>>> +    if ( uimage.comp && uimage.comp != IH_COMP_GZIP )
>>> +    {
>>> +        printk(XENLOG_ERR
>>> +               "Unsupported uImage compression type %"PRIu8"\n", uimage.comp);
>>> +        return -EOPNOTSUPP;
>>> +    }
>>> +
>>>        info->zimage.start = be32_to_cpu(uimage.load);
>>>        info->entry = be32_to_cpu(uimage.ep);
>>>
>>> @@ -330,8 +343,26 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>>            return -EINVAL;
>>>        }
>>>
>>> -    info->zimage.kernel_addr = addr + sizeof(uimage);
>>> -    info->zimage.len = len;
>>> +    if ( uimage.comp )
>>> +    {
>>> +        int rc;
>>> +
>>> +        /* Prepare start and size for decompression. */
>>> +        mod->start += sizeof(uimage);
>>> +        mod->size -= sizeof(uimage);
>>
>> kernel_decompress() will free the compressed module once it is
>> decompressed. By updating the region it means the free page will be not
>> be freed (assuming start was previously page-aligned).
> Ok, so the start address was previously page-aligned and by adding the uimage size
> to it, it is no longer aligned. True. Do I understand you correctly that you refer
> to the fw_unreserved_regions call from kernel_decompress where we will pass unaligned
> address? 

Correct.

> This could be solved by doing (not harmful in my opinion for common case)
> addr &= PAGE_MASK.
I don't quite understand your argument here. We need a check that work 
for everyone (not only in the common case).

Cheers,

-- 
Julien Grall


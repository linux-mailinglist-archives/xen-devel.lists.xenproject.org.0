Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EBB6E7E06
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 17:19:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523562.813727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9aF-0006Cn-T2; Wed, 19 Apr 2023 15:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523562.813727; Wed, 19 Apr 2023 15:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9aF-0006AH-PV; Wed, 19 Apr 2023 15:18:59 +0000
Received: by outflank-mailman (input) for mailman id 523562;
 Wed, 19 Apr 2023 15:18:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pp9aE-0006AB-M5
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 15:18:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pp9aE-0008PI-2Y; Wed, 19 Apr 2023 15:18:58 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.29.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pp9aD-0002qq-R2; Wed, 19 Apr 2023 15:18:57 +0000
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
	bh=4DpkaVD9eoUsHlIbEkGYNGcpGPLsG/M87jhWJrUp+vg=; b=wnPXoUnjYpDrWpMNtlIyMA21dT
	g13Z/EefJ1zY5Za/HKzUVmYdkvj87xEnmIXEykaBfn++8Tuc6WOPDhMwT/QwOsAzBCFDPG3aoggsu
	giSWdnsBSe4TZlNLZPD2dI5zwdEImgAx4VmU0p10Z3p/2/sEoOCJ6Iuk7WW+whUAMMks=;
Message-ID: <b9dbb568-e35a-4854-3b75-2b4b3ebb9ab6@xen.org>
Date: Wed, 19 Apr 2023 16:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
 <8560fac2-5c92-8362-090d-bbaeae3f5d22@amd.com>
 <4e11e153-2224-15a1-2563-0f1a3c5a6a81@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4e11e153-2224-15a1-2563-0f1a3c5a6a81@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 19/04/2023 15:58, Ayan Kumar Halder wrote:
> 
> On 19/04/2023 14:54, Michal Orzel wrote:
>> On 19/04/2023 15:19, Michal Orzel wrote:
>>>
>>> Hi Ayan,
>>>
>>> On 13/04/2023 19:37, Ayan Kumar Halder wrote:
>>>>
>>>> The DT functions (dt_read_number(), device_tree_get_reg(), 
>>>> fdt_get_mem_rsv())
>>>> currently accept or return 64-bit values.
>>>>
>>>> In future when we support 32-bit physical address, these DT 
>>>> functions are
>>>> expected to accept/return 32-bit or 64-bit values (depending on the 
>>>> width of
>>>> physical address). Also, we wish to detect if any truncation has 
>>>> occurred
>>>> (i.e. while parsing 32-bit physical addresses from 64-bit values 
>>>> read from DT).
>>>>
>>>> device_tree_get_reg() should now be able to return paddr_t. This is 
>>>> invoked by
>>>> various callers to get DT address and size.
>>>>
>>>> For fdt_get_mem_rsv(), we have introduced a wrapper named
>>>> fdt_get_mem_rsv_paddr() which will invoke fdt_get_mem_rsv() and 
>>>> translate
>>>> uint64_t to paddr_t. The reason being we cannot modify 
>>>> fdt_get_mem_rsv() as it
>>>> has been imported from external source.
>>>>
>>>> For dt_read_number(), we have also introduced a wrapper named 
>>>> dt_read_paddr()
>>>> dt_read_paddr() to read physical addresses. We chose not to modify 
>>>> the original
>>>> function as it is used in places where it needs to specifically read 
>>>> 64-bit
>>>> values from dt (For e.g. dt_property_read_u64()).
>>>>
>>>> Xen prints warning when it detects truncation in cases where it is 
>>>> not able to
>>>> return error.
>>>>
>>>> Also, replaced u32/u64 with uint32_t/uint64_t in the functions touched
>>>> by the code changes.
>>>>
>>>> Also, initialized variables to fix the warning 
>>>> "-Werror=maybe-uninitialized".
>>> I can see that now you explicitly set to 0 variables passed to 
>>> fdt_get_mem_rsv_paddr()
>>> which haven't been initialized before being passed to 
>>> fdt_get_mem_rsv(). Is this what
>>> you are reffering to? I cannot reproduce it, hence my question.
>> I can see why did you get this error.
>> Before your change, we always checked for an error from 
>> fdt_get_mem_rsv() by checking if < 0.
>> In your wrapper fdt_get_mem_rsv_paddr(), you switched (not sure why) 
>> to checking if not zero.
>> Becasue of this, you got an error and tried to fix it by initializing 
>> the variables to 0.
> 
> I actually wanted to return the error code obtained from 
> fdt_get_mem_rsv() to the caller.
> 
> In this case, it returns a single error code.

I would rather not rely on this.

> So does this look sane to 
> you ?
> 
> diff --git a/xen/include/xen/libfdt/libfdt-xen.h 
> b/xen/include/xen/libfdt/libfdt-xen.h
> index 3296a368a6..1da87d6668 100644
> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -22,9 +22,8 @@ static inline int fdt_get_mem_rsv_paddr(const void 
> *fdt, int n,
>       uint64_t dt_size;
>       int ret = 0;
> 
> -    ret = fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size);
> -    if ( ret )
> -        return ret;
> +    if ( fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size) < 0 )
> +        return -FDT_ERR_BADOFFSET;

So the problem if you check for ret to be non-zero. But the caller of 
fdt_get_mem_rsv_paddr() check for < 0.

Given that fdt_get_mem_rsv() is not inline, the compiler doesn't know 
that it will not return a positive value (other than 0). Hence why I 
think you get an unitialize value.

The snippet below should work:

if ( ret < 0 )
   return ret;

Cheers,

-- 
Julien Grall


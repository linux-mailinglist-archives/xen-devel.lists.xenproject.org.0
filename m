Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01A6488EA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 20:19:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458197.716080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3iu7-0000Ym-0u; Fri, 09 Dec 2022 19:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458197.716080; Fri, 09 Dec 2022 19:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3iu6-0000Vr-Tx; Fri, 09 Dec 2022 19:19:26 +0000
Received: by outflank-mailman (input) for mailman id 458197;
 Fri, 09 Dec 2022 19:19:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3iu5-0000Vl-H9
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 19:19:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3iu5-0002Nh-2u; Fri, 09 Dec 2022 19:19:25 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.4.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3iu4-0002zC-SV; Fri, 09 Dec 2022 19:19:25 +0000
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
	bh=TAK/R87Cu1Fu3Rd20SjRT8rFtPnd9JnWHlSirhGsKj4=; b=SdWjCJ6Criuy6TYl88xee2gu0I
	rtTbxakE59BZ0JDX0gZT7SkkHQX+CMcCXcNHK6M9qZzPXJlCaVuSlFyjrvXnf5WNVUnObtAcb+fur
	Y8p3Yu10sxO/4Q229Mt/4SHeRJfm5T6ksQlnxyJqlhTmkAdReNtS8iK2H2E25zuwl2yE=;
Message-ID: <f69e17c7-ff85-636d-1176-1556cd1c519a@xen.org>
Date: Fri, 9 Dec 2022 19:19:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
 <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
 <00ab59fa-d449-255b-bfe3-aaacb87e34dd@xen.org>
 <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
 <00793926-ef60-405b-e450-b42ccf939f5e@amd.com>
 <ba76ce47-b999-7daa-3248-0f0be6f49131@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ba76ce47-b999-7daa-3248-0f0be6f49131@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 09/12/2022 19:10, Ayan Kumar Halder wrote:
>> zImage and Image are image protocols, uImage is not. It is just a 
>> legacy u-boot header (no requirements
>> \wrt booting,memory,registers, etc.). It can be added on top of 
>> anything (even vmlinux or a text file).
>> So I guess this is why Xen states that it supports zImage/Image and 
>> does not mention uImage.
>> A header is one thing, the boot requirements are another. Supporting 
>> uImage is ok but if we specify
>> that it must be a u-boot header added on top of zImage/Image.
> 
> Let me first confine to Arm32 only.
> 
> zephyr.bin has to be loaded at a fixed address with which it has been 
> built.
> 
> So, we could either use zImage header (where 'start_address' can be used 
> to specify the load address).
> 
> Or uImage (where -a  is used to specify the load address).
> 
> Adding uImage header on top of zImage does not make sense.
> 
> Now for Arm64,  we do need to parse the zImage header
> 
> #ifdef CONFIG_ARM_64
>      if ( info->type == DOMAIN_64BIT )
>      {
>          return info->mem.bank[0].start + info->zimage.text_offset;
>      }
> #endif
> 
> Again, adding uImage header on top of zImage header does not make sense 
> as well.
> 
> Also, I believe zImage boot requirements are specific for linux kernel.

Correct. But then this is what Xen tries to adhere to when preparing the 
guest. So...

> zephyr or any other RTOS may not follow the same boot requirements.

... if Zephyr or any other RTOS have different requirements, then we may 
need to modify Xen.

Can you describe the expectation of Zephyr for the following components:
   - State of the memory/cache:
	* Should the image be cleaned to PoC or more?
         * What about the area not part of the binary (e.g. BSS)?
         * What about the rest of the memory
   - State of the co-processor registers:
         * Can we call the kernel with I-cache enabled?
         * ...
   - State of the general purpose registers:
         * For instance, Linux expects a pointer to the device-tree in r0

Cheers,

-- 
Julien Grall


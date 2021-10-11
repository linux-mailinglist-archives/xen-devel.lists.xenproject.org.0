Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0EB428C18
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205837.361252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtXh-0003qr-8C; Mon, 11 Oct 2021 11:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205837.361252; Mon, 11 Oct 2021 11:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtXh-0003nX-43; Mon, 11 Oct 2021 11:32:29 +0000
Received: by outflank-mailman (input) for mailman id 205837;
 Mon, 11 Oct 2021 11:32:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mZtXf-0003m6-L8
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:32:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZtXe-0003wh-Kw; Mon, 11 Oct 2021 11:32:26 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.17.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZtXe-00061m-Ee; Mon, 11 Oct 2021 11:32:26 +0000
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
	bh=7TsBDO2sFjHO2M/jmRz1Mme72nCGKt2uR+2SiyPmsik=; b=KJGi+kgSlIgRLy+LtnLmwYuMOp
	DfDbee9hsMlZktyI/jXiKvKzAQC+JKEysLqfA5bnFa98GxRZYysVZNnkrJDna8XPXdp1X4e97LOUH
	NbmbyL7hqqdxwauoipRddquGYJZhBTkOM8zmcszMm4wP+lFf2E+qvkXlJXmhDQn7cIE4=;
Message-ID: <bfe9cb38-7b06-2d99-2e4a-b5025f4c1ab0@xen.org>
Date: Mon, 11 Oct 2021 12:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v5 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20211011080302.24203-1-luca.fancellu@arm.com>
 <20211011080302.24203-2-luca.fancellu@arm.com>
 <81e30575-d823-830b-6f80-4e7a7fb4f9ff@xen.org>
 <BC2506EC-8BCD-487C-AFF4-0C99A9020BDA@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <BC2506EC-8BCD-487C-AFF4-0C99A9020BDA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 11/10/2021 12:23, Luca Fancellu wrote:
> 
> 
>> On 11 Oct 2021, at 10:39, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
> 
> Hi Julien,
> 
>> On 11/10/2021 09:03, Luca Fancellu wrote:
>>> +static bool __init is_boot_module(int dt_module_offset)
>>> +{
>>> +    if ( (fdt_node_check_compatible(fdt, dt_module_offset,
>>> +                                    "multiboot,kernel") == 0) ||
>>> +         (fdt_node_check_compatible(fdt, dt_module_offset,
>>> +                                    "multiboot,ramdisk") == 0) ||
>>> +         (fdt_node_check_compatible(fdt, dt_module_offset,
>>> +                                    "multiboot,device-tree") == 0) )
>>> +        return true;
>>
>> A boot module *must* have the compatible "multiboot,module". I would prefer if we simply check that "multiboot,module" is present.
>>
>> This will also make easier to add new boot module in the future.
> 
> I thought that also the XSM policy was a multiboot,module so I checked explicitly for kernel, ramdisk, device-tree that are supported
> by domU.

The XSM policy is indeed a multiboot module and should not be used by 
the domU.

> 
> Do you still think that I should check just for multiboot,module instead?

Yes please. I think this is not the EFI stub job to check that the most 
specific compatible is correct.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC7A44B764
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 23:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224125.387226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkZeo-0000Y3-9R; Tue, 09 Nov 2021 22:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224125.387226; Tue, 09 Nov 2021 22:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkZeo-0000Vb-6K; Tue, 09 Nov 2021 22:31:58 +0000
Received: by outflank-mailman (input) for mailman id 224125;
 Tue, 09 Nov 2021 22:31:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mkZen-0000VT-2o
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 22:31:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkZek-0000uH-IG; Tue, 09 Nov 2021 22:31:54 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.31.175]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkZek-0007aU-87; Tue, 09 Nov 2021 22:31:54 +0000
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
	bh=t8PtrqKsEoZS5lA/fuRAN2pFrE2W6/wX4gkUU6pGYNE=; b=UblVjR0O1KvD9w0lm3/uvJhxmc
	L19D5fpcHK4uoz5PdZF/jAFABivpwdT9Cm7X7QVofasEX0yOF34h5r26brKi0oYBqBSgxkIS+y85p
	WB5ii0ynxdU7x8JvU5On73SKBzCCcRrnKJ99MRngWlKBZ7i0psV8w0v6jKxc6nLLdpEE=;
Message-ID: <2a2fc77f-408d-7313-5205-6b42c713838a@xen.org>
Date: Tue, 9 Nov 2021 22:31:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
 <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
 <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/11/2021 21:52, Stefano Stabellini wrote:
> On Tue, 9 Nov 2021, Jan Beulich wrote:
>> On 09.11.2021 03:11, Stefano Stabellini wrote:
>>> On Mon, 8 Nov 2021, Jan Beulich wrote:
>>>> On 05.11.2021 16:33, Stefano Stabellini wrote:
>>>>> My main concern is performance and resource utilization. With v3 of the
>>>>> patch get_parent_handle will get called for every module to be loaded.
>>>>> With dom0less, it could easily get called 10 times or more. Taking a
>>>>> look at get_parent_handle, the Xen side doesn't seem small and I have
>>>>> no idea how the EDK2 side looks. I am just worried that it would
>>>>> actually have an impact on boot times (also depending on the bootloader
>>>>> implementation).
>>>>
>>>> The biggest part of the function deals with determining the "residual" of
>>>> the file name. That part looks to be of no interest at all to
>>>> allocate_module_file() (whether that's actually correct I can't tell). I
>>>> don't see why this couldn't be made conditional (e.g. by passing in NULL
>>>> for "leaf").
>>>
>>> I understand the idea of passing NULL instead of "leaf", but I tried
>>> having a look and I can't tell what we would be able to skip in
>>> get_parent_handle.
>>
>> My bad - I did overlook that dir_handle gets updated even past the
>> initial loop.
>>
>>> Should we have a global variable to keep the dir_handle open during
>>> dom0less module loading?
>>
>> If that's contained within Arm-specific code, I (obviously) don't mind.
>> Otherwise I remain to be convinced.
> 
> I think we can do something decent entirely within
> xen/arch/arm/efi/efi-boot.h.
> 
> Luca, see below as reference; it is untested and incomplete but should
> explain the idea better than words. With the below, we only open/close
> the handle once for the all dom0less modules.

Looking at the diff below, you open/close dir_handle within 
efi_check_dt_boot(). This means that only the functions called within 
the function will effectively used.

At which point, I think this should be an argument of the functions 
rather than a global function. This will drastically reduce any misuse 
of the global variable (which BTW the name seems to clash with some of 
the arguments).

Cheers,

-- 
Julien Grall


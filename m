Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB47A0040
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 11:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602176.938585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgimZ-0005sB-Gv; Thu, 14 Sep 2023 09:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602176.938585; Thu, 14 Sep 2023 09:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgimZ-0005r8-EG; Thu, 14 Sep 2023 09:37:07 +0000
Received: by outflank-mailman (input) for mailman id 602176;
 Thu, 14 Sep 2023 09:37:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgimY-0005qD-Un
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 09:37:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgimY-0002qU-Mq; Thu, 14 Sep 2023 09:37:06 +0000
Received: from [15.248.3.3] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgimY-0004Gx-G5; Thu, 14 Sep 2023 09:37:06 +0000
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
	bh=zGMiidAp6KiQFnF0CuxpF8jNv8x97nvi5ACKXaGt7sY=; b=5v/yyLPL31ExwsaQDQtfYMOexu
	wy3DWd/RwxoInDOPabRhlcSCe7Ld4TuWF1Yy3g84joA7JCi5ESjGhxr53+86QzmnIlhuxiTdzQXw9
	DD9ERtb3Yvd9BGiCgMFyFrSIY0/775vHXFWhZMvUPym+4a8UodkHhGThTEXLzSgftT2o=;
Message-ID: <23a0185e-428d-496b-96b6-d5082800bfd4@xen.org>
Date: Thu, 14 Sep 2023 10:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: arm64: Handling reserved memory nodes
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, Penny Zheng <penny.zheng@arm.com>
References: <20230914081607.GA1400758@leoy-huanghe.lan>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230914081607.GA1400758@leoy-huanghe.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2023 09:16, Leo Yan wrote:
> Hi all,

Hi Leo,

> I'd like to discuss for how to handle the reserved memory nodes in DT
> binding on Xen / Arm64.  Note, now I am using DTB when boot Xen but
> not UEFI/ACPI (ACPI is disabled in this case).
> 
> ## Failure
> 
> I ported Xen on a platform, after the kernel booting, the Xen hypervisor
> reports error:
> 
>    (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc
> 
> This error is caused by kernel using an invalid memory frame number
> 0x1a02dc, we can convert it to the address:
> 
>    0x1a02dc << PAGE_SHIFT = 0x1_a02d_c000

This error is coming from get_page_from_gva(). The use of the function 
is usually an indication that Xen is trying to access the page. Can you 
use WARN() to provide a full trace?

> 
> ## Reason
> 
> Two important things we need to check.  One is what's the DT binding
> passed from the bootloader to Xen hypervisor, and the second thing is
> what's the DT binding passed from Xen hypervisor to kernel.
> 
> We can see the bootloader passes below memory nodes to Xen hypervisor:
> 
>    (XEN) RAM: 0000000020000000 - 00000000bfffffff
>    (XEN) RAM: 00000001a0000000 - 00000002ffffffff
>    (XEN)
>    (XEN) MODULE[0]: 0000000020100000 - 0000000020265000 Xen
>    (XEN) MODULE[1]: 0000000023000000 - 0000000023024000 Device Tree
>    (XEN) MODULE[2]: 0000000024000000 - 0000000028000000 Kernel
>    (XEN)  RESVD[0]: 0000000020000000 - 000000002000ffff
>    (XEN)  RESVD[1]: 0000000040000000 - 000000005fffffff
>    (XEN)  RESVD[2]: 00000001a0000000 - 00000001bfffffff
>    (XEN)  RESVD[3]: 000000002e000000 - 000000002fffffff
> 
> We can see the second DDR section is:
> 
>    [0x0000_0001_a000_0000 .. 0x0000_0002_ffff_ffff]
> 
> And there have reserved memory section is:
> 
>    [0x0000_0001_a000_0000 .. 0x0000_0001_bfff_ffff]
> 
> When register the boot memory sections, dt_unreserved_regions() will
> remove all reserved memory sections, which means the section
> [0x0000_0001_a000_0000 .. 0x0000_0001_bfff_ffff] is not managed by Xen
> hypervisor at all.  If later kernel uses any pages in this range, Xen
> will report the error.

It is perfectly fine for dom0 to access a page that are not managed by 
Xen (a good example is MMIO regions are not managed). Now, some problems 
can occur if the page then needs to be access by Xen (e.g. if they 
contain hypercall buffers).

[...]

> ## Fixes
> 
> I think it's wrong to add the reserved memory regions into the DT
> binding as normal memory nodes for Dom0 kernel.  On the other hand, we
> cannot simply remove these reserved memory regions and don't pass to
> Dom0 kernel - we might reserve memory for specific purpose, for example,
> ramoops [1] for kernel debugging.
> 
> The right thing to do is to keep these reserved memory nodes to Dom0
> kernel.  So one task is to record properties for these reserved memory
> node name and properties and pass to Dom0 kernel.
> 
> The difficulty is how we can avoid allocate these reserved memory
> regions in Xen hypervisor.  We cannot register the reserved memory
> into the boot pages, otherwise, the reserved memory might be allocated
> in the early phase.  But we need to register these pages into the
> frame management framework and reserve them in the first place, so
> that we can allow Dom0 kernel to use them.  (I checked a bit the static
> memory mechanism, seems to me we cannot use it to resolve this issue).

 From my understanding reserved region are normal RAM which have been 
carved out for specific purpose. They may expect different caching 
policy (e.g. non-cachable). AFAIK, Xen doesn't have the capability to 
know the memory attribute (the DT binding only tell whether the region 
should not mapped. See the property "no-map"), hence why they were 
excluded from the memory management.

It would be good to understand why Xen may try to get a reference on the 
page.

Also, can you find the associated reserved-region and content of the 
Device-Tree?

Cheers,

-- 
Julien Grall


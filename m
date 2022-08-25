Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A415A1146
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 14:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393415.632355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRCS1-0001nc-R6; Thu, 25 Aug 2022 12:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393415.632355; Thu, 25 Aug 2022 12:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRCS1-0001kg-Nx; Thu, 25 Aug 2022 12:59:13 +0000
Received: by outflank-mailman (input) for mailman id 393415;
 Thu, 25 Aug 2022 12:59:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oRCRz-0001ka-Ow
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 12:59:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRCRx-0006JQ-Dg; Thu, 25 Aug 2022 12:59:09 +0000
Received: from [54.239.6.188] (helo=[192.168.11.158])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRCRx-0005ug-6b; Thu, 25 Aug 2022 12:59:09 +0000
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
	bh=1W5cHvocTj7Me4hvwGKn/z120yXd+PWnCH9VCqtfyQY=; b=qkPXQlYRBQJPtYkzFTNKyqg3lp
	G3MeazDILm6vqmEnbqMT0wBVEKVeldIrfgt+4mMapb7HmKtq4XKTmF5z9eTyiZAakLQPurx6FDgJI
	+3bRXGUpQ662J9QAA55+rATGOpWXauXZTjppARztpET5slG4irLUfJ1CptId6paH8DW8=;
Message-ID: <52f24132-ba2b-d4ab-ebd0-613f673b5658@xen.org>
Date: Thu, 25 Aug 2022 13:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
References: <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
 <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
 <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
 <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org>
 <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
 <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
 <871qtcsacd.wl-maz@kernel.org> <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>
 <YwdiDr2uLXGEl2TC@leoy-huanghe>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YwdiDr2uLXGEl2TC@leoy-huanghe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leo,

On 25/08/2022 12:50, Leo Yan wrote:
> On Thu, Aug 25, 2022 at 10:07:18AM +0100, Julien Grall wrote:
> 
> [...]
> 
>>> Xen directly passes ACPI MADT table from UEFI to Linux kernel to Dom0,
>>> (see functions acpi_create_madt() and gic_make_hwdom_madt()), which
>>> means the Linux kernel Dom0 uses the same ACPI table to initialize GICv3
>>> driver, but since Linux kernel Dom0 accesses GIC memory region as IPA,
>>> it still trap to Xen in EL2 for stage 2 translation, so finally Xen
>>> can emulate the GICv3 device for Dom0.
>>
>> In the default setup, dom0 is also the hardware domain. So it owns all of
>> the devices but the ones used by Xen (e.g. interrupt controller, SMMU).
>>
>> Therefore, dom0 will use the same memory layout as the host. At which point,
>> it is a lot more convenient to re-use the host ACPI tables and rewrite only
>> what's necessary.
> 
> We cannot purely talk about interrupt handling without connecting with
> device driver model.
> 
> Seems to me, to support para virtualization driver model (like virtio),
> Dom0 needs to provide the device driver backend, and DomUs enables
> the forend device drivers.  In this case, the most hardware interrupts
> (SPIs) are routed to Dom0.

That's correct. Most of the shared interrupts will be routed to dom0.
> To support passthrough driver model (VFIO), Xen needs to configure the
> hardware GICv3 to directly route hardware interrupt to the virtual CPU
> interface.

Do you mean GICv4 rather than GICv3? In the latter, all the interrupts 
will be received in Xen and then routed to the domain by updating the LRs.

> 
> But here I still cannot create the concept that how GIC RD tables play
> roles to support the para virtualization or passthrough mode.

I am not sure what you are actually asking. The pending tables are just 
memory you give to the GICv3 to record the state of the interrupts.

Cheers,

-- 
Julien Grall


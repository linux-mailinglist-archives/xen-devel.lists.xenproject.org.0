Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A327CAA87
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617611.960368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO3M-00070F-0k; Mon, 16 Oct 2023 13:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617611.960368; Mon, 16 Oct 2023 13:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO3L-0006yG-TY; Mon, 16 Oct 2023 13:54:39 +0000
Received: by outflank-mailman (input) for mailman id 617611;
 Mon, 16 Oct 2023 13:54:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsO3K-0006wE-0o
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:54:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsO3J-0003LD-J3; Mon, 16 Oct 2023 13:54:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsO3J-0000Ub-Dl; Mon, 16 Oct 2023 13:54:37 +0000
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
	bh=WpNBQUJSRh5nvPiBxRIrchR6LkqJ4ocfYJ049kFNAvE=; b=z5fiK+v22LXphV7FsFzXlZuhXp
	kAKb85Hv+9yUceQx5uo1p9XgD2gQQ2eZ0Nv1zy2OTt1eI8r1NB9vPPSA4mpqyim4TOp56MengbtHw
	mijgea/uEMhMuNIbg1m9YoTnXbPUeb/6ronb4IbQy00TLyr5qwf77Zh8EpxPhNLNXprg=;
Message-ID: <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
Date: Mon, 16 Oct 2023 14:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Leo Yan <leo.yan@linaro.org>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/10/2023 09:44, Michal Orzel wrote:
> Hi,

Hi,

> On 13/10/2023 14:26, Leo Yan wrote:
>>
>>
>> On ADLink AVA platform (Ampere Altra SoC with 32 Arm Neoverse N1 cores),
>> the physical memory regions are:
>>
>>    DRAM memory regions:
>>      Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
>>      Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
>>      Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff
>>
>> The UEFI loads Xen hypervisor and DTB into the high memory, the kernel
>> and ramdisk images are loaded into the low memory space:
>>
>>    (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>>    (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>>    (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>>    (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
>>
>> In this case, the Xen binary is loaded above 8TB, which exceeds the
>> maximum supported identity map space of 2TB in Xen. Consequently, the
>> system fails to boot.
>>
>> This patch enlarges identity map space to 10TB, allowing module loading
>> within the range of [0x0 .. 0x000009ff_ffff_ffff].
>>
>> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
> I don't think a fixes tag applies here given that 2TB was just a number we believed is enough
> and all of this is platform dependent.
> This can be dropped on commit if committer agrees
Xen may have booted on that platform before hand. So this would be 
considered a regression and therefore a tag would be warrant.

AFAICT, the commit is only present on the upcoming 4.18. So the question 
is whether Xen 4.17 booted out-of-the-box on ADLink? If the answer is 
yes, then we need to add a Fixes tag. But the correct one would be

﻿1c78d76b67e1 ("xen/arm64: mm: Introduce helpers to 
prepare/enable/disable the identity mapping").

We would also need to consider it as a candidate for Xen 4.18 because we 
would regress boot on ADLink.

Cheers,

-- 
Julien Grall


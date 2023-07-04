Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05CF7479AE
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 23:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558727.873074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGnr3-0003pJ-Au; Tue, 04 Jul 2023 21:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558727.873074; Tue, 04 Jul 2023 21:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGnr3-0003mz-84; Tue, 04 Jul 2023 21:46:37 +0000
Received: by outflank-mailman (input) for mailman id 558727;
 Tue, 04 Jul 2023 21:46:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGnr1-0003mt-HV
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 21:46:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGnr0-0003uY-TO; Tue, 04 Jul 2023 21:46:34 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGnr0-0007mb-M2; Tue, 04 Jul 2023 21:46:34 +0000
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
	bh=mgq6h4XSKoOlq0FL4kJcBME6t+7iXrA3rBtUkkKjczA=; b=LPBclirkZn67y/OCBgx5r75FoH
	8fh+gzdEtYjIoDzFi3kVn4MpX1A4Ay5igd/puhuZSnvVoqFvWDzJ1HVFcBipHH70o0cBvkOnwHxV2
	OPShaL82g0E1NBqQkZbRQv+Y3Hdxfq+WQl248Yb3fNQkuc34GctwxcK+9xQqjmgdCsbw=;
Message-ID: <39187006-6220-4b76-ada4-9e5be72b60fe@xen.org>
Date: Tue, 4 Jul 2023 22:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 08/52] xen/arm64: move MMU related code from head.S to
 mmu/head.S
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-9-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-9-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 26/06/2023 04:33, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> There are lots of MMU specific code in head.S. This code will not
> be used in MPU systems. If we use #ifdef to gate them, the code
> will become messy and hard to maintain. So we move MMU related
> code to mmu/head.S, and keep common code still in head.S. We also
> add .text.idmap in mmu/head.S to make all code in this new file
> are still in identity map page but will be linked after head.S.
> 
> As "fail" in head.S is very simple and this name is too easy to
> be conflicted, so duplicate it in mmu/head.S instead of exporting
> it.
> 
> And some assembly macros that will be shared by MMU and MPU later,
> we move them to macros.h.

Aren't those macros already shared between head.S and mmu/head.S?

> 
> Rename enable_boot_mmu()/enable_runtime_mmu() to a more generic name
> enable_boot_mm()/enable_runtime_mm(), in order to make them common interfaces
> to be used for both MMU and later MPU system.

As mentionned in an earlier patch, I would prefer if the name was 
correct from the beginning. So this patch will be merely code movement.

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

I think this will need a rebase on top of the recent changes in head.S.

> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 54ad55c75c..0c4b177be9 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -8,6 +8,9 @@ obj-y += domctl.o

[...]

> -/*
> - * Macro to print the value of register \xb
> - *
> - * Clobbers x0 - x4
> - */
> -.macro print_reg xb
> -        mov   x0, \xb
> -        mov   x4, lr
> -        bl    putn
> -        mov   lr, x4
> -.endm

I can't find any use of print_reg() in mmu/head.S. So is it necessary to 
move right now?

[...]

> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> new file mode 100644
> index 0000000000..2b209fc3ce
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -0,0 +1,453 @@
> +/*
> + * xen/arch/arm/mmu/head.S
> + *
> + * Start-of-day code for an ARMv8.
> + *
> + * Ian Campbell <ian.campbell@citrix.com>
> + * Copyright (c) 2012 Citrix Systems.
> + *
> + * Based on ARMv7-A head.S by
> + * Tim Deegan <tim@xen.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

For new file (even split code), please use the SPDX tag. In this case, 
the following line should be added at the top of the file:

/* SPDX-License-Identifier: GPL-2.0-or-later */

Cheers,

-- 
Julien Grall


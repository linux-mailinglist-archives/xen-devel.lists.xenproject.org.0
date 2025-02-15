Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89511A36CF9
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 10:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889358.1298491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjEcu-0002uc-IU; Sat, 15 Feb 2025 09:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889358.1298491; Sat, 15 Feb 2025 09:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjEcu-0002sJ-FR; Sat, 15 Feb 2025 09:38:20 +0000
Received: by outflank-mailman (input) for mailman id 889358;
 Sat, 15 Feb 2025 09:38:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tjEct-0002sD-1J
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 09:38:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tjEcs-0030FD-1k;
 Sat, 15 Feb 2025 09:38:18 +0000
Received: from [2a02:8012:3a1:0:c076:8426:eb1f:4b85]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tjEcs-001Usg-0D;
 Sat, 15 Feb 2025 09:38:18 +0000
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
	bh=QyGlqPUrBNvNZvW1kOXARqMPdk4WdElvmmwuxIV1fyE=; b=z+LLAf8juGr0Qlk46s0cIVaox4
	uBmpTxsDhpaEFx0H3WbC/XbXvUEP06VTJhKoVRZ6xXl5e0hLcPPnFGjZg4ahi7paZahs4MbPrHLC5
	O8V2O+jxnI7MY3Ex9QQm61R1+nL19lixNiMPGYAYPML4dY5jV1zRV9CzZNNVv6QXvcsA=;
Message-ID: <bbfd56fd-9109-457a-8eec-854df9ab9eee@xen.org>
Date: Sat, 15 Feb 2025 09:38:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] xen: common: add ability to enable stack protector
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
 <20250213220021.2897526-3-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250213220021.2897526-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 13/02/2025 22:00, Volodymyr Babchuk wrote:
> diff --git a/xen/common/stack-protector.c b/xen/common/stack-protector.c
> new file mode 100644
> index 0000000000..286753a1b1
> --- /dev/null
> +++ b/xen/common/stack-protector.c
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/random.h>
> +#include <xen/time.h>
> +
> +/*
> + * Initial value is chosen by a fair dice roll.
> + * It will be updated during boot process.
> + */
> +#if BITS_PER_LONG == 32
> +unsigned long __ro_after_init __stack_chk_guard = 0xdd2cc927UL;
> +#else
> +unsigned long __ro_after_init __stack_chk_guard = 0x2d853605a4d9a09cUL;
> +#endif
> +
> +/*
> + * This function should be called from early asm or from a C function
> + * that escapes stack canary tracking (by calling
> + * reset_stack_and_jump() for example).
> + */
> +void __init asmlinkage boot_stack_chk_guard_setup(void)

I am probably missing something. But what prevent the compiler to insert 
a stack guard when entering this function and checking on exit? Wouldn't 
this fail because __stack_chk_guard would be different?

IOW, shouldn't this function be a static always inline like it used to be?

Cheers,

-- 
Julien Grall



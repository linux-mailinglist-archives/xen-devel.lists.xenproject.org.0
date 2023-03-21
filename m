Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12366C3818
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512909.793302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefgL-0000Vm-Lk; Tue, 21 Mar 2023 17:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512909.793302; Tue, 21 Mar 2023 17:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefgL-0000Tz-Io; Tue, 21 Mar 2023 17:21:57 +0000
Received: by outflank-mailman (input) for mailman id 512909;
 Tue, 21 Mar 2023 17:21:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pefgK-0000Tt-HY
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:21:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefgK-0002tk-0O; Tue, 21 Mar 2023 17:21:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefgJ-0005Oo-Q1; Tue, 21 Mar 2023 17:21:55 +0000
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
	bh=K4F66Pc08VkcdT8EBQGXzI1MQrADHUOOinzPCBX44D4=; b=b7JuiNU+3dc0hPKZ9T6vckqzRm
	DXf2nNQP0nhgN3XBWRsdgf6jCY4tIM8Bl7XhRI9cK/YKyxzdumZsmEkpUotO+/2kr9ycRn+1fWN2t
	P50uwYjSyMhlCxXLq+KpUwiUHi0a3nI/ZL951SbTSKb+HuU0Jh2cTCqqv3/7NWQxCaZM=;
Message-ID: <b28bc3fc-c38d-502b-409b-092e7398dd3a@xen.org>
Date: Tue, 21 Mar 2023 17:21:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v5 3/7] xen/riscv: introduce dummy <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <82aa35ce27ca11076bbafbb565e9c85e1ce7624d.1678976127.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <82aa35ce27ca11076bbafbb565e9c85e1ce7624d.1678976127.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 16/03/2023 14:39, Oleksii Kurochko wrote:
> <xen/lib.h> will be used in the patch "xen/riscv: introduce
> decode_cause() stuff" and requires <asm/bug.h>
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V5:
>   * the patch was introduced in the current patch series (V5)
> ---
>   xen/arch/riscv/include/asm/bug.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/bug.h
> 
> diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
> new file mode 100644
> index 0000000000..e8b1e40823
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2021-2023 Vates

I am a bit puzzled with those copyright given the header is empty.

But is there any reason this can't be folded in #6 or part of #6 moved 
forward?

> + *

NIT: Drop the line.

> + */
> +#ifndef _ASM_RISCV_BUG_H
> +#define _ASM_RISCV_BUG_H
> +
> +#endif /* _ASM_RISCV_BUG_H */

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6485987F
	for <lists+xen-devel@lfdr.de>; Sun, 18 Feb 2024 19:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682620.1061702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rblns-00040m-Ev; Sun, 18 Feb 2024 18:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682620.1061702; Sun, 18 Feb 2024 18:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rblns-0003xa-C5; Sun, 18 Feb 2024 18:22:16 +0000
Received: by outflank-mailman (input) for mailman id 682620;
 Sun, 18 Feb 2024 18:22:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rblnr-0003xU-4A
 for xen-devel@lists.xenproject.org; Sun, 18 Feb 2024 18:22:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rblnq-0007an-TF; Sun, 18 Feb 2024 18:22:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rblnq-00050x-Np; Sun, 18 Feb 2024 18:22:14 +0000
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
	bh=cQFI98VV1YZYGzqepX/tZFMS0fNNz4PeN/G23l495II=; b=Ey/JpORooTusyFnG+8pThaCaAI
	ZTmR/OFyDjdcnhK7Ac1Qjszs6pl8q1GMrnCJJflxKq0f0Uvm6DWpRxX1QUQN1PqGnf38bHAgak+wI
	KTtUA2zcNBrcG03rZmjqhynrLxHFrjTDhM8RKKw1BayAp+NxNBSlrH3UldGDHc3hZWxw=;
Message-ID: <ea8d10ef-39cd-49a2-a445-6705b87d50b3@xen.org>
Date: Sun, 18 Feb 2024 18:22:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/30] xen/riscv: introduce regs.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <13cfdfa01b303d2597124f09c0ec0734859b697d.1707146506.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <13cfdfa01b303d2597124f09c0ec0734859b697d.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/02/2024 15:32, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ------
> Changes in V4:
>   - add Acked-by: Jan Beulich <jbeulich@suse.com>
>   - s/BUG()/BUG_ON("unimplemented")
> ---
> Changes in V3:
>   - update the commit message
>   - add Acked-by: Jan Beulich <jbeulich@suse.com>
>   - remove "include <asm/current.h>" and use a forward declaration instead.
> ---
> Changes in V2:
>   - change xen/lib.h to xen/bug.h
>   - remove unnecessary empty line
> ---
> xen/arch/riscv/include/asm/regs.h | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/regs.h
> 
> diff --git a/xen/arch/riscv/include/asm/regs.h b/xen/arch/riscv/include/asm/regs.h
> new file mode 100644
> index 0000000000..c70ea2aa0c
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/regs.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ARM_RISCV_REGS_H__
> +#define __ARM_RISCV_REGS_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/bug.h>
> +
> +#define hyp_mode(r)     (0)

I don't understand where here you return 0 (which should really be 
false) but ...

> +
> +struct cpu_user_regs;
> +
> +static inline bool guest_mode(const struct cpu_user_regs *r)
> +{
> +    BUG_ON("unimplemented");
> +}

... here you return BUG_ON(). But I couldn't find any user of both 
guest_mode() and hyp_mode(). So isn't it a bit prematurate to introduce 
the helpers?

Cheers,

-- 
Julien Grall


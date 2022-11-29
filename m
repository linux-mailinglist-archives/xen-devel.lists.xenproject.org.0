Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835FE63BBF0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 09:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449280.705942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozwFx-0007hl-Vi; Tue, 29 Nov 2022 08:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449280.705942; Tue, 29 Nov 2022 08:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozwFx-0007ek-SD; Tue, 29 Nov 2022 08:46:21 +0000
Received: by outflank-mailman (input) for mailman id 449280;
 Tue, 29 Nov 2022 08:46:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ozwFw-0007ee-4N
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 08:46:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ozwFv-0000i0-QQ; Tue, 29 Nov 2022 08:46:19 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.9.110]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ozwFv-0007KB-Jl; Tue, 29 Nov 2022 08:46:19 +0000
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
	bh=VQeUPbLvW8N0BdpHppup9iMVHpNG69XXEtooMxp+5D8=; b=FFfzwGsuT4DO4Zbi315XoCGtIO
	tqADyUcMaknkb4Z8vR6Qalir9EcHQcDYRDqXcH6vT6gmUXjXQIxdaadM3A7I95fqC3CwnSu29u9tK
	9Ai3dHMH9rjloc5BxD1rXdDQueWMQ5kFtIKl1gSNeHvaWHX7mMRu8fujRXGosdPjsc6A=;
Message-ID: <44c8e3ec-e1af-013a-e83a-1495b1332587@xen.org>
Date: Tue, 29 Nov 2022 08:46:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/2] xen/arm: vpl011: emulate non-SBSA registers as
 WI/RAZ
Content-Language: en-US
To: Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221129023935.1576133-1-jiamei.xie@arm.com>
 <20221129023935.1576133-2-jiamei.xie@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221129023935.1576133-2-jiamei.xie@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/11/2022 03:39, Jiamei Xie wrote:
> When the guest kernel enables DMA engine with "CONFIG_DMA_ENGINE=y",
> Linux SBSA PL011 driver will access PL011 DMACR register in some
> functions. As chapter "B Generic UART" in "ARM Server Base System
> Architecture"[1] documentation describes, SBSA UART doesn't support
> DMA. In current code, when the kernel tries to access DMACR register,
> Xen will inject a data abort:
> Unhandled fault at 0xffffffc00944d048
> Mem abort info:
>    ESR = 0x96000000
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x00: ttbr address size fault
> Data abort info:
>    ISV = 0, ISS = 0x00000000
>    CM = 0, WnR = 0
> swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
> [ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803, pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
> ...
> Call trace:
>   pl011_stop_rx+0x70/0x80
>   tty_port_shutdown+0x7c/0xb4
>   tty_port_close+0x60/0xcc
>   uart_close+0x34/0x8c
>   tty_release+0x144/0x4c0
>   __fput+0x78/0x220
>   ____fput+0x1c/0x30
>   task_work_run+0x88/0xc0
>   do_notify_resume+0x8d0/0x123c
>   el0_svc+0xa8/0xc0
>   el0t_64_sync_handler+0xa4/0x130
>   el0t_64_sync+0x1a0/0x1a4
> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
> ---[ end trace 83dd93df15c3216f ]---
> note: bootlogd[132] exited with preempt_count 1
> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon
> 
> As discussed in [2], this commit makes the access to non-SBSA registers
> RAZ/WI as an improvement.
> 
> [1] https://developer.arm.com/documentation/den0094/c/?lang=en
> [2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2211161552420.4020@ubuntu-linux-20-04-desktop/
> 
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
> ---
> v2 -> v3
> - emulate non-SBSA registers as WI/RAZ in default case
> - update commit message
> v1 -> v2
> - print a message using XENLOG_G_DEBUG when it's write-ignore
> ---
>   xen/arch/arm/vpl011.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 43522d48fd..1bf803fc1f 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -414,11 +414,19 @@ static int vpl011_mmio_read(struct vcpu *v,
>       default:
>           gprintk(XENLOG_ERR, "vpl011: unhandled read r%d offset %#08x\n",
>                   dabt.reg, vpl011_reg);
> -        return 0;
> +        goto read_as_zero;
>       }
>   
>       return 1;
>   
> +read_as_zero:
> +    if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;

We don't know the registers and therefore I don't think we should check 
the size.

> +
> +    VPL011_LOCK(d, flags);
> +    *r = 0;
> +    VPL011_UNLOCK(d, flags);
There is no need to lock/unlock here.

> +    return 1;
> +
>   bad_width:
>       gprintk(XENLOG_ERR, "vpl011: bad read width %d r%d offset %#08x\n",
>               dabt.size, dabt.reg, vpl011_reg);
> @@ -486,10 +494,11 @@ static int vpl011_mmio_write(struct vcpu *v,
>       default:
>           gprintk(XENLOG_ERR, "vpl011: unhandled write r%d offset %#08x\n",
>                   dabt.reg, vpl011_reg);
> -        return 0;
> +        goto write_ignore;
>       }
>   
>   write_ignore:
> +    if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;

Same as for the read_as_zero, the size is unknown and shouldn't be checked.

Cheers,

-- 
Julien Grall


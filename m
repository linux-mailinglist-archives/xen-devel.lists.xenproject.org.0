Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C17FDEDE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 18:51:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644144.1004778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OhS-0003Ve-Ht; Wed, 29 Nov 2023 17:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644144.1004778; Wed, 29 Nov 2023 17:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OhS-0003SZ-EU; Wed, 29 Nov 2023 17:50:14 +0000
Received: by outflank-mailman (input) for mailman id 644144;
 Wed, 29 Nov 2023 17:50:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8OhR-0003ST-6U
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 17:50:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OhQ-0000UY-4P; Wed, 29 Nov 2023 17:50:12 +0000
Received: from 82-132-227-204.dab.02.net ([82.132.227.204] helo=[172.20.10.4])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OhP-0004rA-Er; Wed, 29 Nov 2023 17:50:12 +0000
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
	bh=EjIiIFjQXAZENlU0VMewBG7bAzNCvXIxN1ja/k84jTo=; b=k4kZn7Ktbf+/5HkI1VsNMIbe1J
	Vy1zttD99/0eM11IhFPVcvKTsov+jmH09u+d57/12hehfamWkL+Z1p7ipZMgvexkxqa2fziL5wC2O
	fdKh8xXfCFBqlf/sVe4970GysyE0qrVo/Ui5L0Yzh+sgEMbmnRhLBEViYgpiyx3aIfUc=;
Message-ID: <9b1e2289-4080-4dd5-bf4e-0dc14425ffce@xen.org>
Date: Wed, 29 Nov 2023 18:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/arm: address violations of MISRA C:2012 Rule 11.8
Content-Language: en-GB
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, maria.celeste.cesario@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
 <df2af5f9a93c3cbcb61c28ff5228632c82d56f37.1700842832.git.maria.celeste.cesario@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <df2af5f9a93c3cbcb61c28ff5228632c82d56f37.1700842832.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/11/2023 17:29, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Add or amend casts to comply with Rule 11.8.
> 
> The violations are resolved either:
> - by adding a missing const qualifier in the cast
> - by removing a cast to non-const on a const-qualified object
> 
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> ---
>   xen/arch/arm/domain_build.c       | 2 +-
>   xen/arch/arm/include/asm/atomic.h | 2 +-
>   xen/arch/arm/include/asm/regs.h   | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 2dd2926b41..c17214f738 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2749,7 +2749,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>       if ( node == NULL )
>       {
>           printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
> -               (char *)xen_path->data);
> +               xen_path->data);

I am a little bit puzzled why the cast was originally added here. 
Stefano, do you remember?

Also, this hunk will not apply on staging (the code has moved to 
dom0less-build.c). This will want a new version.

>           return -EINVAL;
>       }
>   
> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
> index 64314d59b3..517216d2a8 100644
> --- a/xen/arch/arm/include/asm/atomic.h
> +++ b/xen/arch/arm/include/asm/atomic.h
> @@ -154,7 +154,7 @@ static always_inline void write_atomic_size(volatile void *p,
>    */
>   static inline int atomic_read(const atomic_t *v)
>   {
> -    return *(volatile int *)&v->counter;
> +    return *(const volatile int *)&v->counter;
>   }
>   
>   static inline int _atomic_read(atomic_t v)
> diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
> index 8a0db95415..79050937f3 100644
> --- a/xen/arch/arm/include/asm/regs.h
> +++ b/xen/arch/arm/include/asm/regs.h
> @@ -48,7 +48,7 @@ static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
>   
>   static inline bool guest_mode(const struct cpu_user_regs *r)
>   {
> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);
> +    unsigned long diff = (char *)guest_cpu_user_regs() - (const char *)(r);

NIT: I would take the opportunity to use 'const char*' for the first one 
as well.

>       /* Frame pointer must point into current CPU stack. */
>       ASSERT(diff < STACK_SIZE);
>       /* If not a guest frame, it must be a hypervisor frame. */

Cheers,

-- 
Julien Grall


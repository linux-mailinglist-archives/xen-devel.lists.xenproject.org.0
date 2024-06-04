Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681578FB0B9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 13:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735333.1141508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sES0Y-0003oY-Cq; Tue, 04 Jun 2024 11:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735333.1141508; Tue, 04 Jun 2024 11:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sES0Y-0003m2-9T; Tue, 04 Jun 2024 11:07:14 +0000
Received: by outflank-mailman (input) for mailman id 735333;
 Tue, 04 Jun 2024 11:07:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sES0W-0003ld-Tk
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 11:07:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sES0W-00005g-DX; Tue, 04 Jun 2024 11:07:12 +0000
Received: from [62.28.225.65] (helo=[172.20.145.71])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sES0W-0001gQ-5o; Tue, 04 Jun 2024 11:07:12 +0000
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
	bh=2W+G2fBIShc8NgWCIfF5YQxJyIolvkSOJjpdntoxqpE=; b=J0lVTuB5kowSOxEKEVDDV0oAG+
	vfAThKhqgig4Gn9H8ykih9ztKJ/H+SpzfgJHaQVdq6aTZ6g7n9UqEaaAoPtE16DIQUAVQqWV7zcS1
	gKEDvWUt/PZOBp1v3Oku+vd4eV2yRknZENvWeUJTYcs2ANFU3sCz80OCLiSYeLY92xJg=;
Message-ID: <cc51da4b-d024-4923-95a4-18e11b150f90@xen.org>
Date: Tue, 4 Jun 2024 12:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 14/16] ioreq: make arch_vcpu_ioreq_completion() an
 optional callback
Content-Language: en-GB
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <a0f9c5ef8554d63e149afd0a413a27385c889faa.1717410850.git.Sergiy_Kibrik@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a0f9c5ef8554d63e149afd0a413a27385c889faa.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sergiy,

On 03/06/2024 12:34, Sergiy Kibrik wrote:
> For the most cases arch_vcpu_ioreq_completion() routine is just an empty stub,
> except when handling VIO_realmode_completion, which only happens on HVM
> domains running on VT-x machine. When VT-x is disabled in build configuration,
> both x86 & arm version of routine become empty stubs.
> To dispose of these useless stubs we can do optional call to arch-specific
> ioreq completion handler, if it's present, and drop arm and generic x86 handlers.
> Actual handling of VIO_realmore_completion can be done by VMX code then.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>   xen/arch/arm/ioreq.c       |  6 ------
>   xen/arch/x86/hvm/ioreq.c   | 23 -----------------------
>   xen/arch/x86/hvm/vmx/vmx.c | 16 ++++++++++++++++
>   xen/common/ioreq.c         |  5 ++++-
>   xen/include/xen/ioreq.h    |  2 +-
>   5 files changed, 21 insertions(+), 31 deletions(-)
> 
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 5df755b48b..2e829d2e7f 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -135,12 +135,6 @@ bool arch_ioreq_complete_mmio(void)
>       return false;
>   }
>   
> -bool arch_vcpu_ioreq_completion(enum vio_completion completion)
> -{
> -    ASSERT_UNREACHABLE();
> -    return true;
> -}
> -
>   /*
>    * The "legacy" mechanism of mapping magic pages for the IOREQ servers
>    * is x86 specific, so the following hooks don't need to be implemented on Arm:
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index 4eb7a70182..088650e007 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -29,29 +29,6 @@ bool arch_ioreq_complete_mmio(void)
>       return handle_mmio();
>   }
>   
> -bool arch_vcpu_ioreq_completion(enum vio_completion completion)
> -{
> -    switch ( completion )
> -    {
> -    case VIO_realmode_completion:
> -    {
> -        struct hvm_emulate_ctxt ctxt;
> -
> -        hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
> -        vmx_realmode_emulate_one(&ctxt);
> -        hvm_emulate_writeback(&ctxt);
> -
> -        break;
> -    }
> -
> -    default:
> -        ASSERT_UNREACHABLE();
> -        break;
> -    }
> -
> -    return true;
> -}
> -
>   static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
>   {
>       struct domain *d = s->target;
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index f16faa6a61..7187d1819c 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -10,6 +10,7 @@
>   #include <xen/param.h>
>   #include <xen/trace.h>
>   #include <xen/sched.h>
> +#include <xen/ioreq.h>
>   #include <xen/irq.h>
>   #include <xen/softirq.h>
>   #include <xen/domain_page.h>
> @@ -2749,6 +2750,20 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>       vmx_vmcs_exit(v);
>   }
>   
> +bool realmode_vcpu_ioreq_completion(enum vio_completion completion)

No one seems to call this function outside of vmx.c. So can it be 'static'?

> +{
> +    struct hvm_emulate_ctxt ctxt;
> +
> +    if ( completion != VIO_realmode_completion )
> +        ASSERT_UNREACHABLE();
> +
> +    hvm_emulate_init_once(&ctxt, NULL, guest_cpu_user_regs());
> +    vmx_realmode_emulate_one(&ctxt);
> +    hvm_emulate_writeback(&ctxt);
> +
> +    return true;
> +}
> +
>   static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>       .name                 = "VMX",
>       .cpu_up_prepare       = vmx_cpu_up_prepare,
> @@ -3070,6 +3085,7 @@ const struct hvm_function_table * __init start_vmx(void)
>       lbr_tsx_fixup_check();
>       ler_to_fixup_check();
>   
> +    arch_vcpu_ioreq_completion = realmode_vcpu_ioreq_completion;
>       return &vmx_function_table;
>   }
>   
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index 1257a3d972..94fde97ece 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -33,6 +33,8 @@
>   #include <public/hvm/ioreq.h>
>   #include <public/hvm/params.h>
>   
> +bool (*arch_vcpu_ioreq_completion)(enum vio_completion completion) = NULL;

I don't think this should be allowed to be modified after boot. So I 
woudl add __ro_after_init.

> +
>   void ioreq_request_mapcache_invalidate(const struct domain *d)
>   {
>       struct vcpu *v = current;
> @@ -244,7 +246,8 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
>           break;
>   
>       default:
> -        res = arch_vcpu_ioreq_completion(completion);
> +        if ( arch_vcpu_ioreq_completion )
> +            res = arch_vcpu_ioreq_completion(completion);

I think this wants an:

else {
   ASSERT_UNREACHABLE();
}

So this match the existing code. But I am not fully convinced that this 
is the right approach. Arch_vcpu_ioreq_completion is not meant to change 
across boot (or even at compile time for Arm).

Reading the previous thread, I think something like below would work:

static arch_vcpu_ioreq_completion(...)
{
#ifdef CONFIG_VMX
/* Existing code */
#else
ASSERT_UNREACHABLE();
return true;
#endif
}

If we want to avoid stub, then I think it would be better to use

#ifdef CONFIG_VMX
static  arch_vcpu_ioreq...
{
}
#endif CONFIG_VMX

Then in the x86 header.

#ifdef CONFIG_VMX
static arch_vcpu_ioreq..();
#define arch_vcpu_ioreq...
#endif

And then in common/ioreq.c

#ifdef arch_vcpu_ioreq
res = arch_vcpu_ioreq(...)
#else
ASSERT_UNREACHABLE();
#endif

>           break;
>       }
>   
> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
> index cd399adf17..880214ec41 100644
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -111,7 +111,7 @@ void ioreq_domain_init(struct domain *d);
>   int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
>   
>   bool arch_ioreq_complete_mmio(void);
> -bool arch_vcpu_ioreq_completion(enum vio_completion completion);
> +extern bool (*arch_vcpu_ioreq_completion)(enum vio_completion completion);
>   int arch_ioreq_server_map_pages(struct ioreq_server *s);
>   void arch_ioreq_server_unmap_pages(struct ioreq_server *s);
>   void arch_ioreq_server_enable(struct ioreq_server *s);

-- 
Julien Grall


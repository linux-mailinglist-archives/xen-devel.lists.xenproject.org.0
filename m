Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B3F7D81B2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 13:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623720.971833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyOk-00043W-UM; Thu, 26 Oct 2023 11:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623720.971833; Thu, 26 Oct 2023 11:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyOk-00040i-RN; Thu, 26 Oct 2023 11:19:34 +0000
Received: by outflank-mailman (input) for mailman id 623720;
 Thu, 26 Oct 2023 11:19:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvyOj-00040c-QP
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 11:19:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvyOj-00019T-Iu; Thu, 26 Oct 2023 11:19:33 +0000
Received: from [15.248.2.156] (helo=[10.24.67.24])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvyOj-0002oj-B0; Thu, 26 Oct 2023 11:19:33 +0000
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
	bh=Mn1oXXeWxWR6cY3YOMKjdIF7OFtG12dfdH5Jl5NR74g=; b=q6Ex0qgSZKIDtYOrHXy9msp8K4
	VRNj9VisGytFjEkK/F6edtcswXYDsCAS/cydm7ScDeQPJ4Fo/EkbyJP8MZZSRGj57zVT55mPXM+ut
	eCZIvUmukWYPWQTNEj9FZVWamL3WYH7f8mTLESp9rD/N9mSmCGIKCk+2B6e4mNIk73nM=;
Message-ID: <e470ca62-6b51-4f7a-828b-dd95b881bf71@xen.org>
Date: Thu, 26 Oct 2023 12:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v2] xen/arm: arm32: Use adr_l instead of load_paddr for
 getting address of symbols
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20231026111228.2724962-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231026111228.2724962-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Title: This reads as you replace all adr_l with load_paddr. So how about:

xen/arm32: head: Replace load_paddr with adr_l when they are equivalent

On 26/10/2023 12:12, Ayan Kumar Halder wrote:
> Before the MMU is turned on, PC uses physical address. Thus, one can use adr_l
> instead of load_paddr to obtain the physical address of a symbol.
> 
> The only exception (for this replacement) is create_table_entry() which is
> called before and after MMU is turned on.
> 
> Also, in lookup_processor_type() "r10" is no longer used. The reason being
> __lookup_processor_type uses adr_l (thus r10 is no longer used to obtain the
> physical address offset).
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Refer https://lists.archive.carbon60.com/xen/devel/682900 for details.
> 
> Changes from :-
> 
> v1 :- 1. No need to modify create_table_entry().
> 2. Remove "mov   r10, #0 " in lookup_processor_type().
> 
>   xen/arch/arm/arm32/head.S | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 33b038e7e0..e0ff46e92f 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -171,7 +171,7 @@ past_zImage:
>   
>           /* Using the DTB in the .dtb section? */
>   .ifnes CONFIG_DTB_FILE,""
> -        load_paddr r8, _sdtb
> +        adr_l r8, _sdtb
>   .endif
>   
>           /* Initialize the UART if earlyprintk has been enabled. */
> @@ -213,7 +213,7 @@ GLOBAL(init_secondary)
>           mrc   CP32(r1, MPIDR)
>           bic   r7, r1, #(~MPIDR_HWID_MASK) /* Mask out flags to get CPU ID */
>   
> -        load_paddr r0, smp_up_cpu
> +        adr_l r0, smp_up_cpu
>           dsb
>   2:      ldr   r1, [r0]
>           cmp   r1, r7
> @@ -479,7 +479,7 @@ create_page_tables:
>            * create_table_entry_paddr() will clobber the register storing
>            * the physical address of the table to point to.
>            */
> -        load_paddr r5, boot_third
> +        adr_l r5, boot_third
>           mov_w r4, XEN_VIRT_START
>   .rept XEN_NR_ENTRIES(2)
>           mov   r0, r5                        /* r0 := paddr(l3 table) */
> @@ -578,7 +578,7 @@ enable_mmu:
>           flush_xen_tlb_local r0
>   
>           /* Write Xen's PT's paddr into the HTTBR */
> -        load_paddr r0, boot_pgtable
> +        adr_l r0, boot_pgtable
>           mov   r1, #0                 /* r0:r1 is paddr (boot_pagetable) */
>           mcrr  CP64(r0, r1, HTTBR)
>           isb
> @@ -877,7 +877,6 @@ putn:   mov   pc, lr
>   /* This provides a C-API version of __lookup_processor_type */
>   ENTRY(lookup_processor_type)
>           stmfd sp!, {r4, r10, lr}

Do we still need to save/restore r10?

> -        mov   r10, #0                   /* r10 := offset between virt&phys */
>           bl    __lookup_processor_type
>           mov r0, r1
>           ldmfd sp!, {r4, r10, pc}
> @@ -897,8 +896,8 @@ ENTRY(lookup_processor_type)
>    */
>   __lookup_processor_type:
>           mrc   CP32(r0, MIDR)                /* r0 := our cpu id */
> -        load_paddr r1, __proc_info_start
> -        load_paddr r2, __proc_info_end
> +        adr_l r1, __proc_info_start
> +        adr_l r2, __proc_info_end
>   1:      ldr   r3, [r1, #PROCINFO_cpu_mask]
>           and   r4, r0, r3                    /* r4 := our cpu id with mask */
>           ldr   r3, [r1, #PROCINFO_cpu_val]   /* r3 := cpu val in current proc info */

Cheers,

-- 
Julien Grall


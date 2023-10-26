Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED9E7D7FC1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 11:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623632.971652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwqe-00077Y-ER; Thu, 26 Oct 2023 09:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623632.971652; Thu, 26 Oct 2023 09:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwqe-000753-Bf; Thu, 26 Oct 2023 09:40:16 +0000
Received: by outflank-mailman (input) for mailman id 623632;
 Thu, 26 Oct 2023 09:40:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvwqd-00074x-4P
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 09:40:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvwqc-00078L-OC; Thu, 26 Oct 2023 09:40:14 +0000
Received: from [15.248.2.156] (helo=[10.24.67.24])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvwqc-0005YI-Il; Thu, 26 Oct 2023 09:40:14 +0000
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
	bh=G22MVmGOH1oGQA8ktPWKiJDnMDWth0ZEmp4sgf9B87Y=; b=OLtCH9aQK1cgIk8HdGTnuVvWyA
	01knChJsbHMy6COPVR5fUGIUiWsh8cTMfL41/YipaShC65+soumBPDtrfFYz/A2G+0J+QY6Hpo5UG
	9Wk2MPfCn7QNA7z+qxUjsQaraV/pYYBHShetqonKGagxP30aiLOLqYs2JF0pcT2JSPVA=;
Message-ID: <e61bb4e6-76ee-47d5-820f-926a85a8ec0f@xen.org>
Date: Thu, 26 Oct 2023 10:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN] xen/arm: arm32: Use adr_l instead of load_paddr for getting
 address of symbols
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20231025170304.2331922-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231025170304.2331922-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/10/2023 18:03, Ayan Kumar Halder wrote:
> Before the MMU is turned on, the address returned for any symbol will always be
> physical address. Thus, one can use adr_l instead of load_paddr.
> 
> create_table_entry() now takes an extra argument to denote if it is called after
> the mmu is turned on or not.  If it is called with mmu on, then it uses
> load_paddr to get the physical address of the page table symbol.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Refer https://lists.archive.carbon60.com/xen/devel/682900 for details.
> 
>   xen/arch/arm/arm32/head.S | 35 ++++++++++++++++++++---------------
>   1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 33b038e7e0..bf442b0434 100644
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
> @@ -406,6 +406,7 @@ ENDPROC(cpu_init)
>    * tbl:     table symbol to point to
>    * virt:    virtual address
>    * lvl:     page-table level
> + * mmu_on:  is mmu on
>    *
>    * Preserves \virt
>    * Clobbers r1 - r4
> @@ -414,10 +415,14 @@ ENDPROC(cpu_init)
>    *
>    * Note that \virt should be in a register other than r1 - r4
>    */
> -.macro create_table_entry, ptbl, tbl, virt, lvl
> +.macro create_table_entry, ptbl, tbl, virt, lvl, mmu_on
> +    .if \mmu_on == 1
>           load_paddr r4, \tbl
> -        create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
> - .endm
> +    .else
> +        adr_l r4, \tbl
> +    .endif
> +    create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
> +.endm
>   
>   /*
>    * Macro to create a mapping entry in \tbl to \paddr. Only mapping in 3rd
> @@ -479,7 +484,7 @@ create_page_tables:
>            * create_table_entry_paddr() will clobber the register storing
>            * the physical address of the table to point to.
>            */
> -        load_paddr r5, boot_third
> +        adr_l r5, boot_third
>           mov_w r4, XEN_VIRT_START
>   .rept XEN_NR_ENTRIES(2)
>           mov   r0, r5                        /* r0 := paddr(l3 table) */
> @@ -522,8 +527,8 @@ create_page_tables:
>            * Setup the 1:1 mapping so we can turn the MMU on. Note that
>            * only the first page of Xen will be part of the 1:1 mapping.
>            */
> -        create_table_entry boot_pgtable, boot_second_id, r9, 1
> -        create_table_entry boot_second_id, boot_third_id, r9, 2
> +        create_table_entry boot_pgtable, boot_second_id, r9, 1, 0
> +        create_table_entry boot_second_id, boot_third_id, r9, 2, 0
>           create_mapping_entry boot_third_id, r9, r9
>   
>           /*
> @@ -537,7 +542,7 @@ create_page_tables:
>           bne   use_temporary_mapping
>   
>           mov_w r0, XEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_second, r0, 1
> +        create_table_entry boot_pgtable, boot_second, r0, 1, 0
>           mov   r12, #0                /* r12 := temporary mapping not created */
>           mov   pc, lr
>   
> @@ -551,7 +556,7 @@ use_temporary_mapping:
>   
>           /* Map boot_second (cover Xen mappings) to the temporary 1st slot */
>           mov_w r0, TEMPORARY_XEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_second, r0, 1
> +        create_table_entry boot_pgtable, boot_second, r0, 1, 0
>   
>           mov   r12, #1                /* r12 := temporary mapping created */
>           mov   pc, lr
> @@ -578,7 +583,7 @@ enable_mmu:
>           flush_xen_tlb_local r0
>   
>           /* Write Xen's PT's paddr into the HTTBR */
> -        load_paddr r0, boot_pgtable
> +        adr_l r0, boot_pgtable
>           mov   r1, #0                 /* r0:r1 is paddr (boot_pagetable) */
>           mcrr  CP64(r0, r1, HTTBR)
>           isb
> @@ -658,7 +663,7 @@ switch_to_runtime_mapping:
>   
>           /* Map boot_second into boot_pgtable */
>           mov_w r0, XEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_second, r0, 1
> +        create_table_entry boot_pgtable, boot_second, r0, 1, 1
>   
>           /* Ensure any page table updates are visible before continuing */
>           dsb   nsh
> @@ -739,7 +744,7 @@ setup_fixmap:
>   #endif
>           /* Map fixmap into boot_second */
>           mov_w r0, FIXMAP_ADDR(0)
> -        create_table_entry boot_second, xen_fixmap, r0, 2
> +        create_table_entry boot_second, xen_fixmap, r0, 2, 0
>           /* Ensure any page table updates made above have occurred. */
>           dsb   nshst
>           /*
> @@ -897,8 +902,8 @@ ENTRY(lookup_processor_type)
>    */
>   __lookup_processor_type:
>           mrc   CP32(r0, MIDR)                /* r0 := our cpu id */
> -        load_paddr r1, __proc_info_start
> -        load_paddr r2, __proc_info_end
> +        adr_l r1, __proc_info_start
> +        adr_l r2, __proc_info_end

On top of what's Michal already mentioned, you can remove the line in 
lookup_process_type() which set r10. It was only present so load_paddr() 
do nothing when called from the C world.

It is a good hack to remove :).

Cheers,

-- 
Julien Grall


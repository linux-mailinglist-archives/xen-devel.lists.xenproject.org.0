Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01753BC6B0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 08:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150736.278675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ece-0007aB-LZ; Tue, 06 Jul 2021 06:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150736.278675; Tue, 06 Jul 2021 06:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ece-0007TC-Hr; Tue, 06 Jul 2021 06:31:56 +0000
Received: by outflank-mailman (input) for mailman id 150736;
 Tue, 06 Jul 2021 06:31:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbbY=L6=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1m0ecb-0007QG-SZ
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 06:31:53 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id da09551e-de23-11eb-8475-12813bfff9fa;
 Tue, 06 Jul 2021 06:31:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F9B91FB;
 Mon,  5 Jul 2021 23:31:52 -0700 (PDT)
Received: from [10.57.8.167] (unknown [10.57.8.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C24B3F5A1;
 Mon,  5 Jul 2021 23:31:51 -0700 (PDT)
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
X-Inumbo-ID: da09551e-de23-11eb-8475-12813bfff9fa
Subject: Re: [PATCH v5 3/4] xen: arm: Remove mfn_to_gfn() macro
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210703171152.15874-1-julien@xen.org>
 <20210703171152.15874-4-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <2e955bd5-efe7-f154-c220-77989b921ca8@arm.com>
Date: Tue, 6 Jul 2021 08:31:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210703171152.15874-4-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 03.07.2021 19:11, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> The current implementation of mfn_to_gfn() is completely bogus and
> there are no plan to implement an M2P on Arm. As there are no more
> users, drop the helper.
> 
s/plan/plans/
> At the same time rework a comment in Arm code that does not make sense.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> 
> ---
>     Changes in v5:
>         - Rebase to the latest Xen
>         - The patch is now arm only because mfn_to_gmfn() has
>         been dropped on x86 and the arm helper was renamed to
>         mfn_to_gfn().
> 
>     Changes in v4:
>         - Remove acks as the patch is old
> 
>     Changes in v2:
>         - Add Jan's and Stefano's acked-by
> ---
>  xen/include/asm-arm/mm.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index ded74d29da0c..07c24654a0b6 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -326,9 +326,8 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
>  #define SHARED_M2P_ENTRY         (~0UL - 1UL)
>  #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
>  
> -/* Xen always owns P2M on ARM */
> +/* We don't have a M2P on Arm */
>  #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
> -#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
>  
>  /* Arch-specific portion of memory_op hypercall. */
>  long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0664BF973
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 14:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276776.473060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMVFU-0007Fh-Ll; Tue, 22 Feb 2022 13:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276776.473060; Tue, 22 Feb 2022 13:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMVFU-0007Dq-Ih; Tue, 22 Feb 2022 13:30:36 +0000
Received: by outflank-mailman (input) for mailman id 276776;
 Tue, 22 Feb 2022 13:30:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IN1Y=TF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nMVFT-0007Dk-OR
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 13:30:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 336f70d4-93e3-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 14:27:37 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ABE61063;
 Tue, 22 Feb 2022 05:30:32 -0800 (PST)
Received: from [10.57.3.116] (unknown [10.57.3.116])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4A123F70D;
 Tue, 22 Feb 2022 05:30:30 -0800 (PST)
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
X-Inumbo-ID: 336f70d4-93e3-11ec-8539-5f4723681683
Subject: Re: [PATCH v3 01/19] xen/arm: lpae: Rename LPAE_ENTRIES_MASK_GS to
 LPAE_ENTRY_MASK_GS
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-2-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <c87e41d4-be73-665c-aa40-22798e254012@arm.com>
Date: Tue, 22 Feb 2022 14:30:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220221102218.33785-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 21.02.2022 11:22, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 05031fa87357 "xen/arm: guest_walk: Only generate necessary
> offsets/masks" introduced LPAE_ENTRIES_MASK_GS. In a follow-up patch,
> we will use it for to define LPAE_ENTRY_MASK.
> 
for is unneddded. Should be "we will use it to define..."

> This will lead to inconsistent naming. As LPAE_ENTRY_MASK is used in
> many places, it is better to rename LPAE_ENTRIES_MASK_GS and avoid
> some churn.
> 
> So rename LPAE_ENTRIES_MASK_GS to LPAE_ENTRY_MASK_GS.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/include/asm/lpae.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
> index e94de2e7d8e8..4fb9a40a4ca9 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -180,7 +180,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>   */
>  #define LPAE_SHIFT_GS(gs)         ((gs) - 3)
>  #define LPAE_ENTRIES_GS(gs)       (_AC(1, U) << LPAE_SHIFT_GS(gs))
> -#define LPAE_ENTRIES_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
> +#define LPAE_ENTRY_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)

Incorrect indentation of (LPAE_ENTRIES_GS(gs) - 1)
> 
>  #define LEVEL_ORDER_GS(gs, lvl)   ((3 - (lvl)) * LPAE_SHIFT_GS(gs))
>  #define LEVEL_SHIFT_GS(gs, lvl)   (LEVEL_ORDER_GS(gs, lvl) + (gs))
> @@ -188,7 +188,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>  
>  /* Offset in the table at level 'lvl' */
>  #define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
> -    (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRIES_MASK_GS(gs))
> +    (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRY_MASK_GS(gs))
>  
>  /* Generate an array @var containing the offset for each level from @addr */
>  #define DECLARE_OFFSETS(var, addr)          \
> 

Cheers,
Michal


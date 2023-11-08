Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E201F7E5AC6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 17:04:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629342.981493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0l2M-0003nJ-TZ; Wed, 08 Nov 2023 16:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629342.981493; Wed, 08 Nov 2023 16:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0l2M-0003k0-Pj; Wed, 08 Nov 2023 16:04:14 +0000
Received: by outflank-mailman (input) for mailman id 629342;
 Wed, 08 Nov 2023 16:04:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0l2M-0003ju-3g
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 16:04:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0l2L-0000T7-7M; Wed, 08 Nov 2023 16:04:13 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[10.95.129.229]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0l2K-0007oy-Vw; Wed, 08 Nov 2023 16:04:13 +0000
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
	bh=RTmrziUJ3gJBP31hOnvFUAvH2PbJ2DmA7/AGnuTvROI=; b=zyj7YhJnwGNtk9kLPMN8LGks2I
	igcGrj6HVucEysnG+MfdGt1YGFq+PPhXUPXnDOignP9vzfcv7l2K0VEyVbYUkW6VmnBdDsTiIT2P+
	ZBZjt2LpAE6vVEGe6k05DM+o8OA2lYCqSQe4Roh+lBN6J4AZq89FA6/Sn556Id6hr9zM=;
Message-ID: <454b02cd-e8ac-4378-95e9-afec4b852065@xen.org>
Date: Wed, 8 Nov 2023 16:04:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/arm: traps: address a violation of MISRA
 C:2012 Rule 8.2
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <24c2e8b7a7becc6b16d0b37f2c642a9b9e976269.1699457659.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <24c2e8b7a7becc6b16d0b37f2c642a9b9e976269.1699457659.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/11/2023 15:42, Federico Serafini wrote:
> Add missing parameter name "regs" and introduce function type
> bug_fn_t: this improves readability and helps to validate that the
> function passed to run_in_exception_handle() has the expected
> prototype.
> No functional change.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v2:
>    - adjusted tag;
>    - avoided exceeding the 80-character limit.
> ---
>   xen/arch/arm/traps.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index ce89f16404..1264eab087 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1236,7 +1236,8 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>   
>       if ( id == BUGFRAME_run_fn )
>       {
> -        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
> +        typedef void (*bug_fn_t)(const struct cpu_user_regs *regs);

Thanks for sending a new version. This should be defined in asm/bug.h or 
maybe xen/bug.h as this is generic enough.

Cheers,

-- 
Julien Grall


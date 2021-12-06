Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5703E469D34
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239269.414714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFvQ-0008AT-3X; Mon, 06 Dec 2021 15:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239269.414714; Mon, 06 Dec 2021 15:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFvP-00088g-Vr; Mon, 06 Dec 2021 15:29:07 +0000
Received: by outflank-mailman (input) for mailman id 239269;
 Mon, 06 Dec 2021 15:29:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1muFvP-00088X-2p
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:29:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muFvO-0008SL-OC; Mon, 06 Dec 2021 15:29:06 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.26.205]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muFvO-00020i-Ht; Mon, 06 Dec 2021 15:29:06 +0000
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
	bh=mjMkyOsjAWmAU2prdmFj4WRlyZ99pmfYcBSAbMD3GbA=; b=QvXd8s8ViicGDQvsaNS/p6XmVi
	m6YhTMMnv7efRBsIJ8wMy8+3CEbYMyojFIJ0zAJqN6xryIeT0NargqkpiI1iSbn7thrBJ/AUO/Gyd
	58OvWhYAmHRwG1DROzyK2XmLq6Ot5cYHpwnp8NUosbxRuoHAQpOg3ydAkMAKOP/Z+J5c=;
Message-ID: <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
Date: Mon, 6 Dec 2021 15:29:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211206142032.27536-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211206142032.27536-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/12/2021 14:20, Michal Orzel wrote:
> to hypervisor when switching to AArch32 state.
> 
> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
> "If the general-purpose register was accessible from AArch32 state the
> upper 32 bits either become zero, or hold the value that the same
> architectural register held before any AArch32 execution.
> The choice between these two options is IMPLEMENTATIONDEFINED"

Typo: Missing space between IMPLEMENTATION and DEFINED.

> 
> Currently Xen does not ensure that the top 32 bits are zeroed and this
> needs to be fixed.

Can you outline why this is a problem and why we need to protect? IIRC, 
the main concern is Xen may misinterpret what the guest requested but we 
are not concerned about Xen using wrong value.

> 
> Fix this bug by zeroing the upper 32 bits of these registers on an
> entry to hypervisor when switching to AArch32 state.
> 
> Set default value of parameter compat of macro entry to 0 (AArch64 mode
> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
> when not passed.

Which error do you see otherwise? Is it a compilation error?

> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/arm64/entry.S | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index fc3811ad0a..d364128175 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -109,8 +109,16 @@
>    * If 0, we rely on the on x0/x1 to have been saved at the correct
>    * position on the stack before.
>    */
> -        .macro  entry, hyp, compat, save_x0_x1=1
> +        .macro  entry, hyp, compat=0, save_x0_x1=1
>           sub     sp, sp, #(UREGS_SPSR_el1 - UREGS_LR) /* CPSR, PC, SP, LR */
> +
> +        /* Zero the upper 32 bits of the registers when switching to AArch32 */
> +        .if \compat == 1      /* AArch32 mode */
> +        .irp nr,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
> +        mov w\nr, w\nr
> +        .endr
> +        .endif

So Jan mentioned, the x0/x1 may have already been saved. So you may need 
to fetch them from the stack and then clobber the top 32-bit.

Cheers,

-- 
Julien Grall


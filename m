Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F7478850
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 11:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248500.428632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myA3K-0007rD-DP; Fri, 17 Dec 2021 10:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248500.428632; Fri, 17 Dec 2021 10:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myA3K-0007oC-95; Fri, 17 Dec 2021 10:01:26 +0000
Received: by outflank-mailman (input) for mailman id 248500;
 Fri, 17 Dec 2021 10:01:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myA3I-0007o5-S8
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 10:01:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myA3I-0008Vf-ID; Fri, 17 Dec 2021 10:01:24 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myA3I-0005qu-C4; Fri, 17 Dec 2021 10:01:24 +0000
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
	bh=z8V44etTx8ljcpiMN+pKJ0etQtpFz4XxrA/r7bY2gog=; b=jX5jV6NCYZISbWfxImc5odnEuV
	cF2wM6LRH9UcOoGUoF6D5AHUULfp3BbT9y0/7K/PATkb5IhDxzpt+jsWncRN/HgLnsTZsB700hmNm
	S4Z9R99wPbU6hZVGVPalaR3HphSPBcBNRFmwp54nFsbJSOJO64rawnrhm8qUa/HB10o0=;
Message-ID: <48666542-6647-d1ec-78df-2fbb43efcc0d@xen.org>
Date: Fri, 17 Dec 2021 10:01:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211217072159.3464-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211217072159.3464-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/12/2021 07:21, Michal Orzel wrote:
> to hypervisor when switching from AArch32 state.
> 
> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
> "If the general-purpose register was accessible from AArch32 state the
> upper 32 bits either become zero, or hold the value that the same
> architectural register held before any AArch32 execution.
> The choice between these two options is IMPLEMENTATION DEFINED"
> 
> Currently Xen does not ensure that the top 32 bits are zeroed and this
> needs to be fixed. The reason why is that there are places in Xen
> where we assume that top 32bits are zero for AArch32 guests.
> If they are not, this can lead to misinterpretation of Xen regarding
> what the guest requested. For example hypercalls returning an error
> encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op
> would return -ENOSYS if the command passed as the first argument was
> clobbered.
> 
> Create a macro clobber_gp_top_halves to clobber top 32 bits of gp
> registers when hyp == 0 (guest mode) and compat == 1 (AArch32 mode).
> Add a compile time check to ensure that save_x0_x1 == 1 if
> compat == 1.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
> Changes since v2:
> -add clobbering of w30
> Changes since v1:
> -put new code into macro
> -add compile time check for save_x0_x1
> ---
>   xen/arch/arm/arm64/entry.S | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index fc3811ad0a..e351ef8639 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -102,6 +102,30 @@
>           .endif
>   
>           .endm
> +
> +/*
> + * Clobber top 32 bits of gp registers when switching from AArch32
> + */
> +        .macro clobber_gp_top_halves, compat, save_x0_x1
> +
> +        .if \compat == 1      /* AArch32 mode */
> +
> +        /*
> +         * save_x0_x1 is equal to 0 only for guest_sync (compat == 0).
> +         * Add a compile time check to avoid violating this rule.
> +         */

We may want in the future to allow save_x0_x1 == 1 with compat == 1 if 
we need to create fastpath like we did when entering AArch64.

So I would reword the comment to make clear this is an implementation 
decision. How about:

"At the moment, no-one is using save_x0_x1 == 0 with compat == 1. So the 
code is not handling it to simplify the implementation."

If you are happy with the new comment, I can update it on commit:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19AC3A5F93
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 11:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141284.261019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsjLX-0006BA-AS; Mon, 14 Jun 2021 09:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141284.261019; Mon, 14 Jun 2021 09:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsjLX-00068N-6r; Mon, 14 Jun 2021 09:57:31 +0000
Received: by outflank-mailman (input) for mailman id 141284;
 Mon, 14 Jun 2021 09:57:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lsjLV-00067y-ST
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 09:57:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsjLV-0001NF-MP; Mon, 14 Jun 2021 09:57:29 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsjLV-0004S8-Ez; Mon, 14 Jun 2021 09:57:29 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=30YTuEitrkjhxbU9lj+Ns4W/H3DW4PBOizrGuvmuMe0=; b=N7zGe2xX0P50RtQYfsbqhiwpfF
	//Z9wD9dFz0+ah/L+V28TMQKYS4aHLkzJlpGhHi2ow4xHjx2kazEcsByHxmF/rSpD8CcxQo1vVLdL
	YHXNr9usRoVuf6nzq7qc9zP+myWPPLAFXEPFxaVF8OtXiIf/hW4bFT0rtxTrwX2QkbZA=;
Subject: Re: [PATCH] Arm32: avoid .rodata to be marked as executable
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <25f1b0d2-9270-ba42-d110-2bf14e45b7b8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5b819c5e-587b-4eec-b873-73892503c3e2@xen.org>
Date: Mon, 14 Jun 2021 11:57:27 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <25f1b0d2-9270-ba42-d110-2bf14e45b7b8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 11/06/2021 11:19, Jan Beulich wrote:
> This confuses disassemblers, at the very least. When this data still
> lived in .init.*, this probably didn't matter much, albeit the
> "#execinstr" would have been suspicious to me already then. But the
> latest with their movement to .rodata these attributes should have been
> dropped.

I don't quite understand why this wasn't really a problem for .init.data 
but it is a problem for .rodata. Can you expand your thought?

> 
> Fixes: 9cbe093b7b84 ("xen/arm: link: Link proc_info_list in .rodata instead of .init.data")
I don't view this commit as the buggy one. I would prefer if there is no 
Fixes tag. But if you want one, then it should be the patch that 
introduced #execinstr.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The change below looks good to me. But I don't understand the commit 
message, so I will wait an answer before acking it.

> ---
> The PRINT() macro in head.S is another source of such confusion of code
> vs data. While in head.o there are mapping symbols guiding disassemblers,
> these mapping symbols are gone when looking at xen-syms. But I realize
> adr's reach is too limited to allow for a halfway reasonable approach of
> moving those strings (e.g. to, at least, have them all together).

I have tried it in the past. The solution I have was to differentiate 
call with MMU on from the one with MMU off. But I considered this wasn't 
worth the trouble.

> 
> --- a/xen/arch/arm/arm32/proc-v7.S
> +++ b/xen/arch/arm/arm32/proc-v7.S
> @@ -29,7 +29,7 @@ brahma15mp_init:
>           mcr   CP32(r0, ACTLR)
>           mov   pc, lr
>   
> -        .section ".proc.info", #alloc, #execinstr
> +        .section ".proc.info", #alloc
>           .type __v7_ca15mp_proc_info, #object
>   __v7_ca15mp_proc_info:
>           .long 0x410FC0F0             /* Cortex-A15 */
> @@ -38,7 +38,7 @@ __v7_ca15mp_proc_info:
>           .long caxx_processor
>           .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
>   
> -        .section ".proc.info", #alloc, #execinstr
> +        .section ".proc.info", #alloc
>           .type __v7_ca7mp_proc_info, #object
>   __v7_ca7mp_proc_info:
>           .long 0x410FC070             /* Cortex-A7 */
> @@ -47,7 +47,7 @@ __v7_ca7mp_proc_info:
>           .long caxx_processor
>           .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
>   
> -        .section ".proc.info", #alloc, #execinstr
> +        .section ".proc.info", #alloc
>           .type __v7_brahma15mp_proc_info, #object
>   __v7_brahma15mp_proc_info:
>           .long 0x420F00F0             /* Broadcom Brahma-B15 */
> 

Cheers,

-- 
Julien Grall

